local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Abyss World | BabyMaxford",
    LoadingTitle = "Loading Systems...",
    LoadingSubtitle = "by BabyMaxford",
    ConfigurationSaving = { Enabled = false }
})

--// SERVICES & VARIABLES
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local SlowFallEnabled, FallSpeed = false, -15
local PlatformEnabled, CurrentPlatform = false, nil 
local FreecamEnabled, FreecamSpeed, Sensitivity = false, 1.5, 0.5
local RotationX, RotationY, SavedCameraCFrame = 0, 0, nil
local Connections = {}
local SelectedCheckpoint, SelectedPlayerName = nil, nil

--// WAYPOINT VISUAL PART
local WaypointPart = Instance.new("Part")
WaypointPart.Name = "CustomWaypoint"
WaypointPart.Size = Vector3.new(2, 2, 2)
WaypointPart.Shape = Enum.PartType.Ball
WaypointPart.Color = Color3.fromRGB(0, 255, 0)
WaypointPart.Material = Enum.Material.Neon
WaypointPart.Transparency = 0.5
WaypointPart.CanCollide, WaypointPart.Anchored = false, true

--// PRECISE CHECKPOINT DATA
local CheckpointData = {
    ["Checkpoint 0: Temple of the Abyss"] = CFrame.new(-11.1401329, 21259.8965, -105.8598),
    ["Checkpoint 1: Windmill Town"]      = CFrame.new(-11.1401329, 21259.8965, -105.8598),
    ["Checkpoint 2: Moss Underhang"]     = CFrame.new(40.7981262, 21018.8965, -166.8907),
    ["Checkpoint 3: Worker's Burrow"]    = CFrame.new(-298.29138, 21000.3965, -412.2913),
    ["Checkpoint 4: Wooded Boundary"]    = CFrame.new(-39.211792, 20785.6602, -595.0610),
    ["Checkpoint 5: Ruined Umbra"]       = CFrame.new(-82.000244, 20348.8965, -786.1665),
    ["Checkpoint 6: Root Canal"]         = CFrame.new(-205.73355, 20046.2246, -185.2997),
    ["Checkpoint 7: Cardinal Spire"]     = CFrame.new(-413.63913, 19802.6855, -498.6039),
    ["Checkpoint 8: Stagnant Pipeworks"] = CFrame.new(186.499725, 19426.8965, -79.0002),
    ["Checkpoint 9: Sprouting Baths"]    = CFrame.new(-411.59371, 19161.3945, -552.9361),
    ["Checkpoint 10: Diminished Spire"]  = CFrame.new(286.097473, 19117.3125, -690.4770),
    ["Checkpoint 11: Plantasia"]         = CFrame.new(323.138244, 18793.7578, -281.2981),
    ["Checkpoint 12: Ononia"]            = CFrame.new(-297.13964, 18721.4805, -724.7577),
    ["Checkpoint 13: Hagtree Repose"]    = CFrame.new(-59.401245, 18442.2559, -194.8866),
    ["Checkpoint 14: World Gate"]        = CFrame.new(-59.435054, 17866.9492, -795.0255)
}

local CheckpointNames = {}
for name, _ in pairs(CheckpointData) do table.insert(CheckpointNames, name) end
table.sort(CheckpointNames, function(a,b) return tonumber(a:match("%d+")) < tonumber(b:match("%d+")) end)
SelectedCheckpoint = CheckpointNames[1]

--// CORE FUNCTIONS
local function ToggleFreecam()
    FreecamEnabled = not FreecamEnabled
    local char = Player.Character
    if FreecamEnabled then
        SavedCameraCFrame = Camera.CFrame
        local _, y, _ = Camera.CFrame:ToEulerAnglesYXZ()
        RotationY, RotationX = math.degrees(y), 0
        Camera.CameraType = Enum.CameraType.Scriptable
    else
        if SavedCameraCFrame then Camera.CFrame = SavedCameraCFrame end
        Camera.CameraType = Enum.CameraType.Custom
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        if char then for _, v in ipairs(char:GetDescendants()) do if v:IsA("BasePart") then v.Anchored = false end end end
    end
end

