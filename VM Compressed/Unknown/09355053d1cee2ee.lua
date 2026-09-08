-- My updates table: https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/NewUpdates

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local placeId = game.PlaceId
local q = syn and syn.queue_on_teleport or queue_on_teleport or queueonteleport

if q then
    q("loadstring(game:HttpGet('https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/Loader'))()")
end

    if placeId == 116495829188952 or placeId == 70876832253163 or placeId == 7018190066 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/Scripts/Dead%20Rails"))()
end


--[[
if placeId == 73956553001240 or placeId == 74691681039273 or placeId == 79136731857959 or placeId == 86789627188240 or placeId == 96802054849934 or placeId == 103521881639626 or placeId == 109684591839194 or placeId == 117134837736236 or placeId == 122069199001617 or placeId == 134314141048307 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/Scripts/VolleyBallLegends"))()
end

--]]

if placeId == 126884695634066 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/Scripts/GrowAGarden"))()
end

if placeId == 109983668079237 or placeId == 96342491571673 or placeId == 128762245270197 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/Scripts/StealABrainrot"))()
end

if placeId == 126509999114328 or placeId == 79546208627805 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SevenIsYouScripts/BlankX-HUB/refs/heads/main/Scripts/99"))()
end
