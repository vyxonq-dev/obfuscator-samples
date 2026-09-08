-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local Event = ReplicatedStorage:WaitForChild("DigControl")

-- OPEN SOURCE CONFIG (ANTI-KICK)
_G.DevWendelWhileDelay = 0.6
_G.DevWendelStartDelay = 2.5
_G.DevWendelClickDelay = 0.85
_G.DevWendelFinishDelay = 1
_G.DevWendelShovel = "Shovel1"
_G.DevWendelEnabled = false

-- RAYFIELD
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Auto Dig (Open Source Safe)",
    LoadingTitle = "Shovel Farm",
    LoadingSubtitle = "DigControl",
    ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Main", 4483362458)

-- UI
Tab:CreateToggle({
    Name = "Ativar Auto Dig",
    CurrentValue = false,
    Callback = function(v)
        _G.DevWendelEnabled = v
    end
})

Tab:CreateDropdown({
    Name = "Shovel",
    Options = {
        "Shovel1","Shovel2","Shovel3","Shovel4",
        "Shovel5","Shovel6","Shovel7","Shovel8"
    },
    CurrentOption = {"Shovel1"},
    Callback = function(v)
        _G.DevWendelShovel = v[1]
    end
})

Tab:CreateSlider({
    Name = "While Delay",
    Range = {0.3, 5},
    Increment = 0.1,
    CurrentValue = 0.6,
    Callback = function(v)
        _G.DevWendelWhileDelay = v
    end
})

Tab:CreateSlider({
    Name = "Start Delay",
    Range = {1, 5},
    Increment = 0.1,
    CurrentValue = 2.5,
    Callback = function(v)
        _G.DevWendelStartDelay = v
    end
})

Tab:CreateSlider({
    Name = "Click Delay",
    Range = {0.6, 2},
    Increment = 0.05,
    CurrentValue = 0.85,
    Callback = function(v)
        _G.DevWendelClickDelay = v
    end
})

Tab:CreateSlider({
    Name = "Finish Delay",
    Range = {0.5, 5},
    Increment = 0.1,
    CurrentValue = 1,
    Callback = function(v)
        _G.DevWendelFinishDelay = v
    end
})

-- FUNÇÃO OPEN SOURCE
local function getShovel()
    if player.Character and player.Character:FindFirstChild(_G.DevWendelShovel) then
        return player.Character[_G.DevWendelShovel]
    end
    if player.Backpack:FindFirstChild(_G.DevWendelShovel) then
        return player.Backpack[_G.DevWendelShovel]
    end
    return nil
end

-- LOOP OPEN SOURCE (5 CLICKS = SERVER OK)
task.spawn(function()
    while task.wait(_G.DevWendelWhileDelay) do
        if not _G.DevWendelEnabled then
            continue
        end

        local shovel = getShovel()
        if shovel then
            Event:FireServer("start", shovel, 0)
            task.wait(_G.DevWendelStartDelay)

            for i = 1, 5 do -- ⚠️ mínimo exigido pelo server
                Event:FireServer("click", shovel)
                task.wait(_G.DevWendelClickDelay)
            end

            Event:FireServer("finish", shovel, 0)
            task.wait(_G.DevWendelFinishDelay)
        end
    end
end)

