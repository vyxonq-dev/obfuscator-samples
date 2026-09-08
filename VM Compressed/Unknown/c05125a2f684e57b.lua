--[[
    Arsenal Script - Enhanced Version
    UI: Rayfield
    Features: Aimbot, Silent Aim (Headshot Only), Advanced ESP
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local GameName = "Arsenal"
if game.PlaceId ~= 286090429 then 
    print("This script is only for Arsenal")
    return
end

if _G.AimBotScript then
    _G.AimBotScript:Destroy() 
end

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "Arsenal Script | Enhanced",
    LoadingTitle = "Arsenal Script",
    LoadingSubtitle = "by Enhanced Team",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ArsenalScript",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

-- Configuration Variables
local Config = {
    Aimbot = {
        Enabled = true,
        FOVRadius = 150,
        Smoothing = 0.15,
        ShowFOV = true
    },
    SilentAim = {
        Enabled = false,
        HitboxSize = 25,
        HeadshotOnly = true,
        Transparency = 1  -- Invisible
    },
    Visuals = {
        Skeleton = true,
        SkeletonColor = Color3.fromRGB(255, 0, 0),
        BoxESP = true,
        BoxColor = Color3.fromRGB(255, 0, 0),
        Highlight = true,
        HighlightColor = Color3.fromRGB(255, 0, 0),
        ShowDistance = true,
        ShowName = true
    },
    AutoKill = {
        Enabled = false,
        FollowDistance = 3,  -- Distance behind target
        RotationSpeed = 2,  -- How fast to switch targets
        AutoShoot = true,  -- Auto click to shoot
        ShootDelay = 0.1  -- Delay between shots
    },
}

-- Check for Drawing API
if not Drawing then
    Rayfield:Notify({
        Title = "Error",
        Content = "Drawing API not available!",
        Duration = 5,
        Image = 4483362458
    })
    return
end

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = Config.Aimbot.ShowFOV
FOVCircle.Radius = Config.Aimbot.FOVRadius
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.Transparency = 0.5

-- ESP Storage
local ESPObjects = {}

-- Auto Kill Variables
local AutoKillEnabled = false
local CurrentTargetIndex = 1
local AutoKillLoop = nil
local AutoShootLoop = nil
local EnemyTargets = {}

-- Script Detection
local ScriptID = "ArsenalScript_" .. math.random(10000, 99999)
local DetectedUsers = {}

-- Silent Aim Variables
local SilentAimConnections = {}

-- Silent Aim Functions (Enhanced with Round Reset Support)
local function ApplySilentAimToCharacter(character)
    if not Config.SilentAim.Enabled then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    
    if Config.SilentAim.HeadshotOnly then
        local head = character:FindFirstChild("Head")
        local headHB = character:FindFirstChild("HeadHB")
        
        if head then
            head.Size = Vector3.new(Config.SilentAim.HitboxSize, Config.SilentAim.HitboxSize, Config.SilentAim.HitboxSize)
            head.Transparency = Config.SilentAim.Transparency
            head.CanCollide = false
            head.Massless = true
        end
        
        if headHB then
            headHB.Size = Vector3.new(Config.SilentAim.HitboxSize, Config.SilentAim.HitboxSize, Config.SilentAim.HitboxSize)
            headHB.Transparency = Config.SilentAim.Transparency
            headHB.CanCollide = false
            headHB.Massless = true
        end
    else
        for _, partName in pairs({"Head", "HeadHB", "HumanoidRootPart", "UpperTorso", "Torso"}) do
            local part = character:FindFirstChild(partName)
            if part then
                part.Size = Vector3.new(Config.SilentAim.HitboxSize, Config.SilentAim.HitboxSize, Config.SilentAim.HitboxSize)
                part.Transparency = Config.SilentAim.Transparency
                part.CanCollide = false
                part.Massless = true
            end
        end
    end
end

local function StartSilentAim()
    if SilentAimConnections.Loop then
        SilentAimConnections.Loop:Disconnect()
    end
    
    SilentAimConnections.Loop = RunService.Heartbeat:Connect(function()
        if not Config.SilentAim.Enabled then return end
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Team ~= LocalPlayer.Team then
                ApplySilentAimToCharacter(player.Character)
            end
        end
    end)
end

local function StopSilentAim()
    if SilentAimConnections.Loop then
        SilentAimConnections.Loop:Disconnect()
        SilentAimConnections.Loop = nil
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            local headHB = player.Character:FindFirstChild("HeadHB")
            
            if head then
                head.Size = Vector3.new(2, 1, 1)
                head.Transparency = 0
                head.CanCollide = false
            end
            
            if headHB then
                headHB.Size = Vector3.new(2, 1, 1)
                headHB.Transparency = 0
                headHB.CanCollide = false
            end
        end
    end
end

-- Setup character respawn handler for silent aim
local function SetupCharacterRespawn(player)
    player.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        
        if Config.SilentAim.Enabled and player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
            ApplySilentAimToCharacter(character)
        end
    end)
end

-- ESP Functions
local function CreateESP(player)
    if ESPObjects[player] or player == LocalPlayer then return end
    
    local esp = {
        Drawings = {},
        Highlight = nil
    }
    
    -- Skeleton Lines
    esp.Drawings.Head = Drawing.new("Line")
    esp.Drawings.Torso = Drawing.new("Line")
    esp.Drawings.LeftArm = Drawing.new("Line")
    esp.Drawings.RightArm = Drawing.new("Line")
    esp.Drawings.LeftLeg = Drawing.new("Line")
    esp.Drawings.RightLeg = Drawing.new("Line")
    
    -- Box ESP
    esp.Drawings.BoxTopLeft = Drawing.new("Line")
    esp.Drawings.BoxTopRight = Drawing.new("Line")
    esp.Drawings.BoxBottomLeft = Drawing.new("Line")
    esp.Drawings.BoxBottomRight = Drawing.new("Line")
    
    -- Name text
    esp.Drawings.Name = Drawing.new("Text")
    esp.Drawings.Name.Size = 14
    esp.Drawings.Name.Center = true
    esp.Drawings.Name.Outline = true
    esp.Drawings.Name.Color = Color3.fromRGB(255, 255, 255)
    esp.Drawings.Name.Text = player.Name
    
    -- Distance text
    esp.Drawings.Distance = Drawing.new("Text")
    esp.Drawings.Distance.Size = 14
    esp.Drawings.Distance.Center = true
    esp.Drawings.Distance.Outline = true
    esp.Drawings.Distance.Color = Color3.fromRGB(255, 255, 255)
    
    -- Configure all skeleton lines
    for name, line in pairs(esp.Drawings) do
        if name:find("Arm") or name:find("Leg") or name == "Torso" or name == "Head" then
            line.Color = Config.Visuals.SkeletonColor
            line.Thickness = 2
            line.Visible = false
        elseif name:find("Box") then
            line.Color = Config.Visuals.BoxColor
            line.Thickness = 2
            line.Visible = false
        end
    end
    
    -- Create Highlight
    if player.Character then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Config.Visuals.HighlightColor
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Parent = player.Character
        highlight.Enabled = Config.Visuals.Highlight
        esp.Highlight = highlight
    end
    
    ESPObjects[player] = esp
end

local function RemoveESP(player)
    if not ESPObjects[player] then return end
    
    for _, obj in pairs(ESPObjects[player].Drawings) do
        obj:Remove()
    end
    
    if ESPObjects[player].Highlight then
        ESPObjects[player].Highlight:Destroy()
    end
    
    ESPObjects[player] = nil
end

local function UpdateESP()
    for player, esp in pairs(ESPObjects) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Team ~= LocalPlayer.Team then
            local hrp = player.Character.HumanoidRootPart
            local head = player.Character:FindFirstChild("Head")
            local humanoid = player.Character:FindFirstChild("Humanoid")
            
            -- Update highlight
            if Config.Visuals.Highlight and esp.Highlight then
                esp.Highlight.Enabled = true
                esp.Highlight.FillColor = Config.Visuals.HighlightColor
            elseif esp.Highlight then
                esp.Highlight.Enabled = false
            end
            
            if head and humanoid and humanoid.Health > 0 then
                local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                local hrpPos = Camera:WorldToViewportPoint(hrp.Position)
                
                if onScreen then
                    local distance = (head.Position - Camera.CFrame.Position).Magnitude
                    
                    -- Distance
                    if Config.Visuals.ShowDistance then
                        esp.Drawings.Distance.Text = math.floor(distance) .. "m"
                        esp.Drawings.Distance.Position = Vector2.new(headPos.X, headPos.Y - 40)
                        esp.Drawings.Distance.Visible = true
                    else
                        esp.Drawings.Distance.Visible = false
                    end
                    
                    -- Name
                    if Config.Visuals.ShowName then
                        esp.Drawings.Name.Position = Vector2.new(headPos.X, headPos.Y - 55)
                        esp.Drawings.Name.Visible = true
                    else
                        esp.Drawings.Name.Visible = false
                    end
                    
                    -- Skeleton
                    if Config.Visuals.Skeleton then
                        esp.Drawings.Head.From = Vector2.new(headPos.X, headPos.Y)
                        esp.Drawings.Head.To = Vector2.new(hrpPos.X, hrpPos.Y)
                        esp.Drawings.Head.Visible = true
                        esp.Drawings.Head.Color = Config.Visuals.SkeletonColor
                        
                        -- Arms and legs
                        local leftArm = player.Character:FindFirstChild("Left Arm") or player.Character:FindFirstChild("LeftUpperArm")
                        local rightArm = player.Character:FindFirstChild("Right Arm") or player.Character:FindFirstChild("RightUpperArm")
                        local leftLeg = player.Character:FindFirstChild("Left Leg") or player.Character:FindFirstChild("LeftUpperLeg")
                        local rightLeg = player.Character:FindFirstChild("Right Leg") or player.Character:FindFirstChild("RightUpperLeg")
                        
                        if leftArm then
                            local armPos = Camera:WorldToViewportPoint(leftArm.Position)
                            esp.Drawings.LeftArm.From = Vector2.new(hrpPos.X, hrpPos.Y)
                            esp.Drawings.LeftArm.To = Vector2.new(armPos.X, armPos.Y)
                            esp.Drawings.LeftArm.Visible = true
                            esp.Drawings.LeftArm.Color = Config.Visuals.SkeletonColor
                        else
                            esp.Drawings.LeftArm.Visible = false
                        end
                        
                        if rightArm then
                            local armPos = Camera:WorldToViewportPoint(rightArm.Position)
                            esp.Drawings.RightArm.From = Vector2.new(hrpPos.X, hrpPos.Y)
                            esp.Drawings.RightArm.To = Vector2.new(armPos.X, armPos.Y)
                            esp.Drawings.RightArm.Visible = true
                            esp.Drawings.RightArm.Color = Config.Visuals.SkeletonColor
                        else
                            esp.Drawings.RightArm.Visible = false
                        end
                        
                        if leftLeg then
                            local legPos = Camera:WorldToViewportPoint(leftLeg.Position)
                            esp.Drawings.LeftLeg.From = Vector2.new(hrpPos.X, hrpPos.Y)
                            esp.Drawings.LeftLeg.To = Vector2.new(legPos.X, legPos.Y)
                            esp.Drawings.LeftLeg.Visible = true
                            esp.Drawings.LeftLeg.Color = Config.Visuals.SkeletonColor
                        else
                            esp.Drawings.LeftLeg.Visible = false
                        end
                        
                        if rightLeg then
                            local legPos = Camera:WorldToViewportPoint(rightLeg.Position)
                            esp.Drawings.RightLeg.From = Vector2.new(hrpPos.X, hrpPos.Y)
                            esp.Drawings.RightLeg.To = Vector2.new(legPos.X, legPos.Y)
                            esp.Drawings.RightLeg.Visible = true
                            esp.Drawings.RightLeg.Color = Config.Visuals.SkeletonColor
                        else
                            esp.Drawings.RightLeg.Visible = false
                        end
                    else
                        esp.Drawings.Head.Visible = false
                        esp.Drawings.Torso.Visible = false
                        esp.Drawings.LeftArm.Visible = false
                        esp.Drawings.RightArm.Visible = false
                        esp.Drawings.LeftLeg.Visible = false
                        esp.Drawings.RightLeg.Visible = false
                    end
                    
                    -- Box ESP
                    if Config.Visuals.BoxESP then
                        local headY = headPos.Y
                        local rootY = hrpPos.Y
                        local height = math.abs(headY - rootY) * 2
                        local width = height / 2
                        
                        local topLeft = Vector2.new(hrpPos.X - width/2, headY - 10)
                        local topRight = Vector2.new(hrpPos.X + width/2, headY - 10)
                        local bottomLeft = Vector2.new(hrpPos.X - width/2, rootY + height/2)
                        local bottomRight = Vector2.new(hrpPos.X + width/2, rootY + height/2)
                        
                        esp.Drawings.BoxTopLeft.From = topLeft
                        esp.Drawings.BoxTopLeft.To = topRight
                        esp.Drawings.BoxTopLeft.Visible = true
                        esp.Drawings.BoxTopLeft.Color = Config.Visuals.BoxColor
                        
                        esp.Drawings.BoxTopRight.From = topRight
                        esp.Drawings.BoxTopRight.To = bottomRight
                        esp.Drawings.BoxTopRight.Visible = true
                        esp.Drawings.BoxTopRight.Color = Config.Visuals.BoxColor
                        
                        esp.Drawings.BoxBottomLeft.From = bottomLeft
                        esp.Drawings.BoxBottomLeft.To = bottomRight
                        esp.Drawings.BoxBottomLeft.Visible = true
                        esp.Drawings.BoxBottomLeft.Color = Config.Visuals.BoxColor
                        
                        esp.Drawings.BoxBottomRight.From = topLeft
                        esp.Drawings.BoxBottomRight.To = bottomLeft
                        esp.Drawings.BoxBottomRight.Visible = true
                        esp.Drawings.BoxBottomRight.Color = Config.Visuals.BoxColor
                    else
                        esp.Drawings.BoxTopLeft.Visible = false
                        esp.Drawings.BoxTopRight.Visible = false
                        esp.Drawings.BoxBottomLeft.Visible = false
                        esp.Drawings.BoxBottomRight.Visible = false
                    end
                else
                    for _, obj in pairs(esp.Drawings) do
                        obj.Visible = false
                    end
                end
            else
                for _, obj in pairs(esp.Drawings) do
                    obj.Visible = false
                end
            end
        else
            for _, obj in pairs(esp.Drawings) do
                obj.Visible = false
            end
            if esp.Highlight then
                esp.Highlight.Enabled = false
            end
        end
    end
end

-- Aimbot Functions
local function GetClosestPlayer()
    local closest = nil
    local shortestDistance = math.huge
    local centerScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") and player.Team ~= LocalPlayer.Team then
            local head = player.Character.Head
            local humanoid = player.Character:FindFirstChild("Humanoid")
            
            if humanoid and humanoid.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                
                if onScreen then
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - centerScreen).Magnitude
                    
                    if distance <= Config.Aimbot.FOVRadius and distance < shortestDistance then
                        closest = player
                        shortestDistance = distance
                    end
                end
            end
        end
    end
    
    return closest
