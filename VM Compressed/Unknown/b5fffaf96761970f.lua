local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGuiClone = cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui") or game:GetService("StarterGui")
local Players = cloneref(game:GetService("Players")) or game:GetService("Players")
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = CoreGuiClone





local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = screenGui

-- Frame corner radius
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 15)
frameCorner.Parent = frame

-- Huge Text Label
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.Text = "Only On R6"
textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Set text color to red
textLabel.BackgroundTransparency = 1 -- Make the background transparent
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 48
textLabel.TextScaled = true -- Make text scale with the label size
textLabel.Parent = frame

-- First Button with Styling
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0.4, 0, 0.3, 0)
button1.Position = UDim2.new(0.1, 0, 0.35, 0)
button1.Text = "Toggle Animation"
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
button1.Font = Enum.Font.GothamBold
button1.TextSize = 16
button1.Parent = frame

-- Button1 corner radius
local button1Corner = Instance.new("UICorner")
button1Corner.CornerRadius = UDim.new(0, 12)
button1Corner.Parent = button1

-- Second Button with Styling
local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0.4, 0, 0.3, 0)
button2.Position = UDim2.new(0.55, 0, 0.35, 0)
button2.Text = "Button 2"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
button2.Font = Enum.Font.GothamBold
button2.TextSize = 16
button2.Parent = frame

-- Button2 corner radius
local button2Corner = Instance.new("UICorner")
button2Corner.CornerRadius = UDim.new(0, 12)
button2Corner.Parent = button2

-- Animation Logic
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://68433924"
local animationTrack = humanoid:LoadAnimation(animation)

local isPlaying = false
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local weightValue = Instance.new("NumberValue")
weightValue.Value = 0

weightValue.Changed:Connect(function(newValue)
    animationTrack:AdjustWeight(newValue)
end)

button1.MouseButton1Click:Connect(function()
    if not isPlaying then
        animationTrack:Play()
        animationTrack:AdjustSpeed(0)
        local tween = TweenService:Create(weightValue, tweenInfo, {Value = 1})
        tween:Play()
        button1.Text = "Off"
        isPlaying = true
    else
        local tween = TweenService:Create(weightValue, tweenInfo, {Value = 0})
        tween:Play()
        tween.Completed:Connect(function()
            animationTrack:Stop()
        end)
        button1.Text = "On"
        isPlaying = false
    end
end)

-- Dragging Functionality
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Check character type and display text label
local function Check()
if humanoid.RigType ~= Enum.HumanoidRigType.R6 then
    textLabel.Visible = true
    button1.Visible = false
    button2.Visible = false
    task.wait(1)
    
    textLabel.Text = "Change Body To R6"
    task.wait(0.5)
local AvatarEditorService = game:GetService("AvatarEditorService")

local player = Players.LocalPlayer -- Get the local player
local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")

if humanoid then
    -- Assuming 'rig' is defined somewhere, replace 'rig' with a valid Enum.HumanoidRigType value
    local rig = "R6" -- Example rig type, change as necessary

    -- Prompt to save avatar
    AvatarEditorService:PromptSaveAvatar(humanoid.HumanoidDescription, Enum.HumanoidRigType[rig])
    
    -- Wait for the result of the prompt
    local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
    
    -- Check the result and print appropriate message
    if result == Enum.AvatarPromptResult.Success then
    humanoid.Health = 0
        textLabel.Visible = false
        button1.Visible = true
        button2.Visible = true
        
        
        
    else
        textLabel.Text ="Avatar change failed."
        task.wait(1)
        textLabel.Text = "Retrying.."
        local rig = "R6" -- Example rig type, change as necessary

    -- Prompt to save avatar
    Check()
    
    
    end
else
    textLabel.Text = "Humanoid not found in character."
end
    
else
    textLabel.Visible = false
end
end

Check()


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

while true do
    task.wait(0.1)
    if humanoid.Health <= 1 then
        button1.Visible = false
        button2.Visible = false
        textLabel.Visible = true
        textLabel.Text = "Re-Executing The Script.."

    
        task.wait(8)
         screenGui:Destroy()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Valiant-Ui-Lib-Gazed-/refs/heads/main/Head%20Down'))()
        
        break
    end
end
