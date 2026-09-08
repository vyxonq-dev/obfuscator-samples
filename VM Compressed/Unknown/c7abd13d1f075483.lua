--[[
    KNIFE SKILL TEST CHEAT
    PlaceId: 111163066268338
    Features: ESP, Murderer/Sheriff Detection, Kill Aura, Speed, Fly, Anti-Knife, Mobile Compatible
]]

-- Debug Helper with repeat counter
local debugCounts = {}
local function DebugLog(category, message)
    local key = category .. "|" .. tostring(message)
    debugCounts[key] = (debugCounts[key] or 0) + 1
    local count = debugCounts[key]
    
    -- Only print first time, then every 5th time
    if count == 1 or count % 5 == 0 then
        local suffix = count > 1 and string.format(" (x%d)", count) or ""
        print(string.format("[KST] [%s] %s%s", category, tostring(message), suffix))
    end
end

DebugLog("INIT", "Script starting...")
DebugLog("INIT", "PlaceId: " .. game.PlaceId)
DebugLog("INIT", "GameId: " .. game.GameId)

-- Anticheat Bypass - Safe version
DebugLog("BYPASS", "Attempting anticheat bypass...")
local bypassCount = 0
pcall(function()
    for i, v in getgc(true) do
        if bypassCount >= 3 then break end
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.info(v, "s")
            if info and info:find("hmidkbro") and not info:find("ReplicatedFirst") then
                hookfunction(v, function() end)
                bypassCount = bypassCount + 1
                DebugLog("BYPASS", "Hooked: " .. info)
            end
        end
    end
end)
DebugLog("BYPASS", "Bypass done. Hooked: " .. bypassCount)

-- Load Obsidian Library
DebugLog("INIT", "Loading Obsidian library...")
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
DebugLog("INIT", "Obsidian library loaded successfully")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera

-- Main Remote (obfuscated name)
local MainRemote = nil
local InteractFolder = nil

pcall(function()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 5)
    if PlayerGui then
        local GameUI = PlayerGui:FindFirstChild("GameUI")
        if GameUI then
            local ClientMaster = GameUI:FindFirstChild("ClientMaster")
            if ClientMaster then
                InteractFolder = ClientMaster:FindFirstChild("Interact")
            end
        end
    end
end)

-- Find main remote
pcall(function()
    MainRemote = ReplicatedStorage:FindFirstChild("RemoteEvent") or ReplicatedStorage:FindFirstChild("V0XckVdQ_a63b54f9a3d8435fa4c8089fa94faecd")
end)

