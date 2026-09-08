local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/NerverLoseLibEdited.lua"))()
local LOADER = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/loader.Function.lua"))()

LOADER:Add(function()
local Window = NEVERLOSE:AddWindow("NEVERLOSE", "CSGO CHEAT")

-- Aimbot
Window:AddTabLabel("Aimbot")
local Ragebot = Window:AddTab("Ragebot", "crosshair")
local AntiAim = Window:AddTab("Anti Aim", "retry")
local Legitbot = Window:AddTab("Legitbot", "list")

-- Visuals
Window:AddTabLabel("Visuals")
local Players = Window:AddTab("Players", "user")

local left = Players:AddSection('ESP',"left")
local right = Players:AddSection('Chams',"right")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local ESPEnabled = false
local ESPObjects = {}
local EnemiesFolder = workspace:FindFirstChild("Enemies")

-- Settings
local settings = {
    ThroughWalls = false
}

-- Clear all ESP
local function ClearESP()
    for _, highlight in pairs(ESPObjects) do
        if highlight and highlight.Destroy then
            highlight:Destroy()
        end
    end
    ESPObjects = {}
end

-- Create highlight for any model
local function CreateESPForModel(id, model)
    if not model or not model:IsDescendantOf(workspace) then return end

    -- Remove old
    if ESPObjects[id] then
        ESPObjects[id]:Destroy()
    end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESPHighlight"
    highlight.FillColor = Color3.fromRGB(255, 255, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = settings.ThroughWalls and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
    highlight.Adornee = model
    highlight.Parent = CoreGui

    ESPObjects[id] = highlight
end

-- Add ESP to all players
local function SetupPlayerESP(player)
    if player == LocalPlayer then return end
    if player.Character then
        CreateESPForModel(player, player.Character)
    end
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        if ESPEnabled then
            CreateESPForModel(player, char)
        end
    end)
end

-- Add ESP to all NPCs
local function SetupEnemyESP(npc)
    if npc:IsA("Model") then
        CreateESPForModel(npc, npc)
    end
end

-- Toggle ESP
local function ToggleESP(enabled)
    ESPEnabled = enabled
    ClearESP()

    if enabled then
        -- Players
        for _, player in ipairs(Players:GetPlayers()) do
            SetupPlayerESP(player)
        end
        Players.PlayerAdded:Connect(SetupPlayerESP)

        -- Enemies
        if EnemiesFolder then
            for _, npc in ipairs(EnemiesFolder:GetChildren()) do
                SetupEnemyESP(npc)
            end
            EnemiesFolder.ChildAdded:Connect(function(npc)
                task.wait(1)
                if ESPEnabled then
                    SetupEnemyESP(npc)
                end
            end)
        end
    end
end

-- Update every frame
RunService.RenderStepped:Connect(function()
    if ESPEnabled then
        for id, highlight in pairs(ESPObjects) do
            local model
            if typeof(id) == "Player" then
                model = id.Character
            elseif typeof(id) == "Instance" then
                model = id
            end

            if not model or not model:IsDescendantOf(workspace) then
                highlight:Destroy()
                ESPObjects[id] = nil
            else
                highlight.Adornee = model
                highlight.DepthMode = settings.ThroughWalls and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
            end
        end
    end
end)

-- Your UI Toggles
left:AddToggle("Enable ESP", false, function(v)
    ToggleESP(v)
end)

left:AddToggle("Through Walls", false, function(v)
    settings.ThroughWalls = v
end)

left:AddDropdown("Bullet Tracer", {"Disabled", "Enabled"}, 1, function(v)
    settings.BulletTracer = (v == "Enabled")
end)

left:AddToggle("Dynamic Boxes", false, function(v)
    settings.DynamicBoxes = v
end)

left:AddToggle("In-Game radar", false, function(v)
    settings.InGameRadar = v
end)

left:AddToggle("Dormant", false, function(v)
    settings.Dormant = v
end)

left:AddToggle("Shared ESP", false, function(v)
    settings.SharedESP = v
end)

left:AddDropdown("Sound ESP", {"Disabled", "Enabled"}, 1, function(v)
    settings.SoundESP = (v == "Enabled")
end)

left:AddDropdown("Offscreen ESP", {"None", "Blinking Arrows"}, 2, function(v)
    settings.OffscreenESP = v
end)

left:AddToggle("Enable Glow", false, function(v)
    settings.GlowEnabled = v
end)

right:AddToggle("Enable Chams", false, function(v) end)
right:AddToggle("Through Walls", false, function(v) end)
right:AddDropdown("Style", {"Glass", "Textured"}, 1, function(v) end)

right:AddToggle("Backtrack", false, function(v) end)
right:AddDropdown("Style", {"Glass", "Textured"}, 2, function(v) end)

right:AddToggle("On Shot", false, function(v) end)
right:AddDropdown("Style", {"Glass", "Textured"}, 2, function(v) end)

right:AddToggle("Ragdolls", false, function(v) end)
right:AddDropdown("Style", {"Glass", "Textured"}, 1, function(v) end)

local Weapon = Window:AddTab("Weapon", "gun")
local Grenades = Window:AddTab("Grenades", "grenade")
local World = Window:AddTab("World", "earth")
local View = Window:AddTab("View", "ads")

-- Miscellaneous
Window:AddTabLabel("Miscellaneous")
local Main = Window:AddTab("Main", "list")
local Inventory = Window:AddTab("Inventory", "sword")
local Scripts = Window:AddTab("Scripts", "code")
-- Create Config Tab
local HttpService = game:GetService("HttpService")

-- Config storage table
local currentConfig = {}

-- ConfigTab + Section
local ConfigTab = Window:AddTab("Config", "gear")
local ConfigSection = ConfigTab:AddSection("Config Controls", "left")

-- Config list dropdown reference
local configDropdown
local selectedConfig = nil

-- Get available config names (JSON files only)
local function GetConfigList()
    local files = listfiles and listfiles("") or {}
    local configFiles = {}
    for _, file in pairs(files) do
        if file:match("%.json$") then
            table.insert(configFiles, file:match("([^/\\]+)%.json$"))
        end
    end
    table.sort(configFiles)
    return configFiles
end

-- Refresh dropdown options
local function RefreshDropdown()
    if configDropdown then
        local newList = GetConfigList()
        configDropdown:Clear()
        for _, name in ipairs(newList) do
            configDropdown:Add(name)
        end
    end
end

-- Create dropdown
configDropdown = ConfigSection:AddDropdown("Select Config", GetConfigList(), nil, function(val)
    selectedConfig = val
end)

-- Save config
ConfigSection:AddButton("💾 Save Config", function()
    if not selectedConfig or selectedConfig == "" then
        Notification:Notify("warning", "Config", "No config selected.")
        return
    end
    writefile(selectedConfig .. ".json", HttpService:JSONEncode(currentConfig))
    Notification:Notify("info", "Config", "Saved: " .. selectedConfig)
    RefreshDropdown()
end)

-- Load config
ConfigSection:AddButton("📂 Load Config", function()
    if not selectedConfig or not isfile(selectedConfig .. ".json") then
        Notification:Notify("error", "Config", "No config file found.")
        return
    end
    local data = readfile(selectedConfig .. ".json")
    local loaded = HttpService:JSONDecode(data)
    for k, v in pairs(loaded) do
        currentConfig[k] = v
    end

    -- Example: apply loaded values to UI
    if AimbotToggle then
        AimbotToggle:Set(currentConfig["Aimbot"] or false)
    end
    -- Add more Set() calls here for other UI elements you track

    Notification:Notify("info", "Config", "Loaded: " .. selectedConfig)
end)

-- Delete config
ConfigSection:AddButton("🗑️ Delete Config", function()
    if not selectedConfig or not isfile(selectedConfig .. ".json") then
        Notification:Notify("error", "Config", "No config to delete.")
        return
    end
    delfile(selectedConfig .. ".json")
    selectedConfig = nil
    Notification:Notify("warning", "Config", "Deleted config.")
    RefreshDropdown()
end)

-- Reset config
ConfigSection:AddButton("🔄 Reset Config", function()
    currentConfig = {}
    Notification:Notify("warning", "Config", "Config reset to default.")
end)

-- Ragebot Tab
local RageMain = Ragebot:AddSection("Main", "left")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Optional NPC Folder
local EnemiesFolder = workspace:FindFirstChild("Enemies")

--// Aimbot Toggle
local AimbotEnabled = false
RageMain:AddToggle("Enable Aimbot", false, function(val)
    AimbotEnabled = val
end)

--// Visibility Check
local function IsVisible(character)
    local origin = Camera.CFrame.Position
    local head = character:FindFirstChild("Head")
    if not head then return false end
    local direction = (head.Position - origin).Unit * (head.Position - origin).Magnitude
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    local result = workspace:Raycast(origin, direction, rayParams)
    if result then
        return result.Instance:IsDescendantOf(character)
    end
    return false
end

--// Target Validation
local function IsTargetValid(model)
    return model
        and model:FindFirstChild("Head")
        and model:FindFirstChild("Humanoid")
        and model.Humanoid.Health > 0
        and IsVisible(model)
end

--// Get Closest Target (Player or NPC)
local function GetClosestVisibleTarget()
    local closest = nil
    local shortestDistance = math.huge
    local mousePos = UserInputService:GetMouseLocation()

    -- Check all players (except LocalPlayer)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsTargetValid(player.Character) then
            local screenPos, onScreen = Camera:WorldToScreenPoint(player.Character.Head.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closest = player.Character
                end
            end
        end
    end

    -- Check NPCs if folder exists
    if EnemiesFolder then
        for _, npc in ipairs(EnemiesFolder:GetChildren()) do
            if IsTargetValid(npc) then
                local screenPos, onScreen = Camera:WorldToScreenPoint(npc.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < shortestDistance then
                        shortestDistance = dist
                        closest = npc
                    end
                end
            end
        end
    end

    return closest
end

--// Main Aimbot Loop
local currentTarget = nil

RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        if not IsTargetValid(currentTarget) then
            currentTarget = GetClosestVisibleTarget()
        end
        if IsTargetValid(currentTarget) then
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, currentTarget.Head.Position)
        end
    else
        currentTarget = nil
    end
end)
local RageEnabled = true
local SelectedHitbox = "Head"
local HitchanceThreshold = 90
local MinDamageThreshold = 50
local SilentAimEnabled = true
local AutoShootEnabled = true
local AutoScopeEnabled = false
local ResolverEnabled = true
local AutoStopEnabled = true
local AutoCrouchEnabled = false
local BacktrackTicks = 80
local DynamicFOVEnabled = true
local DynamicFOVRange = 10
local CurrentFOV = 10

RageMain:AddToggle("Enable Ragebot", false, function(value) 
    RageEnabled = value
end)

RageMain:AddDropdown("Hitbox", {"Head","Body","Legs","Arms","All"}, 1, function(value) 
    SelectedHitbox = value
end)

RageMain:AddSlider("Hitchance", 0, 100, 90, function(value) 
    HitchanceThreshold = value
end)

RageMain:AddSlider("Minimum Damage", 0, 100, 50, function(value) 
    MinDamageThreshold = value
end)

RageMain:AddToggle("Silent Aim", false, function(value) 
    SilentAimEnabled = value
end)

RageMain:AddToggle("Auto Shoot", false, function(value) 
    AutoShootEnabled = value
end)

RageMain:AddToggle("Auto Scope", false, function(value) 
    AutoScopeEnabled = value
end)

RageMain:AddToggle("Resolver", false, function(value) 
    ResolverEnabled = value
end)

RageMain:AddButton("Reset Rage Settings", function() 
    RageEnabled = true
    SelectedHitbox = "Head"
    HitchanceThreshold = 90
    MinDamageThreshold = 50
    SilentAimEnabled = true
    AutoShootEnabled = true
    AutoScopeEnabled = false
    ResolverEnabled = true
    AutoStopEnabled = true
    AutoCrouchEnabled = false
    BacktrackTicks = 80
    DynamicFOVEnabled = true
    DynamicFOVRange = 10
    CurrentFOV = 10
    print("[Ragebot] All settings reset.")
end)

local RageAccuracy = Ragebot:AddSection("Accuracy", "right")

RageAccuracy:AddToggle("Auto Stop", false, function(value) 
    AutoStopEnabled = value
end)

RageAccuracy:AddToggle("Auto Crouch", false, function(value) 
    AutoCrouchEnabled = value
end)

RageAccuracy:AddSlider("Backtrack", 0, 200, 80, function(value) 
    BacktrackTicks = value
end)

RageAccuracy:AddToggle("Dynamic FOV", false, function(value) 
    DynamicFOVEnabled = value
end)

RageAccuracy:AddSlider("Dynamic FOV Range", 0, 30, 10, function(value) 
    DynamicFOVRange = value
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if not RageEnabled then return end

    -- FOV Logic
    if DynamicFOVEnabled then
        CurrentFOV = DynamicFOVRange
    end

    local Target = GetClosestTarget(SelectedHitbox, CurrentFOV)

    if Target then
        local Chance = math.random(0,100)
        if Chance <= HitchanceThreshold then
            AimAtTarget(Target, SelectedHitbox)

            if AutoShootEnabled then
                ShootTarget(Target)
            end
        end
    end
end)

function GetClosestTarget(hitbox, fov)
    local PlayerService = game:GetService("Players")
    local CurrentCamera = workspace.CurrentCamera
    local ClosestTarget = nil
    local ClosestDistance = math.huge

    for _, player in pairs(PlayerService:GetPlayers()) do
        if player ~= PlayerService.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local TargetPart = GetHitboxPart(player.Character, hitbox)
            if TargetPart then
                local screenPos, onscreen = CurrentCamera:WorldToViewportPoint(TargetPart.Position)
                if onscreen then
                    local MouseLocation = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
                    local Distance = (MouseLocation - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if Distance < ClosestDistance and Distance <= fov then
                        ClosestDistance = Distance
                        ClosestTarget = player
                    end
                end
            end
        end
    end
    return ClosestTarget
end

function GetHitboxPart(character, hitbox)
    if hitbox == "All" then
        -- Returns the first available part
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                return part
            end
        end
    else
        return character:FindFirstChild(hitbox) or character:FindFirstChild("Head") 
    end
end

function AimAtTarget(target, hitbox)
    -- Placeholder for actual aim logic
    print("[Ragebot] Aiming at:", target.Name, "Hitbox:", hitbox, "Hitchance:", HitchanceThreshold .. "%", "FOV:", CurrentFOV)
end

function ShootTarget(target)
    -- Placeholder for actual shooting logic
    print("[Ragebot] Shooting at:", target.Name)
end

local hub = Scripts:AddSection('Hubs',"left")

hub:AddButton("Load hub 1", function()
loadstring(game:HttpGet("https://pastebin.com/raw/rf8zaVmE",true))()
end)

hub:AddButton("Load hub 2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/open-src-scripts/refs/heads/main/Gun%20Grounds%20FFA.lua",true))()
end)

