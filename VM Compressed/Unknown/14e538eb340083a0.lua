-- oficial discord ringta --> https://discord.gg/ringta

local deadRailsId = 116495829188952
local biteNightId = 70845479499574
local forsakenId = 18687417158
local stealBrainrotId = 109983668079237
local nights99Id = 79546208627805
local adoptId = 920587237
local inkId = 99567941238278

if game.PlaceId == deadRailsId or game.GameId == deadRailsId then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/erewe23/deadrailsring.github.io/refs/heads/main/ringta.lua"))()

elseif game.PlaceId == biteNightId or game.GameId == biteNightId then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ergerg4/bitenights.github.io/refs/heads/main/ringta.lua"))()

elseif game.PlaceId == forsakenId or game.GameId == forsakenId then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/34f3f/forsaken.github.io/refs/heads/main/ringtabublik.lua"))()

elseif game.PlaceId == stealBrainrotId or game.GameId == stealBrainrotId then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ringta9321/steala.github.io/refs/heads/main/brainrot.lua"))()

elseif game.PlaceId == nights99Id or game.GameId == nights99Id then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wehibuyfgyuwe/99nights.github.io/refs/heads/main/ringta.lua"))()

elseif game.PlaceId == adoptId or game.GameId == adoptId then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eeeiqjj876y/adoptme.github.io/refs/heads/main/ringta.lua"))()

elseif game.PlaceId == inkId or game.GameId == inkId then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef34/inkgames.github.io/refs/heads/main/ringta.lua"))()

else
    game.Players.LocalPlayer:Kick("Ringta Hub | game not suported")
end