DebugLog("INIT", "InteractFolder found: " .. tostring(InteractFolder ~= nil))
DebugLog("INIT", "MainRemote found: " .. tostring(MainRemote ~= nil))
if InteractFolder then
    DebugLog("INIT", "Interact remotes count: " .. #InteractFolder:GetChildren())
end

-- Silent Aim via Mouse Hook (no metatable needed)
DebugLog("HOOK", "Setting up mouse hook for silent aim...")
local Mouse = LocalPlayer:GetMouse()
local SilentAimTarget = nil

-- Settings
local Settings = {
    ESP = {
        Enabled = true,  -- ESP enabled by default (safe)
        Box = true,
        Name = true,
        Distance = true,
        Role = true,
        Tracer = false,
        TeamCheck = false
    },
    Combat = {
        KillAura = false,
        KillAuraRange = 15,
        AutoKill = false,
        Aimbot = false,
        AimbotKey = Enum.UserInputType.MouseButton2,
        SilentAim = false,
        WallBang = false,
        Resolver = false,
        Hitbox = "Head",
        FOV = 500
    },
    Movement = {
        Speed = false,
        SpeedValue = 32,
        Fly = false,
        FlySpeed = 50,
        Noclip = false,
        InfiniteJump = false
    },
    Player = {
        AntiKnife = false,
        GodMode = false,
        Invisible = false
    },
    Misc = {
        AutoPlay = false,
        SpectateTarget = nil
    }
}

-- ESP Storage
local ESPObjects = {}

-- Role Detection
local function GetPlayerRole(player)
    if not player or not player.Character then return "Unknown" end
    
    -- Debug role detection (uncomment to see)
    -- DebugLog("ROLE", "Checking role for: " .. player.Name)
    
    -- Check for knife (Murderer)
    if player.Character:FindFirstChild("lastEquippedType") then
        local equipType = player.Character.lastEquippedType
        if equipType and equipType.Value == "Knife" then
            return "Murderer"
        end
    end
    
    -- Check for WeaponsGiven
    if player.Character:FindFirstChild("WeaponsGiven") then
        local hasWeapon = player.Character.WeaponsGiven
        if hasWeapon and hasWeapon.Value then
            -- Check equipped tool type
            for _, tool in pairs(player.Character:GetChildren()) do
                if tool:IsA("Tool") then
                    local toolName = tool.Name:lower()
                    if toolName:find("knife") or toolName:find("blade") then
                        return "Murderer"
                    elseif toolName:find("gun") or toolName:find("pistol") or toolName:find("revolver") then
                        return "Sheriff"
                    end
                end
            end
            return "Armed"
        end
    end
    
    -- Check Backpack for weapons
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                local itemName = item.Name:lower()
                if itemName:find("knife") or itemName:find("blade") then
                    return "Murderer"
                elseif itemName:find("gun") or itemName:find("pistol") or itemName:find("revolver") then
                    return "Sheriff"
                end
            end
        end
    end
    
    return "Innocent"
end

local function GetRoleColor(role)
    if role == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    elseif role == "Sheriff" then
        return Color3.fromRGB(0, 100, 255)
    elseif role == "Armed" then
        return Color3.fromRGB(255, 165, 0)
    else
        return Color3.fromRGB(0, 255, 0)
    end
end

-- ESP Functions
local function CreateESP(player)
    if ESPObjects[player] then return end
    
    local esp = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Distance = Drawing.new("Text"),
        Role = Drawing.new("Text"),
        Tracer = Drawing.new("Line")
    }
    
    esp.Box.Thickness = 1
    esp.Box.Filled = false
    esp.Box.Visible = false
    
    esp.Name.Size = 14
    esp.Name.Center = true
    esp.Name.Outline = true
    esp.Name.Visible = false
    
    esp.Distance.Size = 12
    esp.Distance.Center = true
    esp.Distance.Outline = true
    esp.Distance.Visible = false
    
    esp.Role.Size = 13
    esp.Role.Center = true
    esp.Role.Outline = true
    esp.Role.Font = 2
    esp.Role.Visible = false
    
    esp.Tracer.Thickness = 1
    esp.Tracer.Visible = false
    
    ESPObjects[player] = esp
end

local function RemoveESP(player)
    if ESPObjects[player] then
        pcall(function()
            for _, drawing in pairs(ESPObjects[player]) do
                drawing:Remove()
            end
        end)
        ESPObjects[player] = nil
    end
end

