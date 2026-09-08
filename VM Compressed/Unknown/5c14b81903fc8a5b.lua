local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local VIM = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- NOME DA JANELA
local Window = Library.CreateLib("MOONDF HUB V2.5", "DarkTheme")

-- Variáveis Principais
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

-- Configurações de Voo e Speed
local flyToggle = false
local flySpeedValue = 150
local flyConn, bg, bv
local speedToggle = false
local walkSpeed = 16
local speedConn
local BASE_WALKSPEED = 16

-- Configurações Visuais
local coordsEnabled = false
local coordsGui, coordsLabel, coordsConn
local noFogEnabled = false

-- Configurações Ultra Lite
local ultraLiteEnabled = false
local liteLoop = nil

-- Configurações de Farm
local trinketFarm = false
local oreFarm = false -- VARIAVEL NOVA MINERIO
local autoAttack = false

-- Lógica de Farm
local currentMob = nil
local isEnabled = false
local connection = nil
local loadingAllMobs = false
local teleportAndLookLooping = false
local selectedPlayerName = nil
local teleportMode = "Behind"
local FARM_DISTANCE = 4
local EXECUTE_DISTANCE = 1
local PLAYER_EXECUTE_DISTANCE = 20

-- ==========================================
-- CLICK TP VARIABLES
-- ==========================================
local clickTPToggle = false
local clickTPConn = nil

-- ==========================================
-- SPECTATE VARIABLES
-- ==========================================
local spectateToggle = false
local spectatePlayer = nil
local spectateConn = nil
local originalCFrame = nil
local spectateHeight = 20
local spectateDistance = 5

-- ==========================================
-- ESP PLAYERS VARIABLES
-- ==========================================
local espEnabled = false
local espConnections = {}
local espUpdateLoop = nil
local espPlayers = {}

-- ==========================================
-- COORDENADAS & LOCAIS
-- ==========================================
local raidCFrame = CFrame.new(7099.3, 1762.3, 1342.9)
local hayakawaCFrame = CFrame.new(-3571.8, 714.1, -994.5)
local okuyaCFrame = CFrame.new(893.3, 772.6, -2260.9)
local kamakuraCFrame = CFrame.new(-2343.6, 1166.6, -1678.2)
local slayerCFrame = CFrame.new(-5433.1, 761.0, -6392.9)
local distritoCFrame = CFrame.new(-1986.7, 871.8, -6484.5)
local slayerExamCFrame = CFrame.new(-5123, 815, -3037)

-- Respirações
local mistBreathCFrame = CFrame.new(3237, 778.8, -4051.3)
local serpentBreathCFrame = CFrame.new(991.8, 1071.3, -1144.8)
local loveBreathCFrame = CFrame.new(1192.8, 1079.3, -1107.6)
local flameBreathCFrame = CFrame.new(1493, 1245, -354)
local moonBreathCFrame = CFrame.new(1820, 1121, -5958)
local windBreathCFrame = CFrame.new(-3294, 708, -1267)
local thunderBreathCFrame = CFrame.new(-750, 705, 552)
local insectBreathCFrame = CFrame.new(-1635, 913, -6493)
local soundBreathCFrame = CFrame.new(-1266, 877.9, -6432.9)
local flowerBreathCFrame = CFrame.new(-1320, 872.5, -6237)
local beastBreathCFrame = CFrame.new(-3112, 785, -6596)
local waterBreathCFrame = CFrame.new(-925, 851.5, -994.6)
local sunBreathCFrame = CFrame.new(393, 819.7, -421)

-- Coordenadas novas para Farm Castelo
local casteloCoord1 = CFrame.new(-9986.8, 6898.9, -4678.2)
local casteloCoord2 = CFrame.new(3433.3, 3732.3, 1879.8)
local casteloCoord3 = CFrame.new(3396.3, 4010.6, 1768.6)

local LOAD_COORDINATES = {
    Vector3.new(-3398.0, 722.4, -1128.5),
    Vector3.new(-2740.9, 737.8, -3378.0),
    Vector3.new(-4571.8, 776.6, -6140.8),
    Vector3.new(-6456.1, 815.1, -6298.2),
    Vector3.new(-1944.1, 874.4, -2510.4),
    Vector3.new(1634.1, 1190.1, -1446.3),
    Vector3.new(1406.2, 769.3, -6549.3),
    Vector3.new(893.3, 772.6, -2260.9),
}

local MOBS = { "GenericSlayer", "GenericOni", "FrostyOni", "Green Demon", "Blue Demon", "Zenitsu", "Gyutaro", "Kaigaku" }

-- ==========================================
-- UTILS
-- ==========================================
local blockedStates = {
    Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.GettingUp,
    Enum.HumanoidStateType.Seated, Enum.HumanoidStateType.PlatformStanding, Enum.HumanoidStateType.Dead, Enum.HumanoidStateType.Physics,
}

local function isInBlockedState(h)
    if not h then return true end
    if h.PlatformStand == true then return true end
    for _, v in ipairs(blockedStates) do if h:GetState() == v then return true end end
    return false
end

local noclipToggle = false
local noclipConn

