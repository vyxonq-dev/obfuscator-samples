--[[
    ================================================================
    NNVN Hub - Patriot Key System
    Only edit MainScriptURL and SecretCode below
    ================================================================
]]

local Config = {
    -- Paste your main script raw URL here
    MainScriptURL = "https://raw.githubusercontent.com/n0namevnnek-web/Goofy-Gods/refs/heads/main/Goofy%20Gods",

    -- Must match SecretKey in your Main Script
    SecretCode = "2107",
}

-------------------------------------------------
-- KEY SYSTEM (no need to edit below if you don't know)
-------------------------------------------------

local function getRealHWID()
    if gethwid then
        local ok, value = pcall(gethwid)
        if ok and value and tostring(value) ~= "" then
            return tostring(value)
        end
    end

    local ok, value = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    if ok and value and tostring(value) ~= "" then
        return tostring(value)
    end

    return "unknown"
end

local function setClipboardSafe(text)
    local fn = setclipboard or toclipboard
    if fn then
        pcall(fn, tostring(text))
    end
end

local realHWID = getRealHWID()
local getKeyURL = "https://ads.pandauth.com/getkey/nnvnhub?hwid=" .. realHWID

-- Copy the real GetKey link to clipboard automatically
setClipboardSafe(getKeyURL)
print("[NNVN] Real HWID:", realHWID)
print("[NNVN] GetKey link copied to clipboard")

local Patriot = loadstring(game:HttpGet("https://raw.githubusercontent.com/SyndromeXph/Patriot-Key-System-Ui-Library/refs/heads/main/PatriotUi.luau"))()

Patriot.Appearance = {
    Title = "NNVN Hub",
    Subtitle = "Key Authentication",
    Icon = "rbxassetid://138952058031836",
    IconSize = UDim2.new(0, 30, 0, 30)
}

Patriot.Theme = {
    Accent = Color3.fromRGB(82, 82, 88),
    AccentHover = Color3.fromRGB(110, 110, 118),
    Background = Color3.fromRGB(14, 14, 16),
    Header = Color3.fromRGB(20, 20, 22),
    Input = Color3.fromRGB(28, 28, 32),
    Text = Color3.fromRGB(245, 245, 245),
    TextDim = Color3.fromRGB(160, 160, 168),
    Success = Color3.fromRGB(180, 255, 200),
    Error = Color3.fromRGB(255, 120, 120),
    Warning = Color3.fromRGB(255, 220, 140),
    StatusIdle = Color3.fromRGB(90, 90, 98),
    Discord = Color3.fromRGB(200, 200, 205),
    DiscordHover = Color3.fromRGB(235, 235, 235),
    Divider = Color3.fromRGB(40, 40, 44),
    Pending = Color3.fromRGB(34, 34, 38)
}

Patriot.Links = {
    GetKey = getKeyURL, -- Real HWID is already attached
    Discord = "https://discord.gg/n4DbXTyNPj"
}

Patriot.Storage = {
    FileName = "Patriot_Key",
    Remember = true,
    AutoLoad = false
}

Patriot.Options = {
    Keyless = false,
    Blur = true,
    Draggable = true
}

Patriot.Callbacks.OnSuccess = function()
    -- Set secret so Main Script knows the key system was passed
    _G[Config.SecretCode] = true

    if not Config.MainScriptURL or Config.MainScriptURL == "" then
        warn("[NNVN] MainScriptURL is empty!")
        return
    end

    local ok, source = pcall(function()
        return game:HttpGet(Config.MainScriptURL)
    end)

    if not ok or type(source) ~= "string" or source == "" then
        warn("[NNVN] Failed to load main script from URL")
        return
    end

    local chunk, err = loadstring(source)
    if not chunk then
        warn("[NNVN] loadstring error:", err)
        return
    end

    local runOk, runErr = pcall(chunk)
    if not runOk then
        warn("[NNVN] Main script runtime error:", runErr)
    end
end

Patriot.Callbacks.OnFail = function(errorMsg)
    warn("Failed:", errorMsg)
end

Patriot:LaunchWilkins({
    serviceId = "nnvnhub",
    debug = false,
    kickOnDetect = false,
    openDashboard = true,
    validationTimeout = 600
})