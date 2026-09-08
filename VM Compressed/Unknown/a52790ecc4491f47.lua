_G.ThemeID = _G.ThemeID or nil
if _G.AutoTranslate == nil then _G.AutoTranslate = true end
if _G.SaveConfig == nil then _G.SaveConfig = true end
local placeId = game.PlaceId
local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId
if placeId == 7449423635 or placeId == 2753915549 or placeId == 4442272183 or placeId == 122478697296975 or placeId == 73902483975735 or UniverseID == 994732206 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/...../main/BloxFruits.lua"))()
	loadstring(game:HttpGet("https://github.com/TlDinhKhoi/Util/raw/refs/heads/main/NotifyBloxKid.luau"))()
    spawn(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/CauTrom.luau"))()
    end)
elseif placeId == 205224386 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/HideAndSeek.lua"))()
elseif placeId == 116495829188952 or placeId == 70876832253163 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/main/DeadRails.lua"))()
elseif UniverseID  == 7436755782 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/GrowaGarden.lua"))()
elseif UniverseID == 8316902627 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/PlantVsBrainrot.lua"))()
elseif placeId == 111989938562194 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/BrainrotEvolution.luau"))()
elseif placeId == 99567941238278 or placeId == 125009265613167 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/InkGame.lua"))()
elseif UniverseID == 7709344486 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/StealaBrainrot.lua"))()
elseif UniverseID == 7671049560 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/TheForge.lua"))()
end
