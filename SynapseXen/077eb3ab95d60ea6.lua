--[[
    ⚡ OUTLAST PANEL v2.0 MEGA PREMIUM ⚡
    Diseño ULTRA PREMIUM + Sistema Optimizado
    Compatible con: Synapse X, KRNL, Script-Ware, Fluxus, Xeno
]]

-- Loader Animado ULTRA PREMIUM
local function AnimatedLoader()
    local LoaderGui = Instance.new("ScreenGui")
    LoaderGui.Name = "LoaderGui"
    LoaderGui.Parent = game.CoreGui
    LoaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LoaderGui.ResetOnSpawn = false
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = LoaderGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -225, 0.5, -125)
    MainFrame.Size = UDim2.new(0, 450, 0, 250)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 25)
    corner.Parent = MainFrame
    
    -- Efecto de gradiente premium mejorado
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 12, 30)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(18, 18, 40)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(22, 22, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 35))
    })
    gradient.Rotation = 135
    gradient.Parent = MainFrame
    
    -- Borde neón animado con brillo
    local border = Instance.new("Frame")
    border.Name = "Border"
    border.Parent = MainFrame
    border.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
    border.BorderSizePixel = 0
    border.Size = UDim2.new(1, 0, 0, 5)
    border.Position = UDim2.new(0, 0, 0, 0)
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 25, 0, 0)
    borderCorner.Parent = border
    
    -- Glow effect mejorado
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Parent = MainFrame
    glow.BackgroundTransparency = 1
    glow.Size = UDim2.new(1, 60, 1, 60)
    glow.Position = UDim2.new(0, -30, 0, -30)
    glow.Image = "rbxassetid://8992238901"
    glow.ImageColor3 = Color3.fromRGB(0, 120, 255)
    glow.ImageTransparency = 0.85
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(100, 100, 100, 100)
    glow.ZIndex = 0
    
    -- Título principal con efecto neón
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0.1, 0)
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Font = Enum.Font.GothamBlack
    Title.Text = "⚡ OUTLAST PANEL v2.0 ⚡"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 28
    Title.TextStrokeTransparency = 0.4
    Title.TextStrokeColor3 = Color3.fromRGB(0, 170, 255)
    
    -- Subtítulo animado
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Parent = MainFrame
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 0, 0.35, 0)
    Subtitle.Size = UDim2.new(1, 0, 0, 30)
    Subtitle.Font = Enum.Font.GothamMedium
    Subtitle.Text = "Initializing ULTRA PREMIUM system..."
    Subtitle.TextColor3 = Color3.fromRGB(180, 230, 255)
    Subtitle.TextSize = 16
    
    -- Loading Bar premium mejorada
    local LoadingBarContainer = Instance.new("Frame")
    LoadingBarContainer.Name = "LoadingBarContainer"
    LoadingBarContainer.Parent = MainFrame
    LoadingBarContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    LoadingBarContainer.BorderSizePixel = 0
    LoadingBarContainer.Position = UDim2.new(0.1, 0, 0.6, 0)
    LoadingBarContainer.Size = UDim2.new(0.8, 0, 0, 25)
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(1, 0)
    containerCorner.Parent = LoadingBarContainer
    
    local LoadingBar = Instance.new("Frame")
    LoadingBar.Name = "LoadingBar"
    LoadingBar.Parent = LoadingBarContainer
    LoadingBar.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
    LoadingBar.BorderSizePixel = 0
    LoadingBar.Size = UDim2.new(0, 0, 1, 0)
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = LoadingBar
    
    -- Efecto de gradiente en la barra con animación
    local barGradient = Instance.new("UIGradient")
    barGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 210, 255)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 255, 220)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(120, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 180, 255))
    })
    barGradient.Rotation = 0
    barGradient.Parent = LoadingBar
    
    -- Texto de porcentaje con glow
    local PercentText = Instance.new("TextLabel")
    PercentText.Name = "PercentText"
    PercentText.Parent = MainFrame
    PercentText.BackgroundTransparency = 1
    PercentText.Position = UDim2.new(0.1, 0, 0.75, 0)
    PercentText.Size = UDim2.new(0.8, 0, 0, 30)
    PercentText.Font = Enum.Font.GothamBold
    PercentText.Text = "0%"
    PercentText.TextColor3 = Color3.fromRGB(255, 255, 255)
    PercentText.TextSize = 20
    PercentText.TextStrokeTransparency = 0.6
    PercentText.TextStrokeColor3 = Color3.fromRGB(0, 150, 255)
    
    -- Iconos animados premium mejorados
    local iconFrame = Instance.new("Frame")
    iconFrame.Name = "IconFrame"
    iconFrame.Parent = MainFrame
    iconFrame.BackgroundTransparency = 1
    iconFrame.Position = UDim2.new(0.87, 0, 0.6, 0)
    iconFrame.Size = UDim2.new(0, 50, 0, 25)
    
    local dots = {}
    for i = 1, 3 do
        local dot = Instance.new("Frame")
        dot.Name = "Dot" .. i
        dot.Parent = iconFrame
        dot.BackgroundColor3 = Color3.fromRGB(0, 230, 255)
        dot.BorderSizePixel = 0
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = UDim2.new(0, (i-1)*16, 0.5, -4)
        
        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = dot
        
        -- Glow effect para puntos
        local dotGlow = Instance.new("Frame")
        dotGlow.Name = "Glow"
        dotGlow.Parent = dot
        dotGlow.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        dotGlow.Size = UDim2.new(2.5, 0, 2.5, 0)
        dotGlow.Position = UDim2.new(-0.75, 0, -0.75, 0)
        dotGlow.BackgroundTransparency = 0.7
        dotGlow.ZIndex = -1
        
        local dotGlowCorner = Instance.new("UICorner")
        dotGlowCorner.CornerRadius = UDim.new(1, 0)
        dotGlowCorner.Parent = dotGlow
        
        table.insert(dots, dot)
    end
    
    -- Animación de carga premium mejorada
    spawn(function()
        local messages = {
            "Loading ULTRA PREMIUM system...",
            "Initializing bypass modules...",
            "Creating ultra interface...",
            "Setting up enhanced player system...",
            "Finalizing premium setup...",
            "Ready to dominate! 🚀"
        }
        
        for i = 1, 100 do
            LoadingBar.Size = UDim2.new(i/100, 0, 1, 0)
            PercentText.Text = i .. "%"
            
            -- Animar puntos con efecto de onda
            for idx, dot in ipairs(dots) do
                local t = tick() + idx * 0.3
                local scale = 1 + math.sin(t * 5) * 0.6
                dot.Size = UDim2.new(0, 8 * scale, 0, 8 * scale)
                dot.Position = UDim2.new(0, (idx-1)*16 + (4 - 4*scale), 0.5, -4 - (4*scale-4)/2)
                dot.BackgroundColor3 = Color3.fromHSV((t % 1), 0.9, 1)
            end
            
            -- Animación del gradiente de la barra
            barGradient.Rotation = (barGradient.Rotation + 1) % 360
            
            -- Cambiar mensajes progresivamente
            if i < 15 then
                Subtitle.Text = messages[1]
            elseif i < 30 then
                Subtitle.Text = messages[2]
            elseif i < 50 then
                Subtitle.Text = messages[3]
            elseif i < 70 then
                Subtitle.Text = messages[4]
            elseif i < 90 then
                Subtitle.Text = messages[5]
            else
                Subtitle.Text = messages[6]
            end
            
            wait(0.025)
        end
        
        -- Efecto final espectacular
        for i = 1, 25 do
            LoadingBar.BackgroundTransparency = i/25
            Title.TextStrokeTransparency = i/25
            wait(0.03)
        end
        
        -- Efecto de desvanecimiento suave con animación
        for i = 0, 1, 0.04 do
            MainFrame.BackgroundTransparency = i
            Title.TextTransparency = i
            Subtitle.TextTransparency = i
            PercentText.TextTransparency = i
            wait(0.015)
        end
        
        LoaderGui:Destroy()
    end)
    
    return LoaderGui
end

-- Ejecutar loader ultra premium
AnimatedLoader()
wait(2.5)

-- Variables principales
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- ============================================
-- SISTEMA DE PROTECCIÓN Y DETECCIÓN MEJORADO
-- ============================================

local SecuritySystem = {
    AntiKickActive = false,
    AntiCheatDetected = false,
    LastKickAttempt = 0,
    KickAttempts = 0,
    CheatDetectionWarnings = {},
    Protected = false,
    OriginalFunctions = {}
}

-- Detectar si hay anti-cheat
local function DetectAntiCheat()
    local possibleAntiCheats = {
        "Vanguard",
        "EasyAntiCheat",
        "Noclip",
        "Script",
        "Cheat",
        "AntiExploit",
        "AC",
        "Guard",
        "Shield",
        "Ban",
        "Kick",
        "Report"
    }
    
    local gameScripts = game:GetDescendants()
    local detected = false
    local cheatNames = {}
    
    for _, script in ipairs(gameScripts) do
        if script:IsA("LocalScript") or script:IsA("Script") then
            local scriptName = script.Name:lower()
            for _, cheatName in ipairs(possibleAntiCheats) do
                if scriptName:find(cheatName:lower()) then
                    if not table.find(cheatNames, cheatName) then
                        table.insert(cheatNames, cheatName)
                    end
                    detected = true
                end
            end
        end
    end
    
    -- Verificar CoreGui por scripts de anti-cheat
    for _, gui in ipairs(CoreGui:GetDescendants()) do
        if gui:IsA("ScreenGui") then
            local guiName = gui.Name:lower()
            for _, cheatName in ipairs(possibleAntiCheats) do
                if guiName:find(cheatName:lower()) then
                    if not table.find(cheatNames, cheatName) then
                        table.insert(cheatNames, cheatName)
                    end
                    detected = true
                end
            end
        end
    end
    
    if detected then
        SecuritySystem.AntiCheatDetected = true
        SecuritySystem.CheatDetectionWarnings = cheatNames
        return true, cheatNames
    end
    
    return false, {}
end

-- Notificación de detección de anti-cheat
local function ShowAntiCheatWarning(detectedCheats)
    local warningMessage = "⚠️ ANTI-CHEAT DETECTED!\n"
    warningMessage = warningMessage .. "Detected systems: " .. table.concat(detectedCheats, ", ") .. "\n\n"
    warningMessage = warningMessage .. "RECOMMENDATIONS:\n"
    warningMessage = warningMessage .. "1. Disable obvious functions\n"
    warningMessage = warningMessage .. "2. Use bypass system\n"
    warningMessage = warningMessage .. "3. Use with caution\n"
    warningMessage = warningMessage .. "4. Avoid spam functions\n\n"
    warningMessage = warningMessage .. "Security system: ACTIVE"
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🔴 SECURITY ALERT",
        Text = warningMessage,
        Duration = 10,
        Icon = "rbxassetid://4483345998"
    })
    
    warn("🔴 [SECURITY] Anti-Cheat detected: " .. table.concat(detectedCheats, ", "))
end

-- Sistema anti-kick mejorado
local function SetupAntiKick()
    -- Backups de funciones originales
    SecuritySystem.OriginalFunctions.Kick = LocalPlayer.Kick
    SecuritySystem.OriginalFunctions.Destroy = Instance.new("Part").Destroy
    
    -- Hookear la función Kick
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    
    if setreadonly then
        setreadonly(mt, false)
    end
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Detectar intentos de kick
        if method == "Kick" and tostring(self) == tostring(LocalPlayer) then
            SecuritySystem.LastKickAttempt = tick()
            SecuritySystem.KickAttempts = SecuritySystem.KickAttempts + 1
            
            -- Notificar al usuario
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "🛡️ ANTI-KICK ACTIVATED",
                Text = "Kick attempt blocked! Attempt #" .. SecuritySystem.KickAttempts,
                Duration = 5,
                Icon = "rbxassetid://4483345998"
            })
            
            warn("🛡️ [ANTI-KICK] Kick attempt blocked! Reason: " .. tostring(args[1] or "Unknown"))
            
            -- Simular que fuiste kickeado pero mantener en el juego
            spawn(function()
                local fakeGui = Instance.new("ScreenGui")
                fakeGui.Name = "FakeKickMessage"
                fakeGui.Parent = CoreGui
                fakeGui.ResetOnSpawn = false
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                frame.Parent = fakeGui
                
                local text = Instance.new("TextLabel")
                text.Size = UDim2.new(0.8, 0, 0.4, 0)
                text.Position = UDim2.new(0.1, 0, 0.3, 0)
                text.BackgroundTransparency = 1
                text.Text = "Kicked: " .. tostring(args[1] or "Unknown") .. "\n\n(Outlast Panel Anti-Kick Active)"
                text.TextColor3 = Color3.fromRGB(255, 50, 50)
                text.TextSize = 18
                text.Font = Enum.Font.GothamBold
                text.TextWrapped = true
                text.Parent = frame
                
                -- Remover después de 3 segundos
                wait(3)
                fakeGui:Destroy()
            end)
            
            return nil
        end
        
        return oldNamecall(self, ...)
    end)
    
    if setreadonly then
        setreadonly(mt, true)
    end
    
    -- Detectar mensajes de "You have been kicked"
    LocalPlayer.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageType, message)
        if messageType == 1 then -- Chat message
            local msg = tostring(message):lower()
            local kickKeywords = {
                "kick", "banned", "removed", "ejected", "expelled",
                "violation", "cheat", "exploit", "hack", "ban"
            }
            
            for _, keyword in ipairs(kickKeywords) do
                if msg:find(keyword) then
                    SecuritySystem.LastKickAttempt = tick()
                    SecuritySystem.KickAttempts = SecuritySystem.KickAttempts + 1
                    
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "🛡️ KICK WARNING",
                        Text = "Kick message detected: " .. string.sub(tostring(message), 1, 50),
                        Duration = 5,
                        Icon = "rbxassetid://4483345998"
                    })
                    
                    warn("🛡️ [KICK WARNING] Message: " .. tostring(message))
                    break
                end
            end
        end
    end)
    
    SecuritySystem.AntiKickActive = true
    SecuritySystem.Protected = true
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🛡️ ANTI-KICK SYSTEM",
        Text = "Advanced protection activated!\n" ..
               "Kick attempts will be blocked.\n" ..
               "Security status: ACTIVE",
        Duration = 5,
        Icon = "rbxassetid://4483345998"
    })
    
    warn("🛡️ [SECURITY] Anti-Kick system activated successfully!")
end

-- Sistema de monitoreo de seguridad
local function StartSecurityMonitoring()
    spawn(function()
        while true do
            -- Monitorear intentos de kick recientes
            if SecuritySystem.LastKickAttempt > 0 and tick() - SecuritySystem.LastKickAttempt < 30 then
                if not SecuritySystem.AntiKickActive then
                    SetupAntiKick()
                end
            end
            
            -- Monitorear anti-cheat periódicamente
            if tick() % 30 < 0.1 then -- Cada 30 segundos
                local detected, cheatNames = DetectAntiCheat()
                if detected and not SecuritySystem.AntiCheatDetected then
                    SecuritySystem.AntiCheatDetected = true
                    ShowAntiCheatWarning(cheatNames)
                end
            end
            
            wait(5)
        end
    end)
end

-- ============================================
-- DETECCIÓN DE CLICKS Y ATAQUES
-- ============================================

local ClickDetection = {
    LastClickTime = 0,
    ClickCount = 0,
    ClickSpamDetected = false,
    AttackLogs = {}
}

-- Detectar cuando alguien te hace click
local function SetupClickDetection()
    local function logAttack(attacker, weapon)
        local timestamp = os.date("%H:%M:%S")
        local logEntry = string.format("[%s] %s attacked you with %s", 
            timestamp, attacker, weapon or "Unknown")
        
        table.insert(ClickDetection.AttackLogs, 1, logEntry)
        if #ClickDetection.AttackLogs > 20 then
            table.remove(ClickDetection.AttackLogs, 21)
        end
        
        -- Notificación
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "⚠️ UNDER ATTACK",
            Text = attacker .. " is attacking you!\nWeapon: " .. (weapon or "Unknown"),
            Duration = 3,
            Icon = "rbxassetid://4483345998"
        })
        
        print("🔴 [ATTACK] " .. logEntry)
    end
    
    -- Detectar daño al personaje
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                if humanoid.Health < humanoid.MaxHealth then
                    -- Buscar al atacante más cercano
                    local closestPlayer = nil
                    local closestDistance = math.huge
                    
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            
                            if targetRoot and myRoot then
                                local distance = (targetRoot.Position - myRoot.Position).Magnitude
                                if distance < 50 and distance < closestDistance then
                                    closestDistance = distance
                                    closestPlayer = player
                                end
                            end
                        end
                    end
                    
                    if closestPlayer then
                        -- Verificar si tiene un arma/tool
                        local weapon = "Fist/Melee"
                        if closestPlayer.Character then
                            for _, tool in pairs(closestPlayer.Character:GetChildren()) do
                                if tool:IsA("Tool") then
                                    weapon = tool.Name
                                    break
                                end
                            end
                        end
                        
                        logAttack(closestPlayer.Name, weapon)
                    end
                end
            end)
        end
    end
    
    -- Detectar cuando el personaje muere
    LocalPlayer.CharacterAdded:Connect(function(character)
        wait(1)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "💀 YOU DIED",
                    Text = "You were killed! Check attack logs.",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
            end)
        end
    end)
    
    -- Sistema de detección de spam de clicks
    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
            local currentTime = tick()
            
            if currentTime - ClickDetection.LastClickTime < 0.1 then
                ClickDetection.ClickCount = ClickDetection.ClickCount + 1
                
                if ClickDetection.ClickCount > 10 then
                    ClickDetection.ClickSpamDetected = true
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "⚠️ CLICK SPAM DETECTED",
                        Text = "Possible auto-clicker detected!\nClicks: " .. ClickDetection.ClickCount .. "/sec",
                        Duration = 3,
                        Icon = "rbxassetid://4483345998"
                    })
                end
            else
                ClickDetection.ClickCount = 0
                ClickDetection.ClickSpamDetected = false
            end
            
            ClickDetection.LastClickTime = currentTime
        end
    end)
    
    print("🔵 [SECURITY] Click detection system activated")