local function onCharAdded(newChar)
    char = newChar
    root = char:WaitForChild("HumanoidRootPart")
    humanoid = char:WaitForChild("Humanoid")
    
    if flyToggle then
        task.wait(0.5)
        pcall(function() if bg then bg:Destroy() end if bv then bv:Destroy() end if flyConn then flyConn:Disconnect() end end)
        setupFly()
    end
    
    if coordsEnabled then createCoordsGui() startCoordsUpdate() end
    
    if speedToggle then
        if speedConn then speedConn:Disconnect() end
        speedConn = RunService.Heartbeat:Connect(function()
            if humanoid and humanoid.Health > 0 and not isInBlockedState(humanoid) then humanoid.WalkSpeed = walkSpeed end
        end)
    end
    
    if isEnabled and currentMob then task.wait(0.5) toggleTeleport(true, currentMob) end
    
    if noclipToggle then
        toggleNoclip(true)
    end
end
player.CharacterAdded:Connect(onCharAdded)

-- ==========================================
-- NO CLIP FUNCTION
-- ==========================================
function toggleNoclip(state)
    noclipToggle = state
    if state then
        if noclipConn then noclipConn:Disconnect() end
        noclipConn = RunService.Stepped:Connect(function(time, step)
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() end
    end
end

-- ==========================================
-- SISTEMA DE FLY
-- ==========================================
local function calculateFlySpeed(sliderVal)
    if sliderVal <= 5000 then
        return (sliderVal / 5000) * 400
    else
        local excess = sliderVal - 5000
        return 400 + (excess * 2) 
    end
end

function setupFly()
    bg = Instance.new("BodyGyro", root)
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.P = 9e4
    bg.CFrame = root.CFrame
    bv = Instance.new("BodyVelocity", root)
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Velocity = Vector3.new(0,0,0)
    humanoid.PlatformStand = true
    
    flyConn = RunService.Heartbeat:Connect(function()
        if not flyToggle or not root then return end
        local cam = workspace.CurrentCamera
        local vertical = 0
        local currentSpeed = calculateFlySpeed(flySpeedValue)
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vertical += currentSpeed end
        if UserInputService:IsKeyDown(Enum.KeyCode.C) then vertical -= currentSpeed end
        bv.Velocity = humanoid.MoveDirection * currentSpeed + Vector3.new(0, vertical, 0)
        bg.CFrame = cam.CFrame
    end)
end

-- ==========================================
-- LITE MODE
-- ==========================================
local function toggleUltraLite(state)
    ultraLiteEnabled = state
    if state then
        settings().Rendering.QualityLevel = 1
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 1
        Lighting.ClockTime = 12
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("SunRaysEffect") then v.Enabled = false end
        end
        local Terrain = workspace.Terrain
        Terrain.WaterWaveSize = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 0
        
        local function uglyfy(v)
            if v:IsA("BasePart") and not v:IsA("Terrain") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
                v.Color = Color3.fromRGB(100, 100, 100)
                if v:IsA("MeshPart") then v.TextureID = "" end
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Highlight") then
                v.Enabled = false
            elseif v:IsA("Explosion") then
                v.Visible = false
            elseif v:IsA("SurfaceAppearance") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(workspace:GetDescendants()) do uglyfy(v) end
        
        liteLoop = RunService.RenderStepped:Connect(function()
            Lighting.FogEnd = 9e9
            Lighting.GlobalShadows = false
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false end
            end
        end)
    else
        if liteLoop then liteLoop:Disconnect() end
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 500
        Lighting.Brightness = 3
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then v.Enabled = true end
        end
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 0 end
        end
    end
end

-- ==========================================
-- VISUAL (COORDS & FOG)
-- ==========================================
function createCoordsGui()
    coordsGui = Instance.new("ScreenGui")
    coordsGui.Name = "GrokCoords"
    coordsGui.Parent = player:WaitForChild("PlayerGui")
    coordsGui.ResetOnSpawn = false
    local frame = Instance.new("Frame", coordsGui)
    frame.Size = UDim2.new(0, 220, 0, 70)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(255,255,255)
    
    coordsLabel = Instance.new("TextLabel", frame)
    coordsLabel.Size = UDim2.new(1, -10, 1, 0)
    coordsLabel.Position = UDim2.new(0, 5, 0, 0)
    coordsLabel.BackgroundTransparency = 1
    coordsLabel.TextColor3 = Color3.fromRGB(255,255,255)
    coordsLabel.TextScaled = true
    coordsLabel.Font = Enum.Font.SourceSansBold
    coordsLabel.Text = "Coords: carregando..."
end

function startCoordsUpdate()
    if coordsConn then coordsConn:Disconnect() end
    coordsConn = RunService.RenderStepped:Connect(function()
        if coordsEnabled and root and root.Parent then
            local pos = root.Position
            coordsLabel.Text = string.format("X: %.1f\nY: %.1f\nZ: %.1f", pos.X, pos.Y, pos.Z)
        end
    end)
end

local function applyNoFog(state)
    if state then
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
        Lighting.GlobalShadows = false
        Lighting.Brightness = 2
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("Atmosphere") then v.Density = 0 end
        end
    else
        Lighting.FogEnd = 500
        Lighting.GlobalShadows = true
    end
end

-- ==========================================
-- CLICK TP FUNCTION
-- ==========================================
local function toggleClickTP(state)
    clickTPToggle = state
    if state then
        if clickTPConn then clickTPConn:Disconnect() end
        local mouse = player:GetMouse()
        mouse.Button1Down:Connect(function()
            if clickTPToggle and mouse.Target then
                local targetPos = mouse.Hit.Position + Vector3.new(0, 3, 0)
                if root then
                    root.CFrame = CFrame.new(targetPos)
                    root.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    end
end

-- ==========================================
-- SPECTATE FUNCTION
-- ==========================================
local function toggleSpectate(state, targetPlayerName)
    spectateToggle = state
    if state then
        local targetPlayer = Players:FindFirstChild(targetPlayerName)
        if not targetPlayer or not targetPlayer.Character then return end
        
        spectatePlayer = targetPlayer
        originalCFrame = root.CFrame
        
        if spectateConn then spectateConn:Disconnect() end
        
        spectateConn = RunService.RenderStepped:Connect(function()
            if spectateToggle and spectatePlayer and spectatePlayer.Character and spectatePlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetRoot = spectatePlayer.Character.HumanoidRootPart
                local cam = workspace.CurrentCamera
                local cameraPos = targetRoot.Position + Vector3.new(spectateDistance, spectateHeight, spectateDistance)
                local targetLookPos = targetRoot.Position + Vector3.new(0, 2, 0)
                cam.CFrame = CFrame.new(cameraPos, targetLookPos)
            end
        end)
    else
        if spectateConn then spectateConn:Disconnect() end
        spectateConn = nil
        spectatePlayer = nil
        if root and originalCFrame then
            workspace.CurrentCamera.CFrame = CFrame.new(root.Position + Vector3.new(0, 3, 5), root.Position)
        end
    end
end

-- ==========================================
-- ESP PLAYERS FUNCTIONS (MENOR & FIX HP)
-- ==========================================
local function createESPLabel(hrp, playerName, distance)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESPLabel"
    
    -- TAMANHO REDUZIDO: 120x50
    billboardGui.Size = UDim2.new(0, 120, 0, 50)
    
    -- StudsOffset levanta o ESP para cima da cabeça
    billboardGui.StudsOffset = Vector3.new(0, 5, 0) 
    
    -- MaxDistance
    billboardGui.MaxDistance = 3000 
    
    billboardGui.Adornee = hrp
    billboardGui.Parent = hrp
    billboardGui.AlwaysOnTop = true
    
    local textLabel = Instance.new("TextLabel")
    textLabel.BackgroundTransparency = 0.5 
    textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BorderSizePixel = 1
    textLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.Parent = billboardGui
    
    return billboardGui, textLabel
end

local function clearESP()
    for _, conn in ipairs(espConnections) do
        if conn then conn:Disconnect() end
    end
    espConnections = {}
    espPlayers = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local adorn = plr.Character.HumanoidRootPart:FindFirstChild("ESPAdornment")
            local label = plr.Character.HumanoidRootPart:FindFirstChild("ESPLabel")
            if adorn then adorn:Destroy() end
            if label then label:Destroy() end
        end
    end
    if espUpdateLoop then espUpdateLoop:Disconnect() espUpdateLoop = nil end
end

local function enableESP()
    clearESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            local box = Instance.new("BoxHandleAdornment")
            box.Name = "ESPAdornment"
            box.Size = Vector3.new(3, 6, 2)
            box.Adornee = hrp
            box.Color3 = Color3.new(1, 0, 0)
            box.Transparency = 0.6
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Parent = hrp
            
            local billGui, textLabel = createESPLabel(hrp, plr.Name, 0)
            espPlayers[plr.Name] = {
                player = plr,
                box = box,
                billGui = billGui,
                textLabel = textLabel
            }
        end
    end
    
    local conn = Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function(char)
            task.wait(1)
            if espEnabled and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESPAdornment"
                box.Size = Vector3.new(3, 6, 2)
                box.Adornee = hrp
                box.Color3 = Color3.new(1, 0, 0)
                box.Transparency = 0.6
                box.AlwaysOnTop = true
                box.ZIndex = 10
                box.Parent = hrp
                
                local billGui, textLabel = createESPLabel(hrp, plr.Name, 0)
                espPlayers[plr.Name] = {
                    player = plr,
                    box = box,
                    billGui = billGui,
                    textLabel = textLabel
                }
            end
        end)
    end)
    table.insert(espConnections, conn)
    
    espUpdateLoop = RunService.Heartbeat:Connect(function()
        if not espEnabled then return end
        
        for playerName, espData in pairs(espPlayers) do
            if espData.player and espData.player.Character and espData.player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = espData.player.Character.HumanoidRootPart
                local humanoid = espData.player.Character:FindFirstChild("Humanoid")
                
                if espData.box then
                    espData.box.Adornee = hrp
                end
                
                local distance = 0
                if root then
                    distance = (root.Position - hrp.Position).Magnitude
                end
                
                if espData.textLabel and humanoid then
                    local rawMax = humanoid.MaxHealth
                    if rawMax < 1 then rawMax = 100 end
                    
                    local health = math.floor(humanoid.Health)
                    local maxHealth = math.floor(rawMax)
                    
                    espData.textLabel.Text = string.format("%s\nHP: %d/%d\n%.1fm", 
                        playerName, health, maxHealth, distance)
                end
            else
                if espData.box then espData.box:Destroy() end
                if espData.billGui then espData.billGui:Destroy() end
                espPlayers[playerName] = nil
            end
        end
    end)
