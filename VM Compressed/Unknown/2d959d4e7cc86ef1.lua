--[[
	COMPKILLER + ELITE HUB MERGED - ПОЛНАЯ ВЕРСИЯ
	Author:  gerkylesichakes
]]

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();

-- Create Notification --
local Notifier = Compkiller.newNotify();

-- Create Config Manager --
local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller-EliteHub",
	Config = "Main-Config"
});

-- Loading UI --
Compkiller:Loader("rbxassetid://120245531583106" , 2.5).yield();

-- Creating Window --
local Window = Compkiller.new({
	Name = "🌟 SHADOW PREDATOR ELITE HUB v2.0 🌟",
	Keybind = "LeftAlt",
	Logo = "rbxassetid://120245531583106",
	Scale = Compkiller.Scale.Window,
	TextSize = 15,
});

-- Watermark --
local Watermark = Window:Watermark();

Watermark:AddText({
	Icon = "user",
	Text = "Hasker",
});

Watermark:AddText({
	Icon = "clock",
	Text = Compkiller:GetDate(),
});

local Time = Watermark:AddText({
	Icon = "timer",
	Text = "TIME",
});

-- ДОБАВЛЯЕМ FPS В ВОДЯНОЙ ЗНАК
local FPS = Watermark:AddText({
	Icon = "monitor",
	Text = "FPS: 0",
});

task.spawn(function()
	while true do
		task.wait(0.5)
		Time:SetText(Compkiller:GetTimeNow());
	end
end)

-- Функция для обновления FPS
task.spawn(function()
	while true do
		task.wait(0.5)
		local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
		FPS:SetText("FPS: " .. fps)
	end
end)

Watermark:AddText({
	Icon = "server",
	Text = "v12.6",
});

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

--[[
    ==============================
    СОЗДАНИЕ ВКЛАДОК
    ==============================
]]--
Window:DrawCategory({
	Name = "🎮 Основные функции"
});

-- Основная вкладка
local MainTab = Window:DrawTab({
	Name = "🏠 Основное",
	Icon = "home",
	EnableScrolling = true
});

-- ESP вкладка
local ESPTab = Window:DrawTab({
	Name = "👁️ ESP",
	Icon = "eye",
	EnableScrolling = true
});

-- Aimbot вкладка
local CombatTab = Window:DrawTab({
	Name = "🎯 Aimbot",
	Icon = "crosshair",
	EnableScrolling = true
});

-- Телепорт вкладка
local TeleportTab = Window:DrawTab({
	Name = "🌀 Телепорт",
	Icon = "navigation",
	EnableScrolling = true
});

-- Kill All вкладка
local KillAllTab = Window:DrawTab({
	Name = "⚔️ Убить всех",
	Icon = "sword",
	EnableScrolling = true
});

Window:DrawCategory({
	Name = "📂 Скрипты и хабы"
});

-- Game Hub вкладка
local GameHubTab = Window:DrawTab({
	Name = "🎮 Game Hub",
	Icon = "gamepad-2",
	EnableScrolling = true
});

-- FE скрипты вкладка
local FEScriptsTab = Window:DrawTab({
	Name = "💛 FE Скрипты",
	Icon = "heart",
	EnableScrolling = true
});

-- Хабы вкладка
local HubsTab = Window:DrawTab({
	Name = "🚀 Хабы",
	Icon = "rocket",
	EnableScrolling = true
});

-- Скрипты для игр вкладка
local GameScriptsTab = Window:DrawTab({
	Name = "🎯 Игровые скрипты",
	Icon = "target",
	EnableScrolling = true
});

--[[
    ==============================
    ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
    ==============================
]]--
local function LoadScript(name, url)
    task.spawn(function()
        Notifier.new({
            Title = "⏳ Загрузка...",
            Content = name .. " запускается",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        
        task.wait(0.5)
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        
        task.wait(0.5)
        
        if success then
            Notifier.new({
                Title = "✅ Успешно!",
                Content = name .. " загружен",
                Duration = 3,
                Icon = "rbxassetid://120245531583106"
            })
        else
            Notifier.new({
                Title = "❌ Ошибка!",
                Content = "Не удалось загрузить " .. name,
                Duration = 5,
                Icon = "rbxassetid://120245531583106"
            })
        end
    end)
end

-- Функция для улучшения FPS
local function OptimizeFPS()
    settings().Rendering.QualityLevel = 1
    settings().Rendering.MeshCacheSize = 0
    settings().Rendering.GraphicsMode = 0
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FantasySky = nil

    Notifier.new({
        Title = "⚡ FPS Оптимизирован",
        Content = "Графика оптимизирована для лучшей производительности",
        Duration = 3,
        Icon = "rbxassetid://120245531583106"
    })
end

--[[
    ==============================
    ПРОДВИНУТЫЙ AIMBOT С ГИБКИМИ НАСТРОЙКАМИ
    ==============================
]]--
local AimbotLeftSection = CombatTab:DrawSection({
    Name = "🎯 Основные Настройки Aimbot",
    Position = 'left'
});

local AimbotRightSection = CombatTab:DrawSection({
    Name = "⚙️ Продвинутые Настройки",
    Position = 'right'
});

local AimbotTestSection = CombatTab:DrawSection({
    Name = "🧪 Тестирование",
    Position = 'left'
});

local AimbotConfig = {
    Enabled = false,
    TeamCheck = true,
    AliveCheck = true,
    WallCheck = true,
    Smoothness = 0.15,
    FOV = 120,
    ShowFOV = true,
    FOVColor = Color3.fromRGB(170, 0, 255),
    LockedColor = Color3.fromRGB(255, 50, 50),
    TriggerKey = "MouseButton2",
    Toggle = false,
    LockPart = "Head",
    ThirdPersonFix = true,
    Priority = "Distance",
    Prediction = 0.136,
    AutoShoot = false,
    SilentAim = false,
    HitChance = 100,
    Triggerbot = false,
    TriggerbotDelay = 0.1,
    AutoClicker = false,
    AutoClickerCPS = 10,
    AutoClickerHoldTime = 0.1,
    SmoothingType = "Linear",
    Humanizer = false,
    HumanizerIntensity = 0.1,
    FOVShape = "Circle",
    VisibleCheck = true,
    MaxDistance = 1000,
    TargetHistory = {},
    SmoothAim = true,
    SmoothFactor = 0.8,
    RecoilCompensation = false,
    RecoilFactor = 0.05,
    BonePriority = {"Head", "HumanoidRootPart", "Torso", "UpperTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg"},
    AntiAim = false,
    YawOffset = 0,
    PitchOffset = 0,
    AimbotMode = "Hold",
    KeybindMode = "Toggle",
    VisualizeTarget = true,
    TargetIndicator = true,
    PredictionType = "Velocity",
    CustomPrediction = 0.165,
    MouseSensitivity = 1.0,
    FOVScaleWithDistance = false,
    AdaptiveSmoothness = false,
    DebugMode = false
}

-- FOV круг
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = AimbotConfig.ShowFOV
FOVCircle.Radius = AimbotConfig.FOV
FOVCircle.Color = AimbotConfig.FOVColor
FOVCircle.Thickness = 3
FOVCircle.Filled = false
FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

local Running = false
local LockedTarget = nil
local AimbotConnection = nil
local LastTargetTime = 0
local HumanizerOffset = Vector2.new(0, 0)

-- Функция проверки видимости
local function IsVisible(targetPart)
    if not AimbotConfig.WallCheck then return true end

    local camera = workspace.CurrentCamera
    local origin = camera.CFrame.Position
    local direction = (targetPart.Position - origin).Unit * 1000
    local ray = Ray.new(origin, direction)

    local hit, position = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character})
    return hit and hit:IsDescendantOf(targetPart.Parent)
end

-- Функция для 1-го лица
local function IsFirstPerson()
    if not AimbotConfig.ThirdPersonFix then return false end
    local character = player.Character
    if not character then return false end

    local head = character:FindFirstChild("Head")
    if not head then return false end

    local camera = workspace.CurrentCamera
    local distance = (head.Position - camera.CFrame.Position).Magnitude
    return distance < 2
end

-- Функция предсказания движения
local function GetPredictedPosition(targetPart)
    if not targetPart then return targetPart end
    if AimbotConfig.Prediction <= 0 then return targetPart.Position end

    local character = targetPart.Parent
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return targetPart.Position end

    local velocity = targetPart.AssemblyLinearVelocity

    if AimbotConfig.PredictionType == "Advanced" then
        local acceleration = targetPart.AssemblyAngularVelocity
        return targetPart.Position + (velocity * AimbotConfig.Prediction) + (acceleration * AimbotConfig.Prediction * AimbotConfig.Prediction * 0.5)
    else
        return targetPart.Position + (velocity * AimbotConfig.Prediction)
    end
end

-- Функция проверки шанса попадания
local function ShouldHit()
    return math.random(1, 100) <= AimbotConfig.HitChance
end

-- Функция гуманизатора
local function GetHumanizerOffset()
    if not AimbotConfig.Humanizer then return Vector2.new(0, 0) end

    local intensity = AimbotConfig.HumanizerIntensity
    local time = tick()

    local x = math.sin(time * 2) * intensity * 10
    local y = math.cos(time * 1.5) * intensity * 8

    return Vector2.new(x, y)
end

-- Функция сглаживания
local function SmoothAim(current, target, smoothness)
    if not AimbotConfig.SmoothAim then return target end

    local smoothFactor = AimbotConfig.SmoothFactor
    if AimbotConfig.AdaptiveSmoothness then
        local distance = (target - current).Magnitude
        smoothFactor = math.clamp(smoothness / (distance + 0.1), 0.1, 0.9)
    end

    if AimbotConfig.SmoothingType == "Exponential" then
        return current:Lerp(target, 1 - math.exp(-smoothFactor * 10))
    else
        return current:Lerp(target, smoothFactor)
    end