end

-- Configuración mejorada del menú
local Config = {
    SuperJump = 150,
    SuperSpeed = 120,
    FlySpeed = 75,
    GodMode = false,
    Flying = false,
    NoClip = false,
    SelectedPlayer = nil,
    FlyConnection = nil,
    NoclipConnection = nil,
    MenuOpen = true,
    BypassEnabled = true,
    Spectating = false,
    OriginalCameraSubject = nil,
    InfiniteJump = false,
    AntiAfk = false,
    ForceField = false,
    KillAura = false,
    OneHitKill = false,
    Fullbright = false,
    Xray = false,
    Esp = false,
    Chams = false,
    ToxicMode = false,
    Aimbot = false,
    AimbotFOV = 50,
    AimbotSmoothness = 10,
    Wallhack = false,
    EspDistance = false,
    EspTracers = false,
    EspBoxes = false,
    AutoClicker = false,
    AntiKick = true,
    ClickDetection = true,
    SecurityMonitor = true
}

-- ============================================
-- SISTEMA DE GOD MODE MEJORADO PARA SHOOTERS
-- ============================================

local AdvancedGodMode = {
    Connections = {},
    OriginalValues = {},
    ProtectionActive = false
}

local function SetupAdvancedGodMode()
    local function EnableGodMode()
        if Config.GodMode and LocalPlayer.Character then
            local character = LocalPlayer.Character
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            
            if not humanoid then return end
            
            -- Guardar valores originales
            AdvancedGodMode.OriginalValues.MaxHealth = humanoid.MaxHealth
            AdvancedGodMode.OriginalValues.WalkSpeed = humanoid.WalkSpeed
            AdvancedGodMode.OriginalValues.JumpPower = humanoid.JumpPower
            
            -- 1. Sistema de regeneración instantánea
            if not AdvancedGodMode.Connections["HealthRegen"] then
                AdvancedGodMode.Connections["HealthRegen"] = RunService.Heartbeat:Connect(function()
                    if Config.GodMode and humanoid and humanoid.Parent then
                        pcall(function()
                            humanoid.MaxHealth = math.huge
                            humanoid.Health = math.huge
                        end)
                    end
                end)
            end
            
            -- 2. Protección contra headshots
            if not AdvancedGodMode.Connections["HeadProtection"] then
                spawn(function()
                    while Config.GodMode and character and character.Parent do
                        pcall(function()
                            -- Proteger cabeza
                            local head = character:FindFirstChild("Head")
                            if head then
                                head:SetNetworkOwner(nil)
                                head.Transparency = 0
                                head.CanCollide = false
                                head.CanTouch = false
                                head.CanQuery = false
                            end
                            
                            -- Proteger todas las partes
                            for _, part in pairs(character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part:SetNetworkOwner(nil)
                                    part.CanCollide = false
                                    part.CanTouch = false
                                    part.CanQuery = false
                                end
                            end
                        end)
                        wait(0.1)
                    end
                end)
            end
            
            -- 3. Anti-ragdoll system mejorado
            if not AdvancedGodMode.Connections["AntiRagdoll"] then
                AdvancedGodMode.Connections["AntiRagdoll"] = RunService.Heartbeat:Connect(function()
                    if Config.GodMode and humanoid and humanoid.Parent then
                        pcall(function()
                            humanoid.PlatformStand = false
                            humanoid.Sit = false
                            humanoid:ChangeState(Enum.HumanoidStateType.Running)
                            
                            -- Mantener posición vertical y estabilidad
                            local root = character:FindFirstChild("HumanoidRootPart")
                            if root then
                                root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                root.CFrame = CFrame.new(root.Position.X, root.Position.Y, root.Position.Z)
                            end
                        end)
                    end
                end)
            end
            
            -- 4. Cancelar animaciones de daño
            if not AdvancedGodMode.Connections["CancelDamageAnimations"] then
                AdvancedGodMode.Connections["CancelDamageAnimations"] = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                    if Config.GodMode then
                        pcall(function()
                            for _, animTrack in pairs(humanoid:GetPlayingAnimationTracks()) do
                                if animTrack.Name:lower():find("hurt") or 
                                   animTrack.Name:lower():find("death") or
                                   animTrack.Name:lower():find("stun") or
                                   animTrack.Name:lower():find("damage") then
                                    animTrack:Stop()
                                end
                            end
                        end)
                    end
                end)
            end
            
            -- 5. Auto-respawn mejorado si algo falla
            if not AdvancedGodMode.Connections["AutoRespawn"] then
                spawn(function()
                    while Config.GodMode do
                        if humanoid and humanoid.Health <= 0 then
                            pcall(function()
                                character:BreakJoints()
                                wait(0.3)
                                if character.Parent then
                                    character:Destroy()
                                end
                                wait(0.5)
                                local newChar = LocalPlayer.CharacterAdded:Wait()
                                wait(1)
                                EnableGodMode()
                            end)
                        end
                        wait(0.5)
                    end
                end)
            end
            
            AdvancedGodMode.ProtectionActive = true
            Notify("GOD MODE PRO", "Advanced protection ACTIVATED! (Shooter edition)")
        end
    end
    
    local function DisableGodMode()
        -- Desconectar todas las conexiones
        for name, connection in pairs(AdvancedGodMode.Connections) do
            if connection then
                pcall(function() connection:Disconnect() end)
            end
        end
        AdvancedGodMode.Connections = {}
        
        -- Restaurar valores originales
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                pcall(function()
                    humanoid.MaxHealth = AdvancedGodMode.OriginalValues.MaxHealth or 100
                    humanoid.Health = math.min(humanoid.Health, humanoid.MaxHealth)
                    humanoid.WalkSpeed = AdvancedGodMode.OriginalValues.WalkSpeed or 16
                    humanoid.JumpPower = AdvancedGodMode.OriginalValues.JumpPower or 50
                end)
            end
        end
        
        AdvancedGodMode.ProtectionActive = false
        Notify("GOD MODE PRO", "Advanced protection DEACTIVATED")
    end
    
    return {
        Enable = EnableGodMode,
        Disable = DisableGodMode
    }
end

local GodModeSystem = SetupAdvancedGodMode()

-- ============================================
-- SISTEMA DE AIMBOT MEJORADO (APUNTA A CABEZA)
-- ============================================

local AimbotConnection = nil
local function ToggleAimbot(state)
    if state then
        if AimbotConnection then AimbotConnection:Disconnect() end
        
        AimbotConnection = RunService.RenderStepped:Connect(function()
            if not Config.Aimbot or not LocalPlayer.Character then return end
            
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            local camera = workspace.CurrentCamera
            local nearestPlayer = nil
            local nearestDistance = Config.AimbotFOV
            
            -- Buscar jugador más cercano en FOV con prioridad
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local targetChar = player.Character
                    local targetHead = targetChar:FindFirstChild("Head")
                    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                    
                    if targetHead and targetRoot then
                        local screenPos, onScreen = camera:WorldToViewportPoint(targetHead.Position)
                        if onScreen then
                            local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                            if distance < nearestDistance then
                                nearestDistance = distance
                                nearestPlayer = player
                            end
                        end
                    end
                end
            end
            
            -- Apuntar a la cabeza del jugador más cercano
            if nearestPlayer and nearestPlayer.Character then
                local targetChar = nearestPlayer.Character
                local targetHead = targetChar:FindFirstChild("Head")
                
                if targetHead then
                    local camCFrame = camera.CFrame
                    local targetPos = targetHead.Position
                    local smoothness = Config.AimbotSmoothness
                    
                    -- Calcular dirección para apuntar a la cabeza
                    local direction = (targetPos - camCFrame.Position).Unit
                    local newCFrame = CFrame.new(camCFrame.Position, camCFrame.Position + direction)
                    
                    -- Smooth aiming mejorado
                    camera.CFrame = camCFrame:Lerp(newCFrame, 1/smoothness)
                    
                    -- Si tienes un arma equipada, disparar automáticamente
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool and tool:FindFirstChild("Handle") then
                        -- Simular clic para disparar con random delay
                        if math.random(1, 3) == 1 then
                            if tool:FindFirstChild("Click") then
                                tool.Click:FireServer()
                            elseif tool:FindFirstChild("Fire") then
                                tool.Fire:FireServer()
                            elseif tool:FindFirstChild("Shoot") then
                                tool.Shoot:FireServer()
                            end
                        end
                    end
                end
            end
        end)
        
        Notify("AIMBOT PRO", "Activated - Headshot mode! FOV: " .. Config.AimbotFOV, 2)
    else
        if AimbotConnection then
            AimbotConnection:Disconnect()
            AimbotConnection = nil
        end
        Notify("AIMBOT PRO", "Deactivated", 1)
    end
end

-- ============================================
-- SISTEMA DE TELEPORTACIÓN Y ACCIONES DE JUGADOR MEJORADO
-- ============================================

local function TeleportToPlayer(target)
    if not target or not target.Character then 
        Notify("ERROR", "Player not found or has no character")
        return false
    end
    
    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
    local myChar = LocalPlayer.Character
    if not targetHRP or not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
        Notify("ERROR", "Cannot teleport - missing body parts")
        return false
    end
    
    -- Método 1: CFrame directo
    pcall(function()
        myChar.HumanoidRootPart.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0)
    end)
    
    -- Método 2: Network ownership
    pcall(function()
        myChar.HumanoidRootPart.CFrame = targetHRP.CFrame
        wait(0.1)
        myChar.HumanoidRootPart.CFrame = targetHRP.CFrame
    end)
    
    Notify("TELEPORT", "Teleported to " .. target.Name)
    return true
end

local function BringPlayer(target)
    if not target or not target.Character then 
        Notify("ERROR", "Player not found or has no character")
        return false
    end
    
    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
    local myChar = LocalPlayer.Character
    if not targetHRP or not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
        Notify("ERROR", "Cannot bring - missing body parts")
        return false
    end
    
    local myPos = myChar.HumanoidRootPart.CFrame
    
    -- Método 1: CFrame directo
    pcall(function()
        targetHRP.CFrame = myPos + Vector3.new(0, 3, 0)
    end)
    
    -- Método 2: Network ownership
    pcall(function()
        targetHRP.CFrame = myPos + Vector3.new(0, 3, 0)
        wait(0.1)
        targetHRP.CFrame = myPos + Vector3.new(0, 3, 0)
    end)
    
    -- Método 3: Velocity approach
    pcall(function()
        targetHRP.Velocity = Vector3.new(0, 0, 0)
        targetHRP.RotVelocity = Vector3.new(0, 0, 0)
    end)
    
    Notify("BRING", "Brought " .. target.Name .. " to you")
    return true
end

-- Función para espectar jugadores MEJORADA
local function SpectatePlayer(player)
    if not player or not player.Character then
        Notify("ERROR", "Player not found or has no character")
        return
    end
    
    if Config.Spectating and Config.SelectedPlayer == player then
        -- Dejar de espectar
        Config.Spectating = false
        if Config.OriginalCameraSubject then
            workspace.CurrentCamera.CameraSubject = Config.OriginalCameraSubject
            Config.OriginalCameraSubject = nil
        else
            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
        end
        Config.SelectedPlayer = nil
        Notify("SPECTATE", "Stopped spectating " .. player.Name)
    else
        -- Empezar a espectar
        if Config.Spectating then
            Config.Spectating = false
            if Config.OriginalCameraSubject then
                workspace.CurrentCamera.CameraSubject = Config.OriginalCameraSubject
            end
        end
        
        Config.Spectating = true
        Config.SelectedPlayer = player
        Config.OriginalCameraSubject = workspace.CurrentCamera.CameraSubject
        workspace.CurrentCamera.CameraSubject = player.Character
        
        -- Sistema de seguimiento mejorado
        spawn(function()
            while Config.Spectating and Config.SelectedPlayer == player and player.Character do
                if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    workspace.CurrentCamera.CameraSubject = player.Character
                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(
                        player.Character:GetPrimaryPartCFrame() * CFrame.new(0, 5, 10),
                        0.1
                    )
                end
                wait(0.1)
            end
        end)
        
        Notify("SPECTATE", "Now spectating " .. player.Name)
    end
end

-- ============================================
-- SISTEMA DE KILL MEJORADO
-- ============================================

local function SetupBypass()
    local function KillPlayer(target)
        if not target or not target.Character then return false end
        
        local success = false
        local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
        local root = target.Character:FindFirstChild("HumanoidRootPart")
        
        -- Método 1: Daño directo
        if humanoid then
            pcall(function() 
                humanoid.Health = 0 
                humanoid:TakeDamage(999999)
            end)
            success = true
        end
        
        -- Método 2: BreakJoints
        pcall(function() 
            target.Character:BreakJoints() 
            success = true
        end)
        
        -- Método 3: TP al vacío
        if root then
            pcall(function() 
                root.CFrame = CFrame.new(0, -100000, 0) 
                success = true
            end)
        end
        
        -- Método 4: Destroy character
        pcall(function() 
            target.Character:Destroy() 
            success = true
        end)
        
        -- Método 5: Ragdoll force
        if humanoid and root then
            pcall(function()
                humanoid.PlatformStand = true
                root.Velocity = Vector3.new(0, 50000, 0)
                root.RotVelocity = Vector3.new(10000, 10000, 10000)
                success = true
            end)
        end
        
        if success then
            Notify("KILL", "Eliminated " .. target.Name)
        else
            Notify("WARNING", "Kill attempt on " .. target.Name)
        end
        
        return success
    end
    
    local function KillAllPlayers()
        local killed = 0
        local total = 0
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                total = total + 1
                if KillPlayer(player) then
                    killed = killed + 1
                end
                wait(0.2)
            end
        end
        
        return killed, total
    end
    
    return {
        Kill = KillPlayer,
        KillAll = KillAllPlayers,
        GodMode = function()
            if Config.GodMode then
                GodModeSystem.Enable()
            else
                GodModeSystem.Disable()
            end
        end
    }
end

local BypassSystem = SetupBypass()

-- Cache de instancias
local GuiElements = {
    ScreenGui = nil,
    MainFrame = nil,
    Indicators = {},
    EspObjects = {},
    WallhackParts = {}
}

-- Función de notificación mejorada ULTRA PREMIUM
local function Notify(title, text, duration)
    duration = duration or 3
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "⚡ " .. title,
        Text = text,
        Duration = duration,
        Icon = "rbxassetid://4483345998"
    })
end

-- Sistema de actualización de estado visual
local function UpdateButtonState(buttonName, isActive)
    if GuiElements.Indicators[buttonName] then
        local indicator = GuiElements.Indicators[buttonName]
        if isActive then
            indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
            indicator.Text = "ON"
            -- Efecto de brillo
            TweenService:Create(indicator, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
                Size = UDim2.new(0, 40, 0, 32)
            }):Play()
        else
            indicator.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            indicator.Text = "OFF"
        end
    end
end

-- ============================================
-- FUNCIONES DEL SISTEMA
-- ============================================

-- SISTEMA DE WALLHACK
local function ToggleWallhack(state)
    if state then
        spawn(function()
            while Config.Wallhack do
                pcall(function()
                    for _, part in pairs(Workspace:GetDescendants()) do
                        if part:IsA("BasePart") and part.Transparency < 0.5 then
                            if not GuiElements.WallhackParts[part] then
                                GuiElements.WallhackParts[part] = part.Transparency
                            end
                            part.Transparency = 0.7
                        end
                    end
                end)
                wait(1)
            end
        end)
        Notify("WALLHACK PRO", "Activated - See through walls!", 2)
    else
        pcall(function()
            for part, transparency in pairs(GuiElements.WallhackParts) do
                if part and part.Parent then
                    part.Transparency = transparency
                end
            end
            GuiElements.WallhackParts = {}
        end)
        Notify("WALLHACK PRO", "Deactivated", 1)
    end
end

