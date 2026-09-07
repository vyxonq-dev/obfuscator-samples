


if not getgenv().__panda_elc_9ce068d3efb94b53 then
getgenv().__panda_elc_9ce068d3efb94b53 = true
local jsonEncode = game:GetService("HttpService").JSONEncode
task.spawn(function()
    while task.wait(10) do
        local ok, err = pcall(function()
            request({
                Url = "https://vss.pandadevelopment.net/execute_information",
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonEncode(game:GetService("HttpService"), {
                    slug_id = "9ce068d3efb94b53",
                    executor_name = identifyexecutor and identifyexecutor() or "Unknown",
                    hardware_id = gethwid and gethwid() or "",
                    job_id = tostring(game.JobId),
                    place_id = tostring(game.PlaceId),
                }),
            })
        end)
        if not ok then
            warn("[Panda VSS] Execute information failed:", err)
        end
    end
end)
end



-- [[ MEGA REACH - IRON SHADOW EDITION ]] --
-- [[ VERSION: 1.3.9 - BUG FIXES & IMPROVEMENTS ]] --


--[[
    Panda Key System - Legacy Roblox Client
    https://pandadevelopment.net
]]

local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local BaseURL = "https://new.pandadevelopment.net/api/v1"
local Client_ServiceID = "megareach"

-- Kütüphane kontrolü ve tanımlama
local bit32 = bit32 or getfenv().bit32 or getfenv().bit
if not bit32 then
    warn("Your executor doesn't support this script")
end

-- [[ HWID + HTTP (shared by key system and utils below) ]] --
local function getHWID()
    local hwid = "UNKNOWN"
    pcall(function()
        hwid = (gethwid and gethwid()) or (get_hwid and get_hwid()) or
               tostring(game:GetService("RbxAnalyticsService"):GetClientId())
    end)
    return hwid:gsub("[{}-]", "")
end

-- [[ WEBHOOK ENCRYPTION ]] --
local _WK = {0x4D,0x52,0x5F,0x49,0x53,0x45,0x43,0x52,0x45,0x54,0x4B,0x45,0x59,0x32,0x30,0x32}
local _EW = {37,38,43,57,32,127,108,125,33,61,56,38,54,64,84,28,46,61,50,102,50,53,42,125,50,49,41,45,54,93,91,65,98,99,107,112,99,117,117,100,118,103,125,114,110,11,4,4,117,106,102,125,124,7,40,36,6,49,102,119,62,124,104,98,63,43,109,25,106,42,41,49,39,27,8,125,32,80,120,90,63,17,9,120,5,43,1,57,1,12,15,3,109,124,115,7,33,6,16,35,48,112,14,3,117,55,26,7,96,109,71,75,57,21,50,16,32,39,45,53,20}
local _WH = (function()
    local r = {}
    for i = 1, #_EW do
        r[i] = string.char(bit.bxor(_EW[i], _WK[((i-1) % #_WK) + 1]))
    end
    return table.concat(r)
end)()
_WK = nil; _EW = nil
local function logExecution()
    task.spawn(function()
        local Webhook_URL = _WH
        local player = game:GetService("Players").LocalPlayer
        local hwid = getHWID()

        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "✅ Iron Shadow - Yeni Giriş",
                    ["description"] = "Bir kullanıcı scripti başarıyla çalıştırdı.",
                    ["color"] = 65280, -- Yeşil renk kodu
                    ["fields"] = {
                        {
                            ["name"] = "👤 Kullanıcı Adı",
                            ["value"] = player.Name,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "🆔 Kullanıcı ID",
                            ["value"] = tostring(player.UserId),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "💻 HWID",
                            ["value"] = "||" .. hwid .. "||",
                            ["inline"] = false
                        },
                        {
                            ["name"] = "🎮 Oynanan Oyun (Place ID)",
                            ["value"] = "[" .. tostring(game.PlaceId) .. "](https://www.roblox.com/games/" .. tostring(game.PlaceId) .. ")",
                            ["inline"] = false
                        }
                    },
                    ["footer"] = {
                        ["text"] = "Mega Reach V1.3.2 Execution Logger"
                    }
                }
            }
        }

        if request then
            pcall(function()
                request({
                    Url = Webhook_URL,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode(data)
                })
            end)
        end
    end)
end


local function parseDate(dateStr)
    if not dateStr or dateStr == "" then return os.time() + 86400 end
    -- Format: 2024-03-05 12:00:00
    local y, m, d, h, min, s = dateStr:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
    if y then
        return os.time({year=y, month=m, day=d, hour=h, min=min, sec=s})
    end
    return os.time() + 86400
end

local function makeRequest(endpoint, body)
    local HttpService = game:GetService("HttpService")
    local url = BaseURL .. endpoint
    local jsonBody = HttpService:JSONEncode(body)

    local ok, response = pcall(request, {
        Url = url,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = jsonBody
    })

    if ok and response and response.Body then
        local decodeOk, decoded = pcall(HttpService.JSONDecode, HttpService, response.Body)
        return decodeOk and decoded or nil
    end
    return nil
end

--[[
    Get Key URL - Returns the key system page URL with HWID embedded
    @return string
]]
local function GetKeyURL()
    return "https://new.pandadevelopment.net/getkey/" .. Client_ServiceID .. "?hwid=" .. getHWID()
end

--[[
    Copy the key-page URL to clipboard and return it
    @return string
]]
local function OpenGetKey()
    local url = GetKeyURL()
    if setclipboard then setclipboard(url) end
    return url
end

--[[
    Validate a license key against the Panda API.
    @param key string
    @param Premium_Verification boolean (optional) – requires premium status when true
    @return table { success, message, isPremium, expireDate }
]]
local function Validate(key, Premium_Verification)
    local result = makeRequest("/keys/validate", {
        ServiceID = Client_ServiceID,
        HWID = getHWID(),
        Key = key
    })

    if not result then
        return { success = false, message = "Failed to connect to server", isPremium = false, expireDate = nil }
    end

    local isAuthenticated = result.Authenticated_Status == "Success"
    local isPremium = result.Key_Premium or false
    local isValid = isAuthenticated
    local message = result.Note or (isAuthenticated and "Key validated!" or "Invalid key")

    if Premium_Verification and isAuthenticated and not isPremium then
        isValid = false
        message = "Premium key required"
    end

    return { success = isValid, message = message, isPremium = isPremium, expireDate = result.Expire_Date }
end

if _G.MR_LOADED_821 then return end
_G.MR_LOADED_821 = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LogService = game:GetService("LogService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

-- [[ OBFUSCATED KEYS ]] --
local UI_NAME = "MR_" .. math.random(1e5, 9e5)
local KEY_UI_NAME = "MRKEY_" .. math.random(1e5, 9e5)
local VIS_NAME = "RV_" .. math.random(1e5, 9e5)
local CONFIG_PREFIX = "MRCFG_"

-- [[ CONFIGURATION ]] --
local CONFIG = {
    VERSION = "1.3.9",
    REACH_DISTANCE = 15.0,
    COMBAT_PROFILE = "Standard", -- Legit, Standard, Extreme, Deadly
    RANDOM_REACH = false,
    RANDOM_STRENGTH = 2.0,
    ACTIVE = false,
    AUTO_CLICK = false,
    ALWAYS_ACTIVE = false,
    BACKTRACK = false,
    BACKTRACK_WINDOW = 0.5,
    PREDICTIVE = true,
    TEAM_CHECK = false,
    WALL_CHECK = false,
    HITBOX_SHAPE = "Sphere", 
    SHOW_VISUALIZER = true,
    VIS_TRANSPARENCY = 0.85,
    VIS_COLOR = "Cyan",
    ESP_ENABLED = false,
    ESP_BOX = false,
    ESP_TRACERS = false,
    ESP_NAMES = false,
    ESP_HEALTH = false,
    ESP_DISTANCE = 1000,
    GUI_VISIBLE = true,
    TOGGLE_KEY = Enum.KeyCode.Z,
    HIT_DELAY = 0.08,
    ACCENT_COLOR = Color3.fromRGB(0, 255, 255),
    ACCENT_COLOR_2 = Color3.fromRGB(0, 150, 255),
    BG_COLOR = Color3.fromRGB(15, 15, 18),
    PANIC = false,
    WHITELIST = {},
    BYPASS_READY = false,
    INITIALIZED = false,
    KEY_EXPIRY = 0,
    -- Admin System
    ADMIN_AUTO_LEAVE = false,
    ADMIN_AUTO_DISABLE = true,
    -- HUD
    HUD_ENABLED = true,
    HUD_FPS = true,
    HUD_PING = true,
    HUD_TRANSPARENCY = 0.3,
    HUD_SIZE = 1.0,
    -- GUI Button
    GUI_BTN_TRANSPARENCY = 0.35,
    GUI_BTN_SIZE = 55,
}

-- [[ STATE ]] --
local ownedObjects = {}
local dirtyDescendants = {}
local hitCooldowns = {}
local backtrackBuffer = {}
local espObjects = {}
local isSwinging = false
local currentHandle = nil
local cachedRoot = nil
local spoofedCFrame = nil
local spoofedRootCFrame = nil
local hookRegistry = {}

-- [[ UTILS ]] --
local function setClipboard(text)
    if setclipboard then
        setclipboard(text)
    elseif toclipboard then
        toclipboard(text)
    else
        print("Clipboard Fallback: " .. text)
    end
end

local function registerObject(obj)
    if not obj or ownedObjects[obj] then return end
    ownedObjects[obj] = true
    obj.Archivable = false
    
    local function add(v)
        if not ownedObjects[v] then
            ownedObjects[v] = true
            v.Archivable = false
            local p = v.Parent
            while p do
                dirtyDescendants[p] = (dirtyDescendants[p] or 0) + 1
                if p == game then break end
                p = p.Parent
            end
        end
    end

    for _, v in ipairs(obj:GetDescendants()) do add(v) end
    obj.DescendantAdded:Connect(add)

    local p = obj.Parent
    while p do
        dirtyDescendants[p] = (dirtyDescendants[p] or 0) + 1
        if p == game then break end
        p = p.Parent
    end
end

local function filterObjects(objects)
    local filtered = {}
    local n = 0
    for i = 1, #objects do
        local v = objects[i]
        if not ownedObjects[v] then
            n = n + 1
            filtered[n] = v
        end
    end
    return filtered
end

local function getPing()
    local ok, val = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    return (ok and type(val) == "number") and val or 0
end

-- [[ CONFIG SYSTEM ]] --
local function saveSettings(name)
    local filename = CONFIG_PREFIX .. (name or "Default") .. ".json"
    local data = {}
    for k, v in pairs(CONFIG) do
        if type(v) ~= "function" and type(v) ~= "userdata"
        and k ~= "BYPASS_READY" and k ~= "INITIALIZED"
        and k ~= "KEY_EXPIRY" then
            data[k] = v
        end
    end
    data.VIS_COLOR_VAL = {CONFIG.ACCENT_COLOR.R, CONFIG.ACCENT_COLOR.G, CONFIG.ACCENT_COLOR.B}
    data.VIS_COLOR_VAL2 = {CONFIG.ACCENT_COLOR_2.R, CONFIG.ACCENT_COLOR_2.G, CONFIG.ACCENT_COLOR_2.B}
    if writefile then
        writefile(filename, HttpService:JSONEncode(data))
    end
end

local function loadSettings(name)
    local filename = CONFIG_PREFIX .. (name or "Default") .. ".json"
    if readfile and isfile and isfile(filename) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(filename)) end)
        if success then
            for k, v in pairs(data) do
                if CONFIG[k] ~= nil then CONFIG[k] = v end
            end
            if data.VIS_COLOR_VAL then
                CONFIG.ACCENT_COLOR = Color3.new(unpack(data.VIS_COLOR_VAL))
            end
            if data.VIS_COLOR_VAL2 then
                CONFIG.ACCENT_COLOR_2 = Color3.new(unpack(data.VIS_COLOR_VAL2))
            end
            return true
        end
    end
    return false
end

local function getProfiles()
    local profiles = {}
    if listfiles then
        local success, files = pcall(listfiles, "")
        if success then
            for _, file in ipairs(files) do
                if file:find(CONFIG_PREFIX) and file:find(".json") then
                    local name = file:gsub(CONFIG_PREFIX, ""):gsub(".json", "")
                    table.insert(profiles, name)
                end
            end
        end
    end
    if #profiles == 0 then table.insert(profiles, "Default") end
    return profiles
end

-- [[ NOTIFICATION SYSTEM ]] --
local function notify(title, text)
    task.spawn(function()
        local UI_P = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")
        local sg = UI_P:FindFirstChild(UI_NAME) or UI_P:FindFirstChild(KEY_UI_NAME)
        if not sg then return end
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 250, 0, 70)
        frame.Position = UDim2.new(1, 10, 0, 50)
        frame.BackgroundColor3 = CONFIG.BG_COLOR
        frame.BackgroundTransparency = 0.1
        frame.BorderSizePixel = 0
        frame.Parent = sg
        Instance.new("UICorner", frame)
        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = CONFIG.ACCENT_COLOR
        stroke.Thickness = 1.5

        local t = Instance.new("TextLabel")
        t.Size = UDim2.new(1, -20, 0, 25)
        t.Position = UDim2.new(0, 10, 0, 5)
        t.Text = title
        t.TextColor3 = CONFIG.ACCENT_COLOR
        t.Font = Enum.Font.GothamBold
        t.TextSize = 14
        t.BackgroundTransparency = 1
        t.Parent = frame

        local m = Instance.new("TextLabel")
        m.Size = UDim2.new(1, -20, 0, 30)
        m.Position = UDim2.new(0, 10, 0, 30)
        m.Text = text
        m.TextColor3 = Color3.fromRGB(220, 220, 220)
        m.Font = Enum.Font.GothamMedium
        m.TextSize = 12
        m.TextWrapped = true
        m.BackgroundTransparency = 1
        m.Parent = frame

        TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -260, 0, 50)}):Play()
        task.wait(4)
        TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, 0, 50)}):Play()
        task.wait(0.5)
        frame:Destroy()
    end)
