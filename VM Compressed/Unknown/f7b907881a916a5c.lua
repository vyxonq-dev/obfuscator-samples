-- EZ keys V0.1
-- Gui to Lua
-- Version: 3.2
-- the stuff for preperation
local key = "HackerpanelV4Release" -- put youre key in here
local keylink = "https://discord.gg/N6nmdcPqrB" -- put your key link here
local nameofthescript = "Hacker panel V4" --put your script name here. leave blank too leave blank ig
local whoisitmadeby = "Roy aich" -- put your name here
local thenoteofthekey = "Paste the link on your browser (Auto copied )" --note you add here. leave blank to not have a note.
-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local KeySystem = Instance.new("Frame")
local KeyTextbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local scriptname = Instance.new("TextLabel")
local madeby = Instance.new("TextLabel")
local note = Instance.new("TextLabel")
--Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeySystem.Name = "KeySystem"
KeySystem.Parent = ScreenGui
KeySystem.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeySystem.BorderSizePixel = 0
KeySystem.Position = UDim2.new(0.379651636, 0, 0.32965821, 0)
KeySystem.Size = UDim2.new(0.240300864, 0, 0.340683579, 0)
KeySystem.Selectable = true
KeySystem.Active = true
KeySystem.Draggable = true
KeyTextbox.Name = "KeyTextbox"
KeyTextbox.Parent = KeySystem
KeyTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeyTextbox.BackgroundTransparency = 0.950
KeyTextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyTextbox.BorderSizePixel = 0
KeyTextbox.Position = UDim2.new(0.0939044505, 0, 0.734627843, 0)
KeyTextbox.Size = UDim2.new(0.813838542, 0, 0.161812291, 0)
KeyTextbox.Font = Enum.Font.Gotham
KeyTextbox.Text = "Enter Key"
KeyTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextbox.TextScaled = true
KeyTextbox.TextSize = 14.000
KeyTextbox.TextWrapped = true
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = KeyTextbox
UICorner_2.CornerRadius = UDim.new(0, 15)
UICorner_2.Parent = KeySystem
title.Name = "title"
title.Parent = KeySystem
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(0, 0, 0.0323624611, 0)
title.Size = UDim2.new(1, 0, 0.197411001, 0)
title.Font = Enum.Font.Gotham
title.Text = "Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true
TextButton.Parent = KeySystem
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 0.950
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0922570005, 0, 0.504854381, 0)
TextButton.Size = UDim2.new(0.813838542, 0, 0.161812291, 0)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Check Key"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
	if KeyTextbox.Text == key then
		TextButton.Text = "Correct Key!"
		task.wait(3)
            loadstring(game:HttpGet("https://pastebin.com/raw/JENSMvem"))()-- insert script on this line
		ScreenGui:Destroy()
	else
		TextButton.Text = "Wrong Key!"
		task.wait(2)
		TextButton.Text = "Check Key"
	end
end)
UICorner_3.CornerRadius = UDim.new(0, 15)
UICorner_3.Parent = TextButton
scriptname.Name = "scriptname"
scriptname.Parent = KeySystem
scriptname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptname.BackgroundTransparency = 1.000
scriptname.BorderColor3 = Color3.fromRGB(0, 0, 0)
scriptname.BorderSizePixel = 0
scriptname.Position = UDim2.new(0, 0, 0.262135923, 0)
scriptname.Size = UDim2.new(1, 0, 0.0809061453, 0)
scriptname.Font = Enum.Font.Gotham
scriptname.Text = nameofthescript
scriptname.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptname.TextScaled = true
scriptname.TextSize = 14.000
scriptname.TextWrapped = true
madeby.Name = "madeby"
madeby.Parent = KeySystem
madeby.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
madeby.BackgroundTransparency = 1.000
madeby.BorderColor3 = Color3.fromRGB(0, 0, 0)
madeby.BorderSizePixel = 0
madeby.Position = UDim2.new(0, 0, 0.368932039, 0)
madeby.Size = UDim2.new(1, 0, 0.0809061453, 0)
madeby.Font = Enum.Font.Gotham
madeby.Text = "Made by: " .. whoisitmadeby
madeby.TextColor3 = Color3.fromRGB(255, 255, 255)
madeby.TextScaled = true
madeby.TextSize = 14.000
madeby.TextWrapped = true
madeby.Visible = true
note.Name = "note"
note.Parent = KeySystem
note.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
note.BackgroundTransparency = 1.000
note.BorderColor3 = Color3.fromRGB(0, 0, 0)
note.BorderSizePixel = 0
note.Position = UDim2.new(0, 0, 0.919093847, 0)
note.Size = UDim2.new(1, 0, 0.0809061453, 0)
note.Font = Enum.Font.Gotham
note.Text = thenoteofthekey
note.TextColor3 = Color3.fromRGB(255, 255, 255)
note.TextScaled = true
note.TextSize = 14.000
note.TextWrapped = true
scriptname.Text = "Key Link Copied!"
setclipboard(keylink)
task.wait(3)
scriptname.Text = nameofthescript