end

local function toggleESP(state)
    espEnabled = state
    if espEnabled then
        enableESP()
    else
        clearESP()
    end
end

-- ==========================================
-- FARM & TP LOGIC
-- ==========================================
local function findEnemy(mobName)
    local targetPlayer = Players:FindFirstChild(mobName)
    if targetPlayer and targetPlayer.Character then return targetPlayer.Character end
    return workspace:FindFirstChild(mobName)
end

local function loadAllMobs()
    if loadingAllMobs then return end
    loadingAllMobs = true
    local initialPosition = root.CFrame
    for i, coord in ipairs(LOAD_COORDINATES) do
        root.CFrame = CFrame.new(coord)
        task.wait(2)
    end
    root.CFrame = initialPosition
    task.wait(1)
    loadingAllMobs = false
end

local function loadAllMap()
    local allCFrames = {
        raidCFrame, hayakawaCFrame, okuyaCFrame, kamakuraCFrame,
        slayerCFrame, distritoCFrame, slayerExamCFrame, mistBreathCFrame,
        serpentBreathCFrame, loveBreathCFrame, flameBreathCFrame, moonBreathCFrame,
        windBreathCFrame, thunderBreathCFrame, insectBreathCFrame, soundBreathCFrame,
        flowerBreathCFrame, beastBreathCFrame, waterBreathCFrame, sunBreathCFrame
    }
    for _, coord in ipairs(LOAD_COORDINATES) do
        table.insert(allCFrames, CFrame.new(coord))
    end
    local initialPosition = root.CFrame
    for _, cf in ipairs(allCFrames) do
        root.CFrame = cf
        task.wait(0.5)
    end
    root.CFrame = initialPosition
