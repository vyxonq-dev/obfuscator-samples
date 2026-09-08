--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Helper: wait for character safely
local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

--// GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ToolsGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 220)
mainFrame.Position = UDim2.new(0.5, -140, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

-- RGB Outline
local function applyRGBOutline(target)
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Parent = target
	RunService.RenderStepped:Connect(function()
		stroke.Color = Color3.fromHSV((tick() % 5) / 5, 1, 1)
	end)
end
applyRGBOutline(mainFrame)

-- Title
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Size = UDim2.new(1, -12, 0, 28)
title.Position = UDim2.new(0, 6, 0, 6)
title.BackgroundTransparency = 1
title.Text = "Tools"
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Respawn Button
local respawnButton = Instance.new("TextButton")
respawnButton.Size = UDim2.new(0, 260, 0, 36)
respawnButton.Position = UDim2.new(0, 10, 0, 50)
respawnButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
respawnButton.Text = "Respawn"
respawnButton.Font = Enum.Font.Arcade
respawnButton.TextScaled = true
respawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
respawnButton.Parent = mainFrame
local respawnCorner = Instance.new("UICorner")
respawnCorner.CornerRadius = UDim.new(0, 6)
respawnCorner.Parent = respawnButton
applyRGBOutline(respawnButton)

-- Walk-on-wall Button
local wallButton = Instance.new("TextButton")
wallButton.Size = UDim2.new(0, 260, 0, 36)
wallButton.Position = UDim2.new(0, 10, 0, 96)
wallButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
wallButton.Text = "Walk on Wall (Locked)"
wallButton.Font = Enum.Font.Arcade
wallButton.TextScaled = true
wallButton.TextColor3 = Color3.fromRGB(255, 255, 255)
wallButton.Parent = mainFrame
local wallCorner = Instance.new("UICorner")
wallCorner.CornerRadius = UDim.new(0, 6)
wallCorner.Parent = wallButton
applyRGBOutline(wallButton)

-- Noclip Button
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0, 260, 0, 36)
noclipButton.Position = UDim2.new(0, 10, 0, 142)
noclipButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
noclipButton.Text = "Enable Noclip"
noclipButton.Font = Enum.Font.Arcade
noclipButton.TextScaled = true
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.Parent = mainFrame
local noclipCorner = Instance.new("UICorner")
noclipCorner.CornerRadius = UDim.new(0, 6)
noclipCorner.Parent = noclipButton
applyRGBOutline(noclipButton)

-- Password Frame for Wall Walk
local passFrame = Instance.new("Frame")
passFrame.Size = UDim2.new(0, 230, 0, 100)
passFrame.Position = UDim2.new(0.5, -115, 0.5, -50)
passFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passFrame.BorderSizePixel = 0
passFrame.Parent = screenGui
passFrame.Visible = false
local passCorner = Instance.new("UICorner")
passCorner.CornerRadius = UDim.new(0, 8)
passCorner.Parent = passFrame
applyRGBOutline(passFrame)

local passLabel = Instance.new("TextLabel")
passLabel.Size = UDim2.new(1, -12, 0, 28)
passLabel.Position = UDim2.new(0, 6, 0, 8)
passLabel.BackgroundTransparency = 1
passLabel.Text = "Enter password to unlock"
passLabel.Font = Enum.Font.Arcade
passLabel.TextScaled = true
passLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
passLabel.Parent = passFrame

local passBox = Instance.new("TextBox")
passBox.Size = UDim2.new(1, -20, 0, 32)
passBox.Position = UDim2.new(0, 10, 0, 44)
passBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
passBox.PlaceholderText = "Password"
passBox.Text = ""
passBox.ClearTextOnFocus = false
passBox.Font = Enum.Font.Arcade
passBox.TextScaled = true
passBox.TextColor3 = Color3.fromRGB(255, 255, 255)
passBox.Parent = passFrame
local passBoxCorner = Instance.new("UICorner")
passBoxCorner.CornerRadius = UDim.new(0, 6)
passBoxCorner.Parent = passBox
applyRGBOutline(passBox)

local passEnter = Instance.new("TextButton")
passEnter.Size = UDim2.new(0, 80, 0, 28)
passEnter.Position = UDim2.new(1, -90, 1, -36)
passEnter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
passEnter.Text = "OK"
passEnter.Font = Enum.Font.Arcade
passEnter.TextScaled = true
passEnter.TextColor3 = Color3.fromRGB(255, 255, 255)
passEnter.Parent = passFrame
local passEnterCorner = Instance.new("UICorner")
passEnterCorner.CornerRadius = UDim.new(0, 6)
passEnterCorner.Parent = passEnter
applyRGBOutline(passEnter)

--// RESPawn button
respawnButton.MouseButton1Click:Connect(function()
	local character = player.Character
	if character then
		character:BreakJoints()
	end
end)

--// Noclip system
local noclipEnabled = false
local noclipConnection

local function enableNoclip()
	local character = getCharacter()
	noclipEnabled = true
	noclipButton.Text = "Disable Noclip"
	noclipConnection = RunService.Stepped:Connect(function()
		if noclipEnabled and character and character:FindFirstChildOfClass("Humanoid") then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end)
end

local function disableNoclip()
	noclipEnabled = false
	noclipButton.Text = "Enable Noclip"
	if noclipConnection then
		noclipConnection:Disconnect()
	end
end

noclipButton.MouseButton1Click:Connect(function()
	if noclipEnabled then
		disableNoclip()
	else
		enableNoclip()
	end
end)

player.CharacterAdded:Connect(function()
	disableNoclip()
end)

--// Walk-on-wall button with password + respawn on disable
local wallWalkEnabled = false
local PASSWORD = "hacks"

local function promptPassword()
	passBox.Text = ""
	passFrame.Visible = true
end

wallButton.MouseButton1Click:Connect(function()
	local character = player.Character
	if wallWalkEnabled then
		wallWalkEnabled = false
		wallButton.Text = "Walk on Wall (Locked)"
		if character then
			character:BreakJoints()
		end
	else
		promptPassword()
	end
end)

passEnter.MouseButton1Click:Connect(function()
	local attempt = tostring(passBox.Text or "")
	passFrame.Visible = false
	if attempt == PASSWORD then
		wallWalkEnabled = true
		wallButton.Text = "Walk on Wall (ON)"
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Walk-on-walls-20546"))()
	else
		wallButton.Text = "Wrong Password"
		delay(1.2, function()
			if not wallWalkEnabled then
				wallButton.Text = "Walk on Wall (Locked)"
			else
				wallButton.Text = "Walk on Wall (ON)"
			end
		end)
	end
end)

passBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		passEnter:MouseButton1Click()
	end
end)

player.CharacterAdded:Connect(function()
	wallWalkEnabled = false
	wallButton.Text = "Walk on Wall (Locked)"
end)