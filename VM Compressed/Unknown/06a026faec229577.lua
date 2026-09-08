-- this took forever and sucks its still in beta but heres it anyway
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Hide or Die Exploits",
    LoadingTitle = "Hide or Die Exploits",
    LoadingSubtitle = "by Fever Dream",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "HideOrDieConfig",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

-- Tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local VisualTab = Window:CreateTab("Visuals", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)

-- Sections
local StealthSection = MainTab:CreateSection("Stealth Controls")
local ESPSection = VisualTab:CreateSection("ESP Controls")
local AimbotSection = CombatTab:CreateSection("Aimbot Controls")
local KillerSection = CombatTab:CreateSection("Killer Controls")

-- Player role detection system
local playerRoles = {}

-- Create detection part for all players
local function createDetectionPart(player)
    local detectionPart = Instance.new("Part")
    detectionPart.Name = "VOIDAUTO000"
    detectionPart.Transparency = 1
    detectionPart.CanCollide = false
    detectionPart.Anchored = true
    detectionPart.Size = Vector3.new(0.1, 0.1, 0.1)
    
    -- Set a unique attribute to identify this part
    detectionPart:SetAttribute("DetectionPart", true)
    
    -- Try to parent to character if it exists
    if player.Character then
        detectionPart.Parent = player.Character
    end
    
    -- Handle character added/removed
    player.CharacterAdded:Connect(function(character)
        detectionPart.Parent = character
    end)
    
    return detectionPart
end

-- Initialize detection for all players
for _, player in pairs(game.Players:GetPlayers()) do
    createDetectionPart(player)
    playerRoles[player.UserId] = "Unknown"
end

-- Handle new players joining
game.Players.PlayerAdded:Connect(function(player)
    createDetectionPart(player)
    playerRoles[player.UserId] = "Unknown"
end)

-- Handle players leaving
game.Players.PlayerRemoving:Connect(function(player)
    playerRoles[player.UserId] = nil
end)

-- Role detection system
local function startRoleDetection()
    local roundStartTime = tick()
    
    -- Check inventory for all players
    local function checkInventories()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local hasItems = false
                
                -- Check if player has any tools in backpack or equipped
                if #player.Backpack:GetChildren() > 0 then
                    hasItems = true
                end
                
                -- Check if player has any equipped tools
                for _, item in pairs(player.Character:GetChildren()) do
                    if item:IsA("Tool") then
                        hasItems = true
                        break
                    end
                end
                
                -- Determine role based on items
                if hasItems then
                    playerRoles[player.UserId] = "Seeker"
                elseif (tick() - roundStartTime) > 60 and playerRoles[player.UserId] == "Unknown" then
                    -- If no items after 1 minute, mark as hider
                    playerRoles[player.UserId] = "Hider"
                end
            end
        end
    end
    
    -- Run the check periodically
    spawn(function()
        while wait(1) do
            checkInventories()
        end
    end)
end

-- Start role detection when the game loads
startRoleDetection()

-- Function to get player role
local function getPlayerRole(player)
    return playerRoles[player.UserId] or "Unknown"
end

-- Stealth Win Function with Enhanced Anti-Detection
local safeSpot = nil

