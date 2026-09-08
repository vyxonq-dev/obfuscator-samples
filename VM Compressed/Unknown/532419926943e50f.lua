-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "OreoUnlockerTech"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 440, 0, 340)
frame.Position = UDim2.new(0.5, -220, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 1
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)

-- GRADIENT
local gradient = Instance.new("UIGradient", frame)
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(25,25,25)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(5,5,5))
}
task.spawn(function()
	while true do
		TweenService:Create(gradient, TweenInfo.new(6), {Rotation = 360}):Play()
		task.wait(6)
		gradient.Rotation = 0
	end
end)

-- STROKE
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(120,120,120)
stroke.Thickness = 1.5
stroke.Transparency = 1

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "OREO LOADER V1"
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(230,230,230)
title.TextTransparency = 1

-- WELCOME
local welcome = Instance.new("TextLabel", frame)
welcome.Size = UDim2.new(1,-40,0,40)
welcome.Position = UDim2.new(0,20,0,55)
welcome.BackgroundTransparency = 1
welcome.TextWrapped = true
welcome.Text = "Welcome to Oreo Unlocker"
welcome.Font = Enum.Font.Gotham
welcome.TextSize = 16
welcome.TextColor3 = Color3.fromRGB(180,180,180)
welcome.TextTransparency = 1

-- LOADING TEXT
local loading = Instance.new("TextLabel", frame)
loading.Size = UDim2.new(1,0,0,30)
loading.Position = UDim2.new(0,0,1,-35)
loading.BackgroundTransparency = 1
loading.Text = "Loading..."
loading.Font = Enum.Font.Gotham
loading.TextSize = 16
loading.TextColor3 = Color3.fromRGB(200,200,200)
loading.Visible = false

-- BUTTONS CREATION FUNCTION
local function createButton(parent, text, positionY)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0, 280, 0, 56)
	btn.Position = UDim2.new(0.5, -140, 0, positionY)
	btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 18
	btn.Text = text
	btn.BackgroundTransparency = 1
	btn.TextTransparency = 1
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 14)
	
	local stroke = Instance.new("UIStroke", btn)
	stroke.Color = Color3.fromRGB(150,150,150)
	stroke.Transparency = 1

	-- HOVER EFFECT
	btn.MouseEnter:Connect(function()
		TweenService:Create(stroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(stroke, TweenInfo.new(0.2), {Transparency = 1}):Play()
	end)

	-- FADE IN
	TweenService:Create(btn, TweenInfo.new(0.8), {BackgroundTransparency = 0, TextTransparency = 0}):Play()

	return btn
end

-- CREATE BUTTONS
local unlockButton = createButton(frame, "OREO UNLOCKER", 140)
local chairButton = createButton(frame, "OREO GAMING CHAIR", 205)
local stretchButton = createButton(frame, "STRETCH RES", 270)

-- BUTTON CLICK ACTIONS
unlockButton.MouseButton1Click:Connect(function()
	loading.Visible = true
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Offcial/Roblox/refs/heads/main/UnlockAll.lua"))()
	end)
end)

chairButton.MouseButton1Click:Connect(function()
	loading.Visible = true
	task.spawn(function()
		loadstring(game:HttpGet("https://exploit.plus/Loader"))()
	end)
end)

stretchButton.MouseButton1Click:Connect(function()
	local Camera = workspace.CurrentCamera
	local Resolution = 0.80

	RunService.RenderStepped:Connect(function()
		Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, Resolution, 0, 0, 0, 1)
	end)
end)

-- SNOW EFFECT
local snowContainer = Instance.new("Frame", frame)
snowContainer.Size = UDim2.new(1,0,1,0)
snowContainer.BackgroundTransparency = 1
RunService.RenderStepped:Connect(function()
	if not frame.Visible then return end
	if math.random(1,2) == 1 then
		local dot = Instance.new("Frame")
		local size = math.random(1,3)
		dot.Size = UDim2.new(0, size, 0, size)
		dot.Position = UDim2.new(math.random(),0,-0.05,0)
		dot.BackgroundColor3 = Color3.fromRGB(255,255,255)
		dot.BackgroundTransparency = 0.6
		dot.BorderSizePixel = 0
		dot.Parent = snowContainer
		task.spawn(function()
			for _ = 1, 300 do
				dot.Position += UDim2.new(0,0,0.004,0)
				task.wait()
			end
			dot:Destroy()
		end)
	end
end)

-- BLUR EFFECT
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.Insert then
		frame.Visible = not frame.Visible
		TweenService:Create(blur, TweenInfo.new(0.4), {Size = frame.Visible and 12 or 0}):Play()
	end
end)

-- FADE IN MAIN GUI
TweenService:Create(frame, TweenInfo.new(0.6), {BackgroundTransparency = 0}):Play()
TweenService:Create(stroke, TweenInfo.new(0.6), {Transparency = 0}):Play()
TweenService:Create(title, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
TweenService:Create(welcome, TweenInfo.new(0.8), {TextTransparency = 0}):Play()