--// UPDATE THE PLATFORM TOGGLE
local function TogglePlatform()
    local char = Player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if CurrentPlatform then
        -- Stop the loop first, then destroy
        if Connections.PlatformLoop then 
            Connections.PlatformLoop:Disconnect() 
            Connections.PlatformLoop = nil
        end
        CurrentPlatform:Destroy()
        CurrentPlatform = nil
    else
        -- Create the physical platform
        CurrentPlatform = Instance.new("Part")
        CurrentPlatform.Name = "EmergencyPlatform"
        CurrentPlatform.Size = Vector3.new(15, 1, 15)
        CurrentPlatform.Anchored = true
        CurrentPlatform.CanCollide = true
        CurrentPlatform.Color = Color3.fromRGB(0, 255, 255)
        CurrentPlatform.Material = Enum.Material.ForceField
        CurrentPlatform.Parent = workspace
        
        -- Set initial position under the player
        CurrentPlatform.Position = root.Position - Vector3.new(0, 3.5, 0)
        
        -- Start the follow loop immediately
        Connections.PlatformLoop = RunService.Heartbeat:Connect(function()
            if CurrentPlatform and root then
                -- Updates X and Z to follow you, but stays at the same height (Y)
                CurrentPlatform.Position = Vector3.new(root.Position.X, CurrentPlatform.Position.Y, root.Position.Z)
            end
        end)
    end
end

--// Waypoint Particle Effect
local function TriggerSpawnEffect(position)
    local effectPart = Instance.new("Part")
    effectPart.Size = Vector3.new(1, 1, 1)
    effectPart.Position = position
    effectPart.Anchored = true
    effectPart.CanCollide = false
    effectPart.Transparency = 1
    effectPart.Parent = workspace
    
    local attachment = Instance.new("Attachment", effectPart)
    
    -- Recreating a "Spawn" burst
    local particles = Instance.new("ParticleEmitter", attachment)
    particles.Texture = "rbxassetid://2442214486" -- A glow/sparkle texture
    particles.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
    particles.Rate = 500
    particles.Speed = NumberRange.new(5, 10)
    particles.Lifetime = NumberRange.new(0.5, 1)
    particles.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0)})
    particles.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
    
    -- Emit once and cleanup
    particles:Emit(50)
    task.delay(1.5, function()
        effectPart:Destroy()
    end)
end

--// UI TABS
local PlayerTab = Window:CreateTab("Player")
local TeleportTab = Window:CreateTab("Teleport")
local EnvTab = Window:CreateTab("Environment")
local SettingsTab = Window:CreateTab("Settings")

--// PLAYER TAB
PlayerTab:CreateToggle({Name = "Slow Falling", CurrentValue = false, Callback = function(v) SlowFallEnabled = v end})
PlayerTab:CreateToggle({Name = "Emergency Platform (Left Ctrl)", CurrentValue = false, Callback = function(v) PlatformEnabled = v; if not v and CurrentPlatform then CurrentPlatform:Destroy() end end})
PlayerTab:CreateSection("Spectator Mode")
PlayerTab:CreateToggle({Name = "Freecam (Press H)", CurrentValue = false, Callback = function(v) if v ~= FreecamEnabled then ToggleFreecam() end end})
PlayerTab:CreateSlider({Name = "Fly Speed", Range = {1, 20}, Increment = 0.5, CurrentValue = 1.5, Callback = function(v) FreecamSpeed = v end})
PlayerTab:CreateSection("Get Wings")
PlayerTab:CreateButton({Name = "Collect All Transmitters", Callback = function()
    local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    for _, item in ipairs(workspace:GetDescendants()) do if item:IsA("TouchTransmitter") then firetouchinterest(item.Parent, root, 0); task.wait(); firetouchinterest(item.Parent, root, 1) end end
end})

--// TELEPORT TAB
TeleportTab:CreateSection("Checkpoints Teleport")
TeleportTab:CreateDropdown({Name = "Select Checkpoint", Options = CheckpointNames, CurrentOption = CheckpointNames[1], Callback = function(v) SelectedCheckpoint = v[1] end})
TeleportTab:CreateButton({Name = "Teleport to Selected Checkpoint", Callback = function()
    local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if root and CheckpointData[SelectedCheckpoint] then root.Velocity = Vector3.zero; root.CFrame = CheckpointData[SelectedCheckpoint] end
end})
TeleportTab:CreateSection("Player Teleport")
TeleportTab:CreateDropdown({Name = "Select Player", Options = (function() local t = {} for _, p in ipairs(Players:GetPlayers()) do if p ~= Player then table.insert(t, p.Name) end end return t end)(), CurrentOption = "", Callback = function(v) SelectedPlayerName = v[1] end})
TeleportTab:CreateButton({Name = "Teleport to Selected Player", Callback = function()
    local target = Players:FindFirstChild(SelectedPlayerName or ""); local tRoot = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart"); local myRoot = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if tRoot and myRoot then myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 3, 0) end
end})
--// TELEPORT TAB
TeleportTab:CreateSection("Waypoints")
TeleportTab:CreateButton({
    Name = "Destroy Waypoint",
    Callback = function()
        WaypointPos = nil
        WaypointPart.Parent = nil
        Rayfield:Notify({Title = "Waypoint Removed", Content = "The custom waypoint has been cleared.", Duration = 2})
    end
})
TeleportTab:CreateParagraph({
    Title = "Waypoint Info:", 
    Content = "Press the T key to create a waypoint in your current position. Press \"Left Shift\" to teleport to the waypoint's position instantly. Waypoint Teleport always teleports you to the waypoint location no matter where you are in game."
})

