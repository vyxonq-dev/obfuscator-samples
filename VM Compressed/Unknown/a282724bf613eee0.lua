-- ShizaHub loader
-- Usage in executor:
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Gerreiro68/ShizaHub/main/loader.lua"))()

local RAW_BASE = "https://raw.githubusercontent.com/Gerreiro68/ShizaHub/main/"

local Scripts = {
    SpeedKeyboard = {
        Name = "1+ Speed Keyboard",
        Path = "Games/1%2B%20speed%20keyboard.lua",
    },

    Evade = {
        Name = "Evade",
        Path = "Games/evade.lua",
    },

    -- Future scripts template:
    -- NewGame = {
    --     Name = "New Game Script",
    --     Path = "Games/new%20game.lua",
    -- },
}

local Games = {
    ["95082159892680"] = Scripts.SpeedKeyboard,
    ["118941584817777"] = Scripts.SpeedKeyboard,
    ["9872472334"] = Scripts.Evade,

    -- Future game IDs template:
    -- ["PLACE_ID_OR_GAME_ID"] = Scripts.NewGame,
}

local function notify(title, message)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = 5,
        })
    end)
end

local placeId = tostring(game.PlaceId)
local gameId = tostring(game.GameId)
local selectedScript = Games[placeId] or Games[gameId]

if not selectedScript then
    local message = ("Unsupported game. PlaceId: %s | GameId: %s"):format(placeId, gameId)

    warn("[ShizaHub] " .. message)
    notify("ShizaHub", message)
    return
end

local scriptUrl = selectedScript.Url or (RAW_BASE .. selectedScript.Path)

notify("ShizaHub", "Loading " .. selectedScript.Name .. "...")

local ok, source = pcall(function()
    return game:HttpGet(scriptUrl, true)
end)

if not ok or type(source) ~= "string" or source == "" then
    local message = "Failed to download script: " .. tostring(source)

    warn("[ShizaHub] " .. message)
    notify("ShizaHub", message)
    return
end

local chunk, loadError = loadstring(source)

if not chunk then
    local message = "Failed to load script: " .. tostring(loadError)

    warn("[ShizaHub] " .. message)
    notify("ShizaHub", message)
    return
end

local runOk, runError = pcall(chunk)

if not runOk then
    local message = "Script error: " .. tostring(runError)

    warn("[ShizaHub] " .. message)
    notify("ShizaHub", message)
    return
end

notify("ShizaHub", selectedScript.Name .. " loaded.")
