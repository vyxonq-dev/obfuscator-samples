local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local TweenService = game:GetService("TweenService")

local Window = Rayfield:CreateWindow({
   Name = "Keyboard Bridge Wars - Optimized Ground Loop",
   LoadingTitle = "Script Initializing...",
   LoadingSubtitle = "by Luaroblox_helper",
   ConfigurationSaving = { Enabled = false },
   Discord = { Enabled = false }
})

local MainTab = Window:CreateTab("Automation", 4483362458)
local UtilityTab = Window:CreateTab("Utility & Protection", 4483362458)

-- Variables
local FastLoopEnabled = false
local WalkSpeedValue = 16
local AntiVoidEnabled = false
local NoclipEnabled = false
local SafeYPosition = 10
local FlightSpeed = 300
local CustomWinTripCFrame = nil 
local CustomBlockCFrame = nil 

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to get the target block position (stays grounded)
local function getTargetBlockPosition()
   if CustomBlockCFrame then
      return CustomBlockCFrame
   end
   
   local character = LocalPlayer.Character
   if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
   
   local rootPos = character.HumanoidRootPart.Position
   local nearestBlock = nil
   local shortestDistance = math.huge
   
   for _, obj in ipairs(workspace:GetDescendants()) do
      if obj:IsA("BasePart") and string.find(string.lower(obj.Name), "block") then
         if obj.Position.Y > 0 and obj.Position.Y > (rootPos.Y - 15) then
            local dist = (obj.Position - rootPos).Magnitude
            if dist < shortestDistance then
               shortestDistance = dist
               nearestBlock = obj
            end
         end
      end
   end
   
   if nearestBlock then
      -- Blijf netjes op de grond/vloer bij het blok (geen zweven in de lucht)
      return nearestBlock.CFrame * CFrame.new(0, 3, 0)
   end
   return nil
end

-- Helper function for smooth movement without going into the void
local function smoothTweenTo(targetCFrame)
   local character = LocalPlayer.Character
   if not character or not character:FindFirstChild("HumanoidRootPart") then return end
   local root = character.HumanoidRootPart
   
   -- Voorkom dat het doel in de void ligt
   local safeTargetCFrame = targetCFrame
   if targetCFrame.Position.Y < -5 then
      safeTargetCFrame = CFrame.new(targetCFrame.Position.X, 3, targetCFrame.Position.Z)
   end
   
   local distance = (root.Position - safeTargetCFrame.Position).Magnitude
   local duration = math.clamp(distance / FlightSpeed, 0.01, 1.5)
   
   local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
   local tween = TweenService:Create(root, tweenInfo, {CFrame = safeTargetCFrame})
   
   tween:Play()
   
   local completed = false
   local connection
   connection = tween.Completed:Connect(function()
      completed = true
      if connection then connection:Disconnect() end
   end)
   
   while not completed and FastLoopEnabled do
      task.wait(0.01)
   end
   
   if not FastLoopEnabled then
      tween:Cancel()
      if connection then connection:Disconnect() end
   end
end

-- Section: Location Setters
MainTab:CreateSection("Location Setters")

MainTab:CreateButton({
   Name = "1. Set Current Position as Block Location",
   Callback = function()
      local character = LocalPlayer.Character
      if character and character:FindFirstChild("HumanoidRootPart") then
         CustomBlockCFrame = character.HumanoidRootPart.CFrame
         Rayfield:Notify({
            Title = "Block Location Saved!",
            Content = "Blocks source locked.",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

MainTab:CreateButton({
   Name = "2. Set Current Position as Win Trip (Trofee)",
   Callback = function()
      local character = LocalPlayer.Character
      if character and character:FindFirstChild("HumanoidRootPart") then
         CustomWinTripCFrame = character.HumanoidRootPart.CFrame
         Rayfield:Notify({
            Title = "Win Trip Saved!",
            Content = "Destination locked.",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

-- Section: Optimized Loop
MainTab:CreateSection("Optimized Flight Loop")

MainTab:CreateToggle({
   Name = "Enable Optimized Loop",
   CurrentValue = false,
   Flag = "FastLoopToggle",
   Callback = function(Value)
      FastLoopEnabled = Value
      
      task.spawn(function()
         while FastLoopEnabled do
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
               
               -- Stap 1: Vlieg naar het blok om op te pakken
               local blockTarget = getTargetBlockPosition()
               if blockTarget then
                  smoothTweenTo(blockTarget)
                  task.wait(0.02)
               else
                  task.wait(0.2)
               end
               
               -- Stap 2: Vlieg direct door naar de Win Trip / Trofee locatie
               if FastLoopEnabled and CustomWinTripCFrame then
                  smoothTweenTo(CustomWinTripCFrame)
                  task.wait(0.02)
               end
               
               -- Stap 3: DIRECT terug naar het blok (efficiënte lus: Blok -> Trofee -> Blok)
               -- Geen onnodige reizen naar de void of startlocatie meer!
               
            else
               task.wait(0.2)
            end
            task.wait(0.01)
         end
      end)
   end,
})

MainTab:CreateSlider({
   Name = "Flight Speed",
   Range = {50, 1000},
   Increment = 25,
   Suffix = "studs/s",
   CurrentValue = 300,
   Flag = "FlightSpeedSlider",
   Callback = function(Value)
      FlightSpeed = Value
   end,
})

-- Section: Movement Settings
UtilityTab:CreateSection("Movement Settings")

UtilityTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 200},
   Increment = 1,
   Suffix = "studs/s",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      WalkSpeedValue = Value
      local character = LocalPlayer.Character
      if character and character:FindFirstChildOfClass("Humanoid") then
         character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
      end
   end,
})

LocalPlayer.CharacterAdded:Connect(function(char)
   local humanoid = char:WaitForChild("Humanoid")
   humanoid.WalkSpeed = WalkSpeedValue
end)

-- Section: Protection Tools
UtilityTab:CreateSection("Protection Tools")

RunService.Stepped:Connect(function()
   if NoclipEnabled then
      local character = LocalPlayer.Character
      if character then
         for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
               part.CanCollide = false
            end
         end
      end
   end
end)

UtilityTab:CreateToggle({
   Name = "Enable Noclip",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
      NoclipEnabled = Value
   end,
})

UtilityTab:CreateToggle({
   Name = "Enable Anti-Void",
   CurrentValue = false,
   Flag = "AntiVoidToggle",
   Callback = function(Value)
      AntiVoidEnabled = Value
      
      task.spawn(function()
         while AntiVoidEnabled do
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
               local root = character.HumanoidRootPart
               if root.Position.Y < -20 then
                  root.Velocity = Vector3.new(0, 0, 0)
                  root.CFrame = CFrame.new(root.Position.X, SafeYPosition, root.Position.Z)
               end
            end
            task.wait(0.05)
         end
      end)
   end,
})

Rayfield:Notify({
   Title = "Script Loaded",
   Content = "Optimized Ground Loop Ready!",
   Duration = 5,
   Image = 4483362458,
})
