local gameId = game.PlaceId
local supportedGames = {
    [6839171747] = "https://raw.githubusercontent.com/ZeScript/ZeScripts/refs/heads/main/Games/Doors",
}

local function loadScript(url)
    -- SET AUTHORIZATION GLOBALS BEFORE LOADING
    _G.AUTH_KEY = "DOORS_SCRIPT_V1_AUTH_2024"
    _G.SCRIPT_VERSION = "1.0.0"
    _G.AUTHORIZED_SOURCE = "OFFICIAL_LOADER"
    
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    
    if not success then
        warn("Failed to load script: " .. tostring(result))
        game.StarterGui:SetCore("SendNotification", {
            Title = "Script Hub",
            Text = "Failed to load script!",
            Duration = 5
        })
    end
end

if supportedGames[gameId] then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Script Hub",
        Text = "Loading script for this game...",
        Duration = 3
    })
    
    loadScript(supportedGames[gameId])
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "Script Hub",
        Text = "This game is not supported yet!",
        Duration = 5
    })
    
    print("Unsupported game. Place ID: " .. tostring(gameId))
end