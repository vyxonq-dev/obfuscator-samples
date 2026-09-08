local stored_fonts = {}
gui_config = {
    Color = Color3.fromRGB(255, 255, 255),
    Keybind = Enum.KeyCode.Insert, -- for pc related only enum keys documentation: https://create.roblox.com/docs/reference/engine/enums/KeyCode
    Assets = false, -- set to true if you want custom background asset
    MinHeight = 100,
    MaxHeight = 600,
    InitialHeight = 400,
    MinWidth = 300,
    MaxWidth = 800,
    InitialWidth = 500
}

for _, v in Enum.Font:GetEnumItems() do
    table.insert(stored_fonts, v.Name)
end

local config = (getfenv().gui_config) or nil -- custom config or fully ignore this
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow(config, gethui())
local window_name = library:SetWindowName("Dungeons Quest | By MjContegazxc") -- title to use for gui


local tabs = {
    -- creates "main" tab
    main = window:CreateTab("Main"),
    game = window:CreateTab("Game"),
    settings = window:CreateTab("Settings")
}


local sections = {
  Main = tabs.main:CreateSection("Farming"),  
Automation = tabs.main:CreateSection("Automation"),  
Raid = tabs.main:CreateSection("Raids/Map"),  
Player = tabs.main:CreateSection("LocalPlayer"),
Quest = tabs.main:CreateSection("Quest Event"),
Upgrade = tabs.main:CreateSection("Upgrade Skills"),
Game = tabs.game:CreateSection("Game"),
Discord = tabs.game:CreateSection("Discord"),
}

local workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Ensure character always exists
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- SETTINGS
local AutoMobEnabled = false
local BehindOffset = 6
local AboveHeight = 8
local Mode = "Above"

-- Dynamic real-time detection of "dungeon"
local workspace = game:GetService("Workspace")
local dungeon

dungeon = workspace:FindFirstChild("dungeon")

workspace.ChildAdded:Connect(function(child)
    if child.Name == "dungeon" then
        dungeon = child
        window:Notify("Dungeon", "Dungeon spawned in real-time!", 3)
    end
end)

local function getNextEnemy()
    for _, room in ipairs(dungeon:GetChildren()) do
        local enemyFolder = room:FindFirstChild("enemyFolder")
        if enemyFolder then
            for _, enemy in ipairs(enemyFolder:GetChildren()) do
                local hum = enemy:FindFirstChildOfClass("Humanoid")
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 0 then
                    return enemy, hum, hrp
                end
            end
        end
    end
    return nil
end

local function lockToEnemy(enemy, hum, hrp)
    while AutoMobEnabled and hum.Health > 0 do
        Character = LocalPlayer.Character
        if not Character then task.wait(0.05) continue end
        HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not HumanoidRootPart or not Humanoid then task.wait(0.05) continue end

        local targetPos
        if Mode == "Behind" then
            targetPos = hrp.Position - hrp.CFrame.LookVector * BehindOffset
            targetPos = targetPos + Vector3.new(0, 2, 0)
        else
            targetPos = hrp.Position + Vector3.new(0, AboveHeight, 0)
        end

        HumanoidRootPart.CFrame = CFrame.new(targetPos, hrp.Position)
        Humanoid.PlatformStand = true
        task.wait(0.03)
    end
    if Humanoid then
        Humanoid.PlatformStand = false
    end
end

local function startLockLoop()
    task.spawn(function()
        while AutoMobEnabled do
            local enemy, hum, hrp = getNextEnemy()
            if enemy and hum and hrp then
                lockToEnemy(enemy, hum, hrp)
            else
                task.wait(0.1)
            end
        end
    end)
end

local function stopLockLoop()
    AutoMobEnabled = false
end

sections.Main:CreateToggle("Enable AutoMob", false, function(state)
    AutoMobEnabled = state
    if state then
        startLockLoop()
        window:Notify("AutoMob", "AutoMob enabled", 3)
    else
        stopLockLoop()
        window:Notify("AutoMob", "AutoMob disabled", 3)
    end
end)

sections.Main:CreateDropdown("AutoMob Mode", {"Behind", "Above"}, function(selected)
    Mode = selected
end, "Above", false)

sections.Main:CreateSlider("Behind Offset", 1, 15, 6, true, function(val)
    BehindOffset = val
end)

sections.Main:CreateSlider("Above Height", 2, 50, 8, true, function(val)
    AboveHeight = val
end)

local AutoStartDungeon = true

local function startDungeon()
    local remotes = game:GetService("ReplicatedStorage"):WaitForChild("remotes")
    if remotes:FindFirstChild("changeStartValue") then
        remotes.changeStartValue:FireServer()
    end
end

if AutoStartDungeon then
    startDungeon()
end