end

-- Функция компенсации отдачи
local function ApplyRecoilCompensation(targetPosition)
    if not AimbotConfig.RecoilCompensation then return targetPosition end

    local recoilFactor = AimbotConfig.RecoilFactor * 0.1
    local time = tick()

    local recoilOffset = Vector3.new(
        math.sin(time * 2) * recoilFactor,
        math.sin(time * 1.5) * recoilFactor * 0.5,
        math.cos(time * 2.5) * recoilFactor * 0.3
    )

    return targetPosition + recoilOffset
end

-- УЛУЧШЕННАЯ ФУНКЦИЯ ПРИОРИТЕТА ЦЕЛЕЙ
local function CalculateTargetPriority(targetPlayer, targetPart, humanoid, cameraPos, mousePos, screenPoint, screenDistance, gameDistance)
    local score = 0
    local character = targetPlayer.Character

    if AimbotConfig.Priority == "Distance" then
        score = 1000 - gameDistance

    elseif AimbotConfig.Priority == "FOV" then
        score = 1000 - screenDistance

    elseif AimbotConfig.Priority == "Health" then
        if humanoid then
            local healthPercent = (humanoid.Health / humanoid.MaxHealth) * 100
            score = (100 - healthPercent) * 10
        end

    elseif AimbotConfig.Priority == "Crosshair" then
        score = 1000 - screenDistance

    elseif AimbotConfig.Priority == "Threat" then
        local targetHead = character:FindFirstChild("Head")
        if targetHead then
            local targetLook = targetHead.CFrame.LookVector
            local toLocal = (cameraPos - targetHead.Position).Unit
            local dot = targetLook:Dot(toLocal)
            if dot > 0.7 then
                score = score + 500
            end
        end
        score = score + (1000 - gameDistance) * 0.5

    elseif AimbotConfig.Priority == "Weapon" then
        local hasWeapon = false
        for _, item in ipairs(character:GetChildren()) do
            if item:IsA("Tool") then
                hasWeapon = true
                break
            end
        end
        if hasWeapon then
            score = score + 300
        end
        score = score + (1000 - gameDistance)

    elseif AimbotConfig.Priority == "Rank" then
        local leaderstats = targetPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            local level = leaderstats:FindFirstChild("Level") or leaderstats:FindFirstChild("level")
            if level and tonumber(level.Value) then
                score = score + (tonumber(level.Value) * 5)
            end
        end
        score = score + (1000 - gameDistance)

    elseif AimbotConfig.Priority == "Movement" then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local velocity = rootPart.AssemblyLinearVelocity
            local speed = velocity.Magnitude
            score = score + (speed * 2)
        end
        score = score + (1000 - gameDistance)

    elseif AimbotConfig.Priority == "Custom" then
        local customScore = 0

        if humanoid then
            local healthPercent = (humanoid.Health / humanoid.MaxHealth) * 100
            customScore = customScore + ((100 - healthPercent) * 3)
        end

        customScore = customScore + ((1000 - gameDistance) * 0.7)
        customScore = customScore + ((1000 - screenDistance) * 0.5)

        local targetHead = character:FindFirstChild("Head")
        if targetHead then
            local targetLook = targetHead.CFrame.LookVector
            local toLocal = (cameraPos - targetHead.Position).Unit
            local dot = targetLook:Dot(toLocal)
            if dot > 0.5 then
                customScore = customScore + 200
            end
        end

        for _, item in ipairs(character:GetChildren()) do
            if item:IsA("Tool") then
                customScore = customScore + 150
                break
            end
        end

        score = customScore
    end

    return score
end

-- УЛУЧШЕННАЯ ФУНКЦИЯ ПОИСКА ЦЕЛИ
local function GetClosestPlayer()
    if not AimbotConfig.Enabled then return nil end

    local camera = workspace.CurrentCamera
    local localPlayer = player
    local cameraPos = camera.CFrame.Position
    local mousePos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)

    local bestTarget = nil
    local bestScore = -math.huge

    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer == localPlayer then continue end

        if AimbotConfig.TeamCheck then
            local isSameTeam = false

            if player.Team and targetPlayer.Team then
                isSameTeam = player.Team == targetPlayer.Team
            end

            if not isSameTeam and player.TeamColor and targetPlayer.TeamColor then
                isSameTeam = player.TeamColor == targetPlayer.TeamColor
            end

            if not isSameTeam and player.Team and targetPlayer.Team and player.Team.Name and targetPlayer.Team.Name then
                isSameTeam = player.Team.Name == targetPlayer.Team.Name
            end

            if isSameTeam then
                continue
            end
        end

        if not targetPlayer.Character then continue end

        local character = targetPlayer.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if AimbotConfig.AliveCheck and (not humanoid or humanoid.Health <= 0) then continue end

        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then continue end

        local distance = (rootPart.Position - cameraPos).Magnitude
        if distance > AimbotConfig.MaxDistance then continue end

        local targetPart = nil

        if character:FindFirstChild(AimbotConfig.LockPart) then
            targetPart = character:FindFirstChild(AimbotConfig.LockPart)
        else
            local priorityParts = {
                "Head", "HumanoidRootPart", "UpperTorso", "Torso",
                "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
                "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg",
                "LeftHand", "RightHand", "LeftFoot", "RightFoot"
            }

            for _, boneName in ipairs(priorityParts) do
                local bone = character:FindFirstChild(boneName)
                if bone then
                    targetPart = bone
                    break
                end
            end
        end

        if not targetPart then continue end

        if AimbotConfig.WallCheck and not IsVisible(targetPart) then continue end

        local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
        if not onScreen then continue end

        local screenPoint = Vector2.new(screenPos.X, screenPos.Y)
        local screenDistance = (screenPoint - mousePos).Magnitude

        if screenDistance > AimbotConfig.FOV then continue end

        local score = CalculateTargetPriority(targetPlayer, targetPart, humanoid, cameraPos, mousePos, screenPoint, screenDistance, distance)

        if IsVisible(targetPart) then
            score = score + 500
        end

        if AimbotConfig.TargetHistory[targetPlayer] then
            score = score + 200
        end

        if score > bestScore then
            bestScore = score
            bestTarget = targetPart
        end
    end

    if bestTarget then
        AimbotConfig.TargetHistory[bestTarget.Parent] = tick()
    end

    for target, time in pairs(AimbotConfig.TargetHistory) do
        if tick() - time > 10 then
            AimbotConfig.TargetHistory[target] = nil
        end
    end

    return bestTarget
end

-- Улучшенный цикл аимбота
local function StartAimbot()
    if AimbotConnection then
        AimbotConnection:Disconnect()
        AimbotConnection = nil
    end

    AimbotConnection = game:GetService("RunService").RenderStepped:Connect(function()
        FOVCircle.Visible = AimbotConfig.ShowFOV and AimbotConfig.Enabled
        FOVCircle.Radius = AimbotConfig.FOV
        FOVCircle.Color = LockedTarget and AimbotConfig.LockedColor or AimbotConfig.FOVColor
        FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

        HumanizerOffset = GetHumanizerOffset()

        if Running and AimbotConfig.Enabled then
            local target = GetClosestPlayer()
            if target and ShouldHit() then
                LockedTarget = target
                LastTargetTime = tick()

                local camera = workspace.CurrentCamera
                local currentCF = camera.CFrame

                local targetPosition = GetPredictedPosition(target)
                targetPosition = ApplyRecoilCompensation(targetPosition)

                local smoothness = AimbotConfig.Smoothness
                if IsFirstPerson() then
                    smoothness = smoothness * 0.8
                end

                local targetCF = CFrame.new(currentCF.Position, targetPosition)
                local newCF = SmoothAim(currentCF, targetCF, smoothness)

                if AimbotConfig.Humanizer then
                    newCF = newCF * CFrame.Angles(
                        math.rad(HumanizerOffset.Y / 100),
                        math.rad(HumanizerOffset.X / 100),
                        0
                    )
                end

                camera.CFrame = newCF
            else
                LockedTarget = nil
            end
        else
            LockedTarget = nil
        end
    end)
end

-- Функция автокликера
local AutoClickerConnection = nil
local function StartAutoClicker()
    if AutoClickerConnection then
        AutoClickerConnection:Disconnect()
        AutoClickerConnection = nil
    end

    local clickInterval = 1 / AimbotConfig.AutoClickerCPS
    local lastClickTime = 0

    AutoClickerConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not AimbotConfig.AutoClicker or not AimbotConfig.Enabled then return end

        local currentTime = tick()
        if currentTime - lastClickTime >= clickInterval then
            local mouse = player:GetMouse()
            if mouse then
                mouse1press()
                task.wait(AimbotConfig.AutoClickerHoldTime)
                mouse1release()
                lastClickTime = currentTime
            end
        end
    end)
end

-- Anti-Aim функция
local function ApplyAntiAim()
    if not AimbotConfig.AntiAim then return end

    local character = player.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    humanoid.CameraOffset = Vector3.new(
        AimbotConfig.YawOffset / 100,
        AimbotConfig.PitchOffset / 100,
        0
    )
end

