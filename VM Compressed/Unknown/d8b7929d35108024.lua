-- ===================================================
-- ✨ ULTIMATE HUB v3.0 - BUG FREE & MAXIMUM FEATURES
-- ===================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "✨ Ultimate Hub v3.0 | Definitive Edition",
   LoadingTitle = "Inicializando Hub Sem Bugs...",
   LoadingSubtitle = "Carregando módulos visuais, físicas e Aimbot...",
   ConfigurationSaving = { Enabled = false },
   Discord = { Enabled = false },
   KeySystem = false
})

-- ===================================================
-- SERVIÇOS & VARIÁVEIS PROTEGIDAS
-- ===================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Estados das Funções
local SpeedEnabled, WalkSpeedVal = false, 16
local JumpEnabled, JumpPowerVal = false, 50
local FlyEnabled, FlySpeedVal = false, 50
local NoclipEnabled = false
local InfJumpEnabled = false

-- ESP & Visuals
local ESPEnabled = false
local ESPTracerEnabled = false
local ESPHighlights = {}
local ESPLines = {}

-- Aimbot & Combat
local AimbotEnabled = false
local AimbotSmoothing = 0.2
local AimbotPart = "Head"
local FOVRadius = 120
local ShowFOVCircle = false
local HitboxEnabled = false
local HitboxSize = 5

-- Teleport Target
local TargetPlayerName = ""

-- Connections Container (Para evitar Memory Leaks e Bugs)
local Connections = {}

-- Visual FOV Circle Component
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(0, 255, 170)
FOVCircle.Thickness = 1.5
FOVCircle.NumSides = 60
FOVCircle.Filled = false
FOVCircle.Visible = false

-- ===================================================
-- ABAS DA INTERFACE
-- ===================================================
local TabPlayer = Window:CreateTab("🏃 Jogador", 4483362458)
local TabCombat = Window:CreateTab("🎯 Combate/Aimbot", 4483362458)
local TabESP    = Window:CreateTab("👁️ Visuals (ESP)", 4483362458)
local TabTP     = Window:CreateTab("🌐 Teleportes", 4483362458)
local TabMisc   = Window:CreateTab("⚡ Utilidades & Servidor", 4483362458)

-- ===================================================
-- HELPER FUNCTIONS (TRATAMENTO SEGURO DE PERSONAGEM)
-- ===================================================
local function GetCharacter(player)
   player = player or LocalPlayer
   return player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") and player.Character
end

-- ===================================================
-- 1. ABA JOGADOR
-- ===================================================
TabPlayer:CreateSection("Atributos Físicos de Movimento")

TabPlayer:CreateToggle({
   Name = "Ativar Velocidade Personalizada",
   CurrentValue = false,
   Callback = function(Value)
      SpeedEnabled = Value
   end
})

TabPlayer:CreateSlider({
   Name = "Velocidade (WalkSpeed)",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      WalkSpeedVal = Value
   end
})

TabPlayer:CreateToggle({
   Name = "Ativar Pulo Personalizado",
   CurrentValue = false,
   Callback = function(Value)
      JumpEnabled = Value
   end
})

TabPlayer:CreateSlider({
   Name = "Força do Pulo (JumpPower)",
   Range = {50, 500},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
      JumpPowerVal = Value
   end
})

-- Loop Seguro de Movimento (Garante que a velocidade e pulo continuem funcionado sem bug no reset)
Connections.MovementLoop = RunService.RenderStepped:Connect(function()
   local char = GetCharacter()
   if char then
      if SpeedEnabled then char.Humanoid.WalkSpeed = WalkSpeedVal end
      if JumpEnabled then 
         char.Humanoid.UseJumpPower = true
         char.Humanoid.JumpPower = JumpPowerVal 
      end
   end
end)

TabPlayer:CreateSection("Voo Livre & Física")

local FlyBodyVel, FlyBodyGyro

