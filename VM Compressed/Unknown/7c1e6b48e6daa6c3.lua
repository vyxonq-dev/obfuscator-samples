-- Key system settings
local correctKey = "Razzyisbig"
local discordLink = "https://discord.gg/vEVMhTkDtg"
local scriptUrl = "https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server87"

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "KeySystem"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 400, 0, 220)
frame.Position = UDim2.new(0.5, -200, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 0.1

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🔑 Enter Key to Continue"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.new(0, 0, 0)
title.BackgroundTransparency = 1

local textBox = Instance.new("TextBox", frame)
textBox.PlaceholderText = "Enter Key Here"
textBox.Size = UDim2.new(0.8, 0, 0, 40)
textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 18
textBox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
textBox.TextColor3 = Color3.new(0, 0, 0)

local textboxCorner = Instance.new("UICorner", textBox)
textboxCorner.CornerRadius = UDim.new(0, 8)

local submit = Instance.new("TextButton", frame)
submit.Size = UDim2.new(0.8, 0, 0, 40)
submit.Position = UDim2.new(0.1, 0, 0.65, 0)
submit.Text = "Submit Key"
submit.Font = Enum.Font.GothamBold
submit.TextSize = 18
submit.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
submit.TextColor3 = Color3.new(1, 1, 1)

local submitCorner = Instance.new("UICorner", submit)
submitCorner.CornerRadius = UDim.new(0, 8)

local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1, -20, 0, 40)
info.Position = UDim2.new(0, 10, 1, -40)
info.Text = "Go into this server for key: " .. discordLink
info.TextWrapped = true
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextColor3 = Color3.new(0, 0, 0)
info.BackgroundTransparency = 1

-- Function to create rainbow text
local function createRainbowText()
	local rainbowText = Instance.new("TextLabel", screenGui)
	rainbowText.Size = UDim2.new(1, 0, 0, 50)
	rainbowText.Position = UDim2.new(0, 0, 0, 0)
	rainbowText.Text = "🌈 Join for more crazy scripts " .. discordLink
	rainbowText.Font = Enum.Font.GothamBlack
	rainbowText.TextSize = 32
	rainbowText.TextStrokeTransparency = 0.5
	rainbowText.BackgroundTransparency = 1
	rainbowText.TextColor3 = Color3.fromRGB(255, 0, 0)

	-- Animate rainbow
	local hue = 0
	while rainbowText.Parent do
		hue = (hue + 1) % 360
		local color = Color3.fromHSV(hue / 360, 1, 1)
		rainbowText.TextColor3 = color
		wait(0.05)
	end
end

-- Submit button action
submit.MouseButton1Click:Connect(function()
	if textBox.Text == correctKey then
		frame:Destroy()
		loadstring(game:HttpGet(scriptUrl))()
		createRainbowText()
	else
		info.Text = "❌ Incorrect Key. Get the key from: " .. discordLink
		info.TextColor3 = Color3.fromRGB(255, 0, 0)
	end
end)
