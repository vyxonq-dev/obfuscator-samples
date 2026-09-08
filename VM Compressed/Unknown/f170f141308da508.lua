local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Correct key
local CORRECT_KEY = "Steal"
local KEY_WORD = "Steal" -- what the Get Key button will copy

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PabloKeyGui"
screenGui.Parent = CoreGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 180)
frame.Position = UDim2.new(0.5, -175, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = screenGui

-- Make draggable
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Pablo Hub Key System"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(150, 150, 255)
title.Parent = frame

-- Key Input
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 30)
keyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
keyBox.PlaceholderText = "Enter Key"
keyBox.ClearTextOnFocus = false
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.BackgroundColor3 = Color3.fromRGB(50,50,60)
keyBox.BorderSizePixel = 0
keyBox.Parent = frame

-- Submit Button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.35, 0, 0, 30)
submitBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
submitBtn.Text = "Submit"
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 18
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.BackgroundColor3 = Color3.fromRGB(70,70,90)
submitBtn.BorderSizePixel = 0
submitBtn.Parent = frame

-- Get Key Button
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0.35, 0, 0, 30)
getKeyBtn.Position = UDim2.new(0.55, 0, 0.7, 0)
getKeyBtn.Text = "Get Key"
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 18
getKeyBtn.TextColor3 = Color3.fromRGB(255,255,255)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(70,70,90)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Parent = frame

getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_WORD)
    end
end)

-- Function for wrong key feedback
local function shakeFrame()
    local pos1 = frame.Position
    for i=1,3 do
        TweenService:Create(frame, TweenInfo.new(0.05), {Position = pos1 + UDim2.new(0,5,0,0)}):Play()
        task.wait(0.05)
        TweenService:Create(frame, TweenInfo.new(0.05), {Position = pos1 - UDim2.new(0,5,0,0)}):Play()
        task.wait(0.05)
    end
    frame.Position = pos1
end

-- On click submit
submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CORRECT_KEY then
        screenGui:Destroy()
        -- Load main Pablo Hub
        loadstring(game:HttpGet("https://pastebin.com/raw/sJPfRwLY"))()
    else
        shakeFrame()
    end
end)