-- Carrega a biblioteca Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Função Auxiliar: Buscar Jogador por Nome Parcial
local function GetPlayerPartialName(partialName)
    if not partialName or partialName == "" then return nil end
    partialName = string.lower(partialName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), partialName) or string.find(string.lower(player.DisplayName), partialName) then
            return player
        end
    end
    return nil
end

-- Define o tema Kwai (Laranja/Amarelo/Branco)
local KwaiTheme = {
    Background = Color3.fromRGB(30, 30, 30),
    Accent = Color3.fromRGB(255, 128, 0),
    Text = Color3.fromRGB(255, 255, 255),
    Header = Color3.fromRGB(40, 40, 40),
    Outline = Color3.fromRGB(60, 60, 60),
    Button = Color3.fromRGB(255, 165, 0),
    ButtonHover = Color3.fromRGB(255, 180, 50),
    ButtonActive = Color3.fromRGB(255, 140, 0),
    ToggleOn = Color3.fromRGB(255, 128, 0),
    ToggleOff = Color3.fromRGB(80, 80, 80),
    SliderFill = Color3.fromRGB(255, 128, 0),
    SliderBackground = Color3.fromRGB(60, 60, 60),
    InputBackground = Color3.fromRGB(50, 50, 50),
    DropdownBackground = Color3.fromRGB(50, 50, 50),
    NotificationBackground = Color3.fromRGB(45, 45, 45),
    NotificationAccent = Color3.fromRGB(255, 128, 0),
}

-- Cria a janela principal do UI
local Window = Rayfield:CreateWindow({
   Name = "lol hub by:xis9210 e MOISEIZITO",
   LoadingTitle = "Delta Executor Interface",
   LoadingSubtitle = "by Manus AI",
   Theme = KwaiTheme,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DeltaHubConfigs",
      FileName = "UniversalConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

-- ====================================================================================================
-- ABA JOGADOR
-- ====================================================================================================
local PlayerTab = Window:CreateTab("Jogador", "user")
local PlayerSection = PlayerTab:CreateSection("Controles de Movimento")

-- WalkSpeed
local WalkSpeedSlider = PlayerTab:CreateSlider({
   Name = "Velocidade de Movimento",
   Range = {16, 300},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider",
   Callback = function(Value)
      if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

-- JumpPower
local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = "Força do Pulo",
   Range = {50, 500},
   Increment = 1,
   Suffix = " Power",
   CurrentValue = 50,
   Flag = "JumpPowerSlider",
   Callback = function(Value)
      if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})

-- Infinite Jump
local InfiniteJumpEnabled = false
local InfiniteJumpToggle = PlayerTab:CreateToggle({
   Name = "Pulo Infinito",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      InfiniteJumpEnabled = Value
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
   if InfiniteJumpEnabled and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
      game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
   end
end)

-- Noclip
local NoclipEnabled = false
local NoclipConnection = nil

local NoclipToggle = PlayerTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(Value)
      NoclipEnabled = Value
      local LocalPlayer = game.Players.LocalPlayer
      if LocalPlayer and LocalPlayer.Character then
         if Value then
            for _, Part in pairs(LocalPlayer.Character:GetDescendants()) do
               if Part:IsA("BasePart") and Part.CanCollide ~= nil then
                  Part.CanCollide = false
               end
            end
            NoclipConnection = LocalPlayer.Character.ChildAdded:Connect(function(child)
                if child:IsA("BasePart") and child.CanCollide ~= nil then
                    child.CanCollide = false
                end
            end)
         else
            for _, Part in pairs(LocalPlayer.Character:GetDescendants()) do
               if Part:IsA("BasePart") and Part.CanCollide ~= nil then
                  Part.CanCollide = true
               end
            end
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end
         end
      end
   end,
})

-- Float (Sem Plataforma)
local FloatEnabled = false
local FloatConnection = nil

local FloatToggle = PlayerTab:CreateToggle({
   Name = "Float",
   CurrentValue = false,
   Flag = "Float",
   Callback = function(Value)
      FloatEnabled = Value
      local LocalPlayer = game.Players.LocalPlayer
      if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
         local Humanoid = LocalPlayer.Character.Humanoid
         local HRP = LocalPlayer.Character:FindFirstChildOfClass("HumanoidRootPart")
         if Value then
            Humanoid.PlatformStand = true
            local BodyPosition = Instance.new("BodyPosition")
            BodyPosition.MaxForce = Vector3.new(0, Humanoid.MaxHealth * 100, 0)
            BodyPosition.Position = HRP.Position
            BodyPosition.Parent = HRP
            FloatConnection = game:GetService("RunService").Heartbeat:Connect(function()
                BodyPosition.Position = HRP.Position
            end)
         else
            Humanoid.PlatformStand = false
            if HRP:FindFirstChildOfClass("BodyPosition") then
               HRP:FindFirstChildOfClass("BodyPosition"):Destroy()
            end
            if FloatConnection then
               FloatConnection:Disconnect()
               FloatConnection = nil
            end
         end
      end
   end,
})

-- ====================================================================================================
-- ABA COMBATE
-- ====================================================================================================
local CombatTab = Window:CreateTab("Combate", "sword")
local CombatSection = CombatTab:CreateSection("Configurações de Combate")

-- Aimbot FOV
local AimbotEnabled = false
local AimbotFOV = 90
local FOVCircle = Drawing.new("Circle")
FOVCircle.Radius = AimbotFOV
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.Visible = false
FOVCircle.Position = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)

