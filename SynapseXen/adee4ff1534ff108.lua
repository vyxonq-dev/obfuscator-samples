--[[
    ⚡ OUTLAST PANEL v2.0 PRO ⚡
    Diseño Ultra Premium + Sistema Mejorado
    Compatible con: Synapse X, KRNL, Script-Ware, Fluxus, Xeno
]]

-- Loader Animado Mejorado
local function AnimatedLoader()
    local LoaderGui = Instance.new("ScreenGui")
    LoaderGui.Name = "LoaderGui"
    LoaderGui.Parent = game.CoreGui
    LoaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LoaderGui.ResetOnSpawn = false
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = LoaderGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -75)
    MainFrame.Size = UDim2.new(0, 400, 0, 150)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = MainFrame
    
    -- Efecto de gradiente
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 45))
    })
    gradient.Rotation = 90
    gradient.Parent = MainFrame
    
    -- Borde brillante
    local border = Instance.new("Frame")
    border.Name = "Border"
    border.Parent = MainFrame
    border.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    border.BorderSizePixel = 0
    border.Size = UDim2.new(1, 0, 0, 3)
    border.Position = UDim2.new(0, 0, 0, 0)
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 12, 0, 0)
    borderCorner.Parent = border
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0.15, 0)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "⚡ OUTLAST PANEL v2.0 PRO"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 24
    Title.TextStrokeTransparency = 0.8
    Title.TextStrokeColor3 = Color3.fromRGB(0, 150, 255)
    
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Parent = MainFrame
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 0, 0.45, 0)
    Subtitle.Size = UDim2.new(1, 0, 0, 20)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = "Initializing premium hack system..."
    Subtitle.TextColor3 = Color3.fromRGB(180, 220, 255)
    Subtitle.TextSize = 14
    
    -- Loading Bar mejorada
    local LoadingBarContainer = Instance.new("Frame")
    LoadingBarContainer.Name = "LoadingBarContainer"
    LoadingBarContainer.Parent = MainFrame
    LoadingBarContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    LoadingBarContainer.BorderSizePixel = 0
    LoadingBarContainer.Position = UDim2.new(0.1, 0, 0.7, 0)
    LoadingBarContainer.Size = UDim2.new(0.8, 0, 0, 15)
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(1, 0)
    containerCorner.Parent = LoadingBarContainer
    
    local LoadingBar = Instance.new("Frame")
    LoadingBar.Name = "LoadingBar"
    LoadingBar.Parent = LoadingBarContainer
    LoadingBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    LoadingBar.BorderSizePixel = 0
    LoadingBar.Size = UDim2.new(0, 0, 1, 0)
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = LoadingBar
    
    -- Efecto de gradiente en la barra
    local barGradient = Instance.new("UIGradient")
    barGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 180, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 200))
    })
    barGradient.Rotation = 0
    barGradient.Parent = LoadingBar
    
    -- Texto de porcentaje
    local PercentText = Instance.new("TextLabel")
    PercentText.Name = "PercentText"
    PercentText.Parent = MainFrame
    PercentText.BackgroundTransparency = 1
    PercentText.Position = UDim2.new(0.1, 0, 0.85, 0)
    PercentText.Size = UDim2.new(0.8, 0, 0, 20)
    PercentText.Font = Enum.Font.GothamBold
    PercentText.Text = "0%"
    PercentText.TextColor3 = Color3.fromRGB(255, 255, 255)
    PercentText.TextSize = 14
    
    -- Iconos animados
    local iconFrame = Instance.new("Frame")
    iconFrame.Name = "IconFrame"
    iconFrame.Parent = MainFrame
    iconFrame.BackgroundTransparency = 1
    iconFrame.Position = UDim2.new(0.87, 0, 0.7, 0)
    iconFrame.Size = UDim2.new(0, 30, 0, 15)
    
    local dots = {}
    for i = 1, 3 do
        local dot = Instance.new("Frame")
        dot.Name = "Dot" .. i
        dot.Parent = iconFrame
        dot.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        dot.BorderSizePixel = 0
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.Position = UDim2.new(0, (i-1)*8, 0.5, -2)
        
        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = dot
        
        table.insert(dots, dot)
    end
    
    -- Animación de carga
    spawn(function()
        local messages = {
            "Loading bypass system...",
            "Initializing modules...",
            "Creating interface...",
            "Setting up player system...",
            "Finalizing setup...",
            "Ready to dominate!"
        }
        
        for i = 1, 100 do
            LoadingBar.Size = UDim2.new(i/100, 0, 1, 0)
            PercentText.Text = i .. "%"
            
            -- Animar puntos
            for idx, dot in ipairs(dots) do
                local t = tick() + idx * 0.2
                local scale = 1 + math.sin(t * 3) * 0.3
                dot.Size = UDim2.new(0, 4 * scale, 0, 4 * scale)
                dot.Position = UDim2.new(0, (idx-1)*8 + (4 - 4*scale)/2, 0.5, -2 - (4*scale-4)/2)
            end
            
            -- Cambiar mensajes
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
            
            wait(0.03)
        end
        
        -- Efecto final
        for i = 1, 10 do
            LoadingBar.BackgroundTransparency = i/10
            wait(0.05)
        end
        
        -- Efecto de desvanecimiento
        for i = 0, 1, 0.1 do
            MainFrame.BackgroundTransparency = i
            Title.TextTransparency = i
            Subtitle.TextTransparency = i
            PercentText.TextTransparency = i
            wait(0.03)
        end
        
        LoaderGui:Destroy()
    end)
    
    return LoaderGui
end

-- Ejecutar loader mejorado
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

-- Configuración del menú
local Config = {
    SuperJump = 100,
    SuperSpeed = 100,
    FlySpeed = 50,
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
    Invisible = false,
    InvisibleConnection = nil
}