end

local function teleportAndLook()
    local enemy = currentMob and findEnemy(currentMob)
    if not enemy or not root then return end
    local enemyRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Torso")
    if not enemyRoot then
        local success, pivot = pcall(function() return enemy:GetPivot() end)
        if success and pivot then enemyRoot = { Position = pivot.Position, CFrame = pivot } end
        if not enemyRoot then return end
    end
    local enemyHum = enemy:FindFirstChildOfClass("Humanoid")
    local currentDistance = FARM_DISTANCE
    
    local isExecuting = false
    if enemy:FindFirstChild("Executing") or enemy:FindFirstChild("Execute") or enemy:FindFirstChild("Execution") then
        isExecuting = true
    end
    if enemyRoot.Anchored or (enemyRoot.Parent and enemyRoot.Parent:FindFirstChild("Grip") or enemyRoot.Parent:FindFirstChild("Neck")) then
        isExecuting = true
    end
    if enemyHum and enemyHum.Health <= 5 and (root.Position - enemyRoot.Position).Magnitude < 10 then
        isExecuting = true
    end
    if isExecuting then
        if Players:GetPlayerFromCharacter(enemy) then
            currentDistance = PLAYER_EXECUTE_DISTANCE
        else
            currentDistance = EXECUTE_DISTANCE
        end
    end
    
    local offset = Vector3.new(0, 0, 0)
    if teleportMode == "Below" then
        offset = Vector3.new(0, -currentDistance, 0)
    elseif teleportMode == "Above" then
        offset = Vector3.new(0, currentDistance, 0)
    elseif teleportMode == "Behind" then
        local lookVec = enemyRoot.CFrame.LookVector
        offset = -lookVec * currentDistance
    end
    local targetPos = enemyRoot.Position + offset
    root.CFrame = CFrame.new(targetPos, enemyRoot.Position)
    root.Velocity = Vector3.new(0,0,0)
end

local function teleportAndLookWithKeys()
    local b_timer = 0
    while teleportAndLookLooping do
        teleportAndLook()
        VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        if b_timer <= 0 then
            VIM:SendKeyEvent(true, Enum.KeyCode.B, false, game)
            VIM:SendKeyEvent(false, Enum.KeyCode.B, false, game)
            b_timer = 5
        end
        local delta = 0.2
        b_timer = b_timer - delta
        task.wait(delta)
    end
end

local function toggleTeleport(enable, mobName)
    if enable then
        if not connection then
            teleportAndLookLooping = true
            connection = RunService.RenderStepped:Connect(teleportAndLook)
            spawn(teleportAndLookWithKeys)
        end
        currentMob = mobName
        isEnabled = true
    else
        if connection then connection:Disconnect() connection = nil end
        teleportAndLookLooping = false
        isEnabled = false
        currentMob = nil
    end
end

local function autoAttackLoop()
    while autoAttack do
        VIM:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.05)
        VIM:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        task.wait(0.15)
    end
end

-- ==========================================
-- NOVA FUNÇÃO: TELEPORT TO PLAYER (FLY SPEED)
-- ==========================================
local function forceTeleportToPlayer(targetName)
    local target = Players:FindFirstChild(targetName)
    if not target or not target.Character or not root then return end
    
    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
    if targetRoot then
        root.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
        root.Velocity = Vector3.new(0,0,0)
    else
        local pivot = target.Character:GetPivot()
        root.CFrame = pivot + Vector3.new(0, 3, 0)
        root.Velocity = Vector3.new(0,0,0)
    end
