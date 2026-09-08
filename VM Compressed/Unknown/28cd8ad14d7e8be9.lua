local gameID = game.GameId

local scripts = {
    [2232507648] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/untitledAttackOnTitan.lua",
    [210851291] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/BuildABoatForTreasure.lua",
    [111958650] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/ArsenalAimbot.lua",
    [8599518829] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/BuildaStoneMiner.lua",
    [9105897479] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/YourBank!.lua"
}

if scripts[gameID] then
    loadstring(game:HttpGet(scripts[gameID]))()
else
    local player = game.Players.LocalPlayer
    player:Kick("Haven't support this game yet !")
end
