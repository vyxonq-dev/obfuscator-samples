-- Chromium Loader (husk). Distributed via:
--   loadstring(game:HttpGet("https://<worker-host>/loader"))()
-- Contains NO game logic. Authenticates, fetches the encrypted payload,
-- decrypts it, fetches the server-only remote map, and runs the payload.

if not game:IsLoaded() then game.Loaded:Wait() end

local ENDPOINT  = "https://api.prismluau.uk"  -- deployed Chromium license Worker
local SCRIPT_ID = nil  -- resolved from the current game (game.PlaceId / game.GameId) below
local KEY_FILE  = "Chromium_SavedKey.txt"
local DISCORD   = "https://discord.gg/N5sue6fwQc"

local HttpService = game:GetService("HttpService")
local CoreGui     = game:GetService("CoreGui")

local HttpRequest = (syn and syn.request) or (http and http.request) or http_request or request

local function httpJson(method, path, headers, bodyTbl)
    local res = HttpRequest({
        Url = ENDPOINT .. path,
        Method = method,
        Headers = headers or { ["Content-Type"] = "application/json" },
        Body = bodyTbl and HttpService:JSONEncode(bodyTbl) or nil,
    })
    local decoded
    local ok = pcall(function() decoded = HttpService:JSONDecode(res.Body) end)
    return res.StatusCode, (ok and decoded or nil)
end

-- Ask the server which script this game maps to (PlaceId first, GameId fallback).
-- Returns scriptId on success; nil, errCode on failure ("unsupported_game" for 404).
-- A transient network failure on a slow boot would otherwise show the "couldn't
-- reach Chromium" panel for a SUPPORTED game, so retry a few times on non-404 errors
-- (404 is an authoritative "unsupported" answer and is returned immediately).
local function resolveScript()
    local status, body
    for attempt = 1, 4 do
        status, body = httpJson("GET",
            "/resolve?placeId=" .. tostring(game.PlaceId) .. "&gameId=" .. tostring(game.GameId))
        if status == 200 and body and body.scriptId then
            return body.scriptId
        end
        if status == 404 then
            return nil, "unsupported_game"
        end
        if attempt < 4 then task.wait(1) end -- transient (network/5xx); back off and retry
    end
    return nil, (body and body.error) or ("http_" .. tostring(status))
end

local function readSavedKey()
    if isfile and readfile and isfile(KEY_FILE) then
        local ok, v = pcall(readfile, KEY_FILE)
        if ok and type(v) == "string" and v ~= "" then return v end
    end
    return nil
end
local function saveKey(k) pcall(function() if writefile then writefile(KEY_FILE, k) end end) end

-- A stable per-device id. Prefer the executor's gethwid(); otherwise generate a
-- random id once and persist it to a file, so devices without gethwid still get
-- a UNIQUE binding instead of all sharing a constant "unknown-hwid" (which would
-- let one key work on every such machine).
local DEVICE_FILE = "Chromium_DeviceId.txt"
local function deviceId()
    if gethwid then
        local ok, h = pcall(gethwid)
        if ok and type(h) == "string" and h ~= "" then return h end
    end
    if isfile and readfile and isfile(DEVICE_FILE) then
        local ok, v = pcall(readfile, DEVICE_FILE)
        if ok and type(v) == "string" and v ~= "" then return v end
    end
    local rid = (crypt and crypt.generatekey and crypt.generatekey(32))
        or (tostring(os.time()) .. "-" .. tostring(math.random(1, 1e9)) .. tostring(math.random(1, 1e9)))
    pcall(function() if writefile then writefile(DEVICE_FILE, rid) end end)
    return rid
end

-- Returns token, payloadKey on success; nil, nil, errCode on failure.
local function authenticate(key)
    local hwid = deviceId()
    local nonce = (crypt and crypt.generatekey and crypt.generatekey(16))
        or (tostring(os.clock()) .. tostring(math.random(1, 1e9)))
    local status, body = httpJson("POST", "/auth", nil, {
        key = key, hwid = hwid, scriptId = SCRIPT_ID, nonce = nonce,
    })
    if status == 200 and body and body.token then
        return body.token, body.payloadKey
    end
    return nil, nil, (body and body.error) or ("http_" .. tostring(status))