-- SISTEMA DE ESP MEJORADO
local EspConnection = nil
local function ToggleEsp(state)
    if state then
        for _, obj in pairs(GuiElements.EspObjects) do
            if obj then obj:Destroy() end
        end
        GuiElements.EspObjects = {}
        
        EspConnection = RunService.RenderStepped:Connect(function()
            if not Config.Esp then
                if EspConnection then EspConnection:Disconnect() end
                return
            end
            
            for _, obj in pairs(GuiElements.EspObjects) do
                if obj then obj:Destroy() end
            end
            GuiElements.EspObjects = {}
            
            local camera = workspace.CurrentCamera
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid and root and humanoid.Health > 0 then
                        local screenPos, onScreen = camera:WorldToViewportPoint(root.Position)
                        
                        if onScreen then
                            local distance = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) 
                                and (root.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude or 0
                            
                            -- Texto ESP
                            local espText = Drawing.new("Text")
                            espText.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            espText.Color = Color3.fromRGB(0, 255, 255)
                            espText.Size = 14
                            espText.Outline = true
                            espText.OutlineColor = Color3.fromRGB(0, 0, 0)
                            espText.Position = Vector2.new(screenPos.X, screenPos.Y)
                            espText.Visible = true
                            espText.Center = true
                            
                            table.insert(GuiElements.EspObjects, espText)
                            
                            -- Tracers mejorados
                            if Config.EspTracers then
                                local tracer = Drawing.new("Line")
                                tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                                tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                                tracer.Color = Color3.fromRGB(255, 50, 50)
                                tracer.Thickness = 2
                                tracer.Visible = true
                                table.insert(GuiElements.EspObjects, tracer)
                            end
                            
                            -- Box ESP
                            if Config.EspBoxes then
                                local headPos, headOnScreen = camera:WorldToViewportPoint(player.Character:FindFirstChild("Head") and player.Character.Head.Position or root.Position)
                                if headOnScreen then
                                    local boxSize = Vector2.new(30, 50)
                                    local box = Drawing.new("Square")
                                    box.Position = Vector2.new(screenPos.X - boxSize.X/2, headPos.Y - 20)
                                    box.Size = boxSize
                                    box.Color = Color3.fromRGB(0, 255, 0)
                                    box.Thickness = 2
                                    box.Filled = false
                                    box.Visible = true
                                    table.insert(GuiElements.EspObjects, box)
                                end
                            end
                        end
                    end
                end
            end
        end)
        Notify("ESP PRO", "Activated with enhanced visuals", 2)
    else
        if EspConnection then
            EspConnection:Disconnect()
            EspConnection = nil
        end
        
        for _, obj in pairs(GuiElements.EspObjects) do
            if obj then obj:Destroy() end
        end
        GuiElements.EspObjects = {}
        Notify("ESP PRO", "Deactivated", 1)
    end
end

-- SISTEMA DE VUELO MEJORADO
local function ToggleFlying(state)
    if state then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            if Config.FlyConnection then Config.FlyConnection:Disconnect() end
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.Name = "FlyGyroBypass"
            bodyGyro.Parent = char.HumanoidRootPart
            bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bodyGyro.P = 20000
            bodyGyro.D = 1000
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Name = "FlyVelocityBypass"
            bodyVelocity.Parent = char.HumanoidRootPart
            bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bodyVelocity.P = 15000
            
            Config.FlyConnection = RunService.Heartbeat:Connect(function()
                if not Config.Flying or not char or not char:FindFirstChild("HumanoidRootPart") then
                    if Config.FlyConnection then Config.FlyConnection:Disconnect() end
                    return
                end
                
                local camera = workspace.CurrentCamera
                local rootPart = char.HumanoidRootPart
                bodyGyro.CFrame = camera.CFrame
                
                -- Sistema de vuelo suave con aceleración
                local velocity = Vector3.new(0, 0, 0)
                local speed = Config.FlySpeed
                
                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    velocity = velocity + (camera.CFrame.LookVector * speed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.S) then
                    velocity = velocity - (camera.CFrame.LookVector * speed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.A) then
                    velocity = velocity - (camera.CFrame.RightVector * speed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.D) then
                    velocity = velocity + (camera.CFrame.RightVector * speed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.Space) or UIS:IsKeyDown(Enum.KeyCode.E) then
                    velocity = velocity + Vector3.new(0, speed, 0)
                end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.LeftShift) or UIS:IsKeyDown(Enum.KeyCode.Q) then
                    velocity = velocity - Vector3.new(0, speed, 0)
                end
                
                bodyVelocity.Velocity = velocity
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Flying)
                end
            end)
            
            Notify("FLIGHT PRO", "Activated - WASD + Space/Q", 2)
        end
    else
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            for _, obj in pairs(char.HumanoidRootPart:GetChildren()) do
                if obj.Name == "FlyGyroBypass" or obj.Name == "FlyVelocityBypass" then
                    obj:Destroy()
                end
            end
        end
        
        if Config.FlyConnection then
            Config.FlyConnection:Disconnect()
            Config.FlyConnection = nil
        end
        Notify("FLIGHT PRO", "Deactivated", 1)
    end
end

-- Función para obtener jugador por nombre o ID
local function GetPlayerFromInput(input)
    local inputStr = tostring(input)
    local idNum = tonumber(inputStr)
    
    -- Buscar por UserId
    if idNum then
        for _, player in pairs(Players:GetPlayers()) do
            if player.UserId == idNum then
                return player
            end
        end
    end
    
    -- Buscar por nombre (case-insensitive, partial match)
    inputStr = inputStr:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower():find(inputStr, 1, true) then
            return player
        end
        if player.DisplayName:lower():find(inputStr, 1, true) then
            return player
        end
    end
    
    return nil
end

-- ============================================
-- INTERFAZ ULTRA PREMIUM (DISEÑO MEJORADO)
-- ============================================

