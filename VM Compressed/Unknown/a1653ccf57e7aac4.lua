local SUPPORTED_GAMES = {
    [18794863104] = true,
    [18199615050] = true,
    [130565641176498] = true,
    [6348640020] = true,
    [6137321701] = true
}

local currentPlaceId = game.PlaceId

if SUPPORTED_GAMES[currentPlaceId] then
    local PulseHub = loadstring(game:HttpGet("https://pulsehubb.vercel.app/scripts/verify.lua"))()
    
    PulseHub.ShowKeyUI(function(result)
        if result.script then
            print("Script loaded:", result.script.name)
        elseif result.no_script_for_game then
            print("No script for this game")
        end
    end)
else
    warn("[PulseHub] This game is not supported. PlaceId:", currentPlaceId)
end
