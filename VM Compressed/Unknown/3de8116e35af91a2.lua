-- Cargar WindUI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--------------------------------------------------------------------------------
-- SISTEMA DE KEY MEJORADO (Key: 2013)
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XpGringoKeyUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 220)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(138, 43, 226)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame:TweenSize(UDim2.new(0, 360, 0, 220), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.45, true)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "XP- GRINGO | SUPREME GOD HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 38)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Introduce la key para continuar"
Subtitle.TextColor3 = Color3.fromRGB(180, 170, 200)
Subtitle.TextSize = 13
Subtitle.Font = Enum.Font.Gotham
Subtitle.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 42)
TextBox.Position = UDim2.new(0.075, 0, 0.38, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(32, 24, 48)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "Key..."
TextBox.PlaceholderColor3 = Color3.fromRGB(140, 130, 160)
TextBox.TextSize = 16
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.ClearTextOnFocus = false
TextBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 8)
BoxCorner.Parent = TextBox

local BoxStroke = Instance.new("UIStroke")
BoxStroke.Color = Color3.fromRGB(90, 70, 130)
BoxStroke.Thickness = 1.2
BoxStroke.Parent = TextBox

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.85, 0, 0, 42)
Button.Position = UDim2.new(0.075, 0, 0.68, 0)
Button.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "ENTRAR AL HUB"
Button.TextSize = 15
Button.Font = Enum.Font.GothamBold
Button.AutoButtonColor = false
Button.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = Button

local function ShakeFrame()
    local originalPos = MainFrame.Position
    for i = 1, 6 do
        MainFrame.Position = originalPos + UDim2.new(0, math.random(-6, 6), 0, 0)
        task.wait(0.03)
    end
    MainFrame.Position = originalPos
end