-- Crear GUI ULTRA PREMIUM
local function CreateUltraPremiumGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OutlastPanelUltraPremium"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    GuiElements.ScreenGui = ScreenGui
    
    -- Marco principal con diseño ULTRA PREMIUM
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 24)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -400, 0.5, -350)
    MainFrame.Size = UDim2.new(0, 800, 0, 700)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    GuiElements.MainFrame = MainFrame
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 20)
    MainCorner.Parent = MainFrame
    
    -- Efecto de gradiente premium mejorado
    local mainGradient = Instance.new("UIGradient")
    mainGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 36)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(24, 24, 48)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(30, 30, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 22, 44))
    })
    mainGradient.Rotation = 135
    mainGradient.Parent = MainFrame
    
    -- Borde neón animado
    local border = Instance.new("Frame")
    border.Name = "Border"
    border.Parent = MainFrame
    border.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
    border.BorderSizePixel = 0
    border.Size = UDim2.new(1, 0, 0, 6)
    border.Position = UDim2.new(0, 0, 0, 0)
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 20, 0, 0)
    borderCorner.Parent = border
    
    -- Glow effect mejorado
    local glowEffect = Instance.new("ImageLabel")
    glowEffect.Name = "GlowEffect"
    glowEffect.Parent = MainFrame
    glowEffect.BackgroundTransparency = 1
    glowEffect.Size = UDim2.new(1, 80, 1, 80)
    glowEffect.Position = UDim2.new(0, -40, 0, -40)
    glowEffect.Image = "rbxassetid://8992238901"
    glowEffect.ImageColor3 = Color3.fromRGB(0, 120, 255)
    glowEffect.ImageTransparency = 0.88
    glowEffect.ScaleType = Enum.ScaleType.Slice
    glowEffect.SliceCenter = Rect.new(100, 100, 100, 100)
    glowEffect.ZIndex = 0
    
    -- Header premium mejorado
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = MainFrame
    Header.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
    Header.Size = UDim2.new(1, 0, 0, 80)
    Header.BorderSizePixel = 0
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 20, 0, 0)
    HeaderCorner.Parent = Header
    
    -- Gradiente header con efecto
    local headerGradient = Instance.new("UIGradient")
    headerGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 70)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 40, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 60))
    })
    headerGradient.Rotation = 90
    headerGradient.Parent = Header
    
    -- Logo y título mejorados
    local TitleContainer = Instance.new("Frame")
    TitleContainer.Name = "TitleContainer"
    TitleContainer.Parent = Header
    TitleContainer.BackgroundTransparency = 1
    TitleContainer.Position = UDim2.new(0.05, 0, 0, 0)
    TitleContainer.Size = UDim2.new(0.6, 0, 1, 0)
    
    local Icon = Instance.new("TextLabel")
    Icon.Name = "Icon"
    Icon.Parent = TitleContainer
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 0, 0.15, 0)
    Icon.Size = UDim2.new(0, 60, 0, 60)
    Icon.Font = Enum.Font.GothamBlack
    Icon.Text = "⚡"
    Icon.TextColor3 = Color3.fromRGB(0, 220, 255)
    Icon.TextSize = 40
    Icon.TextStrokeTransparency = 0.5
    Icon.TextStrokeColor3 = Color3.fromRGB(0, 150, 255)
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TitleContainer
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.15, 0, 0.15, 0)
    Title.Size = UDim2.new(0.8, 0, 0.4, 0)
    Title.Font = Enum.Font.GothamBlack
    Title.Text = "OUTLAST PANEL v2.0"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 26
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextStrokeTransparency = 0.7
    Title.TextStrokeColor3 = Color3.fromRGB(0, 100, 255)
    
    local Version = Instance.new("TextLabel")
    Version.Name = "Version"
    Version.Parent = TitleContainer
    Version.BackgroundTransparency = 1
    Version.Position = UDim2.new(0.15, 0, 0.6, 0)
    Version.Size = UDim2.new(0.8, 0, 0.3, 0)
    Version.Font = Enum.Font.GothamBold
    Version.Text = "ULTRA PREMIUM SECURITY EDITION"
    Version.TextColor3 = Color3.fromRGB(0, 220, 255)
    Version.TextSize = 14
    Version.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Botones de control premium mejorados
    local ControlButtons = Instance.new("Frame")
    ControlButtons.Name = "ControlButtons"
    ControlButtons.Parent = Header
    ControlButtons.BackgroundTransparency = 1
    ControlButtons.Position = UDim2.new(0.75, 0, 0.2, 0)
    ControlButtons.Size = UDim2.new(0.2, 0, 0.6, 0)
    
    -- Botón minimizar con efecto
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = ControlButtons
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    MinimizeButton.Position = UDim2.new(0, 0, 0, 0)
    MinimizeButton.Size = UDim2.new(0, 45, 0, 45)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 28
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(1, 0)
    MinimizeCorner.Parent = MinimizeButton
    
    -- Botón cerrar con efecto hover
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = ControlButtons
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 90)
    CloseButton.Position = UDim2.new(0.6, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 45, 0, 45)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 32
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(1, 0)
    CloseCorner.Parent = CloseButton
    
    -- Contenedor principal con pestañas premium mejoradas
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
    TabContainer.Position = UDim2.new(0, 25, 0.12, 15)
    TabContainer.Size = UDim2.new(1, -50, 0.86, -25)
    TabContainer.BorderSizePixel = 0
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 15)
    TabCorner.Parent = TabContainer
    
    -- Gradiente tabs con efecto
    local tabsGradient = Instance.new("UIGradient")
    tabsGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 75)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 65)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 55))
    })
    tabsGradient.Rotation = 90
    tabsGradient.Parent = TabContainer
    
    -- Tabs header premium mejorado
    local TabsHeader = Instance.new("Frame")
    TabsHeader.Name = "TabsHeader"
    TabsHeader.Parent = TabContainer
    TabsHeader.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
    TabsHeader.Size = UDim2.new(1, 0, 0, 65)
    TabsHeader.BorderSizePixel = 0
    
    local TabsHeaderCorner = Instance.new("UICorner")
    TabsHeaderCorner.CornerRadius = UDim.new(0, 15, 0, 0)
    TabsHeaderCorner.Parent = TabsHeader
    
    -- Gradiente header tabs con brillo
    local tabsHeaderGradient = Instance.new("UIGradient")
    tabsHeaderGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 110)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(50, 50, 95)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
    })
    tabsHeaderGradient.Rotation = 90
    tabsHeaderGradient.Parent = TabsHeader
    
    -- Tabs buttons premium mejorados
    local tabs = {
        {"🎮 PLAYER", "PlayerControls"},
        {"⚡ MOVEMENT", "Movement"},
        {"🎯 COMBAT", "Combat"},
        {"🌍 WORLD", "World"},
        {"👁️ VISUAL", "Visual"},
        {"🛡️ SECURITY", "Security"},
        {"⚙️ SETTINGS", "Shortcuts"}
    }
    
    -- Crear pestañas premium con efectos
    for i, tab in ipairs(tabs) do
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tab[2] .. "Tab"
        TabButton.Parent = TabsHeader
        TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 110)
        TabButton.Position = UDim2.new(0.02 + (i-1)*0.136, 0, 0.15, 0)
        TabButton.Size = UDim2.new(0.135, 0, 0.7, 0)
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Text = tab[1]
        TabButton.TextColor3 = Color3.fromRGB(220, 240, 255)
        TabButton.TextSize = 11
        TabButton.TextWrapped = true
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 10)
        TabCorner.Parent = TabButton
        
        -- Gradiente en botón de pestaña
        local tabButtonGradient = Instance.new("UIGradient")
        tabButtonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 120)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 110))
        })
        tabButtonGradient.Rotation = 90
        tabButtonGradient.Parent = TabButton
        
        -- Animación hover premium mejorada
        TabButton.MouseEnter:Connect(function()
            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(0, 170, 255),
                Size = UDim2.new(0.14, 0, 0.75, 0),
                Position = UDim2.new(0.02 + (i-1)*0.136, -2, 0.15, -2)
            }):Play()
            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)
        
        TabButton.MouseLeave:Connect(function()
            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 110),
                Size = UDim2.new(0.135, 0, 0.7, 0),
                Position = UDim2.new(0.02 + (i-1)*0.136, 0, 0.15, 0)
            }):Play()
            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                TextColor3 = Color3.fromRGB(220, 240, 255)
            }):Play()
        end)
    end
    
    -- Contenedor de contenido
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = TabContainer
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 0, 0.12, 0)
    ContentContainer.Size = UDim2.new(1, 0, 0.88, 0)
    
    -- Función crear slider ULTRA PREMIUM
    local function CreatePremiumSlider(name, text, min, max, default, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Name = name .. "SliderFrame"
        sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 75)
        sliderFrame.Size = UDim2.new(1, -30, 0, 80)
        
        local sliderCorner = Instance.new("UICorner")
        sliderCorner.CornerRadius = UDim.new(0, 12)
        sliderCorner.Parent = sliderFrame
        
        -- Gradiente slider con efecto
        local sliderGradient = Instance.new("UIGradient")
        sliderGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 90)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(45, 45, 85)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 75))
        })
        sliderGradient.Rotation = 90
        sliderGradient.Parent = sliderFrame
        
        -- Texto con icono
        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Parent = sliderFrame
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0.05, 0, 0.1, 0)
        label.Size = UDim2.new(0.6, 0, 0, 30)
        label.Font = Enum.Font.GothamMedium
        label.Text = "  " .. text
        label.TextColor3 = Color3.fromRGB(230, 245, 255)
        label.TextSize = 15
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Valor con estilo premium
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Name = "ValueLabel"
        valueLabel.Parent = sliderFrame
        valueLabel.BackgroundTransparency = 1
        valueLabel.Position = UDim2.new(0.7, 0, 0.1, 0)
        valueLabel.Size = UDim2.new(0.25, 0, 0, 30)
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.Text = tostring(default)
        valueLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
        valueLabel.TextSize = 18
        valueLabel.TextStrokeTransparency = 0.7
        valueLabel.TextStrokeColor3 = Color3.fromRGB(0, 100, 255)
        
        -- Slider premium mejorado
        local sliderBg = Instance.new("Frame")
        sliderBg.Name = "SliderBg"
        sliderBg.Parent = sliderFrame
        sliderBg.BackgroundColor3 = Color3.fromRGB(55, 55, 95)
        sliderBg.Position = UDim2.new(0.05, 0, 0.6, 0)
        sliderBg.Size = UDim2.new(0.9, 0, 0, 12)
        
        local bgCorner = Instance.new("UICorner")
        bgCorner.CornerRadius = UDim.new(1, 0)
        bgCorner.Parent = sliderBg
        
        local sliderFill = Instance.new("Frame")
        sliderFill.Name = "SliderFill"
        sliderFill.Parent = sliderBg
        sliderFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        sliderFill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
        
        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(1, 0)
        fillCorner.Parent = sliderFill
        
        -- Gradiente fill animado
        local fillGradient = Instance.new("UIGradient")
        fillGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 220, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 220)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
        })
        fillGradient.Parent = sliderFill
        
        -- Handle del slider premium
        local sliderHandle = Instance.new("Frame")
        sliderHandle.Name = "SliderHandle"
        sliderHandle.Parent = sliderBg
        sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderHandle.Size = UDim2.new(0, 24, 0, 24)
        sliderHandle.Position = UDim2.new((default - min)/(max - min), -12, 0.5, -12)
        
        local handleCorner = Instance.new("UICorner")
        handleCorner.CornerRadius = UDim.new(1, 0)
        handleCorner.Parent = sliderHandle
        
        -- Glow effect en handle
        local handleGlow = Instance.new("Frame")
        handleGlow.Name = "Glow"
        handleGlow.Parent = sliderHandle
        handleGlow.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        handleGlow.Size = UDim2.new(1.5, 0, 1.5, 0)
        handleGlow.Position = UDim2.new(-0.25, 0, -0.25, 0)
        handleGlow.BackgroundTransparency = 0.8
        handleGlow.ZIndex = -1
        
        local handleGlowCorner = Instance.new("UICorner")
        handleGlowCorner.CornerRadius = UDim.new(1, 0)
        handleGlowCorner.Parent = handleGlow
        
        local sliderButton = Instance.new("TextButton")
        sliderButton.Name = "SliderButton"
        sliderButton.Parent = sliderBg
        sliderButton.BackgroundTransparency = 1
        sliderButton.Size = UDim2.new(1, 0, 1, 0)
        sliderButton.Text = ""
        sliderButton.ZIndex = 2
        
        local currentValue = default
        
        sliderButton.MouseButton1Down:Connect(function()
            local connection
            connection = RunService.RenderStepped:Connect(function()
                local percent = math.clamp((Mouse.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                currentValue = math.floor(min + (max - min) * percent)
                valueLabel.Text = tostring(currentValue)
                sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                sliderHandle.Position = UDim2.new(percent, -12, 0.5, -12)
                callback(currentValue)
            end)
            
            local release
            release = UIS.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    connection:Disconnect()
                    release:Disconnect()
                end
            end)
        end)
        
        return sliderFrame
    end
    
    -- Función crear botón ULTRA PREMIUM con indicador
    local function CreatePremiumButton(name, text, shortcut, callback)
        local buttonFrame = Instance.new("Frame")
        buttonFrame.Name = name .. "ButtonFrame"
        buttonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
        buttonFrame.Size = UDim2.new(1, -30, 0, 65)
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 12)
        buttonCorner.Parent = buttonFrame
        
        -- Gradiente botón premium
        local buttonGradient = Instance.new("UIGradient")
        buttonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 100)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 50, 95)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
        })
        buttonGradient.Rotation = 90
        buttonGradient.Parent = buttonFrame
        
        -- Icono premium
        local icon = Instance.new("TextLabel")
        icon.Name = "Icon"
        icon.Parent = buttonFrame
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0.05, 0, 0, 0)
        icon.Size = UDim2.new(0.12, 0, 1, 0)
        icon.Font = Enum.Font.GothamBlack
        icon.Text = "⚡"
        icon.TextColor3 = Color3.fromRGB(0, 220, 255)
        icon.TextSize = 24
        
        -- Botón principal premium
        local button = Instance.new("TextButton")
        button.Name = name .. "Button"
        button.Parent = buttonFrame
        button.BackgroundTransparency = 1
        button.Position = UDim2.new(0.18, 0, 0, 0)
        button.Size = UDim2.new(0.5, 0, 1, 0)
        button.Font = Enum.Font.GothamMedium
        button.Text = text
        button.TextColor3 = Color3.fromRGB(230, 245, 255)
        button.TextSize = 15
        button.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Shortcut con estilo
        local shortcutLabel = Instance.new("TextLabel")
        shortcutLabel.Name = "ShortcutLabel"
        shortcutLabel.Parent = buttonFrame
        shortcutLabel.BackgroundTransparency = 1
        shortcutLabel.Position = UDim2.new(0.7, 0, 0.2, 0)
        shortcutLabel.Size = UDim2.new(0.2, 0, 0.6, 0)
        shortcutLabel.Font = Enum.Font.GothamBold
        shortcutLabel.Text = "[" .. shortcut .. "]"
        shortcutLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
        shortcutLabel.TextSize = 13
        shortcutLabel.TextStrokeTransparency = 0.8
        shortcutLabel.TextStrokeColor3 = Color3.fromRGB(0, 80, 255)
        
        -- Indicador de estado premium mejorado
        local indicator = Instance.new("TextButton")
        indicator.Name = name .. "Indicator"
        indicator.Parent = buttonFrame
        indicator.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
        indicator.Position = UDim2.new(0.9, -42, 0.15, 0)
        indicator.Size = UDim2.new(0, 40, 0, 35)
        indicator.Font = Enum.Font.GothamBold
        indicator.Text = "OFF"
        indicator.TextColor3 = Color3.fromRGB(255, 255, 255)
        indicator.TextSize = 12
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(0, 8)
        indicatorCorner.Parent = indicator
        
        -- Gradiente indicador
        local indicatorGradient = Instance.new("UIGradient")
        indicatorGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 60))
        })
        indicatorGradient.Rotation = 90
        indicatorGradient.Parent = indicator
        
        -- Guardar indicador en cache
        GuiElements.Indicators[name] = indicator
        
        -- Animación hover ultra premium
        buttonFrame.MouseEnter:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(65, 65, 115),
                Size = UDim2.new(1, -25, 0, 70)
            }):Play()
            TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(icon, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                TextColor3 = Color3.fromRGB(0, 255, 255)
            }):Play()
        end)
        
        buttonFrame.MouseLeave:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(45, 45, 85),
                Size = UDim2.new(1, -30, 0, 65)
            }):Play()
            TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                TextColor3 = Color3.fromRGB(230, 245, 255)
            }):Play()
            TweenService:Create(icon, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                TextColor3 = Color3.fromRGB(0, 220, 255)
            }):Play()
        end)
        
        button.MouseButton1Click:Connect(function()
            callback()
        end)
        
        indicator.MouseButton1Click:Connect(function()
            callback()
        end)
        
        return buttonFrame
    end
    
    -- ===== PANEL DE SEGURIDAD MEJORADO =====
    local SecurityPanel = Instance.new("Frame")
    SecurityPanel.Name = "SecurityPanel"
    SecurityPanel.Parent = ContentContainer
    SecurityPanel.BackgroundTransparency = 1
    SecurityPanel.Size = UDim2.new(1, 0, 1, 0)
    SecurityPanel.Visible = false
    
    local SecurityScroll = Instance.new("ScrollingFrame")
    SecurityScroll.Name = "SecurityScroll"
    SecurityScroll.Parent = SecurityPanel
    SecurityScroll.BackgroundTransparency = 1
    SecurityScroll.Position = UDim2.new(0, 10, 0, 10)
    SecurityScroll.Size = UDim2.new(1, -20, 1, -20)
    SecurityScroll.CanvasSize = UDim2.new(0, 0, 2.5, 0)
    SecurityScroll.ScrollBarThickness = 10
    
    local SecurityLayout = Instance.new("UIListLayout")
    SecurityLayout.Parent = SecurityScroll
    SecurityLayout.Padding = UDim.new(0, 18)
    
    -- Función crear botón de seguridad premium
    local function CreateSecurityButton(name, text, shortcut, callback)
        local buttonFrame = Instance.new("Frame")
        buttonFrame.Name = name .. "ButtonFrame"
        buttonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
        buttonFrame.Size = UDim2.new(1, -30, 0, 65)
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 12)
        buttonCorner.Parent = buttonFrame
        
        -- Gradiente botón premium
        local buttonGradient = Instance.new("UIGradient")
        buttonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 100)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 50, 95)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
        })
        buttonGradient.Rotation = 90
        buttonGradient.Parent = buttonFrame
        
        -- Icono premium
        local icon = Instance.new("TextLabel")
        icon.Name = "Icon"
        icon.Parent = buttonFrame
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0.05, 0, 0, 0)
        icon.Size = UDim2.new(0.12, 0, 1, 0)
        icon.Font = Enum.Font.GothamBlack
        icon.Text = "🛡️"
        icon.TextColor3 = Color3.fromRGB(0, 220, 255)
        icon.TextSize = 24
        
        -- Botón principal premium
        local button = Instance.new("TextButton")
        button.Name = name .. "Button"
        button.Parent = buttonFrame
        button.BackgroundTransparency = 1
        button.Position = UDim2.new(0.18, 0, 0, 0)
        button.Size = UDim2.new(0.5, 0, 1, 0)
        button.Font = Enum.Font.GothamMedium
        button.Text = text
        button.TextColor3 = Color3.fromRGB(230, 245, 255)
        button.TextSize = 15
        button.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Shortcut con estilo
        local shortcutLabel = Instance.new("TextLabel")
        shortcutLabel.Name = "ShortcutLabel"
        shortcutLabel.Parent = buttonFrame
        shortcutLabel.BackgroundTransparency = 1
        shortcutLabel.Position = UDim2.new(0.7, 0, 0.2, 0)
        shortcutLabel.Size = UDim2.new(0.2, 0, 0.6, 0)
        shortcutLabel.Font = Enum.Font.GothamBold
        shortcutLabel.Text = "[" .. shortcut .. "]"
        shortcutLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
        shortcutLabel.TextSize = 13
        
        -- Indicador de estado premium mejorado
        local indicator = Instance.new("TextButton")
        indicator.Name = name .. "Indicator"
        indicator.Parent = buttonFrame
        indicator.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
        indicator.Position = UDim2.new(0.9, -42, 0.15, 0)
        indicator.Size = UDim2.new(0, 40, 0, 35)
        indicator.Font = Enum.Font.GothamBold
        indicator.Text = "OFF"
        indicator.TextColor3 = Color3.fromRGB(255, 255, 255)
        indicator.TextSize = 12
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(0, 8)
        indicatorCorner.Parent = indicator
        
        -- Gradiente indicador
        local indicatorGradient = Instance.new("UIGradient")
        indicatorGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 60))
        })
        indicatorGradient.Rotation = 90
        indicatorGradient.Parent = indicator
        
        -- Guardar indicador en cache
        GuiElements.Indicators[name] = indicator
        
        -- Animación hover ultra premium
        buttonFrame.MouseEnter:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(65, 65, 115),
                Size = UDim2.new(1, -25, 0, 70)
            }):Play()
        end)
        
        buttonFrame.MouseLeave:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(45, 45, 85),
                Size = UDim2.new(1, -30, 0, 65)
            }):Play()
        end)
        
        button.MouseButton1Click:Connect(function()
            callback()
        end)
        
        indicator.MouseButton1Click:Connect(function()
            callback()
        end)
        
        return buttonFrame
    end
    
    -- Botón Anti-Kick
    CreateSecurityButton("AntiKick", "Anti-Kick System", "F5", function()
        if not SecuritySystem.AntiKickActive then
            SetupAntiKick()
            Config.AntiKick = true
            UpdateButtonState("AntiKick", true)
            Notify("🛡️ ANTI-KICK", "Advanced protection activated!", 3)
        else
            Notify("🛡️ ANTI-KICK", "System already active!", 2)
        end
    end).Parent = SecurityScroll
    
    -- Botón Click Detection
    CreateSecurityButton("ClickDetection", "Attack Detection", "F6", function()
        Config.ClickDetection = not Config.ClickDetection
        UpdateButtonState("ClickDetection", Config.ClickDetection)
        
        if Config.ClickDetection then
            SetupClickDetection()
            Notify("🔴 ATTACK DETECTION", "System activated! You will be notified of attacks.", 3)
        else
            Notify("🔴 ATTACK DETECTION", "System deactivated", 2)
        end
    end).Parent = SecurityScroll
    
    -- Botón Security Monitor
    CreateSecurityButton("SecurityMonitor", "Security Monitor", "F7", function()
        Config.SecurityMonitor = not Config.SecurityMonitor
        UpdateButtonState("SecurityMonitor", Config.SecurityMonitor)
        
        if Config.SecurityMonitor then
            StartSecurityMonitoring()
            Notify("🔍 SECURITY MONITOR", "24/7 monitoring activated!", 3)
        else
            Notify("🔍 SECURITY MONITOR", "Monitoring deactivated", 2)
        end
    end).Parent = SecurityScroll
    
    -- Botón Check Anti-Cheat
    CreateSecurityButton("CheckAntiCheat", "Scan Anti-Cheat", "F8", function()
        local detected, cheatNames = DetectAntiCheat()
        
        if detected then
            SecuritySystem.AntiCheatDetected = true
            ShowAntiCheatWarning(cheatNames)
        else
            Notify("✅ CLEAN", "No anti-cheat detected!", 3)
        end
    end).Parent = SecurityScroll
    
    -- Panel de logs de ataque
    local AttackLogsFrame = Instance.new("Frame")
    AttackLogsFrame.Name = "AttackLogsFrame"
    AttackLogsFrame.Parent = SecurityScroll
    AttackLogsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 75)
    AttackLogsFrame.Size = UDim2.new(1, -30, 0, 200)
    
    local logsCorner = Instance.new("UICorner")
    logsCorner.CornerRadius = UDim.new(0, 12)
    logsCorner.Parent = AttackLogsFrame
    
    local logsGradient = Instance.new("UIGradient")
    logsGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 85)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 75))
    })
    logsGradient.Rotation = 90
    logsGradient.Parent = AttackLogsFrame
    
    -- Título logs
    local logsTitle = Instance.new("TextLabel")
    logsTitle.Name = "LogsTitle"
    logsTitle.Parent = AttackLogsFrame
    logsTitle.BackgroundTransparency = 1
    logsTitle.Position = UDim2.new(0.05, 0, 0.05, 0)
    logsTitle.Size = UDim2.new(0.9, 0, 0.15, 0)
    logsTitle.Font = Enum.Font.GothamBold
    logsTitle.Text = "🔴 ATTACK LOGS (Last 20)"
    logsTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
    logsTitle.TextSize = 16
    
    -- Scroll para logs
    local logsScroll = Instance.new("ScrollingFrame")
    logsScroll.Name = "LogsScroll"
    logsScroll.Parent = AttackLogsFrame
    logsScroll.BackgroundTransparency = 1
    logsScroll.Position = UDim2.new(0.05, 0, 0.25, 0)
    logsScroll.Size = UDim2.new(0.9, 0, 0.7, 0)
    logsScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
    logsScroll.ScrollBarThickness = 5
    
    local logsLayout = Instance.new("UIListLayout")
    logsLayout.Parent = logsScroll
    logsLayout.Padding = UDim.new(0, 5)
    
    -- Función para actualizar logs
    local function UpdateAttackLogs()
        for _, child in ipairs(logsScroll:GetChildren()) do
            if child:IsA("TextLabel") then
                child:Destroy()
            end
        end
        
        for i, logEntry in ipairs(ClickDetection.AttackLogs) do
            local logLabel = Instance.new("TextLabel")
            logLabel.BackgroundTransparency = 1
            logLabel.Size = UDim2.new(1, 0, 0, 25)
            logLabel.Font = Enum.Font.Gotham
            logLabel.Text = logEntry
            logLabel.TextColor3 = i == 1 and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(200, 200, 200)
            logLabel.TextSize = 12
            logLabel.TextXAlignment = Enum.TextXAlignment.Left
            logLabel.TextWrapped = true
            logLabel.Parent = logsScroll
        end
    end
    
    -- Botón para actualizar logs
    local refreshLogsBtn = Instance.new("TextButton")
    refreshLogsBtn.Name = "RefreshLogsBtn"
    refreshLogsBtn.Parent = AttackLogsFrame
    refreshLogsBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    refreshLogsBtn.Position = UDim2.new(0.7, 0, 0.05, 0)
    refreshLogsBtn.Size = UDim2.new(0.25, 0, 0.15, 0)
    refreshLogsBtn.Font = Enum.Font.GothamBold
    refreshLogsBtn.Text = "🔄 REFRESH"
    refreshLogsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    refreshLogsBtn.TextSize = 12
    
    local refreshCorner = Instance.new("UICorner")
    refreshCorner.CornerRadius = UDim.new(0, 8)
    refreshCorner.Parent = refreshLogsBtn
    
    refreshLogsBtn.MouseButton1Click:Connect(function()
        UpdateAttackLogs()
        Notify("📋 LOGS", "Attack logs refreshed!", 1)
    end)
    
    -- Actualizar logs cada 5 segundos
    spawn(function()
        while true do
            if Config.ClickDetection then
                UpdateAttackLogs()
            end
            wait(5)
        end
    end)
    
    -- Panel de estado de seguridad
    local SecurityStatusFrame = Instance.new("Frame")
    SecurityStatusFrame.Name = "SecurityStatusFrame"
    SecurityStatusFrame.Parent = SecurityScroll
    SecurityStatusFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 75)
    SecurityStatusFrame.Size = UDim2.new(1, -30, 0, 150)
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 12)
    statusCorner.Parent = SecurityStatusFrame
    
    local statusGradient = Instance.new("UIGradient")
    statusGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 85)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 75))
    })
    statusGradient.Rotation = 90
    statusGradient.Parent = SecurityStatusFrame
    
    -- Título status
    local statusTitle = Instance.new("TextLabel")
    statusTitle.Name = "StatusTitle"
    statusTitle.Parent = SecurityStatusFrame
    statusTitle.BackgroundTransparency = 1
    statusTitle.Position = UDim2.new(0.05, 0, 0.05, 0)
    statusTitle.Size = UDim2.new(0.9, 0, 0.15, 0)
    statusTitle.Font = Enum.Font.GothamBold
    statusTitle.Text = "🛡️ SECURITY STATUS"
    statusTitle.TextColor3 = Color3.fromRGB(0, 220, 255)
    statusTitle.TextSize = 16
    
    -- Información de estado
    local statusInfo = Instance.new("TextLabel")
    statusInfo.Name = "StatusInfo"
    statusInfo.Parent = SecurityStatusFrame
    statusInfo.BackgroundTransparency = 1
    statusInfo.Position = UDim2.new(0.05, 0, 0.25, 0)
    statusInfo.Size = UDim2.new(0.9, 0, 0.7, 0)
    statusInfo.Font = Enum.Font.Gotham
    statusInfo.Text = "Anti-Kick: ❌ NOT ACTIVE\n" ..
                      "Anti-Cheat: ❌ NOT SCANNED\n" ..
                      "Attack Detection: ❌ NOT ACTIVE\n" ..
                      "Monitoring: ❌ NOT ACTIVE\n" ..
                      "Kick Attempts: 0"
    statusInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusInfo.TextSize = 13
    statusInfo.TextXAlignment = Enum.TextXAlignment.Left
    statusInfo.TextYAlignment = Enum.TextYAlignment.Top
    
    -- Función para actualizar estado
    local function UpdateSecurityStatus()
        local statusText = ""
        
        -- Anti-Kick
        if SecuritySystem.AntiKickActive then
            statusText = statusText .. "Anti-Kick: ✅ ACTIVE (Blocks: " .. SecuritySystem.KickAttempts .. ")\n"
        else
            statusText = statusText .. "Anti-Kick: ❌ NOT ACTIVE\n"
        end
        
        -- Anti-Cheat
        if SecuritySystem.AntiCheatDetected then
            statusText = statusText .. "Anti-Cheat: ⚠️ DETECTED (" .. 
                        table.concat(SecuritySystem.CheatDetectionWarnings, ", ") .. ")\n"
        else
            statusText = statusText .. "Anti-Cheat: ✅ CLEAN\n"
        end
        
        -- Attack Detection
        if Config.ClickDetection then
            statusText = statusText .. "Attack Detection: ✅ ACTIVE\n"
            if #ClickDetection.AttackLogs > 0 then
                statusText = statusText .. "Recent Attacks: " .. #ClickDetection.AttackLogs .. "\n"
            end
        else
            statusText = statusText .. "Attack Detection: ❌ NOT ACTIVE\n"
        end
        
        -- Monitoring
        if Config.SecurityMonitor then
            statusText = statusText .. "Monitoring: ✅ ACTIVE\n"
        else
            statusText = statusText .. "Monitoring: ❌ NOT ACTIVE\n"
        end
        
        -- Overall Status
        if SecuritySystem.AntiKickActive and Config.ClickDetection and Config.SecurityMonitor then
            statusText = statusText .. "\n🔥 OVERALL: MAXIMUM PROTECTION"
        elseif SecuritySystem.AntiKickActive or Config.ClickDetection then
            statusText = statusText .. "\n⚠️ OVERALL: PARTIAL PROTECTION"
        else
            statusText = statusText .. "\n🔴 OVERALL: NO PROTECTION"
        end
        
        statusInfo.Text = statusText
    end
    
    -- Botón para actualizar estado
    local refreshStatusBtn = Instance.new("TextButton")
    refreshStatusBtn.Name = "RefreshStatusBtn"
    refreshStatusBtn.Parent = SecurityStatusFrame
    refreshStatusBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    refreshStatusBtn.Position = UDim2.new(0.7, 0, 0.05, 0)
    refreshStatusBtn.Size = UDim2.new(0.25, 0, 0.15, 0)
    refreshStatusBtn.Font = Enum.Font.GothamBold
    refreshStatusBtn.Text = "🔄 UPDATE"
    refreshStatusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    refreshStatusBtn.TextSize = 12
    
    local refreshStatusCorner = Instance.new("UICorner")
    refreshStatusCorner.CornerRadius = UDim.new(0, 8)
    refreshStatusCorner.Parent = refreshStatusBtn
    
    refreshStatusBtn.MouseButton1Click:Connect(function()
        UpdateSecurityStatus()
        Notify("🛡️ STATUS", "Security status updated!", 1)
    end)
    
    -- Actualizar estado cada 10 segundos
    spawn(function()
        while true do
            UpdateSecurityStatus()
            wait(10)
        end
    end)
    
    -- ===== PANEL DE JUGADOR ULTRA PREMIUM MEJORADO =====
    local PlayerPanel = Instance.new("Frame")
    PlayerPanel.Name = "PlayerPanel"
    PlayerPanel.Parent = ContentContainer
    PlayerPanel.BackgroundTransparency = 1
    PlayerPanel.Size = UDim2.new(1, 0, 1, 0)
    PlayerPanel.Visible = true
    
    -- Panel de búsqueda premium mejorado
    local SearchFrame = Instance.new("Frame")
    SearchFrame.Name = "SearchFrame"
    SearchFrame.Parent = PlayerPanel
    SearchFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
    SearchFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
    SearchFrame.Size = UDim2.new(0.96, 0, 0.32, 0)
    
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 12)
    SearchCorner.Parent = SearchFrame
    
    local searchGradient = Instance.new("UIGradient")
    searchGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 105)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 50, 100)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
    })
    searchGradient.Rotation = 90
    searchGradient.Parent = SearchFrame
    
    local SearchTitle = Instance.new("TextLabel")
    SearchTitle.Name = "SearchTitle"
    SearchTitle.Parent = SearchFrame
    SearchTitle.BackgroundTransparency = 1
    SearchTitle.Position = UDim2.new(0.05, 0, 0.05, 0)
    SearchTitle.Size = UDim2.new(0.9, 0, 0.18, 0)
    SearchTitle.Font = Enum.Font.GothamBold
    SearchTitle.Text = "🔍 PLAYER SEARCH SYSTEM"
    SearchTitle.TextColor3 = Color3.fromRGB(0, 220, 255)
    SearchTitle.TextSize = 18
    SearchTitle.TextXAlignment = Enum.TextXAlignment.Left
    SearchTitle.TextStrokeTransparency = 0.7
    
    -- Input premium mejorado
    local PlayerInput = Instance.new("TextBox")
    PlayerInput.Name = "PlayerInput"
    PlayerInput.Parent = SearchFrame
    PlayerInput.BackgroundColor3 = Color3.fromRGB(35, 35, 70)
    PlayerInput.Position = UDim2.new(0.05, 0, 0.28, 0)
    PlayerInput.Size = UDim2.new(0.65, 0, 0.25, 0)
    PlayerInput.Font = Enum.Font.GothamMedium
    PlayerInput.PlaceholderText = "Enter username or UserId"
    PlayerInput.PlaceholderColor3 = Color3.fromRGB(150, 170, 220)
    PlayerInput.Text = ""
    PlayerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerInput.TextSize = 14
    PlayerInput.ClearTextOnFocus = false
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 10)
    InputCorner.Parent = PlayerInput
    
    -- Botón buscar premium mejorado
    local SearchBtn = Instance.new("TextButton")
    SearchBtn.Name = "SearchBtn"
    SearchBtn.Parent = SearchFrame
    SearchBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    SearchBtn.Position = UDim2.new(0.72, 0, 0.28, 0)
    SearchBtn.Size = UDim2.new(0.23, 0, 0.25, 0)
    SearchBtn.Font = Enum.Font.GothamBold
    SearchBtn.Text = "🔍 SEARCH"
    SearchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBtn.TextSize = 14
    
    local SearchBtnCorner = Instance.new("UICorner")
    SearchBtnCorner.CornerRadius = UDim.new(0, 10)
    SearchBtnCorner.Parent = SearchBtn
    
    -- Información del jugador premium mejorada
    local PlayerInfoFrame = Instance.new("Frame")
    PlayerInfoFrame.Name = "PlayerInfoFrame"
    PlayerInfoFrame.Parent = SearchFrame
    PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 75)
    PlayerInfoFrame.Position = UDim2.new(0.05, 0, 0.58, 0)
    PlayerInfoFrame.Size = UDim2.new(0.9, 0, 0.37, 0)
    PlayerInfoFrame.Visible = false
    
    local PlayerInfoCorner = Instance.new("UICorner")
    PlayerInfoCorner.CornerRadius = UDim.new(0, 10)
    PlayerInfoCorner.Parent = PlayerInfoFrame
    
    local PlayerInfoGradient = Instance.new("UIGradient")
    PlayerInfoGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 85)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 75))
    })
    PlayerInfoGradient.Rotation = 90
    PlayerInfoGradient.Parent = PlayerInfoFrame
    
    local PlayerName = Instance.new("TextLabel")
    PlayerName.Name = "PlayerName"
    PlayerName.Parent = PlayerInfoFrame
    PlayerName.BackgroundTransparency = 1
    PlayerName.Position = UDim2.new(0.05, 0, 0.1, 0)
    PlayerName.Size = UDim2.new(0.9, 0, 0.25, 0)
    PlayerName.Font = Enum.Font.GothamBold
    PlayerName.Text = "👤 Player: None"
    PlayerName.TextColor3 = Color3.fromRGB(0, 255, 255)
    PlayerName.TextSize = 15
    PlayerName.TextXAlignment = Enum.TextXAlignment.Left
    
    local PlayerId = Instance.new("TextLabel")
    PlayerId.Name = "PlayerId"
    PlayerId.Parent = PlayerInfoFrame
    PlayerId.BackgroundTransparency = 1
    PlayerId.Position = UDim2.new(0.05, 0, 0.35, 0)
    PlayerId.Size = UDim2.new(0.9, 0, 0.25, 0)
    PlayerId.Font = Enum.Font.GothamMedium
    PlayerId.Text = "🆔 ID: N/A"
    PlayerId.TextColor3 = Color3.fromRGB(200, 230, 255)
    PlayerId.TextSize = 13
    PlayerId.TextXAlignment = Enum.TextXAlignment.Left
    
    local PlayerStatus = Instance.new("TextLabel")
    PlayerStatus.Name = "PlayerStatus"
    PlayerStatus.Parent = PlayerInfoFrame
    PlayerStatus.BackgroundTransparency = 1
    PlayerStatus.Position = UDim2.new(0.05, 0, 0.6, 0)
    PlayerStatus.Size = UDim2.new(0.9, 0, 0.3, 0)
    PlayerStatus.Font = Enum.Font.GothamMedium
    PlayerStatus.Text = "📊 Status: Not found"
    PlayerStatus.TextColor3 = Color3.fromRGB(255, 160, 60)
    PlayerStatus.TextSize = 13
    PlayerStatus.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Acciones premium mejoradas
    local ActionFrame = Instance.new("Frame")
    ActionFrame.Name = "ActionFrame"
    ActionFrame.Parent = PlayerPanel
    ActionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
    ActionFrame.Position = UDim2.new(0.02, 0, 0.36, 0)
    ActionFrame.Size = UDim2.new(0.96, 0, 0.32, 0)
    
    local ActionCorner = Instance.new("UICorner")
    ActionCorner.CornerRadius = UDim.new(0, 12)
    ActionCorner.Parent = ActionFrame
    
    local actionGradient = Instance.new("UIGradient")
    actionGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 105)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
    })
    actionGradient.Rotation = 90
    actionGradient.Parent = ActionFrame
    
    local ActionTitle = Instance.new("TextLabel")
    ActionTitle.Name = "ActionTitle"
    ActionTitle.Parent = ActionFrame
    ActionTitle.BackgroundTransparency = 1
    ActionTitle.Position = UDim2.new(0.05, 0, 0.05, 0)
    ActionTitle.Size = UDim2.new(0.9, 0, 0.18, 0)
    ActionTitle.Font = Enum.Font.GothamBold
    ActionTitle.Text = "🎯 PLAYER ACTIONS"
    ActionTitle.TextColor3 = Color3.fromRGB(0, 220, 255)
    ActionTitle.TextSize = 18
    ActionTitle.TextXAlignment = Enum.TextXAlignment.Left
    ActionTitle.TextStrokeTransparency = 0.7
    
    -- Botones de acción premium mejorados
    local actions = {
        {"📡 TP TO", "Teleport to player", Color3.fromRGB(0, 140, 255)},
        {"🎯 BRING", "Bring to you", Color3.fromRGB(0, 200, 120)},
        {"👁️ SPECTATE", "Spectate player", Color3.fromRGB(210, 110, 255)},
        {"💀 KILL", "Kill player", Color3.fromRGB(255, 90, 90)}
    }
    
    for i, action in ipairs(actions) do
        local row = math.floor((i-1)/2)
        local col = (i-1)%2
        
        local ActionButton = Instance.new("TextButton")
        ActionButton.Name = action[1]:gsub("%s", "") .. "Btn"
        ActionButton.Parent = ActionFrame
        ActionButton.BackgroundColor3 = action[3]
        ActionButton.Position = UDim2.new(0.05 + col*0.475, 0, 0.28 + row*0.35, 0)
        ActionButton.Size = UDim2.new(0.45, 0, 0.3, 0)
        ActionButton.Font = Enum.Font.GothamBold
        ActionButton.Text = action[1]
        ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ActionButton.TextSize = 15
        ActionButton.Visible = false
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 10)
        ButtonCorner.Parent = ActionButton
        
        local ActionDesc = Instance.new("TextLabel")
        ActionDesc.Name = "Desc"
        ActionDesc.Parent = ActionButton
        ActionDesc.BackgroundTransparency = 1
        ActionDesc.Position = UDim2.new(0, 0, 0.7, 0)
        ActionDesc.Size = UDim2.new(1, 0, 0.3, 0)
        ActionDesc.Font = Enum.Font.Gotham
        ActionDesc.Text = action[2]
        ActionDesc.TextColor3 = Color3.fromRGB(240, 250, 255)
        ActionDesc.TextSize = 11
        
        -- Animación hover premium
        ActionButton.MouseEnter:Connect(function()
            TweenService:Create(ActionButton, TweenInfo.new(0.3), {
                Size = UDim2.new(0.46, 0, 0.32, 0),
                Position = UDim2.new(0.05 + col*0.475, -2, 0.28 + row*0.35, -2)
            }):Play()
        end)
        
        ActionButton.MouseLeave:Connect(function()
            TweenService:Create(ActionButton, TweenInfo.new(0.3), {
                Size = UDim2.new(0.45, 0, 0.3, 0),
                Position = UDim2.new(0.05 + col*0.475, 0, 0.28 + row*0.35, 0)
            }):Play()
        end)
    end
    
    -- Botón Reset Character premium mejorado
    local ResetCharFrame = Instance.new("Frame")
    ResetCharFrame.Name = "ResetCharFrame"
    ResetCharFrame.Parent = PlayerPanel
    ResetCharFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
    ResetCharFrame.Position = UDim2.new(0.02, 0, 0.7, 0)
    ResetCharFrame.Size = UDim2.new(0.96, 0, 0.28, 0)
    
    local ResetCharCorner = Instance.new("UICorner")
    ResetCharCorner.CornerRadius = UDim.new(0, 12)
    ResetCharCorner.Parent = ResetCharFrame
    
    local resetGradient = Instance.new("UIGradient")
    resetGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 105)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
    })
    resetGradient.Rotation = 90
    resetGradient.Parent = ResetCharFrame
    
    local ResetCharBtn = Instance.new("TextButton")
    ResetCharBtn.Name = "ResetCharBtn"
    ResetCharBtn.Parent = ResetCharFrame
    ResetCharBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 60)
    ResetCharBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
    ResetCharBtn.Size = UDim2.new(0.9, 0, 0.6, 0)
    ResetCharBtn.Font = Enum.Font.GothamBold
    ResetCharBtn.Text = "🔄 RESET CHARACTER"
    ResetCharBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResetCharBtn.TextSize = 16
    
    local ResetCharBtnCorner = Instance.new("UICorner")
    ResetCharBtnCorner.CornerRadius = UDim.new(0, 10)
    ResetCharBtnCorner.Parent = ResetCharBtn
    
    -- Animación hover para reset button
    ResetCharBtn.MouseEnter:Connect(function()
        TweenService:Create(ResetCharBtn, TweenInfo.new(0.3), {
            Size = UDim2.new(0.92, 0, 0.65, 0),
            Position = UDim2.new(0.04, 0, 0.175, 0)
        }):Play()
    end)
    
    ResetCharBtn.MouseLeave:Connect(function()
        TweenService:Create(ResetCharBtn, TweenInfo.new(0.3), {
            Size = UDim2.new(0.9, 0, 0.6, 0),
            Position = UDim2.new(0.05, 0, 0.2, 0)
        }):Play()
    end)
    
    -- ===== PANEL DE MOVIMIENTO ULTRA PREMIUM =====
    local MovementPanel = Instance.new("Frame")
    MovementPanel.Name = "MovementPanel"
    MovementPanel.Parent = ContentContainer
    MovementPanel.BackgroundTransparency = 1
    MovementPanel.Size = UDim2.new(1, 0, 1, 0)
    MovementPanel.Visible = false
    
    -- Scroll para movimiento premium
    local MovementScroll = Instance.new("ScrollingFrame")
    MovementScroll.Name = "MovementScroll"
    MovementScroll.Parent = MovementPanel
    MovementScroll.BackgroundTransparency = 1
    MovementScroll.Position = UDim2.new(0, 10, 0, 10)
    MovementScroll.Size = UDim2.new(1, -20, 1, -20)
    MovementScroll.CanvasSize = UDim2.new(0, 0, 2.2, 0)
    MovementScroll.ScrollBarThickness = 10
    MovementScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
    
    local MovementLayout = Instance.new("UIListLayout")
    MovementLayout.Parent = MovementScroll
    MovementLayout.Padding = UDim.new(0, 18)
    MovementLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Sliders y botones de movimiento premium
    CreatePremiumSlider("SuperJump", "Super Jump Power", 50, 500, 150, function(value)
        Config.SuperJump = value
    end).Parent = MovementScroll
    
    CreatePremiumButton("SuperJumpBtn", "Activate Super Jump", "J", function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = Config.SuperJump
            UpdateButtonState("SuperJumpBtn", true)
            Notify("SUPER JUMP PRO", "Activated: " .. Config.SuperJump .. " power!", 2)
            wait(2)
            UpdateButtonState("SuperJumpBtn", false)
        end
    end).Parent = MovementScroll
    
    CreatePremiumSlider("SuperSpeed", "Super Speed", 16, 300, 120, function(value)
        Config.SuperSpeed = value
    end).Parent = MovementScroll
    
    CreatePremiumButton("SuperSpeedBtn", "Activate Super Speed", "R", function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Config.SuperSpeed
            UpdateButtonState("SuperSpeedBtn", true)
            Notify("SUPER SPEED PRO", "Activated: " .. Config.SuperSpeed .. " speed!", 2)
            wait(2)
            UpdateButtonState("SuperSpeedBtn", false)
        end
    end).Parent = MovementScroll
    
    CreatePremiumSlider("FlySpeed", "Fly Speed", 10, 200, 75, function(value)
        Config.FlySpeed = value
    end).Parent = MovementScroll
    
    CreatePremiumButton("FlyBtn", "Toggle Flight System", "F", function()
        Config.Flying = not Config.Flying
        UpdateButtonState("FlyBtn", Config.Flying)
        ToggleFlying(Config.Flying)
    end).Parent = MovementScroll
    
    CreatePremiumButton("NoClipBtn", "Toggle NoClip", "N", function()
        Config.NoClip = not Config.NoClip
        UpdateButtonState("NoClipBtn", Config.NoClip)
        
        if Config.NoClip then
            Notify("NOCLIP PRO", "Activated - Phase through walls!", 2)
            
            if Config.NoclipConnection then
                Config.NoclipConnection:Disconnect()
            end
            
            Config.NoclipConnection = RunService.Stepped:Connect(function()
                if not Config.NoClip then
                    Config.NoclipConnection:Disconnect()
                    return
                end
                
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            Notify("NOCLIP PRO", "Deactivated", 1)
            if Config.NoclipConnection then
                Config.NoclipConnection:Disconnect()
                Config.NoclipConnection = nil
            end
        end
    end).Parent = MovementScroll
    
    CreatePremiumButton("InfiniteJumpBtn", "Infinite Jump", "H", function()
        Config.InfiniteJump = not Config.InfiniteJump
        UpdateButtonState("InfiniteJumpBtn", Config.InfiniteJump)
        Notify("INFINITE JUMP", Config.InfiniteJump and "Activated" or "Deactivated")
    end).Parent = MovementScroll
    
    -- ===== PANEL DE COMBATE ULTRA PREMIUM =====
    local CombatPanel = Instance.new("Frame")
    CombatPanel.Name = "CombatPanel"
    CombatPanel.Parent = ContentContainer
    CombatPanel.BackgroundTransparency = 1
    CombatPanel.Size = UDim2.new(1, 0, 1, 0)
    CombatPanel.Visible = false
    
    local CombatScroll = Instance.new("ScrollingFrame")
    CombatScroll.Name = "CombatScroll"
    CombatScroll.Parent = CombatPanel
    CombatScroll.BackgroundTransparency = 1
    CombatScroll.Position = UDim2.new(0, 10, 0, 10)
    CombatScroll.Size = UDim2.new(1, -20, 1, -20)
    CombatScroll.CanvasSize = UDim2.new(0, 0, 3.2, 0)
    CombatScroll.ScrollBarThickness = 10
    
    local CombatLayout = Instance.new("UIListLayout")
    CombatLayout.Parent = CombatScroll
    CombatLayout.Padding = UDim.new(0, 18)
    
    -- Botones de combate premium
    CreatePremiumButton("GodModeBtn", "God Mode - Invincibility", "G", function()
        Config.GodMode = not Config.GodMode
        UpdateButtonState("GodModeBtn", Config.GodMode)
        
        if Config.GodMode then
            GodModeSystem.Enable()
            Notify("GOD MODE PRO", "Advanced protection ACTIVATED! (Anti-headshot)")
        else
            GodModeSystem.Disable()
            Notify("GOD MODE PRO", "Deactivated")
        end
    end).Parent = CombatScroll
    
    CreatePremiumButton("KillAllBtn", "Kill All Players", "K", function()
        Notify("KILL ALL PRO", "Executing elimination protocol...", 1)
        local killed, total = BypassSystem.KillAll()
        Notify("KILL ALL PRO", "Eliminated " .. killed .. "/" .. total .. " players!", 2)
    end).Parent = CombatScroll
    
    CreatePremiumButton("OneHitKillBtn", "One Hit Kill", "U", function()
        Config.OneHitKill = not Config.OneHitKill
        UpdateButtonState("OneHitKillBtn", Config.OneHitKill)
        Notify("ONE HIT KILL", Config.OneHitKill and "Activated" or "Deactivated")
    end).Parent = CombatScroll
    
    CreatePremiumButton("KillAuraBtn", "Kill Aura", "PageUp", function()
        Config.KillAura = not Config.KillAura
        UpdateButtonState("KillAuraBtn", Config.KillAura)
        Notify("KILL AURA", Config.KillAura and "Activated" or "Deactivated")
    end).Parent = CombatScroll
    
    CreatePremiumButton("ForceFieldBtn", "Force Field", "6", function()
        Config.ForceField = not Config.ForceField
        UpdateButtonState("ForceFieldBtn", Config.ForceField)
        Notify("FORCE FIELD", Config.ForceField and "Activated" or "Deactivated")
    end).Parent = CombatScroll
    
    -- AIMBOT premium MEJORADO
    CreatePremiumSlider("AimbotFOV", "Aimbot Field of View", 10, 200, 50, function(value)
        Config.AimbotFOV = value
    end).Parent = CombatScroll
    
    CreatePremiumSlider("AimbotSmooth", "Aimbot Smoothness", 1, 20, 10, function(value)
        Config.AimbotSmoothness = value
    end).Parent = CombatScroll
    
    CreatePremiumButton("AimbotBtn", "Toggle Aimbot System", "Q", function()
        Config.Aimbot = not Config.Aimbot
        UpdateButtonState("AimbotBtn", Config.Aimbot)
        ToggleAimbot(Config.Aimbot)
    end).Parent = CombatScroll
    
    -- ===== PANEL DE MUNDO ULTRA PREMIUM =====
    local WorldPanel = Instance.new("Frame")
    WorldPanel.Name = "WorldPanel"
    WorldPanel.Parent = ContentContainer
    WorldPanel.BackgroundTransparency = 1
    WorldPanel.Size = UDim2.new(1, 0, 1, 0)
    WorldPanel.Visible = false
    
    local WorldScroll = Instance.new("ScrollingFrame")
    WorldScroll.Name = "WorldScroll"
    WorldScroll.Parent = WorldPanel
    WorldScroll.BackgroundTransparency = 1
    WorldScroll.Position = UDim2.new(0, 10, 0, 10)
    WorldScroll.Size = UDim2.new(1, -20, 1, -20)
    WorldScroll.CanvasSize = UDim2.new(0, 0, 1.5, 0)
    WorldScroll.ScrollBarThickness = 10
    
    local WorldLayout = Instance.new("UIListLayout")
    WorldLayout.Parent = WorldScroll
    WorldLayout.Padding = UDim.new(0, 18)
    
    -- Botones de mundo premium
    CreatePremiumButton("DayBtn", "Set Day Time", "PageDown", function()
        Lighting.ClockTime = 12
        Lighting.Brightness = 2
        Notify("TIME CONTROL", "World set to Day mode")
    end).Parent = WorldScroll
    
    CreatePremiumButton("NightBtn", "Set Night Time", "L", function()
        Lighting.ClockTime = 0
        Lighting.Brightness = 0.2
        Notify("TIME CONTROL", "World set to Night mode")
    end).Parent = WorldScroll
    
    CreatePremiumButton("FullbrightBtn", "Toggle Fullbright", "B", function()
        Config.Fullbright = not Config.Fullbright
        UpdateButtonState("FullbrightBtn", Config.Fullbright)
        
        if Config.Fullbright then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 10
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            Notify("FULLBRIGHT PRO", "Activated - Maximum brightness!")
        else
            Lighting.Ambient = Color3.fromRGB(1, 1, 1)
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            Notify("FULLBRIGHT PRO", "Deactivated")
        end
    end).Parent = WorldScroll
    
    CreatePremiumSlider("Gravity", "World Gravity", 0, 196, 196, function(value)
        workspace.Gravity = value
        Notify("GRAVITY CONTROL", "Set to: " .. value)
    end).Parent = WorldScroll
    
    CreatePremiumButton("ToxicBtn", "Toxic Mode", "T", function()
        Config.ToxicMode = not Config.ToxicMode
        UpdateButtonState("ToxicBtn", Config.ToxicMode)
        
        if Config.ToxicMode then
            Lighting.Ambient = Color3.fromRGB(50, 0, 0)
            Lighting.Brightness = 0.5
            Lighting.FogColor = Color3.fromRGB(100, 0, 0)
            Lighting.FogEnd = 200
            Lighting.FogStart = 0
            Notify("TOXIC MODE", "Activated - Toxic environment!")
        else
            Lighting.Ambient = Color3.fromRGB(1, 1, 1)
            Lighting.Brightness = 1
            Lighting.FogColor = Color3.fromRGB(191, 191, 191)
            Lighting.FogEnd = 100000
            Notify("TOXIC MODE", "Deactivated")
        end
    end).Parent = WorldScroll
    
    -- ===== PANEL DE VISUAL ULTRA PREMIUM =====
    local VisualPanel = Instance.new("Frame")
    VisualPanel.Name = "VisualPanel"
    VisualPanel.Parent = ContentContainer
    VisualPanel.BackgroundTransparency = 1
    VisualPanel.Size = UDim2.new(1, 0, 1, 0)
    VisualPanel.Visible = false
    
    local VisualScroll = Instance.new("ScrollingFrame")
    VisualScroll.Name = "VisualScroll"
    VisualScroll.Parent = VisualPanel
    VisualScroll.BackgroundTransparency = 1
    VisualScroll.Position = UDim2.new(0, 10, 0, 10)
    VisualScroll.Size = UDim2.new(1, -20, 1, -20)
    VisualScroll.CanvasSize = UDim2.new(0, 0, 3.2, 0)
    VisualScroll.ScrollBarThickness = 10
    
    local VisualLayout = Instance.new("UIListLayout")
    VisualLayout.Parent = VisualScroll
    VisualLayout.Padding = UDim.new(0, 18)
    
    -- Botones visuales premium
    CreatePremiumButton("EspBtn", "ESP Players", "E", function()
        Config.Esp = not Config.Esp
        UpdateButtonState("EspBtn", Config.Esp)
        ToggleEsp(Config.Esp)
    end).Parent = VisualScroll
    
    CreatePremiumButton("EspTracersBtn", "ESP Tracers", "", function()
        Config.EspTracers = not Config.EspTracers
        UpdateButtonState("EspTracersBtn", Config.EspTracers)
        Notify("ESP ENHANCEMENT", "Tracers " .. (Config.EspTracers and "ENABLED" or "DISABLED"))
    end).Parent = VisualScroll
    
    CreatePremiumButton("ChamsBtn", "Chams", "C", function()
        Config.Chams = not Config.Chams
        UpdateButtonState("ChamsBtn", Config.Chams)
        Notify("CHAMS", Config.Chams and "Activated" or "Deactivated")
    end).Parent = VisualScroll
    
    CreatePremiumButton("XrayBtn", "X-Ray Vision", "X", function()
        Config.Xray = not Config.Xray
        UpdateButtonState("XrayBtn", Config.Xray)
        Notify("X-RAY VISION", Config.Xray and "Activated" or "Deactivated")
    end).Parent = VisualScroll
    
    -- Wallhack con Z
    CreatePremiumButton("WallhackBtn", "Wallhack", "Z", function()
        Config.Wallhack = not Config.Wallhack
        UpdateButtonState("WallhackBtn", Config.Wallhack)
        ToggleWallhack(Config.Wallhack)
    end).Parent = VisualScroll
    
    -- ===== PANEL DE SETTINGS ULTRA PREMIUM =====
    local ShortcutsPanel = Instance.new("Frame")
    ShortcutsPanel.Name = "ShortcutsPanel"
    ShortcutsPanel.Parent = ContentContainer
    ShortcutsPanel.BackgroundTransparency = 1
    ShortcutsPanel.Size = UDim2.new(1, 0, 1, 0)
    ShortcutsPanel.Visible = false
    
    local ShortcutsScroll = Instance.new("ScrollingFrame")
    ShortcutsScroll.Name = "ShortcutsScroll"
    ShortcutsScroll.Parent = ShortcutsPanel
    ShortcutsScroll.BackgroundTransparency = 1
    ShortcutsScroll.Position = UDim2.new(0, 10, 0, 10)
    ShortcutsScroll.Size = UDim2.new(1, -20, 1, -20)
    ShortcutsScroll.CanvasSize = UDim2.new(0, 0, 3.5, 0)
    ShortcutsScroll.ScrollBarThickness = 10
    
    local ShortcutsLayout = Instance.new("UIListLayout")
    ShortcutsLayout.Parent = ShortcutsScroll
    ShortcutsLayout.Padding = UDim.new(0, 15)
    
    -- Función crear shortcut item ultra premium
    local function CreatePremiumShortcutItem(key, description)
        local item = Instance.new("Frame")
        item.Name = key .. "Item"
        item.BackgroundColor3 = Color3.fromRGB(45, 45, 85)
        item.Size = UDim2.new(1, 0, 0, 50)
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 12)
        corner.Parent = item
        
        local itemGradient = Instance.new("UIGradient")
        itemGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 85))
        })
        itemGradient.Rotation = 90
        itemGradient.Parent = item
        
        -- Key con estilo premium
        local keyLabel = Instance.new("TextLabel")
        keyLabel.Name = "Key"
        keyLabel.Parent = item
        keyLabel.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        keyLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
        keyLabel.Size = UDim2.new(0.18, 0, 0.7, 0)
        keyLabel.Font = Enum.Font.GothamBold
        keyLabel.Text = key
        keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        keyLabel.TextSize = 15
        
        local keyCorner = Instance.new("UICorner")
        keyCorner.CornerRadius = UDim.new(0, 10)
        keyCorner.Parent = keyLabel
        
        -- Description premium
        local descLabel = Instance.new("TextLabel")
        descLabel.Name = "Desc"
        descLabel.Parent = item
        descLabel.BackgroundTransparency = 1
        descLabel.Position = UDim2.new(0.28, 0, 0, 0)
        descLabel.Size = UDim2.new(0.67, 0, 1, 0)
        descLabel.Font = Enum.Font.GothamMedium
        descLabel.Text = description
        descLabel.TextColor3 = Color3.fromRGB(220, 240, 255)
        descLabel.TextSize = 14
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        return item
    end
    
    -- Shortcuts premium
    local shortcuts = {
        {"INSERT", "Toggle Menu Visibility"},
        {"F", "Toggle Flight System"},
        {"G", "God Mode - Invincibility"},
        {"J", "Activate Super Jump"},
        {"R", "Activate Super Speed"},
        {"N", "Toggle NoClip"},
        {"K", "Kill All Players"},
        {"M", "Teleport to Mouse"},
        {"P", "Teleport to Base"},
        {"PageDown", "Set Day Time"},
        {"L", "Set Night Time"},
        {"B", "Toggle Fullbright"},
        {"X", "Toggle X-Ray Vision"},
        {"E", "Toggle ESP System"},
        {"C", "Toggle Chams"},
        {"Z", "Toggle Wallhack"},
        {"Q", "Toggle Aimbot"},
        {"O", "Reset Character"},
        {"H", "Toggle Infinite Jump"},
        {"T", "Toggle Toxic Mode"},
        {"U", "Toggle One Hit Kill"},
        {"PageUp", "Toggle Kill Aura"},
        {"2", "Toggle Auto Clicker"},
        {"6", "Toggle Force Field"},
        {"1", "Toggle Anti AFK"},
        {"F5", "Anti-Kick System"},
        {"F6", "Attack Detection"},
        {"F7", "Security Monitor"},
        {"F8", "Scan Anti-Cheat"}
    }
    
    for _, shortcut in ipairs(shortcuts) do
        CreatePremiumShortcutItem(shortcut[1], shortcut[2]).Parent = ShortcutsScroll
    end
    
    -- ===== FUNCIONALIDADES PRINCIPALES =====
    
    -- Función para cambiar pestañas
    local function SwitchTab(tabName)
        PlayerPanel.Visible = false
        MovementPanel.Visible = false
        CombatPanel.Visible = false
        WorldPanel.Visible = false
        VisualPanel.Visible = false
        SecurityPanel.Visible = false
        ShortcutsPanel.Visible = false
        
        if tabName == "PlayerControls" then
            PlayerPanel.Visible = true
        elseif tabName == "Movement" then
            MovementPanel.Visible = true
        elseif tabName == "Combat" then
            CombatPanel.Visible = true
        elseif tabName == "World" then
            WorldPanel.Visible = true
        elseif tabName == "Visual" then
            VisualPanel.Visible = true
        elseif tabName == "Security" then
            SecurityPanel.Visible = true
        elseif tabName == "Shortcuts" then
            ShortcutsPanel.Visible = true
        end
    end
    
    -- Conectar botones de pestañas
    for i, tab in ipairs(tabs) do
        local tabButton = TabsHeader:FindFirstChild(tab[2] .. "Tab")
        if tabButton then
            tabButton.MouseButton1Click:Connect(function()
                SwitchTab(tab[2])
                
                -- Resaltar pestaña activa premium
                for _, otherTab in ipairs(tabs) do
                    local otherButton = TabsHeader:FindFirstChild(otherTab[2] .. "Tab")
                    if otherButton then
                        TweenService:Create(otherButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                            BackgroundColor3 = Color3.fromRGB(60, 60, 110),
                            TextColor3 = Color3.fromRGB(220, 240, 255)
                        }):Play()
                    end
                end
                
                TweenService:Create(tabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                    BackgroundColor3 = Color3.fromRGB(0, 170, 255),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end)
        end
    end
    
    -- Botón buscar jugador mejorado
    SearchBtn.MouseButton1Click:Connect(function()
        local input = PlayerInput.Text
        if input == "" then
            Notify("ERROR", "Please enter a username or ID")
            return
        end
        
        local player = GetPlayerFromInput(input)
        if player then
            Config.SelectedPlayer = player
            PlayerInfoFrame.Visible = true
            
            PlayerName.Text = "👤 Player: " .. player.Name
            PlayerId.Text = "🆔 ID: " .. tostring(player.UserId)
            PlayerStatus.Text = "📊 Status: Found ✅"
            PlayerStatus.TextColor3 = Color3.fromRGB(0, 255, 100)
            
            for _, action in ipairs(actions) do
                local btn = ActionFrame:FindFirstChild(action[1]:gsub("%s", "") .. "Btn")
                if btn then
                    btn.Visible = true
                end
            end
            
            Notify("PLAYER FOUND", "Selected: " .. player.Name .. " (ID: " .. player.UserId .. ")")
        else
            Notify("ERROR", "Player not found: " .. input)
            PlayerInfoFrame.Visible = false
            for _, action in ipairs(actions) do
                local btn = ActionFrame:FindFirstChild(action[1]:gsub("%s", "") .. "Btn")
                if btn then
                    btn.Visible = false
                end
            end
        end
    end)
    
    -- TP To Player MEJORADO
    local TPToBtn = ActionFrame:FindFirstChild("📡TPTOBtn")
    if TPToBtn then
        TPToBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer then
                local success = TeleportToPlayer(Config.SelectedPlayer)
                if not success then
                    Notify("ERROR", "Failed to teleport to " .. Config.SelectedPlayer.Name)
                end
            else
                Notify("ERROR", "No player selected")
            end
        end)
    end
    
    -- Bring Player MEJORADO
    local BringBtn = ActionFrame:FindFirstChild("🎯BRINGBtn")
    if BringBtn then
        BringBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer then
                local success = BringPlayer(Config.SelectedPlayer)
                if not success then
                    Notify("ERROR", "Failed to bring " .. Config.SelectedPlayer.Name)
                end
            else
                Notify("ERROR", "No player selected")
            end
        end)
    end
    
    -- Spectate Player MEJORADO
    local SpectateBtn = ActionFrame:FindFirstChild("👁️SPECTATEBtn")
    if SpectateBtn then
        SpectateBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer then
                SpectatePlayer(Config.SelectedPlayer)
                if Config.Spectating then
                    SpectateBtn.Text = "⛔ STOP"
                    SpectateBtn.BackgroundColor3 = Color3.fromRGB(255, 120, 120)
                    Notify("SPECTATE", "Now spectating " .. Config.SelectedPlayer.Name)
                else
                    SpectateBtn.Text = "👁️ SPECTATE"
                    SpectateBtn.BackgroundColor3 = Color3.fromRGB(210, 110, 255)
                    Notify("SPECTATE", "Stopped spectating")
                end
            else
                Notify("ERROR", "No player selected")
            end
        end)
    end
    
    -- Kill Player MEJORADO
    local KillBtn = ActionFrame:FindFirstChild("💀KILLBtn")
    if KillBtn then
        KillBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer then
                BypassSystem.Kill(Config.SelectedPlayer)
            else
                Notify("ERROR", "No player selected")
            end
        end)
    end
    
    -- Botón reset character
    ResetCharBtn.MouseButton1Click:Connect(function()
        if LocalPlayer.Character then
            LocalPlayer.Character:BreakJoints()
            Notify("CHARACTER RESET", "Character reset successfully!")
        end
    end)
    
    -- Botón cerrar con confirmación
    CloseButton.MouseButton1Click:Connect(function()
        -- Confirmación
        if Config.Spectating then
            Config.Spectating = false
            if Config.OriginalCameraSubject then
                workspace.CurrentCamera.CameraSubject = Config.OriginalCameraSubject
            end
        end
        
        if EspConnection then
            EspConnection:Disconnect()
        end
        for _, obj in pairs(GuiElements.EspObjects) do
            if obj then obj:Destroy() end
        end
        
        if AimbotConnection then
            AimbotConnection:Disconnect()
        end
        
        ToggleWallhack(false)
        
        -- Efecto de cierre
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        
        wait(0.6)
        ScreenGui:Destroy()
        Notify("MENU", "ULTRA PREMIUM Panel closed")
    end)
    
    -- REEMPLAZA LA SECCIÓN DE MINIMIZAR EN LOS EVENTOS DE BOTONES:

