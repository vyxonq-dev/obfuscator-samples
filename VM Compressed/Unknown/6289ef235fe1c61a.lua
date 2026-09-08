--[[
    ╔══════════════════════════════════════════╗
    ║           JpG SCRIPT HUB v1.0           ║
    ║      Game ID: 9497120499                ║
    ║      UI: Rayfield (Amethyst Theme)      ║
    ║      Made for mobile + PC               ║
    ╚══════════════════════════════════════════╝
    
    Features:
    - Auto Farm
    - Auto Quest
    - Combat / Auto Attack
    - ESP / Player Visuals
    - Teleports
    - Speed / Jump Hacks
    - Fling / Troll
    - Player Mods
    - Anti AFK
    - FPS Booster
    - And more...
--]]
-- ============================================
-- LOAD RAYFIELD LIBRARY
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
-- ============================================
-- SERVICES
-- ============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")
local PathfindingService = game:GetService("PathfindingService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()
-- ============================================
-- VARIABLES / STATE
-- ============================================
local State = {
    -- Farming
    AutoFarm = false,
    AutoQuest = false,
    AutoCollect = false,
    FarmSpeed = 1,
    FarmMethod = "Teleport",
    
    -- Combat
    AutoAttack = false,
    AttackSpeed = 0.1,
    AutoSkill = false,
    KillAura = false,
    KillAuraRange = 30,
    AttackNearest = false,
    AutoCombo = false,
    
    -- Movement
    SpeedEnabled = false,
    WalkSpeed = 16,
    JumpEnabled = false,
    JumpPower = 50,
    InfiniteJump = false,
    Noclip = false,
    Fly = false,
    FlySpeed = 50,
    
    -- Visuals
    ESP = false,
    ESPColor = Color3.fromRGB(170, 0, 255),
    NameESP = false,
    HealthESP = false,
    BoxESP = false,
    TracerESP = false,
    NPCHighlight = false,
    ItemESP = false,
    Fullbright = false,
    NoFog = false,
    
    -- Teleport
    SelectedTeleport = "",
    
    -- Player
    GodMode = false,
    AntiAFK = true,
    FPSBoost = false,
    
    -- Troll
    FlingEnabled = false,
    FlingTarget = "",
    SpinBot = false,
    SpinSpeed = 50,
}
-- Connections storage
local Connections = {}
local ESPObjects = {}
-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function notify(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration or 4,
        Image = "bell",
    })
end
local function getCharacter()
    character = player.Character
    if not character then return nil, nil, nil end
    humanoid = character:FindFirstChildOfClass("Humanoid")
    rootPart = character:FindFirstChild("HumanoidRootPart")
    return character, humanoid, rootPart
end
local function disconnect(name)
    if Connections[name] then
        pcall(function() Connections[name]:Disconnect() end)
        Connections[name] = nil
    end
