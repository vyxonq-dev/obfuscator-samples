--SC GUI opening

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local BaseParent
pcall(function()
    if gethui then BaseParent = gethui()
    elseif game:GetService("CoreGui"):FindFirstChild("RobloxGui") then BaseParent = game:GetService("CoreGui")
    else BaseParent = LocalPlayer:WaitForChild("PlayerGui") end
end)
if not BaseParent then BaseParent = LocalPlayer:WaitForChild("PlayerGui") end

if BaseParent:FindFirstChild("SClauncher") then
    BaseParent.SClauncher:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SClauncher"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = BaseParent

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(50, 50, 60)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
})
MainGradient.Rotation = 45
MainGradient.Parent = MainFrame

-- Help Button (?)
local HelpBtn = Instance.new("TextButton")
HelpBtn.Size = UDim2.new(0, 26, 0, 26)
HelpBtn.Position = UDim2.new(0, 15, 0, 15)
HelpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
HelpBtn.Text = "?"
HelpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HelpBtn.Font = Enum.Font.GothamBold
HelpBtn.TextSize = 14
HelpBtn.AutoButtonColor = false
HelpBtn.ZIndex = 2
HelpBtn.Parent = MainFrame

local HelpCorner = Instance.new("UICorner")
HelpCorner.CornerRadius = UDim.new(1, 0)
HelpCorner.Parent = HelpBtn

-- Logo
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 40, 0, 40)
Logo.Position = UDim2.new(0, 52, 0, 8)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxthumb://type=Asset&id=128404225586179&w=150&h=150"
Logo.ZIndex = 2
Logo.Parent = MainFrame

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = Logo

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 0, 20)
Title.Position = UDim2.new(0, 105, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "SC GUI LOADER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 2
Title.Parent = MainFrame

-- Sub Title
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(0, 200, 0, 15)
SubTitle.Position = UDim2.new(0, 105, 0, 30)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "System ready to launch."
SubTitle.TextColor3 = Color3.fromRGB(130, 130, 140)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.ZIndex = 2
SubTitle.Parent = MainFrame

-- Developer
local Developer = Instance.new("TextLabel")
Developer.Size= UDim2.new(0, 200, 0, 15)
Developer.Position = UDim2.new(0, 105, 0, 45)
Developer.BackgroundTransparency = 1
Developer.Text = "Created by Justin!"
Developer.TextColor3 = Color3.fromRGB(130, 130, 140)
Developer.Font = Enum.Font.Gotham
Developer.TextSize = 12
Developer.TextXAlignment = Enum.TextXAlignment.Left
Developer.ZIndex = 2
Developer.Parent = MainFrame

-- Sub Developer
local SubDeveloper = Instance.new("TextLabel")
SubDeveloper.Size= UDim2.new(0, 200, 0, 15)
SubDeveloper.Position = UDim2.new(0, 105, 0, 60)
SubDeveloper.BackgroundTransparency = 1
SubDeveloper.Text = "and by our team!"
SubDeveloper.TextColor3 = Color3.fromRGB(130, 130, 140)
SubDeveloper.Font = Enum.Font.Gotham
SubDeveloper.TextSize = 12
SubDeveloper.TextXAlignment = Enum.TextXAlignment.Left
SubDeveloper.ZIndex = 2
SubDeveloper.Parent = MainFrame

-- Close Button (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 12)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.ZIndex = 2
CloseBtn.Parent = MainFrame

-- Execute Button Background
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Size = UDim2.new(0, 280, 0, 45)
ExecuteBtn.Position = UDim2.new(0.5, 0, 0, 140)
ExecuteBtn.AnchorPoint = Vector2.new(0.5, 0)
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.Text = "" -- Teks dikosongkan disini supaya tidak kena bug gradient
ExecuteBtn.AutoButtonColor = false
ExecuteBtn.ClipsDescendants = true
ExecuteBtn.ZIndex = 2
ExecuteBtn.Parent = MainFrame

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 8)
ExecCorner.Parent = ExecuteBtn

local ExecGradient = Instance.new("UIGradient")
ExecGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 220, 110)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 160, 80))
})
ExecGradient.Rotation = 90
ExecGradient.Parent = ExecuteBtn

-- Execute Button Text
local ExecText = Instance.new("TextLabel")
ExecText.Size = UDim2.new(1, 0, 1, 0)
ExecText.BackgroundTransparency = 1
ExecText.Text = "EXECUTE GUI"
ExecText.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecText.Font = Enum.Font.GothamBold
ExecText.TextSize = 16
ExecText.ZIndex = 3
ExecText.Parent = ExecuteBtn

-- Help Menu Frame
local HelpFrame = Instance.new("Frame")
HelpFrame.Size = UDim2.new(0, 0, 0, 0)
HelpFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
HelpFrame.AnchorPoint = Vector2.new(0.5, 0.5)
HelpFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
HelpFrame.BorderSizePixel = 0
HelpFrame.ClipsDescendants = true
HelpFrame.Visible = false -- Mengatasi masalah dot kecil di tengah
HelpFrame.ZIndex = 5
HelpFrame.Parent = ScreenGui

local HelpFrameCorner = Instance.new("UICorner")
HelpFrameCorner.CornerRadius = UDim.new(0, 10)
HelpFrameCorner.Parent = HelpFrame

