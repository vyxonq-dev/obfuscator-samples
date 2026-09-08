local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local CollectionService = game:GetService("CollectionService")

local btnClickSound = Instance.new("Sound")
btnClickSound.SoundId = "rbxassetid://12221967"
btnClickSound.Volume = 0.5
btnClickSound.Parent = SoundService

local sliderSound = Instance.new("Sound")                    
sliderSound.SoundId = "rbxassetid://12221976"
sliderSound.Volume = 0.3
sliderSound.Parent = SoundService

local dropdownSound = Instance.new("Sound")
dropdownSound.SoundId = "rbxassetid://12221831"
dropdownSound.Volume = 0.4
dropdownSound.Parent = SoundService

local toggleSound = Instance.new("Sound")
toggleSound.SoundId = "rbxassetid://12221976"
toggleSound.Volume = 0.4
toggleSound.Parent = SoundService

local function btnclick()
    btnClickSound:Play()
end

local function slidersound()
    sliderSound:Play()
end

local function dropdownsound()
    dropdownSound:Play()
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()
local Window = Library:Window({
    Title = "Brick",
    Desc = "I'm bricking it, I'm bricking it",
    Icon = 127155823074936,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 300)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "what does this\nbutton do"
    }
})

-- Sidebar Vertical Separator
local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(0, 140, 0, 0) -- adjust if needed
SidebarLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 5
SidebarLine.Name = "SidebarLine"
SidebarLine.Parent = game:GetService("CoreGui") -- Or Window.Gui if accessible

local player = game.Players.LocalPlayer
settings().Physics.AllowSleep = false
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
local claimedParts = {}
local connection = nil
local heartbeatConnection = nil
local lastCleanupTime = 0
local cleanupInterval = 5
local maxParts = math.huge
local partCheckCooldown = {}
local startt = false
local magnetEnabled = false
local magnetParts = {}
local magnetClaimedParts = {}
local magnetLastUpdate = 0
local magnetConnection = nil
local magnetEffectModel = Instance.new("Model")
local vortexEnabled = false
local vortexRadius = 90
local vortexStrength = 3
local vortexDirection = 1
local vortexParts = {}
local magnetConnection
local magnetMode = "Pull"
local magnetStrength = 100
local magnetRadius = 50
local mag = {}
local WIND_STRENGTH = 7000 
local INITIAL_BOOST = 12
local MAX_HORIZONTAL_SPEED = 45
local GUST_FREQUENCY = 0.6
local GUST_VARIATION = 0.6
local RANDOM_SEED_SCALE = 7.3
local GRAVITY_MULTIPLIER = 1.5
local INITIAL_BOOST = 10
local MAX_SPEED = 20
local ringParts = {}
local radius = 50
local speed = 2
local isActive = false
local lastValidPosition = Vector3.new(0, 0, 0)
local UPDATE_INTERVAL = 0
local lastUpdate = tick()
local currentMode = 2
local orbitEnabled = false
local farness = 50
local height = 1
local fast = 555
local targetplr = "me"
local angle = 1
local bhradius = 0
local angleSpeed = 10
local blackHoleActive = false
local getpart = 300
local networkown = {}
local cb = nil
local ts = 10
local ss = 10
local ucf = false
local ohb = nil
local tpuaActive = false
local tpuaTarget = "others"
local tpuaHandler = nil
local currentTargetPlayer = LocalPlayer
local Folder, Attachment1, humanoidRootPart
local controlledParts = {}
local descendantConnection = nil
local renderLoop = nil
local blackHoleSphere = nil
local blackHoleActive = false
local blackHoleSuctionStrength = 100
local blackHoleRadius = 50
local blackHoleConnection = nil
local blackHoleParts = {}
local windsEnabled = false
local gravityEnabled = false
local magnetEnabled = false

local PartAttachTool = {
    Tool = nil,
    Welds = {},
    Connection = nil
}
local AntiTripSystem = {
    Enabled = false,
    Connections = {
        heartbeat = nil,
        characterAdded = nil
    }
}
local config = {
    BaseRadius = 10,
    TopRadius = 40,
    Height = 100,
    RotationSpeed = 40 * math.pi,
    LiftSpeed = 10,
    TangentialForce = 200,
    UpwardForce = 95,
    MaxParts = 1e9,
    SimulationRadius = 2000,
    MaxMass = math.huge,
    ParticleCount = 50,
    FunnelWidth = 0.9,
    WobbleIntensity = 0.9,
    DebrisLifetime = 15,
    UpdateRate = 0.05
}
local modes = {
    "Vertical PartOrbit",
    "Horizontal PartOrbit", 
    "Vertical & Horizontal",
    "Left Tilt",
    "Right Tilt",
    "Left & Right Tilt",
    "Spiral",
    "Figure 8",
    "DNA Helix",
    "Flower Pattern",
    "Galaxy Spiral",
    "Infinity",
    "Wave Pattern",
    "Atomic Orbit",
    "Butterfly",
    "Tornado",
    "Heart",
    "Vortex",
    "Pendulum",
    "Lemniscate 3D",
    "Star Pattern",
    "Trefoil Knot",
    "Double Spiral",
    "Mobius Strip",
    "Hypocycloid",
    "Sphere Spiral",
    "Asteroid Belt",
    "Rose Curve",
    "Lissajous",
    "Polygonal Orbit"
}

local magnetConfig = {
    BaseRadius = 10,
    MaxRadius = 50,
    Strength = 100,
    UpdateRate = 0.05,
    SimulationRadius = 2000,
    MaxParts = math.huge,
    MaxMass = math.huge,
    ClaimDuration = 30,
    VisualEffects = false,
    Direction = "Pull"
}

function pcz()
    pcall(function()
        sethiddenproperty(player, "SimulationRadius", getpart)
        sethiddenproperty(player, "MaxSimulationRadius", getpart)
        sethiddenproperty(player, "MaximumSimulationRadius", getpart)
        if game:GetService("NetworkClient") then
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
        end
        local mt = getrawmetatable(game)
        if mt and setreadonly then
            setreadonly(mt, false)
            local oldIndex = mt.__index
            mt.__index = newcclosure(function(self, key)
                if key == "NetworkOwnership" then
                    return Enum.NetworkOwnership.Manual
                end
                return oldIndex(self, key)
            end)
        end
    end)
    
    if heartbeatConnection then 
        heartbeatConnection:Disconnect() 
        heartbeatConnection = nil
    end
    
    if connection then 
        connection:Disconnect() 
        connection = nil
    end

    local MAX_PARTS_PER_FRAME = 10
    local NETWORK_UPDATE_INTERVAL = 3.0
    local FRAME_TIME = 1 / 60
    local lastFrameTime = tick()
    local lastNetworkUpdate = 0
    local lastCleanupTime = 0
    local CLEANUP_INTERVAL = 3
    local processedPartsCount = 0
    
    local function setupRespawnHandler()
        if player.Character then
            player.Character:WaitForChild("Humanoid").Died:Connect(function()
                task.wait(2)
                pcz()
            end)
        end
    end
    
    setupRespawnHandler()
    
    local function scanInitialParts()
        local character = player.Character
        local center = character and character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position or Vector3.new(0, 0, 0)
        
        local parts = workspace:GetPartBoundsInRadius(center, getpart)
        local partsProcessed = 0
        local maxInitialParts = 40
        
        for i, part in ipairs(parts) do
            if partsProcessed >= maxInitialParts then
                break
            end
            
            if part and part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(player.Character) then
                if not claimedParts[part] then
                    claimedParts[part] = {
                        CanCollide = part.CanCollide,
                        claimed = true,
                        OriginalMassless = part.Massless,
                        lastNetworkCheck = 0
                    }
                    
                    pcall(function()
                        part.CanCollide = false
                        part.Massless = true
                        part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001)
                        
                        if (part.Position - center).Magnitude < 100 then
                            local success = pcall(function()
                                part:SetNetworkOwner(player)
                            end)
                            
                            if not success then
                                pcall(function()
                                    sethiddenproperty(part, "NetworkOwnership", Enum.NetworkOwnership.Manual)
                                end)
                            end
                        end
                        
                        for _, child in ipairs(part:GetChildren()) do
                            if child:IsA("Constraint") or child:IsA("BodyMover") then
                                child:Destroy()
                            end
                        end
                    end)
                    
                    partsProcessed = partsProcessed + 1
                end
            end
            
            if partsProcessed % 15 == 0 then
                RunService.Heartbeat:Wait()
            end
        end
    end
    
    scanInitialParts()
    
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        local currentTime = tick()
        
        if currentTime - lastFrameTime < FRAME_TIME then
            return
        end
        lastFrameTime = currentTime
        
        if currentTime - lastNetworkUpdate >= NETWORK_UPDATE_INTERVAL then
            pcall(function()
                sethiddenproperty(player, "SimulationRadius", getpart)
                sethiddenproperty(player, "MaxSimulationRadius", getpart)
            end)
            lastNetworkUpdate = currentTime
        end
        
        if currentTime - lastCleanupTime >= CLEANUP_INTERVAL then
            local partsToRemove = {}
            for part, data in pairs(claimedParts) do
                if not part or not part.Parent then
                    table.insert(partsToRemove, part)
                end
            end
            for _, part in ipairs(partsToRemove) do
                claimedParts[part] = nil
            end
            lastCleanupTime = currentTime
        end
        
        local processed = 0
        local partsToRemove = {}
        
        for part, data in pairs(claimedParts) do
            if processed >= MAX_PARTS_PER_FRAME then
                break
            end
            
            if part and part.Parent then
                pcall(function()
                    local shouldCheckNetwork = (currentTime - data.lastNetworkCheck) > 5
                    
                    if shouldCheckNetwork then
                        local owner = part:GetNetworkOwner()
                        if owner ~= player then
                            local success = pcall(function()
                                part:SetNetworkOwner(player)
                            end)
                            
                            if not success then
                                pcall(function()
                                    sethiddenproperty(part, "NetworkOwnership", Enum.NetworkOwnership.Manual)
                                end)
                            end
                        end
                        data.lastNetworkCheck = currentTime
                    end
                    
                    if part.CanCollide ~= false then
                        part.CanCollide = false
                    end
                    if part.Massless ~= true then
                        part.Massless = true
                    end
                    if part.Velocity.Magnitude > 5 then
                        part.Velocity = part.Velocity * 0.9
                    end
                    if part.RotVelocity.Magnitude > 5 then
                        part.RotVelocity = part.RotVelocity * 0.9
                    end
                    
                    processed = processed + 1
                end)
            else
                table.insert(partsToRemove, part)
            end
        end
        for _, part in ipairs(partsToRemove) do
            claimedParts[part] = nil
        end
        
        processedPartsCount = processed
    end)
    connection = Workspace.DescendantAdded:Connect(function(part)
        if part and part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(player.Character) then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local distance = (part.Position - character.HumanoidRootPart.Position).Magnitude
                if distance > 200 then
                    return
                end
            end
            task.wait(0.2)
            if not claimedParts[part] then
                claimedParts[part] = {
                    CanCollide = part.CanCollide,
                    claimed = true,
                    OriginalMassless = part.Massless,
                    lastNetworkCheck = 0
                }
                
                pcall(function()
                    part.CanCollide = false
                    part.Massless = true
                    part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001)
                    task.spawn(function()
                        task.wait(0.5)
                        if part and part.Parent and claimedParts[part] then
                            local success = pcall(function()
                                part:SetNetworkOwner(player)
                            end)
                            
                            if not success then
                                pcall(function()
                                    sethiddenproperty(part, "NetworkOwnership", Enum.NetworkOwnership.Manual)
                                end)
                            end
                        end
                    end)
                end)
            end
        end
    end)
    
    player.CharacterAdded:Connect(function(character)
        task.wait(3)
        for part, data in pairs(claimedParts) do
            if part and part.Parent then
                pcall(function()
                    part.CanCollide = data.CanCollide
                    part.Massless = data.OriginalMassless
                    part.CustomPhysicalProperties = nil
                end)
            end
        end
        claimedParts = {}
        pcz()
    end)
end

Window:Notify({
    Title = "Brick",
    Desc = "PartClaim Enabled",
    Time = 5
})

local function fly()
loadstring(game:HttpGet("https://raw.githubusercontent.com/OBFhm5650lol/F/refs/heads/main/F", true))()
end

local function wha()
getgenv().isnetworkowner = newcclosure(function(part)
  return (part.ReceiveAge == 0 and gethiddenproperty(part, "NetworkIsSleeping") == false)
end)

game.Players.LocalPlayer.SimulationRadius = math.huge
game.Players.LocalPlayer.SimulationRadiusChanged:Connect(function()
  game.Players.LocalPlayer.ReplicationFocus = workspace
  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
  sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
  sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
end)

game:GetService("RunService").PreSimulation:Connect(function()
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 50)
  for _, part in next, parts do
    if part.Anchored == false and not isnetworkowner(part) and part.Velocity.Magnitude >= 4 and not game.Players:GetPlayerFromCharacter(part.Parent) then
part.CanCollide = isnetworkowner(part)
part.CanTouch = isnetworkowner(part)
part.Velocity = Vector3.zero
part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
part.Massless = not isnetworkowner(part)
part.AssemblyLinearVelocity = Vector3.zero
part.AssemblyAngularVelocity = Vector3.zero

 for _, phys in next, part:GetDescendants() do
   if phys:IsA("Constraint") or phys:IsA("BodyMover") then
phys:Destroy()
   end
 end
 
    end
  end
 end)
end

local function toggleAntiTrip()
    if AntiTripSystem.Enabled then
        AntiTripSystem.Enabled = false
        if AntiTripSystem.Connections.heartbeat then
            AntiTripSystem.Connections.heartbeat:Disconnect()
            AntiTripSystem.Connections.heartbeat = nil
        end
        
        if AntiTripSystem.Connections.characterAdded then
            AntiTripSystem.Connections.characterAdded:Disconnect()
            AntiTripSystem.Connections.characterAdded = nil
        end
    else
        AntiTripSystem.Enabled = true
        local player = game.Players.LocalPlayer
        
        local function monitorHumanoid(humanoid)
            if AntiTripSystem.Connections.heartbeat then
                AntiTripSystem.Connections.heartbeat:Disconnect()
            end
            
            AntiTripSystem.Connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
                if not AntiTripSystem.Enabled or not humanoid or not humanoid.Parent then
                    if AntiTripSystem.Connections.heartbeat then
                        AntiTripSystem.Connections.heartbeat:Disconnect()
                        AntiTripSystem.Connections.heartbeat = nil
                    end
                    return
                end
                
                local state = humanoid:GetState()
                if state == Enum.HumanoidStateType.Seated or
                   state == Enum.HumanoidStateType.FallingDown or
                   state == Enum.HumanoidStateType.Ragdoll then
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
                
                if humanoid.Sit then
                    humanoid.Sit = false
                end
            end)
        end
        
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                monitorHumanoid(humanoid)
            end
        end
        
        if AntiTripSystem.Connections.characterAdded then
            AntiTripSystem.Connections.characterAdded:Disconnect()
        end
        
        AntiTripSystem.Connections.characterAdded = player.CharacterAdded:Connect(function(character)
            if AntiTripSystem.Enabled then
                local humanoid = character:WaitForChild("Humanoid")
                monitorHumanoid(humanoid)
            end
        end)
    end
end


local Tab = Window:Tab({Title = "PartClaim", Icon = "folder"}) do

    Tab:Button({
        Title = "Partclaim",
        Desc = nil,
        Callback = function()
            pcz()
            btnclick()
        end
    })

    Tab:Slider({
        Title = "Grab Part Radius",
        Desc = "more = lagger but better",
        Min = 100,
        Max = 10000,
        Rounding = 0,
        Value = 100,
        Callback = function(val)
            getpart = val
            pcall(function()
                sethiddenproperty(player, "SimulationRadius", getpart)
                sethiddenproperty(player, "MaxSimulationRadius", getpart)
            end)
            slidersound()
        end
    })
end