-- Anti Aim Tab
local AASettings = AntiAim:AddSection("Settings", "left")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- UI Settings (from toggles/dropdowns/sliders)
local AntiAimEnabled = false
local PitchSetting = "Up"
local YawSetting = "Sideways"
local YawModifierSetting = "Jitter"
local DesyncAmount = 60
local FakeLag = 10
local FakeFlickKey = Enum.KeyCode.F
local FakeFlickActive = false

-- Connect UI controls
AASettings:AddToggle("Enable Anti Aim", false, function(value)
    AntiAimEnabled = value
end)

AASettings:AddDropdown("Pitch", {"Up","Down","Jitter","None"}, 1, function(value)
    PitchSetting = value
end)

AASettings:AddDropdown("Yaw", {"Sideways","Spin","Backwards"}, 2, function(value)
    YawSetting = value
end)

AASettings:AddDropdown("Yaw Modifier", {"Jitter","Static"}, 1, function(value)
    YawModifierSetting = value
end)

AASettings:AddSlider("Desync Amount", 0, 100, 60, function(value)
    DesyncAmount = value
end)

AASettings:AddSlider("Fake Lag", 0, 20, 10, function(value)
    FakeLag = value
end)

AASettings:AddKeybind("Fake Flick Key", Enum.KeyCode.F, function(key)
    FakeFlickKey = key
end)

