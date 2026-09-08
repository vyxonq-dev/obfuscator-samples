--[[
    Tr0ngX Fantasy Arena [Magma] Suite - Rayfield Gen 2 Edition (V15.0)
    Developer: Tr0ngX
    Language: 100% English
    Emojis: Zero (Clean ASCII only)
    
    Target Game Metadata:
    - Game Name: Fantasy Arena [Magma]
    - GameId: 10474700206
    - PlaceId: 73227142902215
    - Creator: Personal Path
    
    Documentation Reference: https://docs.sirius.menu/llms.txt
--]]


local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))() or loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Clean up previous scripts if re-executed
if _G.ProjectRealCleanup then
    pcall(_G.ProjectRealCleanup)
end

local Connections = {}
local Running = true

_G.ProjectRealCleanup = function()
    Running = false
    for _, conn in ipairs(Connections) do
        if conn and conn.Disconnect then
            conn:Disconnect()
        end
    end
    print("[Tr0ngX Suite V10.2] Cleaned up.")
end

--------------------------------------------------------------------
-- REMOTES (require once, reuse everywhere)
--------------------------------------------------------------------
local Remotes = require(ReplicatedStorage.Shared.Remotes)

local VirtualUser = game:GetService("VirtualUser")

local HttpService = game:GetService("HttpService")
local CONFIG_FILE = "Tr0ngX_ProjectReal_Config.json"

--------------------------------------------------------------------
-- GLOBAL CONFIGURATION
--------------------------------------------------------------------
local Config = {
    FloatEnabled = true,
    HeightOffset = 24, -- Raised default for 100% safety above all boss hitboxes
    AutoCollectShards = true,
    ShardDelay = 0.2,
    AutoUpgrade = true,
    AutoAttack = true,
    AutoAim = true,
    AntiDeath = true,
    AutoAbility = true,
    AutoSkipWave = true,
    AntiAFK = true,
    InfinitePierce = true,
    MultiShot = true,
    HugeHitbox = true,
    UltraHoming = true,
}

local function saveConfig()
    pcall(function()
        if writefile then
            writefile(CONFIG_FILE, HttpService:JSONEncode(Config))
        end
    end)
end

local function loadConfig()
    local success = pcall(function()
        if isfile and isfile(CONFIG_FILE) and readfile then
            local data = HttpService:JSONDecode(readfile(CONFIG_FILE))
            if type(data) == "table" then
                for k, v in pairs(data) do
                    Config[k] = v
                end
            end
        end
    end)
    return success
end

--------------------------------------------------------------------
-- RAYFIELD GEN 2 UI
--------------------------------------------------------------------
local Window = Rayfield:CreateWindow({
    name = "Tr0ngX Fantasy Arena [Magma]",
    subtitle = "V15.0 Clean English Suite | GameID: 10474700206",
    configuration = {
        autoSave = false,
        autoLoad = false,
        fileName = "Tr0ngXProjectReal"
    }
})

--------------------------------------------------------------------
-- LAUNCH POPUP MODAL (RAYFIELD GEN 2 POPUPS API)
--------------------------------------------------------------------
local hasOldConfig = (type(isfile) == "function" and isfile(CONFIG_FILE))

if hasOldConfig then
    Window:Popup({
        title = "Config Manager",
        subtitle = "Saved Configuration Detected",
        content = "Found a saved configuration file from your previous session. Would you like to load your saved settings?",
        dismissable = false,
        options = {
            {
                text = "YES - Load Saved Config",
                style = "primary",
                callback = function()
                    if loadConfig() then
                        Window:Notify({
                            title = "Config Loaded",
                            content = "Successfully restored your saved settings!",
                        })
                    end
                end,
            },
            {
                text = "NO - Use Default Settings",
                style = "neutral",
                callback = function()
                    Window:Notify({
                        title = "Default Config Active",
                        content = "Using default configuration settings.",
                    })
                end,
            },
        },
    })
end

local MainTab = Window:CreateTab({ name = "Main Utilities" })

MainTab:CreateSection("Ground Hover Settings")