local Tab = Window:Tab({Title = "Client", Icon = "user"}) do
    Tab:Section({Title = "Character Controls"})
    
    Tab:Slider({
        Title = "WalkSpeed",
        Desc = "Adjust your character's movement speed",
        Min = 16,
        Max = 200,
        Rounding = 0,
        Value = 16,
        Callback = function(val)
            local character = LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = val
            end
            slidersound()
        end
    })
    
    Tab:Slider({
        Title = "JumpPower",
        Desc = "Adjust your character's jump height",
        Min = 50,
        Max = 500,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            local character = LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").JumpPower = val
            end
            slidersound()
        end
    })
    
    Tab:Button({
        Title = "Reset",
        Desc = "Reset walkspeed and jumppower to default",
        Callback = function()
            btnclick()
            local character = LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
            end
        end
    })
    Tab:Section({Title = "stuff"})
    local noclipEnabled = false
    local noclipConnection

    Tab:Toggle({
        Title = "Noclip",
        Desc = "Walk through walls",
        Value = false,
        Callback = function(v)
            noclipEnabled = v
            local character = LocalPlayer.Character
            
            if v then
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
                
                if noclipConnection then
                    noclipConnection:Disconnect()
                end
                
                noclipConnection = RunService.Stepped:Connect(function()
                    if noclipEnabled and LocalPlayer.Character then
                        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            else
                if noclipConnection then
                    noclipConnection:Disconnect()
                    noclipConnection = nil
                end
                
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
            togglesound()
        end
    })

    Tab:Button({
        Title = "Fly",
        Desc = "Opens the flygui",
        Callback = function()
            btnclick()
            fly()
        end
    })
    local infJumpEnabled = false
    local jumpConnection
    
    Tab:Toggle({
        Title = "Infinite Jump",
        Desc = "Jump infinitely in the air",
        Value = false,
        Callback = function(v)
            infJumpEnabled = v
            
            if v then
                jumpConnection = UserInputService.JumpRequest:Connect(function()
                    if infJumpEnabled then
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChildOfClass("Humanoid") then
                            character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                end)
            else
                if jumpConnection then
                    jumpConnection:Disconnect()
                    jumpConnection = nil
                end
            end
            togglesound()
        end
    })
end

local player = game.Players.LocalPlayer
local invertedParts = {}
local connection = nil
local heartbeatConnection = nil

local function cleanUpForces(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("BodyForce") or child:IsA("BodyVelocity") then
            child:Destroy()
        end
    end
end

local function getWindDirection(seed)
    local t = tick()
    local x = math.cos(t * (0.9 + seed * 0.01)) + 0.35 * math.sin(t * (1.7 + seed * 0.02))
    local z = math.sin(t * (0.8 + seed * 0.012)) + 0.35 * math.cos(t * (1.3 + seed * 0.015))
    local v = Vector3.new(x, 0, z)
    if v.Magnitude == 0 then
        return Vector3.new(1, 0, 0)
    end
    return v.Unit
end

local function applyWindForce()
    pcall(function()
        sethiddenproperty(player, "SimulationRadius", getpart)
        sethiddenproperty(player, "MaxSimulationRadius", getpart)
    end)
    
    local t = tick()
    for part, data in pairs(invertedParts) do
        if part and part.Parent then
            local gust = 1 + (math.sin(t * GUST_FREQUENCY + data.seed * RANDOM_SEED_SCALE) * GUST_VARIATION)
            
            local windDir = getWindDirection(data.seed)
            
            local forceVec = windDir * (part:GetMass() * WIND_STRENGTH * gust)
            
            if not data.bodyForce or not data.bodyForce.Parent then
                cleanUpForces(part)
                local bf = Instance.new("BodyForce")
                bf.Force = Vector3.new(forceVec.X, 0, forceVec.Z)
                bf.Parent = part
                data.bodyForce = bf
            else
                data.bodyForce.Force = Vector3.new(forceVec.X, 0, forceVec.Z)
            end

            local horizontalVel = Vector3.new(part.Velocity.X, 0, part.Velocity.Z)
            if horizontalVel.Magnitude > MAX_HORIZONTAL_SPEED then
                local clamped = horizontalVel.Unit * MAX_HORIZONTAL_SPEED
                part.Velocity = Vector3.new(clamped.X, part.Velocity.Y, clamped.Z)
            end
        else
            invertedParts[part] = nil
        end
    end
end

local function applyWindToPart(part)
    if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(player.Character) then
        if not invertedParts[part] then
            invertedParts[part] = {
                CanCollide = part.CanCollide,
                CustomPhysicalProperties = part.CustomPhysicalProperties,
                seed = math.random(),
                bodyForce = nil
            }
            
            cleanUpForces(part)
            
            part.CanCollide = true
            part.CustomPhysicalProperties = PhysicalProperties.new(
                0.3,
                0.2,
                0.1,
                0.3,
                0.1
            )
            
            local seed = invertedParts[part].seed * RANDOM_SEED_SCALE
            local initDir = Vector3.new(math.cos(seed), 0, math.sin(seed)).Unit
            part.Velocity = Vector3.new(initDir.X * INITIAL_BOOST, part.Velocity.Y, initDir.Z * INITIAL_BOOST)
            
            local bf = Instance.new("BodyForce")
            bf.Force = Vector3.new(0, 0, 0)
            bf.Parent = part
            invertedParts[part].bodyForce = bf
        end
    end
end

local function restoreGravity(part)
    if invertedParts[part] then
        cleanUpForces(part)
        part.CanCollide = invertedParts[part].CanCollide
        part.CustomPhysicalProperties = invertedParts[part].CustomPhysicalProperties
        part.Velocity = Vector3.new(0, part.Velocity.Y, 0)
        invertedParts[part] = nil
    end
end

function WindOn()
    pcall(function()
        sethiddenproperty(player, "SimulationRadius", SIMULATION_RADIUS)
    end)
    
    for _, part in ipairs(Workspace:GetDescendants()) do
        applyWindToPart(part)
    end
    
    if heartbeatConnection then heartbeatConnection:Disconnect() end
    heartbeatConnection = RunService.Heartbeat:Connect(applyWindForce)
    
    if connection then connection:Disconnect() end
    connection = Workspace.DescendantAdded:Connect(applyWindToPart)
end

function WindOff()
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
    
    for part in pairs(invertedParts) do
        if part and part.Parent then
            restoreGravity(part)
        end
    end
    
    invertedParts = {}
    
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

local player = game.Players.LocalPlayer
local invertedParts = {}
local connection = nil
local heartbeatConnection = nil

local function cleanUpForces(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("BodyForce") or child:IsA("BodyVelocity") then
            child:Destroy()
        end
    end
end

local function applyUpwardForce()
    sethiddenproperty(player, "SimulationRadius", SIMULATION_RADIUS)
    sethiddenproperty(player, "MaxSimulationRadius", SIMULATION_RADIUS)
    
    for part, data in pairs(invertedParts) do
        if part and part.Parent then
            local force = part:GetMass() * Workspace.Gravity * GRAVITY_MULTIPLIER
            
            if part.Velocity.Y < MAX_SPEED then
                part:ApplyImpulse(Vector3.new(0, force * 0.016, 0))
            end
            
            if part.Velocity.Y < 5 then
                part.Velocity = Vector3.new(0, 5, 0)
            end
        else
            invertedParts[part] = nil
        end
    end
end

local function invertGravity(part)
    if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(player.Character) then
        if not invertedParts[part] then
            invertedParts[part] = {
                CanCollide = part.CanCollide,
                CustomPhysicalProperties = part.CustomPhysicalProperties
            }
            
            cleanUpForces(part)
            
            part.CanCollide = false
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            
            part.Velocity = Vector3.new(0, INITIAL_BOOST, 0)
            
            local bodyForce = Instance.new("BodyForce")
            bodyForce.Force = Vector3.new(0, part:GetMass() * Workspace.Gravity * GRAVITY_MULTIPLIER, 0)
            bodyForce.Parent = part
            invertedParts[part].bodyForce = bodyForce
        end
    end
end

local function restoreGravity(part)
    if invertedParts[part] then
        cleanUpForces(part)
        part.CanCollide = invertedParts[part].CanCollide
        part.CustomPhysicalProperties = invertedParts[part].CustomPhysicalProperties
        part.Velocity = Vector3.new(0, 0, 0)
        invertedParts[part] = nil
    end
end

function GravOn()
    sethiddenproperty(player, "SimulationRadius", SIMULATION_RADIUS)
    
    for _, part in ipairs(Workspace:GetDescendants()) do
        invertGravity(part)
    end
    
    if heartbeatConnection then heartbeatConnection:Disconnect() end
    heartbeatConnection = RunService.Heartbeat:Connect(applyUpwardForce)
    
    if connection then connection:Disconnect() end
    connection = Workspace.DescendantAdded:Connect(invertGravity)
end

function GravOff()
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
    
    for part in pairs(invertedParts) do
        if part.Parent then
            restoreGravity(part)
        end
    end
    
    invertedParts = {}
    if connection then
        connection:Disconnect()
        connection = nil
    end
end



local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local active = false
local tornadoParts = {}
local visualParts = {}
local connection = nil
local visualConnection = nil
local lastUpdate = 0
local tornadoModel = Instance.new("Model")
tornadoModel.Name = "TornadoEffect"
tornadoModel.Parent = workspace

local function simrad()
    sethiddenproperty(player, "SimulationRadius", config.SimulationRadius)
    sethiddenproperty(player, "MaxSimulationRadius", config.SimulationRadius)
end

local function visa()
    for _, part in ipairs(visualParts) do
        part:Destroy()
    end
    visualParts = {}
    
    for i = 1, config.ParticleCount do
        local part = Instance.new("Part")
        part.Size = Vector3.new(0.7, 0.7, 0.7)
        part.Shape = Enum.PartType.Ball
        part.Material = Enum.Material.ForceField
        part.Color = Color3.fromRGB(0, 170, 255)
        part.Anchored = true
        part.CanCollide = false
        part.CastShadow = false
        part.Transparency = 0.1
        part.Parent = tornadoModel
        
        table.insert(visualParts, part)
    end
end

local function visa2(tornadoBase)
    if not active then return end
    
    local currentTime = tick()
    local wobbleOffset = Vector3.new(
        math.sin(currentTime * 2) * config.WobbleIntensity,
        0,
        math.cos(currentTime * 2.3) * config.WobbleIntensity
    )
    
    for i, part in ipairs(visualParts) do
        local heightRatio = (i / config.ParticleCount) ^ config.FunnelWidth
        local height = heightRatio * config.Height
        local radius = config.BaseRadius + (config.TopRadius - config.BaseRadius) * heightRatio
        
        local angle = currentTime * config.RotationSpeed + (i * math.pi * 2 / config.ParticleCount)
        local pos = tornadoBase + wobbleOffset + Vector3.new(
            math.cos(angle) * radius,
            height,
            math.sin(angle) * radius
        )
        
        part.Position = pos
        part.Size = Vector3.new(1, 1, 1) * (0.5 + radius * 0.3)
    end
end

local function ape(part)
    if not (part:IsA("BasePart") and not part.Anchored) then
        return false
    end
    if part:FindFirstAncestorOfClass("Model") == character then
        return false
    end
    local mass = part:GetMass()
    return mass <= config.MaxMass and not part:FindFirstAncestorWhichIsA("Player")
end

local function disablePlayerCollisions(disable)
    if not character then return end
    
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored and ape(part) then
            if disable then
                if not part:GetAttribute("OriginalCollisionGroup") then
                    part:SetAttribute("OriginalCollisionGroup", part.CollisionGroupId)
                end
                part.CollisionGroupId = 1
            else
                local originalGroup = part:GetAttribute("OriginalCollisionGroup")
                if originalGroup then
                    part.CollisionGroupId = originalGroup
                    part:SetAttribute("OriginalCollisionGroup", nil)
                end
            end
        end
    end
end

local function calculateForces(part, data, tornadoBase, currentTime)
    local mass = part:GetMass()
    local timeInTornado = currentTime - data.startTime
    
    local heightRatio = math.clamp(timeInTornado * config.LiftSpeed / config.Height, 0, 1)
    local currentHeight = heightRatio * config.Height
    local currentRadius = config.BaseRadius + (config.TopRadius - config.BaseRadius) * heightRatio
    
    local angle = data.initialAngle + timeInTornado * config.RotationSpeed * (0.8 + heightRatio * 0.4)
    
    local targetPos = tornadoBase + Vector3.new(
        math.cos(angle) * currentRadius,
        currentHeight,
        math.sin(angle) * currentRadius
    )
    
    local toTarget = (targetPos - part.Position)
    local distance = toTarget.Magnitude
    local direction = toTarget.Unit
    
    local pullForce = direction * mass * 120 * (1 + distance * 0.1)
    local tangent = Vector3.new(-direction.Z, 0, direction.X).Unit
    local spinForce = tangent * mass * config.TangentialForce * (0.5 + heightRatio * 0.7)
    local upwardForce = Vector3.new(0, 1, 0) * mass * config.UpwardForce * (1 + heightRatio * 2)
    
    return pullForce + spinForce + upwardForce
end

local function uptor()
    local currentTime = tick()
    if currentTime - lastUpdate < config.UpdateRate then return end
    lastUpdate = currentTime
    
    simrad()
    if not rootPart or not rootPart.Parent then return end

    local tornadoBase = rootPart.Position + Vector3.new(0, 2, 0)

    if #tornadoParts < config.MaxParts then
        local parts = workspace:FindPartsInRegion3(
            Region3.new(
                tornadoBase - Vector3.new(config.BaseRadius * 2, 5, config.BaseRadius * 2),
                tornadoBase + Vector3.new(config.BaseRadius * 2, config.Height, config.BaseRadius * 2)
            ),
            nil,
            config.MaxParts
        )
        
        for _, part in ipairs(parts) do
            if ape(part) and not tornadoParts[part] then
                tornadoParts[part] = {
                    startTime = currentTime,
                    initialAngle = math.random() * math.pi * 2,
                    initialHeight = part.Position.Y - tornadoBase.Y
                }
                
                part.AncestryChanged:Connect(function()
                    tornadoParts[part] = nil
                end)
                
                delay(config.DebrisLifetime, function()
                    tornadoParts[part] = nil
                end)
            end
        end
    end

    for part, data in pairs(tornadoParts) do
        if part and part.Parent then
            local force = calculateForces(part, data, tornadoBase, currentTime)
            part:ApplyImpulse(force * 0.03)
        else
            tornadoParts[part] = nil
        end
    end
end

local function activateTornado()
    if active then return end
    active = true
    
    character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    simrad()
    visa()
    disablePlayerCollisions(true)
    
    connection = RunService.Heartbeat:Connect(uptor)
    visualConnection = RunService.RenderStepped:Connect(function()
        if rootPart and rootPart.Parent then
            visa2(rootPart.Position + Vector3.new(0, 2, 0))
        end
    end)
end

local function deactivateTornado()
    if not active then return end
    active = false
    
    if connection then
        connection:Disconnect()
        connection = nil
    end
    
    if visualConnection then
        visualConnection:Disconnect()
        visualConnection = nil
    end
    
    disablePlayerCollisions(false)
    tornadoParts = {}
    tornadoModel:ClearAllChildren()
end

function tt()
    if active then
        deactivateTornado()
    else
        activateTornado()
    end
end

local LocalPlayer = Players.LocalPlayer
if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        FPS = 20,
        Velocity = Vector3.new(25.1, 0, 0)
    }
    
    local function EnableNetwork()
        local function UpdateNetwork()
            if not isActive then return end
            
            pcall(function()
                sethiddenproperty(LocalPlayer, "MaxSimulationRadius", getpart)
                sethiddenproperty(LocalPlayer, "SimulationRadius", getpart)
            end)
            
            local partsToProcess = {}
            for part in pairs(Network.BaseParts) do
                table.insert(partsToProcess, part)
            end
            
            for _, part in ipairs(partsToProcess) do
                if not part or not part.Parent then
                    Network.BaseParts[part] = nil
                    continue
                end
                
                pcall(function()
                    sethiddenproperty(part, "NetworkOwnership", Enum.NetworkOwnership.Manual)
                    sethiddenproperty(part, "CustomPhysicalProperties", PhysicalProperties.new(0.7, 0.3, 0.5))
                    part.Velocity = Network.Velocity
                end)
            end
        end
        
        RunService.Heartbeat:Connect(UpdateNetwork)
    end
    
    EnableNetwork()
end

local function setupPlayer()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    lastValidPosition = humanoidRootPart.Position
    return humanoidRootPart
end

local humanoidRootPart = setupPlayer()

local function processPart(part)
    if part:IsA("Part") and not part.Anchored and 
       not part.Parent:FindFirstChild("Humanoid") and 
       not part.Parent:FindFirstChild("Head") and 
       part.Name ~= "Handle" then
        
        if not pcall(function() return part.Parent end) then
            return nil
        end
        
        for _, child in pairs(part:GetChildren()) do
            if child:IsA("BodyAngularVelocity") or 
               child:IsA("BodyForce") or 
               child:IsA("BodyGyro") or 
               child:IsA("BodyPosition") or 
               child:IsA("BodyThrust") or 
               child:IsA("BodyVelocity") or 
               child:IsA("RocketPropulsion") or 
               child:IsA("Attachment") or 
               child:IsA("AlignPosition") or 
               child:IsA("AlignOrientation") or 
               child:IsA("LinearVelocity") or 
               child:IsA("BodyCenterOfMass") or 
               child:IsA("BodyMover") or 
               child:IsA("BodyMover2") or 
               child:IsA("BallSocketConstraint") or 
               child:IsA("WeldConstraint") or
               child:IsA("RodConstraint") or 
               child:IsA("SpringConstraint") or 
               child:IsA("Motor6D") or
               child:IsA("VectorForce") or
               child:IsA("LineForce") or
               child:IsA("HingeConstraint") or
               child:IsA("CylindricalConstraint") or
               child:IsA("PrismaticConstraint") or 
               child:IsA("PlaneConstraint") or 
               child:IsA("SlidingBallConstraint") then
                child:Destroy()
            end
        end
        
        part.CanCollide = false
        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        
        local attachment = Instance.new("Attachment", part)
        
        local alignPos = Instance.new("AlignPosition", part)
        alignPos.Attachment0 = attachment
        alignPos.Mode = Enum.PositionAlignmentMode.OneAttachment
        alignPos.Responsiveness = 200
        
        return {
            part = part,
            align = alignPos,
            index = 0
        }
    end
    return nil
end

local function calculateRingPosition(index, totalParts, center)
    local angle = (index / totalParts) * (2 * math.pi) + tick() * speed
    local offsetX, offsetY, offsetZ = 0, 0, 0
    
    if currentMode == 1 then  -- Vertical PartOrbit
        offsetX = math.cos(angle) * radius
        offsetY = math.sin(angle) * radius
    elseif currentMode == 2 then  -- Horizontal PartOrbit
        offsetX = math.cos(angle) * radius
        offsetZ = math.sin(angle) * radius
    elseif currentMode == 3 then  -- Vertical & Horizontal
        local angle2 = angle + math.pi/2
        offsetX = math.cos(angle) * radius
        offsetY = math.sin(angle2) * radius
        offsetZ = math.sin(angle) * radius
    elseif currentMode == 4 then  -- Left Tilt
        offsetX = math.cos(angle) * radius
        offsetY = math.sin(angle) * radius * 0.5
        offsetZ = math.sin(angle) * radius * 0.866
    elseif currentMode == 5 then  -- Right Tilt
        offsetX = math.cos(angle) * radius
        offsetY = math.sin(angle) * radius * 0.5
        offsetZ = -math.sin(angle) * radius * 0.866
    elseif currentMode == 6 then  -- Left & Right Tilt
        local tiltAngle = math.sin(tick() * speed * 0.5) * math.pi/3
        offsetX = math.cos(angle) * radius
        offsetY = math.sin(angle) * radius * math.cos(tiltAngle)
        offsetZ = math.sin(angle) * radius * math.sin(tiltAngle)
    elseif currentMode == 7 then  -- Spiral
        local heightOffset = ((index / totalParts) * 2 - 1) * radius
        offsetX = math.cos(angle) * radius
        offsetY = heightOffset
        offsetZ = math.sin(angle) * radius
    elseif currentMode == 8 then  -- Figure 8
        local scale = 1.5
        offsetX = math.cos(angle) * radius
        offsetY = math.sin(2 * angle) * radius * 0.5
        offsetZ = math.sin(angle) * radius * scale
    elseif currentMode == 9 then  -- DNA Helix
        local heightOffset = math.sin(tick() * speed) * radius
        offsetX = math.cos(angle) * radius
        offsetY = math.cos(angle * 2) * radius + heightOffset
        offsetZ = math.sin(angle) * radius
    elseif currentMode == 10 then  -- Flower Pattern
        local petalCount = 5
        local r = math.cos(petalCount * angle) * radius
        offsetX = math.cos(angle) * r
        offsetY = math.sin(angle) * r
        offsetZ = math.sin(petalCount * angle) * radius * 0.5
    elseif currentMode == 11 then  -- Galaxy Spiral
        local spiralTightness = 0.2
        local r = (1 + angle * spiralTightness) * radius
        offsetX = math.cos(angle) * r
        offsetY = math.sin(tick() * speed) * radius * 0.2
        offsetZ = math.sin(angle) * r
    elseif currentMode == 12 then  -- Infinity
        local scale = 1.5
        offsetX = math.cos(angle) * radius * scale
        offsetY = math.sin(2 * angle) * radius * 0.5
        offsetZ = math.sin(angle) * radius
    elseif currentMode == 13 then  -- Wave Pattern
        offsetX = angle * radius * 0.1
        offsetY = math.sin(angle * 2) * radius
        offsetZ = math.cos(angle * 2) * radius
    elseif currentMode == 14 then  -- Atomic Orbit
        local subOrbitRadius = radius * 0.3
        local mainAngle = tick() * speed
        local subAngle = angle * 3
        offsetX = math.cos(mainAngle) * radius + math.cos(subAngle) * subOrbitRadius
        offsetY = math.sin(mainAngle) * radius + math.sin(subAngle) * subOrbitRadius
        offsetZ = math.cos(subAngle) * subOrbitRadius
    elseif currentMode == 15 then  -- Butterfly
        local t = angle
        offsetX = math.sin(t) * (math.exp(math.cos(t)) - 2 * math.cos(4*t) - math.pow(math.sin(t/12), 5)) * radius * 0.5
        offsetY = math.cos(t) * (math.exp(math.cos(t)) - 2 * math.cos(4*t) - math.pow(math.sin(t/12), 5)) * radius * 0.5
        offsetZ = math.sin(t * 3) * radius * 0.3
    elseif currentMode == 16 then -- Tornado
        local heightScale = 2
        local r = radius * (1 - (index / totalParts))
        offsetX = math.cos(angle) * r
        offsetY = (index / totalParts) * radius * heightScale
        offsetZ = math.sin(angle) * r
    elseif currentMode == 17 then -- Heart
        local t = angle
        offsetX = 16 * math.sin(t) ^ 3 * (radius * 0.1)
        offsetY = (13 * math.cos(t) - 5 * math.cos(2*t) - 2 * math.cos(3*t) - math.cos(4*t)) * (radius * 0.1)
        offsetZ = math.sin(t * 2) * radius * 0.3
    elseif currentMode == 18 then -- Vortex
        local spiral = angle * 0.1
        local height = math.sin(tick() * speed) * radius
        offsetX = (radius + spiral) * math.cos(angle)
        offsetY = height + (index / totalParts) * radius
        offsetZ = (radius + spiral) * math.sin(angle)
    elseif currentMode == 19 then -- Pendulum
        local swingAngle = math.sin(tick() * speed) * math.pi/2
        offsetX = math.sin(swingAngle) * radius
        offsetY = -math.cos(swingAngle) * radius
        offsetZ = math.sin(angle) * radius * 0.3
    elseif currentMode == 20 then -- Lemniscate 3D
        local t = angle
        local scale = radius * 0.8
        offsetX = scale * math.cos(t) / (1 + math.sin(t)^2)
        offsetY = scale * math.sin(t) * math.cos(t) / (1 + math.sin(t)^2)
        offsetZ = math.sin(t * 2) * radius * 0.5
    elseif currentMode == 21 then -- Star Pattern
        local points = 5
        local innerRadius = radius * 0.4
        local t = angle * points
        local r = innerRadius + (radius - innerRadius) * math.abs(math.sin(t))
        offsetX = r * math.cos(angle)
        offsetY = r * math.sin(angle)
        offsetZ = math.sin(angle * points) * radius * 0.3
    elseif currentMode == 22 then -- Trefoil Knot
        local t = angle
        offsetX = (2 + math.cos(3*t)) * math.cos(2*t) * radius * 0.2
        offsetY = (2 + math.cos(3*t)) * math.sin(2*t) * radius * 0.2
        offsetZ = math.sin(3*t) * radius * 0.2
    elseif currentMode == 23 then -- Double Spiral
        local t = angle
        local r1 = radius * (0.5 + 0.5 * math.cos(t * 5))
        local r2 = radius * (0.5 + 0.5 * math.sin(t * 5))
        offsetX = math.cos(t) * r1
        offsetY = math.sin(t) * r1
        offsetZ = math.cos(t) * r2
    elseif currentMode == 24 then -- Mobius Strip
        local t = angle
        local s = (index / totalParts) * 2 - 1
        offsetX = (radius + s * math.cos(t/2)) * math.cos(t)
        offsetY = (radius + s * math.cos(t/2)) * math.sin(t)
        offsetZ = s * math.sin(t/2)
    elseif currentMode == 25 then -- Hypocycloid
        local a = radius
        local b = radius * 0.2
        local t = angle * 4
        offsetX = (a - b) * math.cos(t) + b * math.cos((a-b)/b * t)
        offsetY = (a - b) * math.sin(t) - b * math.sin((a-b)/b * t)
        offsetZ = math.sin(t * 2) * radius * 0.3
    elseif currentMode == 26 then -- Sphere Spiral
        local phi = angle
        local theta = (index / totalParts) * math.pi
        offsetX = radius * math.sin(theta) * math.cos(phi)
        offsetY = radius * math.sin(theta) * math.sin(phi)
        offsetZ = radius * math.cos(theta)
    elseif currentMode == 27 then -- Asteroid Belt
        local baseAngle = (index / totalParts) * (2 * math.pi)
        local wobble = math.sin(tick() * speed + baseAngle * 3) * (radius * 0.2)
        local r = radius + wobble
        offsetX = math.cos(angle) * r
        offsetY = math.sin(baseAngle * 2) * (radius * 0.1)
        offsetZ = math.sin(angle) * r
    elseif currentMode == 28 then -- Rose Curve
        local n = 3
        local d = 2
        local k = n/d
        local r = radius * math.cos(k * angle)
        offsetX = r * math.cos(angle)
        offsetY = r * math.sin(angle)
        offsetZ = math.sin(angle * k) * radius * 0.3
    elseif currentMode == 29 then -- Lissajous
        local a = 3
        local b = 2
        offsetX = radius * math.sin(a * angle)
        offsetY = radius * math.cos(b * angle)
        offsetZ = radius * math.sin((a+b) * angle) * 0.3
    elseif currentMode == 30 then -- Polygonal Orbit
        local sides = 6
        local angleSnap = math.floor(angle * sides / (2 * math.pi)) * (2 * math.pi / sides)
        local transition = (angle * sides / (2 * math.pi)) % 1
        local nextAngleSnap = angleSnap + (2 * math.pi / sides)
        
        local currentX = math.cos(angleSnap) * radius
        local currentZ = math.sin(angleSnap) * radius
        local nextX = math.cos(nextAngleSnap) * radius
        local nextZ = math.sin(nextAngleSnap) * radius
        
        offsetX = currentX + (nextX - currentX) * transition
        offsetY = math.sin(angle * 2) * radius * 0.2
        offsetZ = currentZ + (nextZ - currentZ) * transition
    end
    
    return center + Vector3.new(offsetX, offsetY, offsetZ)
end

local function updateRingPositions()
    if not isActive then return end
    
    local currentTime = tick()
    if currentTime - lastUpdate < UPDATE_INTERVAL then return end
    lastUpdate = currentTime
    
    local position = (humanoidRootPart and humanoidRootPart.Position) or lastValidPosition
    if position then
        lastValidPosition = position
        local totalParts = #ringParts
        
        for i = #ringParts, 1, -1 do
            local data = ringParts[i]
            local validPart = pcall(function() return data.part.Parent ~= nil end)
            if validPart then
                local targetPos = calculateRingPosition(i, totalParts, position)
                data.align.Position = targetPos
            else
                Network.BaseParts[data.part] = nil
                table.remove(ringParts, i)
            end
        end
    end
end

local function orbite()
    isActive = not isActive
    
    if isActive then
        ringParts = {}
        for _, v in ipairs(Workspace:GetDescendants()) do
            local partData = processPart(v)
            if partData then
                table.insert(ringParts, partData)
                Network.BaseParts[partData.part] = true
            end
        end
        
        local connection
        connection = Workspace.DescendantAdded:Connect(function(v)
            if not isActive then
                connection:Disconnect()
                return
            end
            local partData = processPart(v)
            if partData then
                table.insert(ringParts, partData)
                Network.BaseParts[partData.part] = true
            end
        end)
        
        RunService.Heartbeat:Connect(updateRingPositions)
    else
        for i = #ringParts, 1, -1 do
            local data = ringParts[i]
            if data.part and data.part.Parent then
                Network.BaseParts[data.part] = nil
                if data.align then 
                    pcall(function() data.align:Destroy() end)
                end
            end
        end
        ringParts = {}
    end
end

local LocalPlayer = Players.LocalPlayer
local function GetPlayer(name)
    if not name or name == "" then return nil end
    if string.lower(name) == "me" then return LocalPlayer end
    
    name = string.lower(name)
    for _, plr in pairs(Players:GetPlayers()) do
        if string.find(string.lower(plr.Name), name) or string.find(string.lower(plr.DisplayName), name) then
            return plr
        end
    end
end

local TargetPlayer = GetPlayer(targetplr)

local function GetPlayerList()
    local playerList = {"me"}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function UpdateTargetPlayer(playerName)
    targetplr = playerName
    TargetPlayer = GetPlayer(playerName)
end

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", getpart)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local trackedParts = {}
local originalCollisions = {}

local function RetainPart(part)
    if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(workspace) then
        if part.Parent == LocalPlayer.Character or part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end
        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        return true
    end
    return false
end

local function addPart(part)
    if RetainPart(part) then
        if not trackedParts[part] then
            trackedParts[part] = true
            originalCollisions[part] = part.CanCollide
        end
    end
end

local function removePart(part)
    if trackedParts[part] then
        trackedParts[part] = nil
        originalCollisions[part] = nil
    end
end

task.spawn(function()
    for _, part in pairs(workspace:GetDescendants()) do
        addPart(part)
    end
end)

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

local function calculateOrbitPosition(partPos, targetCenter, time)
    local angleIncrement = math.rad(10)
    local angle = math.atan2(partPos.Z - targetCenter.Z, partPos.X - targetCenter.X)
    local newAngle = angle + angleIncrement

    local targetPos = Vector3.new(
        targetCenter.X + math.cos(newAngle) * farness,
        targetCenter.Y + height,
        targetCenter.Z + math.sin(newAngle) * farness
    )

    return targetPos
end

local orbitEnabled = false
function toggleorbit()
    orbitEnabled = not orbitEnabled
end


RunService.Heartbeat:Connect(function()
    if not orbitEnabled then return end
    if not TargetPlayer then return end

    local targetChar = TargetPlayer.Character
    local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return end

    local targetCenter = targetRoot.Position
    local effectiveRadius = farness
    local maxDistance = effectiveRadius * 1.5
    local currentTime = tick()

    for part, _ in pairs(trackedParts) do
        if part and part.Parent and not part.Anchored then
            local partPos = part.Position
            local distanceFromTarget = (partPos - targetCenter).Magnitude
            if distanceFromTarget > maxDistance then continue end

            local targetPos = calculateOrbitPosition(partPos, targetCenter, currentTime)
            local directionToTarget = (targetPos - partPos).unit
            part.Velocity = directionToTarget * fast
            part.CanCollide = false
        end
    end
end)

local function rpp()

pcall(function()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

CollectionService:AddTag(G2L["ScreenGui_1"], "main")

G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"])
G2L["Frame_2"]["BorderSizePixel"] = 0
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
G2L["Frame_2"]["Size"] = UDim2.new(0, 130, 0, 148)
G2L["Frame_2"]["Position"] = UDim2.new(0, 310, 0, 60)
G2L["Frame_2"]["BackgroundTransparency"] = 0.2

G2L["RaidusTextBox_3"] = Instance.new("TextBox", G2L["Frame_2"])
G2L["RaidusTextBox_3"]["CursorPosition"] = -1
G2L["RaidusTextBox_3"]["Name"] = "RaidusTextBox"
G2L["RaidusTextBox_3"]["BorderSizePixel"] = 0
G2L["RaidusTextBox_3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["RaidusTextBox_3"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
G2L["RaidusTextBox_3"]["PlaceholderText"] = "Radius"
G2L["RaidusTextBox_3"]["Size"] = UDim2.new(0, 100, 0, 20)
G2L["RaidusTextBox_3"]["Position"] = UDim2.new(0, 16, 0, 62)
G2L["RaidusTextBox_3"]["Text"] = "70"

G2L["UICorner_4"] = Instance.new("UICorner", G2L["RaidusTextBox_3"])

G2L["UICorner_5"] = Instance.new("UICorner", G2L["Frame_2"])

G2L["Frame2_6"] = Instance.new("Frame", G2L["Frame_2"])
G2L["Frame2_6"]["BorderSizePixel"] = 0
G2L["Frame2_6"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
G2L["Frame2_6"]["Size"] = UDim2.new(0, 130, 0, 20)
G2L["Frame2_6"]["Name"] = "Frame2"

G2L["UICorner_7"] = Instance.new("UICorner", G2L["Frame2_6"])

G2L["MinimiseBtn_8"] = Instance.new("TextButton", G2L["Frame2_6"])
G2L["MinimiseBtn_8"]["BorderSizePixel"] = 0
G2L["MinimiseBtn_8"]["TextSize"] = 11
G2L["MinimiseBtn_8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["MinimiseBtn_8"]["BackgroundTransparency"] = 1
G2L["MinimiseBtn_8"]["Size"] = UDim2.new(0, 32, 0, 18)
G2L["MinimiseBtn_8"]["Text"] = "➖"
G2L["MinimiseBtn_8"]["Name"] = "MinimiseBtn"
G2L["MinimiseBtn_8"]["Position"] = UDim2.new(0, 98, 0, 0)

G2L["ASTextBox_9"] = Instance.new("TextBox", G2L["Frame_2"])
G2L["ASTextBox_9"]["CursorPosition"] = -1
G2L["ASTextBox_9"]["Name"] = "ASTextBox"
G2L["ASTextBox_9"]["BorderSizePixel"] = 0
G2L["ASTextBox_9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ASTextBox_9"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
G2L["ASTextBox_9"]["PlaceholderText"] = "Speed"
G2L["ASTextBox_9"]["Size"] = UDim2.new(0, 100, 0, 20)
G2L["ASTextBox_9"]["Position"] = UDim2.new(0, 16, 0, 86)
G2L["ASTextBox_9"]["Text"] = "555"

G2L["UICorner_a"] = Instance.new("UICorner", G2L["ASTextBox_9"])

G2L["Toggle_b"] = Instance.new("TextButton", G2L["Frame_2"])
G2L["Toggle_b"]["BorderSizePixel"] = 0
G2L["Toggle_b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Toggle_b"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41)
G2L["Toggle_b"]["Size"] = UDim2.new(0, 104, 0, 24)
G2L["Toggle_b"]["Text"] = "PartOrbit: OFF"
G2L["Toggle_b"]["Name"] = "Toggle"
G2L["Toggle_b"]["Position"] = UDim2.new(0, 14, 0, 30)

G2L["UICorner_c"] = Instance.new("UICorner", G2L["Toggle_b"])

G2L["Title_d"] = Instance.new("TextLabel", G2L["Frame_2"])
G2L["Title_d"]["BorderSizePixel"] = 0
G2L["Title_d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Title_d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Title_d"]["BackgroundTransparency"] = 1
G2L["Title_d"]["Size"] = UDim2.new(0, 88, 0, 12)
G2L["Title_d"]["Text"] = "PartOrbit"
G2L["Title_d"]["Name"] = "Title"
G2L["Title_d"]["Position"] = UDim2.new(0, 20, 0, 4)

G2L["UIStroke_e"] = Instance.new("UIStroke", G2L["Frame_2"])
G2L["UIStroke_e"]["Transparency"] = 0.1
G2L["UIStroke_e"]["Thickness"] = 3
G2L["UIStroke_e"]["Color"] = Color3.fromRGB(41, 41, 41)

local radius = tonumber(G2L["RaidusTextBox_3"].Text) or 70
local height = 100
local rotationSpeed = 0.5
local attractionStrength = tonumber(G2L["ASTextBox_9"].Text) or 555
local ringPartsEnabled = false

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", getpart)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(radius, distance),
                    tornadoCenter.Y + (height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * attractionStrength
            end
        end
    end
end)

G2L["Toggle_b"].MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    G2L["Toggle_b"].Text = ringPartsEnabled and "PartOrbit: ON" or "PartOrbit: OFF"
end)

G2L["RaidusTextBox_3"].FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newRadius = tonumber(G2L["RaidusTextBox_3"].Text)
        if newRadius then
            radius = math.clamp(newRadius, 1, 1000)
            G2L["RaidusTextBox_3"].Text = tostring(radius)
        else
            G2L["RaidusTextBox_3"].Text = tostring(radius)
        end
    end
end)

G2L["ASTextBox_9"].FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newStrength = tonumber(G2L["ASTextBox_9"].Text)
        if newStrength then
            attractionStrength = math.clamp(newStrength, 1, 10000)
            G2L["ASTextBox_9"].Text = tostring(attractionStrength)
        else
            G2L["ASTextBox_9"].Text = tostring(attractionStrength)
        end
    end
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    G2L["Frame_2"].Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

G2L["Frame_2"].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = G2L["Frame_2"].Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

G2L["Frame_2"].InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local minimized = false
G2L["MinimiseBtn_8"].MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        G2L["Frame_2"].Size = UDim2.new(0, 130, 0, 20)
        G2L["Toggle_b"].Visible = false
        G2L["RaidusTextBox_3"].Visible = false
        G2L["ASTextBox_9"].Visible = false
        G2L["MinimiseBtn_8"].Text = "➕"
    else
        G2L["Frame_2"].Size = UDim2.new(0, 130, 0, 148)
        G2L["Toggle_b"].Visible = true
        G2L["RaidusTextBox_3"].Visible = true
        G2L["ASTextBox_9"].Visible = true
        G2L["MinimiseBtn_8"].Text = "➖"
    end
end)

end)

end

local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

local fradius = 70
local fheight = 100
local frotationSpeed = 0.5
local fattractionStrength = 555
local zzz = false

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", getpart)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100/000, 1000000, 1000000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = math.huge
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 2000
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

RunService.Heartbeat:Connect(function()
    if not zzz then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(frotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(fradius, distance),
                    tornadoCenter.Y + (fheight * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / fheight)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(fradius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * fattractionStrength
            end
        end
    end
end)

local function meme()
    zzz = not zzz
    return zzz
end


local Tab = Window:Tab({Title = "Orbit Mod", Icon = "circle"}) do
    -- Section
    Tab:Section({Title = "Orbit Modification"})

    Tab:Label({
        Title = "Brick",
        Desc = "you might get FPS drops which is Ur problem :D",
    })

    -- Button
    Tab:Button({
        Title = "Toggle PartOrbit",
        Desc = "Cool stuff",
        Callback = function()
            btnclick()
            pcz()
            orbite()
        end
    })

    -- Dropdown
    Tab:Dropdown({
        Title = "Orbit Mode",
        List = modes,
        Value = "Horizontal Ring",
        Callback = function(mode)
            currentMode = table.find(modes, mode)
            dropdownsound()
        end
    })

    -- Slider
    Tab:Slider({
        Title = "Set Raidus",
        Min = 0,
        Max = 100,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            radius = val
            slidersound()
        end
    })

    -- Slider
    Tab:Slider({
        Title = "Set Speed",
        Min = 0,
        Max = 10000,
        Rounding = 0,
        Value = 2,
        Callback = function(val)
            speed = val
            slidersound()
        end
    })
    Tab:Section({Title = "lesser lag"})
    Tab:Button({
        Title = "Toggle PartOrbit",
        Desc = "lesser calculation = lesser lag",
        Callback = function()
            pcz()
            meme()
            btnclick()
        end
    })
    Tab:Slider({
        Title = "Set Raidus",
        Min = 0,
        Max = 100,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            fradius = val
            slidersound()
        end
    })

    Tab:Slider({
        Title = "Set Speed",
        Min = 0,
        Max = 10000,
        Rounding = 0,
        Value = 555,
        Callback = function(val)
            fattractionStrength = val
            slidersound()
        end
    })

    Tab:Section({Title = "lesser lesser lag"})
    Tab:Button({
        Title = "Toggle PartOrbit",
        Desc = "lesser lesser calculation = lesser lesser lag",
        Callback = function()
            pcz()
            toggleorbit()
            btnclick()
        end
    })

    Tab:Dropdown({
        Title = "Select Player",
        List = GetPlayerList(),
        Value = "me",
        Callback = function(selectedPlayer)
            UpdateTargetPlayer(selectedPlayer)
            dropdownsound()
        end
    })

    Tab:Slider({
        Title = "Set Radius",
        Min = 0,
        Max = 100,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            farness = val
            slidersound()
        end
    })

    -- Slider
    Tab:Slider({
        Title = "Set Speed",
        Min = 0,
        Max = 1000,
        Rounding = 0,
        Value = 555,
        Callback = function(val)
            fast = val
            slidersound()
        end
    })

    Tab:Slider({
        Title = "Set Height",
        Min = 0,
        Max = 100,
        Rounding = 0,
        Value = 1,
        Callback = function(val)
            height = val
            slidersound()
        end
    })
    Tab:Section({Title = ""})
    Tab:Button({
        Title = "PartOrbit gui",
        Desc = "woah :o",
        Callback = function()

            rpp()
            Window:Notify({
                Title = "Brick",
                Desc = "Why do u need a gui",
                Time = 5
            })
            btnclick()
        end
    })
end

local function createBlackHoleSphere(position)
    if blackHoleSphere then
        blackHoleSphere:Destroy()
    end
    
    blackHoleSphere = Instance.new("Part")
    blackHoleSphere.Name = "BlackHoleSphere"
    blackHoleSphere.Anchored = true
    blackHoleSphere.CanCollide = false
    blackHoleSphere.Size = Vector3.new(20, 20, 20)
    blackHoleSphere.Shape = Enum.PartType.Ball
    blackHoleSphere.Material = Enum.Material.SmoothPlastic
    blackHoleSphere.BrickColor = BrickColor.new("Really black")
    blackHoleSphere.Position = position + Vector3.new(0, 100, 0)
    blackHoleSphere.Parent = workspace
    
    return blackHoleSphere
end

local function applyBlackHoleSuction()
    if not blackHoleSphere or not blackHoleActive then return end
    
    local blackHolePosition = blackHoleSphere.Position
    local parts = workspace:GetPartBoundsInRadius(blackHolePosition, blackHoleRadius * 5)
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") and not part.Anchored and part ~= blackHoleSphere then
            if not part:IsDescendantOf(LocalPlayer.Character) then
                local partPos = part.Position
                local direction = (blackHolePosition - partPos).Unit
                local distance = (blackHolePosition - partPos).Magnitude
                
                if distance <= blackHoleRadius * 5 then
                    local forceMultiplier = (1 - (distance / (blackHoleRadius * 5))) * blackHoleSuctionStrength
                    local suctionForce = direction * forceMultiplier
                    part.Velocity = part.Velocity + suctionForce
                    
                    if not blackHoleParts[part] then
                        blackHoleParts[part] = {
                            OriginalMass = part:GetMass(),
                            OriginalProperties = part.CustomPhysicalProperties
                        }
                        part.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.01, 0.01)
                    end
                end
            end
        end
    end
    
    for part in pairs(blackHoleParts) do
        if not part or not part.Parent then
            blackHoleParts[part] = nil
        end
    end
end

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    
    if blackHoleActive then
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local spawnPosition = character.HumanoidRootPart.Position
            createBlackHoleSphere(spawnPosition)
            blackHoleConnection = RunService.Heartbeat:Connect(applyBlackHoleSuction)
        end
    else
        if blackHoleConnection then
            blackHoleConnection:Disconnect()
            blackHoleConnection = nil
        end
        
        if blackHoleSphere then
            blackHoleSphere:Destroy()
            blackHoleSphere = nil
        end
        
        for part, data in pairs(blackHoleParts) do
            if part and part.Parent then
                part.CustomPhysicalProperties = data.OriginalProperties
            end
        end
        blackHoleParts = {}
    end
end

local LocalPlayer = Players.LocalPlayer
local function GetPlayerList()
    local playerList = {"me"}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function GetPlayer(name)
    if not name or name == "" then return LocalPlayer end
    if string.lower(name) == "me" then return LocalPlayer end
    
    name = string.lower(name)
    for _, plr in pairs(Players:GetPlayers()) do
        if string.find(string.lower(plr.Name), name) or string.find(string.lower(plr.DisplayName), name) then
            return plr
        end
    end
    return LocalPlayer
end

local function setupPlayer(targetPlayer)
    local character = targetPlayer.Character
    if not character then
        character = targetPlayer.CharacterAdded:Wait()
    end
    local rootPart = character:WaitForChild("HumanoidRootPart")

    if Folder then
        Folder:Destroy()
        Folder = nil
    end
    
    Folder = Instance.new("Folder", Workspace)
    Folder.Name = "BlackHoleAttachments"
    
    local Part = Instance.new("Part", Folder)
    Part.Name = "BlackHoleCenter"
    Attachment1 = Instance.new("Attachment", Part)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1

    return rootPart, Attachment1
end

humanoidRootPart, Attachment1 = setupPlayer(LocalPlayer)

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(part)
        if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, part)
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", getpart)
            for _, part in pairs(Network.BaseParts) do
                if part:IsDescendantOf(Workspace) then
                    part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(1000000, 1000000, 1000000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = math.huge
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 500
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
        controlledParts[v] = {
            Torque = Torque,
            AlignPosition = AlignPosition,
            Attachment = Attachment2
        }
    end
end

local function releaseAllParts()
    for part, constraints in pairs(controlledParts) do
        if part and part.Parent then
            for _, constraint in pairs(constraints) do
                if constraint and constraint.Parent then
                    constraint:Destroy()
                end
            end
        end
    end
    controlledParts = {}
end

local function togglebh()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        humanoidRootPart, Attachment1 = setupPlayer(currentTargetPlayer)
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end
        descendantConnection = Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)
        renderLoop = RunService.RenderStepped:Connect(function()
            if not blackHoleActive then
                if renderLoop then
                    renderLoop:Disconnect()
                    renderLoop = nil
                end
                return
            end
            
            if humanoidRootPart and humanoidRootPart.Parent then
                angle = angle + math.rad(angleSpeed)
                
                local offsetX = math.cos(angle) * bhradius
                local offsetZ = math.sin(angle) * bhradius

                Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
            else
                humanoidRootPart, Attachment1 = setupPlayer(currentTargetPlayer)
            end
        end)
    else
        if descendantConnection then
            descendantConnection:Disconnect()
            descendantConnection = nil
        end
        
        if renderLoop then
            renderLoop:Disconnect()
            renderLoop = nil
        end
        
        releaseAllParts()
        
        if Attachment1 then
            Attachment1.WorldCFrame = CFrame.new(0, -10000, 0)
        end
        
        if Folder then
            Folder:Destroy()
            Folder = nil
        end
    end
end

local function updateTargetPlayer(playerName)
    local newTarget = GetPlayer(playerName)
    if newTarget then
        currentTargetPlayer = newTarget
        if blackHoleActive then
            local wasActive = blackHoleActive
            togglebh()
            if wasActive then
                togglebh()
            end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    if currentTargetPlayer == LocalPlayer then
        humanoidRootPart, Attachment1 = setupPlayer(LocalPlayer)
        if blackHoleActive then
            local wasActive = blackHoleActive
            blackHoleActive = false
            releaseAllParts()
            if wasActive then
                togglebh()
            end
        end
    end
end)

local Tab = Window:Tab({Title = "Black Hole", Icon = "sun"}) do
    Tab:Section({Title = "Black Hole Controls"})

    Tab:Dropdown({
        Title = "Select Target Player",
        List = GetPlayerList(),
        Value = "me",
        Callback = function(selectedPlayer)
            updateTargetPlayer(selectedPlayer)
            dropdownsound()
        end
    })

    Tab:Button({
        Title = "Toggle BlackHole",
        Desc = "",
        Callback = function()
            pcz()
            togglebh()
            btnclick()
        end
    })

    Tab:Slider({
        Title = "Black Hole Radius",
        Min = 1,
        Max = 100,
        Rounding = 0,
        Value = 0,
        Callback = function(val)
            bhradius = val
            slidersound()
        end
    })

    Tab:Slider({
        Title = "Rotation Speed",
        Min = 1,
        Max = 100,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            angleSpeed = val
            slidersound()
        end
    })
    Tab:Section({Title = ""})
    Tab:Button({
        Title = "Summon Black Hole",
        Desc = "Create a blackhole in the sky that sucks up unanchored parts",
        Callback = function()
            pcz()
            toggleBlackHole()
            btnclick()
        end
    })
    
    Tab:Slider({
        Title = "Suction Strength",
        Desc = nil,
        Min = 10,
        Max = 500,
        Rounding = 0,
        Value = 100,
        Callback = function(val)
            blackHoleSuctionStrength = val
            slidersound()
        end
    })
    
    Tab:Slider({
        Title = "Black Hole Radius",
        Desc = "Size of the black hole",
        Min = 10,
        Max = 200,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            blackHoleRadius = val
            if blackHoleSphere then
                blackHoleSphere.Size = Vector3.new(val / 2.5, val / 2.5, val / 2.5)
            end
            slidersound()
        end
    })

end

Players.PlayerRemoving:Connect(function(player)
    if player == currentTargetPlayer then
        currentTargetPlayer = LocalPlayer
        if blackHoleActive then
            local wasActive = blackHoleActive
            togglebh()
            if wasActive then
                togglebh()
            end
        end
    end
end)

local function pmg()

local player = game.Players.LocalPlayer;
local playerGui = player:FindFirstChild("PlayerGui");

local re = game:GetService("Workspace");
local sandbox = function(var, func)
	local env = getfenv(func);
	local newenv = setmetatable({}, {__index=function(self, k)
		if (k == "script") then
			return var;
		else
			return env[k];
		end
	end});
	setfenv(func, newenv);
	return func;
end;
cors = {};
local _Name = "Telekinesis";
local uis = game:GetService("UserInputService");
local _Ins, _CF_new, _VTR_new = Instance.new, CFrame.new, Vector3.new;
mas = _Ins("Model", game:GetService("Lighting"));
local con = getfenv().sethiddenproperty;
Tool0 = _Ins("Tool");
Part1 = _Ins("Part");
Script2 = _Ins("Script");
local light = _Ins("Highlight", Tool0);
light.FillTransparency = 1;
light.OutlineColor = Color3.new(0, 255, 0);
LocalScript3 = _Ins("LocalScript");
re = game:GetService("RunService");
Tool0.Name = _Name;
Tool0.Parent = mas;
Tool0.Grip = _CF_new(0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1);
Tool0.GripPos = _VTR_new(0, 0, 1);
Part1.Name = "Handle";
Part1.Parent = Tool0;
local changed = "Changed";
Part1.CFrame = _CF_new(-3.5, 5.30000019, -3.5, 1, 0, 0, 0, -1, 0, 0, 0, -1);
Part1.Orientation = _VTR_new(0, 180, 180);
Part1.Position = _VTR_new(-3.5, 5.300000190734863, -3.5);
Part1.Rotation = _VTR_new(-180, 0, 0);
Part1.Color = Color3.new(0.972549, 0.972549, 0.972549);
Part1.Transparency = 1;
local cam = re.RenderStepped;
local w = wait;
Part1.Size = _VTR_new(1, 1, 1);
Part1.BottomSurface = Enum.SurfaceType.Smooth;
Part1.BrickColor = BrickColor.new("Institutional white");
Part1.Locked = true;
local speed = 55;
local mb = uis.TouchEnabled;
Part1.TopSurface = Enum.SurfaceType.Smooth;
Part1.brickColor = BrickColor.new("Institutional white");
Script2.Name = "LineConnect";
Script2.Parent = Tool0;
light.Adornee = nil;
local Sound = _Ins("Sound", game.Workspace);
Sound.SoundId = "rbxassetid://755341345";
Sound:Play();
cam:Connect(function()
	if con then
		con(game:GetService("Players").LocalPlayer, changed, speed);
	end
end);
table.insert(cors, sandbox(Script2, function()
	w();
	local check = script.Part2;
	local part1 = script.Part1.Value;
	local part2 = script.Part2.Value;
	local parent = script.Par.Value;
	local color = script.Color;
	local line = _Ins("Part");
	line.TopSurface = 0;
	line.BottomSurface = 0;
	line.Reflectance = 0.5;
	line.Name = "Laser";
	line.Locked = true;
	line.CanCollide = false;
	line.Anchored = true;
	line.formFactor = 0;
	line.Size = _VTR_new(1, 1, 1);
	local mesh = _Ins("BlockMesh");
	mesh.Parent = line;
	while true do
		if (check.Value == nil) then
			break;
		end
		if ((part1 == nil) or (part2 == nil) or (parent == nil)) then
			break;
		end
		if ((part1.Parent == nil) or (part2.Parent == nil)) then
			break;
		end
		if (parent.Parent == nil) then
			break;
		end
		local lv = _CF_new(part1.Position, part2.Position);
		local dist = (part1.Position - part2.Position).magnitude;
		line.Parent = parent;
		line.BrickColor = color.Value.BrickColor;
		line.Reflectance = color.Value.Reflectance;
		line.Transparency = color.Value.Transparency;
		line.CFrame = _CF_new(part1.Position + (lv.lookVectordist / 2));
		line.CFrame = _CF_new(line.Position, part2.Position);
		mesh.Scale = _VTR_new(0.25, 0.25, dist);
		w();
	end
	line:remove();
	script:remove();
end));
changed = "SimulationRadius";
Script2.Disabled = true;
LocalScript3.Name = "MainScript";
LocalScript3.Parent = Tool0;
local pointLight = _Ins("PointLight", Part1);
pointLight.Color = Color3.new(0, 255, 0);
pointLight.Range = 30;
pointLight.Brightness = 2;
table.insert(cors, sandbox(LocalScript3, function()
	w();
	tool = script.Parent;
	lineconnect = tool.LineConnect;
	object = nil;
	mousedown = false;
	found = false;
	BP = _Ins("BodyPosition");
	BP.maxForce = _VTR_new(math.huge, math.huge, math.huge);
	BP.P = BP.P * 3;
	dist = 1000;
	point = _Ins("Part");
	point.Locked = true;
	point.Anchored = true;
	point.formFactor = 0;
	point.Shape = 0;
	point.BrickColor = BrickColor.Blue();
	point.Size = _VTR_new(0, 0, 0);
	point.CanCollide = false;
	local mesh = _Ins("SpecialMesh");
	mesh.MeshType = "Sphere";
	mesh.Scale = _VTR_new(0.7, 0.7, 0.7);
	mesh.Parent = point;
	handle = tool.Handle;
	front = tool.Handle;
	color = tool.Handle;
	objval = nil;
	local hooked = false;
	local hookBP = BP:clone();
	hookBP.maxForce = _VTR_new(30000, 30000, 30000);
	local equipSound = Instance.new("Sound");
	equipSound.SoundId = "rbxassetid://8717291772";
	equipSound.Volume = 1;
	equipSound.Parent = tool.Handle;
	local tapSound = Instance.new("Sound");
	tapSound.SoundId = "rbxassetid://7496207231";
	tapSound.Volume = 1;
	tapSound.Parent = tool.Handle;
	local function enableNoclip()
		local character = player.Character;
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false;
				end
			end
		end
	end
	local function disableNoclip()
		local character = player.Character;
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true;
				end
			end
		end
	end
	local function onEquipped(mouse)
		equipSound:Play();
		enableNoclip();
		keymouse = mouse;
	end
	tool.Unequipped:Connect(function()
		mousedown = false;
		disableNoclip();
	end);
	tool.Equipped:Connect(onEquipped);
	local onButton1Down = function(mouse)
		if (mousedown == true) then
			return;
		end
		mousedown = true;
		tapSound:Play();
		coroutine.resume(coroutine.create(function()
			local p = point:clone();
			p.Parent = tool;
			LineConnect(front, p, workspace);
			while mousedown == true do
				p.Parent = tool;
				if (object == nil) then
					if (mouse.Target == nil) then
						local lv = _CF_new(front.Position, mouse.Hit.p);
						p.CFrame = _CF_new(front.Position + (lv.lookVector * dist));
					else
						p.CFrame = _CF_new(mouse.Hit.p);
					end
				else
					LineConnect(front, object, workspace);
					break;
				end
				w();
			end
			p:remove();
		end));
		while mousedown == true do
			if (mouse.Target ~= nil) then
				local t = mouse.Target;
				if (t.Anchored == false) then
					object = t;
					light.Adornee = object;
					dist = (object.Position - front.Position).magnitude;
					break;
				end
			end
			w();
		end
		while mousedown == true do
			if (object.Parent == nil) then
				break;
			end
			local lv = _CF_new(front.Position, mouse.Hit.p);
			BP.Parent = object;
			BP.position = front.Position + (lv.lookVector * dist);
			w();
		end
		BP:remove();
		object = nil;
		objval.Value = nil;
		light.Adornee = nil;
	end;
	local onKeyDown = function(key, mouse)
		local key = key:lower();
		local yesh = false;
		if (key == "q") then
			if (dist >= 5) then
				dist = dist - 5;
			end
		end
		if (key == "u") then
			if (dist ~= 1) then
				BX = _Ins("BodyGyro");
				BX.MaxTorque = _VTR_new(math.huge, 0, math.huge);
				BX.CFrame = BX.CFrame * CFrame.Angles(0, math.rad(45), 0);
				BX.D = 0;
				BX.Parent = object;
			end
		end
		if (key == "p") then
			if (dist ~= 1) then
				BX = _Ins("BodyVelocity");
				BX.maxForce = _VTR_new(0, math.huge, 0);
				BX.velocity = _VTR_new(0, 1, 0);
				BX.Parent = object;
			end
		end
		if (key == "l") then
			if (object == nil) then
				return;
			end
			for _, v in pairs(object:children()) do
				if (v.className == "BodyGyro") then
					return nil;
				end
			end
			BG = _Ins("BodyGyro");
			BG.maxTorque = _VTR_new(math.huge, math.huge, math.huge);
			BG.cframe = _CF_new(object.CFrame.p);
			BG.Parent = object;
			repeat
				w();
			until object.CFrame == _CF_new(object.CFrame.p) 
			BG.Parent = nil;
			if (object == nil) then
				return;
			end
			for _, v in pairs(object:children()) do
				if (v.className == "BodyGyro") then
					v.Parent = nil;
				end
			end
			object.Velocity = _VTR_new(0, 0, 0);
			object.RotVelocity = _VTR_new(0, 0, 0);
		end
		if (key == "y") then
			if (dist ~= 500) then
				dist = 500;
			end
		end
		if (key == "j") then
			if (dist ~= 5000) then
				dist = 5000;
			end
		end
		if (key == "e") then
			dist = dist + 5;
		end
		if (key == "x") then
			if (dist ~= 15) then
				dist = 15;
			end
		end
	end;
	local onEquipped = function(mouse)
		equipSound:Play();
		enableNoclip();
		keymouse = mouse;
		local char = tool.Parent;
		human = char.Humanoid;
		human.Changed:connect(function()
			if (human.Health == 0) then
				mousedown = false;
				BP:remove();
				point:remove();
				tool:remove();
			end
		end);
		mouse.Button1Down:connect(function()
			onButton1Down(mouse);
		end);
		mouse.KeyDown:connect(function(key)
			onKeyDown(key, mouse);
		end);
		if mb then
			uis.TouchLongPress:Connect(function()
				onKeyDown("y", mouse);
			end);
			uis.TouchEnded:Connect(function()
				mousedown = false;
			end);
		else
			mouse.Button1Up:connect(function()
				mousedown = false;
			end);
		end
	end;
	tool.Equipped:connect(onEquipped);
	tool.Unequipped:connect(function()
		mousedown = false;
		disableNoclip();
	end);
end));
for i, v in pairs(mas:GetChildren()) do
	v.Parent = game:GetService("Players").LocalPlayer.Backpack;
	pcall(function()
		v:MakeJoints();
	end);
end
mas:Destroy();
for i, v in pairs(cors) do
	spawn(function()
		pcall(v);
	end);
end
end

local function pmg3()
    local player = game.Players.LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    
    if not backpack then
        crx("Backpack not found!", 1.1, Color3.fromRGB(255, 0, 0), 138081500)
        return
    end
    
    if PartAttachTool.Tool then
        PartAttachTool.Tool:Destroy()
        PartAttachTool.Tool = nil
    end
    
    for _, weld in pairs(PartAttachTool.Welds) do
        if weld then
            weld:Destroy()
        end
    end
    PartAttachTool.Welds = {}
    
    if PartAttachTool.Connection then
        PartAttachTool.Connection:Disconnect()
        PartAttachTool.Connection = nil
    end
    
    local tool = Instance.new("Tool")
    tool.Name = "PartAttachTool"
    tool.ToolTip = "Click on unanchored parts to weld to this tool"
    tool.RequiresHandle = true
    tool.Parent = backpack
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 1)
    handle.Transparency = 1
    handle.CanCollide = false
    handle.Parent = tool
    local selectionBox = Instance.new("SelectionBox")
    selectionBox.Name = "PartSelection"
    selectionBox.Adornee = nil
    selectionBox.Color3 = Color3.new(0, 1, 0)
    selectionBox.LineThickness = 0.05
    selectionBox.Parent = tool
    
    tool.Activated:Connect(function()
        local mouse = player:GetMouse()
        local targetPart = mouse.Target
        
        if targetPart and targetPart:IsA("BasePart") and not targetPart.Anchored then
            if PartAttachTool.Welds[targetPart] then
                PartAttachTool.Welds[targetPart]:Destroy()
                PartAttachTool.Welds[targetPart] = nil
            end

            local weld = Instance.new("Weld")
            weld.Name = "ToolAttachment"
            weld.Part0 = handle
            weld.Part1 = targetPart
            weld.C0 = CFrame.new()
            weld.C1 = handle.CFrame:ToObjectSpace(targetPart.CFrame)
            weld.Parent = handle
            
            PartAttachTool.Welds[targetPart] = weld
            
            selectionBox.Adornee = targetPart
        end
    end)
    
    tool.Unequipped:Connect(function()
        for part, weld in pairs(PartAttachTool.Welds) do
            if weld then
                weld:Destroy()
            end
        end
        PartAttachTool.Welds = {}
        selectionBox.Adornee = nil
    end)
    tool.Destroying:Connect(function()
        for part, weld in pairs(PartAttachTool.Welds) do
            if weld then
                weld:Destroy()
            end
        end
        PartAttachTool.Welds = {}
        PartAttachTool.Tool = nil
    end)
    
    PartAttachTool.Tool = tool
end

local Tab = Window:Tab({Title = "Part Mod", Icon = "settings"}) do
    Tab:Section({Title = "Part Modifier"})

    Tab:Button({
        Title = "Telekinesis Tool",
        Desc = "tlelele",
        Callback = function()
            pmg()
            btnclick()
        end
    })

    Tab:Button({
        Title = "Part Attach Tool",
        Desc = "wled",
        Callback = function()
            pmg3()
            pcz()
            btnclick()
        end
    })

Tab:Button({  
    Title = "Invert Parts Gravity",  
    Desc = "omg floating parts",  
    Callback = function()
        gravityEnabled = not gravityEnabled
        
        if gravityEnabled then
            GravOn()
            pcz()
        else
            GravOff()
        end
        btnclick()
    end  
})

Tab:Section({Title = ""})
Tab:Button({  
    Title = "Heavy Winds",  
    Desc = "my wig D:",  
    Callback = function()  
        windsEnabled = not windsEnabled
        
        if windsEnabled then
            WindOn()
            pcz()
        else
            WindOff()
        end
        btnclick()
    end  
})

    local function retain(part)
        if part and part:IsA("BasePart") and not part.Anchored then
            local rt = {part.CanCollide, part.CanTouch, part.CustomPhysicalProperties}
            part.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
            part.CanCollide = false
            part.CanTouch = false
            return rt
        end
        return nil
    end

    local function dopart2(v)
        if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
            local stuff = retain(v)
            if stuff then
                networkown[v] = {math.random(1,10000000)/100000, stuff[1], stuff[2], stuff[3]}
                
                if not v:FindFirstChild("bp") then
                    local m = v:GetMass()
                    local bp = Instance.new("BodyPosition")
                    bp.Name = "bp"
                    bp.P = m/0.64e-5
                    bp.D = m/0.64e-3
                    bp.MaxForce = Vector3.new(m/0.64e-6, m/0.64e-6, m/0.64e-6)
                    bp.Parent = v
                end
            end
        end
    end

    local function scanParts()
        for i, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                dopart2(v)
            end
        end
    end

    local function startPartControl()
        if ohb then ohb:Disconnect() end
        
        ohb = game:GetService("RunService").Heartbeat:Connect(function(dt)
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local mpos = character.HumanoidRootPart.Position
                
                for part, data in pairs(networkown) do
                    if part and part.Parent then
                        data[1] = data[1] + (dt * ss)
                        local bp = part:FindFirstChild("bp")
                        
                        if bp then
                            if cb == "tornado" then
                                bp.Position = ((CFrame.new(mpos) * CFrame.Angles(0, data[1] * ss, 0)) * CFrame.new(0, data[1] % (ts) - 6, -ts + math.random(ts))).Position
                            else
                                bp.Position = ((CFrame.new(mpos) * CFrame.Angles(0, data[1] * ss, 0)) * CFrame.new(0, data[1] % (ts) - 6, -ts + math.random(ts))).Position
                            end
                            
                            if ucf then
                                part.Velocity = Vector3.new(9e9, 9e9, 9e9)
                                part.CFrame = CFrame.new(bp.Position)
                            end
                        end
                    else
                        networkown[part] = nil
                    end
                end
            end
        end)
    end

    local function stopPartControl()
        if ohb then
            ohb:Disconnect()
            ohb = nil
        end
        
        for part, data in pairs(networkown) do
            if part and part:FindFirstChild("bp") then
                part.bp:Destroy()
            end
        end
        networkown = {}
    end

local heavyWinds2Button = Tab:Button({
    Title = "Heavy Winds 2",
    Desc = "woah",
    Callback = function()
        heavyWinds2Enabled = not heavyWinds2Enabled
        
        if heavyWinds2Enabled then
            cb = "tornado"
            scanParts()
            startPartControl()
        else
            cb = nil
            stopPartControl()
        end
        btnclick()
    end
})

    Tab:Slider({
        Title = "Wind Size",
        Min = 5,
        Max = 500,
        Rounding = 0,
        Value = 100,
        Callback = function(val)
            ts = val
            slidersound()
        end
    })

    Tab:Slider({
        Title = "Wind Speed",
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Value = 10,
        Callback = function(val)
            ss = val
            slidersound()
        end
    })
    Tab:Section({Title = ""})
    Tab:Button({
        Title = "Toggle Tornado",
        Desc = "tornado? :0",
        Callback = function()
            tt()
            btnclick()
        end
    })

    Tab:Slider({
        Title = "Set BaseRadius",
        Min = 0,
        Max = 1000,
        Rounding = 0,
        Value = 10,
        Callback = function(val)
            config.BaseRadius = val
            slidersound()
        end
    })

    Tab:Slider({
        Title = "Set TopRadius",
        Min = 0,
        Max = 1000,
        Rounding = 0,
        Value = 40,
        Callback = function(val)
            config.TopRadius = val
            slidersound()
        end
    })
    Tab:Section({Title = ""})
local partRotateEnabled = false
local partRotateRadius = 20
local partRotateSpeed = 2
local partRotateHeight = 5
local partRotateConnection = nil
local rotatingParts = {}

local function togglePartRotate()
    partRotateEnabled = not partRotateEnabled
    
    if partRotateEnabled then
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local center = character.HumanoidRootPart.Position
            local parts = workspace:GetPartBoundsInRadius(center, partRotateRadius * 2)
            rotatingParts = {}
            for _, part in ipairs(parts) do
                if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(character) then
                    local isPlayerPart = false
                    for _, player in pairs(Players:GetPlayers()) do
                        if part:IsDescendantOf(player.Character) then
                            isPlayerPart = true
                            break
                        end
                    end
                    
                    if not isPlayerPart then
                        local partPos = part.Position
                        local direction = (partPos - center)
                        direction = Vector3.new(direction.X, 0, direction.Z)
                        if direction.Magnitude > 0 then
                            direction = direction.Unit
                            rotatingParts[part] = {
                                originalDistance = math.clamp((partPos - center).Magnitude, partRotateRadius * 0.5, partRotateRadius * 1.5),
                                angle = math.atan2(direction.Z, direction.X),
                                heightOffset = partPos.Y - center.Y,
                                lastPosition = partPos
                            }
                            
                            part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001)
                            part.CanCollide = false
                            part.Massless = true
                        end
                    end
                end
            end
        end
        
        partRotateConnection = RunService.Heartbeat:Connect(function(dt)
            if not partRotateEnabled then return end
            
            local character = LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            
            local center = character.HumanoidRootPart.Position
            local currentTime = tick()
            
            local partsToRemove = {}
            for part, data in pairs(rotatingParts) do
                if not part or not part.Parent then
                    table.insert(partsToRemove, part)
                end
            end
            for _, part in ipairs(partsToRemove) do
                rotatingParts[part] = nil
            end
            
            for part, data in pairs(rotatingParts) do
                if part and part.Parent then
                    data.angle = data.angle + (partRotateSpeed * dt)
                    local baseRadius = data.originalDistance
                    local radiusVariation = math.sin(currentTime * 0.5 + data.angle) * (partRotateRadius * 0.1)
                    local currentRadius = baseRadius + radiusVariation
                    local heightVariation = math.sin(currentTime * 0.3 + data.angle * 1.5) * partRotateHeight
                    local targetHeight = center.Y + data.heightOffset + heightVariation
                    local targetPos = center + Vector3.new(
                        math.cos(data.angle) * currentRadius,
                        targetHeight - center.Y,
                        math.sin(data.angle) * currentRadius
                    )
                    local currentPos = part.Position
                    local direction = (targetPos - currentPos)
                    local distance = direction.Magnitude
                    
                    if distance > 0.1 then
                        local force = direction.Unit * math.min(distance * 50, partRotateSpeed * 100)
                        part.Velocity = force
                        part.RotVelocity = Vector3.new(
                            math.sin(data.angle) * 2,
                            math.cos(data.angle) * 3,
                            math.sin(data.angle * 0.5) * 1.5
                        )
                    end
                    
                    data.lastPosition = currentPos
                end
            end
            
            if #rotatingParts < 100 then -- Limit to prevent lag
                local nearbyParts = workspace:GetPartBoundsInRadius(center, partRotateRadius * 3)
                for _, part in ipairs(nearbyParts) do
                    if part:IsA("BasePart") and not part.Anchored and not rotatingParts[part] and not part:IsDescendantOf(character) then
                        local isPlayerPart = false
                        for _, player in pairs(Players:GetPlayers()) do
                            if part:IsDescendantOf(player.Character) then
                                isPlayerPart = true
                                break
                            end
                        end
                        
                        if not isPlayerPart then
                            local partPos = part.Position
                            local direction = (partPos - center)
                            direction = Vector3.new(direction.X, 0, direction.Z)
                            
                            if direction.Magnitude > 0 then
                                direction = direction.Unit
                                
                                rotatingParts[part] = {
                                    originalDistance = math.clamp((partPos - center).Magnitude, partRotateRadius * 0.5, partRotateRadius * 1.5),
                                    angle = math.atan2(direction.Z, direction.X),
                                    heightOffset = partPos.Y - center.Y,
                                    lastPosition = partPos
                                }
                                
                                part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001)
                                part.CanCollide = false
                                part.Massless = true
                            end
                        end
                    end
                end
            end
        end)
    else
        if partRotateConnection then
            partRotateConnection:Disconnect()
            partRotateConnection = nil
        end
        
        for part, data in pairs(rotatingParts) do
            if part and part.Parent then
                part.CustomPhysicalProperties = nil
                part.CanCollide = true
                part.Massless = false
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        rotatingParts = {}
    end
