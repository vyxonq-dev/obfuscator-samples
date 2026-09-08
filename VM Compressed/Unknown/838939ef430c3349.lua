local TeleportService = game:GetService("TeleportService")
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Configuration for script execution
local TARGET_PLACE_ID = 109983668079237 -- The specific Place ID where this script should run

-- Check if the script is running in the allowed Place ID
if game.PlaceId ~= TARGET_PLACE_ID then
    warn("Script is not allowed to run in this Place ID. Expected:", TARGET_PLACE_ID, "Actual:", game.PlaceId)
    -- Optionally, you can display a message to the user or destroy the GUI
    local messageGui = Instance.new("ScreenGui")
    messageGui.Name = "ScriptRestrictionMessage"
    messageGui.ResetOnSpawn = false
    messageGui.Parent = game:GetService("CoreGui")

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(0, 400, 0, 50)
    messageLabel.Position = UDim2.new(0.5, -200, 0.5, -25)
    messageLabel.BackgroundTransparency = 0.8
    messageLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.Font = Enum.Font.GothamBold
    messageLabel.TextSize = 20
    messageLabel.Text = "This script can only be used in Place ID: " .. TARGET_PLACE_ID
    messageLabel.Parent = messageGui
    
    task.wait(2) -- Reduced from 5 to 2 seconds
    messageGui:Destroy()
    return -- Stop script execution
end

-- API endpoint configuration
local API_ENDPOINT = "https://v0-fork-of-roblox-secure-hosting-psi.vercel.app/api/notify"
local SECRET_KEY = "v0-secure-webhook-key-2025-AbC1dEfG2hIjK3lM4nOpQ5rS6tUvW7xY8z"

-- Server hop module
local success, serverHopModule = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
end)

if not success or not serverHopModule then
    warn("Failed to load server hop module:", serverHopModule)
    serverHopModule = nil
end

-- PET CATEGORIES - Pre-processed for ultra-fast lookup
local petCategories = {
    ["Secret"] = {
        "Garama and Madundung",
        "Las Vaquitas Saturnitas", 
        "Nuclearo Dinossauro",
        "Chimpanzini Spiderini",
        "Graipuss Medussi",
        "La Grande Combinasion",
        "La Vacca Saturno Saturnita",
        "Las Tralaleritas",
        "Los Tralaleritos",
        "Pot Hotspot",
        "Secret Lucky Block",
        "Torrtugini Dragonfrutini"
    },
    ["Brainrot God"] = {
        "Ballerino Lololo",
        "Espresso Signora",
        "Gattatino Neonino",
        "Los Crocodillitos",
        "Piccione Macchina",
        "Brainrot God Lucky Block",
        "Cocofanto Elefanto",
        "Girafa Celestre",
        "Matteo",
        "Odin Din Din Dun",
        "Orcalero Orcala",
        "Statutino Libertino",
        "Tigroligre Frutooni",
        "Tralalero Tralala",
        "Trenostruzzo Turbo 3000"
    }
}

-- ULTRA-FAST LOOKUP TABLES - Pre-built for instant matching
local secretLookup = {}
local brainrotGodLookup = {}
local secretKeywords = {}
local brainrotGodKeywords = {}

-- Build lookup tables immediately
for _, pet in ipairs(petCategories["Secret"]) do
    local lowerPet = string.lower(pet)
    secretLookup[lowerPet] = pet
    -- Extract keywords for partial matching
    for word in string.gmatch(lowerPet, "%S+") do
        if string.len(word) > 2 then
            secretKeywords[word] = pet
        end
    end
end

for _, pet in ipairs(petCategories["Brainrot God"]) do
    local lowerPet = string.lower(pet)
    brainrotGodLookup[lowerPet] = pet
    -- Extract keywords for partial matching
    for word in string.gmatch(lowerPet, "%S+") do
        if string.len(word) > 2 then
            brainrotGodKeywords[word] = pet
        end
    end
end

local lastScanTime = 0
local SCAN_COOLDOWN = 10 -- Reduced from 15 to 10 seconds for maximum speed
local scanInProgress = false
local isMinimized = false
local currentJobId = game.JobId -- Store current server ID

-- FAST animations - Reduced times for instant UI
local animInfo = {
    slideIn = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), -- Reduced from 0.8
    fadeIn = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), -- Reduced from 0.6
    buttonHover = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), -- Reduced from 0.2
    pulse = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true) -- Reduced from 1
}

-- Main GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotHunterGUI_V4"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui")

-- Main Frame (taller to include credits inside)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainContainer"
mainFrame.Size = UDim2.new(0, 320, 0, 390) -- Increased height for credits
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -195)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(100, 50, 255)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 20))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Header Frame with controls
local headerFrame = Instance.new("Frame")
headerFrame.Name = "Header"
headerFrame.Size = UDim2.new(1, 0, 0, 60)
headerFrame.Position = UDim2.new(0, 0, 0, 0)
headerFrame.BackgroundTransparency = 1
headerFrame.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -80, 0, 28)
titleLabel.Position = UDim2.new(0, 8, 0, 8)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "\240\159\167\160 BRAINROT HUNTER DELUXE" -- 🧠
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(100, 50, 255)
titleLabel.Parent = headerFrame

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -60, 0, 8)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "\226\136\146" -- −
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 16
minimizeButton.Parent = headerFrame

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent = minimizeButton

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 8)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Text = "\195\151" -- ×
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Parent = headerFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- Version Badge
local versionBadge = Instance.new("Frame")
versionBadge.Size = UDim2.new(0, 50, 0, 18)
versionBadge.Position = UDim2.new(1, -58, 0, 35)
versionBadge.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
versionBadge.Parent = headerFrame

