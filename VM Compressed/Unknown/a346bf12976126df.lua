--[[
    Satisfactory Factor - Script Hub Loader (v3, auth re-enabled)

    Usage:
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlylovemywifey/sf-hub/main/loader.lua"))()

    Flow:
        1. Try saved key from workspace/SatisfactoryFactor/key.txt
        2. If saved + validates -> straight to hub
        3. Else open in-game key prompt; user pastes key from /getkey landing
        4. Validate -> save -> hub
        5. Populate getgenv().SF_AUTH so hub.lua refresh_premium() sees real state

    Safety rules baked in:
        - Every HTTP call uses independent if-not-src retries (no elseif chain).
        - validate() entirely pcall-wrapped from main; crash inside it deletes
          the saved key (prevents loop) and falls through to prompt.
        - All SetCore/StarterGui calls pcall'd (some games block early).
        - First action is task.wait(0.15) so engine binds notification topbar.
]]

print("[SF] loader v3 - parse OK")

local LOADER_VERSION = "3.2.0"
local CONFIG_DIR     = "SatisfactoryFactor"
local KEY_FILE       = CONFIG_DIR .. "/key.txt"
local KEYS_FILE      = CONFIG_DIR .. "/keys.json"  -- recent keys history (max 5)
local MAX_RECENT     = 5
local AUTH_API       = "https://sf-auth.sfhub.workers.dev"
local KEY_PAGE       = "https://sf-key.pages.dev/"
local HttpService    = game:GetService("HttpService")
-- hub.lua is now served via the auth-gated worker /script endpoint so the
-- private repo source isn't visible to competitors. URL is constructed after
-- auth completes (needs key + hwid in query string).
local HUB_PATH       = "hub.lua"

------------------------------------------------------------------------------
-- helpers
------------------------------------------------------------------------------

local function notify(title, text, dur)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title    = tostring(title),
            Text     = tostring(text),
            Duration = dur or 5,
        })
    end)
end

local function ensure_dir()
    if not isfolder or not makefolder then return end
    pcall(function() if not isfolder(CONFIG_DIR) then makefolder(CONFIG_DIR) end end)
end

local function read_saved_key()
    if not isfile then return nil end
    ensure_dir()
    local ok, exists = pcall(isfile, KEY_FILE)
    if not ok or not exists then return nil end
    local rok, data = pcall(readfile, KEY_FILE)
    if rok and type(data) == "string" and #data > 0 then
        return (data:gsub("%s+", ""))
    end
    return nil
end

local function save_key(k)
    if not writefile then return end
    ensure_dir()
    pcall(writefile, KEY_FILE, k)
end

local function delete_saved_key()
    if not delfile then return end
    pcall(function() if isfile and isfile(KEY_FILE) then delfile(KEY_FILE) end end)
end

------------------------------------------------------------------------------
-- recent keys (history of up to MAX_RECENT successful keys, newest first)
------------------------------------------------------------------------------

local function read_recent_keys()
    if not isfile or not readfile then return {} end
    ensure_dir()
    local pok, exists = pcall(isfile, KEYS_FILE)
    if not pok or not exists then return {} end
    local rok, raw = pcall(readfile, KEYS_FILE)
    if not rok or type(raw) ~= "string" or #raw == 0 then return {} end
    local dok, data = pcall(function() return HttpService:JSONDecode(raw) end)
    if not dok or type(data) ~= "table" or type(data.recent) ~= "table" then return {} end
    local out = {}
    for _, e in ipairs(data.recent) do
        if type(e) == "table" and type(e.k) == "string" and #e.k > 0 then
            table.insert(out, { k = e.k, ts = tonumber(e.ts) or 0 })
        end
    end
    return out
end

local function write_recent_keys(list)
    if not writefile then return end
    ensure_dir()
    local payload = { recent = list }
    local eok, raw = pcall(function() return HttpService:JSONEncode(payload) end)
    if not eok or type(raw) ~= "string" then return end
    pcall(writefile, KEYS_FILE, raw)
end

local function add_recent_key(k)
    if type(k) ~= "string" or #k == 0 then return end
    local list = read_recent_keys()
    local filtered = {}
    for _, e in ipairs(list) do if e.k ~= k then table.insert(filtered, e) end end
    table.insert(filtered, 1, { k = k, ts = os.time() })
    while #filtered > MAX_RECENT do table.remove(filtered) end
    write_recent_keys(filtered)
end

local function forget_recent_key(k)
    local list = read_recent_keys()
    local out = {}
    for _, e in ipairs(list) do if e.k ~= k then table.insert(out, e) end end
    write_recent_keys(out)
end

