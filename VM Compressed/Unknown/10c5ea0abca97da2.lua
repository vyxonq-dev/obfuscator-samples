local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "JayWare",
   LoadingTitle = "Jay Dev",
   LoadingSubtitle = "by Jay",
   Theme = "Default", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Jayware"
   },

   Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
   },

   KeySystem = false, 
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
   }
})

Rayfield:Notify({
   Title = "Cheat successfully executed!",
   Content = "Have fun!",
   Duration = 3.5,
   Image = 4483362458,
})

local VisualsTab = Window:CreateTab("Visuals", 4483362458) 
local VisualsSection = VisualsTab:CreateSection("ESP")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variables for ESP
local espEnabled = false -- Tracks the ESP state
local espConnection -- Stores the RenderStepped connection for ESP updates

-- Variables for Tracers
local drawLinesEnabled = false
local lines = {} -- Store all the lines
local tracerConnection -- Stores the RenderStepped connection for tracers

-- Function to create a hollow rectangle with thicker borders (ESP box)
local function createHollowBox()
    local box = Instance.new("BillboardGui")
    box.Size = UDim2.new(4, 0, 5, 0)
    box.AlwaysOnTop = true
    box.Adornee = nil
    box.Name = "PlayerBox"

    local borderThickness = 0.05 -- Increased from 0.03 to make borders thicker

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, borderThickness, 0)
    top.Position = UDim2.new(0, 0, 0, 0)
    top.BackgroundColor3 = Color3.new(1, 0, 0)
    top.BorderSizePixel = 0
    top.Parent = box

    local bottom = Instance.new("Frame")
    bottom.Size = UDim2.new(1, 0, borderThickness, 0)
    bottom.Position = UDim2.new(0, 0, 1 - borderThickness, 0)
    bottom.BackgroundColor3 = Color3.new(1, 0, 0)
    bottom.BorderSizePixel = 0
    bottom.Parent = box

    local left = Instance.new("Frame")
    left.Size = UDim2.new(borderThickness, 0, 1, 0)
    left.Position = UDim2.new(0, 0, 0, 0)
    left.BackgroundColor3 = Color3.new(1, 0, 0)
    left.BorderSizePixel = 0
    left.Parent = box

    local right = Instance.new("Frame")
    right.Size = UDim2.new(borderThickness, 0, 1, 0)
    right.Position = UDim2.new(1 - borderThickness, 0, 0, 0)
    right.BackgroundColor3 = Color3.new(1, 0, 0)
    right.BorderSizePixel = 0
    right.Parent = box

    return box
end

-- Function to check if a player is on the enemy team
local function isEnemyTeam(player)
    return player.Team ~= LocalPlayer.Team
end

-- Function to highlight all enemy players (ESP)
local function highlightAllPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isEnemyTeam(player) then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("PlayerBox") then
                    local box = createHollowBox()
                    box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                    box.Parent = player.Character
                end
            end
        else
            if player.Character and player.Character:FindFirstChild("PlayerBox") then
                player.Character.PlayerBox:Destroy()
            end
        end
    end
end

-- Clean up highlights when players leave
local function onPlayerRemoving(player)
    if player.Character and player.Character:FindFirstChild("PlayerBox") then
        player.Character.PlayerBox:Destroy()
    end
end

-- Enable or disable ESP
local function toggleESP(state)
    if state then
        espConnection = RunService.RenderStepped:Connect(highlightAllPlayers)
        Players.PlayerRemoving:Connect(onPlayerRemoving)
    else
        if espConnection then
            espConnection:Disconnect()
            espConnection = nil
        end
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("PlayerBox") then
                player.Character.PlayerBox:Destroy()
            end
        end
    end
end

-- Function to create and update tracers (lines)
local function createLine()
    local line = Drawing.new("Line")
    line.Visible = true
    line.Thickness = 3 -- Increased from 1 to make lines thicker
    line.Color = Color3.new(1, 0, 0)
    return line
end