-- Sistema de KILL MEJORADO que funciona en la mayoría de juegos
local function SetupBypass()
    -- Método mejorado para Kill (más efectivo)
    local function KillPlayer(target)
        if not target or not target.Character then return false end
        
        local success = false
        local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            -- Método 1: Health = 0 (funciona en muchos juegos)
            pcall(function() 
                humanoid.Health = 0 
                humanoid.MaxHealth = 0
            end)
            
            -- Método 2: BreakJoints (más efectivo)
            pcall(function() 
                target.Character:BreakJoints() 
            end)
            
            -- Método 3: TakeDamage con valor muy alto
            pcall(function() 
                humanoid:TakeDamage(999999)
            end)
            
            -- Método 4: Cambiar posición a un lugar letal
            pcall(function()
                local root = target.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(0, -1000, 0)
                end
            end)
            
            -- Método 5: Remover todas las partes
            pcall(function()
                for _, part in pairs(target.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part:Destroy()
                    end
                end
            end)
            
            success = true
        end
        
        -- Método 6: Si no tiene humanoid, destruir todo
        if not success then
            pcall(function()
                target.Character:Destroy()
            end)
            success = true
        end
        
        return success
    end
    
    -- Método para Kill All mejorado
    local function KillAllPlayers()
        local killed = 0
        local total = 0
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                total = total + 1
                if KillPlayer(player) then
                    killed = killed + 1
                end
                wait(0.1) -- Pequeño delay para evitar crash
            end
        end
        
        return killed, total
    end
    
    -- Método para God Mode universal
    local function GodModeBypass()
        if Config.GodMode and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                -- Evitar la muerte de múltiples formas
                spawn(function()
                    while Config.GodMode and humanoid and humanoid.Parent do
                        pcall(function()
                            humanoid.MaxHealth = math.huge
                            humanoid.Health = math.huge
                            
                            -- Conectar eventos de daño
                            if not humanoid:FindFirstChild("GodModeConnection") then
                                local connection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                                    if humanoid.Health < math.huge then
                                        humanoid.Health = math.huge
                                    end
                                end)
                                connection.Name = "GodModeConnection"
                            end
                        end)
                        wait(0.5)
                    end
                end)
            end
        end
    end
    
    return {
        Kill = KillPlayer,
        KillAll = KillAllPlayers,
        GodMode = GodModeBypass
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

-- Función de notificación mejorada
local function Notify(title, text, duration)
    duration = duration or 2
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
        else
            indicator.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            indicator.Text = "OFF"
        end
    end
end

-- Variables globales necesarias
local invisRunning = false
local CoolInvisibleBtn = nil
local CoolClanInvisibilityActive = false
local invisibilityConnections = {}

-- 🔥 SISTEMA DE INVISIBILIDAD ULTRA AVANZADO - NUEVO MÉTODO (EXISTENTE)
local function AdvancedInvisibility()
    Config.Invisible = not Config.Invisible
    
    if Config.Invisible then
        Notify("INVISIBILITY", "Activating ULTRA ADVANCED Invisibility System...", 3)
        
        local char = LocalPlayer.Character
        if not char then
            Notify("ERROR", "No character found")
            return
        end
        
        -- 🔥 MÉTODO 1: Transparencia EXTREMA con múltiples capas
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                -- Capa 1: Transparencia normal
                part.Transparency = 1
                -- Capa 2: Transparencia local (override)
                part.LocalTransparencyModifier = 1
                -- Capa 3: Desactivar sombras
                part.CastShadow = false
                -- Capa 4: Material invisible
                part.Material = Enum.Material.Glass
                -- Capa 5: Color negro (menos visible)
                part.Color = Color3.new(0, 0, 0)
                -- Capa 6: Desactivar colisión
                part.CanCollide = false
                part.CanTouch = false
                part.CanQuery = false
            elseif part:IsA("Decal") or part:IsA("Texture") then
                part.Transparency = 1
            end
        end
        
        -- 🔥 MÉTODO 2: Remover Humanoid para ser "no jugador"
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            -- Guardar propiedades originales
            local originalHealth = humanoid.Health
            local originalMaxHealth = humanoid.MaxHealth
            
            -- Hacer que el Humanoid no sea detectable
            humanoid.Name = "Ghost" .. math.random(1000, 9999)
            humanoid.Health = 0.1
            humanoid.MaxHealth = 0.1
            
            -- Crear un Humanoid falso invisible
            local fakeHumanoid = humanoid:Clone()
            fakeHumanoid.Name = "RealHumanoid"
            fakeHumanoid.Parent = char
            fakeHumanoid.Health = originalHealth
            fakeHumanoid.MaxHealth = originalMaxHealth
            
            -- Ocultar el humanoid real
            humanoid.Parent = nil
            
            -- Conectar para restaurar al morir
            fakeHumanoid.Died:Connect(function()
                if humanoid and humanoid.Parent == nil then
                    humanoid.Parent = char
                    humanoid.Health = 0
                end
            end)
        end
        
        -- 🔥 MÉTODO 3: Sistema de clonación ENG AÑO
        spawn(function()
            while Config.Invisible and char and char.Parent do
                -- Crear múltiples clones falsos en posiciones random
                for i = 1, 5 do
                    local fakeClone = char:Clone()
                    -- Hacer clones semi-transparentes
                    for _, part in pairs(fakeClone:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 0.8
                            part.CanCollide = false
                            part.Color = Color3.new(
                                math.random(),
                                math.random(), 
                                math.random()
                            )
                        end
                    end
                    
                    -- Posicionar clones en lugares random
                    local root = fakeClone:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = CFrame.new(
                            math.random(-500, 500),
                            math.random(10, 100),
                            math.random(-500, 500)
                        )
                    end
                    
                    fakeClone.Parent = workspace
                    
                    -- Destruir después de un tiempo
                    spawn(function()
                        wait(math.random(1, 3))
                        fakeClone:Destroy()
                    end)
                end
                wait(0.5)
            end
        end)
        
        -- 🔥 MÉTODO 4: Sistema de partículas CONFUSIÓN
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            -- Humo espeso
            local smoke = Instance.new("Smoke")
            smoke.Color = Color3.new(0.1, 0.1, 0.1)
            smoke.Size = 5
            smoke.Opacity = 0.9
            smoke.RiseVelocity = 1
            smoke.Name = "InvisibilitySmoke"
            smoke.Parent = root
            
            -- Efecto de distorsión
            local distort = Instance.new("Part")
            distort.Name = "DistortionField"
            distort.Size = Vector3.new(10, 10, 10)
            distort.Transparency = 1
            distort.CanCollide = false
            distort.Anchored = false
            distort.CFrame = root.CFrame
            distort.Parent = root
            
            local weld = Instance.new("Weld")
            weld.Part0 = root
            weld.Part1 = distort
            weld.C0 = CFrame.new(0, 0, 0)
            weld.Parent = root
        end
        
        -- 🔥 MÉTODO 5: Modificar propiedades de red
        spawn(function()
            while Config.Invisible and char do
                -- Cambiar propiedades constantemente
                char.Name = "Ghost_" .. math.random(10000, 99999)
                
                -- Cambiar propiedades de Humanoid
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.WalkSpeed = math.random(16, 50)
                    hum.JumpPower = math.random(50, 100)
                    hum.HipHeight = math.random(0, 5)
                end
                
                wait(0.3)
            end
        end)
        
        -- 🔥 MÉTODO 6: Sistema ANTI-ESP
        Config.InvisibleConnection = RunService.Heartbeat:Connect(function()
            if not Config.Invisible or not char then return end
            
            -- Hacer que hitboxes sean imposibles de detectar
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    -- Cambiar tamaño constantemente
                    part.Size = part.Size * (0.9 + math.sin(tick()) * 0.2)
                    
                    -- Mover partes ligeramente
                    if part.Name ~= "HumanoidRootPart" then
                        part.CFrame = part.CFrame * CFrame.new(
                            math.sin(tick() + part.Name:byte()) * 0.1,
                            math.cos(tick() + part.Name:byte()) * 0.1,
                            math.sin(tick() + part.Name:byte()) * 0.1
                        )
                    end
                end
            end
            
            -- Mover root part rápidamente (teleport mini)
            local root = char:FindFirstChild("HumanoidRootPart")
            if root and math.random(1, 10) == 1 then
                local offset = Vector3.new(
                    math.random(-10, 10),
                    math.random(-5, 5),
                    math.random(-10, 10)
                )
                root.CFrame = root.CFrame + offset
            end
        end)
        
        -- Activar NoClip extremo
        Config.NoClip = true
        UpdateButtonState("NoClipBtn", true)
        
        Notify("ULTIMATE INVISIBILITY", 
            "ACTIVATED!\n" ..
            "You are now ULTRA INVISIBLE\n" ..
            "5-layer system engaged\n" ..
            "Other players CANNOT see you!", 5)
        
    else
        -- 🔥 DESACTIVAR TODO
        if Config.InvisibleConnection then
            Config.InvisibleConnection:Disconnect()
            Config.InvisibleConnection = nil
        end
        
        local char = LocalPlayer.Character
        if char then
            -- Restaurar Humanoid
            local fakeHum = char:FindFirstChild("RealHumanoid")
            local realHum = game:GetService("Workspace"):FindFirstChild("Humanoid")
            
            if fakeHum then
                fakeHum:Destroy()
            end
            
            if realHum and realHum.Parent == nil then
                realHum.Parent = char
                realHum.Health = 100
                realHum.MaxHealth = 100
            end
            
            -- Restaurar transparencia
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0
                    part.LocalTransparencyModifier = 0
                    part.CastShadow = true
                    part.Material = Enum.Material.Plastic
                    part.Color = Color3.new(1, 1, 1)
                    part.CanCollide = true
                    part.CanTouch = true
                    part.CanQuery = true
                elseif part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = 0
                end
            end
            
            -- Limpiar efectos
            for _, obj in pairs(char:GetDescendants()) do
                if obj.Name == "InvisibilitySmoke" or 
                   obj.Name == "DistortionField" or
                   obj.Name:find("Ghost") then
                    obj:Destroy()
                end
            end
            
            -- Restaurar nombre
            char.Name = LocalPlayer.Name
        end
        
        Notify("INVISIBILITY", "Deactivated - You are now visible", 2)
    end
    
    UpdateButtonState("InvisibleBtn", Config.Invisible)
end

-- Alias para compatibilidad
ToggleInvisibility = AdvancedInvisibility

-- 🔥 FUNCIÓN PARA DESACTIVAR LA INVISIBILIDAD C00LCLAN
local function DeactivateCoolClanInvisibility()
    if not CoolClanInvisibilityActive then return end
    
    -- Desconectar todas las conexiones
    for _, conn in pairs(invisibilityConnections) do
        if conn then
            pcall(function() conn:Disconnect() end)
        end
    end
    invisibilityConnections = {}
    
    local player = game.Players.LocalPlayer
    local originalChar = nil
    
    -- Buscar el character original
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.HumanoidRootPart.Position.Y > 1000000 then -- Está en la posición del void
                originalChar = obj
                break
            end
        end
    end
    
    if player.Character then
        local currentChar = player.Character
        local clonedHum = currentChar:FindFirstChildWhichIsA("Humanoid")
        if clonedHum then clonedHum:Destroy() end
        
        -- Restaurar character original
        if originalChar then
            originalChar.Parent = workspace
            player.Character = originalChar
            originalChar:MoveTo(Vector3.new(0, 5, 0)) -- Posición segura
            
            -- Restaurar cámara
            workspace.CurrentCamera.CameraSubject = originalChar:FindFirstChildWhichIsA('Humanoid')
            workspace.CurrentCamera.CameraType = "Custom"
        end
    end
    
    -- Limpiar character invisible
    local lighting = game:GetService("Lighting")
    for _, obj in pairs(lighting:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
            obj:Destroy()
        end
    end
    
    invisRunning = false
    CoolClanInvisibilityActive = false
    
    -- Actualizar botón si existe
    if CoolInvisibleBtn then
        CoolInvisibleBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
        CoolInvisibleBtn.Text = "🔥 C00LCLAN INVISIBILITY [ALT+Ñ]"
    end
    
    Notify("🔥 C00LCLAN INVISIBILITY", "Deactivated! You are now visible!", 3)
end

-- 🔥 NUEVA FUNCIÓN: INVISIBILIDAD C00LCLAN STYLE (CORREGIDA) - CON DESACTIVACIÓN
local function CoolClanInvisibility()
    -- Si ya está activo, desactivarlo
    if CoolClanInvisibilityActive then
        DeactivateCoolClanInvisibility()
        return false
    end
    
    -- Si está corriendo pero no activo, resetear
    if invisRunning then 
        Notify("INFO", "Resetting invisibility system...", 2)
        DeactivateCoolClanInvisibility()
        task.wait(0.5)
    end
    
    invisRunning = true
    CoolClanInvisibilityActive = true
    
    local player = game.Players.LocalPlayer
    repeat task.wait(0.1) until player.Character
    local originalChar = player.Character
    originalChar.Archivable = true
    
    local invisibleChar = originalChar:Clone()
    invisibleChar.Name = ""
    invisibleChar.Parent = game:GetService("Lighting")
    
    -- Aplicar transparencia
    for _, part in ipairs(invisibleChar:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = (part.Name == "HumanoidRootPart") and 1 or 0.5
        end
    end
    
    local voidConn, deathConn, steppedConn
    
    local function Respawn()
        if not CoolClanInvisibilityActive then return end
        DeactivateCoolClanInvisibility()
    end
    
    local voidY = workspace.FallenPartsDestroyHeight
    steppedConn = game:GetService("RunService").Stepped:Connect(function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp or not CoolClanInvisibilityActive then return end
        local y = hrp.Position.Y
        if (voidY < 0 and y <= voidY) or (voidY >= 0 and y >= voidY) then
            Respawn()
        end
    end)
    
    table.insert(invisibilityConnections, steppedConn)
    
    local clonedHum = invisibleChar:FindFirstChildWhichIsA("Humanoid")
    if clonedHum then
        deathConn = clonedHum.Died:Connect(Respawn)
        table.insert(invisibilityConnections, deathConn)
    end
    
    local camCF = workspace.CurrentCamera.CFrame
    local hrpCF = originalChar.HumanoidRootPart.CFrame
    
    originalChar:MoveTo(Vector3.new(0, math.pi*1e6, 0))
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    task.wait(0.2)
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    
    invisibleChar.Parent = workspace
    invisibleChar.HumanoidRootPart.CFrame = hrpCF
    player.Character = invisibleChar
    
    for _, a in ipairs(player.Character:GetDescendants()) do
        if a.Name == "Animate" and a:IsA("Model") then
            a.Disabled = true; a.Disabled = false
        end
    end
    
    workspace.CurrentCamera:remove()
    wait(.1)
    repeat wait() until player.Character ~= nil
    workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
    workspace.CurrentCamera.CameraType = "Custom"
    player.CameraMinZoomDistance = 0.5
    player.CameraMaxZoomDistance = 400
    player.CameraMode = "Classic"
    player.Character.Head.Anchored = false
    player.Character.Animate.Enabled = false
    player.Character.Animate.Enabled = true
    
    -- Actualizar botón si existe
    if CoolInvisibleBtn then
        CoolInvisibleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        CoolInvisibleBtn.Text = "✅ C00LCLAN INVISIBILITY [ALT+Ñ] (ON)"
    end
    
    Notify("🔥 C00LCLAN INVISIBILITY", "Activated! Press ALT+Ñ again to deactivate!", 5)
    return true
end



-- SISTEMA DE AIMBOT
local AimbotConnection = nil
local function ToggleAimbot(state)
    if state then
        if AimbotConnection then
            AimbotConnection:Disconnect()
        end
        
        AimbotConnection = RunService.RenderStepped:Connect(function()
            if not Config.Aimbot or not LocalPlayer.Character then return end
            
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            local camera = workspace.CurrentCamera
            local nearestPlayer = nil
            local nearestDistance = Config.AimbotFOV
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        local screenPos, onScreen = camera:WorldToViewportPoint(targetRoot.Position)
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
            
            if nearestPlayer and nearestPlayer.Character then
                local targetRoot = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    local camCFrame = camera.CFrame
                    local targetPos = targetRoot.Position
                    
                    -- Suavizado del aimbot
                    local smoothness = Config.AimbotSmoothness
                    local newCFrame = CFrame.new(camCFrame.Position, Vector3.new(
                        targetPos.X,
                        targetPos.Y + (targetRoot.Size.Y/2),
                        targetPos.Z
                    ))
                    
                    camera.CFrame = camCFrame:Lerp(newCFrame, 1/smoothness)
                end
            end
        end)
        
        Notify("AIMBOT", "Activated - FOV: " .. Config.AimbotFOV, 2)
    else
        if AimbotConnection then
            AimbotConnection:Disconnect()
            AimbotConnection = nil
        end
        Notify("AIMBOT", "Deactivated", 1)
    end
end

-- SISTEMA DE WALLHACK
local function ToggleWallhack(state)
    if state then
        -- Hacer las paredes transparentes
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
        Notify("WALLHACK", "Activated", 2)
    else
        -- Restaurar transparencia original
        pcall(function()
            for part, transparency in pairs(GuiElements.WallhackParts) do
                if part and part.Parent then
                    part.Transparency = transparency
                end
            end
            GuiElements.WallhackParts = {}
        end)
        Notify("WALLHACK", "Deactivated", 1)
    end
end

-- SISTEMA DE ESP MEJORADO
local EspConnection = nil
local function ToggleEsp(state)
    if state then
        -- Limpiar ESP anterior
        for _, obj in pairs(GuiElements.EspObjects) do
            if obj then
                obj:Destroy()
            end
        end
        GuiElements.EspObjects = {}
        
        EspConnection = RunService.RenderStepped:Connect(function()
            if not Config.Esp then
                if EspConnection then
                    EspConnection:Disconnect()
                    EspConnection = nil
                end
                return
            end
            
            -- Limpiar objetos antiguos
            for _, obj in pairs(GuiElements.EspObjects) do
                if obj then
                    obj:Destroy()
                end
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
                            -- Calcular distancia
                            local distance = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) 
                                and (root.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude 
                                or 0
                            
                            -- Crear texto ESP
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
                            
                            -- Línea trazadora (tracers)
                            if Config.EspTracers then
                                local tracer = Drawing.new("Line")
                                tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                                tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                                tracer.Color = Color3.fromRGB(255, 50, 50)
                                tracer.Thickness = 2
                                tracer.Visible = true
                                
                                table.insert(GuiElements.EspObjects, tracer)
                            end
                            
                            -- Caja ESP
                            if Config.EspBoxes then
                                local head = player.Character:FindFirstChild("Head")
                                if head then
                                    local headPos, headOnScreen = camera:WorldToViewportPoint(head.Position)
                                    if headOnScreen then
                                        local boxSize = Vector2.new(
                                            math.abs(screenPos.X - headPos.X) * 2,
                                            math.abs(screenPos.Y - headPos.Y) * 2
                                        )
                                        
                                        local box = Drawing.new("Square")
                                        box.Position = Vector2.new(headPos.X - boxSize.X/2, headPos.Y - boxSize.Y/2)
                                        box.Size = boxSize
                                        box.Color = Color3.fromRGB(50, 255, 50)
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
            end
        end)
        Notify("ESP", "Activated with tracers", 2)
    else
        -- Limpiar ESP
        if EspConnection then
            EspConnection:Disconnect()
            EspConnection = nil
        end
        
        for _, obj in pairs(GuiElements.EspObjects) do
            if obj then
                obj:Destroy()
            end
        end
        GuiElements.EspObjects = {}
        Notify("ESP", "Deactivated", 1)
    end
end

-- SISTEMA DE VUELO MEJORADO
local function ToggleFlying(state)
    if state then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            if Config.FlyConnection then
                Config.FlyConnection:Disconnect()
            end
            
            -- Crear controles de vuelo suaves
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.Name = "FlyGyroBypass"
            bodyGyro.Parent = char.HumanoidRootPart
            bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bodyGyro.P = 10000
            bodyGyro.D = 500
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Name = "FlyVelocityBypass"
            bodyVelocity.Parent = char.HumanoidRootPart
            bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bodyVelocity.P = 10000
            
            Config.FlyConnection = RunService.Heartbeat:Connect(function()
                if not Config.Flying or not char or not char:FindFirstChild("HumanoidRootPart") then
                    if Config.FlyConnection then
                        Config.FlyConnection:Disconnect()
                        Config.FlyConnection = nil
                    end
                    return
                end
                
                local camera = workspace.CurrentCamera
                local rootPart = char.HumanoidRootPart
                
                -- Suavizar el giro
                bodyGyro.CFrame = camera.CFrame
                
                -- Calcular velocidad basada en inputs
                local velocity = Vector3.new(0, 0, 0)
                
                -- Movimiento WASD más suave
                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    velocity = velocity + (camera.CFrame.LookVector * Config.FlySpeed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.S) then
                    velocity = velocity - (camera.CFrame.LookVector * Config.FlySpeed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.A) then
                    velocity = velocity - (camera.CFrame.RightVector * Config.FlySpeed)
                end
                if UIS:IsKeyDown(Enum.KeyCode.D) then
                    velocity = velocity + (camera.CFrame.RightVector * Config.FlySpeed)
                end
                
                -- Elevación más controlada
                if UIS:IsKeyDown(Enum.KeyCode.Space) then
                    velocity = velocity + Vector3.new(0, Config.FlySpeed, 0)
                end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                    velocity = velocity - Vector3.new(0, Config.FlySpeed, 0)
                end
                
                -- Aplicar velocidad
                bodyVelocity.Velocity = velocity
                
                -- Prevenir comportamiento del humanoid
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Flying)
                end
            end)
            
            Notify("FLY", "Activated - Use WASD, Space/Shift", 2)
        end
    else
        -- Limpiar controles de vuelo
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
        Notify("FLY", "Deactivated", 1)
    end
end

-- Función para espectar jugadores
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
        Notify("SPECTATE", "Stopped spectating " .. player.Name)
    else
        -- Empezar a espectar
        Config.Spectating = true
        Config.SelectedPlayer = player
        Config.OriginalCameraSubject = workspace.CurrentCamera.CameraSubject
        workspace.CurrentCamera.CameraSubject = player.Character
        
        -- Seguir automáticamente
        spawn(function()
            while Config.Spectating and Config.SelectedPlayer == player and player.Character do
                workspace.CurrentCamera.CameraSubject = player.Character
                wait(0.1)
            end
        end)
        
        Notify("SPECTATE", "Now spectating " .. player.Name)
    end
end

-- Función para obtener jugador por nombre o ID
local function GetPlayerFromInput(input)
    local inputStr = tostring(input)
    
    -- Buscar por UserId
    local idNum = tonumber(inputStr)
    if idNum then
        for _, player in pairs(Players:GetPlayers()) do
            if player.UserId == idNum then
                return player
            end
        end
    end
    
    -- Buscar por nombre (coincidencia parcial)
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

-- Crear GUI Premium PRO
local function CreatePremiumGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OutlastPanelPRO"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    GuiElements.ScreenGui = ScreenGui
    
    -- Marco principal con diseño PRO
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -350, 0.5, -325)
    MainFrame.Size = UDim2.new(0, 700, 0, 650)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    GuiElements.MainFrame = MainFrame
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    -- Borde con gradiente
    local border = Instance.new("Frame")
    border.Name = "Border"
    border.Parent = MainFrame
    border.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    border.BorderSizePixel = 0
    border.Size = UDim2.new(1, 0, 0, 3)
    border.Position = UDim2.new(0, 0, 0, 0)
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 12, 0, 0)
    borderCorner.Parent = border
    
    -- Header moderno
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = MainFrame
    Header.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    Header.Size = UDim2.new(1, 0, 0, 60)
    Header.BorderSizePixel = 0
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12, 0, 0)
    HeaderCorner.Parent = Header
    
    -- Título con icono
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Header
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.05, 0, 0.2, 0)
    Title.Size = UDim2.new(0.7, 0, 0.6, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "⚡ OUTLAST PANEL v2.0 PRO"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Subtitle
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Name = "SubTitle"
    SubTitle.Parent = Header
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0.05, 0, 0.7, 0)
    SubTitle.Size = UDim2.new(0.4, 0, 0.3, 0)
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.Text = "Premium Hack Menu"
    SubTitle.TextColor3 = Color3.fromRGB(180, 220, 255)
    SubTitle.TextSize = 12
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Botón cerrar moderno
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Header
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 80)
    CloseButton.Position = UDim2.new(0.92, 0, 0.2, 0)
    CloseButton.Size = UDim2.new(0, 35, 0, 35)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 20
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(1, 0)
    CloseCorner.Parent = CloseButton
    
    -- Botón minimizar
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = Header
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    MinimizeButton.Position = UDim2.new(0.85, 0, 0.2, 0)
    MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(1, 0)
    MinimizeCorner.Parent = MinimizeButton
    
    -- Contenedor principal con pestañas
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    TabContainer.Position = UDim2.new(0, 15, 0.1, 10)
    TabContainer.Size = UDim2.new(1, -30, 0.88, -15)
    TabContainer.BorderSizePixel = 0
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 10)
    TabCorner.Parent = TabContainer
    
    -- Tabs header
    local TabsHeader = Instance.new("Frame")
    TabsHeader.Name = "TabsHeader"
    TabsHeader.Parent = TabContainer
    TabsHeader.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    TabsHeader.Size = UDim2.new(1, 0, 0, 50)
    TabsHeader.BorderSizePixel = 0
    
    local TabsHeaderCorner = Instance.new("UICorner")
    TabsHeaderCorner.CornerRadius = UDim.new(0, 10, 0, 0)
    TabsHeaderCorner.Parent = TabsHeader
    
    -- Tabs buttons
    local tabs = {
        {"🎮 Player", "PlayerControls"},
        {"⚡ Movement", "Movement"},
        {"🎯 Combat", "Combat"},
        {"🌍 World", "World"},
        {"👁️ Visual", "Visual"},
        {"📋 Shortcuts", "Shortcuts"}
    }
    
    -- Crear pestañas
    for i, tab in ipairs(tabs) do
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tab[2] .. "Tab"
        TabButton.Parent = TabsHeader
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        TabButton.Position = UDim2.new(0.02 + (i-1)*0.16, 0, 0.2, 0)
        TabButton.Size = UDim2.new(0.15, 0, 0.6, 0)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = tab[1]
        TabButton.TextColor3 = Color3.fromRGB(200, 220, 255)
        TabButton.TextSize = 12
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = TabButton
        
        -- Animación hover
        TabButton.MouseEnter:Connect(function()
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 80)}):Play()
        end)
        
        TabButton.MouseLeave:Connect(function()
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 60)}):Play()
        end)
    end
    
    -- Contenedor de contenido
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = TabContainer
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Position = UDim2.new(0, 0, 0.1, 0)
    ContentContainer.Size = UDim2.new(1, 0, 0.9, 0)
    
    -- ===== PANEL DE JUGADOR =====
    local PlayerPanel = Instance.new("Frame")
    PlayerPanel.Name = "PlayerPanel"
    PlayerPanel.Parent = ContentContainer
    PlayerPanel.BackgroundTransparency = 1
    PlayerPanel.Size = UDim2.new(1, 0, 1, 0)
    PlayerPanel.Visible = true
    
    -- Sección de búsqueda de jugador
    local SearchFrame = Instance.new("Frame")
    SearchFrame.Name = "SearchFrame"
    SearchFrame.Parent = PlayerPanel
    SearchFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    SearchFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
    SearchFrame.Size = UDim2.new(0.96, 0, 0.3, 0)
    
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 8)
    SearchCorner.Parent = SearchFrame
    
    local SearchTitle = Instance.new("TextLabel")
    SearchTitle.Name = "SearchTitle"
    SearchTitle.Parent = SearchFrame
    SearchTitle.BackgroundTransparency = 1
    SearchTitle.Position = UDim2.new(0.05, 0, 0.05, 0)
    SearchTitle.Size = UDim2.new(0.9, 0, 0.2, 0)
    SearchTitle.Font = Enum.Font.GothamBold
    SearchTitle.Text = "🔍 PLAYER SEARCH"
    SearchTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
    SearchTitle.TextSize = 14
    SearchTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Input para jugador
    local PlayerInput = Instance.new("TextBox")
    PlayerInput.Name = "PlayerInput"
    PlayerInput.Parent = SearchFrame
    PlayerInput.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    PlayerInput.Position = UDim2.new(0.05, 0, 0.3, 0)
    PlayerInput.Size = UDim2.new(0.7, 0, 0.2, 0)
    PlayerInput.Font = Enum.Font.Gotham
    PlayerInput.PlaceholderText = "Enter username or UserId"
    PlayerInput.Text = ""
    PlayerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerInput.TextSize = 12
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = PlayerInput
    
    -- Botón buscar
    local SearchBtn = Instance.new("TextButton")
    SearchBtn.Name = "SearchBtn"
    SearchBtn.Parent = SearchFrame
    SearchBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    SearchBtn.Position = UDim2.new(0.77, 0, 0.3, 0)
    SearchBtn.Size = UDim2.new(0.18, 0, 0.2, 0)
    SearchBtn.Font = Enum.Font.GothamBold
    SearchBtn.Text = "SEARCH"
    SearchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBtn.TextSize = 12
    
    local SearchBtnCorner = Instance.new("UICorner")
    SearchBtnCorner.CornerRadius = UDim.new(0, 6)
    SearchBtnCorner.Parent = SearchBtn
    
    -- Información del jugador
    local PlayerInfoFrame = Instance.new("Frame")
    PlayerInfoFrame.Name = "PlayerInfoFrame"
    PlayerInfoFrame.Parent = SearchFrame
    PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    PlayerInfoFrame.Position = UDim2.new(0.05, 0, 0.55, 0)
    PlayerInfoFrame.Size = UDim2.new(0.9, 0, 0.4, 0)
    PlayerInfoFrame.Visible = false
    
    local PlayerInfoCorner = Instance.new("UICorner")
    PlayerInfoCorner.CornerRadius = UDim.new(0, 6)
    PlayerInfoCorner.Parent = PlayerInfoFrame
    
    local PlayerName = Instance.new("TextLabel")
    PlayerName.Name = "PlayerName"
    PlayerName.Parent = PlayerInfoFrame
    PlayerName.BackgroundTransparency = 1
    PlayerName.Position = UDim2.new(0.05, 0, 0.1, 0)
    PlayerName.Size = UDim2.new(0.9, 0, 0.3, 0)
    PlayerName.Font = Enum.Font.GothamBold
    PlayerName.Text = "Player: None"
    PlayerName.TextColor3 = Color3.fromRGB(0, 255, 255)
    PlayerName.TextSize = 13
    PlayerName.TextXAlignment = Enum.TextXAlignment.Left
    
    local PlayerId = Instance.new("TextLabel")
    PlayerId.Name = "PlayerId"
    PlayerId.Parent = PlayerInfoFrame
    PlayerId.BackgroundTransparency = 1
    PlayerId.Position = UDim2.new(0.05, 0, 0.4, 0)
    PlayerId.Size = UDim2.new(0.9, 0, 0.3, 0)
    PlayerId.Font = Enum.Font.Gotham
    PlayerId.Text = "ID: N/A"
    PlayerId.TextColor3 = Color3.fromRGB(200, 220, 255)
    PlayerId.TextSize = 11
    PlayerId.TextXAlignment = Enum.TextXAlignment.Left
    
    local PlayerStatus = Instance.new("TextLabel")
    PlayerStatus.Name = "PlayerStatus"
    PlayerStatus.Parent = PlayerInfoFrame
    PlayerStatus.BackgroundTransparency = 1
    PlayerStatus.Position = UDim2.new(0.05, 0, 0.7, 0)
    PlayerStatus.Size = UDim2.new(0.9, 0, 0.3, 0)
    PlayerStatus.Font = Enum.Font.Gotham
    PlayerStatus.Text = "Status: Not found"
    PlayerStatus.TextColor3 = Color3.fromRGB(255, 150, 50)
    PlayerStatus.TextSize = 11
    PlayerStatus.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Botones de acción para jugador
    local ActionFrame = Instance.new("Frame")
    ActionFrame.Name = "ActionFrame"
    ActionFrame.Parent = PlayerPanel
    ActionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    ActionFrame.Position = UDim2.new(0.02, 0, 0.35, 0)
    ActionFrame.Size = UDim2.new(0.96, 0, 0.3, 0)
    
    local ActionCorner = Instance.new("UICorner")
    ActionCorner.CornerRadius = UDim.new(0, 8)
    ActionCorner.Parent = ActionFrame
    
    local ActionTitle = Instance.new("TextLabel")
    ActionTitle.Name = "ActionTitle"
    ActionTitle.Parent = ActionFrame
    ActionTitle.BackgroundTransparency = 1
    ActionTitle.Position = UDim2.new(0.05, 0, 0.05, 0)
    ActionTitle.Size = UDim2.new(0.9, 0, 0.2, 0)
    ActionTitle.Font = Enum.Font.GothamBold
    ActionTitle.Text = "🎯 PLAYER ACTIONS"
    ActionTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
    ActionTitle.TextSize = 14
    ActionTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Grid de botones de acción
    local actions = {
        {"TP TO", "Teleport to player", Color3.fromRGB(0, 120, 255)},
        {"BRING", "Bring to you", Color3.fromRGB(0, 180, 100)},
        {"SPECTATE", "Spectate player", Color3.fromRGB(200, 100, 255)},
        {"KILL", "Kill player", Color3.fromRGB(255, 80, 80)}
    }
    
    for i, action in ipairs(actions) do
        local row = math.floor((i-1)/2)
        local col = (i-1)%2
        
        local ActionButton = Instance.new("TextButton")
        ActionButton.Name = action[1] .. "Btn"
        ActionButton.Parent = ActionFrame
        ActionButton.BackgroundColor3 = action[3]
        ActionButton.Position = UDim2.new(0.05 + col*0.475, 0, 0.3 + row*0.35, 0)
        ActionButton.Size = UDim2.new(0.45, 0, 0.3, 0)
        ActionButton.Font = Enum.Font.GothamBold
        ActionButton.Text = action[1]
        ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ActionButton.TextSize = 13
        ActionButton.Visible = false
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 6)
        ButtonCorner.Parent = ActionButton
        
        local ActionDesc = Instance.new("TextLabel")
        ActionDesc.Name = "Desc"
        ActionDesc.Parent = ActionButton
        ActionDesc.BackgroundTransparency = 1
        ActionDesc.Position = UDim2.new(0, 0, 0.7, 0)
        ActionDesc.Size = UDim2.new(1, 0, 0.3, 0)
        ActionDesc.Font = Enum.Font.Gotham
        ActionDesc.Text = action[2]
        ActionDesc.TextColor3 = Color3.fromRGB(230, 240, 255)
        ActionDesc.TextSize = 9
        
        -- Animación hover
        ActionButton.MouseEnter:Connect(function()
            TweenService:Create(ActionButton, TweenInfo.new(0.2), {BackgroundColor3 = action[3]:Lerp(Color3.fromRGB(255, 255, 255), 0.2)}):Play()
        end)
        
        ActionButton.MouseLeave:Connect(function()
            TweenService:Create(ActionButton, TweenInfo.new(0.2), {BackgroundColor3 = action[3]}):Play()
        end)
    end
    
    -- Botón Reset Character
    local ResetCharFrame = Instance.new("Frame")
    ResetCharFrame.Name = "ResetCharFrame"
    ResetCharFrame.Parent = PlayerPanel
    ResetCharFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    ResetCharFrame.Position = UDim2.new(0.02, 0, 0.68, 0)
    ResetCharFrame.Size = UDim2.new(0.96, 0, 0.15, 0)
    
    local ResetCharCorner = Instance.new("UICorner")
    ResetCharCorner.CornerRadius = UDim.new(0, 8)
    ResetCharCorner.Parent = ResetCharFrame
    
    local ResetCharBtn = Instance.new("TextButton")
    ResetCharBtn.Name = "ResetCharBtn"
    ResetCharBtn.Parent = ResetCharFrame
    ResetCharBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
    ResetCharBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
    ResetCharBtn.Size = UDim2.new(0.9, 0, 0.6, 0)
    ResetCharBtn.Font = Enum.Font.GothamBold
    ResetCharBtn.Text = "🔄 RESET CHARACTER"
    ResetCharBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResetCharBtn.TextSize = 14
    
    local ResetCharBtnCorner = Instance.new("UICorner")
    ResetCharBtnCorner.CornerRadius = UDim.new(0, 6)
    ResetCharBtnCorner.Parent = ResetCharBtn
    
    ResetCharBtn.MouseButton1Click:Connect(function()
        if LocalPlayer.Character then
            LocalPlayer.Character:BreakJoints()
            Notify("RESET", "Character reset")
        end
    end)
    
    -- 🔥 Botón de invisibilidad agregado
    local InvisibleFrame = Instance.new("Frame")
    InvisibleFrame.Name = "InvisibleFrame"
    InvisibleFrame.Parent = PlayerPanel
    InvisibleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    InvisibleFrame.Position = UDim2.new(0.02, 0, 0.85, 0)
    InvisibleFrame.Size = UDim2.new(0.96, 0, 0.1, 0)
    
    local InvisibleCorner = Instance.new("UICorner")
    InvisibleCorner.CornerRadius = UDim.new(0, 8)
    InvisibleCorner.Parent = InvisibleFrame
    
    local InvisibleBtn = Instance.new("TextButton")
    InvisibleBtn.Name = "InvisibleBtn"
    InvisibleBtn.Parent = InvisibleFrame
    InvisibleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    InvisibleBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
    InvisibleBtn.Size = UDim2.new(0.9, 0, 0.7, 0)
    InvisibleBtn.Font = Enum.Font.GothamBold
    InvisibleBtn.Text = "👻 TOGGLE INVISIBILITY"
    InvisibleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    InvisibleBtn.TextSize = 13
    
    local InvisibleBtnCorner = Instance.new("UICorner")
    InvisibleBtnCorner.CornerRadius = UDim.new(0, 6)
    InvisibleBtnCorner.Parent = InvisibleBtn
    
    InvisibleBtn.MouseButton1Click:Connect(function()
        Config.Invisible = not Config.Invisible
        UpdateButtonState("InvisibleBtn", Config.Invisible)
        ToggleInvisibility(Config.Invisible)
    end)
    
        -- 🔥 BOTÓN C00LCLAN INVISIBILITY (NUEVO)
    local CoolInvisibleFrame = Instance.new("Frame")
    CoolInvisibleFrame.Name = "CoolInvisibleFrame"
    CoolInvisibleFrame.Parent = PlayerPanel
    CoolInvisibleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    CoolInvisibleFrame.Position = UDim2.new(0.02, 0, 0.96, 0)
    CoolInvisibleFrame.Size = UDim2.new(0.96, 0, 0.08, 0)
    
    local CoolInvisibleCorner = Instance.new("UICorner")
    CoolInvisibleCorner.CornerRadius = UDim.new(0, 8)
    CoolInvisibleCorner.Parent = CoolInvisibleFrame
    
    CoolInvisibleBtn = Instance.new("TextButton")
    CoolInvisibleBtn.Name = "CoolInvisibleBtn"
    CoolInvisibleBtn.Parent = CoolInvisibleFrame
    CoolInvisibleBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    CoolInvisibleBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
    CoolInvisibleBtn.Size = UDim2.new(0.9, 0, 0.7, 0)
    CoolInvisibleBtn.Font = Enum.Font.GothamBold
    CoolInvisibleBtn.Text = "🔥 C00LCLAN INVISIBILITY"
    CoolInvisibleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CoolInvisibleBtn.TextSize = 12
    
    local CoolInvisibleBtnCorner = Instance.new("UICorner")
    CoolInvisibleBtnCorner.CornerRadius = UDim.new(0, 6)
    CoolInvisibleBtnCorner.Parent = CoolInvisibleBtn
    
    CoolInvisibleBtn.MouseButton1Click:Connect(function()
        local success = CoolClanInvisibility()
        if success then
            CoolInvisibleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
            CoolInvisibleBtn.Text = "✅ C00LCLAN INVIS ACTIVE"
        end
    end)
    
    -- ===== PANEL DE MOVIMIENTO =====
    local MovementPanel = Instance.new("Frame")
    MovementPanel.Name = "MovementPanel"
    MovementPanel.Parent = ContentContainer
    MovementPanel.BackgroundTransparency = 1
    MovementPanel.Size = UDim2.new(1, 0, 1, 0)
    MovementPanel.Visible = false
    
    -- Función crear slider PRO
    local function CreateProSlider(name, text, min, max, default, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Name = name .. "SliderFrame"
        sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        sliderFrame.Size = UDim2.new(1, -10, 0, 60)
        
        local sliderCorner = Instance.new("UICorner")
        sliderCorner.CornerRadius = UDim.new(0, 8)
        sliderCorner.Parent = sliderFrame
        
        -- Texto y valor
        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Parent = sliderFrame
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0.05, 0, 0.1, 0)
        label.Size = UDim2.new(0.6, 0, 0, 20)
        label.Font = Enum.Font.Gotham
        label.Text = text
        label.TextColor3 = Color3.fromRGB(220, 240, 255)
        label.TextSize = 12
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Name = "ValueLabel"
        valueLabel.Parent = sliderFrame
        valueLabel.BackgroundTransparency = 1
        valueLabel.Position = UDim2.new(0.7, 0, 0.1, 0)
        valueLabel.Size = UDim2.new(0.25, 0, 0, 20)
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.Text = tostring(default)
        valueLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
        valueLabel.TextSize = 14
        
        -- Slider con diseño PRO
        local sliderBg = Instance.new("Frame")
        sliderBg.Name = "SliderBg"
        sliderBg.Parent = sliderFrame
        sliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        sliderBg.Position = UDim2.new(0.05, 0, 0.6, 0)
        sliderBg.Size = UDim2.new(0.9, 0, 0, 8)
        
        local bgCorner = Instance.new("UICorner")
        bgCorner.CornerRadius = UDim.new(1, 0)
        bgCorner.Parent = sliderBg
        
        local sliderFill = Instance.new("Frame")
        sliderFill.Name = "SliderFill"
        sliderFill.Parent = sliderBg
        sliderFill.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
        sliderFill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
        
        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(1, 0)
        fillCorner.Parent = sliderFill
        
        -- Handle del slider
        local sliderHandle = Instance.new("Frame")
        sliderHandle.Name = "SliderHandle"
        sliderHandle.Parent = sliderBg
        sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderHandle.Size = UDim2.new(0, 15, 0, 15)
        sliderHandle.Position = UDim2.new((default - min)/(max - min), -7.5, 0.5, -7.5)
        
        local handleCorner = Instance.new("UICorner")
        handleCorner.CornerRadius = UDim.new(1, 0)
        handleCorner.Parent = sliderHandle
        
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
                sliderHandle.Position = UDim2.new(percent, -7.5, 0.5, -7.5)
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
    
    -- Función crear botón PRO con indicador
    local function CreateProButton(name, text, shortcut, callback)
        local buttonFrame = Instance.new("Frame")
        buttonFrame.Name = name .. "ButtonFrame"
        buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        buttonFrame.Size = UDim2.new(1, -10, 0, 50)
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = buttonFrame
        
        -- Icono
        local icon = Instance.new("TextLabel")
        icon.Name = "Icon"
        icon.Parent = buttonFrame
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0.05, 0, 0, 0)
        icon.Size = UDim2.new(0.1, 0, 1, 0)
        icon.Font = Enum.Font.GothamBold
        icon.Text = "⚡"
        icon.TextColor3 = Color3.fromRGB(0, 200, 255)
        icon.TextSize = 18
        
        -- Botón principal
        local button = Instance.new("TextButton")
        button.Name = name .. "Button"
        button.Parent = buttonFrame
        button.BackgroundTransparency = 1
        button.Position = UDim2.new(0.15, 0, 0, 0)
        button.Size = UDim2.new(0.6, 0, 1, 0)
        button.Font = Enum.Font.Gotham
        button.Text = text
        button.TextColor3 = Color3.fromRGB(220, 240, 255)
        button.TextSize = 13
        button.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Shortcut
        local shortcutLabel = Instance.new("TextLabel")
        shortcutLabel.Name = "ShortcutLabel"
        shortcutLabel.Parent = buttonFrame
        shortcutLabel.BackgroundTransparency = 1
        shortcutLabel.Position = UDim2.new(0.75, 0, 0, 0)
        shortcutLabel.Size = UDim2.new(0.2, 0, 1, 0)
        shortcutLabel.Font = Enum.Font.Gotham
        shortcutLabel.Text = "[" .. shortcut .. "]"
        shortcutLabel.TextColor3 = Color3.fromRGB(180, 200, 255)
        shortcutLabel.TextSize = 11
        
        -- Indicador de estado
        local indicator = Instance.new("TextButton")
        indicator.Name = name .. "Indicator"
        indicator.Parent = buttonFrame
        indicator.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        indicator.Position = UDim2.new(0.9, -15, 0.15, 0)
        indicator.Size = UDim2.new(0, 30, 0, 25)
        indicator.Font = Enum.Font.GothamBold
        indicator.Text = "OFF"
        indicator.TextColor3 = Color3.fromRGB(255, 255, 255)
        indicator.TextSize = 10
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(0, 6)
        indicatorCorner.Parent = indicator
        
        -- Guardar indicador en cache
        GuiElements.Indicators[name] = indicator
        
        button.MouseButton1Click:Connect(function()
            callback()
        end)
        
        indicator.MouseButton1Click:Connect(function()
            callback()
        end)
        
        -- Animación hover
        buttonFrame.MouseEnter:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 80)}):Play()
        end)
        
        buttonFrame.MouseLeave:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 60)}):Play()
        end)
        
        return buttonFrame
    end
    
    -- Scroll para movimiento
    local MovementScroll = Instance.new("ScrollingFrame")
    MovementScroll.Name = "MovementScroll"
    MovementScroll.Parent = MovementPanel
    MovementScroll.BackgroundTransparency = 1
    MovementScroll.Position = UDim2.new(0, 5, 0, 5)
    MovementScroll.Size = UDim2.new(1, -10, 1, -10)
    MovementScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
    MovementScroll.ScrollBarThickness = 6
    MovementScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 150, 255)
    
    local MovementLayout = Instance.new("UIListLayout")
    MovementLayout.Parent = MovementScroll
    MovementLayout.Padding = UDim.new(0, 10)
    MovementLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Sliders y botones de movimiento
    CreateProSlider("SuperJump", "Super Jump Power", 50, 500, 100, function(value)
        Config.SuperJump = value
    end).Parent = MovementScroll
    
    CreateProButton("SuperJumpBtn", "Activate Super Jump", "J", function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = Config.SuperJump
            UpdateButtonState("SuperJumpBtn", true)
            Notify("SUPER JUMP", "Activated: " .. Config.SuperJump)
        end
    end).Parent = MovementScroll
    
    CreateProSlider("SuperSpeed", "Super Speed", 16, 300, 100, function(value)
        Config.SuperSpeed = value
    end).Parent = MovementScroll
    
    CreateProButton("SuperSpeedBtn", "Activate Super Speed", "R", function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Config.SuperSpeed
            UpdateButtonState("SuperSpeedBtn", true)
            Notify("SUPER SPEED", "Activated: " .. Config.SuperSpeed)
        end
    end).Parent = MovementScroll
    
    CreateProSlider("FlySpeed", "Fly Speed", 10, 200, 50, function(value)
        Config.FlySpeed = value
    end).Parent = MovementScroll
    
    CreateProButton("FlyBtn", "Toggle Fly", "F", function()
        Config.Flying = not Config.Flying
        UpdateButtonState("FlyBtn", Config.Flying)
        ToggleFlying(Config.Flying)
    end).Parent = MovementScroll
    
    CreateProButton("NoClipBtn", "Toggle NoClip", "N", function()
        Config.NoClip = not Config.NoClip
        UpdateButtonState("NoClipBtn", Config.NoClip)
        
        if Config.NoClip then
            Notify("NOCLIP", "Activated")
            
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
            Notify("NOCLIP", "Deactivated")
            if Config.NoclipConnection then
                Config.NoclipConnection:Disconnect()
                Config.NoclipConnection = nil
            end
        end
    end).Parent = MovementScroll
    
    CreateProButton("InfiniteJumpBtn", "Infinite Jump", "H", function()
        Config.InfiniteJump = not Config.InfiniteJump
        UpdateButtonState("InfiniteJumpBtn", Config.InfiniteJump)
        Notify("INFINITE JUMP", Config.InfiniteJump and "Activated" or "Deactivated")
    end).Parent = MovementScroll
    
    -- ===== PANEL DE COMBATE MEJORADO =====
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
    CombatScroll.Position = UDim2.new(0, 5, 0, 5)
    CombatScroll.Size = UDim2.new(1, -10, 1, -10)
    CombatScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
    CombatScroll.ScrollBarThickness = 6
    
    local CombatLayout = Instance.new("UIListLayout")
    CombatLayout.Parent = CombatScroll
    CombatLayout.Padding = UDim.new(0, 10)
    
    -- Botones de combate
    CreateProButton("GodModeBtn", "God Mode", "G", function()
        Config.GodMode = not Config.GodMode
        UpdateButtonState("GodModeBtn", Config.GodMode)
        
        if LocalPlayer.Character then
            if Config.GodMode then
                BypassSystem.GodMode()
                Notify("GOD MODE", "Activated - Invincible!")
            else
                Notify("GOD MODE", "Deactivated")
            end
        end
    end).Parent = CombatScroll
    
    CreateProButton("KillAllBtn", "Kill All Players", "K", function()
        Notify("KILL ALL", "Killing all players...")
        local killed, total = BypassSystem.KillAll()
        Notify("KILL ALL", "Eliminated " .. killed .. "/" .. total .. " players!")
    end).Parent = CombatScroll
    
    CreateProButton("OneHitKillBtn", "One Hit Kill", "U", function()
        Config.OneHitKill = not Config.OneHitKill
        UpdateButtonState("OneHitKillBtn", Config.OneHitKill)
        Notify("ONE HIT KILL", Config.OneHitKill and "Activated" or "Deactivated")
    end).Parent = CombatScroll
    
    CreateProButton("KillAuraBtn", "Kill Aura", "PageUp", function()
        Config.KillAura = not Config.KillAura
        UpdateButtonState("KillAuraBtn", Config.KillAura)
        Notify("KILL AURA", Config.KillAura and "Activated" or "Deactivated")
    end).Parent = CombatScroll
    
    CreateProButton("ForceFieldBtn", "Force Field", "6", function()
        Config.ForceField = not Config.ForceField
        UpdateButtonState("ForceFieldBtn", Config.ForceField)
        Notify("FORCE FIELD", Config.ForceField and "Activated" or "Deactivated")
    end).Parent = CombatScroll
    
    -- AIMBOT
    CreateProSlider("AimbotFOV", "Aimbot FOV", 10, 200, 50, function(value)
        Config.AimbotFOV = value
    end).Parent = CombatScroll
    
    CreateProSlider("AimbotSmooth", "Aimbot Smoothness", 1, 20, 10, function(value)
        Config.AimbotSmoothness = value
    end).Parent = CombatScroll
    
    CreateProButton("AimbotBtn", "Toggle Aimbot", "Q", function()
        Config.Aimbot = not Config.Aimbot
        UpdateButtonState("AimbotBtn", Config.Aimbot)
        ToggleAimbot(Config.Aimbot)
    end).Parent = CombatScroll
    
    -- ===== PANEL DE MUNDO =====
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
    WorldScroll.Position = UDim2.new(0, 5, 0, 5)
    WorldScroll.Size = UDim2.new(1, -10, 1, -10)
    WorldScroll.CanvasSize = UDim2.new(0, 0, 1.2, 0)
    WorldScroll.ScrollBarThickness = 6
    
    local WorldLayout = Instance.new("UIListLayout")
    WorldLayout.Parent = WorldScroll
    WorldLayout.Padding = UDim.new(0, 10)
    
    -- Botones de mundo
    CreateProButton("DayBtn", "Day Time", "PageDown", function()
        Lighting.ClockTime = 12
        Notify("TIME", "Set to Day")
    end).Parent = WorldScroll
    
    CreateProButton("NightBtn", "Night Time", "L", function()
        Lighting.ClockTime = 0
        Notify("TIME", "Set to Night")
    end).Parent = WorldScroll
    
    CreateProButton("FullbrightBtn", "Fullbright", "B", function()
        Config.Fullbright = not Config.Fullbright
        UpdateButtonState("FullbrightBtn", Config.Fullbright)
        
        if Config.Fullbright then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 10
            Lighting.GlobalShadows = false
            Notify("FULLBRIGHT", "Activated")
        else
            Lighting.Ambient = Color3.fromRGB(1, 1, 1)
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Notify("FULLBRIGHT", "Deactivated")
        end
    end).Parent = WorldScroll
    
    CreateProSlider("Gravity", "Gravity", 0, 196, 196, function(value)
        workspace.Gravity = value
        Notify("GRAVITY", "Set to: " .. value)
    end).Parent = WorldScroll
    
    CreateProButton("ToxicBtn", "Toxic Mode", "T", function()
        Config.ToxicMode = not Config.ToxicMode
        UpdateButtonState("ToxicBtn", Config.ToxicMode)
        
        if Config.ToxicMode then
            Lighting.Ambient = Color3.fromRGB(50, 0, 0)
            Lighting.Brightness = 0.5
            Lighting.FogColor = Color3.fromRGB(100, 0, 0)
            Lighting.FogEnd = 200
            Notify("TOXIC MODE", "Activated")
        else
            Lighting.Ambient = Color3.fromRGB(1, 1, 1)
            Lighting.Brightness = 1
            Lighting.FogColor = Color3.fromRGB(191, 191, 191)
            Lighting.FogEnd = 100000
            Notify("TOXIC MODE", "Deactivated")
        end
    end).Parent = WorldScroll
    
    -- ===== PANEL DE VISUAL MEJORADO =====
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
    VisualScroll.Position = UDim2.new(0, 5, 0, 5)
    VisualScroll.Size = UDim2.new(1, -10, 1, -10)
    VisualScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
    VisualScroll.ScrollBarThickness = 6
    
    local VisualLayout = Instance.new("UIListLayout")
    VisualLayout.Parent = VisualScroll
    VisualLayout.Padding = UDim.new(0, 10)
    
    -- Botones visuales mejorados
    CreateProButton("EspBtn", "ESP Players", "E", function()
        Config.Esp = not Config.Esp
        UpdateButtonState("EspBtn", Config.Esp)
        ToggleEsp(Config.Esp)
    end).Parent = VisualScroll
    
    CreateProButton("EspDistanceBtn", "Show Distance", "", function()
        Config.EspDistance = not Config.EspDistance
        UpdateButtonState("EspDistanceBtn", Config.EspDistance)
        Notify("ESP", "Distance display " .. (Config.EspDistance and "ON" or "OFF"))
    end).Parent = VisualScroll
    
    CreateProButton("EspTracersBtn", "ESP Tracers", "", function()
        Config.EspTracers = not Config.EspTracers
        UpdateButtonState("EspTracersBtn", Config.EspTracers)
        Notify("ESP", "Tracers " .. (Config.EspTracers and "ON" or "OFF"))
    end).Parent = VisualScroll
    
    CreateProButton("EspBoxesBtn", "ESP Boxes", "", function()
        Config.EspBoxes = not Config.EspBoxes
        UpdateButtonState("EspBoxesBtn", Config.EspBoxes)
        Notify("ESP", "Boxes " .. (Config.EspBoxes and "ON" or "OFF"))
    end).Parent = VisualScroll
    
    CreateProButton("ChamsBtn", "Chams", "C", function()
        Config.Chams = not Config.Chams
        UpdateButtonState("ChamsBtn", Config.Chams)
        Notify("CHAMS", Config.Chams and "Activated" or "Deactivated")
    end).Parent = VisualScroll
    
    CreateProButton("XrayBtn", "X-Ray", "X", function()
        Config.Xray = not Config.Xray
        UpdateButtonState("XrayBtn", Config.Xray)
        Notify("X-RAY", Config.Xray and "Activated" or "Deactivated")
    end).Parent = VisualScroll
    
    CreateProButton("WallhackBtn", "Wallhack", "Z", function()
        Config.Wallhack = not Config.Wallhack
        UpdateButtonState("WallhackBtn", Config.Wallhack)
        ToggleWallhack(Config.Wallhack)
    end).Parent = VisualScroll
    
    -- ===== PANEL DE SHORTCUTS =====
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
    ShortcutsScroll.Position = UDim2.new(0, 5, 0, 5)
    ShortcutsScroll.Size = UDim2.new(1, -10, 1, -10)
    ShortcutsScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
    ShortcutsScroll.ScrollBarThickness = 6
    
    local ShortcutsLayout = Instance.new("UIListLayout")
    ShortcutsLayout.Parent = ShortcutsScroll
    ShortcutsLayout.Padding = UDim.new(0, 10)
    
    -- Función crear shortcut item
    local function CreateShortcutItem(key, description)
        local item = Instance.new("Frame")
        item.Name = key .. "Item"
        item.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        item.Size = UDim2.new(1, 0, 0, 40)
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = item
        
        -- Key
        local keyLabel = Instance.new("TextLabel")
        keyLabel.Name = "Key"
        keyLabel.Parent = item
        keyLabel.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        keyLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
        keyLabel.Size = UDim2.new(0.15, 0, 0.7, 0)
        keyLabel.Font = Enum.Font.GothamBold
        keyLabel.Text = key
        keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        keyLabel.TextSize = 13
        
        local keyCorner = Instance.new("UICorner")
        keyCorner.CornerRadius = UDim.new(0, 6)
        keyCorner.Parent = keyLabel
        
        -- Description
        local descLabel = Instance.new("TextLabel")
        descLabel.Name = "Desc"
        descLabel.Parent = item
        descLabel.BackgroundTransparency = 1
        descLabel.Position = UDim2.new(0.25, 0, 0, 0)
        descLabel.Size = UDim2.new(0.7, 0, 1, 0)
        descLabel.Font = Enum.Font.Gotham
        descLabel.Text = description
        descLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
        descLabel.TextSize = 12
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        return item
    end
    
    -- Shortcuts actualizados (con invisibilidad)
    local shortcuts = {
        {"INSERT", "Toggle Menu"},
        {"F", "Toggle Fly"},
        {"G", "God Mode"},
        {"J", "Super Jump"},
        {"R", "Super Speed"},
        {"N", "NoClip"},
        {"K", "Kill All"},
        {"M", "TP to Mouse"},
        {"P", "TP to Base"},
        {"PageDown", "Day Time"},
        {"L", "Night Time"},
        {"B", "Fullbright"},
        {"X", "X-Ray"},
        {"E", "ESP"},
        {"C", "Chams"},
        {"Z", "Wallhack"},
        {"Q", "Aimbot"},
        {"O", "Reset Character"},
        {"H", "Infinite Jump"},
        {"T", "Toxic Mode"},
        {"U", "One Hit Kill"},
        {"↑", "Kill Aura"},
        {"2", "Auto Clicker"},
        {"6", "Force Field"},
        {"1", "Anti AFK"},
        {"V", "Spectate Mode"},
        {"I", "Invisibility"}
    }
    
    for _, shortcut in ipairs(shortcuts) do
        CreateShortcutItem(shortcut[1], shortcut[2]).Parent = ShortcutsScroll
    end
    
    -- ===== FUNCIONALIDADES =====
    
    -- Función para cambiar pestañas
    local function SwitchTab(tabName)
        -- Ocultar todos los paneles
        PlayerPanel.Visible = false
        MovementPanel.Visible = false
        CombatPanel.Visible = false
        WorldPanel.Visible = false
        VisualPanel.Visible = false
        ShortcutsPanel.Visible = false
        
        -- Mostrar panel seleccionado
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
                
                -- Resaltar pestaña activa
                for _, otherTab in ipairs(tabs) do
                    local otherButton = TabsHeader:FindFirstChild(otherTab[2] .. "Tab")
                    if otherButton then
                        otherButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                    end
                end
                tabButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
            end)
        end
    end
    
    -- Botón buscar jugador
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
            
            -- Actualizar información del jugador
            PlayerName.Text = "Player: " .. player.Name
            PlayerId.Text = "ID: " .. tostring(player.UserId)
            PlayerStatus.Text = "Status: Found ✅"
            PlayerStatus.TextColor3 = Color3.fromRGB(0, 255, 100)
            
            -- Mostrar botones de acción
            for _, action in ipairs(actions) do
                local btn = ActionFrame:FindFirstChild(action[1] .. "Btn")
                if btn then
                    btn.Visible = true
                end
            end
            
            Notify("PLAYER FOUND", "Selected: " .. player.Name)
        else
            Notify("ERROR", "Player not found: " .. input)
            PlayerInfoFrame.Visible = false
            for _, action in ipairs(actions) do
                local btn = ActionFrame:FindFirstChild(action[1] .. "Btn")
                if btn then
                    btn.Visible = false
                end
            end
        end
    end)
    
    -- TP To Player
    local TPToBtn = ActionFrame:FindFirstChild("TP TOBtn")
    if TPToBtn then
        TPToBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer and Config.SelectedPlayer.Character then
                local targetHRP = Config.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                local myChar = LocalPlayer.Character
                if targetHRP and myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    myChar.HumanoidRootPart.CFrame = targetHRP.CFrame
                    Notify("TELEPORT", "Teleported to " .. Config.SelectedPlayer.Name)
                end
            else
                Notify("ERROR", "No player selected or player has no character")
            end
        end)
    end
    
    -- Bring Player
    local BringBtn = ActionFrame:FindFirstChild("BRINGBtn")
    if BringBtn then
        BringBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer and Config.SelectedPlayer.Character then
                local targetHRP = Config.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                local myChar = LocalPlayer.Character
                if targetHRP and myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    local myPos = myChar.HumanoidRootPart.CFrame
                    targetHRP.CFrame = myPos + Vector3.new(0, 3, 0)
                    wait(0.1)
                    targetHRP.CFrame = myPos + Vector3.new(0, 3, 0)
                    Notify("TELEPORT", "Brought " .. Config.SelectedPlayer.Name .. " to you")
                end
            else
                Notify("ERROR", "No player selected or player has no character")
            end
        end)
    end
    
    -- Spectate Player
    local SpectateBtn = ActionFrame:FindFirstChild("SPECTATEBtn")
    if SpectateBtn then
        SpectateBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer then
                SpectatePlayer(Config.SelectedPlayer)
                -- Actualizar texto del botón
                if Config.Spectating then
                    SpectateBtn.Text = "STOP"
                    SpectateBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
                else
                    SpectateBtn.Text = "SPECTATE"
                    SpectateBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
                end
            else
                Notify("ERROR", "No player selected")
            end
        end)
    end
    
    -- Kill Player
    local KillBtn = ActionFrame:FindFirstChild("KILLBtn")
    if KillBtn then
        KillBtn.MouseButton1Click:Connect(function()
            if Config.SelectedPlayer then
                if BypassSystem.Kill(Config.SelectedPlayer) then
                    Notify("KILL", "Successfully killed " .. Config.SelectedPlayer.Name)
                else
                    Notify("WARNING", "Kill attempt on " .. Config.SelectedPlayer.Name .. " - may require manual kill")
                end
            else
                Notify("ERROR", "No player selected")
            end
        end)
    end
    
    -- Botón cerrar
    CloseButton.MouseButton1Click:Connect(function()
        -- Limpiar todo
        if Config.Spectating then
            Config.Spectating = false
            if Config.OriginalCameraSubject then
                workspace.CurrentCamera.CameraSubject = Config.OriginalCameraSubject
            end
        end
        
        -- Desactivar ESP
        if EspConnection then
            EspConnection:Disconnect()
        end
        for _, obj in pairs(GuiElements.EspObjects) do
            if obj then
                obj:Destroy()
            end
        end
        
        -- Desactivar Aimbot
        if AimbotConnection then
            AimbotConnection:Disconnect()
        end
        
        -- Desactivar Wallhack
        ToggleWallhack(false)
        
        -- 🔥 Desactivar invisibilidad
        if Config.Invisible then
            Config.Invisible = false
            ToggleInvisibility(false)
        end
        
        ScreenGui:Destroy()
        Notify("MENU", "Closed")
    end)
    
    -- Botón minimizar
    MinimizeButton.MouseButton1Click:Connect(function()
        Config.MenuOpen = not Config.MenuOpen
        MainFrame.Visible = Config.MenuOpen
        Notify("MENU", Config.MenuOpen and "Visible" or "Hidden")
    end)
    
    -- Inicializar estados
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
    UpdateButtonState("EspDistanceBtn", false)
    UpdateButtonState("EspTracersBtn", false)
    UpdateButtonState("EspBoxesBtn", false)
    UpdateButtonState("InvisibleBtn", false)
    
    return ScreenGui, MainFrame