end

local function RunAimbot()
    if not Config.Aimbot.Enabled then return end
    
    local target = GetClosestPlayer()
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local targetPos = target.Character.Head.Position
        local currentCFrame = Camera.CFrame
        local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
        
        Camera.CFrame = currentCFrame:Lerp(targetCFrame, Config.Aimbot.Smoothing)
    end
end

-- Auto Kill All Functions
local function GetAliveEnemies()
    local enemies = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Team ~= LocalPlayer.Team then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoid and humanoid.Health > 0 and hrp then
                table.insert(enemies, player)
            end
        end
    end
    return enemies
end

local function FollowTarget(target)
    if not target or not target.Character or not LocalPlayer.Character then
        return false
    end
    
    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    
    if not targetHRP or not myHRP or not myHumanoid then
        return false
    end
    
    local targetHumanoid = target.Character:FindFirstChild("Humanoid")
    if not targetHumanoid or targetHumanoid.Health <= 0 then
        return false
    end
    
    -- Calculate position behind target
    local targetCFrame = targetHRP.CFrame
    local behindOffset = targetCFrame.LookVector * -Config.AutoKill.FollowDistance
    local followPosition = targetCFrame.Position + behindOffset + Vector3.new(0, 0, 0)
    
    -- Teleport behind target
    myHRP.CFrame = CFrame.new(followPosition, targetHRP.Position)
    
    -- Aim at target's head
    local targetHead = target.Character:FindFirstChild("Head")
    if targetHead then
        local headPosition = targetHead.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, headPosition)
    end
    
    return true