local function updateLines()
    -- Hide all lines first
    for _, line in ipairs(lines) do
        line.Visible = false
    end

    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local index = 1
    for _, player in ipairs(Players:GetPlayers()) do
        -- Only draw lines to enemy team players
        if player ~= LocalPlayer and isEnemyTeam(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local rootPart = character.HumanoidRootPart
            local worldPosition = rootPart.Position
            local screenPosition, onScreen = Camera:WorldToViewportPoint(worldPosition)

            if onScreen then
                local line = lines[index] or createLine()
                line.From = screenCenter
                line.To = Vector2.new(screenPosition.X, screenPosition.Y)
                line.Visible = true

                lines[index] = line
                index = index + 1
            end
        end
    end

    -- Hide remaining lines if there are no players to connect to
    for i = index, #lines do
        lines[i].Visible = false
    end
end

local function cleanupLines()
    -- Clean up the lines by making them invisible and removing them
    for _, line in ipairs(lines) do
        line.Visible = false
        line:Remove()
    end
    lines = {}
end

-- Toggle for tracers (line drawing)
local function toggleLineDrawing(state)
    if state then
        tracerConnection = RunService.RenderStepped:Connect(updateLines)
    else
        if tracerConnection then
            tracerConnection:Disconnect()
            tracerConnection = nil
        end
        cleanupLines()
    end
end

-- Rayfield UI Toggles

-- ESP Toggle
VisualsTab:CreateToggle({
    Name = "Enemy Boxes",
    CurrentValue = false,
    Flag = "BOX1",
    Callback = function(Value)
        espEnabled = Value
        toggleESP(Value)
    end,
})

-- Tracers Toggle
VisualsTab:CreateToggle({
    Name = "Enemy Tracers",
    CurrentValue = false,
    Flag = "Tracer1",
    Callback = function(Value)
        drawLinesEnabled = Value
        toggleLineDrawing(Value)
    end,
})


local MoveTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local MoveSection = MoveTab:CreateSection("Awesome Sauce")

local Toggle = MoveTab:CreateButton({
    Name = "Strafe/bhop",
    Callback = function(Value)
        -- Movement settings
local STRAFE_SPEED = 30
local AIR_MULTIPLIER = 1.5
local BHOP_POWER = 40

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Local player setup
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Variables
local moveKeys = {
    W = false,
    A = false,
    S = false,
    D = false,
    Space = false
}

-- Functions to handle character access safely
local function getChar()
    return player.Character or player.CharacterAdded:Wait()
end

local function getRoot()
    local char = getChar()
    return char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = getChar()
    return char:FindFirstChild("Humanoid")
end

-- Movement function
local function calculateMoveDirection()
    local dir = Vector3.new(0, 0, 0)
    local char = getChar()
    if not char then return dir end
    
    local cf = workspace.CurrentCamera.CFrame
    
    if moveKeys.W then
        dir = dir + cf.LookVector
    end
    if moveKeys.S then
        dir = dir - cf.LookVector
    end
    if moveKeys.A then
        dir = dir - cf.RightVector
    end
    if moveKeys.D then
        dir = dir + cf.RightVector
    end
    
    dir = Vector3.new(dir.X, 0, dir.Z).Unit
    return dir
end

-- Key handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.W then
        moveKeys.W = true
    elseif input.KeyCode == Enum.KeyCode.A then
        moveKeys.A = true
    elseif input.KeyCode == Enum.KeyCode.S then
        moveKeys.S = true
    elseif input.KeyCode == Enum.KeyCode.D then
        moveKeys.D = true
    elseif input.KeyCode == Enum.KeyCode.Space then
        moveKeys.Space = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.W then
        moveKeys.W = false
    elseif input.KeyCode == Enum.KeyCode.A then
        moveKeys.A = false
    elseif input.KeyCode == Enum.KeyCode.S then
        moveKeys.S = false
    elseif input.KeyCode == Enum.KeyCode.D then
        moveKeys.D = false
    elseif input.KeyCode == Enum.KeyCode.Space then
        moveKeys.Space = false
    end
end)

-- Main movement loop
RunService.Heartbeat:Connect(function()
    local char = getChar()
    local root = getRoot()
    local humanoid = getHumanoid()
    
    if not char or not root or not humanoid then return end
    
    -- Calculate movement
    local moveDir = calculateMoveDirection()
    local isInAir = humanoid:GetState() == Enum.HumanoidStateType.Jumping or 
                    humanoid:GetState() == Enum.HumanoidStateType.Freefall
    
    -- Apply movement
    if moveDir.Magnitude > 0 then
        local speed = STRAFE_SPEED
        if isInAir then
            speed = speed * AIR_MULTIPLIER
        end
        
        -- Set velocity
        local newVel = moveDir * speed
        root.Velocity = Vector3.new(
            newVel.X,
            root.Velocity.Y,  -- Preserve vertical velocity
            newVel.Z
        )
        
        -- Bunny hop
        if moveKeys.Space and root.Velocity.Y < 1 then
            root.Velocity = Vector3.new(
                root.Velocity.X,
                BHOP_POWER,
                root.Velocity.Z
            )
        end
    end
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Movement Script Loaded",
    Text = "Controls: WASD to move, Space to jump",
    Duration = 5
})
    end,
})