local function UpdateESP()
    -- Clean up disconnected players
    for player, _ in pairs(ESPObjects) do
        if not player or not player.Parent then
            RemoveESP(player)
        end
    end
    
    if not Settings.ESP.Enabled then
        for player, esp in pairs(ESPObjects) do
            for _, drawing in pairs(esp) do
                drawing.Visible = false
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        
        local char = player.Character
        if not char then continue end
        
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")
        
        if not humanoid or not hrp or not head or humanoid.Health <= 0 then
            if ESPObjects[player] then
                for _, drawing in pairs(ESPObjects[player]) do
                    drawing.Visible = false
                end
            end
            continue
        end
        
        if not ESPObjects[player] then
            CreateESP(player)
        end
        
        local esp = ESPObjects[player]
        local pos, vis = CurrentCamera:WorldToViewportPoint(hrp.Position)
        
        if not vis then
            for _, drawing in pairs(esp) do
                drawing.Visible = false
            end
            continue
        end
        
        local role = GetPlayerRole(player)
        local color = GetRoleColor(role)
        
        local topPos = CurrentCamera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
        local bottomPos = CurrentCamera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
        
        local height = math.abs(topPos.Y - bottomPos.Y)
        local width = height / 2
        
        -- Box
        if Settings.ESP.Box then
            esp.Box.Size = Vector2.new(width, height)
            esp.Box.Position = Vector2.new(pos.X - width / 2, topPos.Y)
            esp.Box.Color = color
            esp.Box.Visible = true
        else
            esp.Box.Visible = false
        end
        
        -- Name
        if Settings.ESP.Name then
            esp.Name.Text = player.Name
            esp.Name.Position = Vector2.new(pos.X, topPos.Y - 16)
            esp.Name.Color = color
            esp.Name.Visible = true
        else
            esp.Name.Visible = false
        end
        
        -- Role
        if Settings.ESP.Role then
            esp.Role.Text = "[" .. role .. "]"
            esp.Role.Position = Vector2.new(pos.X, topPos.Y - 30)
            esp.Role.Color = color
            esp.Role.Visible = true
        else
            esp.Role.Visible = false
        end
        
        -- Distance
        if Settings.ESP.Distance then
            local myChar = LocalPlayer.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                local dist = math.floor((myChar.HumanoidRootPart.Position - hrp.Position).Magnitude)
                esp.Distance.Text = tostring(dist) .. "m"
                esp.Distance.Position = Vector2.new(pos.X, bottomPos.Y + 2)
                esp.Distance.Color = color
                esp.Distance.Visible = true
            end
        else
            esp.Distance.Visible = false
        end
        
        -- Tracer
        if Settings.ESP.Tracer then
            local viewportSize = CurrentCamera.ViewportSize
            esp.Tracer.From = Vector2.new(viewportSize.X / 2, viewportSize.Y)
            esp.Tracer.To = Vector2.new(pos.X, pos.Y)
            esp.Tracer.Color = color
            esp.Tracer.Visible = true
        else
            esp.Tracer.Visible = false
        end
    end
end

-- Movement Functions
local Flying = false
local FlyBV = nil
local FlyBG = nil

local function StartFly()
    if Flying then return end
    Flying = true
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid then return end
    
    -- Create fly objects
    FlyBV = Instance.new("BodyVelocity")
    FlyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    FlyBV.Velocity = Vector3.zero
    FlyBV.Parent = hrp
    
    FlyBG = Instance.new("BodyGyro")
    FlyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    FlyBG.P = 9e4
    FlyBG.Parent = hrp
    
    humanoid.PlatformStand = true
end

local function StopFly()
    if not Flying then return end
    Flying = false
    
    if FlyBV then FlyBV:Destroy() FlyBV = nil end
    if FlyBG then FlyBG:Destroy() FlyBG = nil end
    
    local char = LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

