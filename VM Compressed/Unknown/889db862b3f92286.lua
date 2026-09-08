local part = workspace.Tycoon.Tycoons["Blue Tycoon"].Essentials.Gate.Frame:GetChildren()[3]


local billboardGui = Instance.new("BillboardGui")
billboardGui.Adornee = part 
billboardGui.Size = UDim2.new(4, 0, 2, 0) 
billboardGui.StudsOffset = Vector3.new(0, 2, 0) 
billboardGui.AlwaysOnTop = true 
billboardGui.Parent = part


local textLabel = Instance.new("TextLabel")
textLabel.Text = "1"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.TextScaled = true
textLabel.BackgroundTransparency = 1 
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
textLabel.Parent = billboardGui


local stroke = Instance.new("UIStroke")
stroke.Thickness = 3 -- Толщина обводки
stroke.Color = Color3.fromRGB(0, 0, 0) -- Цвет обводки (черный)
stroke.Parent = textLabel

-- Настройка BillboardGui для изменения размера в зависимости от дистанции
billboardGui.Size = UDim2.new(200, 0, 200, 0)
billboardGui.MaxDistance = 0 -- Видимость на любом расстоянии

-- Получаем парт, над которым нужно создать BillboardGui
local part = workspace.Tycoon.Tycoons["Green Tycoon"].Essentials.Gate.Frame:GetChildren()[3]

-- Создание BillboardGui
local billboardGui = Instance.new("BillboardGui")
billboardGui.Adornee = part -- Привязываем к нашему парту
billboardGui.Size = UDim2.new(4, 0, 2, 0) -- Размеры GUI
billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Смещение над партом
billboardGui.AlwaysOnTop = true -- Отображение всегда поверх других объектов
billboardGui.Parent = part

-- Создание текстовой метки внутри BillboardGui
local textLabel = Instance.new("TextLabel")
textLabel.Text = "2"
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Растягиваем на весь BillboardGui
textLabel.TextScaled = true -- Масштабирование текста внутри TextLabel
textLabel.BackgroundTransparency = 1 -- Убираем фон
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Цвет текста (белый)
textLabel.Parent = billboardGui

-- Добавление UIStroke для обводки текста
local stroke = Instance.new("UIStroke")
stroke.Thickness = 3 -- Толщина обводки
stroke.Color = Color3.fromRGB(0, 0, 0) -- Цвет обводки (черный)
stroke.Parent = textLabel

-- Настройка BillboardGui для изменения размера в зависимости от дистанции
billboardGui.Size = UDim2.new(200, 0, 200, 0)
billboardGui.MaxDistance = 0 -- Видимость на любом расстоянии

-- Скрипт добавлен, теперь BillboardGui с текстом "1" будет отображаться над партом.

-- Получаем парт, над которым нужно создать BillboardGui
local part = workspace.Tycoon.Tycoons["Red Tycoon"].Essentials.Gate.Frame:GetChildren()[3]

-- Создание BillboardGui
local billboardGui = Instance.new("BillboardGui")
billboardGui.Adornee = part -- Привязываем к нашему парту
billboardGui.Size = UDim2.new(4, 0, 2, 0) -- Размеры GUI
billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Смещение над партом
billboardGui.AlwaysOnTop = true -- Отображение всегда поверх других объектов
billboardGui.Parent = part

-- Создание текстовой метки внутри BillboardGui
local textLabel = Instance.new("TextLabel")
textLabel.Text = "3"
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Растягиваем на весь BillboardGui
textLabel.TextScaled = true -- Масштабирование текста внутри TextLabel
textLabel.BackgroundTransparency = 1 -- Убираем фон
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Цвет текста (белый)
textLabel.Parent = billboardGui

-- Добавление UIStroke для обводки текста
local stroke = Instance.new("UIStroke")
stroke.Thickness = 3 -- Толщина обводки
stroke.Color = Color3.fromRGB(0, 0, 0) -- Цвет обводки (черный)
stroke.Parent = textLabel

-- Настройка BillboardGui для изменения размера в зависимости от дистанции
billboardGui.Size = UDim2.new(200, 0, 200, 0)
billboardGui.MaxDistance = 0 -- Видимость на любом расстоянии

-- Скрипт добавлен, теперь BillboardGui с текстом "1" будет отображаться над партом.


-- Получаем парт, над которым нужно создать BillboardGui
local part = workspace.Tycoon.Tycoons["Yellow Tycoon"].Essentials.Gate.Frame:GetChildren()[3]

-- Создание BillboardGui
local billboardGui = Instance.new("BillboardGui")
billboardGui.Adornee = part -- Привязываем к нашему парту
billboardGui.Size = UDim2.new(4, 0, 2, 0) -- Размеры GUI
billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Смещение над партом
billboardGui.AlwaysOnTop = true -- Отображение всегда поверх других объектов
billboardGui.Parent = part