end

local function fetchPayload(token, payloadKey)
    -- The per-key watermarked variant may still be building server-side, in
    -- which case /payload answers 202 {status="provisioning"}. Retry a bounded
    -- number of times before giving up. The budget (20 * 2s = ~40s) is sized to
    -- ride through a container cold-start so the user rarely has to re-run.
    local status, body
    for _ = 1, 20 do
        status, body = httpJson("GET", "/payload/" .. SCRIPT_ID, {
            ["Authorization"] = "Bearer " .. token,
        })
        if status == 202 then
            task.wait(2) -- still building; back off and retry
        else
            break
        end
    end
    if status == 202 then
        return nil, "provisioning"
    end
    if status ~= 200 or not body or not body.data then
        return nil, (body and body.error) or ("http_" .. tostring(status))
    end
    local plaintext
    local ok = pcall(function()
        plaintext = crypt.decrypt(body.data, payloadKey, body.iv, "CBC")
    end)
    if not ok or not plaintext then return nil, "decrypt_failed" end
    return plaintext
end

local function fetchRemotes(token)
    local status, body = httpJson("POST", "/op/remotes", {
        ["Authorization"] = "Bearer " .. token,
        ["Content-Type"] = "application/json",
    })
    if status ~= 200 or not body then
        return nil, (body and body.error) or ("http_" .. tostring(status))
    end
    return body
end

local function run(token, payloadKey)
    local plaintext, perr = fetchPayload(token, payloadKey)
    if not plaintext then return false, perr end
    local remotes, rerr = fetchRemotes(token)
    if not remotes then return false, rerr end
    local fn, lerr = loadstring(plaintext)
    if not fn then return false, "loadstring:" .. tostring(lerr) end
    local CHROMIUM = { token = token, remotes = remotes, endpoint = ENDPOINT, scriptId = SCRIPT_ID }
    local okRun, runErr = pcall(fn, CHROMIUM)
    if not okRun then return false, "runtime:" .. tostring(runErr) end
    return true
end

-- Authenticate with a key, then run the payload. Returns true / false, errCode.
local function attempt(key)
    local token, payloadKey, aerr = authenticate(key)
    if not token then return false, aerr end
    saveKey(key)
    return run(token, payloadKey)
end

-- =========================================================================
-- Chromium UI (used to build both panels below). Fetched unauthenticated via
-- /assets/ui-lib — neither panel has a saved key yet to authenticate the
-- per-key watermarked /ui path with (that's for AFTER login, e.g. the game
-- payload's own in-game menu). Falls back to a minimal hand-rolled GUI if the
-- fetch/load fails for any reason, so a restrictive executor or a server
-- hiccup never blocks login.
-- =========================================================================
local function loadChromiumUI()
    local ok, result = pcall(function()
        local src = game:HttpGet(ENDPOINT .. "/assets/ui-lib")
        local fn, lerr = loadstring(src)
        if not fn then error(lerr or "loadstring failed", 0) end
        return fn()
    end)
    if ok and type(result) == "table" and result.Core and result.Theme then
        return result
    end
    return nil
end
local Chromium = loadChromiumUI()

-- Shared card shell (ScreenGui + rounded panel + title) both panels sit in.
local function newCard(title, widthPx)
    local Create, Theme, Tween = Chromium.Core.Create, Chromium.Theme, Chromium.Core.Tween
    if CoreGui:FindFirstChild("ChromiumKeySystem") then CoreGui.ChromiumKeySystem:Destroy() end
    local screen = Create.New("ScreenGui", {
        Name = "ChromiumKeySystem",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true,
        Parent = Create.GetScreenParent(),
    })
    local card = Create.New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(widthPx or 320, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.Color("Surface"),
        Parent = screen,
        UICorner = { CornerRadius = Theme.Radius("Large") },
        UIStroke = { Thickness = Theme.Stroke("Thin"), Color = Theme.Color("Border") },
        UIPadding = {
            PaddingTop = UDim.new(0, 16),
            PaddingBottom = UDim.new(0, 16),
            PaddingLeft = UDim.new(0, 16),
            PaddingRight = UDim.new(0, 16),
        },
        UIListLayout = { Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder },
    })
    Create.New("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = title,
        TextSize = Theme.TextSize("Heading"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Theme.Color("TextPrimary"),
        LayoutOrder = 0,
        Parent = card,
    })
    return screen, card, Create, Theme, Tween
