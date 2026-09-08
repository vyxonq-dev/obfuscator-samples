local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Name = "IntroGUI"

-- Màn hình đen
local blackCover = Instance.new("Frame")
blackCover.Size = UDim2.new(0, 0, 1, 0)
blackCover.Position = UDim2.new(0, 0, 0, 0)
blackCover.BackgroundColor3 = Color3.new(0, 0, 0)
blackCover.BorderSizePixel = 0
blackCover.ZIndex = 5
blackCover.Parent = screenGui

TweenService:Create(blackCover, TweenInfo.new(0.5), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

-- Nội dung
local container = Instance.new("Frame")
container.BackgroundTransparency = 1
container.Size = UDim2.new(1, 0, 1, 0)
container.Position = UDim2.new(0, 0, 0, 0)
container.ZIndex = 6
container.Parent = screenGui

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0.12, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.Text = "Loop Dash Tech Rework Script By YQANTG"
title.ZIndex = 7
title.TextStrokeTransparency = 0.6
title.Parent = container

-- Prompt Yes/No
local promptFrame = Instance.new("Frame")
promptFrame.Size = UDim2.new(0.6, 0, 0.14, 0)
promptFrame.Position = UDim2.new(0.3, 0, 0.27, 0)
promptFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
promptFrame.BorderSizePixel = 0
promptFrame.ZIndex = 8
promptFrame.Visible = false
promptFrame.Parent = container

local promptText = Instance.new("TextLabel")
promptText.Size = UDim2.new(1, 0, 0.5, 0)
promptText.Position = UDim2.new(0, 0, 0, 0)
promptText.BackgroundTransparency = 1
promptText.TextColor3 = Color3.new(1, 1, 1)
promptText.Font = Enum.Font.GothamBold
promptText.TextSize = 18
promptText.Text = "Do you want to use it now?"
promptText.ZIndex = 9
promptText.Parent = promptFrame

local yesBtn = Instance.new("TextButton")
yesBtn.Size = UDim2.new(0.45, 0, 0.4, 0)
yesBtn.Position = UDim2.new(0.03, 0, 0.55, 0)
yesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
yesBtn.Text = "Yes"
yesBtn.Font = Enum.Font.Gotham
yesBtn.TextColor3 = Color3.new(1, 1, 1)
yesBtn.TextSize = 16
yesBtn.ZIndex = 9
yesBtn.Parent = promptFrame

local noBtn = Instance.new("TextButton")
noBtn.Size = UDim2.new(0.45, 0, 0.4, 0)
noBtn.Position = UDim2.new(0.52, 0, 0.55, 0)
noBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
noBtn.Text = "No"
noBtn.Font = Enum.Font.Gotham
noBtn.TextColor3 = Color3.new(1, 1, 1)
noBtn.TextSize = 16
noBtn.ZIndex = 9
noBtn.Parent = promptFrame

-- Dòng chữ
local lines = {
        "-- Script by YQANTG",
	"-- Turn Off Shiftlock To Use Loop Dash Tech",
        "-- Fix Teleport ( Teleport = Remove )",
	"-- Ping 100 ↓",
}

-- Vùng hiển thị text
local scrollFrame = Instance.new("Frame")
scrollFrame.Size = UDim2.new(0.9, 0, 0.55, 0)
scrollFrame.Position = UDim2.new(0.05, 0, 0.17, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ZIndex = 6
scrollFrame.Parent = container

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 6)
layout.Parent = scrollFrame

-- Rainbow màu
local function rainbowEffect(label)
	local hue = 0
	RunService.RenderStepped:Connect(function()
		hue = (hue + 0.0015) % 1
		label.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
	end)
end

-- Gõ từng dòng
local function typeText(text, parent)
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0, 20)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.TextSize = 16
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Text = ""
	textLabel.ZIndex = 6
	textLabel.TextStrokeTransparency = 0.7
	textLabel.Parent = parent

	for i = 1, #text do
		textLabel.Text = string.sub(text, 1, i)
		task.wait(0.02)
	end

	local sound = Instance.new("Sound", textLabel)
	sound.SoundId = "rbxassetid://7147420522"
	sound.Volume = 15
	sound:Play()
	game.Debris:AddItem(sound, 2)

	rainbowEffect(textLabel)
end

-- Đóng intro
local function closeIntro()
	local fade = Instance.new("Frame")
	fade.BackgroundColor3 = Color3.new(0, 0, 0)
	fade.Size = UDim2.new(1, 0, 1, 0)
	fade.Position = UDim2.new(0, 0, 0, 0)
	fade.BackgroundTransparency = 1
	fade.ZIndex = 100
	fade.Parent = screenGui

	TweenService:Create(fade, TweenInfo.new(0.6), {
		BackgroundTransparency = 0
	}):Play()
	wait(0.7)
	screenGui:Destroy()
end

-- Phát sound khi bấm Yes/No
local function playClickSound()
	local sound = Instance.new("Sound", screenGui)
	sound.SoundId = "rbxassetid://8394620892"
	sound.Volume = 15
	sound:Play()
	game.Debris:AddItem(sound, 2)
end

yesBtn.MouseButton1Click:Connect(function()
	playClickSound()
	pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Loop%20Dash%20Rework%20Script"))()
	end)
	closeIntro()
end)

noBtn.MouseButton1Click:Connect(function()
	playClickSound()
	closeIntro()
end)

-- Hiển thị intro
task.spawn(function()
	for _, line in ipairs(lines) do
		typeText(line, scrollFrame)
		task.wait(0.3)
	end
	wait(0.3)
	promptFrame.Visible = true

	-- Phát sound khi hiển thị Yes/No
	local showSound = Instance.new("Sound", promptFrame)
	showSound.SoundId = "rbxassetid://3442983711"
	showSound.Volume = 15
	showSound:Play()
	game.Debris:AddItem(showSound, 3)
end)