MainTab:CreateToggle({
    name = "Enable Ground Hover",
    currentValue = Config.FloatEnabled,
    callback = function(Value)
        Config.FloatEnabled = Value
        saveConfig()
    end,
})

MainTab:CreateSlider({
    name = "Height Offset (Studs)",
    range = {0, 50},
    increment = 0.5,
    suffix = "Studs",
    currentValue = Config.HeightOffset,
    callback = function(Value)
        Config.HeightOffset = Value
        saveConfig()
    end,
})

MainTab:CreateSection("Super Weapon Modifications")

MainTab:CreateToggle({
    name = "Infinite Pierce (Penetrate 9999 Enemies)",
    currentValue = Config.InfinitePierce,
    callback = function(Value)
        Config.InfinitePierce = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Multi-Shot (5 Projectiles Burst)",
    currentValue = Config.MultiShot,
    callback = function(Value)
        Config.MultiShot = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Huge Hitbox (10x Bullet Size)",
    currentValue = Config.HugeHitbox,
    callback = function(Value)
        Config.HugeHitbox = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Ultra Homing (500m Target Tracking)",
    currentValue = Config.UltraHoming,
    callback = function(Value)
        Config.UltraHoming = Value
        saveConfig()
    end,
})

MainTab:CreateSection("Combat & Invincibility")

MainTab:CreateToggle({
    name = "Auto Precision Aim (Hitbox Cone)",
    currentValue = Config.AutoAim,
    callback = function(Value)
        Config.AutoAim = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Ultra 0.001s Rapid Fire Auto Attack",
    currentValue = Config.AutoAttack,
    callback = function(Value)
        Config.AutoAttack = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Anti-Death (Tri-Loop God Mode)",
    currentValue = Config.AntiDeath,
    callback = function(Value)
        Config.AntiDeath = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Anti-AFK Protection (24/7 Keep-Alive)",
    currentValue = Config.AntiAFK,
    callback = function(Value)
        Config.AntiAFK = Value
        saveConfig()
    end,
})

MainTab:CreateSection("Automation (All Remote-Based)")

MainTab:CreateToggle({
    name = "Ultra 0.001s Fast Ability Spammer",
    currentValue = Config.AutoAbility,
    callback = function(Value)
        Config.AutoAbility = Value
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Auto Skip Waves [SetAutoSkip]",
    currentValue = Config.AutoSkipWave,
    callback = function(Value)
        Config.AutoSkipWave = Value
        pcall(function()
            Remotes.SetAutoSkip.fireServer(Value)
        end)
        saveConfig()
    end,
})

MainTab:CreateToggle({
    name = "Instant Global Auto-Collect (Map-Wide)",
    currentValue = Config.AutoCollectShards,
    callback = function(Value)
        Config.AutoCollectShards = Value
        saveConfig()
    end,
})


--------------------------------------------------------------------
-- CONFIG MANAGER TAB
--------------------------------------------------------------------
local ConfigTab = Window:CreateTab({ name = "Config Manager" })
ConfigTab:CreateSection("Saved Configuration Prompt")

local hasOldConfig = (type(isfile) == "function" and isfile(CONFIG_FILE))

if hasOldConfig then
    ConfigTab:CreateSection("Previous Config Detected!")
    ConfigTab:CreateButton({
        name = "YES - Load Old Configuration Settings",
        callback = function()
            if loadConfig() then
                Window:Notify({
                    title = "Config Loaded",
                    content = "Successfully restored your saved settings!",
                })
            end
        end,
    })
    ConfigTab:CreateButton({
        name = "NO - Use Default Settings",
        callback = function()
            Window:Notify({
                title = "Default Config Active",
                content = "Using default configuration settings.",
            })
        end,
    })
end

ConfigTab:CreateSection("Manual Config Controls")

ConfigTab:CreateButton({
    name = "Save Current Settings to File",
    callback = function()
        saveConfig()
        Window:Notify({
            title = "Config Saved",
            content = "Current settings saved to " .. CONFIG_FILE,
        })
    end,
})

ConfigTab:CreateButton({
    name = "Reload Config from File",
    callback = function()
        if loadConfig() then
            Window:Notify({
                title = "Config Reloaded",
                content = "Reloaded settings from file!",
            })
        end
    end,
})


