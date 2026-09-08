local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LynixGui"
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -112, 0.5, -57)
Frame.Size = UDim2.new(0, 224, 0, 115)

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(188, 188, 188))
}
UIGradient.Parent = Frame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.91, 0, 0.05, 0)
CloseButton.Size = UDim2.new(0, 19, 0, 9)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "x"
CloseButton.TextColor3 = Color3.fromRGB(247, 247, 247)
CloseButton.TextSize = 14.000

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local SectionSAB = Instance.new("Frame")
SectionSAB.Name = "SectionSAB"
SectionSAB.Parent = Frame
SectionSAB.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SectionSAB.BorderSizePixel = 0
SectionSAB.Position = UDim2.new(0.045, 0, 0.19, 0)
SectionSAB.Size = UDim2.new(0, 204, 0, 38)

local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = SectionSAB

local LabelSAB = Instance.new("TextLabel")
LabelSAB.Parent = SectionSAB
LabelSAB.BackgroundTransparency = 1.000
LabelSAB.Size = UDim2.new(0, 88, 0, 38)
LabelSAB.Font = Enum.Font.SourceSansBold
LabelSAB.Text = "Lynix | SAB"
LabelSAB.TextColor3 = Color3.fromRGB(255, 255, 255)
LabelSAB.TextSize = 14.000

local ButtonSAB = Instance.new("ImageButton")
ButtonSAB.Name = "ExecuteSAB"
ButtonSAB.Parent = SectionSAB
ButtonSAB.BackgroundTransparency = 1.000
ButtonSAB.Position = UDim2.new(0.84, 0, 0.21, 0)
ButtonSAB.Size = UDim2.new(0, 22, 0, 22)
ButtonSAB.Image = "rbxassetid://84836472881925"

ButtonSAB.MouseButton1Click:Connect(function()
    local scriptURL = "https://raw.githubusercontent.com/qAxAp/Lynix/refs/heads/main/LynixSAB_OBF.lua" 
    loadstring(game:HttpGet(scriptURL))()
end)

local SectionPL = Instance.new("Frame")
SectionPL.Name = "SectionPL"
SectionPL.Parent = Frame
SectionPL.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SectionPL.BorderSizePixel = 0
SectionPL.Position = UDim2.new(0.045, 0, 0.59, 0)
SectionPL.Size = UDim2.new(0, 204, 0, 38)

local UICorner_3 = Instance.new("UICorner")
UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = SectionPL

local LabelPL = Instance.new("TextLabel")
LabelPL.Parent = SectionPL
LabelPL.BackgroundTransparency = 1.000
LabelPL.Size = UDim2.new(0, 123, 0, 38)
LabelPL.Font = Enum.Font.SourceSansBold
LabelPL.Text = "Lynix | Prison Life"
LabelPL.TextColor3 = Color3.fromRGB(238, 238, 238)
LabelPL.TextSize = 14.000

local ButtonPL = Instance.new("ImageButton")
ButtonPL.Name = "ExecutePL"
ButtonPL.Parent = SectionPL
ButtonPL.BackgroundTransparency = 1.000
ButtonPL.Position = UDim2.new(0.84, 0, 0.21, 0)
ButtonPL.Size = UDim2.new(0, 22, 0, 22)
ButtonPL.Image = "rbxassetid://84836472881925"

ButtonPL.MouseButton1Click:Connect(function()
    local scriptURL = "https://raw.githubusercontent.com/qAxAp/Lynix/refs/heads/main/Lynix"
    loadstring(game:HttpGet(scriptURL))()
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    TweenService:Create(Frame, TweenInfo.new(0.15), {Position = targetPos}):Play()
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