local versionCorner = Instance.new("UICorner")
versionCorner.CornerRadius = UDim.new(0, 9)
versionCorner.Parent = versionBadge

local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(1, 0, 1, 0)
versionText.BackgroundTransparency = 1
versionText.Text = "V6.1"
versionText.TextColor3 = Color3.fromRGB(255, 255, 255)
versionText.Font = Enum.Font.GothamBold
versionText.TextSize = 10
versionText.Parent = versionBadge

-- Status Frame
local statusFrame = Instance.new("Frame")
statusFrame.Size = UDim2.new(1, -15, 0, 20)
statusFrame.Position = UDim2.new(0, 8, 0, 65)
statusFrame.BackgroundTransparency = 1
statusFrame.Parent = mainFrame

local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 10, 0, 10)
statusDot.Position = UDim2.new(0, 0, 0.5, -5)
statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
statusDot.BorderSizePixel = 0
statusDot.Parent = statusFrame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(0.5, 0)
dotCorner.Parent = statusDot

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -18, 1, 0)
statusLabel.Position = UDim2.new(0, 18, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: System Ready"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusFrame

-- Console
local consoleContainer = Instance.new("Frame")
consoleContainer.Name = "Console"
consoleContainer.Size = UDim2.new(1, -15, 0, 160) -- Reduced height to make room for credits
consoleContainer.Position = UDim2.new(0, 8, 0, 90)
consoleContainer.BackgroundColor3 = Color3.fromRGB(8, 8, 15)
consoleContainer.BackgroundTransparency = 0.2
consoleContainer.BorderSizePixel = 0
consoleContainer.Parent = mainFrame

local consoleCorner = Instance.new("UICorner")
consoleCorner.CornerRadius = UDim.new(0, 10)
consoleCorner.Parent = consoleContainer

local consoleStroke = Instance.new("UIStroke")
consoleStroke.Color = Color3.fromRGB(40, 40, 60)
consoleStroke.Thickness = 1
consoleStroke.Parent = consoleContainer

local consoleHeader = Instance.new("Frame")
consoleHeader.Size = UDim2.new(1, 0, 0, 25)
consoleHeader.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
consoleHeader.BorderSizePixel = 0
consoleHeader.Parent = consoleContainer

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 10)
headerCorner.Parent = consoleHeader

local headerCover = Instance.new("Frame")
headerCover.Size = UDim2.new(1, 0, 0, 12)
headerCover.Position = UDim2.new(0, 0, 1, -12)
headerCover.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
headerCover.BorderSizePixel = 0
headerCover.Parent = consoleHeader

local consoleTitle = Instance.new("TextLabel")
consoleTitle.Size = UDim2.new(1, -15, 1, 0)
consoleTitle.Position = UDim2.new(0, 8, 0, 0)
consoleTitle.BackgroundTransparency = 1
consoleTitle.Text = "\240\159\147\159 SYSTEM CONSOLE" -- 📟
consoleTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
consoleTitle.Font = Enum.Font.GothamBold
consoleTitle.TextSize = 11
consoleTitle.TextXAlignment = Enum.TextXAlignment.Left
consoleTitle.Parent = consoleHeader

local consoleScroll = Instance.new("ScrollingFrame")
consoleScroll.Size = UDim2.new(1, -8, 1, -32)
consoleScroll.Position = UDim2.new(0, 4, 0, 28)
consoleScroll.BackgroundTransparency = 1
consoleScroll.BorderSizePixel = 0
consoleScroll.ScrollBarThickness = 3
consoleScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 50, 255)
consoleScroll.Parent = consoleContainer

local consoleText = Instance.new("TextLabel")
consoleText.Size = UDim2.new(1, -8, 1, 0)
consoleText.BackgroundTransparency = 1
consoleText.TextColor3 = Color3.fromRGB(150, 255, 150)
consoleText.Font = Enum.Font.Code
consoleText.TextSize = 11
consoleText.TextWrapped = true
consoleText.TextYAlignment = Enum.TextYAlignment.Top
consoleText.TextXAlignment = Enum.TextXAlignment.Left
consoleText.Text = ""
consoleText.Parent = consoleScroll

-- Buttons
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1, -15, 0, 40)
buttonContainer.Position = UDim2.new(0, 8, 0, 255)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

local function createModernButton(text, position, size, color, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = color
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 12
    button.Parent = buttonContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 0
    stroke.Parent = button
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.8, 0.8, 0.8))
    }
    gradient.Rotation = 90
    gradient.Parent = button
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, animInfo.buttonHover, {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(stroke, animInfo.buttonHover, {Thickness = 2}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, animInfo.buttonHover, {BackgroundTransparency = 0}):Play()
        TweenService:Create(stroke, animInfo.buttonHover, {Thickness = 0}):Play()
    end)
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Credits Frame (inside main UI at bottom)
local creditsFrame = Instance.new("Frame")
creditsFrame.Size = UDim2.new(1, -15, 0, 85) -- Increased height for better spacing
creditsFrame.Position = UDim2.new(0, 8, 0, 300) -- Positioned at bottom of main UI
creditsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
creditsFrame.BackgroundTransparency = 0.3
creditsFrame.BorderSizePixel = 0
creditsFrame.Parent = mainFrame