end

local function AutoShoot()
    if not Config.AutoKill.AutoShoot then return end
    
    -- Simulate mouse click
    mouse1press()
    task.wait(0.05)
    mouse1release()
end

local function StartAutoKill()
    if AutoKillLoop then
        AutoKillLoop:Disconnect()
    end
    if AutoShootLoop then
        AutoShootLoop:Disconnect()
    end
    
    AutoKillEnabled = true
    CurrentTargetIndex = 1
    
    -- Enable silent aim for guaranteed kills
    if not Config.SilentAim.Enabled then
        Config.SilentAim.Enabled = true
        Config.SilentAim.HitboxSize = 30
        StartSilentAim()
    end
    
    -- Main follow loop
    AutoKillLoop = RunService.Heartbeat:Connect(function()
        if not AutoKillEnabled then return end
        
        EnemyTargets = GetAliveEnemies()
        
        if #EnemyTargets == 0 then
            Rayfield:Notify({
                Title = "Auto Kill All",
                Content = "All enemies eliminated!",
                Duration = 3,
                Image = 4483362458
            })
            return
        end
        
        -- Wrap around if we've gone through all targets
        if CurrentTargetIndex > #EnemyTargets then
            CurrentTargetIndex = 1
        end
        
        local currentTarget = EnemyTargets[CurrentTargetIndex]
        
        -- Follow current target
        local success = FollowTarget(currentTarget)
        
        -- If target died or invalid, move to next
        if not success then
            CurrentTargetIndex = CurrentTargetIndex + 1
        end
    end)
    
    -- Auto shoot loop
    AutoShootLoop = RunService.Heartbeat:Connect(function()
        if not AutoKillEnabled or not Config.AutoKill.AutoShoot then return end
        
        if #EnemyTargets > 0 then
            AutoShoot()
            task.wait(Config.AutoKill.ShootDelay)
        end
    end)
    
    -- Target rotation timer
    spawn(function()
        while AutoKillEnabled do
            wait(Config.AutoKill.RotationSpeed)
            
            EnemyTargets = GetAliveEnemies()
            
            if #EnemyTargets > 0 then
                CurrentTargetIndex = CurrentTargetIndex + 1
                if CurrentTargetIndex > #EnemyTargets then
                    CurrentTargetIndex = 1
                end
            end
        end
    end)
    
    Rayfield:Notify({
        Title = "Auto Kill All",
        Content = "Following and eliminating enemies!",
        Duration = 3,
        Image = 4483362458
    })