local function createSafeSpot()
    if safeSpot then
        safeSpot:Destroy()
    end
    
    -- Create platform far away and deeper underground
    safeSpot = Instance.new("Part")
    safeSpot.Name = math.random() -- Random name to avoid detection
    safeSpot.Size = Vector3.new(15, 1, 15) -- Slightly larger platform
    safeSpot.Anchored = true
    safeSpot.CanCollide = true
    safeSpot.Transparency = 1 -- Fully invisible
    safeSpot.Position = Vector3.new(math.random(2000, 3000), -150, math.random(2000, 3000)) -- Random far position
    safeSpot.Material = Enum.Material.ForceField -- Less detectable material
    safeSpot.Parent = workspace
    
    -- Add camouflaged walls
    local walls = {
        {Size = Vector3.new(1, 15, 15), Position = Vector3.new(7.5, 7.5, 0)},
        {Size = Vector3.new(1, 15, 15), Position = Vector3.new(-7.5, 7.5, 0)},
        {Size = Vector3.new(15, 15, 1), Position = Vector3.new(0, 7.5, 7.5)},
        {Size = Vector3.new(15, 15, 1), Position = Vector3.new(0, 7.5, -7.5)},
        {Size = Vector3.new(15, 1, 15), Position = Vector3.new(0, 15, 0)} -- Ceiling
    }
    
    for _, wallData in ipairs(walls) do
        local wall = Instance.new("Part")
        wall.Size = wallData.Size
        wall.Position = safeSpot.Position + wallData.Position
        wall.Anchored = true
        wall.CanCollide = true
        wall.Transparency = 1
        wall.Material = Enum.Material.ForceField
        wall.Parent = safeSpot
    end
end

-- Enhanced Teleport Function
local function teleportToSafeSpot()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and safeSpot then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoidRootPart and humanoid then
            -- Store original properties
            local originalCFrame = humanoidRootPart.CFrame
            local originalWalkSpeed = humanoid.WalkSpeed
            local originalJumpPower = humanoid.JumpPower
            
            -- Make character temporarily invisible
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
            
            -- Disable character animations
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
            
            -- Random intermediate points for non-linear teleportation
            local points = {
                Vector3.new(math.random(-1000, 1000), math.random(500, 1000), math.random(-1000, 1000)),
                Vector3.new(math.random(-1500, 1500), math.random(300, 800), math.random(-1500, 1500)),
                safeSpot.Position + Vector3.new(0, 5, 0)
            }
            
            -- Teleport through random points with varying speeds
            for _, point in ipairs(points) do
                local steps = math.random(30, 40)
                local startPos = humanoidRootPart.Position
                local endPos = point
                
                for i = 1, steps do
                    -- Non-linear interpolation
                    local alpha = math.sin((i/steps) * math.pi/2)
                    local newPos = startPos:Lerp(endPos, alpha)
                    
                    -- Add random noise to path
                    local noise = Vector3.new(
                        math.random(-2, 2),
                        math.random(-2, 2),
                        math.random(-2, 2)
                    ) * 0.05
                    
                    humanoidRootPart.CFrame = CFrame.new(newPos + noise)
                    task.wait(math.random(1, 3)/100) -- Randomized micro-delays
                end
                
                task.wait(math.random(10, 20)/100) -- Random delay between points
            end
            
            -- Anchor character in place (simulate being locked in as a hider)
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = true
                end
            end
            
            -- Disable movement controls
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            
            -- Re-enable character animations
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
            
            -- Gradually restore visibility but keep transparency at 0.8 to remain somewhat hidden
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 0.8
                end
            end
        end
    end
end

-- Function to unanchor character and return to normal
local function unanchorCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            -- Restore movement
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
            
            -- Unanchor all parts
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                end
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 0
                end
            end
        end
    end
end

-- ESP Function
local ESPEnabled = false
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESPFolder"
ESPFolder.Parent = game.CoreGui

local function CreateHighlight(model, color)
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP"
    highlight.Parent = ESPFolder
    highlight.Adornee = model
    highlight.FillColor = color or Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = color or Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.7
    highlight.OutlineTransparency = 0
    return highlight
end

local function ApplyESP()
    -- ESP for players only (red)
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player ~= game.Players.LocalPlayer then
            local role = getPlayerRole(player)
            local color = Color3.fromRGB(255, 0, 0) -- Default red
            
            if role == "Hider" then
                color = Color3.fromRGB(0, 255, 0) -- Green for hiders
            elseif role == "Seeker" then
                color = Color3.fromRGB(255, 0, 0) -- Red for seekers
            end
            
            CreateHighlight(player.Character, color)
        end
    end
