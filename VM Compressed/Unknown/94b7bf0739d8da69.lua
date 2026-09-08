-- 🌀 УНИВЕРСАЛЬНОЕ МЕНЮ BY ROBANIK
local BUTTON_IMAGE_ID = "rbxassetid://107781958606208"

-- 🔑 Ключи (можно добавить несколько)
local VALID_KEYS = {
    "HUBRR",
}

-- 🔗 Ссылка на получение ключа
local GET_KEY_LINK = "https://discord.gg/sEHz2Ex7"

local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Окно ввода ключа
local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = ScreenGui
KeyFrame.Size = UDim2.new(0, 300, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local KeyLabel = Instance.new("TextLabel", KeyFrame)
KeyLabel.Size = UDim2.new(1, 0, 0, 40)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "Введите HUBRR"
KeyLabel.Font = Enum.Font.GothamBold
KeyLabel.TextSize = 18
KeyLabel.TextColor3 = Color3.fromRGB(255,255,255)

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.8, 0, 0, 35)
KeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyBox.PlaceholderText = "Ваш ключ..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0,8)

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.Size = UDim2.new(0.6, 0, 0, 35)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
SubmitBtn.Text = "Подтвердить"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 16
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
SubmitBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0,8)

local GetKeyBtn = Instance.new("TextButton", KeyFrame)
GetKeyBtn.Size = UDim2.new(0.6, 0, 0, 35)
GetKeyBtn.Position = UDim2.new(0.2, 0, 0.82, 0)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 16
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
GetKeyBtn.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0,8)

-- Главное меню
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)

-- Шапка меню
local HeaderLabel = Instance.new("TextLabel", MainFrame)
HeaderLabel.Size = UDim2.new(1, 0, 0, 40)
HeaderLabel.Position = UDim2.new(0, 10, 0, 10)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.TextColor3 = Color3.fromRGB(255,255,255)
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextSize = 16
HeaderLabel.Text = "ROBANIK | HUB"

-- Вкладки
local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Parent = MainFrame
TabScroll.Size = UDim2.new(1, -20, 0, 40)
TabScroll.Position = UDim2.new(0, 10, 0, 60)
TabScroll.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabScroll.ScrollBarThickness = 6
TabScroll.CanvasSize = UDim2.new(0,0,0,0)
TabScroll.ScrollBarImageColor3 = Color3.fromRGB(0,170,255)
TabScroll.BorderSizePixel = 0
Instance.new("UICorner", TabScroll).CornerRadius = UDim.new(0, 10)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = TabScroll

local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.Position = UDim2.new(0, 10, 0, 110)
ContentFrame.BackgroundTransparency = 1

-- Хранилища
local Pages = {}
local CurrentPage = nil

-- 📌 Функция добавления вкладки
local function AddTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 1, 0)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BackgroundTransparency = 1
    btn.Parent = TabScroll

    wait()
    TabScroll.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 10, 0, 0)

    local page = Instance.new("ScrollingFrame", ContentFrame)
    page.Size = UDim2.new(1,0,1,0)
    page.CanvasSize = UDim2.new(0,0,0,0)
    page.ScrollBarThickness = 6
    page.Visible = false
    page.BackgroundTransparency = 1
    Pages[name] = page

    btn.MouseButton1Click:Connect(function()
        if CurrentPage then CurrentPage.Visible = false end
        page.Visible = true
        CurrentPage = page
    end)

    if not CurrentPage then
        page.Visible = true
        CurrentPage = page
    end
end

-- 📌 Функция добавления кнопки
local function AddButton(tabName, text, callback)
    local page = Pages[tabName]
    if not page then return warn("Вкладка "..tabName.." не найдена!") end

    local btn = Instance.new("TextButton", page)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, (#page:GetChildren()-1)*50)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    page.CanvasSize = UDim2.new(0,0,0,(#page:GetChildren()-1)*50+60)

    btn.MouseButton1Click:Connect(callback)
end

-- Кнопка открытия меню (после ввода ключа)
local OpenButton = Instance.new("ImageButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 60, 0, 60)
OpenButton.Position = UDim2.new(0, 20, 0.5, -30)
OpenButton.BackgroundTransparency = 1
OpenButton.Image = BUTTON_IMAGE_ID
OpenButton.ScaleType = Enum.ScaleType.Fit
OpenButton.Visible = false
Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1, 0)

local menuOpen = false
OpenButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    MainFrame.Visible = menuOpen
end)

-- Проверка ключа
SubmitBtn.MouseButton1Click:Connect(function()
    local input = KeyBox.Text
    for _, key in ipairs(VALID_KEYS) do
        if input == key then
            KeyFrame.Visible = false
            OpenButton.Visible = true
            return
        end
    end
    KeyLabel.Text = "❌ Неверный ключ!"
    KeyLabel.TextColor3 = Color3.fromRGB(255,100,100)
end)

-- 📌 Кнопка Get Key (копирует ссылку)
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(GET_KEY_LINK) -- ⚡ копирует ссылку
    KeyLabel.Text = "✔️ Ссылка скопирована!"
    KeyLabel.TextColor3 = Color3.fromRGB(100,255,100)
end)

-- 📌 Аватар игрока внизу слева
local PlayerFrame = Instance.new("Frame", MainFrame)
PlayerFrame.Size = UDim2.new(0,200,0,50)
PlayerFrame.Position = UDim2.new(0,10,1,-60)
PlayerFrame.BackgroundTransparency = 1

local Avatar = Instance.new("ImageLabel", PlayerFrame)
Avatar.Size = UDim2.new(0,40,0,40)
Avatar.Position = UDim2.new(0,0,0.5,-20)
Avatar.BackgroundTransparency = 0
Avatar.BackgroundColor3 = Color3.fromRGB(255,255,255)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=420&h=420"
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1,0)

local NameLabel = Instance.new("TextLabel", PlayerFrame)
NameLabel.Size = UDim2.new(1,-50,1,0)
NameLabel.Position = UDim2.new(0,50,0,0)
NameLabel.BackgroundTransparency = 1
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextSize = 18
NameLabel.TextColor3 = Color3.fromRGB(255,255,255)
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.Text = player.Name

-- 📌 Пример
AddTab("HORRORS")
AddTab("SHOOTER")
AddTab("NO GAMES")
AddTab("CREDITS")

------------------------------------------------

AddButton("HORRORS", "ikea", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/3008_BY_TOBANIK/refs/heads/main/ROBANIK_3008"))()
end)

AddButton("HORRORS", "doors", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/DOORS_BY_ROBANIK/refs/heads/main/BY_ROBANIK"))()
end)

AddButton("HORRORS", "rainbow friends 2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/Rainbow_Friends_By_Robanik/refs/heads/main/RAINBOWFRIENDS2"))()
end)

AddButton("HORRORS", "evade", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/EVADE_ROBANIK/refs/heads/main/ROBANIK_EVADE"))()
end)

AddButton("HORRORS", "99 night...", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/99_night_premium_menu/refs/heads/main/99MENUROBANIK"))()
end)

------------------------------------------------

AddButton("SHOOTER", "arsenal", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/ARSENAL_ROBANIK/refs/heads/main/ARSENAL_ROBANIK"))()
end)

AddButton("SHOOTER", "rivals", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/RIVALS_ROBANIK/refs/heads/main/Rivals_ROBANIK"))()
end)

AddButton("SHOOTER", "no scope arcade", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/NOSCOPE_ROBANIK/refs/heads/main/NOSCOPERR"))()
end)

------------------------------------------------

AddButton("CREDITS", "CREDIT", function()
end)

AddButton("CREDITS", "ROBANIK", function()
end)
