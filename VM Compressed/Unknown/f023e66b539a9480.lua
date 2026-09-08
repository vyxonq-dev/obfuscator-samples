local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
local Window = Rayfield:CreateWindow({
   Name = "Highest Ever Cart Obby",
   LoadingTitle = "Highest Ever Cart Obby",
   LoadingSubtitle = "by fkdiw",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HighestEverCartObby",
      FileName = "fkdiw hub"
   }
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer
local SpoofHeightEnabled = false
local HeightValue = 0
local InfiniteRebirthEnabled = false
local SpeedEnabled = false
local SpeedValue = 16
local InfiniteJumpEnabled = false
local NoclipEnabled = false
local FlyEnabled = false
local FlySpeed = 60
local BodyGyro, BodyVelocity

local MainTab = Window:CreateTab("Main", 4483362458)
MainTab:CreateSection("Main Features")

MainTab:CreateToggle({
   Name = "Enable Spoof Height",
   CurrentValue = false,
   Callback = function(Value)
      SpoofHeightEnabled = Value
      Rayfield:Notify({Title="Spoof Height", Content=Value and "Enabled" or "Disabled", Duration=2})

      if Value then
         task.spawn(function()
            while SpoofHeightEnabled do
               ReplicatedStorage.Signal.Height:FireServer(HeightValue)
               task.wait()
            end
         end)
      end
   end
})

MainTab:CreateSlider({
   Name = "Height Value",
   Range = {0, 10000},
   Increment = 1,
   CurrentValue = 0,
   Callback = function(Value)
      HeightValue = Value
   end
})

MainTab:CreateToggle({
   Name = "Infinite Rebirth",
   CurrentValue = false,
   Callback = function(Value)
      InfiniteRebirthEnabled = Value
      Rayfield:Notify({Title="Infinite Rebirth", Content=Value and "Enabled" or "Disabled", Duration=2})

      if Value then
         task.spawn(function()
            while InfiniteRebirthEnabled do
               ReplicatedStorage.Signal.Game:FireServer("End")
               task.wait(0.10)
               ReplicatedStorage.Signal.Game:FireServer("Rebirth")
               task.wait(0.10)
            end
         end)
      end
   end
})

MainTab:CreateButton({
   Name = "Teleport to End",
   Callback = function()
      local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
      Char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-105, 5518, -41)
      Rayfield:Notify({Title="Teleport", Content="Teleported to the end!", Duration=2})
   end
})

MainTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Callback = function(Value)
      InfiniteJumpEnabled = Value
      Rayfield:Notify({Title="Infinite Jump", Content=Value and "Enabled" or "Disabled", Duration=2})
   end
})

UserInputService.JumpRequest:Connect(function()
   if InfiniteJumpEnabled then
      local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
      if Humanoid then
         Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
   end
end)

local MoveTab = Window:CreateTab("Movement", 4483362458)
MoveTab:CreateSection("Advanced Movement")

MoveTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(Value)
      NoclipEnabled = Value
      Rayfield:Notify({Title="Noclip", Content=Value and "Enabled" or "Disabled", Duration=2})
   end
})

RunService.Stepped:Connect(function()
   if NoclipEnabled and LocalPlayer.Character then
      for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
         if v:IsA("BasePart") then
            v.CanCollide = false
         end
      end
   end
end)

MoveTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Callback = function(Value)
      FlyEnabled = Value
      local Char = LocalPlayer.Character
      local HRP = Char and Char:FindFirstChild("HumanoidRootPart")

      if Value and HRP then
         BodyGyro = Instance.new("BodyGyro", HRP)
         BodyVelocity = Instance.new("BodyVelocity", HRP)
         BodyGyro.P = 9e4
         BodyGyro.MaxTorque = Vector3.new(9e9,9e9,9e9)
         BodyVelocity.MaxForce = Vector3.new(9e9,9e9,9e9)

         task.spawn(function()
            while FlyEnabled do
               BodyGyro.CFrame = workspace.CurrentCamera.CFrame
               BodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * FlySpeed
               task.wait()
            end
         end)
      else
         if BodyGyro then BodyGyro:Destroy() end
         if BodyVelocity then BodyVelocity:Destroy() end
      end
   end
})

local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateSection("Utilities")

MiscTab:CreateButton({
   Name = "Enable Anti-AFK",
   Callback = function()
      LocalPlayer.Idled:Connect(function()
         VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         task.wait(1)
         VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
      end)
      Rayfield:Notify({Title="Anti-AFK", Content="Anti-AFK Enabled", Duration=3})
   end
})