end

local function forceTeleportToNPC(npcName)
    local npc = findEnemy(npcName)
    if not npc or not root then return end
    
    local npcRoot = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso")
    if npcRoot then
        root.CFrame = npcRoot.CFrame + Vector3.new(0, 3, 0)
        root.Velocity = Vector3.new(0,0,0)
    else
        local success, pivot = pcall(function() return npc:GetPivot() end)
        if success then
            root.CFrame = pivot + Vector3.new(0, 3, 0)
            root.Velocity = Vector3.new(0,0,0)
        end
    end
end

-- ==========================================
-- UI TABS (REORGANIZADAS)
-- ==========================================
local geralTab = Window:NewTab("Geral")
local farmGeralTab = Window:NewTab("Farm Geral") -- ABA 2: GERAL
local mobTab = Window:NewTab("Farm Mobs")      -- ABA 3: MOBS
local farmCasteloTab = Window:NewTab("Farm Castelo") -- NOVA ABA: FARM CASTELO
local playersTab = Window:NewTab("Players")
local tpTab = Window:NewTab("Teleportes")

-- ==========================================
-- GERAL TAB
-- ==========================================
local flySec = geralTab:NewSection("Fly Híbrido")
flySec:NewToggle("Ativar Fly", "WASD + Space↑ + C↓", function(state)
    flyToggle = state
    if state then setupFly() else
        humanoid.PlatformStand = false
        if flyConn then flyConn:Disconnect() end
        pcall(function() if bg then bg:Destroy() end if bv then bv:Destroy() end end)
    end
end)
flySec:NewSlider("Força do Fly", "0-5000 (Preciso) | 5k-10k (Turbo)", 10000, 150, function(v) flySpeedValue = v end)

local speedSec = geralTab:NewSection("Speed no Chão")
speedSec:NewToggle("Ativar Speed", "Aumenta velocidade", function(state)
    speedToggle = state
    if state then
        if speedConn then speedConn:Disconnect() end
        speedConn = RunService.Heartbeat:Connect(function()
            if humanoid and humanoid.Health > 0 and not isInBlockedState(humanoid) then humanoid.WalkSpeed = walkSpeed end
        end)
    else
        if speedConn then speedConn:Disconnect() end
        if humanoid then humanoid.WalkSpeed = BASE_WALKSPEED end
    end
end)
speedSec:NewSlider("Valor Speed", "Normal ~100", 1000, 100, function(v) walkSpeed = v end)

local movementSec = geralTab:NewSection("Movimento")
movementSec:NewToggle("Click TP", "Clique para teleportar", function(state)
    toggleClickTP(state)
end)
movementSec:NewToggle("No Clip", "Atravesse paredes", function(state)
    toggleNoclip(state)
end)

local visualSec = geralTab:NewSection("Visual")
visualSec:NewToggle("No Fog (Lite Básico)", "Remove apenas neblina", function(state)
    noFogEnabled = state
    applyNoFog(state)
end)
visualSec:NewToggle("SUPER ULTRA LITE", "DEIXA TUDO FEIO E LISO (FPS)", function(state)
    toggleUltraLite(state)
end)

local cheatsSec = geralTab:NewSection("Cheats Adicionais")

-- ==========================================
-- FARM GERAL TAB
-- ==========================================

local configSec = farmGeralTab:NewSection("Configurações de Farm")
configSec:NewDropdown("Posição de Teleporte", "Escolha a posição relativa ao alvo", {"Below", "Above", "Behind"}, function(v)
    teleportMode = v
end)
configSec:NewSlider("Distância do Alvo", "Ajusta quantos studs de distância do mob/player", 20, 0.1, function(valor)
    FARM_DISTANCE = valor
end)
configSec:NewSlider("Distância no Execute", "Quanto fugir quando estiver executando (30-60 recomendado)", 100, 0.1, function(v)
    EXECUTE_DISTANCE = v
end)

local combatSec = farmGeralTab:NewSection("Combat")
combatSec:NewToggle("Auto Attack M1", "Simula clique do mouse", function(state)
    autoAttack = state
    if state then spawn(autoAttackLoop) end
end)

local trinketSec = farmGeralTab:NewSection("Farm Trinkets")
trinketSec:NewToggle("Auto Farm Trinkets", "Teleporta e coleta automaticamente", function(state)
    trinketFarm = state
    if state then
        spawn(function()
            while trinketFarm do
                task.wait(0.1)
                pcall(function()
                    if workspace:FindFirstChild("Trinkets") then
                        for _, trinket in pairs(workspace.Trinkets:GetChildren()) do
                            if not trinketFarm then break end
                            if trinket:IsA("Part") and trinket:FindFirstChild("Spawned") then
                                if root then root.CFrame = trinket.CFrame * CFrame.new(0, 3, 0) end
                                task.wait(0.15)
                                local attempts = 0
                                while trinketFarm and trinket.Parent and trinket:FindFirstChild("Spawned") and attempts < 10 do
                                    VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(0.05)
                                    VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                    task.wait(0.1)
                                    attempts = attempts + 1
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

-- ==========================================
-- FARM MOBS TAB
-- ==========================================


local raidSec = mobTab:NewSection("Farm Raids")
raidSec:NewButton("TP Raid", "Teleporta para a área da Raid", function() if root then root.CFrame = raidCFrame end end)
raidSec:NewToggle("Farm Shinobu Raid", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "ShinoubuRaid") else toggleTeleport(false) end
end)
raidSec:NewToggle("Farm Rengoku Raid", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "RengokuRaid") else toggleTeleport(false) end
end)
raidSec:NewToggle("Farm Kokushibo Raid", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "KokushiboRaid") else toggleTeleport(false) end
end)
raidSec:NewToggle("Farm Yoriichi Raid", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "Yoriichi") else toggleTeleport(false) end
end)
raidSec:NewToggle("Farm Enemy Raid", "Foca no inimigo 'Enemy'", function(state)
    if state then toggleTeleport(true, "Enemy") else toggleTeleport(false) end
end)

