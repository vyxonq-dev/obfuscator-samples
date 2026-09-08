--loadstring(game:HttpGet("https://raw.githubusercontent.com/zearx/r-g/refs/heads/main/kl/play.lua"))()

_G.hop        = true
_G.check      = false
_G.autoStart  = true
_G.targetRoles = {
    mythical  = true,
    legendary = true,
    epic      = true,
    rare      = true,
    uncommon  = false,
    common    = false,
}

local EGG_CONFIG = {
    mythical  = { "Crab Egg", "Acro Egg", "Dragon Egg", "Dinosaur Egg", "Peodiz Egg" },
    legendary = { "Polyraris Egg", "Drago Egg", "Piknik Egg", "IShadowSentry Egg", "MisterYudo Egg", "LeePungg Egg", "Xekami Egg", "At0zDx Egg" },
    epic      = { "Royal Pink Egg", "Fishy Egg", "Royal Green Egg", "Royal Red Egg", "Golden Egg", "Alien Egg", "Fallen Crystal Egg" },
    rare      = { "Cyborg Egg", "Bubbly Egg", "Glacier Egg" },
    uncommon  = { "Bacon Egg", "Chromatic Egg", "Serious Icecream Egg" },
    common    = { "Egg", "Spotted Egg", "Sakura Egg" },
}

local PRIORITY = { mythical=1, legendary=2, epic=3, rare=4, uncommon=5, common=6 }

local Players = game:GetService("Players")
local Http    = game:GetService("HttpService")
local TPS     = game:GetService("TeleportService")

local lp      = Players.LocalPlayer
local effects = workspace:WaitForChild("Effects")

local active = false
local thread = nil