-- HTTP: try each provider independently, take the first non-empty body.
-- This is the v2 pattern - never use elseif chains, which left some
-- executors stuck if their first matching method returned nil.
local function http_get(url)
    print("[SF] http_get: " .. tostring(url):sub(1, 80))
    local src

    if not src and syn and syn.request then
        local ok, r = pcall(syn.request, { Url = url, Method = "GET" })
        if ok and r and r.Body and #r.Body > 0 then src = r.Body end
    end
    if not src and type(request) == "function" then
        local ok, r = pcall(request, { Url = url, Method = "GET" })
        if ok and r and r.Body and #r.Body > 0 then src = r.Body end
    end
    if not src and http and type(http.request) == "function" then
        local ok, r = pcall(http.request, { Url = url, Method = "GET" })
        if ok and r and r.Body and #r.Body > 0 then src = r.Body end
    end
    if not src and fluxus and type(fluxus.request) == "function" then
        local ok, r = pcall(fluxus.request, { Url = url, Method = "GET" })
        if ok and r and r.Body and #r.Body > 0 then src = r.Body end
    end
    if not src then
        local ok, body = pcall(game.HttpGet, game, url)
        if ok and type(body) == "string" and #body > 0 then src = body end
    end

    print("[SF] http_get: result len=" .. tostring(src and #src or 0))
    return src
end

-- HWID is resolved ONCE at loader startup and cached. Resolving it multiple
-- times per run was causing hangs on Solara: the second RbxAnalyticsService
-- :GetClientId() call in a rapid sequence occasionally yields indefinitely
-- (Roblox HttpService/Analytics throttle kicks in after repeated retries in
-- the same session). Cached once = one Analytics touch total, no re-yield.
local _cached_hwid = nil
local function get_hwid()
    if _cached_hwid then return _cached_hwid end
    local id = nil
    if gethwid then
        local ok, v = pcall(gethwid); if ok and type(v) == "string" and #v > 0 then id = v end
    end
    if not id then
        local ok, v = pcall(function() return game:GetService("RbxAnalyticsService"):GetClientId() end)
        if ok and type(v) == "string" and #v > 0 then id = v end
    end
    if not id then id = tostring(game.JobId or "no-hwid") end
    _cached_hwid = id
    return id
end

------------------------------------------------------------------------------
-- validate
------------------------------------------------------------------------------

local ERR_MESSAGES = {
    unknown_key    = "Key not recognized. Run /getkey in Discord to mint a new one.",
    hwid_mismatch  = "Key is locked to a different PC. Run /resethwid in Discord (free: 1 per day, premium: unlimited).",
    expired        = "Your free key expired (24h). Re-run /getkey for a fresh one - or buy premium for unlimited.",
    bad_token      = "Mint token expired. Re-run /getkey in Discord (token only lives 10 min).",
    bad_discord_id = "Discord ID malformed. Re-run /getkey to get a fresh link.",
    missing        = "Missing key or HWID. Re-run /getkey in Discord.",
    oversized      = "Key or HWID too long. Re-run /getkey in Discord.",
}

local function validate(key)
    print("[SF] validate enter")
    if type(key) ~= "string" or #key == 0 then
        return false, "Empty key. Run /getkey in Discord."
    end
    local hwid = get_hwid()
    key = key:gsub("%s+", "")

    local url  = AUTH_API .. "/validate?key=" .. key .. "&hwid=" .. hwid
    local body = http_get(url)

    if type(body) ~= "string" then
        return false, "Can't reach auth server. Check your internet then try again."
    end

    if body:find('"ok":true', 1, true) then
        local premium    = body:find('"premium":true', 1, true) ~= nil
        local expires_at = body:match('"expires_at":(%d+)')
        if not premium and expires_at then
            local secs_left = math.floor((tonumber(expires_at) - os.time() * 1000) / 1000)
            if secs_left > 0 and secs_left < 3600 then
                notify("SF", "Free key expires in " .. math.floor(secs_left / 60) .. " min. Re-run /getkey before it dies.", 8)
            end
        end
        return true, premium
    end

    local err_code = body:match('"err":"([^"]+)"') or "unknown"
    local human    = ERR_MESSAGES[err_code] or ("Validation failed: " .. err_code)
    print("[SF] validate err code=" .. err_code)
    return false, human
end

------------------------------------------------------------------------------
-- in-game key prompt (fallback if no saved key OR saved key invalid)
------------------------------------------------------------------------------

local function prompt_key()
    pcall(function() if setclipboard then setclipboard(KEY_PAGE) end end)
    notify("Satisfactory Factor", "Key link copied. Paste in browser, get key, then paste it below.", 10)

    local Players           = game:GetService("Players")
    local CoreGui           = game:GetService("CoreGui")
    local TweenService      = game:GetService("TweenService")
    local UserInputService  = game:GetService("UserInputService")
    local lp                = Players.LocalPlayer
    local PlayerGui         = lp and lp:FindFirstChildOfClass("PlayerGui")
    local parent
    do
        local ok, h = pcall(function() return gethui and gethui() end)
        if ok and h then parent = h end
    end
    parent = parent or PlayerGui or CoreGui

    -- SF theme tokens (mirror hub.lua T table)
    local VOID    = Color3.fromRGB(  6,   6,   8)
    local SPACE   = Color3.fromRGB( 11,  11,  16)
    local SURF    = Color3.fromRGB( 18,  18,  23)
    local SURF2   = Color3.fromRGB( 23,  23,  30)
    local WHITE   = Color3.fromRGB(255, 255, 255)
    local ERR     = Color3.fromRGB(255, 130, 130)
    local LINE_T  = 0.90
    local LINE2_T = 0.82
    local TXT_MID = 0.28
    local TXT_LO  = 0.50
    local TXT_FAI = 0.62

    local gui = Instance.new("ScreenGui")
    gui.Name = "SF_KeyPrompt"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 100
    pcall(function() gui.Parent = parent end)
    pcall(function() if protectgui then protectgui(gui) end end)
    if not gui.Parent then return nil, false end

    -- backdrop dim covering the screen
    local dim = Instance.new("Frame", gui)
    dim.Size = UDim2.new(1, 0, 1, 0)
    dim.BackgroundColor3 = VOID
    dim.BackgroundTransparency = 0.45
    dim.BorderSizePixel = 0
    dim.ZIndex = 1

    -- prompt frame
    local frame = Instance.new("Frame", gui)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.Size = UDim2.new(0, 460, 0, 540)
    frame.BackgroundColor3 = SURF
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.ZIndex = 2
    do
        local c = Instance.new("UICorner", frame); c.CornerRadius = UDim.new(0, 22)
        local s = Instance.new("UIStroke", frame); s.Color = WHITE; s.Thickness = 1; s.Transparency = LINE_T
    end

    -- nebula wash behind everything (the "depth" rhyme from the brand)
    do
        local nebula = Instance.new("Frame", frame)
        nebula.Size = UDim2.new(1, 0, 1, 0)
        nebula.BackgroundColor3 = SPACE
        nebula.BackgroundTransparency = 0.5
        nebula.BorderSizePixel = 0
        nebula.ZIndex = 1
        local ng = Instance.new("UIGradient", nebula)
        ng.Color = ColorSequence.new(SPACE, VOID)
        ng.Rotation = 145
    end

    ----------------------------------------------------------------
    -- falling-stars particle layer (sits behind content, above nebula)
    ----------------------------------------------------------------
    local starsLayer = Instance.new("Frame", frame)
    starsLayer.Size = UDim2.new(1, 0, 1, 0)
    starsLayer.BackgroundTransparency = 1
    starsLayer.BorderSizePixel = 0
    starsLayer.ClipsDescendants = true
    starsLayer.ZIndex = 2

    local starsRunning = true
    task.spawn(function()
        while starsRunning and frame.Parent do
            for _ = 1, math.random(1, 2) do
                local sz   = math.random(2, 4)
                local star = Instance.new("Frame", starsLayer)
                star.Size = UDim2.new(0, sz, 0, sz)
                star.BackgroundColor3 = WHITE
                star.BackgroundTransparency = math.random(20, 65) / 100
                star.BorderSizePixel = 0
                star.ZIndex = 2
                local c = Instance.new("UICorner", star); c.CornerRadius = UDim.new(1, 0)
                local x = math.random() -- 0..1
                star.Position = UDim2.new(x, 0, 0, -10)
                local dur = math.random(28, 60) / 10
                local tw  = TweenService:Create(
                    star,
                    TweenInfo.new(dur, Enum.EasingStyle.Linear),
                    { Position = UDim2.new(x, 0, 1, 20), BackgroundTransparency = 1 }
                )
                tw:Play()
                tw.Completed:Connect(function() pcall(function() star:Destroy() end) end)
            end
            task.wait(0.10)
        end
    end)

    ----------------------------------------------------------------
    -- content container (above stars)
    ----------------------------------------------------------------
    local content = Instance.new("Frame", frame)
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.ZIndex = 3

    -- title bar: planet glyph + SATISFACTORYFACTOR wordmark (draggable)
    local titleBar = Instance.new("Frame", content)
    titleBar.Position = UDim2.new(0, 20, 0, 18)
    titleBar.Size = UDim2.new(1, -40, 0, 28)
    titleBar.BackgroundTransparency = 1
    titleBar.ZIndex = 3
    -- the bar itself absorbs drag input, so widen its hit area visually:
    titleBar.Active = true

    local glyph = Instance.new("Frame", titleBar)
    glyph.AnchorPoint = Vector2.new(0, 0.5)
    glyph.Position = UDim2.new(0, 0, 0.5, 0)
    glyph.Size = UDim2.new(0, 22, 0, 22)
    glyph.BackgroundTransparency = 1
    glyph.ZIndex = 3
    do
        local body = Instance.new("Frame", glyph)
        body.AnchorPoint = Vector2.new(0.5, 0.5)
        body.Position = UDim2.new(0.5, 0, 0.5, 0)
        body.Size = UDim2.new(0, 12, 0, 12)
        body.BackgroundTransparency = 1
        body.BorderSizePixel = 0
        body.ZIndex = 3
        local bc = Instance.new("UICorner", body); bc.CornerRadius = UDim.new(1, 0)
        local bs = Instance.new("UIStroke", body); bs.Color = WHITE; bs.Thickness = 1

        local ring = Instance.new("Frame", glyph)
        ring.AnchorPoint = Vector2.new(0.5, 0.5)
        ring.Position = UDim2.new(0.5, 0, 0.5, 0)
        ring.Size = UDim2.new(0, 22, 0, 8)
        ring.BackgroundTransparency = 1
        ring.BorderSizePixel = 0
        ring.Rotation = -22
        ring.ZIndex = 3
        local rc = Instance.new("UICorner", ring); rc.CornerRadius = UDim.new(1, 0)
        local rs = Instance.new("UIStroke", ring); rs.Color = WHITE; rs.Thickness = 1; rs.Transparency = 0.35
    end

    local wordmark = Instance.new("TextLabel", titleBar)
    wordmark.Position = UDim2.new(0, 32, 0, 0)
    wordmark.Size = UDim2.new(1, -32, 1, 0)
    wordmark.BackgroundTransparency = 1
    wordmark.Text = "SATISFACTORYFACTOR"
    wordmark.Font = Enum.Font.Code
    wordmark.TextSize = 13
    wordmark.TextColor3 = WHITE
    wordmark.TextXAlignment = Enum.TextXAlignment.Left
    wordmark.TextYAlignment = Enum.TextYAlignment.Center
    wordmark.ZIndex = 3

    -- eyebrow + headline + body
    local eye = Instance.new("TextLabel", content)
    eye.Position = UDim2.new(0, 26, 0, 64)
    eye.Size = UDim2.new(1, -52, 0, 14)
    eye.BackgroundTransparency = 1
    eye.Text = "// 01 — VERIFY ACCESS"
    eye.Font = Enum.Font.Code
    eye.TextSize = 11
    eye.TextColor3 = WHITE
    eye.TextTransparency = TXT_LO
    eye.TextXAlignment = Enum.TextXAlignment.Left
    eye.ZIndex = 3

    local headline = Instance.new("TextLabel", content)
    headline.Position = UDim2.new(0, 26, 0, 80)
    headline.Size = UDim2.new(1, -52, 0, 36)
    headline.BackgroundTransparency = 1
    headline.Text = "ACCESS KEY"
    headline.Font = Enum.Font.GothamBlack
    headline.TextSize = 30
    headline.TextColor3 = WHITE
    headline.TextXAlignment = Enum.TextXAlignment.Left
    headline.ZIndex = 3

    local subhead = Instance.new("TextLabel", content)
    subhead.Position = UDim2.new(0, 26, 0, 120)
    subhead.Size = UDim2.new(1, -52, 0, 36)
    subhead.BackgroundTransparency = 1
    subhead.Text = "Paste your key. The hub unlocks the moment it validates."
    subhead.Font = Enum.Font.Gotham
    subhead.TextSize = 13
    subhead.TextColor3 = WHITE
    subhead.TextTransparency = TXT_MID
    subhead.TextXAlignment = Enum.TextXAlignment.Left
    subhead.TextYAlignment = Enum.TextYAlignment.Top
    subhead.TextWrapped = true
    subhead.ZIndex = 3

    -- key input (pill shape, SURF2 fill, white border @18%)
    local box = Instance.new("TextBox", content)
    box.Position = UDim2.new(0, 26, 0, 162)
    box.Size = UDim2.new(1, -52, 0, 42)
    box.BackgroundColor3 = SURF2
    box.BorderSizePixel = 0
    box.Text = ""
    box.PlaceholderText = "SF-XXXX-XXXX-XXXX"
    box.TextColor3 = WHITE
    box.PlaceholderColor3 = Color3.fromRGB(150, 150, 155)
    box.Font = Enum.Font.Code
    box.TextSize = 14
    box.ClearTextOnFocus = false
    box.TextXAlignment = Enum.TextXAlignment.Left
    box.TextYAlignment = Enum.TextYAlignment.Center
    box.ZIndex = 3
    do
        local c = Instance.new("UICorner", box); c.CornerRadius = UDim.new(0, 999)
        local p = Instance.new("UIPadding", box)
        p.PaddingLeft = UDim.new(0, 18); p.PaddingRight = UDim.new(0, 18)
        local s = Instance.new("UIStroke", box); s.Color = WHITE; s.Transparency = LINE2_T; s.Thickness = 1
    end

    -- ACTIVATE pill (filled white, void text)
    local submit = Instance.new("TextButton", content)
    submit.Position = UDim2.new(0, 26, 0, 214)
    submit.Size = UDim2.new(1, -52, 0, 42)
    submit.BackgroundColor3 = WHITE
    submit.BorderSizePixel = 0
    submit.Text = "ACTIVATE"
    submit.Font = Enum.Font.GothamBlack
    submit.TextSize = 13
    submit.TextColor3 = VOID
    submit.AutoButtonColor = false
    submit.ZIndex = 3
    do
        local c = Instance.new("UICorner", submit); c.CornerRadius = UDim.new(0, 999)
    end

    -- GET KEY row: pill button (copies link) + small Discord hint beside.
    -- Replaces the old cramped single-line caption that ran off the edge.
    local copyBtn = Instance.new("TextButton", content)
    copyBtn.Position = UDim2.new(0, 26, 0, 262)
    copyBtn.Size = UDim2.new(0, 138, 0, 30)
    copyBtn.BackgroundColor3 = VOID
    copyBtn.BorderSizePixel = 0
    copyBtn.Text = "COPY KEY LINK"
    copyBtn.Font = Enum.Font.GothamBold
    copyBtn.TextSize = 11
    copyBtn.TextColor3 = WHITE
    copyBtn.AutoButtonColor = false
    copyBtn.ZIndex = 3
    do
        local c = Instance.new("UICorner", copyBtn); c.CornerRadius = UDim.new(0, 999)
        local s = Instance.new("UIStroke", copyBtn); s.Color = WHITE; s.Transparency = 0.55; s.Thickness = 1
    end

    -- "or /getkey in Discord" hint to the right of the button
    local discordHint = Instance.new("TextLabel", content)
    discordHint.Position = UDim2.new(0, 174, 0, 262)
    discordHint.Size = UDim2.new(1, -200, 0, 30)
    discordHint.BackgroundTransparency = 1
    discordHint.Text = "or /getkey in Discord"
    discordHint.Font = Enum.Font.Code
    discordHint.TextSize = 12
    discordHint.TextColor3 = WHITE
    discordHint.TextTransparency = TXT_MID
    discordHint.TextXAlignment = Enum.TextXAlignment.Left
    discordHint.TextYAlignment = Enum.TextYAlignment.Center
    discordHint.ZIndex = 3

    -- URL fallback line — for users whose clipboard doesn't work, they can
    -- read + type this manually
    local urlLine = Instance.new("TextLabel", content)
    urlLine.Position = UDim2.new(0, 26, 0, 298)
    urlLine.Size = UDim2.new(1, -52, 0, 14)
    urlLine.BackgroundTransparency = 1
    urlLine.Text = "// " .. KEY_PAGE
    urlLine.Font = Enum.Font.Code
    urlLine.TextSize = 11
    urlLine.TextColor3 = WHITE
    urlLine.TextTransparency = TXT_LO
    urlLine.TextXAlignment = Enum.TextXAlignment.Left
    urlLine.ZIndex = 3

    -- Click handler: re-copy + flash "COPIED" on the button
    copyBtn.MouseButton1Click:Connect(function()
        pcall(function() if setclipboard then setclipboard(KEY_PAGE) end end)
        local orig = copyBtn.Text
        copyBtn.Text = "COPIED"
        task.delay(1.2, function()
            if copyBtn and copyBtn.Parent then copyBtn.Text = orig end
        end)
    end)

    -- divider (shifted down to accommodate the new two-row layout)
    local divider = Instance.new("Frame", content)
    divider.Position = UDim2.new(0, 26, 0, 322)
    divider.Size = UDim2.new(1, -52, 0, 1)
    divider.BackgroundColor3 = WHITE
    divider.BackgroundTransparency = LINE_T
    divider.BorderSizePixel = 0
    divider.ZIndex = 3

    -- recent-keys section
    local rkEye = Instance.new("TextLabel", content)
    rkEye.Position = UDim2.new(0, 26, 0, 336)
    rkEye.Size = UDim2.new(1, -52, 0, 14)
    rkEye.BackgroundTransparency = 1
    rkEye.Text = "// RECENT KEYS"
    rkEye.Font = Enum.Font.Code
    rkEye.TextSize = 14
    rkEye.TextColor3 = WHITE
    rkEye.TextTransparency = TXT_LO
    rkEye.TextXAlignment = Enum.TextXAlignment.Left
    rkEye.ZIndex = 3

    local list = Instance.new("ScrollingFrame", content)
    list.Position = UDim2.new(0, 26, 0, 356)
    list.Size = UDim2.new(1, -52, 0, 162)
    list.BackgroundTransparency = 1
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 2
    list.ScrollBarImageColor3 = WHITE
    list.ScrollBarImageTransparency = 0.7
    list.CanvasSize = UDim2.new(0, 0, 0, 0)
    list.AutomaticCanvasSize = Enum.AutomaticSize.Y
    list.ZIndex = 3
    do
        local lay = Instance.new("UIListLayout", list)
        lay.SortOrder = Enum.SortOrder.LayoutOrder
        lay.Padding = UDim.new(0, 8)
    end

    local emptyCap = Instance.new("TextLabel", list)
    emptyCap.Size = UDim2.new(1, 0, 0, 28)
    emptyCap.LayoutOrder = 0
    emptyCap.BackgroundTransparency = 1
    emptyCap.Text = "// no recent keys yet"
    emptyCap.Font = Enum.Font.Code
    emptyCap.TextSize = 14
    emptyCap.TextColor3 = WHITE
    emptyCap.TextTransparency = TXT_FAI
    emptyCap.TextXAlignment = Enum.TextXAlignment.Left
    emptyCap.ZIndex = 3

    -- shared activate handler used by ACTIVATE + USE buttons
    local out_key, out_prem
    local activating = false

    local function reset_subhead()
        subhead.Text = "Paste your key. The hub unlocks the moment it validates."
        subhead.TextColor3 = WHITE
        subhead.TextTransparency = TXT_MID
    end

    local function do_activate(raw)
        if activating then return end
        if type(raw) ~= "string" then raw = "" end
        local clean = raw:gsub("%s+", "")
        if #clean == 0 then
            subhead.Text = "Empty key. Paste the one from /getkey."
            subhead.TextColor3 = ERR
            subhead.TextTransparency = 0
            task.delay(2, function() if subhead and subhead.Parent then reset_subhead() end end)
            return
        end
        activating = true
        box.Text = clean
        submit.Text = "CHECKING…"
        local pok, ok, prem_or_err = pcall(validate, clean)
        if pok and ok then
            save_key(clean)
            add_recent_key(clean)
            out_key, out_prem = clean, prem_or_err
            starsRunning = false
            pcall(function() gui:Destroy() end)
            return
        end
        local why = pok and tostring(prem_or_err) or ("validate crashed: " .. tostring(ok))
        subhead.Text = why
        subhead.TextColor3 = ERR
        subhead.TextTransparency = 0
        submit.Text = "INVALID — TRY AGAIN"
        task.wait(2)
        if submit and submit.Parent then
            submit.Text = "ACTIVATE"
            reset_subhead()
        end
        activating = false
    end

    local function mask_key(k)
        if #k <= 12 then return k end
        return k:sub(1, 8) .. "…" .. k:sub(-4)
    end

    local function refresh_recent_list()
        for _, child in ipairs(list:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end
        local items = read_recent_keys()
        emptyCap.Visible = (#items == 0)
        for i, e in ipairs(items) do
            local row = Instance.new("Frame", list)
            row.LayoutOrder = i
            row.Size = UDim2.new(1, 0, 0, 40)
            row.BackgroundColor3 = SURF2
            row.BackgroundTransparency = 0.2
            row.BorderSizePixel = 0
            row.ZIndex = 3
            do
                local c = Instance.new("UICorner", row); c.CornerRadius = UDim.new(0, 14)
                local s = Instance.new("UIStroke", row); s.Color = WHITE; s.Transparency = LINE_T; s.Thickness = 1
            end

            local keyLab = Instance.new("TextLabel", row)
            keyLab.Position = UDim2.new(0, 16, 0, 0)
            keyLab.Size = UDim2.new(0.5, 0, 1, 0)
            keyLab.BackgroundTransparency = 1
            keyLab.Text = mask_key(e.k)
            keyLab.Font = Enum.Font.Code
            keyLab.TextSize = 14
            keyLab.TextColor3 = WHITE
            keyLab.TextXAlignment = Enum.TextXAlignment.Left
            keyLab.TextYAlignment = Enum.TextYAlignment.Center
            keyLab.ZIndex = 3

            local forgetBtn = Instance.new("TextButton", row)
            forgetBtn.AnchorPoint = Vector2.new(1, 0.5)
            forgetBtn.Position = UDim2.new(1, -12, 0.5, 0)
            forgetBtn.Size = UDim2.new(0, 64, 0, 26)
            forgetBtn.BackgroundColor3 = SURF
            forgetBtn.BackgroundTransparency = 0.1
            forgetBtn.BorderSizePixel = 0
            forgetBtn.Text = "FORGET"
            forgetBtn.Font = Enum.Font.GothamBlack
            forgetBtn.TextSize = 12
            forgetBtn.TextColor3 = WHITE
            forgetBtn.AutoButtonColor = false
            forgetBtn.ZIndex = 3
            do
                local c = Instance.new("UICorner", forgetBtn); c.CornerRadius = UDim.new(0, 999)
                local s = Instance.new("UIStroke", forgetBtn); s.Color = WHITE; s.Transparency = LINE2_T; s.Thickness = 1
            end

            local useBtn = Instance.new("TextButton", row)
            useBtn.AnchorPoint = Vector2.new(1, 0.5)
            useBtn.Position = UDim2.new(1, -84, 0.5, 0)
            useBtn.Size = UDim2.new(0, 56, 0, 26)
            useBtn.BackgroundColor3 = WHITE
            useBtn.BorderSizePixel = 0
            useBtn.Text = "USE"
            useBtn.Font = Enum.Font.GothamBlack
            useBtn.TextSize = 12
            useBtn.TextColor3 = VOID
            useBtn.AutoButtonColor = false
            useBtn.ZIndex = 3
            do
                local c = Instance.new("UICorner", useBtn); c.CornerRadius = UDim.new(0, 999)
            end

            useBtn.MouseButton1Click:Connect(function() task.spawn(do_activate, e.k) end)
            forgetBtn.MouseButton1Click:Connect(function()
                forget_recent_key(e.k)
                refresh_recent_list()
            end)

            -- hover affordance
            useBtn.MouseEnter:Connect(function()
                TweenService:Create(useBtn, TweenInfo.new(0.15), { TextColor3 = VOID }):Play()
            end)
            forgetBtn.MouseEnter:Connect(function()
                local s = forgetBtn:FindFirstChildOfClass("UIStroke")
                if s then TweenService:Create(s, TweenInfo.new(0.15), { Transparency = 0.4 }):Play() end
            end)
            forgetBtn.MouseLeave:Connect(function()
                local s = forgetBtn:FindFirstChildOfClass("UIStroke")
                if s then TweenService:Create(s, TweenInfo.new(0.15), { Transparency = LINE2_T }):Play() end
            end)
        end
    end

    refresh_recent_list()

    -- ACTIVATE button click + Enter-to-submit
    submit.MouseButton1Click:Connect(function() task.spawn(do_activate, box.Text) end)
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then task.spawn(do_activate, box.Text) end
    end)

    -- submit hover: subtle dim of white to signal click
    submit.MouseEnter:Connect(function()
        TweenService:Create(submit, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(235, 235, 235) }):Play()
    end)
    submit.MouseLeave:Connect(function()
        TweenService:Create(submit, TweenInfo.new(0.15), { BackgroundColor3 = WHITE }):Play()
    end)

    -- draggable window from titleBar
    do
        local dragging = false
        local dragStart, startPos
        titleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                local d = input.Position - dragStart
                frame.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + d.X,
                    startPos.Y.Scale, startPos.Y.Offset + d.Y
                )
            end
        end)
    end

    -- entrance: fade dim in, pop frame in
    frame.Size = UDim2.new(0, 460 * 0.94, 0, 540 * 0.94)
    TweenService:Create(frame, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        { Size = UDim2.new(0, 460, 0, 540) }):Play()

    while gui.Parent do task.wait(0.1) end
    starsRunning = false
    return out_key, out_prem
