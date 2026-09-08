local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Kitty Gui (Full Version)", "Ocean")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Codes From Game Kitty")

Section:NewButton("Attack Code ", "Work Mouse & Kitty", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Attack"):FireServer()
end)

Section:NewButton("PutTrap", "Work Kitty & Mouse (Mouse no can walk)", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PutTrap"):FireServer()
end)

Section:NewButton("Kill Traps", "Work Mouse", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("KillTrap"):FireServer()
end)

Section:NewSlider("WalkSpeed", "Change you Speed", 100, 16, function(s) -- 100 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("JumpPower", "Change You Jump", 250, 50, function(s) -- 250 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end)

Section:NewTextBox("WalkSpeed", "Change You speeds", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end)

Section:NewTextBox("JumpPower", "Change You JumpPower", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end)

Section:NewButton("Infinite Jump", "You No Can Disable", function()
    loadstring(game:HttpGet("https://freenote.biz/raw/SsJKoJxEHN"))()
end)

Section:NewButton("Infinite yeild", "Admin Commands", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local Tab = Window:NewTab("Guis")
local Section = Tab:NewSection("Guis Script")

Section:NewButton("Esp", "esp Op", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/3DPbeHvh"))()
end)

Section:NewButton("Kitty Gui", "Op Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkolymYT/Scriptss/master/KittyGUI.lua"))()
end)

Section:NewButton("Kitty Gui Chapter 1", "Work in Chapter 1", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MwXkxRam"))()
end)

Section:NewButton("Tp Items Gui", "Op Teleport Items", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/Z0DPwpNh'),true))()
end)

Section:NewButton("Simple Script", "Old Version", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/Z0DPwpNh'),true))()
end)

Section:NewButton("Simple Gui", "New Version", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vxtGXu8a"))()
end)

local Tab = Window:NewTab("Skins Mouse Op")
local Section = Tab:NewSection("Found Footage From Data Kitty")

Section:NewButton("Great Hair Mouse", "wow ", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/SW3R8f7s"))()
end)

Section:NewButton("Red Eye Mouse", "...", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/WyaBLU8N"))()
end)

Section:NewButton("PenGuin", "...", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/W9gzPLvT"))()
end)

Section:NewButton("Comboy Event Mouse", "shhhhhhh.", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/qf2gU6mU"))()
end)

Section:NewButton("Invisible 100% Mouse", "Become Ghost ðŸ‘»", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ta5DZqU5"))()
end)

Section:NewButton("Gab Studio", "Creator Kitty", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/UgSci3YS"))()
end)

Section:NewButton("BlockHead", "Obama?", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/WuTpzeee"))()
end)

Section:NewButton("Hat Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/VmjC8LTg"))()
end)

Section:NewButton("Glasses Black Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/wuMe64nC"))()
end)

Section:NewButton("Rainbow Neon + Epic Face Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/mnCrCcuv"))()
end)

Section:NewButton("Wheel Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/nNapjRTc"))()
end)

Section:NewButton("Yellow Cat Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/uRtwXd6b"))()
end)

Section:NewButton("[Fixed] Snow Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Tyw7jkCU"))()
end)

Section:NewButton("[Fixed] Glasses Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Z2KUf83c"))()
end)

Section:NewButton("[Fixed] Pink Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/K4tUrEUU"))()
end)

Section:NewButton("[Fixed] Evil Mouse", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KAAXHi1h"))()
end)

local Tab = Window:NewTab("simplespy")
local Section = Tab:NewSection("Simple Spy 3")

Section:NewButton("Simplespy Beta (Nothing)", "...", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))()
end)

Section:NewButton("Simplespy", "...", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)

Section:NewButton("simplespy Mobile", "...", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end)

Section:NewButton("Simplespy V2", "...", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Protected.lua%20(22).txt"))()
end)

local Tab = Window:NewTab("Keybinds")
local Section = Tab:NewSection("Keyboard Press F = Hide/Show")

Section:NewButton("Keyboard For Mobile ", "keyboard for mobile", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

Section:NewButton("Custom Keyboard & Search For Mobile", "Keyboard for Mobile", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))()
end)

Section:NewKeybind("Keybinds", "...", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

local Tab = Window:NewTab("Revive (Follow Steps)")
local Section = Tab:NewSection("Revive Lobby Work Party Mode&Chapters")

Section:NewButton("Step 1 Click", "Code : Leave From Spectator", function()
    game:GetService("ReplicatedStorage").Events.Leave:FireServer()
end)

Section:NewButton("Step 2 Click", "Join Game Or Become Spectator", function()
    game:GetService("ReplicatedStorage").Events.Join:FireServer()
end)

local Tab = Window:NewTab("Hide And Seek")
local Section = Tab:NewSection("Work In Hide and Seek Only")

Section:NewButton("Transform (Being)", "Wtf Being", function()
    loadstring(game:HttpGet("https://freenote.biz/raw/YoG24K8JRg"))()
end)

Section:NewButton("Transform", "Wth", function()
    loadstring(game:HttpGet("https://freenote.biz/raw/pkttZVKdCc"))()
end)

Section:NewButton("UnTransform", "ReU", function()
    loadstring(game:HttpGet("https://freenote.biz/raw/xJq4ot4fOp"))()
end)

Section:NewButton("Clone", "No cooldown", function()
    loadstring(game:HttpGet("https://freenote.biz/raw/XjqkF675v9"))()
end)

local Tab = Window:NewTab("Update&Version")
local Section = Tab:NewSection("Fixed Mouse")
local Section = Tab:NewSection("New Function")
local Section = Tab:NewSection("New LocalPlayer")
local Section = Tab:NewSection("+Hide And Seek")
local Section = Tab:NewSection("Delete Toggles")
local Section = Tab:NewSection("Version&Next")
local Section = Tab:NewSection("1.0.0")
local Section = Tab:NewSection("1.1.0")
local Section = Tab:NewSection("1.2.0 Now Version")
local Section = Tab:NewSection("1.3.0")
local Section = Tab:NewSection("1.4.0")
local Section = Tab:NewSection("1.5.0")

local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("Credit To Owner - Me")