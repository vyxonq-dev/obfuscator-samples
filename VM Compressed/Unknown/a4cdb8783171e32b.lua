-- [[ 
--    GLEB HUB ULTIMATE V8 (13-в-1) 
--    Создатель: Глеб (Новосибирск)
--    Добавлен: FE CUBE MONSTER
--    Платформа: Delta / Android 14
-- ]]

local player = game.Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

-- Очистка старого меню
if pGui:FindFirstChild("GlebHubV8") then pGui.GlebHubV8:Destroy() end

local sg = Instance.new("ScreenGui", pGui)
sg.Name = "GlebHubV8"
sg.ResetOnSpawn = false
sg.DisplayOrder = 999

-- ОСНОВНОЕ ОКНО
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 230, 0, 420) 
frame.Position = UDim2.new(0.5, -115, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.Visible = false
frame.Active = true
frame.Draggable = true 
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "🥓 GLEB HUB V8"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
Instance.new("UICorner", title)

-- СКРОЛЛ (Увеличил CanvasSize для 13 кнопок)
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, -10, 1, -55)
scroll.Position = UDim2.new(0, 5, 0, 50)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 950) 
scroll.ScrollBarThickness = 5

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 7)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- ФУНКЦИЯ КНОПОК
local function createBtn(name, url, color)
    local b = Instance.new("TextButton", scroll)
    b.Size = UDim2.new(0.95, 0, 0, 55)
    b.Text = name
    b.BackgroundColor3 = color or Color3.fromRGB(45, 45, 45)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    Instance.new("UICorner", b)
    
    b.MouseButton1Down:Connect(function()
        print("Запуск: " .. name)
        if name:find("MORPH") or name:find("ANGEL") then
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-delta-keyboard-crack-reupload-20074"))()
            task.wait(1.5)
        end
        loadstring(game:HttpGet(url))()
    end)
end

-- КНОПКА ОТКРЫТИЯ (gObl00x)
local toggle = Instance.new("TextButton", sg)
toggle.Size = UDim2.new(0, 75, 0, 75)
toggle.Position = UDim2.new(0, 15, 0.2, 0)
toggle.Text = "gObl00x"
toggle.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
toggle.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 38)

toggle.MouseButton1Down:Connect(function()
    frame.Visible = not frame.Visible
end)

-- --- СПИСОК СКРИПТОВ (13 ШТУК) ---

-- НОВИНКА! Твой кубиный монстр
createBtn("🧱 CUBE MONSTER FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-FE-CUBE-MONSTER-128347", Color3.fromRGB(100, 100, 100))

-- Морфы
createBtn("😈 gObl00x MORPHS", "https://raw.githubusercontent.com/dksks8282/GlebScripts/refs/heads/main/hub%20morph%20gObl00x", Color3.fromRGB(255, 0, 0))

-- Остальные 11
createBtn("🚀 Mobile Fly V5", "https://rawscripts.net/raw/Universal-Script-Gleb-Hub-V5-Mobile-Fly-Joystick-Up-Down-110267", Color3.fromRGB(0, 100, 255))
createBtn("🦘 Endless Jump Russia", "https://rawscripts.net/raw/UP-Just-a-baseplate.-endless-jumping-Russia-110337", Color3.fromRGB(0, 150, 0))
createBtn("🎵 Cool Music", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Cool-music-110555", Color3.fromRGB(130, 0, 130))
createBtn("👤 Copy Name RU", "https://rawscripts.net/raw/UP-Just-a-baseplate.-copy-player-name-ru-110574", Color3.fromRGB(70, 70, 70))
createBtn("🇷🇺 FE Flags RU", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-flagi-ru-110986", Color3.fromRGB(200, 0, 0))
createBtn("⚙️ ESC GUI RU", "https://rawscripts.net/raw/Universal-Script-ESC-GUI-ru-RU-112817", Color3.fromRGB(90, 90, 90))
createBtn("⚔️ Sword Script", "https://rawscripts.net/raw/UP-Just-a-baseplate.-sword-script-127007", Color3.fromRGB(160, 90, 0))
createBtn("🗡️ Sword V2 (Hitbox)", "https://rawscripts.net/raw/UP-Just-a-baseplate.-sword-v2-Large-hitboxes-127497", Color3.fromRGB(230, 90, 0))
createBtn("🔫 Laser Gun Beta", "https://rawscripts.net/raw/UP-Just-a-baseplate.-laser-gun-beta-127500", Color3.fromRGB(0, 180, 180))
createBtn("💣 Bomb Script", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Bomb-127636", Color3.fromRGB(220, 40, 40))
createBtn("⏳ TIME STOP + BOMB", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Stopping-time-and-bomb-128246", Color3.fromRGB(0, 0, 0))

print("Глеб, хаб обновлен! Теперь там 13 скриптов, включая Кубиного Монстра! 🧱🔥")
