-- 🔥 HUB BY MAICON_1165 🔥
-- Aba Feminina com Dropdown funcionando

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BRBox (Torre Insano Troll Slap 2)",
    LoadingTitle = "Carregando Hub...",
    LoadingSubtitle = "BRBox System",
    ConfigurationSaving = {
        Enabled = false
    },
    Theme = {
        Background = Color3.fromRGB(0, 255, 255), -- cor de fundo (ciano)
        Topbar = Color3.fromRGB(0, 200, 200),     -- barra superior (ciano mais escuro)
        TextColor = Color3.fromRGB(255, 255, 255), -- texto branco
        ElementBackground = Color3.fromRGB(0, 230, 230), -- botões e caixas
        ElementStroke = Color3.fromRGB(0, 180, 180) -- bordas
    }
})

-- 🚀 Aba de Teleporte
local TeleportTab = Window:CreateTab("🚀 Teleportar", 4483362458)

-- Função de teleporte
local function TeleportPlayer(x, y, z)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(x, y, z)
end

-- 📍 Local 1
TeleportTab:CreateButton({
    Name = "📍 Local 1",
    Callback = function()
        TeleportPlayer(-9.9, -493.0, -7.4)
        Rayfield:Notify({
            Title = "Teleportado ✅",
            Content = "Você foi para o Local 1!",
            Duration = 3
        })
    end
})

-- 📍 Local 2
TeleportTab:CreateButton({
    Name = "📍 Local 2",
    Callback = function()
        TeleportPlayer(-167.5, 131.0, -9.9)
        Rayfield:Notify({
            Title = "Teleportado ✅",
            Content = "Você foi para o Local 2!",
            Duration = 3
        })
    end
})

-- 📍 Local 3
TeleportTab:CreateButton({
    Name = "📍 Local 3",
    Callback = function()
        TeleportPlayer(27.1, -441.0, -65.0)
        Rayfield:Notify({
            Title = "Teleportado ✅",
            Content = "Você foi para o Local 3!",
            Duration = 3
        })
    end
})

-- 🛡️ Aba de Proteção
local ProtecaoTab = Window:CreateTab("🛡️ Proteções", 4483362458)
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Variável de estado
local AntiHitAtivo = false
local conexoes = {}

-- Função para ativar o Anti-Hit
local function AtivarAntiHit()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Impedir dano e empurrões
    humanoid.BreakJointsOnDeath = false

    -- Desativa colisões e impede toque
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            part.Massless = false -- ✅ mantém física normal
            part.Touched:Connect(function() return end)
        end
    end

    -- Bloqueia dano futuro
    conexoes["HealthChange"] = humanoid.HealthChanged:Connect(function()
        if AntiHitAtivo then
            humanoid.Health = humanoid.MaxHealth
        end
    end)

    -- Remove forças de empurrão constantemente (corrigido pulo+impulso)
    conexoes["AntiForce"] = game:GetService("RunService").Stepped:Connect(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            for _, obj in pairs(character.HumanoidRootPart:GetChildren()) do
                if obj:IsA("BodyMover") or obj:IsA("BodyVelocity") or obj:IsA("VectorForce") then
                    obj:Destroy()
                end
            end

            -- ✅ Corrigido: mantém impulso horizontal e pulo natural
            local vel = character.HumanoidRootPart.Velocity
            local move = humanoid.MoveDirection * humanoid.WalkSpeed
            character.HumanoidRootPart.Velocity = Vector3.new(move.X, vel.Y, move.Z)
        end
    end)

    -- Reaplica proteção ao renascer
    conexoes["respawn"] = LocalPlayer.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid").BreakJointsOnDeath = false
        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.CanCollide = false
                p.Massless = false
                p.Touched:Connect(function() return end)
            end
        end
    end)

    Rayfield:Notify({
        Title = "🛡️ Anti-Hit Ativado",
        Content = "Agora você está completamente imune a golpes e empurrões!",
        Duration = 4
    })

    AntiHitAtivo = true
end

