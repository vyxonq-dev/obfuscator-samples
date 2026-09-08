local placeIdStr = string.format("%.0f", game.PlaceId)
local gameId = game.GameId

if placeIdStr == "2753915549"
or placeIdStr == "4442272183"
or placeIdStr == "79091703265657"
or placeIdStr == "7449423635"
or placeIdStr == "100117331123089" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tyxca01/ActriumHub/refs/heads/main/game/bloxfruits.lua", true))()
elseif gameId == 10200395747 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tyxca01/ActriumHub/refs/heads/main/game/GrowaGarden2.lua"))()
elseif gameId == 7326934954 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tyxca01/ActriumHub/refs/heads/main/game/99nightsintheforest.lua"))()
else 
    print("Unsupported PlaceId: " .. placeIdStr .. " | GameId: " .. tostring(gameId))
end
