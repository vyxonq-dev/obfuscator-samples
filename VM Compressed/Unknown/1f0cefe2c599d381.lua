local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем размытый фон

local BlurEffect = Instance.new("BlurEffect")

BlurEffect.Size = 24

BlurEffect.Parent = game:GetService("Lighting")

-- Основной фрейм

local Frame = Instance.new("Frame")

Frame.Size = UDim2.new(1, 0, 1, 0)

Frame.BackgroundTransparency = 1

Frame.Parent = ScreenGui

-- Текст лейбл (на весь экран)

local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(1, 0, 1, 0)

TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)

TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)

TextLabel.BackgroundTransparency = 1

TextLabel.Text = "<font color='rgb(255, 165, 0)'>KRT</font> Hub" -- Оранжевый только KRT (RGB: 255, 165, 0)

TextLabel.RichText = true -- Включаем форматирование текста

TextLabel.Font = Enum.Font.GothamBlack

TextLabel.TextSize = 80 -- Уменьшенный размер текста (было 120)

TextLabel.TextScaled = true

TextLabel.TextColor3 = Color3.new(0, 0, 0) -- Черный цвет текста (для Hub)

TextLabel.TextStrokeTransparency = 0.5

TextLabel.TextStrokeColor3 = Color3.new(1, 1, 1) -- Белая обводка для контраста

TextLabel.Parent = Frame

-- Ждем 3 секунды, затем исчезаем и запускаем скрипт

wait(3)

-- Анимация растворения (уменьшение прозрачности)

local fadeTime = 1 -- время анимации в секундах

local startTime = tick()

local fadeConnection

fadeConnection = game:GetService("RunService").Heartbeat:Connect(function()

    local elapsed = tick() - startTime

    local progress = math.min(elapsed / fadeTime, 1)

    

    -- Плавное увеличение прозрачности

    TextLabel.TextTransparency = progress

    TextLabel.TextStrokeTransparency = progress

    

    if progress >= 1 then

        fadeConnection:Disconnect()

    end

end)

wait(fadeTime)

-- Удаление эффектов и GUI

BlurEffect:Destroy()

ScreenGui:Destroy()

-- Запуск основного скрипта

loadstring(game:HttpGet("https://pastefy.app/YYXWFOOu/raw"))()