-- Fake Flick Activation
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == FakeFlickKey then
        FakeFlickActive = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == FakeFlickKey then
        FakeFlickActive = false
    end
end)

-- Anti-Aim Loop
RunService.RenderStepped:Connect(function(delta)
    if not AntiAimEnabled or not Character or not HumanoidRootPart then return end

    -- Pitch control
    local pitch = 0
    if PitchSetting == "Up" then
        pitch = -80
    elseif PitchSetting == "Down" then
        pitch = 80
    elseif PitchSetting == "Jitter" then
        pitch = math.random(-80, 80)
    end

    -- Yaw control
    local yaw = 0
    if YawSetting == "Sideways" then
        yaw = 90
    elseif YawSetting == "Backwards" then
        yaw = 180
    elseif YawSetting == "Spin" then
        yaw = tick() * 500 % 360
    end

    -- Yaw Modifier
    if YawModifierSetting == "Jitter" then
        yaw = yaw + math.random(-30, 30)
    end

    -- Fake Flick
    if FakeFlickActive then
        yaw = yaw + math.random(100, 200)
    end

    -- Desync logic (visual only in Roblox, not real networking)
    local desyncOffset = math.sin(tick() * 8) * (DesyncAmount / 100) * 10
    HumanoidRootPart.Rotation = Vector3.new(pitch, yaw + desyncOffset, 0)

    -- Fake Lag (basic)
    if math.floor(tick() * 1000) % FakeLag == 0 then
        -- Skip update simulating lag
        return
    end
end)