end

-- A button styled like the library's own Dialog buttons (Theme tokens, hover
-- tween, optional accent "primary" look) — Window/Dialog.luau hand-rolls its
-- buttons the same way, since the generic Button component has no
-- primary/secondary variant to give a Verify/Cancel-style pair.
local function newCardButton(parent, Create, Theme, Tween, text, primary, order)
    local restBg = Theme.Color(primary and "Accent" or "SurfaceActive")
    local hoverBg = Theme.Color(primary and "AccentDim" or "SurfaceHover")
    local btn = Create.New("TextButton", {
        Size = UDim2.new(0, 0, 0, 34),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = text,
        TextSize = Theme.TextSize("Body"),
        BackgroundColor3 = restBg,
        TextColor3 = primary and Theme.Color("Background") or Theme.Color("TextPrimary"),
        LayoutOrder = order or 0,
        Parent = parent,
        UICorner = { CornerRadius = Theme.Radius("Default") },
        UIPadding = { PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16) },
    })
    btn.MouseEnter:Connect(function() Tween.To(btn, { BackgroundColor3 = hoverBg }) end)
    btn.MouseLeave:Connect(function() Tween.To(btn, { BackgroundColor3 = restBg }) end)
    return btn
end

-- Friendly panel shown when the current game has no Chromium script (or the
-- registry is unreachable). Replaces the key prompt entirely in that case.
local function showUnsupportedPanelFallback(kind)
    if CoreGui:FindFirstChild("ChromiumKeySystem") then CoreGui.ChromiumKeySystem:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "ChromiumKeySystem"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 340, 0, 200)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", frame).Color = Color3.fromRGB(50, 50, 50)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 12)
    title.BackgroundTransparency = 1
    title.Text = "Chromium"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.Parent = frame

    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(1, -40, 0, 70)
    msg.Position = UDim2.new(0.5, 0, 0, 56)
    msg.AnchorPoint = Vector2.new(0.5, 0)
    msg.BackgroundTransparency = 1
    msg.TextWrapped = true
    msg.TextColor3 = Color3.fromRGB(200, 200, 200)
    msg.Font = Enum.Font.Gotham
    msg.TextSize = 14
    msg.Text = (kind == "unsupported_game")
        and "Chromium doesn't support this game yet.\nJoin the Discord for the games we cover."
        or  "Couldn't reach Chromium. Check your connection and try again."
    msg.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 36)
    btn.Position = UDim2.new(0.5, 0, 1, -50)
    btn.AnchorPoint = Vector2.new(0.5, 0)
    btn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = "Copy Discord Invite"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(DISCORD) end)
        btn.Text = "Invite Copied!"
    end)
end

local function showUnsupportedPanelChromium(kind)
    local screen, card, Create, Theme, Tween = newCard("Chromium", 340)

    Create.New("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        TextWrapped = true,
        Text = (kind == "unsupported_game")
            and "Chromium doesn't support this game yet.\nJoin the Discord for the games we cover."
            or  "Couldn't reach Chromium. Check your connection and try again.",
        TextSize = Theme.TextSize("Body"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Theme.Color("TextSecondary"),
        LayoutOrder = 1,
        Parent = card,
    })

    local row = Create.New("Frame", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Parent = card,
        UIListLayout = {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        },
    })
    local btn = newCardButton(row, Create, Theme, Tween, "Copy Discord Invite", true, 0)
    btn.Activated:Connect(function()
        pcall(function() setclipboard(DISCORD) end)
        btn.Text = "Invite Copied!"
    end)
end

local function showUnsupportedPanel(kind)
    if Chromium then
        local ok = pcall(showUnsupportedPanelChromium, kind)
        if ok then return end
    end
    showUnsupportedPanelFallback(kind)
end