local mobSec = mobTab:NewSection("Farm Mobs")
mobSec:NewButton("Carregar Todos Mobs", "Teleporta para spawn points", function() loadAllMobs() end)

local mobToggles = {}
for _, mob in ipairs(MOBS) do
    local tog = mobSec:NewToggle("Farm "..mob, "Auto teleport", function(state)
        if state then toggleTeleport(true, mob) else toggleTeleport(false) end
    end)
    mobToggles[mob] = tog
end

-- ==========================================
-- FARM CASTELO TAB (NOVA)
-- ==========================================

local casteloTpSec = farmCasteloTab:NewSection("Teleportes Castelo")
casteloTpSec:NewButton("Slayer Corps Castelo TP", "TP para coordenada 1", function() if root then root.CFrame = casteloCoord1 end end)
casteloTpSec:NewButton("Akaza|Doma TP", "TP para coordenada 2", function() if root then root.CFrame = casteloCoord2 end end)
casteloTpSec:NewButton("Kokushibo TP", "TP para coordenada 3", function() if root then root.CFrame = casteloCoord3 end end)

local casteloMobSec = farmCasteloTab:NewSection("Farm Mobs Castelo")
casteloMobSec:NewToggle("Farm Akaza", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "Akaza") else toggleTeleport(false) end
end)
casteloMobSec:NewToggle("Farm Doma", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "Doma") else toggleTeleport(false) end
end)
casteloMobSec:NewToggle("Farm Kokushibo", "Auto teleport + ataque", function(state)
    if state then toggleTeleport(true, "Kokushibo") else toggleTeleport(false) end
end)

-- ==========================================
-- PLAYERS TAB
-- ==========================================
local playerSec = playersTab:NewSection("Interagir com Players")
local playerDropdown = nil
local function getPlayerList()
    local list = {}
    for _, v in pairs(Players:GetPlayers()) do if v ~= player then table.insert(list, v.Name) end end
    return list
end
playerDropdown = playerSec:NewDropdown("Selecionar Player", "Escolha o alvo", getPlayerList(), function(v) selectedPlayerName = v end)
playerSec:NewButton("Atualizar Lista", "Clica se entrar gente nova", function() if playerDropdown then playerDropdown:Refresh(getPlayerList()) end end)
playerSec:NewButton("Ir até Player (TP Fly)", "Voa rápido (Carrega mapa)", function() if selectedPlayerName then forceTeleportToPlayer(selectedPlayerName) end end)
playerSec:NewToggle("Farmar Player", "TP Costas + Seguir", function(state)
    if state and selectedPlayerName then toggleTeleport(true, selectedPlayerName) else toggleTeleport(false) end
end)
playerSec:NewToggle("ESP Players (WallHack)", "Marca todos players no mapa!", function(state)
    toggleESP(state)
end)

local playerConfigSec = playersTab:NewSection("Configurações Player Farm")
playerConfigSec:NewSlider("Distância no Execute Player", "Quanto fugir quando estiver executando player", 100, 0.1, function(v)
    PLAYER_EXECUTE_DISTANCE = v
end)

local spectateSec = playersTab:NewSection("Spectate Player (Câmera de Cima)")
local spectateDropdown = nil
spectateDropdown = spectateSec:NewDropdown("Selecionar Player", "Escolha quem assistir", getPlayerList(), function(v) selectedPlayerName = v end)
spectateSec:NewSlider("Altura da Câmera", "Quanto mais alto, mais acima fica", 50, 5, function(v) spectateHeight = v end)
spectateSec:NewSlider("Distância Lateral", "Afastamento horizontal", 30, 1, function(v) spectateDistance = v end)
spectateSec:NewToggle("Iniciar Spectate", "Camera de cima olhando para baixo", function(state)
    if state and selectedPlayerName then
        toggleSpectate(true, selectedPlayerName)
    else
        toggleSpectate(false)
    end
end)
spectateSec:NewButton("Atualizar Lista Spectate", "Clica se entrar gente nova", function() if spectateDropdown then spectateDropdown:Refresh(getPlayerList()) end end)

-- ==========================================
-- TELEPORTES TAB
-- ==========================================
local tpMainSec = tpTab:NewSection("Utilitários")
tpMainSec:NewButton("Carregar Todo o Mapa", "Teleporta para todos os lugares conhecidos", function() loadAllMap() end)
tpMainSec:NewButton("TP Raid", "Teleporta para a área da Raid", function() if root then root.CFrame = raidCFrame end end)

