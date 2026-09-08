local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Find The Markers",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Find The Markers Script",
   LoadingSubtitle = "by kalawmods",
   ShowText = "Find The Markers", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Dilo",  -- Create a custom folder for your hub/game
      FileName = "Find The Markers"  },
})

 local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
 local Section = Tab:CreateSection("Highlight")
 Section:Set("Highlight")

local Button = Tab:CreateButton({
   Name = "Highlight All Markers",
   Callback = function()
  -- Инжект-код для подсветки маркеров (однократный поиск)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Черный список - объекты с этими названиями не будут подсвечиваться
local BLACKLIST = {
    "Baseplate for the Black Marker",
}

-- Ждем появления персонажа
while not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") do
    wait(0.1)
end

local humanoidRootPart = player.Character.HumanoidRootPart
local markers = {}

-- Функция проверки черного списка
function isBlacklisted(name)
    local lowerName = string.lower(name)
    for _, blacklistedName in ipairs(BLACKLIST) do
        if string.find(lowerName, string.lower(blacklistedName)) then
            return true
        end
    end
    return false
end

-- Функция для создания подсветки и текста
function setupMarker(marker)
    -- Создаем Highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "MarkerHighlight"
    highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Зеленый
    highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
    highlight.FillTransparency = 0.3
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = marker
    
    -- Создаем BillboardGui для текста
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "MarkerInfo"
    billboard.Size = UDim2.new(0, 300, 0, 80)
    billboard.StudsOffset = Vector3.new(0, 5, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = marker
    billboard.MaxDistance = 500
    billboard.Parent = marker
    
    -- Текст с названием маркера (фиолетовый)
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = marker.Name
    nameLabel.TextColor3 = Color3.fromRGB(180, 0, 255) -- Фиолетовый
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 16
    nameLabel.TextYAlignment = Enum.TextYAlignment.Bottom
    nameLabel.Parent = billboard
    
    -- Текст с расстоянием (белый)
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.Text = "Calculating..."
    distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Белый
    distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.Font = Enum.Font.Gotham
    distanceLabel.TextSize = 14
    distanceLabel.TextYAlignment = Enum.TextYAlignment.Top
    distanceLabel.Parent = billboard
    
    return distanceLabel
end

-- Поиск всех маркеров (однократный)
function findMarkers()
    local foundMarkers = {}
    
    local function searchIn(parent)
        for _, child in ipairs(parent:GetChildren()) do
            if string.find(string.lower(child.Name), "marker") and not isBlacklisted(child.Name) then
                table.insert(foundMarkers, child)
            end
            searchIn(child)
        end
    end
    
    searchIn(workspace)
    return foundMarkers
end

-- Основная функция (однократный запуск)
function initializeMarkers()
    local foundMarkers = findMarkers()
    
    print("[MARKERS] Found " .. #foundMarkers .. " markers")
    
    for _, marker in ipairs(foundMarkers) do
        if marker:IsA("Model") or marker:IsA("Part") then
            local distanceLabel = setupMarker(marker)
            
            table.insert(markers, {
                object = marker,
                distanceLabel = distanceLabel
            })
            
            print("[MARKERS] Setup: " .. marker:GetFullName())
        end
    end
    
    -- Обновление расстояния (только для уже найденных маркеров)
    RunService.Heartbeat:Connect(function()
        if not humanoidRootPart or not humanoidRootPart.Parent then
            return
        end
        
        local playerPosition = humanoidRootPart.Position
        
        for _, data in ipairs(markers) do
            if data.object and data.object.Parent then
                local markerPosition
                
                if data.object:IsA("Model") then
                    local primaryPart = data.object.PrimaryPart or data.object:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        markerPosition = primaryPart.Position
                    else
                        markerPosition = data.object:GetPivot().Position
                    end
                else
                    markerPosition = data.object.Position
                end
                
                local distance = (playerPosition - markerPosition).Magnitude
                data.distanceLabel.Text = string.format("Distance: %.1f studs", distance)
            end
        end
    end)
end

-- Запускаем однократный поиск и настройку маркеров
wait(1)
initializeMarkers()

print("[MARKERS] Injection completed! Monitoring " .. #markers .. " markers")
   end,
})
Button:Set("Highlight All Markers")

local Button = Tab:CreateButton({
   Name = "Delete All Highlight",
   Callback = function()
   -- Окончательная очистка подсветок
print("[FINAL CLEANUP] Removing all marker highlights...")

local removedCount = 0
for _, obj in ipairs(workspace:GetDescendants()) do
    if obj.Name == "MarkerHighlight" or obj.Name == "MarkerInfo" then
        pcall(function()
            obj:Destroy()
            removedCount = removedCount + 1
        end)
    end
end

-- Восстанавливаем оригинальный вид
local restoredCount = 0
for _, obj in ipairs(workspace:GetDescendants()) do
    if obj:IsA("BasePart") then
        if obj.BrickColor.Name == "Bright green" and obj.Material == Enum.Material.Neon then
            obj.BrickColor = BrickColor.new("Medium stone grey")
            obj.Material = Enum.Material.Plastic
            restoredCount = restoredCount + 1
        end
    end
end

print("[FINAL CLEANUP] COMPLETED! Removed " .. removedCount .. " objects, restored " .. restoredCount .. " appearances")
   end,
})
Button:Set("Delete All Highlight")