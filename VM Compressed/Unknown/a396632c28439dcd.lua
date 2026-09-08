--{{SCRIPT BY NIKITOSIK_9088/JJSPLOIT2A,ENJOY!}}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local UserInput = game:GetService("UserInputService")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
local uiStroke = Instance.new("UIStroke", mainFrame)
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Thickness = 2

local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)
UserInput.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		local goal = {
			Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		}
		TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), goal):Play()
	end
end)

local logo = Instance.new("TextLabel", mainFrame)
logo.Size = UDim2.new(0, 60, 0, 60)
logo.Position = UDim2.new(0, 15, 0, 15)
logo.Text = "⭐"
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 36
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", logo).CornerRadius = UDim.new(0, 8)
logo.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UIStroke", logo).Thickness = 2

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(0, 380, 0, 50)
title.Position = UDim2.new(0, 85, 0, 25)
title.Text = "PrismX Injector"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
local gradient = Instance.new("UIGradient", title)
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
	ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255,127,0)),
	ColorSequenceKeypoint.new(0.34, Color3.fromRGB(255,255,0)),
	ColorSequenceKeypoint.new(0.51, Color3.fromRGB(0,255,0)),
	ColorSequenceKeypoint.new(0.68, Color3.fromRGB(0,0,255)),
	ColorSequenceKeypoint.new(0.85, Color3.fromRGB(75,0,130)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(148,0,211))
}

local textBoxContainer = Instance.new("ScrollingFrame", mainFrame)
textBoxContainer.Size = UDim2.new(0, 480, 0, 200)
textBoxContainer.Position = UDim2.new(0, 10, 0, 80)
textBoxContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
textBoxContainer.ScrollBarThickness = 8
Instance.new("UICorner", textBoxContainer).CornerRadius = UDim.new(0, 6)

local textBox = Instance.new("TextBox", textBoxContainer)
textBox.Size = UDim2.new(1, -10, 1, -10)
textBox.Position = UDim2.new(0, 5, 0, 5)
textBox.MultiLine = true
textBox.ClearTextOnFocus = false
textBox.TextWrapped = true
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.Font = Enum.Font.Code
textBox.TextSize = 20
textBox.TextColor3 = Color3.fromRGB(230,230,230)
textBox.BackgroundTransparency = 1

local function updateCanvas()
	local absSize = textBox.AbsoluteSize
	local textSize = TextService:GetTextSize(
		textBox.Text,
		textBox.TextSize,
		textBox.Font,
		Vector2.new(absSize.X, math.huge)
	)
	local neededY = math.max(textSize.Y + 20, textBoxContainer.AbsoluteSize.Y)
	textBox.Size = UDim2.new(1, -10, 0, neededY)
	textBoxContainer.CanvasSize = UDim2.new(0, 0, 0, neededY + 10)
end

textBox:GetPropertyChangedSignal("Text"):Connect(updateCanvas)
textBoxContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvas)
updateCanvas()

local buttonNames = {"Execute", "Scripts", "Clear"}
local buttons = {}
for i, name in ipairs(buttonNames) do
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(0, 140, 0, 40)
	btn.Position = UDim2.new(0, 10 + (i-1)*160, 0, 295)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 20
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	btn.AutoButtonColor = false
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
	Instance.new("UIStroke", btn).Thickness = 1
	buttons[name] = btn
end

local hubFrame = Instance.new("Frame", screenGui)
hubFrame.Size = UDim2.new(0, 400, 0, 550)
hubFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
hubFrame.AnchorPoint = Vector2.new(0.5, 0.5)
hubFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
hubFrame.Visible = false
Instance.new("UICorner", hubFrame).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", hubFrame).Thickness = 2

local closeHub = Instance.new("TextButton", hubFrame)
closeHub.Size = UDim2.new(0, 30, 0, 30)
closeHub.Position = UDim2.new(1, -35, 0, 5)
closeHub.Text = "X"
closeHub.Font = Enum.Font.GothamBold
closeHub.TextSize = 18
closeHub.TextColor3 = Color3.fromRGB(255,255,255)
closeHub.BackgroundColor3 = Color3.fromRGB(100,30,30)
Instance.new("UICorner", closeHub).CornerRadius = UDim.new(0,6)

local functions = {
	{"Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
	{"LALOL", "https://raw.githubusercontent.com/its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"},
	{"ZeroHub", "https://raw.githubusercontent.com/dnezero/zerohub/refs/heads/main/main.lua"},
    {"AquaMatrix", "https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"},
	{"GhostHub", "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"},
	{"ESP", "https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"},
	{"System broken", "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"},
	{"script:by JJsploit2a/Nikitosik_9088"}
}
for i, info in ipairs(functions) do
	local btn = Instance.new("TextButton", hubFrame)
	btn.Size = UDim2.new(0, 360, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, 50 + (i-1)*60)
	btn.Text = info[1]
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 18
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(65,65,65) end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50,50,50) end)
	btn.MouseButton1Click:Connect(function()
		spawn(function()
			loadstring(game:HttpGet(info[2]))()
		end)
	end)
end

buttons.Execute.MouseButton1Click:Connect(function()
	pcall(function()
		loadstring(textBox.Text)()
	end)
end)
buttons.Clear.MouseButton1Click:Connect(function()
	textBox.Text = ""
end)
buttons.Scripts.MouseButton1Click:Connect(function()
	hubFrame.Visible = true
end)
closeHub.MouseButton1Click:Connect(function()
	hubFrame.Visible = false
end)