local Button = MoveTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
   end,
})

local Button = MoveTab:CreateButton({
   Name = "NoClip(N)",
   Callback = function()
   -- Local Script (Place in StarterPlayerScripts for local player functionality)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local noclip = false -- Initial state of noclip
local UIS = game:GetService("UserInputService")

-- Function to toggle noclip
local function toggleNoclip()
    noclip = not noclip
    if noclip then
        print("Noclip enabled")
    else
        print("Noclip disabled")
    end
end

-- Detecting player input to toggle noclip (e.g., pressing "N")
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.N then
        toggleNoclip()
    end
end)

-- Continuously update character collisions
game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    else
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and not part.CanCollide then
                part.CanCollide = true
            end
        end
    end
end)

   end,
})

local AimTab = Window:CreateTab("Aimbot", 4483362458) -- Title, Image
local AimbotSection = AimTab:CreateSection("Aimbot")

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local LockedPlayer = nil
local LastKnownPosition = nil
local FieldOfView = 40 -- Set the field of view to 40 degrees
local CenterPrioritizationFactor = 0.5 -- Decrease this value to shrink the priority "circle"
local AimbotEnabled = false -- Track whether the aimbot is enabled or not

-- Function to check if a player is on the enemy team
local function isEnemyTeam(player)
    -- If the local player has no team, or the target player has no team, return false
    if not LocalPlayer.Team or not player.Team then
        return false
    end
    
    -- Return true if the teams are different
    return LocalPlayer.Team ~= player.Team
end

-- Function to get the body part based on weighted probabilities
local function getTargetBodyPart()
    local randomValue = math.random()
    if randomValue <= 0.7 then
        return "UpperTorso" -- 70% chance
    else
        return "Head" -- 30% chance
    end
end

-- Function to get the closest enemy player to the crosshair, prioritizing players near the center of the screen and closest to the player
local function getClosestEnemyPlayerToCrosshair()
    local mousePosition = UserInputService:GetMouseLocation()
    local closestPlayer = nil
    local closestDistance = math.huge
    local cameraPosition = Camera.CFrame.Position
    local cameraForward = Camera.CFrame.LookVector
    local centerOfScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, player in pairs(Players:GetPlayers()) do
        -- Only target players who are on the enemy team
        if player ~= LocalPlayer and player.Character and isEnemyTeam(player) then
            -- Choose body part based on weighted probability
            local targetBodyPartName = getTargetBodyPart()
            local bodyPart = player.Character:FindFirstChild(targetBodyPartName)
            
            if bodyPart then
                local screenPosition, onScreen = Camera:WorldToViewportPoint(bodyPart.Position)

                if onScreen then
                    local playerPosition = bodyPart.Position - cameraPosition
                    local angle = math.acos(cameraForward:Dot(playerPosition.Unit)) * (180 / math.pi)

                    -- Check if the player is within the FOV
                    if angle <= FieldOfView / 2 then
                        -- Calculate screen distance (distance between mouse and player)
                        local screenDist = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude
                        -- Calculate distance from the center of the screen, but apply the CenterPrioritizationFactor to shrink the circle
                        local distanceFromCenter = (Vector2.new(screenPosition.X, screenPosition.Y) - centerOfScreen).Magnitude * CenterPrioritizationFactor
                        -- Calculate the distance from the local player to the target player
                        local distanceToPlayer = (LocalPlayer.Character.Head.Position - bodyPart.Position).Magnitude

                        -- Combine these factors:
                        -- Prioritize players close to the center and those closer to the local player
                        local weightedScore = screenDist + distanceFromCenter + distanceToPlayer

                        -- Find the closest player based on the combined score
                        if weightedScore < closestDistance then
                            closestDistance = weightedScore
                            closestPlayer = {player = player, bodyPart = targetBodyPartName}
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