local creditsCorner = Instance.new("UICorner")
creditsCorner.CornerRadius = UDim.new(0, 8)
creditsCorner.Parent = creditsFrame

local creditsStroke = Instance.new("UIStroke")
creditsStroke.Color = Color3.fromRGB(100, 50, 255)
creditsStroke.Thickness = 1
creditsStroke.Transparency = 0.7
creditsStroke.Parent = creditsFrame

local creditsTitle = Instance.new("TextLabel")
creditsTitle.Size = UDim2.new(1, 0, 0, 20)
creditsTitle.Position = UDim2.new(0, 0, 0, 5)
creditsTitle.BackgroundTransparency = 1
creditsTitle.Text = "\240\159\145\165 DEVELOPMENT TEAM" -- 👥
creditsTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
creditsTitle.Font = Enum.Font.GothamBold
creditsTitle.TextSize = 11
creditsTitle.Parent = creditsFrame

local function createCreditLine(text, pos)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 15)
    label.Position = UDim2.new(0, 5, 0, pos)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = creditsFrame
    return label
end

createCreditLine("\240\159\145\145 Owner: Devil Ugly", 28) -- 👑
createCreditLine("\240\159\146\187 Developer: armin698672", 45) -- 💻
createCreditLine("\240\159\142\168 Designer: elmejorsiuuu", 62) -- 🎨

-- Floating Minimized Circle
local floatingCircle = Instance.new("Frame")
floatingCircle.Name = "FloatingCircle"
floatingCircle.Size = UDim2.new(0, 60, 0, 60)
floatingCircle.Position = UDim2.new(0, 20, 0, 20)
floatingCircle.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
floatingCircle.BorderSizePixel = 0
floatingCircle.Visible = false
floatingCircle.Parent = gui

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(0.5, 0)
circleCorner.Parent = floatingCircle

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.fromRGB(255, 255, 255)
circleStroke.Thickness = 2
circleStroke.Parent = floatingCircle

local circleText = Instance.new("TextLabel")
circleText.Size = UDim2.new(1, 0, 1, 0)
circleText.BackgroundTransparency = 1
circleText.Text = "BHD"
circleText.TextColor3 = Color3.fromRGB(255, 255, 255)
circleText.Font = Enum.Font.GothamBold
circleText.TextSize = 14
circleText.Parent = floatingCircle

-- Speed Boost GUI - Positioned next to main UI
local player = Players.LocalPlayer

-- Position speed container to the RIGHT of the main UI
local speedContainer = Instance.new("Frame")
speedContainer.Name = "SpeedContainer"
speedContainer.Size = UDim2.new(0, 130, 0, 90)
-- Position it to the right of main UI: main UI is at 0.5, -160 with width 320
-- So right edge is at 0.5, 160. Add 10px gap = 0.5, 170
speedContainer.Position = UDim2.new(0.5, 170, 0.5, -195) -- Same Y as main UI top
speedContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
speedContainer.BackgroundTransparency = 0.1
speedContainer.BorderSizePixel = 0
speedContainer.Parent = gui

local speedContainerCorner = Instance.new("UICorner")
speedContainerCorner.CornerRadius = UDim.new(0, 12)
speedContainerCorner.Parent = speedContainer

local speedContainerStroke = Instance.new("UIStroke")
speedContainerStroke.Color = Color3.fromRGB(100, 50, 255)
speedContainerStroke.Thickness = 2
speedContainerStroke.Transparency = 0.3
speedContainerStroke.Parent = speedContainer

-- Speed container gradient to match main UI
local speedGradient = Instance.new("UIGradient")
speedGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 20))
}
speedGradient.Rotation = 45
speedGradient.Parent = speedContainer

-- Speed container header
local speedHeader = Instance.new("Frame")
speedHeader.Size = UDim2.new(1, 0, 0, 25)
speedHeader.Position = UDim2.new(0, 0, 0, 0)
speedHeader.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
speedHeader.BorderSizePixel = 0
speedHeader.Parent = speedContainer

local speedHeaderCorner = Instance.new("UICorner")
speedHeaderCorner.CornerRadius = UDim.new(0, 12)
speedHeaderCorner.Parent = speedHeader

local speedHeaderCover = Instance.new("Frame")
speedHeaderCover.Size = UDim2.new(1, 0, 0, 12)
speedHeaderCover.Position = UDim2.new(0, 0, 1, -12)
speedHeaderCover.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
speedHeaderCover.BorderSizePixel = 0
speedHeaderCover.Parent = speedHeader

