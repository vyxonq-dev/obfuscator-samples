local TeleportService = game:GetService("TeleportService")
local player = game:GetService("Players").LocalPlayer
local placeScripts = {
    -- Animal Hospital
    [78515283254292] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FN_AnimalHospital.lua"))()
        end)
    end,  

    -- Steal An Egg
    [107778070777162] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua"))()
        end)
    end,

    -- Animal Hospital (Game)
    [104522435597696] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FN_AnimalHospital.lua"))()
        end)
    end,

    -- Pls Donate 
    [8737602449] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Pls-Donate/refs/heads/main/AutoFarm.lua"))()
        end)
    end,

    -- KAT
    [621129760] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/KAT/refs/heads/main/main.lua"))()
        end)
    end,
    
    -- Build A Ring Farm
    [107646426076756] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn_BARF.lua"))()
        end)
    end,    
    
    -- Murder Mystery 2
    [142823291] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua"))()
        end)
    end,

    -- Gun Grounds FFA
    [12137249458] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Gun-Grounds-FFA/refs/heads/main/main.lua"))()
        end)
    end,

    -- Survive Zombie Arena (lobby)
    [114204398207377] = function()
        task.spawn(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname_SZA.lua"))()
        end)
    end,

    -- Survive Zombie Arena (arena)
    [98927955463992] = function()
        task.spawn(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname_SZA.lua"))()
        end)
    end,

    -- 99 Nights In The Forest (Lobby)
    [79546208627805] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))();
        end)
    end,

    -- 99 Nights In The Forest (Game)
    [126509999114328] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))();
        end)
    end,

    -- 99 Nights In The Forest (Update Party)
    [126371807511901] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))();
        end)
    end,

    -- Dead Rails (Lobby)
    [116495829188952] = function()
        task.spawn(function()
            task.wait(3)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname-Dr.lua"))()
        end)
    end,

    -- Dead Rails (Game)
    [70876832253163] = function()
        task.spawn(function()
            task.wait(5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname-Dr.lua"))()
        end)
    end,

    -- Grow a Garden 2
    [97598239454123] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FN_GAG2_skibidi.lua"))()
        end)
    end,
}

local runScript = placeScripts[game.PlaceId]
if runScript then
    runScript()
end