-- Botón minimizar - SOLUCIÓN MEJORADA
MinimizeButton.MouseButton1Click:Connect(function()
    Config.MenuOpen = not Config.MenuOpen
    
    if Config.MenuOpen then
        -- Mostrar menú con animación
        MainFrame.Visible = true
        MainFrame.Position = UDim2.new(0.5, -400, 0.5, -350)
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 800, 0, 700),
            Position = UDim2.new(0.5, -400, 0.5, -350)
        }):Play()
        
        Notify("MENU", "⚡ ULTRA PREMIUM Panel visible")
    else
        -- Ocultar menú con animación
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        
        wait(0.35) -- Esperar a que termine la animación
        MainFrame.Visible = false
        
        Notify("MENU", "ULTRA PREMIUM Panel hidden")
    end
end)

-- LUEGO, MODIFICA EL ATALHO DEL INSERT PARA QUE SEA MÁS ROBUSTO:

local InsertToggleCooldown = false

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    -- Atajo para abrir/cerrar menú (INSERT) - SISTEMA MEJORADO Y REPARADO
    if input.KeyCode == Enum.KeyCode.Insert then
        if InsertToggleCooldown then return end
        InsertToggleCooldown = true
        
        Config.MenuOpen = not Config.MenuOpen
        
        if Config.MenuOpen then
            -- Asegurarse de que el frame sea visible ANTES de animar
            MainFrame.Visible = true
            MainFrame.Position = UDim2.new(0.5, -400, 0.5, -350)
            MainFrame.Size = UDim2.new(0, 0, 0, 0)
            
            TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 800, 0, 700),
                Position = UDim2.new(0.5, -400, 0.5, -350)
            }):Play()
            
            Notify("MENU", "⚡ ULTRA PREMIUM Panel visible")
        else
            -- Ocultar con animación
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            
            wait(0.35) -- Esperar a que termine la animación antes de ocultar
            MainFrame.Visible = false
            
            Notify("MENU", "ULTRA PREMIUM Panel hidden")
        end
        
        wait(0.2)
        InsertToggleCooldown = false
        return
    end
    
    -- ... el resto de los atajos permanece igual
