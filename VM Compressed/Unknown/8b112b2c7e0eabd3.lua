local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local RAW_KEY = "imp1234"
local unlocked = false

local function normalize(str)
	return string.lower((str or ""):gsub("%s+", ""))
end

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

local function round(obj, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r)
	c.Parent = obj
end

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.fromOffset(420, 230)
keyFrame.Position = UDim2.fromScale(-0.4, 0.5)
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
keyFrame.Active = true
keyFrame.Draggable = true
keyFrame.Parent = gui
round(keyFrame, 14)

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1,0,0,40)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "IMPERIAL HUB"
keyTitle.Font = Enum.Font.Ubuntu
keyTitle.TextSize = 24
keyTitle.TextColor3 = Color3.fromRGB(230,230,230)
keyTitle.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.fromOffset(300,40)
keyBox.Position = UDim2.fromOffset(60,80)
keyBox.PlaceholderText = "Enter Key"
keyBox.Text = ""
keyBox.ClearTextOnFocus = false
keyBox.Font = Enum.Font.Ubuntu
keyBox.TextSize = 18
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
keyBox.Parent = keyFrame
round(keyBox,10)

local hint = Instance.new("TextLabel")
hint.Size = UDim2.new(1,0,0,20)
hint.Position = UDim2.fromOffset(0,135)
hint.BackgroundTransparency = 1
hint.Text = "Press ENTER to proceed"
hint.Font = Enum.Font.Ubuntu
hint.TextSize = 13
hint.TextColor3 = Color3.fromRGB(180,180,180)
hint.Parent = keyFrame

TweenService:Create(keyFrame, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
	Position = UDim2.fromScale(0.5,0.5)
}):Play()

TweenService:Create(blur, TweenInfo.new(1), {Size = 18}):Play()

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.fromOffset(460,360)
mainFrame.Position = UDim2.fromScale(0.5,0.5)
mainFrame.AnchorPoint = Vector2.new(0.5,0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui
round(mainFrame,14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "IMPERIAL HUB"
title.Font = Enum.Font.Ubuntu
title.TextSize = 22
title.TextColor3 = Color3.new(1,1,1)
title.Parent = mainFrame

local function makeButton(text, y)
	local b = Instance.new("TextButton")
	b.Size = UDim2.fromOffset(380,40)
	b.Position = UDim2.fromOffset(40,y)
	b.Text = text
	b.Font = Enum.Font.Ubuntu
	b.TextSize = 16
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(55,55,55)
	b.Parent = mainFrame
	round(b,10)
	return b
end

local b1 = makeButton("Fish it GUI", 60)
local b2 = makeButton("Chloe X (Fish It)", 110)
local b3 = makeButton("JinHub", 160)
local b4 = makeButton("Anti Kick (Toggle)", 210)
local b5 = makeButton("Admin Commands", 260)

b2.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MajestySkie/Chloe-X/main/Main/ChloeX"))()
end)

local antiKick = false
b4.MouseButton1Click:Connect(function()
	antiKick = not antiKick
	b4.Text = antiKick and "Anti Kick: ON" or "Anti Kick: OFF"
end)

b5.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

local credits = Instance.new("TextLabel")
credits.Size = UDim2.new(1,0,0,20)
credits.Position = UDim2.fromOffset(0,320)
credits.BackgroundTransparency = 1
credits.Text = "CREDITS TO ALL CREATORS OF THOSE SCRIPTS!"
credits.Font = Enum.Font.Ubuntu
credits.TextSize = 12
credits.TextColor3 = Color3.fromRGB(160,160,160)
credits.Parent = mainFrame

local function unlock()
	if normalize(keyBox.Text) ~= RAW_KEY then
		keyBox.Text = ""
		keyBox.PlaceholderText = "Wrong key"
		return
	end

	unlocked = true

	TweenService:Create(blur, TweenInfo.new(0.6), {Size = 0}):Play()

	local out = TweenService:Create(keyFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
		Position = UDim2.fromScale(1.4,0.5)
	})
	out:Play()
	out.Completed:Wait()

	keyFrame.Visible = false
	mainFrame.Visible = true
end

keyBox.FocusLost:Connect(function(enter)
	if enter then unlock() end
end)

UIS.InputBegan:Connect(function(i,gp)
	if gp then return end
	if i.KeyCode == Enum.KeyCode.T and unlocked then
		mainFrame.Visible = not mainFrame.Visible
	end
end)
