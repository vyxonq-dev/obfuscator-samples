------MADE BY NOLAR_ASKER!------
-- Credits to gui to lua and nolar_asker, dont touch this line if you are trying to copy.

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local kat = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local katopwithkey = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local dragdetect = Instance.new("UIDragDetector", Frame)
local uis = game:GetService("UserInputService")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
uis.InputBegan:Connect(function(input, game)
	if game then return end
	if input.KeyCode == Enum.KeyCode.LeftControl then
		if ScreenGui.Enabled == true then
			ScreenGui.Enabled = false
		else
			ScreenGui.Enabled = true
		end
	end
end)

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.25460124, -30, 0.185230032, 7)
Frame.Size = UDim2.new(0, 660, 0, 504)

UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.172979832, 0, 0.846608937, 0)
TextLabel.Size = UDim2.new(0, 431, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Best Exploit Hubs"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = TextLabel

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0954545438, 0, 0.0773809552, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.FredokaOne
TextButton.Text = "Infinite Yield"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextStrokeTransparency = 0.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = TextButton

kat.Name = "kat"
kat.Parent = Frame
kat.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
kat.BorderColor3 = Color3.fromRGB(0, 0, 0)
kat.BorderSizePixel = 0
kat.Position = UDim2.new(0.0954545438, 0, 0.287698418, 0)
kat.Size = UDim2.new(0, 200, 0, 50)
kat.Font = Enum.Font.FredokaOne
kat.Text = "Knife Ability Test"
kat.TextColor3 = Color3.fromRGB(255, 255, 255)
kat.TextScaled = true
kat.TextSize = 14.000
kat.TextStrokeTransparency = 0.000
kat.TextWrapped = true
kat.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Kat-Plus/main/Script"))()
end)

UICorner_4.CornerRadius = UDim.new(0, 10)
UICorner_4.Parent = kat

katopwithkey.Name = "katopwithkey"
katopwithkey.Parent = Frame
katopwithkey.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
katopwithkey.BorderColor3 = Color3.fromRGB(0, 0, 0)
katopwithkey.BorderSizePixel = 0
katopwithkey.Position = UDim2.new(0.0954545438, 0, 0.501984119, 0)
katopwithkey.Size = UDim2.new(0, 200, 0, 50)
katopwithkey.Font = Enum.Font.FredokaOne
katopwithkey.Text = "Knife Ability Test OP (Easy Key System)"
katopwithkey.TextColor3 = Color3.fromRGB(255, 255, 255)
katopwithkey.TextScaled = true
katopwithkey.TextSize = 14.000
katopwithkey.TextStrokeTransparency = 0.000
katopwithkey.TextWrapped = true
katopwithkey.MouseButton1Click:Connect(function()
	pcall(loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Knife-Ability-Test/main/Gui')))
end)

UICorner_5.CornerRadius = UDim.new(0, 10)
UICorner_5.Parent = katopwithkey