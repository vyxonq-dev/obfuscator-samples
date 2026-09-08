-- ===============================================================
-- 🛠️ Script By @XkarydsX, @AzizAnzoofficiall and Gemini IA 🛠️
-- 💎 VERSION VIP: RED FX + NINJA + VELOCÍMETRO (CIANO 40%)
-- ===============================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local cam = workspace.CurrentCamera

-- 1. CONFIGURAÇÕES
local walkSpeed = 15 
local sprintSpeed = 22
local maxStamina = 110
local staminaDrainRate = 18
local staminaRegenRate = 30 
local stamina = maxStamina
local sprinting = false
local isExhausted = false
local currentWalkSpeed = walkSpeed
local lastState = ""

-- 2. INTERFACE VIP & EFEITOS DE TELA
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SprintSystemVIP"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Overlay de Cansaço (Tela Vermelha)
local fatigueFrame = Instance.new("Frame", gui)
fatigueFrame.Size = UDim2.new(1, 0, 1, 0)
fatigueFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
fatigueFrame.BackgroundTransparency = 1 -- Começa invisível
fatigueFrame.BorderSizePixel = 0
fatigueFrame.ZIndex = 1

-- Velocímetro VIP
local speedDisplay = Instance.new("TextLabel", gui)
speedDisplay.Size = UDim2.new(0, 200, 0, 50)
speedDisplay.Position = UDim2.new(0.75, 0, 0.1, 0)
speedDisplay.BackgroundTransparency = 1
speedDisplay.Text = "0"
speedDisplay.TextColor3 = Color3.fromRGB(0, 255, 255)
speedDisplay.TextTransparency = 0.6
speedDisplay.TextSize = 55
speedDisplay.Font = Enum.Font.GothamBold
speedDisplay.ZIndex = 999

-- Blur Effect
local blur = Instance.new("BlurEffect", cam)
blur.Size = 0

-- Som de Respiração
local breathSound = Instance.new("Sound", workspace)
breathSound.SoundId = "rbxassetid://6814463121"
breathSound.Volume = 1
breathSound.Looped = true

-- Barra de Stamina
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(0.25, 0, 0.02, 0)
bg.Position = UDim2.new(0.05, 0, 0.9, 0)
bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
bg.BackgroundTransparency = 0.5
bg.ZIndex = 10

local fill = Instance.new("Frame", bg)
fill.Size = UDim2.new(1, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fill.BorderSizePixel = 0

-- Botão de Correr
local btn = Instance.new("ImageButton", gui)
btn.Size = UDim2.new(0, 75, 0, 75)
btn.BackgroundTransparency = 1
btn.Image = "rbxassetid://89190879948216"

-- 3. MOTOR DE ANIMAÇÃO
local function aplicarAnims(estado)
    getgenv().EnableHybridCustom = true
    if estado == "Fast" then
        getgenv().HybridSettings = {
            run = "Ninja", walk = "Ninja", jump = "Ninja", fall = "Ninja",
            idle1 = "Adidas", idle2 = "Mage", climb = "Ninja", swim = "Ninja", swimidle = "Ninja"
        }
    else
        getgenv().HybridSettings = {
            run = "Mage", walk = "Mage", jump = "Toy", fall = "Ninja",
            idle1 = "Adidas", idle2 = "Mage", climb = "Toy", swim = "Catwalk", swimidle = "Bubbly"
        }
    end
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/Animation/refs/heads/main/Animation%20Changer%20v3%20Stable"))()()
        end)
    end)
end

btn.MouseButton1Down:Connect(function()
    if stamina > 5 and not isExhausted then sprinting = true; btn.Image = "rbxassetid://96892467644525" end
end)
btn.MouseButton1Up:Connect(function() sprinting = false; btn.Image = "rbxassetid://89190879948216" end)

-- 4. LOOP PRINCIPAL
RunService.RenderStepped:Connect(function(dt)
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not hum or not root then return end

    local isMoving = hum.MoveDirection.Magnitude > 0.1
    local targetSpeed = (sprinting and isMoving and not isExhausted) and sprintSpeed or walkSpeed
    currentWalkSpeed = currentWalkSpeed + (targetSpeed - currentWalkSpeed) * 0.18
    hum.WalkSpeed = currentWalkSpeed
    
    -- Velocímetro
    speedDisplay.Text = tostring(math.floor(root.Velocity.Magnitude))

    -- Troca Ninja/Mage
    if currentWalkSpeed >= 18 then
        if lastState ~= "Fast" then lastState = "Fast"; aplicarAnims("Fast") end
    else
        if lastState ~= "Slow" then lastState = "Slow"; aplicarAnims("Slow") end
    end

    -- Stamina
    if sprinting and isMoving then
        stamina = math.max(0, stamina - staminaDrainRate * dt)
    else
        stamina = math.min(maxStamina, stamina + (isExhausted and staminaRegenRate*0.4 or staminaRegenRate) * dt)
    end
    fill.Size = UDim2.new(stamina / maxStamina, 0, 1, 0)
    
    -- EFEITOS DE EXAUSTÃO (CORREÇÃO DA TELA)
    if stamina <= 0 and not isExhausted then
        isExhausted = true
        sprinting = false
        breathSound:Play()
        -- Ativa Blur e Tela Vermelha
        TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()
        TweenService:Create(fatigueFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.8}):Play()
    elseif isExhausted and stamina >= maxStamina * 0.5 then
        isExhausted = false
        breathSound:Stop()
        -- Desativa Blur e Tela Vermelha
        TweenService:Create(blur, TweenInfo.new(1), {Size = 0}):Play()
        TweenService:Create(fatigueFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    end

    -- Auto-Fade Barra
    bg.BackgroundTransparency = (stamina >= maxStamina) and 1 or 0.5
    fill.BackgroundTransparency = bg.BackgroundTransparency

    -- Mobile Position
    local touch = player.PlayerGui:FindFirstChild("TouchGui")
    if touch then
        local jmp = touch:FindFirstChild("JumpButton", true)
        if jmp then btn.Position = UDim2.new(0, jmp.AbsolutePosition.X + jmp.AbsoluteSize.X/2, 0, jmp.AbsolutePosition.Y - 75) end
    end
end)