end

------------------------------------------------------------------------------
-- main
------------------------------------------------------------------------------

print("[SF] stage 1: settle")
task.wait(0.15)
notify("SF [1/5]", "Loader v" .. LOADER_VERSION .. " starting", 3)

print("[SF] stage 2: read saved key")
local key = read_saved_key()
local ok, premium = false, false

if key then
    notify("SF [2/5]", "Saved key found - validating", 3)
    local pok, vk, vp_or_err = pcall(validate, key)
    if not pok then
        print("[SF] validate CRASHED: " .. tostring(vk))
        notify("SF", "Validate errored - retrying via prompt", 6)
        delete_saved_key()
        key = nil
    else
        ok, premium = vk, vp_or_err
        if not ok then
            notify("SF - Key Problem", tostring(vp_or_err), 10)
            local msg = tostring(vp_or_err)
            if msg:find("expired") or msg:find("not recognized") or msg:find("different PC") then
                delete_saved_key()
            end
            key = nil
        end
    end
else
    notify("SF [2/5]", "No saved key - opening prompt", 3)
end

if not key then
    print("[SF] stage 3: prompt")
    notify("SF [3/5]", "Opening key prompt", 3)
    local pok, pk, pp = pcall(prompt_key)
    if not pok then
        print("[SF] prompt CRASHED: " .. tostring(pk))
        notify("SF", "Key prompt errored: " .. tostring(pk):sub(1, 80), 8)
        return
    end
    key, premium = pk, pp
    if not key then
        notify("SF", "Auth cancelled", 5)
        return
    end
    ok = true