end

local function ClearESP()
    ESPFolder:ClearAllChildren()
end

-- Aimbot Function
local AimbotEnabled = false
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function GetNearestHider()
    local nearestPlayer = nil
    local minDistance = math.huge
    local localPlayer = game.Players.LocalPlayer
    local localCharacter = localPlayer.Character
    if not localCharacter then return nil end
    local localRoot = localCharacter:FindFirstChild("HumanoidRootPart")
    if not localRoot then return nil end

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer then
            local character = player.Character
            if character then
                -- Use our role detection system
                local isHider = getPlayerRole(player) == "Hider"
                
                if isHider then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        local distance = (humanoidRootPart.Position - localRoot.Position).Magnitude
                        if distance < minDistance then
                            minDistance = distance
                            nearestPlayer = player
                        end
                    end
                end
            end
        end
    end
    return nearestPlayer
end

-- Auto Kill Function
local function isSeeker()
    -- Use our role detection system
    local player = game.Players.LocalPlayer
    return getPlayerRole(player) == "Seeker" or true -- Always return true as a fallback
end

local function getEquippedWeapon()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return nil end
    
    -- Find any equipped tool
    for _, tool in pairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            return tool
        end
    end
    
    return nil
end

local function isKnife(tool)
    if not tool then return false end
    
    -- Check if the tool is a knife based on name or properties
    if tool.Name:lower():find("knife") or tool.Name:lower():find("blade") or tool.Name:lower():find("dagger") then
        return true
    end
    
    -- Check for melee weapon properties
    if tool:FindFirstChild("MeleeWeapon") or tool:FindFirstChild("Melee") then
        return true
    end
    
    return false
end

local function isGun(tool)
    if not tool then return false end
    
    -- Check if the tool is a gun based on name or properties
    if tool.Name:lower():find("gun") or tool.Name:lower():find("pistol") or tool.Name:lower():find("rifle") or tool.Name:lower():find("shotgun") then
        return true
    end
    
    -- Check for gun properties
    if tool:FindFirstChild("GunScript") or tool:FindFirstChild("Shooter") or tool:FindFirstChild("RangedWeapon") then
        return true
    end
    
    return false
end

local function getAllHiders()
    local hiders = {}
    local localPlayer = game.Players.LocalPlayer
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer then
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
                local humanoid = character:FindFirstChild("Humanoid")
                
                -- Use our role detection system
                local isHider = getPlayerRole(player) == "Hider"
                
                if isHider and humanoid.Health > 0 then
                    table.insert(hiders, player)
                end
            end
        end
    end
    
    return hiders
end