end

local function StopAutoKill()
    AutoKillEnabled = false
    
    if AutoKillLoop then
        AutoKillLoop:Disconnect()
        AutoKillLoop = nil
    end
    
    if AutoShootLoop then
        AutoShootLoop:Disconnect()
        AutoShootLoop = nil
    end
    
    CurrentTargetIndex = 1
    EnemyTargets = {}
    
    Rayfield:Notify({
        Title = "Auto Kill All",
        Content = "Auto Kill disabled",
        Duration = 3,
        Image = 4483362458
    })
end

-- User Detection
local function AnnouncePresence()
    if not _G.ArsenalScriptUsers then
        _G.ArsenalScriptUsers = {}
    end
    _G.ArsenalScriptUsers[LocalPlayer.Name] = {
        id = ScriptID,
        time = tick()
    }
end

local function RefreshUsers()
    if not _G.ArsenalScriptUsers then return end
    
    DetectedUsers = {}
    local currentTime = tick()
    
    for name, data in pairs(_G.ArsenalScriptUsers) do
        if currentTime - data.time < 10 and name ~= LocalPlayer.Name then
            table.insert(DetectedUsers, name)
        end
    end
end

-- Create Tabs
local AimbotTab = Window:CreateTab("Aimbot", 4483362458)
local SilentAimTab = Window:CreateTab("Silent Aim", 4483362458)
local AutoKillTab = Window:CreateTab("Auto Kill All", 4483362458)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local DetectionTab = Window:CreateTab("Detection", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- Aimbot Tab
local AimbotSection = AimbotTab:CreateSection("Aimbot Settings")

AimbotTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = Config.Aimbot.Enabled,
    Callback = function(value)
        Config.Aimbot.Enabled = value
        Rayfield:Notify({
            Title = "Aimbot",
            Content = "Aimbot " .. (value and "enabled" or "disabled"),
            Duration = 2
        })
    end
})

