loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/DiscordPromptModule.lua"))()

if game.PlaceId == 16828215247 then
    print("Loading RNG Rollers")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/RngRollers.lua"))()
elseif game.PlaceId == 10033487652 then
    print("Loading Clicker League")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/Clicker%20League.lua"))()
elseif game.PlaceId == 15106261598 then
    print("Loading Epic Tappers")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/EpicTappers.lua"))()
elseif game.PlaceId == 13801782542 then
    print("Chicken Tycoon")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/ChickenTycoon.lua"))()
elseif game.PlaceId == 3101667897 then
    print("Loading Legends Of Speed")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/LegendsOfSpeed"))()
elseif game.PlaceId == 3956818381 then
    print("Loading Ninja Legends")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/NinjaLegends"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/Games/DefaultHub.lua"))()
end