local HelpFrameStroke = Instance.new("UIStroke")
HelpFrameStroke.Color = Color3.fromRGB(80, 80, 90)
HelpFrameStroke.Thickness = 1.5
HelpFrameStroke.Parent = HelpFrame

local HelpTitle = Instance.new("TextLabel")
HelpTitle.Size = UDim2.new(1, 0, 0, 30)
HelpTitle.Position = UDim2.new(0, 0, 0, 10)
HelpTitle.BackgroundTransparency = 1
HelpTitle.Text = "How To Use"
HelpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HelpTitle.Font = Enum.Font.GothamBold
HelpTitle.TextSize = 16
HelpTitle.ZIndex = 6
HelpTitle.Parent = HelpFrame

local HelpText = Instance.new("TextLabel")
HelpText.Size = UDim2.new(1, -40, 1, -80)
HelpText.Position = UDim2.new(0, 20, 0, 45)
HelpText.BackgroundTransparency = 1
HelpText.Text = "1. Click the 'EXECUTE GUI' button.\n2. Wait a few seconds for the script to load.\n3. The interface will automatically close.\n4. Enjoy the features!"
HelpText.TextColor3 = Color3.fromRGB(180, 180, 190)
HelpText.Font = Enum.Font.Gotham
HelpText.TextSize = 13
HelpText.TextXAlignment = Enum.TextXAlignment.Left
HelpText.TextYAlignment = Enum.TextYAlignment.Top
HelpText.TextWrapped = true
HelpText.ZIndex = 6
HelpText.Parent = HelpFrame

local CloseHelpBtn = Instance.new("TextButton")
CloseHelpBtn.Size = UDim2.new(0, 100, 0, 30)
CloseHelpBtn.Position = UDim2.new(0.5, -50, 1, -40)
CloseHelpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
CloseHelpBtn.Text = "GOT IT"
CloseHelpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseHelpBtn.Font = Enum.Font.GothamBold
CloseHelpBtn.TextSize = 12
CloseHelpBtn.AutoButtonColor = false
CloseHelpBtn.ZIndex = 6
CloseHelpBtn.Parent = HelpFrame

local CloseHelpCorner = Instance.new("UICorner")
CloseHelpCorner.CornerRadius = UDim.new(0, 6)
CloseHelpCorner.Parent = CloseHelpBtn

-- Tween Helper Function
local function CreateTween(instance, properties, duration)
    local tInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(instance, tInfo, properties)
    tween:Play()
    return tween
end

-- Startup Animation
CreateTween(MainFrame, {Size = UDim2.new(0, 380, 0, 220)}, 0.6)

-- Dragging Function
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Hover Animations
ExecuteBtn.MouseEnter:Connect(function()
    CreateTween(ExecuteBtn, {Size = UDim2.new(0, 290, 0, 48)}, 0.2)
end)
ExecuteBtn.MouseLeave:Connect(function()
    CreateTween(ExecuteBtn, {Size = UDim2.new(0, 280, 0, 45)}, 0.2)
end)

CloseBtn.MouseEnter:Connect(function()
    CreateTween(CloseBtn, {TextColor3 = Color3.fromRGB(255, 60, 60)}, 0.2)
end)
CloseBtn.MouseLeave:Connect(function()
    CreateTween(CloseBtn, {TextColor3 = Color3.fromRGB(150, 150, 160)}, 0.2)
end)

HelpBtn.MouseEnter:Connect(function()
    CreateTween(HelpBtn, {BackgroundColor3 = Color3.fromRGB(80, 80, 90)}, 0.2)
end)
HelpBtn.MouseLeave:Connect(function()
    CreateTween(HelpBtn, {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}, 0.2)
end)

CloseHelpBtn.MouseEnter:Connect(function()
    CreateTween(CloseHelpBtn, {BackgroundColor3 = Color3.fromRGB(80, 80, 90)}, 0.2)
end)
CloseHelpBtn.MouseLeave:Connect(function()
    CreateTween(CloseHelpBtn, {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}, 0.2)
end)

-- Help Menu Interactions
HelpBtn.MouseButton1Click:Connect(function()
    HelpFrame.Visible = true
    CreateTween(HelpFrame, {Size = UDim2.new(0, 300, 0, 160)}, 0.4)
end)

CloseHelpBtn.MouseButton1Click:Connect(function()
    local closeHelp = CreateTween(HelpFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
    closeHelp.Completed:Wait()
    HelpFrame.Visible = false
end)

-- Close Window Logic
CloseBtn.MouseButton1Click:Connect(function()
    local closeTween = CreateTween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.4)
    closeTween.Completed:Wait()
    ScreenGui:Destroy()
end)

-- Execute Script Logic
ExecuteBtn.MouseButton1Click:Connect(function()
    CreateTween(ExecuteBtn, {Size = UDim2.new(0, 270, 0, 42)}, 0.1).Completed:Wait()
    ExecText.Text = "LOADING..."
    
    task.wait(0.2)

    local exitTween = CreateTween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.5)
    exitTween.Completed:Wait()
    
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/MvWRJZXp"))()
        end)
    end)
    
    ScreenGui:Destroy()
end)