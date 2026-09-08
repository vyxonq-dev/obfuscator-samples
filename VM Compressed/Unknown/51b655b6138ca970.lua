local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZZZ/Kavo-UI-Library/main/Kavo.lua"))()
local Window = Library.CreateLib("Kitty Gui Advanced", "LightTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Codes From Game Kitty")

Section:NewButton("Attack Code ", "Work Mouse & Kitty", function()
   
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Attack"):FireServer()
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

local Tab = Window:NewTab("Op?")
local Section = Tab:NewSection("Revive Lobby Work Party Mode&Chapters")

Section:NewButton("Revive", "Code : Leave From Spectator", function()
    game:GetService("ReplicatedStorage").Events.Leave:FireServer()
game:GetService("ReplicatedStorage").Events.Join:FireServer()
end)

Section:NewButton("Leave", "Code : Bye", function()

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Leave"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Leave"):FireServer()
end)

Section:NewButton("God Mode", "Code : Op?", function()

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Join"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Leave"):FireServer()
end)

Section:NewButton("Attack Gui", "", function()

local ScreenGui1 = Instance.new("ScreenGui") 
ScreenGui1.Parent = game.CoreGui

local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = ScreenGui1
TextButton1.BackgroundColor3 = Color3.fromRGB(242,243,243)
TextButton1.Position = UDim2.new(0,0,0)
TextButton1.Size = UDim2.new(0.10,0.15,0.15)
TextButton1.TextColor3 = Color3.fromRGB(17,17,17)
TextButton1.Text = "Attack"
TextButton1.TextSize = 18

TextButton1.MouseButton1Click:Connect(function() 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Attack"):FireServer()
end)
TextButton1.Draggable = true
TextButton1.Active = true
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
local Section = Tab:NewSection("Op?")
local Section = Tab:NewSection("New Function")
local Section = Tab:NewSection("Close/Open Gui")
local Section = Tab:NewSection("Delete Remote Spy")
local Section = Tab:NewSection("New Theme and Change Themes in Credit")
local Section = Tab:NewSection("Version&Next")
local Section = Tab:NewSection("1.0.0")
local Section = Tab:NewSection("1.1.0")
local Section = Tab:NewSection("1.2.0 ")
local Section = Tab:NewSection("1.3.0 Now Alpha Version")
local Section = Tab:NewSection("1.4.0")
local Section = Tab:NewSection("1.5.0")

local Tab = Window:NewTab("Credits & Others")
local Section = Tab:NewSection("Credit To Owner - Unknown")

local Section = Tab:NewSection("Free Bobux Enter Down")

Section:NewTextBox("Enter Password", "i clickbait", function(txt)
game.Players.LocalPlayer:Kick("i Clickbait Lol")
end)

local Section = Tab:NewSection("Change Themes")

Section:NewButton("Light Theme", "Code :  ", function()

loadstring(game:HttpGet("https://pastebin.com/raw/Jn98qkRc"))()
end)

Section:NewButton("Dark Theme", "  ", function()

loadstring(game:HttpGet("https://pastebin.com/raw/cBDsu1UJ"))()
end)

Section:NewButton("Grape Theme", " 🍇🍇🍇", function()

loadstring(game:HttpGet("https://pastebin.com/raw/bvHy9ssW"))()
end)

Section:NewButton("Blood Theme", "Code :  ", function()

loadstring(game:HttpGet("https://pastebin.com/raw/9HJ59LPp"))()
end)

Section:NewButton("Ocean Theme", "Code :  ", function()

loadstring(game:HttpGet("https://pastebin.com/raw/bng6ikdy"))()
end)

Section:NewButton("Midnight Theme", "Code :  ", function()

loadstring(game:HttpGet("https://pastebin.com/raw/2qzspqTL"))()
end)

local gui = Instance.new("ScreenGui")
gui.Name = "patrickGui"
gui.Parent = game.CoreGui

--screengui = gui



	local TextButton = Instance.new("TextButton")
-- Text
TextButton.Text = "Kitty"
TextButton.TextSize = 24
-- Color
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.BackgroundColor3 = Color3.new(18, 238, 212)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
-- thickness
TextButton.BorderSizePixel = 4
-- Text Code
TextButton.Font = Enum.Font.Code
-- Size
TextButton.Size = UDim2.new(0.10, 0, 0.15, 15)
-- Posisition
TextButton.Position = UDim2.new(0, 0, 0.4, 0)

TextButton.MouseButton1Click:Connect (function()
Library:ToggleUI()
end)
TextButton.Parent = gui
TextButton.Draggable = true

	local cornerUI = Instance.new("UICorner")
cornerUI.CornerRadius = UDim.new(0, 5)
cornerUI.Parent = TextButton

	local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.new(1, 1, 1)
    uiStroke.Thickness = 2
    uiStroke.Parent = TextButton
    