AimbotTab:CreateSlider({
    Name = "FOV Size",
    Range = {50, 500},
    Increment = 10,
    CurrentValue = Config.Aimbot.FOVRadius,
    Callback = function(value)
        Config.Aimbot.FOVRadius = value
        FOVCircle.Radius = value
    end
})

AimbotTab:CreateSlider({
    Name = "Smoothing",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = Config.Aimbot.Smoothing * 100,
    Callback = function(value)
        Config.Aimbot.Smoothing = value / 100
    end
})

AimbotTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = Config.Aimbot.ShowFOV,
    Callback = function(value)
        Config.Aimbot.ShowFOV = value
        FOVCircle.Visible = value
    end
})

-- Silent Aim Tab
local SilentSection = SilentAimTab:CreateSection("Silent Aim Settings")

SilentAimTab:CreateToggle({
    Name = "Enable Silent Aim",
    CurrentValue = Config.SilentAim.Enabled,
    Callback = function(value)
        Config.SilentAim.Enabled = value
        if value then
            StartSilentAim()
            Rayfield:Notify({
                Title = "Silent Aim",
                Content = "Silent Aim enabled - Invisible hitboxes",
                Duration = 3
            })
        else
            StopSilentAim()
            Rayfield:Notify({
                Title = "Silent Aim",
                Content = "Silent Aim disabled",
                Duration = 3
            })
        end
    end
})