end)
    
    -- Inicializar estados de botones
    UpdateButtonState("SuperJumpBtn", false)
    UpdateButtonState("SuperSpeedBtn", false)
    UpdateButtonState("FlyBtn", false)
    UpdateButtonState("NoClipBtn", false)
    UpdateButtonState("InfiniteJumpBtn", false)
    UpdateButtonState("GodModeBtn", false)
    UpdateButtonState("OneHitKillBtn", false)
    UpdateButtonState("KillAuraBtn", false)
    UpdateButtonState("FullbrightBtn", false)
    UpdateButtonState("XrayBtn", false)
    UpdateButtonState("ToxicBtn", false)
    UpdateButtonState("EspBtn", false)
    UpdateButtonState("ChamsBtn", false)
    UpdateButtonState("ForceFieldBtn", false)
    UpdateButtonState("AimbotBtn", false)
    UpdateButtonState("WallhackBtn", false)
    UpdateButtonState("EspTracersBtn", false)
    
    -- Estados de seguridad
    UpdateButtonState("AntiKick", false)
    UpdateButtonState("ClickDetection", false)
    UpdateButtonState("SecurityMonitor", false)
    UpdateButtonState("CheckAntiCheat", false)
    
    return ScreenGui, MainFrame
end

-- ============================================
-- SISTEMA ADICIONAL MEJORADO
-- ============================================

