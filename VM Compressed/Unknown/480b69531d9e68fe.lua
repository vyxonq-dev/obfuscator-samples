getgenv().autofarm = false
getgenv().Autoreset = false

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Victory Race autofarm", "Ocean")
local Autofarm = Window:NewTab("Autofarm")
local Section = Autofarm:NewSection("Autofarm")
local Misc = Window:NewTab("Misc")
local Miscel = Misc:NewSection("Misc")

Section:NewToggle("Autofarm (1 Sec reset - Very Buggy) ", "Teleports to the end", function(bool)
    getgenv().autofarm = bool
    if bool then
        autofarmEnd3()
    end
end)

Section:NewToggle("Autofarm (2 Sec Reset - Somewhat Buggy) ", "Teleports to the end", function(bool)
    getgenv().autofarm = bool
    if bool then
        autofarmEnd2()
    end
end)

Section:NewToggle("Autofarm (3 Sec Reset)", "Teleports to the end", function(bool)
    getgenv().autofarm = bool
    if bool then
        autofarmEnd15()
    end
end)

Section:NewToggle("Fast Autofarm (Buggy) ", "FASTEST AUTOFARM", function(bool)
    getgenv().autofarm = bool
    if bool then
        autofarmwins()
    end
end)

Section:NewButton("Reset", "Resets your character", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)


Miscel:NewSlider("Walkspeed", "Changes your Walkspeed", 500000000, 16, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)



function autofarmEnd3()
    spawn(function()
        while getgenv().autofarm == true do    
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(875.757568359375, 58092.63671875, -971838.875)
            wait(1)
            local studs = 100 -- How many studs forward
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            char.Humanoid:MoveTo(char.HumanoidRootPart.Position+char.HumanoidRootPart.CFrame.lookVector*studs)
            wait(1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end)
end

function autofarmEnd2()
    spawn(function()
        while getgenv().autofarm == true do    
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(875.757568359375, 58092.63671875, -971838.875)
            wait(1)
            local studs = 20 -- How many studs forward
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            char.Humanoid:MoveTo(char.HumanoidRootPart.Position+char.HumanoidRootPart.CFrame.lookVector*studs)
            wait(2)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end)
end

function autofarmEnd15()
    spawn(function()
        while getgenv().autofarm == true do    
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(875.757568359375, 58092.63671875, -971838.875)
            wait(1)
            local studs = 20 -- How many studs forward
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            char.Humanoid:MoveTo(char.HumanoidRootPart.Position+char.HumanoidRootPart.CFrame.lookVector*studs)
            wait(3)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end)
end

function autofarmwins()
    spawn(function()
        while getgenv().autofarm == true do
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if tostring(v) == "Win" and v:IsA("Part") then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait(0.1)
                    break
                end
            end
        end
    end)
end