end

-- [[ KEY VALIDATION WRAPPER ]] --
local function validateKey(key)
    local res = Validate(key)
    return res.success, res.message, parseDate(res.expireDate)
end

-- [[ BYPASS SYSTEM ]] --
local function initBypasses()
    local oldIndex, oldNamecall
    local wrappedMethods = {}
    
    local function isAdonisScript()
        local s = getcallingscript and getcallingscript()
        if not s then return false end
        local n = tostring(s)
        return n:find("Adonis") or n:find("Anti") or n:find("Client") or n:find("Scanner")
    end

    local function isCombatRemote(name)
        local n = name:lower()
        return n:find("hit") or n:find("damage") or n:find("slash") or n:find("combat") or n:find("sword") or n:find("attack")
    end

    local oldDebugInfo = debug.info
    hookRegistry[debug.info] = oldDebugInfo
    hookfunction(debug.info, function(f, options)
        if not checkcaller() and type(f) == "function" then
            for h, o in pairs(hookRegistry) do
                if rawequal(f, h) then return oldDebugInfo(o, options) end
            end
        end
        return oldDebugInfo(f, options)
    end)

    local oldGetLog = LogService.GetLogHistory
    hookfunction(LogService.GetLogHistory, function(self)
        local logs = oldGetLog(self)
        if checkcaller() then return logs end
        local f = {}
        for _, v in ipairs(logs) do
            local m = v.message
            if not (m:find("MR_") or m:find("Reach") or m:find("hook") or m:find("gethui") or m:find(UI_NAME)) then
                table.insert(f, v)
            end
        end
        return f
    end)

    local originalMetatable = getrawmetatable(game)
    local oldGetRawMT = getrawmetatable
    hookRegistry[getrawmetatable] = oldGetRawMT
    hookfunction(getrawmetatable, function(obj)
        if not checkcaller() then return originalMetatable end
        return oldGetRawMT(obj)
    end)

    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if checkcaller() or CONFIG.PANIC then return oldIndex(self, key) end
        
        if ownedObjects[self] then
            if isAdonisScript() then return nil end
            if key == "Parent" then return nil end
            if key == "Enabled" or key == "Visible" then return false end
            if key == "Name" then return "BasePart" end
        end

        if self == game or self == workspace then 
            if key == "GetChildren" or key == "GetDescendants" then
                if not wrappedMethods[key] then
                    local originalMethod = oldIndex(self, key)
                    wrappedMethods[key] = function(s) return filterObjects(originalMethod(s)) end
                end
                return wrappedMethods[key]
            end
        end

        if key == "GetChildren" or key == "GetDescendants" then
            if (dirtyDescendants[self] or 0) == 0 then return oldIndex(self, key) end
            if not wrappedMethods[key] then
                local originalMethod = oldIndex(self, key)
                wrappedMethods[key] = function(s) return filterObjects(originalMethod(s)) end
            end
            return wrappedMethods[key]
        end

        if currentHandle and self == currentHandle then
            if key == "Size" then return Vector3.new(1, 0.8, 4) end
            if spoofedCFrame then
                if key == "CFrame" then return spoofedCFrame end
                if key == "Position" then return spoofedCFrame.Position end
            end
        end

        return oldIndex(self, key)
    end)

    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if checkcaller() or CONFIG.PANIC then return oldNamecall(self, ...) end
        local method = getnamecallmethod()
        local args = {...}

        if method == "FireServer" or method == "fireServer" then
            local name = tostring(self.Name)
            if name == "Kick" or name == "HFR" or name == "Adonis" or name:find("Check") or name:find("Detection") then return end
            
            -- Targeted Spoofing for Remote Support (Targeted & Mandatory)
            if isCombatRemote(name) and spoofedRootCFrame and cachedRoot then
                local modified = false
                for i, arg in ipairs(args) do
                    if typeof(arg) == "Vector3" then
                        local distToMe = (arg - cachedRoot.Position).Magnitude
                        if distToMe > 6 then
                            args[i] = spoofedRootCFrame.Position + (Vector3.new(math.random(-5,5), 0, math.random(-5,5)) * 0.1)
                            modified = true
                        end
                    elseif typeof(arg) == "CFrame" then
                        local distToMe = (arg.Position - cachedRoot.Position).Magnitude
                        if distToMe > 6 then
                            args[i] = spoofedRootCFrame
                            modified = true
                        end
                    end
                end
                if modified then return oldNamecall(self, unpack(args)) end
            end
        end
        if method == "GetChildren" or method == "GetDescendants" then
            if (dirtyDescendants[self] or 0) == 0 and self ~= game and self ~= workspace then return oldNamecall(self, ...) end
            return filterObjects(oldNamecall(self, ...))
        end
        if method == "FindFirstChild" or method == "findFirstChild" then
            if args[1] == UI_NAME or args[1] == KEY_UI_NAME or args[1] == VIS_NAME then return nil end
        end
        if self == LocalPlayer and (method == "Kick" or method == "kick") then return end
        return oldNamecall(self, ...)
    end)

    task.spawn(function()
        if getgc then
            local gc = getgc(true)
            for i = 1, #gc do
                if i % 2000 == 0 then task.wait() end
                local v = gc[i]
                if type(v) == "table" then
                    local anti = rawget(v, "Anti")
                    local funcs = rawget(v, "Functions")
                    if type(anti) == "table" and type(funcs) == "table" and rawget(v, "Remote") then
                        local targets = {"Detected", "Kill", "Crash", "Disconnect", "CheckEnv"}
                        for _, n in ipairs(targets) do
                            if type(anti[n]) == "function" and not isexecutorclosure(anti[n]) then
                                hookfunction(anti[n], function() return end)
                            end
                        end
                        local remote = rawget(v, "Remote")
                        if type(remote) == "table" and type(remote.Send) == "function" then
                            local oldSend = remote.Send
                            hookfunction(remote.Send, function(s, name, ...)
                                if name == "Detected" or name == "Detection" then return end
                                return oldSend(s, name, ...)
                            end)
                        end
                    end
                end
            end
        end
        CONFIG.BYPASS_READY = true
    end)
end

-- [[ GUI SYSTEM ]] --
local function applyGradient(obj, colors)
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(colors[1], colors[2] or colors[1])
    grad.Rotation = 45
    grad.Parent = obj
    return grad
end

local function createToggle(parent, text, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 40)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 12
    Label.BackgroundTransparency = 1
    Label.Parent = Frame

    local ToggleBG = Instance.new("TextButton")
    ToggleBG.Size = UDim2.new(0, 35, 0, 18)
    ToggleBG.Position = UDim2.new(1, -40, 0.5, -9)
    ToggleBG.BackgroundColor3 = default and CONFIG.ACCENT_COLOR or Color3.fromRGB(40, 40, 45)
    ToggleBG.Text = ""
    ToggleBG.AutoButtonColor = false
    ToggleBG.Parent = Frame
    Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 12, 0, 12)
    Dot.Position = default and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.Parent = ToggleBG
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

    local active = default
    ToggleBG.MouseButton1Click:Connect(function()
        active = not active
        TweenService:Create(ToggleBG, TweenInfo.new(0.2), {BackgroundColor3 = active and CONFIG.ACCENT_COLOR or Color3.fromRGB(40, 40, 45)}):Play()
        TweenService:Create(Dot, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = active and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)}):Play()
        callback(active)
    end)
    return function(v)
        active = v
        ToggleBG.BackgroundColor3 = active and CONFIG.ACCENT_COLOR or Color3.fromRGB(40, 40, 45)
        Dot.Position = active and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)
    end
end

local function createSlider(parent, text, min, max, default, callback, decimals)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 70)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.Text = text .. ": " .. tostring(default)
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 12
    Label.BackgroundTransparency = 1
    Label.Parent = Frame

    local ControlFrame = Instance.new("Frame")
    ControlFrame.Size = UDim2.new(1, 0, 0, 35)
    ControlFrame.Position = UDim2.new(0, 0, 0, 25)
    ControlFrame.BackgroundTransparency = 1
    ControlFrame.Parent = Frame

    local DecBtn = Instance.new("TextButton")
    DecBtn.Size = UDim2.new(0, 28, 0, 28)
    DecBtn.Position = UDim2.new(0, 0, 0.5, -14)
    DecBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    DecBtn.Text = "-"
    DecBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DecBtn.Font = Enum.Font.GothamBold
    DecBtn.Parent = ControlFrame
    Instance.new("UICorner", DecBtn)

    local IncBtn = Instance.new("TextButton")
    IncBtn.Size = UDim2.new(0, 28, 0, 28)
    IncBtn.Position = UDim2.new(1, -28, 0.5, -14)
    IncBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    IncBtn.Text = "+"
    IncBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    IncBtn.Font = Enum.Font.GothamBold
    IncBtn.Parent = ControlFrame
    Instance.new("UICorner", IncBtn)

    local SliderBG = Instance.new("Frame")
    SliderBG.Size = UDim2.new(1, -75, 0, 6)
    SliderBG.Position = UDim2.new(0, 37, 0.5, -3)
    SliderBG.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    SliderBG.Parent = ControlFrame
    Instance.new("UICorner", SliderBG)

    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = CONFIG.ACCENT_COLOR
    SliderFill.Parent = SliderBG
    Instance.new("UICorner", SliderFill)
    applyGradient(SliderFill, {CONFIG.ACCENT_COLOR, CONFIG.ACCENT_COLOR_2})

    local currentVal = default
    local precision = decimals or 0
    local step = 1 / (10^precision)
    
    local function setVal(v)
        currentVal = math.clamp(v, min, max)
        currentVal = math.floor(currentVal * (10^precision) + 0.5) / (10^precision)
        Label.Text = text .. ": " .. tostring(currentVal)
        SliderFill.Size = UDim2.new((currentVal - min) / (max - min), 0, 1, 0)
        callback(currentVal)
    end

    local dragging = false
    local function updateFromMouse()
        local pos = math.clamp((UserInputService:GetMouseLocation().X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
        local rawVal = min + (max - min) * pos
        setVal(rawVal)
    end

    SliderBG.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true updateFromMouse() end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
    UserInputService.InputChanged:Connect(function(input) if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then updateFromMouse() end end)

    DecBtn.MouseButton1Click:Connect(function() setVal(currentVal - step) end)
    IncBtn.MouseButton1Click:Connect(function() setVal(currentVal + step) end)
    
    return function(v) setVal(v) end
end

local OverlayFrame = nil
local activeDropdownCloseFunc = nil

local function closeActiveDropdown()
    if activeDropdownCloseFunc then
        activeDropdownCloseFunc()
        activeDropdownCloseFunc = nil
    end
end

local function createDropDown(parent, text, options, default, callback, isWhitelist)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 60)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 18)
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(180, 180, 180)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.Parent = Frame

    local MainBtn = Instance.new("TextButton")
    MainBtn.Size = UDim2.new(1, 0, 0, 32)
    MainBtn.Position = UDim2.new(0, 0, 0, 22)
    MainBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    MainBtn.Text = isWhitelist and "  Select Players" or "  " .. tostring(default)
    MainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainBtn.Font = Enum.Font.GothamBold
    MainBtn.TextSize = 12
    MainBtn.TextXAlignment = Enum.TextXAlignment.Left
    MainBtn.AutoButtonColor = false
    MainBtn.Parent = Frame
    Instance.new("UICorner", MainBtn)
    
    local btnStroke = Instance.new("UIStroke", MainBtn)
    btnStroke.Color = Color3.fromRGB(50, 50, 55)
    btnStroke.Thickness = 1
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 20, 0, 20)
    Arrow.Position = UDim2.new(1, -25, 0.5, -10)
    Arrow.Text = "▼"
    Arrow.TextColor3 = Color3.fromRGB(200, 200, 200)
    Arrow.Font = Enum.Font.GothamBold
    Arrow.TextSize = 10
    Arrow.BackgroundTransparency = 1
    Arrow.Parent = MainBtn

    local DropFrame = Instance.new("ScrollingFrame")
    DropFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    DropFrame.BorderSizePixel = 0
    DropFrame.Visible = false
    DropFrame.ScrollBarThickness = 2
    DropFrame.ScrollBarImageColor3 = CONFIG.ACCENT_COLOR
    DropFrame.ZIndex = 2000
    DropFrame.Parent = OverlayFrame
    Instance.new("UICorner", DropFrame)
    Instance.new("UIListLayout", DropFrame)

    local dropStroke = Instance.new("UIStroke", DropFrame)
    dropStroke.Color = CONFIG.ACCENT_COLOR
    dropStroke.Thickness = 1.2
    dropStroke.Transparency = 0.5

    local open = false
    local function internalClose()
        open = false
        TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(50, 50, 55)}):Play()
        local t = TweenService:Create(DropFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, MainBtn.AbsoluteSize.X, 0, 0)})
        t:Play()
        local conn; conn = t.Completed:Connect(function() DropFrame.Visible = false conn:Disconnect() end)
        if activeDropdownCloseFunc == internalClose then activeDropdownCloseFunc = nil end
    end

    MainBtn.MouseEnter:Connect(function() TweenService:Create(MainBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 40)}):Play() end)
    MainBtn.MouseLeave:Connect(function() TweenService:Create(MainBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play() end)

    MainBtn.MouseButton1Click:Connect(function()
        if open then
            internalClose()
        else
            closeActiveDropdown()
            local currentOptions = (type(options) == "function") and options() or options
            for _, v in ipairs(DropFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
            
            for _, val in ipairs(currentOptions) do
                local name = tostring(val)
                local whitelisted = false
                if isWhitelist then
                    for _, w in ipairs(CONFIG.WHITELIST) do if w == name then whitelisted = true break end end
                end

                local isSelected = not isWhitelist and ("  " .. name) == MainBtn.Text
                local b = Instance.new("TextButton")
                b.Size = UDim2.new(1, 0, 0, 30)
                b.BackgroundColor3 = (isSelected or whitelisted) and CONFIG.ACCENT_COLOR or Color3.fromRGB(30, 30, 35)
                b.BackgroundTransparency = (isSelected or whitelisted) and 0.8 or 1
                b.Text = "    " .. (whitelisted and "[W] " or "") .. name
                b.TextColor3 = (isSelected or whitelisted) and CONFIG.ACCENT_COLOR or Color3.fromRGB(200, 200, 200)
                b.Font = (isSelected or whitelisted) and Enum.Font.GothamBold or Enum.Font.GothamMedium
                b.TextSize = 11
                b.TextXAlignment = Enum.TextXAlignment.Left
                b.ZIndex = 2001
                b.Parent = DropFrame
                
                b.MouseEnter:Connect(function() if not (isSelected or whitelisted) then b.BackgroundTransparency = 0.5 end end)
                b.MouseLeave:Connect(function() if not (isSelected or whitelisted) then b.BackgroundTransparency = 1 end end)
                
                b.MouseButton1Click:Connect(function()
                    if isWhitelist then
                        local foundIdx = nil
                        for i, w in ipairs(CONFIG.WHITELIST) do if w == name then foundIdx = i break end end
                        if foundIdx then table.remove(CONFIG.WHITELIST, foundIdx) else table.insert(CONFIG.WHITELIST, name) end
                        
                        whitelisted = not whitelisted
                        b.BackgroundColor3 = whitelisted and CONFIG.ACCENT_COLOR or Color3.fromRGB(30, 30, 35)
                        b.BackgroundTransparency = whitelisted and 0.8 or 1
                        b.Text = "    " .. (whitelisted and "[W] " or "") .. name
                        b.TextColor3 = whitelisted and CONFIG.ACCENT_COLOR or Color3.fromRGB(200, 200, 200)
                        b.Font = whitelisted and Enum.Font.GothamBold or Enum.Font.GothamMedium
                    else
                        MainBtn.Text = "  " .. name
                        callback(val)
                        internalClose()
                    end
                end)
            end
            
            DropFrame.Size = UDim2.new(0, MainBtn.AbsoluteSize.X, 0, 0)
            DropFrame.Position = UDim2.new(0, MainBtn.AbsolutePosition.X, 0, MainBtn.AbsolutePosition.Y + MainBtn.AbsoluteSize.Y + 5)
            DropFrame.Visible = true
            local targetHeight = math.min(#currentOptions * 30, 100)
            DropFrame.CanvasSize = UDim2.new(0, 0, 0, #currentOptions * 30)
            
            TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 180}):Play()
            TweenService:Create(btnStroke, TweenInfo.new(0.2), {Color = CONFIG.ACCENT_COLOR}):Play()
            TweenService:Create(DropFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, MainBtn.AbsoluteSize.X, 0, targetHeight)}):Play()
            activeDropdownCloseFunc = internalClose
            open = true
        end
    end)
    return function(v) MainBtn.Text = "  " .. tostring(v) end
