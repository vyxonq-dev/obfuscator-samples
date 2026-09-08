local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- List of valid keys
local validKeys = {
    ["111"] = "https://raw.githubusercontent.com/AnthuhubX/Main/refs/heads/main/Ball%20control",
    ["Nagi"] = "https://raw.githubusercontent.com/AnthuhubX/Main/refs/heads/main/Ball%20control"
}

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Round Corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Create Title Label (Sypher Hub)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 5)
titleLabel.Text = "ball control"
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Create Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.TextScaled = true
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = frame

-- Round Close Button
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Create TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 280, 0, 40)
textBox.Position = UDim2.new(0.5, -140, 0.25, 0)
textBox.PlaceholderText = "Enter Key Here"
textBox.TextScaled = true
textBox.Font = Enum.Font.Gotham
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
textBox.Parent = frame

-- Round TextBox
local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 8)
textBoxCorner.Parent = textBox

-- Create Redeem Button
local redeemButton = Instance.new("TextButton")
redeemButton.Size = UDim2.new(0, 280, 0, 40)
redeemButton.Position = UDim2.new(0.5, -140, 0.5, 0)
redeemButton.Text = "Redeem Key"
redeemButton.TextScaled = true
redeemButton.Font = Enum.Font.GothamBold
redeemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
redeemButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
redeemButton.Parent = frame

-- Round Redeem Button
local redeemCorner = Instance.new("UICorner")
redeemCorner.CornerRadius = UDim.new(0, 8)
redeemCorner.Parent = redeemButton

-- Create Get Key Button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 280, 0, 40)
getKeyButton.Position = UDim2.new(0.5, -140, 0.75, 0)
getKeyButton.Text = "Get Key"
getKeyButton.TextScaled = true
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
getKeyButton.Parent = frame

-- Round Get Key Button
local getKeyCorner = Instance.new("UICorner")
getKeyCorner.CornerRadius = UDim.new(0, 8)
getKeyCorner.Parent = getKeyButton

-- Function to Hide GUI Smoothly
local function hideGUI()
    local fadeOut = TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 1, Position = UDim2.new(0.5, -160, 0.5, 0)})
    fadeOut:Play()
    fadeOut.Completed:Wait()
    frame.Visible = false
end

-- Function to Send Roblox Notifications
local function sendNotification(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 3;
        Button1 = "OK"
    })
end

-- Redeem Button Click Event
redeemButton.MouseButton1Click:Connect(function()
    local enteredKey = textBox.Text

    if enteredKey == "" then
        sendNotification("Error", "Textbox is empty!")
    elseif validKeys[enteredKey] then
        sendNotification("Success", "Script Loaded!")
        loadstring(game:HttpGet(validKeys[enteredKey], true))()
        hideGUI() -- Close GUI smoothly
    else
        sendNotification("Error", "Invalid Key!")
    end
end)

-- Get Key Button Click Event
getKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/vzRXgYQXag")
        sendNotification("Copied!", "Key copied to clipboard!")
    else
        sendNotification("Error", "Clipboard not supported!")
    end
end)

-- Close Button Click Event
closeButton.MouseButton1Click:Connect(function()
    hideGUI()
end)
