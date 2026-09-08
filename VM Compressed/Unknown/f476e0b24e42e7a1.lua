-- ☢️ COSMIC SANCTITY FOLDER CREATOR ☢️
pcall(function()
    local krnlPath = "/storage/emulated/0/krnl"
    local cosmicPath = krnlPath .. "/Cosmicsancity"
    if not isfolder(krnlPath) then makefolder(krnlPath) end
    if not isfolder(cosmicPath) then makefolder(cosmicPath) end
    writefile(cosmicPath .. "/Soon.txt", "Ядерный понос скоро")
    print("☢️ Cosmic Sanctity активирован!")
end)

-- ОСТАЛЬНОЙ ТВОЙ КОД ЗАГРУЗЧИКА:
local ScreenGui = Instance.new("ScreenGui")
local LoadingFrame = Instance.new("Frame")
local LoadingText = Instance.new("TextLabel")
local ProgressBar = Instance.new("Frame")
local ProgressFill = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Функция для Roblox уведомления
local function showGameDetectedNotification(gameName)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🌌 COSMIC HUB",
        Text = gameName .. " Detected!",
        Icon = "rbxassetid://0",
        Duration = 5
    })
end

-- Проверка ID игры
local isBrookhaven = (game.PlaceId == 4924922222)
local isMurderMystery2 = (game.PlaceId == 142823291)
local is99Nights = (game.PlaceId == 6785013416)  -- Добавил проверку для 99 Nights

-- Показываем уведомление при обнаружении игры
if isBrookhaven then
    showGameDetectedNotification("Brookhaven")
elseif isMurderMystery2 then
    showGameDetectedNotification("Murder Mystery 2")
elseif is99Nights then
    showGameDetectedNotification("99 Nights")  -- Уведомление для 99 Nights
end

-- Фрейм загрузки
LoadingFrame.Parent = ScreenGui
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingFrame.BackgroundTransparency = 0.1
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Position = UDim2.new(0, 0, 0, 0)
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.Visible = true

-- Текст загрузки с эмодзи
LoadingText.Parent = LoadingFrame
LoadingText.BackgroundTransparency = 1
LoadingText.Position = UDim2.new(0.5, -150, 0.4, 0)
LoadingText.Size = UDim2.new(0, 300, 0, 50)
LoadingText.Font = Enum.Font.SourceSansBold
LoadingText.Text = "🌌 COSMIC LOADING... 0%"
LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingText.TextSize = 24
LoadingText.ZIndex = 2

-- Прогресс бар
ProgressBar.Parent = LoadingFrame
ProgressBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBar.BorderSizePixel = 0
ProgressBar.Position = UDim2.new(0.3, 0, 0.5, 0)
ProgressBar.Size = UDim2.new(0.4, 0, 0, 20)
ProgressBar.ZIndex = 2

ProgressFill.Parent = ProgressBar
ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.ZIndex = 3

-- Фейковая загрузка на 15 секунд
local loadTime = 15
local startTime = tick()

local function updateLoad()
    local elapsed = tick() - startTime
    local progress = math.min(elapsed / loadTime, 1)
    local percent = math.floor(progress * 100)
    
    ProgressFill.Size = UDim2.new(progress, 0, 1, 0)
    LoadingText.Text = "🌌 COSMIC LOADING... " .. percent .. "%"
    
    if progress < 1 then
        wait(0.1)
        updateLoad()
    else
        showGUISelection()
    end
end

