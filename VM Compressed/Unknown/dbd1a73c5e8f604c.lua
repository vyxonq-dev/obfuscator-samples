-- ═══════════════════════════════════════════════════════
-- 🚀 ROBANIK PLATFORM RISER - ULTIMATE EDITION V2
-- BY ROBANIK | Premium Quality | Anti-Detect
-- ═══════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ═══════════════════════════════════════════════════════
-- 🛡️ АНТИ АНТИЧИТ СИСТЕМА (УЛУЧШЕННАЯ)
-- ═══════════════════════════════════════════════════════

local function setupProtection()
    local success = pcall(function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        local oldIndex = mt.__index
        setreadonly(mt, false)
        
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" or method == "kick" then return end
            if (method == "FireServer" or method == "InvokeServer") then
                local name = self.Name:lower()
                if name:find("anti") or name:find("cheat") or name:find("detect") or name:find("ban") or name:find("kick") then
                    return
                end
            end
            return oldNamecall(self, ...)
        end)
        
        setreadonly(mt, true)
    end)
    
    for _, v in pairs(game:GetDescendants()) do
        pcall(function()
            if v:IsA("LocalScript") and (v.Name:lower():find("anti") or v.Name:lower():find("detect")) then
                v.Disabled = true
            end
        end)
    end
    
    return success
end

setupProtection()

-- ═══════════════════════════════════════════════════════
-- 🎨 ПРЕМИУМ GUI С НАСТРОЙКАМИ
-- ═══════════════════════════════════════════════════════

local gui = Instance.new("ScreenGui")
gui.Name = "RobanikUltimateGUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui") or player.PlayerGui

-- Главная кнопка
local mainBtn = Instance.new("ImageButton")
mainBtn.Size = UDim2.new(0, 110, 0, 110)
mainBtn.Position = UDim2.new(0, 25, 0.5, -55)
mainBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainBtn.BorderSizePixel = 0
mainBtn.AutoButtonColor = false
mainBtn.ImageTransparency = 1
mainBtn.Active = true
mainBtn.Draggable = true
mainBtn.Parent = gui

local circle = Instance.new("UICorner", mainBtn)
circle.CornerRadius = UDim.new(1, 0)

local stroke = Instance.new("UIStroke", mainBtn)
stroke.Color = Color3.fromRGB(147, 51, 234)
stroke.Thickness = 3
stroke.Transparency = 0.3

-- Анимированный градиент
local gradient = Instance.new("UIGradient", mainBtn)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 246)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(59, 130, 246)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(236, 72, 153))
}
gradient.Rotation = 0

-- Мульти-слойное свечение
for i = 1, 3 do
    local glow = Instance.new("ImageLabel", mainBtn)
    glow.Name = "Glow" .. i
    glow.Size = UDim2.new(1, 20 * i, 1, 20 * i)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://4996891970"
    glow.ImageColor3 = Color3.fromRGB(147, 51, 234)
    glow.ImageTransparency = 0.5 + (i * 0.1)
    glow.ZIndex = -i
    
    TweenService:Create(glow, TweenInfo.new(1.5 + i * 0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        ImageTransparency = 0.8,
        Size = UDim2.new(1, 30 * i, 1, 30 * i)
    }):Play()
end

-- Иконка с эффектом
local icon = Instance.new("TextLabel", mainBtn)
icon.Size = UDim2.new(0.6, 0, 0.45, 0)
icon.Position = UDim2.new(0.2, 0, 0.15, 0)
icon.BackgroundTransparency = 1
icon.Text = "🚀"
icon.TextSize = 48
icon.TextStrokeTransparency = 0
icon.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
icon.ZIndex = 2

-- Бренд
local brand = Instance.new("TextLabel", mainBtn)
brand.Size = UDim2.new(1, 0, 0.22, 0)
brand.Position = UDim2.new(0, 0, 0.68, 0)
brand.BackgroundTransparency = 1
brand.Text = "ROBANIK"
brand.TextColor3 = Color3.fromRGB(255, 215, 0)
brand.TextSize = 13
brand.Font = Enum.Font.GothamBold
brand.TextStrokeTransparency = 0.5

-- Статус индикатор
local indicator = Instance.new("Frame", mainBtn)
indicator.Size = UDim2.new(0, 14, 0, 14)
indicator.Position = UDim2.new(1, -18, 0, 4)
indicator.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
indicator.BorderSizePixel = 0
Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)

local indGlow = Instance.new("UIStroke", indicator)
indGlow.Color = Color3.fromRGB(239, 68, 68)
indGlow.Thickness = 2
indGlow.Transparency = 0.5

