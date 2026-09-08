local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Devine Hub",
   Icon = 0, 
   LoadingTitle = "Devine Hub Is Loading...",
   LoadingSubtitle = "by DamnedZen",
   Theme = "Default",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false,
})

local MainTab = Window:CreateTab("Home🏠", nil)

-- AUTO FARM SECTION
local FarmSection = MainTab:CreateSection("Auto Farm")

-- Variables for Auto Farm
local AutoFarmEnabled = false
local SelectedTarget = "Chaser" -- Default target

-- Target Selector Dropdown
local Dropdown = MainTab:CreateDropdown({
   Name = "Select Target",
   Options = {"Chaser", "Jumper", "Gunman"}, -- Added "Gunman" here
   CurrentOption = {"Chaser"},
   MultipleOptions = false,
   Flag = "TargetDropdown", 
   Callback = function(Option)
       SelectedTarget = Option[1]
       Rayfield:Notify({
          Title = "Target Changed",
          Content = "Now targeting: " .. SelectedTarget,
          Duration = 2,
       })
   end,
})

-- Auto Farm Toggle
local AutoFarmToggle = MainTab:CreateToggle({
   Name = "Start Auto Farm",
   CurrentValue = false,
   Flag = "AutoFarmFlag",
   Callback = function(Value)
      AutoFarmEnabled = Value
      Rayfield:Notify({
         Title = "Auto Farm",
         Content = AutoFarmEnabled and "Farming: " .. SelectedTarget or "Deactivated",
         Duration = 2,
      })
   end,
})

-- MAIN SETTINGS SECTION
local Section = MainTab:CreateSection("Main")

-- Variables for functionality
local InfJumpEnabled = false
local TargetWalkSpeed = 16
local NoclipEnabled = false

-- Infinite Jump Button
local Button = MainTab:CreateButton({
   Name = "Infinite Jump (Toggle)",
   Callback = function()
       InfJumpEnabled = not InfJumpEnabled
       Rayfield:Notify({
          Title = "Infinite Jump",
          Content = InfJumpEnabled and "Activated" or "Deactivated",
          Duration = 2,
       })
   end,
})

-- WalkSpeed Slider
local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider", 
   Callback = function(Value)
       TargetWalkSpeed = Value
       local character = game.Players.LocalPlayer.Character
       if character and character:FindFirstChild("Humanoid") then
           character.Humanoid.WalkSpeed = Value
       end
   end,
})

-- No Clip Toggle
local NoclipToggle = MainTab:CreateToggle({
   Name = "No Clip",
   CurrentValue = false,
   Flag = "NoclipFlag",
   Callback = function(Value)
      NoclipEnabled = Value
      Rayfield:Notify({
         Title = "No Clip",
         Content = NoclipEnabled and "Activated" or "Deactivated",
         Duration = 2,
      })
   end,
})

-- Teleport Tab
local TeleportTab = Window:CreateTab("Teleport", nil)
local TeleportSection = TeleportTab:CreateSection("Location")

local LobbyButton = TeleportTab:CreateButton({
   Name = "Lobby",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and game.Workspace:FindFirstChild("Lobby") then
           char:PivotTo(game.Workspace.Lobby:GetPivot())
       else
           Rayfield:Notify({Title = "Error", Content = "Lobby part not found in Workspace", Duration = 2})
       end
   end,
})

local ArenaButton = TeleportTab:CreateButton({
   Name = "Arena",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and game.Workspace:FindFirstChild("Arena") then
           char:PivotTo(game.Workspace.Arena:GetPivot())
       else
           Rayfield:Notify({Title = "Error", Content = "Arena part not found in Workspace", Duration = 2})
       end
   end,
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc", nil)
local MiscSection = MiscTab:CreateSection("Server Settings")

-- REJOIN BUTTON
local RejoinButton = MiscTab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
       local ts = game:GetService("TeleportService")
       local p = game:GetService("Players").LocalPlayer
       
       Rayfield:Notify({
          Title = "Rejoining",
          Content = "Attempting to reconnect to this server...",
          Duration = 2,
       })
       
       if #game:GetService("Players"):GetPlayers() <= 1 then
           ts:Teleport(game.PlaceId, p)
       else
           ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
       end
   end,
})

-- LOGIC LOOPS (Running in Background)

-- Unified Auto Farm Logic
task.spawn(function()
    while task.wait(0.1) do
        if AutoFarmEnabled then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    -- Searches for the target selected in the dropdown (now includes Gunman)
                    for _, enemy in pairs(game.Workspace:GetDescendants()) do
                        if enemy.Name == SelectedTarget and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            -- Teleport slightly behind and above target to avoid collision damage
                            char:PivotTo(enemy:GetPivot() * CFrame.new(0, 2, 3))
                            break
                        end
                    end
                end
            end)
        end
    end
end)

-- Logic: Infinite Jump
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJumpEnabled then
        local character = game.Players.LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Logic: No Clip
game:GetService("RunService").Stepped:Connect(function()
    if NoclipEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- Logic: Persistent WalkSpeed
task.spawn(function()
    while task.wait(0.1) do
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.WalkSpeed ~= TargetWalkSpeed then
                humanoid.WalkSpeed = TargetWalkSpeed
            end
        end
    end
end)

Rayfield:Notify({
   Title = "Thanks For Using",
   Content = "Devine Hub",
   Duration = 4,
})
