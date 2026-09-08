--[[
Reversed By Hisako
]]

local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local SyncData = ReplicatedStorage:FindFirstChild("SyncData")

local function child(parent, name)
    return parent and parent:FindFirstChild(name)
end

local RollEvents = child(SyncData, "RollEvents")
local ItemRemotes = child(SyncData, "ItemRemotes")
local ZoneRemotes = child(SyncData, "ZoneRemotes")
local UpgradeRemotes = child(SyncData, "UpgradeRemotes")
local RebirthRemotes = child(SyncData, "RebirthRemotes")
local InventoryRemotes = child(SyncData, "InventoryRemotes")
local SettingsRemotes = child(SyncData, "SettingsRemotes")

local Remotes = {
    RollRequest = child(RollEvents, "RollRequest"),
    AutoRollState = child(RollEvents, "AutoRollState"),
    SpawnLoot = child(RollEvents, "SpawnLoot"),
    SpawnItem = child(ItemRemotes, "SpawnItem"),
    PurchaseUpgrade = child(UpgradeRemotes, "PurchaseUpgrade"),
    PurchaseZone = child(ZoneRemotes, "PurchaseZone"),
    SwitchZone = child(ZoneRemotes, "SwitchZone"),
    RequestRebirth = child(RebirthRemotes, "RequestRebirth"),
    UseItem = child(InventoryRemotes, "UseItem"),
    EquipBest = child(InventoryRemotes, "EquipBest"),
    ClaimIndexReward = child(SyncData, "ClaimIndexReward"),
    SaveSettings = child(SettingsRemotes, "SaveSettings"),
}

local function callRemote(remote, ...)
    if not remote then
        warn("[RTD] Missing remote:", remote)
        return nil
    end
    if remote:IsA("RemoteFunction") then
        return remote:InvokeServer(...)
    end
    remote:FireServer(...)
    return nil
end

local Settings = {
    autoRoll = false,
    manualRoll = false,
    autoPotions = false,
    autoCollectPotions = false,
    autoProgression = false,
    autoRebirth = false,
    equipBest = false,
    autoClaimIndex = false,
    autoUpgrades = false,
    upgTarget = "All",
    antiAfk = false,
    hideGuis = false,
    hideCutscenes = false,
    hideEnemies = false,
}

local function notify(title, enabled, icon)
    WindUI:Notify({
        Title = title,
        Content = enabled and "Enabled" or "Disabled",
        Icon = icon,
    })
end

local function readValue(name, default)
    local object = child(SyncData, name)
    if object and object:IsA("ValueBase") then
        return object.Value
    end
    local attribute = SyncData and SyncData:GetAttribute(name)
    if attribute ~= nil then
        return attribute
    end
    return default
end

local UPGRADE_GROUPS = {
    Core = { "EnemyCount", "SpawnSpeed", "Brain", "Boss", "Rolls", "Luck", "Units" },
    EnemyCount = {
        "EnemySpawning1", "EnemySpawning2", "EnemySpawning3", "EnemySpawning4",
        "EnemySpawning5", "EnemySpawning6", "EnemySpawning7", "EnemySpawning8",
    },
    SpawnSpeed = {
        "EnemySpawnSpeed1", "EnemySpawnSpeed2", "EnemySpawnSpeed3",
        "EnemySpawnSpeed4", "EnemySpawnSpeed5", "EnemySpawnSpeed6",
        "EnemySpawnSpeed7", "EnemySpawnSpeed8", "EnemySpawnSpeed9",
        "EnemySpawnSpeed10",
    },
    Brain = { "BrainChance1", "BrainChance2", "BrainChance3", "BrainChance4", "BrainChance5" },
    Boss = { "BossChance1", "BossChance2", "BossChance3" },
    Rolls = {
        "GoldenRoll1", "GoldenRoll2", "GoldenRoll3",
        "PurpleRoll1", "PurpleRoll2", "PurpleRoll3", "PurpleRoll4",
    },
    Luck = {
        "Luck1", "Luck2", "Luck3", "Luck4", "Luck5", "Luck6",
        "Luck7", "Luck8", "Luck9", "Luck10", "Luck11", "Luck12",
    },
    Units = {
        "MaxUnits1", "MaxUnits2", "MaxUnits3", "MaxUnits4", "MaxUnits5",
        "UnlockStellar", "UnlockIced", "UnlockInverted",
    },
    RollUpgrades = {
        "RollSpeed1", "RollSpeed2", "RollSpeed3", "RollSpeed4",
        "RollSpeed5", "RollSpeed6", "RollSpeed7", "RollSpeed8",
        "ColummChance1", "ColummChance2", "ColummChance3", "ColummChance4",
        "ColummChance5", "ColummChance6", "ColummChance7",
    },
    CashUpgrades = {},
}

