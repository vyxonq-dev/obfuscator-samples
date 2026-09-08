-- MistHub for Hunted - Built with Rayfield Interface Suite
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Manual Save Function for Key Bypass
local function SaveManualKey()
    writefile("MistHubConfig/ManualKey.txt", "MistHub2026")
    print("Manual key saved to MistHubConfig/ManualKey.txt")
end

-- Startup Check for Manual Key File
local KeySystemEnabled = true -- Default to true (show key screen)
if isfile("MistHubConfig/ManualKey.txt") then
    local savedKey = readfile("MistHubConfig/ManualKey.txt")
    if savedKey == "MistHub2026" then
        KeySystemEnabled = false -- Bypass key system if correct key is saved
        print("Manual key found and validated. Bypassing key system.")
    else
        KeySystemEnabled = true -- Keep key system active if saved key is incorrect
        print("Manual key file exists but invalid. Key system active.")
    end
else
    KeySystemEnabled = true -- Keep key system active if no file exists
    print("No manual key file found. Key system active.")
end

-- Creating a Window with MistHub branding (Updated ConfigurationSaving to disable auto-save)
local Window = Rayfield:CreateWindow({
   Name = "MistHub",
   Icon = 0,
   LoadingTitle = "Hunted Script",
   LoadingSubtitle = "By mist",
   ShowText = "MistHub",
   Theme = "AmberGlow",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false, -- Disabled to prevent auto-saving/loading of toggle states from previous sessions
      FolderName = "MistHubConfig",
      FileName = "HuntedScript"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = KeySystemEnabled, -- Set dynamically based on manual key file check
   KeySettings = {
      Title = "MistHub Key System",
      Subtitle = "Key Required",
      Note = "Enjoy hacking",
      FileName = "MistHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"MistHub2026"}
   }
})

-- Creating a Tab for Main Cheats
local Tab = Window:CreateTab("Main Cheats", 4483362458)
local Section = Tab:CreateSection("Hunted Cheats")

-- New Tab: Placeholder for "Others"
local AITab = Window:CreateTab("Others", 4483362458)

-- New Tab: "Save Key" for Manual Key Save Button
local SaveKeyTab = Window:CreateTab("Save Key", 4483362458)

-- New Tab: "Trolls" for Troll Features
local TrollTab = Window:CreateTab("Trolls", 4483362458)

