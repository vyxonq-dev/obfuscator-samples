local Place = game.PlaceId
local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/NUTellaVING/ProjectPastel/main/Notify.lua"))()
if Place == 2753915549 or Place == 4442272183 or Place == 7449423635 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NUTellaVING/ProjectPastel/main/Games/BloxFruits.lua"))()
    Notify.New("[Successfully] - Game supported : Blox Fruits", 2)
else
    Notify.New("[Error] - Game not supported.", 2)
end