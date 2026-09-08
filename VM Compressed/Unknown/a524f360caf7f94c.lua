-- Создаём GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Основное окно
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 300)
mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(144, 238, 144)
mainFrame.BorderSizePixel = 2
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Заголовок
local title = Instance.new("TextLabel")
title.Text = "HD Menu Admin Player"
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(0,0,0)
title.Parent = mainFrame

-- Кнопка закрытия (X)
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 40, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    mainFrame:Destroy()
end)

-- Функция для кнопок
local function createButton(text, posX, posY, w, h, url)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, w, 0, h)
    button.Position = UDim2.new(0, posX, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(173, 216, 230)
    button.TextScaled = true
    button.Font = Enum.Font.SourceSansBold
    button.TextColor3 = Color3.fromRGB(0,0,0)
    button.Parent = mainFrame

    -- Запуск скрипта по клику
    button.MouseButton1Click:Connect(function()
        if url and url ~= "" then
            loadstring(game:HttpGet(url))()
        else
            warn("Вставь ссылку для кнопки: " .. text)
        end
    end)

    return button
end

-- Левая колонка
createButton("HD FLY", 10, 50, 180, 50, "https://pastebin.com/raw/jtUXFkQP") 
createButton("HD Mod", 10, 110, 180, 50, "https://pastebin.com/raw/c3r8f6eM")
createButton("HD Noclip", 10, 170, 180, 50, "https://pastebin.com/raw/p7UfhTKb")

-- Правая колонка
createButton("HD invieible", 210, 50, 180, 50, "https://pastebin.com/raw/3Rnd9rHf")
createButton("HD Fling", 210, 110, 180, 50, "https://rawscripts.net/raw/Universal-Script-Punch-Fling-17118")
createButton("HD Teleport", 210, 170, 180, 50, "https://pastebin.com/raw/8XHYiHdh")

-- Нижняя кнопка
createButton("HD Kill player geme", 10, 240, 380, 40, "https://pastebin.com/raw/QAJ1nNFf")