-- Manual Key Save Button (Moved to "Save Key" Tab)
local ManualKeySaveButton = SaveKeyTab:CreateButton({
   Name = "Save Key Manually (Bypass Future Prompts)",
   Callback = function()
      SaveManualKey()
      Rayfield:Notify({
         Title = "Key Saved",
         Content = "Manual key saved. Restart the script to bypass key prompt.",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})

-- ESP Feature (Using Highlight for Other Players Only, Visible Through Walls)
local espObjects = {}
local ESP_Enabled = false
local AutoRefreshThread = nil

local function CreateESP(entity, isPlayer)
   if (isPlayer and entity == game.Players.LocalPlayer) or not entity or not entity.Parent then return false end
   
   local rootPart = entity:FindFirstChild("HumanoidRootPart") or entity:FindFirstChildWhichIsA("BasePart")
   local humanoid = entity:FindFirstChild("Humanoid") or entity:FindFirstChildWhichIsA("Humanoid")
   if not rootPart or not humanoid then return false end
   
   local highlight = Instance.new("Highlight")
   highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red highlight
   highlight.OutlineColor = Color3.fromRGB(255, 0, 0) -- Red outline
   highlight.FillTransparency = 0.5 -- Semi-transparent fill
   highlight.OutlineTransparency = 0 -- Solid outline
   highlight.Adornee = entity -- Apply to the entire character model
   highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- Ensure visibility through walls
   highlight.Parent = game.CoreGui -- Place in CoreGui for rendering
   
   espObjects[entity] = {highlight = highlight}
   return true
end

local function UpdateESP()
   for entity, obj in pairs(espObjects) do
      if entity and entity.Parent and (entity:FindFirstChild("HumanoidRootPart") or entity:FindFirstChildWhichIsA("BasePart")) and (entity:FindFirstChild("Humanoid") or entity:FindFirstChildWhichIsA("Humanoid")) then
         local humanoid = entity:FindFirstChild("Humanoid") or entity:FindFirstChildWhichIsA("Humanoid")
         if humanoid and humanoid.Health > 0 then
            obj.highlight.Enabled = true
         else
            obj.highlight.Enabled = false
         end
      else
         obj.highlight.Enabled = false
      end
   end
end

local function ScanWorkspaceForAI()
   local aiCount = 0
   for _, entity in ipairs(workspace:GetDescendants()) do
      if not game.Players:GetPlayerFromCharacter(entity) and (entity:FindFirstChild("Humanoid") or entity:FindFirstChildWhichIsA("Humanoid")) and (entity:FindFirstChild("HumanoidRootPart") or entity:FindFirstChildWhichIsA("BasePart")) and not espObjects[entity] then
         if CreateESP(entity, false) then
            aiCount = aiCount + 1
         end
      end
   end
   return aiCount
end

-- Auto-Refresh Mechanism for ESP
local function AutoRefreshESP()
    while ESP_Enabled do
        -- Scan for players and AI not yet highlighted
        local playerCount = 0
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and not espObjects[player.Character] then
                if CreateESP(player.Character, true) then
                    playerCount = playerCount + 1
                end
            end
        end
        local aiCount = ScanWorkspaceForAI()
        if playerCount > 0 or aiCount > 0 then
            print("Auto-Refresh: Added " .. playerCount .. " new players and " .. aiCount .. " new AI with ESP highlights.")
        end
        wait(10) -- Refresh every 10 seconds
    end
end

local ESPToggle = Tab:CreateToggle({
   Name = "ESP (Red Highlights)",
   CurrentValue = false, -- Starts OFF, no auto-toggle
   Flag = "ESPToggle",
   Callback = function(Value)
      ESP_Enabled = Value
      print("ESP Toggle: " .. tostring(Value))
      if Value then
         print("Scanning for other players and AI...")
         -- Other players only (exclude local player)
         local playerCount = 0
         for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and CreateESP(player.Character, true) then
               playerCount = playerCount + 1
            end
         end
         print("Added ESP for " .. playerCount .. " other players.")
         -- AI in workspace
         local aiCount = ScanWorkspaceForAI()
         print("AI scan complete. Added ESP for " .. aiCount .. " AI entities. Total entities with ESP: " .. tostring(table.getn(espObjects)))
         -- Start Auto-Refresh in a separate thread
         AutoRefreshThread = spawn(AutoRefreshESP)
         print("ESP Enabled with Auto-Refresh.")
         -- Handle new players/revives (exclude local player)
         game.Players.PlayerAdded:Connect(function(player)
            if player ~= game.Players.LocalPlayer then
               player.CharacterAdded:Connect(function(char)
                  if char:WaitForChild("HumanoidRootPart", 5) or char:FindFirstChildWhichIsA("BasePart") then
                     if CreateESP(char, true) then
                        print("New player ESP added: " .. player.Name)
                     end
                  end
               end)
            end
         end)
         -- Monitor revives for existing players (exclude local player)
         for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and (player.Character:FindFirstChild("Humanoid") or player.Character:FindFirstChildWhichIsA("Humanoid")) then
               local hum = player.Character:FindFirstChild("Humanoid") or player.Character:FindFirstChildWhichIsA("Humanoid")
               hum.HealthChanged:Connect(function(health)
                  if health > 0 and not espObjects[player.Character] then
                     if CreateESP(player.Character, true) then
                        print("Revived player ESP added: " .. player.Name)
                     end
                  end
               end)
            end
         end
         -- Monitor workspace for new AI
         workspace.DescendantAdded:Connect(function(child)
            local parent = child.Parent
            if not game.Players:GetPlayerFromCharacter(parent) and (parent:FindFirstChild("Humanoid") or parent:FindFirstChildWhichIsA("Humanoid")) and (parent:FindFirstChild("HumanoidRootPart") or parent:FindFirstChildWhichIsA("BasePart")) and not espObjects[parent] then
               if CreateESP(parent, false) then
                  print("New AI ESP added: " .. parent.Name)
               end
            end
         end)
         -- Run update loop with error handling
         game:GetService("RunService").RenderStepped:Connect(function()
            local success, errorMsg = pcall(UpdateESP)
            if not success then
               print("ESP Update Error: " .. errorMsg)
            end
         end)
         print("ESP update loop started.")
      else
         print("Disabling ESP...")
         for _, obj in pairs(espObjects) do
            if obj.highlight then
               obj.highlight:Destroy()
            end
         end
         espObjects = {}
         AutoRefreshThread = nil
         print("ESP Disabled. Auto-Refresh stopped.")
      end
   end,
})

-- Speedhack Toggle and Slider
local SpeedHackEnabled = false
local WalkSpeedValue = 16
local SpeedToggle = Tab:CreateToggle({
   Name = "Enable Speedhack",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
      SpeedHackEnabled = Value
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         if Value then
            char.Humanoid.WalkSpeed = WalkSpeedValue
            local root = char:FindFirstChild("HumanoidRootPart")
            if root and game.Players.LocalPlayer.Team and game.Players.LocalPlayer.Team.Name == "Monster" then
               root.Velocity = root.Velocity * (WalkSpeedValue / 16)
            end
         else
            char.Humanoid.WalkSpeed = 16
         end
      end
   end,
})

local WalkSpeedSlider = Tab:CreateSlider({
   Name = "Walk Speed (1-100)",
   Range = {1, 100},
   Increment = 1,
   Suffix = "",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider",
   Callback = function(Value)
      WalkSpeedValue = Value
      if SpeedHackEnabled then
         local char = game.Players.LocalPlayer.Character
         if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
            local root = char:FindFirstChild("HumanoidRootPart")
            if root and game.Players.LocalPlayer.Team and game.Players.LocalPlayer.Team.Name == "Monster" then
               root.Velocity = root.Velocity * (Value / 16)
            end
         end
      end
   end,
})

local ResetSpeedButton = Tab:CreateButton({
   Name = "Reset Speed to Default",
   Callback = function()
      WalkSpeedSlider:Set(16)
   end,
})

local RefreshButton = Tab:CreateButton({
   Name = "Refresh",
   Callback = function()
      if ESPToggle.CurrentValue then
         print("Refreshing ESP...")
         for _, obj in pairs(espObjects) do
            if obj.highlight then
               obj.highlight:Destroy()
            end
         end
         espObjects = {}
         local playerCount = 0
         for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and CreateESP(player.Character, true) then
               playerCount = playerCount + 1
            end
         end
         local aiCount = ScanWorkspaceForAI()
         print("ESP Refreshed: " .. playerCount .. " other players, " .. aiCount .. " AI entities added.")
      end
   end,
})

-- Noclip Feature under "Others" Tab
local NoclipEnabled = false
local NoclipConnection = nil

local function EnableNoclip()
   local char = game.Players.LocalPlayer.Character
   if not char then return end
   NoclipEnabled = true
   -- Disable collision for all parts
   for _, part in ipairs(char:GetDescendants()) do
      if part:IsA("BasePart") then
         part.CanCollide = false
      end
   end
   print("Noclip Enabled: You can now pass through objects.")
end

local function DisableNoclip()
   local char = game.Players.LocalPlayer.Character
   if not char then return end
   NoclipEnabled = false
   -- Restore collision for all parts except HumanoidRootPart if needed
   for _, part in ipairs(char:GetDescendants()) do
      if part:IsA("BasePart") then
         if part.Name == "HumanoidRootPart" then
            part.CanCollide = true
         else
            part.CanCollide = true
         end
      end
   end
   print("Noclip Disabled: Collisions restored.")
end

local NoclipToggle = AITab:CreateToggle({
   Name = "Noclip (Pass Through Walls)",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
      if Value then
         EnableNoclip()
         -- Keep noclip active on character updates or movement
         NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and NoclipEnabled then
               for _, part in ipairs(char:GetDescendants()) do
                  if part:IsA("BasePart") then
                     part.CanCollide = false
                  end
               end
            end
         end)
      else
         DisableNoclip()
         if NoclipConnection then
            NoclipConnection:Disconnect()
            NoclipConnection = nil
         end
      end
   end,
})

-- Third Person Camera Feature under "Others" Tab (New Method)
local ThirdPersonEnabled = false
local ThirdPersonConnection = nil
local CameraDistance = 10 -- Default distance from character
local CameraHeight = 3   -- Default height offset

local function EnableThirdPerson()
   local player = game.Players.LocalPlayer
   if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
   ThirdPersonEnabled = true
   
   local camera = game.Workspace.CurrentCamera
   if not camera then return end
   
   -- Set camera to Scriptable mode for full control
   camera.CameraType = Enum.CameraType.Scriptable
   print("Third Person Camera Enabled: Camera set to Scriptable mode.")
   
   -- Update camera position every frame to follow the character
   ThirdPersonConnection = game:GetService("RunService").RenderStepped:Connect(function()
      if not ThirdPersonEnabled then return end
      local char = player.Character
      if not char or not char:FindFirstChild("HumanoidRootPart") then return end
      
      local rootPart = char.HumanoidRootPart
      -- Calculate camera position with offset (distance behind and height above)
      local cameraOffset = CFrame.new(0, CameraHeight, CameraDistance)
      local cameraCFrame = rootPart.CFrame * cameraOffset
      -- Set camera to look at the character's root part
      camera.CFrame = CFrame.new(cameraCFrame.Position, rootPart.Position)
   end)
end

local function DisableThirdPerson()
   local player = game.Players.LocalPlayer
   if not player or not player.Character then return end
   ThirdPersonEnabled = false
   
   local camera = game.Workspace.CurrentCamera
   if camera then
      camera.CameraType = Enum.CameraType.Custom -- Reset to default Roblox camera
      print("Third Person Camera Disabled: Camera reset to default mode.")
   end
   
   if ThirdPersonConnection then
      ThirdPersonConnection:Disconnect()
      ThirdPersonConnection = nil
   end
end

local ThirdPersonToggle = AITab:CreateToggle({
   Name = "Third Person Camera",
   CurrentValue = false,
   Flag = "ThirdPersonToggle",
   Callback = function(Value)
      if Value then
         EnableThirdPerson()
         -- Reapply on character respawn
         local player = game.Players.LocalPlayer
         player.CharacterAdded:Connect(function(char)
            wait(0.5) -- Small delay to ensure character is fully loaded
            if ThirdPersonEnabled then
               EnableThirdPerson()
               print("Third Person Camera reapplied on character respawn.")
            end
         end)
      else
         DisableThirdPerson()
      end
   end,
})

local CameraDistanceSlider = AITab:CreateSlider({
   Name = "Camera Distance (5-20)",
   Range = {5, 20},
   Increment = 1,
   Suffix = "",
   CurrentValue = 10,
   Flag = "CameraDistanceSlider",
   Callback = function(Value)
      CameraDistance = Value
      print("Third Person Camera Distance set to: " .. Value)
   end,
})

local CameraHeightSlider = AITab:CreateSlider({
   Name = "Camera Height (1-5)",
   Range = {1, 5},
   Increment = 1,
   Suffix = "",
   CurrentValue = 3,
   Flag = "CameraHeightSlider",
   Callback = function(Value)
      CameraHeight = Value
      print("Third Person Camera Height set to: " .. Value)
   end,
})

-- Troll Features under "Trolls" Tab
-- Feature 1: Chat Spam (Sends random messages to annoy others)
local ChatSpamEnabled = false
local SpamMessages = {
   "Catch me if you can!",
   "Is anyone even playing?",
   "I’m unstoppable!",
   "This game is too easy!",
   "Try harder, lol!"
}
local SpamInterval = 2 -- Default interval in seconds

local function StartChatSpam()
   while ChatSpamEnabled do
      local randomMessage = SpamMessages[math.random(1, #SpamMessages)]
      local success, errorMsg = pcall(function()
         game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomMessage, "All")
      end)
      if success then
         print("Chat Spam: Sent message - " .. randomMessage)
      else
         print("Chat Spam Error: " .. tostring(errorMsg) .. " - Attempting fallback method.")
         -- Fallback: Try to use TextChatService if available (Roblox's newer chat system)
         local textChatService = game:GetService("TextChatService")
         if textChatService and textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local textChannels = textChatService:FindFirstChild("TextChannels")
            if textChannels and textChannels:FindFirstChild("RBXGeneral") then
               textChannels.RBXGeneral:SendAsync(randomMessage)
               print("Chat Spam: Fallback successful - Sent message via TextChatService - " .. randomMessage)
            end
         end
      end
      wait(SpamInterval)
   end
end

local ChatSpamToggle = TrollTab:CreateToggle({
   Name = "Chat Spam",
   CurrentValue = false,
   Flag = "ChatSpamToggle",
   Callback = function(Value)
      ChatSpamEnabled = Value
      if Value then
         print("Chat Spam Enabled: Starting to spam messages.")
         spawn(StartChatSpam)
      else
         print("Chat Spam Disabled: Stopping message spam.")
      end
   end,
})

local SpamIntervalSlider = TrollTab:CreateSlider({
   Name = "Spam Interval (1-5 sec)",
   Range = {1, 5},
   Increment = 1,
   Suffix = "s",
   CurrentValue = 2,
   Flag = "SpamIntervalSlider",
   Callback = function(Value)
      SpamInterval = Value
      print("Chat Spam Interval set to: " .. Value .. " seconds")
   end,
})

-- Feature 2: Fake Lag (Toggles network simulation to appear laggy to others)
local FakeLagEnabled = false

local function EnableFakeLag()
   FakeLagEnabled = true
   -- Attempt to simulate lag by throttling network updates (limited effectiveness in Roblox)
   local success, errorMsg = pcall(function()
      game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1) -- Limit outgoing data
   end)
   if success then
      print("Fake Lag Enabled: Simulating network lag with KBPS limit.")
   else
      print("Fake Lag Error: " .. tostring(errorMsg) .. " - KBPS limit failed. Using alternative method.")
      -- Fallback: Simulate lag by delaying local character updates (visual effect only)
      spawn(function()
         while FakeLagEnabled do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
               local root = char.HumanoidRootPart
               local oldPos = root.Position
               wait(0.3) -- Simulate delayed position update
               if FakeLagEnabled and root and root.Parent then
                  root.Position = oldPos -- Briefly freeze position to appear laggy
               end
            end
            wait(0.1)
         end
      end)
      print("Fake Lag Enabled: Fallback method active (visual lag simulation).")
   end
end

local function DisableFakeLag()
   FakeLagEnabled = false
   local success, errorMsg = pcall(function()
      game:GetService("NetworkClient"):SetOutgoingKBPSLimit(0) -- Reset to normal
   end)
   if success then
      print("Fake Lag Disabled: Network simulation stopped.")
   else
      print("Fake Lag Disable Error: " .. tostring(errorMsg))
   end
end

local FakeLagToggle = TrollTab:CreateToggle({
   Name = "Fake Lag (Appear Laggy)",
   CurrentValue = false,
   Flag = "FakeLagToggle",
   Callback = function(Value)
      if Value then
         EnableFakeLag()
      else
         DisableFakeLag()
      end
   end,
})

-- Feature 3: Particle Spam (Creates visual annoyance around player)
local ParticleSpamEnabled = false
local ParticleObjects = {}

local function CreateParticleSpam()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then 
      print("Particle Spam Error: No character or HumanoidRootPart found.")
      return 
   end
   
   -- Clear any existing particles first
   RemoveParticleSpam()
   
   for i = 1, 5 do -- Create 5 particle effects
      local particle = Instance.new("ParticleEmitter")
      particle.Texture = "rbxassetid://243098098" -- Default sparkles texture
      particle.Size = NumberSequence.new(1)
      particle.Transparency = NumberSequence.new(0)
      particle.Lifetime = NumberRange.new(1, 3)
      particle.Rate = 50
      particle.RotSpeed = NumberRange.new(-100, 100)
      particle.Speed = NumberRange.new(5, 10)
      particle.SpreadAngle = Vector2.new(-180, 180)
      -- Place in CoreGui as fallback if parenting to character fails
      local success, errorMsg = pcall(function()
         particle.Parent = char.HumanoidRootPart
      end)
      if not success then
         print("Particle Spam Error: Failed to parent to character - " .. tostring(errorMsg) .. ". Using CoreGui as fallback.")
         particle.Adornee = char.HumanoidRootPart
         particle.Parent = game.CoreGui
      end
      table.insert(ParticleObjects, particle)
   end
   print("Particle Spam Enabled: Created visual effects around player.")
   -- Monitor character to re-apply if necessary
   spawn(function()
      while ParticleSpamEnabled do
         if char and char.Parent and char:FindFirstChild("HumanoidRootPart") then
            for _, particle in ipairs(ParticleObjects) do
               if particle and not particle.Parent then
                  print("Particle Spam: Re-applying lost particle.")
                  particle.Parent = char.HumanoidRootPart or game.CoreGui
                  particle.Adornee = char.HumanoidRootPart
               end
            end
         else
            char = game.Players.LocalPlayer.Character
            if char and ParticleSpamEnabled then
               print("Particle Spam: Character respawned, re-applying particles.")
               CreateParticleSpam()
               break
            end
         end
         wait(5)
      end
   end)
end

local function RemoveParticleSpam()
   for _, particle in ipairs(ParticleObjects) do
      if particle and particle.Parent then
         particle:Destroy()
      end
   end
   ParticleObjects = {}
   print("Particle Spam Disabled: Removed visual effects.")
end

local ParticleSpamToggle = TrollTab:CreateToggle({
   Name = "Particle Spam (Visual Annoyance)",
   CurrentValue = false,
   Flag = "ParticleSpamToggle",
   Callback = function(Value)
      ParticleSpamEnabled = Value
      if Value then
         CreateParticleSpam()
      else
         RemoveParticleSpam()
      end
   end,
})

Rayfield:Notify({
   Title = "MistHub Loaded",
   Content = "Hunted Script are ready to use.",
   Duration = 5,
   Image = 4483362458,
})

Rayfield:LoadConfiguration()