local AAMisc = AntiAim:AddSection("Misc", "right")
AAMisc:AddToggle("Edge AA", false, function() end)
AAMisc:AddToggle("Slow Walk", false, function() end)
AAMisc:AddSlider("Slow Walk Speed", 0, 50, 30, function() end)
AAMisc:AddToggle("Jitter Desync", true, function() end)

-- Legitbot Tab
local LegitMain = Legitbot:AddSection("Main", "left")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Settings
local legitSettings = {
    Enabled = false,
    Smoothness = 50,
    FOV = 5,
    RecoilControl = false,
    RecoilStrength = 80,
}

-- Helpers
local function getClosestTarget()
    local closest = nil
    local shortestDistance = math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if dist < legitSettings.FOV * 10 and dist < shortestDistance then
                    shortestDistance = dist
                    closest = hrp
                end
            end
        end
    end
    return closest
end

-- Aimbot logic
local function aimAt(target)
    if not target then return end
    local targetPos = target.Position
    local camPos = Camera.CFrame.Position
    local direction = (targetPos - camPos).Unit
    local currentLook = Camera.CFrame.LookVector
    local smooth = math.clamp(legitSettings.Smoothness / 100, 0.01, 1)

    local lerpedDirection = currentLook:Lerp(direction, smooth)
    Camera.CFrame = CFrame.new(camPos, camPos + lerpedDirection)
