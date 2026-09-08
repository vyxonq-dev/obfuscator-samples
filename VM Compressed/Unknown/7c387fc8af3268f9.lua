
local CONFIG = {
    DiscordInvite = "https://discord.gg/WMUsDBDT8", -- Replace with your Discord invite
    KeyLink = "https://linkvertise.com/yourlink", -- Replace with your key link
    CorrectKey = "coresnigh", -- Replace with your actual key
    SaveKey = true -- Save key after first use
}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Check if key is already saved
if CONFIG.SaveKey then
    local success, savedKey = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile("key.txt"))
    end)
    if success and savedKey == CONFIG.CorrectKey then
       
loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
        return
    end
end

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui")

-- Particle System
local function createParticles(parent)
    for i = 1, 30 do
        task.spawn(function()
            while parent.Parent do
                local particle = Instance.new("Frame")
                particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
                particle.Position = UDim2.new(math.random(), 0, -0.1, 0)
                particle.BackgroundColor3 = Color3.fromHSV(math.random(), 0.8, 1)
                particle.BorderSizePixel = 0
                particle.BackgroundTransparency = 0.3
                particle.Parent = parent
                
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(1, 0)
                corner.Parent = particle
                
                local tween = TweenService:Create(particle, TweenInfo.new(math.random(3, 6), Enum.EasingStyle.Linear), {
                    Position = UDim2.new(particle.Position.X.Scale, 0, 1.1, 0),
                    BackgroundTransparency = 1
                })
                tween:Play()
                
                tween.Completed:Connect(function()
                    particle:Destroy()
                end)
                
                wait(math.random(1, 3) * 0.1)
            end
        end)
    end
end

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 450, 0, 320)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = main

-- Gradient Background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
}
gradient.Rotation = 45
gradient.Parent = main

-- Animated Border
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 4, 1, 4)
border.Position = UDim2.new(0.5, 0, 0.5, 0)
border.AnchorPoint = Vector2.new(0.5, 0.5)
border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
border.BorderSizePixel = 0
border.ZIndex = 0
border.Parent = main

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 18)
borderCorner.Parent = border

local borderGradient = Instance.new("UIGradient")
borderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 50, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 255))
}
borderGradient.Parent = border

-- Animate border gradient
task.spawn(function()
    while border.Parent do
        TweenService:Create(borderGradient, TweenInfo.new(3, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)}):Play()
        wait(3)
        borderGradient.Offset = Vector2.new(-1, 0)
    end
end)

-- Particles
createParticles(main)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 20)
title.BackgroundTransparency = 1
title.Text = "🔐 KEY SYSTEM"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.Parent = main

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -40, 0, 25)
subtitle.Position = UDim2.new(0, 20, 0, 70)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Enter your key to continue"
subtitle.TextColor3 = Color3.fromRGB(150, 150, 160)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.Parent = main

-- Key Input Frame
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(1, -40, 0, 45)
inputFrame.Position = UDim2.new(0, 20, 0, 110)
inputFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = main

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = inputFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 1, 0)
keyInput.Position = UDim2.new(0, 10, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.PlaceholderText = "Enter Key Here..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
keyInput.Text = ""
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ClearTextOnFocus = false
keyInput.Parent = inputFrame

-- Submit Button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(1, -40, 0, 45)
submitBtn.Position = UDim2.new(0, 20, 0, 170)
submitBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
submitBtn.BorderSizePixel = 0
submitBtn.Text = "✓ SUBMIT KEY"
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 16
submitBtn.AutoButtonColor = false
submitBtn.Parent = main

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 10)
submitCorner.Parent = submitBtn

-- Get Key Button
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(1, -40, 0, 45)
getKeyBtn.Position = UDim2.new(0, 20, 0, 230)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = "🔑 GET KEY"
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 16
getKeyBtn.AutoButtonColor = false
getKeyBtn.Parent = main

local getKeyCorner = Instance.new("UICorner")
getKeyCorner.CornerRadius = UDim.new(0, 10)
getKeyCorner.Parent = getKeyBtn

-- Status Label
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 20)
status.Position = UDim2.new(0, 20, 1, -35)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 100, 100)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.Parent = main

-- Button Hover Effects
local function addHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {Size = button.Size + UDim2.new(0, 0, 0, 3)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {Size = button.Size - UDim2.new(0, 0, 0, 3)}):Play()
    end)
end

addHoverEffect(submitBtn, Color3.fromRGB(100, 50, 255), Color3.fromRGB(120, 70, 255))
addHoverEffect(getKeyBtn, Color3.fromRGB(50, 150, 255), Color3.fromRGB(70, 170, 255))

-- Entrance Animation
main.Size = UDim2.new(0, 0, 0, 0)
local openTween = TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 450, 0, 320)
})
openTween:Play()

-- Functions
local function showNotification(text, color)
    status.Text = text
    status.TextColor3 = color
    TweenService:Create(status, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    wait(3)
    TweenService:Create(status, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
end

submitBtn.MouseButton1Click:Connect(function()
    local key = keyInput.Text
    
    if key == "" then
        showNotification("❌ Please enter a key!", Color3.fromRGB(255, 100, 100))
        return
    end
    
    if key == CONFIG.CorrectKey then
        showNotification("✓ Key accepted! Loading...", Color3.fromRGB(100, 255, 100))
        
        -- Save key if enabled
        if CONFIG.SaveKey then
            writefile("key.txt", game:GetService("HttpService"):JSONEncode(key))
        end
        
        wait(1)
        
        -- Close animation
        local closeTween = TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        closeTween:Play()
        closeTween.Completed:Wait()
        
        gui:Destroy()
        
        -- Load script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/martinng5/martin/refs/heads/main/Protected_8395766550616276.txt"))()
    else
        showNotification("❌ Invalid key! Try again.", Color3.fromRGB(255, 100, 100))
        
        -- Shake animation
        for i = 1, 3 do
            TweenService:Create(main, TweenInfo.new(0.05), {Position = main.Position + UDim2.new(0, 10, 0, 0)}):Play()
            wait(0.05)
            TweenService:Create(main, TweenInfo.new(0.05), {Position = main.Position - UDim2.new(0, 10, 0, 0)}):Play()
            wait(0.05)
        end
    end
end)

getKeyBtn.MouseButton1Click:Connect(function()
    showNotification("📋 Opening links...", Color3.fromRGB(100, 200, 255))
    
    -- Copy Discord invite
    setclipboard(CONFIG.DiscordInvite)
    
    -- Open links
    if request then
        request({
            Url = CONFIG.DiscordInvite,
            Method = "GET"
        })
        request({
            Url = CONFIG.KeyLink,
            Method = "GET"
        })
    end
    
    showNotification("✓ Join Discord & complete key link!", Color3.fromRGB(100, 255, 100))
end)

-- Dragging
local dragging, dragInput, dragStart, startPos

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