--------------------------------------------------------------------
-- CACHED FLOOR RAYCAST FILTER
--------------------------------------------------------------------
local cachedFloorFilter = {}

local function buildFloorFilter()
    local filter = {}
    local map = Workspace:FindFirstChild("Map")
    if map then
        local floor = map:FindFirstChild("Floor")
        if floor then
            table.insert(filter, floor)
        end
        for _, child in ipairs(map:GetChildren()) do
            local name = child.Name:lower()
            if name:find("floor") or name:find("ground") or name:find("base") then
                if not table.find(filter, child) then
                    table.insert(filter, child)
                end
            end
        end
    end
    if Workspace.Terrain then
        table.insert(filter, Workspace.Terrain)
    end
    return filter
end

cachedFloorFilter = buildFloorFilter()

table.insert(Connections, Workspace.ChildAdded:Connect(function(child)
    if child.Name == "Map" then
        task.wait(1)
        cachedFloorFilter = buildFloorFilter()
    end
end))

--------------------------------------------------------------------
-- FLOOR RAYCAST (from fixed Y=500, immune to jitter)
--------------------------------------------------------------------
local floorRayParams = RaycastParams.new()
floorRayParams.FilterType = Enum.RaycastFilterType.Include

local fallbackRayParams = RaycastParams.new()
fallbackRayParams.FilterType = Enum.RaycastFilterType.Exclude

local function getFloorY(xPos, zPos, character)
    if #cachedFloorFilter > 0 then
        floorRayParams.FilterDescendantsInstances = cachedFloorFilter
        local result = Workspace:Raycast(Vector3.new(xPos, 500, zPos), Vector3.new(0, -1000, 0), floorRayParams)
        if result then
            return result.Position.Y
        end
    end
    fallbackRayParams.FilterDescendantsInstances = {character}
    local result = Workspace:Raycast(Vector3.new(xPos, 500, zPos), Vector3.new(0, -1000, 0), fallbackRayParams)
    if result then
        return result.Position.Y
    end
    return nil
end

--------------------------------------------------------------------
-- PRECISION ENEMY FINDER (matches ToolClient's targeting cone)
--------------------------------------------------------------------
local function getBestEnemy(playerPos, cameraLookCF)
    local bestAimPos = nil
    local bestBodyPos = nil
    local bestScore = -math.huge
    
    pcall(function()
        local roundState = require(ReplicatedStorage.Client.RoundClient.RoundStateClient)
        if not (roundState and roundState.state and roundState.state.entityMap) then return end
        
        for _, entity in pairs(roundState.state.entityMap) do
            if entity.team ~= "Player" and entity.spawnTimer and entity.spawnTimer <= 0.1 then
                local hitPos = entity.hitboxPosition
                if not hitPos then
                    hitPos = entity.position
                    if hitPos and entity.hitboxPositionOffset then
                        hitPos = hitPos + entity.hitboxPositionOffset
                    end
                end
                if hitPos then
                    if cameraLookCF then
                        local localPoint = cameraLookCF:PointToObjectSpace(hitPos)
                        local depth = -localPoint.Z
                        if depth > 0 then
                            local angularDev = (localPoint.X * localPoint.X + localPoint.Y * localPoint.Y * 0.2) / depth
                            if angularDev <= 3 then
                                local score = (3 - angularDev) * 10 - angularDev * depth * 0.5
                                if score > bestScore then
                                    bestScore = score
                                    bestAimPos = entity.position + Vector3.new(0, 3, 0)
                                    bestBodyPos = entity.position
                                end
                            end
                        end
                    else
                        local dist = (hitPos - playerPos).Magnitude
                        local score = -dist
                        if score > bestScore then
                            bestScore = score
                            bestAimPos = entity.position + Vector3.new(0, 3, 0)
                            bestBodyPos = entity.position
                        end
                    end
                end
            end
        end
    end)
    
    return bestAimPos, bestBodyPos
end

--------------------------------------------------------------------
-- FEATURE 1: GROUND HOVER + PRECISION AIM (RenderStepped)
--------------------------------------------------------------------
local function updateFloatAndAim()
    local character = LocalPlayer.Character
    if not character then return end
    
    local hum = character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp or not hrp.Parent then return end

    local camera = Workspace.CurrentCamera

    if Config.FloatEnabled then
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        
        local floorY = getFloorY(hrp.Position.X, hrp.Position.Z, character)
        
        if floorY then
            local targetY = floorY + Config.HeightOffset
            local targetPos = Vector3.new(hrp.Position.X, targetY, hrp.Position.Z)
            
            if Config.AutoAim then
                local camLookCF = camera and CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + camera.CFrame.LookVector * 1000) or nil
                local aimPos, bodyPos = getBestEnemy(hrp.Position, camLookCF)
                if aimPos and bodyPos then
                    local lookTarget = Vector3.new(bodyPos.X, targetY, bodyPos.Z)
                    hrp.CFrame = CFrame.lookAt(targetPos, lookTarget)
                    
                    if camera then
                        camera.CFrame = CFrame.lookAt(camera.CFrame.Position, aimPos)
                    end
                    return
                end
            end
            
            hrp.CFrame = CFrame.new(targetPos) * hrp.CFrame.Rotation
        end
    elseif Config.AutoAim then
        local camLookCF = camera and CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + camera.CFrame.LookVector * 1000) or nil
        local aimPos, bodyPos = getBestEnemy(hrp.Position, camLookCF)
        if aimPos and bodyPos then
            local lookTarget = Vector3.new(bodyPos.X, hrp.Position.Y, bodyPos.Z)
            hrp.CFrame = CFrame.lookAt(hrp.Position, lookTarget)
            
            if camera then
                camera.CFrame = CFrame.lookAt(camera.CFrame.Position, aimPos)
            end
        end
    end
