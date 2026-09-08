--// Orange GUI Hub (FINAL)
--// LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer

--// ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OrangeGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

--// Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.fromScale(0.45, 0.55)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255, 140, 60)

--// ===== DRAGGABLE =====
do
	local dragging = false
	local dragStart, startPos

	Main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			Main.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

--// Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 0.12, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🟧 Orange GUI Hub"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255, 190, 120)
Title.Parent = Main

--// Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.fromScale(0.08, 0.1)
MinBtn.Position = UDim2.fromScale(0.92, 0.06)
MinBtn.AnchorPoint = Vector2.new(0.5, 0.5)
MinBtn.Text = "–"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextScaled = true
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 120, 60)
MinBtn.Parent = Main
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1,0)

local minimized = false
local fullSize = Main.Size

MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	MinBtn.Text = minimized and "+" or "–"
	TweenService:Create(
		Main,
		TweenInfo.new(0.25),
		{Size = minimized and UDim2.fromScale(0.45,0.15) or fullSize}
	):Play()
end)

--// Button creator
local function createButton(text, yPos, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.fromScale(0.8, 0.13)
	btn.Position = UDim2.fromScale(0.5, yPos)
	btn.AnchorPoint = Vector2.new(0.5, 0.5)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = color
	btn.AutoButtonColor = false
	btn.Parent = Main
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,14)

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {
			BackgroundColor3 = color:Lerp(Color3.new(1,1,1),0.2)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {
			BackgroundColor3 = color
		}):Play()
	end)

	return btn
end

--// Buttons
local CurrentAngelBtn = createButton("CurrentAngel Reanimate", 0.28, Color3.fromRGB(255,140,60))
local JohnDoeBtn     = createButton("John Doe (Forsaken)", 0.44, Color3.fromRGB(200,80,80))
local EpikBtn        = createButton("Epik Dancezz (Laggy)", 0.60, Color3.fromRGB(90,120,255))
local KrystalBtn     = createButton("Krystal Dance V3 (Hemi)", 0.76, Color3.fromRGB(170,90,210))

--// ===== WARNING POPUP =====
local WarningFrame = Instance.new("Frame")
WarningFrame.Size = UDim2.fromScale(0.7, 0.38)
WarningFrame.Position = UDim2.fromScale(0.5, 0.5)
WarningFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WarningFrame.BackgroundColor3 = Color3.fromRGB(25,25,30)
WarningFrame.Visible = false
WarningFrame.Parent = ScreenGui
Instance.new("UICorner", WarningFrame).CornerRadius = UDim.new(0,16)

local WarnText = Instance.new("TextLabel")
WarnText.Size = UDim2.fromScale(0.9, 0.55)
WarnText.Position = UDim2.fromScale(0.5, 0.1)
WarnText.AnchorPoint = Vector2.new(0.5, 0)
WarnText.BackgroundTransparency = 1
WarnText.TextWrapped = true
WarnText.TextScaled = true
WarnText.Font = Enum.Font.GothamBold
WarnText.TextColor3 = Color3.fromRGB(255,120,120)
WarnText.Text =
	"⚠ WARNING\n\n" ..
	"the script still bug\n" ..
	"can have a chance to crash or\n" ..
	"force close if you device too weak"
WarnText.Parent = WarningFrame

--// EXECUTE BUTTON
local ConfirmBtn = Instance.new("TextButton")
ConfirmBtn.Size = UDim2.fromScale(0.42, 0.22)
ConfirmBtn.Position = UDim2.fromScale(0.27, 0.82)
ConfirmBtn.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmBtn.Text = "EXECUTE ANYWAY"
ConfirmBtn.Font = Enum.Font.GothamBold
ConfirmBtn.TextScaled = true
ConfirmBtn.TextColor3 = Color3.new(1,1,1)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(200,80,80)
ConfirmBtn.Parent = WarningFrame
Instance.new("UICorner", ConfirmBtn).CornerRadius = UDim.new(0,14)

--// CANCEL BUTTON
local CancelBtn = Instance.new("TextButton")
CancelBtn.Size = UDim2.fromScale(0.42, 0.22)
CancelBtn.Position = UDim2.fromScale(0.73, 0.82)
CancelBtn.AnchorPoint = Vector2.new(0.5, 0.5)
CancelBtn.Text = "maybe nevermind 💀"
CancelBtn.Font = Enum.Font.GothamBold
CancelBtn.TextScaled = true
CancelBtn.TextColor3 = Color3.new(1,1,1)
CancelBtn.BackgroundColor3 = Color3.fromRGB(90,90,90)
CancelBtn.Parent = WarningFrame
Instance.new("UICorner", CancelBtn).CornerRadius = UDim.new(0,14)

--// ===== SCRIPT EXECUTION =====

CurrentAngelBtn.MouseButton1Click:Connect(function()
	if not game:IsLoaded() then game.Loaded:Wait() end
	local settings = _G
	settings["Use default animations"] = true
	settings["Local character transparency level"] = 1
	settings["Disable character scripts"] = true
	settings["Fake character should collide"] = true
	settings["Parent real character to fake character"] = false
	settings["Respawn character"] = true
	settings["Instant respawn"] = false
	settings["Hide HumanoidRootPart"] = false
	settings["PermaDeath fake character"] = true
	settings["R15 Reanimate"] = false
	settings["Click Fling"] = false
	settings["Anti-Fling"] = true
	settings["Hide RootPart Distance"] = CFrame.new(255,255,0)
	settings["Allow tool equipping"] = false
	settings["Client sided display mode"] = 1
	settings["Fallback prompt"] = true
	settings["Respawn mode"] = "ServerBreakJoints"
	settings["Names to exclude from transparency"] = {}

	loadstring(game:HttpGet(
		"https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"
	))()
end)

JohnDoeBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(
		"https://rawscripts.net/raw/Universal-Script-John-doe-forsaken-v1-58705"
	))()
end)

EpikBtn.MouseButton1Click:Connect(function()
	WarningFrame.Visible = true
end)

ConfirmBtn.MouseButton1Click:Connect(function()
	WarningFrame.Visible = false
	loadstring(game:HttpGet(
		"https://raw.githubusercontent.com/TheEGodOfficial/fard-dances/refs/heads/main/Epik%20R6%20Dancezz%20modded%20and%20better.lua"
	))()
end)

CancelBtn.MouseButton1Click:Connect(function()
	WarningFrame.Visible = false
end)

KrystalBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(
		"https://rawscripts.net/raw/Universal-Script-FIXED-Krystal-Dance-V3-48682"
	))()
end)