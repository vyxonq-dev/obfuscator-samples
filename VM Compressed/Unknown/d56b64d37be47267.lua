local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI Setup
local keyGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
keyGui.Name = "KeyGui"

local background = Instance.new("Frame", keyGui)
background.Size = UDim2.new(0, 300, 0, 260)
background.Position = UDim2.new(0.5, -150, 0.5, -130)
background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
background.BorderSizePixel = 0
background.BackgroundTransparency = 0.1
background.AnchorPoint = Vector2.new(0.5, 0.5)

local title = Instance.new("TextLabel", background)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Enter NUH HUB Key"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local textBox = Instance.new("TextBox", background)
textBox.Size = UDim2.new(0.9, 0, 0, 40)
textBox.Position = UDim2.new(0.05, 0, 0, 50)
textBox.PlaceholderText = "KEY-YYYYMMDD"
textBox.Text = ""
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 16
textBox.ClearTextOnFocus = true
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.BorderSizePixel = 0

local button = Instance.new("TextButton", background)
button.Size = UDim2.new(0.9, 0, 0, 40)
button.Position = UDim2.new(0.05, 0, 0, 100)
button.Text = "🔐 Submit Key"
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.BorderSizePixel = 0

local message = Instance.new("TextLabel", background)
message.Size = UDim2.new(0.9, 0, 0, 30)
message.Position = UDim2.new(0.05, 0, 0, 150)
message.BackgroundTransparency = 1
message.Text = ""
message.Font = Enum.Font.Gotham
message.TextSize = 14
message.TextColor3 = Color3.fromRGB(255, 50, 50)
message.TextWrapped = true

local copyKeyBox = Instance.new("TextBox", background)
copyKeyBox.Size = UDim2.new(0.9, 0, 0, 30)
copyKeyBox.Position = UDim2.new(0.05, 0, 0, 185)
copyKeyBox.TextEditable = false
copyKeyBox.Text = "Click 'Get Key' to load it..."
copyKeyBox.Font = Enum.Font.Gotham
copyKeyBox.TextSize = 14
copyKeyBox.TextColor3 = Color3.fromRGB(0, 0, 0)
copyKeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
copyKeyBox.ClearTextOnFocus = false
copyKeyBox.TextWrapped = true
copyKeyBox.BorderSizePixel = 0

local copyButton = Instance.new("TextButton", background)
copyButton.Size = UDim2.new(0.9, 0, 0, 30)
copyButton.Position = UDim2.new(0.05, 0, 0, 220)
copyButton.Text = "📋 Get Today’s Key"
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 14
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
copyButton.BorderSizePixel = 0

-- Load main NUH HUB
local function loadNUHHub()
    loadstring(game:HttpGet("https://pastebin.com/raw/EazBb0qq"))()
end

-- Check the key
local function checkKey(inputKey)
    local currentDate = os.date("!*t") -- UTC time
    local correctKey = "KEY-" .. currentDate.year .. string.format("%02d", currentDate.month) .. string.format("%02d", currentDate.day)
    if inputKey == correctKey then
        message.TextColor3 = Color3.fromRGB(50, 255, 50)
        message.Text = "✅ Correct key! Loading NUH HUB..."
        wait(1.5)
        keyGui:Destroy()
        loadNUHHub()
    else
        message.TextColor3 = Color3.fromRGB(255, 50, 50)
        message.Text = "❌ Wrong key! Please try again."
    end
end

-- Events
button.MouseButton1Click:Connect(function()
    checkKey(textBox.Text)
end)

copyButton.MouseButton1Click:Connect(function()
    local currentDate = os.date("!*t")
    local key = "KEY-" .. currentDate.year .. string.format("%02d", currentDate.month) .. string.format("%02d", currentDate.day)
    copyKeyBox.Text = key
    message.Text = "✅ Key copied to textbox! You can copy it manually."
    message.TextColor3 = Color3.fromRGB(255, 255, 0)
end)