local ZONES = {
    { id = "Zone1", name = "Vanney Canney" },
    { id = "Zone2", name = "Winter Wonderland" },
    { id = "Zone3", name = "Desert" },
    { id = "Zone4", name = "Forest" },
    { id = "Zone5", name = "Volcano" },
    { id = "Zone6", name = "Dead Forest" },
    { id = "Zone7", name = "Mushroom Island" },
    { id = "Zone8", name = "Atlantis" },
    { id = "Zone9", name = "Enchanted Forest" },
    { id = "Zone10", name = "Cherry Blossom" },
}

local function purchaseGroup(groupName)
    local ids = UPGRADE_GROUPS[groupName]
    if not ids then
        return
    end
    for _, id in ipairs(ids) do
        pcall(callRemote, Remotes.PurchaseUpgrade, id)
    end
end

local function purchaseSelectedUpgrades()
    if Settings.upgTarget == "All" then
        for groupName in pairs(UPGRADE_GROUPS) do
            purchaseGroup(groupName)
        end
    elseif Settings.upgTarget == "Core" then
        for _, groupName in ipairs(UPGRADE_GROUPS.Core) do
            purchaseGroup(groupName)
        end
    else
        purchaseGroup(Settings.upgTarget)
    end
end

local function progressZones()
    local unlocked = tonumber(readValue("unlockedZones", 1)) or 1
    for index = unlocked + 1, #ZONES do
        pcall(callRemote, Remotes.PurchaseZone, ZONES[index].id)
    end
    unlocked = math.min(tonumber(readValue("unlockedZones", unlocked)) or unlocked, #ZONES)
    pcall(callRemote, Remotes.SwitchZone, ZONES[unlocked].id)
end

local function useEveryPotion()
    local inventory = child(LocalPlayer, "Inventory") or child(SyncData, "Inventory")
    if not inventory then
        return
    end
    for _, item in ipairs(inventory:GetChildren()) do
        local guid = item:GetAttribute("GUID") or item.Name
        local amount = item:GetAttribute("Amount") or child(item, "Amount")
        amount = typeof(amount) == "Instance" and amount.Value or amount or 1
        pcall(callRemote, Remotes.UseItem, guid, amount)
    end
end

local function collectPotionDrops()
    local items = workspace:FindFirstChild("Items")
    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not items or not root then
        return
    end
    for _, item in ipairs(items:GetChildren()) do
        local part = item:IsA("BasePart") and item or item:FindFirstChildWhichIsA("BasePart")
        if part then
            pcall(function()
                part.CFrame = root.CFrame + Vector3.new(math.random(-2, 2), 0, math.random(-2, 2))
            end)
        end
    end
end

local hiddenEnemies = Instance.new("Folder")
hiddenEnemies.Name = "_RTDHiddenEnemies"
hiddenEnemies.Parent = workspace

local function setEnemiesHidden(hidden)
    local map = workspace:FindFirstChild("Map")
    local enemies = (map and map:FindFirstChild("Enemies")) or workspace:FindFirstChild("Enemies")
    if hidden and enemies then
        for _, object in ipairs(enemies:GetChildren()) do
            if object:IsA("Model") then
                object.Parent = hiddenEnemies
            end
        end
    elseif not hidden and enemies then
        for _, object in ipairs(hiddenEnemies:GetChildren()) do
            object.Parent = enemies
        end
    end
end

local savedGuiStates = {}
local function setGameGuisHidden(hidden)
    local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        return
    end
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name ~= "Cmdr" and gui.Name ~= "RTD_v12" then
            if hidden then
                savedGuiStates[gui] = gui.Enabled
                gui.Enabled = false
            elseif savedGuiStates[gui] ~= nil then
                gui.Enabled = savedGuiStates[gui]
            end
        end
    end
end

local function setCutscenesHidden(hidden)
    local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local blackout = playerGui and playerGui:FindFirstChild("CutsceneBlackout", true)
    if blackout and blackout:IsA("GuiObject") then
        blackout.Visible = not hidden
    end
end

LocalPlayer.Idled:Connect(function()
    if Settings.antiAfk then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        if Settings.manualRoll then
            pcall(callRemote, Remotes.RollRequest)
        end
        if Settings.autoPotions then
            useEveryPotion()
        end
        if Settings.autoCollectPotions then
            collectPotionDrops()
        end
        if Settings.autoUpgrades then
            purchaseSelectedUpgrades()
        end
        if Settings.autoProgression then
            progressZones()
        end
        if Settings.autoRebirth then
            pcall(callRemote, Remotes.RequestRebirth)
        end
        if Settings.equipBest then
            pcall(callRemote, Remotes.EquipBest)
        end
        if Settings.autoClaimIndex then
            for _, indexName in ipairs({ "Units", "Rolls", "Enemies", "Upgrades" }) do
                pcall(callRemote, Remotes.ClaimIndexReward, indexName)
            end
        end
    end
end)

local Window = WindUI:CreateWindow({
    Title = "Roll To Defend",
    Icon = "dices",
    Author = "Best Script",
    Folder = "RTD",
    Size = UDim2.fromOffset(540, 420),
    MinSize = Vector2.new(540, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    ToggleKey = Enum.KeyCode.K,
    HideSearchBar = true,
    KeySystem = {
        Key = { "d605afbc433611b731e6d1d6a3ce07b0" },
        Note = "Enter your key to continue",
        URL = "",
        SaveKey = true,
    },
})

local function addToggle(tab, title, description, flag, icon, onChanged)
    tab:Toggle({
        Title = title,
        Desc = description,
        Value = Settings[flag],
        Callback = function(value)
            Settings[flag] = value
            if onChanged then
                onChanged(value)
            end
            notify(title, value, icon)
        end,
    })
end

local rollingTab = Window:Tab({ Title = "Rolling", Icon = "dices" })
addToggle(rollingTab, "Auto Roll", "Toggles Auto Roll", "autoRoll", "Sky", function(value)
    pcall(callRemote, Remotes.AutoRollState, value)
end)
addToggle(rollingTab, "Manual Roll", "Fires RollRequest every 0.3s as fallback", "manualRoll", "refresh-cw")

local collectionTab = Window:Tab({ Title = "Collection", Icon = "backpack" })
addToggle(collectionTab, "Auto Use Potions", "Uses ALL potions every tick", "autoPotions", "flask")
addToggle(collectionTab, "Auto Collect Drops", "Collects potion drops from anywhere", "autoCollectPotions", "gift")

local upgradesTab = Window:Tab({ Title = "All Upgrades", Icon = "arrow-up-wide-narrow" })
upgradesTab:Dropdown({
    Title = "Upgrades",
    Values = { "All", "Core", "EnemyCount", "SpawnSpeed", "Brain", "Boss", "Rolls", "Luck", "Units", "CashUpgrades", "RollUpgrades" },
    Value = "All",
    Callback = function(value)
        Settings.upgTarget = value
    end,
})
addToggle(upgradesTab, "Auto Upgrades", "Purchases the selected upgrade group", "autoUpgrades", "zap")
addToggle(upgradesTab, "Auto Progression", "Buys all zones and switches (rebirth-aware)", "autoProgression", "map")
addToggle(upgradesTab, "Auto Rebirth", "Rebirths when possible", "autoRebirth", "rotate-ccw")
addToggle(upgradesTab, "Auto Equip Best", "Equips best units", "equipBest", "sword")
addToggle(upgradesTab, "Auto Claim Index", "Claims all index tabs", "autoClaimIndex", "gift")

local utilitiesTab = Window:Tab({ Title = "Utilities", Icon = "settings" })
addToggle(utilitiesTab, "Anti AFK", "Idle bypass", "antiAfk", "person-standing")
addToggle(utilitiesTab, "Hide GUIs", "Hides game UI", "hideGuis", "eye-off", setGameGuisHidden)
addToggle(utilitiesTab, "Hide Cutscenes", "Disables rare roll cutscenes", "hideCutscenes", "film", setCutscenesHidden)
addToggle(utilitiesTab, "Hide Enemies", "Hides enemy models", "hideEnemies", "skull", setEnemiesHidden)
utilitiesTab:Dropdown({
    Title = "Theme",
    Desc = "Change UI color scheme",
    Values = { "Dark", "Light", "Red", "Rose", "Indigo", "Violet", "Amber" },
    Value = "Dark",
    Callback = function(value)
        Window:SetTheme(value)
    end,
})

WindUI:Notify({
    Title = "RTD",
    Content = "Press K to toggle UI",
    Icon = "keyboard",
})
print("[RTD] Loaded â K toggles")