-- Счетчик высоты
local counter = Instance.new("TextLabel", mainBtn)
counter.Size = UDim2.new(0, 90, 0, 30)
counter.Position = UDim2.new(1, 15, 0.5, -15)
counter.BackgroundColor3 = Color3.fromRGB(17, 24, 39)
counter.BorderSizePixel = 0
counter.Text = "0m"
counter.TextColor3 = Color3.fromRGB(74, 222, 128)
counter.TextSize = 16
counter.Font = Enum.Font.GothamBold
Instance.new("UICorner", counter).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", counter).Color = Color3.fromRGB(34, 197, 94)
Instance.new("UIStroke", counter).Transparency = 0.7

-- Панель настроек
local settingsPanel = Instance.new("Frame", gui)
settingsPanel.Size = UDim2.new(0, 200, 0, 120)
settingsPanel.Position = UDim2.new(0, 25, 0.5, 70)
settingsPanel.BackgroundColor3 = Color3.fromRGB(17, 24, 39)
settingsPanel.BorderSizePixel = 0
settingsPanel.Visible = false
settingsPanel.ClipsDescendants = true
Instance.new("UICorner", settingsPanel).CornerRadius = UDim.new(0, 12)

-- Слайдер скорости
local speedLabel = Instance.new("TextLabel", settingsPanel)
speedLabel.Size = UDim2.new(1, -20, 0, 25)
speedLabel.Position = UDim2.new(0, 10, 0, 10)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Скорость: 2.0"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextSize = 14
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextXAlignment = Enum.TextXAlignment.Left

local speedSlider = Instance.new("Frame", settingsPanel)
speedSlider.Size = UDim2.new(1, -20, 0, 6)
speedSlider.Position = UDim2.new(0, 10, 0, 45)
speedSlider.BackgroundColor3 = Color3.fromRGB(55, 65, 81)
Instance.new("UICorner", speedSlider).CornerRadius = UDim.new(1, 0)

local speedFill = Instance.new("Frame", speedSlider)
speedFill.Size = UDim2.new(0.4, 0, 1, 0)
speedFill.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
speedFill.BorderSizePixel = 0
Instance.new("UICorner", speedFill).CornerRadius = UDim.new(1, 0)

-- Кнопка эффектов
local fxBtn = Instance.new("TextButton", settingsPanel)
fxBtn.Size = UDim2.new(1, -20, 0, 35)
fxBtn.Position = UDim2.new(0, 10, 0, 70)
fxBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
fxBtn.BorderSizePixel = 0
fxBtn.Text = "✨ Эффекты: ВКЛ"
fxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fxBtn.TextSize = 13
fxBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", fxBtn).CornerRadius = UDim.new(0, 8)

-- ═══════════════════════════════════════════════════════
-- 🎬 ПРОДВИНУТЫЕ АНИМАЦИИ
-- ═══════════════════════════════════════════════════════

spawn(function()
    while gradient.Parent do
        TweenService:Create(gradient, TweenInfo.new(3, Enum.EasingStyle.Linear), {Rotation = 360}):Play()
        wait(3)
        gradient.Rotation = 0
    end
end)

TweenService:Create(brand, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    TextTransparency = 0.3
}):Play()

TweenService:Create(stroke, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Transparency = 0
}):Play()

mainBtn.MouseEnter:Connect(function()
    TweenService:Create(mainBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(0, 120, 0, 120)}):Play()
    TweenService:Create(icon, TweenInfo.new(0.2), {TextSize = 54, Rotation = 15}):Play()
    TweenService:Create(stroke, TweenInfo.new(0.2), {Thickness = 4}):Play()
end)

mainBtn.MouseLeave:Connect(function()
    TweenService:Create(mainBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(0, 110, 0, 110)}):Play()
    TweenService:Create(icon, TweenInfo.new(0.2), {TextSize = 48, Rotation = 0}):Play()
    TweenService:Create(stroke, TweenInfo.new(0.2), {Thickness = 3}):Play()
end)

-- ═══════════════════════════════════════════════════════
-- 🌈 ПРЕМИУМ ПЛАТФОРМА
-- ═══════════════════════════════════════════════════════

local active = false
local platform = nil
local connection = nil
local height = 0
local riseSpeed = 2
local effectsEnabled = true