local function SetupAdditionalFeatures()
    -- Infinite Jump mejorado
    spawn(function()
        while true do
            if Config.InfiniteJump and LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    if UIS:IsKeyDown(Enum.KeyCode.Space) and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
            wait(0.05)
        end
    end)
    
    -- Anti AFK mejorado
    spawn(function()
        while true do
            if Config.AntiAfk then
                local cam = workspace.CurrentCamera
                local original = cam.CFrame
                cam.CFrame = cam.CFrame * CFrame.Angles(0, math.rad(1), 0)
                wait(0.5)
                cam.CFrame = original
                wait(29.5)
            else
                wait(2)
            end
        end
    end)
    
    -- Force Field mejorado
    spawn(function()
        while true do
            if Config.ForceField and LocalPlayer.Character then
                local char = LocalPlayer.Character
                if not char:FindFirstChild("ForceFieldBypass") then
                    local forceField = Instance.new("ForceField")
                    forceField.Name = "ForceFieldBypass"
                    forceField.Parent = char
                    
                    -- Efecto visual
                    local part = Instance.new("Part")
                    part.Name = "ForceFieldVisual"
                    part.Shape = Enum.PartType.Ball
                    part.Size = Vector3.new(15, 15, 15)
                    part.Transparency = 0.7
                    part.Color = Color3.fromRGB(0, 150, 255)
                    part.Material = Enum.Material.Neon
                    part.Anchored = false
                    part.CanCollide = false
                    part.Parent = char
                    part:SetNetworkOwner(nil)
                    
                    local weld = Instance.new("Weld")
                    weld.Part0 = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
                    weld.Part1 = part
                    weld.Parent = part
                end
            elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("ForceFieldBypass") then
                LocalPlayer.Character.ForceFieldBypass:Destroy()
                local visual = LocalPlayer.Character:FindFirstChild("ForceFieldVisual")
                if visual then visual:Destroy() end
            end
            wait(1)
        end
    end)
    
    -- Kill Aura mejorado
    spawn(function()
        while true do
            if Config.KillAura and LocalPlayer.Character then
                local char = LocalPlayer.Character
                local myHRP = char:FindFirstChild("HumanoidRootPart")
                if myHRP then
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local targetChar = player.Character
                            local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                            if targetHRP then
                                local distance = (myHRP.Position - targetHRP.Position).Magnitude
                                if distance < 25 then
                                    BypassSystem.Kill(player)
                                    wait(0.2)
                                end
                            end
                        end
                    end
                end
            end
            wait(0.3)
        end
    end)
    
    -- One Hit Kill mejorado
    spawn(function()
        while true do
            if Config.OneHitKill and LocalPlayer.Character then
                local char = LocalPlayer.Character
                for _, tool in pairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        tool.Activated:Connect(function()
                            for _, player in pairs(Players:GetPlayers()) do
                                if player ~= LocalPlayer and player.Character then
                                    local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                                    if targetHRP then
                                        local distance = (char:FindFirstChild("HumanoidRootPart").Position - targetHRP.Position).Magnitude
                                        if distance < 50 then
                                            BypassSystem.Kill(player)
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end
            end
            wait(1)
        end
    end)
    
    -- Auto Clicker mejorado
    spawn(function()
        while true do
            if Config.AutoClicker then
                local clickDelay = 0.05 + math.random() * 0.1
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                wait(clickDelay/2)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
                wait(clickDelay)
            else
                wait(0.5)
            end
        end
    end)
end

-- Crear la GUI ULTRA PREMIUM
local ScreenGui, MainFrame = CreateUltraPremiumGUI()

-- Iniciar sistemas de seguridad automáticamente
SetupAntiKick()
SetupClickDetection()
StartSecurityMonitoring()

-- Iniciar funcionalidades adicionales
SetupAdditionalFeatures()

-- ============================================
-- SISTEMA DE ATAJOS UNIFICADO Y REPARADO
-- ============================================

local InsertToggleCooldown = false
local KeyCooldowns = {}

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    local key = input.KeyCode.Name
    if KeyCooldowns[key] and tick() - KeyCooldowns[key] < 0.3 then
        return
    end
    KeyCooldowns[key] = tick()
    
    -- Atajo INSERT para abrir/cerrar menú - FIXED
    if input.KeyCode == Enum.KeyCode.Insert then
        if InsertToggleCooldown then return end
        InsertToggleCooldown = true
        
        Config.MenuOpen = not Config.MenuOpen
        
        if Config.MenuOpen then
            -- Asegurar que el frame sea visible ANTES de animar
            MainFrame.Visible = true
            MainFrame.Position = UDim2.new(0.5, -400, 0.5, -350)
            MainFrame.Size = UDim2.new(0, 0, 0, 0)
            
            TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 800, 0, 700),
                Position = UDim2.new(0.5, -400, 0.5, -350)
            }):Play()
            
            Notify("MENU", "⚡ ULTRA PREMIUM Panel visible", 1)
        else
            -- Ocultar con animación
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            
            wait(0.35)
            MainFrame.Visible = false
            
            Notify("MENU", "ULTRA PREMIUM Panel hidden", 1)
        end
        
        wait(0.2)
        InsertToggleCooldown = false
        return
    end
    
    -- Atajos de funciones SOLO cuando no hay texto seleccionado
    if not UIS:GetFocusedTextBox() then
        -- Super Jump [J]
        if input.KeyCode == Enum.KeyCode.J then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = Config.SuperJump
                UpdateButtonState("SuperJumpBtn", true)
                Notify("SUPER JUMP PRO", "Activated: " .. Config.SuperJump .. " power!", 2)
                wait(2)
                UpdateButtonState("SuperJumpBtn", false)
            end
        end
        
        -- Super Speed [R]
        if input.KeyCode == Enum.KeyCode.R then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = Config.SuperSpeed
                UpdateButtonState("SuperSpeedBtn", true)
                Notify("SUPER SPEED PRO", "Activated: " .. Config.SuperSpeed .. " speed!", 2)
                wait(2)
                UpdateButtonState("SuperSpeedBtn", false)
            end
        end
        
        -- Fly [F]
        if input.KeyCode == Enum.KeyCode.F then
            Config.Flying = not Config.Flying
            UpdateButtonState("FlyBtn", Config.Flying)
            ToggleFlying(Config.Flying)
        end
        
        -- God Mode [G]
        if input.KeyCode == Enum.KeyCode.G then
            Config.GodMode = not Config.GodMode
            UpdateButtonState("GodModeBtn", Config.GodMode)
            
            if Config.GodMode then
                GodModeSystem.Enable()
                Notify("GOD MODE PRO", "Advanced protection ACTIVATED! (Anti-headshot)", 2)
            else
                GodModeSystem.Disable()
                Notify("GOD MODE PRO", "Deactivated", 1)
            end
        end
        
        -- Kill All [K]
        if input.KeyCode == Enum.KeyCode.K then
            local killed, total = BypassSystem.KillAll()
            Notify("KILL ALL PRO", "Eliminated " .. killed .. "/" .. total .. " players!", 2)
        end
        
        -- TP to Mouse [M]
        if input.KeyCode == Enum.KeyCode.M then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local mousePos = Mouse.Hit.Position
                char.HumanoidRootPart.CFrame = CFrame.new(mousePos + Vector3.new(0, 3, 0))
                Notify("TELEPORT", "Teleported to mouse position", 1)
            end
        end
        
        -- TP to Base [P]
        if input.KeyCode == Enum.KeyCode.P then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                -- Buscar spawn point
                local spawnPoint = Vector3.new(0, 10, 0)
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj.Name:lower():find("spawn") or obj.Name:lower():find("base") then
                        if obj:IsA("BasePart") then
                            spawnPoint = obj.Position + Vector3.new(0, 3, 0)
                            break
                        end
                    end
                end
                
                char.HumanoidRootPart.CFrame = CFrame.new(spawnPoint)
                Notify("TELEPORT", "Teleported to base/spawn point", 1)
            end
        end
        
        -- NoClip [N]
        if input.KeyCode == Enum.KeyCode.N then
            Config.NoClip = not Config.NoClip
            UpdateButtonState("NoClipBtn", Config.NoClip)
            
            if Config.NoClip then
                Notify("NOCLIP PRO", "Activated - Phase through walls!", 2)
                
                if Config.NoclipConnection then
                    Config.NoclipConnection:Disconnect()
                end
                
                Config.NoclipConnection = RunService.Stepped:Connect(function()
                    if not Config.NoClip then
                        Config.NoclipConnection:Disconnect()
                        return
                    end
                    
                    if LocalPlayer.Character then
                        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            else
                Notify("NOCLIP PRO", "Deactivated", 1)
                if Config.NoclipConnection then
                    Config.NoclipConnection:Disconnect()
                    Config.NoclipConnection = nil
                end
            end
        end
        
        -- Day [PageDown]
        if input.KeyCode == Enum.KeyCode.PageDown then
            Lighting.ClockTime = 12
            Lighting.Brightness = 2
            Notify("TIME CONTROL", "World set to Day mode", 1)
        end
        
        -- Night [L]
        if input.KeyCode == Enum.KeyCode.L then
            Lighting.ClockTime = 0
            Lighting.Brightness = 0.2
            Notify("TIME CONTROL", "World set to Night mode", 1)
        end
        
        -- Fullbright [B]
        if input.KeyCode == Enum.KeyCode.B then
            Config.Fullbright = not Config.Fullbright
            UpdateButtonState("FullbrightBtn", Config.Fullbright)
            
            if Config.Fullbright then
                Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                Lighting.Brightness = 10
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
                Notify("FULLBRIGHT PRO", "Activated - Maximum brightness!", 2)
            else
                Lighting.Ambient = Color3.fromRGB(1, 1, 1)
                Lighting.Brightness = 1
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                Notify("FULLBRIGHT PRO", "Deactivated", 1)
            end
        end
        
        -- X-Ray [X]
        if input.KeyCode == Enum.KeyCode.X then
            Config.Xray = not Config.Xray
            UpdateButtonState("XrayBtn", Config.Xray)
            Notify("X-RAY VISION", Config.Xray and "Activated" or "Deactivated", 1)
        end
        
        -- ESP [E]
        if input.KeyCode == Enum.KeyCode.E then
            Config.Esp = not Config.Esp
            UpdateButtonState("EspBtn", Config.Esp)
            ToggleEsp(Config.Esp)
        end
        
        -- Chams [C]
        if input.KeyCode == Enum.KeyCode.C then
            Config.Chams = not Config.Chams
            UpdateButtonState("ChamsBtn", Config.Chams)
            Notify("CHAMS", Config.Chams and "Activated" or "Deactivated", 1)
        end
        
        -- Wallhack [Z]
        if input.KeyCode == Enum.KeyCode.Z then
            Config.Wallhack = not Config.Wallhack
            UpdateButtonState("WallhackBtn", Config.Wallhack)
            ToggleWallhack(Config.Wallhack)
        end
        
        -- Aimbot [Q]
        if input.KeyCode == Enum.KeyCode.Q then
            Config.Aimbot = not Config.Aimbot
            UpdateButtonState("AimbotBtn", Config.Aimbot)
            ToggleAimbot(Config.Aimbot)
        end
        
        -- Anti AFK [1]
        if input.KeyCode == Enum.KeyCode.One then
            Config.AntiAfk = not Config.AntiAfk
            UpdateButtonState("AntiAfkBtn", Config.AntiAfk)
            Notify("ANTI AFK", Config.AntiAfk and "Activated" or "Deactivated", 1)
            
            -- Actualizar botón visual
            if GuiElements.Indicators["AntiAfkBtn"] then
                GuiElements.Indicators["AntiAfkBtn"].Text = Config.AntiAfk and "ON" or "OFF"
                GuiElements.Indicators["AntiAfkBtn"].BackgroundColor3 = Config.AntiAfk and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 60, 60)
            end
        end
        
        -- Reset Character [O]
        if input.KeyCode == Enum.KeyCode.O then
            if LocalPlayer.Character then
                LocalPlayer.Character:BreakJoints()
                Notify("CHARACTER RESET", "Character reset successfully!", 1)
            end
        end
        
        -- Infinite Jump [H]
        if input.KeyCode == Enum.KeyCode.H then
            Config.InfiniteJump = not Config.InfiniteJump
            UpdateButtonState("InfiniteJumpBtn", Config.InfiniteJump)
            Notify("INFINITE JUMP", Config.InfiniteJump and "Activated" or "Deactivated", 1)
        end
        
        -- Toxic Mode [T]
        if input.KeyCode == Enum.KeyCode.T then
            Config.ToxicMode = not Config.ToxicMode
            UpdateButtonState("ToxicBtn", Config.ToxicMode)
            
            if Config.ToxicMode then
                Lighting.Ambient = Color3.fromRGB(50, 0, 0)
                Lighting.Brightness = 0.5
                Lighting.FogColor = Color3.fromRGB(100, 0, 0)
                Lighting.FogEnd = 200
                Lighting.FogStart = 0
                Notify("TOXIC MODE", "Activated - Toxic environment!", 2)
            else
                Lighting.Ambient = Color3.fromRGB(1, 1, 1)
                Lighting.Brightness = 1
                Lighting.FogColor = Color3.fromRGB(191, 191, 191)
                Lighting.FogEnd = 100000
                Notify("TOXIC MODE", "Deactivated", 1)
            end
        end
        
        -- One Hit Kill [U]
        if input.KeyCode == Enum.KeyCode.U then
            Config.OneHitKill = not Config.OneHitKill
            UpdateButtonState("OneHitKillBtn", Config.OneHitKill)
            Notify("ONE HIT KILL", Config.OneHitKill and "Activated" or "Deactivated", 1)
        end
        
        -- Kill Aura [PageUp]
        if input.KeyCode == Enum.KeyCode.PageUp then
            Config.KillAura = not Config.KillAura
            UpdateButtonState("KillAuraBtn", Config.KillAura)
            Notify("KILL AURA", Config.KillAura and "Activated" or "Deactivated", 1)
        end
        
        -- Auto Clicker [2]
        if input.KeyCode == Enum.KeyCode.Two then
            Config.AutoClicker = not Config.AutoClicker
            UpdateButtonState("AutoClickerBtn", Config.AutoClicker)
            Notify("AUTO CLICKER", Config.AutoClicker and "Activated" or "Deactivated", 1)
        end
        
        -- Force Field [6]
        if input.KeyCode == Enum.KeyCode.Six then
            Config.ForceField = not Config.ForceField
            UpdateButtonState("ForceFieldBtn", Config.ForceField)
            Notify("FORCE FIELD", Config.ForceField and "Activated" or "Deactivated", 1)
        end
        
        -- Security shortcuts
        if input.KeyCode == Enum.KeyCode.F5 then
            if not SecuritySystem.AntiKickActive then
                SetupAntiKick()
                Config.AntiKick = true
                UpdateButtonState("AntiKick", true)
                Notify("🛡️ ANTI-KICK", "Advanced protection activated!", 3)
            else
                Notify("🛡️ ANTI-KICK", "System already active!", 1)
            end
        end
        
        if input.KeyCode == Enum.KeyCode.F6 then
            Config.ClickDetection = not Config.ClickDetection
            UpdateButtonState("ClickDetection", Config.ClickDetection)
            
            if Config.ClickDetection then
                SetupClickDetection()
                Notify("🔴 ATTACK DETECTION", "System activated! You will be notified of attacks.", 3)
            else
                Notify("🔴 ATTACK DETECTION", "System deactivated", 1)
            end
        end
        
        if input.KeyCode == Enum.KeyCode.F7 then
            Config.SecurityMonitor = not Config.SecurityMonitor
            UpdateButtonState("SecurityMonitor", Config.SecurityMonitor)
            
            if Config.SecurityMonitor then
                StartSecurityMonitoring()
                Notify("🔍 SECURITY MONITOR", "24/7 monitoring activated!", 3)
            else
                Notify("🔍 SECURITY MONITOR", "Monitoring deactivated", 1)
            end
        end
        
        if input.KeyCode == Enum.KeyCode.F8 then
            local detected, cheatNames = DetectAntiCheat()
            
            if detected then
                SecuritySystem.AntiCheatDetected = true
                ShowAntiCheatWarning(cheatNames)
            else
                Notify("✅ CLEAN", "No anti-cheat detected!", 3)
            end
        end
    end