end

    Tab:Button({
        Title = "Toggle Part Rotate",
        Desc = "Orbit parts naturally",
        Callback = function()
            pcz()
            togglePartRotate()
            btnclick()
        end
    })
    
    Tab:Slider({
        Title = "Set Radius",
        Min = 5,
        Max = 100,
        Rounding = 0,
        Value = 20,
        Callback = function(val)
            partRotateRadius = val
            slidersound()
        end
    })
    
    Tab:Slider({
        Title = "Set Speed",
        Min = 1,
        Max = 10,
        Rounding = 0,
        Value = 2,
        Callback = function(val)
            partRotateSpeed = val
            slidersound()
        end
    })
    
    Tab:Slider({
        Title = "Set Height",
        Min = 0,
        Max = 20,
        Rounding = 0,
        Value = 5,
        Callback = function(val)
            partRotateHeight = val
            slidersound()
        end
    })

    local function erxa(part)
        if not mag[part] then
            mag[part] = {
                OriginalProperties = {
                    CanCollide = part.CanCollide,
                    CustomPhysicalProperties = part.CustomPhysicalProperties
                }
            }
            part.CanCollide = false
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        end
    end

    local function byeee(part)
        if mag[part] then
            local original = mag[part].OriginalProperties
            part.CanCollide = original.CanCollide
            part.CustomPhysicalProperties = original.CustomPhysicalProperties
            mag[part] = nil
        end
    end
    Tab:Section({Title = ""})
