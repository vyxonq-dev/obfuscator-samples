--// Modern UI with Ball Hitbox Expander + Other Scripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// UI Setup
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.ResetOnSpawn = false

-- Side Toggle Button
local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 50, 0, 100)
toggleButton.Position = UDim2.new(0, 10, 0.4, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.Text = "☰"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 24
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BorderSizePixel = 0

-- Main UI Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 320, 0, 420)
mainFrame.Position = UDim2.new(-0.4, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true

local isOpen = false
local function toggleUI()
    isOpen = not isOpen
    local targetPosition = isOpen and UDim2.new(0.05, 0, 0.25, 0) or UDim2.new(-0.4, 0, 0.25, 0)
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Position = targetPosition}):Play()
end

toggleButton.MouseButton1Click:Connect(toggleUI)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        toggleUI()
    end
end)

-- Tab Frame (Holds Buttons)
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(1, 0, 1, -50)
tabFrame.Position = UDim2.new(0, 0, 0, 50)
tabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabFrame.BorderSizePixel = 0

local uiListLayout = Instance.new("UIListLayout", tabFrame)
uiListLayout.Padding = UDim.new(0, 6)
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Function to Create Buttons
local function createButton(name, action)
    local button = Instance.new("TextButton", tabFrame)
    button.Size = UDim2.new(0.9, 0, 0, 45)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = name
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0

    button.MouseButton1Click:Connect(action)
end

--// Ball Hitbox Expander Script (Executes Once on Click)
local function executeHitboxExpander()
    print("[Hitbox Expander] Running...")

    local sizeMultiplier = 5
    local transparency = 0.5
    local color = Color3.fromRGB(150, 150, 255)
    local enforceBoundaries = true
    local mobileDeviceOnly = true
    local gameBounds = Vector3.new(500, 500, 500)

    local function detectBalls()
        local balls = {}
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Model") or obj:IsA("BasePart") then
                if obj.Name:lower():find("ball") then
                    table.insert(balls, obj)
                end
            end
        end
        return balls
    end

    local function processBall(ball)
        local ballParts = ball:IsA("Model") and ball:GetDescendants() or {ball}

        for _, part in pairs(ballParts) do
            if part:IsA("BasePart") then
                part.Size = Vector3.new(sizeMultiplier, sizeMultiplier, sizeMultiplier)
                part.CanCollide = true
                part.Anchored = false
            end
        end
    end

    RunService.Stepped:Connect(function()
        for _, ball in ipairs(detectBalls()) do
            processBall(ball)
        end
    end)
end

-- Add Buttons to UI
createButton("Run Hitbox Expander", executeHitboxExpander)

createButton("Juke Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedJDark/MAIN/refs/heads/main/juke"))()
end)

createButton("Control Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedJDark/CONTROL-SCRIPTT/refs/heads/main/CONTROL"))()
end)

createButton("Sterling Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zayn31214/name/refs/heads/main/SterlingNew"))()
end)

createButton("Main Menu", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
end)

createButton("No Cooldown", function()
    local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
    local o = C.AbilityCooldown
    C.AbilityCooldown = function(s, n, ...)
        return o(s, n, 0, ...)
    end
end)

createButton("Hand Ball", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedJDark/MAIN/refs/heads/main/handball"))()
end)

print("Modern UI with Hitbox Expander & All Scripts Loaded Successfully")