local speedTitle = Instance.new("TextLabel")
speedTitle.Size = UDim2.new(1, -10, 1, 0)
speedTitle.Position = UDim2.new(0, 5, 0, 0)
speedTitle.BackgroundTransparency = 1
speedTitle.Text = "\226\154\161 SPEED BOOST" -- ⚡
speedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
speedTitle.Font = Enum.Font.GothamBold
speedTitle.TextSize = 11
speedTitle.TextXAlignment = Enum.TextXAlignment.Center
speedTitle.Parent = speedHeader

local speedButton = Instance.new("TextButton")
speedButton.Name = "SpeedBoostButton"
speedButton.Size = UDim2.new(1, -10, 0, 35)
speedButton.Position = UDim2.new(0, 5, 0, 30)
speedButton.BorderSizePixel = 0
speedButton.TextSize = 12
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
speedButton.Font = Enum.Font.GothamBold
speedButton.Text = "BOOST OFF"
speedButton.Parent = speedContainer

local speedButtonCorner = Instance.new("UICorner")
speedButtonCorner.CornerRadius = UDim.new(0, 8)
speedButtonCorner.Parent = speedButton

local speedButtonStroke = Instance.new("UIStroke")
speedButtonStroke.Color = Color3.fromRGB(167, 31, 31)
speedButtonStroke.Thickness = 1
speedButtonStroke.Transparency = 0.5
speedButtonStroke.Parent = speedButton

local instructionText = Instance.new("TextLabel")
instructionText.Name = "InstructionText"
instructionText.Size = UDim2.new(1, -10, 0, 20)
instructionText.Position = UDim2.new(0, 5, 0, 68)
instructionText.BackgroundTransparency = 1
instructionText.Text = "\226\154\160 Use with Invisibility first" -- ⚠
instructionText.TextColor3 = Color3.fromRGB(255, 200, 100)
instructionText.Font = Enum.Font.Gotham
instructionText.TextSize = 8
instructionText.TextWrapped = true
instructionText.TextXAlignment = Enum.TextXAlignment.Center
instructionText.Parent = speedContainer

-- Speed boost functionality
local isBoosted = false
local defaultSpeed = 16
local boostedSpeed = 80
local currentConnection = nil

local function updateBoost()
    speedButton.Text = isBoosted and "BOOST ON" or "BOOST OFF"
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(speedButton, tweenInfo, {
        BackgroundColor3 = isBoosted and Color3.fromRGB(72, 167, 28) or Color3.fromRGB(167, 31, 31)
    }):Play()
    TweenService:Create(speedButtonStroke, tweenInfo, {
        Color = isBoosted and Color3.fromRGB(72, 167, 28) or Color3.fromRGB(167, 31, 31)
    }):Play()
    
    if currentConnection then
        currentConnection:Disconnect()
        currentConnection = nil
    end
    
    if isBoosted then
        currentConnection = RunService.Heartbeat:Connect(function()
            local character = Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoid and rootPart and humanoid.MoveDirection.Magnitude > 0 then
                    local moveDir = humanoid.MoveDirection
                    local currentVelocity = rootPart.Velocity
                    rootPart.Velocity = Vector3.new(
                        moveDir.X * boostedSpeed,
                        currentVelocity.Y,
                        moveDir.Z * boostedSpeed
                    )
                end
            end
        end)
    end
end

-- Speed button hover effects
speedButton.MouseEnter:Connect(function()
    TweenService:Create(speedButton, animInfo.buttonHover, {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(speedButtonStroke, animInfo.buttonHover, {Thickness = 2}):Play()
end)

speedButton.MouseLeave:Connect(function()
    TweenService:Create(speedButton, animInfo.buttonHover, {BackgroundTransparency = 0}):Play()
    TweenService:Create(speedButtonStroke, animInfo.buttonHover, {Thickness = 1}):Play()
end)

speedButton.MouseButton1Click:Connect(function()
    isBoosted = not isBoosted
    updateBoost()
    logToConsole("\226\154\161 Speed boost " .. (isBoosted and "ENABLED" or "DISABLED")) -- ⚡
end)

-- Speed container dragging
local speedDragging = false
local speedDragInput = nil
local speedMousePos = nil
local speedFramePos = nil

local function updateSpeedDrag(input)
    local delta = input.Position - speedMousePos
    speedContainer.Position = UDim2.new(
        speedFramePos.X.Scale,
        speedFramePos.X.Offset + delta.X,
        speedFramePos.Y.Scale,
        speedFramePos.Y.Offset + delta.Y
    )
end

speedHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        speedDragging = true
        speedDragInput = input
        speedMousePos = input.Position
        speedFramePos = speedContainer.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                speedDragging = false
                speedDragInput = nil
            end
        end)
    end
end)

speedHeader.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and speedDragging then
        speedDragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == speedDragInput and speedDragging then
        updateSpeedDrag(input)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input == speedDragInput then
        speedDragging = false
        speedDragInput = nil
    end
end)

-- Reset speed boost on character respawn
Players.LocalPlayer.CharacterAdded:Connect(function()
    if currentConnection then
        currentConnection:Disconnect()
        currentConnection = nil
    end
    isBoosted = false
    speedButton.Text = "BOOST OFF"
    speedButton.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
    speedButtonStroke.Color = Color3.fromRGB(167, 31, 31)
end)

-- Dragging functionality for main elements
local function makeDraggable(frame, dragHandle)
    local isDragging = false
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                end
            end)
        end
    end)
    
    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if isDragging then
                updateInput(input)
            end
        end
    end)