Tab:Button({
    Title = "Part Magnet",
    Desc = "Attract or repel parts or smth",
    Callback = function()
        magnetEnabled = not magnetEnabled
        startt = magnetEnabled
        
        if magnetEnabled then
            magnetConnection = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local magnetPosition = character.HumanoidRootPart.Position

                    for part in pairs(mag) do
                        if not part or not part.Parent then
                            mag[part] = nil
                        end
                    end
                    
                    for _, part in ipairs(Workspace:GetDescendants()) do
                        if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(character) then
                            local distance = (part.Position - magnetPosition).Magnitude
                            if distance < magnetRadius then
                                erxa(part)
                                
                                local direction
                                if magnetMode == "Pull" then
                                    direction = (magnetPosition - part.Position).Unit
                                else
                                    direction = (part.Position - magnetPosition).Unit
                                end
                                
                                local force = magnetStrength * (1 - (distance / magnetRadius))
                                part.Velocity = direction * force
                                part.RotVelocity = Vector3.zero
                            else
                                byeee(part)
                            end
                        end
                    end
                end
            end)
        else
            if magnetConnection then
                magnetConnection:Disconnect()
                magnetConnection = nil
            end

            for part in pairs(mag) do
                if part and part.Parent then
                    byeee(part)
                end
            end
            mag = {}
        end
        pcz()
        btnclick()
    end
})

    Tab:Dropdown({
        Title = "Magnet Mode",
        List = {"Pull", "Push"},
        Value = "Pull",
        Callback = function(mode)
            magnetMode = mode
            dropdownsound()
        end
    })

    Tab:Slider({
        Title = "Magnet Strength",
        Min = 10,
        Max = 500,
        Rounding = 0,
        Value = 100,
        Callback = function(val)
            magnetStrength = val
            slidersound()
        end
    })

    Tab:Slider({
        Title = "Magnet Radius",
        Min = 10,
        Max = 100,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            magnetRadius = val
            slidersound()
        end
    })
