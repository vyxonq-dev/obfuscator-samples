local games = {
    [16510724413] = "https://raw.githubusercontent.com/IdiotHub/Scripts/main/Pet%20Catcher/Pet%20Catchers%20Main",
    [17601705136] = "https://raw.githubusercontent.com/IdiotHub/Scripts/main/Random/TycoonRng",
    [17181264920] = "https://raw.githubusercontent.com/IdiotHub/Scripts/main/Random/CardRng",
    [18138547215] = "https://raw.githubusercontent.com/IdiotHub/Scripts/main/Random/AnimeCardBattle",
    [18901165922] = "https://raw.githubusercontent.com/IdiotHub/Scripts/main/Random/Pets%20Go",
    [85896571713843] = "https://raw.githubusercontent.com/IdiotHub/Scripts/refs/heads/main/BGSI/main.lua",
    [126884695634066] = "https://raw.githubusercontent.com/IdiotHub/Scripts/refs/heads/main/GAG/GAG.lua",
    [127742093697776] = "https://raw.githubusercontent.com/IdiotHub/Scripts/refs/heads/main/PvB/main.lua"
}

local scriptURL = games[game.PlaceId]
if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else 
    print("Game not supported by idiothub")
end