local function createPlatform()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    platform = Instance.new("Part")
    platform.Name = "RobanikUltimatePlatform"
    platform.Size = Vector3.new(7, 0.6, 7)
    platform.Anchored = true
    platform.CanCollide = true
    platform.Material = Enum.Material.ForceField
    platform.Color = Color3.fromRGB(139, 92, 246)
    platform.Transparency = 0.2
    platform.CFrame = root.CFrame * CFrame.new(0, -3.5, 0)
    platform.Parent = workspace
    
    -- Неоновое кольцо
    local neon = Instance.new("Part", platform)
    neon.Name = "Neon"
    neon.Size = Vector3.new(6.5, 0.7, 6.5)
    neon.Anchored = true
    neon.CanCollide = false
    neon.Material = Enum.Material.Neon
    neon.Color = Color3.fromRGB(167, 139, 250)
    neon.Transparency = 0.1
    neon.CFrame = platform.CFrame
    
    -- Кристальный слой
    local crystal = Instance.new("Part", platform)
    crystal.Name = "Crystal"
    crystal.Size = Vector3.new(6.8, 0.3, 6.8)
    crystal.Anchored = true
    crystal.CanCollide = false
    crystal.Material = Enum.Material.Glass
    crystal.Color = Color3.fromRGB(236, 72, 153)
    crystal.Transparency = 0.5
    crystal.CFrame = platform.CFrame * CFrame.new(0, 0.2, 0)
    
    -- Свечение
    local light = Instance.new("PointLight", platform)
    light.Brightness = 2
    light.Range = 20
    light.Color = Color3.fromRGB(139, 92, 246)
    
    if effectsEnabled then
        -- Частицы
        local particles = Instance.new("ParticleEmitter", platform)
        particles.Texture = "rbxassetid://2273224484"
        particles.Rate = 15
        particles.Lifetime = NumberRange.new(1, 2)
        particles.Speed = NumberRange.new(1, 3)
        particles.SpreadAngle = Vector2.new(180, 0)
        particles.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 246)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(236, 72, 153))
        }
        particles.Size = NumberSequence.new(0.3, 0)
        particles.Transparency = NumberSequence.new(0, 1)
        particles.LightEmission = 1
        particles.Rotation = NumberRange.new(0, 360)
        
        -- Искры
        local sparks = Instance.new("ParticleEmitter", platform)
        sparks.Texture = "rbxassetid://1084991215"
        sparks.Rate = 10
        sparks.Lifetime = NumberRange.new(0.5, 1)
        sparks.Speed = NumberRange.new(0, 2)
        sparks.SpreadAngle = Vector2.new(360, 360)
        sparks.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0))
        sparks.Size = NumberSequence.new(0.2, 0)
        sparks.Transparency = NumberSequence.new(0, 1)
        sparks.LightEmission = 1
    end
    
    -- Звук создания
    local sound = Instance.new("Sound", platform)
    sound.SoundId = "rbxassetid://6895079853"
    sound.Volume = 0.4
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 2)
end

local function destroyPlatform()
    if platform then
        local parts = platform:GetChildren()
        for _, p in ipairs(parts) do
            if p:IsA("ParticleEmitter") then p.Enabled = false end
        end
        
        for i = 0, 1, 0.1 do
            if platform then
                platform.Transparency = i
                for _, p in ipairs(parts) do
                    if p:IsA("BasePart") then p.Transparency = (p.Transparency + 0.1) end
                end
            end
            wait(0.02)
        end
        
        if platform then platform:Destroy() platform = nil end
    end
end

local lastUpdate = tick()
local hue = 0

local function updatePlatform()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root or not platform then return end
    
    local now = tick()
    local dt = now - lastUpdate
    lastUpdate = now
    
    height = height + (riseSpeed * dt)
    
    local targetPos = root.Position + Vector3.new(0, -3.5 + height, 0)
    platform.CFrame = CFrame.new(platform.Position:Lerp(targetPos, 0.12)) * CFrame.Angles(0, math.rad(now * 30), 0)
    
    -- Радужный эффект
    hue = (hue + dt * 0.1) % 1
    local color = Color3.fromHSV(hue, 0.8, 1)
    
    local neon = platform:FindFirstChild("Neon")
    if neon then 
        neon.CFrame = platform.CFrame
        neon.Color = color
    end
    
    local crystal = platform:FindFirstChild("Crystal")
    if crystal then 
        crystal.CFrame = platform.CFrame * CFrame.new(0, 0.2, 0) * CFrame.Angles(0, math.rad(-now * 40), 0)
    end
    
    local light = platform:FindFirstChild("PointLight")
    if light then light.Color = color end
    
    counter.Text = math.floor(height) .. "m"
    counter.TextColor3 = color
end

-- ═══════════════════════════════════════════════════════
-- 🎮 УПРАВЛЕНИЕ И СОБЫТИЯ
-- ═══════════════════════════════════════════════════════

mainBtn.MouseButton2Click:Connect(function()
    settingsPanel.Visible = not settingsPanel.Visible
    TweenService:Create(settingsPanel, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = settingsPanel.Visible and UDim2.new(0, 200, 0, 120) or UDim2.new(0, 200, 0, 0)
    }):Play()
end)

local draggingSpeed = false
speedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSpeed = true end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSpeed = false end
end)