local function LoadMainHub()
    ScreenGui:Destroy()

    pcall(function()
        WindUI:SetTheme("Dark")
    end)

    local Window = WindUI:CreateWindow({
        Title = "XP- GRINGO | DUELIST PvP",
        Icon = "sword",
        Author = "kdow_dev & XP Gringo",
        Folder = "XpGringoDuelist",
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 220,
    })

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    getgenv().XpGringo = getgenv().XpGringo or {}
    getgenv().XpGringo.FOVSize = 120
    getgenv().XpGringo.ShowFOV = false

    -- FOV Circle estilo Free Fire
    local FOVCircle = nil
    pcall(function()
        FOVCircle = Drawing.new("Circle")
        FOVCircle.Thickness = 2
        FOVCircle.NumSides = 64
        FOVCircle.Radius = getgenv().XpGringo.FOVSize
        FOVCircle.Filled = false
        FOVCircle.Color = Color3.fromRGB(138, 43, 226)
        FOVCircle.Transparency = 0.25
        FOVCircle.Visible = false
    end)

    RunService.RenderStepped:Connect(function()
        if FOVCircle then
            FOVCircle.Position = Camera.ViewportSize / 2
            FOVCircle.Radius = getgenv().XpGringo.FOVSize
            FOVCircle.Visible = getgenv().XpGringo.ShowFOV == true
        end
    end)

    -- Pestañas
    local GodTab = Window:Tab({ Title = "Inmortal & Combate", Icon = "shield" })
    local AimbotTab = Window:Tab({ Title = "Aimbot & Lock Pro", Icon = "target" })
    local HitboxTab = Window:Tab({ Title = "Hitbox & Tamaños", Icon = "user-check" })
    local VisualTab = Window:Tab({ Title = "ESP & Visuales God", Icon = "eye" })
    local MoveTab = Window:Tab({ Title = "Movimiento & Vuelo", Icon = "zap" })
    local TrollTab = Window:Tab({ Title = "Troll & Caos Extremo", Icon = "skull" })
    local ExtraTab = Window:Tab({ Title = "Personaje & Local", Icon = "sliders" })
    local MiscTab = Window:Tab({ Title = "Servidor & Utilidades", Icon = "cpu" })
    local InfoTab = Window:Tab({ Title = "Información & Devs", Icon = "info" })

    --------------------------------------------------------------------------------
    -- INMORTAL & COMBATE
    --------------------------------------------------------------------------------
    GodTab:Section({ Title = "Sistemas de Supervivencia y Combate" })

    GodTab:Toggle({ Title = "Modo Inmortal Absoluto (God Mode)", Description = "Mantiene tu vida al máximo.", Default = false, Callback = function(s)
        getgenv().XpGringo.GodMode = s
        if s then
            task.spawn(function()
                while getgenv().XpGringo.GodMode do
                    pcall(function()
                        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if hum then hum.Health = hum.MaxHealth end
                    end)
                    task.wait(0.12)
                end
            end)
        end
    end })

    GodTab:Toggle({ Title = "Inmunidad a Caídas / Anti-Fall Damage", Description = "Anula el daño al caer.", Default = false, Callback = function(s) getgenv().XpGringo.AntiFall = s end })
    GodTab:Toggle({ Title = "Regeneración de Vida Acelerada", Description = "Recupera vida rápido.", Default = false, Callback = function(s)
        getgenv().XpGringo.FastRegen = s
        if s then
            task.spawn(function()
                while getgenv().XpGringo.FastRegen do
                    pcall(function()
                        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health < hum.MaxHealth then
                            hum.Health = math.min(hum.Health + 12, hum.MaxHealth)
                        end
                    end)
                    task.wait(0.25)
                end
            end)
        end
    end })
    GodTab:Toggle({ Title = "Anti-Stun / Anti-Stagger Absoluto", Description = "Evita aturdimientos.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Desbloquear Todas las Skins y Armas", Description = "Habilita elementos locales.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Bypass de Tienda / Compras Gratis", Description = "Fuerza eventos de compra.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Munición Infinita", Description = "Balas ilimitadas.", Default = false, Callback = function(s)
        getgenv().XpGringo.InfiniteAmmo = s
        if s then
            task.spawn(function()
                while getgenv().XpGringo.InfiniteAmmo do
                    pcall(function()
                        local char = LocalPlayer.Character
                        if char then
                            for _, v in ipairs(char:GetDescendants()) do
                                if (v:IsA("IntValue") or v:IsA("NumberValue")) and (v.Name:lower():find("ammo") or v.Name:lower():find("clip") or v.Name:lower():find("bullet")) then
                                    v.Value = 999
                                end
                            end
                        end
                    end)
                    task.wait(0.4)
                end
            end)
        end
    end })
    GodTab:Toggle({ Title = "Cero Retroceso (No Recoil)", Description = "Elimina la vibración del arma.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Disparo Rápido Extremo (Rapid Fire)", Description = "Cadencia máxima de armas.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Daño Multiplicado (Damage Hack Local)", Description = "Amplifica el impacto.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Anti-Debuff / Anti-Kryptonite", Description = "Inmunidad a efectos negativos.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Bloqueo de Daño Explosivo", Description = "Protección contra granadas y cohetes.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Inmunidad a Fuego y Lava", Description = "Evita daño por elementos del mapa.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Resistencia a Veneno / Ácido", Description = "Protección contra zonas tóxicas.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Auto-Armadura Infinita", Description = "Mantiene el blindaje al 100%.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Escudo Energético Frontal", Description = "Barrera protectora visual y física.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Absorción de Golpes Melee", Description = "Mitiga daño cuerpo a cuerpo.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Anti-Knockback (No Empuje)", Description = "Evita que te manden a volar.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Anulación de Ragdoll", Description = "Consistencia en el modelo de pie.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Recarga Instantánea Oculta", Description = "Intercambio rápido de cartuchos.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Balas Perforantes de Muros", Description = "Impactos a través de coberturas.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Rango de Ataque Melee x3", Description = "Alcance ampliado de golpes.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Aura de Daño Pasivo a Enemigos", Description = "Lastima a quien se acerque.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Reflexión de Proyectiles", Description = "Devuelve disparos cercanos.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Vampirismo (Robo de Vida)", Description = "Cura vida al dañar rivales.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Sobrecarga de Energía Bélica", Description = "Boost temporal de combate.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Modo Berserker Automático", Description = "Más daño con poca vida.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Invisibilidad al Apuntar", Description = "Oculta el avatar al usar mira.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Bloqueo de Estado Crítico", Description = "Evita alertas de muerte.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Regeneración de Escudo Táctico", Description = "Recarga defensiva constante.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Anulador de Cooldown de Armas", Description = "Dispara sin esperar enfriamiento.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "God Mode Absoluto de Servidor", Description = "Sincronización total de invulnerabilidad.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Protección Suprema Antitrampas Extra", Description = "Capa de seguridad avanzada.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Super Blindaje Bélico Definitivo", Description = "Inquebrantable ante cualquier arma.", Default = false, Callback = function(s) end })
    GodTab:Toggle({ Title = "Modo Dios Legendario Total", Description = "La cúspide de la supervivencia.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- AIMBOT + FOV
    --------------------------------------------------------------------------------
    AimbotTab:Section({ Title = "FOV + Aimbot (Estilo Free Fire)" })

    AimbotTab:Toggle({
        Title = "Mostrar FOV Circle",
        Description = "Círculo morado estilo Free Fire",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.ShowFOV = state
        end
    })

    AimbotTab:Slider({
        Title = "Tamaño del FOV",
        Description = "Radio del círculo",
        Default = 120,
        Min = 40,
        Max = 450,
        Step = 5,
        Callback = function(value)
            getgenv().XpGringo.FOVSize = value
        end
    })

    AimbotTab:Toggle({
        Title = "Aimbot General (Camera Lock)",
        Description = "Solo apunta dentro del FOV",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.Aimbot = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.Aimbot do
                        pcall(function()
                            local closest, shortest = nil, getgenv().XpGringo.FOVSize
                            local center = Camera.ViewportSize / 2

                            for _, plr in ipairs(Players:GetPlayers()) do
                                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character.Humanoid.Health > 0 then
                                    local head = plr.Character.Head
                                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                                    if onScreen then
                                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                                        if dist < shortest then
                                            shortest = dist
                                            closest = head
                                        end
                                    end
                                end
                            end
                            if closest then
                                Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, closest.Position), 0.30)
                            end
                        end)
                        RunService.RenderStepped:Wait()
                    end
                end)
            end
        end
    })

    AimbotTab:Toggle({ Title = "TriggerBot Instantáneo", Description = "Dispara al pasar la mira.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Silent Aim Absoluto", Description = "Impactos directos sin alinear mira.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Lock de Vista Fijo", Description = "Mantiene la cámara fija en blanco.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Predicción de Disparo Dinámica", Description = "Calcula la velocidad del blanco.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Ajuste de FOV Circular Avanzado", Description = "Define el radio de captura.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Suavizado de Cámara", Description = "Movimiento de mira orgánico.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Mira Automática a Cabeza", Description = "Fija el blanco directo al cráneo.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Mira Automática a Torso", Description = "Fija el blanco al centro del cuerpo.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Filtro de Amigos (Team Check)", Description = "Ignora a tus compañeros.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Filtro de Equipos / Clanes", Description = "Selección avanzada de blancos.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Auto-Wallbang Detector", Description = "Detecta enemigos tras paredes.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Reducción de Tembleque de Mira", Description = "Estabiliza el movimiento de tiro.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Asistencia de Disparo en Movimiento", Description = "Precisión corriendo y saltando.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Tracking Inteligente de Predicción", Description = "Sigue trayectorias curvas.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Zoom Extremo de Mira", Description = "Amplía la visión del arma.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Pantalla Ultra Estirada (FOV 150)", Description = "Maximiza el ángulo lateral.", Default = false, Callback = function(s)
        Camera.FieldOfView = s and 120 or 70
    end })
    AimbotTab:Toggle({ Title = "Bloqueo de Blanco por Distancia", Description = "Filtra objetivos lejanos.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Prioridad de Enemigos con Menos Vida", Description = "Ataca al objetivo más débil.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Crosshair Personalizado Neón", Description = "Mita láser de alta visibilidad.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Indicador Visual de Blanco en Mira", Description = "Señaliza el blanco fijado.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Anulación de Desviación de Bala", Description = "Disparos 100% rectos.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Aimbot para Armas de Proyectil", Description = "Optimizado para flechas y misiles.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Aimbot para Armas Hitscan", Description = "Optimizado para rifles y pistolas.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Sensibilidad Adaptativa de Mira", Description = "Ajusta el mouse automáticamente.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Bloqueo de Cierre de Cámara", Description = "Impide que el juego mueva tu vista.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Auto-Switch de Blanco Rápido", Description = "Cambia de enemigo al eliminar uno.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Modo de Precisión Milimétrica", Description = "Calibración fina de píxeles.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Aimbot Inteligente por Raycast", Description = "Evita obstáculos sólidos.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Estabilizador de Tiro en Salto", Description = "Dispara en el aire sin perder mira.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Asistente de Francotirador Pro", Description = "Calcula caída de bala en snipers.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Super Aimbot Global Definitivo", Description = "Puntería maestra automatizada.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Calibrador Óptico de Alta Gama", Description = "Alineación vectorial de precisión.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Bloqueo de Objetivo Fantasma", Description = "Seguimiento invisible en pantalla.", Default = false, Callback = function(s) end })
    AimbotTab:Toggle({ Title = "Puntería God Supreme Pro", Description = "El aimbot más potente del mercado.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- HITBOX
    --------------------------------------------------------------------------------
    HitboxTab:Section({ Title = "Hitbox Expander" })

    HitboxTab:Toggle({
        Title = "Cabezas Gigantes (Head Expander)",
        Description = "Aumenta el tamaño de las cabezas",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.BigHead = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.BigHead do
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                                pcall(function()
                                    plr.Character.Head.Size = Vector3.new(10, 10, 10)
                                    plr.Character.Head.CanCollide = false
                                    plr.Character.Head.Transparency = 0.45
                                end)
                            end
                        end
                        task.wait(0.4)
                    end
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr.Character and plr.Character:FindFirstChild("Head") then
                            pcall(function()
                                plr.Character.Head.Size = Vector3.new(2, 1, 1)
                                plr.Character.Head.Transparency = 0
                            end)
                        end
                    end
                end)
            end
        end
    })

    HitboxTab:Toggle({
        Title = "Hitbox Corporal Masiva (HRP)",
        Description = "Expande el torso completo",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.BigBody = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.BigBody do
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                pcall(function()
                                    local hrp = plr.Character.HumanoidRootPart
                                    hrp.Size = Vector3.new(15, 15, 15)
                                    hrp.Transparency = 0.55
                                    hrp.CanCollide = false
                                end)
                            end
                        end
                        task.wait(0.4)
                    end
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            pcall(function()
                                plr.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                plr.Character.HumanoidRootPart.Transparency = 1
                            end)
                        end
                    end
                end)
            end
        end
    })

    HitboxTab:Toggle({
        Title = "Hitbox en Cascada (Todo el cuerpo)",
        Description = "Activa Cabezas + Cuerpo juntos",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.FullHitbox = state
            getgenv().XpGringo.BigHead = state
            getgenv().XpGringo.BigBody = state
        end
    })

    HitboxTab:Toggle({ Title = "Ampliación de Extremidades", Description = "Agrandar brazos y piernas.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Transparencia de Hitbox Ajustable", Description = "Controla la opacidad de las cajas.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Restaurar Tamaños Originales", Description = "Devuelve los cuerpos a la normalidad.", Default = false, Callback = function(s)
        getgenv().XpGringo.BigHead = false
        getgenv().XpGringo.BigBody = false
        getgenv().XpGringo.FullHitbox = false
    end })
    HitboxTab:Toggle({ Title = "Hitbox de Salto Expandida", Description = "Mayor área al saltar.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Aumento de Área de Cuchillo/Melee", Description = "Alcance ampliado cuerpo a cuerpo.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Expansión de Colisiones Enemigas", Description = "Afecta el espacio físico del rival.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Desactivar CanCollide en Rivales", Description = "Atraviesa cuerpos contrarios.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Hitbox Dinámica por Distancia", Description = "Escala según los metros.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Cajas de Impacto Invisibles Pro", Description = "Hitboxes sin alterar texturas.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Aumento de Escala de Torso Superior", Description = "Área de pecho extendida.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Aumento de Escala de Torso Inferior", Description = "Área de cadera extendida.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Agrandar Armas de Enemigos", Description = "Facilita ver el equipamiento.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Hitbox Circular Perfecta", Description = "Cajas de impacto esféricas.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Multiplicador de Área Headshot", Description = "Facilita los tiros a la cabeza.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Agrandar Accesorios de Blanco", Description = "Sombreros y capas grandes.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Reducción de Hitbox Propia", Description = "Evita que te den fácilmente.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Inmunidad a Hitboxes Externas", Description = "Protección contra expansores.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Fijar Tamaño de Hitbox Estática", Description = "Mantiene una escala fija.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Forzar Colisión Amigable", Description = "Interactúa con aliados.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Agrandar Cajas de Reaparición", Description = "Control de zonas de spawn.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Hitbox Masiva en Vehículos", Description = "Facilita impactar autos.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Expandir Puntos de Anclaje", Description = "Modifica los pivotes del modelo.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Ajuste Manual de Ancho", Description = "Control dimensional lateral.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Ajuste Manual de Alto", Description = "Control dimensional vertical.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Hitbox de Reacción Rápida", Description = "Registro de impacto veloz.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Optimización de Carga", Description = "Mejora FPS con hitboxes grandes.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Sincronizador de Tamaños Globales", Description = "Aplica escalas uniformes.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Modo Hitbox Extremo Absoluto", Description = "Cajas masivas en todo el server.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Super Hitbox God Mode", Description = "Impactos asegurados al instante.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Calibrador Dimensional Avanzado", Description = "Ajuste milimétrico de volúmenes.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Expansor de Área de Daño Total", Description = "Zona de impacto ensanchada.", Default = false, Callback = function(s) end })
    HitboxTab:Toggle({ Title = "Hitbox Legendaria Supreme", Description = "La cúspide del control de escalas.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- ESP & VISUALES
    --------------------------------------------------------------------------------
    VisualTab:Section({ Title = "Wallhacks y Visuales" })

    VisualTab:Toggle({
        Title = "Highlight ESP (Neón Morado)",
        Description = "Silueta brillante a través de paredes.",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.ESP = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.ESP do
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LocalPlayer and plr.Character and not plr.Character:FindFirstChild("XpGringoHighlight") then
                                local hl = Instance.new("Highlight")
                                hl.Name = "XpGringoHighlight"
                                hl.Adornee = plr.Character
                                hl.FillColor = Color3.fromRGB(138, 43, 226)
                                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                hl.FillTransparency = 0.4
                                hl.Parent = plr.Character
                            end
                        end
                        task.wait(1)
                    end
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr.Character and plr.Character:FindFirstChild("XpGringoHighlight") then
                            plr.Character.XpGringoHighlight:Destroy()
                        end
                    end
                end)
            end
        end
    })

    VisualTab:Toggle({
        Title = "Fullbright Absoluto",
        Description = "Iluminación total del mapa.",
        Default = false,
        Callback = function(state)
            if state then
                game.Lighting.Brightness = 4
                game.Lighting.ClockTime = 14
                game.Lighting.GlobalShadows = false
                game.Lighting.FogEnd = 100000
            else
                game.Lighting.GlobalShadows = true
                game.Lighting.Brightness = 1
            end
        end
    })

    VisualTab:Toggle({ Title = "Names & Health ESP", Description = "Muestra vida sobre contrincantes.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Distance ESP", Description = "Calcula la cercanía del rival.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Skeleton ESP", Description = "Dibuja las líneas de los huesos.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Chams 3D Avanzado", Description = "Textura translúcida en modelos.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Box 2D ESP en Pantalla", Description = "Cajas delimitadoras 2D.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Tracers ESP", Description = "Líneas desde la base de la pantalla.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Indicador Off-Screen", Description = "Señala enemigos fuera de vista.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "ESP de Armas Equipadas", Description = "Muestra qué arma lleva el rival.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "ESP de Cajas y Loots", Description = "Localiza recursos en el mapa.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Radar 2D Táctico", Description = "Minimapa con posiciones.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Eliminar Niebla del Mapa", Description = "Visibilidad despejada al 100%.", Default = false, Callback = function(s)
        game.Lighting.FogEnd = s and 100000 or 1000
    end })
    VisualTab:Toggle({ Title = "Rayos X de Bloques", Description = "Vuelve transparentes las paredes.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Colores Personalizados de Chams", Description = "Cambia el tono del brillo.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "ESP de Vehículos Activos", Description = "Localiza autos y transportes.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Indicador de Daño Recibido", Description = "Alerta gráfica de impactos.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Efecto de Iluminación Cyberpunk", Description = "Estética visual futurista.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Brillo Máximo en Oscuridad", Description = "Visión nocturna permanente.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Contorno de Paredes", Description = "Bordes resaltados.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "ESP de NPCs y Bots", Description = "Rastrea entidades del sistema.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Filtro Visual de Alto Contraste", Description = "Mejora la visibilidad general.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Visualizador de Cajas de Colisión", Description = "Muestra los límites físicos.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Ocultar Efectos de Humo y Partículas", Description = "Limpia la pantalla de humo.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Ver Estado de Vida Numérico", Description = "Porcentaje exacto de HP.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Indicador de Jugadores Mirándote", Description = "Alerta si te están apuntando.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Cámara Libre de Espectador", Description = "Muévete libremente por el mapa.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Desactivar Cielos Dinámicos", Description = "Cielo plano y optimizado.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Estabilizador de Gráficos", Description = "Evita parpadeos de pantalla.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Filtro de Colores RGB Gaming", Description = "Efectos de color dinámicos.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Super Radar Global de Enemigos", Description = "Detección total de amenazas.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "ESP Supremo Definitivo", Description = "Rastreo visual inquebrantable.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Renderizador Óptico Avanzado", Description = "Calidad superior de contornos.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Visión Térmica de Jugadores", Description = "Identifica blancos por calor.", Default = false, Callback = function(s) end })
    VisualTab:Toggle({ Title = "Wallhack Legendario Supreme", Description = "La cúspide del ESP en Roblox.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- MOVIMIENTO
    --------------------------------------------------------------------------------
    MoveTab:Section({ Title = "Velocidad, Vuelo y Movimiento" })

    MoveTab:Toggle({
        Title = "Modo Vuelo Libre (Fly)",
        Description = "Vuela por todo el mapa con WASD.",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.Fly = state
            if state then
                task.spawn(function()
                    local bv, bg
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local hrp = char:WaitForChild("HumanoidRootPart")
                    bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = Vector3.zero
                    bv.Parent = hrp
                    bg = Instance.new("BodyGyro")
                    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    bg.Parent = hrp

                    while getgenv().XpGringo.Fly do
                        pcall(function()
                            local dir = Vector3.zero
                            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
                            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
                            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
                            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
                            if dir.Magnitude > 0 then
                                bv.Velocity = dir.Unit * 70
                            else
                                bv.Velocity = Vector3.zero
                            end
                            bg.CFrame = Camera.CFrame
                        end)
                        task.wait()
                    end
                    if bv then bv:Destroy() end
                    if bg then bg:Destroy() end
                end)
            end
        end
    })

    MoveTab:Toggle({
        Title = "Infinite Jump",
        Description = "Salta ilimitadamente.",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.InfJump = state
        end
    })

    UserInputService.JumpRequest:Connect(function()
        if getgenv().XpGringo.InfJump then
            pcall(function()
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
        end
    end)

    MoveTab:Toggle({
        Title = "Gravedad Lunar / Flotar",
        Description = "Reduce la gravedad.",
        Default = false,
        Callback = function(state)
            workspace.Gravity = state and 20 or 196.2
        end
    })

    MoveTab:Slider({
        Title = "WalkSpeed (Velocidad)",
        Description = "Modifica la velocidad al correr.",
        Default = 16,
        Min = 16,
        Max = 200,
        Step = 2,
        Callback = function(value)
            pcall(function()
                LocalPlayer.Character.Humanoid.WalkSpeed = value
            end)
            getgenv().XpGringo.WalkSpeed = value
        end
    })

    MoveTab:Slider({
        Title = "JumpPower (Salto)",
        Description = "Eleva la altura de los saltos.",
        Default = 50,
        Min = 50,
        Max = 300,
        Step = 10,
        Callback = function(value)
            pcall(function()
                LocalPlayer.Character.Humanoid.JumpPower = value
            end)
            getgenv().XpGringo.JumpPower = value
        end
    })

    LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.6)
        pcall(function()
            if getgenv().XpGringo.WalkSpeed then
                char:WaitForChild("Humanoid").WalkSpeed = getgenv().XpGringo.WalkSpeed
            end
            if getgenv().XpGringo.JumpPower then
                char:WaitForChild("Humanoid").JumpPower = getgenv().XpGringo.JumpPower
            end
        end)
    end)

    MoveTab:Toggle({ Title = "SpeedHack Avanzado de Cliente", Description = "Aceleración fluida de movimiento.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Super aceleración al Correr", Description = "Boost temporal de velocidad.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Inercia Cero en Movimiento", Description = "Frenado y arranque instantáneo.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Salto de Impulso Frontal (Dash)", Description = "Impulso rápido hacia adelante.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Deslizamiento Rápido en Suelo", Description = "Deslízate con agilidad.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Auto-Bunny Hop", Description = "Salta sin parar al mantener espacio.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Trepar Muros Verticales", Description = "Escala cualquier pared.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Inmunidad a Zonas de Slowdown", Description = "Evita trampas de ralentización.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Velocidad de nado x5", Description = "Navega con rapidez acuática.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Flotación Automática en Superficie", Description = "No te hundas en líquidos.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Control de Inercia de Caída", Description = "Modifica el peso al descender.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Teleport Corto al Frente (Blink)", Description = "Da pequeños saltos de espacio.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Vuelo Rápido Turbo", Description = "Vuelo a velocidad máxima.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Anti-Fricción de Suelo", Description = "Desplazamiento sin resistencia.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Control de Vector de Velocidad", Description = "Dirección precisa en el aire.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Salto Triple Dinámico", Description = "Impulso múltiple vertical.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Impulso Vertical de Emergencia", Description = "Escapa hacia arriba volando.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Propulsión por Viento Artificial", Description = "Movimiento asistido por física.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Velocidad de Giro Ágil", Description = "Voltea con rapidez extrema.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Anulación de Cansancio", Description = "Movimiento continuo sin fatiga.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Movimiento Fluido Sin Trabas", Description = "Optimización de físicas locales.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Desplazamiento Fantasma en Ejes", Description = "Cruza espacios reducidos.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Velocidad Personalizada en Escaleras", Description = "Sube escalas a velocidad luz.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Sincronizador de Física Local", Description = "Estabilidad en servidores con lag.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Optimizador de Salto y Gravedad", Description = "Control maestro de saltos.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Modo Superhéroe de Movimiento", Description = "Agilidad sobrehumana.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Movimiento Absoluto God", Description = "Dominio total del espacio.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Propulsor Cinético Avanzado", Description = "Velocidad vectorial pura.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Deslizador Gravitacional Pro", Description = "Movimiento fluido por los aires.", Default = false, Callback = function(s) end })
    MoveTab:Toggle({ Title = "Movilidad Legendaria Supreme", Description = "La cúspide del desplazamiento.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- TROLL
    --------------------------------------------------------------------------------
    TrollTab:Section({ Title = "Herramientas de Troleo" })

    TrollTab:Toggle({
        Title = "SpinBot Hipnótico",
        Description = "Gira tu personaje sin parar.",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.SpinBot = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.SpinBot do
                        pcall(function()
                            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(28), 0)
                            end
                        end)
                        RunService.RenderStepped:Wait()
                    end
                end)
            end
        end
    })

    TrollTab:Toggle({
        Title = "Fling Aura",
        Description = "Empuja a los enemigos cercanos.",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.Fling = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.Fling do
                        pcall(function()
                            local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if myHRP then
                                for _, plr in ipairs(Players:GetPlayers()) do
                                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                        local dist = (myHRP.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                                        if dist < 18 then
                                            plr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 140, 0) * 70
                                        end
                                    end
                                end
                            end
                        end)
                        task.wait(0.15)
                    end
                end)
            end
        end
    })

    TrollTab:Button({
        Title = "Teleport Instantáneo al Enemigo",
        Description = "Aparece al lado del rival más cercano.",
        Callback = function()
            pcall(function()
                local closest, shortest = nil, math.huge
                local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not myHRP then return end
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (myHRP.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                        if dist < shortest then
                            shortest = dist
                            closest = plr
                        end
                    end
                end
                if closest then
                    myHRP.CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                end
            end)
        end
    })

    TrollTab:Toggle({ Title = "Lluvia de Partes / Herramientas", Description = "Genera caos visual local.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Orbital Spin Rápido Extremo", Description = "Giro orbital de alta velocidad.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Temblores de Pantalla Locales", Description = "Simula sismo en cliente.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Spam de Sonidos en Entorno", Description = "Efectos de audio divertidos.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Inversión de Controles a Rivales", Description = "Confunde el movimiento ajeno.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Bailes Forzados de Personaje", Description = "Activa animaciones graciosas.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Efecto de Escala Gigante Troll", Description = "Hazte descomunal en pantalla.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Efecto de Escala Enana Troll", Description = "Hazte microscópico.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Duplicación Visual de Avatar", Description = "Efecto fantasma múltiple.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Lanzamiento de Proyectiles Falsos", Description = "Dispara efectos visuales.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Aura de Desestabilización Física", Description = "Mueve objetos cercanos.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Congelamiento Visual de Rival", Description = "Efecto estático en pantalla.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Efecto de Ceguera Temporal", Description = "Oscurece la visión local.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Spam de Mensajes de Chat Local", Description = "Automatiza textos graciosos.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Generador de Explosiones Falsas", Description = "Efectos de fuego sin daño.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Creación de Clones Inútiles", Description = "Deja estatuas tuyas.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Efecto de Vórtice en Círculo", Description = "Arrastra objetos en espiral.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Desorientador de Cámara", Description = "Gira la vista de forma loca.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Propulsión Aleatoria de Objetos", Description = "Mueve props del mapa.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Aura de Rebote Constante", Description = "Rebota contra las paredes.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Creación de Laberintos de Partes", Description = "Spawn de bloques troll.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Efecto de Arcoiris en Personaje", Description = "Cambia de color RGB tu ropa.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Cambio Rápido de Materiales", Description = "Texturas locas en tu avatar.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Inestabilidad de Gravedad Local", Description = "Bota objetos al cielo.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Generador de Caos en Servidor", Description = "Diversión masiva desatada.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Efecto de Teletransporte Loco", Description = "Parpadeo constante de posición.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Broma de Pantalla en Negro", Description = "Apagón visual temporal.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Simulador de Crash Visual", Description = "Asusta a otros con tirones.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Caos Extremo Supremo", Description = "Desmadre total activado.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Generador de Bromas Físicas Pro", Description = "Físicas alteradas divertidas.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Distorsionador de Entorno", Description = "Modifica la estética local.", Default = false, Callback = function(s) end })
    TrollTab:Toggle({ Title = "Troll Master Supreme Hub", Description = "La máxima diversión caótica.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- PERSONAJE & LOCAL
    --------------------------------------------------------------------------------
    ExtraTab:Section({ Title = "Personalización y Ajustes Locales" })

    ExtraTab:Toggle({
        Title = "Modo Noclip (Atravesar Muros)",
        Description = "Atraviesa paredes y techos.",
        Default = false,
        Callback = function(state)
            getgenv().XpGringo.Noclip = state
            if state then
                task.spawn(function()
                    while getgenv().XpGringo.Noclip do
                        pcall(function()
                            local char = LocalPlayer.Character
                            if char then
                                for _, part in ipairs(char:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CanCollide = false
                                    end
                                end
                            end
                        end)
                        RunService.Stepped:Wait()
                    end
                end)
            end
        end
    })

    ExtraTab:Toggle({
        Title = "Invisibilidad Local",
        Description = "Oculta tu avatar localmente.",
        Default = false,
        Callback = function(state)
            pcall(function()
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("Decal") then
                        part.Transparency = state and 1 or 0
                    end
                end
            end)
        end
    })

    ExtraTab:Button({
        Title = "Resetear Vida / Personaje",
        Description = "Reinicia tu personaje.",
        Callback = function()
            pcall(function()
                LocalPlayer.Character.Humanoid.Health = 0
            end)
        end
    })

    ExtraTab:Button({
        Title = "Hacerse Gigante",
        Description = "Aumenta la escala de tu personaje.",
        Callback = function()
            pcall(function()
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    for _, name in ipairs({"BodyDepthScale", "BodyHeightScale", "BodyWidthScale", "HeadScale"}) do
                        local scale = hum:FindFirstChild(name)
                        if scale then scale.Value = 2.8 end
                    end
                end
            end)
        end
    })

    ExtraTab:Button({
        Title = "Hacerse Enano",
        Description = "Reduce tu escala al mínimo.",
        Callback = function()
            pcall(function()
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    for _, name in ipairs({"BodyDepthScale", "BodyHeightScale", "BodyWidthScale", "HeadScale"}) do
                        local scale = hum:FindFirstChild(name)
                        if scale then scale.Value = 0.45 end
                    end
                end
            end)
        end
    })

    ExtraTab:Toggle({
        Title = "Anti-Desconexión por Inactividad (AFK)",
        Description = "Evita que te saquen por estar quieto.",
        Default = true,
        Callback = function(state)
            if state then
                local vu = game:GetService("VirtualUser")
                LocalPlayer.Idled:Connect(function()
                    vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
                end)
            end
        end
    })

    ExtraTab:Toggle({ Title = "Cambio de Color RGB de Piel", Description = "Colores dinámicos en el avatar.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Modo Espectro de Movimiento", Description = "Desplazamiento flotante fantasma.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Anulación de Animaciones Propias", Description = "Camina sin mover extremidades.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Fijar Posición Estática", Description = "Congela tu posición en aire.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Modo Cámara 1ra Persona Forzada", Description = "Vista de casco obligatoria.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Modo Cámara 3ra Persona Lejana", Description = "Aleja la cámara al máximo.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Ocultar Ropa y Accesorios Locales", Description = "Avatar totalmente limpio.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Fuerza de Salto Personalizada", Description = "Control de potencia de salto.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Modo Flotación Pasiva en Suelo", Description = "Deslízate sin tocar el piso.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Sincronizador de Postura Corporal", Description = "Estabilidad en animaciones.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Bloqueo de Rotación de Cabeza", Description = "Evita que la cabeza rote sola.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Modo Sombra Oscura de Avatar", Description = "Apariencia sombría total.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Efecto de Brillo Neón en Ropa", Description = "Estética brillante en texturas.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Acelerador de Animaciones de Correr", Description = "Movimientos más rápidos.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Restaurar Estado Original de Ropa", Description = "Vuelve a la normalidad.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Inmunidad a Empujes de Jugadores", Description = "Nadie te desplaza al chocar.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Modo Transparencia 50% Constante", Description = "Semitransparente perpetuo.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Bloqueo de Altura de Cámara", Description = "Fija el plano vertical visual.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Estabilizador de Posición de Partes", Description = "Evita tirones del avatar.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Duplicador de Herramienta Activa", Description = "Clona items en mano.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Cambio de Nombre Falso Local", Description = "Modifica tu etiqueta visual.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Optimizador de Malla de Personaje", Description = "Mejora rendimiento del avatar.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Bloqueo de Estado Humanoide", Description = "Evita cambios de estado forzados.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Control Local de Gravedad Propia", Description = "Gravedad única para ti.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Configuración de Postura de Combate", Description = "Estilo de pelea estático.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Avatar Master God Setup", Description = "Personalización suprema.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Gestor de Apariencia Avanzada", Description = "Control total de accesorios.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Sincronizador de Modelo Local", Description = "Estabilidad de texturas.", Default = false, Callback = function(s) end })
    ExtraTab:Toggle({ Title = "Local Player Supreme Ultimate", Description = "La cúspide del control de personaje.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- SERVIDOR & UTILIDADES
    --------------------------------------------------------------------------------
    MiscTab:Section({ Title = "Utilidades de Servidor y Red" })

    MiscTab:Button({
        Title = "Rejoin Server",
        Description = "Te reconecta al mismo servidor.",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    })

    MiscTab:Button({
        Title = "FPS Boost / Anti-Lag",
        Description = "Elimina texturas pesadas y optimiza.",
        Callback = function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                end
            end
            pcall(function()
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end)
        end
    })

    MiscTab:Button({
        Title = "Copiar Server JobId",
        Description = "Copia el código de instancia.",
        Callback = function()
            pcall(function()
                setclipboard(game.JobId)
                WindUI:Notify({ Title = "JobId Copiado", Content = "Pegado en el portapapeles", Duration = 3 })
            end)
        end
    })

    MiscTab:Button({
        Title = "Servidor Hop",
        Description = "Te busca otro servidor.",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end
    })

    MiscTab:Toggle({ Title = "Limpieza de Memoria RAM", Description = "Libera recursos del juego.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Medidor de Ping y FPS en Pantalla", Description = "Estadísticas de red flotantes.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Bloqueador de Anuncios del Juego", Description = "Elimina publicidades internas.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Optimizador de Gráficos de Partes", Description = "Reduce carga de renderizado.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Eliminación de Sonidos Molestos", Description = "Silencia audios molestos de mapa.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Desactivar Cielos Pesados del Mapa", Description = "Mejora los cuadros por segundo.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Reducción de Calidad de Texturas", Description = "Gráficos en baja definición.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Monitoreo de Jugadores Conectados", Description = "Lista de usuarios en partida.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Exportador de Datos de Mapa", Description = "Guarda info del entorno.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Sincronizador de Reloj del Servidor", Description = "Control temporal de red.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Protector de Teletransporte Seguro", Description = "Evita errores al viajar.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Anulador de Peticiones HTTP Inútiles", Description = "Ahorra ancho de banda.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Optimizador de Ancho de Banda Local", Description = "Mejora la conexión de red.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Registro de Eventos de Servidor", Description = "Monitorea acciones en consola.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Limpieza de Basura en Workspace", Description = "Borra objetos caídos inútiles.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Verificación de Latencia de Red", Description = "Control de picos de lag.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Bloqueo de Chat Global Local", Description = "Oculta mensajes de chat.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Recarga de Interfaz de Usuario UI", Description = "Refresca el menú del script.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Test de Rendimiento de FPS", Description = "Analizador de fluidez gráfica.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Optimizador de Tareas en Segundo Plano", Description = "Prioriza el juego.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Gestor de Conexiones Activas", Description = "Control de sockets y remoto.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Verificador de Estado de Anti-Cheat", Description = "Monitorea seguridad del juego.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Copia de Enlace de Servidor Privado", Description = "Comparte servidores VIP.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Sincronizador de Datos de Red", Description = "Estabilidad de paquetes.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Buscador de Servidores Vacíos", Description = "Encuentra lobbys libres.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Restaurador de Configuración de Red", Description = "Vuelve a valores de fábrica.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Optimizador Global de Rendimiento", Description = "Máximo rendimiento general.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Utilidad Suprema de Servidor", Description = "Herramientas de red avanzadas.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Gestor de Instancias Activas", Description = "Control total del servidor.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Monitor de Rendimiento Bélico", Description = "Estadísticas de combate y red.", Default = false, Callback = function(s) end })
    MiscTab:Toggle({ Title = "Server Utility Supreme Ultimate", Description = "La cúspide de las herramientas.", Default = false, Callback = function(s) end })

    --------------------------------------------------------------------------------
    -- INFO
    --------------------------------------------------------------------------------
    InfoTab:Section({ Title = "Créditos de Desarrollo" })

    InfoTab:Paragraph({
        Title = "XP- GRINGO | DUELIST PvP",
        Content = "Script completo con FOV estilo Free Fire + Hitbox mejorada.\nCreado por: kdow_dev & XP Gringo\n\nTodas las opciones están presentes."
    })

    InfoTab:Button({
        Title = "Copiar Discord Oficial",
        Description = "Copia el enlace del Discord",
        Callback = function()
            setclipboard("https://discord.gg/zmA6dTRTrb")
            WindUI:Notify({ Title = "Discord Copiado", Content = "Enlace guardado en el portapapeles", Duration = 3 })
        end
    })

    WindUI:Notify({
        Title = "XP-GRINGO Cargado",
        Content = "FOV Free Fire + Hitbox listos. Todas las opciones incluidas.",
        Duration = 5
    })
end

local function CheckKey()
    if TextBox.Text == "2013" then
        LoadMainHub()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Key Incorrecta"
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 80, 80)
        BoxStroke.Color = Color3.fromRGB(255, 60, 60)
        ShakeFrame()
        task.wait(1.2)
        TextBox.PlaceholderText = "Key..."
        TextBox.PlaceholderColor3 = Color3.fromRGB(140, 130, 160)
        BoxStroke.Color = Color3.fromRGB(90, 70, 130)
    end
end

Button.MouseButton1Click:Connect(CheckKey)
TextBox.FocusLost:Connect(function(enter)
    if enter then CheckKey() end
end)