end
local function getNearestPlayer(maxDist)
    local _, _, rp = getCharacter()
    if not rp then return nil end
    
    local nearest = nil
    local dist = maxDist or 9999
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local pRoot = p.Character:FindFirstChild("HumanoidRootPart")
            local pHum = p.Character:FindFirstChildOfClass("Humanoid")
            if pRoot and pHum and pHum.Health > 0 then
                local d = (pRoot.Position - rp.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = p
                end
            end
        end
    end
    return nearest
end
local function getNearestNPC(maxDist)
    local _, _, rp = getCharacter()
    if not rp then return nil end
    
    local nearest = nil
    local dist = maxDist or 9999
    
    -- Search workspace for NPCs/mobs
    local searchFolders = {
        Workspace:FindFirstChild("Mobs"),
        Workspace:FindFirstChild("NPCs"),
        Workspace:FindFirstChild("Enemies"),
        Workspace:FindFirstChild("Monsters"),
        Workspace:FindFirstChild("Entities"),
        Workspace:FindFirstChild("Spawns"),
    }
    
    local function searchIn(folder)
        if not folder then return end
        for _, obj in pairs(folder:GetDescendants()) do
            if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
                local hum = obj:FindFirstChildOfClass("Humanoid")
                local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
                if hum and hrp and hum.Health > 0 then
                    local d = (hrp.Position - rp.Position).Magnitude
                    if d < dist then
                        dist = d
                        nearest = obj
                    end
                end
            end
        end
    end
    
    for _, folder in pairs(searchFolders) do
        searchIn(folder)
    end
    
    -- Also search workspace root
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
            local isPlayer = false
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character == obj then isPlayer = true break end
            end
            if not isPlayer then
                local hum = obj:FindFirstChildOfClass("Humanoid")
                local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
                if hum and hrp and hum.Health > 0 then
                    local d = (hrp.Position - rp.Position).Magnitude
                    if d < dist then
                        dist = d
                        nearest = obj
                    end
                end
            end
        end
    end
    
    return nearest
end
local function getAllMobs()
    local mobs = {}
    local searchFolders = {
        Workspace:FindFirstChild("Mobs"),
        Workspace:FindFirstChild("NPCs"),
        Workspace:FindFirstChild("Enemies"),
        Workspace:FindFirstChild("Monsters"),
        Workspace:FindFirstChild("Entities"),
    }
    
    local function searchIn(folder)
        if not folder then return end
        for _, obj in pairs(folder:GetDescendants()) do
            if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
                local hum = obj:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    table.insert(mobs, obj)
                end
            end
        end
    end
    
    for _, folder in pairs(searchFolders) do
        searchIn(folder)
    end
    
    return mobs
end
local function getRemotes()
    local remotes = {}
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            table.insert(remotes, v)
        end
    end
    return remotes
end
local function getTeleportLocations()
    local locations = {"Spawn"}
    
    -- Find spawn locations
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("SpawnLocation") then
            if not table.find(locations, obj.Name) then
                table.insert(locations, obj.Name)
            end
        end
    end
    
    -- Find named parts/models that could be locations
    local commonNames = {
        "Shop", "Arena", "Boss", "Spawn", "Lobby",
        "Zone1", "Zone2", "Zone3", "Zone4", "Zone5",
        "Area1", "Area2", "Area3", "Area4", "Area5",
        "Island1", "Island2", "Island3",
        "Beach", "Forest", "Mountain", "Cave", "Castle",
        "Village", "City", "Desert", "Snow", "Volcano",
        "Dungeon", "Tower", "Sea", "Sky", "Underground",
    }
    
    for _, name in pairs(commonNames) do
        local found = Workspace:FindFirstChild(name, true)
        if found and (found:IsA("BasePart") or found:IsA("Model")) then
            if not table.find(locations, name) then
                table.insert(locations, name)
            end
        end
    end
    
    -- Also find any models with "Area", "Zone", "Island" in name
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Model") or obj:IsA("Folder") then
            local n = obj.Name
            if n:find("Area") or n:find("Zone") or n:find("Island") or n:find("World") or n:find("Map") then
                if not table.find(locations, n) then
                    table.insert(locations, n)
                end
            end
        end
    end
    
    return locations
end
-- ============================================
-- CREATE RAYFIELD WINDOW
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = "JpG Hub v1.0",
    LoadingTitle = "JpG Script Hub",
    LoadingSubtitle = "by JpG Development",
    Theme = "Amethyst",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "JpG_Hub",
        FileName = "JpG_Config"
    },
    
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    
    KeySystem = false,
})
-- ============================================
-- TAB 1: FARMING
-- ============================================
local FarmTab = Window:CreateTab("🌾 Farm", "wheat")
local FarmSection = FarmTab:CreateSection("Auto Farm")
FarmTab:CreateToggle({
    Name = "Auto Farm Mobs",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(val)
        State.AutoFarm = val
        
        if val then
            notify("🌾 Auto Farm", "Auto farming enabled!", 3)
            
            Connections.AutoFarm = RunService.Heartbeat:Connect(function()
                if not State.AutoFarm then return end
                local char, hum, rp = getCharacter()
                if not rp then return end
                
                local mob = getNearestNPC(State.KillAuraRange * 10)
                if mob then
                    local mobPart = mob:FindFirstChild("HumanoidRootPart") or mob:FindFirstChild("Head")
                    if mobPart then
                        if State.FarmMethod == "Teleport" then
                            rp.CFrame = mobPart.CFrame * CFrame.new(0, 0, -3)
                        elseif State.FarmMethod == "Walk" then
                            hum:MoveTo(mobPart.Position)
                        end
                    end
                end
            end)
        else
            disconnect("AutoFarm")
            notify("🌾 Auto Farm", "Auto farming disabled!", 3)
        end
    end,
})
FarmTab:CreateDropdown({
    Name = "Farm Method",
    Options = {"Teleport", "Walk"},
    CurrentOption = {"Teleport"},
    MultipleOptions = false,
    Flag = "FarmMethod",
    Callback = function(opts)
        State.FarmMethod = opts[1] or "Teleport"
    end,
})
FarmTab:CreateSlider({
    Name = "Farm Range",
    Range = {10, 500},
    Increment = 10,
    Suffix = " studs",
    CurrentValue = 100,
    Flag = "FarmRange",
    Callback = function(val)
        State.KillAuraRange = val
    end,
})
FarmTab:CreateToggle({
    Name = "Auto Collect Items",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(val)
        State.AutoCollect = val
        
        if val then
            notify("📦 Collect", "Auto collecting enabled!", 3)
            
            Connections.AutoCollect = RunService.Heartbeat:Connect(function()
                if not State.AutoCollect then return end
                local _, _, rp = getCharacter()
                if not rp then return end
                
                -- Find collectibles
                local searchFolders = {
                    Workspace:FindFirstChild("Items"),
                    Workspace:FindFirstChild("Drops"),
                    Workspace:FindFirstChild("Collectibles"),
                    Workspace:FindFirstChild("Loot"),
                    Workspace:FindFirstChild("Pickups"),
                }
                
                for _, folder in pairs(searchFolders) do
                    if folder then
                        for _, item in pairs(folder:GetChildren()) do
                            if item:IsA("BasePart") then
                                item.CFrame = rp.CFrame
                            elseif item:IsA("Model") then
                                local primary = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
                                if primary then
                                    pcall(function()
                                        item:SetPrimaryPartCFrame(rp.CFrame)
                                    end)
                                end
                            end
                        end
                    end
                end
                
                -- Also touch any clickdetector nearby
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        local part = v.Parent
                        if part and part:IsA("BasePart") then
                            local dist = (part.Position - rp.Position).Magnitude
                            if dist < 15 then
                                pcall(function()
                                    fireclickdetector(v)
                                end)
                            end
                        end
                    end
                end
            end)
        else
            disconnect("AutoCollect")
        end
    end,
})
FarmTab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Flag = "AutoQuest",
    Callback = function(val)
        State.AutoQuest = val
        
        if val then
            notify("📜 Quest", "Auto quest enabled!", 3)
            
            Connections.AutoQuest = RunService.Heartbeat:Connect(function()
                if not State.AutoQuest then return end
                
                -- Try firing quest-related remotes
                for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                    if remote:IsA("RemoteEvent") then
                        local name = remote.Name:lower()
                        if name:find("quest") or name:find("mission") or name:find("accept") or name:find("claim") or name:find("complete") then
                            pcall(function()
                                remote:FireServer()
                            end)
                        end
                    end
                end
                
                task.wait(2)
            end)
        else
            disconnect("AutoQuest")
        end
    end,
})
-- ============================================
-- TAB 2: COMBAT
-- ============================================
local CombatTab = Window:CreateTab("⚔️ Combat", "swords")
local CombatSection = CombatTab:CreateSection("Auto Attack")
CombatTab:CreateToggle({
    Name = "Auto Attack",
    CurrentValue = false,
    Flag = "AutoAttack",
    Callback = function(val)
        State.AutoAttack = val
        
        if val then
            notify("⚔️ Combat", "Auto attack enabled!", 3)
            
            Connections.AutoAttack = RunService.Heartbeat:Connect(function()
                if not State.AutoAttack then return end
                
                -- Method 1: Click simulation
                pcall(function()
                    VirtualInputManager:SendMouseButtonEvent(
                        camera.ViewportSize.X / 2,
                        camera.ViewportSize.Y / 2,
                        0, true, game, 1
                    )
                    task.wait(0.01)
                    VirtualInputManager:SendMouseButtonEvent(
                        camera.ViewportSize.X / 2,
                        camera.ViewportSize.Y / 2,
                        0, false, game, 1
                    )
                end)
                
                -- Method 2: Fire attack remotes
                for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                    if remote:IsA("RemoteEvent") then
                        local name = remote.Name:lower()
                        if name:find("attack") or name:find("hit") or name:find("damage") or name:find("swing") or name:find("punch") or name:find("click") or name:find("combat") then
                            pcall(function()
                                remote:FireServer()
                            end)
                        end
                    end
                end
                
                -- Method 3: Activate tools
                local char = player.Character
                if char then
                    for _, tool in pairs(char:GetChildren()) do
                        if tool:IsA("Tool") then
                            pcall(function()
                                tool:Activate()
                            end)
                        end
                    end
                end
                
                task.wait(State.AttackSpeed)
            end)
        else
            disconnect("AutoAttack")
        end
    end,
})
CombatTab:CreateSlider({
    Name = "Attack Speed",
    Range = {0.01, 1},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.1,
    Flag = "AttackSpeed",
    Callback = function(val)
        State.AttackSpeed = val
    end,
})
CombatTab:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Flag = "KillAura",
    Callback = function(val)
        State.KillAura = val
        
        if val then
            notify("💀 Kill Aura", "Kill aura enabled!", 3)
            
            Connections.KillAura = RunService.Heartbeat:Connect(function()
                if not State.KillAura then return end
                local _, _, rp = getCharacter()
                if not rp then return end
                
                local mobs = getAllMobs()
                for _, mob in pairs(mobs) do
                    local mobPart = mob:FindFirstChild("HumanoidRootPart") or mob:FindFirstChild("Head")
                    if mobPart then
                        local dist = (mobPart.Position - rp.Position).Magnitude
                        if dist <= State.KillAuraRange then
                            -- Teleport briefly to hit
                            local oldCFrame = rp.CFrame
                            rp.CFrame = mobPart.CFrame * CFrame.new(0, 0, -2)
                            
                            -- Activate tools
                            for _, tool in pairs(character:GetChildren()) do
                                if tool:IsA("Tool") then
                                    pcall(function() tool:Activate() end)
                                end
                            end
                            
                            task.wait()
                        end
                    end
                end
            end)
        else
            disconnect("KillAura")
        end
    end,
})
CombatTab:CreateSlider({
    Name = "Kill Aura Range",
    Range = {5, 200},
    Increment = 5,
    Suffix = " studs",
    CurrentValue = 30,
    Flag = "KillAuraRange",
    Callback = function(val)
        State.KillAuraRange = val
    end,
})
CombatTab:CreateToggle({
    Name = "Auto Skill / Ability",
    CurrentValue = false,
    Flag = "AutoSkill",
    Callback = function(val)
        State.AutoSkill = val
        
        if val then
            notify("✨ Skills", "Auto skill enabled!", 3)
            
            Connections.AutoSkill = RunService.Heartbeat:Connect(function()
                if not State.AutoSkill then return end
                
                -- Fire skill remotes
                for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                    if remote:IsA("RemoteEvent") then
                        local name = remote.Name:lower()
                        if name:find("skill") or name:find("ability") or name:find("spell") or name:find("power") or name:find("ultimate") or name:find("special") then
                            pcall(function()
                                remote:FireServer()
                            end)
                        end
                    end
                end
                
                -- Press common skill keys
                local skillKeys = {
                    Enum.KeyCode.Q, Enum.KeyCode.E, Enum.KeyCode.R,
                    Enum.KeyCode.T, Enum.KeyCode.Z, Enum.KeyCode.X,
                    Enum.KeyCode.C, Enum.KeyCode.V, Enum.KeyCode.G,
                }
                
                for _, key in pairs(skillKeys) do
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, key, false, game)
                        task.wait(0.02)
                        VirtualInputManager:SendKeyEvent(false, key, false, game)
                    end)
                end
                
                task.wait(1)
            end)
        else
            disconnect("AutoSkill")
        end
    end,
})
CombatTab:CreateToggle({
    Name = "Attack Nearest Player",
    CurrentValue = false,
    Flag = "AttackNearest",
    Callback = function(val)
        State.AttackNearest = val
        
        if val then
            notify("🎯 Target", "Targeting nearest player!", 3)
            
            Connections.AttackNearest = RunService.Heartbeat:Connect(function()
                if not State.AttackNearest then return end
                local _, hum, rp = getCharacter()
                if not rp then return end
                
                local nearest = getNearestPlayer(200)
                if nearest and nearest.Character then
                    local targetRoot = nearest.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        rp.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -3)
                        
                        for _, tool in pairs(character:GetChildren()) do
                            if tool:IsA("Tool") then
                                pcall(function() tool:Activate() end)
                            end
                        end
                    end
                end
                
                task.wait(0.1)
            end)
        else
            disconnect("AttackNearest")
        end
    end,
})
-- ============================================
-- TAB 3: MOVEMENT
-- ============================================
local MoveTab = Window:CreateTab("🏃 Movement", "zap")
local MoveSection = MoveTab:CreateSection("Speed & Jump")
MoveTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Flag = "SpeedHack",
    Callback = function(val)
        State.SpeedEnabled = val
        
        if val then
            Connections.SpeedHack = RunService.Heartbeat:Connect(function()
                if not State.SpeedEnabled then return end
                local _, hum = getCharacter()
                if hum then
                    hum.WalkSpeed = State.WalkSpeed
                end
            end)
        else
            disconnect("SpeedHack")
            local _, hum = getCharacter()
            if hum then hum.WalkSpeed = 16 end
        end
    end,
})
MoveTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = " speed",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(val)
        State.WalkSpeed = val
    end,
})
MoveTab:CreateToggle({
    Name = "Jump Power Hack",
    CurrentValue = false,
    Flag = "JumpHack",
    Callback = function(val)
        State.JumpEnabled = val
        
        if val then
            Connections.JumpHack = RunService.Heartbeat:Connect(function()
                if not State.JumpEnabled then return end
                local _, hum = getCharacter()
                if hum then
                    hum.JumpPower = State.JumpPower
                    hum.UseJumpPower = true
                end
            end)
        else
            disconnect("JumpHack")
            local _, hum = getCharacter()
            if hum then hum.JumpPower = 50 end
        end
    end,
})
MoveTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 5,
    Suffix = " power",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(val)
        State.JumpPower = val
    end,
})
MoveTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(val)
        State.InfiniteJump = val
        
        if val then
            notify("🦘 Jump", "Infinite jump enabled!", 3)
            
            Connections.InfJump = UserInputService.JumpRequest:Connect(function()
                if not State.InfiniteJump then return end
                local _, hum = getCharacter()
                if hum then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            disconnect("InfJump")
        end
    end,
})
local NoclipSection = MoveTab:CreateSection("Noclip & Fly")
MoveTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(val)
        State.Noclip = val
        
        if val then
            notify("👻 Noclip", "Noclip enabled!", 3)
            
            Connections.Noclip = RunService.Stepped:Connect(function()
                if not State.Noclip then return end
                local char = getCharacter()
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            disconnect("Noclip")
            local char = getCharacter()
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})
MoveTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(val)
        State.Fly = val
        
        local _, _, rp = getCharacter()
        if not rp then return end
        
        if val then
            notify("🕊️ Fly", "Flying enabled! Use WASD/Mobile stick", 3)
            
            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Name = "JpGFlyVel"
            bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVel.Velocity = Vector3.new(0, 0, 0)
            bodyVel.Parent = rp
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.Name = "JpGFlyGyro"
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.P = 9e4
            bodyGyro.Parent = rp
            
            Connections.Fly = RunService.Heartbeat:Connect(function()
                if not State.Fly then return end
                local _, hum, rp2 = getCharacter()
                if not rp2 then return end
                
                local bv = rp2:FindFirstChild("JpGFlyVel")
                local bg = rp2:FindFirstChild("JpGFlyGyro")
                if not bv or not bg then return end
                
                local cam = workspace.CurrentCamera
                local dir = Vector3.new(0, 0, 0)
                
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    dir = cam.CFrame.LookVector * moveDir.Z * -1 + cam.CFrame.RightVector * moveDir.X
                end
                
                -- Check jump/crouch for up/down
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    dir = dir + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    dir = dir + Vector3.new(0, -1, 0)
                end
                
                if moveDir.Magnitude > 0 then
                    dir = cam.CFrame.LookVector * State.FlySpeed
                end
                
                bv.Velocity = dir * State.FlySpeed * 0.3
                bg.CFrame = cam.CFrame
            end)
        else
            disconnect("Fly")
            if rp then
                local bv = rp:FindFirstChild("JpGFlyVel")
                local bg = rp:FindFirstChild("JpGFlyGyro")
                if bv then bv:Destroy() end
                if bg then bg:Destroy() end
            end
        end
    end,
})
MoveTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 300},
    Increment = 5,
    Suffix = " speed",
    CurrentValue = 50,
    Flag = "FlySpeedSlider",
    Callback = function(val)
        State.FlySpeed = val
    end,
})
-- ============================================
-- TAB 4: VISUALS / ESP
-- ============================================
local VisualTab = Window:CreateTab("👁️ Visuals", "eye")
-- ESP Functions
local function createESP(target, color, name)
    if not target or ESPObjects[target] then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "JpG_ESP"
    highlight.FillColor = color or State.ESPColor
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.3
    highlight.Adornee = target
    highlight.Parent = target
    
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "JpG_NameESP"
    billboardGui.Size = UDim2.new(0, 200, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = target:FindFirstChild("Head") or target:FindFirstChildWhichIsA("BasePart")
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = color or State.ESPColor
    nameLabel.Text = name or target.Name
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextStrokeTransparency = 0.3
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.Parent = billboardGui
    
    -- Distance label
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.3, 0)
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.TextColor3 = Color3.new(1, 1, 1)
    distLabel.Text = "0m"
    distLabel.TextSize = 11
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextStrokeTransparency = 0.5
    distLabel.Parent = billboardGui
    
    -- Health bar
    local healthBG = Instance.new("Frame")
    healthBG.Size = UDim2.new(0.6, 0, 0, 4)
    healthBG.Position = UDim2.new(0.2, 0, 0.85, 0)
    healthBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    healthBG.BorderSizePixel = 0
    healthBG.Parent = billboardGui
    
    local healthCorner = Instance.new("UICorner")
    healthCorner.CornerRadius = UDim.new(0, 2)
    healthCorner.Parent = healthBG
    
    local healthFill = Instance.new("Frame")
    healthFill.Size = UDim2.new(1, 0, 1, 0)
    healthFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    healthFill.BorderSizePixel = 0
    healthFill.Parent = healthBG
    
    local healthFillCorner = Instance.new("UICorner")
    healthFillCorner.CornerRadius = UDim.new(0, 2)
    healthFillCorner.Parent = healthFill
    
    ESPObjects[target] = {highlight, billboardGui, distLabel, healthFill}