end

local function createButton(parent, text, callback, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 35)
    b.BackgroundColor3 = color or Color3.fromRGB(35, 35, 40)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(220, 220, 220)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.Parent = parent
    Instance.new("UICorner", b)
    
    local stroke = Instance.new("UIStroke", b)
    stroke.Color = Color3.fromRGB(50, 50, 55)
    
    b.MouseButton1Click:Connect(callback)
    return b
end

local function formatTime(seconds)
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    return string.format("%02d:%02d:%02d", h, m, s)
end

local function createKeyGui(onSuccess)
    local UI_P = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")
    local sg = Instance.new("ScreenGui")
    sg.Name = KEY_UI_NAME
    sg.Parent = UI_P
    registerObject(sg)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 350, 0, 300)
    Frame.Position = UDim2.new(0.5, -175, 0.5, -153)
    Frame.BackgroundColor3 = CONFIG.BG_COLOR
    Frame.BackgroundTransparency = 0.1
    Frame.Parent = sg
    Instance.new("UICorner", Frame)
    local stroke = Instance.new("UIStroke", Frame)
    stroke.Color = CONFIG.ACCENT_COLOR
    stroke.Thickness = 2
    applyGradient(Frame, {CONFIG.BG_COLOR, Color3.fromRGB(10, 10, 15)})

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "MEGA REACH - KEY SYSTEM"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.BackgroundTransparency = 1
    Title.Parent = Frame
    applyGradient(Title, {CONFIG.ACCENT_COLOR, CONFIG.ACCENT_COLOR_2})

    local KeyBox = Instance.new("TextBox")
    KeyBox.Size = UDim2.new(0.9, 0, 0, 40)
    KeyBox.Position = UDim2.new(0.05, 0, 0.25, 0)
    KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    KeyBox.PlaceholderText = "Enter your key here..."
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.Font = Enum.Font.GothamBold
    KeyBox.TextSize = 12
    KeyBox.Parent = Frame
    Instance.new("UICorner", KeyBox)

    local GetBtn = Instance.new("TextButton")
    GetBtn.Size = UDim2.new(0.44, 0, 0, 40)
    GetBtn.Position = UDim2.new(0.05, 0, 0.45, 0)
    GetBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    GetBtn.Text = "Get Key"
    GetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetBtn.Font = Enum.Font.GothamBold
    GetBtn.TextSize = 12
    GetBtn.Parent = Frame
    Instance.new("UICorner", GetBtn)

    local HWIDBtn = Instance.new("TextButton")
    HWIDBtn.Size = UDim2.new(0.44, 0, 0, 40)
    HWIDBtn.Position = UDim2.new(0.51, 0, 0.45, 0)
    HWIDBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    HWIDBtn.Text = "Copy HWID"
    HWIDBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    HWIDBtn.Font = Enum.Font.GothamBold
    HWIDBtn.TextSize = 12
    HWIDBtn.Parent = Frame
    Instance.new("UICorner", HWIDBtn)

    local CheckBtn = Instance.new("TextButton")
    CheckBtn.Size = UDim2.new(0.9, 0, 0, 40)
    CheckBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
    CheckBtn.BackgroundColor3 = CONFIG.ACCENT_COLOR
    CheckBtn.Text = "Check Key"
    CheckBtn.TextColor3 = Color3.fromRGB(15, 15, 18)
    CheckBtn.Font = Enum.Font.GothamBold
    CheckBtn.TextSize = 12
    CheckBtn.Parent = Frame
    Instance.new("UICorner", CheckBtn)

    local DiscordBtn = Instance.new("TextButton")
    DiscordBtn.Size = UDim2.new(0.9, 0, 0, 30)
    DiscordBtn.Position = UDim2.new(0.05, 0, 0.85, 0)
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordBtn.Text = "Join Discord"
    DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.TextSize = 11
    DiscordBtn.Parent = Frame
    Instance.new("UICorner", DiscordBtn)

    DiscordBtn.MouseButton1Click:Connect(function()
        setClipboard("https://discord.gg/stCykCbPNP")
        notify("DISCORD", "Discord link copied to clipboard!")
    end)
    applyGradient(CheckBtn, {CONFIG.ACCENT_COLOR, CONFIG.ACCENT_COLOR_2})

    local hwid = getHWID()

    GetBtn.MouseButton1Click:Connect(function()
        local link = GetKeyURL()
        setClipboard(link)
        notify("KEY SYSTEM", "Link copied to clipboard!")
    end)

    HWIDBtn.MouseButton1Click:Connect(function()
        setClipboard(hwid)
        notify("KEY SYSTEM", "HWID copied to clipboard!")
    end)

    CheckBtn.MouseButton1Click:Connect(function()
        local key = KeyBox.Text
        if key == "" then notify("ERROR", "Please enter a key!") return end
        
        CheckBtn.Text = "Validating..."
        task.spawn(function()
            local success, reason, expiry = validateKey(key)
            
            if success then
                logExecution()
                CONFIG.KEY_EXPIRY = expiry
                if writefile then pcall(function() writefile("MegaReach_Key.txt", key) end) end
                notify("SUCCESS", "Key is valid! Loading...")
                task.wait(1.5)
                sg:Destroy()

                onSuccess()
            else
                local shortReason = reason:sub(1, 30)
                notify("ERROR", "Invalid key: " .. shortReason)
                CheckBtn.Text = "Check Key"
            end
        end)
    end)

end