magnetEffectModel.Name = "MagnetEffects"
magnetEffectModel.Parent = workspace
local function setMagnetSimulationRadius()
    pcall(function()
        sethiddenproperty(LocalPlayer, "SimulationRadius", magnetConfig.SimulationRadius)
        sethiddenproperty(LocalPlayer, "MaxSimulationRadius", magnetConfig.SimulationRadius)
    end)
end

local function canManipulatePart(part)
    if not part:IsA("BasePart") then return false end
    if part.Anchored then return false end
    if part:GetMass() > magnetConfig.MaxMass then return false end
    if part:IsDescendantOf(LocalPlayer.Character) then return false end
    if part.Locked then return false end
    return true
end

local function claimMagnetPart(part)
    if not magnetClaimedParts[part] then
        magnetClaimedParts[part] = {
            Owner = LocalPlayer,
            ClaimTime = tick()
        }
        
        if magnetConfig.VisualEffects then
            local highlight = Instance.new("Highlight")
            highlight.Name = "MagnetClaimHighlight"
            highlight.FillColor = Color3.fromRGB(0, 170, 255)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.7
            highlight.Parent = part
        end
        
        delay(magnetConfig.ClaimDuration, function()
            if magnetClaimedParts[part] and magnetClaimedParts[part].Owner == LocalPlayer then
                magnetClaimedParts[part] = nil
                if part.Parent and part:FindFirstChild("MagnetClaimHighlight") then
                    part.MagnetClaimHighlight:Destroy()
                end
            end
        end)
    end
