local TeleportService = game:GetService("TeleportService")
local player = game:GetService("Players").LocalPlayer
local placeScripts = {
    -- 99 Nights In The Forest (Lobby)
    [79546208627805] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FNDayFarm.lua"))();
        end)
    end,

    -- 99 Nights In The Forest (Game)
    [126509999114328] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FNDayFarm.lua"))();
        end)
    end,

    -- 99 Nights In The Forest (Update Party)
    [126371807511901] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FNDayFarm.lua"))();
        end)
    end,

    -- Dead Rails (Lobby)
    [116495829188952] = function()
        task.spawn(function()
            task.wait(3)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/afkar-gg/sc/refs/heads/main/auto-bond"))()
        end)
    end,

    -- Dead Rails (Game)
    [70876832253163] = function()
        task.spawn(function()
            task.wait(5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/afkar-gg/sc/refs/heads/main/auto-bond"))()
        end)
    end,

    -- Runaways lobby
    [118418618261207] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://afkar.lol/script/larijirlobby"))()
        end)
    end,  

    -- Runaways game
    [117311404196294] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://afkar.lol/script/larijirgame"))()
        end)
    end
}

local runScript = placeScripts[game.PlaceId]
if runScript then
    runScript()
end