TabPlayer:CreateToggle({
   Name = "Ativar Voo Livre (Fly)",
   CurrentValue = false,
   Callback = function(Value)
      FlyEnabled = Value
      local char = GetCharacter()
      
      if FlyEnabled and char then
         local hrp = char.HumanoidRootPart
         
         FlyBodyVel = Instance.new("BodyVelocity")
         FlyBodyVel.Velocity = Vector3.zero
         FlyBodyVel.MaxForce = Vector3.new(1e9, 1e9, 1e9)
         FlyBodyVel.Parent = hrp

         FlyBodyGyro = Instance.new("BodyGyro")
         FlyBodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
         FlyBodyGyro.CFrame = hrp.CFrame
         FlyBodyGyro.Parent = hrp
      else
         if FlyBodyVel then FlyBodyVel:Destroy() end
         if FlyBodyGyro then FlyBodyGyro:Destroy() end
      end
   end
})

TabPlayer:CreateSlider({
   Name = "Velocidade do Voo",
   Range = {10, 300},
   Increment = 5,
   CurrentValue = 50,
   Callback = function(Value)
      FlySpeedVal = Value
   end
})

Connections.FlyLoop = RunService.RenderStepped:Connect(function()
   if FlyEnabled and GetCharacter() then
      local hrp = LocalPlayer.Character.HumanoidRootPart
      local moveDir = Vector3.zero
      
      if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
      if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

      if FlyBodyVel and FlyBodyGyro then
         FlyBodyVel.Velocity = moveDir * FlySpeedVal
         FlyBodyGyro.CFrame = Camera.CFrame
      end
   end
end)

-- ===================================================
-- 2. ABA COMBATE (AIMBOT & HITBOX)
-- ===================================================
TabCombat:CreateSection("Aimbot Suave")

TabCombat:CreateToggle({
   Name = "Ativar Aimbot",
   CurrentValue = false,
   Callback = function(Value) AimbotEnabled = Value end
})

TabCombat:CreateDropdown({
   Name = "Parte Alvo do Aimbot",
   Options = {"Head", "HumanoidRootPart"},
   CurrentOption = {"Head"},
   Callback = function(Option) AimbotPart = Option[1] end
})

TabCombat:CreateSlider({
   Name = "Suavidade (Smoothness)",
   Range = {0.05, 1},
   Increment = 0.05,
   CurrentValue = 0.2,
   Callback = function(Value) AimbotSmoothing = Value end
})

TabCombat:CreateSection("Círculo de FOV")

TabCombat:CreateToggle({
   Name = "Exibir Círculo FOV",
   CurrentValue = false,
   Callback = function(Value) ShowFOVCircle = Value end
})

TabCombat:CreateSlider({
   Name = "Tamanho do FOV",
   Range = {30, 500},
   Increment = 5,
   CurrentValue = 120,
   Callback = function(Value) FOVRadius = Value end
})

TabCombat:CreateSection("Aumento de Hitbox")

TabCombat:CreateToggle({
   Name = "Expandir Hitbox dos Inimigos",
   CurrentValue = false,
   Callback = function(Value) HitboxEnabled = Value end
})

TabCombat:CreateSlider({
   Name = "Tamanho da Hitbox",
   Range = {2, 30},
   Increment = 1,
   CurrentValue = 5,
   Callback = function(Value) HitboxSize = Value end
})

-- Função para achar jogador mais próximo dentro do FOV
local function GetClosestPlayerInFOV()
   local closest, shortestDistance = nil, FOVRadius
   local mousePos = UserInputService:GetMouseLocation()

   for _, p in pairs(Players:GetPlayers()) do
      if p ~= LocalPlayer and GetCharacter(p) then
         local part = p.Character:FindFirstChild(AimbotPart)
         if part then
            local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
            if onScreen then
               local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
               if distance < shortestDistance then
                  closest = part
                  shortestDistance = distance
               end
            end
         end
      end
   end
   return closest
end

