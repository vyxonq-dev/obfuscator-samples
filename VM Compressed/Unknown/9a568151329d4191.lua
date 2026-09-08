-- Key System with 24h timer, rainbow border, discord invite, then load BobDoors script

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Configuration
local correctKey = "Razzyisthebest"
local duration = 24 * 60 * 60  -- seconds (24 hours)
local endTime = tick() + duration

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Rainbow border
local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = frame
uiStroke.Thickness = 3
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Rainbow loop
spawn(function()
    while frame and frame.Parent do
        for i = 0, 1, 0.01 do
            uiStroke.Color = Color3.fromHSV(i,1,1)
            wait(0.02)
        end
    end
end)

-- Discord invite TextLabel (big red text)
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0.3,0)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "JOIN https://discord.gg/WYPtQ7h7un FOR THE KEY"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Key input box
local keyBox = Instance.new("TextBox")
keyBox.Parent = frame
keyBox.Size = UDim2.new(0.8,0,0.2,0)
keyBox.Position = UDim2.new(0.1,0,0.45,0)
keyBox.PlaceholderText = "Enter Key Here"
keyBox.Text = ""
keyBox.Font = Enum.Font.SourceSansBold
keyBox.TextScaled = true
keyBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.BorderSizePixel = 0

-- Submit button
local submitButton = Instance.new("TextButton")
submitButton.Parent = frame
submitButton.Size = UDim2.new(0.4,0,0.15,0)
submitButton.Position = UDim2.new(0.3,0,0.7,0)
submitButton.Text = "Submit"
submitButton.Font = Enum.Font.GothamBold
submitButton.TextScaled = true
submitButton.BackgroundColor3 = Color3.fromRGB(0,170,0)
submitButton.TextColor3 = Color3.fromRGB(255,255,255)
submitButton.BorderSizePixel = 0

-- Countdown label
local countdownLabel = Instance.new("TextLabel")
countdownLabel.Parent = frame
countdownLabel.Size = UDim2.new(1,0,0.1,0)
countdownLabel.Position = UDim2.new(0,0,0.85,0)
countdownLabel.BackgroundTransparency = 1
countdownLabel.TextColor3 = Color3.fromRGB(255,255,0)
countdownLabel.Font = Enum.Font.Code
countdownLabel.TextScaled = true

-- Update countdown every second
spawn(function()
    while true do
        local remaining = math.max(0, math.floor(endTime - tick()))
        local h = math.floor(remaining / 3600)
        local m = math.floor((remaining % 3600) / 60)
        local s = remaining % 60
        countdownLabel.Text = string.format("Time Left: %02d:%02d:%02d", h, m, s)
        if remaining <= 0 then
            break
        end
        wait(1)
    end
end)

-- What happens on submit
submitButton.MouseButton1Click:Connect(function()
    if tick() > endTime then
        keyBox.Text = "Key expired!"
        keyBox.TextColor3 = Color3.fromRGB(255,0,0)
        return
    end

    if keyBox.Text == correctKey then
        -- success: remove GUI
        screenGui:Destroy()
        -- execute the BobDoors script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/notzanocoddz4/bobdoors/main/main.lua"))()
    else
        -- wrong key
        keyBox.Text = "Incorrect Key!"
        keyBox.TextColor3 = Color3.fromRGB(255,0,0)
    end
end)