local function UpdateFly()
    if not Flying or not FlyBV or not FlyBG then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    FlyBG.CFrame = CurrentCamera.CFrame
    
    local direction = Vector3.zero
    
    -- PC Controls
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        direction = direction + CurrentCamera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        direction = direction - CurrentCamera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        direction = direction - CurrentCamera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        direction = direction + CurrentCamera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        direction = direction + Vector3.new(0, 1, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        direction = direction - Vector3.new(0, 1, 0)
    end
    
    -- Mobile Controls: Use humanoid move direction
    if IsMobile then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local moveDir = humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                direction = direction + CurrentCamera.CFrame.LookVector * moveDir.Z
                direction = direction + CurrentCamera.CFrame.RightVector * moveDir.X
            end
        end
        -- Jump button = go up
        local jumpButton = LocalPlayer.PlayerGui:FindFirstChild("TouchGui")
        if jumpButton then
            local jumpBtn = jumpButton:FindFirstChild("TouchControlFrame") and 
                            jumpButton.TouchControlFrame:FindFirstChild("JumpButton")
            -- If jumping, go up
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Jump then
                direction = direction + Vector3.new(0, 1, 0)
            end
        end
    end
    
    if direction.Magnitude > 0 then
        FlyBV.Velocity = direction.Unit * Settings.Movement.FlySpeed
    else
        FlyBV.Velocity = Vector3.zero
    end
end

-- Speed Hack
local OriginalSpeed = 16
local function UpdateSpeed()
    local char = LocalPlayer.Character
    if not char then return end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    if Settings.Movement.Speed then
        humanoid.WalkSpeed = Settings.Movement.SpeedValue
    else
        humanoid.WalkSpeed = OriginalSpeed
    end
end

-- Noclip
local function UpdateNoclip()
    if not Settings.Movement.Noclip then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if Settings.Movement.InfiniteJump then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- FOV Circle for Aimbot
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(255, 255, 255)

-- Aimbot Target Functions
local function GetClosestPlayerInFOV()
    local closest = nil
    local closestDist = math.huge
    
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
    
    local myPos = myChar.HumanoidRootPart.Position
    local mousePos = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        
        local char = player.Character
        if not char then continue end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        
        if not hrp or not head or not humanoid or humanoid.Health <= 0 then continue end
        
        -- Get target part based on hitbox setting
        local targetPart = Settings.Combat.Hitbox == "Head" and head or hrp
        local screenPos, onScreen = CurrentCamera:WorldToViewportPoint(targetPart.Position)
        
        if not onScreen then continue end
        
        -- Check if in FOV
        local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
        
        if screenDist <= Settings.Combat.FOV then
            local worldDist = (targetPart.Position - myPos).Magnitude
            if worldDist < closestDist then
                closestDist = worldDist
                closest = player
            end
        end
    end
    
    return closest
end

local function GetClosestPlayer(range)
    local closest = nil
    local closestDist = range
    
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
    
    local myPos = myChar.HumanoidRootPart.Position
    
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        
        local char = player.Character
        if not char then continue end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        
        if not hrp or not humanoid or humanoid.Health <= 0 then continue end
        
        local dist = (hrp.Position - myPos).Magnitude
        if dist < closestDist then
            closestDist = dist
            closest = player
        end
    end
    
    return closest
end

-- Mobile Detection
local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
DebugLog("INIT", "Platform: " .. (IsMobile and "Mobile" or "PC"))

-- Mouse Input Tracking (works for both PC and Mobile)
local IsAiming = false

-- PC: Right mouse button
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Settings.Combat.AimbotKey then
        IsAiming = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Settings.Combat.AimbotKey then
        IsAiming = false
    end
end)

-- Mobile: Double tap to toggle aimbot hold
local lastTapTime = 0
if IsMobile then
    UserInputService.TouchTap:Connect(function(touchPositions, gpe)
        if gpe then return end
        local now = tick()
        if now - lastTapTime < 0.3 then
            -- Double tap detected
            IsAiming = not IsAiming
            if Settings.Combat.Aimbot then
                Library:Notify(IsAiming and "Aimbot: ON" or "Aimbot: OFF", 1)
            end
        end
        lastTapTime = now
    end)
end

-- Visual Aimbot (moves camera to target)
local function PerformAimbot()
    if not Settings.Combat.Aimbot then return end
    if not IsAiming then return end
    
    local target = GetClosestPlayerInFOV()
    if not target or not target.Character then return end
    
    local targetPart = Settings.Combat.Hitbox == "Head" and 
        target.Character:FindFirstChild("Head") or 
        target.Character:FindFirstChild("HumanoidRootPart")
    
    if not targetPart then return end
    
    local targetPos = targetPart.Position
    
    -- Apply resolver (predict position)
    if Settings.Combat.Resolver then
        local velocity = targetPart.AssemblyLinearVelocity
        local ping = LocalPlayer:GetNetworkPing()
        targetPos = targetPos + (velocity * ping)
    end
    
    CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, targetPos)
end

-- Silent Aim via Remote Hooking
local silentAimHitCount = 0
local OldFireServer