local function createGui()
    local UI_P = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = UI_NAME
    ScreenGui.ResetOnSpawn = false
    ScreenGui.DisplayOrder = 100
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = UI_P
    registerObject(ScreenGui)

    OverlayFrame = Instance.new("Frame")
    OverlayFrame.Size = UDim2.new(1, 0, 1, 0)
    OverlayFrame.BackgroundTransparency = 1
    OverlayFrame.ZIndex = 2000
    OverlayFrame.Parent = ScreenGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 440, 0, 320)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.BackgroundColor3 = CONFIG.BG_COLOR
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true 
    MainFrame.Visible = false
    MainFrame.Parent = ScreenGui
    Instance.new("UICorner", MainFrame)
    local UIStroke = Instance.new("UIStroke", MainFrame)
    UIStroke.Color = CONFIG.ACCENT_COLOR
    UIStroke.Thickness = 2.2
    applyGradient(MainFrame, {CONFIG.BG_COLOR, Color3.fromRGB(10, 10, 15)})

    -- Sidebar container
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 120, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    Sidebar.BackgroundTransparency = 0.15
    Sidebar.ClipsDescendants = true
    Sidebar.Parent = MainFrame
    Instance.new("UICorner", Sidebar)

    -- Sidebar pinned header (title + version + expiry)
    local SidebarHeader = Instance.new("Frame")
    SidebarHeader.Size = UDim2.new(1, 0, 0, 72)
    SidebarHeader.Position = UDim2.new(0, 0, 0, 0)
    SidebarHeader.BackgroundTransparency = 1
    SidebarHeader.Parent = Sidebar

    -- Sidebar Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.Position = UDim2.new(0, 0, 0, 8)
    Title.Text = "MEGA REACH"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.BackgroundTransparency = 1
    Title.Parent = SidebarHeader
    applyGradient(Title, {CONFIG.ACCENT_COLOR, CONFIG.ACCENT_COLOR_2})

    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Size = UDim2.new(1, 0, 0, 14)
    VersionLabel.Position = UDim2.new(0, 0, 0, 36)
    VersionLabel.Text = "v" .. CONFIG.VERSION
    VersionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    VersionLabel.Font = Enum.Font.GothamMedium
    VersionLabel.TextSize = 10
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Parent = SidebarHeader

    local TimeLeftLabel = Instance.new("TextLabel")
    TimeLeftLabel.Size = UDim2.new(1, 0, 0, 14)
    TimeLeftLabel.Position = UDim2.new(0, 0, 0, 52)
    TimeLeftLabel.Text = "Time: --:--:--"
    TimeLeftLabel.TextColor3 = CONFIG.ACCENT_COLOR
    TimeLeftLabel.Font = Enum.Font.GothamMedium
    TimeLeftLabel.TextSize = 10
    TimeLeftLabel.BackgroundTransparency = 1
    TimeLeftLabel.Parent = SidebarHeader

    -- Thin divider under header
    local SidebarDivider = Instance.new("Frame")
    SidebarDivider.Size = UDim2.new(0.85, 0, 0, 1)
    SidebarDivider.Position = UDim2.new(0.075, 0, 0, 72)
    SidebarDivider.BackgroundColor3 = CONFIG.ACCENT_COLOR
    SidebarDivider.BackgroundTransparency = 0.6
    SidebarDivider.BorderSizePixel = 0
    SidebarDivider.Parent = Sidebar

    -- Scrollable tab button area
    local SidebarScroll = Instance.new("ScrollingFrame")
    SidebarScroll.Size = UDim2.new(1, 0, 1, -78)
    SidebarScroll.Position = UDim2.new(0, 0, 0, 78)
    SidebarScroll.BackgroundTransparency = 1
    SidebarScroll.ScrollBarThickness = 2
    SidebarScroll.ScrollBarImageColor3 = CONFIG.ACCENT_COLOR
    SidebarScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    SidebarScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    SidebarScroll.BorderSizePixel = 0
    SidebarScroll.Parent = Sidebar

    local SidebarList = Instance.new("UIListLayout", SidebarScroll)
    SidebarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SidebarList.Padding = UDim.new(0, 5)
    SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
    Instance.new("UIPadding", SidebarScroll).PaddingTop = UDim.new(0, 6)

    SidebarList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        SidebarScroll.CanvasSize = UDim2.new(0, 0, 0, SidebarList.AbsoluteContentSize.Y + 12)
    end)

    task.spawn(function()
        while task.wait(1) do
            if CONFIG.KEY_EXPIRY <= 0 then
                TimeLeftLabel.Text = "Time: --:--:--"
            else
                local left = CONFIG.KEY_EXPIRY - os.time()
                if left <= 0 then
                    TimeLeftLabel.Text = "Key Expired!"
                    TimeLeftLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                    task.wait(2)
                    CONFIG.PANIC = true
                    ScreenGui:Destroy()
                    break
                end
                local h = math.floor(left / 3600)
                local m = math.floor((left % 3600) / 60)
                local s = math.floor(left % 60)
                TimeLeftLabel.Text = string.format("Time: %02d:%02d:%02d", h, m, s)
            end
        end
    end)

    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -135, 1, -20)
    Container.Position = UDim2.new(0, 125, 0, 10)
    Container.BackgroundTransparency = 1
    Container.Parent = MainFrame

    local tabs = {}
    local tabButtons = {}
    local setters = {}

    local function createTabFrame(name)
        local f = Instance.new("ScrollingFrame")
        f.Size = UDim2.new(1, 0, 1, 0)
        f.BackgroundTransparency = 1
        f.Visible = false
        f.ScrollBarThickness = 2
        f.ScrollBarImageColor3 = CONFIG.ACCENT_COLOR
        f.ClipsDescendants = true 
        f.Parent = Container
        local layout = Instance.new("UIListLayout", f)
        layout.Padding = UDim.new(0, 12)
        
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            f.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
        end)

        tabs[name] = f
        
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9, 0, 0, 34) 
        b.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        b.Text = name
        b.TextColor3 = Color3.fromRGB(180, 180, 180)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 11
        b.Parent = SidebarScroll
        Instance.new("UICorner", b)
        
        local btnStroke = Instance.new("UIStroke", b)
        btnStroke.Color = Color3.fromRGB(45, 45, 50)
        
        local textGrad = applyGradient(b, {CONFIG.ACCENT_COLOR, CONFIG.ACCENT_COLOR_2})
        textGrad.Enabled = false

        b.MouseButton1Click:Connect(function()
            closeActiveDropdown()
            for n, t in pairs(tabs) do t.Visible = false end
            for _, btn in pairs(tabButtons) do 
                btn.TextColor3 = Color3.fromRGB(180, 180, 180)
                btn:FindFirstChildOfClass("UIGradient").Enabled = false
                btn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(45, 45, 50)
            end
            f.Visible = true
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            textGrad.Enabled = true
            btnStroke.Color = CONFIG.ACCENT_COLOR
        end)
        tabButtons[name] = b
        return f
    end

    local mainT = createTabFrame("Main")
    local visT = createTabFrame("Visuals")
    local espT = createTabFrame("ESP")
    local miscT = createTabFrame("Misc")
    local cfgT = createTabFrame("Config")
    local settingsT = createTabFrame("Settings")

    
    
    local changelogT = createTabFrame("Changelog")
    local function addLog(text, isHeader)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, -20, 0, isHeader and 30 or 20)
        l.BackgroundTransparency = 1
        l.Text = text
        l.TextColor3 = isHeader and CONFIG.ACCENT_COLOR or Color3.fromRGB(200, 200, 200)
        l.Font = isHeader and Enum.Font.GothamBold or Enum.Font.Gotham
        l.TextSize = isHeader and 14 or 12
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = changelogT
    end

    addLog("v1.0.0 – Initial Release", true)
    addLog("  Core reach, hitbox shapes, key system, ESP")

    addLog("v1.1.0 – Patch", true)
    addLog("  Mobile Sword Fight bypass, Sector solid fill, Extreme overhaul")

    addLog("v1.2.0 – Settings Update", true)
    addLog("  Settings tab: Admin System, HUD, GUI Button subjects")

    addLog("v1.3.0 – UI Polish", true)
    addLog("  Sidebar is now scrollable (all tabs always reachable)")
    addLog("  GUI Button sliders now work correctly (upvalue fix)")
    addLog("  HUD Size & Transparency sliders added")

    addLog("v1.3.3 – Bypass Update", true)
    addLog("  Added steal time from others bypass")

    addLog("v1.3.4 – Bypass Update", true)
    addLog("  Custom Duels Bypass Added")
    addLog("")
    addLog("v1.3.8 – Improvements", true)
    addLog("  Bug fixes and stability improvements")
    addLog("  General performance improvements")
    addLog("  Additional bypass compatibility")

    
    tabs["Main"].Visible = true
    tabButtons["Main"].TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButtons["Main"]:FindFirstChildOfClass("UIGradient").Enabled = true
    tabButtons["Main"]:FindFirstChildOfClass("UIStroke").Color = CONFIG.ACCENT_COLOR

    -- Content: Main
    setters.ACTIVE = createToggle(mainT, "Enable Reach", CONFIG.ACTIVE, function(v) CONFIG.ACTIVE = v end)
    setters.COMBAT_PROFILE = createDropDown(mainT, "Combat Mode:", {"Legit", "Standard", "Extreme", "Deadly"}, CONFIG.COMBAT_PROFILE, function(v) CONFIG.COMBAT_PROFILE = v end)
    setters.RANDOM_REACH = createToggle(mainT, "Randomize Reach", CONFIG.RANDOM_REACH, function(v) CONFIG.RANDOM_REACH = v end)
    setters.BACKTRACK = createToggle(mainT, "Backtrack (Beta)", CONFIG.BACKTRACK, function(v) CONFIG.BACKTRACK = v end)
    setters.PREDICTIVE = createToggle(mainT, "Predictive Aim", CONFIG.PREDICTIVE, function(v) CONFIG.PREDICTIVE = v end)
    setters.TEAM_CHECK = createToggle(mainT, "Team Check", CONFIG.TEAM_CHECK, function(v) CONFIG.TEAM_CHECK = v end)
    setters.WALL_CHECK = createToggle(mainT, "Wall Check", CONFIG.WALL_CHECK, function(v) CONFIG.WALL_CHECK = v end)
    setters.AUTO_CLICK = createToggle(mainT, "Auto Clicker", CONFIG.AUTO_CLICK, function(v) CONFIG.AUTO_CLICK = v end)
    setters.REACH_DISTANCE = createSlider(mainT, "Reach Studs", 5, 1000, CONFIG.REACH_DISTANCE, function(v) CONFIG.REACH_DISTANCE = v end)
    setters.RANDOM_STRENGTH = createSlider(mainT, "Random Strength", 0.1, 10.0, CONFIG.RANDOM_STRENGTH, function(v) CONFIG.RANDOM_STRENGTH = v end, 1)
    setters.BACKTRACK_WINDOW = createSlider(mainT, "Backtrack Window", 0.1, 1.0, CONFIG.BACKTRACK_WINDOW, function(v) CONFIG.BACKTRACK_WINDOW = v end, 1)
    setters.HITBOX_SHAPE = createDropDown(mainT, "Hitbox Shape:", {"Sphere", "Square", "Line", "Sector"}, CONFIG.HITBOX_SHAPE, function(v) CONFIG.HITBOX_SHAPE = v end)

    -- Content: ESP
    setters.ESP_ENABLED = createToggle(espT, "Enable ESP Master", CONFIG.ESP_ENABLED, function(v) CONFIG.ESP_ENABLED = v end)
    setters.ESP_BOX = createToggle(espT, "Box ESP (High Quality)", CONFIG.ESP_BOX, function(v) CONFIG.ESP_BOX = v end)
    setters.ESP_NAMES = createToggle(espT, "Show Names", CONFIG.ESP_NAMES, function(v) CONFIG.ESP_NAMES = v end)
    setters.ESP_HEALTH = createToggle(espT, "Show Health Bars", CONFIG.ESP_HEALTH, function(v) CONFIG.ESP_HEALTH = v end)
    setters.ESP_TRACERS = createToggle(espT, "Show Tracers", CONFIG.ESP_TRACERS, function(v) CONFIG.ESP_TRACERS = v end)
    setters.ESP_DISTANCE = createSlider(espT, "ESP Max Distance", 100, 5000, CONFIG.ESP_DISTANCE, function(v) CONFIG.ESP_DISTANCE = v end)

    -- Content: Visuals
    setters.SHOW_VISUALIZER = createToggle(visT, "Show Visualizer", CONFIG.SHOW_VISUALIZER, function(v) CONFIG.SHOW_VISUALIZER = v end)
    setters.VIS_TRANSPARENCY = createSlider(visT, "Transparency", 0, 100, CONFIG.VIS_TRANSPARENCY * 100, function(v) CONFIG.VIS_TRANSPARENCY = v/100 end)

    -- Content: Misc
    createDropDown(miscT, "Whitelist Players (Toggle):", function()
        local p = {}
        for _, v in ipairs(Players:GetPlayers()) do if v ~= LocalPlayer then table.insert(p, v.Name) end end
        return p
    end, nil, nil, true)

    -- Collect themed elements so applyTheme can reach them all
    local themedStrokes   = {}  -- UIStroke instances to set .Color
    local themedGradients = {}  -- UIGradient instances to set .Color (ColorSequence)
    local themedTexts     = {}  -- TextLabel/TextButton instances to set .TextColor3

    local function trackStroke(s)   if s then themedStrokes[#themedStrokes+1]   = s end end
    local function trackGradient(g) if g then themedGradients[#themedGradients+1] = g end end
    local function trackText(t)     if t then themedTexts[#themedTexts+1]       = t end end

    -- Register existing themed elements
    trackStroke(UIStroke)
    trackGradient(Title:FindFirstChildOfClass("UIGradient"))

    local function applyTheme()
        local c1, c2 = CONFIG.ACCENT_COLOR, CONFIG.ACCENT_COLOR_2
        local seq = ColorSequence.new(c1, c2)

        -- Core frame strokes + gradients
        for _, s in ipairs(themedStrokes)   do pcall(function() s.Color = c1 end) end
        for _, g in ipairs(themedGradients) do pcall(function() g.Color = seq end) end
        for _, t in ipairs(themedTexts)     do pcall(function() t.TextColor3 = c1 end) end

        -- Sidebar
        if TimeLeftLabel  then TimeLeftLabel.TextColor3  = c1 end
        if SidebarDivider then SidebarDivider.BackgroundColor3 = c1 end
        if SidebarScroll  then SidebarScroll.ScrollBarImageColor3 = c1 end

        -- Tab buttons
        for _, btn in pairs(tabButtons) do
            local bs = btn:FindFirstChildOfClass("UIStroke")
            if bs and bs.Color ~= Color3.fromRGB(45, 45, 50) then bs.Color = c1 end
            local bg = btn:FindFirstChildOfClass("UIGradient")
            if bg then bg.Color = seq end
        end

        -- MobileBtn
        if MobileBtn then
            MobileBtn.TextColor3 = c1
            local ms = MobileBtn:FindFirstChildOfClass("UIStroke")
            if ms then ms.Color = c1 end
        end

        -- HUD
        if hudGui then
            local hbg = hudGui:FindFirstChild("HUDBg")
            if hbg then
                local hs = hbg:FindFirstChildOfClass("UIStroke")
                if hs then hs.Color = c1 end
                if hudFpsLabel then hudFpsLabel.TextColor3 = c1 end
                -- ping label stays white/green/red dynamically
            end
        end

        -- All UIStroke instances in OverlayFrame (dropdowns)
        if OverlayFrame then
            for _, child in ipairs(OverlayFrame:GetChildren()) do
                local ds = child:FindFirstChildOfClass("UIStroke")
                if ds then ds.Color = c1 end
                local dsc = child:FindFirstChild("ScrollBarImageColor3")
                pcall(function() child.ScrollBarImageColor3 = c1 end)
            end
        end

        -- Scan ALL tab content for accent-colored UIStroke + slider fills + section label strokes
        for _, tabFrame in pairs(tabs) do
            for _, child in ipairs(tabFrame:GetDescendants()) do
                pcall(function()
                    if child:IsA("UIStroke") then
                        -- Only re-color strokes that were accent-colored (skip neutral gray ones)
                        local col = child.Color
                        local isGray = (col.R < 0.3 and col.G < 0.3 and col.B < 0.3)
                        if not isGray then child.Color = c1 end
                    elseif child:IsA("UIGradient") and child.Parent and (child.Parent:IsA("Frame") or child.Parent:IsA("TextButton")) then
                        -- Slider fills and button gradients
                        local parent = child.Parent
                        local bg2 = parent.BackgroundColor3
                        local isDark = (bg2.R < 0.2 and bg2.G < 0.2 and bg2.B < 0.2)
                        if not isDark then child.Color = seq end
                    elseif child:IsA("TextLabel") then
                        -- Section label texts (accent-colored)
                        local col = child.TextColor3
                        local isWhiteOrGray = (col.R > 0.7 and col.G > 0.7 and col.B > 0.7)
                            or (col.R < 0.1 and col.G < 0.1 and col.B < 0.1)
                        if not isWhiteOrGray then child.TextColor3 = c1 end
                    end
                end)
            end
        end

        -- Visualizer parts instant flush
        if visPart and visPart.Parent then visPart.Color = c1 end
        for _, sp in ipairs(sectorParts) do pcall(function() sp.Color = c1 end) end
    end

    setters.VIS_COLOR = createDropDown(miscT, "Theme Selection:", {"Cyan", "Crimson", "Purple", "Lime", "Gold"}, CONFIG.VIS_COLOR, function(v)
        local themes = {
            Cyan    = {Color3.fromRGB(0, 255, 255),   Color3.fromRGB(0, 150, 255)},
            Crimson = {Color3.fromRGB(255, 50, 50),    Color3.fromRGB(150, 0, 0)},
            Purple  = {Color3.fromRGB(180, 50, 255),   Color3.fromRGB(100, 0, 150)},
            Lime    = {Color3.fromRGB(50, 255, 50),    Color3.fromRGB(0, 150, 0)},
            Gold    = {Color3.fromRGB(255, 200, 0),    Color3.fromRGB(150, 100, 0)},
        }
        local c = themes[v] or themes.Cyan
        CONFIG.VIS_COLOR    = v
        CONFIG.ACCENT_COLOR = c[1]
        CONFIG.ACCENT_COLOR_2 = c[2]
        applyTheme()
    end)

    createButton(miscT, "Rejoin Server", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
    createButton(miscT, "Server Hop", function()
        local servers = {}
        local success, res = pcall(function() return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")) end)
        if success then
            for _, v in pairs(res.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then table.insert(servers, v.id) end
            end
        end
        if #servers > 0 then TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)]) else notify("HOP", "No servers found.") end
    end)

    local panicBtn = createButton(miscT, "PANIC (F4)", function() CONFIG.PANIC = true clearSectorParts() ScreenGui:Destroy() end, Color3.fromRGB(120, 30, 30))
    applyGradient(panicBtn, {Color3.fromRGB(150, 40, 40), Color3.fromRGB(80, 20, 20)})

    -- Content: Config
    local profileName = "Enter name"
    local selectedToLoad = "Default"

    local saveFrame = Instance.new("Frame")
    saveFrame.Size = UDim2.new(1, -10, 0, 35)
    saveFrame.BackgroundTransparency = 1
    saveFrame.Parent = cfgT

    local nameBox = Instance.new("TextBox")
    nameBox.Size = UDim2.new(0.6, -5, 1, 0)
    nameBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    nameBox.Text = profileName
    nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameBox.Font = Enum.Font.GothamBold
    nameBox.TextSize = 11
    nameBox.Parent = saveFrame
    Instance.new("UICorner", nameBox)
    nameBox.FocusLost:Connect(function() profileName = nameBox.Text end)

    local saveBtn = createButton(saveFrame, "Save", function()
        saveSettings(profileName)
        notify("CONFIG", "Saved: " .. profileName)
    end, CONFIG.ACCENT_COLOR)
    saveBtn.Size = UDim2.new(0.4, 0, 1, 0)
    saveBtn.Position = UDim2.new(0.6, 5, 0, 0)
    
    local loadDrop = createDropDown(cfgT, "Select Profile:", getProfiles, "Default", function(v)
        selectedToLoad = v
    end)
    
    createButton(cfgT, "Load Selected", function()
        if loadSettings(selectedToLoad) then
            for k, func in pairs(setters) do if type(func) == "function" then func(CONFIG[k]) end end
            notify("CONFIG", "Loaded: " .. selectedToLoad)
        else
            notify("CONFIG", "Failed to load: " .. selectedToLoad)
        end
    end)

    createButton(cfgT, "Delete Selected", function()
        local filename = CONFIG_PREFIX .. selectedToLoad .. ".json"
        if isfile and isfile(filename) then
            delfile(filename)
            notify("CONFIG", "Deleted: " .. selectedToLoad)
        end
    end, Color3.fromRGB(80, 40, 40))

    -- Content: Settings
    local MobileBtn  -- upvalue declared early so Settings sliders can reference it
    local function createSectionLabel(parent, text)
        local sep = Instance.new("Frame")
        sep.Size = UDim2.new(1, -10, 0, 28)
        sep.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
        sep.BorderSizePixel = 0
        sep.Parent = parent
        Instance.new("UICorner", sep).CornerRadius = UDim.new(0, 5)
        local stroke = Instance.new("UIStroke", sep)
        stroke.Color = CONFIG.ACCENT_COLOR
        stroke.Thickness = 1
        stroke.Transparency = 0.5
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -10, 1, 0)
        lbl.Position = UDim2.new(0, 8, 0, 0)
        lbl.Text = "── " .. text .. " ──"
        lbl.TextColor3 = CONFIG.ACCENT_COLOR
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 11
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.BackgroundTransparency = 1
        lbl.Parent = sep
        return sep, stroke, lbl
    end

    -- ── Admin System ──
    createSectionLabel(settingsT, "Admin System")
    createToggle(settingsT, "Auto-Disable Reach on Admin Join", CONFIG.ADMIN_AUTO_DISABLE, function(v)
        CONFIG.ADMIN_AUTO_DISABLE = v
    end)
    createToggle(settingsT, "Auto-Leave on Admin Join", CONFIG.ADMIN_AUTO_LEAVE, function(v)
        CONFIG.ADMIN_AUTO_LEAVE = v
    end)

    -- ── HUD ──
    createSectionLabel(settingsT, "HUD")
    createToggle(settingsT, "Show HUD", CONFIG.HUD_ENABLED, function(v)
        CONFIG.HUD_ENABLED = v
        if hudGui then
            local bg = hudGui:FindFirstChild("HUDBg")
            if bg then bg.Visible = v end
        end
    end)
    createToggle(settingsT, "Show FPS", CONFIG.HUD_FPS, function(v)
        CONFIG.HUD_FPS = v
        if hudFpsLabel then hudFpsLabel.Visible = v end
    end)
    createToggle(settingsT, "Show Ping", CONFIG.HUD_PING, function(v)
        CONFIG.HUD_PING = v
        if hudPingLabel then hudPingLabel.Visible = v end
    end)
    createSlider(settingsT, "HUD Transparency", 0, 100, CONFIG.HUD_TRANSPARENCY * 100, function(v)
        CONFIG.HUD_TRANSPARENCY = v / 100
        if hudGui then
            local bg = hudGui:FindFirstChild("HUDBg")
            if bg then
                bg.BackgroundTransparency = CONFIG.HUD_TRANSPARENCY
                local hs = bg:FindFirstChildOfClass("UIStroke")
                if hs then hs.Transparency = CONFIG.HUD_TRANSPARENCY * 0.5 end
                local textT = math.min(CONFIG.HUD_TRANSPARENCY * 0.9, 0.85)
                if hudFpsLabel  then hudFpsLabel.TextTransparency  = textT end
                if hudPingLabel then hudPingLabel.TextTransparency = textT end
            end
        end
    end)
    createSlider(settingsT, "HUD Size", 50, 200, CONFIG.HUD_SIZE * 100, function(v)
        CONFIG.HUD_SIZE = v / 100
        if hudGui then
            local bg = hudGui:FindFirstChild("HUDBg")
            if bg then
                local w  = math.floor(90  * CONFIG.HUD_SIZE)
                local h  = math.floor(44  * CONFIG.HUD_SIZE)
                local lh = math.floor(20  * CONFIG.HUD_SIZE)
                local fs = math.clamp(math.floor(12 * CONFIG.HUD_SIZE), 8, 22)
                bg.Size = UDim2.new(0, w, 0, h)
                if hudFpsLabel then
                    hudFpsLabel.Size     = UDim2.new(1, -8, 0, lh)
                    hudFpsLabel.Position = UDim2.new(0, 4, 0, math.floor(2 * CONFIG.HUD_SIZE))
                    hudFpsLabel.TextSize = fs
                end
                if hudPingLabel then
                    hudPingLabel.Size     = UDim2.new(1, -8, 0, lh)
                    hudPingLabel.Position = UDim2.new(0, 4, 0, math.floor(2 * CONFIG.HUD_SIZE) + lh + 2)
                    hudPingLabel.TextSize = fs
                end
            end
        end
    end)

    -- ── GUI Button ──
    createSectionLabel(settingsT, "GUI Button")
    createSlider(settingsT, "Button Transparency", 0, 100, CONFIG.GUI_BTN_TRANSPARENCY * 100, function(v)
        CONFIG.GUI_BTN_TRANSPARENCY = v / 100
        if MobileBtn then
            MobileBtn.BackgroundTransparency = CONFIG.GUI_BTN_TRANSPARENCY
            MobileBtn.TextTransparency = math.min(CONFIG.GUI_BTN_TRANSPARENCY, 0.8)
            local ms = MobileBtn:FindFirstChildOfClass("UIStroke")
            if ms then ms.Transparency = CONFIG.GUI_BTN_TRANSPARENCY * 0.6 end
        end
    end)
    createSlider(settingsT, "Button Size", 30, 90, CONFIG.GUI_BTN_SIZE, function(v)
        CONFIG.GUI_BTN_SIZE = v
        if MobileBtn then
            local half = v / 2
            MobileBtn.Size = UDim2.new(0, v, 0, v)
            MobileBtn.Position = UDim2.new(MobileBtn.Position.X.Scale, MobileBtn.Position.X.Offset, MobileBtn.Position.Y.Scale, -half)
        end
    end)

    -- Mobile Toggle Button
    MobileBtn = Instance.new("TextButton")
    MobileBtn.Size = UDim2.new(0, CONFIG.GUI_BTN_SIZE, 0, CONFIG.GUI_BTN_SIZE)
    MobileBtn.Position = UDim2.new(0, 25, 0.5, -(CONFIG.GUI_BTN_SIZE / 2))
    MobileBtn.BackgroundColor3 = CONFIG.BG_COLOR
    MobileBtn.BackgroundTransparency = CONFIG.GUI_BTN_TRANSPARENCY
    MobileBtn.Text = "MR"
    MobileBtn.TextColor3 = CONFIG.ACCENT_COLOR
    MobileBtn.TextTransparency = 0.3
    MobileBtn.Font = Enum.Font.GothamBold
    MobileBtn.TextSize = 20
    MobileBtn.Parent = ScreenGui
    Instance.new("UICorner", MobileBtn).CornerRadius = UDim.new(1, 0)
    local MStroke = Instance.new("UIStroke", MobileBtn)
    MStroke.Color = CONFIG.ACCENT_COLOR
    MStroke.Thickness = 2.5
    applyGradient(MobileBtn, {Color3.fromRGB(30, 30, 35), Color3.fromRGB(15, 15, 20)})
    
    local function toggleUI()
        CONFIG.GUI_VISIBLE = not CONFIG.GUI_VISIBLE
        if CONFIG.GUI_VISIBLE then
            closeActiveDropdown()
            MainFrame.Visible = true
            TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 440, 0, 320)}):Play()
        else
            closeActiveDropdown()
            local t = TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
            t:Play()
            local conn; conn = t.Completed:Connect(function() MainFrame.Visible = false conn:Disconnect() end)
        end
    end
    MobileBtn.MouseButton1Click:Connect(toggleUI)
    registerObject(MobileBtn)

    local function makeDraggable(obj, parent)
        local dragging, dragStart, startPos
        obj.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true dragStart = i.Position startPos = (parent or obj).Position end end)
        UserInputService.InputChanged:Connect(function(i) if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local delta = i.Position - dragStart
            local target = (parent or obj)
            target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end end)
        UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
    end
    makeDraggable(MobileBtn)

    toggleUI()

    UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe then
            if input.KeyCode == CONFIG.TOGGLE_KEY then toggleUI() end
            if input.KeyCode == Enum.KeyCode.F4 then CONFIG.PANIC = true clearSectorParts() ScreenGui:Destroy() end
        end
    end)
    
    OverlayFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            closeActiveDropdown()
        end
    end)