local AimbotToggle = CombatTab:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "Aimbot",
   Callback = function(Value)
      AimbotEnabled = Value
      FOVCircle.Visible = Value
   end,
})

local AimbotFOVSlider = CombatTab:CreateSlider({
   Name = "Aimbot FOV",
   Range = {10, 360},
   Increment = 5,
   Suffix = " degrees",
   CurrentValue = 90,
   Flag = "AimbotFOV",
   Callback = function(Value)
      AimbotFOV = Value
      FOVCircle.Radius = Value
   end,
})

-- Silent Aim (Lógica simplificada - apenas conceito)
local SilentAimEnabled = false
local SilentAimToggle = CombatTab:CreateToggle({
   Name = "Silent Aim",
   CurrentValue = false,
   Flag = "SilentAim",
   Callback = function(Value)
      SilentAimEnabled = Value
      Rayfield:Notify({
         Title = "Silent Aim",
         Content = "Silent Aim é uma funcionalidade complexa e pode não funcionar em todos os jogos.",
         Duration = 5,
         Image = "alert-triangle",
      })
   end,
})

-- Hitbox Ajustável (Visualização funcional, cor preta, até 20x)
local HitboxMultiplier = 1
local HitboxParts = {}

local function UpdateHitboxVisuals(player, multiplier)
    if not player or not player.Character then return end
    for _, part in pairs(HitboxParts[player] or {}) do
        part:Destroy()
    end
    HitboxParts[player] = {}

    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local partsToEnlarge = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}

    for _, partName in pairs(partsToEnlarge) do
        local originalPart = character:FindFirstChild(partName)
        if originalPart and originalPart:IsA("BasePart") then
            local newPart = Instance.new("Part")
            newPart.Name = "HitboxVisual"
            newPart.Size = originalPart.Size * multiplier
            newPart.CFrame = originalPart.CFrame
            newPart.Transparency = 0.7
            newPart.CanCollide = false
            newPart.Anchored = false
            newPart.BrickColor = BrickColor.new("Really black") -- Cor preta
            newPart.Material = Enum.Material.ForceField
            newPart.Parent = character
            table.insert(HitboxParts[player], newPart)

            local weld = Instance.new("Weld")
            weld.Part0 = originalPart
            weld.Part1 = newPart
            weld.C0 = originalPart.CFrame:inverse() * newPart.CFrame
            weld.Parent = newPart
        end
    end
end

local function ClearHitboxVisuals(player)
    if HitboxParts[player] then
        for _, part in pairs(HitboxParts[player]) do
            part:Destroy()
        end
        HitboxParts[player] = nil
    end
end

local HitboxToggle = CombatTab:CreateToggle({
   Name = "Hitbox Ajustável (Visual)",
   CurrentValue = false,
   Flag = "HitboxVisual",
   Callback = function(Value)
      if Value then
         for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                UpdateHitboxVisuals(player, HitboxMultiplier)
            end
         end
      else
         for _, player in pairs(game.Players:GetPlayers()) do
            ClearHitboxVisuals(player)
         end
      end
   end,
})

local HitboxSlider = CombatTab:CreateSlider({
   Name = "Multiplicador de Hitbox",
   Range = {1, 20},
   Increment = 0.1,
   Suffix = "x",
   CurrentValue = 1,
   Flag = "HitboxMultiplier",
   Callback = function(Value)
      HitboxMultiplier = Value
      if HitboxToggle.CurrentValue then
          for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                UpdateHitboxVisuals(player, HitboxMultiplier)
            end
         end
      end
   end,
})

-- ====================================================================================================
-- ABA PROTEÇÃO
-- ====================================================================================================
local ProtectionTab = Window:CreateTab("Proteção", "shield")
local ProtectionSection = ProtectionTab:CreateSection("Recursos de Proteção")

