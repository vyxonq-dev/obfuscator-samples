local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local debugX = false
local currentTarget = nil
local horizontalPrediction = 0
local verticalPrediction = 0
local smoothness = 0.1

-- ESP setup
local espSettings = {
   Color = Color3.fromRGB(255, 0, 0),
   Boxes = false,
   Tracers = false,
   Dots = false,
   Healthbars = false
}
local espObjects = {}

-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Zai's Custom UI",
   Icon = 0,
   LoadingTitle = "Loading ZaiHub",
   LoadingSubtitle = "by ZaibladiX",
   Theme = "Default",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Zhub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Enter key",
      Subtitle = "Key System",
      Note = "Key is ZaibladiX",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ZaibladiX"}
   }
})

-- 🟢 AIM ASSIST TAB
local AimAssistTab = Window:CreateTab("Aim Assist", 1234567890)

local AimToggle = AimAssistTab:CreateToggle({
   Name = "Enable Aim Assist (Press C to toggle)",
   CurrentValue = false,
   Flag = "AimAssist",
   Callback = function(Value)
      debugX = Value
      if not Value then
         currentTarget = nil
      end
   end,
})

AimAssistTab:CreateSlider({
   Name = "Horizontal Prediction",
   Range = {0, 50},
   Increment = 0.5,
   Suffix = "H Pred",
   CurrentValue = 0,
   Callback = function(Value)
      horizontalPrediction = Value
   end,
})

AimAssistTab:CreateSlider({
   Name = "Vertical Prediction",
   Range = {-10, 10},
   Increment = 0.1,
   Suffix = "V Pred",
   CurrentValue = 0,
   Callback = function(Value)
      verticalPrediction = Value
   end,
})

AimAssistTab:CreateSlider({
   Name = "Smoothness",
   Range = {0.01, 1},
   Increment = 0.01,
   Suffix = "",
   CurrentValue = 0.1,
   Callback = function(Value)
      smoothness = Value
   end,
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
   if not gameProcessed and input.KeyCode == Enum.KeyCode.C then
      debugX = not debugX
      AimToggle:Set(debugX)
      if not debugX then
         currentTarget = nil
      end
   end
end)

-- 🔴 ESP TAB
local ESPTab = Window:CreateTab("ESP", 1234567890)

ESPTab:CreateColorPicker({
   Name = "ESP Color",
   Color = espSettings.Color,
   Flag = "ESPColor",
   Callback = function(Value)
      espSettings.Color = Value
   end
})

ESPTab:CreateToggle({
   Name = "Boxes",
   CurrentValue = false,
   Flag = "Boxes",
   Callback = function(Value)
      espSettings.Boxes = Value
   end,
})

ESPTab:CreateToggle({
   Name = "Tracers",
   CurrentValue = false,
   Flag = "Tracers",
   Callback = function(Value)
      espSettings.Tracers = Value
   end,
})

ESPTab:CreateToggle({
   Name = "Dots",
   CurrentValue = false,
   Flag = "Dots",
   Callback = function(Value)
      espSettings.Dots = Value
   end,
})

ESPTab:CreateToggle({
   Name = "Healthbars",
   CurrentValue = false,
   Flag = "Healthbars",
   Callback = function(Value)
      espSettings.Healthbars = Value
   end,
})

-- 🟡 SPEED TAB
local SpeedTab = Window:CreateTab("Speed", 1234567890)

SpeedTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 150},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Callback = function(Value)
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

-- 🔁 MAIN LOOP (ESP + LOCK)
RunService.RenderStepped:Connect(function()
   -- ESP
   for _, drawing in pairs(espObjects) do
      for _, obj in pairs(drawing) do
         obj.Visible = false
      end
   end

   for _, player in ipairs(Players:GetPlayers()) do
      if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local char = player.Character
         local hrp = char.HumanoidRootPart
         local head = char:FindFirstChild("Head")
         local hum = char:FindFirstChild("Humanoid")

         if not espObjects[player] then
            espObjects[player] = {
               Box = Drawing.new("Square"),
               Tracer = Drawing.new("Line"),
               Dot = Drawing.new("Circle"),
               Healthbar = Drawing.new("Line")
            }
            espObjects[player].Box.Thickness = 1
            espObjects[player].Box.Filled = false
            espObjects[player].Dot.Radius = 4
            espObjects[player].Dot.Filled = true
            espObjects[player].Healthbar.Thickness = 2
         end

         local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)

         if onScreen then
            local sizeY = math.clamp(3000 / (hrp.Position - workspace.CurrentCamera.CFrame.Position).Magnitude, 2, 300)
            local sizeX = sizeY / 2

            if espSettings.Boxes then
               local box = espObjects[player].Box
               box.Size = Vector2.new(sizeX, sizeY)
               box.Position = Vector2.new(screenPos.X - sizeX/2, screenPos.Y - sizeY/2)
               box.Color = espSettings.Color
               box.Visible = true
            end

            if espSettings.Tracers then
               local tracer = espObjects[player].Tracer
               tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
               tracer.To = Vector2.new(screenPos.X, screenPos.Y)
               tracer.Color = espSettings.Color
               tracer.Visible = true
            end

            if espSettings.Dots then
               local dot = espObjects[player].Dot
               dot.Position = Vector2.new(screenPos.X, screenPos.Y)
               dot.Color = espSettings.Color
               dot.Visible = true
            end

            if espSettings.Healthbars and hum then
               local hp = hum.Health / hum.MaxHealth
               local bar = espObjects[player].Healthbar
               bar.From = Vector2.new(screenPos.X - sizeX / 2 - 4, screenPos.Y + sizeY / 2)
               bar.To = Vector2.new(screenPos.X - sizeX / 2 - 4, screenPos.Y + sizeY / 2 - sizeY * hp)
               bar.Color = Color3.fromRGB(0, 255, 0)
               bar.Visible = true
            end
         end
      end
   end

   -- LOCK
   if debugX then
      if not currentTarget or not currentTarget:IsDescendantOf(workspace) then
         local shortest = math.huge
         for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
               local part = player.Character.HumanoidRootPart
               local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
               if onScreen then
                  local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                  if dist < shortest then
                     shortest = dist
                     currentTarget = part
                  end
               end
            end
         end
      end

      if currentTarget and currentTarget.Parent then
         local velocity = currentTarget.Velocity
         local predictedPos = currentTarget.Position + Vector3.new(
            velocity.X * horizontalPrediction / 100,
            velocity.Y * verticalPrediction / 100,
            velocity.Z * horizontalPrediction / 100
         )
         local cam = workspace.CurrentCamera
         local currentCFrame = cam.CFrame
         local targetCFrame = CFrame.new(cam.CFrame.Position, predictedPos)
         cam.CFrame = currentCFrame:Lerp(targetCFrame, smoothness)
      end
   end
end)
