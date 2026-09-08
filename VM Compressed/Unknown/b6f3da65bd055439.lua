local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CheckerPanelGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.05, 0)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 3
UIStroke.Parent = MainFrame

local function AnimateUIStroke()
    while true do
        for hue = 0, 1, 0.01 do
            UIStroke.Color = Color3.fromHSV(hue, 1, 1)
            task.wait(0.05)
        end
    end
end

spawn(AnimateUIStroke)

local Title = Instance.new("TextLabel")
Title.Text = "🔬 Executor Checker Panel"
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "❌"
CloseButton.Size = UDim2.new(0.15, 0, 0.15, 0)
CloseButton.Position = UDim2.new(0.85, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.Parent = MainFrame

local UICorner_Close = Instance.new("UICorner")
UICorner_Close.CornerRadius = UDim.new(1, 0)
UICorner_Close.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local function CreateButton(text, position, scriptUrl)
    local Button = Instance.new("TextButton")
    Button.Text = text
    Button.Size = UDim2.new(0.9, 0, 0.1, 0)
    Button.Position = UDim2.new(0.05, 0, position, 0)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 16
    Button.Parent = MainFrame

    local UICorner_Button = Instance.new("UICorner")
    UICorner_Button.CornerRadius = UDim.new(0.2, 0)
    UICorner_Button.Parent = Button

    Button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
end

CreateButton("📌 UNC Test Official", 0.2, "https://rawscripts.net/raw/Universal-Script-UNC-Test-13114")
CreateButton("📌 sUNC Test", 0.32, "https://gitlab.com/sens3/nebunu/-/raw/main/HummingBird8's_sUNC_yes_i_moved_to_gitlab_because_my_github_acc_got_brickedd/sUNCm0m3n7.lua")
CreateButton("🍒 CET (Cherry's Environment Test)", 0.44, "https://raw.githubusercontent.com/InfernusScripts/Executor-Tests/refs/heads/main/Environment/Test.lua")
CreateButton("⚙️ Require Support", 0.56, "https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/RequireChecker.lua")
CreateButton("🆔 Identity Test", 0.68, "https://raw.githubusercontent.com/InfernusScripts/Executor-Tests/main/Identity/Test.lua")
CreateButton("📈 Level Test", 0.8, "https://raw.githubusercontent.com/vvult/HIdentity/refs/heads/main/HIdentity")

local Dragging, DragStart, StartPos, DragInput

local function Update(input)
    local delta = input.Position - DragStart
    MainFrame.Position = UDim2.new(
        StartPos.X.Scale, 
        StartPos.X.Offset + delta.X,
        StartPos.Y.Scale, 
        StartPos.Y.Offset + delta.Y
    )
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        Update(input)
    end
end)

print("✅ UI Loaded Successfully")