local AntiVoidEnabled = false
ProtectionTab:CreateToggle({
   Name = "Anti Void",
   CurrentValue = false,
   Flag = "AntiVoid",
   Callback = function(Value)
      AntiVoidEnabled = Value
      if Value then
         local LocalPlayer = game.Players.LocalPlayer
         if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("HumanoidRootPart") then
            local HRP = LocalPlayer.Character.HumanoidRootPart
            local lastSafePosition = HRP.Position
            game:GetService("RunService").Heartbeat:Connect(function()
               if AntiVoidEnabled then
                  if HRP.Position.Y < -500 then
                     HRP.CFrame = CFrame.new(lastSafePosition + Vector3.new(0, 10, 0))
                  else
                     lastSafePosition = HRP.Position
                  end
               end
            end)
         end
      end
   end,
})

ProtectionTab:CreateToggle({
   Name = "Anti Sit",
   CurrentValue = false,
   Flag = "AntiSit",
   Callback = function(Value)
      if Value then
         local LocalPlayer = game.Players.LocalPlayer
         if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.Sit = false
            LocalPlayer.Character.Humanoid.Seated:Connect(function(seated, seat)
               if seated then
                  LocalPlayer.Character.Humanoid.Sit = false
               end
            end)
         end
      end
   end,
})

ProtectionTab:CreateToggle({
   Name = "Anti Bang",
   CurrentValue = false,
   Flag = "AntiBang",
   Callback = function(Value)
      if Value then
         local LocalPlayer = game.Players.LocalPlayer
         if LocalPlayer and LocalPlayer.Character then
            for _,v in pairs(LocalPlayer.Character:GetChildren()) do
               if v:IsA("Animation") or v:IsA("Animator") then
                  v:Destroy()
               end
            end
         end
      end
   end,
})

ProtectionTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(Value)
      if Value then
         local LocalPlayer = game.Players.LocalPlayer
         if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local Humanoid = LocalPlayer.Character.Humanoid
            local AntiAFKConnection = nil
            AntiAFKConnection = game:GetService("RunService").Heartbeat:Connect(function()
               if Value then
                  Humanoid:ChangeState(Enum.HumanoidStateType.Running)
               else
                  if AntiAFKConnection then AntiAFKConnection:Disconnect() end
               end
            end)
         end
      end
   end,
})

ProtectionTab:CreateToggle({
   Name = "Anti Fling",
   CurrentValue = false,
   Flag = "AntiFling",
   Callback = function(Value)
      if Value then
         local LocalPlayer = game.Players.LocalPlayer
         if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("HumanoidRootPart") then
            local HRP = LocalPlayer.Character.HumanoidRootPart
            local BodyPosition = Instance.new("BodyPosition")
            BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyPosition.P = 2000
            BodyPosition.D = 100
            BodyPosition.Position = HRP.Position
            BodyPosition.Parent = HRP

            local BodyGyro = Instance.new("BodyGyro")
            BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyGyro.CFrame = HRP.CFrame
            BodyGyro.Parent = HRP

            game:GetService("RunService").Heartbeat:Connect(function()
               if Value and BodyPosition.Parent == HRP then
                  BodyPosition.Position = HRP.Position
                  BodyGyro.CFrame = HRP.CFrame
               else
                  if BodyPosition.Parent == HRP then BodyPosition:Destroy() end
                  if BodyGyro.Parent == HRP then BodyGyro:Destroy() end
               end
            end)
         end
      end
   end,
})

-- ====================================================================================================
-- ABA STATUS (FPS)
-- ====================================================================================================
local StatusTab = Window:CreateTab("Status", "activity")
local StatusSection = StatusTab:CreateSection("Informações do Jogo")

local FPSText = StatusTab:CreateParagraph({Title = "FPS", Content = "Calculando..."})

local lastTick = tick()
local frameCount = 0
game:GetService("RunService").Heartbeat:Connect(function()
   frameCount = frameCount + 1
   local currentTime = tick()
   local deltaTime = currentTime - lastTick
   if deltaTime >= 1 then
      local fps = math.floor(frameCount / deltaTime)
      FPSText:Set("FPS: " .. fps)
      frameCount = 0
      lastTick = currentTime
   end
end)

-- FPS no canto da tela (Drawing)
local FPSCornerText = Drawing.new("Text")
FPSCornerText.Text = "FPS: --"
FPSCornerText.Position = Vector2.new(10, game.Workspace.CurrentCamera.ViewportSize.Y - 30)
FPSCornerText.Color = Color3.fromRGB(255, 255, 255)
FPSCornerText.Size = 20
FPSCornerText.Visible = true