end

-- Make main elements draggable
makeDraggable(mainFrame, headerFrame)
makeDraggable(floatingCircle, floatingCircle)

-- Console logging function
local function logToConsole(text)
    local timestamp = os.date("[%H:%M:%S]")
    local logEntry = timestamp .. " " .. text
    
    if consoleText.Text == "" then
        consoleText.Text = logEntry
    else
        consoleText.Text = consoleText.Text .. "\n" .. logEntry
    end
    
    consoleScroll.CanvasSize = UDim2.new(0, 0, 0, consoleText.TextBounds.Y + 10)
    consoleScroll.CanvasPosition = Vector2.new(0, consoleScroll.CanvasSize.Y.Offset)
    
    local lines = string.split(consoleText.Text, "\n")
    if #lines > 50 then
        local newText = ""
        for i = #lines - 49, #lines do
            newText = newText .. (i > #lines - 49 and "\n" or "") .. lines[i]
        end
        consoleText.Text = newText
    end
    
    print(logEntry)
end

-- Minimize/Maximize functions
local function minimizeUI()
    isMinimized = true
    mainFrame.Visible = false
    speedContainer.Visible = false
    floatingCircle.Visible = true
    
    -- Pulse animation for floating circle
    local pulseTween = TweenService:Create(floatingCircle, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Size = UDim2.new(0, 65, 0, 65)
    })
    pulseTween:Play()
end

local function maximizeUI()
    isMinimized = false
    mainFrame.Visible = true
    speedContainer.Visible = true
    floatingCircle.Visible = false
end

local function closeUI()
    gui:Destroy()
end

-- Button connections
minimizeButton.MouseButton1Click:Connect(minimizeUI)
closeButton.MouseButton1Click:Connect(closeUI)
floatingCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        maximizeUI()
    end
end)

-- Cooldown functions
local function canScan()
    local currentTime = tick()
    local timeSinceLastScan = currentTime - lastScanTime
    return timeSinceLastScan >= SCAN_COOLDOWN and not scanInProgress
end

local function getRemainingCooldown()
    local currentTime = tick()
    local timeSinceLastScan = currentTime - lastScanTime
    return math.max(0, SCAN_COOLDOWN - timeSinceLastScan)
end

local function formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local secs = math.floor(seconds % 60)
    return string.format("%02d:%02d", minutes, secs)
end

-- ULTRA-FAST Server Hopping Function with Full Server Detection
local function smartServerHop()
    logToConsole("🌍 Initiating ULTRA-FAST server hop...")
    statusLabel.Text = "Status: Finding optimal server..."
    statusDot.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    
    -- Use the advanced server hop module if available
    if serverHopModule then
        logToConsole("🌍 Using advanced server hop with full server detection...")
        
        local hopAttempts = 0
        local maxAttempts = 3
        
        local function attemptServerHop()
            hopAttempts = hopAttempts + 1
            logToConsole("🔄 Server hop attempt " .. hopAttempts .. "/" .. maxAttempts)
            
            local success, result = pcall(function()
                -- Try to get server list and find non-full server
                local servers = game:GetService("HttpService"):JSONDecode(
                    game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
                )
                
                if servers and servers.data then
                    -- Find servers that aren't full
                    local availableServers = {}
                    for _, server in ipairs(servers.data) do
                        if server.playing < server.maxPlayers and server.id ~= game.JobId then
                            table.insert(availableServers, server)
                        end
                    end
                    
                    if #availableServers > 0 then
                        -- Sort by player count (prefer less crowded servers)
                        table.sort(availableServers, function(a, b)
                            return a.playing < b.playing
                        end)
                        
                        local targetServer = availableServers[1]
                        logToConsole("🎯 Found optimal server: " .. targetServer.playing .. "/" .. targetServer.maxPlayers .. " players")
                        
                        -- Teleport to specific server
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, targetServer.id)
                        return true
                    else
                        logToConsole("⚠ No available servers found, using random teleport...")
                        return false
                    end
                else
                    logToConsole("⚠ Could not fetch server list...")
                    return false
                end
            end)
            
            if success and result then
                logToConsole("✅ Successfully hopping to optimal server!")
                return true
            else
                logToConsole("❌ Server selection failed: " .. tostring(result))
                
                if hopAttempts < maxAttempts then
                    logToConsole("🔄 Retrying server hop in 1 second...")
                    task.wait(1)
                    return attemptServerHop()
                else
                    logToConsole("🔄 Max attempts reached, using fallback method...")
                    return false
                end
            end
        end
        
        -- Try advanced server selection
        local advancedSuccess = attemptServerHop()
        
        if not advancedSuccess then
            -- Fallback to module's default method
            logToConsole("🔄 Using module's default server hop...")
            pcall(function()
                serverHopModule:Teleport(game.PlaceId)
            end)
        end
    else
        -- Enhanced basic teleport with retry logic
        logToConsole("🔄 Using enhanced basic teleport...")
        
        local function basicHopWithRetry()
            for attempt = 1, 3 do
                logToConsole("🔄 Basic hop attempt " .. attempt .. "/3")
                
                local success = pcall(function()
                    TeleportService:Teleport(game.PlaceId)
                end)
                
                if success then
                    logToConsole("✅ Basic teleport initiated!")
                    return
                else
                    if attempt < 3 then
                        logToConsole("⚠ Teleport failed, retrying in 1 second...")
                        task.wait(1)
                    else
                        logToConsole("❌ All teleport attempts failed!")
                    end
                end
            end
        end
        
        basicHopWithRetry()
    end
