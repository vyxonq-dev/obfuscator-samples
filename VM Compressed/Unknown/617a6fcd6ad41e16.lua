local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:FindFirstChildOfClass("PlayerGui")

-- UI Library Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 300)
mainFrame.Position = UDim2.new(0.5, -175, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true
mainFrame.Draggable = true
mainFrame.Active = true

-- UI Corners (Rounded Edges)
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = mainFrame

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
topBar.Parent = mainFrame

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 15)
topBarCorner.Parent = topBar

local title = Instance.new("TextLabel")
title.Text = "JDark's Script Hub"
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = topBar

-- Tab Buttons
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 40)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = mainFrame

local scriptTab = Instance.new("TextButton")
scriptTab.Size = UDim2.new(0, 115, 1, 0)
scriptTab.Text = "Scripts"
scriptTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scriptTab.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptTab.Font = Enum.Font.GothamBold
scriptTab.Parent = tabFrame

local themeTab = Instance.new("TextButton")
themeTab.Size = UDim2.new(0, 115, 1, 0)
themeTab.Position = UDim2.new(0, 120, 0, 0)
themeTab.Text = "Themes"
themeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
themeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
themeTab.Font = Enum.Font.GothamBold
themeTab.Parent = tabFrame

local creditTab = Instance.new("TextButton")
creditTab.Size = UDim2.new(0, 115, 1, 0)
creditTab.Position = UDim2.new(0, 240, 0, 0)
creditTab.Text = "Credits"
creditTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
creditTab.TextColor3 = Color3.fromRGB(255, 255, 255)
creditTab.Font = Enum.Font.GothamBold
creditTab.Parent = tabFrame

-- Script Panel
local scriptPanel = Instance.new("Frame")
scriptPanel.Size = UDim2.new(1, 0, 1, -70)
scriptPanel.Position = UDim2.new(0, 0, 0, 70)
scriptPanel.BackgroundTransparency = 1
scriptPanel.Parent = mainFrame

local function createScriptButton(name, position, url)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, position, 0)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.Parent = scriptPanel
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

createScriptButton("Handball Script", 0.1, "https://raw.githubusercontent.com/RedJDark/MAIN/refs/heads/main/handball")
createScriptButton("Sterling Script", 0.3, "https://raw.githubusercontent.com/Zayn31214/name/refs/heads/main/SterlingNew")
createScriptButton("CONTROL Script", 0.5, "https://raw.githubusercontent.com/RedJDark/CONTROL-SCRIPTT/refs/heads/main/CONTROL")

-- Theme Panel
local themePanel = Instance.new("Frame")
themePanel.Size = scriptPanel.Size
themePanel.Position = scriptPanel.Position
themePanel.BackgroundTransparency = 1
themePanel.Visible = false
themePanel.Parent = mainFrame

local function createThemeButton(color, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, position, 0)
    button.BackgroundColor3 = color
    button.Text = "Change Theme"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.Parent = themePanel
    button.MouseButton1Click:Connect(function()
        mainFrame.BackgroundColor3 = color
    end)
end

createThemeButton(Color3.fromRGB(20, 20, 20), 0.1)
createThemeButton(Color3.fromRGB(50, 20, 60), 0.3)
createThemeButton(Color3.fromRGB(10, 50, 70), 0.5)

-- Credits Panel
local creditPanel = Instance.new("Frame")
creditPanel.Size = scriptPanel.Size
creditPanel.Position = scriptPanel.Position
creditPanel.BackgroundTransparency = 1
creditPanel.Visible = false
creditPanel.Parent = mainFrame

local creditText = Instance.new("TextLabel")
creditText.Text = "JDark & Contributors"
creditText.Size = UDim2.new(1, 0, 1, 0)
creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditText.Font = Enum.Font.GothamBold
creditText.TextSize = 20
creditText.BackgroundTransparency = 1
creditText.Parent = creditPanel

-- Tab Switching Logic
scriptTab.MouseButton1Click:Connect(function()
    scriptPanel.Visible = true
    themePanel.Visible = false
    creditPanel.Visible = false
end)

themeTab.MouseButton1Click:Connect(function()
    scriptPanel.Visible = false
    themePanel.Visible = true
    creditPanel.Visible = false
end)

creditTab.MouseButton1Click:Connect(function()
    scriptPanel.Visible = false
    themePanel.Visible = false
    creditPanel.Visible = true
end)

-- Smooth Draggable Fix
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if dragging and dragInput then
        update(dragInput)
    end
end)