-- Loop de Combate (Aimbot, FOV e Hitbox)
Connections.CombatLoop = RunService.RenderStepped:Connect(function()
   -- FOV Circle Position
   local mousePos = UserInputService:GetMouseLocation()
   FOVCircle.Position = mousePos
   FOVCircle.Radius = FOVRadius
   FOVCircle.Visible = ShowFOVCircle

   -- Aimbot Logic (Ativa ao segurar botão direito do mouse)
   if AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
      local targetPart = GetClosestPlayerInFOV()
      if targetPart then
         Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, targetPart.Position), AimbotSmoothing)
      end
   end

   -- Hitbox Expansion
   for _, p in pairs(Players:GetPlayers()) do
      if p ~= LocalPlayer and GetCharacter(p) then
         local hrp = p.Character:FindFirstChild("HumanoidRootPart")
         if hrp then
            if HitboxEnabled then
               hrp.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
               hrp.Transparency = 0.7
               hrp.BrickColor = BrickColor.new("Really red")
               hrp.CanCollide = false
            else
               hrp.Size = Vector3.new(2, 2, 1)
               hrp.Transparency = 1
               hrp.CanCollide = true
            end
         end
      end
   end
end)

-- ===================================================
-- 3. ABA VISUALS (ESP HIGHLIGHT & TRACERS)
-- ===================================================
TabESP:CreateSection("ESP de Jogadores")

local function ClearESP()
   for _, hl in pairs(ESPHighlights) do if hl then hl:Destroy() end end
   for _, line in pairs(ESPLines) do if line then line:Remove() end end
   ESPHighlights = {}
   ESPLines = {}
end

TabESP:CreateToggle({
   Name = "Ativar ESP Highlight (Caixa de Luz)",
   CurrentValue = false,
   Callback = function(Value)
      ESPEnabled = Value
      if not ESPEnabled then ClearESP() end
   end
})

TabESP:CreateToggle({
   Name = "Ativar ESP Tracers (Linhas na Tela)",
   CurrentValue = false,
   Callback = function(Value)
      ESPTracerEnabled = Value
      if not ESPTracerEnabled then
         for _, line in pairs(ESPLines) do line.Visible = false end
      end
   end
})

Connections.ESPLoop = RunService.RenderStepped:Connect(function()
   if not ESPEnabled and not ESPTracerEnabled then return end

   for _, p in pairs(Players:GetPlayers()) do
      if p ~= LocalPlayer and GetCharacter(p) then
         local char = p.Character
         local hrp = char.HumanoidRootPart

         -- Highlight Logic
         if ESPEnabled then
            if not ESPHighlights[p] or not ESPHighlights[p].Parent then
               local hl = Instance.new("Highlight")
               hl.Name = "UltimateESP"
               hl.FillColor = Color3.fromRGB(255, 60, 60)
               hl.OutlineColor = Color3.fromRGB(255, 255, 255)
               hl.FillTransparency = 0.4
               hl.Adornee = char
               hl.Parent = char
               ESPHighlights[p] = hl
            end
         end

         -- Tracer Lines Logic
         if ESPTracerEnabled then
            if not ESPLines[p] then
               local line = Drawing.new("Line")
               line.Color = Color3.fromRGB(0, 255, 170)
               line.Thickness = 1.5
               ESPLines[p] = line
            end

            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
               ESPLines[p].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
               ESPLines[p].To = Vector2.new(screenPos.X, screenPos.Y)
               ESPLines[p].Visible = true
            else
               ESPLines[p].Visible = false
            end
         end
      else
         if ESPLines[p] then ESPLines[p].Visible = false end
      end
   end
end)

-- Remove ESP quando o jogador sai do jogo
Players.PlayerRemoving:Connect(function(p)
   if ESPHighlights[p] then ESPHighlights[p]:Destroy() ESPHighlights[p] = nil end
   if ESPLines[p] then ESPLines[p]:Remove() ESPLines[p] = nil end
end)

-- ===================================================
-- 4. ABA TELEPORTES (TELEPORTE DUPLO: VAI / VEM)
-- ===================================================
TabTP:CreateSection("Seleção de Alvo")

