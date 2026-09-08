local Players = game:GetService("Players")
local placeId = game.PlaceId

local function loadSCPHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/voidpathhub/VoidPath-SCP-Roleplay/refs/heads/main/VoidPath%20Script%20Hub.luau"))()
end

local function loadRakeHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/voidpathhub/Void-Path-Rake-The-Rake-Remastered/refs/heads/main/VoidPath%20Script%20Hub.luau"))()
end

local function load3008Hub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/voidpathhub/VoidPath-SCP-3008/refs/heads/main/VoidPath%20Script%20Hub.luau"))()
end

if placeId == 2768379856 then -- SCP - 3008
    load3008Hub()
elseif placeId == 5041144419 then -- SCP: Roleplay
    loadSCPHub()
elseif placeId == 2413927524 then -- The Rake: Remastered
    loadRakeHub()
else
    Players.LocalPlayer:Kick("Game not supported.")
end