-- Создание текстовой метки внутри BillboardGui
local textLabel = Instance.new("TextLabel")
textLabel.Text = "4"
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Растягиваем на весь BillboardGui
textLabel.TextScaled = true -- Масштабирование текста внутри TextLabel
textLabel.BackgroundTransparency = 1 -- Убираем фон
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Цвет текста (белый)
textLabel.Parent = billboardGui

-- Добавление UIStroke для обводки текста
local stroke = Instance.new("UIStroke")
stroke.Thickness = 3 -- Толщина обводки
stroke.Color = Color3.fromRGB(0, 0, 0) -- Цвет обводки (черный)
stroke.Parent = textLabel

-- Настройка BillboardGui для изменения размера в зависимости от дистанции
billboardGui.Size = UDim2.new(200, 0, 200, 0)
billboardGui.MaxDistance = 0 -- Видимость на любом расстоянии


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Longest Conveyor Tycoon by JJP", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Main"
})


local Tab2 = Window:MakeTab({
	Name = "1st tycoon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab7 = Window:MakeTab({
	Name = "2nd tycoon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab7:AddButton({
	Name = "2nd setup",
	Callback = function()
local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(10, 9, 8)
teleportPart.CFrame = CFrame.new(255, 2, 205)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(280, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local CabinePart = Instance.new("Part")
CabinePart.Transparency = 0.5
CabinePart.Size = Vector3.new(12, 0.5, 15) -- Размеры части
CabinePart.CFrame = CFrame.new(280, 50, 195)
CabinePart.Orientation = Vector3.new(180, 90, 0)
CabinePart.Anchored = true
CabinePart.Name = ("cabinePart")
CabinePart.Parent = workspace

local wedgePart = Instance.new("WedgePart")
wedgePart.Size = Vector3.new(15, 10, 10)  -- Размеры клина
wedgePart.Position = Vector3.new(280, 55, 195)  -- Позиция в пространстве
wedgePart.Orientation = Vector3.new(180, 0, 180)
wedgePart.Anchored = true  -- Закрепляем объект
wedgePart.Parent = game.Workspace
wedgePart.Name = "TriangleWedge"

local CabinePart2 = Instance.new("Part")
CabinePart2.Transparency = 0.7
CabinePart2.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart2.CFrame = CFrame.new(280, 56, 190)
CabinePart2.Orientation = Vector3.new(180, 90, 0)
CabinePart2.Anchored = true
CabinePart2.Name = ("cabinePart2")
CabinePart2.Parent = workspace

local CabinePart6 = Instance.new("Part")
CabinePart6.Transparency = 0.7
CabinePart6.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart6.CFrame = CFrame.new(280, 56, 210)
CabinePart6.Orientation = Vector3.new(180, 90, 0)
CabinePart6.Anchored = true
CabinePart6.Name = ("cabinePart6")
CabinePart6.Parent = workspace

local CabinePart3 = Instance.new("Part")
CabinePart3.Transparency = 0.7
CabinePart3.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart3.CFrame = CFrame.new(274, 56, 200)
CabinePart3.Orientation = Vector3.new(0, 0, 180)
CabinePart3.Anchored = true
CabinePart3.Name = ("cabinePart3")
CabinePart3.Parent = workspace

local CabinePart4 = Instance.new("Part")
CabinePart4.Transparency = 0.7
CabinePart4.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart4.CFrame = CFrame.new(287, 56, 200)
CabinePart4.Orientation = Vector3.new(0, 0, 180)
CabinePart4.Anchored = true
CabinePart4.Name = ("cabinePart4")
CabinePart4.Parent = workspace

local CabinePart5 = Instance.new("Part")
CabinePart5.Transparency = 0.5
CabinePart5.Size = Vector3.new(22, 0.5, 15) -- Размеры части
CabinePart5.CFrame = CFrame.new(280, 63, 200)
CabinePart5.Orientation = Vector3.new(180, 90, 0)
CabinePart5.Anchored = true
CabinePart5.Name = ("cabinePart")
CabinePart5.Parent = workspace


local part = workspace.Tycoon.Tycoons["Green Tycoon"].Essentials.DropCollector
part.Position = Vector3.new(280, 1, 205)
local JustPart = Instance.new("Part")
JustPart.Transparency = 0.5
JustPart.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart.CFrame = CFrame.new(280, 1, 210)
JustPart.Name = ("justPart")
JustPart.Anchored = true
JustPart.Parent = workspace
local JustPart2 = Instance.new("Part")
JustPart2.Transparency = 0.5
JustPart2.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart2.CFrame = CFrame.new(275, 1, 205)
JustPart2.Orientation = Vector3.new(180, 90, 0)
JustPart2.Anchored = true
JustPart2.Name = ("justPart2")
JustPart2.Parent = workspace
local JustPart3 = Instance.new("Part")
JustPart3.Transparency = 0.5
JustPart3.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart3.CFrame = CFrame.new(285, 1, 205)
JustPart3.Orientation = Vector3.new(180, 90, 0)
JustPart3.Anchored = true
JustPart3.Name = ("justPart3")
JustPart3.Parent = workspace
local JustPart4 = Instance.new("Part")
JustPart4.Transparency = 0.5
JustPart4.Size = Vector3.new(10, 98, 1) -- Размеры части
JustPart4.CFrame = CFrame.new(280, 1, 200)
JustPart4.Name = ("justPart4")
JustPart4.Anchored = true
JustPart4.Parent = workspace

local teleportPart = Instance.new("Part")
teleportPart.Transparency = 0.5
teleportPart.Size = Vector3.new(2, 1, 40) -- Размеры части
teleportPart.CFrame = CFrame.new(252, 12, 245)
teleportPart.Anchored = true
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

-- Функция для телепортации Drop парта
local function teleportDrop(drop)
    drop.CFrame = CFrame.new(280, 55, 200)
end

-- Подключение события прикосновения
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 1300) -- Размеры части
teleportPart.CFrame = CFrame.new(193, 10.5, 955)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(280, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 45) -- Размеры части
teleportPart.CFrame = CFrame.new(217, 10, 268)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Orientation = Vector3.new(180, 90, 0)
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(280, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)
  	end    
})