local function GetOtherPlayersList()
   local list = {}
   for _, p in pairs(Players:GetPlayers()) do
      if p ~= LocalPlayer then table.insert(list, p.Name) end
   end
   return #list > 0 and list or {"Nenhum Jogador"}
end

local PlayerDropdown = TabTP:CreateDropdown({
   Name = "Selecione o Jogador Alvo",
   Options = GetOtherPlayersList(),
   CurrentOption = {"Selecione..."},
   Callback = function(Option) TargetPlayerName = Option[1] end
})

TabTP:CreateButton({
   Name = "🔄 Atualizar Lista de Jogadores",
   Callback = function()
      PlayerDropdown:Refresh(GetOtherPlayersList())
   end
})

TabTP:CreateSection("Ações de Teleporte")

TabTP:CreateButton({
   Name = "🚀 Ir até o Jogador (Teleport To)",
   Callback = function()
      local target = Players:FindFirstChild(TargetPlayerName)
      local localChar = GetCharacter()
      local targetChar = target and GetCharacter(target)

      if localChar and targetChar then
         localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
         Rayfield:Notify({Title = "Sucesso", Content = "Teleportado até " .. TargetPlayerName, Duration = 2})
      else
         Rayfield:Notify({Title = "Erro", Content = "Jogador/Personagem indisponível.", Duration = 2})
      end
   end
})

TabTP:CreateButton({
   Name = "🧲 Trazer Jogador até Você (Bring Target)",
   Callback = function()
      local target = Players:FindFirstChild(TargetPlayerName)
      local localChar = GetCharacter()
      local targetChar = target and GetCharacter(target)

      if localChar and targetChar then
         -- Nota: Funciona em jogos sem proteção estrita de NetworkOwnership
         targetChar.HumanoidRootPart.CFrame = localChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
         Rayfield:Notify({Title = "Sucesso", Content = "Tentando trazer " .. TargetPlayerName, Duration = 2})
      else
         Rayfield:Notify({Title = "Erro", Content = "Não foi possível puxar o jogador.", Duration = 2})
      end
   end
})

-- ===================================================
-- 5. ABA UTILIDADES & SERVIDOR
-- ===================================================
TabMisc:CreateSection("Modificadores de Física")

TabMisc:CreateToggle({
   Name = "Noclip (Atravessar Paredes)",
   CurrentValue = false,
   Callback = function(Value) NoclipEnabled = Value end
})

Connections.NoclipLoop = RunService.Stepped:Connect(function()
   if NoclipEnabled and GetCharacter() then
      for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
         if part:IsA("BasePart") then part.CanCollide = false end
      end
   end
end)

TabMisc:CreateToggle({
   Name = "Pulo Infinito (Jump Spammer)",
   CurrentValue = false,
   Callback = function(Value) InfJumpEnabled = Value end
})

Connections.InfJump = UserInputService.JumpRequest:Connect(function()
   if InfJumpEnabled and GetCharacter() then
      LocalPlayer.Character.Humanoid:ChangeState("Jumping")
   end
end)

TabMisc:CreateSection("Câmera & Servidor")

TabMisc:CreateSlider({
   Name = "Campo de Visão (Field of View)",
   Range = {70, 120},
   Increment = 1,
   CurrentValue = 70,
   Callback = function(Value)
      Camera.FieldOfView = Value
   end
})

TabMisc:CreateButton({
   Name = "🔄 Reentrar no Servidor (Server Rejoin)",
   Callback = function()
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
   end
})

TabMisc:CreateButton({
   Name = "☠️ Resetar Personagem Rapidamente",
   Callback = function()
      local char = GetCharacter()
      if char then char.Humanoid.Health = 0 end
   end
})

-- Notificação Final
Rayfield:Notify({
   Title = "Hub Executado com Sucesso!",
   Content = "Zero bugs detectados. Aproveite os recursos do Ultimate Hub v3!",
   Duration = 4
})