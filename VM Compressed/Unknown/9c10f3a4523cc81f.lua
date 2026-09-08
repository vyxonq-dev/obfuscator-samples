--[[
                                                 .                  .    .
                                           .  *          *           *
                                                \        |         /   .
                               .    .            .      /^\     .              .    .
                                  *    I\   /\    /\  / / \ \  /\    /\   /I    *
                              . .   .  I  \ \/ /\ \ / /     \ \ / /\ \/ /  I .     .
                                       \ I _ _\/_ _ \_\_ _ /_/_ _\/_ _ \_/
                                         \  *  *  *   \ \/ /  *  *  *  /
                                          ` ~ ~ ~ ~ ~  ~\/~ ~ ~ ~ ~ ~ '

                                            Developer: Real King (zreal_king)
                                      Discord : https://discord.gg/KhbVuU6465                   

Supported Games:
[1] Evade - https://www.roblox.com/games/9872472334/Evade 
[2] Murder Mystery 2 - https://www.roblox.com/games/142823291/Murder-Mystery-2
[3] KAT - https://www.roblox.com/games/621129760/KAT
[4] SHARP - https://www.roblox.com/games/113506071094099/SHARP
[5] Zombie: HyperLoot - https://www.roblox.com/games/100822312246972/Zombie-HyperLoot
[6] Rainbow Friends - https://www.roblox.com/games/7991339063/Rainbow-Friends
[7] Sell Lemons - https://www.roblox.com/games/79268393072444/Sell-Lemons
[8] Universal - Support All Games
]]

local scripts = {
    [9872472334] = "https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua",
    [10808838353] = "https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua",
    [10539706691] = "https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua",
    [10324347967] = "https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua",
    [10662542523] = "https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua",
    [10324346056] = "https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua",
    [7991339063] = "https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua",
    [13622985049] = "https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua",
    [8888615802] = "https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua",
    [13622981808] = "https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua",
    [100822312246972] = "https://raw.githubusercontent.com/zReal-King/Zombie-HyperLoot/refs/heads/main/Main.lua",
    [77595602575472] = "https://raw.githubusercontent.com/zReal-King/Zombie-HyperLoot/refs/heads/main/Main.lua",
    [120710626328951] = "https://raw.githubusercontent.com/zReal-King/Zombie-HyperLoot/refs/heads/main/Main.lua",
    [621129760] = "https://raw.githubusercontent.com/zReal-King/Knife-Ability-Test/main/Gui",
    [105834187369271] = "https://raw.githubusercontent.com/zReal-King/SHARP/refs/heads/main/Main.lua",
    [113506071094099] = "https://raw.githubusercontent.com/zReal-King/SHARP/refs/heads/main/Main.lua",
    [93853815957083] = "https://raw.githubusercontent.com/zReal-King/SHARP/refs/heads/main/Main.lua",
    [102085041605973] = "https://raw.githubusercontent.com/zReal-King/SHARP/refs/heads/main/Main.lua",
    [102904878271905] = "https://raw.githubusercontent.com/zReal-King/SHARP/refs/heads/main/Main.lua",
    [142823291] = "https://raw.githubusercontent.com/zReal-King/Murder-Mystery-2/refs/heads/main/Main.lua",
    [79268393072444] = "https://raw.githubusercontent.com/zReal-King/Sell-Lemons/refs/heads/main/Main.lua",
}

local id = game.PlaceId
local url = scripts[id]

if url then
    local success, err = pcall(function() loadstring(game:HttpGet(url))() end)
    if not success then warn("Error: " .. err) end
else
    print("No available script for PlaceId " .. id .. ", loading Universal...")
    pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Universal/refs/heads/main/Main.lua")))
end