end

-- Crear panel izquierdo de shortcuts
local function CreateLeftShortcutsPanel()
    local ScreenGui = GuiElements.ScreenGui
    
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Name = "LeftShortcutsPanel"
    LeftPanel.Parent = ScreenGui
    LeftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    LeftPanel.BorderSizePixel = 0
    LeftPanel.Position = UDim2.new(0, 10, 0.3, 0)
    LeftPanel.Size = UDim2.new(0, 180, 0, 350)
    LeftPanel.Active = true
    LeftPanel.Draggable = true
    LeftPanel.Visible = true
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 8)
    MainCorner.Parent = LeftPanel
    
    -- Header
    local PanelHeader = Instance.new("Frame")
    PanelHeader.Name = "PanelHeader"
    PanelHeader.Parent = LeftPanel
    PanelHeader.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    PanelHeader.Size = UDim2.new(1, 0, 0, 40)
    PanelHeader.BorderSizePixel = 0
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 8, 0, 0)
    HeaderCorner.Parent = PanelHeader
    
    local PanelTitle = Instance.new("TextLabel")
    PanelTitle.Name = "PanelTitle"
    PanelTitle.Parent = PanelHeader
    PanelTitle.BackgroundTransparency = 1
    PanelTitle.Size = UDim2.new(1, 0, 1, 0)
    PanelTitle.Font = Enum.Font.GothamBold
    PanelTitle.Text = "⚡ QUICK KEYS"
    PanelTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
    PanelTitle.TextSize = 14
    
    -- Lista de atajos mejorada (con invisibilidad)
    local shortcuts = {
        {"INSERT", "Toggle Menu"},
        {"F", "Fly Toggle"},
        {"G", "God Mode"},
        {"J", "Super Jump"},
        {"R", "Super Speed"},
        {"N", "NoClip"},
        {"K", "Kill All"},
        {"M", "TP Mouse"},
        {"P", "TP Base"},
        {"PageDown", "Day"},
        {"L", "Night"},
        {"B", "Fullbright"},
        {"X", "X-Ray"},
        {"E", "ESP"},
        {"Z", "Wallhack"},
        {"Q", "Aimbot"},
        {"I", "Invisibility"},
        {"O", "Reset Char"}
    }
    
    local ShortcutsScroll = Instance.new("ScrollingFrame")
    ShortcutsScroll.Name = "ShortcutsScroll"
    ShortcutsScroll.Parent = LeftPanel
    ShortcutsScroll.BackgroundTransparency = 1
    ShortcutsScroll.Position = UDim2.new(0, 10, 0.12, 0)
    ShortcutsScroll.Size = UDim2.new(1, -20, 0.88, -10)
    ShortcutsScroll.CanvasSize = UDim2.new(0, 0, 0, #shortcuts * 35)
    ShortcutsScroll.ScrollBarThickness = 4
    
    local ShortcutsLayout = Instance.new("UIListLayout")
    ShortcutsLayout.Parent = ShortcutsScroll
    ShortcutsLayout.Padding = UDim.new(0, 5)
    ShortcutsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    for i, shortcut in ipairs(shortcuts) do
        local shortcutFrame = Instance.new("Frame")
        shortcutFrame.Name = "Shortcut" .. i
        shortcutFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        shortcutFrame.Size = UDim2.new(1, 0, 0, 30)
        
        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 4)
        frameCorner.Parent = shortcutFrame
        
        local keyLabel = Instance.new("TextLabel")
        keyLabel.Name = "Key"
        keyLabel.Parent = shortcutFrame
        keyLabel.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        keyLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
        keyLabel.Size = UDim2.new(0.3, 0, 0.7, 0)
        keyLabel.Font = Enum.Font.GothamBold
        keyLabel.Text = shortcut[1]
        keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        keyLabel.TextSize = 12
        
        local keyCorner = Instance.new("UICorner")
        keyCorner.CornerRadius = UDim.new(0, 4)
        keyCorner.Parent = keyLabel
        
        local descLabel = Instance.new("TextLabel")
        descLabel.Name = "Desc"
        descLabel.Parent = shortcutFrame
        descLabel.BackgroundTransparency = 1
        descLabel.Position = UDim2.new(0.4, 0, 0, 0)
        descLabel.Size = UDim2.new(0.6, 0, 1, 0)
        descLabel.Font = Enum.Font.Gotham
        descLabel.Text = shortcut[2]
        descLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
        descLabel.TextSize = 10
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        shortcutFrame.Parent = ShortcutsScroll
    end
    
    return LeftPanel
