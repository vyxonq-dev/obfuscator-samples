--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer

--// Key
local VALID_KEY = "Nightmares"

--// Blur Effect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

TweenService:Create(blur, TweenInfo.new(0.5), {Size = 20}):Play()

--// ScreenGui
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "KeySystem"
gui.ResetOnSpawn = false

--// Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 1

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

-- Fade in
TweenService:Create(frame, TweenInfo.new(0.4), {
    BackgroundTransparency = 0
}):Play()

--// Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Enter Key"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255,255,255)

--// TextBox
local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0, 40)
box.Position = UDim2.new(0.1, 0, 0.4, 0)
box.PlaceholderText = "Enter your key..."
box.Text = ""
box.Font = Enum.Font.Gotham
box.TextSize = 16
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextColor3 = Color3.new(1,1,1)
box.BorderSizePixel = 0

Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)

--// Button
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0, 45)
button.Position = UDim2.new(0.1, 0, 0.7, 0)
button.Text = "Submit"
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.TextColor3 = Color3.new(1,1,1)
button.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
button.BorderSizePixel = 0

Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)

-- Gradient
local gradient = Instance.new("UIGradient", button)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,200))
}

--// Shake Function
local function shake()
    for i = 1, 10 do
        frame.Position = frame.Position + UDim2.new(0, math.random(-5,5), 0, 0)
        task.wait(0.02)
    end
    frame.Position = UDim2.new(0.5, -200, 0.5, -125)
end

--// Success Function
local function success()
    TweenService:Create(frame, TweenInfo.new(0.4), {
        Size = UDim2.new(0, 420, 0, 270)
    }):Play()

    task.wait(0.5)

    TweenService:Create(frame, TweenInfo.new(0.5), {
        BackgroundTransparency = 1
    }):Play()

    TweenService:Create(blur, TweenInfo.new(0.5), {
        Size = 0
    }):Play()

    task.wait(0.5)
    gui:Destroy()

    -- 🔥 Load Script After Success
    loadstring(game:HttpGet("https://raw.githubusercontent.com/axleoislost/Accent/main/Rivals"))()
end

--// Button Click
button.MouseButton1Click:Connect(function()
    if box.Text == VALID_KEY then
        success()
    else
        shake()
        box.Text = ""
        box.PlaceholderText = "Wrong Key!"
    end
end)