end

if not ok then return end

print("[SF] stage 4: auth OK")
notify("SF [4/5]", "Auth OK - " .. (premium and "Premium" or "Free") .. " tier", 3)

-- SF_AUTH must exist before hub runs. Uses the cached HWID (already resolved
-- during validate) so no extra Analytics/gethwid touch here.
getgenv().SF_AUTH = {
    key     = key,
    hwid    = get_hwid(),
    premium = premium == true,
    api     = AUTH_API,
    version = LOADER_VERSION,
}
print("[SF] stage 4.1: SF_AUTH set")

-- recent-key bookkeeping runs on a background task. writefile on some
-- executors (Solara-specific report) can yield indefinitely on certain rig
-- configs; keeping it off the loader main path so it can never block the
-- fetch → hub-run sequence. Even if the write hangs, the loader completes.
task.spawn(function()
    pcall(add_recent_key, key)
    print("[SF] stage 4.2: recent-key recorded (bg)")
end)

-- Fetch hub.lua via auth-gated worker proxy. Uses cached HWID (same value
-- validate saw) so /script hwid_hash matches /validate exactly.
local function fetch_hub(k)
    local u = AUTH_API .. "/script?file=" .. HUB_PATH
        .. "&key=" .. k
        .. "&hwid=" .. get_hwid()
        .. "&_cb=" .. tostring(os.time())
    return http_get(u), u