end

-- Crear la GUI
local ScreenGui, MainFrame = CreatePremiumGUI()
CreateLeftShortcutsPanel()

-- Sistema de funcionalidades adicionales
local function SetupAdditionalFeatures()
    -- Infinite Jump
    spawn(function()
        while true do
            if Config.InfiniteJump and LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    if UIS:IsKeyDown(Enum.KeyCode.Space) then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
            wait(0.1)
        end
    end)
    
    -- Anti AFK
    spawn(function()
        while true do
            if Config.AntiAfk then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.W, false, game)
                wait(1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.W, false, game)
                wait(1)
            else
                wait(2)
            end
        end
    end)
    
    -- Force Field
    spawn(function()
        while true do
            if Config.ForceField and LocalPlayer.Character then
                local char = LocalPlayer.Character
                if not char:FindFirstChild("ForceFieldBypass") then
                    local forceField = Instance.new("ForceField")
                    forceField.Name = "ForceFieldBypass"
                    forceField.Parent = char
                end
            elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("ForceFieldBypass") then
                LocalPlayer.Character.ForceFieldBypass:Destroy()
            end
            wait(1)
        end
    end)
    
    -- Kill Aura (mejorado)
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
                                if distance < 20 then
                                    BypassSystem.Kill(player)
                                end
                            end
                        end
                    end
                end
            end
            wait(0.5)
        end
    end)
    
    -- One Hit Kill
    spawn(function()
        while true do
            if Config.OneHitKill and LocalPlayer.Character then
                local char = LocalPlayer.Character
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    -- Conectar eventos de ataque
                    for _, tool in pairs(char:GetChildren()) do
                        if tool:IsA("Tool") then
                            -- Hacer que cualquier ataque sea letal
                            tool.Activated:Connect(function()
                                if Config.SelectedPlayer and Config.SelectedPlayer.Character then
                                    BypassSystem.Kill(Config.SelectedPlayer)
                                end
                            end)
                        end
                    end
                end
            end
            wait(1)
        end
    end)
    
    -- Auto Clicker
    spawn(function()
        while true do
            if Config.AutoClicker then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                wait(0.05)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
                wait(0.1)
            else
                wait(0.5)
            end
        end
    end)