Tab7:AddButton({
	Name = "first upgrader",
	Callback = function()
local part111 = workspace.Tycoon.Tycoons["Green Tycoon"].PurchasedFolder.Upgrader1.UpgradePart
part111.Size = Vector3.new(9, 0.5, 9)
part111.Position = Vector3.new(280, 48, 205)
part111.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab7:AddButton({
	Name = "second upgrader",
	Callback = function()
local part89= workspace.Tycoon.Tycoons["Green Tycoon"].PurchasedFolder.Upgrader2.UpgradePart
part89.Size = Vector3.new(9, 0.5, 9)
part89.Position = Vector3.new(280, 47, 205)
part89.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab7:AddButton({
	Name = "third upgrader",
	Callback = function()
local part899= workspace.Tycoon.Tycoons["Green Tycoon"].PurchasedFolder.Upgrader3.UpgradePart
part899.Size = Vector3.new(9, 0.5, 9)
part899.Position = Vector3.new(280, 46, 205)
part899.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab7:AddButton({
	Name = "fourth upgrader",
	Callback = function()
local part8999= workspace.Tycoon.Tycoons["Green Tycoon"].PurchasedFolder.Upgrader4.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(280, 45, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab7:AddButton({
	Name = "fifth upgrader",
	Callback = function()
local part89991= workspace.Tycoon.Tycoons["Green Tycoon"].PurchasedFolder.Upgrader5.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(280, 43, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab7:AddButton({
	Name = "sixth upgrader",
	Callback = function()
local part89991= workspace.Tycoon.Tycoons["Green Tycoon"].PurchasedFolder.Upgrader6.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(280, 43, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

local Tab3 = Window:MakeTab({
	Name = "3th tycoon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab3:AddButton({
	Name = "3th Just setup",
	Callback = function()
	local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(10, 9, 8)
teleportPart.CFrame = CFrame.new(130, 2, 205)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(160, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local CabinePart = Instance.new("Part")
CabinePart.Transparency = 0.5
CabinePart.Size = Vector3.new(12, 0.5, 15) -- Размеры части
CabinePart.CFrame = CFrame.new(160, 50, 195)
CabinePart.Orientation = Vector3.new(180, 90, 0)
CabinePart.Anchored = true
CabinePart.Name = ("cabinePart")
CabinePart.Parent = workspace

local wedgePart = Instance.new("WedgePart")
wedgePart.Size = Vector3.new(15, 10, 10)  -- Размеры клина
wedgePart.Position = Vector3.new(160, 55, 195)  -- Позиция в пространстве
wedgePart.Orientation = Vector3.new(180, 0, 180)
wedgePart.Anchored = true  -- Закрепляем объект
wedgePart.Parent = game.Workspace
wedgePart.Name = "TriangleWedge"

local CabinePart2 = Instance.new("Part")
CabinePart2.Transparency = 0.7
CabinePart2.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart2.CFrame = CFrame.new(160, 56, 190)
CabinePart2.Orientation = Vector3.new(180, 90, 0)
CabinePart2.Anchored = true
CabinePart2.Name = ("cabinePart2")
CabinePart2.Parent = workspace

local CabinePart6 = Instance.new("Part")
CabinePart6.Transparency = 0.7
CabinePart6.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart6.CFrame = CFrame.new(160, 56, 210)
CabinePart6.Orientation = Vector3.new(180, 90, 0)
CabinePart6.Anchored = true
CabinePart6.Name = ("cabinePart6")
CabinePart6.Parent = workspace

local CabinePart3 = Instance.new("Part")
CabinePart3.Transparency = 0.7
CabinePart3.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart3.CFrame = CFrame.new(154, 56, 200)
CabinePart3.Orientation = Vector3.new(0, 0, 180)
CabinePart3.Anchored = true
CabinePart3.Name = ("cabinePart3")
CabinePart3.Parent = workspace

local CabinePart4 = Instance.new("Part")
CabinePart4.Transparency = 0.7
CabinePart4.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart4.CFrame = CFrame.new(167, 56, 200)
CabinePart4.Orientation = Vector3.new(0, 0, 180)
CabinePart4.Anchored = true
CabinePart4.Name = ("cabinePart4")
CabinePart4.Parent = workspace

local CabinePart5 = Instance.new("Part")
CabinePart5.Transparency = 0.5
CabinePart5.Size = Vector3.new(22, 0.5, 15) -- Размеры части
CabinePart5.CFrame = CFrame.new(160, 63, 200)
CabinePart5.Orientation = Vector3.new(180, 90, 0)
CabinePart5.Anchored = true
CabinePart5.Name = ("cabinePart")
CabinePart5.Parent = workspace


local part = workspace.Tycoon.Tycoons["Red Tycoon"].Essentials.DropCollector
part.Position = Vector3.new(160, 1, 205)
local JustPart = Instance.new("Part")
JustPart.Transparency = 0.5
JustPart.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart.CFrame = CFrame.new(160, 1, 210)
JustPart.Name = ("justPart")
JustPart.Anchored = true
JustPart.Parent = workspace
local JustPart2 = Instance.new("Part")
JustPart2.Transparency = 0.5
JustPart2.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart2.CFrame = CFrame.new(155, 1, 205)
JustPart2.Orientation = Vector3.new(180, 90, 0)
JustPart2.Anchored = true
JustPart2.Name = ("justPart2")
JustPart2.Parent = workspace
local JustPart3 = Instance.new("Part")
JustPart3.Transparency = 0.5
JustPart3.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart3.CFrame = CFrame.new(165, 1, 205)
JustPart3.Orientation = Vector3.new(180, 90, 0)
JustPart3.Anchored = true
JustPart3.Name = ("justPart3")
JustPart3.Parent = workspace
local JustPart4 = Instance.new("Part")
JustPart4.Transparency = 0.5
JustPart4.Size = Vector3.new(10, 98, 1) -- Размеры части
JustPart4.CFrame = CFrame.new(160, 1, 200)
JustPart4.Name = ("justPart4")
JustPart4.Anchored = true
JustPart4.Parent = workspace

local teleportPart = Instance.new("Part")
teleportPart.Transparency = 0.5
teleportPart.Size = Vector3.new(2, 1, 40) -- Размеры части
teleportPart.CFrame = CFrame.new(132, 12, 245)
teleportPart.Anchored = true
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

-- Функция для телепортации Drop парта
local function teleportDrop(drop)
    drop.CFrame = CFrame.new(160, 55, 200)
end

-- Подключение события прикосновения
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 1300) -- Размеры части
teleportPart.CFrame = CFrame.new(68, 10.5, 955)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(160, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 45) -- Размеры части
teleportPart.CFrame = CFrame.new(97, 10, 268)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Orientation = Vector3.new(180, 90, 0)
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(160, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)
  	end    
})

Tab3:AddButton({
	Name = "first upgrader",
	Callback = function()
local part111 = workspace.Tycoon.Tycoons["Red Tycoon"].PurchasedFolder.Upgrader1.UpgradePart
part111.Size = Vector3.new(9, 0.5, 9)
part111.Position = Vector3.new(160, 48, 205)
part111.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab3:AddButton({
	Name = "second upgrader",
	Callback = function()
local part89= workspace.Tycoon.Tycoons["Red Tycoon"].PurchasedFolder.Upgrader2.UpgradePart
part89.Size = Vector3.new(9, 0.5, 9)
part89.Position = Vector3.new(160, 47, 205)
part89.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab3:AddButton({
	Name = "third upgrader",
	Callback = function()
local part899= workspace.Tycoon.Tycoons["Red Tycoon"].PurchasedFolder.Upgrader3.UpgradePart
part899.Size = Vector3.new(9, 0.5, 9)
part899.Position = Vector3.new(160, 46, 205)
part899.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab3:AddButton({
	Name = "fourth upgrader",
	Callback = function()
local part8999= workspace.Tycoon.Tycoons["Red Tycoon"].PurchasedFolder.Upgrader4.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(160, 45, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab3:AddButton({
	Name = "fifth upgrader",
	Callback = function()
local part8999= workspace.Tycoon.Tycoons["Red Tycoon"].PurchasedFolder.Upgrader5.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(160, 44, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab3:AddButton({
	Name = "sixth upgrader",
	Callback = function()
local part89992= workspace.Tycoon.Tycoons["Red Tycoon"].PurchasedFolder.Upgrader6.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(160, 42, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})


local Tab5 = Window:MakeTab({
	Name = "4th tycoon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddButton({
	Name = "1th just setup ",
	Callback = function()
local CabinePart = Instance.new("Part")
CabinePart.Transparency = 0.5
CabinePart.Size = Vector3.new(12, 0.5, 15) -- Размеры части
CabinePart.CFrame = CFrame.new(412, 50, 195)
CabinePart.Orientation = Vector3.new(180, 90, 0)
CabinePart.Anchored = true
CabinePart.Name = ("cabinePart")
CabinePart.Parent = workspace

local wedgePart = Instance.new("WedgePart")
wedgePart.Size = Vector3.new(15, 10, 10)  -- Размеры клина
wedgePart.Position = Vector3.new(412, 55, 195)  -- Позиция в пространстве
wedgePart.Orientation = Vector3.new(180, 0, 180)
wedgePart.Anchored = true  -- Закрепляем объект
wedgePart.Parent = game.Workspace
wedgePart.Name = "TriangleWedge"

local CabinePart2 = Instance.new("Part")
CabinePart2.Transparency = 0.7
CabinePart2.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart2.CFrame = CFrame.new(412, 56, 190)
CabinePart2.Orientation = Vector3.new(180, 90, 0)
CabinePart2.Anchored = true
CabinePart2.Name = ("cabinePart2")
CabinePart2.Parent = workspace

local CabinePart6 = Instance.new("Part")
CabinePart6.Transparency = 0.7
CabinePart6.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart6.CFrame = CFrame.new(412, 56, 210)
CabinePart6.Orientation = Vector3.new(180, 90, 0)
CabinePart6.Anchored = true
CabinePart6.Name = ("cabinePart6")
CabinePart6.Parent = workspace

local CabinePart3 = Instance.new("Part")
CabinePart3.Transparency = 0.7
CabinePart3.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart3.CFrame = CFrame.new(406, 56, 200)
CabinePart3.Orientation = Vector3.new(0, 0, 180)
CabinePart3.Anchored = true
CabinePart3.Name = ("cabinePart3")
CabinePart3.Parent = workspace

local CabinePart4 = Instance.new("Part")
CabinePart4.Transparency = 0.7
CabinePart4.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart4.CFrame = CFrame.new(419, 56, 200)
CabinePart4.Orientation = Vector3.new(0, 0, 180)
CabinePart4.Anchored = true
CabinePart4.Name = ("cabinePart4")
CabinePart4.Parent = workspace

local CabinePart5 = Instance.new("Part")
CabinePart5.Transparency = 0.5
CabinePart5.Size = Vector3.new(22, 0.5, 15) -- Размеры части
CabinePart5.CFrame = CFrame.new(412, 63, 200)
CabinePart5.Orientation = Vector3.new(180, 90, 0)
CabinePart5.Anchored = true
CabinePart5.Name = ("cabinePart")
CabinePart5.Parent = workspace

local part = workspace.Tycoon.Tycoons["Blue Tycoon"].Essentials.DropCollector
part.Position = Vector3.new(412, 1, 205)
local JustPart = Instance.new("Part")
JustPart.Transparency = 0.5
JustPart.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart.CFrame = CFrame.new(412, 1, 210)
JustPart.Name = ("justPart")
JustPart.Anchored = true
JustPart.Parent = workspace
local JustPart2 = Instance.new("Part")
JustPart2.Transparency = 0.5
JustPart2.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart2.CFrame = CFrame.new(407, 1, 205)
JustPart2.Orientation = Vector3.new(180, 90, 0)
JustPart2.Anchored = true
JustPart2.Name = ("justPart2")
JustPart2.Parent = workspace
local JustPart3 = Instance.new("Part")
JustPart3.Transparency = 0.5
JustPart3.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart3.CFrame = CFrame.new(417, 1, 205)
JustPart3.Orientation = Vector3.new(180, 90, 0)
JustPart3.Anchored = true
JustPart3.Name = ("justPart3")
JustPart3.Parent = workspace
local JustPart4 = Instance.new("Part")
JustPart4.Transparency = 0.5
JustPart4.Size = Vector3.new(10, 98, 1) -- Размеры части
JustPart4.CFrame = CFrame.new(412, 1, 200)
JustPart4.Name = ("justPart4")
JustPart4.Anchored = true
JustPart4.Parent = workspace

local teleportPart = Instance.new("Part")
teleportPart.Transparency = 0.5
teleportPart.Size = Vector3.new(2, 1, 40) -- Размеры части
teleportPart.CFrame = CFrame.new(388, 11, 245)
teleportPart.Anchored = true
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

-- Функция для телепортации Drop парта
local function teleportDrop(drop)
    drop.CFrame = CFrame.new(412, 55, 200)
end

-- Подключение события прикосновения
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(10, 0.5, 10) -- Размеры части
teleportPart.CFrame = CFrame.new(412, 49, 205)
teleportPart.Anchored = true
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
drop.CFrame = CFrame.new(412, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 45) -- Размеры части
teleportPart.CFrame = CFrame.new(353, 10, 268)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Orientation = Vector3.new(180, 90, 0)
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace


local function teleportDrop(drop)
    drop.CFrame = CFrame.new(412, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(11, 9, 8) -- Размеры части
teleportPart.CFrame = CFrame.new(386.5, 2, 205)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(412, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 1300) -- Размеры части
teleportPart.CFrame = CFrame.new(324, 10.5, 955)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(412, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

  	end    
})

Tab2:AddButton({
	Name = "first upgrader",
	Callback = function()
local part111 = workspace.Tycoon.Tycoons["Blue Tycoon"].PurchasedFolder.Upgrader1.UpgradePart
part111.Size = Vector3.new(9, 0.5, 9)
part111.Position = Vector3.new(412, 48, 205)
part111.Orientation = Vector3.new(0, 0, 0)	
  	end    
})

Tab2:AddButton({
	Name = "second upgrader",
	Callback = function()
local part89= workspace.Tycoon.Tycoons["Blue Tycoon"].PurchasedFolder.Upgrader2.UpgradePart
part89.Size = Vector3.new(9, 0.5, 9)
part89.Position = Vector3.new(412, 47, 205)
part89.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab2:AddButton({
	Name = "third upgrader",
	Callback = function()
local part899= workspace.Tycoon.Tycoons["Blue Tycoon"].PurchasedFolder.Upgrader3.UpgradePart
part899.Size = Vector3.new(9, 0.5, 9)
part899.Position = Vector3.new(412, 46, 205)
part899.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab2:AddButton({
	Name = "fourth upgrader",
	Callback = function()
local part8999= workspace.Tycoon.Tycoons["Blue Tycoon"].PurchasedFolder.Upgrader4.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(412, 45, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab2:AddButton({
	Name = "fifth upgrader",
	Callback = function()
local part89991= workspace.Tycoon.Tycoons["Blue Tycoon"].PurchasedFolder.Upgrader5.UpgradePart
part89991.Size = Vector3.new(9, 0.5, 9)
part89991.Position = Vector3.new(412, 44, 205)
part89991.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab2:AddButton({
	Name = "sixth upgrader",
	Callback = function()
local part89992= workspace.Tycoon.Tycoons["Blue Tycoon"].PurchasedFolder.Upgrader6.UpgradePart
part89992.Size = Vector3.new(9, 0.5, 9)
part89992.Position = Vector3.new(412, 43, 205)
part89992.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab5:AddButton({
	Name = "4th just setup (idk why but upgrades show after setup)",
	Callback = function()
local CabinePart = Instance.new("Part")
CabinePart.Transparency = 0.5
CabinePart.Size = Vector3.new(12, 0.5, 15) -- Размеры части
CabinePart.CFrame = CFrame.new(20, 50, 195)
CabinePart.Orientation = Vector3.new(180, 90, 0)
CabinePart.Anchored = true
CabinePart.Name = ("cabinePart")
CabinePart.Parent = workspace

local wedgePart = Instance.new("WedgePart")
wedgePart.Size = Vector3.new(15, 10, 10)  -- Размеры клина
wedgePart.Position = Vector3.new(20, 55, 195)  -- Позиция в пространстве
wedgePart.Orientation = Vector3.new(180, 0, 180)
wedgePart.Anchored = true  -- Закрепляем объект
wedgePart.Parent = game.Workspace
wedgePart.Name = "TriangleWedge"

local CabinePart2 = Instance.new("Part")
CabinePart2.Transparency = 0.7
CabinePart2.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart2.CFrame = CFrame.new(20, 56, 190)
CabinePart2.Orientation = Vector3.new(180, 90, 0)
CabinePart2.Anchored = true
CabinePart2.Name = ("cabinePart2")
CabinePart2.Parent = workspace

local CabinePart6 = Instance.new("Part")
CabinePart6.Transparency = 0.7
CabinePart6.Size = Vector3.new(1.5, 14, 15) -- Размеры части
CabinePart6.CFrame = CFrame.new(20, 56, 210)
CabinePart6.Orientation = Vector3.new(180, 90, 0)
CabinePart6.Anchored = true
CabinePart6.Name = ("cabinePart6")
CabinePart6.Parent = workspace

local CabinePart3 = Instance.new("Part")
CabinePart3.Transparency = 0.7
CabinePart3.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart3.CFrame = CFrame.new(14, 56, 200)
CabinePart3.Orientation = Vector3.new(0, 0, 180)
CabinePart3.Anchored = true
CabinePart3.Name = ("cabinePart3")
CabinePart3.Parent = workspace

local CabinePart4 = Instance.new("Part")
CabinePart4.Transparency = 0.7
CabinePart4.Size = Vector3.new(1.5, 14, 22) -- Размеры части
CabinePart4.CFrame = CFrame.new(27, 56, 200)
CabinePart4.Orientation = Vector3.new(0, 0, 180)
CabinePart4.Anchored = true
CabinePart4.Name = ("cabinePart4")
CabinePart4.Parent = workspace

local CabinePart5 = Instance.new("Part")
CabinePart5.Transparency = 0.5
CabinePart5.Size = Vector3.new(22, 0.5, 15) -- Размеры части
CabinePart5.CFrame = CFrame.new(20, 63, 200)
CabinePart5.Orientation = Vector3.new(180, 90, 0)
CabinePart5.Anchored = true
CabinePart5.Name = ("cabinePart")
CabinePart5.Parent = workspace

local part = workspace.Tycoon.Tycoons["Yellow Tycoon"].Essentials.DropCollector
part.Position = Vector3.new(20, 1, 205)
local JustPart = Instance.new("Part")
JustPart.Transparency = 0.5
JustPart.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart.CFrame = CFrame.new(20, 1, 210)
JustPart.Name = ("justPart")
JustPart.Anchored = true
JustPart.Parent = workspace
local JustPart2 = Instance.new("Part")
JustPart2.Transparency = 0.5
JustPart2.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart2.CFrame = CFrame.new(15, 1, 205)
JustPart2.Orientation = Vector3.new(180, 90, 0)
JustPart2.Anchored = true
JustPart2.Name = ("justPart2")
JustPart2.Parent = workspace
local JustPart3 = Instance.new("Part")
JustPart3.Transparency = 0.5
JustPart3.Size = Vector3.new(10, 100, 1) -- Размеры части
JustPart3.CFrame = CFrame.new(25, 1, 205)
JustPart3.Orientation = Vector3.new(180, 90, 0)
JustPart3.Anchored = true
JustPart3.Name = ("justPart3")
JustPart3.Parent = workspace
local JustPart4 = Instance.new("Part")
JustPart4.Transparency = 0.5
JustPart4.Size = Vector3.new(10, 98, 1) -- Размеры части
JustPart4.CFrame = CFrame.new(20, 1, 200)
JustPart4.Name = ("justPart4")
JustPart4.Anchored = true
JustPart4.Parent = workspace

local teleportPart = Instance.new("Part")
teleportPart.Transparency = 0.5
teleportPart.Size = Vector3.new(2, 1, 40) -- Размеры части
teleportPart.CFrame = CFrame.new(4, 12, 245)
teleportPart.Anchored = true
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

-- Функция для телепортации Drop парта
local function teleportDrop(drop)
    drop.CFrame = CFrame.new(20, 55, 200)
end

-- Подключение события прикосновения
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

Tab5:AddButton({
	Name = "first upgrader",
	Callback = function()
local part111 = workspace.Tycoon.Tycoons["Yellow Tycoon"].PurchasedFolder.Upgrader1.UpgradePart
part111.Size = Vector3.new(9, 0.5, 9)
part111.Position = Vector3.new(20, 48, 205)
part111.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab5:AddButton({
	Name = "second upgrader",
	Callback = function()
local part89= workspace.Tycoon.Tycoons["Yellow Tycoon"].PurchasedFolder.Upgrader2.UpgradePart
part89.Size = Vector3.new(9, 0.5, 9)
part89.Position = Vector3.new(20, 47, 205)
part89.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab5:AddButton({
	Name = "third upgrader",
	Callback = function()
local part899= workspace.Tycoon.Tycoons["Yellow Tycoon"].PurchasedFolder.Upgrader3.UpgradePart
part899.Size = Vector3.new(9, 0.5, 9)
part899.Position = Vector3.new(20, 46, 205)
part899.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab5:AddButton({
	Name = "fourth upgrader",
	Callback = function()
local part8999= workspace.Tycoon.Tycoons["Yellow Tycoon"].PurchasedFolder.Upgrader4.UpgradePart
part8999.Size = Vector3.new(9, 0.5, 9)
part8999.Position = Vector3.new(20, 45, 205)
part8999.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab5:AddButton({
	Name = "fifth upgrader",
	Callback = function()
local part89991= workspace.Tycoon.Tycoons["Yellow Tycoon"].PurchasedFolder.Upgrader5.UpgradePart
part89991.Size = Vector3.new(9, 0.5, 9)
part89991.Position = Vector3.new(20, 44, 205)
part89991.Orientation = Vector3.new(0, 0, 0)
  	end    
})

Tab5:AddButton({
	Name = "sixth upgrader",
	Callback = function()
local part89992= workspace.Tycoon.Tycoons["Yellow Tycoon"].PurchasedFolder.Upgrader6.UpgradePart
part89992.Size = Vector3.new(9, 0.5, 9)
part89992.Position = Vector3.new(20, 43, 205)
part89992.Orientation = Vector3.new(0, 0, 0)
  	end    
})




local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(10, 0.5, 10) -- Размеры части
teleportPart.CFrame = CFrame.new(20, 49, 205)
teleportPart.Anchored = true
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(20, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 45) -- Размеры части
teleportPart.CFrame = CFrame.new(-32, 10, 268)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Orientation = Vector3.new(180, 90, 0)
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(20, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)


local teleportPart = Instance.new("Part")
teleportPart.Size = Vector3.new(2, 1, 1300) -- Размеры части
teleportPart.CFrame = CFrame.new(-60, 10.5, 955)
teleportPart.Anchored = true
teleportPart.Transparency = 0.5
teleportPart.Name = ("teleportPart")
teleportPart.Parent = workspace

local function teleportDrop(drop)
    drop.CFrame = CFrame.new(20, 47, 205)
end
teleportPart.Touched:Connect(function(hit)
    if hit:IsA("Part") and hit.Name == "Drop" then
        teleportDrop(hit)
    end
end)

  	end    
})

Tab:AddButton({
	Name = "Destroy annoting donate buttons",
	Callback = function()
      		-- Удаление всех объектов с названием "BuyItem" в Workspace
for _, object in pairs(game.Workspace:GetChildren()) do
    if object.Name == "BuyItem" then
        object:Destroy()
    end
end

  	end    
})

local Tab10 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab10:AddSlider({
	Name = "Player Walkspeed",
	Min = 16,
	Max = 400,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.WalkSpeed = Value
		else
			print("Игрок или Humanoid не найден!")
		end
	end    
})

Tab10:AddSlider({
	Name = "Player Jumppower",
	Min = 8,
	Max = 500,
	Default = 8,
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "Jumppower",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.JumpHeight = Value
		else
			print("Игрок или Humanoid не найден!")
		end
	end    
})

Tab10:AddSlider({
	Name = "Player Gravity",
	Min = 0,
	Max = 200,
	Default = 196.2, -- Значение по умолчанию для стандартной гравитации Roblox
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		workspace.Gravity = Value
	end    
})

local Tab12 = Window:MakeTab({
	Name = "Universal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab12:AddButton({
	Name = "Infinite Yield Reborn",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/fuckusfm/infiniteyield-reborn/master/source'))()
  	end    
})

OrionLib:Init()

Tab:AddButton({
	Name = "!DISABLE ALL TYCOON NUMBERS!",
	Callback = function()
-- Удаление BillboardGui из Blue Tycoon
local blueTycoonPart = workspace.Tycoon.Tycoons["Blue Tycoon"].Essentials.Gate.Frame:GetChildren()[3]
local blueBillboardGui = blueTycoonPart:FindFirstChild("BillboardGui")
if blueBillboardGui then
    blueBillboardGui:Destroy()
end

-- Удаление BillboardGui из Green Tycoon
local greenTycoonPart = workspace.Tycoon.Tycoons["Green Tycoon"].Essentials.Gate.Frame:GetChildren()[3]
local greenBillboardGui = greenTycoonPart:FindFirstChild("BillboardGui")
if greenBillboardGui then
    greenBillboardGui:Destroy()
end

-- Удаление BillboardGui из Red Tycoon
local redTycoonPart = workspace.Tycoon.Tycoons["Red Tycoon"].Essentials.Gate.Frame:GetChildren()[3]
local redBillboardGui = redTycoonPart:FindFirstChild("BillboardGui")
if redBillboardGui then
    redBillboardGui:Destroy()
end

-- Удаление BillboardGui из Yellow Tycoon
local yellowTycoonPart = workspace.Tycoon.Tycoons["Yellow Tycoon"].Essentials.Gate.Frame:GetChildren()[3]
local yellowBillboardGui = yellowTycoonPart:FindFirstChild("BillboardGui")
if yellowBillboardGui then
    yellowBillboardGui:Destroy()
end

  	end    
})