local vilaSec = tpTab:NewSection("Vilas & Locais")
vilaSec:NewButton("Hayakawa Village", "TP", function() if root then root.CFrame = okuyaCFrame end end)
vilaSec:NewButton("Okuya Village", "TP", function() if root then root.CFrame = hayakawaCFrame end end)
vilaSec:NewButton("Kamakura Village", "TP", function() if root then root.CFrame = kamakuraCFrame end end)
vilaSec:NewButton("Slayer Corps", "TP", function() if root then root.CFrame = distritoCFrame end end)
vilaSec:NewButton("Distrito", "TP", function() if root then root.CFrame = slayerCFrame end end)
vilaSec:NewButton("Slayer Exam", "TP", function() if root then root.CFrame = slayerExamCFrame end end)

local breathSec = tpTab:NewSection("Respirações")
breathSec:NewButton("Mist Breath", "TP", function() if root then root.CFrame = mistBreathCFrame end end)
breathSec:NewButton("Water Breath", "TP", function() if root then root.CFrame = waterBreathCFrame end end)
breathSec:NewButton("Wind Breath", "TP", function() if root then root.CFrame = windBreathCFrame end end)
breathSec:NewButton("Thunder Breath", "TP", function() if root then root.CFrame = thunderBreathCFrame end end)
breathSec:NewButton("Insect Breath", "TP", function() if root then root.CFrame = insectBreathCFrame end end)
breathSec:NewButton("Flame Breath", "TP", function() if root then root.CFrame = flameBreathCFrame end end)
breathSec:NewButton("Sun Breath", "TP", function() if root then root.CFrame = sunBreathCFrame end end)
breathSec:NewButton("Moon Breath", "TP", function() if root then root.CFrame = moonBreathCFrame end end)
breathSec:NewButton("Beast Breath", "TP", function() if root then root.CFrame = beastBreathCFrame end end)
breathSec:NewButton("Sound Breath", "TP", function() if root then root.CFrame = soundBreathCFrame end end)
breathSec:NewButton("Flower Breath", "TP", function() if root then root.CFrame = flowerBreathCFrame end end)
breathSec:NewButton("Serpent Breath", "TP", function() if root then root.CFrame = serpentBreathCFrame end end)
breathSec:NewButton("Love Breath", "TP", function() if root then root.CFrame = loveBreathCFrame end end)

-- ==========================================
-- ABA DEVELOPER
-- ==========================================
local devTab = Window:NewTab("Developer")
local devSec = devTab:NewSection("Ferramentas Developer")

devSec:NewToggle("Mostrar Coords (DEV)", "X Y Z na tela (Apenas DEV)", function(state)
    coordsEnabled = state
    if state then createCoordsGui() startCoordsUpdate() else
        if coordsGui then coordsGui:Destroy() end
        if coordsConn then coordsConn:Disconnect() end
    end
end)

local function createNPCViewer()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    if playerGui:FindFirstChild("NPCViewerGui") then playerGui:FindFirstChild("NPCViewerGui"):Destroy() end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NPCViewerGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BackgroundTransparency = 0.5
    background.Parent = screenGui
    local popup = Instance.new("Frame")
    popup.Name = "Popup"
    popup.Size = UDim2.new(0, 500, 0, 600)
    popup.Position = UDim2.new(0.5, -250, 0.5, -300)
    popup.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    popup.BorderSizePixel = 0
    popup.Parent = screenGui
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = popup
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    header.BorderSizePixel = 0
    header.Parent = popup
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 8)
    headerCorner.Parent = header
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -40, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "NPCs Carregados - Demon Fall"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.Parent = header
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -40, 0, 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Text = "✕"
    closeBtn.TextSize = 20
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = header
    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 4)
    closeBtnCorner.Parent = closeBtn
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Size = UDim2.new(1, -20, 1, -70)
    scrollFrame.Position = UDim2.new(0, 10, 0, 60)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 8
    scrollFrame.Parent = popup
    local scrollCorner = Instance.new("UICorner")
    scrollCorner.CornerRadius = UDim.new(0, 4)
    scrollCorner.Parent = scrollFrame
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 5)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scrollFrame
    local function findAllNPCs()
        local npcs = {}
        local workspace = game:GetService("Workspace")
        local function searchFolder(folder)
            for _, child in pairs(folder:GetChildren()) do
                if child:FindFirstChild("Humanoid") and not Players:FindFirstChild(child.Name) then
                    table.insert(npcs, child)
                end
                if child:IsA("Folder") or child:IsA("Model") then
                    searchFolder(child)
                end
            end
        end
        searchFolder(workspace)
        return npcs
    end
    local function addNPCItem(npcName)
        local item = Instance.new("Frame")
        item.Name = npcName
        item.Size = UDim2.new(1, 0, 0, 50)
        item.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        item.BorderSizePixel = 0
        item.Parent = scrollFrame
        local itemCorner = Instance.new("UICorner")
        itemCorner.CornerRadius = UDim.new(0, 4)
        itemCorner.Parent = item
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, -10, 1, 0)
        textLabel.Position = UDim2.new(0, 5, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "🧟 " .. npcName
        textLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
        textLabel.TextSize = 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Font = Enum.Font.Gotham
        textLabel.Parent = item
    end
    local npcs = findAllNPCs()
    if #npcs == 0 then
        local emptyLabel = Instance.new("TextLabel")
        emptyLabel.Size = UDim2.new(1, 0, 1, 0)
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Text = "Nenhum NPC encontrado!"
        emptyLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        emptyLabel.TextSize = 16
        emptyLabel.Font = Enum.Font.Gotham
        emptyLabel.Parent = scrollFrame
    else
        for _, npc in pairs(npcs) do
            addNPCItem(npc.Name)
        end
    end
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    end)
    closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)
    background.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then screenGui:Destroy() end
    end)