end

local function releaseMagnetPart(part)
    if magnetClaimedParts[part] and magnetClaimedParts[part].Owner == LocalPlayer then
        magnetClaimedParts[part] = nil
        if part.Parent and part:FindFirstChild("MagnetClaimHighlight") then
            part.MagnetClaimHighlight:Destroy()
        end
    end
end

local function calculateMagnetForce(part, rootPosition, direction)
    local distance = (part.Position - rootPosition).Magnitude
    local distanceRatio = math.clamp(1 - (distance/magnetConfig.MaxRadius), 0, 1)
    local forceFactor = distanceRatio^2 * magnetConfig.Strength * 100
    local forceDirection = direction.Unit + Vector3.new(0, 0.2, 0)
    return forceDirection.Unit * forceFactor * part:GetMass()
end

local function updateMagnet()
    local currentTime = tick()
    if currentTime - magnetLastUpdate < magnetConfig.UpdateRate then return end
    magnetLastUpdate = currentTime
    
    setMagnetSimulationRadius()
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    local rootPosition = rootPart.Position
    local direction
    local parts = workspace:FindPartsInRegion3(
        Region3.new(
            rootPosition - Vector3.new(magnetConfig.MaxRadius, magnetConfig.MaxRadius, magnetConfig.MaxRadius),
            rootPosition + Vector3.new(magnetConfig.MaxRadius, magnetConfig.MaxRadius, magnetConfig.MaxRadius)
        ),
        nil,
        magnetConfig.MaxParts
    )
    
    for _, part in ipairs(parts) do
        direction = (magnetConfig.Direction == "Pull") and (rootPosition - part.Position) or (part.Position - rootPosition)
        
        if canManipulatePart(part) then
            claimMagnetPart(part)
            
            local force = calculateMagnetForce(part, rootPosition, direction)
            part:ApplyImpulse(force * 0.03)
            if not magnetParts[part] then
                magnetParts[part] = true
                part.AncestryChanged:Connect(function()
                    magnetParts[part] = nil
                    releaseMagnetPart(part)
                end)
            end
        elseif magnetParts[part] then
            magnetParts[part] = nil
            releaseMagnetPart(part)
        end
    end
end

local function cleanupMagnet()
    for part, _ in pairs(magnetParts) do
        if part and part.Parent then
            releaseMagnetPart(part)
        end
    end
    magnetParts = {}
    
    if magnetConnection then
        magnetConnection:Disconnect()
        magnetConnection = nil
    end
    
    magnetEffectModel:ClearAllChildren()
end

local function updateVortex()
    if not vortexEnabled then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local rootPos = rootPart.Position
    
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(character) then
            local distance = (part.Position - rootPos).Magnitude
            if distance <= vortexRadius then
                if not vortexParts[part] then
                    vortexParts[part] = {
                        Velocity = Instance.new("BodyVelocity"),
                        OriginalProps = {
                            CanCollide = part.CanCollide,
                            CustomPhysicalProperties = part.CustomPhysicalProperties
                        }
                    }
                    vortexParts[part].Velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    vortexParts[part].Velocity.Parent = part
                    
                    part.CanCollide = false
                    part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                end
                
                local toPart = part.Position - rootPos
                local tangent = Vector3.new(-toPart.Z, 0, toPart.X) * vortexDirection
                tangent = tangent.Unit
                local inward = -toPart.Unit * 0.3
                local force = (1 - (distance/vortexRadius)) * vortexStrength * 100
                
                vortexParts[part].Velocity.Velocity = (tangent + inward) * force
            elseif vortexParts[part] then
                part.CanCollide = vortexParts[part].OriginalProps.CanCollide
                part.CustomPhysicalProperties = vortexParts[part].OriginalProps.CustomPhysicalProperties
                if vortexParts[part].Velocity then
                    vortexParts[part].Velocity:Destroy()
                end
                vortexParts[part] = nil
            end
        end
    end
end

local function cleanupVortex()
    for part, data in pairs(vortexParts) do
        if part and part.Parent then
            part.CanCollide = data.OriginalProps.CanCollide
            part.CustomPhysicalProperties = data.OriginalProps.CustomPhysicalProperties
            if data.Velocity then
                data.Velocity:Destroy()
            end
        end
    end
    vortexParts = {}
end

local function launchNearbyParts()
    local character = LocalPlayer.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local rootPosition = rootPart.Position
    local partsLaunched = 0
    local launchStrength = 200
    local launchHeight = 50
    
    local parts = workspace:FindPartsInRegion3(
        Region3.new(
            rootPosition - Vector3.new(magnetConfig.MaxRadius, 5, magnetConfig.MaxRadius),
            rootPosition + Vector3.new(magnetConfig.MaxRadius, magnetConfig.MaxRadius, magnetConfig.MaxRadius)
        ),
        nil,
        magnetConfig.MaxParts
    )
    
    for _, part in ipairs(parts) do
        if canManipulatePart(part) then
            claimMagnetPart(part)
            
            local direction = (part.Position - rootPosition).Unit
            direction = Vector3.new(
                direction.X * 0.8, 
                math.clamp(launchHeight/50, 0.3, 1.5),
                direction.Z * 0.8
            ).Unit
            
            local distanceFactor = 1 - math.clamp((part.Position - rootPosition).Magnitude/magnetConfig.MaxRadius, 0, 1)
            local force = direction * launchStrength * part:GetMass() * (0.5 + distanceFactor * 1.5)
            
            part:ApplyImpulse(force)
            partsLaunched = partsLaunched + 1
        end
    end
    
    Window:Notify({
        Title = "Part Launcher",
        Desc = ("Launched %d parts!"):format(partsLaunched),
        Time = 3
    })
end
Tab:Section({Title = ""})
Tab:Toggle({
    Title = "Part Magnet2",
    Desc = "wow new cooler version :0",
    Value = false,
    Callback = function(v)
        magnetEnabled = v
        if v then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            magnetConnection = RunService.Heartbeat:Connect(updateMagnet)
        else
            cleanupMagnet()
        end
        togglesound()
    end
})

Tab:Slider({
    Title = "Magnet2 Radius",
    Desc = "Area of effect for magnet",
    Min = 10,
    Max = 200,
    Rounding = 0,
    Value = 50,
    Callback = function(val)
        magnetConfig.MaxRadius = val
        slidersound()
    end
})

Tab:Slider({
    Title = "Magnet2 Strength",
    Desc = "Force of attraction/repulsion",
    Min = 10,
    Max = 1000,
    Rounding = 0,
    Value = 100,
    Callback = function(val)
        magnetConfig.Strength = val
        slidersound()
    end
})

Tab:Dropdown({
    Title = "Magnet2 Direction",
    List = {"Pull", "Push"},
    Value = "Pull",
    Callback = function(mode)
        magnetConfig.Direction = mode
        dropdownsound()
    end
})

Tab:Section({Title = ""})

Tab:Button({
    Title = "Launch Parts",
    Desc = "Launch nearby parts into the air",
    Callback = function()
        launchNearbyParts()
        btnclick()
    end
})

Tab:Section({Title = ""})

Tab:Toggle({
    Title = "Part Vortex",
    Desc = "Create swirling vortex of parts around you",
    Value = false,
    Callback = function(v)
        vortexEnabled = v
        if v then
            RunService.Heartbeat:Connect(updateVortex)
        else
            cleanupVortex()
        end
        togglesound()
    end
})

Tab:Slider({
    Title = "Vortex Radius",
    Desc = "Size of the vortex",
    Min = 20,
    Max = 200,
    Rounding = 0,
    Value = 90,
    Callback = function(val)
        vortexRadius = val
        slidersound()
    end
})

Tab:Slider({
    Title = "Vortex Strength",
    Desc = "Rotation speed of vortex",
    Min = 1,
    Max = 10,
    Rounding = 0,
    Value = 3,
    Callback = function(val)
        vortexStrength = val
        slidersound()
    end
})

Tab:Dropdown({
    Title = "Vortex Direction",
    List = {"Clockwise", "Counter-Clockwise"},
    Value = "Clockwise",
    Callback = function(direction)
        vortexDirection = (direction == "Clockwise") and 1 or -1
        dropdownsound()
    end
})

Tab:Section({Title = ""})

Tab:Slider({
    Title = "Part Friction",
    Desc = "Adjust part friction",
    Min = 0,
    Max = 1,
    Rounding = 2,
    Value = 0.3,
    Callback = function(val)
        for part, data in pairs(claimedParts) do
            if part and part.Parent then
                part.Friction = val
            end
        end
        slidersound()
    end
})

Tab:Slider({
    Title = "Part Elasticity",
    Desc = "Adjust part bounciness",
    Min = 0,
    Max = 1,
    Rounding = 2,
    Value = 0.5,
    Callback = function(val)
        for part, data in pairs(claimedParts) do
            if part and part.Parent then
                part.Elasticity = val
            end
        end
        slidersound()
    end
})

Tab:Toggle({
    Title = "Anchored Mode",
    Desc = "Toggle anchored state for parts",
    Value = false,
    Callback = function(v)
        for part, data in pairs(claimedParts) do
            if part and part.Parent then
                part.Anchored = v
            end
        end
        togglesound()
    end
})
end