end

-- WEBHOOK FUNCTION WITH CATEGORIES
local function sendWebhookNotification(foundPets, petType)
    logToConsole("🔄 Starting webhook process for " .. petType .. " pets...")
    
    local playerCount = #Players:GetPlayers()
    local petList = ""
    local totalPets = 0
    
    for i, petData in ipairs(foundPets) do
        petList = petList .. petData.name
        if petData.count > 1 then
            petList = petList .. " (x" .. petData.count .. ")"
        end
        totalPets = totalPets + petData.count
        if i < #foundPets then
            petList = petList .. "\n"
        end
    end
    
    -- Determine embed color and title based on pet type
    local embedColor = petType == "Brainrot God" and 0xFF6B35 or 0x6A5ACD
    local embedTitle = petType == "Brainrot God" and "🧠 BRAINROT GOD DETECTED!" or "🎀 SECRET PETS DETECTED!"
    local lockEmoji = petType == "Brainrot God" and "🧠" or "🔒"
    
    -- WEBHOOK DATA
    local data = {
        ["content"] = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "')",
        ["petType"] = petType, -- Add pet type for API routing
        ["embeds"] = {{
            ["title"] = embedTitle,
            ["description"] = "**" .. lockEmoji .. " " .. petType .. " Pets Found!**\n" .. petList,
            ["color"] = embedColor,
            ["fields"] = {
                {
                    ["name"] = "🧠 Players:",
                    ["value"] = tostring(playerCount),
                    ["inline"] = true
                },
                {
                    ["name"] = "📊 Total Pets:",
                    ["value"] = tostring(totalPets),
                    ["inline"] = true
                }
            },
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S")
            }
        }},
        ["username"] = petType == "Brainrot God" and "🧠 Brainrot God Hunter" or "🎀 Secret Hunter"
    }
    
    logToConsole("📝 Webhook data prepared for " .. petType)
    logToConsole("🌐 Endpoint: " .. API_ENDPOINT)
    
    -- Try multiple HTTP request methods
    local httpMethods = {
        request,
        http_request,
        syn and syn.request,
        fluxus and fluxus.request,
        getgenv().request,
        _G.request
    }
    
    local httpFunc = nil
    for _, method in ipairs(httpMethods) do
        if method and type(method) == "function" then
            httpFunc = method
            logToConsole("✅ HTTP function found")
            break
        end
    end
    
    if not httpFunc then
        logToConsole("❌ No HTTP request function available!")
        return false
    end
    
    -- Send the webhook
    local success, result = pcall(function()
        logToConsole("📡 Sending HTTP request for " .. petType .. "...")
        
        local response = httpFunc({
            Url = API_ENDPOINT,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = SECRET_KEY
            },
            Body = HttpService:JSONEncode(data)
        })
        
        logToConsole("📨 Response Status: " .. tostring(response.StatusCode))
        
        if response.StatusCode == 200 then
            local responseBody = HttpService:JSONDecode(response.Body)
            if responseBody.success then
                logToConsole("✅ " .. petType .. " notification sent!")
                return true
            else
                logToConsole("❌ API Error: " .. tostring(responseBody.message))
                return false
            end
        elseif response.StatusCode == 401 then
            logToConsole("🔐 Authorization failed - check SECRET_KEY")
            return false
        else
            logToConsole("⚠ HTTP Error " .. response.StatusCode)
            return false
        end
    end)
    
    if success and result then
        logToConsole("🎉 " .. petType .. " notification sent successfully!")
        statusLabel.Text = "Status: " .. petType .. " webhook sent!"
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        return true
    else
        logToConsole("💥 " .. petType .. " webhook failed: " .. tostring(result))
        statusLabel.Text = "Status: " .. petType .. " webhook failed"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return false
    end
end