end

-- Recoil control stub (expand depending on the game’s gun system)
local function applyRecoilControl()
    if legitSettings.RecoilControl then
        -- You'd hook into gun recoil system here (stub only)
        -- Example: Reduce camera recoil angle or modify recoil variables
    end
end

-- Main loop
RunService.RenderStepped:Connect(function()
    if legitSettings.Enabled then
        local target = getClosestTarget()
        aimAt(target)
        applyRecoilControl()
    end
end)

-- UI bindings
LegitMain:AddToggle("Enable Legitbot", false, function(v)
    legitSettings.Enabled = v
end)

LegitMain:AddSlider("Smoothness", 0, 100, 50, function(v)
    legitSettings.Smoothness = v
end)

LegitMain:AddSlider("FOV", 0, 30, 5, function(v)
    legitSettings.FOV = v
end)

LegitMain:AddToggle("Recoil Control", false, function(v)
    legitSettings.RecoilControl = v
end)

LegitMain:AddSlider("Recoil Strength", 0, 100, 80, function(v)
    legitSettings.RecoilStrength = v
end)

local LegitTrigger = Legitbot:AddSection("Triggerbot", "right")
LegitTrigger:AddToggle("Enable Triggerbot", false, function() end)
LegitTrigger:AddSlider("Trigger Delay", 0, 500, 150, function() end)
LegitTrigger:AddSlider("Burst Shots", 1, 5, 2, function() end)
LegitTrigger:AddKeybind("Trigger Key", Enum.KeyCode.X, function() end)