end

devSec:NewButton("Visualizar NPCs Carregados", "Abre popup dos NPCs existentes", function()
    createNPCViewer()
end)

local customSec = devTab:NewSection("Custom TP & Farm Entidade")
local customTargetName = ""
customSec:NewTextBox("Nome da Entidade", "Digite o nome exato", function(text)
    customTargetName = text
end)
customSec:NewButton("TP para Entidade", "Teleporta para o nome digitado acima", function()
    if customTargetName ~= "" then
        local isPlayer = Players:FindFirstChild(customTargetName)
        if isPlayer then
            forceTeleportToPlayer(customTargetName)
        else
            forceTeleportToNPC(customTargetName)
        end
    end
end)
customSec:NewToggle("Farm Entidade", "Farm no nome digitado acima (mesma logica)", function(state)
    if customTargetName ~= "" then
        if state then 
            toggleTeleport(true, customTargetName) 
        else 
            toggleTeleport(false) 
        end
    end
end)

local morphSec = devTab:NewSection("Morph Tools")
local morphDropdown = nil
local selectedMorphTarget = nil
local function getNPCList()
    local npcs = {}
    local function searchFolder(folder)
        for _, child in pairs(folder:GetChildren()) do
            if child:FindFirstChild("Humanoid") and not Players:FindFirstChild(child.Name) then
                table.insert(npcs, child.Name)
            end
            if child:IsA("Folder") or child:IsA("Model") then
                searchFolder(child)
            end
        end
    end
    searchFolder(workspace)
    return npcs
end
morphDropdown = morphSec:NewDropdown("Select NPC to Morph", "Choose NPC", getNPCList(), function(v) selectedMorphTarget = v end)
morphSec:NewButton("Refresh NPC List", "Update the list of loaded NPCs", function() if morphDropdown then morphDropdown:Refresh(getNPCList()) end end)
local function morphInto(npcName)
    local npc = findEnemy(npcName)
    if not npc then return end
    local npcHum = npc:FindFirstChildOfClass("Humanoid")
    if not npcHum then return end
    local desc = npcHum:GetAppliedDescription()
    if not desc then return end

    -- Apply body colors
    local bodyParts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
    local bodyColors = {desc.HeadColor, desc.TorsoColor, desc.LeftArmColor, desc.RightArmColor, desc.LeftLegColor, desc.RightLegColor}
    for i, partName in ipairs(bodyParts) do
        local part = char:FindFirstChild(partName)
        if part then
            part.Color = bodyColors[i]
        end
    end

    -- Apply clothing
    local clothingTypes = {"Shirt", "Pants", "ShirtGraphic"}
    local clothingProps = {"ShirtTemplate", "PantsTemplate", "Graphic"}
    local clothingIds = {desc.Shirt, desc.Pants, desc.GraphicTShirt}
    for i, clothType in ipairs(clothingTypes) do
        local existing = char:FindFirstChildOfClass(clothType)
        if not existing then
            existing = Instance.new(clothType)
            existing.Parent = char
        end
        if clothingIds[i] ~= 0 then
            existing[clothingProps[i]] = "rbxassetid://" .. clothingIds[i]
        else
            existing:Destroy()
        end
    end

    -- Apply face
    local head = char:FindFirstChild("Head")
    if head then
        local face = head:FindFirstChild("face") or head:FindFirstChildOfClass("Decal")
        if face then face:Destroy() end
        if desc.Face ~= 0 then
            face = Instance.new("Decal")
            face.Name = "face"
            face.Texture = "rbxassetid://" .. desc.Face
            face.Parent = head
        end
    end

    -- Apply scales
    local scales = {
        BodyDepthScale = desc.Depth,
        BodyHeightScale = desc.Height,
        BodyWidthScale = desc.Width,
        HeadScale = desc.Head,
        BodyProportionScale = desc.Proportion
    }
    for scaleName, value in pairs(scales) do
        local scaleObj = humanoid:FindFirstChild(scaleName)
        if scaleObj then
            scaleObj.Value = value
        end
    end

    -- Apply accessories by cloning from NPC
    for _, acc in pairs(char:GetChildren()) do
        if acc:IsA("Accessory") then acc:Destroy() end
    end
    for _, acc in pairs(npc:GetChildren()) do
        if acc:IsA("Accessory") then
            local clone = acc:Clone()
            clone.Parent = char
        end
    end
end
morphSec:NewButton("Morph into Selected NPC", "Copy appearance from selected NPC", function()
    if selectedMorphTarget then morphInto(selectedMorphTarget) end
end)