end

table.insert(Connections, RunService.RenderStepped:Connect(updateFloatAndAim))

--------------------------------------------------------------------
-- FEATURE 2: ULTIMATE TRI-LOOP ANTI-DEATH & DEAD-STATE DISABLE
--------------------------------------------------------------------
local function applyInvincibility()
    if not Config.AntiDeath then return end
    local character = LocalPlayer.Character
    if not character then return end
    local hum = character:FindFirstChildOfClass("Humanoid")
    if hum then
        -- Prevent engine from entering Dead state
        pcall(function()
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end)
        -- Instantly reset health to max before any frame resolves
        if hum.Health < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end
end

table.insert(Connections, RunService.RenderStepped:Connect(applyInvincibility))
table.insert(Connections, RunService.Stepped:Connect(applyInvincibility))
table.insert(Connections, RunService.Heartbeat:Connect(applyInvincibility))

----------------------------------------------------------------------
-- FEATURE 3: INSTANT GLOBAL MAP-WIDE CURRENCY & SHARD COLLECTOR
-- 1. Direct Remote Hook: Claims drop in 0ms when SpawnCurrencyDrop fires
-- 2. Global ProximityPrompt Auto-Fire for chests/shards across entire map
--------------------------------------------------------------------
table.insert(Connections, Remotes.SpawnCurrencyDrop.onClientEvent(function(dropId)
    if Config.AutoCollectShards then
        pcall(function()
            Remotes.RequestClaimCurrencyDrop.fireServer(dropId)
        end)
    end
end))

local function getDropMap()
    local ok, cdc = pcall(require, ReplicatedStorage.Client.RoundClient.CurrencyDropClient)
    if not ok or not cdc or not cdc.postSimulation then return nil end
    
    for i = 1, 10 do
        local success, val = pcall(debug.getupvalue, cdc.postSimulation, i)
        if success and type(val) == "table" then
            for _, entry in pairs(val) do
                if type(entry) == "table" and entry.state ~= nil then
                    return val
                end
            end
        end
    end
    return nil
end

task.spawn(function()
    while Running do
        if Config.AutoCollectShards then
            -- Sweep 1: Remote Drop Map
            local dropMap = getDropMap()
            if dropMap then
                for dropId, data in pairs(dropMap) do
                    if data.state == "Spawning" or data.state == "Idle" then
                        data.state = "RequestedClaim"
                        Remotes.RequestClaimCurrencyDrop.fireServer(dropId)
                    end
                end
            end
            -- Sweep 2: Workspace Prompts (Chests / Interactive Shards)
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    local name = obj.Parent and obj.Parent.Name:lower() or ""
                    if name:find("shard") or name:find("crate") or name:find("currency") or name:find("chest") then
                        fireproximityprompt(obj)
                    end
                end
            end
        end
        task.wait(0.2)
    end
end)




