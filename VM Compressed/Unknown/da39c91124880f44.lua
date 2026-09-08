-- ZERO HUB LOADER
-- 3 Second Loading
-- Executes Starborn Font Script

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZeroHubLoader"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Background
local Main = Instance.new("Frame")
Main.Size = UDim2.new(1,0,1,0)
Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

-- Blue Glow Effect
local Glow = Instance.new("Frame")
Glow.Size = UDim2.new(1.6,0,1.6,0)
Glow.Position = UDim2.new(-0.3,0,-0.3,0)
Glow.BackgroundColor3 = Color3.fromRGB(0,120,255)
Glow.BackgroundTransparency = 0.75
Glow.BorderSizePixel = 0
Glow.Parent = Main

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(1,0)
GlowCorner.Parent = Glow

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0.1,0)
Title.Position = UDim2.new(0,0,0.39,0)
Title.BackgroundTransparency = 1
Title.Text = "ZERO HUB"
Title.TextColor3 = Color3.fromRGB(0,170,255)
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true
Title.Parent = Main

-- Loading Bar BG
local BarBG = Instance.new("Frame")
BarBG.Size = UDim2.new(0.42,0,0.022,0)
BarBG.Position = UDim2.new(0.29,0,0.52,0)
BarBG.BackgroundColor3 = Color3.fromRGB(20,20,20)
BarBG.BorderSizePixel = 0
BarBG.Parent = Main

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1,0)
BarCorner.Parent = BarBG

-- Fill Bar
local Fill = Instance.new("Frame")
Fill.Size = UDim2.new(0,0,1,0)
Fill.BackgroundColor3 = Color3.fromRGB(0,170,255)
Fill.BorderSizePixel = 0
Fill.Parent = BarBG

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1,0)
FillCorner.Parent = Fill

-- Percent Text
local Percent = Instance.new("TextLabel")
Percent.Size = UDim2.new(1,0,0.05,0)
Percent.Position = UDim2.new(0,0,0.56,0)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.TextColor3 = Color3.fromRGB(255,255,255)
Percent.Font = Enum.Font.GothamBold
Percent.TextScaled = true
Percent.Parent = Main

-- Glow Animation
TweenService:Create(
	Glow,
	TweenInfo.new(
		3,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.InOut,
		-1,
		true
	),
	{
		Rotation = 20,
		BackgroundTransparency = 0.55
	}
):Play()

-- Loading Animation
task.spawn(function()
	for i = 1,100 do
		Fill.Size = UDim2.new(i/100,0,1,0)
		Percent.Text = i.."%"
		task.wait(0.03)
	end
end)

-- Execute Script Earlier So Font Loads Faster
task.spawn(function()
	task.wait(0.5)

	loadstring(game:HttpGet(
		"https://rawscripts.net/raw/Universal-Script-starborn-font-70229"
	))()
end)

task.wait(3)

-- Fade Out
for _,v in pairs(ScreenGui:GetDescendants()) do
	if v:IsA("Frame") then
		TweenService:Create(v,TweenInfo.new(0.4),{
			BackgroundTransparency = 1
		}):Play()

	elseif v:IsA("TextLabel") then
		TweenService:Create(v,TweenInfo.new(0.4),{
			TextTransparency = 1
		}):Play()
	end
end

task.wait(0.5)

ScreenGui:Destroy()