-- Function to lock the camera onto the target player's body part
local function lockCameraOnPlayer(targetData)
    if targetData and targetData.player.Character then
        local bodyPart = targetData.player.Character:FindFirstChild(targetData.bodyPart)
        
        if bodyPart then
            LockedPlayer = targetData.player
            LastKnownPosition = bodyPart.Position

            RunService:BindToRenderStep("LockCamera", Enum.RenderPriority.Camera.Value, function()
                if LockedPlayer and LockedPlayer.Character and isEnemyTeam(LockedPlayer) then
                    local currentBodyPart = LockedPlayer.Character:FindFirstChild(targetData.bodyPart)
                    
                    if currentBodyPart then
                        local targetPosition = currentBodyPart.Position

                        -- Check if the player has moved more than 5 meters
                        if (targetPosition - LastKnownPosition).Magnitude > 5 then
                            -- Stop tracking if the player has teleported more than 5 meters
                            RunService:UnbindFromRenderStep("LockCamera")
                            LockedPlayer = nil
                            LastKnownPosition = nil
                            return
                        end

                        -- Update the last known position
                        LastKnownPosition = targetPosition

                        -- Lock the camera onto the player's body part
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                    else
                        RunService:UnbindFromRenderStep("LockCamera")
                        LockedPlayer = nil
                        LastKnownPosition = nil
                    end
                else
                    RunService:UnbindFromRenderStep("LockCamera")
                    LockedPlayer = nil
                    LastKnownPosition = nil
                end
            end)
        end
    end
end

-- Rayfield UI Toggle for Aimbot
local Toggle = AimTab:CreateToggle({
    Name = "Aimbot (RCLICK)",
    CurrentValue = false,
    Flag = "AIM1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        -- The function that takes place when the toggle is pressed
        AimbotEnabled = Value
        if not AimbotEnabled then
            -- Stop tracking if the aimbot is disabled
            RunService:UnbindFromRenderStep("LockCamera")
            LockedPlayer = nil
            LastKnownPosition = nil
        end
    end,
})

-- Detect right-click and lock onto the closest enemy player within FOV, only if Aimbot is enabled
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotEnabled then
        local closestPlayer = getClosestEnemyPlayerToCrosshair()
        lockCameraOnPlayer(closestPlayer)
    end
end)

-- Stop locking the camera when right-click is released
UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RunService:UnbindFromRenderStep("LockCamera")
        LockedPlayer = nil
        LastKnownPosition = nil
    end
end)

-- This next part is for silent aim, you can modify the vectors to change how good the silent aim is
-- Function to get the Players service name dynamically
local function getPlayersName()
    for i, v in pairs(game:GetChildren()) do
        if v.ClassName == "Players" then
            return v.Name
        end
    end
end

local playersService = getPlayersName()
local localPlayer = game[playersService].LocalPlayer

-- Global variables to control the script
local isModificationEnabled = false
local modificationCoroutine = nil

-- Function to modify player character parts
local function modifyPlayerParts()
    while isModificationEnabled do
        for _, v in pairs(game[playersService]:GetPlayers()) do
            if v.Name ~= localPlayer.Name and v.Character then
                local parts = {
                    "RightUpperLeg", 
                    "LeftUpperLeg", 
                    "HeadHB", 
                    "HumanoidRootPart"
                }
                
                for _, partName in ipairs(parts) do
                    local part = v.Character:FindFirstChild(partName)
                    if part then
                        part.CanCollide = false
                        part.Transparency = 10
                        part.Size = Vector3.new(10, 10, 10)
                    end
                end
            end
        end
        wait(1)  -- Wait for 1 second before next iteration
    end
    
    -- Reset parts when modification is disabled
    for _, v in pairs(game[playersService]:GetPlayers()) do
        if v.Name ~= localPlayer.Name and v.Character then
            local parts = {
                "RightUpperLeg", 
                "LeftUpperLeg", 
                "HeadHB", 
                "HumanoidRootPart"
            }
            
            for _, partName in ipairs(parts) do
                local part = v.Character:FindFirstChild(partName)
                if part then
                    part.CanCollide = true
                    part.Transparency = 0
                    part.Size = Vector3.new(1, 1, 1)
                end
            end
        end
    end