--------------------------------------------------------------------
-- FEATURE 5: ULTRA-FAST 0.001s SKILL SPAMMER & COOLDOWN RESET
--------------------------------------------------------------------
local function getUpgradeSlots()
    local ok, hudClient = pcall(require, ReplicatedStorage.Client.HudClient)
    if not ok or not hudClient then return nil end
    
    for _, fnName in ipairs({"start", "postSimulation"}) do
        local fn = hudClient[fnName]
        if fn then
            for i = 1, 50 do
                local success, val = pcall(debug.getupvalue, fn, i)
                if not success then break end
                if type(val) == "table" then
                    for k, v in pairs(val) do
                        if type(v) == "table" and v.cooldown ~= nil then
                            return val
                        end
                    end
                end
            end
        end
    end
    return nil
end

task.spawn(function()
    while Running do
        if Config.AutoAbility then
            local slots = getUpgradeSlots()
            if slots then
                for upgradeName, data in pairs(slots) do
                    if type(data) == "table" then
                        data.cooldown = 0.001
                        data.cooldownTimer = 0
                        pcall(function()
                            Remotes.UseUpgrade.fireServer(upgradeName)
                            Remotes.ResetUpgradeCooldown.fireServer(upgradeName)
                        end)
                    end
                end
            end
        end
        task.wait(0.01)
    end
end)

--------------------------------------------------------------------
-- FEATURE 6: REMOTE AUTO SKIP WAVES
--------------------------------------------------------------------
task.spawn(function()
    task.wait(1)
    if Config.AutoSkipWave then
        pcall(function()
            Remotes.SetAutoSkip.fireServer(true)
        end)
    end
end)

--------------------------------------------------------------------
-- FEATURE 7: ULTRA-FAST 0.001s RAPID FIRE & SUPER WEAPON MODS
--------------------------------------------------------------------
pcall(function()
    local toolClient = require(ReplicatedStorage.Client.RoundClient.ToolClient)
    task.spawn(function()
        while Running do
            if Config.AutoAttack then
                pcall(function()
                    -- Force continuous automatic firing flag (Upvalue 14)
                    debug.setupvalue(toolClient.postSimulation, 14, true)
                    
                    -- Direct Upvalue 7 Inspection (toolStateMap)
                    local toolStateMap = debug.getupvalue(toolClient.postSimulation, 7)
                    if type(toolStateMap) == "table" then
                        for _, item in pairs(toolStateMap) do
                            if type(item) == "table" then
                                -- Instantly zero out live cooldown timers every frame
                                item.cooldownTimer = 0
                                item.burstCooldownTimer = 0
                                
                                if type(item.info) == "table" then
                                    item.info.Cooldown = 0.001
                                    item.info.BurstCooldown = 0.001
                                    if Config.InfinitePierce then item.info.Pierce = 9999 end
                                    if Config.MultiShot then item.info.Projectiles = 5 end
                                    if Config.HugeHitbox then item.info.ProjectileRadius = 10 end
                                    if Config.UltraHoming then
                                        item.info.ProjectileHomingRadius = 500
                                        item.info.ProjectileHomingForce = 50000
                                    end
                                    item.info.ProjectileSpread = Vector3.zero
                                end
                            end
                        end
                    end
                end)
            end
            task.wait(0.01)
        end
    end)
end)



--------------------------------------------------------------------
-- FEATURE 8: ANTI-AFK 24/7 KEEP-ALIVE PROTECTION
--------------------------------------------------------------------
table.insert(Connections, LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.zero)
        end)
    end
end))

task.spawn(function()
    while Running do
        if Config.AntiAFK then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.zero)
            end)
        end
        task.wait(60)
    end
end)

Window:Notify({
    title = "Tr0ngX Suite Loaded",
    content = "Fantasy Arena [Magma] Suite Active.",
})