end

-- [[ COMBAT LOGIC ]] --
local function isWallBetween(p1, p2)
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(p1, (p2 - p1), params)
    if result then
        local hit = result.Instance
        return hit and hit.CanCollide and hit.Anchored and not hit:IsDescendantOf(LocalPlayer.Character)
    end
    return false
end

local function isInHitbox(origin, targetPos, rootCF)
    local relPos = rootCF:PointToObjectSpace(targetPos)
    local reach = CONFIG.REACH_DISTANCE
    if CONFIG.RANDOM_REACH then
        reach = reach + (math.random(-100, 100) / 100 * CONFIG.RANDOM_STRENGTH)
    end

    local dirToEnemy = targetPos - origin
    local dist = dirToEnemy.Magnitude

    -- Flatten both vectors to horizontal (XZ) plane so vertical height difference
    -- doesn't shrink the apparent angle — enemy directly ahead but slightly above
    -- should never be excluded by the FOV/sector check.
    local fwd   = rootCF.LookVector
    local flatFwd = Vector3.new(fwd.X, 0, fwd.Z)
    local flatDir = Vector3.new(dirToEnemy.X, 0, dirToEnemy.Z)
    local flatFwdMag = flatFwd.Magnitude
    local flatDirMag = flatDir.Magnitude
    local horizontalDot = (flatFwdMag > 0.001 and flatDirMag > 0.001)
        and (flatFwd / flatFwdMag):Dot(flatDir / flatDirMag)
        or 1.0 -- directly above/below → treat as "in front"

    -- Legit FOV: 45° horizontal half-angle (90° total cone).
    -- Other modes: 360° — no direction restriction.
    if CONFIG.COMBAT_PROFILE == "Legit" then
        if horizontalDot < 0.707 then return false end -- cos(45°)
    end

    if CONFIG.HITBOX_SHAPE == "Sphere" then
        return dist <= reach
    elseif CONFIG.HITBOX_SHAPE == "Square" then
        return math.abs(relPos.X) <= reach and math.abs(relPos.Y) <= reach and math.abs(relPos.Z) <= reach
    elseif CONFIG.HITBOX_SHAPE == "Line" then
        if CONFIG.COMBAT_PROFILE == "Legit" then
            -- Forward only
            return math.abs(relPos.X) <= 2 and math.abs(relPos.Y) <= 3.5 and relPos.Z <= 0 and relPos.Z >= -reach
        else
            -- 360°: both directions
            return math.abs(relPos.X) <= 2 and math.abs(relPos.Y) <= 3.5 and math.abs(relPos.Z) <= reach
        end
    elseif CONFIG.HITBOX_SHAPE == "Sector" then
        -- 50° horizontal half-angle (100° total forward arc), cos(50°) ≈ 0.6428
        -- Matches visual: HALF_ANG = math.rad(50)
        if dist > reach then return false end
        if math.abs(relPos.Y) > (SPOKE_H_HALF or 3.5) then return false end
        return horizontalDot >= 0.6428
    end
    return false
end

-- [[ BACKTRACK RECORDING ]] --
RunService.Heartbeat:Connect(function()
    if CONFIG.PANIC then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                if not backtrackBuffer[player.UserId] then backtrackBuffer[player.UserId] = {} end
                local buffer = backtrackBuffer[player.UserId]
                table.insert(buffer, 1, {pos = root.Position, time = os.clock()})
                local maxTime = CONFIG.BACKTRACK_WINDOW
                while #buffer > 0 and (os.clock() - buffer[#buffer].time) > maxTime do table.remove(buffer) end
            end
        end
    end
end)

-- [[ ADMIN MONITOR ]] --
local function checkAdmin(player)
    if not player then return end
    task.spawn(function()
        pcall(function()
            local isAdmin = false
            local adminLabel = ""

            -- 1. Roblox Staff
            if player:GetRankInGroup(1200769) >= 1 then
                isAdmin = true
                adminLabel = player.Name .. " (Roblox Staff)"
            end
            -- 2. Game Creator/Admin
            if not isAdmin then
                if game.CreatorType == Enum.CreatorType.User then
                    if player.UserId == game.CreatorId then
                        isAdmin = true
                        adminLabel = player.Name .. " (Owner)"
                    end
                elseif game.CreatorType == Enum.CreatorType.Group then
                    local rank = player:GetRankInGroup(game.CreatorId)
                    if rank >= 100 then
                        isAdmin = true
                        adminLabel = player.Name .. " (Rank: " .. rank .. ")"
                    end
                end
            end

            if isAdmin then
                notify("ADMIN ALERT", adminLabel .. " joined!")

                if CONFIG.ADMIN_AUTO_DISABLE then
                    CONFIG.ACTIVE = false
                    notify("ADMIN SYSTEM", "Reach disabled – admin detected")
                end

                if CONFIG.ADMIN_AUTO_LEAVE then
                    task.wait(1.5)
                    TeleportService:Teleport(game.PlaceId, LocalPlayer)
                end
            end
        end)
    end)