end

-- Iniciar funcionalidades adicionales
SetupAdditionalFeatures()

-- Sistema de atajos de teclado mejorado
UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    -- Atajo para abrir/cerrar menú (INSERT)
    if input.KeyCode == Enum.KeyCode.Insert then
        Config.MenuOpen = not Config.MenuOpen
        MainFrame.Visible = Config.MenuOpen
        Notify("MENU", Config.MenuOpen and "Visible" or "Hidden")
    end
    
    -- Atajos de funciones
    if not UIS:GetFocusedTextBox() then
        -- Super Jump [J]
        if input.KeyCode == Enum.KeyCode.J then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = Config.SuperJump
                UpdateButtonState("SuperJumpBtn", true)
                Notify("SUPER JUMP", "Activated: " .. Config.SuperJump)
                wait(2)
                UpdateButtonState("SuperJumpBtn", false)
            end
        end
        
        -- Super Speed [R]
        if input.KeyCode == Enum.KeyCode.R then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = Config.SuperSpeed
                UpdateButtonState("SuperSpeedBtn", true)
                Notify("SUPER SPEED", "Activated: " .. Config.SuperSpeed)
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
            
            if LocalPlayer.Character then
                if Config.GodMode then
                    BypassSystem.GodMode()
                    Notify("GOD MODE", "Activated")
                else
                    Notify("GOD MODE", "Deactivated")
                end
            end
        end
        
        -- Kill All [K]
        if input.KeyCode == Enum.KeyCode.K then
            local killed, total = BypassSystem.KillAll()
            Notify("KILL ALL", "Eliminated " .. killed .. "/" .. total .. " players!")
        end
        
        -- TP to Mouse [M]
        if input.KeyCode == Enum.KeyCode.M then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 3, 0))
                Notify("TELEPORT", "TP to mouse")
            end
        end
        
        -- NoClip [N]
        if input.KeyCode == Enum.KeyCode.N then
            Config.NoClip = not Config.NoClip
            UpdateButtonState("NoClipBtn", Config.NoClip)
            Notify("NOCLIP", Config.NoClip and "Activated" or "Deactivated")
        end
        
        -- Day [PageDown]
        if input.KeyCode == Enum.KeyCode.PageDown then
            Lighting.ClockTime = 12
            Notify("TIME", "Set to Day")
        end
        
        -- Night [L]
        if input.KeyCode == Enum.KeyCode.L then
            Lighting.ClockTime = 0
            Notify("TIME", "Set to Night")
        end
        
        -- Fullbright [B]
        if input.KeyCode == Enum.KeyCode.B then
            Config.Fullbright = not Config.Fullbright
            UpdateButtonState("FullbrightBtn", Config.Fullbright)
            Notify("FULLBRIGHT", Config.Fullbright and "Activated" or "Deactivated")
        end
        
        -- X-Ray [X]
        if input.KeyCode == Enum.KeyCode.X then
            Config.Xray = not Config.Xray
            UpdateButtonState("XrayBtn", Config.Xray)
            Notify("X-RAY", Config.Xray and "Activated" or "Deactivated")
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
            Notify("CHAMS", Config.Chams and "Activated" or "Deactivated")
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
        
        -- 🔥 INVISIBILIDAD [I]
        if input.KeyCode == Enum.KeyCode.I then
            Config.Invisible = not Config.Invisible
            UpdateButtonState("InvisibleBtn", Config.Invisible)
            ToggleInvisibility(Config.Invisible)
        end
        
            -- Atajo para C00LCLAN Invisibility [ALT+Ñ]
    if input.KeyCode == Enum.KeyCode.I and UIS:IsKeyDown(Enum.KeyCode.LeftAlt) then
        local success = CoolClanInvisibility()
        if success then
            if CoolInvisibleBtn then
                CoolInvisibleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                CoolInvisibleBtn.Text = "✅ C00LCLAN INVIS ACTIVE"
            end
        end
    end

        -- Anti AFK [1]
        if input.KeyCode == Enum.KeyCode.One then
            Config.AntiAfk = not Config.AntiAfk
            UpdateButtonState("AntiAfkBtn", Config.AntiAfk)
            Notify("ANTI AFK", Config.AntiAfk and "Activated" or "Deactivated")
        end
        
        -- Reset Character [O]
        if input.KeyCode == Enum.KeyCode.O then
            if LocalPlayer.Character then
                LocalPlayer.Character:BreakJoints()
                Notify("RESET", "Character reset")
            end
        end
        
        -- Infinite Jump [H]
        if input.KeyCode == Enum.KeyCode.H then
            Config.InfiniteJump = not Config.InfiniteJump
            UpdateButtonState("InfiniteJumpBtn", Config.InfiniteJump)
            Notify("INFINITE JUMP", Config.InfiniteJump and "Activated" or "Deactivated")
        end
        
        -- Toxic Mode [T]
        if input.KeyCode == Enum.KeyCode.Z then
            Config.ToxicMode = not Config.ToxicMode
            UpdateButtonState("ToxicBtn", Config.ToxicMode)
            Notify("TOXIC MODE", Config.ToxicMode and "Activated" or "Deactivated")
        end
        
        -- One Hit Kill [U]
        if input.KeyCode == Enum.KeyCode.U then
            Config.OneHitKill = not Config.OneHitKill
            UpdateButtonState("OneHitKillBtn", Config.OneHitKill)
            Notify("ONE HIT KILL", Config.OneHitKill and "Activated" or "Deactivated")
        end
        
        -- Kill Aura [PageUp]
        if input.KeyCode == Enum.KeyCode.PageUp then
            Config.KillAura = not Config.KillAura
            UpdateButtonState("KillAuraBtn", Config.KillAura)
            Notify("KILL AURA", Config.KillAura and "Activated" or "Deactivated")
        end
        
        -- Auto Clicker [2]
        if input.KeyCode == Enum.KeyCode.Two then
            Config.AutoClicker = not Config.AutoClicker
            UpdateButtonState("AutoClickerBtn", Config.AutoClicker)
            Notify("AUTO CLICKER", Config.AutoClicker and "Activated" or "Deactivated")
        end
        
        -- Force Field [6]
        if input.KeyCode == Enum.KeyCode.Six then
            Config.ForceField = not Config.ForceField
            UpdateButtonState("ForceFieldBtn", Config.ForceField)
            Notify("FORCE FIELD", Config.ForceField and "Activated" or "Deactivated")
        end
    end