SilentAimTab:CreateToggle({
    Name = "Headshot Only",
    CurrentValue = Config.SilentAim.HeadshotOnly,
    Callback = function(value)
        Config.SilentAim.HeadshotOnly = value
        Rayfield:Notify({
            Title = "Silent Aim",
            Content = "Headshot Only: " .. (value and "ON" or "OFF"),
            Duration = 2
        })
    end
})

SilentAimTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {5, 50},
    Increment = 1,
    CurrentValue = Config.SilentAim.HitboxSize,
    Callback = function(value)
        Config.SilentAim.HitboxSize = value
    end
})

-- Auto Kill Tab
local AutoKillSection = AutoKillTab:CreateSection("Auto Kill All Settings")

AutoKillTab:CreateParagraph({
    Title = "ℹ️ How It Works",
    Content = "Automatically follows enemies from behind (like ;follow in Infinite Yield) and shoots them. Rotates through all enemies until everyone is dead. Works best with Silent Aim enabled!"
})

AutoKillTab:CreateToggle({
    Name = "Enable Auto Kill All",
    CurrentValue = Config.AutoKill.Enabled,
    Callback = function(value)
        Config.AutoKill.Enabled = value
        if value then
            StartAutoKill()
        else
            StopAutoKill()
        end
    end
})

AutoKillTab:CreateToggle({
    Name = "Auto Shoot",
    CurrentValue = Config.AutoKill.AutoShoot,
    Callback = function(value)
        Config.AutoKill.AutoShoot = value
    end
})

AutoKillTab:CreateSlider({
    Name = "Follow Distance",
    Range = {2, 10},
    Increment = 0.5,
    CurrentValue = Config.AutoKill.FollowDistance,
    Callback = function(value)
        Config.AutoKill.FollowDistance = value
    end
})

AutoKillTab:CreateSlider({
    Name = "Target Rotation Speed (seconds)",
    Range = {1, 10},
    Increment = 0.5,
    CurrentValue = Config.AutoKill.RotationSpeed,
    Callback = function(value)
        Config.AutoKill.RotationSpeed = value
    end
})

AutoKillTab:CreateSlider({
    Name = "Shoot Delay (seconds)",
    Range = {0.05, 1},
    Increment = 0.05,
    CurrentValue = Config.AutoKill.ShootDelay,
    Callback = function(value)
        Config.AutoKill.ShootDelay = value
    end
})

AutoKillTab:CreateButton({
    Name = "Skip to Next Target",
    Callback = function()
        if AutoKillEnabled then
            CurrentTargetIndex = CurrentTargetIndex + 1
            Rayfield:Notify({
                Title = "Auto Kill",
                Content = "Switching to next target...",
                Duration = 2
            })
        end
    end
})

-- Visuals Tab
local VisualsSection = VisualsTab:CreateSection("ESP Settings")

VisualsTab:CreateToggle({
    Name = "Skeleton ESP",
    CurrentValue = Config.Visuals.Skeleton,
    Callback = function(value)
        Config.Visuals.Skeleton = value
    end
})

VisualsTab:CreateToggle({
    Name = "Box ESP",
    CurrentValue = Config.Visuals.BoxESP,
    Callback = function(value)
        Config.Visuals.BoxESP = value
    end
})

