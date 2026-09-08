local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Fly GUI - MrFriend",
   LoadingTitle = "MrFriend Fly",
   LoadingSubtitle = "Best Fly Ever",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MrFriendFly",
      FileName = "Config"
   }
})

local Tab = Window:CreateTab("Vuelo", 4483362458)

Tab:CreateLabel("Script by MrFriend")
Tab:CreateLabel("El mejor fly del juego")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local isFlying = false
local flySpeed = 100
local bv, bg, flyConnection

local function startFly()
   local char = player.Character or player.CharacterAdded:Wait()
   local hrp = char:WaitForChild("HumanoidRootPart")

   if bv then bv:Destroy() end
   if bg then bg:Destroy() end

   bv = Instance.new("BodyVelocity")
   bv.MaxForce = Vector3.new(1e4, 1e4, 1e4)
   bv.Velocity = Vector3.new(0,0,0)
   bv.Parent = hrp

   bg = Instance.new("BodyGyro")
   bg.MaxTorque = Vector3.new(1e4, 1e4, 1e4)
   bg.P = 20000
   bg.Parent = hrp

   flyConnection = RunService.Heartbeat:Connect(function()
      if not isFlying then return end
      bg.CFrame = workspace.CurrentCamera.CFrame

      local move = Vector3.new(0,0,0)
      if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + workspace.CurrentCamera.CFrame.LookVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - workspace.CurrentCamera.CFrame.LookVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - workspace.CurrentCamera.CFrame.RightVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + workspace.CurrentCamera.CFrame.RightVector end
      if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
      if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end

      bv.Velocity = move * flySpeed
   end)
end

local function stopFly()
   isFlying = false
   if flyConnection then flyConnection:Disconnect() end
   if bv then bv:Destroy() end
   if bg then bg:Destroy() end
end

Tab:CreateToggle({
   Name = "Activar Fly",
   CurrentValue = false,
   Callback = function(v)
      isFlying = v
      if v then startFly() else stopFly() end
   end
})

Tab:CreateSlider({
   Name = "Velocidad",
   Range = {20, 500},
   Increment = 10,
   CurrentValue = 100,
   Callback = function(v)
      flySpeed = v
   end
})

Tab:CreateParagraph({
   Title = "Controles",
   Content = "W/A/S/D → Moverse\nESPACIO → Subir\nSHIFT → Bajar\n\nBy MrFriend"
})

player.CharacterAdded:Connect(function()
   if isFlying then
      task.wait(0.7)
      startFly()
   end
end)

Rayfield:Notify({
   Title = "MrFriend Fly",
   Content = "Cargado correctamente!",
   Duration = 5
})