-- Выбор GUI
function showGUISelection()
    LoadingText.Text = "🔘 SELECT GUI VERSION:"
    LoadingText.Position = UDim2.new(0.5, -150, 0.3, 0)
    
    local buttonPositionY = 0.5
    local detectedGames = ""
    
    -- Если это Brookhaven, добавляем специальную кнопку
    if isBrookhaven then
        local BrookhavenButton = Instance.new("TextButton")
        BrookhavenButton.Parent = LoadingFrame
        BrookhavenButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        BrookhavenButton.BorderSizePixel = 0
        BrookhavenButton.Position = UDim2.new(0.4, 0, 0.4, 0)
        BrookhavenButton.Size = UDim2.new(0, 200, 0, 40)
        BrookhavenButton.Font = Enum.Font.SourceSansBold
        BrookhavenButton.Text = "🏠 BROOKHAVEN SCRIPT"
        BrookhavenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        BrookhavenButton.TextSize = 18
        BrookhavenButton.ZIndex = 4
        
        BrookhavenButton.MouseButton1Click:Connect(function()
            LoadingFrame:Destroy()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BalintTheDevXBack/Games/refs/heads/main/TIGER_X_Brookhaven"))()
            end)
        end)
        
        buttonPositionY = 0.6
        detectedGames = detectedGames .. "🏠 "
    end
    
    -- Если это Murder Mystery 2, добавляем кнопку с Vertex
    if isMurderMystery2 then
        local MM2Button = Instance.new("TextButton")
        MM2Button.Parent = LoadingFrame
        MM2Button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        MM2Button.BorderSizePixel = 0
        MM2Button.Position = UDim2.new(0.4, 0, 0.4, 0)
        MM2Button.Size = UDim2.new(0, 200, 0, 40)
        MM2Button.Font = Enum.Font.SourceSansBold
        MM2Button.Text = "🔪 VERTEX MM2"
        MM2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        MM2Button.TextSize = 18
        MM2Button.ZIndex = 4
        
        MM2Button.MouseButton1Click:Connect(function()
            LoadingFrame:Destroy()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
            end)
        end)
        
        buttonPositionY = 0.6
        detectedGames = detectedGames .. "🔪 "
    end
    
    -- Если это 99 Nights, добавляем кнопку
    if is99Nights then
        local NightsButton = Instance.new("TextButton")
        NightsButton.Parent = LoadingFrame
        NightsButton.BackgroundColor3 = Color3.fromRGB(80, 0, 120)  -- Фиолетовый цвет
        NightsButton.BorderSizePixel = 0
        NightsButton.Position = UDim2.new(0.4, 0, 0.4, 0)
        NightsButton.Size = UDim2.new(0, 200, 0, 40)
        NightsButton.Font = Enum.Font.SourceSansBold
        NightsButton.Text = "🌙 99 NIGHTS"
        NightsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        NightsButton.TextSize = 18
        NightsButton.ZIndex = 4
        
        NightsButton.MouseButton1Click:Connect(function()
            LoadingFrame:Destroy()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
            end)
        end)
        
        buttonPositionY = 0.6
        detectedGames = detectedGames .. "🌙 "
    end
    
    -- Обновляем текст если обнаружены игры
    if detectedGames ~= "" then
        LoadingText.Text = "🔘 SELECT GUI VERSION:\n" .. detectedGames .. "Detected!"
    end
    
    local BigGUIButton = Instance.new("TextButton")
    BigGUIButton.Parent = LoadingFrame
    BigGUIButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    BigGUIButton.BorderSizePixel = 0
    BigGUIButton.Position = UDim2.new(0.35, 0, buttonPositionY, 0)
    BigGUIButton.Size = UDim2.new(0, 120, 0, 40)
    BigGUIButton.Font = Enum.Font.SourceSansBold
    BigGUIButton.Text = "🖥️ BIG GUI"
    BigGUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BigGUIButton.TextSize = 16
    BigGUIButton.ZIndex = 4
    
    local SmallGUIButton = Instance.new("TextButton")
    SmallGUIButton.Parent = LoadingFrame
    SmallGUIButton.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
    SmallGUIButton.BorderSizePixel = 0
    SmallGUIButton.Position = UDim2.new(0.55, 0, buttonPositionY, 0)
    SmallGUIButton.Size = UDim2.new(0, 120, 0, 40)
    SmallGUIButton.Font = Enum.Font.SourceSansBold
    SmallGUIButton.Text = "📱 SMALL GUI"
    SmallGUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SmallGUIButton.TextSize = 16
    SmallGUIButton.ZIndex = 4
    
    BigGUIButton.MouseButton1Click:Connect(function()
        LoadingFrame:Destroy()
        pcall(function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/scriptlolcity/bef31dec1f1cebf4366cb567fb9b269a/raw/0e3f1765a594158c98fd9ed53797e695a63ff965/gui.lua"))()
        end)
    end)
    
    SmallGUIButton.MouseButton1Click:Connect(function()
        LoadingFrame:Destroy()
        pcall(function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/scriptlolcity/982d5abdd1a8e69223af50669530ca2b/raw/f8685fcfa8b774e62bce0e3ca964e44f16358146/smallgui.lua"))()
        end)
    end)
end

-- Запускаем загрузку
updateLoad()

print("🚀 Универсальный загрузчик запущен!")
if isBrookhaven then
    print("🏠 Brookhaven detected! Special button added.")
elseif isMurderMystery2 then
    print("🔪 Murder Mystery 2 detected! Vertex button added.")
elseif is99Nights then
    print("🌙 99 Nights detected! VapeVoidware script added.")
end
print("⏳ 15 секунд космической загрузки...")