end
Players.PlayerAdded:Connect(checkAdmin)
for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then checkAdmin(p) end end

RunService.Heartbeat:Connect(function()
    if not (CONFIG.ACTIVE and CONFIG.INITIALIZED) or CONFIG.PANIC then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local tool = char and char:FindFirstChildOfClass("Tool")
    local handle = tool and (tool:FindFirstChild("Handle") or tool:FindFirstChildOfClass("Part"))
    if not (root and handle) then return end

    -- Resolve the actual touch part(s):
    -- Some games (e.g. Mobile Sword Fight) put the real hitbox in a descendant named "Hitbox"
    -- rather than registering touches on Handle itself.
    -- We collect all candidate parts: Hitbox descendant + Handle itself.
    local function getTouchParts()
        local parts = {}
        local seen = {}
        local function addPart(p)
            if p and p:IsA("BasePart") and not seen[p] then
                seen[p] = true
                table.insert(parts, p)
            end
        end
        -- Priority 1: any descendant whose name contains "hitbox" (case-insensitive)
        -- Catches "swordHitbox-XXXXXXX", "Hitbox", "HitBox", etc.
        for _, desc in ipairs(tool:GetDescendants()) do
            if desc:IsA("BasePart") and desc.Name:lower():find("hitbox") then
                addPart(desc)
            end
        end
        -- Priority 2: all BasePart children of Handle (catches FakeHandle, swordHitbox, etc.)
        for _, child in ipairs(handle:GetChildren()) do
            if child:IsA("BasePart") then
                addPart(child)
            end
        end
        -- Always include Handle itself as final fallback
        addPart(handle)
        return parts
    end

    -- Auto-click: only fire when tool is confirmed equipped (parent == char) AND
    -- Roblox's own Equipped event has already fired (tool.Enabled state is ready).
    -- We guard with pcall so a still-equipping tool doesn't spam warnings.
    if CONFIG.AUTO_CLICK
        and tool.Parent == char
        and tool.Enabled
        and os.clock() - (hitCooldowns["autoclick"] or 0) > 0.05
    then
        hitCooldowns["autoclick"] = os.clock()
        pcall(function() tool:Activate() end)
    end

    if not (isSwinging or CONFIG.ALWAYS_ACTIVE) then return end
    currentHandle = handle  -- used by __index spoof; handle is always the base

    local ping = getPing()

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if CONFIG.TEAM_CHECK and player.Team == LocalPlayer.Team then continue end
            local isWl = false
            for _, name in ipairs(CONFIG.WHITELIST) do if tostring(player.Name) == tostring(name) then isWl = true break end end
            if isWl then continue end
            
            local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if enemyRoot and hum and hum.Health > 0 and not player.Character:FindFirstChildOfClass("ForceField") then
                local targetPos = nil
                local realPos = enemyRoot.Position
                
                -- Predictive Aiming
                if CONFIG.PREDICTIVE then
                    realPos = realPos + (enemyRoot.Velocity * (ping / 1000))
                end

                if isInHitbox(root.Position, realPos, root.CFrame) then
                    if not (CONFIG.WALL_CHECK and isWallBetween(root.Position, realPos)) then targetPos = realPos end
                end
                
                if not targetPos and CONFIG.BACKTRACK and backtrackBuffer[player.UserId] then
                    for _, entry in ipairs(backtrackBuffer[player.UserId]) do
                        if isInHitbox(root.Position, entry.pos, root.CFrame) then
                            if not (CONFIG.WALL_CHECK and isWallBetween(root.Position, entry.pos)) then targetPos = entry.pos break end
                        end
                    end
                end

                if targetPos then
                    local delay = CONFIG.HIT_DELAY
                    local multihit = 1
                    local reachLimit = (CONFIG.COMBAT_PROFILE == "Standard") and 50.0 or 1000

                    if CONFIG.COMBAT_PROFILE == "Legit" then
                        delay = 0.2
                        reachLimit = 9.5
                    elseif CONFIG.COMBAT_PROFILE == "Standard" then
                        delay = CONFIG.HIT_DELAY * 0.8
                        multihit = 2
                        reachLimit = 50.0
                    elseif CONFIG.COMBAT_PROFILE == "Extreme" then
                        delay = 0.0
                        multihit = 25
                        reachLimit = 1000
                    elseif CONFIG.COMBAT_PROFILE == "Deadly" then
                        delay = 0.0
                        multihit = 40
                        reachLimit = 1000
                    end

                    if (root.Position - targetPos).Magnitude > reachLimit then continue end
                    if os.clock() - (hitCooldowns[player.UserId] or 0) < delay then continue end
                    hitCooldowns[player.UserId] = os.clock()
                    
                    local oldHandleCF = handle.CFrame
                    local oldRootCF = root.CFrame
                    
                    spoofedCFrame = oldHandleCF
                    
                    -- Anti-Cap: Spoof root location to be close to enemy
                    local dir = (targetPos - root.Position).Unit
                    spoofedRootCFrame = CFrame.new(targetPos - (dir * 4), targetPos)
                    
                    local touchParts = getTouchParts()
                    local baseJitter = Vector3.new(math.random(-15,15), math.random(-15,15), math.random(-15,15)) * 0.01

                    -- Move all touch parts to target position
                    for _, tp in ipairs(touchParts) do
                        pcall(function() tp.CFrame = CFrame.new(targetPos + baseJitter) end)
                    end

                    for i = 1, multihit do
                        if CONFIG.COMBAT_PROFILE == "Extreme" then
                            local jx = (math.random() - 0.5) * 0.4
                            local jy = (math.random() - 0.5) * 0.25
                            local jz = (math.random() - 0.5) * 0.4
                            local extremePos = CFrame.new(targetPos + Vector3.new(jx, jy, jz))
                            for _, tp in ipairs(touchParts) do
                                pcall(function() tp.CFrame = extremePos end)
                            end
                        elseif CONFIG.COMBAT_PROFILE == "Deadly" then
                            local jx = (math.random() - 0.5) * 0.7
                            local jy = (math.random() - 0.5) * 0.5
                            local jz = (math.random() - 0.5) * 0.7
                            local deadlyPos = CFrame.new(targetPos + Vector3.new(jx, jy, jz))
                            for _, tp in ipairs(touchParts) do
                                pcall(function() tp.CFrame = deadlyPos end)
                            end
                        end
                        -- Fire on every touch part × multiple enemy body parts
                        -- Custom Duels validates hits on HRP and Torso/UpperTorso
                        local enemyTargets = {enemyRoot}
                        local torso = player.Character:FindFirstChild("UpperTorso")
                                   or player.Character:FindFirstChild("Torso")
                        local head  = player.Character:FindFirstChild("Head")
                        if torso then table.insert(enemyTargets, torso) end
                        -- Deadly modunda Head'e de fire et
                        if CONFIG.COMBAT_PROFILE == "Deadly" and head then
                            table.insert(enemyTargets, head)
                        end
                        for _, tp in ipairs(touchParts) do
                            for _, target in ipairs(enemyTargets) do
                                pcall(function()
                                    firetouchinterest(tp, target, 0)
                                    firetouchinterest(tp, target, 1)
                                end)
                            end
                        end
                    end
                    
                    -- Restore handle CFrame
                    pcall(function() handle.CFrame = oldHandleCF end)
                    spoofedCFrame = nil
                    spoofedRootCFrame = nil
                end
            end
        end
    end
end)

-- [[ VISUALIZER ]] --
local visPart = nil
local sectorParts = {} -- spokes + arc cap for Sector shape

local function clearSectorParts()
    for _, p in ipairs(sectorParts) do pcall(function() p:Destroy() end) end
    sectorParts = {}
end

local function makeSectorPart(cam)
    local p = Instance.new("Part")
    p.Material   = Enum.Material.ForceField
    p.CanCollide = false
    p.CastShadow = false
    p.Anchored   = true
    p.Archivable = false
    p.Shape      = Enum.PartType.Block
    p.Parent     = cam
    registerObject(p)
    table.insert(sectorParts, p)
    return p
end

local function updateVisualizer()
    if CONFIG.PANIC or not (CONFIG.ACTIVE and CONFIG.SHOW_VISUALIZER) then
        if visPart then visPart.Parent = nil end
        clearSectorParts()
        return
    end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        if visPart then visPart.Parent = nil end
        clearSectorParts()
        return
    end

    local reach = CONFIG.REACH_DISTANCE
    local cam   = workspace:FindFirstChildOfClass("Camera") or workspace

    -- ── Sector visualizer ──────────────────────────────────────────────────
    if CONFIG.HITBOX_SHAPE == "Sector" then
        if visPart then visPart.Parent = nil end

        local HALF_ANG   = math.rad(50)
        local NUM_SPOKES = 30         -- dense enough to look fully filled
        local ARC_SEGS   = 18         -- arc cap segments for solid boundary
        local TOTAL      = NUM_SPOKES + ARC_SEGS
        local SPOKE_H    = 3.5
        local TRANSP     = CONFIG.VIS_TRANSPARENCY

        -- Dynamic spoke width: ensure no gaps at the far end
        local angStep  = (2 * HALF_ANG) / math.max(NUM_SPOKES - 1, 1)
        local SPOKE_W  = math.max(1.0, reach * angStep * 1.25)  -- 25% overlap ensures solid fill
        local ARC_W    = SPOKE_W

        -- Grow pool if needed
        while #sectorParts < TOTAL do makeSectorPart(cam) end
        -- Shrink pool if needed
        while #sectorParts > TOTAL do
            pcall(function() table.remove(sectorParts):Destroy() end)
        end

        local function styleP(p)
            p.Color        = CONFIG.ACCENT_COLOR
            p.Transparency = TRANSP
            p.Parent       = cam
        end

        -- 1. Dense spokes radiating from origin — fills the entire sector solid
        for i = 1, NUM_SPOKES do
            local p = sectorParts[i]
            styleP(p)
            local t     = (i - 1) / (NUM_SPOKES - 1)        -- 0 → 1
            local angle = -HALF_ANG + t * (2 * HALF_ANG)    -- -50° → +50°
            p.Size  = Vector3.new(SPOKE_W, SPOKE_H, reach)
            local rot = root.CFrame * CFrame.Angles(0, angle, 0)
            p.CFrame = rot * CFrame.new(0, 0, -reach / 2)
        end

        -- 2. Dense arc cap at max reach distance — solid outer boundary
        for j = 1, ARC_SEGS do
            local p = sectorParts[NUM_SPOKES + j]
            styleP(p)
            local t     = (j - 1) / (ARC_SEGS - 1)
            local angle = -HALF_ANG + t * (2 * HALF_ANG)
            local tipX  = math.sin(angle) * reach
            local tipZ  = -math.cos(angle) * reach
            p.Size  = Vector3.new(ARC_W, SPOKE_H, ARC_W)
            p.CFrame = root.CFrame * CFrame.new(tipX, 0, tipZ)
        end

        return
    end

    -- ── All other shapes: single visPart ───────────────────────────────────
    clearSectorParts()

    if not visPart or not visPart.Parent then
        if visPart then pcall(function() visPart:Destroy() end) end
        visPart = Instance.new("Part")
        visPart.Name = VIS_NAME
        visPart.Material = Enum.Material.ForceField
        visPart.CanCollide = false
        visPart.CastShadow = false
        visPart.Anchored = true
        visPart.Archivable = false
        registerObject(visPart)
    end

    visPart.Parent = cam
    visPart.Transparency = CONFIG.VIS_TRANSPARENCY
    visPart.Color = CONFIG.ACCENT_COLOR

    if CONFIG.HITBOX_SHAPE == "Sphere" then
        visPart.Shape = Enum.PartType.Ball
        visPart.Size = Vector3.new(reach*2, reach*2, reach*2)
        visPart.CFrame = root.CFrame
    elseif CONFIG.HITBOX_SHAPE == "Square" then
        visPart.Shape = Enum.PartType.Block
        visPart.Size = Vector3.new(reach*2, reach*2, reach*2)
        visPart.CFrame = root.CFrame
    elseif CONFIG.HITBOX_SHAPE == "Line" then
        visPart.Shape = Enum.PartType.Block
        visPart.Size = Vector3.new(4, 4, reach)
        visPart.CFrame = root.CFrame * CFrame.new(0, 0, -reach/2)
    end
end
RunService.RenderStepped:Connect(updateVisualizer)

-- [[ HUD SYSTEM ]] --
local hudGui = nil
local hudFpsLabel = nil
local hudPingLabel = nil
local hudFrameCount = 0
local hudLastTime = os.clock()