-- Управление клавишами
local KeybindHandler
KeybindHandler = game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType[AimbotConfig.TriggerKey] then
        if AimbotConfig.KeybindMode == "Toggle" then
            Running = not Running
            Notifier.new({
                Title = Running and "🎯 Aimbot: ВКЛ" or "🎯 Aimbot: ВЫКЛ",
                Content = Running and "Аимбот активирован" or "Аимбот деактивирован",
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
        else
            Running = true
        end
    end

    if input.KeyCode == Enum.KeyCode.P then
        AimbotConfig.Enabled = not AimbotConfig.Enabled
        Notifier.new({
            Title = AimbotConfig.Enabled and "🎯 Aimbot ВКЛ" or "🎯 Aimbot ВЫКЛ",
            Content = "Быстрое переключение аимбота",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if AimbotConfig.KeybindMode == "Hold" and input.UserInputType == Enum.UserInputType[AimbotConfig.TriggerKey] then
        Running = false
    end
end)

-- ОСНОВНЫЕ ЭЛЕМЕНТЫ УПРАВЛЕНИЯ AIMBOT
AimbotLeftSection:AddToggle({
    Name = "🎯 Включить Aimbot",
    Flag = "Aimbot_Enabled",
    Default = AimbotConfig.Enabled,
    Callback = function(value)
        AimbotConfig.Enabled = value
        if value then
            StartAimbot()
            if AimbotConfig.AutoClicker then
                StartAutoClicker()
            end
            if AimbotConfig.AntiAim then
                task.spawn(ApplyAntiAim)
            end
        else
            if AimbotConnection then
                AimbotConnection:Disconnect()
                AimbotConnection = nil
            end
            if AutoClickerConnection then
                AutoClickerConnection:Disconnect()
                AutoClickerConnection = nil
            end
        end
    end,
});

AimbotLeftSection:AddToggle({
    Name = "🖱️ Автокликер",
    Flag = "Aimbot_AutoClicker",
    Default = AimbotConfig.AutoClicker,
    Callback = function(value)
        AimbotConfig.AutoClicker = value
        if value and AimbotConfig.Enabled then
            StartAutoClicker()
        else
            if AutoClickerConnection then
                AutoClickerConnection:Disconnect()
                AutoClickerConnection = nil
            end
        end
    end,
});

AimbotLeftSection:AddToggle({
    Name = "👥 Игнорировать команду",
    Flag = "Aimbot_TeamCheck",
    Default = AimbotConfig.TeamCheck,
    Callback = function(value)
        AimbotConfig.TeamCheck = value
    end,
});

AimbotLeftSection:AddToggle({
    Name = "💀 Не целить умерших",
    Flag = "Aimbot_AliveCheck",
    Default = AimbotConfig.AliveCheck,
    Callback = function(value)
        AimbotConfig.AliveCheck = value
    end,
});

AimbotLeftSection:AddToggle({
    Name = "👁️ Показывать FOV",
    Flag = "Aimbot_ShowFOV",
    Default = AimbotConfig.ShowFOV,
    Callback = function(value)
        AimbotConfig.ShowFOV = value
        FOVCircle.Visible = value and AimbotConfig.Enabled
    end,
});

AimbotLeftSection:AddSlider({
    Name = "🔘 Размер FOV",
    Min = 10,
    Max = 500,
    Default = AimbotConfig.FOV,
    Round = 0,
    Flag = "Aimbot_FOV",
    Callback = function(value)
        AimbotConfig.FOV = value
    end
})

AimbotLeftSection:AddSlider({
    Name = "🔄 Чувствительность",
    Min = 0.01,
    Max = 1.0,
    Default = AimbotConfig.Smoothness,
    Round = 2,
    Flag = "Aimbot_Smoothness",
    Callback = function(value)
        AimbotConfig.Smoothness = value
    end
})

AimbotLeftSection:AddSlider({
    Name = "🎯 Предсказание",
    Min = 0.0,
    Max = 0.5,
    Default = AimbotConfig.Prediction,
    Round = 3,
    Flag = "Aimbot_Prediction",
    Callback = function(value)
        AimbotConfig.Prediction = value
    end
})

AimbotLeftSection:AddSlider({
    Name = "📏 Макс. дистанция",
    Min = 50,
    Max = 5000,
    Default = AimbotConfig.MaxDistance,
    Round = 0,
    Flag = "Aimbot_MaxDistance",
    Callback = function(value)
        AimbotConfig.MaxDistance = value
    end
})

AimbotLeftSection:AddDropdown({
    Name = "🎯 Часть тела",
    Default = AimbotConfig.LockPart,
    Flag = "Aimbot_LockPart",
    Values = {"Head", "HumanoidRootPart", "UpperTorso", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg"},
    Callback = function(value)
        AimbotConfig.LockPart = value
        Notifier.new({
            Title = "🎯 Цель изменена",
            Content = "Целевая часть: " .. value,
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
    end
})

AimbotLeftSection:AddDropdown({
    Name = "🎯 Приоритет цели",
    Default = AimbotConfig.Priority,
    Flag = "Aimbot_Priority",
    Values = {"Distance", "FOV", "Health", "Crosshair", "Threat", "Weapon", "Rank", "Movement", "Custom"},
    Callback = function(value)
        AimbotConfig.Priority = value
        local priorityDescriptions = {
            Distance = "Целится в ближайшего игрока",
            FOV = "Целится в ближайшего к курсору",
            Health = "Целится в игрока с наименьшим здоровьем",
            Crosshair = "Целится по пересечению с курсором",
            Threat = "Целится в игроков, которые смотрят на вас",
            Weapon = "Целится в игроков с оружием",
            Rank = "Целится в игроков с высоким уровнем",
            Movement = "Целится в быстро движущихся игроков",
            Custom = "Комбинированный приоритет по нескольким факторам"
        }

        Notifier.new({
            Title = "🎯 Приоритет: " .. value:upper(),
            Content = priorityDescriptions[value] or "Кастомный приоритет",
            Duration = 3,
            Icon = "rbxassetid://120245531583106"
        })
    end
})

AimbotLeftSection:AddColorPicker({
    Name = "💜 Цвет FOV",
    Default = AimbotConfig.FOVColor,
    Flag = "Aimbot_FOVColor",
    Callback = function(value)
        AimbotConfig.FOVColor = value
    end
})

-- ПРОДВИНУТЫЕ НАСТРОЙКИ AIMBOT
AimbotRightSection:AddToggle({
    Name = "👁️ Исправление 1-го лица",
    Flag = "Aimbot_ThirdPerson",
    Default = AimbotConfig.ThirdPersonFix,
    Callback = function(value)
        AimbotConfig.ThirdPersonFix = value
    end,
});

AimbotRightSection:AddToggle({
    Name = "🧱 Не целить сквозь стены",
    Flag = "Aimbot_WallCheck",
    Default = AimbotConfig.WallCheck,
    Callback = function(value)
        AimbotConfig.WallCheck = value
    end,
});

AimbotRightSection:AddToggle({
    Name = "🤖 Гуманизатор",
    Flag = "Aimbot_Humanizer",
    Default = AimbotConfig.Humanizer,
    Callback = function(value)
        AimbotConfig.Humanizer = value
    end,
});

AimbotRightSection:AddToggle({
    Name = "🎯 Плавный аим",
    Flag = "Aimbot_SmoothAim",
    Default = AimbotConfig.SmoothAim,
    Callback = function(value)
        AimbotConfig.SmoothAim = value
    end,
});

AimbotRightSection:AddToggle({
    Name = "🔫 Компенсация отдачи",
    Flag = "Aimbot_RecoilCompensation",
    Default = AimbotConfig.RecoilCompensation,
    Callback = function(value)
        AimbotConfig.RecoilCompensation = value
    end,
});

AimbotRightSection:AddToggle({
    Name = "🛡️ Anti-Aim",
    Flag = "Aimbot_AntiAim",
    Default = AimbotConfig.AntiAim,
    Callback = function(value)
        AimbotConfig.AntiAim = value
        if value then
            task.spawn(ApplyAntiAim)
        end
    end,
});

AimbotRightSection:AddSlider({
    Name = "🎲 Шанс попадания %",
    Min = 1,
    Max = 100,
    Default = AimbotConfig.HitChance,
    Round = 0,
    Flag = "Aimbot_HitChance",
    Callback = function(value)
        AimbotConfig.HitChance = value
    end
})

AimbotRightSection:AddSlider({
    Name = "🖱️ CPS Автокликера",
    Min = 1,
    Max = 50,
    Default = AimbotConfig.AutoClickerCPS,
    Round = 0,
    Flag = "Aimbot_AutoClickerCPS",
    Callback = function(value)
        AimbotConfig.AutoClickerCPS = value
    end
})

AimbotRightSection:AddSlider({
    Name = "⏱️ Время удержания клика",
    Min = 0.01,
    Max = 1.0,
    Default = AimbotConfig.AutoClickerHoldTime,
    Round = 2,
    Flag = "Aimbot_AutoClickerHoldTime",
    Callback = function(value)
        AimbotConfig.AutoClickerHoldTime = value
    end
})

AimbotRightSection:AddSlider({
    Name = "🤖 Интенсивность гуманизатора",
    Min = 0.0,
    Max = 1.0,
    Default = AimbotConfig.HumanizerIntensity,
    Round = 2,
    Flag = "Aimbot_HumanizerIntensity",
    Callback = function(value)
        AimbotConfig.HumanizerIntensity = value
    end
})

AimbotRightSection:AddSlider({
    Name = "📐 Фактор сглаживания",
    Min = 0.1,
    Max = 1.0,
    Default = AimbotConfig.SmoothFactor,
    Round = 2,
    Flag = "Aimbot_SmoothFactor",
    Callback = function(value)
        AimbotConfig.SmoothFactor = value
    end
})

AimbotRightSection:AddSlider({
    Name = "🔫 Фактор отдачи",
    Min = 0.0,
    Max = 0.5,
    Default = AimbotConfig.RecoilFactor,
    Round = 2,
    Flag = "Aimbot_RecoilFactor",
    Callback = function(value)
        AimbotConfig.RecoilFactor = value
    end
})

AimbotRightSection:AddSlider({
    Name = "🛡️ Yaw Offset",
    Min = -180,
    Max = 180,
    Default = AimbotConfig.YawOffset,
    Round = 0,
    Flag = "Aimbot_YawOffset",
    Callback = function(value)
        AimbotConfig.YawOffset = value
    end
})

AimbotRightSection:AddSlider({
    Name = "🛡️ Pitch Offset",
    Min = -90,
    Max = 90,
    Default = AimbotConfig.PitchOffset,
    Round = 0,
    Flag = "Aimbot_PitchOffset",
    Callback = function(value)
        AimbotConfig.PitchOffset = value
    end
})

AimbotRightSection:AddDropdown({
    Name = "🔄 Тип сглаживания",
    Default = AimbotConfig.SmoothingType,
    Flag = "Aimbot_SmoothingType",
    Values = {"Linear", "Exponential"},
    Callback = function(value)
        AimbotConfig.SmoothingType = value
    end
})

AimbotRightSection:AddDropdown({
    Name = "🎯 Режим привязки",
    Default = AimbotConfig.KeybindMode,
    Flag = "Aimbot_KeybindMode",
    Values = {"Hold", "Toggle"},
    Callback = function(value)
        AimbotConfig.KeybindMode = value
    end
})

AimbotRightSection:AddDropdown({
    Name = "🎯 Тип предсказания",
    Default = AimbotConfig.PredictionType,
    Flag = "Aimbot_PredictionType",
    Values = {"Velocity", "Advanced"},
    Callback = function(value)
        AimbotConfig.PredictionType = value
    end
})

AimbotRightSection:AddColorPicker({
    Name = "🔴 Цвет захвата",
    Default = AimbotConfig.LockedColor,
    Flag = "Aimbot_LockedColor",
    Callback = function(value)
        AimbotConfig.LockedColor = value
    end
})

-- ТЕСТИРОВАНИЕ И ИНФОРМАЦИЯ AIMBOT
local function GetTargetInfo()
    local camera = workspace.CurrentCamera
    local cameraPos = camera.CFrame.Position
    local targetsInfo = {}

    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer == player then continue end
        if not targetPlayer.Character then continue end

        local character = targetPlayer.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")

        if humanoid and humanoid.Health > 0 and rootPart then
            local distance = (rootPart.Position - cameraPos).Magnitude
            local screenPos, onScreen = camera:WorldToViewportPoint(rootPart.Position)

            table.insert(targetsInfo, {
                Name = targetPlayer.Name,
                Distance = math.floor(distance),
                Health = humanoid.Health,
                MaxHealth = humanoid.MaxHealth,
                OnScreen = onScreen,
                Team = targetPlayer.Team and targetPlayer.Team.Name or "No Team"
            })
        end
    end

    return targetsInfo
end

AimbotTestSection:AddButton({
    Name = "🎯 Тест Аимбота",
    Callback = function()
        local target = GetClosestPlayer()
        if target then
            Notifier.new({
                Title = "🎯 Тест успешен",
                Content = "Цель найдена: " .. target.Parent.Name,
                Duration = 3,
                Icon = "rbxassetid://120245531583106"
            })
        else
            Notifier.new({
                Title = "🎯 Тест не удался",
                Content = "Цели не найдены",
                Duration = 3,
                Icon = "rbxassetid://120245531583106"
            })
        end
    end,
});

AimbotTestSection:AddButton({
    Name = "📊 Информация о целях",
    Callback = function()
        local targetsInfo = GetTargetInfo()
        local message = "Доступные цели:\n"

        if #targetsInfo == 0 then
            message = message .. "❌ Целей не найдено"
        else
            for i, target in ipairs(targetsInfo) do
                message = message .. string.format("\n👤 %s | 🏥 %d/%d | 📏 %d | %s",
                    target.Name, target.Health, target.MaxHealth, target.Distance,
                    target.OnScreen and "🖥️ На экране" or "📺 Вне экрана")
            end
        end

        Notifier.new({
            Title = "📊 Информация о целях",
            Content = message,
            Duration = 8,
            Icon = "rbxassetid://120245531583106"
        })
    end,
});

AimbotTestSection:AddButton({
    Name = "🔄 Сбросить настройки",
    Callback = function()
        AimbotConfig.WallCheck = true
        AimbotConfig.Smoothness = 0.15
        AimbotConfig.TeamCheck = true
        AimbotConfig.AliveCheck = true
        AimbotConfig.HitChance = 100
        AimbotConfig.AutoClickerCPS = 10
        AimbotConfig.AutoClickerHoldTime = 0.1
        AimbotConfig.RecoilFactor = 0.05
        AimbotConfig.MaxDistance = 1000
        Notifier.new({
            Title = "🔄 Настройки сброшены",
            Content = "Все настройки аимбота сброшены",
            Duration = 3,
            Icon = "rbxassetid://120245531583106"
        })
    end,
});

AimbotTestSection:AddButton({
    Name = "📊 Статистика",
    Callback = function()
        local targetCount = 0
        for _ in pairs(Players:GetPlayers()) do
            targetCount = targetCount + 1
        end

        Notifier.new({
            Title = "📊 Статистика Aimbot",
            Content = "Целей доступно: " .. (targetCount - 1) .. "\nЗаблокировано целей: " .. #AimbotConfig.TargetHistory,
            Duration = 5,
            Icon = "rbxassetid://120245531583106"
        })
    end,
});

--[[
    ==============================
    ОСНОВНЫЕ ФУНКЦИИ - ПОЛНЫЙ ФУНКЦИОНАЛ
    ==============================
]]--
local MainLeftSection = MainTab:DrawSection({
	Name = "🚀 Основные функции",
	Position = "left"
})

local MainRightSection = MainTab:DrawSection({
	Name = "📜 Дополнительные скрипты",
	Position = "right"
})

-- Переменные состояния
local flyActive = false
local flyVelocity = nil
local noclipActive = false

-- Функция полёта
local function ToggleFlight()
    flyActive = not flyActive
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        Notifier.new({
            Title = "❌ Ошибка",
            Content = "Персонаж не найден!",
            Duration = 3,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end

    if flyActive then
        if flyVelocity then flyVelocity:Destroy() end
        flyVelocity = Instance.new("BodyVelocity")
        flyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        flyVelocity.P = 10000
        flyVelocity.Parent = character.HumanoidRootPart

        Notifier.new({
            Title = "🛩️ Полёт активирован!",
            Content = "WASD - движение\nПробел/Shift - высота",
            Duration = 5,
            Icon = "rbxassetid://120245531583106"
        })
    else
        if flyVelocity then flyVelocity:Destroy() end
        Notifier.new({
            Title = "🛑 Полёт отключён",
            Content = "Режим полёта деактивирован",
            Duration = 3,
            Icon = "rbxassetid://120245531583106"
        })
    end
end

-- Функция Noclip
local function ToggleNoclip()
    noclipActive = not noclipActive
    Notifier.new({
        Title = noclipActive and "👻 Noclip: ВКЛ" or "🚷 Noclip: ВЫКЛ",
        Content = noclipActive and "Вы можете проходить сквозь стены" or "Коллизии включены",
        Duration = 3,
        Icon = "rbxassetid://120245531583106"
    })
end

-- Кнопки управления
MainLeftSection:AddButton({
	Name = "🛫 ВКЛ/ВЫКЛ Полёт",
	Callback = ToggleFlight
})

MainLeftSection:AddButton({
	Name = "👻 ВКЛ/ВЫКЛ Noclip",
	Callback = ToggleNoclip
})

-- Комбо-функция "Валхак"
MainLeftSection:AddButton({
	Name = "💥 АКТИВИРОВАТЬ ВАЛХАК",
	Callback = function()
		ToggleFlight()
		ToggleNoclip()
		Notifier.new({
			Title = "💣 ВАЛХАК АКТИВИРОВАН!",
			Content = "Все функции включены",
			Duration = 5,
            Icon = "rbxassetid://120245531583106"
		})
	end
})

MainLeftSection:AddButton({
	Name = "⚡ Оптимизировать FPS",
	Callback = OptimizeFPS
})

-- Дополнительные скрипты
local additionalScripts = {
	{"👹 SCP-096 Режим", "https://pastefy.app/YsJgITXR/raw"},
	{"👻 Невидимость PRO", "https://pastebin.com/raw/3Rnd9rHf"},
	{"🛡️ Бог-режим+", "https://glot.io/snippets/gua2ntmbdm/raw/main.lua"},
	{"🧟 Зомби хаки", "https://pastefy.app/JOWniO6o/raw"},
	{"🏎️ Флинг+", "https://pastebin.com/raw/LgZwZ7ZB"},
	{"🧟 Простой зомби-напарник", "https://pastefy.app/w7KnPY70/raw"},
	{"⚔️ FE GALE FIGHTER", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"},
	{"🌊 FE Neptunian V", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"}
}

for i, script in ipairs(additionalScripts) do
	MainRightSection:AddButton({
		Name = script[1],
		Callback = function()
			LoadScript(script[1], script[2])
		end
	})
end

--[[
    ==============================
    ESP СИСТЕМА - ПОЛНЫЙ ФУНКЦИОНАЛ С 3D BOX
    ==============================
]]--
local ESPLeftSection = ESPTab:DrawSection({
	Name = "👁️ Управление ESP",
	Position = "left"
})

local ESPRightSection = ESPTab:DrawSection({
	Name = "⚙️ Настройки ESP", 
	Position = "right"
})

local ESPAdvancedSection = ESPTab:DrawSection({
	Name = "🎯 Дополнительные настройки",
	Position = "left"
})

local ESPConfig = {
    Enabled = false,
    TeamCheck = true,
    ShowTeammates = true,
    Boxes = true,
    Names = true,
    Health = true,
    Distance = true,
    Tracers = true,
    TracersForTeammates = false,
    ShowDead = true,
    Box3DEnabled = true,
    Box3DFilled = false,
    UpdateFrequency = 0.05,
    EnemyColor = Color3.fromRGB(255, 50, 50),
    TeammateColor = Color3.fromRGB(50, 255, 50),
    OutlineColor = Color3.fromRGB(255, 255, 255),
    TextColor = Color3.fromRGB(255, 255, 255),
    TracerColor = Color3.fromRGB(255, 50, 255),
    Box3DColor = Color3.fromRGB(0, 255, 0),
    DeadColor = Color3.fromRGB(255, 0, 0),
    TextSize = 14,
    FillTransparency = 0.5,
    TracerThickness = 1,
    Box3DThickness = 1,
    Box3DSize = 2.0
}

local ESPObjects = {}
local TracerLines = {}
local Box3DObjects = {}

-- Функция проверки команды
local function IsTeammate(targetPlayer)
    if not ESPConfig.TeamCheck then return false end
    if not player.Team or not targetPlayer.Team then return false end
    return player.Team == targetPlayer.Team
end

-- Функция очистки ESP
local function ClearPlayerESP(targetPlayer)
    if ESPObjects[targetPlayer] then
        if ESPObjects[targetPlayer].Highlight then
            ESPObjects[targetPlayer].Highlight:Destroy()
        end
        if ESPObjects[targetPlayer].Billboard then
            ESPObjects[targetPlayer].Billboard:Destroy()
        end
        ESPObjects[targetPlayer] = nil
    end

    if TracerLines[targetPlayer] then
        TracerLines[targetPlayer]:Remove()
        TracerLines[targetPlayer] = nil
    end

    if Box3DObjects[targetPlayer] then
        for _, line in ipairs(Box3DObjects[targetPlayer]) do
            if line then
                line:Remove()
            end
        end
        Box3DObjects[targetPlayer] = nil
    end
end

-- Функция создания ESP с 3D боксами
local function CreatePlayerESP(targetPlayer)
    if targetPlayer == player then return end
    if IsTeammate(targetPlayer) and not ESPConfig.ShowTeammates then return end

    ClearPlayerESP(targetPlayer)
    if not targetPlayer.Character then return end

    local character = targetPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if not rootPart then return end

    local espGroup = {}
    local isTeammate = IsTeammate(targetPlayer)
    local fillColor = isTeammate and ESPConfig.TeammateColor or ESPConfig.EnemyColor

    -- Box ESP
    if ESPConfig.Boxes then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = fillColor
        highlight.OutlineColor = ESPConfig.OutlineColor
        highlight.FillTransparency = ESPConfig.FillTransparency
        highlight.Adornee = character
        highlight.Parent = character
        espGroup.Highlight = highlight
    end

    -- Text Label
    if ESPConfig.Names or ESPConfig.Health or ESPConfig.Distance then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_" .. targetPlayer.Name
        billboard.AlwaysOnTop = true
        billboard.ExtentsOffset = Vector3.new(0, 3, 0)
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.Adornee = rootPart
        billboard.Parent = rootPart
        
        local textLabel = Instance.new("TextLabel")
        textLabel.BackgroundTransparency = 1
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.TextColor3 = ESPConfig.TextColor
        textLabel.TextSize = ESPConfig.TextSize
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextStrokeTransparency = 0
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        textLabel.Parent = billboard
        espGroup.Billboard = billboard
        espGroup.TextLabel = textLabel
    end

    -- Трассеры
    if ESPConfig.Tracers and (not isTeammate or ESPConfig.TracersForTeammates) then
        local tracer = Drawing.new("Line")
        tracer.Visible = false
        tracer.Color = isTeammate and ESPConfig.TeammateColor or ESPConfig.TracerColor
        tracer.Thickness = ESPConfig.TracerThickness
        TracerLines[targetPlayer] = tracer
    end

    -- 3D Box ESP
    if ESPConfig.Box3DEnabled then
        local boxLines = {}
        for i = 1, 12 do
            local line = Drawing.new("Line")
            line.Visible = false
            line.Color = ESPConfig.Box3DColor
            line.Thickness = ESPConfig.Box3DThickness
            table.insert(boxLines, line)
        end
        Box3DObjects[targetPlayer] = boxLines
    end

    ESPObjects[targetPlayer] = espGroup

    -- Обработчики событий
    if character then
        character.AncestryChanged:Connect(function(_, parent)
            if not parent then ClearPlayerESP(targetPlayer) end
        end)
    end

    if humanoid then
        humanoid.Died:Connect(function()
            if not ESPConfig.ShowDead then
                ClearPlayerESP(targetPlayer)
            end
        end)
    end

    targetPlayer.CharacterAdded:Connect(function(newCharacter)
        task.wait(2)
        if ESPConfig.Enabled then
            CreatePlayerESP(targetPlayer)
        end
    end)
end

-- Обновление текста ESP
local function UpdateESPText()
    for targetPlayer, espGroup in pairs(ESPObjects) do
        if espGroup.TextLabel and targetPlayer.Character then
            local character = targetPlayer.Character
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local rootPart = character:FindFirstChild("HumanoidRootPart")

            if rootPart and espGroup.Billboard and espGroup.Billboard.Parent then
                local isDead = humanoid and humanoid.Health <= 0
                local isTeammate = IsTeammate(targetPlayer)
                local text = ""

                if ESPConfig.Names then
                    text = text .. targetPlayer.Name .. (isDead and " 💀" or "") .. "\n"
                end

                if not isDead or ESPConfig.ShowDead then
                    if ESPConfig.Health and humanoid then
                        text = text .. (isDead and "💀 МЕРТВ\n" or "❤ " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth) .. "\n")
                    end

                    if ESPConfig.Distance and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local localRoot = player.Character.HumanoidRootPart
                        if localRoot then
                            local distance = (localRoot.Position - rootPart.Position).Magnitude
                            text = text .. "📏 " .. math.floor(distance) .. "m"
                        end
                    end
                end

                local fillColor = isTeammate and ESPConfig.TeammateColor or ESPConfig.EnemyColor
                if isDead then
                    espGroup.TextLabel.TextColor3 = ESPConfig.DeadColor
                    if espGroup.Highlight then
                        espGroup.Highlight.FillColor = ESPConfig.DeadColor
                    end
                else
                    espGroup.TextLabel.TextColor3 = ESPConfig.TextColor
                    if espGroup.Highlight then
                        espGroup.Highlight.FillColor = fillColor
                    end
                end

                espGroup.TextLabel.Text = text
            end
        end
    end
end

-- Обновление трассеров
local function UpdateTracers()
    if not ESPConfig.Enabled or not ESPConfig.Tracers then return end

    local camera = workspace.CurrentCamera

    for targetPlayer, tracer in pairs(TracerLines) do
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = targetPlayer.Character.HumanoidRootPart
            local isDead = humanoid and humanoid.Health <= 0
            local isTeammate = IsTeammate(targetPlayer)

            if isDead and not ESPConfig.ShowDead then
                tracer.Visible = false
                continue
            end

            local screenPos, onScreen = camera:WorldToViewportPoint(rootPart.Position)

            if onScreen then
                tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                tracer.Visible = true
                tracer.Color = isTeammate and ESPConfig.TeammateColor or ESPConfig.TracerColor
            else
                tracer.Visible = false
            end
        else
            tracer.Visible = false
        end
    end
end

-- Функция обновления 3D Box ESP
local function UpdateBox3DESP()
    if not ESPConfig.Enabled or not ESPConfig.Box3DEnabled then return end

    local camera = workspace.CurrentCamera

    for targetPlayer, lines in pairs(Box3DObjects) do
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = targetPlayer.Character.HumanoidRootPart
            local head = targetPlayer.Character:FindFirstChild("Head")

            if not humanoid or not rootPart or not head then
                for _, line in ipairs(lines) do
                    line.Visible = false
                end
                continue
            end

            local isDead = humanoid.Health <= 0
            if isDead and not ESPConfig.ShowDead then
                for _, line in ipairs(lines) do
                    line.Visible = false
                end
                continue
            end

            -- Создаем 3D коробку вокруг игрока
            local size = Vector3.new(3, 5, 3) * ESPConfig.Box3DSize
            local corners = {
                rootPart.Position + Vector3.new(-size.X/2, -size.Y/2, -size.Z/2),
                rootPart.Position + Vector3.new(size.X/2, -size.Y/2, -size.Z/2),
                rootPart.Position + Vector3.new(size.X/2, size.Y/2, -size.Z/2),
                rootPart.Position + Vector3.new(-size.X/2, size.Y/2, -size.Z/2),
                rootPart.Position + Vector3.new(-size.X/2, -size.Y/2, size.Z/2),
                rootPart.Position + Vector3.new(size.X/2, -size.Y/2, size.Z/2),
                rootPart.Position + Vector3.new(size.X/2, size.Y/2, size.Z/2),
                rootPart.Position + Vector3.new(-size.X/2, size.Y/2, size.Z/2)
            }

            -- Преобразуем углы в 2D координаты
            local screenCorners = {}
            local allVisible = true

            for i, corner in ipairs(corners) do
                local screenPos, visible = camera:WorldToViewportPoint(corner)
                screenCorners[i] = Vector2.new(screenPos.X, screenPos.Y)
                if not visible then allVisible = false end
            end

            if not allVisible then
                for _, line in ipairs(lines) do
                    line.Visible = false
                end
                continue
            end

            -- Рисуем линии коробки
            local connections = {
                {1, 2}, {2, 3}, {3, 4}, {4, 1}, -- нижний квадрат
                {5, 6}, {6, 7}, {7, 8}, {8, 5}, -- верхний квадрат  
                {1, 5}, {2, 6}, {3, 7}, {4, 8}  -- вертикальные линии
            }

            for i, connection in ipairs(connections) do
                if lines[i] then
                    lines[i].From = screenCorners[connection[1]]
                    lines[i].To = screenCorners[connection[2]]
                    lines[i].Visible = true
                    lines[i].Color = isDead and ESPConfig.DeadColor or ESPConfig.Box3DColor
                    lines[i].Thickness = ESPConfig.Box3DThickness
                end
            end
        else
            for _, line in ipairs(lines) do
                line.Visible = false
            end
        end
    end
end

-- Полное обновление ESP
local function UpdateESP()
    for targetPlayer, _ in pairs(ESPObjects) do
        ClearPlayerESP(targetPlayer)
    end

    if not ESPConfig.Enabled then return end
    
    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer ~= player then
            CreatePlayerESP(targetPlayer)
        end
    end
end

-- Инициализация ESP
local function InitializeESPHandlers()
    Players.PlayerAdded:Connect(function(targetPlayer)
        if ESPConfig.Enabled then
            task.wait(2)
            CreatePlayerESP(targetPlayer)
        end
    end)

    Players.PlayerRemoving:Connect(function(targetPlayer)
        ClearPlayerESP(targetPlayer)
    end)

    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer ~= player and ESPConfig.Enabled then
            task.wait(0.2)
            CreatePlayerESP(targetPlayer)
        end
    end
end

-- Цикл обновления ESP
task.spawn(function()
    while task.wait(ESPConfig.UpdateFrequency) do
        if ESPConfig.Enabled then
            pcall(function()
                UpdateESPText()
                UpdateTracers()
                if ESPConfig.Box3DEnabled then
                    UpdateBox3DESP()
                end
            end)
        end
    end
end)

-- Элементы управления ESP
ESPLeftSection:AddToggle({
	Name = "👁️ ВКЛ/ВЫКЛ ESP",
	Default = false,
	Callback = function(value)
		ESPConfig.Enabled = value
		if value then
			InitializeESPHandlers()
			Notifier.new({
				Title = "👁️ ESP ВКЛЮЧЁН",
				Content = "Все функции ESP активированы",
				Duration = 3,
                Icon = "rbxassetid://120245531583106"
			})
		else
			for targetPlayer, _ in pairs(ESPObjects) do
				ClearPlayerESP(targetPlayer)
			end
			Notifier.new({
				Title = "👀 ESP ВЫКЛЮЧЕН",
				Content = "ESP деактивирован",
				Duration = 2,
                Icon = "rbxassetid://120245531583106"
			})
		end
	end
})

ESPRightSection:AddToggle({
	Name = "👥 Игнорировать команду",
	Default = true,
	Callback = function(value)
		ESPConfig.TeamCheck = value
		UpdateESP()
	end
})

ESPRightSection:AddToggle({
	Name = "💚 Показывать тиммейтов",
	Default = true,
	Callback = function(value)
		ESPConfig.ShowTeammates = value
		UpdateESP()
	end
})

ESPLeftSection:AddToggle({
	Name = "🟦 Рамки",
	Default = true,
	Callback = function(value)
		ESPConfig.Boxes = value
		UpdateESP()
	end
})

ESPLeftSection:AddToggle({
	Name = "📛 Имена", 
	Default = true,
	Callback = function(value)
		ESPConfig.Names = value
		UpdateESP()
	end
})

ESPLeftSection:AddToggle({
	Name = "❤ Здоровье",
	Default = true,
	Callback = function(value)
		ESPConfig.Health = value
		UpdateESP()
	end
})

ESPLeftSection:AddToggle({
	Name = "📏 Расстояние",
	Default = true,
	Callback = function(value)
		ESPConfig.Distance = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddToggle({
	Name = "➖ Трассеры",
	Default = true,
	Callback = function(value)
		ESPConfig.Tracers = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddToggle({
	Name = "🧵 Трассеры для тиммейтов",
	Default = false,
	Callback = function(value)
		ESPConfig.TracersForTeammates = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddToggle({
	Name = "💀 Показывать мертвых",
	Default = true,
	Callback = function(value)
		ESPConfig.ShowDead = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddToggle({
	Name = "🎯 3D Box ESP",
	Default = true,
	Callback = function(value)
		ESPConfig.Box3DEnabled = value
		if not value then
			for targetPlayer, lines in pairs(Box3DObjects) do
				for _, line in ipairs(lines) do
					line:Remove()
				end
			end
			Box3DObjects = {}
		else
			UpdateESP()
		end
	end
})

-- Цвета ESP
ESPRightSection:AddColorPicker({
	Name = "🔴 Цвет врагов",
	Default = ESPConfig.EnemyColor,
	Callback = function(value)
		ESPConfig.EnemyColor = value
		UpdateESP()
	end
})

ESPRightSection:AddColorPicker({
	Name = "💚 Цвет тиммейтов",
	Default = ESPConfig.TeammateColor,
	Callback = function(value)
		ESPConfig.TeammateColor = value
		UpdateESP()
	end
})

ESPRightSection:AddColorPicker({
	Name = "💀 Цвет мертвых",
	Default = ESPConfig.DeadColor,
	Callback = function(value)
		ESPConfig.DeadColor = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddColorPicker({
	Name = "🎯 Цвет 3D Box",
	Default = ESPConfig.Box3DColor,
	Callback = function(value)
		ESPConfig.Box3DColor = value
		for targetPlayer, lines in pairs(Box3DObjects) do
			for _, line in ipairs(lines) do
				line.Color = value
			end
		end
	end
})

-- Дополнительные настройки
ESPAdvancedSection:AddSlider({
	Name = "🔢 Размер текста",
	Min = 8,
	Max = 24,
	Default = 14,
	Round = 1,
	Callback = function(value)
		ESPConfig.TextSize = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddSlider({
	Name = "🌫️ Прозрачность",
	Min = 0,
	Max = 1,
	Default = 0.5,
	Round = 1,
	Callback = function(value)
		ESPConfig.FillTransparency = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddSlider({
	Name = "📏 Толщина линий",
	Min = 1,
	Max = 5,
	Default = 1,
	Round = 1,
	Callback = function(value)
		ESPConfig.TracerThickness = value
		UpdateESP()
	end
})

ESPAdvancedSection:AddSlider({
	Name = "🎯 Толщина 3D Box",
	Min = 1,
	Max = 5,
	Default = 1,
	Round = 1,
	Callback = function(value)
		ESPConfig.Box3DThickness = value
		for targetPlayer, lines in pairs(Box3DObjects) do
			for _, line in ipairs(lines) do
				line.Thickness = value
			end
		end
	end
})

ESPAdvancedSection:AddSlider({
	Name = "📐 Размер 3D Box",
	Min = 0.5,
	Max = 5.0,
	Default = 2.0,
	Round = 1,
	Callback = function(value)
		ESPConfig.Box3DSize = value
	end
})

ESPAdvancedSection:AddSlider({
	Name = "⚡ Частота обновления",
	Min = 0.02,
	Max = 0.1,
	Default = 0.05,
	Round = 2,
	Callback = function(value)
		ESPConfig.UpdateFrequency = value
	end
})

--[[
    ==============================
    ТЕЛЕПОРТ СИСТЕМА - РАБОЧИЙ ФУНКЦИОНАЛ
    ==============================
]]--
local TeleportLeftSection = TeleportTab:DrawSection({
	Name = "🌀 Управление телепортом",
	Position = "left"
})

local TeleportRightSection = TeleportTab:DrawSection({
	Name = "👥 Список игроков",
	Position = "right"
})

local LocalPlayer = Players.LocalPlayer
local selectedPlayer = nil
local autoTp = false

-- Функция безопасной телепортации
local function TeleportToPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer:IsA("Player") then
        Notifier.new({ 
            Title = "❌ Ошибка", 
            Content = "Неверный игрок", 
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
        return
    end
    local myChar = LocalPlayer.Character
    local targetChar = targetPlayer.Character
    if myChar and targetChar then
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if myRoot and targetRoot then
            myRoot.CFrame = targetRoot.CFrame
            Notifier.new({ 
                Title = "✅ Успех", 
                Content = "Телепортирован к " .. targetPlayer.Name, 
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
        end
    end
end

-- Получаем список игроков
local playerOptions = {}
for _, pl in ipairs(Players:GetPlayers()) do
    if pl ~= LocalPlayer then
        table.insert(playerOptions, pl.Name)
    end
end

TeleportRightSection:AddDropdown({
	Name = "Выберите игрока",
	Default = playerOptions[1] or "",
	Values = playerOptions,
	Callback = function(option)
		selectedPlayer = nil
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl.Name == option then
				selectedPlayer = pl
				break
			end
		end
		if selectedPlayer then
			Notifier.new({
				Title = "Выбран игрок",
				Content = selectedPlayer.Name,
				Duration = 1.5,
                Icon = "rbxassetid://120245531583106"
			})
		end
	end
})

TeleportLeftSection:AddButton({
	Name = "🚀 Телепорт к выбранному",
	Callback = function()
		if not selectedPlayer then
			Notifier.new({ 
                Title = "❗ Внимание", 
                Content = "Сначала выберите игрока", 
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
			return
		end
		TeleportToPlayer(selectedPlayer)
	end
})

TeleportLeftSection:AddToggle({
	Name = "⚡ Авто-телепорт",
	Default = false,
	Callback = function(value)
		autoTp = value
		if value and selectedPlayer then
			Notifier.new({ 
                Title = "⚡ Авто-ТП ВКЛ", 
                Content = "Слежение за " .. selectedPlayer.Name, 
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
		elseif not value then
			Notifier.new({ 
                Title = "⚡ Авто-ТП ВЫКЛ", 
                Content = "Остановлено", 
                Duration = 2,
                Icon = "rbxassetid://120245531583106"
            })
		end
	end
})

--[[
    ==============================
    KILL ALL СИСТЕМА - РАБОЧИЙ ФУНКЦИОНАЛ
    ==============================
]]--
local KillAllLeftSection = KillAllTab:DrawSection({
	Name = "⚔️ Управление Kill All",
	Position = "left"
})

local KillAllRightSection = KillAllTab:DrawSection({
	Name = "⚙️ Настройки Kill All",
	Position = "right"
})

local safeZoneRadius = 20
local isActive = false
local killAllEnabled = true
local ignoreTeam = true

KillAllLeftSection:AddToggle({
	Name = "🛡️ Включить Safe Zone",
	Default = false,
	Callback = function(Value)
		isActive = Value
        Notifier.new({
            Title = Value and "🛡️ Safe Zone ВКЛ" or "🛡️ Safe Zone ВЫКЛ",
            Content = Value and "Безопасная зона активирована" or "Безопасная зона деактивирована",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
	end
})

KillAllLeftSection:AddToggle({
	Name = "⚔️ Режим Kill All",
	Default = true,
	Callback = function(Value)
		killAllEnabled = Value
        Notifier.new({
            Title = Value and "⚔️ Kill All ВКЛ" or "⚔️ Kill All ВЫКЛ",
            Content = Value and "Режим убийства активирован" or "Режим убийства деактивирован",
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
	end
})

KillAllRightSection:AddToggle({
	Name = "👥 Игнорировать команду",
	Default = true,
	Callback = function(Value)
		ignoreTeam = Value
	end
})

KillAllRightSection:AddSlider({
	Name = "📏 Радиус безопасной зоны",
	Min = 5,
	Max = 100,
	Default = 20,
	Round = 0,
	Callback = function(Value)
		safeZoneRadius = Value
        Notifier.new({
            Title = "📏 Радиус обновлен",
            Content = "Новый радиус: " .. Value,
            Duration = 2,
            Icon = "rbxassetid://120245531583106"
        })
	end
})

--[[
    ==============================
    ВКЛАДКА ХАБОВ - ПОЛНЫЙ ФУНКЦИОНАЛ
    ==============================
]]--
local HubsLeftSection = HubsTab:DrawSection({
	Name = "🎮 Популярные хабы",
	Position = "left"
})

local HubsRightSection = HubsTab:DrawSection({
	Name = "🚀 Дополнительные хабы", 
	Position = "right"
})

-- Все хабы из Elite Hub
local hubScripts = {
	{"🎮 Ghub V15", "https://raw.githubusercontent.com/gclich/GHUBV15_X_ZENXOS-MAINLOADER/refs/heads/main/GHUB-X-ZENXOS-V15.txt"},
	{"❄️ Blizzard Hub V2", "https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/Blizzard-Hub-Official/main/Blizzard%20Hub%20V2.lua"},
	{"🎯 Game Hub", "https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader"},
	{"🐯 Tiger X", "https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed"},
	{"🎨 Bido Skins V1.8", "https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.8"},
	{"🌀 Draught Hub V5", "https://raw.githubusercontent.com/SabrXH/Draught-Hub-V5/refs/heads/main/Script.lua"},
	{"🍊 OrangeX Hub", "https://raw.githubusercontent.com/ImJosh66/Ab2rW/main/ORANGEX%20V5%20RELEASED%20ORANGEX%20ON%20TOP%20.txt"},
	{"💪 GigaChad Hub V7", "https://raw.githubusercontent.com/LolPrivate/Side/main/Gigachad%20Hub%20V7.lua"},
	{"👻 Ghost Hub", "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"},
	{"⚡ Nullware Hub V3", "https://raw.githubusercontent.com/M6HqVBcddw2qaN4s/2d722888a388017c18028cd434c43a25/raw/dcccf1027fe4b90780e47767aaf584389c9d7771/EULma3fU90PUOKUn"},
	{"🔧 Haxker_6666666 Hub", "https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/loader"},
	{"🌙 Moon UI", "https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10"},
	{"💪 GigaChad Hub v3.5", "https://raw.githubusercontent.com/OWJBWKQLAISH/GigaChad-Hub/main/Version%20V3.5"},
	{"🚀 Frixon Hub", "https://raw.githubusercontent.com/RedoGaming/459eb467f3df927b07ca398a68f3b053/raw/6d1f7a2c8fefd072dc53ebbbec38c6f93c7de1ad/Frixon%2520Hub"},
	{"💎 Mega Hub", "https://raw.githubusercontent.com/WholeF00ds/Mega/main/Obfuscated%20Loader"},
	{"🔰 Mini Hub", "https://raw.githubusercontent.com/MiniNoobie/MINI-HUB-V2/main/FINALLY%20UPDATED%20MINI%20HUB"},
	{"🎨 Davi GUI", "https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua"},
	{"🅱️ B Hub", "https://raw.githubusercontent.com/YourLocalNzi/Ye/main/BHob6"},
	{"👑 Legon X", "https://raw.githubusercontent.com/YellowGreg/Loadstring/main/LegonX"},
	{"🌊 Orca Hub", "https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"},
	{"🎯 AirHub (Aimbot/ESP)", "https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"},
	{"🔫 Parvus Hub (Shooter)", "https://raw.githubusercontent.com/AlexR32/Parvus/main/Parvus.lua"},
	{"🌟 Comet Hub", "https://raw.githubusercontent.com/AokijiFlame/Hubs/Squid/CometHub.lua"},
	{"🏠 CarpetHack Hub", "https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"},
	{"⚡ Vynixu Hub", "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"}
}

-- Распределяем хабы по секциям
for i, hub in ipairs(hubScripts) do
	if i <= 13 then
		HubsLeftSection:AddButton({
			Name = hub[1],
			Callback = function()
				LoadScript(hub[1], hub[2])
			end
		})
	else
		HubsRightSection:AddButton({
			Name = hub[1],
			Callback = function()
				LoadScript(hub[1], hub[2])
			end
		})
	end
end

--[[
    ==============================
    ВКЛАДКА FE СКРИПТЫ - ПОЛНЫЙ ФУНКЦИОНАЛ
    ==============================
]]--
local FELeftSection = FEScriptsTab:DrawSection({
	Name = "🎭 Основные FE скрипты",
	Position = "left"
})

local FERightSection = FEScriptsTab:DrawSection({
	Name = "✨ FE Эффекты и анимации",
	Position = "right"
})

-- Все FE скрипты из Elite Hub
local feScripts = {
	-- Основные FE
	{"🥊 Fe Punch (R15/R6)", "https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"},
	{"🐱 Fe Neko (R6 only)", "https://raw.githubusercontent.com/Gazer-Ha/Neko-v1/main/Extremely%20Broken"},
	{"⚔️ Fe Ender (R6 only)", "https://pastebin.com/raw/9BtJhHrp"},
	{"🌀 Fe Glios (R6 only)", "https://glot.io/snippets/gua2ntmbdm/raw/main.lua"},
	{"💨 Fe Gale Fighter (R6 only)", "https://pastebin.com/raw/XPGSMEw9"},
	{"💃 Fe Griddy (R6 only)", "https://raw.githubusercontent.com/MelonsStuff/hub/main/Griddy.txt"},
	{"👊 Fe KJ (R6 only)", "https://pastefy.app/sdAujywd/raw"},
	{"🔮 Fe Caducus (R6 only)", "https://pastebin.com/raw/LDL9AyQ4"},
	{"⚡ Fe Sonic (R6 only)", "https://pastebin.com/raw/uacVtsWe"},
	{"😢 Fe Sad Boy (R6 only)", "https://pastebin.com/raw/hgPJbwF0"},
	
	-- FE Утилиты
	{"👨‍💼 Fe G-Man (R6 only)", "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty18.lua"},
	{"🚗 Fe Car (R15/R6)", "https://raw.githubusercontent.com/AlexCr4sh/FeScripts/main/FeCarScript.lua"},
	{"🥊 Fe Fighter (R6 only)", "https://rawscripts.net/raw/Universal-Script-FE-Fighter-inspired-by-Gale-21557"},
	{"🤗 Fe Hug (All Games)", "https://rawscripts.net/raw/Universal-Script-Hug-Gui-R6-17818"},
	{"👑 Fe Honored (R6 only)", "https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Honored.lua"},
	{"👻 Fe Invisible (All Games)", "https://pastebin.com/raw/3Rnd9rHf"},
	{"🤖 Fe NPC Control (R6 only)", "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty13.lua"},
	{"🌀 Fe Telekinesis V5", "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty11.lua"},
	{"🎨 Fe Tool Draw", "https://raw.githubusercontent.com/Affexter/Programs/refs/heads/main/scripts/tooldrawFE.lua"},
	{"🧟 Fe Zombie (R6/R15)", "https://pastefy.app/w7KnPY70/raw"},
	
	-- FE Эффекты
	{"🕳️ Fe Blackhole", "https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"},
	{"🌀 Fe Radius Blackhole", "https://pastebin.com/raw/RkWYLL5t"},
	{"💍 Fe Super Ring V4", "https://rawscripts.net/raw/Natural-Disaster-Survival-Super-ring-V4-24296"},
	{"🔊 Fe Audio Spam", "https://pastebin.com/raw/kmXCTkBt"},
	{"⚔️ Fe Goner Divine Edge (R6 only)", "https://pastebin.com/raw/sFf9MeBE"},
	{"💎 Fe Crystal Dance (R6 only)", "https://pastebin.com/raw/vT1URaRJ"},
	{"💪 Fe Jerk (R15/R6)", "https://pastefy.app/YZoglOyJ/raw"},
	
	-- FE Анимации
	{"👨 Fe Animation Man (R6 only)", "https://pastefy.app/ZWgckZdU/raw"},
	{"🕺 Fe R6 Animations (R6 only)", "https://raw.githubusercontent.com/ocfi/Animations-obfus/refs/heads/main/obfus"},
	{"👟 Fe Adidas Walk (R15)", "https://pastebin.com/raw/VFBVQ6zb"},
	{"🚶 Fe Animation Walk (R15)", "https://pastebin.com/raw/T7kdfUmG"},
	{"🕺 Fe Get Sturdy (Baseplate)", "https://pastebin.com/raw/xAHFn1hh"},
	{"🦸 Fe Superman (R15)", "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"},
	{"🎭 Fe Emotes (R15 only)", "https://pastebin.com/raw/eCpipCTH"}
}

-- Распределяем FE скрипты по секциям
for i, script in ipairs(feScripts) do
	if i <= 20 then
		FELeftSection:AddButton({
			Name = script[1],
			Callback = function()
				LoadScript(script[1], script[2])
			end
		})
	else
		FERightSection:AddButton({
			Name = script[1],
			Callback = function()
				LoadScript(script[1], script[2])
			end
		})
	end
end

--[[
    ==============================
    ВКЛАДКА GAME HUB - ПОЛНЫЙ ФУНКЦИОНАЛ
    ==============================
]]--
local GameHubLeftSection = GameHubTab:DrawSection({
	Name = "🎮 Game Hub",
	Position = "left"
})

local GameHubRightSection = GameHubTab:DrawSection({
	Name = "ℹ️ Информация",
	Position = "right"
})

GameHubLeftSection:AddButton({
	Name = "⚡ ЗАГРУЗИТЬ GAME HUB",
	Callback = function()
		Notifier.new({
			Title = "🎮 Загрузка Game Hub",
			Content = "Загрузка запущена...",
			Duration = 3,
            Icon = "rbxassetid://120245531583106"
		})
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader"))()
	end
})

GameHubRightSection:AddParagraph({
	Title = "🎮 Game Hub Information",
	Content = "Game Hub - мульти-игровой хаб от GamerScripter\n\nФункции:\n• Скрипты для различных игр\n• Авто-обновления\n• Удобный интерфейс\n\nСсылка: https://github.com/GamerScripter/Game-Hub"
})

GameHubRightSection:AddButton({
	Name = "📄 Посмотреть исходный код",
	Callback = function()
		setclipboard("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader")
		Notifier.new({
			Title = "📄 Ссылка скопирована",
			Content = "Ссылка на исходный код Game Hub скопирована в буфер обмена",
			Duration = 5,
            Icon = "rbxassetid://120245531583106"
		})
	end
})

--[[
    ==============================
    ВКЛАДКА СКРИПТОВ ДЛЯ ИГР - ПОЛНЫЙ ФУНКЦИОНАЛ
    ==============================
]]--
local GamesLeftSection = GameScriptsTab:DrawSection({
	Name = "🔥 Популярные игры",
	Position = "left"
})

local GamesRightSection = GameScriptsTab:DrawSection({
	Name = "🎮 Другие игры",
	Position = "right"
})

-- Все игровые скрипты из Elite Hub
local gameScripts = {
	-- Популярные игры
	{"⚔️ Blox Fruits", "https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlox%20Fruits%20Autofarm%20and%20ESP"},
	{"🏃 Brookhaven RP", "https://raw.githubusercontent.com/IceMael/NewIceHub/main/Brookhaven"},
	{"🐾 Adopt Me", "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Adopt-Me.lua"},
	{"🏝️ Islands", "https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"},
	{"🏭 Jailbreak", "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Jailbreak/Script.lua"},
	{"⚡ Arsenal", "https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"},
	{"🏃 Speed Run 4", "https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/Speed-Run-4"},
	{"🎮 Phantom Forces", "https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/main.lua"},
	{"🏰 Tower of Hell", "https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/TowerOfHell.lua"},
	{"🐝 Bee Swarm Simulator", "https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"},
	
	-- Симуляторы
	{"💪 Muscle Legends", "https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"},
	{"🐾 Pet Simulator X", "https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Main.lua"},
	{"💰 Mining Simulator 2", "https://raw.githubusercontent.com/Efe0626/MiningSimulator2/main/MiningSimulator2"},
	{"🏃 Speed Simulator", "https://raw.githubusercontent.com/AhmadV99/Speed-Simulator/main/Speed-Simulator.lua"},
	{"🍔 Restaurant Tycoon 2", "https://raw.githubusercontent.com/LOLking123456/Restaurant-Tycoon/main/Restaurant.lua"},
	
	-- Хоррор игры
	{"🚪 Doors", "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"},
	{"🏨 Apeirophobia", "https://raw.githubusercontent.com/Efe0626/Apeirophobia/main/Apeirophobia"},
	{"🎃 Piggy", "https://raw.githubusercontent.com/Efe0626/Piggy/main/Piggy"},
	{"🌲 The Mimic", "https://raw.githubusercontent.com/Efe0626/TheMimic/main/TheMimic"},
	
	-- Файтинг игры
	{"🔥 Combat Warriors", "https://raw.githubusercontent.com/Efe0626/CombatWarriors/main/CombatWarriors"},
	{"⚔️ Blade Ball", "https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Blade-Ball/main/Blade-Ball"},
	{"🥋 Anime Fighting Simulator", "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Anime-Fighting-Simulator.lua"},
	{"👊 The Strongest Battlegrounds", "https://raw.githubusercontent.com/AhmadV99/Script-Games/main/The-Strongest-Battlegrounds.lua"}
}

-- Распределяем игровые скрипты по секциям
for i, script in ipairs(gameScripts) do
	if i <= 15 then
		GamesLeftSection:AddButton({
			Name = script[1],
			Callback = function()
				LoadScript(script[1], script[2])
			end
		})
	else
		GamesRightSection:AddButton({
			Name = script[1],
			Callback = function()
				LoadScript(script[1], script[2])
			end
		})
	end
end

--[[
    ==============================
    ОБРАБОТЧИКИ СОБЫТИЙ - ВСЕ ФУНКЦИИ
    ==============================
]]--
-- Обработчик полета и ноклипа
RunService.Stepped:Connect(function()
    if noclipActive and player.Character then
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if flyActive and flyVelocity and player.Character then
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local input = UserInputService
        local newVelocity = Vector3.new(0, 0, 0)

        if input:IsKeyDown(Enum.KeyCode.W) then newVelocity = root.CFrame.LookVector * 50 end
        if input:IsKeyDown(Enum.KeyCode.S) then newVelocity = root.CFrame.LookVector * -50 end
        if input:IsKeyDown(Enum.KeyCode.A) then newVelocity = newVelocity - (root.CFrame.RightVector * 50) end
        if input:IsKeyDown(Enum.KeyCode.D) then newVelocity = newVelocity + (root.CFrame.RightVector * 50) end
        if input:IsKeyDown(Enum.KeyCode.Space) then newVelocity = newVelocity + Vector3.new(0, 50, 0) end
        if input:IsKeyDown(Enum.KeyCode.LeftShift) then newVelocity = newVelocity - Vector3.new(0, 50, 0) end

        if flyVelocity then
            flyVelocity.Velocity = newVelocity
        end
    end
end)

-- Kill All цикл
task.spawn(function()
    while task.wait(0.1) do
        local myChar = player.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then continue end

        local root = myChar.HumanoidRootPart

        if not isActive then continue end

        local tool = myChar:FindFirstChildOfClass("Tool")
        if not tool or not tool:FindFirstChild("Handle") then continue end

        for _, other in ipairs(Players:GetPlayers()) do
            if other ~= player and other.Character and other.Character:FindFirstChild("HumanoidRootPart") then
                if ignoreTeam and player.Team and other.Team and player.Team == other.Team then
                    continue
                end

                local oRoot = other.Character.HumanoidRootPart
                local dist = (oRoot.Position - root.Position).Magnitude

                local shouldAttack = killAllEnabled or (dist > safeZoneRadius)

                -- УВЕЛИЧЕННАЯ ДИСТАНЦИЯ ДО 10000
                if shouldAttack and dist <= 10000 then
                    tool:Activate()
                    for _, part in pairs(other.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            firetouchinterest(tool.Handle, part, 0)
                            firetouchinterest(tool.Handle, part, 1)
                        end
                    end
                end
            end
        end
    end
end)

-- Auto-TP цикл
task.spawn(function()
    while true do
        task.wait(0.12)
        if autoTp and selectedPlayer and Players:FindFirstChild(selectedPlayer.Name) then
            local myChar = LocalPlayer.Character
            local targetChar = selectedPlayer.Character
            if myChar and targetChar then
                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                if myRoot and targetRoot then
                    myRoot.CFrame = targetRoot.CFrame
                end
            end
        end
    end
end)

-- Обновление списка игроков при подключении/отключении
Players.PlayerAdded:Connect(function()
    -- Обновляем список в телепорте
    local newOptions = {}
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer then
            table.insert(newOptions, pl.Name)
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if selectedPlayer and selectedPlayer == player then
        selectedPlayer = nil
        autoTp = false
    end
end)

-- Финальное уведомление
Notifier.new({
	Title = "💜🎉 SHADOW PREDATOR ELITE HUB v2.0 ЗАГРУЖЕН! 🎉💜",
	Content = "🔥 Hasker Edition | Все функции включены 🔥\n⚔️💥 Улучшенный гибкий аимбот!\n🎯 9 типов приоритета целей!\n🤖 Гуманизатор и Anti-Aim!\n🔫 Компенсация отдачи и автокликер!\n\n🎭✨ FE скрипты: 40+\n🚀🌟 Универсальные хабы: 25+\n🎯🎮 Игровые скрипты: 25+\n👁️🎯 ESP с 3D Box включен!",
	Duration = 8,
    Icon = "rbxassetid://120245531583106"
})

print("🌟💎 ELITE HUB 12.6 HASKER успешно загружен! 💎🌟")
print("🎯 Улучшенный аимбот с 9 типами приоритета активирован!")
print("🤖 Гуманизатор и Anti-Aim функции добавлены!")
print("🔫 Автокликер и компенсация отдачи включены!")
print("👁️ ESP система с 3D Box активирована!")
print("🚀 Все хабы и скрипты готовы к использованию!")
