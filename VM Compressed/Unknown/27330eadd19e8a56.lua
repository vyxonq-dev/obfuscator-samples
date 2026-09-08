local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:FindFirstChildOfClass("PlayerGui") or CoreGui

if PlayerGui:FindFirstChild("KikisGuiLanguagePanel") then
    PlayerGui.KikisGuiLanguagePanel:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KikisGuiLanguagePanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 280)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -70, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Text = "Idioma"
TitleLabel.Parent = TopBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 2)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "x"
CloseButton.Parent = TopBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 2)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Text = "-"
MinimizeButton.Parent = TopBar

local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -20, 1, -45)
ContentContainer.Position = UDim2.new(0, 10, 0, 40)
ContentContainer.BackgroundTransparency = 1
ContentContainer.BorderSizePixel = 0
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 240)
ContentContainer.ScrollBarThickness = 4
ContentContainer.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- Lista optimizada con codificación URL para evitar errores de red en Roblox
local languages = {
    {Name = "Español", File = "Espa%C3%B1ol.text"},
    {Name = "English", File = "English.text"},
    {Name = "Português", File = "Portugu%C3%AAs.text"},
    {Name = "Guarani", File = "Guaran%C3%AD.text"},
    {Name = "한국인", File = "%ED%95%9C%EA%B5%AD%EC%9D%B8.text"}
}

for i, lang in ipairs(languages) do
    local Btn = Instance.new("TextButton")
    Btn.Name = lang.Name .. "Button"
    Btn.Size = UDim2.new(1, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 14
    Btn.Font = Enum.Font.SourceSans
    Btn.Text = lang.Name
    Btn.Parent = ContentContainer
    
    Btn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        local url = "https://raw.githubusercontent.com/galolmedo1-svg/Kiki-s-Gui/main/" .. lang.File
        pcall(function()
            loadstring(game:HttpGet(url))()
        end)
    end)
end

local titles = {"Idioma", "language", "ñe'ẽ", "linguagem", "언어"}
task.spawn(function()
    local idx = 1
    while ScreenGui.Parent do
        TitleLabel.Text = titles[idx]
        idx = idx % #titles + 1
        task.wait(0.5)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local IconContainer = Instance.new("ImageButton")
IconContainer.Name = "NoobIcon"
IconContainer.Size = UDim2.new(0, 50, 0, 50)
IconContainer.Position = UDim2.new(0.1, 0, 0.1, 0)
IconContainer.Image = "rbxassetid://753015086"
IconContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
IconContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
IconContainer.Visible = false
IconContainer.Active = true
IconContainer.Draggable = true
IconContainer.Parent = ScreenGui

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame.Visible = false
        IconContainer.Visible = true
        MinimizeButton.Text = "+"
    else
        MainFrame.Visible = true
        IconContainer.Visible = false
        MinimizeButton.Text = "-"
    end
end)

IconContainer.MouseButton1Click:Connect(function()
    if minimized then
        minimized = false
        MainFrame.Visible = true
        IconContainer.Visible = false
        MinimizeButton.Text = "-"
    end
end)