-- =========================================================================
-- Chromium Login prompt (the only interactive UI in the husk)
-- =========================================================================
local function showLoginPromptFallback()
    if CoreGui:FindFirstChild("ChromiumKeySystem") then CoreGui.ChromiumKeySystem:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ChromiumKeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 240)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(50, 50, 50)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "Chromium Login"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.Parent = MainFrame

    local KeyBox = Instance.new("TextBox")
    KeyBox.Size = UDim2.new(0, 260, 0, 40)
    KeyBox.Position = UDim2.new(0.5, 0, 0, 80)
    KeyBox.AnchorPoint = Vector2.new(0.5, 0)
    KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.PlaceholderText = "Enter Key..."
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.TextSize = 14
    KeyBox.Text = ""
    KeyBox.ClearTextOnFocus = false
    KeyBox.Parent = MainFrame
    Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", KeyBox).Color = Color3.fromRGB(60, 60, 60)

    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size = UDim2.new(0, 125, 0, 35)
    VerifyBtn.Position = UDim2.new(0, 30, 0, 140)
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.Text = "Verify"
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 14
    VerifyBtn.Parent = MainFrame
    Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 6)

    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0, 125, 0, 35)
    GetKeyBtn.Position = UDim2.new(1, -30, 0, 140)
    GetKeyBtn.AnchorPoint = Vector2.new(1, 0)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 14
    GetKeyBtn.Parent = MainFrame
    Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", GetKeyBtn).Color = Color3.fromRGB(80, 80, 80)

    local StatusText = Instance.new("TextLabel")
    StatusText.Size = UDim2.new(1, 0, 0, 20)
    StatusText.Position = UDim2.new(0, 0, 1, -30)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = ""
    StatusText.TextColor3 = Color3.fromRGB(239, 68, 68)
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 13
    StatusText.Parent = MainFrame

    local busy = false
    VerifyBtn.MouseButton1Click:Connect(function()
        if busy then return end
        busy = true

        -- Step 1 — validate the key. ONLY a genuinely bad/expired/revoked/locked key
        -- is rejected here, so "Invalid Key" never shows for a real, still-loading key.
        StatusText.TextColor3 = Color3.fromRGB(59, 130, 246)
        StatusText.Text = "Verifying..."
        local token, payloadKey, aerr = authenticate(KeyBox.Text)
        if not token then
            StatusText.TextColor3 = Color3.fromRGB(239, 68, 68)
            StatusText.Text = (aerr == "hwid_mismatch" and "Key locked to another device")
                or (aerr == "expired" and "Key expired")
                or (aerr == "revoked" and "Key revoked")
                or "Invalid Key"
            KeyBox.Text = ""
            busy = false
            return
        end

        -- Step 2 — key is valid: remember it and load. The per-key build may still be
        -- compiling server-side; show an animated "Script loading" with a rough ETA
        -- countdown (never "Invalid Key") while the payload fetch retries through it.
        -- run() blocks this thread, but its internal task.wait yields let the spawned
        -- animator tick; a straight-line `animating=false` (no yield) before the final
        -- text guarantees the animator can't overwrite it.
        saveKey(KeyBox.Text)
        StatusText.TextColor3 = Color3.fromRGB(59, 130, 246)
        local LOAD_ETA = 20 -- rough seconds for a per-key server build (cached = instant)
        local animating = true
        task.spawn(function()
            local startedAt = os.clock()
            local dots = 0
            while animating do
                dots = (dots % 3) + 1
                local remaining = LOAD_ETA - (os.clock() - startedAt)
                local eta = (remaining > 0) and string.format(" (~%ds)", math.ceil(remaining)) or " (almost there)"
                StatusText.Text = "Script loading" .. string.rep(".", dots) .. eta
                task.wait(0.4)
            end
        end)
        local ok, rerr = run(token, payloadKey)
        animating = false
        if ok then
            StatusText.TextColor3 = Color3.fromRGB(16, 185, 129)
            StatusText.Text = "Loaded!"
            task.wait(0.4)
            ScreenGui:Destroy()
        elseif rerr == "provisioning" then
            StatusText.TextColor3 = Color3.fromRGB(59, 130, 246)
            StatusText.Text = "Script still loading — press Verify again"
            busy = false
        else
            StatusText.TextColor3 = Color3.fromRGB(239, 68, 68)
            StatusText.Text = "Couldn't load — try again"
            busy = false
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(DISCORD) end)
        StatusText.TextColor3 = Color3.fromRGB(59, 130, 246)
        StatusText.Text = "Link Copied!"
    end)
end