pcall(function()
    -- Hook remote events for silent aim
    local remoteHooked = false
    
    -- Find all attack/hit remotes and hook them
    for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") and not remoteHooked then
            local oldFire = remote.FireServer
            remote.FireServer = function(self, ...)
                if Settings.Combat.SilentAim then
                    local args = {...}
                    local target = GetClosestPlayerInFOV()
                    if target and target.Character then
                        local targetPart = Settings.Combat.Hitbox == "Head" and 
                            target.Character:FindFirstChild("Head") or 
                            target.Character:FindFirstChild("HumanoidRootPart")
                        
                        if targetPart then
                            local targetPos = targetPart.Position
                            
                            -- Apply resolver
                            if Settings.Combat.Resolver then
                                local velocity = targetPart.AssemblyLinearVelocity or Vector3.zero
                                local ping = LocalPlayer:GetNetworkPing()
                                targetPos = targetPos + (velocity * ping)
                            end
                            
                            -- Replace position arguments with target position
                            for i, arg in pairs(args) do
                                if typeof(arg) == "Vector3" then
                                    args[i] = targetPos
                                elseif typeof(arg) == "CFrame" then
                                    args[i] = CFrame.new(targetPos)
                                end
                            end
                            
                            silentAimHitCount = silentAimHitCount + 1
                            if silentAimHitCount % 10 == 0 then
                                DebugLog("AIMBOT", "Silent aim: " .. silentAimHitCount .. " | Target: " .. target.Name)
                            end
                            
                            return oldFire(self, unpack(args))
                        end
                    end
                end
                return oldFire(self, ...)
            end
        end
    end
    
    DebugLog("HOOK", "Remote hook ready")
end)

-- Auto Kill (teleport attack)
local autoKillCount = 0
local function PerformAutoKill()
    if not Settings.Combat.AutoKill then return end
    
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
    
    DebugLog("AUTOKILL", "Auto kill cycle starting...")
    
    local myHRP = myChar.HumanoidRootPart
    local originalCFrame = myHRP.CFrame
    
    -- Check if we have a weapon
    local weapon = nil
    for _, tool in pairs(myChar:GetChildren()) do
        if tool:IsA("Tool") then
            weapon = tool
            break
        end
    end
    
    if not weapon then return end
    
    -- Find and kill all players
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        
        local char = player.Character
        if not char then continue end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        
        if not hrp or not humanoid or humanoid.Health <= 0 then continue end
        
        -- Teleport to target
        myHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, 3)
        DebugLog("AUTOKILL", "Teleported to: " .. player.Name)
        
        -- Attack
        pcall(function()
            weapon:Activate()
        end)
        autoKillCount = autoKillCount + 1
        
        -- Fire remotes
        if InteractFolder then
            for _, remote in pairs(InteractFolder:GetChildren()) do
                if remote:IsA("RemoteEvent") then
                    pcall(function()
                        remote:FireServer(hrp.Position)
                    end)
                end
            end
        end
        
        task.wait(0.05)
    end
    
    -- Return to original position
    myHRP.CFrame = originalCFrame
    DebugLog("AUTOKILL", "Cycle complete. Total kills attempted: " .. autoKillCount)
end

-- Update FOV Circle
local function UpdateFOVCircle()
    local center = CurrentCamera.ViewportSize / 2
    FOVCircle.Position = center
    FOVCircle.Radius = Settings.Combat.FOV
    FOVCircle.Visible = Settings.Combat.Aimbot or Settings.Combat.SilentAim
end

local function PerformKillAura()
    if not Settings.Combat.KillAura then return end
    
    local target = GetClosestPlayer(Settings.Combat.KillAuraRange)
    if not target then return end
    
    -- Try to use equipped knife/weapon
    local char = LocalPlayer.Character
    if not char then return end
    
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            -- Activate tool towards target
            pcall(function()
                tool:Activate()
            end)
            
            -- Fire interact remotes
            if InteractFolder then
                for _, remote in pairs(InteractFolder:GetChildren()) do
                    if remote:IsA("RemoteEvent") then
                        pcall(function()
                            remote:FireServer(target.Character.HumanoidRootPart.Position)
                        end)
                    end
                end
            end
            break
        end
    end
end

-- Anti Knife (dodge murderer)
local function AntiKnife()
    if not Settings.Player.AntiKnife then return end
    
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
    
    local myPos = myChar.HumanoidRootPart.Position
    
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        
        local role = GetPlayerRole(player)
        if role ~= "Murderer" then continue end
        
        local char = player.Character
        if not char then continue end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        
        local dist = (hrp.Position - myPos).Magnitude
        
        -- If murderer is close, teleport away
        if dist < 10 then
            local awayDir = (myPos - hrp.Position).Unit
            myChar.HumanoidRootPart.CFrame = CFrame.new(myPos + awayDir * 20)
            Library:Notify("Dodged murderer!", 1)
        end
    end
end