TeleportTab:CreateSection("Player Teleport")
-- (Remaining Player TP logic continues here...)

--// ENVIRONMENT TAB
EnvTab:CreateToggle({Name = "Full Bright", CurrentValue = false, Callback = function(v) Lighting.Brightness = v and 2 or 1; Lighting.ClockTime = v and 14 or 12; Lighting.FogEnd = v and 100000 or 1000; Lighting.GlobalShadows = not v; Lighting.Ambient = v and Color3.new(1,1,1) or Color3.new(0,0,0) end})
EnvTab:CreateToggle({Name = "Remove Fog", CurrentValue = false, Callback = function(v) Lighting.FogEnd = v and 100000 or 1000 end})

--// SETTINGS TAB
SettingsTab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        -- 1. Stop all background loops (Slow Fall, Freecam, etc.)
        for _, connection in pairs(Connections) do 
            connection:Disconnect() 
        end
        -- 2. Cleanup physical objects
        if CurrentPlatform then 
            CurrentPlatform:Destroy() 
        end
        if WaypointPart then 
            WaypointPart:Destroy() -- This ensures the sphere is deleted from the game
        end
        -- 3. Reset character physics and camera
        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if root then 
            root.Anchored = false 
        end
        Camera.CameraType = Enum.CameraType.Custom
        -- 4. Remove the UI from the screen
        Rayfield:Destroy()
    end
})

--// LOGIC LOOP
Connections.Main = RunService.RenderStepped:Connect(function()
    if FreecamEnabled then
        local char = Player.Character
        if char then for _, p in ipairs(char:GetDescendants()) do if p:IsA("BasePart") and not p.Anchored then p.Anchored = true end end end
        if Camera.CameraType ~= Enum.CameraType.Scriptable then Camera.CameraType = Enum.CameraType.Scriptable end
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        local delta = UserInputService:GetMouseDelta()
        RotationY = RotationY - (delta.X * Sensitivity)
        RotationX = math.clamp(RotationX - (delta.Y * Sensitivity), -80, 80)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position) * CFrame.Angles(0, math.rad(RotationY), 0) * CFrame.Angles(math.rad(RotationX), 0, 0)
        local move = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.yAxis end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move -= Vector3.yAxis end
        if move.Magnitude > 0 then Camera.CFrame += (move.Unit * FreecamSpeed) end
    end
    if SlowFallEnabled then
        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if root and root.Velocity.Y < FallSpeed then root.Velocity = Vector3.new(root.Velocity.X, FallSpeed, root.Velocity.Z) end
    end
end)

Connections.Input = UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- T: Save Waypoint
    if input.KeyCode == Enum.KeyCode.T then
        WaypointPos = root.CFrame
        WaypointPart.CFrame = root.CFrame
        WaypointPart.Parent = workspace
        Rayfield:Notify({Title = "Waypoint Set", Content = "Position saved!", Duration = 2})

    -- Left Shift: Teleport to Waypoint
    elseif input.KeyCode == Enum.KeyCode.LeftShift and not FreecamEnabled then
        if WaypointPos then 
            root.Velocity = Vector3.zero
            root.CFrame = WaypointPos 
            TriggerSpawnEffect(WaypointPos.Position)
        end

    -- Left Control: SPAWN PLATFORM (Must be enabled in UI first)
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        if PlatformEnabled then 
            TogglePlatform() 
        else
            Rayfield:Notify({Title = "Platform Disabled", Content = "Enable 'Emergency Platform' in the Player tab first.", Duration = 2})
        end

    -- H: Toggle Freecam
    elseif input.KeyCode == Enum.KeyCode.H then
        ToggleFreecam()
    end
end)