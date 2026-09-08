local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ShitHubKeySystemGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 360, 0, 180)
frame.Position = UDim2.new(1, -370, 0, 20)
frame.AnchorPoint = Vector2.new(0, 0)
frame.BackgroundColor3 = Color3.fromRGB(5, 30, 70)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 12)

local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 40)
header.Position = UDim2.new(0,0,0,0)
header.BackgroundTransparency = 1

local logoLabel = Instance.new("TextLabel", header)
logoLabel.Size = UDim2.new(0, 36, 0, 36)
logoLabel.Position = UDim2.new(0, 10, 0, 2)
logoLabel.BackgroundTransparency = 1
logoLabel.Font = Enum.Font.GothamBlack
logoLabel.Text = "💩"
logoLabel.TextSize = 32
logoLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
logoLabel.TextStrokeTransparency = 0.5
logoLabel.TextScaled = true

local titleLabel = Instance.new("TextLabel", header)
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0, 50, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "shit hub key system"
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.TextStrokeTransparency = 0.7

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 36, 0, 36)
closeBtn.Position = UDim2.new(1, -46, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.Text = "X"
closeBtn.AutoButtonColor = true
closeBtn.BorderSizePixel = 0
closeBtn.TextStrokeTransparency = 0.6
local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local keyBox = Instance.new("TextBox", frame)
keyBox.Size = UDim2.new(1, -40, 0, 40)
keyBox.Position = UDim2.new(0, 20, 0, 60)
keyBox.PlaceholderText = "Nhập key..."
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 20
keyBox.TextColor3 = Color3.fromRGB(230, 230, 230)
keyBox.BackgroundColor3 = Color3.fromRGB(10, 20, 50)
keyBox.BackgroundTransparency = 0.2
keyBox.BorderSizePixel = 0
local keyBoxCorner = Instance.new("UICorner", keyBox)
keyBoxCorner.CornerRadius = UDim.new(0, 8)
keyBox.TextXAlignment = Enum.TextXAlignment.Center

local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Size = UDim2.new(0, 140, 0, 40)
getKeyBtn.Position = UDim2.new(0, 20, 0, 110)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 80, 140)
getKeyBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 20
getKeyBtn.Text = "Get Key"
getKeyBtn.BorderSizePixel = 0
local getKeyCorner = Instance.new("UICorner", getKeyBtn)
getKeyCorner.CornerRadius = UDim.new(0, 8)

local checkKeyBtn = Instance.new("TextButton", frame)
checkKeyBtn.Size = UDim2.new(0, 140, 0, 40)
checkKeyBtn.Position = UDim2.new(1, -160, 0, 110)
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(70, 150, 255)
checkKeyBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
checkKeyBtn.Font = Enum.Font.GothamBold
checkKeyBtn.TextSize = 20
checkKeyBtn.Text = "Check Key"
checkKeyBtn.BorderSizePixel = 0
local checkKeyCorner = Instance.new("UICorner", checkKeyBtn)
checkKeyCorner.CornerRadius = UDim.new(0, 8)

local feedbackLabel = Instance.new("TextLabel", screenGui)
feedbackLabel.Size = UDim2.new(0, 600, 0, 100)
feedbackLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
feedbackLabel.AnchorPoint = Vector2.new(0.5, 0.5)
feedbackLabel.BackgroundTransparency = 1
feedbackLabel.Font = Enum.Font.GothamBlack
feedbackLabel.TextSize = 72
feedbackLabel.TextColor3 = Color3.fromRGB(170, 0, 255)
feedbackLabel.Text = ""
feedbackLabel.Visible = false
feedbackLabel.ZIndex = 20
feedbackLabel.TextStrokeTransparency = 0.6
feedbackLabel.TextXAlignment = Enum.TextXAlignment.Center
feedbackLabel.TextYAlignment = Enum.TextYAlignment.Center

local textShadow = Instance.new("TextLabel", feedbackLabel)
textShadow.Size = UDim2.new(1,0,1,0)
textShadow.Position = UDim2.new(0, 3, 0, 3)
textShadow.BackgroundTransparency = 1
textShadow.Text = feedbackLabel.Text
textShadow.Font = feedbackLabel.Font
textShadow.TextSize = feedbackLabel.TextSize
textShadow.TextColor3 = Color3.new(0,0,0)
textShadow.TextTransparency = 0.5
textShadow.ZIndex = feedbackLabel.ZIndex - 1
textShadow.TextStrokeTransparency = 1
textShadow.TextXAlignment = Enum.TextXAlignment.Center
textShadow.TextYAlignment = Enum.TextYAlignment.Center

feedbackLabel:GetPropertyChangedSignal("Text"):Connect(function()
    textShadow.Text = feedbackLabel.Text
end)

local function showFeedback(text, color)
    feedbackLabel.Text = text
    feedbackLabel.TextColor3 = color
    feedbackLabel.Visible = true
    feedbackLabel.TextTransparency = 1
    textShadow.TextTransparency = 0.5
    local tweenIn = TweenService:Create(feedbackLabel, TweenInfo.new(1), {TextTransparency = 0})
    local tweenOut = TweenService:Create(feedbackLabel, TweenInfo.new(1), {TextTransparency = 1})
    local tweenShadowOut = TweenService:Create(textShadow, TweenInfo.new(1), {TextTransparency = 1})

    tweenIn:Play()
    tweenIn.Completed:Wait()
    task.wait(1.5)
    tweenOut:Play()
    tweenShadowOut:Play()
    tweenOut.Completed:Wait()
    feedbackLabel.Visible = false
end

getKeyBtn.MouseButton1Click:Connect(function()
    local url = "https://loot-link.com/s?dFcBJuyq"  -- đổi link nếu muốn
    pcall(function()
        setclipboard(url)
    end)
    showFeedback("Đã copy link key!", Color3.fromRGB(100, 220, 100))
end)

checkKeyBtn.MouseButton1Click:Connect(function()
    local key = keyBox.Text:gsub("%s", ""):lower()
    local validKey = "shithubabcxyzjerkoff"
    if key == validKey then
        showFeedback("shit hub", Color3.fromRGB(170, 0, 255))
        -- Chạy script khi đúng key
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/trantung120213123/Hackroblox/refs/heads/main/G%E1%BB%91c.lua", true))()
        end)
    else
        showFeedback("Key không hợp lệ", Color3.fromRGB(255, 70, 70))
    end
end)