VisualsTab:CreateToggle({
    Name = "Highlight ESP",
    CurrentValue = Config.Visuals.Highlight,
    Callback = function(value)
        Config.Visuals.Highlight = value
    end
})

VisualsTab:CreateToggle({
    Name = "Show Distance",
    CurrentValue = Config.Visuals.ShowDistance,
    Callback = function(value)
        Config.Visuals.ShowDistance = value
    end
})

VisualsTab:CreateToggle({
    Name = "Show Name",
    CurrentValue = Config.Visuals.ShowName,
    Callback = function(value)
        Config.Visuals.ShowName = value
    end
})

VisualsTab:CreateColorPicker({
    Name = "Skeleton Color",
    Color = Config.Visuals.SkeletonColor,
    Callback = function(value)
        Config.Visuals.SkeletonColor = value
    end
})

VisualsTab:CreateColorPicker({
    Name = "Box Color",
    Color = Config.Visuals.BoxColor,
    Callback = function(value)
        Config.Visuals.BoxColor = value
    end
})

VisualsTab:CreateColorPicker({
    Name = "Highlight Color",
    Color = Config.Visuals.HighlightColor,
    Callback = function(value)
        Config.Visuals.HighlightColor = value
    end
})

-- Detection Tab
local DetectionSection = DetectionTab:CreateSection("Script User Detection")

DetectionTab:CreateToggle({
    Name = "Show Script Users",
    CurrentValue = Config.Detection.ShowUsers,
    Callback = function(value)
        Config.Detection.ShowUsers = value
    end
})

DetectionTab:CreateButton({
    Name = "Refresh User List",
    Callback = function()
        RefreshUsers()
        Rayfield:Notify({
            Title = "Detection",
            Content = "Found " .. #DetectedUsers .. " script users",
            Duration = 3
        })
    end
})

DetectionTab:CreateLabel("Detected Users: 0")

-- Settings Tab
local SettingsSection = SettingsTab:CreateSection("General Settings")

SettingsTab:CreateButton({
    Name = "Reset All Settings",
    Callback = function()
        Config.Aimbot.Enabled = true
        Config.Aimbot.FOVRadius = 150
        Config.Aimbot.Smoothing = 0.15
        Config.SilentAim.Enabled = false
        Config.SilentAim.HitboxSize = 25
        Config.Visuals.Skeleton = true
        Config.Visuals.BoxESP = true
        Config.Visuals.Highlight = true
        
        FOVCircle.Radius = Config.Aimbot.FOVRadius
        
        Rayfield:Notify({
            Title = "Settings",
            Content = "All settings reset to default",
            Duration = 3
        })
    end
})

SettingsTab:CreateButton({
    Name = "Destroy Script",
    Callback = function()
        if _G.AimBotScript then
            _G.AimBotScript:Destroy()
        end
    end
})

-- Initialize ESP for existing players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
        SetupCharacterRespawn(player)
    end
end

-- Player events - Handle character respawn for ESP
Players.PlayerAdded:Connect(function(player)
    CreateESP(player)
    SetupCharacterRespawn(player)
end)

Players.PlayerRemoving:Connect(RemoveESP)

-- Handle character additions for highlights
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and ESPObjects[player] then
            if player.Character then
                if ESPObjects[player].Highlight then
                    ESPObjects[player].Highlight:Destroy()
                end
                
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Config.Visuals.HighlightColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
                highlight.Enabled = Config.Visuals.Highlight
                ESPObjects[player].Highlight = highlight
            end
        end
    end
end)

-- Main loops
RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    UpdateESP()
    RunAimbot()
end)

-- Detection loop
spawn(function()
    while true do
        AnnouncePresence()
        RefreshUsers()
        wait(2)
    end
end)

-- Cleanup
_G.AimBotScript = {
    Destroy = function()
        StopSilentAim()
        StopAutoKill()
        FOVCircle:Remove()
        
        for player, _ in pairs(ESPObjects) do
            RemoveESP(player)
        end
        
        Rayfield:Destroy()
        _G.AimBotScript = nil
        
        print("Arsenal Script cleaned up successfully")
    end
}

Rayfield:Notify({
    Title = "Arsenal Script",
    Content = "Successfully loaded! Enjoy!",
    Duration = 5,
    Image = 4483362458
})

print("Arsenal Script loaded successfully!")