sections.Main:CreateToggle("Auto-Start Dungeon", true, function(state)
    AutoStartDungeon = state
    if state then
        startDungeon()
        window:Notify("Dungeon", "Auto-Start enabled", 3)
    else
        window:Notify("Dungeon", "Auto-Start disabled", 3)
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game:GetService("Players").LocalPlayer

local AutoRetryEnabled = true

local function retryGame()
    local utility = ReplicatedStorage:FindFirstChild("Utility")
    if utility then
        local assetRequester = utility:FindFirstChild("AssetRequester")
        if assetRequester then
            local remote = assetRequester:FindFirstChild("Remote")
            if remote then
                local soundArgs = {
                    [1] = {
                        [1] = "sound",
                        [2] = "Misc",
                        [3] = "teleportSound"
                    }
                }
                pcall(function()
                    remote:InvokeServer(unpack(soundArgs))
                end)
            end
        end
    end

    local dataRemote = ReplicatedStorage:FindFirstChild("dataRemoteEvent")
    if dataRemote then
        local voteArgs = {
            [1] = {
                [1] = {
                    ["\3"] = "vote",
                    ["vote"] = true
                },
                [2] = "-"
            }
        }
        pcall(function()
            dataRemote:FireServer(unpack(voteArgs))
        end)
    end
end

sections.Main:CreateToggle("Auto Retry Game", true, function(state)
    AutoRetryEnabled = state
    if state then
        window:Notify("Game", "Auto Retry enabled", 3)
        task.spawn(function()
            while AutoRetryEnabled do
                retryGame()
                task.wait(2)
            end
        end)
    else
        window:Notify("Game", "Auto Retry disabled", 3)
    end
end)

local HitboxSize = 10
local visuals = {}

local function updateHitboxes(size)
    if not workspace:FindFirstChild("dungeon") then return end
    local dungeon = workspace:FindFirstChild("dungeon")

    for _, room in ipairs(dungeon:GetChildren()) do
        local enemyFolder = room:FindFirstChild("enemyFolder")
        if enemyFolder then
            for _, enemy in ipairs(enemyFolder:GetChildren()) do
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(size, size, size)
                    hrp.Transparency = 0.7

                    if not visuals[enemy] then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Adornee = hrp
                        box.Size = hrp.Size
                        box.Color3 = Color3.fromRGB(255,0,0)
                        box.Transparency = 0.5
                        box.AlwaysOnTop = true
                        box.ZIndex = 10
                        box.Parent = hrp
                        visuals[enemy] = box
                    else
                        visuals[enemy].Size = hrp.Size
                    end
                end
            end
        end
    end
end

sections.Main:CreateSlider("Hitbox Expander", 1, 40, 10, true, function(val)
    HitboxSize = val
    updateHitboxes(HitboxSize)
end)

RunService.Heartbeat:Connect(function()
    updateHitboxes(HitboxSize)
end)

sections.Main:CreateDivider()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local AutoMobEnabled2 = true
local BehindOffset2 = 6
local AboveHeight2 = 10
local Mode2 = "Above"
local FloatSpeed = 50

local dungeon2

dungeon2 = workspace:FindFirstChild("dungeon")

workspace.ChildAdded:Connect(function(child)
    if child.Name == "dungeon" then
        dungeon2 = child
        window:Notify("Dungeon", "Dungeon spawned in real-time!", 3)
    end
end)

local function getNextEnemy2()
    if not dungeon2 then return nil end
    for _, room in ipairs(dungeon2:GetChildren()) do
        local enemyFolder = room:FindFirstChild("enemyFolder")
        if enemyFolder then
            for _, enemy in ipairs(enemyFolder:GetChildren()) do
                local hum = enemy:FindFirstChildOfClass("Humanoid")
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 0 then
                    return enemy, hum, hrp
                end
            end
        end
    end
    return nil
end

local function followEnemy(enemy, hum, hrp)
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not AutoMobEnabled2 or not enemy or not enemy.Parent or hum.Health <= 0 then
            connection:Disconnect()
            return
        end
        
        local Character = LocalPlayer.Character
        if not Character then return end
        
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not HumanoidRootPart or not Humanoid then return end

        local targetPos
        if Mode2 == "Behind" then
            targetPos = hrp.Position - hrp.CFrame.LookVector * BehindOffset2
            targetPos = targetPos + Vector3.new(0, 2, 0)
        else
            targetPos = hrp.Position + Vector3.new(0, AboveHeight2, 0)
        end

        Humanoid.PlatformStand = true
        
        local direction = (targetPos - HumanoidRootPart.Position)
        local distance = direction.Magnitude
        
        if distance > 0.1 then
            local moveDirection = direction.Unit
            HumanoidRootPart.Velocity = moveDirection * FloatSpeed
            HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position, hrp.Position)
        else
            HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end

local function startLockLoop2()
    task.spawn(function()
        local currentConnection = nil
        
        while AutoMobEnabled2 do
            local Character = LocalPlayer.Character
            if not Character then
                LocalPlayer.CharacterAdded:Wait()
                Character = LocalPlayer.Character
                Character:WaitForChild("HumanoidRootPart")
                Character:WaitForChild("Humanoid")
            end
            
            if currentConnection then
                currentConnection:Disconnect()
                currentConnection = nil
            end
            
            local enemy, hum, hrp = getNextEnemy2()
            if enemy and hum and hrp then
                currentConnection = followEnemy(enemy, hum, hrp)
                
                while AutoMobEnabled2 and hum.Health > 0 and enemy and enemy.Parent do
                    task.wait(0.1)
                end
                
                if currentConnection then
                    currentConnection:Disconnect()
                    currentConnection = nil
                end
                
                Character = LocalPlayer.Character
                if Character then
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                    if HumanoidRootPart then
                        HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    end
                    if Humanoid then
                        Humanoid.PlatformStand = false
                    end
                end
            else
                task.wait(0.3)
            end
        end
        
        if currentConnection then
            currentConnection:Disconnect()
        end
    end)
end

local function stopLockLoop2()
    AutoMobEnabled2 = false
    local Character = LocalPlayer.Character
    if Character then
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if HumanoidRootPart then
            HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
        if Humanoid then
            Humanoid.PlatformStand = false
        end
    end
end

sections.Main:CreateToggle("Enable AutoMob V2", true, function(state)
    AutoMobEnabled2 = state
    if state then
        startLockLoop2()
        window:Notify("AutoMob", "AutoMob V2 enabled", 3)
    else
        stopLockLoop2()
        window:Notify("AutoMob", "AutoMob V2 disabled", 3)
    end
end)

sections.Main:CreateDropdown("AutoMob Mode V2", {"Behind", "Above"}, function(selected)
    Mode2 = selected
end, "Above", false)

sections.Main:CreateSlider("Behind Offset V2", 1, 20, 6, true, function(val)
    BehindOffset2 = val
end)

sections.Main:CreateSlider("Above Height V2", 2, 70, 10, true, function(val)
    AboveHeight2 = val
end)

sections.Main:CreateSlider("Float Speed", 10, 100, 50, true, function(val)
    FloatSpeed = val
end)

sections.Main:CreateLabel("Abilities")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function getAbilityController()
    local sp = game:GetService("StarterPlayer")
    local sps = sp:FindFirstChild("StarterPlayerScripts")
    if not sps then return nil end
    local ab = sps:FindFirstChild("AbilityController")
    if not ab then return nil end
    local success, result = pcall(require, ab)
    if success then return result end
    return nil
end

local AutoAbilitiesEnabled = false
local abilityDelay = 0.01
local autoAbilitiesConnection
local connection
local removeCDConnection
local RemoveCDEnabled = false

local function fireAbilities()
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        local localEvent = tool:FindFirstChild("localEvent")
        if localEvent then
            pcall(function() localEvent:Fire() end)
        end
    end
end

local function resetCooldowns()
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        local cooldownValue = tool:FindFirstChild("cooldown")
        if cooldownValue then
            pcall(function() cooldownValue.Value = 0.01 end)
        end
    end
end