local function GetTpuaPlayerList()
    local playerList = {"others"}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function UpdateTpuaTarget(selectedTarget)
    tpuaTarget = selectedTarget
end

local TpuaPartHandler = {}
TpuaPartHandler.__index = TpuaPartHandler

function TpuaPartHandler.new()
    local self = setmetatable({}, TpuaPartHandler)
    self.Connections = {}
    self.TargetParts = {}
    return self
end

function TpuaPartHandler:SetupPart(part)
    if part:IsA("BasePart") and not part.Anchored then
        if not part:IsDescendantOf(LocalPlayer.Character) then
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            
            local attachment = Instance.new("Attachment")
            attachment.Parent = part
            
            local alignPosition = Instance.new("AlignPosition")
            alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
            alignPosition.Attachment0 = attachment
            alignPosition.MaxForce = 999999999999999
            alignPosition.MaxVelocity = math.huge
            alignPosition.Responsiveness = 200
            alignPosition.Parent = part
            
            local gyro = Instance.new("BodyGyro")
            gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            gyro.P = 100000
            gyro.Parent = part

            table.insert(self.TargetParts, {
                Part = part,
                Attachment = attachment,
                AlignPosition = alignPosition,
                Gyro = gyro
            })
        end
    end
end

function TpuaPartHandler:Start()
    for _, v in ipairs(Workspace:GetDescendants()) do
        self:SetupPart(v)
    end

    table.insert(self.Connections, Workspace.DescendantAdded:Connect(function(v)
        self:SetupPart(v)
    end))

    table.insert(self.Connections, RunService.Heartbeat:Connect(function()
        sethiddenproperty(LocalPlayer, "SimulationRadius", getpart)
        sethiddenproperty(LocalPlayer, "MaxSimulationRadius", getpart)
        
        for _, targetData in ipairs(self.TargetParts) do
            pcall(function()
                local part = targetData.Part
                if part and part.Parent then
                    local targetPlayer = nil
                    
                    if tpuaTarget == "others" then
                        local potentialTargets = {}
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                table.insert(potentialTargets, player)
                            end
                        end
                        
                        if #potentialTargets > 0 then
                            targetPlayer = potentialTargets[math.random(1, #potentialTargets)]
                        end
                    else
                        targetPlayer = GetPlayer(tpuaTarget)
                    end
                    
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                        
                        targetData.AlignPosition.Position = targetPos
                        targetData.Gyro.CFrame = CFrame.new(targetPos) * CFrame.Angles(
                            math.rad(math.random(-360, 360)),
                            math.rad(math.random(-360, 360)),
                            math.rad(math.random(-360, 360))
                        )
                        
                        part.Velocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))
                        part.RotVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))
                    end
                end
            end)
        end
    end))
end

function TpuaPartHandler:Stop()
    for _, connection in ipairs(self.Connections) do
        connection:Disconnect()
    end
    
    for _, targetData in ipairs(self.TargetParts) do
        pcall(function()
            if targetData.Part and targetData.Part.Parent then
                targetData.AlignPosition:Destroy()
                targetData.Gyro:Destroy()
                targetData.Attachment:Destroy()
                targetData.Part.CustomPhysicalProperties = nil
            end
        end)
    end
    
    self.Connections = {}
    self.TargetParts = {}
end

local function InitializeTpuaBypass()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "FireServer" then
            return nil
        end
        return old(self, ...)
    end)
    
    for _, v in next, getconnections(game:GetService("ScriptContext").Error) do 
        v:Disable()
    end
    
    for _, v in next, getconnections(game:GetService("LogService").MessageOut) do 
        v:Disable()
    end
end

local function SetupTpuaNetwork()
    settings().Physics.AllowSleep = false
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Rendering.QualityLevel = 1
    if not getgenv().TpuaNetworkBypass then
        getgenv().TpuaNetworkBypass = true
        local old
        old = hookmetamethod(game, "__index", newcclosure(function(self, idx)
            if idx == "NetworkOwnershipRule" then
                return Enum.NetworkOwnership.Manual
            end
            return old(self, idx)
        end))
    end
end

local function StartTpua()
    InitializeTpuaBypass()
    SetupTpuaNetwork()
    
    tpuaHandler = TpuaPartHandler.new()
    tpuaHandler:Start()
    
    spawn(function()
        while wait() do
            if LocalPlayer.Character then
                for _, connection in ipairs(getconnections(LocalPlayer.Character.DescendantAdded)) do
                    connection:Disable()
                end
            end
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
        end
    end)
end

local function StopTpua()
    if tpuaHandler then
        tpuaHandler:Stop()
        tpuaHandler = nil
    end
end

local function ToggleTpua()
    tpuaActive = not tpuaActive
    
    if tpuaActive then
        StartTpua()
    else
        StopTpua()
    end
end

local Tab = Window:Tab({Title = "Tpua", Icon = "wind"}) do
    Tab:Section({Title = "Teleport unanchored to Player(s)"})

    Tab:Label({
        Title = "Brick",
        Desc = "you might get FPS drops which is Ur problem :D",
    })

    Tab:Toggle({
        Title = "Enable Tpua",
        Desc = "Make parts fly towards selected players",
        Value = false,
        Callback = function(v)
            if v then
                ToggleTpua()
            else
                if tpuaActive then
                    ToggleTpua()
                end
            end
            btnclick()
        end
    })
    
    Tab:Dropdown({
        Title = "Target Selection",
        List = GetTpuaPlayerList(),
        Value = "others",
        Callback = function(selectedPlayer)
            UpdateTpuaTarget(selectedPlayer)
            if tpuaActive then
                StopTpua()
                task.wait(0.1)
                StartTpua()
            end
            dropdownsound()
        end
    })
end