local WeaponESP = Weapon:AddSection("Weapon ESP", "left")
WeaponESP:AddToggle("Show Dropped Guns", false, function() end)
WeaponESP:AddToggle("Show Grenades", false, function() end)
WeaponESP:AddToggle("Show Bomb", false, function() end)

local WeaponChams = Weapon:AddSection("Weapon Chams", "right")
WeaponChams:AddToggle("Enable Weapon Chams", false, function() end)
WeaponChams:AddDropdown("Weapon Chams Material", {"Flat","Glow","Wireframe"}, 1, function() end)

-- Grenades
local Nades = Grenades:AddSection("Grenade ESP", "left")
Nades:AddToggle("Show Grenades", false, function() end)
Nades:AddToggle("Grenade Trajectory", false, function() end)
Nades:AddToggle("Grenade Timer", false, function() end)

-- World Visuals
local WorldVisual = World:AddSection("World", "left")
-- Services
local lighting = game:GetService("Lighting")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer

-- INITIAL SETTINGS
local originalClockTime = lighting.ClockTime
local originalFogEnd = lighting.FogEnd
local originalFogStart = lighting.FogStart
local originalFogColor = lighting.FogColor

-- FUNCTION IMPLEMENTATION
local nightModeEnabled = false
local removeFogEnabled = false
local removeSmokeEnabled = false
local removeFlashbangEnabled = false

-- Night Mode
local function applyNightMode(enabled)
    if enabled then
        lighting.ClockTime = 2 -- Darker night setting
    else
        lighting.ClockTime = originalClockTime
    end
end

-- Remove Fog
local function applyRemoveFog(enabled)
    if enabled then
        lighting.FogEnd = 100000
        lighting.FogStart = 100000
        lighting.FogColor = Color3.fromRGB(255, 255, 255)
    else
        lighting.FogEnd = originalFogEnd
        lighting.FogStart = originalFogStart
        lighting.FogColor = originalFogColor
    end
end

-- Remove Smoke
local function applyRemoveSmoke(enabled)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") and v.Name:lower():find("smoke") then
            v.Enabled = not enabled
        end
    end
end

-- Remove Flashbang
local function applyRemoveFlashbang(enabled)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Light") and v.Name:lower():find("flash") then
            v.Enabled = not enabled
        end
    end
end

-- HOOK TO TOGGLES
WorldVisual:AddToggle("Night Mode", false, function(value)
    nightModeEnabled = value
    applyNightMode(value)
end)

WorldVisual:AddToggle("Remove Fog", false, function(value)
    removeFogEnabled = value
    applyRemoveFog(value)
end)

WorldVisual:AddToggle("Remove Smoke", false, function(value)
    removeSmokeEnabled = value
    applyRemoveSmoke(value)
end)

WorldVisual:AddToggle("Remove Flashbang", false, function(value)
    removeFlashbangEnabled = value
    applyRemoveFlashbang(value)
end)

-- OPTIONAL: Maintain settings for new instances
runService.RenderStepped:Connect(function()
    if removeSmokeEnabled then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") and v.Name:lower():find("smoke") and v.Enabled then
                v.Enabled = false
            end
        end
    end
    if removeFlashbangEnabled then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Light") and v.Name:lower():find("flash") and v.Enabled then
                v.Enabled = false
            end
        end
    end
end)

-- View Tab
local ViewTab = View:AddSection("View", "left")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Your ViewModel, example: gun model or first-person arms
local ViewModel = workspace:FindFirstChild("Viewmodel") -- replace with actual viewmodel path