local function bypassAllChecks()
    local character = LocalPlayer.Character
    if character then
        local busyCasting = character:FindFirstChild("busyCasting")
        if busyCasting then busyCasting.Value = false end
        local transformed = character:FindFirstChild("transformed")
        if transformed then transformed.Value = false end
    end
    for i = 1,10 do
        LocalPlayer:SetAttribute(("AbilitySlot%dCooldown"):format(i), 0)
    end
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:FindFirstChild("abilitySlot") then
            local localEvent = tool:FindFirstChild("localEvent")
            if localEvent then
                localEvent:Fire()
            end
        end
    end
end

local function startAutoAbilities()
    if autoAbilitiesConnection then autoAbilitiesConnection:Disconnect() end
    autoAbilitiesConnection = RunService.Heartbeat:Connect(function()
        if AutoAbilitiesEnabled then
            resetCooldowns()
            fireAbilities()
            bypassAllChecks()
            local abilityController = getAbilityController()
            if abilityController then
                abilityController.AbilityInputBegan({key = "ability_q"})
                abilityController.AbilityInputBegan({key = "ability_e"})
            end
            task.wait(abilityDelay)
        end
    end)
end

local function stopAutoAbilities()
    if autoAbilitiesConnection then
        autoAbilitiesConnection:Disconnect()
        autoAbilitiesConnection = nil
    end
end

sections.Main:CreateToggle("Remove Ability Cooldowns (Visible)", false, function(state)
    RemoveCDEnabled = state
    if state then
        removeCDConnection = RunService.RenderStepped:Connect(function()
            for i = 1, 10 do
                LocalPlayer:SetAttribute(("AbilitySlot%dCooldown"):format(i), 0)
            end
        end)
        window:Notify("Cooldown Bypass", "All cooldowns removed!", 3)
    else
        if removeCDConnection then
            removeCDConnection:Disconnect()
            removeCDConnection = nil
        end
        window:Notify("Cooldown Bypass", "Cooldown bypass disabled.", 3)
    end
end)

sections.Main:CreateToggle("Auto Abilities + No CD Visible", true, function(state)
    if state then
        connection = RunService.Heartbeat:Connect(function()
            bypassAllChecks()
            local abilityController = getAbilityController()
            if abilityController then
                abilityController.AbilityInputBegan({key = "ability_q"})
                abilityController.AbilityInputBegan({key = "ability_e"})
            end
        end)
        window:Notify("Abilities", "Auto Abilities + No CD enabled!", 3)
    else
        if connection then
            connection:Disconnect()
            connection = nil
        end
        window:Notify("Abilities", "Auto Abilities + No CD disabled.", 3)
    end
end)

sections.Main:CreateToggle("Auto Abilities", false, function(state)
    AutoAbilitiesEnabled = state
    if state then
        startAutoAbilities()
        window:Notify("Auto Abilities", "Enabled", 3)
    else
        stopAutoAbilities()
        window:Notify("Auto Abilities", "Disabled", 3)
    end
end)

sections.Main:CreateSlider("Ability Delay", 0.001, 0.5, 0.01, false, function(value)
    abilityDelay = value
end)

sections.Main:CreateDivider()

sections.Main:CreateLabel("Selling")