-- ULTRA-FAST scanning function (1-3 seconds)
local function scanForPets()
    if not canScan() then
        local remaining = getRemainingCooldown()
        if scanInProgress then
            logToConsole("⏳ Scan already in progress...")
        else
            logToConsole("⏰ Cooldown active! Wait " .. formatTime(remaining) .. " before next scan")
        end
        return
    end
    
    scanInProgress = true
    lastScanTime = tick()
    
    statusLabel.Text = "Status: ULTRA-FAST scanning..."
    statusDot.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    
    local pulseTween = TweenService:Create(statusDot, animInfo.pulse, {BackgroundTransparency = 0.5})
    pulseTween:Play()
    
    logToConsole("⚡ Starting ULTRA-FAST pet scan...")
    
    local foundSecretPets = {}
    local foundBrainrotGodPets = {}
    local secretPetCounts = {}
    local brainrotGodPetCounts = {}
    local startTime = tick()
    local scannedCount = 0
    
    -- ULTRA-FAST: Get all models in workspace at once (no recursion)
    local allModels = {}
    
    -- Collect only direct children and one level deep (SUPER FAST)
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name and string.len(obj.Name) > 2 then
            table.insert(allModels, obj)
        end
        -- Only go one level deeper for performance
        for _, child in ipairs(obj:GetChildren()) do
            if child:IsA("Model") and child.Name and string.len(child.Name) > 2 then
                table.insert(allModels, child)
            end
        end
    end
    
    logToConsole("⚡ Processing " .. #allModels .. " models...")
    
    -- ULTRA-FAST processing with optimized matching
    for _, obj in ipairs(allModels) do
        scannedCount = scannedCount + 1
        local objNameLower = string.lower(obj.Name)
        
        -- INSTANT LOOKUP: Check direct matches first
        local secretMatch = secretLookup[objNameLower]
        local brainrotMatch = brainrotGodLookup[objNameLower]
        
        if secretMatch then
            secretPetCounts[obj.Name] = (secretPetCounts[obj.Name] or 0) + 1
            logToConsole("🎀 SECRET: " .. obj.Name)
        elseif brainrotMatch then
            brainrotGodPetCounts[obj.Name] = (brainrotGodPetCounts[obj.Name] or 0) + 1
            logToConsole("🧠 BRAINROT GOD: " .. obj.Name)
        else
            -- FAST KEYWORD MATCHING: Check if any keywords match
            for keyword, petName in pairs(secretKeywords) do
                if string.find(objNameLower, keyword, 1, true) then
                    secretPetCounts[obj.Name] = (secretPetCounts[obj.Name] or 0) + 1
                    logToConsole("🎀 SECRET MATCH: " .. obj.Name)
                    break
                end
            end
            
            for keyword, petName in pairs(brainrotGodKeywords) do
                if string.find(objNameLower, keyword, 1, true) then
                    brainrotGodPetCounts[obj.Name] = (brainrotGodPetCounts[obj.Name] or 0) + 1
                    logToConsole("🧠 BRAINROT GOD MATCH: " .. obj.Name)
                    break
                end
            end
        end
    end
    
    local scanTime = tick() - startTime
    
    -- Process results
    for petName, count in pairs(secretPetCounts) do
        table.insert(foundSecretPets, {name = petName, count = count})
        logToConsole("✅ CONFIRMED SECRET: " .. petName .. " (x" .. count .. ")")
    end
    
    for petName, count in pairs(brainrotGodPetCounts) do
        table.insert(foundBrainrotGodPets, {name = petName, count = count})
        logToConsole("✅ CONFIRMED BRAINROT GOD: " .. petName .. " (x" .. count .. ")")
    end
    
    logToConsole("📊 ULTRA-FAST scan complete in " .. string.format("%.2f", scanTime) .. "s")
    logToConsole("📊 Processed " .. scannedCount .. " objects")
    logToConsole("🎀 Found " .. #foundSecretPets .. " SECRET pet types")
    logToConsole("🧠 Found " .. #foundBrainrotGodPets .. " BRAINROT GOD pet types")
    
    local anyPetsFound = false
    
    -- Send Secret pets webhook if found
    if #foundSecretPets > 0 then
        logToConsole("🚨 SECRET PETS DETECTED! Sending notification...")
        local webhookSuccess = sendWebhookNotification(foundSecretPets, "Secret")
        anyPetsFound = true
        
        if webhookSuccess then
            statusLabel.Text = "Status: " .. #foundSecretPets .. " secrets found & notified!"
            statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            statusLabel.Text = "Status: Found secrets, webhook failed"
            statusDot.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        end
    end
    
    -- Send Brainrot God pets webhook if found
    if #foundBrainrotGodPets > 0 then
        logToConsole("🚨 BRAINROT GOD PETS DETECTED! Sending notification...")
        local webhookSuccess = sendWebhookNotification(foundBrainrotGodPets, "Brainrot God")
        anyPetsFound = true
        
        if webhookSuccess then
            statusLabel.Text = "Status: " .. #foundBrainrotGodPets .. " brainrot gods found & notified!"
            statusDot.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        else
            statusLabel.Text = "Status: Found brainrot gods, webhook failed"
            statusDot.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        end
    end
    
    if anyPetsFound then
        logToConsole("🎉 Staying in server with valuable pets!")
        pulseTween:Cancel()
        statusDot.BackgroundTransparency = 0
    else
        logToConsole("❌ No valuable pets found in this server")
        statusLabel.Text = "Status: No pets - server hopping in 1s..."
        statusDot.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        
        -- ULTRA-FAST countdown - only 1 second
        logToConsole("⏰ Server hop in 1 second...")
        statusLabel.Text = "Status: Server hop in 1s..."
        task.wait(1)
        
        logToConsole("🌍 Auto server hopping to optimal server...")
        smartServerHop()
    end
    
    scanInProgress = false
end

-- ULTRA-FAST manual server hop function
local function serverHop()
    logToConsole("🌍 Manual server hop requested...")
    statusLabel.Text = "Status: Manual hop in 1s..."
    statusDot.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    
    -- ULTRA-FAST countdown - only 1 second
    logToConsole("⏰ Manual hop in 1 second...")
    statusLabel.Text = "Status: Manual hop in 1s..."
    task.wait(1)
    
    smartServerHop()
end

-- Create buttons
local scanButton = createModernButton(
    "⚡ ULTRA SCAN",
    UDim2.new(0, 0, 0, 0),
    UDim2.new(0.48, 0, 1, 0),
    Color3.fromRGB(0, 150, 255),
    function()
        if canScan() then
            scanForPets()
        else
            local remaining = getRemainingCooldown()
            if scanInProgress then
                logToConsole("⏳ Scan already in progress...")
            else
                logToConsole("⏰ Cooldown active! Wait " .. formatTime(remaining) .. " before next scan")
            end
        end
    end
)

local hopButton = createModernButton(
    "🌍 SERVER HOP",
    UDim2.new(0.52, 0, 0, 0),
    UDim2.new(0.48, 0, 1, 0),
    Color3.fromRGB(255, 100, 50),
    serverHop
)

-- FAST startup animation (reduced times)
local function playStartupAnimation()
    -- Hide elements initially
    mainFrame.BackgroundTransparency = 1
    mainFrame.Size = UDim2.new(0, 40, 0, 40)
    speedContainer.BackgroundTransparency = 1
    speedContainer.Size = UDim2.new(0, 40, 0, 40)
    
    local slideIn = TweenService:Create(mainFrame, animInfo.slideIn, {
        Size = UDim2.new(0, 320, 0, 390),
        BackgroundTransparency = 0.1
    })
    
    local speedSlideIn = TweenService:Create(speedContainer, animInfo.slideIn, {
        Size = UDim2.new(0, 130, 0, 90),
        BackgroundTransparency = 0.1
    })
    
    local elements = {titleLabel, statusLabel, consoleContainer, buttonContainer, creditsFrame}
    for _, element in pairs(elements) do
        element.BackgroundTransparency = 1
        if element:IsA("TextLabel") then
            element.TextTransparency = 1
        end
    end
    
    -- Hide speed elements initially
    speedHeader.BackgroundTransparency = 1
    speedTitle.TextTransparency = 1
    speedButton.BackgroundTransparency = 1
    speedButton.TextTransparency = 1
    instructionText.TextTransparency = 1
    
    slideIn:Play()
    speedSlideIn:Play()
    
    slideIn.Completed:Connect(function()
        -- FAST loading: Load all elements simultaneously
        for _, element in pairs(elements) do
            local fadeTween = TweenService:Create(element, animInfo.fadeIn, {
                BackgroundTransparency = element == consoleContainer and 0.2 or (element == creditsFrame and 0.3 or 1)
            })
            fadeTween:Play()
            
            if element:IsA("TextLabel") then
                TweenService:Create(element, animInfo.fadeIn, {TextTransparency = 0}):Play()
            end
        end
        
        -- Animate speed elements simultaneously
        TweenService:Create(speedHeader, animInfo.fadeIn, {BackgroundTransparency = 0}):Play()
        TweenService:Create(speedTitle, animInfo.fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(speedButton, animInfo.fadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
        TweenService:Create(instructionText, animInfo.fadeIn, {TextTransparency = 0}):Play()
        
        -- Reduced wait time from 1 to 0.3 seconds
        task.wait(0.3)
        logToConsole("🚨 System initialized successfully!")
        logToConsole("⏰ Scan cooldown: " .. SCAN_COOLDOWN .. " seconds")
        logToConsole("🎯 ULTRA-FAST detection system loaded")
        logToConsole("🎀 Secret pets: " .. #petCategories["Secret"] .. " types")
        logToConsole("🧠 Brainrot God pets: " .. #petCategories["Brainrot God"] .. " types")
        logToConsole("⚡ Speed boost positioned next to main UI")
        logToConsole("🌍 Smart server hop with full server detection")
        logToConsole("⚡ 1-second server hop delays for maximum speed")
        logToConsole("⏳ Starting auto-scan immediately...")
        
        -- Start scanning immediately (no wait)
        logToConsole("⚡ Starting ULTRA-FAST auto-scan...")
        scanForPets()
    end)
end

-- Cooldown timer
task.spawn(function()
    while true do
        task.wait(1)
        local timeSinceLastScan = tick() - lastScanTime
        local remaining = SCAN_COOLDOWN - timeSinceLastScan
        
        if remaining > 0 and not scanInProgress then
            scanButton.Text = "⏰ " .. formatTime(remaining)
        else
            scanButton.Text = "⚡ ULTRA SCAN"
        end
    end
end)

-- Status dot breathing animation
task.spawn(function()
    while true do
        task.wait(3)
        if statusDot.BackgroundColor3 == Color3.fromRGB(0, 255, 127) then
            local breathe = TweenService:Create(statusDot, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.3})
            breathe:Play()
            breathe.Completed:Connect(function()
                TweenService:Create(statusDot, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0}):Play()
            end)
        end
    end)
end)

-- Initialize with no delay
playStartupAnimation()

logToConsole("💫 Brainrot Devil Hunt V6.0 Loading...")
logToConsole("🎨 Designed by: elmejorsiuuu")
logToConsole("💻 Developed by: armin698672")
logToConsole("👑 Owned by: Devil Ugly")
logToConsole("⚡ ULTRA-FAST scanning system enabled")
logToConsole("🌍 Smart server hopping with 2s delay")
logToConsole("⚡ Ready for lightning-fast pet detection!")