end)

-- Protección al respawnear
LocalPlayer.CharacterAdded:Connect(function(char)
    wait(1)
    if Config.GodMode then
        BypassSystem.GodMode()
    end
    if Config.ForceField then
        local forceField = Instance.new("ForceField")
        forceField.Name = "ForceFieldBypass"
        forceField.Parent = char
    end
    -- 🔥 Mantener invisibilidad al respawnear
    if Config.Invisible then
        wait(0.5)
        ToggleInvisibility(true)
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

-- Notificación final mejorada
wait(1)
Notify("🎮 OUTLAST PANEL v2.0 PRO", 
    "Loaded! Press INSERT to toggle menu\n"..
    "Left Panel with Shortcuts Active\n"..
    "NEW FEATURES: Aimbot, Wallhack, ESP Tracers!\n"..
    "🔥 NEW: ULTIMATE INVISIBILITY MODE (Press I)", 5)

print("\n" .. string.rep("=", 70))
print("⚡ OUTLAST PANEL v2.0 PRO - ULTRA PREMIUM")
print(string.rep("=", 70))
print("🎯 COMBAT SYSTEM: AIMBOT + KILL AURA")
print("👁️ VISUAL SYSTEM: ESP + WALLHACK + TRACERS")
print("📌 LEFT PANEL: ACTIVE (Quick keys)")
print("🎨 INTERFACE: PRO DESIGN WITH TABS")
print("🔥 NEW FEATURE: ULTIMATE INVISIBILITY SYSTEM")
print("\n📋 QUICK SHORTCUTS (Left Panel):")
print("   INSERT - Toggle Menu | F - Fly")
print("   G - God Mode         | J - Super Jump")
print("   R - Super Speed      | N - NoClip")
print("   K - Kill All         | M - TP Mouse")
print("   P - TP Base          | ↑ - Day")
print("   L - Night            | B - Fullbright")
print("   X - X-Ray           | E - ESP")
print("   Z - Wallhack        | Q - Aimbot")
print("   I - INVISIBILITY    | O - Reset Character")
print("\n🎮 TABS SYSTEM:")
print("   🎮 Player - Player controls & reset")
print("   ⚡ Movement - Speed, jump, fly")
print("   🎯 Combat - God mode, aimbot, kill")
print("   🌍 World - Time, gravity, effects")
print("   👁️ Visual - ESP, wallhack, tracers")
print("   📋 Shortcuts - All keybinds")
print("\n⚡ NEW FEATURES v2.0 PRO:")
print("   • Aimbot System (Press Q)")
print("   • Wallhack (Press Z)")
print("   • ESP with Tracers & Distance")
print("   • Reset Character Button")
print("   • Improved kill system")
print("   • Professional interface design")
print("   • Tab system for organization")
print("   🔥 ULTIMATE INVISIBILITY SYSTEM (Press I)")
print("     - Multiple camouflage methods")
print("     - Anti-detection system")
print("     - NoClip auto-enabled")
print("     - Works in any server")
print(string.rep("=", 70))