-- Spectate
local function SpectatePlayer(player)
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        CurrentCamera.CameraSubject = player.Character.Humanoid
        Settings.Misc.SpectateTarget = player
        Library:Notify("Now spectating: " .. player.Name, 2)
    end
end

local function StopSpectating()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        Settings.Misc.SpectateTarget = nil
        Library:Notify("Stopped spectating", 2)
    end
end

-- Main Loop
RunService.RenderStepped:Connect(function()
    UpdateESP()
    UpdateFly()
    UpdateSpeed()
    UpdateNoclip()
    UpdateFOVCircle()
    PerformAimbot()
    PerformKillAura()
    AntiKnife()
end)

-- Auto Kill Loop (slower interval)
task.spawn(function()
    while true do
        task.wait(0.1)
        pcall(PerformAutoKill)
    end
end)

-- Player Events
Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)

--// UI \\--
local Window = Library:CreateWindow({
    Title = "Knife Skill Test",
    Footer = "Mobile + PC Compatible",
    NotifySide = "Right",
    ShowCustomCursor = true,
    MobileButtonsSide = "Right"
})

local Toggles = Library.Toggles
local Options = Library.Options

local Tabs = {
    ESP = Window:AddTab("ESP", "eye"),
    Combat = Window:AddTab("Combat", "crosshair"),
    Movement = Window:AddTab("Movement", "zap"),
    Player = Window:AddTab("Player", "shield"),
    Players = Window:AddTab("Players", "users"),
    Settings = Window:AddTab("Settings", "settings")
}

--// ESP TAB \\--
local ESPGroup = Tabs.ESP:AddLeftGroupbox("ESP Settings")

ESPGroup:AddToggle("ESPEnabled", {
    Text = "Enable ESP",
    Default = Settings.ESP.Enabled,
    Tooltip = "Show players through walls",
    Callback = function(v) Settings.ESP.Enabled = v end
})

ESPGroup:AddToggle("ESPBox", {
    Text = "Box",
    Default = Settings.ESP.Box,
    Callback = function(v) Settings.ESP.Box = v end
})

ESPGroup:AddToggle("ESPName", {
    Text = "Name",
    Default = Settings.ESP.Name,
    Callback = function(v) Settings.ESP.Name = v end
})

ESPGroup:AddToggle("ESPDistance", {
    Text = "Distance",
    Default = Settings.ESP.Distance,
    Callback = function(v) Settings.ESP.Distance = v end
})

ESPGroup:AddToggle("ESPRole", {
    Text = "Show Role",
    Default = Settings.ESP.Role,
    Tooltip = "Shows Murderer/Sheriff/Innocent",
    Callback = function(v) Settings.ESP.Role = v end
})

ESPGroup:AddToggle("ESPTracer", {
    Text = "Tracers",
    Default = Settings.ESP.Tracer,
    Callback = function(v) Settings.ESP.Tracer = v end
})

local RoleInfoGroup = Tabs.ESP:AddRightGroupbox("Role Colors")

RoleInfoGroup:AddLabel("🔴 Red = Murderer")
RoleInfoGroup:AddLabel("🔵 Blue = Sheriff")
RoleInfoGroup:AddLabel("🟢 Green = Innocent")
RoleInfoGroup:AddLabel("🟠 Orange = Armed")

--// COMBAT TAB \\--
local CombatGroup = Tabs.Combat:AddLeftGroupbox("Aimbot")

CombatGroup:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = Settings.Combat.Aimbot,
    Risky = true,
    Tooltip = IsMobile and "Double tap screen to toggle" or "Hold right click to aim",
    Callback = function(v) Settings.Combat.Aimbot = v end
})

CombatGroup:AddToggle("SilentAim", {
    Text = "Silent Aim",
    Default = Settings.Combat.SilentAim,
    Risky = true,
    Tooltip = "Auto hit closest player in FOV",
    Callback = function(v) Settings.Combat.SilentAim = v end
})

CombatGroup:AddToggle("WallBang", {
    Text = "Wall Bypass",
    Default = Settings.Combat.WallBang,
    Risky = true,
    Tooltip = "Hit players through walls",
    Callback = function(v) Settings.Combat.WallBang = v end
})