-- Enhanced knife kill method with direct damage application
local function knifeKillMethod(knife, hider)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not knife then return false end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return false end
    
    local hiderCharacter = hider.Character
    if not hiderCharacter then return false end
    
    local hiderTorso = hiderCharacter:FindFirstChild("Torso") or hiderCharacter:FindFirstChild("UpperTorso")
    local hiderHumanoid = hiderCharacter:FindFirstChild("Humanoid")
    local hiderRoot = hiderCharacter:FindFirstChild("HumanoidRootPart")
    
    if not hiderTorso or not hiderHumanoid or not hiderRoot or hiderHumanoid.Health <= 0 then return false end
    
    -- Store original position
    local originalPosition = humanoidRootPart.CFrame
    
    -- Teleport inside the hider's torso
    humanoidRootPart.CFrame = hiderTorso.CFrame
    
    -- Try to find damage remotes in the knife
    local damageRemotes = {}
    for _, obj in pairs(knife:GetDescendants()) do
        if obj:IsA("RemoteEvent") and (obj.Name:lower():find("damage") or obj.Name:lower():find("hit") or obj.Name:lower():find("attack")) then
            table.insert(damageRemotes, obj)
        end
    end
    
    -- Try to find game damage handler
    local gameRemotes = {}
    for _, obj in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if obj:IsA("RemoteEvent") and (obj.Name:lower():find("damage") or obj.Name:lower():find("hit") or obj.Name:lower():find("kill")) then
            table.insert(gameRemotes, obj)
        end
    end
    
    -- Stab repeatedly and try multiple damage methods
    local startTime = tick()
    while hiderHumanoid.Health > 0 and (tick() - startTime) < 5 do -- 5 second timeout
        -- Method 1: Normal knife activation
        knife:Activate()
        
        -- Method 2: Try to fire all potential damage remotes in the knife
        for _, remote in ipairs(damageRemotes) do
            pcall(function()
                remote:FireServer(hiderCharacter)
                remote:FireServer(hiderHumanoid)
                remote:FireServer(hiderRoot)
                remote:FireServer(hiderTorso)
                remote:FireServer(hiderRoot.Position)
            end)
        end
        
        -- Method 3: Try to fire game damage remotes
        for _, remote in ipairs(gameRemotes) do
            pcall(function()
                remote:FireServer(hiderCharacter)
                remote:FireServer(hiderHumanoid)
                remote:FireServer(hiderRoot)
                remote:FireServer(hiderTorso)
                remote:FireServer(hiderRoot.Position)
                remote:FireServer(player, hiderCharacter)
                remote:FireServer(knife, hiderCharacter)
            end)
        end
        
        -- Method 4: Direct damage (may not work due to server authority)
        pcall(function()
            hiderHumanoid:TakeDamage(100)
        end)
        
        -- Method 5: Try to find and call the knife's damage function
        for _, obj in pairs(knife:GetDescendants()) do
            if obj:IsA("ModuleScript") or obj:IsA("LocalScript") then
                pcall(function()
                    local success, module = pcall(require, obj)
                    if success and type(module) == "table" then
                        if module.Damage then
                            module.Damage(hiderCharacter)
                        end
                        if module.Hit then
                            module.Hit(hiderCharacter)
                        end
                        if module.Attack then
                            module.Attack(hiderCharacter)
                        end
                    end
                end)
            end
        end
        
        -- Ensure we stay inside their torso
        humanoidRootPart.CFrame = hiderTorso.CFrame
        task.wait(0.1)
    end
    
    -- Check if kill was successful
    if hiderHumanoid.Health <= 0 then
        return true
    else
        -- Return to original position if failed
        humanoidRootPart.CFrame = originalPosition
        return false
    end
end

