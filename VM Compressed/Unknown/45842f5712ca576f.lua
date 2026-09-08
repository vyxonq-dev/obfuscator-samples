-- Loads In Scripts

local Scripts = "https://raw.githubusercontent.com/1MP3LT3/ScriptHub/refs/heads/main/Scripts/"
local PlaceId = game.PlaceId

local SupportedPlaces = {}

if table.find(SupportedPlaces, PlaceId) then
	loadstring(game:HttpGet(Scripts .. tostring(PlaceId) .. ".lua"))()
else
	loadstring(game:HttpGet(Scripts .. tostring(PlaceId) .. ".lua"))()
end