sections.Main:CreateButton("Open Sell Shop GUI", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
    local sellShop = PlayerGui and PlayerGui:FindFirstChild("sellShop")
    
    if sellShop then
        sellShop.Enabled = true
        sellShop.Frame.Visible = true
        sellShop.Frame.Size = UDim2.fromScale(0.5, 0.5)
        window:Notify("Sell Shop", "GUI opened successfully!", 4)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local ReloadInv = ReplicatedStorage:FindFirstChild("remotes"):FindFirstChild("reloadInvy")
local SellEvent = ReplicatedStorage:FindFirstChild("remotes"):FindFirstChild("sellItemEvent")

local AutoSellEnabled = false

sections.Main:CreateToggle("Auto Sell Duplicates", false, function(state)
    AutoSellEnabled = state
    if state then
        window:Notify("Auto Sell", "Auto-sell started!", 4)
        task.spawn(function()
            while AutoSellEnabled do
                local Inventory = ReloadInv:InvokeServer()
                local SellList = {weapon={}, ability={}, chest={}, helmet={}, ring={}}

                local function getId(prefix, key)
                    if prefix == "weapon" then return tonumber(string.sub(key, 8))
                    elseif prefix == "ability" then return tonumber(string.sub(key, 9))
                    elseif prefix == "chest" then return tonumber(string.sub(key, 7))
                    elseif prefix == "helmet" then return tonumber(string.sub(key, 8))
                    elseif prefix == "ring" then return tonumber(string.sub(key, 6)) end
                end

                for typeName, data in pairs(Inventory) do
                    if typeName == "weapons" or typeName == "abilities" or typeName == "chests" or typeName == "helmets" or typeName == "rings" then
                        local nameTracker = {}
                        for key, item in pairs(data) do
                            local name = item.name or item.displayName
                            if name then
                                if not nameTracker[name] then
                                    nameTracker[name] = true
                                else
                                    if not item.equipped and not item.favorite then
                                        local id = getId(string.sub(typeName,1,#typeName-1), key)
                                        if id then table.insert(SellList[string.sub(typeName,1,#typeName-1)], id) end
                                    end
                                end
                            end
                        end
                    end
                end

                SellEvent:FireServer(SellList)
                task.wait(1)
            end
        end)
    else
        window:Notify("Auto Sell", "Auto-sell stopped.", 4)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local ATTACK_DELAY = 0.1
local DELTA_OFFSET = 0.5

local lastTriggerTime = 0
local lastSentAt = 0
local AutoAttackEnabled = true
local attackConnection
local moduleLoaded = false
local WeaponModule

-- Stop all animations
local function stopAllAnims()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        for _, anim in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
            anim:Stop(0)
        end
    end
end

-- Hook Bridge.Fire
local function hookBridge()
    if not WeaponModule or not WeaponModule.Bridge then return end
    local bridge = WeaponModule.Bridge
    if bridge and bridge.Fire then
        local originalFire = bridge.Fire
        bridge.Fire = function(self, data)
            if data and data.sentAt then
                lastSentAt = (lastSentAt == 0 and tick()) or lastSentAt + DELTA_OFFSET
                data.sentAt = lastSentAt
            end
            return originalFire(self, data)
        end
    end
end

-- Auto attack loop
local function startAutoAttack()
    if attackConnection then attackConnection:Disconnect() end
    attackConnection = RunService.Heartbeat:Connect(function()
        if AutoAttackEnabled and moduleLoaded and WeaponModule then
            local currentTime = tick()
            if currentTime - lastTriggerTime >= ATTACK_DELAY then
                pcall(function()
                    stopAllAnims()
                    if WeaponModule then
                        WeaponModule.CurrentSwingIndex = 1
                        WeaponModule.Debounce = false
                        if WeaponModule.Attack then
                            WeaponModule.Attack()
                        end
                    end
                end)
                lastTriggerTime = currentTime
            end
        end
    end)
end

local function stopAutoAttack()
    if attackConnection then
        attackConnection:Disconnect()
        attackConnection = nil
    end
end

-- Try to load Weapon module
local function tryLoadModule()
    if moduleLoaded then return true end

    local success, mod = pcall(function()
        local UIS = StarterGui:FindFirstChild("UIS")
        if UIS then
            local w = UIS:FindFirstChild("Weapon")
            if w and w:IsA("ModuleScript") then
                return require(w)
            end
        end
    end)

    if success and mod then
        WeaponModule = mod
    else
        local success2, mod2 = pcall(function()
            local ps = LocalPlayer:FindFirstChild("PlayerScripts")
            if ps then
                local ui = ps:FindFirstChild("Ui")
                if ui and ui:FindFirstChild("hud") and ui.hud:FindFirstChild("ActionButtons") then
                    local w2 = ui.hud.ActionButtons:FindFirstChild("Weapon")
                    if w2 and w2:IsA("ModuleScript") then
                        return require(w2)
                    end
                end
            end
        end)
        if success2 and mod2 then
            WeaponModule = mod2
        end
    end

    if not WeaponModule then return false end

    pcall(function()
        if WeaponModule.Init then pcall(WeaponModule.Init) end
        if WeaponModule._UpdateWeaponEquipped then pcall(WeaponModule._UpdateWeaponEquipped) end
        WeaponModule.Debounce = false
        WeaponModule.CurrentSwingIndex = 1
    end)

    moduleLoaded = true
    hookBridge()
    return true
end

-- Keep loading module in background
task.spawn(function()
    while true do
        if AutoAttackEnabled and not moduleLoaded then
            tryLoadModule()
            if moduleLoaded then startAutoAttack() end
        end
        if not AutoAttackEnabled and moduleLoaded then stopAutoAttack() end
        task.wait(0.8)
    end
end)

-- Respawn reset
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if moduleLoaded and WeaponModule then
        pcall(function()
            if WeaponModule.Init then pcall(WeaponModule.Init) end
            if WeaponModule._UpdateWeaponEquipped then pcall(WeaponModule._UpdateWeaponEquipped) end
            WeaponModule.Debounce = false
            WeaponModule.CurrentSwingIndex = 1
            lastSentAt = 0
        end)
    end
end)

sections.Automation:CreateToggle("Auto Attack + Fast", true, function(state)
    AutoAttackEnabled = state
    if state then
        if tryLoadModule() then
            startAutoAttack()
            window:Notify("Auto Attack", "Enabled", 3)
        else
            window:Notify("Auto Attack", "Enabled (waiting for module)", 3)
        end
    else
        stopAutoAttack()
        window:Notify("Auto Attack", "Disabled", 3)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local ATTACK_DELAY2 = 0.02
local lastTriggerTime2 = 0
local AutoAttackEnabled2 = false
local attackConnection2

local WeaponModule2
local function loadWeaponModule2()
    local success, err = pcall(function()
        local UIS = StarterGui:WaitForChild("UIS", 5)
        WeaponModule2 = require(UIS:WaitForChild("Weapon", 3))
    end)
    if not success then
        local success2, err2 = pcall(function()
            local playerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
            WeaponModule2 = require(
                playerScripts:WaitForChild("Ui")
                :WaitForChild("hud")
                :WaitForChild("ActionButtons")
                :WaitForChild("Weapon", 3)
            )
        end)
        if not success2 then
            warn("Failed to load Weapon module:", err2)
            return false
        end
    end
    pcall(WeaponModule2.Init)
    return true
end

local function startAutoAttack2()
    if attackConnection2 then attackConnection2:Disconnect() end
    attackConnection2 = RunService.Heartbeat:Connect(function()
        if AutoAttackEnabled2 then
            local currentTime = tick()
            if currentTime - lastTriggerTime2 >= ATTACK_DELAY2 then
                pcall(function()
                    WeaponModule2.CurrentSwingIndex = 1
                    WeaponModule2.Debounce = false
                    WeaponModule2.Attack()
                end)
                lastTriggerTime2 = currentTime
            end
        end
    end)
end

local function stopAutoAttack2()
    if attackConnection2 then
        attackConnection2:Disconnect()
        attackConnection2 = nil
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if WeaponModule2 then
        pcall(WeaponModule2.Init)
        WeaponModule2.Debounce = false
        WeaponModule2.CurrentSwingIndex = 1
    end
end)

sections.Automation:CreateToggle("Auto Sword Normal", true, function(state)
    AutoAttackEnabled2 = state
    if state then
        if loadWeaponModule2() then
            startAutoAttack2()
            window:Notify("Auto Sword", "Enabled", 3)
        end
    else
        stopAutoAttack2()
        window:Notify("Auto Sword", "Disabled", 3)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SelectedRaid = "Goliath Raid"
local SelectedTier = 1
local AutoRaidEnabled = false

local LevelToTier = {
    [100] = 1,
    [130] = 2,
    [160] = 3,
    [180] = 4,
    [200] = 5
}

sections.Raid:CreateDropdown("Select Raid", {"Goliath Raid", "Hela Raid"}, function(selection)
    SelectedRaid = selection
    window:Notify("Raid Selection", "Selected raid: " .. selection, 3)
end, "Goliath Raid", false)

sections.Raid:CreateDropdown("Select Level", {"100", "130", "160", "180", "200"}, function(selection)
    local level = tonumber(selection)
    SelectedTier = LevelToTier[level] or 1
    window:Notify("Level Selection", "Selected level: " .. selection .. " (Tier " .. SelectedTier .. ")", 3)
end, "100", false)

sections.Raid:CreateToggle("Auto Raid / Solo", false, function(state)
    AutoRaidEnabled = state
    if state then
        window:Notify("Auto Raid", "Auto Raid started!", 3)
        task.spawn(function()
            while AutoRaidEnabled do
                local args = {
                    [1] = {
                        [1] = {
                            [1] = "\1",
                            [2] = {
                                ["\3"] = "PlaySolo",
                                ["partyData"] = {
                                    ["difficulty"] = "Nightmare",
                                    ["mode"] = "Normal",
                                    ["dungeonName"] = SelectedRaid,
                                    ["tier"] = SelectedTier
                                }
                            }
                        },
                        [2] = "\175"
                    }
                }
                ReplicatedStorage.dataRemoteEvent:FireServer(unpack(args))
                task.wait(1)
            end
        end)
    else
        window:Notify("Auto Raid", "Auto Raid stopped.", 3)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local dungeon = workspace:FindFirstChild("dungeon")

local AutoWalkEnabled = false
local Speed = 20

local Waypoints = {
    CFrame.new(2758.98096, 28.3523273, -2122.16333, 0.755460799, 2.78531811e-08, 0.655193806, -5.07122699e-08, 1, 1.5961616e-08, -0.655193806, -4.52847431e-08, 0.755460799),
    CFrame.new(2659.57324, 24.6406937, -2201.36401, 0.999876738, -5.72287497e-08, 0.01570151, 5.577742e-08, 1, 9.28702946e-08, -0.01570151, -9.19830541e-08, 0.999876738),
    CFrame.new(2599.39917, 8.49999714, -2234.09375, 0.576736808, 3.0230435e-08, 0.816929996, -9.58194235e-08, 1, 3.06417363e-08, -0.816929996, -9.59499786e-08, 0.576736808),
    CFrame.new(2579.09644, 8.49999714, -2312.29785, 0.993906915, -2.5128486e-08, 0.110222943, 3.0836997e-08, 1, -5.0085923e-08, -0.110222943, 5.31796864e-08, 0.993906915),
    CFrame.new(2561.38599, 8.49999714, -2411.50879, 0.989224195, 5.93127716e-08, 0.146408677, -6.11777295e-08, 1, 8.23527468e-09, -0.146408677, -1.71034831e-08, 0.989224195),
    CFrame.new(2544.99268, 37.8690376, -2639.35132, 0.999539495, 1.7874493e-08, 0.0303454939, -1.72655117e-08, 1, -2.03303188e-08, -0.0303454939, 1.97970245e-08, 0.999539495),
    CFrame.new(2384.39038, 62.4298668, -2737.10474, 0.251726478, -2.08669082e-08, 0.967798412, 9.90776101e-08, 1, -4.20908863e-09, -0.967798412, 9.69466925e-08, 0.251726478),
    CFrame.new(2137.73291, 116.489174, -2745.48975, 0.0910568982, -1.19433201e-08, 0.995845675, 1.13851497e-08, 1, 1.09521219e-08, -0.995845675, 1.03405862e-08, 0.0910568982),
    CFrame.new(1961.70166, 171.333755, -2751.79541, -0.0329169296, -5.76885917e-09, 0.999458075, 4.81703104e-08, 1, 7.35846539e-09, -0.999458075, 4.83864255e-08, -0.0329169296),
    CFrame.new(1909.97961, 228.507156, -2896.34229, 0.994535387, 5.94760408e-10, -0.104400232, 8.2424384e-10, 1, 1.35488207e-08, 0.104400232, -1.35608333e-08, 0.994535387),
    CFrame.new(1910.68237, 240.274567, -3093.64819, 0.998340845, 5.4274345e-09, -0.0575811416, -6.12738305e-09, 1, -1.197931e-08, 0.0575811416, 1.23122561e-08, 0.998340845),
    CFrame.new(1934.047, 228.148071, -3280.85986, 0.864859521, -2.24047847e-09, -0.502013981, 2.60290678e-09, 1, 2.1254918e-11, 0.502013981, -1.32507816e-09, 0.864859521),
    CFrame.new(1992.39636, 228.199951, -3405.16064, 0.496819854, -7.87012269e-08, -0.867853701, -2.35815545e-08, 1, -1.04184622e-07, 0.867853701, 7.2226328e-08, 0.496819854),
    CFrame.new(2315.23608, 228.095215, -3416.89233, -0.896446288, 2.09142819e-08, -0.443152428, 2.24749108e-08, 1, 1.73017523e-09, 0.443152428, -8.40880165e-09, -0.896446288),
    CFrame.new(2360.98828, 228.188461, -3235.36084, -0.997944653, 3.71443711e-08, 0.064081572, 4.19534132e-08, 1, 7.3700015e-08, -0.064081572, 7.62369794e-08, -0.997944653)
}

local function getNextEnemy()
    if not dungeon then return false end
    for _, room in ipairs(dungeon:GetChildren()) do
        local enemyFolder = room:FindFirstChild("enemyFolder")
        if enemyFolder then
            for _, enemy in ipairs(enemyFolder:GetChildren()) do
                local hum = enemy:FindFirstChildOfClass("Humanoid")
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 0 then
                    return true
                end
            end
        end
    end
    return false
end

local function moveToCFrame(targetCFrame)
    task.spawn(function()
        while AutoWalkEnabled do
            local character = LocalPlayer.Character
            if not character then break end
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if not hrp then break end
            if getNextEnemy() then break end

            local diff = targetCFrame.Position - hrp.Position
            if diff.Magnitude < 2 then break end

            local dir = diff.Unit
            hrp.CFrame = hrp.CFrame + dir * (Speed * RunService.Heartbeat:Wait())
        end
    end)
end

local function autoWalk()
    task.spawn(function()
        for _, cf in ipairs(Waypoints) do
            if not AutoWalkEnabled then break end
            moveToCFrame(cf)
            repeat task.wait(0.2) until not AutoWalkEnabled or getNextEnemy() or (LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - cf.Position).Magnitude < 2)
            while getNextEnemy() and AutoWalkEnabled do task.wait(1) end
        end
    end)
end

sections.Raid:CreateToggle("Auto Walk | Yokai Peak", false, function(state)
    AutoWalkEnabled = state
    if state then
        window:Notify("Auto Walk", "Started", 3)
        autoWalk()
    else
        window:Notify("Auto Walk", "Stopped", 3)
    end
end)

sections.Player:CreateToggle("Anti AFK", true, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local vu = game:GetService("VirtualUser")

    if state and not _G.AntiAfkConnection then
        _G.AntiAfkConnection = LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        _G.AntiAfkHeartbeat = task.spawn(function()
            while _G.AntiAfkConnection do
                vu:CaptureController()
                vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(60)
            end
        end)
    elseif not state and _G.AntiAfkConnection then
        _G.AntiAfkConnection:Disconnect()
        _G.AntiAfkConnection = nil
        if _G.AntiAfkHeartbeat then
            task.cancel(_G.AntiAfkHeartbeat)
            _G.AntiAfkHeartbeat = nil
        end
    end
end)

sections.Player:CreateToggle("Auto Walk", false, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local AutoWalkEnabled = state
    local WalkSpeed = 20

    local function startAutoWalk()
        task.spawn(function()
            while AutoWalkEnabled do
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if humanoid and hrp then
                        humanoid.WalkSpeed = WalkSpeed
                        local forwardVector = hrp.CFrame.LookVector
                        hrp.CFrame = hrp.CFrame + forwardVector * 2
                    end
                end
                task.wait(0.1)
            end
        end)
    end

    if state then
        startAutoWalk()
    else
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
end)

sections.Player:CreateToggle("Anti Idle", true, function(state)
    local VirtualUser = game:GetService("VirtualUser")
    local AntiIdleEnabled = state

    local function startAntiIdle()
        task.spawn(function()
            while AntiIdleEnabled do
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
                task.wait(30)
            end
        end)
    end

    if state then
        startAntiIdle()
    end
end)

sections.Player:CreateToggle("Infinite Jump", true, function(state)
    if state and not _G.JumpConnection then
        _G.JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local lp = game:GetService("Players").LocalPlayer
            if lp.Character then
                local hum = lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState("Jumping")
                end
            end
        end)
    elseif not state and _G.JumpConnection then
        _G.JumpConnection:Disconnect()
        _G.JumpConnection = nil
    end
end)

sections.Player:CreateToggle("Noclip", true, function(state)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    if state and not _G.NoclipConnection then
        _G.NoclipConnection = RunService.Stepped:Connect(function()
            if lp.Character then
                for _, part in pairs(lp.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    elseif not state and _G.NoclipConnection then
        _G.NoclipConnection:Disconnect()
        _G.NoclipConnection = nil
    end
end)

sections.Player:CreateSlider(
    "Walk Speed",
    16,
    200,
    16,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character then
            local hum = lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = value end
        end
    end
)

sections.Player:CreateSlider(
    "Gravity Delay",
    1,
    5,
    1,
    true,
    function(value)
        workspace.Gravity = 196.2 * value
    end
)

sections.Player:CreateSlider(
    "Jump Power",
    50,
    200,
    50,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
            lp.Character.Humanoid.JumpPower = value
        end
    end
)

sections.Player:CreateSlider(
    "Field of View",
    70,
    120,
    70,
    true,
    function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
)


sections.Player:CreateLabel("This script modifies your local player's properties and functions.\nIt only affects YOUR character and doesn't impact other players.\n\nWhat LocalPlayer controls:\n• Your character's movement speed and jumping\n• Your camera field of view\n• Your anti-afk status\n• Your noclip collision\n• Your gravity settings\n\nAll changes are client-side only and temporary.")


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Remote = ReplicatedStorage:FindFirstChild("dataRemoteEvent")

local function claimQuest(questId)
    if not Remote then
        Remote = ReplicatedStorage:FindFirstChild("dataRemoteEvent")
    end
    if not Remote then return end

    local args = {
        [1] = {
            [1] = {
                [1] = "\1",
                [2] = {
                    ["\3"] = "ClaimQuest",
                    ["uniqueId"] = questId
                }
            },
            [2] = "G"
        }
    }
    Remote:FireServer(unpack(args))
    print("Claimed quest:", questId)
end

sections.Quest:CreateToggle("Auto Claim All Quests", true, function(state)
    if state then
        local questFolder = LocalPlayer:FindFirstChild("Quests")
        if questFolder then
            for _, quest in ipairs(questFolder:GetChildren()) do
                local uid = quest:FindFirstChild("uniqueId")
                local st = quest:FindFirstChild("state")
                if uid and st and st.Value == "Completed" then
                    claimQuest(uid.Value)
                end
                if st and uid then
                    st:GetPropertyChangedSignal("Value"):Connect(function()
                        if st.Value == "Completed" then
                            claimQuest(uid.Value)
                        end
                    end)
                end
            end

            questFolder.ChildAdded:Connect(function(child)
                local uid = child:FindFirstChild("uniqueId")
                local st = child:FindFirstChild("state")
                if st and uid then
                    st:GetPropertyChangedSignal("Value"):Connect(function()
                        if st.Value == "Completed" then
                            claimQuest(uid.Value)
                        end
                    end)
                end
            end)
        end
    end
end)

local AutoPinEnabled = false
local QuestConnections = {}

local function pinQuest(questId)
    if not Remote then
        Remote = ReplicatedStorage:FindFirstChild("dataRemoteEvent")
    end
    if not Remote then return end

    local args = {
        [1] = {
            [1] = {
                [1] = "\1",
                [2] = {
                    ["\3"] = "SetPinnedState",
                    ["uniqueId"] = questId,
                    ["state"] = true
                }
            },
            [2] = "G"
        }
    }
    Remote:FireServer(unpack(args))
    print("Pinned quest:", questId)
end

local function pinAllQuests()
    local questsFolder = LocalPlayer:FindFirstChild("Quests")
    if not questsFolder then return end

    for _, quest in pairs(questsFolder:GetChildren()) do
        local uid = quest:FindFirstChild("uniqueId")
        if uid then
            pinQuest(uid.Value)
        end
    end
end

local function hookQuestFolder(folder)
    if QuestConnections[folder] then
        QuestConnections[folder]:Disconnect()
    end
    QuestConnections[folder] = folder.ChildAdded:Connect(function(child)
        if AutoPinEnabled then
            local uid = child:FindFirstChild("uniqueId")
            if uid then
                pinQuest(uid.Value)
            end
        end
    end)
end

sections.Quest:CreateToggle("Auto Pin All Quests", true, function(state)
    AutoPinEnabled = state
    if state then
        pinAllQuests()

        local questsFolder = LocalPlayer:FindFirstChild("Quests")
        if questsFolder then
            hookQuestFolder(questsFolder)
        end
        QuestConnections["QuestsWatcher"] = LocalPlayer.ChildAdded:Connect(function(child)
            if child.Name == "Quests" then
                hookQuestFolder(child)
                if AutoPinEnabled then
                    pinAllQuests()
                end
            end
        end)

        window:Notify("Quests", "Auto Pin enabled", 3)
    else
        for _, conn in pairs(QuestConnections) do
            if conn then conn:Disconnect() end
        end
        QuestConnections = {}
        window:Notify("Quests", "Auto Pin disabled", 3)
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("dataRemoteEvent")

local upgradeAmount = 1

local function upgradeStat(stat, amount)
    local args = {
        [1] = {
            [1] = {
                [1] = "\1",
                [2] = {
                    ["stat"] = stat,
                    ["amount"] = tonumber(amount) or 1
                }
            },
            [2] = "%"
        }
    }
    remote:FireServer(unpack(args))
end

local autoSpell = true
local autoMelee = true
local autoHealth = true

task.spawn(function()
    while task.wait(1) do
        if autoSpell then
            upgradeStat("spellPower", upgradeAmount)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if autoMelee then
            upgradeStat("physicalPower", upgradeAmount)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if autoHealth then
            upgradeStat("stamina", upgradeAmount)
        end
    end
end)

sections.Upgrade:CreateTextBox("Upgrade Amount", "Type a number here...", true, function(Text)
    upgradeAmount = tonumber(Text) or 1
    print("Upgrade amount set to:", upgradeAmount)
end)

sections.Upgrade:CreateToggle("Auto Upgrade SpellPower", true, function(state)
    autoSpell = state
    if state then
        upgradeStat("spellPower", upgradeAmount)
    end
end)

sections.Upgrade:CreateToggle("Auto Upgrade Melee (PhysicalPower)", true, function(state)
    autoMelee = state
    if state then
        upgradeStat("physicalPower", upgradeAmount)
    end
end)

sections.Upgrade:CreateToggle("Auto Upgrade Health (Stamina)", true, function(state)
    autoHealth = state
    if state then
        upgradeStat("stamina", upgradeAmount)
    end
end)


local player = game.Players.LocalPlayer
local success, intro = pcall(function()
    return require(player:WaitForChild("PlayerScripts"):WaitForChild("Ui"):WaitForChild("intro"))
end)

if not success then
    warn("Failed to load intro module")
    return
end

local function skipIntro()
    pcall(intro.Init)
    intro.Play = true
    intro.RequestedSpawn = true
    
    pcall(function()
        intro.Bridge:InvokeServerAsync()
    end)
    
    for i = 1, 5 do
        task.wait(0.5)
        pcall(function()
            local gui = player:WaitForChild("PlayerGui"):FindFirstChild("introGui")
            if gui then
                gui.Enabled = false
                gui:Destroy()
            end
        end)
    end
    
    for _, effect in pairs(game.Lighting:GetChildren()) do
        if effect:IsA("BlurEffect") then
            effect:Destroy()
        end
    end
    
    local cam = workspace.CurrentCamera
    cam.CameraType = Enum.CameraType.Custom
    cam.CameraSubject = player.Character:WaitForChild("Humanoid")
end

local skipEnabled = true

sections.Game:CreateToggle("Instantly Skip Dumb Intro", true, function(state)
    skipEnabled = state
    if state then
        skipIntro()
        window:Notify("Intro Skip", "Skipped intro", 3)
    else
        window:Notify("Intro Skip", "Disabled", 3)
    end
end)

task.defer(function()
    if skipEnabled then
        skipIntro()
    end
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    if skipEnabled then
        skipIntro()
    end
end)

sections.Game:CreateButton("Rejoin Game", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    TeleportService:Teleport(game.PlaceId, player)
end)

sections.Game:CreateDivider()


local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local stats = player:WaitForChild("leaderstats")

-- ✅ UNIVERSAL WEBHOOK FUNCTION (works for executors)
local function sendWebhook(url, data)
    local json = HttpService:JSONEncode(data)
    local success = false
    local used = "none"

    if syn and syn.request then
        syn.request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = json})
        success, used = true, "syn.request"
    elseif http and http.request then
        http.request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = json})
        success, used = true, "http.request"
    elseif request then
        request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = json})
        success, used = true, "request"
    else
        warn("❌ Your executor does not support HTTP requests.")
    end

    return success, used
end

-- ✅ MAIN TEXTBOX
sections.Game:CreateTextBox(
    "Discord Webhook URL",
    "Paste webhook URL here",
    false,
    function(webhookUrl)
        if not webhookUrl or webhookUrl == "" then
            window:Notify("Discord", "❌ Please enter a valid webhook URL", 3)
            return
        end

        -- === Gather Player Data ===
        local gold = stats:FindFirstChild("Gold") and stats.Gold.Value or 0
        local level = stats:FindFirstChild("Level") and stats.Level.Value or 0
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        local hp = humanoid and humanoid.Health or 0
        local maxHp = humanoid and humanoid.MaxHealth or 0
        local playerCount = #Players:GetPlayers()

        local xp = player:FindFirstChild("XP") and player.XP.Value or 0
        local xpNeeded = player:FindFirstChild("XPNeeded") and player.XPNeeded.Value or 0
        local cosmeticArmor = player:FindFirstChild("cosmeticArmor") and player.cosmeticArmor.Value or "None"
        local cosmeticWeapon = player:FindFirstChild("cosmeticWeapon") and player.cosmeticWeapon.Value or "None"
        local aura = player:FindFirstChild("aura") and player.aura.Value or "None"
        local enchantment = player:FindFirstChild("enchantment") and player.enchantment.Value or "None"
        local physicalPower = player:FindFirstChild("physicalPower") and player.physicalPower.Value or 0
        local spellPower = player:FindFirstChild("spellPower") and player.spellPower.Value or 0
        local stamina = player:FindFirstChild("stamina") and player.stamina.Value or 0
        local weaponEquipped = player:FindFirstChild("weaponEquipped") and player.weaponEquipped.Value or "None"

        local bossVotingTimeLeft = player.PlayerGui:FindFirstChild("bonusBossVotingGui") and player.PlayerGui.bonusBossVotingGui.mainFrame:FindFirstChild("timeLeft") and player.PlayerGui.bonusBossVotingGui.mainFrame.timeLeft.Text or "N/A"
        local bossName = player.PlayerGui:FindFirstChild("bossHealth") and player.PlayerGui.bossHealth.healthFrame:FindFirstChild("bossName") and player.PlayerGui.bossHealth.healthFrame.bossName.Text or "None"
        local raidRewardName = player.PlayerGui:FindFirstChild("PartyUi") and player.PlayerGui.PartyUi.Templates.Raid.Frame.Rewards:FindFirstChild("RewardName") and player.PlayerGui.PartyUi.Templates.Raid.Frame.Rewards.RewardName.Text or "None"

        local function stripFontTags(text)
            return text:gsub("<font[^>]*>", ""):gsub("</font>", "")
        end
        local charSelection = player.PlayerGui:FindFirstChild("CharacterSelection") and player.PlayerGui.CharacterSelection.Rewards:FindFirstChild("Info")
        local reward1 = charSelection and charSelection:FindFirstChild("Reward1") and stripFontTags(charSelection.Reward1.Text) or "None"
        local reward2 = charSelection and charSelection:FindFirstChild("Reward2") and stripFontTags(charSelection.Reward2.Text) or "None"
        local reward3 = charSelection and charSelection:FindFirstChild("Reward3") and stripFontTags(charSelection.Reward3.Text) or "None"

        local playtimeRewards = player.PlayerGui:FindFirstChild("PlaytimeRewards") and player.PlayerGui.PlaytimeRewards.Main.BarFrame:FindFirstChild("Milestones")
        local dailyRewards = {}
        if playtimeRewards then
            for _, milestone in ipairs(playtimeRewards:GetChildren()) do
                local rewardText = milestone:FindFirstChild("RewardText")
                if rewardText and rewardText:IsA("TextLabel") then
                    table.insert(dailyRewards, rewardText.Text)
                end
            end
        end
        local dailyRewardsStr = (#dailyRewards > 0 and table.concat(dailyRewards, "\n")) or "None"

        local shopUi = player.PlayerGui:FindFirstChild("ShopUi") and player.PlayerGui.ShopUi.InfoCanvas.BoostInfo:FindFirstChild("Frame")
        local healthBoost = shopUi and shopUi:FindFirstChild("Health") and shopUi.Health:FindFirstChild("BoostName") and shopUi.Health.BoostName.Text or "None"
        local luckBoost = shopUi and shopUi:FindFirstChild("Luck") and shopUi.Luck:FindFirstChild("BoostName") and shopUi.Luck.BoostName.Text or "None"
        local reviveBoost = shopUi and shopUi:FindFirstChild("Revive") and shopUi.Revive:FindFirstChild("BoostName") and shopUi.Revive.BoostName.Text or "None"
        local speedBoost = shopUi and shopUi:FindFirstChild("Speed") and shopUi.Speed:FindFirstChild("BoostName") and shopUi.Speed.BoostName.Text or "None"
        local xpBoost = shopUi and shopUi:FindFirstChild("XP") and shopUi.XP:FindFirstChild("BoostName") and shopUi.XP.BoostName.Text or "None"

        local backpackItems = {}
        for _, item in ipairs(player.Backpack:GetChildren()) do
            local info = "🛡️ " .. item.Name
            if item:FindFirstChild("type") then info = info .. " | Type: " .. item.type.Value end
            if item:FindFirstChild("damage") then info = info .. " | Damage: " .. item.damage.Value end
            if item:FindFirstChild("cooldownLength") then info = info .. " | Cooldown: " .. item.cooldownLength.Value end
            table.insert(backpackItems, info)
        end
        local backpackStr = (#backpackItems > 0 and table.concat(backpackItems, "\n")) or "Empty"

        local content = string.format(
            "**🧑 Player Info**\n👤 %s\n❤️ %d/%d\n👥 Players: %d\n\n" ..
            "**📊 Stats**\n💰 Gold: %d\n📈 Level: %d\n🔥 XP: %d/%d\n\n" ..
            "**🎨 Cosmetics**\n🛡️ %s | ⚔️ %s | ✨ %s | 🔮 %s\n\n" ..
            "**💪 Powers**\n🥊 %d | 🪄 %d | 🏃 %d | 🗡️ %s\n\n" ..
            "**👹 Boss Info**\n⏳ %s | 🏰 %s | 🎁 %s\n\n" ..
            "**🎒 Backpack**\n%s\n\n🕒 %s",
            player.Name, hp, maxHp, playerCount,
            gold, level, xp, xpNeeded,
            cosmeticArmor, cosmeticWeapon, aura, enchantment,
            physicalPower, spellPower, stamina, weaponEquipped,
            bossVotingTimeLeft, bossName, raidRewardName,
            backpackStr,
            os.date("%Y-%m-%d %H:%M:%S")
        )

        local payload = {
            username = "Dungeons Quest Logger",
            content = content
        }

        local success, method = sendWebhook(webhookUrl, payload)

        if success then
            window:Notify("Discord", "✅ Stats sent via "..method, 4)
            print("✅ Sent using "..method)
        else
            window:Notify("Discord", "❌ Failed - your executor may not support HTTP", 5)
        end
    end
)


local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServerID = ""

sections.Game:CreateTextBox("Server ID", "Enter server ID here", true, function(text)
    ServerID = text
end)

sections.Game:CreateToggle("Auto Join Server", false, function(state)
    if state then
        window:Notify("Auto Join", "Enabled - Joining server ID: "..ServerID, 4)
        if ServerID ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerID, LocalPlayer)
        else
            window:Notify("Auto Join", "No Server ID entered!", 4)
        end
    else
        window:Notify("Auto Join", "Disabled", 4)
    end
end)


sections.Discord:CreateButton("Join Discord", function()
    setclipboard("https://discord.gg/YU5crU9zV")
    window:Notify("Discord", "Link copied to clipboard!\nPaste in your browser to join: discord.gg/YU5crU9zV", 7)
end)


sections.Discord:CreateLabel("💬 Join our Discord community!\nGet script updates, new features, and support directly from the devs.")


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local watermark = library:Hud()

local lastUpdate = 0
local fps = 0

RunService.RenderStepped:Connect(function(dt)
    lastUpdate += 1
    if lastUpdate >= 10 then
        fps = math.floor(1 / dt)
        lastUpdate = 0
    end

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local time = os.date("%Y-%m-%d %H:%M:%S", os.time())

    watermark:SetText(
        string.format("%s | FPS: %d | Ping: %dms | %s", LocalPlayer.Name, fps, ping, time)
    )
end)


local config_manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/ConfigManager.lua"))()
config_manager:SetLibrary(library)
config_manager:SetWindow(window)
config_manager:SetFolder("Examnple Name") -- name for folder where configs will be stored
config_manager:BuildConfigSection(tabs.settings)
config_manager:LoadAutoloadConfig()
window:SetBackground("114178849342027") -- if you turned on assets set the background id here
window:SetTileOffset(100)
window:SetTileScale(0.5) -- on how large background asset should be
window:SetBackgroundColor(Color3.fromRGB(40, 40, 40))
window:SetBackgroundTransparency(0.5) -- on how transparent background should be for asset