-- Função para desativar o Anti-Hit
local function DesativarAntiHit()
    for _, c in pairs(conexoes) do
        c:Disconnect()
    end
    conexoes = {}

    local character = LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Massless = false
            end
        end
    end

    Rayfield:Notify({
        Title = "🚫 Anti-Hit Desativado",
        Content = "Agora você pode ser atingido novamente.",
        Duration = 3
    })

    AntiHitAtivo = false
end

-- Toggle principal
ProtecaoTab:CreateToggle({
    Name = "🛡️ Anti-Hit (Beta)",
    CurrentValue = false,
    Flag = "ANTIHIT_TOGGLE",
    Callback = function(v)
        if v then
            AtivarAntiHit()
        else
            DesativarAntiHit()
        end
    end
})

-- 🧭 Aba de Checkpoint
local CheckpointTab = Window:CreateTab("🧭 Checkpoint", 4483362458)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Variáveis
local AntiQuedaAtivo = false
local UltimaPosicao = nil
local LoopAntiQueda = nil
local elapsed = 0
local lastTeleport = 0
local lastGoodY = 0

-- Função para salvar posição (apenas se realmente estiver no chão)
local function SalvarPosicao()
    local char = LocalPlayer.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")
    if root and humanoid then
        local state = humanoid:GetState()
        -- Só salva quando o jogador estiver claramente no chão
        if state == Enum.HumanoidStateType.Running 
        or state == Enum.HumanoidStateType.Landed then
            UltimaPosicao = root.Position
            lastGoodY = root.Position.Y
        end
    end
end

-- Função para ativar o Anti-Queda
local function AtivarAntiQueda()
    if LoopAntiQueda then LoopAntiQueda:Disconnect() end
    elapsed = 0

    -- Espera o jogador estar estável antes de iniciar
    task.spawn(function()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        repeat task.wait() until humanoid:GetState() == Enum.HumanoidStateType.Running
        SalvarPosicao()
    end)

    -- Loop principal
    LoopAntiQueda = RunService.Heartbeat:Connect(function(dt)
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChild("Humanoid")
        if not root or not humanoid then return end

        elapsed += dt

        -- Salva posição a cada 0.5s (apenas se estiver no chão e não em queda)
        if elapsed >= 0.5 then
            elapsed = 0
            local state = humanoid:GetState()
            if state ~= Enum.HumanoidStateType.Freefall 
            and state ~= Enum.HumanoidStateType.Jumping 
            and state ~= Enum.HumanoidStateType.FallingDown then
                SalvarPosicao()
            end
        end

        -- Se caiu abaixo do chão real (comparando com último Y salvo)
        if root.Position.Y < lastGoodY - 80 then
            if UltimaPosicao and (tick() - lastTeleport) > 1 then
                pcall(function()
                    root.CFrame = CFrame.new(UltimaPosicao + Vector3.new(0, 3, 0))
                    root.Velocity = Vector3.new(0, 0, 0)
                    Rayfield:Notify({
                        Title = "⚡ Anti-Queda Ativado",
                        Content = "Você caiu e foi teleportado de volta ao seu último checkpoint!",
                        Duration = 3
                    })
                end)
                lastTeleport = tick()
            end
        end
    end)

    Rayfield:Notify({
        Title = "🧭 Anti-Queda Ligado",
        Content = "O sistema está ativo e monitorando quedas.",
        Duration = 4
    })

    AntiQuedaAtivo = true
end

-- Função para desativar o Anti-Queda
local function DesativarAntiQueda()
    if LoopAntiQueda then
        LoopAntiQueda:Disconnect()
        LoopAntiQueda = nil
    end

    Rayfield:Notify({
        Title = "🧭 Anti-Queda Desligado",
        Content = "O salvamento automático foi desativado.",
        Duration = 3
    })

    AntiQuedaAtivo = false
end

-- Toggle do Anti-Queda
CheckpointTab:CreateToggle({
    Name = "🧭 Anti-Queda (Beta)",
    CurrentValue = false,
    Flag = "ANTIFALL_TOGGLE",
    Callback = function(v)
        if v then
            AtivarAntiQueda()
        else
            DesativarAntiQueda()
        end
    end
})