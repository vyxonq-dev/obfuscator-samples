local allowedPlaceIds = {
    [131623223084840] = "https://api.jnkie.com/api/v1/luascripts/public/0281994590a350f058a0325b43e6c4c79f860137c794b9adb45ad1e66bd58b24/download",
}

local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

local scriptToRun = allowedPlaceIds[game.PlaceId]

if scriptToRun then
    loadstring(game:HttpGet(scriptToRun))()
else
    -- Optional: Prints the ID to console (F9) so you can see why it failed
    warn("Your PlaceId is:", game.PlaceId)
    player:Kick("Unsupported game. PlaceId: " .. tostring(game.PlaceId))
end
