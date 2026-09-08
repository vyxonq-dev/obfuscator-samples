-- Farm Script Simples + Anti-Kick por Inatividade
-- Funciona PC e Mobile com Rayfield GUI
-- Persiste após morte e anti-afk enquanto ativo

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Farm",
   LoadingTitle = "Carregando Farm",
   LoadingSubtitle = "Script Simples + Anti-AFK",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FarmConfig",
      FileName = "Farm.json"
   },
   KeySystem = false,
})

local Tab = Window:CreateTab("Main", nil)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

local TargetPos = Vector3.new(197.92, 452.67, 4.38)
local Speed = 180
local Enabled = false
local SpinConnection
local AntiAFKConnection
local CurrentAngle = 0

local function TeleportToPos()
   local character = LocalPlayer.Character
   if not character then return end
   
   local root = character:FindFirstChild("HumanoidRootPart")
   local humanoid = character:FindFirstChild("Humanoid")
   
   if root then
      root.CFrame = CFrame.new(TargetPos)
   end
   
   if humanoid then
      humanoid.WalkSpeed = 0
      humanoid.JumpPower = 0
   end
end

local function StartSpin()
   if SpinConnection then SpinConnection:Disconnect() end
   if AntiAFKConnection then AntiAFKConnection:Disconnect() end
   
   TeleportToPos()
   
   -- Spin principal
   SpinConnection = RunService.Heartbeat:Connect(function(dt)
      CurrentAngle = CurrentAngle + math.rad(Speed * dt)
      
      local character = LocalPlayer.Character
      if not character then
         if SpinConnection then SpinConnection:Disconnect() SpinConnection = nil end
         return
      end
      
      local root = character:FindFirstChild("HumanoidRootPart")
      if root then
         root.CFrame = CFrame.new(TargetPos) * CFrame.Angles(0, CurrentAngle, 0)
      end
   end)
   
   -- Anti-Kick por Inatividade (só enquanto farm ativo)
   AntiAFKConnection = RunService.Heartbeat:Connect(function()
      -- Pequeno movimento virtual para evitar kick
      VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
      wait(0.1)
      VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)
      
      wait(30) -- Repete a cada 30 segundos (seguro e discreto)
   end)
end

local function StopSpin()
   if SpinConnection then
      SpinConnection:Disconnect()
      SpinConnection = nil
   end
   
   if AntiAFKConnection then
      AntiAFKConnection:Disconnect()
      AntiAFKConnection = nil
   end
   
   local character = LocalPlayer.Character
   if character then
      local humanoid = character:FindFirstChild("Humanoid")
      if humanoid then
         humanoid.WalkSpeed = 16
         humanoid.JumpPower = 50
      end
   end
end

local Section = Tab:CreateSection("Controles")

local FarmToggle = Tab:CreateToggle({
   Name = "Farm (Spin + Anti-AFK)",
   CurrentValue = false,
   Flag = "FarmToggle",
   Callback = function(Value)
      Enabled = Value
      if Value then
         StartSpin()
      else
         StopSpin()
      end
   end,
})

local RotSlider = Tab:CreateSlider({
   Name = "Velocidade de Rotação",
   Range = {1, 720},
   Increment = 5,
   Suffix = "°/s",
   CurrentValue = 180,
   Flag = "RotSpeed",
   Callback = function(Value)
      Speed = Value
   end,
})

-- Respawn Handler
local function OnCharacterAdded(character)
   character:WaitForChild("HumanoidRootPart", 10)
   wait(0.5)
   
   if Enabled then
      StartSpin()
   end
end

LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

if LocalPlayer.Character then
   OnCharacterAdded(LocalPlayer.Character)
end

Rayfield:LoadConfiguration()