end
local function removeESP(target)
    if ESPObjects[target] then
        for _, obj in pairs(ESPObjects[target]) do
            pcall(function() 
                if obj:IsA("Highlight") or obj:IsA("BillboardGui") then
                    obj:Destroy()
                end
            end)
        end
        ESPObjects[target] = nil
    end
end
local function clearAllESP()
    for target, objects in pairs(ESPObjects) do
        for _, obj in pairs(objects) do
            pcall(function()
                if obj:IsA("Highlight") or obj:IsA("BillboardGui") then
                    obj:Destroy()
                end
            end)
        end
    end
    ESPObjects = {}
end
local ESPSection = VisualTab:CreateSection("ESP")
VisualTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "PlayerESP",
    Callback = function(val)
        State.ESP = val
        
        if val then
            notify("👁️ ESP", "Player ESP enabled!", 3)
            
            -- Create ESP for existing players
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    createESP(p.Character, State.ESPColor, p.DisplayName)
                end
            end
            
            -- Update loop
            Connections.ESP = RunService.Heartbeat:Connect(function()
                if not State.ESP then return end
                local _, _, rp = getCharacter()
                
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        if not ESPObjects[p.Character] then
                            createESP(p.Character, State.ESPColor, p.DisplayName)
                        end
                        
                        -- Update distance
                        local data = ESPObjects[p.Character]
                        if data and rp then
                            local pRoot = p.Character:FindFirstChild("HumanoidRootPart")
                            if pRoot and data[3] and data[3].Parent then
                                local dist = math.floor((pRoot.Position - rp.Position).Magnitude)
                                data[3].Text = dist .. "m"
                            end
                            
                            -- Update health
                            local pHum = p.Character:FindFirstChildOfClass("Humanoid")
                            if pHum and data[4] and data[4].Parent then
                                local healthPercent = pHum.Health / pHum.MaxHealth
                                data[4].Size = UDim2.new(healthPercent, 0, 1, 0)
                                data[4].BackgroundColor3 = Color3.fromRGB(
                                    255 * (1 - healthPercent),
                                    255 * healthPercent,
                                    0
                                )
                            end
                        end
                    end
                end
            end)
            
            -- Handle new players
            Connections.ESPAdded = Players.PlayerAdded:Connect(function(p)
                p.CharacterAdded:Connect(function(char)
                    if State.ESP then
                        task.wait(1)
                        createESP(char, State.ESPColor, p.DisplayName)
                    end
                end)
            end)
        else
            disconnect("ESP")
            disconnect("ESPAdded")
            clearAllESP()
        end
    end,
})
VisualTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(170, 0, 255),
    Flag = "ESPColorPicker",
    Callback = function(col)
        State.ESPColor = col
    end,
})
VisualTab:CreateToggle({
    Name = "NPC / Mob ESP",
    CurrentValue = false,
    Flag = "MobESP",
    Callback = function(val)
        State.NPCHighlight = val
        
        if val then
            notify("👁️ ESP", "Mob ESP enabled!", 3)
            
            Connections.MobESP = RunService.Heartbeat:Connect(function()
                if not State.NPCHighlight then return end
                
                local mobs = getAllMobs()
                for _, mob in pairs(mobs) do
                    if not ESPObjects[mob] then
                        createESP(mob, Color3.fromRGB(255, 50, 50), mob.Name)
                    end
                end
                
                task.wait(2)
            end)
        else
            disconnect("MobESP")
            clearAllESP()
        end
    end,
})
local WorldSection = VisualTab:CreateSection("World Visuals")
VisualTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "Fullbright",
    Callback = function(val)
        State.Fullbright = val
        
        if val then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            
            Lighting.Ambient = Color3.fromRGB(178, 178, 178)
            Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
            
            notify("☀️ Fullbright", "Fullbright enabled!", 3)
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end
    end,
})
VisualTab:CreateToggle({
    Name = "Remove Fog",
    CurrentValue = false,
    Flag = "NoFog",
    Callback = function(val)
        State.NoFog = val
        
        if val then
            Lighting.FogEnd = 9e9
            Lighting.FogStart = 0
            
            -- Remove atmosphere
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") then
                    v.Density = 0
                end
            end
            
            notify("🌫️ Fog", "Fog removed!", 3)
        else
            Lighting.FogEnd = 1000
        end
    end,
})
-- ============================================
-- TAB 5: TELEPORT
-- ============================================
local TeleportTab = Window:CreateTab("🌀 Teleport", "map-pin")
local TeleportSection = TeleportTab:CreateSection("Location Teleport")
-- Get dynamic locations
local teleportLocations = getTeleportLocations()
TeleportTab:CreateDropdown({
    Name = "Select Location",
    Options = teleportLocations,
    CurrentOption = {teleportLocations[1] or "None"},
    MultipleOptions = false,
    Flag = "TeleportLocation",
    Callback = function(opts)
        State.SelectedTeleport = opts[1]
    end,
})
TeleportTab:CreateButton({
    Name = "Teleport to Location",
    Callback = function()
        local _, _, rp = getCharacter()
        if not rp then return end
        
        if State.SelectedTeleport == "" or State.SelectedTeleport == "None" then
            notify("❌ Error", "Select a location first!", 3)
            return
        end
        
        local target = Workspace:FindFirstChild(State.SelectedTeleport, true)
        if target then
            local pos
            if target:IsA("BasePart") then
                pos = target.CFrame + Vector3.new(0, 5, 0)
            elseif target:IsA("Model") then
                local primary = target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
                if primary then
                    pos = primary.CFrame + Vector3.new(0, 5, 0)
                end
            end
            
            if pos then
                rp.CFrame = pos
                notify("🌀 Teleport", "Teleported to " .. State.SelectedTeleport, 3)
            end
        else
            notify("❌ Error", "Location not found!", 3)
        end
    end,
})
TeleportTab:CreateButton({
    Name = "🔄 Refresh Locations",
    Callback = function()
        teleportLocations = getTeleportLocations()
        notify("🔄 Refresh", "Found " .. #teleportLocations .. " locations!", 3)
    end,
})
local PlayerTPSection = TeleportTab:CreateSection("Player Teleport")
-- Player teleport dropdown
local function getPlayerNames()
    local names = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            table.insert(names, p.Name)
        end
    end
    if #names == 0 then
        table.insert(names, "No Players")
    end
    return names
end
TeleportTab:CreateDropdown({
    Name = "Select Player",
    Options = getPlayerNames(),
    CurrentOption = {getPlayerNames()[1] or "None"},
    MultipleOptions = false,
    Flag = "TPPlayer",
    Callback = function(opts)
        State.FlingTarget = opts[1]
    end,
})
TeleportTab:CreateButton({
    Name = "Teleport to Player",
    Callback = function()
        local _, _, rp = getCharacter()
        if not rp then return end
        
        local target = Players:FindFirstChild(State.FlingTarget)
        if target and target.Character then
            local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                rp.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -5)
                notify("🌀 Teleport", "Teleported to " .. target.Name, 3)
            end
        else
            notify("❌ Error", "Player not found!", 3)
        end
    end,
})
TeleportTab:CreateButton({
    Name = "Teleport All Mobs to Me",
    Callback = function()
        local _, _, rp = getCharacter()
        if not rp then return end
        
        local mobs = getAllMobs()
        local count = 0
        
        for _, mob in pairs(mobs) do
            local mobPart = mob:FindFirstChild("HumanoidRootPart") or mob.PrimaryPart
            if mobPart then
                pcall(function()
                    mob:SetPrimaryPartCFrame(rp.CFrame * CFrame.new(math.random(-5, 5), 0, math.random(-5, 5)))
                    count = count + 1
                end)
            end
        end
        
        notify("🌀 Teleport", "Teleported " .. count .. " mobs to you!", 3)
    end,
})
-- ============================================
-- TAB 6: PLAYER MODS
-- ============================================
local PlayerTab = Window:CreateTab("👤 Player", "user")
local ModSection = PlayerTab:CreateSection("Player Mods")
PlayerTab:CreateToggle({
    Name = "God Mode (Client)",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(val)
        State.GodMode = val
        
        if val then
            notify("🛡️ God Mode", "God mode enabled (client-side)!", 3)
            
            Connections.GodMode = RunService.Heartbeat:Connect(function()
                if not State.GodMode then return end
                local _, hum = getCharacter()
                if hum then
                    hum.Health = hum.MaxHealth
                end
            end)
        else
            disconnect("GodMode")
        end
    end,
})
PlayerTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = true,
    Flag = "AntiAFK",
    Callback = function(val)
        State.AntiAFK = val
        
        if val then
            notify("⏰ Anti AFK", "Anti AFK enabled!", 3)
            
            -- Override idle connection
            local VirtualUser = game:GetService("VirtualUser")
            
            Connections.AntiAFK = player.Idled:Connect(function()
                if State.AntiAFK then
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end
            end)
        else
            disconnect("AntiAFK")
        end
    end,
})
PlayerTab:CreateToggle({
    Name = "SpinBot",
    CurrentValue = false,
    Flag = "SpinBot",
    Callback = function(val)
        State.SpinBot = val
        
        if val then
            Connections.SpinBot = RunService.Heartbeat:Connect(function()
                if not State.SpinBot then return end
                local _, _, rp = getCharacter()
                if rp then
                    rp.CFrame = rp.CFrame * CFrame.Angles(0, math.rad(State.SpinSpeed), 0)
                end
            end)
        else
            disconnect("SpinBot")
        end
    end,
})
PlayerTab:CreateSlider({
    Name = "Spin Speed",
    Range = {1, 100},
    Increment = 1,
    Suffix = "°",
    CurrentValue = 50,
    Flag = "SpinSpeedSlider",
    Callback = function(val)
        State.SpinSpeed = val
    end,
})
PlayerTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local _, hum = getCharacter()
        if hum then
            hum.Health = 0
            notify("💀 Reset", "Character reset!", 2)
        end
    end,
})
PlayerTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        notify("🔄 Rejoin", "Rejoining server...", 2)
        task.wait(1)
        TeleportService:Teleport(game.PlaceId, player)
    end,
})
-- ============================================
-- TAB 7: TROLL
-- ============================================
local TrollTab = Window:CreateTab("😈 Troll", "ghost")
local TrollSection = TrollTab:CreateSection("Fling")
TrollTab:CreateDropdown({
    Name = "Fling Target",
    Options = getPlayerNames(),
    CurrentOption = {getPlayerNames()[1] or "None"},
    MultipleOptions = false,
    Flag = "FlingTargetDrop",
    Callback = function(opts)
        State.FlingTarget = opts[1]
    end,
})
TrollTab:CreateButton({
    Name = "💥 Fling Selected Player",
    Callback = function()
        local target = Players:FindFirstChild(State.FlingTarget)
        if not target or not target.Character then
            notify("❌ Error", "Target not found!", 2)
            return
        end
        
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        local _, hum, rp = getCharacter()
        if not rp or not targetRoot then return end
        
        notify("💥 Fling", "Flinging " .. target.Name .. "!", 2)
        
        local oldPlatform = hum.PlatformStand
        hum.PlatformStand = true
        
        local angVel = Instance.new("BodyAngularVelocity")
        angVel.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        angVel.AngularVelocity = Vector3.new(9999, 9999, 9999)
        angVel.Parent = rp
        
        local startTime = tick()
        local flingConn
        flingConn = RunService.Heartbeat:Connect(function()
            if tick() - startTime > 1 then
                flingConn:Disconnect()
                angVel:Destroy()
                hum.PlatformStand = oldPlatform
                rp.Velocity = Vector3.new(0, 0, 0)
                rp.RotVelocity = Vector3.new(0, 0, 0)
                notify("✅ Done", "Flung " .. target.Name, 2)
                return
            end
            
            local tChar = target.Character
            if tChar then
                local tRoot = tChar:FindFirstChild("HumanoidRootPart")
                if tRoot then
                    rp.CFrame = tRoot.CFrame * CFrame.new(
                        math.sin(tick() * 50) * 1.5,
                        math.cos(tick() * 30),
                        math.sin(tick() * 40) * 1.5
                    )
                    rp.Velocity = (tRoot.Position - rp.Position).Unit * 9999
                end
            end
        end)
    end,
})
TrollTab:CreateButton({
    Name = "💥 Fling Nearest Player",
    Callback = function()
        local nearest = getNearestPlayer(500)
        if not nearest then
            notify("❌ Error", "No players nearby!", 2)
            return
        end
        
        State.FlingTarget = nearest.Name
        
        local targetRoot = nearest.Character:FindFirstChild("HumanoidRootPart")
        local _, hum, rp = getCharacter()
        if not rp or not targetRoot then return end
        
        notify("💥 Fling", "Flinging " .. nearest.Name .. "!", 2)
        
        hum.PlatformStand = true
        
        local angVel = Instance.new("BodyAngularVelocity")
        angVel.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        angVel.AngularVelocity = Vector3.new(9999, 9999, 9999)
        angVel.Parent = rp
        
        local startTime = tick()
        local flingConn
        flingConn = RunService.Heartbeat:Connect(function()
            if tick() - startTime > 1 then
                flingConn:Disconnect()
                angVel:Destroy()
                hum.PlatformStand = false
                rp.Velocity = Vector3.new(0, 0, 0)
                rp.RotVelocity = Vector3.new(0, 0, 0)
                return
            end
            
            local tChar = nearest.Character
            if tChar then
                local tRoot = tChar:FindFirstChild("HumanoidRootPart")
                if tRoot then
                    rp.CFrame = tRoot.CFrame
                    rp.Velocity = Vector3.new(
                        math.random(-1, 1) * 9999,
                        9999,
                        math.random(-1, 1) * 9999
                    )
                end
            end
        end)
    end,
})
local AnnoySection = TrollTab:CreateSection("Annoy")
TrollTab:CreateButton({
    Name = "🔊 Spam Chat (once)",
    Callback = function()
        pcall(function()
            local chatRemote = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if chatRemote then
                local sayMsg = chatRemote:FindFirstChild("SayMessageRequest")
                if sayMsg then
                    sayMsg:FireServer("JpG Hub on top 💥", "All")
                end
            end
        end)
        notify("💬 Chat", "Message sent!", 2)
    end,
})
TrollTab:CreateButton({
    Name = "👻 Invisible (Client)",
    Callback = function()
        local char = getCharacter()
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                elseif part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = 1
                end
            end
            
            local face = char:FindFirstChild("Head") and char.Head:FindFirstChild("face")
            if face then face.Transparency = 1 end
            
            notify("👻 Invisible", "You are now invisible (client-side)!", 3)
        end
    end,
})
TrollTab:CreateButton({
    Name = "👤 Visible Again",
    Callback = function()
        local char = getCharacter()
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = 0
                elseif part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = 0
                end
            end
            notify("👤 Visible", "You are visible again!", 3)
        end
    end,
})
-- ============================================
-- TAB 8: MISC / SETTINGS
-- ============================================
local MiscTab = Window:CreateTab("⚙️ Misc", "settings")
local PerfSection = MiscTab:CreateSection("Performance")
MiscTab:CreateToggle({
    Name = "FPS Booster",
    CurrentValue = false,
    Flag = "FPSBoost",
    Callback = function(val)
        State.FPSBoost = val
        
        if val then
            notify("🚀 FPS", "FPS boost enabled!", 3)
            
            -- Reduce visual quality
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = false
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 0
                elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.RenderFidelity = Enum.RenderFidelity.Performance
                end
            end
            
            -- Disable shadows
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            
            -- Remove unnecessary effects
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or
                   v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or
                   v:IsA("DepthOfFieldEffect") then
                    v.Enabled = false
                end
            end
            
            -- Lower terrain detail
            pcall(function()
                Workspace.Terrain.WaterWaveSize = 0
                Workspace.Terrain.WaterWaveSpeed = 0
                Workspace.Terrain.WaterReflectance = 0
                Workspace.Terrain.WaterTransparency = 0
            end)
        else
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
            Lighting.GlobalShadows = true
            
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") then
                    v.Enabled = true
                end
            end
        end
    end,
})
local InfoSection = MiscTab:CreateSection("Information")
MiscTab:CreateParagraph({
    Title = "📊 Game Info",
    Content = "Game ID: " .. game.PlaceId .. "\nGame Name: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "\nPlayers: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
})
MiscTab:CreateParagraph({
    Title = "👤 Player Info",
    Content = "Name: " .. player.Name .. "\nDisplay: " .. player.DisplayName .. "\nUserID: " .. player.UserId
})
local ToolSection = MiscTab:CreateSection("Tools")
MiscTab:CreateButton({
    Name = "📋 Copy Game Link",
    Callback = function()
        pcall(function()
            setclipboard("https://www.roblox.com/games/" .. game.PlaceId)
        end)
        notify("📋 Copied", "Game link copied to clipboard!", 2)
    end,
})
MiscTab:CreateButton({
    Name = "🔍 Print All Remotes",
    Callback = function()
        local remotes = getRemotes()
        print("\n=== JpG Hub - Remote Scanner ===")
        for _, remote in pairs(remotes) do
            print(remote.ClassName .. ": " .. remote:GetFullName())
        end
        print("Total: " .. #remotes .. " remotes found")
        print("================================\n")
        notify("🔍 Remotes", "Found " .. #remotes .. " remotes! Check console (F9)", 4)
    end,
})
MiscTab:CreateButton({
    Name = "🗑️ Cleanup / Disable All",
    Callback = function()
        -- Disable everything
        State.AutoFarm = false
        State.AutoQuest = false
        State.AutoCollect = false
        State.AutoAttack = false
        State.KillAura = false
        State.AutoSkill = false
        State.AttackNearest = false
        State.SpeedEnabled = false
        State.JumpEnabled = false
        State.InfiniteJump = false
        State.Noclip = false
        State.Fly = false
        State.ESP = false
        State.NPCHighlight = false
        State.GodMode = false
        State.SpinBot = false
        State.FPSBoost = false
        
        -- Disconnect all
        for name, conn in pairs(Connections) do
            pcall(function() conn:Disconnect() end)
        end
        Connections = {}
        
        -- Clear ESP
        clearAllESP()
        
        -- Remove fly parts
        local _, _, rp = getCharacter()
        if rp then
            local bv = rp:FindFirstChild("JpGFlyVel")
            local bg = rp:FindFirstChild("JpGFlyGyro")
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end
        
        -- Reset humanoid
        local _, hum = getCharacter()
        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
            hum.PlatformStand = false
        end
        
        notify("🗑️ Cleanup", "All features disabled!", 3)
    end,
})
MiscTab:CreateButton({
    Name = "❌ Destroy GUI",
    Callback = function()
        -- Cleanup everything
        for name, conn in pairs(Connections) do
            pcall(function() conn:Disconnect() end)
        end
        clearAllESP()
        
        Rayfield:Destroy()
        notify("👋 Goodbye", "JpG Hub destroyed!", 2)
    end,
})
-- ============================================
-- CHARACTER RESPAWN HANDLER
-- ============================================
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    rootPart = newChar:WaitForChild("HumanoidRootPart")
    
    task.wait(1)
    
    -- Re-apply speed/jump if enabled
    if State.SpeedEnabled then
        humanoid.WalkSpeed = State.WalkSpeed
    end
    if State.JumpEnabled then
        humanoid.JumpPower = State.JumpPower
    end
end)
-- ============================================
-- AUTO ANTI AFK ON LOAD
-- ============================================
if State.AntiAFK then
    local VirtualUser = game:GetService("VirtualUser")
    Connections.AntiAFK = player.Idled:Connect(function()
        if State.AntiAFK then
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    end)
end
-- ============================================
-- STARTUP NOTIFICATION
-- ============================================
notify("☠️ JpG Hub v1.0", "Script hub loaded successfully!\nGame: " .. game.PlaceId, 5)
print([[
╔══════════════════════════════════════╗
║        JpG SCRIPT HUB v1.0         ║
║     Loaded Successfully! ✅         ║
║     Game ID: ]] .. game.PlaceId .. [[          ║
║     Theme: Amethyst                 ║
║     Tabs: 8                         ║
║     Features: 40+                   ║
╚══════════════════════════════════════╝
]]) --copyright by jpg