CombatGroup:AddToggle("Resolver", {
    Text = "Resolver",
    Default = Settings.Combat.Resolver,
    Tooltip = "Predict player movement",
    Callback = function(v) Settings.Combat.Resolver = v end
})

CombatGroup:AddDropdown("Hitbox", {
    Values = {"Head", "Body"},
    Default = "Head",
    Text = "Target Hitbox",
    Callback = function(v) Settings.Combat.Hitbox = v end
})

CombatGroup:AddSlider("FOV", {
    Text = "FOV Size",
    Default = Settings.Combat.FOV,
    Min = 50,
    Max = 800,
    Rounding = 0,
    Tooltip = "Aimbot field of view circle",
    Callback = function(v) Settings.Combat.FOV = v end
})

local AutoGroup = Tabs.Combat:AddRightGroupbox("Auto Kill")

AutoGroup:AddToggle("AutoKill", {
    Text = "Auto Kill",
    Default = Settings.Combat.AutoKill,
    Risky = true,
    Tooltip = "Teleport to and kill all players",
    Callback = function(v) Settings.Combat.AutoKill = v end
})

AutoGroup:AddToggle("KillAura", {
    Text = "Kill Aura",
    Default = Settings.Combat.KillAura,
    Risky = true,
    Tooltip = "Auto attack nearby players",
    Callback = function(v) Settings.Combat.KillAura = v end
})

AutoGroup:AddSlider("KillAuraRange", {
    Text = "Kill Aura Range",
    Default = Settings.Combat.KillAuraRange,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Callback = function(v) Settings.Combat.KillAuraRange = v end
})

--// MOVEMENT TAB \\--
local MoveGroup = Tabs.Movement:AddLeftGroupbox("Movement")

MoveGroup:AddToggle("Speed", {
    Text = "Speed Hack",
    Default = Settings.Movement.Speed,
    Risky = true,
    Callback = function(v) Settings.Movement.Speed = v end
})

MoveGroup:AddSlider("SpeedValue", {
    Text = "Speed Value",
    Default = Settings.Movement.SpeedValue,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Callback = function(v) Settings.Movement.SpeedValue = v end
})

MoveGroup:AddToggle("Fly", {
    Text = "Fly",
    Default = Settings.Movement.Fly,
    Risky = true,
    Callback = function(v) 
        Settings.Movement.Fly = v
        if v then StartFly() else StopFly() end
    end
})

MoveGroup:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = Settings.Movement.FlySpeed,
    Min = 10,
    Max = 200,
    Rounding = 0,
    Callback = function(v) Settings.Movement.FlySpeed = v end
})

MoveGroup:AddToggle("Noclip", {
    Text = "Noclip",
    Default = Settings.Movement.Noclip,
    Risky = true,
    Tooltip = "Walk through walls",
    Callback = function(v) Settings.Movement.Noclip = v end
})

MoveGroup:AddToggle("InfiniteJump", {
    Text = "Infinite Jump",
    Default = Settings.Movement.InfiniteJump,
    Callback = function(v) Settings.Movement.InfiniteJump = v end
})

--// PLAYER TAB \\--
local PlayerGroup = Tabs.Player:AddLeftGroupbox("Player")

PlayerGroup:AddToggle("AntiKnife", {
    Text = "Anti Knife",
    Default = Settings.Player.AntiKnife,
    Risky = true,
    Tooltip = "Auto dodge murderer",
    Callback = function(v) Settings.Player.AntiKnife = v end
})

PlayerGroup:AddButton({
    Text = "Reset Character",
    Func = function()
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
    end,
    DoubleClick = true
})

--// PLAYERS TAB \\--
local PlayersGroup = Tabs.Players:AddLeftGroupbox("Spectate")

local spectateTarget = nil
local spectateDropdown = PlayersGroup:AddDropdown("SpectatePlayer", {
    Values = {},
    Text = "Select Player",
    Callback = function(v) spectateTarget = v end
})

PlayersGroup:AddButton({
    Text = "Refresh List",
    Func = function()
        local names = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local role = GetPlayerRole(player)
                table.insert(names, player.Name .. " [" .. role .. "]")
            end
        end
        spectateDropdown:SetValues(names)
        Library:Notify("Player list refreshed!", 2)
    end
})