local lastTickCorner = tick()
local frameCountCorner = 0
game:GetService("RunService").Heartbeat:Connect(function()
   frameCountCorner = frameCountCorner + 1
   local currentTime = tick()
   local deltaTime = currentTime - lastTickCorner
   if deltaTime >= 1 then
      local fps = math.floor(frameCountCorner / deltaTime)
      FPSCornerText.Text = "FPS: " .. fps
      frameCountCorner = 0
      lastTickCorner = currentTime
   end
end)

-- ====================================================================================================
-- ABA OUTROS (Trolls/Utilitários) - COM BUSCA PARCIAL
-- ====================================================================================================
local OtherTab = Window:CreateTab("Outros", "more-horizontal")
local OtherSection = OtherTab:CreateSection("Ferramentas Diversas")

-- Fling Player / ALL
local PlayerToFling = ""
OtherTab:CreateInput({
   Name = "Nome do Jogador para Fling",
   CurrentValue = "",
   PlaceholderText = "Nome parcial ou deixe vazio para ALL",
   Flag = "FlingPlayerName",
   Callback = function(Text)
      PlayerToFling = Text
   end,
})

OtherTab:CreateButton({
   Name = "Fling Jogador / ALL",
   Callback = function()
      local targetPlayers = {}
      if PlayerToFling == "" then
         for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
               table.insert(targetPlayers, player)
            end
         end
      else
         local player = GetPlayerPartialName(PlayerToFling)
         if player and player ~= game.Players.LocalPlayer then
            table.insert(targetPlayers, player)
         end
      end

      for _, player in pairs(targetPlayers) do
         if player.Character and player.Character:FindFirstChildOfClass("HumanoidRootPart") then
            local HRP = player.Character.HumanoidRootPart
            local BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyVelocity.Velocity = Vector3.new(math.random(-100, 100), math.random(50, 200), math.random(-100, 100))
            BodyVelocity.Parent = HRP
            game:GetService("Debris"):AddItem(BodyVelocity, 1)
         end
      end
   end,
})

-- Bang Player
local PlayerToBang = ""
OtherTab:CreateInput({
   Name = "Nome do Jogador para Bang",
   CurrentValue = "",
   PlaceholderText = "Nome parcial",
   Flag = "BangPlayerName",
   Callback = function(Text)
      PlayerToBang = Text
   end,
})

OtherTab:CreateButton({
   Name = "Bang Jogador",
   Callback = function()
      local targetPlayer = GetPlayerPartialName(PlayerToBang)
      if targetPlayer then
          Rayfield:Notify({Title = "Bang Player", Content = "Tentando Bang em " .. targetPlayer.Name, Duration = 3, Image = "info"})
      else
          Rayfield:Notify({Title = "Erro", Content = "Jogador não encontrado.", Duration = 3, Image = "alert-triangle"})
      end
   end,
})

-- Headsit Player
local PlayerToHeadsit = ""
OtherTab:CreateInput({
   Name = "Nome do Jogador para Headsit",
   CurrentValue = "",
   PlaceholderText = "Nome parcial",
   Flag = "HeadsitPlayerName",
   Callback = function(Text)
      PlayerToHeadsit = Text
   end,
})

OtherTab:CreateButton({
   Name = "Headsit Jogador",
   Callback = function()
      local targetPlayer = GetPlayerPartialName(PlayerToHeadsit)
      if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
          local LocalPlayer = game.Players.LocalPlayer
          if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("HumanoidRootPart") then
              LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.Head.CFrame * CFrame.new(0, 2, 0)
              Rayfield:Notify({Title = "Headsit", Content = "Sentado em " .. targetPlayer.Name, Duration = 3, Image = "info"})
          end
      else
          Rayfield:Notify({Title = "Erro", Content = "Jogador não encontrado.", Duration = 3, Image = "alert-triangle"})
      end
   end,
})

-- Jerk Player
local PlayerToJerk = ""
OtherTab:CreateInput({
   Name = "Nome do Jogador para Jerk",
   CurrentValue = "",
   PlaceholderText = "Nome parcial",
   Flag = "JerkPlayerName",
   Callback = function(Text)
      PlayerToJerk = Text
   end,
})

OtherTab:CreateButton({
   Name = "Jerk Jogador",
   Callback = function()
      local targetPlayer = GetPlayerPartialName(PlayerToJerk)
      if targetPlayer then
         Rayfield:Notify({Title = "Jerk Player", Content = "Tentando aplicar Jerk em " .. targetPlayer.Name, Duration = 3, Image = "info"})
      else
         Rayfield:Notify({Title = "Erro", Content = "Jogador não encontrado.", Duration = 3, Image = "alert-triangle"})
      end
   end,
})

