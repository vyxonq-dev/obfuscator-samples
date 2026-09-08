local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Frakki's Sonic Ultimate RPG GUI | 1.0", "RJTheme3")

local Tab = Window:NewTab("LocalPlayer")
local Section = Tab:NewSection("LocalPlayer")

Section:NewSlider("WalkSpeed", "Changing your WalkSpeed", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("JumpPower", "Changing your JumpPower", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


local Tab = Window:NewTab("Rings")
local Section = Tab:NewSection("Rings")

Section:NewButton("Collect all rings", "Collecting all rings until rings respawn", function()
    for i,v in pairs(game:GetDescendants()) do
    if v.Name == 'Ring' then
    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
    end
end)

Section:NewButton("Collect all rings (LOOP) ", "Loops the Collect all rings command", function()
    while wait(10) do
    for i,v in pairs(game:GetDescendants()) do
    if v.Name == 'Ring' then
    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
    end
    end
end)

local Tab = Window:NewTab("Chaos Emeralds")
local Section = Tab:NewSection("Chaos Emeralds")

Section:NewButton("White", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.White.CFrame
end)

Section:NewButton("Blue", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.Blue.CFrame
end)

Section:NewButton("Cyan", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.Cyan.CFrame
end)

Section:NewButton("Green", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.Green.CFrame
end)

Section:NewButton("Purple", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.Purple.CFrame
end)

Section:NewButton("Red", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.Red.CFrame
end)

Section:NewButton("Yellow", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ChaosEmeralds.Yellow.CFrame
end)

local Tab = Window:NewTab("Mics")
local Section = Tab:NewSection("Close GUI")

Section:NewKeybind("CloseGUI", "Closes the GUI", Enum.KeyCode.LeftAlt, function()
    Library:ToggleUI()
end)

local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("Coded By Frakki#9546")