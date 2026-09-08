-- by: @kirill_p6 on Telegram/Discord
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local Container = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UICorner = Instance.new("UICorner")
local Shadow = Instance.new("ImageLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "AI HUB"
ScreenGui.ResetOnSpawn = false

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

Shadow.Parent = MainFrame
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -5, 0, -5)
Shadow.Size = UDim2.new(1, 10, 1, 10)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ZIndex = -1

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "🔧 SCRIPT HUB v1.0"
Title.TextColor3 = Color3.fromRGB(200, 200, 255)
Title.TextSize = 16
Title.ZIndex = 2

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

CloseButton.Parent = Title
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.ZIndex = 3

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

MinimizeButton.Parent = Title
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Position = UDim2.new(1, -60, 0, 5)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
MinimizeButton.ZIndex = 3

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 4)
MinimizeCorner.Parent = MinimizeButton

Container.Parent = MainFrame
Container.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Container.Position = UDim2.new(0, 0, 0, 35)
Container.Size = UDim2.new(1, 0, 1, -35)

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 8)
ContainerCorner.Parent = Container

ScrollingFrame.Parent = Container
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 150)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createButton(name, scriptPath, icon, order)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    local Icon = Instance.new("TextLabel")
    
    Button.Parent = ScrollingFrame
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(0.95, 0, 0, 45)
    Button.Font = Enum.Font.GothamSemibold
    Button.Text = ""
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.LayoutOrder = order
    Button.AutoButtonColor = false
    
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    Icon.Parent = Button
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 10, 0, 0)
    Icon.Size = UDim2.new(0, 30, 1, 0)
    Icon.Font = Enum.Font.GothamBold
    Icon.Text = icon or "📦"
    Icon.TextColor3 = Color3.fromRGB(150, 150, 255)
    Icon.TextSize = 20
    
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Parent = Button
    NameLabel.BackgroundTransparency = 1
    NameLabel.Position = UDim2.new(0, 45, 0, 0)
    NameLabel.Size = UDim2.new(1, -55, 1, 0)
    NameLabel.Font = Enum.Font.GothamSemibold
    NameLabel.Text = name
    NameLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
    NameLabel.TextSize = 14
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    Button.MouseEnter:Connect(function()
        Button:TweenSize(UDim2.new(0.96, 0, 0, 47), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1)
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 85)
    end)
    
    Button.MouseLeave:Connect(function()
        Button:TweenSize(UDim2.new(0.95, 0, 0, 45), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1)
        Button.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    end)
    
    Button.MouseButton1Click:Connect(function()
        -- Скрываем GUI перед загрузкой скрипта
        MainFrame.Visible = false
        
        -- Загружаем скрипт
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet(scriptPath))()
        end)
        
        if not success then
            MainFrame.Visible = true
            warn("Ошибка загрузки: " .. tostring(errorMsg))
        end
    end)
end

local icons = {"🚀", "⚡", "🔫", "💰", "🎮", "⚙️", "📦", "🔧", "💎", "🎯"}

local scripts = {
    {name = "tp + auto tp", path = "https://raw.githubusercontent.com/3lamkir/A/refs/heads/main/tp", icon = "🌍"},
    {name = "Object Mover", path = "https://raw.githubusercontent.com/3lamkir/A/refs/heads/main/Object_Mover", icon = "🎯"},
}

for i, script in ipairs(scripts) do
    createButton(script.name, script.path, script.icon, i)
end
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 300, 0, 35), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
        Container.Visible = false
        MinimizeButton.Text = "□"
    else
        MainFrame:TweenSize(UDim2.new(0, 300, 0, 200), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
        wait(0.2)
        Container.Visible = true
        MinimizeButton.Text = "−"
    end
end)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame:TweenSize(UDim2.new(0, 300, 0, 200), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5)