end

print("[SF] stage 5: fetch hub")
notify("SF [5/5]", "Fetching hub", 3)

local hub_src, hub_url = fetch_hub(key)
print("[SF] stage 5.1: fetch returned len=" .. tostring(hub_src and #hub_src or 0)
    .. " head=" .. tostring(hub_src and hub_src:sub(1, 60) or "<nil>"))

-- Short body = worker rejected (hwid_mismatch / expired / unknown_key etc.)
-- /validate passed but /script didn't, which means the saved key is stale
-- against the current HWID/expiry. Nuke it, re-prompt, retry once.
if not hub_src or #hub_src < 100 then
    local body_preview = tostring(hub_src or "<nil>"):sub(1, 100)
    print("[SF] hub fetch REJECTED. body=" .. body_preview)
    notify("SF - Saved Key Rejected",
        "Server said: " .. body_preview:sub(1, 40) .. " - opening key prompt for fresh auth",
        12)
    delete_saved_key()
    pcall(forget_recent_key, key)

    local pok, pk, pp = pcall(prompt_key)
    if not pok then
        print("[SF] reprompt CRASHED: " .. tostring(pk))
        notify("SF", "Reauth prompt errored: " .. tostring(pk):sub(1, 80), 10)
        return
    end
    if not pk then
        notify("SF", "Reauth cancelled", 6)
        return
    end
    key, premium = pk, pp
    set_sf_auth(key, premium)
    print("[SF] stage 5.2: retrying fetch with fresh key")
    notify("SF", "Retrying hub fetch with fresh key", 4)
    hub_src, hub_url = fetch_hub(key)
    print("[SF] stage 5.3: retry returned len=" .. tostring(hub_src and #hub_src or 0)
        .. " head=" .. tostring(hub_src and hub_src:sub(1, 60) or "<nil>"))
    if not hub_src or #hub_src < 100 then
        local retry_preview = tostring(hub_src or "<nil>"):sub(1, 100)
        notify("SF - Fetch Failed",
            "Retry also rejected: " .. retry_preview:sub(1, 40) .. " - check Discord",
            15)
        return
    end
end
print("[SF] hub fetched bytes=" .. #hub_src)
notify("SF", "Hub fetched (" .. math.floor(#hub_src / 1024) .. " KB) - loading", 4)

local fn, parse_err = loadstring(hub_src)
if not fn then
    notify("SF - Parse Error", tostring(parse_err):sub(1, 100), 12)
    return
end
print("[SF] stage 6: parsed OK, executing hub")
notify("SF", "Hub parsed - executing", 3)

-- Hub is run in a task.spawn so a yielding internal HTTP call (e.g. hub
-- fetching scripts/_sf_ui.lua synchronously) cannot deadlock the loader
-- into the "5/5 then nothing" state. If the hub yields forever, at least
-- the loader itself completes and prints the "loader complete" marker so
-- the operator can see execution is proceeding on a background task.
task.spawn(function()
    local hub_ok, hub_err = pcall(fn)
    if not hub_ok then
        print("[SF] hub crashed: " .. tostring(hub_err))
        notify("SF - Hub Crash", tostring(hub_err):sub(1, 200), 15)
        warn("[SF Hub crash] " .. tostring(hub_err))
    else
        print("[SF] stage 7: hub main returned")
        notify("SF", "Hub loaded", 3)
    end
end)

print("[SF] loader complete - hub running (async)")
