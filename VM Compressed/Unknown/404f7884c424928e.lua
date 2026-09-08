--// Настройки
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)

local KeyListURL = "https://gist.githubusercontent.com/GeniusofAB/976d773cead0c597b4d57b0a75447814/raw/5839550577fee99643072c001add10074bb8aab4/Keys.txt"
local ScriptURL = "https://raw.githubusercontent.com/GeniusofAB/Script-/refs/heads/main/Dead_rails.lua"
local keys = {}

--// Интерфейс
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 200)
main.Position = UDim2.new(0.5, -150, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local keyInput = Instance.new("TextBox", main)
keyInput.Size = UDim2.new(0, 260, 0, 30)
keyInput.Position = UDim2.new(0.5, -130, 0.3, 0)
keyInput.PlaceholderText = "Введите ключ"
keyInput.Text = ""
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 8)

local checkKeyBtn = Instance.new("TextButton", main)
checkKeyBtn.Size = UDim2.new(0, 120, 0, 30)
checkKeyBtn.Position = UDim2.new(0.5, -130, 0.6, 0)
checkKeyBtn.Text = "check key"
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", checkKeyBtn).CornerRadius = UDim.new(0, 8)

local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Size = UDim2.new(0, 120, 0, 30)
getKeyBtn.Position = UDim2.new(0.5, 10, 0.6, 0)
getKeyBtn.Text = "Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 150)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

local notification = Instance.new("TextLabel", gui)
notification.Size = UDim2.new(0, 300, 0, 50)
notification.Position = UDim2.new(0.5, -150, 0.8, 0)
notification.Text = ""
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
notification.Visible = false
Instance.new("UICorner", notification).CornerRadius = UDim.new(0, 8)

--// Функции
local function showNotification(text, duration)
    notification.Text = text
    notification.Visible = true
    wait(duration or 2)
    notification.Visible = false
end

local function fetchKeys()
    local success, result = pcall(function()
        return game:HttpGet(KeyListURL)
    end)
    if success then
        keys = {}
        for key in result:gmatch("[^\r\n]+") do
            table.insert(keys, key)
        end
        print("Загруженные ключи:", HttpService:JSONEncode(keys))
    else
        warn("Не удалось получить список ключей: " .. tostring(result))
        showNotification("Ошибка загрузки ключей!", 3)
    end
end

local function keyExists(key)
    for _, storedKey in ipairs(keys) do
        if storedKey == key then
            return true
        end
    end
    return false
end

checkKeyBtn.MouseButton1Click:Connect(function()
    local inputKey = keyInput.Text
    if keyExists(inputKey) then
        showNotification("Ключ принят!", 3)
        main.Visible = false -- Закрываем окно при верном ключе
        -- Запускаем основной скрипт
        local success, err = pcall(function()
            loadstring(game:HttpGet(ScriptURL))()
        end)
        if not success then
            warn("Ошибка при запуске скрипта: " .. tostring(err))
            showNotification("error!", 3)
        end
    else
        showNotification("Неверный ключ", 3)
    end
end)

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/deltaversions/243")
    showNotification("Ссылка скопирована!", 2)
end)

--// Инициализация
fetchKeys()