local function buildEggList()
    local t = {}
    for role, names in pairs(EGG_CONFIG) do
        for _, name in ipairs(names) do
            t[#t+1] = { role=role, name=name, priority=PRIORITY[role] or 99 }
        end
    end
    table.sort(t, function(a, b) return a.priority < b.priority end)
    return t
end

local function findTarget(list)
    local present = {}
    for _, v in ipairs(effects:GetChildren()) do
        if v.Name:lower():find("egg") then
            present[#present+1] = v
        end
    end
    if #present == 0 then return nil end

    for _, entry in ipairs(list) do
        if _G.targetRoles[entry.role] then
            for _, obj in ipairs(present) do
                if obj.Name:lower() == entry.name:lower() then
                    return obj, entry.role
                end
            end
        end
    end
end

local function getPivot(obj)
    if obj:IsA("BasePart") then return obj.CFrame end
    local ok, cf = pcall(function() return obj:GetPivot() end)
    return ok and cf or CFrame.new()
end

local function firePrompt(pp)
    if not pp then return end
    pp.HoldDuration = 0
    pp:InputHoldBegin()
    task.wait(0.1)
    pp:InputHoldEnd()
end

local function moveTo(cf)
    local char = lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame = cf end
end

local function serverTimeOk()
    local ok, label = pcall(function()
        return lp.PlayerGui.MainGui.StarterFrame.LegacyPoseFrame.ThirdSea.TextLabel
    end)
    if not ok or not label then return false end
    local parts = {}
    for n in label.Text:gmatch("%d+") do parts[#parts+1] = tonumber(n) end
    local mins = 0
    if     #parts == 3 then mins = parts[1]*60 + parts[2] + parts[3]/60
    elseif #parts == 2 then mins = parts[1] + parts[2]/60
    elseif #parts == 1 then mins = parts[1] end
    return mins < 10
end

local function hopServer()
    if not _G.hop then return end
    if _G.check and serverTimeOk() then return end

    local placeId   = game.PlaceId
    local hour      = os.date("!*t").hour
    local visited   = {}
    local cursor    = ""

    local ok = pcall(function()
        visited = Http:JSONDecode(readfile("NotSameServers.json"))
    end)
    if not ok then
        visited = { hour }
        pcall(function() writefile("NotSameServers.json", Http:JSONEncode(visited)) end)
    end

    local function scan()
        local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100%s")
            :format(placeId, cursor ~= "" and ("&cursor=" .. cursor) or "")

        local rawOk, raw = pcall(game.HttpGet, game, url)
        if not rawOk then return false end

        local jsonOk, data = pcall(Http.JSONDecode, Http, raw)
        if not jsonOk or type(data) ~= "table" or type(data.data) ~= "table" then return false end

        cursor = (data.nextPageCursor and data.nextPageCursor ~= "null") and data.nextPageCursor or ""

        for _, s in ipairs(data.data) do
            if type(s) ~= "table" then continue end
            local id      = tostring(s.id or "")
            local playing = tonumber(s.playing) or 0
            local cap     = tonumber(s.maxPlayers) or 0
            if playing >= cap or id == "" then continue end

            if #visited > 0 and tonumber(visited[1]) ~= tonumber(hour) then
                visited = { hour }
                pcall(function() delfile("NotSameServers.json") end)
            end

            local seen = false
            for i = 2, #visited do
                if tostring(visited[i]) == id then seen = true; break end
            end

            if not seen then
                visited[#visited+1] = id
                pcall(function() writefile("NotSameServers.json", Http:JSONEncode(visited)) end)
                local tpOk = pcall(TPS.TeleportToPlaceInstance, TPS, placeId, id, lp)
                if tpOk then return true end
            end
        end
        return false
    end

    if not scan() and cursor ~= "" then scan() end
end

local function loop(status)
    while active do
        local egg, role = findTarget(buildEggList())

        if not egg then
            if status then status.Text = "Egg not found" end
            hopServer()
            task.wait(3)
        else
            if status then status.Text = "Found " .. egg.Name .. " [" .. role .. "]" end
            moveTo(getPivot(egg))
            task.wait(0.3)
            firePrompt(egg:FindFirstChildWhichIsA("ProximityPrompt", true))
            task.wait(1)
        end
    end
    if status then status.Text = "Stop" end
end

local function buildUI()
    local gui = Instance.new("ScreenGui")
    gui.Name           = "EggHopUI"
    gui.ResetOnSpawn   = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent         = lp.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size             = UDim2.new(0, 230, 0, 380)
    frame.Position         = UDim2.new(0, 10, 0.5, -190)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.BorderSizePixel  = 0
    frame.Active           = true
    frame.Draggable        = true
    frame.Parent           = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel")
    title.Size             = UDim2.new(1, 0, 0, 30)
    title.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    title.Text             = "Egg Script"
    title.TextColor3       = Color3.fromRGB(255, 255, 255)
    title.Font             = Enum.Font.GothamBold
    title.TextSize         = 14
    title.Parent           = frame
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 8)

    local status = Instance.new("TextLabel")
    status.Size                   = UDim2.new(1, -20, 0, 24)
    status.Position               = UDim2.new(0, 10, 0, 34)
    status.BackgroundTransparency = 1
    status.Text                   = "Stop"
    status.TextColor3             = Color3.fromRGB(180, 180, 180)
    status.Font                   = Enum.Font.Gotham
    status.TextSize               = 12
    status.TextXAlignment         = Enum.TextXAlignment.Left
    status.Parent                 = frame

    local function makeToggle(label, y, get, set)
        local row = Instance.new("Frame")
        row.Size                   = UDim2.new(1, -20, 0, 28)
        row.Position               = UDim2.new(0, 10, 0, y)
        row.BackgroundTransparency = 1
        row.Parent                 = frame

        local lbl = Instance.new("TextLabel")
        lbl.Size                   = UDim2.new(0.7, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text                   = label
        lbl.TextColor3             = Color3.fromRGB(200, 200, 200)
        lbl.Font                   = Enum.Font.Gotham
        lbl.TextSize               = 13
        lbl.TextXAlignment         = Enum.TextXAlignment.Left
        lbl.Parent                 = row

        local btn = Instance.new("TextButton")
        btn.Size     = UDim2.new(0, 46, 0, 24)
        btn.Position = UDim2.new(1, -46, 0.5, -12)
        btn.Font     = Enum.Font.GothamBold
        btn.TextSize = 12
        btn.Parent   = row
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

        local function refresh()
            local on = get()
            btn.Text             = on and "ON" or "OFF"
            btn.BackgroundColor3 = on and Color3.fromRGB(80, 200, 100) or Color3.fromRGB(180, 60, 60)
            btn.TextColor3       = Color3.fromRGB(255, 255, 255)
        end
        refresh()
        btn.MouseButton1Click:Connect(function() set(not get()); refresh() end)
    end

    makeToggle("Hop Server",  62, function() return _G.hop   end, function(v) _G.hop   = v end)
    makeToggle("Check Timer", 92, function() return _G.check end, function(v) _G.check = v end)

    local divider = Instance.new("TextLabel")
    divider.Size                   = UDim2.new(1, -20, 0, 20)
    divider.Position               = UDim2.new(0, 10, 0, 126)
    divider.BackgroundTransparency = 1
    divider.Text                   = "Egg tier"
    divider.TextColor3             = Color3.fromRGB(150, 150, 150)
    divider.Font                   = Enum.Font.GothamBold
    divider.TextSize               = 11
    divider.Parent                 = frame

    local roleColors = {
        mythical  = Color3.fromRGB(220, 80,  220),
        legendary = Color3.fromRGB(255, 170, 0),
        epic      = Color3.fromRGB(150, 80,  220),
        rare      = Color3.fromRGB(60,  120, 220),
        uncommon  = Color3.fromRGB(80,  200, 100),
        common    = Color3.fromRGB(160, 160, 160),
    }

    for i, role in ipairs({ "mythical", "legendary", "epic", "rare", "uncommon", "common" }) do
        local row = Instance.new("Frame")
        row.Size                   = UDim2.new(1, -20, 0, 24)
        row.Position               = UDim2.new(0, 10, 0, 126 + i * 26)
        row.BackgroundTransparency = 1
        row.Parent                 = frame

        local lbl = Instance.new("TextLabel")
        lbl.Size                   = UDim2.new(0.7, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text                   = role:sub(1,1):upper() .. role:sub(2)
        lbl.TextColor3             = roleColors[role]
        lbl.Font                   = Enum.Font.GothamBold
        lbl.TextSize               = 12
        lbl.TextXAlignment         = Enum.TextXAlignment.Left
        lbl.Parent                 = row

        local btn = Instance.new("TextButton")
        btn.Size     = UDim2.new(0, 46, 0, 22)
        btn.Position = UDim2.new(1, -46, 0.5, -11)
        btn.Font     = Enum.Font.GothamBold
        btn.TextSize = 11
        btn.Parent   = row
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

        local function refresh()
            local on = _G.targetRoles[role]
            btn.Text             = on and "ON" or "OFF"
            btn.BackgroundColor3 = on and roleColors[role] or Color3.fromRGB(60, 60, 70)
            btn.TextColor3       = Color3.fromRGB(255, 255, 255)
        end
        refresh()
        btn.MouseButton1Click:Connect(function()
            _G.targetRoles[role] = not _G.targetRoles[role]
            refresh()
        end)
    end

    local mainBtn = Instance.new("TextButton")
    mainBtn.Size             = UDim2.new(1, -20, 0, 34)
    mainBtn.Position         = UDim2.new(0, 10, 0, 334)
    mainBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
    mainBtn.Text             = "Start"
    mainBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
    mainBtn.Font             = Enum.Font.GothamBold
    mainBtn.TextSize         = 14
    mainBtn.Parent           = frame
    Instance.new("UICorner", mainBtn).CornerRadius = UDim.new(0, 6)

    mainBtn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            mainBtn.Text             = "Stop"
            mainBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
            status.Text              = "Running"
            thread = task.spawn(loop, status)
        else
            mainBtn.Text             = "Start"
            mainBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
            if thread then task.cancel(thread); thread = nil end
            status.Text = "Stop"
        end
    end)

    return mainBtn, status
end

local mainBtn, status = buildUI()

if _G.autoStart then
    active = true
    mainBtn.Text             = "Stop"
    mainBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    status.Text              = "Running"
    thread = task.spawn(loop, status)
end