local Tab = Window:Tab({Title = "Part Controller", Icon = "settings"}) do

    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HRP = Character:WaitForChild("HumanoidRootPart")

    local AttachmentSystem = {
        Parts = {},
        CurrentMode = "None",
        Enabled = false,
        AnimationSpeed = 1,
        ScaleFactor = 1,
        AutoSize = true,
        NoCollision = true
    }

    local AttachmentModes = {
        ["Angel_Wings"] = {
            Scale = function(partCount) return {
                Width = math.min(partCount * 0.4, 8),
                Height = math.min(partCount * 0.5, 6)
            } end,
            Formation = function(part, data, index, total, scale)
                local side = index % 2 == 0 and 1 or -1
                local layer = math.floor(index / 2) / (total/2)
                local curve = math.sin(layer * math.pi)
                return {
                    Position = HRP.CFrame * CFrame.new(
                        side * (scale.Width * layer),
                        scale.Height * curve,
                        -layer * 2
                    ),
                    Rotation = CFrame.Angles(0, side * 0.5, side * (math.pi/4 * curve))
                }
            end
        },

        ["Demon_Wings"] = {
            Scale = function(partCount) return {
                Span = math.min(partCount * 0.6, 10),
                Curve = math.min(partCount * 0.4, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local side = index % 2 == 0 and 1 or -1
                local progress = (index / total)
                local curve = math.sin(progress * math.pi)
                local time = tick() * AttachmentSystem.AnimationSpeed
                return {
                    Position = HRP.CFrame * CFrame.new(
                        side * (scale.Span * progress),
                        scale.Curve * curve + math.sin(time + progress * 2),
                        -progress * 4
                    ),
                    Rotation = CFrame.Angles(
                        side * (curve * 0.7),
                        side * (progress * 1.2),
                        side * (math.pi/2.5 * curve)
                    )
                }
            end
        },

        ["Dragon_Aura"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.5, 12),
                Height = math.min(partCount * 0.6, 8)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local height = (index / total) * scale.Height
                local angle = (index / total) * math.pi * 8 + time
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle) * scale.Radius * (height/scale.Height),
                        height - scale.Height/2,
                        math.sin(angle) * scale.Radius * (height/scale.Height)
                    ),
                    Rotation = CFrame.Angles(time, angle, time * 0.5)
                }
            end
        },

        ["Death_Crown"] = {
            Scale = function(partCount) return {
                Size = math.min(partCount * 0.3, 5),
                Points = math.min(partCount * 0.4, 6)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local angle = (index / total) * math.pi * 2
                local height = math.abs(math.sin(angle * scale.Points)) * scale.Size
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle) * scale.Size,
                        2 + height + math.sin(time + index * 0.1),
                        math.sin(angle) * scale.Size
                    ),
                    Rotation = CFrame.Angles(height * 0.5, angle, math.rad(60))
                }
            end
        },

        ["Void_Portal"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.4, 7),
                Depth = math.min(partCount * 0.3, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local angle = (index / total) * math.pi * 2
                local spiral = angle + time
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(spiral) * scale.Radius,
                        math.sin(spiral) * scale.Radius,
                        math.sin(time + index * 0.1) * scale.Depth
                    ),
                    Rotation = CFrame.Angles(spiral, time, angle)
                }
            end
        },

        ["Death_Cage"] = {
            Scale = function(partCount) return {
                Size = math.min(partCount * 0.4, 6)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local layer = math.floor(index / 8)
                local segment = index % 8
                local angle = (segment / 8) * math.pi * 2
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle + time) * scale.Size,
                        layer * 2 - 5,
                        math.sin(angle + time) * scale.Size
                    ),
                    Rotation = CFrame.Angles(time, angle, math.pi/2)
                }
            end
        },

        ["Shadow_Blades"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.3, 5),
                Height = math.min(partCount * 0.4, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local angle = (index / total) * math.pi * 2
                local height = math.sin(angle * 3 + time) * scale.Height
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle) * scale.Radius,
                        height,
                        math.sin(angle) * scale.Radius
                    ),
                    Rotation = CFrame.Angles(math.pi/2, angle + time, time)
                }
            end
        },

        ["Hell_Spiral"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.5, 8),
                Height = math.min(partCount * 0.6, 10)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local spiral = (index / total) * math.pi * 12
                local height = math.cos(spiral + time) * scale.Height
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(spiral) * scale.Radius * (1 - index/total),
                        height,
                        math.sin(spiral) * scale.Radius * (1 - index/total)
                    ),
                    Rotation = CFrame.Angles(spiral, time, spiral * 0.5)
                }
            end
        },

        ["Devil_Cross"] = {
            Scale = function(partCount) return {
                Size = math.min(partCount * 0.4, 6)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local section = math.floor(index / (total/4))
                local progress = (index % (total/4)) / (total/4)
                local wave = math.sin(time + progress * math.pi) * 0.5
                local positions = {
                    Vector3.new(0, scale.Size * progress, 0),
                    Vector3.new(scale.Size * progress, 0, 0),
                    Vector3.new(0, -scale.Size * progress, 0),
                    Vector3.new(-scale.Size * progress, 0, 0)
                }
                return {
                    Position = HRP.CFrame * CFrame.new(positions[section + 1]) * CFrame.new(0, wave, 0),
                    Rotation = CFrame.Angles(wave, time, math.rad(90 * section))
                }
            end
        },

        ["Death_Ring"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.4, 7),
                Spin = math.min(partCount * 0.3, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local angle = (index / total) * math.pi * 2
                local spin = time * scale.Spin
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle + spin) * scale.Radius,
                        math.sin(time) * 2,
                        math.sin(angle + spin) * scale.Radius
                    ),
                    Rotation = CFrame.Angles(spin, angle, spin * 0.5)
                }
            end
        },
        
        ["Pentagram"] = {
            Scale = function(partCount) return {
                Size = math.min(partCount * 0.4, 5)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local points = 5
                local angle = (index / total) * math.pi * 2
                local starAngle = angle * points
                local radius = scale.Size * (1 + math.sin(angle * 2 + time) * 0.2)
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(starAngle) * radius,
                        math.sin(time) * 2,
                        math.sin(starAngle) * radius
                    ),
                    Rotation = CFrame.Angles(time, starAngle, angle)
                }
            end
        },

        ["Blood_Ritual"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.5, 8)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local angle = (index / total) * math.pi * 2
                local height = math.sin(time + index * 0.5) * 3
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle + time) * scale.Radius,
                        height,
                        math.sin(angle + time) * scale.Radius
                    ),
                    Rotation = CFrame.Angles(
                        math.sin(time) * 0.5,
                        angle + time,
                        math.cos(time) * 0.5
                    )
                }
            end
        },


        ["666"] = {
            Scale = function(partCount) return {
                Size = math.min(partCount * 0.3, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local segment = index % 3
                local number = math.floor(index / 3) % 3
                local angle = (segment / 3) * math.pi * 2
                local offset = number * scale.Size * 2
                return {
                    Position = HRP.CFrame * CFrame.new(
                        offset + math.cos(angle + time) * scale.Size,
                        math.sin(time) * 2,
                        math.sin(angle + time) * scale.Size
                    ),
                    Rotation = CFrame.Angles(time, angle, time * 0.5)
                }
            end
        },

        ["Quantum_Orbit"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.3, 6),
                Layers = math.min(partCount * 0.2, 3)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local layer = (index % scale.Layers) / scale.Layers
                local angle = (index / total) * math.pi * 8 + time
                local quantum = math.sin(time * 2 + index * 0.5) * 0.5 + 0.5
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle) * scale.Radius * (1 + layer),
                        math.sin(angle * 2) * scale.Radius * quantum,
                        math.sin(angle) * scale.Radius * (1 + layer)
                    ),
                    Rotation = CFrame.Angles(quantum * math.pi, angle, time)
                }
            end
        },

        ["Celestial_Sphere"] = {
            Scale = function(partCount) return {
                Radius = math.min(partCount * 0.4, 9),
                Complexity = math.min(partCount * 0.3, 5)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local phi = (index / total) * math.pi
                local theta = (index / total) * math.pi * 2
                local wave = math.sin(time + phi * scale.Complexity)
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.sin(phi) * math.cos(theta) * scale.Radius * wave,
                        math.cos(phi) * scale.Radius,
                        math.sin(phi) * math.sin(theta) * scale.Radius * wave
                    ),
                    Rotation = CFrame.Angles(phi, theta, time)
                }
            end
        },

        ["Neural_Network"] = {
            Scale = function(partCount) return {
                Nodes = math.min(partCount * 0.4, 8),
                Connections = math.min(partCount * 0.3, 6)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local node = index % scale.Nodes
                local connection = math.floor(index / scale.Nodes)
                local pulse = math.sin(time * 3 + node * 0.7) * 2
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(node * math.pi/scale.Nodes) * scale.Connections,
                        pulse + connection * 1.5,
                        math.sin(node * math.pi/scale.Nodes) * scale.Connections
                    ),
                    Rotation = CFrame.Angles(pulse * 0.3, node * math.pi/scale.Nodes, time)
                }
            end
        },

        ["Time_Vortex"] = {
            Scale = function(partCount) return {
                Spiral = math.min(partCount * 0.5, 10),
                TimeWarp = math.min(partCount * 0.4, 8)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local spiral = (index / total) * math.pi * 16
                local timeDistortion = math.sin(time * 0.5 + spiral) * scale.TimeWarp
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(spiral) * (scale.Spiral - timeDistortion),
                        spiral * 0.3,
                        math.sin(spiral) * (scale.Spiral - timeDistortion)
                    ),
                    Rotation = CFrame.Angles(spiral * 0.2, time * 2, spiral * 0.1)
                }
            end
        },

        ["Crystal_Cluster"] = {
            Scale = function(partCount) return {
                Base = math.min(partCount * 0.3, 5),
                Crystals = math.min(partCount * 0.4, 7)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local crystal = index % scale.Crystals
                local layer = math.floor(index / scale.Crystals)
                local facet = (crystal / scale.Crystals) * math.pi * 2
                local growth = math.sin(time + crystal * 0.8) * layer
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(facet) * (scale.Base + growth),
                        layer * 1.5 + math.cos(time + facet) * 0.5,
                        math.sin(facet) * (scale.Base + growth)
                    ),
                    Rotation = CFrame.Angles(
                        facet * 0.5,
                        time + facet,
                        math.rad(60) + growth * 0.2
                    )
                }
            end
        },

        ["Hologram_Grid"] = {
            Scale = function(partCount) return {
                GridSize = math.min(partCount * 0.3, 6),
                Resolution = math.min(partCount * 0.2, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local x = (index % scale.Resolution) - scale.Resolution/2
                local z = math.floor(index / scale.Resolution) % scale.Resolution - scale.Resolution/2
                local y = math.floor(index / (scale.Resolution * scale.Resolution))
                local pulse = math.sin(time + x * z * 0.1) * 2
                return {
                    Position = HRP.CFrame * CFrame.new(
                        x * scale.GridSize,
                        y * 2 + pulse,
                        z * scale.GridSize
                    ),
                    Rotation = CFrame.Angles(
                        math.rad(90) * (y % 3),
                        time + x * 0.5,
                        pulse * 0.3
                    )
                }
            end
        },

        ["Solar_System"] = {
            Scale = function(partCount) return {
                Orbits = math.min(partCount * 0.3, 5),
                SystemSize = math.min(partCount * 0.5, 12)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local orbit = index % scale.Orbits
                local planet = math.floor(index / scale.Orbits)
                local orbitRadius = (orbit + 1) * (scale.SystemSize / scale.Orbits)
                local planetAngle = (planet / (total/scale.Orbits)) * math.pi * 2 + time / (orbit + 1)
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(planetAngle) * orbitRadius,
                        math.sin(time * 0.7 + orbit) * 2,
                        math.sin(planetAngle) * orbitRadius
                    ),
                    Rotation = CFrame.Angles(
                        planetAngle * 0.5,
                        time / (orbit + 1),
                        math.rad(orbit * 30)
                    )
                }
            end
        },

        ["DNA_Helix"] = {
            Scale = function(partCount) return {
                Height = math.min(partCount * 0.6, 15),
                HelixRadius = math.min(partCount * 0.3, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local height = (index / total) * scale.Height - scale.Height/2
                local angle = height * math.pi * 2 + time
                local side = index % 2 == 0 and 1 or -1
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle) * scale.HelixRadius * side,
                        height,
                        math.sin(angle) * scale.HelixRadius * side
                    ),
                    Rotation = CFrame.Angles(
                        angle,
                        height * 0.5,
                        math.rad(90) * side
                    )
                }
            end
        },

        ["Magnetic_Field"] = {
            Scale = function(partCount) return {
                FieldSize = math.min(partCount * 0.4, 8),
                Poles = math.min(partCount * 0.3, 4)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local pole = index % (scale.Poles * 2)
                local line = math.floor(index / (scale.Poles * 2))
                local isNorth = pole < scale.Poles
                local poleAngle = (pole % scale.Poles) / scale.Poles * math.pi * 2
                local fieldStrength = math.sin(time + line * 0.5) * 3
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(poleAngle) * scale.FieldSize,
                        (isNorth and 1 or -1) * fieldStrength,
                        math.sin(poleAngle) * scale.FieldSize
                    ),
                    Rotation = CFrame.Angles(
                        poleAngle,
                        time,
                        (isNorth and math.pi or 0)
                    )
                }
            end
        },

        ["Chaos_Theory"] = {
            Scale = function(partCount) return {
                Chaos = math.min(partCount * 0.5, 10),
                Order = math.min(partCount * 0.2, 3)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local x = math.sin(time * 0.1 + index * 0.01) * scale.Chaos
                local y = math.cos(time * 0.13 + index * 0.02) * scale.Chaos
                local z = math.sin(time * 0.17 + index * 0.03) * scale.Order
                return {
                    Position = HRP.CFrame * CFrame.new(x, y, z),
                    Rotation = CFrame.Angles(
                        x * 0.1,
                        y * 0.1,
                        z * 0.1
                    )
                }
            end
        },

        ["Binary_Code"] = {
            Scale = function(partCount) return {
                Bits = math.min(partCount * 0.3, 6),
                StreamLength = math.min(partCount * 0.4, 8)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local bitPos = index % scale.Bits
                local streamPos = math.floor(index / scale.Bits)
                local bitValue = (streamPos + bitPos) % 2
                local pulse = math.sin(time * 5 + streamPos * 0.5) * bitValue
                return {
                    Position = HRP.CFrame * CFrame.new(
                        bitPos * 2 - scale.Bits,
                        pulse * 2,
                        streamPos * 1.5 - scale.StreamLength/2
                    ),
                    Rotation = CFrame.Angles(
                        math.rad(90) * bitValue,
                        time,
                        pulse * 0.5
                    )
                }
            end
        },
         ["Tornado"] = {
             Scale = function(partCount) return {
                 Height = math.min(partCount * 2, 50),
                 BaseRadius = math.min(partCount * 1.5, 25),
                 TopRadius = math.min(partCount * 0.5, 8),
                 RotationSpeed = math.min(partCount * 0.1, 3)
             } end,
             Formation = function(part, data, index, total, scale)
                 local time = tick() * AttachmentSystem.AnimationSpeed
                 local heightRatio = (index / total)
                 local currentRadius = scale.BaseRadius * (1 - heightRatio * 0.7)
                 local rotationAngle = time * scale.RotationSpeed * (1 + heightRatio * 2)
                 local spiralTightness = 2
                 local verticalOffset = heightRatio * scale.Height
                 local horizontalWobble = math.sin(time * 0.5 + heightRatio * 8) * 2
                 local spiralProgress = (index / total) * spiralTightness * math.pi * 2
                 local x = math.cos(rotationAngle + spiralProgress) * currentRadius
                 local z = math.sin(rotationAngle + spiralProgress) * currentRadius
                 local y = verticalOffset - scale.Height/2
                 local groundEffect = 0
                 if heightRatio < 0.2 then
                     groundEffect = math.sin(time * 3 + index) * (0.2 - heightRatio) * 10
                 end
                 local funnelTaper = math.pow(heightRatio, 1.5) * 3
                 x = x * (1 - funnelTaper)
                 z = z * (1 - funnelTaper)
                 local partRotation = CFrame.Angles(
                     math.rad(45) + math.sin(time + heightRatio) * 0.3,
                     rotationAngle + spiralProgress,
                     math.rad(90) + math.cos(time * 2 + index) * 0.5
                 )
                 
                 return {
                     Position = HRP.CFrame * CFrame.new(
                         x + horizontalWobble,
                         y + groundEffect,
                         z + horizontalWobble
                     ),
                     Rotation = partRotation
                 }
             end
         },
         ["Super_Tornado"] = {
             Scale = function(partCount) return {
                 Height = math.min(partCount * 3, 80),
                 BaseRadius = math.min(partCount * 2, 40),
                 TopRadius = math.min(partCount * 0.8, 15),
                 RotationSpeed = math.min(partCount * 0.15, 5),
                 Turbulence = math.min(partCount * 0.2, 8)
             } end,
             Formation = function(part, data, index, total, scale)
                 local time = tick() * AttachmentSystem.AnimationSpeed
                 local heightRatio = (index / total)
                 local currentRadius = scale.BaseRadius * (1 - heightRatio * 0.6)
                 local rotationAngle = time * scale.RotationSpeed * (1 + heightRatio * 3)
                 local spiralArms = 3
                 local arm = index % spiralArms
                 local spiralProgress = (index / total) * 8 * math.pi * 2 + (arm / spiralArms) * math.pi * 2
                 local turbulence = math.sin(time * 2 + index * 0.1) * scale.Turbulence
                 local verticalTurbulence = math.cos(time * 1.5 + index * 0.05) * scale.Turbulence * 0.5
                 local x = math.cos(rotationAngle + spiralProgress) * currentRadius
                 local z = math.sin(rotationAngle + spiralProgress) * currentRadius
                 local y = heightRatio * scale.Height - scale.Height/2
                 local groundRumble = 0
                 if heightRatio < 0.3 then
                     groundRumble = math.sin(time * 4 + index * 0.5) * (0.3 - heightRatio) * 15
                 end
                 local secondaryVortex = math.sin(time * 3 + heightRatio * 10) * currentRadius * 0.3
                 local partRotation = CFrame.Angles(
                     math.rad(60) + math.sin(time * 2 + heightRatio) * 0.5,
                     rotationAngle + spiralProgress * 2,
                     math.rad(120) + math.cos(time * 3 + index) * 1.0
                 )
                 
                 return {
                     Position = HRP.CFrame * CFrame.new(
                         x + turbulence + secondaryVortex,
                         y + groundRumble + verticalTurbulence,
                         z + turbulence
                     ),
                     Rotation = partRotation
                 }
             end
         },
         ["Water_Spout"] = {
             Scale = function(partCount) return {
                 Height = math.min(partCount * 1.8, 35),
                 BaseRadius = math.min(partCount * 1.2, 20),
                 RotationSpeed = math.min(partCount * 0.08, 2),
                 WaveEffect = math.min(partCount * 0.3, 6)
             } end,
             Formation = function(part, data, index, total, scale)
                 local time = tick() * AttachmentSystem.AnimationSpeed
                 local heightRatio = (index / total)
                 local currentRadius = scale.BaseRadius * (1 - heightRatio * 0.8)
                 local rotationAngle = time * scale.RotationSpeed
                 local wave = math.sin(time * 1.5 + heightRatio * 12) * scale.WaveEffect
                 local spiralProgress = (index / total) * 4 * math.pi * 2
                 local x = math.cos(rotationAngle + spiralProgress) * (currentRadius + wave)
                 local z = math.sin(rotationAngle + spiralProgress) * (currentRadius + wave)
                 local y = heightRatio * scale.Height - scale.Height/2
                 local spray = 0
                 if heightRatio < 0.25 then
                     spray = math.cos(time * 2 + index) * (0.25 - heightRatio) * 8
                 end
                 local partRotation = CFrame.Angles(
                     math.rad(30) + math.sin(time + heightRatio * 5) * 0.2,
                     rotationAngle + spiralProgress,
                     math.rad(45) + wave * 0.1
                 )
                 
                 return {
                     Position = HRP.CFrame * CFrame.new(
                         x,
                         y + spray,
                         z
                     ),
                     Rotation = partRotation
                 }
             end
         },
         ["Fire_Tornado"] = {
             Scale = function(partCount) return {
                 Height = math.min(partCount * 2.2, 45),
                 BaseRadius = math.min(partCount * 1.3, 22),
                 RotationSpeed = math.min(partCount * 0.12, 4),
                 FlameFlicker = math.min(partCount * 0.4, 10)
             } end,
             Formation = function(part, data, index, total, scale)
                 local time = tick() * AttachmentSystem.AnimationSpeed
                 local heightRatio = (index / total)
                 local currentRadius = scale.BaseRadius * (1 - heightRatio * 0.65)
                 local rotationAngle = time * scale.RotationSpeed * (1 + heightRatio)
                 local flicker = math.random() * scale.FlameFlicker
                 local spiralProgress = (index / total) * 6 * math.pi * 2
                 local fireChaos = math.sin(time * 4 + index * 0.2) * flicker * 0.3
                 local verticalChaos = math.cos(time * 3 + index * 0.1) * flicker * 0.2
                 local x = math.cos(rotationAngle + spiralProgress) * currentRadius
                 local z = math.sin(rotationAngle + spiralProgress) * currentRadius
                 local y = heightRatio * scale.Height - scale.Height/2
                 local emberFloat = math.sin(time * 5 + index) * (1 - heightRatio) * 4
                 local partRotation = CFrame.Angles(
                     math.rad(35) + math.sin(time * 2 + index) * 0.4,
                     rotationAngle + spiralProgress + fireChaos,
                     math.rad(75) + math.cos(time * 3 + index) * 0.6
                 )
                 
                 return {
                     Position = HRP.CFrame * CFrame.new(
                         x + fireChaos,
                         y + emberFloat + verticalChaos,
                         z + fireChaos
                     ),
                     Rotation = partRotation
                 }
             end
         },
        ["Gravity_Well"] = {
            Scale = function(partCount) return {
                WellDepth = math.min(partCount * 0.4, 7),
                EventHorizon = math.min(partCount * 0.3, 5)
            } end,
            Formation = function(part, data, index, total, scale)
                local time = tick() * AttachmentSystem.AnimationSpeed
                local angle = (index / total) * math.pi * 2
                local distance = (index / total) * scale.EventHorizon
                local warp = 1 / (distance + 0.1) * scale.WellDepth
                return {
                    Position = HRP.CFrame * CFrame.new(
                        math.cos(angle) * distance,
                        math.sin(time * 2) * warp,
                        math.sin(angle) * distance
                    ),
                    Rotation = CFrame.Angles(
                        warp * 0.3,
                        angle + time,
                        math.rad(180) * (distance / scale.EventHorizon)
                    )
                }
            end
        }
    }

    function AttachmentSystem:ProcessPart(part)
        if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(Character) then
            part.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
            part.CanCollide = false
            
            local attachment = Instance.new("Attachment")
            attachment.Parent = part
            
            local alignPos = Instance.new("AlignPosition")
            alignPos.Mode = Enum.PositionAlignmentMode.OneAttachment
            alignPos.Attachment0 = attachment
            alignPos.MaxForce = 1e5
            alignPos.MaxVelocity = 1e5
            alignPos.Responsiveness = 200
            alignPos.Parent = part
            
            local alignOri = Instance.new("AlignOrientation")
            alignOri.Mode = Enum.OrientationAlignmentMode.OneAttachment
            alignOri.Attachment0 = attachment
            alignOri.MaxTorque = 1e5
            alignOri.Responsiveness = 200
            alignOri.Parent = part
            
            self.Parts[part] = {
                Attachment = attachment,
                AlignPosition = alignPos,
                AlignOrientation = alignOri,
                Size = part.Size
            }
        end
    end

    function AttachmentSystem:ReleaseAllParts()
        for part, data in pairs(self.Parts) do
            if part and part.Parent then
                if data.AlignPosition then
                    data.AlignPosition:Destroy()
                end
                if data.AlignOrientation then
                    data.AlignOrientation:Destroy()
                end
                if data.Attachment then
                    data.Attachment:Destroy()
                end
                
                part.CustomPhysicalProperties = nil
            end
        end
        self.Parts = {}
    end

    function AttachmentSystem:CleanupParts()
        for part, data in pairs(self.Parts) do
            if not part or not part.Parent then
                self.Parts[part] = nil
            end
        end
    end

local PartControlButton = Tab:Button({
    Title = "Enable Part Control",
    Desc = "Toggle part control system on/off",
    Callback = function()
        AttachmentSystem.Enabled = not AttachmentSystem.Enabled
        
        if AttachmentSystem.Enabled then
            for _, part in ipairs(workspace:GetDescendants()) do
                AttachmentSystem:ProcessPart(part)
            end
        else
            AttachmentSystem:ReleaseAllParts()
        end
        btnclick()
    end
})

    local RadiusSlider = Tab:Slider({
        Title = "Size",
        Desc = "Change part Size",
        Min = 10,
        Max = 100,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            AttachmentSystem.ScaleFactor = val / 50
            slidersound()
        end
    })

    local ModeDropdown = Tab:Dropdown({
        Title = "Pattern",
        List = {
            "Angel_Wings", "Demon_Wings", "Dragon_Aura", "Death_Crown", "Void_Portal", 
            "Death_Cage", "Shadow_Blades", "Hell_Spiral", "Devil_Cross", "Death_Ring", 
            "Pentagram", "Blood_Ritual", "666",
            "Quantum_Orbit", "Celestial_Sphere", "Neural_Network", "Time_Vortex", 
            "Crystal_Cluster", "Hologram_Grid", "Solar_System", "DNA_Helix", 
            "Magnetic_Field", "Chaos_Theory", "Binary_Code", "Gravity_Well",
            "Tornado", "Super_Tornado", "Water_Spout", "Fire_Tornado"
        },
        Value = "Angel_Wings",
        Callback = function(mode)
            AttachmentSystem.CurrentMode = mode
            dropdownsound()
        end
    })

    local heartbeatConnection
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        AttachmentSystem:CleanupParts()
        
        if AttachmentSystem.Enabled and AttachmentSystem.CurrentMode ~= "None" then
            local mode = AttachmentModes[AttachmentSystem.CurrentMode]
            if mode then
                local partCount = 0
                for _ in pairs(AttachmentSystem.Parts) do partCount = partCount + 1 end
                
                local scale = mode.Scale(partCount)
                local index = 0
                
                for part, data in pairs(AttachmentSystem.Parts) do
                    if part and part.Parent then
                        local formation = mode.Formation(part, data, index, partCount, scale)
                        
                        data.AlignPosition.Position = formation.Position.Position
                        data.AlignOrientation.CFrame = formation.Position * formation.Rotation
                        
                        if AttachmentSystem.AutoSize then
                            part.Size = data.Size * AttachmentSystem.ScaleFactor
                        end
                        
                        if AttachmentSystem.NoCollision then
                            part.CanCollide = false
                        end
                        
                        index = index + 1
                    else
                        AttachmentSystem.Parts[part] = nil
                    end
                end
            end
        end
    end)

    if AttachmentSystem.Enabled then
        for _, part in ipairs(workspace:GetDescendants()) do
            AttachmentSystem:ProcessPart(part)
        end
    end

    workspace.DescendantAdded:Connect(function(part)
        if AttachmentSystem.Enabled then
            AttachmentSystem:ProcessPart(part)
        end
    end)
end

local Tab = Window:Tab({Title = "other", Icon = "folder"}) do

    Tab:Button({
        Title = "Anti Unachored Fling",
        Desc = nil,
        Callback = function()
            btnclick()
            wha()
        end
    })

    Tab:Button({
        Title = "Toggle AntiTrip",
        Desc = "Prevent being tripped, ragdolled, or seated",
        Callback = function()
            toggleAntiTrip()
        end
    })
end

local Tab = Window:Tab({Title = "credits", Icon = "code"}) do
    Tab:Section({Title = "Script Made By @hmmm5651"})
    Tab:Label({
        Title = "Brick",
        Desc = "I might've forgot some users to credit you can go to my yt channel to comment out\n@gpsickle",
    })

    Tab:Label({
        Title = "Lukas_hub",
        Desc = "he made superring or.. it could be yumm",
    })

    Tab:Label({
        Title = "V0C0N",
        Desc = "he made part control thingamabob he also has a beef with skids",
    })
end

Window:Notify({
    Title = "script made by @hmmm5651",
    Desc = "Enter Text... (ಠ⁠ ͜⁠ʖ⁠ ⁠ಠ)",
    Time = 5
})
pcz()
-- fin