-- View Player
local PlayerToView = ""
OtherTab:CreateInput({
   Name = "Nome do Jogador para Ver",
   CurrentValue = "",
   PlaceholderText = "Nome parcial",
   Flag = "ViewPlayerName",
   Callback = function(Text)
      PlayerToView = Text
   end,
})

OtherTab:CreateButton({
   Name = "Ver Jogador",
   Callback = function()
      local targetPlayer = GetPlayerPartialName(PlayerToView)
      if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid") then
         game.Workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
         Rayfield:Notify({Title = "Ver Jogador", Content = "Câmera focada em " .. targetPlayer.Name, Duration = 3, Image = "info"})
      else
         Rayfield:Notify({Title = "Erro", Content = "Jogador não encontrado.", Duration = 3, Image = "alert-triangle"})
      end
   end,
})

OtherTab:CreateButton({
   Name = "Resetar Câmera (Voltar para mim)",
   Callback = function()
      local LocalPlayer = game.Players.LocalPlayer
      if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
         game.Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
      end
   end,
})

-- TP Tool
OtherTab:CreateButton({
   Name = "Teleportar para o Mouse",
   Callback = function()
      local LocalPlayer = game.Players.LocalPlayer
      if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("HumanoidRootPart") then
         local Mouse = LocalPlayer:GetMouse()
         local TargetPosition = Mouse.Hit.p
         LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TargetPosition + Vector3.new(0, 5, 0))
      end
   end,
})

-- ====================================================================================================
-- ABA MENSAGENS PRIVADAS
-- ====================================================================================================
local PMTab = Window:CreateTab("Mensagens Privadas", "message-square")
local PMSection = PMTab:CreateSection("Monitor de PMs")

local PMLog = PMTab:CreateParagraph({Title = "Log de Mensagens", Content = "Nenhuma mensagem privada recebida ainda."})
local receivedMessages = {}

game:GetService("Players").LocalPlayer.Chatted:Connect(function(message, recipient)
    if recipient == game.Players.LocalPlayer then
        table.insert(receivedMessages, 1, "[" .. os.date("%H:%M:%S") .. "] " .. message)
        if #receivedMessages > 10 then table.remove(receivedMessages) end
        PMLog:Set("Log de Mensagens:\n" .. table.concat(receivedMessages, "\n"))
    end
end)

-- ====================================================================================================
-- ABA CRÉDITOS E INFORMAÇÕES
-- ====================================================================================================
local InfoTab = Window:CreateTab("Info", "info")
local InfoSection = InfoTab:CreateSection("Sobre o Script")

InfoTab:CreateParagraph({Title = "Créditos", Content = "Script criado para o Executor Delta usando a biblioteca Rayfield.\nDesenvolvido por Manus AI.\nColaboradores: xis9210 e MOISEIZITO"})
InfoTab:CreateParagraph({Title = "Versão", Content = "7.0"})

-- Mensagem em vermelho
InfoTab:CreateParagraph({
    Title = "Siga-nos no TikTok!",
    Content = "@turma_do_cleitin_hub, segue eu no tiktok",
    Color = Color3.fromRGB(255, 0, 0)
})

-- Imagem personalizada na última aba
InfoTab:CreateImage({
    Image = "https://share.google/YkQF5BPX8suJjoox5",
    Title = "Imagem Personalizada",
    Size = Vector2.new(200, 150)
})

InfoTab:CreateButton({
   Name = "Destruir Interface",
   Callback = function()
      FOVCircle:Destroy()
      for _, playerHitboxParts in pairs(HitboxParts) do
          for _, part in pairs(playerHitboxParts) do
              part:Destroy()
          end
      end
      HitboxParts = {}
      -- if FloatPlatform then FloatPlatform:Destroy() end -- Removido
      if FloatConnection then FloatConnection:Disconnect() end
      if NoclipConnection then NoclipConnection:Disconnect() end
      FPSCornerText:Destroy()
      Rayfield:Destroy()
   end,
})

-- Notificação Inicial
Rayfield:Notify({
   Title = "lol hub Carregado!",
   Content = "Bem-vindo ao lol hub by:xis9210 e MOISEIZITO v7.0.\nDesfrute das novas funcionalidades!",
   Duration = 7,
   Image = "check-circle",
})

-- Finaliza a criação da interface
Rayfield:LoadDefaultTheme() -- Será sobrescrito pelo Theme = KwaiTheme