RunService.RenderStepped:Connect(function()
    if draggingSpeed then
        local mouse = UserInputService:GetMouseLocation()
        local relative = (mouse.X - speedSlider.AbsolutePosition.X) / speedSlider.AbsoluteSize.X
        relative = math.clamp(relative, 0, 1)
        speedFill.Size = UDim2.new(relative, 0, 1, 0)
        riseSpeed = 0.5 + (relative * 4.5)
        speedLabel.Text = string.format("Скорость: %.1f", riseSpeed)
    end
end)

fxBtn.MouseButton1Click:Connect(function()
    effectsEnabled = not effectsEnabled
    fxBtn.Text = effectsEnabled and "✨ Эффекты: ВКЛ" or "✨ Эффекты: ВЫКЛ"
    fxBtn.BackgroundColor3 = effectsEnabled and Color3.fromRGB(34, 197, 94) or Color3.fromRGB(107, 114, 128)
end)

mainBtn.MouseButton1Click:Connect(function()
    active = not active
    
    TweenService:Create(mainBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
        Size = UDim2.new(0, 100, 0, 100)
    }):Play()
    
    if active then
        indicator.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
        indGlow.Color = Color3.fromRGB(34, 197, 94)
        icon.Text = "✅"
        
        TweenService:Create(indicator, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            BackgroundColor3 = Color3.fromRGB(74, 222, 128)
        }):Play()
        
        height = 0
        lastUpdate = tick()
        createPlatform()
        connection = RunService.Heartbeat:Connect(updatePlatform)
        
        local snd = Instance.new("Sound", mainBtn)
        snd.SoundId = "rbxassetid://6895079853"
        snd.Volume = 0.5
        snd:Play()
        game:GetService("Debris"):AddItem(snd, 2)
    else
        indicator.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        indGlow.Color = Color3.fromRGB(239, 68, 68)
        icon.Text = "🚀"
        
        if connection then connection:Disconnect() connection = nil end
        destroyPlatform()
        height = 0
        counter.Text = "0m"
    end
end)

player.CharacterAdded:Connect(function()
    wait(1)
    if active then
        active = false
        indicator.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        icon.Text = "🚀"
        if connection then connection:Disconnect() connection = nil end
        destroyPlatform()
        height = 0
        counter.Text = "0m"
    end
end)

spawn(function()
    while wait(2) do
        if active and (not platform or not platform.Parent) then
            destroyPlatform()
            createPlatform()
        end
    end
end)

-- ═══════════════════════════════════════════════════════
-- 🎉 СТАРТОВОЕ УВЕДОМЛЕНИЕ
-- ═══════════════════════════════════════════════════════

local function notify(text, color, duration)
    local notif = Instance.new("Frame", gui)
    notif.Size = UDim2.new(0, 300, 0, 90)
    notif.Position = UDim2.new(1, 0, 0, 30)
    notif.BackgroundColor3 = Color3.fromRGB(17, 24, 39)
    notif.BorderSizePixel = 0
    
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 15)
    local stroke = Instance.new("UIStroke", notif)
    stroke.Color = color
    stroke.Thickness = 2
    stroke.Transparency = 0.5
    
    local title = Instance.new("TextLabel", notif)
    title.Size = UDim2.new(1, -20, 0, 30)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🚀 ROBANIK ULTIMATE RISER"
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.TextSize = 15
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local msg = Instance.new("TextLabel", notif)
    msg.Size = UDim2.new(1, -20, 0, 40)
    msg.Position = UDim2.new(0, 10, 0, 40)
    msg.BackgroundTransparency = 1
    msg.Text = text
    msg.TextColor3 = color
    msg.TextSize = 13
    msg.Font = Enum.Font.Gotham
    msg.TextXAlignment = Enum.TextXAlignment.Left
    msg.TextWrapped = true
    
    TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -310, 0, 30)
    }):Play()
    
    wait(duration or 3)
    
    TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 0, 0, 30)
    }):Play()
    
    wait(0.5)
    notif:Destroy()
end

notify("✅ Загружено успешно!\n🛡️ Защита активна | 🎨 Premium UI", Color3.fromRGB(34, 197, 94), 4)

print("═══════════════════════════════════")
print("🚀 ROBANIK ULTIMATE PLATFORM RISER")
print("✨ BY ROBANIK - PREMIUM EDITION")
print("✅ Успешно загружено!")
print("🎮 ПКМ на кнопке - настройки")
print("═══════════════════════════════════")

loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/Stl.brain.plat/refs/heads/main/Anti.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/Stl.brain.plat/refs/heads/main/Anti2.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Robanik/Stl.brain.plat/refs/heads/main/JUMPboostf.lua"))()