end)

-- ============================================
-- AÑADE ESTA FUNCIÓN PARA CREAR BOTONES FALTANTES
-- ============================================

-- Función para crear botones faltantes con sus estados
local function InitializeMissingButtons()
    -- Crear indicadores para botones faltantes
    local missingButtons = {
        "AntiAfkBtn",
        "AutoClickerBtn",
        "AntiAfk",
        "CheckAntiCheat"
    }
    
    for _, btnName in ipairs(missingButtons) do
        if not GuiElements.Indicators[btnName] then
            -- Crear un indicador temporal
            local tempIndicator = Instance.new("TextButton")
            tempIndicator.Name = btnName .. "Indicator"
            tempIndicator.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
            tempIndicator.Text = "OFF"
            tempIndicator.TextColor3 = Color3.fromRGB(255, 255, 255)
            tempIndicator.TextSize = 12
            tempIndicator.Size = UDim2.new(0, 40, 0, 35)
            tempIndicator.Visible = false
            
            GuiElements.Indicators[btnName] = tempIndicator
        end
    end
end

-- Inicializar botones faltantes
InitializeMissingButtons()

-- ============================================
-- SISTEMA DE ACTUALIZACIÓN DE ESTADOS
-- ============================================

-- Función para sincronizar todos los estados
local function SyncAllStates()
    UpdateButtonState("FlyBtn", Config.Flying)
    UpdateButtonState("GodModeBtn", Config.GodMode)
    UpdateButtonState("NoClipBtn", Config.NoClip)
    UpdateButtonState("InfiniteJumpBtn", Config.InfiniteJump)
    UpdateButtonState("OneHitKillBtn", Config.OneHitKill)
    UpdateButtonState("KillAuraBtn", Config.KillAura)
    UpdateButtonState("FullbrightBtn", Config.Fullbright)
    UpdateButtonState("XrayBtn", Config.Xray)
    UpdateButtonState("EspBtn", Config.Esp)
    UpdateButtonState("ChamsBtn", Config.Chams)
    UpdateButtonState("ForceFieldBtn", Config.ForceField)
    UpdateButtonState("AimbotBtn", Config.Aimbot)
    UpdateButtonState("WallhackBtn", Config.Wallhack)
    UpdateButtonState("EspTracersBtn", Config.EspTracers)
    UpdateButtonState("ToxicBtn", Config.ToxicMode)
    UpdateButtonState("AutoClickerBtn", Config.AutoClicker)
    
    -- Estados de seguridad
    UpdateButtonState("AntiKick", SecuritySystem.AntiKickActive)
    UpdateButtonState("ClickDetection", Config.ClickDetection)
    UpdateButtonState("SecurityMonitor", Config.SecurityMonitor)
    
    -- Anti-AFK
    if GuiElements.Indicators["AntiAfkBtn"] then
        GuiElements.Indicators["AntiAfkBtn"].Text = Config.AntiAfk and "ON" or "OFF"
        GuiElements.Indicators["AntiAfkBtn"].BackgroundColor3 = Config.AntiAfk and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 60, 60)
    end
end

-- Sincronizar estados al inicio
wait(1)
SyncAllStates()

-- Protección al respawnear
LocalPlayer.CharacterAdded:Connect(function(char)
    wait(1)
    if Config.GodMode then
        GodModeSystem.Enable()
    end
    if Config.ForceField then
        local forceField = Instance.new("ForceField")
        forceField.Name = "ForceFieldBypass"
        forceField.Parent = char
    end
end)

-- Detener espectar cuando el jugador se va
Players.PlayerRemoving:Connect(function(player)
    if Config.Spectating and Config.SelectedPlayer == player then
        Config.Spectating = false
        Config.SelectedPlayer = nil
        if Config.OriginalCameraSubject then
            workspace.CurrentCamera.CameraSubject = Config.OriginalCameraSubject
            Config.OriginalCameraSubject = nil
        end
        Notify("SPECTATE", "Player left, stopped spectating")
    end
end)

-- Detectar anti-cheat al inicio
spawn(function()
    wait(5)
    local detected, cheatNames = DetectAntiCheat()
    if detected then
        ShowAntiCheatWarning(cheatNames)
    end
end)

-- Notificación final ULTRA PREMIUM con seguridad
wait(1)
Notify("🎮 OUTLAST PANEL v2.0 ULTRA PREMIUM SECURITY", 
    "System loaded successfully! 🚀\n"..
    "• Press INSERT to toggle menu\n"..
    "• Security System: ACTIVE ✅\n"..
    "• Anti-Kick: ACTIVE (" .. SecuritySystem.KickAttempts .. " blocks)\n"..
    "• Attack Detection: ACTIVE ✅\n"..
    "• 24/7 Monitoring: ACTIVE ✅\n\n"..
    "🛡️ You will be notified if:\n"..
    "• Someone attacks you\n"..
    "• Anti-cheat is detected\n"..
    "• Kick attempts occur\n"..
    "• Click spam detected\n\n"..
    "• Wallhack: Z | Aimbot PRO: Q (HEADSHOT) | ESP: E\n"..
    "• God Mode PRO (G): Anti-headshot protection\n"..
    "• Teleport/Bring/Spectate/Kill players from Player tab\n\n"..
    "📋 NEW SHORTCUTS:\n"..
    "• M: Teleport to Mouse | P: Teleport to Base\n"..
    "• 1: Anti-AFK | 2: Auto Clicker | 6: Force Field", 12)

print("\n" .. string.rep("=", 90))
print("⚡ OUTLAST PANEL v2.0 - ULTRA PREMIUM SECURITY EDITION")
print(string.rep("=", 90))
print("🛡️ SECURITY SYSTEMS ACTIVATED:")
print("   • Anti-Kick Protection - Blocks kick attempts")
print("   • Attack Detection - Notifies when you're attacked")
print("   • Anti-Cheat Scanner - Detects anti-cheat systems")
print("   • 24/7 Security Monitor - Constant protection")
print("\n🎮 ENHANCED FUNCTIONALITIES:")
print("   • God Mode PRO (G) - Anti-headshot protection")
print("   • Aimbot PRO (Q) - Auto headshot with weapons")
print("   • Super Jump (J) | Super Speed (R)")
print("   • Flight System (F) | NoClip (N) | Infinite Jump (H)")
print("   • Wallhack (Z) | ESP (E) | X-Ray (X)")
print("   • Kill All (K) | One Hit Kill (U) | Kill Aura (PageUp)")
print("   • Fullbright (B) | Toxic Mode (T)")
print("\n🔴 ATTACK NOTIFICATIONS:")
print("   • You will receive notifications when attacked")
print("   • Attack logs saved (last 20 attacks)")
print("   • Attacker name and weapon displayed")
print("\n🔧 NEW SHORTCUTS ADDED:")
print("   INSERT - Toggle Menu (Already working ✅)")
print("   M - Teleport to Mouse position")
print("   P - Teleport to Base/Spawn")
print("   1 - Anti-AFK System")
print("   2 - Auto Clicker")
print("   6 - Force Field")
print("   O - Reset Character")
print("\n🛡️ SECURITY SHORTCUTS:")
print("   F5 - Anti-Kick System")
print("   F6 - Attack Detection")
print("   F7 - Security Monitor")
print("   F8 - Scan Anti-Cheat")
print("\n📋 GENERAL SHORTCUTS:")
print("   INSERT - Toggle Menu | F - Fly | G - God Mode PRO")
print("   J - Super Jump       | R - Super Speed | N - NoClip")
print("   K - Kill All         | M - TP Mouse    | P - TP Base")
print("   Z - Wallhack         | Q - Aimbot PRO  | E - ESP")
print("   X - X-Ray            | C - Chams       | B - Fullbright")
print("   1 - Anti-AFK         | 2 - Auto Clicker| 6 - Force Field")
print(string.rep("=", 90))
