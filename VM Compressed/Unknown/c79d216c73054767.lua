local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.fromOffset(320, 110)
Frame.Position = UDim2.fromOffset(-340, 20)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Icon = Instance.new("ImageLabel")
Icon.Parent = Frame
Icon.Size = UDim2.fromOffset(46, 46)
Icon.Position = UDim2.fromOffset(10, 10)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://134883493916931"

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.fromOffset(220, 22)
Title.Position = UDim2.fromOffset(66, 8)
Title.BackgroundTransparency = 1
Title.Text = "Tired of key systems?"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local Desc = Instance.new("TextLabel")
Desc.Parent = Frame
Desc.Size = UDim2.fromOffset(220, 36)
Desc.Position = UDim2.fromOffset(66, 30)
Desc.BackgroundTransparency = 1
Desc.Text = "Skip the wait and ads.\nGet instant access for cheap."
Desc.TextColor3 = Color3.fromRGB(190, 190, 190)
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 13
Desc.TextWrapped = true
Desc.TextXAlignment = Enum.TextXAlignment.Left

local SliderBar = Instance.new("Frame")
SliderBar.Parent = Frame
SliderBar.Size = UDim2.fromOffset(220, 6)
SliderBar.Position = UDim2.fromOffset(66, 70)
SliderBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SliderBar.BorderSizePixel = 0

Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

local SliderFill = Instance.new("Frame")
SliderFill.Parent = SliderBar
SliderFill.Size = UDim2.fromScale(1, 1)
SliderFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderFill.BorderSizePixel = 0

Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

local CopyButton = Instance.new("TextButton")
CopyButton.Parent = Frame
CopyButton.Size = UDim2.fromOffset(80, 24)
CopyButton.Position = UDim2.fromOffset(206, 84)
CopyButton.Text = "COPY"
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 12
CopyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.BorderSizePixel = 0

Instance.new("UICorner", CopyButton).CornerRadius = UDim.new(0, 6)

local TotalDuration = 6
local TimeElapsed = 0
local SliderTween

TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Position = UDim2.fromOffset(20, 20)
}):Play()

SliderTween = TweenService:Create(SliderFill, TweenInfo.new(TotalDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
	Size = UDim2.fromScale(0, 1)
})
SliderTween:Play()

local destroyConnection
destroyConnection = RunService.Heartbeat:Connect(function(delta)
	TimeElapsed = TimeElapsed + delta
	if TimeElapsed >= TotalDuration then
		destroyConnection:Disconnect()
		TweenService:Create(Frame, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			Position = UDim2.fromOffset(-340, 20)
		}):Play()
		task.delay(0.45, function()
			ScreenGui:Destroy()
		end)
	end
end)

local Dragging = false

SliderBar.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = true
		if SliderTween then
			SliderTween:Pause()
		end
	end
end)

SliderBar.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(i)
	if Dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
		local relativeX = math.clamp((i.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
		SliderFill.Size = UDim2.fromScale(relativeX, 1)
		TimeElapsed = TotalDuration * (1 - relativeX)
	end
end)

CopyButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discors.gg/cpshub")
	end
	CopyButton.Text = "COPIED"
end)
script_key = "KEY" -- Paste your key here or if the script is free put trial
loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/c010b125467c79d75edb8fe1c49bfedc0c01eefc3d8035d9bc020bb4aec0f9f8.lua"))()