-- Enhanced gun kill method with direct hit registration
local function gunKillMethod(gun, hider)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not gun then return false end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return false end
    
    local hiderCharacter = hider.Character
    if not hiderCharacter then return false end
    
    local hiderRoot = hiderCharacter:FindFirstChild("HumanoidRootPart")
    local hiderHumanoid = hiderCharacter:FindFirstChild("Humanoid")
    local hiderHead = hiderCharacter:FindFirstChild("Head")
    
    if not hiderRoot or not hiderHumanoid or not hiderHead or hiderHumanoid.Health <= 0 then return false end
    
    -- Store original position
    local originalPosition = humanoidRootPart.CFrame
    
    -- Find all potential gun remotes
    local gunRemotes = {}
    for _, obj in pairs(gun:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            table.insert(gunRemotes, obj)
        end
    end
    
    -- Find game damage remotes
    local gameRemotes = {}
    for _, obj in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if obj:IsA("RemoteEvent") and (obj.Name:lower():find("damage") or obj.Name:lower():find("hit") or obj.Name:lower():find("bullet")) then
            table.insert(gameRemotes, obj)
        end
    end
    
    -- Position directly behind target for headshots
    humanoidRootPart.CFrame = CFrame.new(
        hiderHead.Position - (hiderHead.CFrame.LookVector * 3),
        hiderHead.Position
    )
    
    -- Try multiple shooting methods
    local startTime = tick()
    while hiderHumanoid.Health > 0 and (tick() - startTime) < 5 do -- 5 second timeout
        -- Method 1: Normal gun activation
        gun:Activate()
        
        -- Method 2: Try all gun remotes with various arguments
        for _, remote in ipairs(gunRemotes) do
            pcall(function()
                -- Common shooting remote patterns
                remote:FireServer()
                remote:FireServer(hiderCharacter)
                remote:FireServer(hiderHead)
                remote:FireServer(hiderHead.Position)
                
                -- Bullet hit information pattern
                remote:FireServer(hiderHead.Position, hiderHead.Position)
                remote:FireServer(hiderHead.Position, hiderHead)
                
                -- Ray pattern
                remote:FireServer(humanoidRootPart.Position, hiderHead.Position)
                
                -- Complex hit info pattern
                remote:FireServer({
                    Hit = hiderHead,
                    Position = hiderHead.Position,
                    Normal = Vector3.new(0, 1, 0),
                    Material = Enum.Material.Plastic
                })
            end)
        end
        
        -- Method 3: Try game damage remotes
        for _, remote in ipairs(gameRemotes) do
            pcall(function()
                remote:FireServer(hiderCharacter)
                remote:FireServer(hiderHumanoid)
                remote:FireServer(hiderHead)
                remote:FireServer(gun, hiderHead)
                remote:FireServer(gun, hiderHead.Position)
            end)
        end
        
        -- Method 4: Direct damage (may not work due to server authority)
        pcall(function()
            hiderHumanoid:TakeDamage(100)
        end)
        
        -- Reposition for better angle
        local angle = tick() % (2 * math.pi)
        local radius = 3
        local offsetX = math.cos(angle) * radius
        local offsetZ = math.sin(angle) * radius
        
        humanoidRootPart.CFrame = CFrame.new(
            hiderHead.Position + Vector3.new(offsetX, 0.5, offsetZ),
            hiderHead.Position
        )
        
        task.wait(0.1)
    end
    
    -- Check if kill was successful
    if hiderHumanoid.Health <= 0 then
        return true
    else
        -- Return to original position if failed
        humanoidRootPart.CFrame = originalPosition
        return false
    end
end

local function autoKillAll()
    if not isSeeker() then
        Rayfield:Notify({
            Title = "Auto Kill",
            Content = "You must be a seeker to use this feature!",
            Duration = 3,
        })
        return
    end
    
    local weapon = getEquippedWeapon()
    if not weapon then
        Rayfield:Notify({
            Title = "Auto Kill",
            Content = "No weapon found! Make sure you have a weapon equipped.",
            Duration = 3,
        })
        return
    end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Store original position
    local originalPosition = humanoidRootPart.CFrame
    
    -- Get all hiders
    local hiders = getAllHiders()
    
    -- Determine weapon type and use appropriate method
    local isKnifeWeapon = isKnife(weapon)
    local isGunWeapon = isGun(weapon)
    
    if not isKnifeWeapon and not isGunWeapon then
        -- Default to knife method if we can't determine
        isKnifeWeapon = true
    end
    
    local methodName = isKnifeWeapon and "knife" or "gun"
    
    Rayfield:Notify({
        Title = "Auto Kill",
        Content = "Starting auto kill sequence for " .. #hiders .. " hiders using " .. methodName .. " method",
        Duration = 3,
    })
    
    -- Kill each hider one by one
    local killCount = 0
    for _, hider in ipairs(hiders) do
        local success = false
        
        if isKnifeWeapon then
            success = knifeKillMethod(weapon, hider)
        else
            success = gunKillMethod(weapon, hider)
        end
        
        if success then
            killCount = killCount + 1
        end
        
        task.wait(0.5) -- Short delay before moving to next target
    end
    
    -- Return to original position
    humanoidRootPart.CFrame = originalPosition
    
    Rayfield:Notify({
        Title = "Auto Kill",
        Content = "Auto kill sequence completed. Killed " .. killCount .. " out of " .. #hiders .. " hiders.",
        Duration = 3,
    })
end

-- Main Tab - Stealth Controls
local StealthWinButton = MainTab:CreateButton({
    Name = "Activate Stealth Win",
    Callback = function()
        createSafeSpot()
        task.wait(math.random(15, 25)/10) -- Random delay
        teleportToSafeSpot()
        
        Rayfield:Notify({
            Title = "Stealth Win",
            Content = "Teleported to safe spot and anchored! You are now hidden.",
            Duration = 3,
        })
    end,
})

local ReturnButton = MainTab:CreateButton({
    Name = "Return to Map",
    Callback = function()
        unanchorCharacter()
        
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                -- Return through random points
                local points = {
                    Vector3.new(math.random(-1000, 1000), math.random(300, 500), math.random(-1000, 1000)),
                    Vector3.new(0, 100, 0)
                }
                
                for _, point in ipairs(points) do
                    local steps = math.random(30, 40)
                    local startPos = humanoidRootPart.Position
                    local endPos = point
                    
                    for i = 1, steps do
                        local alpha = math.sin((i/steps) * math.pi/2)
                        local newPos = startPos:Lerp(endPos, alpha)
                        
                        local noise = Vector3.new(
                            math.random(-2, 2),
                            math.random(-2, 2),
                            math.random(-2, 2)
                        ) * 0.05
                        
                        humanoidRootPart.CFrame = CFrame.new(newPos + noise)
                        task.wait(math.random(1, 3)/100)
                    end
                    
                    task.wait(math.random(10, 20)/100)
                end
                
                if safeSpot then
                    safeSpot:Destroy()
                    safeSpot = nil
                end
            end
        end
        
        Rayfield:Notify({
            Title = "Stealth Win",
            Content = "Returned to map",
            Duration = 3,
        })
    end,
})

-- Visual Tab - ESP Controls
local ESPToggle = VisualTab:CreateToggle({
    Name = "Toggle ESP",
    CurrentValue = false,
    Flag = "ESPToggle", 
    Callback = function(Value)
        ESPEnabled = Value
        if ESPEnabled then
            ApplyESP()
            
            -- Update ESP when new instances are added
            game:GetService("RunService").RenderStepped:Connect(function()
                if ESPEnabled then
                    ClearESP()
                    ApplyESP()
                end
            end)
        else
            ClearESP()
        end
    end,
})

local ColorPicker = VisualTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ESPColor",
    Callback = function(Value)
        for _, esp in pairs(ESPFolder:GetChildren()) do
            esp.FillColor = Value
            esp.OutlineColor = Value
        end
    end
})

local TransparencySlider = VisualTab:CreateSlider({
    Name = "ESP Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0.7,
    Flag = "ESPTransparency",
    Callback = function(Value)
        for _, esp in pairs(ESPFolder:GetChildren()) do
            esp.FillTransparency = Value
        end
    end,
})

-- Combat Tab - Aimbot Controls
local AimbotToggle = CombatTab:CreateToggle({
    Name = "Toggle Aimbot (Hold G) - Hiders Only",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        AimbotEnabled = Value
        if AimbotEnabled then
            RunService.RenderStepped:Connect(function()
                if UserInputService:IsKeyDown(Enum.KeyCode.G) then
                    local nearestHider = GetNearestHider()
                    if nearestHider and nearestHider.Character then
                        local targetRoot = nearestHider.Character:FindFirstChild("HumanoidRootPart")
                        if targetRoot then
                            local camera = workspace.CurrentCamera
                            camera.CFrame = CFrame.new(camera.CFrame.Position, targetRoot.Position)
                        end
                    end
                end
            end)
        end
    end,
})

-- Combat Tab - Auto Kill Controls
local AutoKillButton = CombatTab:CreateButton({
    Name = "Auto Kill All Hiders",
    Callback = function()
        autoKillAll()
    end,
})