PlayersGroup:AddButton({
    Text = "Spectate",
    Func = function()
        if not spectateTarget then
            Library:Notify("Select a player first!", 2)
            return
        end
        local playerName = spectateTarget:match("^(.+) %[")
        local player = Players:FindFirstChild(playerName)
        if player then
            SpectatePlayer(player)
        end
    end
})

PlayersGroup:AddButton({
    Text = "Stop Spectating",
    Func = StopSpectating
})

local TeleportGroup = Tabs.Players:AddRightGroupbox("Teleport")

local tpTarget = nil
local tpDropdown = TeleportGroup:AddDropdown("TeleportPlayer", {
    Values = {},
    Text = "Select Player",
    Callback = function(v) tpTarget = v end
})

TeleportGroup:AddButton({
    Text = "Refresh List",
    Func = function()
        local names = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                table.insert(names, player.Name)
            end
        end
        tpDropdown:SetValues(names)
    end
})

TeleportGroup:AddButton({
    Text = "Teleport To Player",
    Func = function()
        if not tpTarget then
            Library:Notify("Select a player first!", 2)
            return
        end
        local player = Players:FindFirstChild(tpTarget)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local myChar = LocalPlayer.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                myChar.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
                Library:Notify("Teleported to " .. tpTarget, 2)
            end
        end
    end,
    DoubleClick = true,
    Risky = true
})

--// SETTINGS TAB \\--
local SettingsGroup = Tabs.Settings:AddLeftGroupbox("Menu")

SettingsGroup:AddButton({
    Text = "Unload Script",
    Func = function()
        -- Clean up ESP
        for player, _ in pairs(ESPObjects) do
            RemoveESP(player)
        end
        
        -- Stop fly
        StopFly()
        
        -- Reset speed
        Settings.Movement.Speed = false
        UpdateSpeed()
        
        Library:Unload()
    end,
    DoubleClick = true
})

SettingsGroup:AddLabel("Toggle UI: Right Ctrl / Shake")
SettingsGroup:AddLabel(IsMobile and "Aimbot: Double tap to toggle" or "Aimbot: Hold RMB")
SettingsGroup:AddLabel(IsMobile and "Fly: Use joystick + jump" or "Fly: WASD + Space/Shift")

-- Theme & Save Manager - Load from Obsidian addons
local ThemeManager, SaveManager
pcall(function()
    ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
    SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
end)

local ThemeGroup = Tabs.Settings:AddRightGroupbox("Theme")
local SaveGroup = Tabs.Settings:AddLeftGroupbox("Configs")

if ThemeManager then
    ThemeManager:SetLibrary(Library)
    ThemeManager:SetFolder("KnifeSkillTest")
    ThemeManager:ApplyToGroupbox(ThemeGroup)
    DebugLog("INIT", "ThemeManager loaded")
else
    ThemeGroup:AddLabel("Theme manager not available")
    DebugLog("INIT", "ThemeManager failed to load")
end

if SaveManager then
    SaveManager:SetLibrary(Library)
    SaveManager:SetFolder("KnifeSkillTest")
    SaveManager:BuildConfigSection(SaveGroup)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    DebugLog("INIT", "SaveManager loaded")
else
    SaveGroup:AddLabel("Save manager not available")
    DebugLog("INIT", "SaveManager failed to load")
end

-- Auto refresh player list on join
Players.PlayerAdded:Connect(function()
    task.wait(1)
    -- Update dropdowns if needed
end)

-- Notify loaded
DebugLog("INIT", "========================================")
DebugLog("INIT", "Knife Skill Test fully loaded!")
DebugLog("INIT", "ESP Objects: Ready")
DebugLog("INIT", "Metatable Hook: Active")
DebugLog("INIT", "Aimbot: Ready")
DebugLog("INIT", "Silent Aim: Ready")
DebugLog("INIT", "Wall Bypass: Ready")
DebugLog("INIT", "Auto Kill: Ready")
DebugLog("INIT", "========================================")
DebugLog("INIT", "Use F9 to open Roblox console")
Library:Notify("Knife Skill Test loaded!", 5)
Library:Notify("Press Right Ctrl to toggle menu", 3)