end

-- Create Toggle for Player Part Modification
local Toggle = AimTab:CreateToggle({
    Name = "silent aim",
    CurrentValue = false,
    Flag = "PlayerPartModification",
    Callback = function(Value)
        isModificationEnabled = Value
        
        if Value then
            -- Start the modification coroutine
            modificationCoroutine = coroutine.create(modifyPlayerParts)
            coroutine.resume(modificationCoroutine)
        else
            -- If the coroutine is running, it will exit due to isModificationEnabled being false
            modificationCoroutine = nil
        end
    end,
})


local Toggle = AimTab:CreateToggle({
    Name = "TriggerBot",
    CurrentValue = false,
    Flag = "EnemyAutoClickToggle",
    Callback = function(Value)
        if Value then
            -- Activate auto-click
            getgenv().AutoClickConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local Mouse = LocalPlayer:GetMouse()

                if Mouse.Target and Mouse.Target.Parent then
                    local TargetPlayer = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
                    
                    if TargetPlayer and TargetPlayer ~= LocalPlayer then
                        if not TargetPlayer.Team or TargetPlayer.Team ~= LocalPlayer.Team then
                            mouse1press()
                            wait()
                            mouse1release()
                        end
                    end
                end
            end)
        else
            -- Deactivate auto-click
            if getgenv().AutoClickConnection then
                getgenv().AutoClickConnection:Disconnect()
            end
        end
    end
})

local ModsTab = Window:CreateTab("Gun Mods", 4483362458) -- Title, Image
local ModsSection = ModsTab:CreateSection("Gun Mods")

local Toggle = ModsTab:CreateButton({
    Name = "Infinite ammo (arsenal)",
    Callback = function(Value)
for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
for i,c in next, v:GetChildren() do -- for some reason, using GetDescendants dsent let you modify weapon ammo, so I do this instead
for i,x in next, getconnections(c.Changed) do
x:Disable() -- probably not needed
end
if c.Name == "Ammo" or c.Name == "StoredAmmo" then
c.Value = 300 -- don't set this above 300 or else your guns wont work
end
end
end
    end,
})

local Toggle = ModsTab:CreateButton({
    Name = "Infinite range (arsenal)",
    Callback = function(Value)
for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
for i,c in next, v:GetChildren() do -- for some reason, using GetDescendants dsent let you modify weapon ammo, so I do this instead
for i,x in next, getconnections(c.Changed) do
x:Disable() -- probably not needed
end
if c.Name == "Range" then
c.Value = 9e9
end
end
end
    end,
})


local Toggle = ModsTab:CreateButton({
    Name = "100% accuracy (arsenal)",
    Callback = function(Value)
for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
for i,c in next, v:GetChildren() do -- for some reason, using GetDescendants dsent let you modify weapon ammo, so I do this instead
for i,x in next, getconnections(c.Changed) do
x:Disable() -- probably not needed
end
if c.Name == "AReload" or c.Name == "RecoilControl" or c.Name == "EReload" or c.Name == "SReload" or c.Name == "ReloadTime" or c.Name == "EquipTime" or c.Name == "Spread" or c.Name == "MaxSpread" then
c.Value = 0
end
end
end
    end,
})

local Toggle = ModsTab:CreateButton({
    Name = "fire rate (arsenal)",
    Callback = function(Value)
for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
for i,c in next, v:GetChildren() do -- for some reason, using GetDescendants dsent let you modify weapon ammo, so I do this instead
for i,x in next, getconnections(c.Changed) do
x:Disable() -- probably not needed
end
if c.Name == "FireRate" or c.Name == "BFireRate" then
c.Value = 0.02 -- don't set this lower than 0.02 or else your game will crash
end
end
end
    end,
})


local Toggle = ModsTab:CreateButton({
    Name = "All Weapons Automatic (Arsenal)",
    Callback = function()
        for _, weapon in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
            for _, child in pairs(weapon:GetChildren()) do
                if child:IsA("ModuleScript") then
                    local weaponData = require(child)
                    if weaponData.Auto == false then
                        weaponData.Auto = true -- Make the weapon automatic
                    end
                end
            end
        end
    end
})

print("Script Loaded Successfully") -- Add this at the end of your script