local function buildHud()
    if hudGui then pcall(function() hudGui:Destroy() end) end
    local UI_P = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")
    hudGui = Instance.new("ScreenGui")
    hudGui.Name = "MR_HUD_" .. math.random(1e4, 9e4)
    hudGui.ResetOnSpawn = false
    hudGui.DisplayOrder = 50
    hudGui.IgnoreGuiInset = true
    hudGui.Parent = UI_P
    registerObject(hudGui)

    local bg = Instance.new("Frame")
    bg.Name = "HUDBg"
    bg.Size = UDim2.new(0, 90, 0, 44)
    bg.Position = UDim2.new(1, -100, 0, 8)
    bg.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    bg.BackgroundTransparency = CONFIG.HUD_TRANSPARENCY
    bg.BorderSizePixel = 0
    bg.Parent = hudGui
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", bg)
    s.Color = CONFIG.ACCENT_COLOR
    s.Thickness = 1.2

    hudFpsLabel = Instance.new("TextLabel")
    hudFpsLabel.Size = UDim2.new(1, -8, 0, 20)
    hudFpsLabel.Position = UDim2.new(0, 4, 0, 2)
    hudFpsLabel.BackgroundTransparency = 1
    hudFpsLabel.Text = "FPS: --"
    hudFpsLabel.TextColor3 = CONFIG.ACCENT_COLOR
    hudFpsLabel.Font = Enum.Font.GothamBold
    hudFpsLabel.TextSize = 12
    hudFpsLabel.TextXAlignment = Enum.TextXAlignment.Left
    hudFpsLabel.Parent = bg

    hudPingLabel = Instance.new("TextLabel")
    hudPingLabel.Size = UDim2.new(1, -8, 0, 20)
    hudPingLabel.Position = UDim2.new(0, 4, 0, 22)
    hudPingLabel.BackgroundTransparency = 1
    hudPingLabel.Text = "Ping: --"
    hudPingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    hudPingLabel.Font = Enum.Font.GothamMedium
    hudPingLabel.TextSize = 12
    hudPingLabel.TextXAlignment = Enum.TextXAlignment.Left
    hudPingLabel.Parent = bg
end

RunService.Heartbeat:Connect(function(dt)
    if CONFIG.PANIC then return end
    -- FPS counter
    hudFrameCount = hudFrameCount + 1
    local now = os.clock()
    if now - hudLastTime >= 0.5 then
        local fps = math.floor(hudFrameCount / (now - hudLastTime))
        hudFrameCount = 0
        hudLastTime = now

        if hudGui and hudGui.Parent then
            local bg = hudGui:FindFirstChild("HUDBg")
            if bg then
                bg.Visible = CONFIG.HUD_ENABLED
                if CONFIG.HUD_ENABLED then
                    if hudFpsLabel then
                        hudFpsLabel.Visible = CONFIG.HUD_FPS
                        hudFpsLabel.Text = "FPS: " .. fps
                        hudFpsLabel.TextColor3 = fps >= 50 and Color3.fromRGB(80,255,80) or fps >= 25 and Color3.fromRGB(255,200,0) or Color3.fromRGB(255,80,80)
                    end
                    if hudPingLabel then
                        hudPingLabel.Visible = CONFIG.HUD_PING
                        local pingOk, pingVal = pcall(getPing)
                        local ping = math.floor(pingOk and pingVal or 0)
                        hudPingLabel.Text = "Ping: " .. ping .. "ms"
                        hudPingLabel.TextColor3 = ping <= 80 and Color3.fromRGB(80,255,80) or ping <= 150 and Color3.fromRGB(255,200,0) or Color3.fromRGB(255,80,80)
                    end
                end
            end
        end
    end
end)
local function createESP(player)
    local function remove()
        if espObjects[player] then
            for _, v in pairs(espObjects[player]) do pcall(function() v:Destroy() end) end
            espObjects[player] = nil
        end
    end

    if player == LocalPlayer then return end

    local function update()
        if CONFIG.PANIC or not CONFIG.ESP_ENABLED or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            remove()
            return
        end

        local root = player.Character.HumanoidRootPart
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        local myRoot = cachedRoot or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
        local dist = myRoot and (myRoot.Position - root.Position).Magnitude or 0

        if dist > CONFIG.ESP_DISTANCE then remove() return end

        if not espObjects[player] then espObjects[player] = {} end
        local cache = espObjects[player]

        -- Highlight (Box)
        if CONFIG.ESP_BOX then
            if not cache.Highlight or cache.Highlight.Parent ~= player.Character then
                if cache.Highlight then cache.Highlight:Destroy() end
                cache.Highlight = Instance.new("Highlight")
                cache.Highlight.FillTransparency = 0.5
                cache.Highlight.OutlineTransparency = 0
                cache.Highlight.Parent = player.Character
                registerObject(cache.Highlight)
            end
            cache.Highlight.Enabled = true
            cache.Highlight.FillColor = (CONFIG.TEAM_CHECK and player.Team == LocalPlayer.Team) and Color3.new(0,1,0) or CONFIG.ACCENT_COLOR
            cache.Highlight.OutlineColor = Color3.new(1,1,1)
        elseif cache.Highlight then
            cache.Highlight.Enabled = false
        end

        -- Billboard (Name/Health)
        if CONFIG.ESP_NAMES or CONFIG.ESP_HEALTH then
            if not cache.Billboard or cache.Billboard.Parent ~= root then
                if cache.Billboard then cache.Billboard:Destroy() end
                cache.Billboard = Instance.new("BillboardGui")
                cache.Billboard.Size = UDim2.new(0, 200, 0, 50)
                cache.Billboard.AlwaysOnTop = true
                cache.Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
                cache.Billboard.Parent = root
                registerObject(cache.Billboard)

                cache.NameLabel = Instance.new("TextLabel", cache.Billboard)
                cache.NameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                cache.NameLabel.BackgroundTransparency = 1
                cache.NameLabel.Font = Enum.Font.GothamBold
                cache.NameLabel.TextSize = 13
                cache.NameLabel.TextColor3 = Color3.new(1,1,1)
                
                cache.HealthBarBG = Instance.new("Frame", cache.Billboard)
                cache.HealthBarBG.Size = UDim2.new(0.5, 0, 0.1, 0)
                cache.HealthBarBG.Position = UDim2.new(0.25, 0, 0.6, 0)
                cache.HealthBarBG.BackgroundColor3 = Color3.new(0,0,0)
                cache.HealthBarBG.BorderSizePixel = 0
                
                cache.HealthBar = Instance.new("Frame", cache.HealthBarBG)
                cache.HealthBar.Size = UDim2.new(1, 0, 1, 0)
                cache.HealthBar.BackgroundColor3 = Color3.new(0,1,0)
                cache.HealthBar.BorderSizePixel = 0
            end
            cache.Billboard.Enabled = true
            cache.NameLabel.Visible = CONFIG.ESP_NAMES
            cache.NameLabel.Text = player.Name .. " [" .. math.floor(dist) .. " studs]"
            cache.NameLabel.TextColor3 = (CONFIG.TEAM_CHECK and player.Team == LocalPlayer.Team) and Color3.new(0.4, 1, 0.4) or Color3.new(1,1,1)
            
            cache.HealthBarBG.Visible = CONFIG.ESP_HEALTH
            if hum then
                local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                cache.HealthBar.Size = UDim2.new(hp, 0, 1, 0)
                cache.HealthBar.BackgroundColor3 = Color3.fromHSV(hp * 0.3, 1, 1)
            end
        elseif cache.Billboard then
            cache.Billboard.Enabled = false
        end

        -- Tracers
        if CONFIG.ESP_TRACERS then
            if not cache.Tracer then
                cache.Tracer = Instance.new("LineHandleAdornment")
                cache.Tracer.Length = 0
                cache.Tracer.Thickness = 1.5
                cache.Tracer.ZIndex = 10
                cache.Tracer.AlwaysOnTop = true
                cache.Tracer.Transparency = 0.4
                cache.Tracer.Parent = workspace:FindFirstChildOfClass("Camera") or workspace
                registerObject(cache.Tracer)
            end
            
            local cam = workspace.CurrentCamera
            if cam and myRoot then
                local startPos = cam.CFrame * CFrame.new(0, -1, 0) -- Bottom center of screen approx
                local direction = (root.Position - startPos.Position)
                cache.Tracer.CFrame = CFrame.new(startPos.Position, root.Position)
                cache.Tracer.Length = direction.Magnitude
                cache.Tracer.Color3 = (CONFIG.TEAM_CHECK and player.Team == LocalPlayer.Team) and Color3.new(0,1,0) or CONFIG.ACCENT_COLOR
                cache.Tracer.Visible = true
            else
                cache.Tracer.Visible = false
            end
        elseif cache.Tracer then
            cache.Tracer.Visible = false
        end
    end
    RunService.Heartbeat:Connect(update)
    player.CharacterRemoving:Connect(remove)
end
Players.PlayerAdded:Connect(createESP)
for _, p in ipairs(Players:GetPlayers()) do createESP(p) end

-- [[ SETUP ]] --
local function setupTool(t)
    if not t:IsA("Tool") then return end
    t.Equipped:Connect(function() isSwinging = false end)
    t.Activated:Connect(function() isSwinging = true end)
    t.Deactivated:Connect(function() isSwinging = false end)
    t.Unequipped:Connect(function() isSwinging = false end)
end

local function setupCharacter(c)
    cachedRoot = c:WaitForChild("HumanoidRootPart", 5)
    c.ChildAdded:Connect(function(child)
        if child.Name == "HumanoidRootPart" then cachedRoot = child end
        setupTool(child)
    end)
    for _, v in pairs(c:GetChildren()) do setupTool(v) end
end

LocalPlayer.CharacterAdded:Connect(setupCharacter)
if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end

Players.PlayerRemoving:Connect(function(p) backtrackBuffer[p.UserId] = nil end)


