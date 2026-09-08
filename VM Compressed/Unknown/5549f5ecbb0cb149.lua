-- FINAL RETRO HUB (WIN95 STYLE)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local Container = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

-- Настройка GUI
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "RetroGamesHub"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -120)
MainFrame.Size = UDim2.new(0, 220, 0, 240)
MainFrame.Active = true
MainFrame.Draggable = true

-- Декор: Тень для ретро-эффекта
local Shadow = Instance.new("Frame")
Shadow.Parent = MainFrame
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.Position = UDim2.new(0, 4, 0, 4)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.ZIndex = 0

TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 128)
TopBar.Size = UDim2.new(1, -4, 0, 20)
TopBar.Position = UDim2.new(0, 2, 0, 2)
TopBar.BorderSizePixel = 0

Title.Parent = TopBar
Title.Size = UDim2.new(1, -25, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "C:\\GAMES\\MENU.EXE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Code
Title.TextSize = 13
Title.BackgroundTransparency = 1

CloseBtn.Parent = TopBar
CloseBtn.Size = UDim2.new(0, 16, 0, 16)
CloseBtn.Position = UDim2.new(1, -18, 0, 2)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 12
CloseBtn.BorderSizePixel = 1
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 10, 0, 35)
Container.Size = UDim2.new(1, -20, 1, -45)

UIListLayout.Parent = Container
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 12)

local function loadGame(url, name)
    print("Loading " .. name .. "...")
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load " .. name .. ": " .. tostring(err))
    end
end

local function createButton(name, url)
    local btn = Instance.new("TextButton")
    btn.Parent = Container
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Text = name:upper()
    btn.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.Font = Enum.Font.Code
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 15

    btn.MouseButton1Click:Connect(function()
        loadGame(url, name)
    end)
end

-- Кнопки с твоими ссылками
createButton("Minesweeper", "https://raw.githubusercontent.com/Xkaka228X/Minesweeper/refs/heads/main/README.md")
createButton("Snake Game", "https://raw.githubusercontent.com/Xkaka228X/Snake/refs/heads/main/README.md")
createButton("Tetris OS", "https://raw.githubusercontent.com/Xkaka228X/Tetris/refs/heads/main/README.md")