local function showLoginPromptChromium()
    local screen, card, Create, Theme, Tween = newCard("Chromium Login", 320)

    local keyBox = Chromium.new("TextBox", {
        Placeholder = "Enter Key...",
        Size = UDim2.new(1, 0, 0, 38),
        Parent = card,
        LayoutOrder = 1,
    })

    local row = Create.New("Frame", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Parent = card,
        UIListLayout = {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        },
    })
    local verifyBtn = newCardButton(row, Create, Theme, Tween, "Verify", true, 0)
    local getKeyBtn = newCardButton(row, Create, Theme, Tween, "Get Key", false, 1)

    local statusText = Create.New("TextLabel", {
        Size = UDim2.new(1, 0, 0, 18),
        BackgroundTransparency = 1,
        Text = "",
        TextSize = Theme.TextSize("Caption"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Theme.Color("Error"),
        LayoutOrder = 3,
        Parent = card,
    })

    local busy = false
    local function doVerify()
        if busy then return end
        busy = true

        -- Step 1 — validate the key. ONLY a genuinely bad/expired/revoked/locked key
        -- is rejected here, so "Invalid Key" never shows for a real, still-loading key.
        statusText.TextColor3 = Theme.Color("Accent")
        statusText.Text = "Verifying..."
        local token, payloadKey, aerr = authenticate(keyBox:Get())
        if not token then
            statusText.TextColor3 = Theme.Color("Error")
            statusText.Text = (aerr == "hwid_mismatch" and "Key locked to another device")
                or (aerr == "expired" and "Key expired")
                or (aerr == "revoked" and "Key revoked")
                or "Invalid Key"
            keyBox:Set("", true)
            busy = false
            return
        end

        -- Step 2 — key is valid: remember it and load. The per-key build may still be
        -- compiling server-side; show an animated "Script loading" with a rough ETA
        -- countdown (never "Invalid Key") while the payload fetch retries through it.
        saveKey(keyBox:Get())
        statusText.TextColor3 = Theme.Color("Accent")
        local LOAD_ETA = 20 -- rough seconds for a per-key server build (cached = instant)
        local animating = true
        task.spawn(function()
            local startedAt = os.clock()
            local dots = 0
            while animating do
                dots = (dots % 3) + 1
                local remaining = LOAD_ETA - (os.clock() - startedAt)
                local eta = (remaining > 0) and string.format(" (~%ds)", math.ceil(remaining)) or " (almost there)"
                statusText.Text = "Script loading" .. string.rep(".", dots) .. eta
                task.wait(0.4)
            end
        end)
        local ok, rerr = run(token, payloadKey)
        animating = false
        if ok then
            statusText.TextColor3 = Theme.Color("Success")
            statusText.Text = "Loaded!"
            task.wait(0.4)
            screen:Destroy()
        elseif rerr == "provisioning" then
            statusText.TextColor3 = Theme.Color("Accent")
            statusText.Text = "Script still loading — press Verify again"
            busy = false
        else
            statusText.TextColor3 = Theme.Color("Error")
            statusText.Text = "Couldn't load — try again"
            busy = false
        end
    end

    verifyBtn.Activated:Connect(doVerify)
    -- Enter submits, same as clicking Verify (TextBox.Changed fires (text, enterPressed)).
    keyBox.Changed:Connect(function(_, enterPressed)
        if enterPressed then doVerify() end
    end)
    getKeyBtn.Activated:Connect(function()
        pcall(function() setclipboard(DISCORD) end)
        statusText.TextColor3 = Theme.Color("Accent")
        statusText.Text = "Link Copied!"
    end)
end

local function showLoginPrompt()
    if Chromium then
        local ok = pcall(showLoginPromptChromium)
        if ok then return end
    end
    showLoginPromptFallback()
end

-- Resolve which script to load for THIS game before doing anything else.
local resolvedId, resolveErr = resolveScript()
if not resolvedId then
    showUnsupportedPanel(resolveErr)
    return
end
SCRIPT_ID = resolvedId

-- Try a saved key silently first.
local saved = readSavedKey()
if saved then
    local ok = attempt(saved)
    if ok then return end
    -- fall through to the prompt on failure (expired / revoked / hwid mismatch)
end

showLoginPrompt()