-- [[ GAME-SPECIFIC BYPASS: Custom Duels (ID: 2609668898) ]] --
--[[
    Custom Duels hasar sistemi analizi (Dex'ten):
    - Handle → TouchInterest var  (touch tabanlı)
    - Handle → swordHitbox-XXXXXXX (dinamik isimli Part, sadece fizik)
    - Ek olarak RemoteEvent tabanlı hasar da kullanılıyor olabilir

    Yapılan düzeltmeler:
    1. ALWAYS_ACTIVE = true (isSwinging hook çalışmıyor olabilir)
    2. Handle'daki TouchInterest'i direkt hedef al
    3. Tüm ReplicatedStorage remote'larını tara, hasar remote'unu bul ve fire et
    4. Enemy'nin tüm vücut part'larına firetouchinterest at
]]
if game.PlaceId == 2609668898 then
    -- 1. ALWAYS_ACTIVE'i bu oyun için zorla aç
    --    (Tool.Activated Custom Duels'ta kendi sistemi üzerinden çalışıyor)
    CONFIG.ALWAYS_ACTIVE = true

    task.spawn(function()
        task.wait(3)

        -- 2. Hasar remote'unu bul (ReplicatedStorage + game içinde tara)
        local damageRemote = nil
        local function findDamageRemote()
            local candidates = {}
            local function scan(parent)
                for _, v in ipairs(parent:GetChildren()) do
                    if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                        local n = v.Name:lower()
                        if n:find("hit") or n:find("damage") or n:find("slash")
                           or n:find("attack") or n:find("sword") or n:find("combat") then
                            table.insert(candidates, v)
                        end
                    end
                    pcall(scan, v)
                end
            end
            pcall(scan, game:GetService("ReplicatedStorage"))
            pcall(scan, workspace)
            return candidates
        end

        local remotes = findDamageRemote()
        if #remotes > 0 then
            damageRemote = remotes[1]
        end

        -- 3. Remote tabanlı hit loop (touch'a ek olarak)
        if damageRemote then
            RunService.Heartbeat:Connect(function()
                if not (CONFIG.ACTIVE and CONFIG.INITIALIZED) or CONFIG.PANIC then return end
                local char = LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then return end

                for _, player in ipairs(Players:GetPlayers()) do
                    if player == LocalPlayer then continue end
                    if not player.Character then continue end
                    local eRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    local hum   = player.Character:FindFirstChildOfClass("Humanoid")
                    if not (eRoot and hum and hum.Health > 0) then continue end

                    local dist = (root.Position - eRoot.Position).Magnitude
                    if dist > CONFIG.REACH_DISTANCE then continue end
                    if os.clock() - (hitCooldowns["cd_remote_" .. player.UserId] or 0) < 0.15 then continue end
                    hitCooldowns["cd_remote_" .. player.UserId] = os.clock()

                    -- Farklı arg kombinasyonları dene (oyun değişmiş olabilir)
                    pcall(function() damageRemote:FireServer(player) end)
                    pcall(function() damageRemote:FireServer(player.Character) end)
                    pcall(function() damageRemote:FireServer(eRoot) end)
                    pcall(function() damageRemote:FireServer(player, eRoot.Position) end)
                end
            end)
        end

        -- 4. firetouchinterest → Handle'daki TouchInterest'i direkt hedef al
        --    (getTouchParts zaten handle'ı döndürüyor ama burada kesin olarak handle'ı önce koyuyoruz)
        RunService.Heartbeat:Connect(function()
            if not (CONFIG.ACTIVE and CONFIG.INITIALIZED) or CONFIG.PANIC then return end
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local tool = char and char:FindFirstChildOfClass("Tool")
            if not (root and tool) then return end
            local handle = tool:FindFirstChild("Handle")
            if not handle then return end
            -- Handle'da TouchInterest yoksa atla
            if not handle:FindFirstChildOfClass("TouchInterest") then return end

            for _, player in ipairs(Players:GetPlayers()) do
                if player == LocalPlayer then continue end
                if not player.Character then continue end
                local eRoot = player.Character:FindFirstChild("HumanoidRootPart")
                local hum   = player.Character:FindFirstChildOfClass("Humanoid")
                if not (eRoot and hum and hum.Health > 0) then continue end

                local dist = (root.Position - eRoot.Position).Magnitude
                if dist > CONFIG.REACH_DISTANCE then continue end
                if os.clock() - (hitCooldowns["cd_touch_" .. player.UserId] or 0) < 0.08 then continue end
                hitCooldowns["cd_touch_" .. player.UserId] = os.clock()

                -- Handle'ı enemy'nin üstüne taşı, sonra firetouchinterest at
                local oldCF = handle.CFrame
                pcall(function() handle.CFrame = CFrame.new(eRoot.Position) end)

                -- Handle (TouchInterest sahibi) → enemy vücut partlarına fire et
                local targets = {eRoot}
                local torso = player.Character:FindFirstChild("UpperTorso")
                          or player.Character:FindFirstChild("Torso")
                local head  = player.Character:FindFirstChild("Head")
                if torso then table.insert(targets, torso) end
                if head  then table.insert(targets, head)  end

                for _, tgt in ipairs(targets) do
                    pcall(function()
                        firetouchinterest(handle, tgt, 0)
                        firetouchinterest(handle, tgt, 1)
                    end)
                end

                pcall(function() handle.CFrame = oldCF end)
            end
        end)

        task.wait(6)
        notify("BYPASS", "Custom Duels bypass active!")
    end)
end

-- [[ GAME-SPECIFIC BYPASS: Prismatic AC (Group: 32867557) ]] --
--[[
    Sadece group 32867557'ye ait oyunlarda çalışır.
    Prismatic Anticheat bypass stratejisi:
    1. Grup kontrolü — yanlış oyunda çalışmasın
    2. Hi.Real.Value → gerçek damage remote'u bul (370 kopya arasından)
    3. __namecall hook:
       - _PAMRC1 / _PAMRC2 / _GCPA → sessizce null et (detection engelle)
       - Kendi swing'imizden argümanları yakala
    4. Ping-pingback'e DOKUNMA — çalışmaya devam etsin
    5. firetouchinterest KULLANMA — _PAMRC2 yakalar
    6. Handle'a DOKUNMA — _PAMRC1 yakalar
    7. Yakalanan argümanları yakın enemy'lere replay et
    8. Rate limit: sunucu 120/sn max — HIT_DELAY ile kontrol
    9. Server-side distance check var → REACH_DISTANCE'ı makul tut
]]
do
    -- Grup kontrolü
    local isTargetGame = false
    pcall(function()
        isTargetGame = (game.CreatorType == Enum.CreatorType.Group and game.CreatorId == 32867557)
    end)

    if isTargetGame then
        CONFIG.ALWAYS_ACTIVE = true

        task.spawn(function()
            task.wait(3)

            -- Gerçek remote'u bul: Hi.Real ObjectValue
            local realRemote = nil

            local function findRealRemote()
                -- Method 1: SwordSettings.Hi.Real ObjectValue (en güvenilir)
                pcall(function()
                    local ss = game:GetService("ReplicatedStorage"):FindFirstChild("SwordSettings")
                    if ss then
                        local hi = ss:FindFirstChild("Hi.")
                        if hi then
                            local real = hi:FindFirstChild("Real")
                            if real and typeof(real) == "Instance" and real:IsA("ObjectValue") then
                                if real.Value and real.Value:IsA("RemoteEvent") then
                                    realRemote = real.Value
                                end
                            end
                        end
                    end
                end)

                -- Method 2: PrismaticRemotes içinde OnClientEvent listener'ı olan remote
                -- Gerçek remote oyunun kendi sistemleri tarafından dinleniyor,
                -- 370 sahte kopyadan hiçbiri dinlenmiyor.
                if not realRemote then
                    pcall(function()
                        local pr = game:GetService("ReplicatedStorage"):FindFirstChild("PrismaticRemotes")
                        if pr and getsignal then
                            for _, child in ipairs(pr:GetChildren()) do
                                if child:IsA("RemoteEvent") then
                                    local ok, conns = pcall(getsignal, child.OnClientEvent)
                                    if ok and conns and #conns > 0 then
                                        realRemote = child
                                        break
                                    end
                                end
                            end
                        end
                    end)
                end

                -- Method 3: getgc — Prismatic Client'ın v_u_8 upvalue'sunu bul
                -- Prismatic Client: local v_u_8 = v1.Bait() → bu gerçek remote
                if not realRemote and getgc then
                    pcall(function()
                        local gc = getgc(true)
                        for _, fn in ipairs(gc) do
                            if type(fn) == "function" then
                                local ok, ups = pcall(getupvalues, fn)
                                if ok and ups then
                                    for _, up in pairs(ups) do
                                        if typeof(up) == "Instance" and up:IsA("RemoteEvent") then
                                            local parent = up.Parent
                                            if parent and parent.Name == "PrismaticRemotes" then
                                                -- Sadece bir tane upvalue'da RemoteEvent varsa gerçek olabilir
                                                realRemote = up
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                            if realRemote then break end
                        end
                    end)
                end
            end

            findRealRemote()

            -- Yakalanan swing argümanları
            local lastArgs   = nil
            local lastArgTime = 0

            -- __namecall hook
            local _origNC
            _origNC = hookmetamethod(game, "__namecall", function(self, ...)
                if checkcaller() or CONFIG.PANIC then return _origNC(self, ...) end
                local method = getnamecallmethod()

                if method == "FireServer" or method == "fireServer" then
                    local name = tostring(self.Name)

                    -- Detection remote'larını null et — sunucuya ulaşmasın
                    if name == "_PAMRC1" or name == "_PAMRC2"
                    or name == "_PAMRC3" or name == "_GCPA" then
                        return  -- iptal, sunucuya gönderme
                    end

                    -- Kendi swing'imizi yakala
                    if realRemote and self == realRemote then
                        lastArgs    = {...}
                        lastArgTime = os.clock()
                    end
                end

                return _origNC(self, ...)
            end)

            task.wait(2)
            if realRemote then
                notify("BYPASS", "Prismatic AC: Ready (" .. realRemote.Name .. ")")
            else
                notify("BYPASS", "Prismatic AC: Swing to detect remote")
            end

            -- Reach loop
            RunService.Heartbeat:Connect(function()
                if not (CONFIG.ACTIVE and CONFIG.INITIALIZED) or CONFIG.PANIC then return end
                if not realRemote then return end
                if not lastArgs then return end
                -- Son swing 0.5 saniyeden eskiyse replay etme
                if os.clock() - lastArgTime > 0.5 then return end

                local char = LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then return end

                for _, player in ipairs(Players:GetPlayers()) do
                    if player == LocalPlayer then continue end
                    if not player.Character then continue end
                    if CONFIG.TEAM_CHECK and player.Team == LocalPlayer.Team then continue end

                    local eRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    local hum   = player.Character:FindFirstChildOfClass("Humanoid")
                    if not (eRoot and hum and hum.Health > 0) then continue end
                    if player.Character:FindFirstChildOfClass("ForceField") then continue end

                    local dist = (root.Position - eRoot.Position).Magnitude
                    if dist > CONFIG.REACH_DISTANCE then continue end
                    if os.clock() - (hitCooldowns["pris_" .. player.UserId] or 0) < CONFIG.HIT_DELAY then continue end
                    hitCooldowns["pris_" .. player.UserId] = os.clock()

                    -- Argümanları kopyala, 1. player arg'ı hedefle değiştir
                    local newArgs = {table.unpack(lastArgs)}
                    if #newArgs >= 1 and typeof(newArgs[1]) == "Instance"
                    and newArgs[1]:IsA("Player") then
                        newArgs[1] = player
                    end

                    pcall(function()
                        realRemote:FireServer(table.unpack(newArgs))
                    end)
                end
            end)
        end)
    end
end

--[[
    Dex confirmed:
    Tool "Default" → Handle (Part) → TouchInterest (direct, no separate hitbox)
    No RemoteEvent. Pure firetouchinterest on Handle.
]]
if game.PlaceId == 14639856040 then
    CONFIG.ALWAYS_ACTIVE = true

    RunService.Heartbeat:Connect(function()
        if not (CONFIG.ACTIVE and CONFIG.INITIALIZED) or CONFIG.PANIC then return end
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local tool = char and char:FindFirstChildOfClass("Tool")
        if not (root and tool) then return end

        local handle = tool:FindFirstChild("Handle")
        if not handle then return end

        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            if not player.Character then continue end
            if CONFIG.TEAM_CHECK and player.Team == LocalPlayer.Team then continue end

            local eRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local hum   = player.Character:FindFirstChildOfClass("Humanoid")
            if not (eRoot and hum and hum.Health > 0) then continue end
            if player.Character:FindFirstChildOfClass("ForceField") then continue end

            local dist = (root.Position - eRoot.Position).Magnitude
            if dist > CONFIG.REACH_DISTANCE then continue end
            if os.clock() - (hitCooldowns["stms_" .. player.UserId] or 0) < CONFIG.HIT_DELAY then continue end
            hitCooldowns["stms_" .. player.UserId] = os.clock()

            local hits = 2
            if CONFIG.COMBAT_PROFILE == "Extreme" then hits = 35
            elseif CONFIG.COMBAT_PROFILE == "Deadly" then hits = 100 end

            -- Move Handle to enemy's attacker-facing side
            local toAttacker = (root.Position - eRoot.Position)
            local stmsOffset = (toAttacker.Magnitude > 0.1) and (toAttacker.Unit * 0.5) or Vector3.zero
            local oldCF = handle.CFrame
            pcall(function() handle.CFrame = CFrame.new(eRoot.Position + stmsOffset) end)

            local bodyParts = {eRoot}
            local torso = player.Character:FindFirstChild("UpperTorso")
                       or player.Character:FindFirstChild("Torso")
            local head  = player.Character:FindFirstChild("Head")
            if torso then table.insert(bodyParts, torso) end
            if head  then table.insert(bodyParts, head)  end

            for _ = 1, hits do
                for _, tgt in ipairs(bodyParts) do
                    pcall(function()
                        firetouchinterest(handle, tgt, 0)
                        firetouchinterest(handle, tgt, 1)
                    end)
                end
            end

            pcall(function() handle.CFrame = oldCF end)
        end
    end)
end

-- [[ GAME-SPECIFIC BYPASS: Mobile Sword Fight (ID: 9377953133) ]] --
if game.PlaceId == 9377953133 then
    task.spawn(function()
        local BYPASS_URL = "https://raw.githubusercontent.com/noctryxzen/Bypasses/refs/heads/main/MobileSwordFight.luau"
        local content = nil

        -- Method 1: game:HttpGet
        local ok1, res1 = pcall(function()
            return game:HttpGet(BYPASS_URL, true)
        end)
        if ok1 and type(res1) == "string" and #res1 > 5 then
            content = res1
        end

        -- Method 2: syn/http request fallback
        if not content then
            local reqFunc = (syn and syn.request) or (http and http.request) or http_request or request
            if reqFunc then
                local ok2, res2 = pcall(reqFunc, {
                    Url = BYPASS_URL,
                    Method = "GET"
                })
                if ok2 and res2 and type(res2.Body) == "string" and #res2.Body > 5 then
                    content = res2.Body
                end
            end
        end

        -- Execute
        if content then
            local fn, compileErr = loadstring(content)
            if fn then
                local runOk, runErr = pcall(fn)
                task.wait(6)
                if runOk then
                    notify("BYPASS", "Mobile Sword Fight bypass loaded!")
                else
                    notify("BYPASS", "Bypass runtime err: " .. tostring(runErr):sub(1,35))
                end
            else
                task.wait(6)
                notify("BYPASS", "Bypass compile err: " .. tostring(compileErr):sub(1,35))
            end
        else
            task.wait(6)
            notify("BYPASS", "Bypass fetch failed. Check HTTP settings.")
        end
    end)
end

-- [[ FIREBASE TIMER SYSTEM ]] --
local FIREBASE_URL = "https://megareach-d60be-default-rtdb.europe-west1.firebasedatabase.app/keyless_expiry.json"

local function fetchFirebaseExpiry()
    local raw = nil

    local ok1, res1 = pcall(function()
        return game:HttpGet(FIREBASE_URL, true)
    end)
    if ok1 and res1 then
        raw = tonumber(res1:match("[%d]+"))
    end

    if not raw then
        local reqFunc = (syn and syn.request) or (http and http.request) or http_request or request
        if reqFunc then
            local ok2, res2 = pcall(reqFunc, { Url = FIREBASE_URL, Method = "GET" })
            if ok2 and res2 and res2.Body then
                raw = tonumber(res2.Body:match("[%d]+"))
            end
        end
    end

    -- Only accept valid Unix timestamps (after year 2020)
    if raw and raw > 1577836800 then
        return raw
    end
    return nil
end

initBypasses()
task.spawn(function()
    local expiry = fetchFirebaseExpiry()
    local now    = os.time()

    if expiry and now < expiry then
        -- ✅ Keyless active — launch directly
        logExecution()
        createGui()
        buildHud()
        CONFIG.INITIALIZED = true

        -- Countdown timer (checks every 60 seconds for expiry)
        task.spawn(function()
            while true do
                task.wait(60)
                local remaining = expiry - os.time()
                if remaining <= 0 then
                    CONFIG.INITIALIZED = false
                    CONFIG.ACTIVE = false
                    notify("KEY SYSTEM", "Keyless period expired. Key required.")
                    task.wait(3)
                    local gui = (gethui and gethui() or LocalPlayer:FindFirstChild("PlayerGui"))
                    if gui then
                        local mg = gui:FindFirstChild(UI_NAME)
                        if mg then mg:Destroy() end
                    end
                    createKeyGui(function()
                        createGui()
                        logExecution()
                        buildHud()
                        CONFIG.INITIALIZED = true
                    end)
                    break
                end
            end
        end)

        task.wait(6)
        local left = expiry - os.time()
        local h = math.floor(left / 3600)
        local m = math.floor((left % 3600) / 60)
        notify("KEYLESS ACTIVE", h .. "h " .. m .. "m remaining")
    else
        -- ❌ Keyless expired or Firebase unreachable → key gate (silent)
        local savedKey = ""
        if isfile and isfile("MegaReach_Key.txt") then
            savedKey = readfile("MegaReach_Key.txt")
        end

        if savedKey ~= "" then
            local success, message, expiry2 = validateKey(savedKey)
            if success then
                logExecution()
                CONFIG.KEY_EXPIRY = expiry2
                createGui()
                buildHud()
                CONFIG.INITIALIZED = true
                return
            end
        end

        createKeyGui(function()
            createGui()
            logExecution()
            buildHud()
            CONFIG.INITIALIZED = true
        end)
    end
end)