-- Default values
local viewmodelOffset = Vector3.new(0, 0, 0)

-- FOV SLIDER
ViewTab:AddSlider("FOV", 60, 140, 90, function(val)
	Camera.FieldOfView = val
end)

-- Viewmodel position sliders
ViewTab:AddSlider("Viewmodel X", -20, 20, 0, function(val)
	viewmodelOffset = Vector3.new(val, viewmodelOffset.Y, viewmodelOffset.Z)
end)

ViewTab:AddSlider("Viewmodel Y", -20, 20, 0, function(val)
	viewmodelOffset = Vector3.new(viewmodelOffset.X, val, viewmodelOffset.Z)
end)

ViewTab:AddSlider("Viewmodel Z", -20, 20, 0, function(val)
	viewmodelOffset = Vector3.new(viewmodelOffset.X, viewmodelOffset.Y, val)
end)

-- Update loop for viewmodel
RunService.RenderStepped:Connect(function()
	if ViewModel and ViewModel:IsA("Model") then
		local primary = ViewModel.PrimaryPart or ViewModel:FindFirstChildWhichIsA("BasePart")
		if primary then
			-- Offset viewmodel from camera
			ViewModel:SetPrimaryPartCFrame(Camera.CFrame * CFrame.new(viewmodelOffset))
		end
	end
end)

-- Main Tab (MISC like your image)
local Movement = Main:AddSection("Movement", "left")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local autoJump = false
local autoStrafe = false
local strafeSmoothness = 28
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Update character on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
end)

Movement:AddToggle("Auto Jump", false, function(enabled)
    autoJump = enabled
end)

Movement:AddToggle("Auto Strafe", false, function(enabled) 
    autoStrafe = enabled
end)

Movement:AddSlider("Strafe Smoothing", 0, 100, 28, function(val)
    strafeSmoothness = val
end)

-- Movement loop
RunService.RenderStepped:Connect(function(dt)
    if not Character then return end

    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    local hrp = Character:FindFirstChild("HumanoidRootPart")
    local cam = workspace.CurrentCamera

    if not humanoid or humanoid.Health <= 0 or not hrp or not cam then return end

    -- Auto Jump: only jump when touching ground (Running or Walking)
    if autoJump then
        local state = humanoid:GetState()
        if state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.Walking then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end

    -- Auto Strafe: apply lateral velocity based on camera right vector
    if autoStrafe then
        local camRight = cam.CFrame.RightVector
        local strafeForce = camRight * (strafeSmoothness / 5) -- tunable factor
        hrp.Velocity = Vector3.new(
            hrp.Velocity.X + strafeForce.X * dt * 60,
            hrp.Velocity.Y,
            hrp.Velocity.Z + strafeForce.Z * dt * 60
        )
    end
end)

Movement:AddToggle("WASD Strafe", false, function() end)
Movement:AddToggle("Circle Strafe", false, function() end)
Movement:AddToggle("Quick Stop", false, function() end)
Movement:AddToggle("Auto Peek", false, function() end)
Movement:AddToggle("Infinity Duck", false, function() end)

local Other = Main:AddSection("Other", "right")
Other:AddToggle("Anti Untrusted", false, function() end)
Other:AddDropdown("Event Log", {"Damage","Hurt","Spread","Miss"}, 1, function() end)
Other:AddDropdown("Windows", {"Binds List","Spectator List"}, 1, function() end)
Other:AddToggle("Filter Ads", false, function() end)
Other:AddToggle("Unlock CVars", false, function() end)
Other:AddSlider("Fake Ping", 0, 200, 50, function(val) end)

-- Inventory Tab
local InventorySection = Inventory:AddSection("Skin Changer", "left")
InventorySection:AddToggle("Enable Skin Changer", false, function() end)
InventorySection:AddDropdown("Weapon", {"AWP","AK-47","Deagle"}, 1, function() end)
InventorySection:AddDropdown("Skin", {"Dragon Lore","Fire Serpent","Emerald"}, 1, function() end)
	end)
