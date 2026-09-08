local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌊 Wave Hub Universal 🌊",
   Icon = 0, 
   LoadingTitle = "🌊 Wave Hub Is Loading...",
   LoadingSubtitle = "by Wave Hub",
   Theme = "Default",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "WaveHubData",
      FileName = "WaveHub"
   },

   KeySystem = false, 
})

-- TABS
local MainTab = Window:CreateTab("👣 Movement", nil)
local FunTab = Window:CreateTab("🎊 Fun", nil)
local MiscTab = Window:CreateTab("📦 Misc", nil)

-- MOVEMENT SECTION
local MainSection = MainTab:CreateSection("Character Tweaks")

MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WS_Slider", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 500},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JP_Slider", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local InfiniteJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
	if InfiniteJumpEnabled then
		local Character = game.Players.LocalPlayer.Character
		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			if Humanoid then
				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end
end)

MainTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      InfiniteJumpEnabled = Value
   end,
})

-- FLY SYSTEM (WASD CONTROLLED)
local Flying = false
local FlySpeed = 50
local BodyVelocity, BodyGyro
local UIS = game:GetService("UserInputService")

local function ToggleFly(state)
    local lp = game.Players.LocalPlayer
    local Character = lp.Character or lp.CharacterAdded:Wait()
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    if state then
        BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        BodyVelocity.Parent = RootPart

        BodyGyro = Instance.new("BodyGyro")
        BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        BodyGyro.CFrame = RootPart.CFrame
        BodyGyro.Parent = RootPart

        task.spawn(function()
            while Flying do
                local Camera = workspace.CurrentCamera
                local Direction = Vector3.new(0, 0, 0)

                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    Direction = Direction + Camera.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.S) then
                    Direction = Direction - Camera.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.A) then
                    Direction = Direction - Camera.CFrame.RightVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.D) then
                    Direction = Direction + Camera.CFrame.RightVector
                end

                if Direction.Magnitude > 0 then
                    BodyVelocity.Velocity = Direction.Unit * FlySpeed
                else
                    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
                
                BodyGyro.CFrame = Camera.CFrame
                task.wait()
            end
        end)
    else
        if BodyVelocity then BodyVelocity:Destroy() end
        if BodyGyro then BodyGyro:Destroy() end
    end
end

MainTab:CreateToggle({
   Name = "Enable Fly",
   CurrentValue = false,
   Flag = "FlyToggle",
   Callback = function(Value)
      Flying = Value
      ToggleFly(Value)
   end,
})

MainTab:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 50,
   Flag = "FlySpeed",
   Callback = function(Value)
      FlySpeed = Value
   end,
})

-- FUN SECTION
local FunSection = FunTab:CreateSection("Fun🎊")

local Noclip = false
game:GetService("RunService").Stepped:Connect(function()
    if Noclip then
        local lp = game.Players.LocalPlayer
        if lp.Character then
            for _, part in pairs(lp.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

FunTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
      Noclip = Value
   end,
})

FunTab:CreateButton({
   Name = "Self Fling (100 Speed)",
   Callback = function()
      local lp = game.Players.LocalPlayer
      local Character = lp.Character
      local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
      
      if RootPart then
         local Velocity = Instance.new("BodyVelocity")
         Velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
         Velocity.Velocity = (RootPart.CFrame.LookVector * 100) + Vector3.new(0, 50, 0)
         Velocity.Parent = RootPart
         
         task.wait(0.15)
         Velocity:Destroy()
      end
   end,
})

FunTab:CreateToggle({
   Name = "Low Gravity",
   CurrentValue = false,
   Flag = "LowGrav",
   Callback = function(Value)
      if Value then
         workspace.Gravity = 50
      else
         workspace.Gravity = 196.2
      end
   end,
})

FunTab:CreateButton({
   Name = "Force Sit",
   Callback = function()
      local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
      if Humanoid then
         Humanoid.Sit = true
      end
   end,
})

-- MISC SECTION
local MiscSection = MiscTab:CreateSection("Utilities")

MiscTab:CreateSlider({
   Name = "Field of View (FOV)",
   Range = {30, 120},
   Increment = 1,
   Suffix = "FOV",
   CurrentValue = 70,
   Flag = "FOV_Slider",
   Callback = function(Value)
      workspace.CurrentCamera.FieldOfView = Value
   end,
})

-- FIXED REJOIN BUTTON
MiscTab:CreateButton({
   Name = "Rejoin Same Server",
   Callback = function()
      local ts = game:GetService("TeleportService")
      local p = game.Players.LocalPlayer
      
      -- TeleportToPlaceInstance ensures you join the specific JobId of this server
      ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
   end,
})

Rayfield:Notify({
   Title = "Script Executed",
   Content = "Wave Hub is ready for 2025!",
   Duration = 5,
   Image = 4483362458,
})
