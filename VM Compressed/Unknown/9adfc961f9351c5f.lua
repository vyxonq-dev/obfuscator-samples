local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "Common hub V1"

local Window = Instance.new("Frame")
Window.Name = "Window"
Window.Parent = ScreenGui
Window.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Window.Position = UDim2.new(0.5, -150, 0.5, -150)
Window.Size = UDim2.new(0, 300, 0, 375)  
Window.BorderSizePixel = 2
Window.BorderColor3 = Color3.fromRGB(60, 60, 60)
Window.Active = true
Window.Draggable = true

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = Window
ScrollFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ScrollFrame.Position = UDim2.new(0, 0, 0, 30)
ScrollFrame.Size = UDim2.new(1, 0, 1, -30)
ScrollFrame.BorderSizePixel = 0

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
ScrollFrame.ScrollBarThickness = 16

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = Window
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 30)

local TitleIcon = Instance.new("ImageLabel")
TitleIcon.Name = "TitleIcon"
TitleIcon.Parent = TitleBar
TitleIcon.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleIcon.Position = UDim2.new(0, 5, 0, 5)
TitleIcon.Size = UDim2.new(0, 20, 0, 20)
TitleIcon.Image = "rbxassetid://16145174066"

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleLabel.Position = UDim2.new(0, 30, 0, 0)
TitleLabel.Size = UDim2.new(1, -30, 1, 0)
TitleLabel.Text = "Common Hub Test"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 20
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)  
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end)
CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
end)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local buttonFont = Enum.Font.GothamSemibold

local function styleButton(button)
    button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    button.Size = UDim2.new(0, 250, 0, 50)  
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = buttonFont
    button.BorderSizePixel = 2
    button.BorderColor3 = Color3.fromRGB(100, 100, 100)
    button.TextScaled = true
end

local function createButton(parent, layoutOrder, text, scriptUrl, description)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.LayoutOrder = layoutOrder
    button.Text = text
    button.TextScaled = false
    button.TextSize = 18
    styleButton(button)
    
    local tooltip = Instance.new("TextLabel")
    tooltip.Name = "Tooltip"
    tooltip.Parent = button
    tooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tooltip.Position = UDim2.new(1, 10, 0, 0)
    tooltip.Size = UDim2.new(0, 150, 0, 30)
    tooltip.Text = description
    tooltip.TextColor3 = Color3.new(1, 1, 1)
    tooltip.Font = Enum.Font.SourceSans
    tooltip.TextSize = 14
    tooltip.Visible = false
    
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        tooltip.Visible = true
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        tooltip.Visible = false
    end)
    
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
    
    return button
end

local buttonsInfo = {
    {Text = "Expander", Url = 'https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua', Position = UDim2.new(0.5, -125, 0, 50), Description = "Expand hitboxes for better gameplay"},
    {Text = "Aimbot", Url = 'https://raw.githubusercontent.com/PABLOSleuth2/Scripts1/main/RobloxScripts/TEST/aimbot_v2.lua', Position = UDim2.new(0.5, -125, 0, 125), Description = "Enhance aiming accuracy"},
    {Text = "Fly", Url = 'https://raw.githubusercontent.com/Niviana1/Personal-exploit-/main/Mobilefly.lua', Position = UDim2.new(0.5, -125, 0, 200), Description = "Enable flying mode"}
}

for index, buttonInfo in ipairs(buttonsInfo) do
    createButton(ScrollFrame, index, buttonInfo.Text, buttonInfo.Url, buttonInfo.Description)
end
