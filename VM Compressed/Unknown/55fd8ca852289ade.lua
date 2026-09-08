--[[
    SPYMM v8.3 - Obsidian UI
    Survive the Apocalypse
]]

-- ============================================
-- SERVICES
-- ============================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")  -- [ADDED v7.3] For Server Hop/Rejoin
local HttpService = game:GetService("HttpService")  -- [ADDED v7.3] For Server Hop API requests

-- ============================================
-- REMOTES (Comprehensive from ReplicatedStorage)
-- ============================================
local Remotes = ReplicatedStorage:FindFirstChild("Remotes")

local pickUpItemRemote = Remotes and Remotes:FindFirstChild("Interaction") and Remotes.Interaction:FindFirstChild("PickUpItem")
local placeStructureRemote = Remotes and Remotes:FindFirstChild("Building") and Remotes.Building:FindFirstChild("PlaceStructure")
local buyItemRemote = Remotes and Remotes:FindFirstChild("Merchant") and Remotes.Merchant:FindFirstChild("BuyItem")
local addSuppressorRemote = Remotes and Remotes:FindFirstChild("Tools") and Remotes.Tools:FindFirstChild("AddSuppressor")
local adjustBackpackRemote = Remotes and Remotes:FindFirstChild("Tools") and Remotes.Tools:FindFirstChild("AdjustBackpack")
local resetRemote = Remotes and Remotes:FindFirstChild("Misc") and Remotes.Misc:FindFirstChild("Reset")


-- ============================================
-- OBSIDIAN UI SETUP
-- ============================================
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "SPYMM v8.3",
    Footer = "Survive the Apocalypse",
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Visuals = Window:AddTab("Visuals", "eye"),
    Player = Window:AddTab("Player", "user"),
    Combat = Window:AddTab("Combat", "swords"),
    Exploits = Window:AddTab("Exploits", "zap"),
    Misc = Window:AddTab("Misc", "settings"),
    ["UI Settings"] = Window:AddTab("UI Settings", "sliders-horizontal"),
}

-- ============================================
-- STATE VARIABLES
-- ============================================
local connections = {}
local mobESPInstances = {}
local playerESPInstances = {}
local structureESPInstances = {}
local antiAFKConn = nil
local autoSprintActive = false
local killAuraConn = nil
local aimbotConn = nil  -- Aimbot connection for RenderStepped
local aimbotTarget = nil  -- Current aimbot target for visualization
local fovCircle = nil              -- [ADDED v7.3.3] FOV Circle Drawing object for Aimbot
local killAuraIndicatorLine   = nil  -- [ADDED v7.3.3] Kill Aura snapline to current target
local killAuraIndicatorCircle = nil  -- [ADDED v7.3.3] Kill Aura circle on current target
-- Remove Fog state managed by enableRemoveFog/disableRemoveFog
-- repairAura state managed by startRepairAura/stopRepairAura
local repairAuraConn = nil

local originalLighting = { stored = false }
local originalFog = { stored = false }

local mobOptions = { ESP = false, Chams = false, Name = false, Distance = false }
local playerESPVars = { ESP = false, Chams = false, Name = false, Distance = false, Health = false }
local structureESPVars = { ESP = false, Chams = false, Name = false, Distance = false }
local bhopActive = false  -- [ADDED v7.3] Bunny Hop state
local bhopConn = nil  -- [ADDED v7.3] Bunny Hop connection
-- [REMOVED v7.3.1] No Stamina Drain - game uses hunger, not stamina
local remoteSpyEnabled = false  -- [ADDED v7.3] Remote Spy state
local remoteSpyLogs = {}  -- [ADDED v7.3] Remote call logs

local mobNames = {"Runner", "Crawler", "Riot", "Zombie", "Brute", "Spitter", "Boss"}

-- ============================================
-- GLOBAL ESP CONFIG (driven by UI sliders, shared by all ESP systems)
-- ============================================
local espConfig = {
    textSize            = 10,   -- ESP Text Size slider
    fillTransparency    = 0.4,  -- Fill Transparency slider
    outlineTransparency = 0.0,  -- Outline Transparency slider
}

-- ============================================
-- ITEM CATEGORIES & COLOR DEFINITIONS
-- [CHANGED] Each ESP type now has its own dedicated color
-- ============================================
local espDefinitions = {
    {
        key = "Gun",
        displayName = "Gun ESP",
        icon = "crosshair",
        items = {
            "AA-12", "AK-47", "Assault Rifle", "Desert Eagle", "Double Barrel",
            "Flamethrower", "Grenade Launcher", "LMG", "MediGun", "Pistol",
            "Ray Gun", "Revolver", "Rifle", "Shotgun", "Sniper", "SVD", "Uzi"
        },
        colors = { fill = Color3.fromRGB(255, 30,  30),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(255, 120, 120) },
    },
    {
        key = "Melee",
        displayName = "Melee ESP",
        icon = "swords",
        items = {
            "Bat", "Chainsaw", "Crowbar", "Fire Axe", "Hatchet", "Katana", "Knife",
            "Riot Shield", "Scythe", "Sledgehammer", "Spear", "Spiked Bat"
        },
        colors = { fill = Color3.fromRGB(255, 140,  0),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(255, 200, 100) },
    },
    {
        key = "Medical",
        displayName = "Medical ESP",
        icon = "heart-pulse",
        items = {
            "Bandage", "Compound H", "Compound I", "Compound R", "Compound S", "Medkit"
        },
        colors = { fill = Color3.fromRGB(  0, 255,  80),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(150, 255, 150) },
    },
    {
        key = "Armor",
        displayName = "Armor ESP",
        icon = "shield",
        items = {
            "Power Armor", "Light Armor", "Medium Armor", "Heavy Armor"
        },
        colors = { fill = Color3.fromRGB(  0, 100, 255),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(160, 200, 255) },
    },
    {
        key = "Food",
        displayName = "Food ESP",
        icon = "utensils",
        items = {
            "Chips", "Carrot", "Bloxiade", "Beans", "MRE", "Bloxy Cola"
        },
        colors = { fill = Color3.fromRGB(190, 255,   0),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(210, 255, 150) },
    },
    {
        key = "Resource",
        displayName = "Resources ESP",
        icon = "box",
        items = {
            "AC", "Battery", "Battery Pack", "Bucket", "Dumbell", "Exhaust Pipe",
            "Reactor Component", "Refined Metal", "Satellite Dish", "Scrap",
            "Screws", "Spatula", "Tray", "TV", "Watch", "Zombie Heart"
        },
        colors = { fill = Color3.fromRGB(  0, 220, 255),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(180, 240, 255) },
    },
    {
        key = "Fuel",
        displayName = "Fuel ESP",
        icon = "zap",
        items = { "Nuclear Fuel", "Refined Fuel", "Fuel" },
        colors = { fill = Color3.fromRGB(255, 220,   0),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(255, 240, 160) },
    },
    {
        key = "Ability",
        displayName = "Abilities ESP",
        icon = "zap-circle",
        items = {
            "Airstrike", "Attack Order", "Call of the Dead",
            "Summon Brute", "Summon Zombies", "Taunt",
            "The Future", "The Past", "The Present"
        },
        colors = { fill = Color3.fromRGB(180,  0, 255),  outline = Color3.fromRGB(255, 255, 255), text = Color3.fromRGB(220, 150, 255) },
    },
}

-- Build per-ESP state tables, instance tables, and item lookups
local espSystems = {} -- Master table holding all ESP system data and functions

for _, def in ipairs(espDefinitions) do
    local sys = {
        key = def.key,
        displayName = def.displayName,
        colors = def.colors,
        items = def.items,
        itemList = {}, -- fast lookup set
        vars = { ESP = false, Chams = false, Name = false, Distance = false },
        instances = {},
        listenersSetup = false,
    }
    for _, name in ipairs(def.items) do
        sys.itemList[name] = true
    end
    espSystems[def.key] = sys
end

-- Build flat itemNames from all ESP categories (used for BringPickupItem filter)
local itemNames = {}
local itemCategoryLookup = {}
for _, def in ipairs(espDefinitions) do
    for _, itemName in ipairs(def.items) do
        table.insert(itemNames, itemName)
        itemCategoryLookup[itemName] = def.key
    end
end
-- Add extra categories not covered by dedicated ESP (still usable in BringPickupItem / Teleport)
local extraItemCategories = {
    Ammo = { "Ammo Box", "Long Ammo", "Medium Ammo", "Pistol Ammo", "Shells" },
    Structures = {
        "Ammo Crate", "Barbed Wire", "Bear Trap", "Boost Pad", "Electric Fence",
        "Farm Plot", "Fence", "Floodlight", "Gate", "Landmine", "Map",
        "Repair Drone", "Shelf", "Teleporter", "Time Machine", "Turret",
        "Wall", "Watchtower"
    },
    Consumables = { "Grenade", "Molotov" },
    Backpacks = { "Basic Backpack", "Good Backpack", "Great Backpack" },
    MiscItems = {
        "Emerald", "Gas Mask", "Power Armor Arm", "Power Armor Core",
        "Radio Tower Part", "Blueprint", "Military Keycard", "Repair Hammer", "Suppressor"
    },
}
for catName, catItems in pairs(extraItemCategories) do
    for _, itemName in ipairs(catItems) do
        table.insert(itemNames, itemName)
        itemCategoryLookup[itemName] = catName
    end
end
table.sort(itemNames)

-- Bring Pickup Item set (E-key: Guns, Melee, Medical, Armor, Ammo, Structures, Tools)
local pickupItemSet = {
    ["Ammo Box"]=true,["Long Ammo"]=true,["Medium Ammo"]=true,["Shells"]=true,["Pistol Ammo"]=true,
    ["Power Armor"]=true,["Light Armor"]=true,["Medium Armor"]=true,["Heavy Armor"]=true,
    ["Emerald"]=true,["Gas Mask"]=true,
    ["Ammo Crate"]=true,["Barbed Wire"]=true,["Bear Trap"]=true,["Boost Pad"]=true,
    ["Electric Fence"]=true,["Farm Plot"]=true,["Fence"]=true,["Floodlight"]=true,
    ["Gate"]=true,["Landmine"]=true,["Map"]=true,["Repair Drone"]=true,["Shelf"]=true,
    ["Teleporter"]=true,["Time Machine"]=true,["Turret"]=true,["Wall"]=true,["Watchtower"]=true,
    ["Basic Backpack"]=true,["Good Backpack"]=true,["Great Backpack"]=true,
    ["Grenade"]=true,["Molotov"]=true,
    ["AA-12"]=true,["AK-47"]=true,["Assault Rifle"]=true,["Desert Eagle"]=true,
    ["Double Barrel"]=true,["Flamethrower"]=true,["Grenade Launcher"]=true,["LMG"]=true,
    ["MediGun"]=true,["Pistol"]=true,["Ray Gun"]=true,["Revolver"]=true,["Rifle"]=true,
    ["Shotgun"]=true,["Sniper"]=true,["SVD"]=true,["Uzi"]=true,
    ["Bandage"]=true,["Compound H"]=true,["Compound I"]=true,["Compound R"]=true,
    ["Compound S"]=true,["Medkit"]=true,
    ["Bat"]=true,["Chainsaw"]=true,["Crowbar"]=true,["Fire Axe"]=true,["Hatchet"]=true,
    ["Katana"]=true,["Knife"]=true,["Riot Shield"]=true,["Scythe"]=true,
    ["Sledgehammer"]=true,["Spear"]=true,["Spiked Bat"]=true,
    ["Blueprint"]=true,["Military Keycard"]=true,["Repair Hammer"]=true,["Suppressor"]=true,
}
local pickupItemNames = {}
for k in pairs(pickupItemSet) do table.insert(pickupItemNames, k) end
table.sort(pickupItemNames)

local structureNames = {
    "Ammo Crate", "Barbed Wire", "Bear Trap", "Boost Pad", "Electric Fence",
    "Farm Plot", "Fence", "Floodlight", "Gate", "Landmine", "Map", "Repair Drone",
    "Shelf", "Teleporter", "Time Machine", "Turret", "Wall", "Watchtower"
}

-- ============================================
-- DYNAMIC FOLDER DISCOVERY
-- ============================================
local charactersFolder = nil
local droppedItemsFolder = nil
local structuresFolder = nil
local mobListenersSetup = false
local structureListenersSetup = false

local function discoverFolders()
    charactersFolder = Workspace:FindFirstChild("Characters")
    droppedItemsFolder = Workspace:FindFirstChild("DroppedItems")
    structuresFolder = Workspace:FindFirstChild("Structures")
        or Workspace:FindFirstChild("PlayerStructures")
        or Workspace:FindFirstChild("Buildings")
end
discoverFolders()

task.spawn(function()
    while not Library.Unloaded do
        task.wait(5)
        local prevChars = charactersFolder
        local prevItems = droppedItemsFolder
        local prevStructs = structuresFolder
        discoverFolders()
        if charactersFolder ~= prevChars and charactersFolder then
            refreshMobESP()
            if not mobListenersSetup then setupMobListeners() end
        end
        if droppedItemsFolder ~= prevItems and droppedItemsFolder then
            for _, sys in pairs(espSystems) do
                sys.refresh()
            end
            for _, sys in pairs(espSystems) do
                if not sys.listenersSetup then sys.setupListeners() end
            end
        end
        if structuresFolder ~= prevStructs and structuresFolder then
            refreshStructureESP()
            if not structureListenersSetup then setupStructureListeners() end
        end
    end
end)

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function getItemMainPart(item)
    if item.PrimaryPart then return item.PrimaryPart end
    for _, child in ipairs(item:GetChildren()) do
        if child:IsA("BasePart") then
            return child
        end
    end
    return nil
end

-- ============================================
-- SHARED ESP HELPERS
-- ============================================
local function getDistanceColor(dist)
    if dist > 250 then return Color3.fromRGB(255, 80, 80)
    elseif dist > 150 then return Color3.fromRGB(255, 180, 80)
    elseif dist > 100 then return Color3.fromRGB(255, 255, 80)
    else return Color3.fromRGB(220, 220, 220) end
end

local function getHealthColor(pct)
    if pct > 0.6 then return Color3.fromRGB(80, 255, 80)
    elseif pct > 0.3 then return Color3.fromRGB(255, 230, 50)
    else return Color3.fromRGB(255, 60, 60) end
end

local function createHealthBar(parent, height, width, position)
    local bg = Instance.new("Frame")
    bg.Name = "HealthBarBG"
    bg.Size = UDim2.new(width, 0, height, 0)
    bg.Position = position
    bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    bg.BackgroundTransparency = 0.2
    bg.BorderSizePixel = 0
    bg.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 3)
    corner.Parent = bg

    local fill = Instance.new("Frame")
    fill.Name = "HealthBarFill"
    fill.Size = UDim2.new(1, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
    fill.BorderSizePixel = 0
    fill.Parent = bg

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = fill

    return bg, fill
end

local function updateHealthBar(fill, pct, color)
    fill.Size = UDim2.new(math.clamp(pct, 0, 1), 0, 1, 0)
    fill.BackgroundColor3 = color
end

local function createTextBG(parent, size, position)
    local bg = Instance.new("Frame")
    bg.Name = "TextBG"
    bg.Size = size
    bg.Position = position
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.5
    bg.BorderSizePixel = 0
    bg.ZIndex = -1
    bg.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = bg
    return bg
end

local MOB_RED = { fill = Color3.fromRGB(255, 30, 30), outline = Color3.fromRGB(255, 120, 120) }
local mobTypeColors = {
    Zombie  = MOB_RED, Runner  = MOB_RED, Crawler = MOB_RED,
    Brute   = MOB_RED, Spitter = MOB_RED, Riot    = MOB_RED, Boss = MOB_RED,
}

-- ============================================
-- GENERIC ITEM ESP FACTORY
-- [ADDED] Creates create/remove/refresh/setupListeners functions per ESP system
-- This eliminates code duplication across all 6 category ESPs
-- ============================================
local function createCategoryESP(sys, item)
    if not item:IsA("Model") then return end
    if sys.instances[item] then return end

    local mainPart = getItemMainPart(item)
    if not mainPart then return end

    -- MainPart stored at top level so the always-on connection can access it
    local espTable = { MainPart = mainPart }

    if sys.vars.Chams then
        local highlight = Instance.new("Highlight")
        highlight.Name = sys.key .. "ESP_Highlight"
        highlight.Adornee = item
        highlight.FillColor = sys.colors.fill
        highlight.FillTransparency = espConfig.fillTransparency
        highlight.OutlineColor = sys.colors.outline
        highlight.OutlineTransparency = espConfig.outlineTransparency
        highlight.Parent = item
        espTable.Highlight = highlight
    end

    if sys.vars.Name or sys.vars.Distance then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = sys.key .. "ESP_NameDistance"
        billboard.Adornee = mainPart
        billboard.Size = UDim2.new(0, 220, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = item

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "[" .. sys.key .. "] " .. item.Name
        nameLabel.TextColor3 = sys.colors.text
        nameLabel.TextStrokeTransparency = 0.2
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = espConfig.textSize
        nameLabel.Visible = sys.vars.Name
        nameLabel.Parent = frame

        local distLabel = Instance.new("TextLabel")
        distLabel.Name = "DistLabel"
        distLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distLabel.Position = UDim2.new(0, 0, 0.5, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        distLabel.TextStrokeTransparency = 0.2
        distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLabel.Font = Enum.Font.GothamBold
        distLabel.TextSize = math.max(espConfig.textSize - 2, 8)
        distLabel.Visible = sys.vars.Distance
        distLabel.Parent = frame

        espTable.Billboard = billboard
        espTable.NameLabel = nameLabel
        espTable.DistLabel = distLabel
    end

    -- [FIX] Always-on Heartbeat connection:
    --   * distance culling works even when Name/Distance labels are hidden
    --   * auto-restores Highlight if destroyed by the game engine
    --   * self-cleans when the item is removed from the world
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not item or not item.Parent then
            connection:Disconnect()
            return
        end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
        if not myRoot then return end
        local dist = (myRoot.Position - mainPart.Position).Magnitude
        local maxDist = Options and Options.ESPMaxDistance and Options.ESPMaxDistance.Value or 99999
        local visible = dist <= maxDist
        -- Auto-restore highlight if destroyed by the game
        if sys.vars.Chams and (not espTable.Highlight or not espTable.Highlight.Parent) then
            local h = Instance.new("Highlight")
            h.Name = sys.key .. "ESP_Highlight"
            h.Adornee = item
            h.FillColor = sys.colors.fill
            h.FillTransparency = espConfig.fillTransparency
            h.OutlineColor = sys.colors.outline
            h.OutlineTransparency = espConfig.outlineTransparency
            h.Enabled = visible
            h.Parent = item
            espTable.Highlight = h
        elseif espTable.Highlight and espTable.Highlight.Parent then
            espTable.Highlight.Enabled = visible
        end
        if espTable.Billboard and espTable.Billboard.Parent then
            espTable.Billboard.Enabled = visible
            if espTable.DistLabel and sys.vars.Distance then
                espTable.DistLabel.Text = math.floor(dist) .. "m"
                espTable.DistLabel.TextColor3 = getDistanceColor(dist)
            end
        end
    end)
    espTable.DistanceConnection = connection
    -- Not inserted into global connections table; self-disconnects via item.Parent check

    sys.instances[item] = espTable
end

local function removeCategoryESP(sys, item)
    local esp = sys.instances[item]
    if esp then
        if esp.Highlight then esp.Highlight:Destroy() end
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.DistanceConnection then esp.DistanceConnection:Disconnect() end
        sys.instances[item] = nil
    end
end

local function refreshCategoryESP(sys)
    for item, _ in pairs(sys.instances) do
        removeCategoryESP(sys, item)
    end
    if not sys.vars.ESP then return end
    if not droppedItemsFolder then return end
    for _, child in ipairs(droppedItemsFolder:GetChildren()) do
        if sys.itemList[child.Name] then
            createCategoryESP(sys, child)
        end
    end
end

local function setupCategoryListeners(sys)
    if not droppedItemsFolder or sys.listenersSetup then return end
    sys.listenersSetup = true
    local addedConn = droppedItemsFolder.ChildAdded:Connect(function(child)
        if sys.vars.ESP and sys.itemList[child.Name] then
            task.wait(0.2)  -- [FIX] Wait for item model/PrimaryPart to replicate
            createCategoryESP(sys, child)
        end
    end)
    table.insert(connections, addedConn)
    local removedConn = droppedItemsFolder.ChildRemoved:Connect(function(child)
        removeCategoryESP(sys, child)
    end)
    table.insert(connections, removedConn)
end

-- Wire up factory functions to each ESP system
for _, sys in pairs(espSystems) do
    sys.create = function(item) createCategoryESP(sys, item) end
    sys.remove = function(item) removeCategoryESP(sys, item) end
    sys.refresh = function() refreshCategoryESP(sys) end
    sys.setupListeners = function() setupCategoryListeners(sys) end
end

-- Set up all category listeners immediately (will also retry on folder discovery)
for _, sys in pairs(espSystems) do
    setupCategoryListeners(sys)
end

-- ============================================
-- MOB ESP FUNCTIONS
-- ============================================
local function removeMobESP(char)
    local esp = mobESPInstances[char]
    if esp then
        if esp.Highlight then esp.Highlight:Destroy() end
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.DistanceConnection then esp.DistanceConnection:Disconnect() end
        mobESPInstances[char] = nil
    end
end

local function createMobESP(char)
    if not char:IsA("Model") then return end
    if mobESPInstances[char] then return end

    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    if not root then return end

    local espTable = { Root = root }
    local mobColors = mobTypeColors[char.Name] or {fill = Color3.fromRGB(220, 0, 0), outline = Color3.fromRGB(255, 185, 185)}

    if mobOptions.Chams then
        local highlight = Instance.new("Highlight")
        highlight.Name = "MobESP_Highlight"
        highlight.Adornee = char
        highlight.FillColor = mobColors.fill
        highlight.FillTransparency = espConfig.fillTransparency
        highlight.OutlineColor = mobColors.outline
        highlight.OutlineTransparency = espConfig.outlineTransparency
        highlight.Parent = char
        espTable.Highlight = highlight
    end

    -- Hoist billboard vars so always-on connection can access them
    local billboard, nameLabel, distLabel
    if mobOptions.Name or mobOptions.Distance then
        billboard = Instance.new("BillboardGui")
        billboard.Name = "MobESP_NameDistance"
        billboard.Adornee = root
        billboard.Size = UDim2.new(0, 220, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = char

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = char.Name
        nameLabel.TextColor3 = mobColors.outline
        nameLabel.TextStrokeTransparency = 0.2
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = espConfig.textSize
        nameLabel.Visible = mobOptions.Name
        nameLabel.Parent = frame

        distLabel = Instance.new("TextLabel")
        distLabel.Name = "DistLabel"
        distLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distLabel.Position = UDim2.new(0, 0, 0.5, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        distLabel.TextStrokeTransparency = 0.2
        distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLabel.Font = Enum.Font.GothamBold
        distLabel.TextSize = math.max(espConfig.textSize - 2, 8)
        distLabel.Visible = mobOptions.Distance
        distLabel.Parent = frame

        espTable.Billboard = billboard
        espTable.NameLabel = nameLabel
        espTable.DistLabel = distLabel
    end

    -- [FIX] Always-on connection: culls by distance regardless of label visibility,
    --       auto-restores Highlights destroyed by the server, self-cleans on mob death
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not char or not char.Parent then
            connection:Disconnect()
            return
        end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
        if not myRoot then return end
        local dist = (myRoot.Position - root.Position).Magnitude
        local maxDist = Options and Options.ESPMaxDistance and Options.ESPMaxDistance.Value or 99999
        local visible = dist <= maxDist
        local mc = mobTypeColors[char.Name] or {fill = Color3.fromRGB(220, 0, 0), outline = Color3.fromRGB(255, 185, 185)}
        if mobOptions.Chams and (not espTable.Highlight or not espTable.Highlight.Parent) then
            local h = Instance.new("Highlight")
            h.Name = "MobESP_Highlight"
            h.Adornee = char
            h.FillColor = mc.fill
            h.FillTransparency = espConfig.fillTransparency
            h.OutlineColor = mc.outline
            h.OutlineTransparency = espConfig.outlineTransparency
            h.Enabled = visible
            h.Parent = char
            espTable.Highlight = h
        elseif espTable.Highlight and espTable.Highlight.Parent then
            espTable.Highlight.Enabled = visible
        end
        if billboard and billboard.Parent then
            billboard.Enabled = visible
            if nameLabel and mobOptions.Name then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    nameLabel.Text = char.Name .. " [" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "]"
                end
            end
            if distLabel and mobOptions.Distance then
                distLabel.Text = math.floor(dist) .. "m"
                distLabel.TextColor3 = getDistanceColor(dist)
            end
        end
    end)
    espTable.DistanceConnection = connection
    table.insert(connections, connection)

    mobESPInstances[char] = espTable
end

local function refreshMobESP()
    for char, _ in pairs(mobESPInstances) do
        removeMobESP(char)
    end
    if not mobOptions.ESP then return end
    if not charactersFolder then
        Library:Notify({ Title = "Mob ESP", Description = "Characters folder not found (retrying...)", Time = 3 })
        return
    end
    -- Build player char set to exclude real players (same logic as Kill Aura)
    local playerCharSet = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then playerCharSet[p.Character] = true end
    end
    for _, child in ipairs(charactersFolder:GetChildren()) do
        if child:IsA("Model") and not playerCharSet[child] then
            createMobESP(child)
        end
    end
end

-- ============================================
-- STRUCTURE ESP FUNCTIONS
-- ============================================
local function removeStructureESP(structure)
    local esp = structureESPInstances[structure]
    if esp then
        if esp.Highlight then esp.Highlight:Destroy() end
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.DistanceConnection then esp.DistanceConnection:Disconnect() end
        structureESPInstances[structure] = nil
    end
end

local function createStructureESP(structure)
    if not structure:IsA("Model") then return end
    if structureESPInstances[structure] then return end

    local mainPart = structure.PrimaryPart or getItemMainPart(structure)
    if not mainPart then return end

    local espTable = { MainPart = mainPart }

    if structureESPVars.Chams then
        local highlight = Instance.new("Highlight")
        highlight.Name = "StructESP_Highlight"
        highlight.Adornee = structure
        highlight.FillColor = Color3.fromRGB(0, 200, 150)
        highlight.FillTransparency = espConfig.fillTransparency
        highlight.OutlineColor = Color3.fromRGB(100, 255, 200)
        highlight.OutlineTransparency = espConfig.outlineTransparency
        highlight.Parent = structure
        espTable.Highlight = highlight
    end

    local billboard, nameLabel, distLabel
    if structureESPVars.Name or structureESPVars.Distance then
        billboard = Instance.new("BillboardGui")
        billboard.Name = "StructESP_Info"
        billboard.Adornee = mainPart
        billboard.Size = UDim2.new(0, 250, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = structure

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "[STRUCTURE] " .. structure.Name
        nameLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
        nameLabel.TextStrokeTransparency = 0.2
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = espConfig.textSize
        nameLabel.Visible = structureESPVars.Name
        nameLabel.Parent = frame

        distLabel = Instance.new("TextLabel")
        distLabel.Name = "DistLabel"
        distLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distLabel.Position = UDim2.new(0, 0, 0.5, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(200, 220, 220)
        distLabel.TextStrokeTransparency = 0.2
        distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLabel.Font = Enum.Font.GothamBold
        distLabel.TextSize = math.max(espConfig.textSize - 2, 8)
        distLabel.Visible = structureESPVars.Distance
        distLabel.Parent = frame

        espTable.Billboard = billboard
        espTable.NameLabel = nameLabel
        espTable.DistLabel = distLabel
    end

    -- [FIX] Always-on connection for distance culling + highlight restoration
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not structure or not structure.Parent then
            connection:Disconnect()
            return
        end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
        if not myRoot then return end
        local dist = (myRoot.Position - mainPart.Position).Magnitude
        local maxDist = Options and Options.ESPMaxDistance and Options.ESPMaxDistance.Value or 99999
        local visible = dist <= maxDist
        if structureESPVars.Chams and (not espTable.Highlight or not espTable.Highlight.Parent) then
            local h = Instance.new("Highlight")
            h.Name = "StructESP_Highlight"
            h.Adornee = structure
            h.FillColor = Color3.fromRGB(0, 200, 150)
            h.FillTransparency = espConfig.fillTransparency
            h.OutlineColor = Color3.fromRGB(100, 255, 200)
            h.OutlineTransparency = espConfig.outlineTransparency
            h.Enabled = visible
            h.Parent = structure
            espTable.Highlight = h
        elseif espTable.Highlight and espTable.Highlight.Parent then
            espTable.Highlight.Enabled = visible
        end
        if billboard and billboard.Parent then
            billboard.Enabled = visible
            if distLabel and structureESPVars.Distance then
                distLabel.Text = math.floor(dist) .. "m"
                distLabel.TextColor3 = getDistanceColor(dist)
            end
        end
    end)
    espTable.DistanceConnection = connection
    table.insert(connections, connection)

    structureESPInstances[structure] = espTable
end

local function refreshStructureESP()
    for structure, _ in pairs(structureESPInstances) do
        removeStructureESP(structure)
    end
    if not structureESPVars.ESP then return end
    if not structuresFolder then
        Library:Notify({ Title = "Structure ESP", Description = "Structures folder not found (retrying...)", Time = 3 })
        return
    end
    for _, child in ipairs(structuresFolder:GetDescendants()) do
        if child:IsA("Model") and table.find(structureNames, child.Name) then
            createStructureESP(child)
        end
    end
end

-- ============================================
-- PLAYER ESP FUNCTIONS
-- ============================================
local function removePlayerESP(player)
    local esp = playerESPInstances[player]
    if esp then
        if esp.Highlight then esp.Highlight:Destroy() end
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.DistanceConnection then esp.DistanceConnection:Disconnect() end
        if esp.CharAddedConn then esp.CharAddedConn:Disconnect() end
        playerESPInstances[player] = nil
    end
end

local function createPlayerESP(player)
    if player == LocalPlayer then return end
    if playerESPInstances[player] then return end

    local char = player.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local espTable = {}

    if playerESPVars.Chams then
        local highlight = Instance.new("Highlight")
        highlight.Name = "PlayerESP_Highlight"
        highlight.Adornee = char
        highlight.FillColor = Color3.fromRGB(0, 100, 255)
        highlight.FillTransparency = espConfig.fillTransparency
        highlight.OutlineColor = Color3.fromRGB(100, 180, 255)
        highlight.OutlineTransparency = espConfig.outlineTransparency
        highlight.Parent = char
        espTable.Highlight = highlight
    end

    -- Hoist so always-on connection can reference them after the block
    local billboard, nameLabel, toolLabel, healthLabel, distLabel
    if playerESPVars.Name or playerESPVars.Distance or playerESPVars.Health then
        billboard = Instance.new("BillboardGui")
        billboard.Name = "PlayerESP_Info"
        billboard.Adornee = root
        billboard.Size = UDim2.new(0, 220, 0, 70)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = char

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.DisplayName .. " (@" .. player.Name .. ")"
        nameLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
        nameLabel.TextStrokeTransparency = 0.2
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = espConfig.textSize
        nameLabel.Visible = playerESPVars.Name
        nameLabel.Parent = frame

        toolLabel = Instance.new("TextLabel")
        toolLabel.Name = "ToolLabel"
        toolLabel.Size = UDim2.new(1, 0, 0.25, 0)
        toolLabel.Position = UDim2.new(0, 0, 0.3, 0)
        toolLabel.BackgroundTransparency = 1
        toolLabel.Text = ""
        toolLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
        toolLabel.TextStrokeTransparency = 0.2
        toolLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        toolLabel.Font = Enum.Font.Gotham
        toolLabel.TextSize = math.max(espConfig.textSize - 2, 8)
        toolLabel.Visible = playerESPVars.Name
        toolLabel.Parent = frame

        healthLabel = Instance.new("TextLabel")
        healthLabel.Name = "HealthLabel"
        healthLabel.Size = UDim2.new(1, 0, 0.2, 0)
        healthLabel.Position = UDim2.new(0, 0, 0.55, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.Text = "100 HP"
        healthLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        healthLabel.TextStrokeTransparency = 0.2
        healthLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        healthLabel.Font = Enum.Font.GothamBold
        healthLabel.TextSize = math.max(espConfig.textSize - 2, 8)
        healthLabel.Visible = playerESPVars.Health
        healthLabel.Parent = frame

        distLabel = Instance.new("TextLabel")
        distLabel.Name = "DistLabel"
        distLabel.Size = UDim2.new(1, 0, 0.2, 0)
        distLabel.Position = UDim2.new(0, 0, 0.78, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        distLabel.TextStrokeTransparency = 0.2
        distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLabel.Font = Enum.Font.GothamBold
        distLabel.TextSize = math.max(espConfig.textSize - 2, 8)
        distLabel.Visible = playerESPVars.Distance
        distLabel.Parent = frame

        espTable.Billboard = billboard
        espTable.NameLabel = nameLabel
        espTable.ToolLabel = toolLabel
        espTable.HealthLabel = healthLabel
        espTable.DistLabel = distLabel
    end

    -- [FIX] Always-on connection: culls by distance regardless of which labels are
    --       enabled, auto-restores destroyed Highlight, self-cleans on player leave
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not player or not player.Parent then
            connection:Disconnect()
            return
        end
        local c = player.Character
        if not c or not c.Parent then return end
        local r = c:FindFirstChild("HumanoidRootPart")
        if not r then return end

        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        local dist = (myRoot.Position - r.Position).Magnitude
        local maxDist = Options and Options.ESPMaxDistance and Options.ESPMaxDistance.Value or 99999
        local visible = dist <= maxDist

        -- Auto-restore highlight
        if playerESPVars.Chams and (not espTable.Highlight or not espTable.Highlight.Parent) then
            local h = Instance.new("Highlight")
            h.Name = "PlayerESP_Highlight"
            h.Adornee = c
            h.FillColor = Color3.fromRGB(0, 100, 255)
            h.FillTransparency = espConfig.fillTransparency
            h.OutlineColor = Color3.fromRGB(100, 180, 255)
            h.OutlineTransparency = espConfig.outlineTransparency
            h.Parent = c
            espTable.Highlight = h
        elseif espTable.Highlight and espTable.Highlight.Parent then
            espTable.Highlight.Enabled = visible
        end

        if billboard and billboard.Parent then
            billboard.Enabled = visible
            if toolLabel and playerESPVars.Name then
                local tool = c:FindFirstChildOfClass("Tool")
                toolLabel.Text = tool and ("[ " .. tool.Name .. " ]") or ""
            end
            if healthLabel and playerESPVars.Health then
                local humanoid = c:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    healthLabel.Text = math.floor(humanoid.Health) .. " HP"
                    healthLabel.TextColor3 = getHealthColor(humanoid.Health / humanoid.MaxHealth)
                end
            end
            if distLabel and playerESPVars.Distance then
                distLabel.Text = math.floor(dist) .. "m"
                distLabel.TextColor3 = getDistanceColor(dist)
            end
        end
    end)
    espTable.DistanceConnection = connection
    table.insert(connections, connection)

    local charAddedConn = player.CharacterAdded:Connect(function()
        if playerESPVars.ESP then
            task.wait(1)
            removePlayerESP(player)
            createPlayerESP(player)
        end
    end)
    espTable.CharAddedConn = charAddedConn
    table.insert(connections, charAddedConn)

    playerESPInstances[player] = espTable
end

local function refreshPlayerESP()
    for player, _ in pairs(playerESPInstances) do
        removePlayerESP(player)
    end
    if not playerESPVars.ESP then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if player.Character then
                createPlayerESP(player)
            else
                local conn = player.CharacterAdded:Connect(function()
                    conn:Disconnect()
                    if playerESPVars.ESP then
                        task.wait(1)
                        createPlayerESP(player)
                    end
                end)
                table.insert(connections, conn)
            end
        end
    end
end

-- ============================================
-- FOLDER EVENT LISTENERS
-- ============================================
local function setupMobListeners()
    if not charactersFolder or mobListenersSetup then return end
    mobListenersSetup = true
    local childAddedConn = charactersFolder.ChildAdded:Connect(function(child)
        if mobOptions.ESP and child:IsA("Model") then
            -- Exclude real player characters
            local playerCharSet = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character then playerCharSet[p.Character] = true end
            end
            if not playerCharSet[child] then
                task.wait(0.2)  -- [FIX] Wait for HumanoidRootPart to replicate
                createMobESP(child)
            end
        end
    end)
    table.insert(connections, childAddedConn)

    local childRemovedConn = charactersFolder.ChildRemoved:Connect(function(child)
        removeMobESP(child)
    end)
    table.insert(connections, childRemovedConn)
end
setupMobListeners()

local function setupStructureListeners()
    if not structuresFolder or structureListenersSetup then return end
    structureListenersSetup = true
    local descendantAddedConn = structuresFolder.DescendantAdded:Connect(function(child)
        if structureESPVars.ESP and child:IsA("Model") and table.find(structureNames, child.Name) then
            task.wait(0.2)  -- [FIX] Wait for PrimaryPart to replicate
            createStructureESP(child)
        end
    end)
    table.insert(connections, descendantAddedConn)

    local descendantRemovingConn = structuresFolder.DescendantRemoving:Connect(function(child)
        removeStructureESP(child)
    end)
    table.insert(connections, descendantRemovingConn)
end
setupStructureListeners()

-- ============================================
-- NOCLIP (FE Bypass – prevents server rubber-band correction)
-- Heartbeat fires before physics simulation, so CanCollide = false takes effect
-- before the engine resolves collisions. Anti-rubberband detects sudden position
-- jumps (>8 studs/frame) that indicate a server correction and undoes them.
-- ============================================
local noclipLastCFrame = nil  -- anti-rubberband: tracks last known good position

local noclipConn = RunService.Heartbeat:Connect(function()
    if not Toggles.NoClip or not Toggles.NoClip.Value then
        noclipLastCFrame = nil  -- reset tracking when disabled
        return
    end
    local char = LocalPlayer.Character
    if not char then noclipLastCFrame = nil return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then noclipLastCFrame = nil return end

    -- Anti-rubberband: if server tried to correct our position (sudden >8 stud jump), undo it
    local currentCF = root.CFrame
    if noclipLastCFrame then
        local delta = (currentCF.Position - noclipLastCFrame.Position).Magnitude
        if delta > 8 then
            root.CFrame = noclipLastCFrame
            currentCF  = noclipLastCFrame
        end
    end
    noclipLastCFrame = currentCF

    -- Disable collision on all body parts before physics resolves next frame
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            part.CanCollide = false
        end
    end
end)
table.insert(connections, noclipConn)

-- ============================================
-- FULLBRIGHT
-- ============================================
local function enableFullbright()
    if not originalLighting.stored then
        originalLighting.Brightness = Lighting.Brightness
        originalLighting.Ambient = Lighting.Ambient
        originalLighting.OutdoorAmbient = Lighting.OutdoorAmbient
        originalLighting.ClockTime = Lighting.ClockTime
        originalLighting.FogEnd = Lighting.FogEnd
        originalLighting.FogStart = Lighting.FogStart
        originalLighting.GlobalShadows = Lighting.GlobalShadows
        originalLighting.stored = true
    end

    Lighting.Brightness = 2
    Lighting.Ambient = Color3.fromRGB(178, 178, 178)
    Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.FogStart = 0
    Lighting.GlobalShadows = false
end

local function disableFullbright()
    if originalLighting.stored then
        Lighting.Brightness = originalLighting.Brightness
        Lighting.Ambient = originalLighting.Ambient
        Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
        Lighting.ClockTime = originalLighting.ClockTime
        Lighting.FogEnd = originalLighting.FogEnd
        Lighting.FogStart = originalLighting.FogStart
        Lighting.GlobalShadows = originalLighting.GlobalShadows
    end
end

-- ============================================
-- AUTO SPRINT
-- [FIXED v7.3.1] Use correct SendKeyEvent signature with game object
-- ============================================
local function startAutoSprint()
    if autoSprintActive then return end
    autoSprintActive = true
    -- SendKeyEvent: (isKeyDown, keyCode, isRepeated, game)
    -- Some executors require the 4th argument
    pcall(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
    end)
end

local function stopAutoSprint()
    if not autoSprintActive then return end
    autoSprintActive = false
    pcall(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
    end)
end

-- ============================================
-- ANTI-AFK
-- ============================================
local stopAntiAFK  -- Forward declaration (defined below)

local function startAntiAFK()
    stopAntiAFK()
    antiAFKConn = LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    table.insert(connections, antiAFKConn)
end

stopAntiAFK = function()
    if antiAFKConn then
        antiAFKConn:Disconnect()
        antiAFKConn = nil
    end
end

-- ============================================
-- KILL AURA (FE Bypass - Swing/HitTargets)
-- [IMPROVED v7.3.3] Major improvements:
--                  - Target nearest monster first
--                  - Faster target updates (RenderStepped)
--                  - Auto-detect weapon swing speed
--                  - Extended range option (server-side trick)
--                  - More robust and stable with pcall wrappers
-- ============================================
local killAuraLastSwing = 0
local killAuraCurrentTarget = nil
local killAuraTargetDistance = nil

-- Weapon swing speeds (seconds between attacks)
local weaponSwingSpeeds = {
    -- Fast weapons (0.2-0.3s)
    ["Knife"] = 0.25,
    ["Katana"] = 0.3,
    ["Crowbar"] = 0.35,
    -- Medium weapons (0.4-0.5s)
    ["Bat"] = 0.45,
    ["Spiked Bat"] = 0.45,
    ["Hatchet"] = 0.4,
    ["Scythe"] = 0.4,
    ["Spear"] = 0.4,
    -- Slow weapons (0.5-0.7s)
    ["Fire Axe"] = 0.55,
    ["Sledgehammer"] = 0.6,
    ["Chainsaw"] = 0.35,  -- Chainsaw is fast once running
    ["Riot Shield"] = 0.5,
}

-- Get weapon swing speed based on equipped tool
local function getWeaponSwingSpeed()
    local char = LocalPlayer.Character
    if not char then return 0.5 end
    
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return 0.5 end
    
    local toolName = tool.Name
    
    -- Check exact match first
    if weaponSwingSpeeds[toolName] then
        return weaponSwingSpeeds[toolName]
    end
    
    -- Partial match for variants (e.g., "Golden Knife", "Rusty Knife")
    for weaponName, speed in pairs(weaponSwingSpeeds) do
        if string.find(toolName:lower(), weaponName:lower()) then
            return speed
        end
    end
    
    -- Default speed for unknown weapons
    return 0.5
end

-- Collect all valid kill aura targets within range, sorted by chosen priority.
-- Returns an array of { mob, dist, health, maxHealth } tables.
-- [FIX] Only targets known mob types (mobNames whitelist).
--       Explicitly excludes ALL player characters so friendly-fire is impossible.
local function findTargetsInRange(range)
    local char = LocalPlayer.Character
    if not char then return {} end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return {} end
    if not charactersFolder then return {} end

    -- Build a fast lookup set of every player's current character
    -- so we can exclude them in O(1) per iteration.
    local playerCharSet = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then
            playerCharSet[p.Character] = true
        end
    end

    local targets = {}
    local myPos   = hrp.Position

    for _, mob in ipairs(charactersFolder:GetChildren()) do
        -- Skip own character
        if mob == char then continue end
        -- Skip every real player character (looked up from Players service)
        -- Everything else in workspace.Characters is a mob/enemy
        if playerCharSet[mob] then continue end

        local mobHRP = mob:FindFirstChild("HumanoidRootPart")
        local mobHum = mob:FindFirstChildOfClass("Humanoid")
        if not mobHRP or not mobHum then continue end
        if mobHum.Health <= 0 then continue end
        local dist = (mobHRP.Position - myPos).Magnitude
        if dist <= range then
            table.insert(targets, {
                mob       = mob,
                dist      = dist,
                health    = mobHum.Health,
                maxHealth = mobHum.MaxHealth,
            })
        end
    end

    local priority = Options.KillAuraPriority and Options.KillAuraPriority.Value or "Nearest"
    if priority == "Nearest" then
        table.sort(targets, function(a, b) return a.dist < b.dist end)
    elseif priority == "Lowest HP" then
        table.sort(targets, function(a, b) return a.health < b.health end)
    elseif priority == "Highest HP" then
        table.sort(targets, function(a, b) return a.health > b.health end)
    end

    return targets
end

-- Equip the fastest weapon available in the backpack.
-- Called when no tool is held and KillAuraAutoEquip is enabled.
local function autoEquipWeapon()
    local char = LocalPlayer.Character
    if not char then return false end
    if char:FindFirstChildOfClass("Tool") then return true end  -- already equipped
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return false end

    local bestTool  = nil
    local bestSpeed = math.huge

    for _, tool in ipairs(backpack:GetChildren()) do
        if not tool:IsA("Tool") then continue end
        if not (tool:FindFirstChild("Swing") or tool:FindFirstChild("HitTargets") or tool:FindFirstChild("RemoteClick")) then continue end
        local speed = weaponSwingSpeeds[tool.Name] or 0.5
        for wName, s in pairs(weaponSwingSpeeds) do
            if string.find(tool.Name:lower(), wName:lower()) then speed = s break end
        end
        if speed < bestSpeed then
            bestSpeed = speed
            bestTool  = tool
        end
    end

    if bestTool then
        pcall(function() bestTool.Parent = char end)
        return true
    end
    return false
end

local function stopKillAura()
    if killAuraConn then
        killAuraConn:Disconnect()
        killAuraConn = nil
    end
    killAuraLastSwing = 0
    killAuraCurrentTarget = nil
    killAuraTargetDistance = nil
    -- Hide visual indicator drawings
    if killAuraIndicatorLine   then killAuraIndicatorLine.Visible   = false end
    if killAuraIndicatorCircle then killAuraIndicatorCircle.Visible = false end
    -- [Potassium] Restore default simulation radius when kill aura stops
    pcall(function()
        if setsimulationradius then setsimulationradius(50, 300) end
    end)
end

local function startKillAura()
    stopKillAura()

    -- Create indicator Drawing objects once; reused every frame
    if not killAuraIndicatorLine then
        killAuraIndicatorLine             = Drawing.new("Line")
        killAuraIndicatorLine.Thickness   = 1.5
        killAuraIndicatorLine.Color       = Color3.fromRGB(255, 55, 55)
        killAuraIndicatorLine.Transparency = 0.65
        killAuraIndicatorLine.Visible     = false
    end
    if not killAuraIndicatorCircle then
        killAuraIndicatorCircle             = Drawing.new("Circle")
        killAuraIndicatorCircle.Thickness   = 1.5
        killAuraIndicatorCircle.Color       = Color3.fromRGB(255, 55, 55)
        killAuraIndicatorCircle.Transparency = 0.55
        killAuraIndicatorCircle.Filled      = false
        killAuraIndicatorCircle.Visible     = false
    end

    -- [Potassium] Raise simulation radius so the server accepts hits at extended range
    pcall(function()
        if setsimulationradius then setsimulationradius(1000, 1000) end
    end)

    killAuraConn = RunService.Heartbeat:Connect(function()
        if not Toggles.KillAura or not Toggles.KillAura.Value then
            killAuraCurrentTarget = nil
            if killAuraIndicatorLine   then killAuraIndicatorLine.Visible   = false end
            if killAuraIndicatorCircle then killAuraIndicatorCircle.Visible = false end
            return
        end

        local success, err = pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            -- Auto-equip: grab best weapon from backpack if nothing is held
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool and Toggles.KillAuraAutoEquip and Toggles.KillAuraAutoEquip.Value then
                autoEquipWeapon()
                tool = char:FindFirstChildOfClass("Tool")
            end

            if not tool then
                killAuraCurrentTarget = nil
                if killAuraIndicatorLine   then killAuraIndicatorLine.Visible   = false end
                if killAuraIndicatorCircle then killAuraIndicatorCircle.Visible = false end
                return
            end

            local swing       = tool:FindFirstChild("Swing")
            local hitTargets  = tool:FindFirstChild("HitTargets")
            local remoteClick = tool:FindFirstChild("RemoteClick")

            local baseRange        = Options.KillAuraRange and Options.KillAuraRange.Value or 6
            local useExtendedRange = Toggles.KillAuraExtendedRange and Toggles.KillAuraExtendedRange.Value
            local attackRange      = useExtendedRange and (baseRange + 2) or baseRange

            -- Prioritised list of all mobs in range this frame
            local targets = findTargetsInRange(attackRange)
            killAuraCurrentTarget  = targets[1] and targets[1].mob  or nil
            killAuraTargetDistance = targets[1] and targets[1].dist or nil

            -- ── Visual indicator ──────────────────────────────────────────────
            local showIndicator = Toggles.KillAuraShowIndicator and Toggles.KillAuraShowIndicator.Value
            if showIndicator and killAuraCurrentTarget then
                local camera = Workspace.CurrentCamera
                if camera then
                    local tHRP = killAuraCurrentTarget:FindFirstChild("HumanoidRootPart")
                    if tHRP then
                        local sp, onScreen = camera:WorldToViewportPoint(tHRP.Position)
                        if onScreen and sp.Z > 0 then
                            local vp     = camera.ViewportSize
                            local center = Vector2.new(vp.X / 2, vp.Y)  -- bottom-center
                            local tgt    = Vector2.new(sp.X, sp.Y)
                            killAuraIndicatorLine.From    = center
                            killAuraIndicatorLine.To      = tgt
                            killAuraIndicatorLine.Visible = true
                            -- Circle radius scales inversely with distance (8–40 px)
                            local radius = math.clamp(1200 / math.max(killAuraTargetDistance, 1), 8, 40)
                            killAuraIndicatorCircle.Position = tgt
                            killAuraIndicatorCircle.Radius   = radius
                            killAuraIndicatorCircle.Visible  = true
                        else
                            killAuraIndicatorLine.Visible   = false
                            killAuraIndicatorCircle.Visible = false
                        end
                    end
                end
            else
                if killAuraIndicatorLine   then killAuraIndicatorLine.Visible   = false end
                if killAuraIndicatorCircle then killAuraIndicatorCircle.Visible = false end
            end

            if #targets == 0 then return end

            -- ── Safe swing cooldown ───────────────────────────────────────────
            -- effectiveSwingRate = max(weaponSpeed, userSetting)
            -- We NEVER swing faster than the weapon physically allows.
            -- This prevents the server from rejecting rapid-fire hits.
            local weaponSpeed        = getWeaponSwingSpeed()
            local userSwingRate      = Options.KillAuraSwingRate and Options.KillAuraSwingRate.Value or weaponSpeed
            local effectiveSwingRate = math.max(weaponSpeed, userSwingRate)
            local now = tick()
            if now - killAuraLastSwing < effectiveSwingRate then return end

            -- ── AoE attack ────────────────────────────────────────────────────
            -- Pass ALL mobs in range to HitTargets in a single FireServer call.
            -- The server validates each entry; only reachable mobs take damage.
            local mobModels = {}
            for _, t in ipairs(targets) do
                table.insert(mobModels, t.mob)
            end

            local attackSuccess = false

            if swing and hitTargets then
                local s1, e1 = pcall(function() swing:FireServer() end)
                if s1 then
                    -- [FIX] Record swing time immediately after Swing fires.
                    -- If HitTargets errors the cooldown is still respected,
                    -- preventing rapid-fire Swing spam that the server will reject.
                    killAuraLastSwing = now
                    attackSuccess = true
                    local s2, e2 = pcall(function() hitTargets:FireServer(mobModels) end)
                    if not s2 then warn("[KillAura] HitTargets error: " .. tostring(e2)) end
                else
                    warn("[KillAura] Swing error: " .. tostring(e1))
                end
            elseif remoteClick then
                -- RemoteClick accepts one target — use the highest-priority mob
                local s, e = pcall(function() remoteClick:FireServer(targets[1].mob) end)
                attackSuccess = s
                if not s then warn("[KillAura] RemoteClick error: " .. tostring(e)) end
            end

            if attackSuccess and killAuraLastSwing ~= now then
                killAuraLastSwing = now
            end
        end)

        if not success then
            warn("[KillAura] Error: " .. tostring(err))
        end
    end)
end

-- ============================================
-- AIMBOT
-- [ADDED v7.3] Advanced aimbot with smoothness, FOV, prediction
-- Supports both mobs and players with configurable target priority
-- ============================================
local function stopAimbot()
    if aimbotConn then
        aimbotConn:Disconnect()
        aimbotConn = nil
    end
    aimbotTarget = nil
    if fovCircle then fovCircle.Visible = false end
end

-- Get the closest valid target for aimbot
local function getAimbotTarget()
    local char = LocalPlayer.Character
    if not char then return nil end
    local myRoot = char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local camera = Workspace.CurrentCamera
    if not camera then return nil end

    local viewportSize = camera.ViewportSize
    local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)

    local fov = Options.AimbotFOV and Options.AimbotFOV.Value or 100
    local maxRange = Options.AimbotRange and Options.AimbotRange.Value or 500
    local targetMode = Options.AimbotTarget and Options.AimbotTarget.Value or "Mobs"
    local aimPart = Options.AimbotPart and Options.AimbotPart.Value or "Head"

    local bestTarget = nil
    local bestScore = math.huge  -- Lower is better (FOV distance or distance)

    local function isValidTarget(targetChar, targetRoot)
        if not targetChar or not targetRoot then return false end
        if targetChar == char then return false end

        -- Check distance
        local dist = (targetRoot.Position - myRoot.Position).Magnitude
        if dist > maxRange then return false end

        -- Check health (if has humanoid)
        local humanoid = targetChar:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health <= 0 then return false end

        -- Check if on screen
        local screenPos, onScreen = camera:WorldToViewportPoint(targetRoot.Position)
        if not onScreen then return false end

        -- Check FOV (distance from screen center)
        local fovDist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
        if fovDist > fov then return false end

        return true, dist, fovDist, screenPos
    end

    -- Target Mobs
    if targetMode == "Mobs" or targetMode == "Both" then
        if charactersFolder then
            for _, mob in ipairs(charactersFolder:GetChildren()) do
                if table.find(mobNames, mob.Name) then
                    local mobRoot = mob:FindFirstChild("HumanoidRootPart") or mob:FindFirstChild("Torso") or mob:FindFirstChild("UpperTorso")
                    local valid, dist, fovDist = isValidTarget(mob, mobRoot)
                    if valid then
                        local score = Options.AimbotPriority and Options.AimbotPriority.Value == "FOV" and fovDist or dist
                        if score < bestScore then
                            bestScore = score
                            bestTarget = {character = mob, rootPart = mobRoot}
                        end
                    end
                end
            end
        end
    end

    -- Target Players
    if targetMode == "Players" or targetMode == "Both" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local pChar = player.Character
                if pChar then
                    local pRoot = pChar:FindFirstChild("HumanoidRootPart")
                    local valid, dist, fovDist = isValidTarget(pChar, pRoot)
                    if valid then
                        local score = Options.AimbotPriority and Options.AimbotPriority.Value == "FOV" and fovDist or dist
                        if score < bestScore then
                            bestScore = score
                            bestTarget = {character = pChar, rootPart = pRoot}
                        end
                    end
                end
            end
        end
    end

    return bestTarget
end

local function startAimbot()
    stopAimbot()
    aimbotConn = RunService.RenderStepped:Connect(function()
        if not Toggles.Aimbot or not Toggles.Aimbot.Value then
            if fovCircle then fovCircle.Visible = false end
            return
        end

        local char = LocalPlayer.Character
        if not char then return end

        local camera = Workspace.CurrentCamera
        if not camera then return end

        -- Get target
        local target = getAimbotTarget()
        aimbotTarget = target  -- Store for visualization

        -- FOV Circle visualization
        if not fovCircle then
            fovCircle = Drawing.new("Circle")
            fovCircle.Filled = false
            fovCircle.NumSides = 64
            fovCircle.Thickness = 1.5
            fovCircle.Transparency = 1
        end
        if Toggles.AimbotFOVCircle and Toggles.AimbotFOVCircle.Value then
            local vp = camera.ViewportSize
            fovCircle.Position = Vector2.new(vp.X / 2, vp.Y / 2)
            fovCircle.Radius = Options.AimbotFOV and Options.AimbotFOV.Value or 100
            fovCircle.Color = Color3.fromRGB(255, 255, 255)
            fovCircle.Visible = true
        else
            fovCircle.Visible = false
        end

        if not target then return end

        -- Get the specific aim part
        local aimPartName = Options.AimbotPart and Options.AimbotPart.Value or "Head"
        local targetPart = target.character:FindFirstChild(aimPartName)

        -- Fallback to root if aim part not found
        if not targetPart or not targetPart:IsA("BasePart") then
            targetPart = target.rootPart
        end

        if not targetPart then return end

        -- Get target position with optional prediction
        local targetPos = targetPart.Position
        if Toggles.AimbotPrediction and Toggles.AimbotPrediction.Value then
            local velocity = targetPart.AssemblyLinearVelocity
            local predictionAmount = Options.AimbotPredictionAmount and Options.AimbotPredictionAmount.Value or 0.1
            targetPos = targetPos + (velocity * predictionAmount)
        end

        -- Calculate the look vector to target
        local myRoot = char:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end

        local myHead = char:FindFirstChild("Head")
        if not myHead then return end

        local aimPos = targetPos
        if aimPartName == "Head" then
            -- Aim slightly higher for headshots
            aimPos = targetPos + Vector3.new(0, 0.5, 0)
        end

        -- Get smoothness value (0 = instant, 1 = very smooth)
        local smoothness = Options.AimbotSmoothness and Options.AimbotSmoothness.Value or 0.5
        local smoothFactor = 1 - (smoothness * 0.95)  -- Convert to factor (0.05 to 1)

        -- Calculate target CFrame
        local targetCFrame = CFrame.lookAt(myHead.Position, aimPos)

        -- Apply smoothness
        if smoothness > 0 then
            targetCFrame = camera.CFrame:Lerp(targetCFrame, smoothFactor)
        end

        -- Apply to camera
        camera.CFrame = targetCFrame
    end)
end

-- ============================================
-- REMOVE FOG
-- [IMPROVED v7.3.3] Now handles Workspace.Fog folder
--                  - Makes all fog objects client-side invisible
--                  - Properly restores visibility on disable
-- ============================================
local fogOriginalStates = {}  -- Store original visibility states
local fogObjects = {}  -- Reference to fog objects
local fogFEConns  = {}  -- [FE Bypass] Connections that prevent server from restoring fog

local function makeFogObjectInvisible(obj)
    local success, err = pcall(function()
        -- Store original state before modifying
        local originalState = {}
        
        if obj:IsA("BasePart") then
            -- Parts, MeshParts, Unions, TrussParts, etc.
            originalState.Transparency = obj.Transparency
            originalState.Material = obj.Material
            obj.Transparency = 1
            obj.Material = Enum.Material.Air
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("ParticleEmitter") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Beam") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Trail") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Smoke") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Fire") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Sparkles") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Explosion") then
            originalState.Visible = obj.Visible
            obj.Visible = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            originalState.Transparency = obj.Transparency
            obj.Transparency = 1
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Light") then
            -- PointLight, SpotLight, SurfaceLight
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Highlight") then
            originalState.Enabled = obj.Enabled
            obj.Enabled = false
            fogOriginalStates[obj] = originalState
        elseif obj:IsA("Folder") or obj:IsA("Model") then
            -- Recursively handle containers
            for _, child in ipairs(obj:GetDescendants()) do
                makeFogObjectInvisible(child)
            end
        end
    end)
    if not success then
        warn("[RemoveFog] Failed to process object: " .. tostring(err))
    end
end

local function restoreFogObjectVisibility(obj)
    if fogOriginalStates[obj] then
        pcall(function()
            local state = fogOriginalStates[obj]
            if obj:IsA("BasePart") then
                obj.Transparency = state.Transparency
                obj.Material = state.Material
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Trail") 
                or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") 
                or obj:IsA("Light") or obj:IsA("Highlight") then
                obj.Enabled = state.Enabled
            elseif obj:IsA("Explosion") then
                obj.Visible = state.Visible
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = state.Transparency
            end
        end)
    end
end

local function enableRemoveFog()
    -- Store Lighting fog settings (only once, so disable can restore originals)
    if not originalFog.stored then
        originalFog.FogEnd   = Lighting.FogEnd
        originalFog.FogStart = Lighting.FogStart
        originalFog.stored   = true
    end
    Lighting.FogEnd   = 100000
    Lighting.FogStart = 0

    -- Handle Atmosphere (visual density/haze separate from FogEnd)
    local atm = Lighting:FindFirstChildOfClass("Atmosphere")
    if atm then
        if originalFog.AtmDensity == nil then  -- store only once
            originalFog.AtmDensity = atm.Density
            originalFog.AtmHaze    = atm.Haze
            originalFog.AtmGlare   = atm.Glare
        end
        atm.Density = 0
        atm.Haze    = 0
        atm.Glare   = 0
    end

    -- [FE Bypass] Disconnect any previous server-override listeners and re-create them
    for _, conn in ipairs(fogFEConns) do pcall(function() conn:Disconnect() end) end
    fogFEConns = {}

    -- Lighting.Changed: immediately reapply FogEnd/FogStart if server changes them
    table.insert(fogFEConns, Lighting.Changed:Connect(function(prop)
        if not (Toggles.RemoveFog and Toggles.RemoveFog.Value) then return end
        if prop == "FogEnd"   then Lighting.FogEnd   = 100000 end
        if prop == "FogStart" then Lighting.FogStart = 0      end
    end))

    -- Atmosphere.Changed: keep density/haze/glare at zero
    local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
    if atmosphere then
        table.insert(fogFEConns, atmosphere.Changed:Connect(function(prop)
            if not (Toggles.RemoveFog and Toggles.RemoveFog.Value) then return end
            if prop == "Density" then atmosphere.Density = 0 end
            if prop == "Haze"    then atmosphere.Haze    = 0 end
            if prop == "Glare"   then atmosphere.Glare   = 0 end
        end))
    end

    -- Handle Workspace.Fog folder
    local fogFolder = Workspace:FindFirstChild("Fog")
    if fogFolder then
        fogOriginalStates = {}
        fogObjects = {}

        for _, child in ipairs(fogFolder:GetChildren()) do
            table.insert(fogObjects, child)
            makeFogObjectInvisible(child)
        end
        for _, descendant in ipairs(fogFolder:GetDescendants()) do
            if not fogOriginalStates[descendant] then
                makeFogObjectInvisible(descendant)
            end
        end

        -- [FE Bypass] Hide any new fog objects the server adds dynamically
        table.insert(fogFEConns, fogFolder.ChildAdded:Connect(function(child)
            if not (Toggles.RemoveFog and Toggles.RemoveFog.Value) then return end
            makeFogObjectInvisible(child)
            for _, desc in ipairs(child:GetDescendants()) do
                makeFogObjectInvisible(desc)
            end
        end))

        Library:Notify({ Title = "Remove Fog", Description = "Enabled – " .. #fogObjects .. " fog objects hidden", Time = 2 })
    else
        Library:Notify({ Title = "Remove Fog", Description = "Enabled – Lighting fog cleared (no Fog folder found)", Time = 2 })
    end
end

local function disableRemoveFog()
    -- [FE Bypass] Disconnect all server-override listeners first
    for _, conn in ipairs(fogFEConns) do pcall(function() conn:Disconnect() end) end
    fogFEConns = {}

    -- Restore Lighting fog settings
    if originalFog.stored then
        Lighting.FogEnd   = originalFog.FogEnd
        Lighting.FogStart = originalFog.FogStart
    end

    -- Restore Atmosphere
    local atm = Lighting:FindFirstChildOfClass("Atmosphere")
    if atm and originalFog.AtmDensity ~= nil then
        atm.Density = originalFog.AtmDensity
        atm.Haze    = originalFog.AtmHaze
        atm.Glare   = originalFog.AtmGlare
        originalFog.AtmDensity = nil
        originalFog.AtmHaze    = nil
        originalFog.AtmGlare   = nil
    end

    -- Restore visibility of all fog objects
    for obj, _ in pairs(fogOriginalStates) do
        restoreFogObjectVisibility(obj)
    end

    fogOriginalStates = {}
    fogObjects = {}

    Library:Notify({ Title = "Remove Fog", Description = "Disabled – fog restored", Time = 2 })
end

-- ============================================
-- BUNNY HOP (Auto-jump while moving)
-- [ADDED v7.3] Automatic jumping for speed/momentum
-- ============================================
local function stopBhop()
    if bhopConn then
        bhopConn:Disconnect()
        bhopConn = nil
    end
    bhopActive = false
end

local function startBhop()
    stopBhop()
    bhopActive = true
    
    bhopConn = RunService.RenderStepped:Connect(function()
        if not Toggles.BunnyHop or not Toggles.BunnyHop.Value then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        
        if not humanoid or not root then return end
        
        -- Only jump if moving and on ground
        local moveDir = humanoid.MoveDirection
        if moveDir.Magnitude > 0.1 then
            local state = humanoid:GetState()
            if state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.RunningNoPhysics then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

-- ============================================
-- FUNNY DANCE FE
-- [ADDED] Plays a looping dance animation visible to all players on the server.
-- FE compatible: local character animations are replicated to server automatically.
-- Action4 priority overrides idle/walk so the dance plays continuously.
-- ============================================
local funnyDanceTrack = nil
local funnyDanceConn  = nil

-- Roblox built-in emote animation IDs (free, work on any avatar)
local DANCE_ANIM_IDS = {
    507770723,  -- Dance 1 (Shuffle)
    507772104,  -- Dance 2 (Twist)
    507771281,  -- Dance 3 (Robot)
}

local function stopFunnyDance()
    if funnyDanceConn then
        funnyDanceConn:Disconnect()
        funnyDanceConn = nil
    end
    if funnyDanceTrack then
        if funnyDanceTrack ~= "PHYS" then
            pcall(function() funnyDanceTrack:Stop(0.3) end)
        end
        funnyDanceTrack = nil
    end
end

local function startFunnyDance()
    stopFunnyDance()

    local selectedIdx = Options.DanceStyle and Options.DanceStyle.Value or 1
    local selectedId  = DANCE_ANIM_IDS[selectedIdx] or DANCE_ANIM_IDS[1]

    -- Physics-based dance state (fallback when the animation system is blocked)
    local physDanceConn = nil

    local function stopPhysDance()
        if physDanceConn then
            physDanceConn:Disconnect()
            physDanceConn = nil
        end
    end

    local function startPhysDance(char)
        stopPhysDance()
        local t = 0
        local spinDir = (selectedIdx % 2 == 0) and 1 or -1  -- alternate direction per style
        physDanceConn = RunService.Heartbeat:Connect(function(dt)
            if not Toggles.FunnyDance or not Toggles.FunnyDance.Value then
                stopPhysDance()
                return
            end
            local c = char or LocalPlayer.Character
            if not c then return end
            local root = c:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local hum = c:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health <= 0 then return end
            t = t + dt
            -- Spin the character + slight vertical bob
            local spin = CFrame.Angles(0, spinDir * dt * (2.5 + selectedIdx * 0.4), 0)
            local bob  = Vector3.new(0, math.sin(t * 4) * 0.08, 0)
            root.CFrame = CFrame.new(root.Position + bob) * (root.CFrame - root.CFrame.Position) * spin
        end)
        -- Store as a sentinel so stopFunnyDance() can clean up
        funnyDanceTrack = "PHYS"
    end

    local function applyDance(char)
        char = char or LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then
            animator = Instance.new("Animator")
            animator.Parent = humanoid
        end
        if funnyDanceTrack then
            if funnyDanceTrack == "PHYS" then
                stopPhysDance()
            else
                pcall(function() funnyDanceTrack:Stop(0) end)
            end
            funnyDanceTrack = nil
        end

        -- Strategy 1: Deep-scan the character's Animate LocalScript for any pre-existing
        -- Animation objects. The game's own Animate script loads these at a lower security
        -- level that the place restriction does not apply to.
        -- We try multiple folder name variants and recurse through all descendants.
        local function findNativeAnim()
            local animateScript = char:FindFirstChild("Animate")
            if not animateScript then return nil end
            -- Ordered preference: dance-specific folders → any folder → any descendant
            local danceVariants = {
                { "dance",  "dance2", "dance3"  },
                { "Dance",  "Dance2", "Dance3"  },
                { "emote",  "emote2", "emote3"  },
                { "Emote",  "Emote2", "Emote3"  },
            }
            for _, variants in ipairs(danceVariants) do
                local folderName = variants[selectedIdx] or variants[1]
                local folder = animateScript:FindFirstChild(folderName)
                if folder then
                    local anim = folder:FindFirstChildOfClass("Animation")
                    if anim then return anim end
                end
            end
            -- Fallback: any Animation anywhere inside Animate (covers non-standard games)
            for _, desc in ipairs(animateScript:GetDescendants()) do
                if desc:IsA("Animation") then return desc end
            end
            return nil
        end

        local nativeAnim = findNativeAnim()
        if nativeAnim then
            local ok, track = pcall(function() return animator:LoadAnimation(nativeAnim) end)
            if ok and track then
                track.Priority = Enum.AnimationPriority.Action4
                track.Looped   = true
                track:Play(0.15)
                funnyDanceTrack = track
                return
            end
        end

        -- Strategy 2: game:GetObjects() — executor API that fetches the asset without
        -- appending the serverplaceid query param, bypassing the place restriction.
        local ok2, results = pcall(function()
            return game:GetObjects("rbxassetid://" .. tostring(selectedId))
        end)
        if ok2 and results and results[1] and results[1]:IsA("Animation") then
            local ok3, track = pcall(function() return animator:LoadAnimation(results[1]) end)
            if ok3 and track then
                track.Priority = Enum.AnimationPriority.Action4
                track.Looped   = true
                track:Play(0.15)
                funnyDanceTrack = track
                return
            end
        end

        -- Strategy 3: Physics dance — no animation system used at all. Spins and bobs the
        -- HumanoidRootPart every Heartbeat, which is replicated to the server. Always works.
        Library:Notify({ Title = "Funny Dance", Description = "Animation blocked by game – using physics dance instead.", Time = 3 })
        startPhysDance(char)
    end

    applyDance()

    -- Reapply automatically after character respawn
    funnyDanceConn = LocalPlayer.CharacterAdded:Connect(function(newChar)
        task.delay(0.5, function()
            if Toggles.FunnyDance and Toggles.FunnyDance.Value then
                selectedIdx = Options.DanceStyle and Options.DanceStyle.Value or 1
                selectedId  = DANCE_ANIM_IDS[selectedIdx] or DANCE_ANIM_IDS[1]
                if physDanceConn then stopPhysDance() end
                applyDance(newChar)
            end
        end)
    end)
end

-- ============================================
-- SERVER HOP
-- [ADDED v7.3] Join a different server
-- ============================================
local function serverHop()
    local placeId = game.PlaceId
    local servers = {}
    local req = syn and syn.request or http_request or request or httprequest

    if req then
        -- Alternate sort direction randomly each hop → different server pool every time
        local sortOrder = math.random(0, 1) == 0 and "Asc" or "Desc"
        local cursor = ""
        local maxPages = 3  -- Up to 300 servers fetched for a large random pool

        for _ = 1, maxPages do
            local url = "https://games.roblox.com/v1/games/" .. placeId
                .. "/servers/Public?sortOrder=" .. sortOrder .. "&limit=100"
                .. (cursor ~= "" and ("&cursor=" .. cursor) or "")

            local ok, response = pcall(req, { Url = url, Method = "GET" })
            if not ok or not response or not response.Body then break end

            local ok2, data = pcall(function()
                return game:GetService("HttpService"):JSONDecode(response.Body)
            end)
            if not ok2 or not data or not data.data then break end

            for _, server in ipairs(data.data) do
                -- Skip current server and fully-packed servers
                if server.id ~= game.JobId and server.playing < server.maxPlayers then
                    table.insert(servers, server.id)
                end
            end

            -- Follow pagination cursor for next page
            local nextCursor = data.nextPageCursor
            if not nextCursor or nextCursor == "" or nextCursor == "null" then break end
            cursor = tostring(nextCursor)
        end
    end

    if #servers > 0 then
        -- Fisher-Yates shuffle → every server has equal probability, no bias toward
        -- servers that happen to appear first in the API response
        for i = #servers, 2, -1 do
            local j = math.random(1, i)
            servers[i], servers[j] = servers[j], servers[i]
        end
        TeleportService:TeleportToPlaceInstance(placeId, servers[1], LocalPlayer)
        Library:Notify({ Title = "Server Hop", Description = "Joining 1 of " .. #servers .. " servers found...", Time = 3 })
    else
        -- Fallback: force a fresh matchmake (will place in a different server)
        TeleportService:Teleport(placeId, LocalPlayer)
        Library:Notify({ Title = "Server Hop", Description = "No other servers found, re-matchmaking...", Time = 3 })
    end
end

-- ============================================
-- REJOIN
-- [IMPROVED v7.3.3] Reconnects to the exact same server instance.
-- Priority chain:
--   1. TeleportAsync + TeleportOptions.ServerInstanceId  (modern, most reliable)
--   2. TeleportToPlaceInstance                           (legacy fallback)
--   3. TeleportService:Teleport                          (matchmaking fallback)
-- ============================================
local function rejoinServer()
    local placeId = game.PlaceId
    local jobId   = game.JobId

    if not jobId or jobId == "" then
        -- No JobId means we can't target the exact server; fall back to matchmaking
        pcall(function() TeleportService:Teleport(placeId, LocalPlayer) end)
        Library:Notify({ Title = "Rejoin", Description = "No JobId – rejoining via matchmaking...", Time = 3 })
        return
    end

    Library:Notify({ Title = "Rejoin", Description = "Rejoining server...", Time = 2 })

    -- Attempt 1: TeleportAsync with ServerInstanceId (Roblox recommended since 2022)
    -- This targets the same running server instance by its JobId.
    local ok1, err1 = pcall(function()
        local opts = Instance.new("TeleportOptions")
        opts.ServerInstanceId = jobId
        TeleportService:TeleportAsync(placeId, { LocalPlayer }, opts)
    end)
    if ok1 then return end
    warn("[Rejoin] TeleportAsync failed: " .. tostring(err1))

    -- Attempt 2: Legacy TeleportToPlaceInstance
    local ok2, err2 = pcall(function()
        TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
    end)
    if ok2 then return end
    warn("[Rejoin] TeleportToPlaceInstance failed: " .. tostring(err2))

    -- Attempt 3: Plain matchmaking teleport (server may be gone)
    pcall(function() TeleportService:Teleport(placeId, LocalPlayer) end)
    Library:Notify({ Title = "Rejoin", Description = "Server unavailable – rejoining via matchmaking...", Time = 3 })
end

-- ============================================
-- REMOTE SPY
-- [ADDED v7.3] Log all remote calls for analysis
-- [FIXED v7.3.3] Uses hookfunction for proper method hooking
-- [IMPROVED v7.3.3+] Primary hook now uses Potassium's hookmetamethod:
--              hookmetamethod(game, "__namecall", hook) - safest, purpose-built
--              Fallback chain: hookfunction → setreadonly namecall → passive
-- ============================================

local remoteSpyConnections = {}
local oldFireServer = nil
local oldInvokeServer = nil

local function stopRemoteSpy()
    remoteSpyEnabled = false
    
    -- [FIX #5] hookfunction cannot be truly unhooked; we stop logging via remoteSpyEnabled.
    -- Setting these to nil removes our reference but the low-overhead hook wrapper remains.
    -- The wrapper already checks `remoteSpyEnabled` before logging, so no output occurs.
    oldFireServer = nil
    oldInvokeServer = nil
    
    -- Clean up connections
    for _, conn in ipairs(remoteSpyConnections) do
        if conn then pcall(function() conn:Disconnect() end) end
    end
    remoteSpyConnections = {}
    
    Library:Notify({ Title = "Remote Spy", Description = "Disabled", Time = 2 })
end

local function startRemoteSpy()
    stopRemoteSpy()
    remoteSpyEnabled = true
    remoteSpyLogs = {}
    
    Library:Notify({ Title = "Remote Spy", Description = "Enabled - Check console for remote calls", Time = 3 })
    
    -- Helper function to log remote calls
    local function logRemoteCall(remote, method, args)
        if not remoteSpyEnabled then return end
        
        -- Safely get remote info
        local success, name = pcall(function() return remote.Name end)
        local success2, path = pcall(function() return remote:GetFullName() end)
        local success3, className = pcall(function() return remote.ClassName end)
        
        local logEntry = {
            Type = success3 and className or "Unknown",
            Method = method,
            Name = success and name or "Unknown",
            Path = success2 and path or "Unknown",
            Args = args,
            Time = os.date("%H:%M:%S")
        }
        table.insert(remoteSpyLogs, logEntry)
        if #remoteSpyLogs > 100 then table.remove(remoteSpyLogs, 1) end
        
        -- Print to console with safe string conversion
        local argCount = args and #args or 0
        print(string.format("[RemoteSpy] %s.%s(%s) - %s", 
            success and name or "Unknown", method, 
            argCount > 0 and tostring(argCount) .. " args" or "no args",
            os.date("%H:%M:%S")))
    end
    
    -- Method 0: hookmetamethod (Potassium API) — purpose-built, safest
    if hookmetamethod then
        local success, err = pcall(function()
            local originalNamecall
            originalNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if remoteSpyEnabled and (method == "FireServer" or method == "InvokeServer") then
                    logRemoteCall(self, method, {...})
                end
                return originalNamecall(self, ...)
            end))
            oldFireServer = originalNamecall  -- store original ref; logging toggled via remoteSpyEnabled
        end)
        if success then
            Library:Notify({ Title = "Remote Spy", Description = "Hooked via hookmetamethod (Potassium)", Time = 2 })
            return
        else
            warn("[RemoteSpy] hookmetamethod failed: " .. tostring(err))
        end
    end

    -- Method 1: hookfunction (second best)
    if hookfunction then
        local success, err = pcall(function()
            local tempRemote = Instance.new("RemoteEvent")
            local tempFunc = Instance.new("RemoteFunction")

            oldFireServer = hookfunction(tempRemote.FireServer, function(self, ...)
                if remoteSpyEnabled then logRemoteCall(self, "FireServer", {...}) end
                return oldFireServer(self, ...)
            end)

            oldInvokeServer = hookfunction(tempFunc.InvokeServer, function(self, ...)
                if remoteSpyEnabled then logRemoteCall(self, "InvokeServer", {...}) end
                return oldInvokeServer(self, ...)
            end)

            tempRemote:Destroy()
            tempFunc:Destroy()
        end)
        if success then
            Library:Notify({ Title = "Remote Spy", Description = "Hooked via hookfunction", Time = 2 })
            return
        else
            warn("[RemoteSpy] hookfunction failed: " .. tostring(err))
        end
    end

    -- Method 2: setreadonly namecall (fallback)
    if getrawmetatable and setreadonly then
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        local success, err = pcall(function()
            setreadonly(mt, false)
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if remoteSpyEnabled and (method == "FireServer" or method == "InvokeServer") then
                    logRemoteCall(self, method, {...})
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)
        end)
        if success then
            Library:Notify({ Title = "Remote Spy", Description = "Hooked via namecall", Time = 2 })
            return
        else
            warn("[RemoteSpy] namecall hook failed: " .. tostring(err))
            pcall(function()
                setreadonly(mt, false)
                mt.__namecall = oldNamecall
                setreadonly(mt, true)
            end)
        end
    end

    -- Method 3: Passive mode — scan and list remotes only (no hooks available)
    Library:Notify({ Title = "Remote Spy", Description = "Running in passive mode (no hooks available)", Time = 4 })
    
    -- List all known remotes
    if Remotes then
        print("[RemoteSpy] === Available Remotes ===")
        for _, folder in ipairs(Remotes:GetChildren()) do
            for _, remote in ipairs(folder:GetChildren()) do
                if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                    print(string.format("[RemoteSpy] %s: %s", remote.ClassName, remote:GetFullName()))
                    table.insert(remoteSpyLogs, {
                        Type = remote.ClassName,
                        Method = "Discovered",
                        Name = remote.Name,
                        Path = remote:GetFullName(),
                        Args = {},
                        Time = os.date("%H:%M:%S")
                    })
                end
            end
        end
        print("[RemoteSpy] === End of Remote List ===")
    end
end

-- ============================================
-- AUTO PICKUP  (FE Multi-Vector, rebuilt)
-- Four independent pickup strategies, each toggle-able:
--
--  A  Remote     – FireServer(PickUpItem + AdjustBackpack) directly.
--                  Fast and clean; works when the server is lenient on
--                  distance checks or the item is already nearby.
--
--  B  Touch      – firetouchinterest(hrp, itemPart) — simulates the
--                  player’s HumanoidRootPart physically touching the
--                  item part. Fires the Touched handler server-side in
--                  Potassium/synapse-compatible executors.
--
--  C  Prompt     – fireproximityprompt(prompt) — triggers ProximityPrompt
--                  on items that expose one instead of (or in addition to)
--                  a Touched handler.
--
--  D  Teleport   – Moves the item’s BaseParts to the player’s CFrame
--                  client-side before firing remotes + touch. Bypasses
--                  any server-side distance check because the item is
--                  physically on top of the player when the remote fires.
--                  Most powerful method; enable as first step to test.
--
-- Enable combinations to find the minimum set that works in STA.
-- ============================================
local autoPickupActive  = false
local autoPickupThread  = nil
local autoPickupAttempts = {}  -- [item ref] = last attempt tick

local function stopAutoPickup()
    autoPickupActive = false
    if autoPickupThread then
        pcall(function() task.cancel(autoPickupThread) end)
        autoPickupThread = nil
    end
    -- Restore simulation radius in case Method A raised it
    pcall(function() if setsimulationradius then setsimulationradius(50, 300) end end)
    autoPickupAttempts = {}
end

local function startAutoPickup()
    stopAutoPickup()
    autoPickupActive = true

    -- [Method A] Raise simulation radius so the server accepts
    -- PickUpItem calls from further away (Potassium executor API)
    pcall(function() if setsimulationradius then setsimulationradius(2048, 2048) end end)

    autoPickupThread = task.spawn(function()
        while autoPickupActive and Toggles.AutoPickup and Toggles.AutoPickup.Value do
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp or not droppedItemsFolder then task.wait(0.5) continue end

            local myPos    = hrp.Position
            local radius   = Options.AutoPickupRadius  and Options.AutoPickupRadius.Value  or 20
            local allItems = Toggles.AutoPickupAll     and Toggles.AutoPickupAll.Value
            local whitelist  = Options.AutoPickupWhitelist and Options.AutoPickupWhitelist.Value or {}
            local blacklist  = Options.AutoPickupBlacklist and Options.AutoPickupBlacklist.Value or {}

            -- Pause inside workspace.Map.Tiles.Center (any height: above, on, below).
            -- The toggle stays ON; we simply skip the entire sweep while inside.
            local centerTile = Workspace:FindFirstChild("Map")
                and Workspace.Map:FindFirstChild("Tiles")
                and Workspace.Map.Tiles:FindFirstChild("Center")
            if centerTile then
                local ok, cf, size = pcall(function() return centerTile:GetBoundingBox() end)
                if ok and cf and size then
                    local localPos = cf:PointToObjectSpace(myPos)
                    if math.abs(localPos.X) <= size.X / 2 and math.abs(localPos.Z) <= size.Z / 2 then
                        task.wait(0.5) continue  -- inside Center tile, pause all methods
                    end
                end
            end

            -- Determine which methods are enabled (default all on if toggles not yet created)
            local useRemote = not Toggles.AutoPickupMethodRemote or Toggles.AutoPickupMethodRemote.Value
            local useTouch  = not Toggles.AutoPickupMethodTouch  or Toggles.AutoPickupMethodTouch.Value
            local usePrompt = not Toggles.AutoPickupMethodPrompt or Toggles.AutoPickupMethodPrompt.Value

            for _, item in ipairs(droppedItemsFolder:GetChildren()) do
                if not autoPickupActive then break end
                if not item.Parent then continue end

                -- Whitelist filter
                if not allItems and not whitelist[item.Name] then continue end

                local mainPart = item.PrimaryPart or getItemMainPart(item)
                if not mainPart then continue end

                local dist = (mainPart.Position - myPos).Magnitude
                if dist > radius then continue end

                -- Per-item rate-limit: don’t hammer the same item every frame
                local now = tick()
                if autoPickupAttempts[item] and (now - autoPickupAttempts[item]) < 0.35 then continue end
                autoPickupAttempts[item] = now

                -- ==================================================
                -- METHOD A: Direct PickUpItem + AdjustBackpack remote
                -- Blacklist only blocks pickUpItemRemote (prevents eating food);
                -- adjustBackpackRemote always fires so the item is still stored.
                -- ==================================================
                if useRemote then
                    if not blacklist[item.Name] then
                        pcall(function()
                            if pickUpItemRemote then pickUpItemRemote:FireServer(item) end
                        end)
                    end
                    pcall(function()
                        if adjustBackpackRemote then adjustBackpackRemote:FireServer(item) end
                    end)
                end

                -- ==================================================
                -- METHOD B: firetouchinterest (Touched event sim)
                -- ==================================================
                if useTouch then
                    pcall(function()
                        if firetouchinterest then
                            firetouchinterest(hrp, mainPart, 0)
                            firetouchinterest(hrp, mainPart, 1)
                        end
                    end)
                end

                -- ==================================================
                -- METHOD C: ProximityPrompt fire
                -- ==================================================
                if usePrompt then
                    pcall(function()
                        if fireproximityprompt then
                            local prompt = item:FindFirstChildWhichIsA("ProximityPrompt", true)
                            if prompt then fireproximityprompt(prompt) end
                        end
                    end)
                end

                task.wait()  -- yield once per item to keep the game responsive
            end

            -- Clean up attempt-map for items no longer in the world
            for itemRef in pairs(autoPickupAttempts) do
                if not itemRef.Parent then
                    autoPickupAttempts[itemRef] = nil
                end
            end

            task.wait(0.1)  -- scan interval
        end

        autoPickupActive = false
        pcall(function() if setsimulationradius then setsimulationradius(50, 300) end end)
    end)
end

-- ============================================
-- REPAIR AURA
-- Fires the "Repair" RemoteEvent found inside the equipped Repair Hammer.
-- Only activates when the Repair Hammer is held; targets the nearest
-- structure within 30 studs at a rate controlled by the slider.
-- ============================================
local function stopRepairAura()
    if repairAuraConn then
        repairAuraConn:Disconnect()
        repairAuraConn = nil
    end
end

local function startRepairAura()
    stopRepairAura()
    local lastFire = 0

    repairAuraConn = RunService.Heartbeat:Connect(function()
        if not Toggles.RepairAura or not Toggles.RepairAura.Value then return end

        -- Rate limiter: honours the slider (1–10 fires per second)
        local rate     = Options.RepairAuraRate and Options.RepairAuraRate.Value or 1
        local interval = 1 / rate
        local now      = tick()
        if now - lastFire < interval then return end

        -- Repair Hammer must be equipped
        local char = LocalPlayer.Character
        if not char then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool or tool.Name ~= "Repair Hammer" then return end

        -- Look for the "Repair" RemoteEvent inside the tool
        local repairRemote = tool:FindFirstChild("Repair")
        if not repairRemote then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local myPos   = hrp.Position
        local maxDist = Options.RepairAuraRange and Options.RepairAuraRange.Value or 30

        -- Find the nearest structure within range
        if not structuresFolder then return end
        local nearest     = nil
        local nearestDist = math.huge
        for _, child in ipairs(structuresFolder:GetDescendants()) do
            if child:IsA("Model") then
                local part = child.PrimaryPart or getItemMainPart(child)
                if part then
                    local dist = (myPos - part.Position).Magnitude
                    if dist <= maxDist and dist < nearestDist then
                        nearestDist = dist
                        nearest     = child
                    end
                end
            end
        end

        if nearest then
            lastFire = now
            pcall(function()
                repairRemote:FireServer(nearest)
            end)
        end
    end)
end

-- ============================================
-- PLAYER JOIN / LEAVE LISTENERS
-- ============================================
local playerAddedConn = Players.PlayerAdded:Connect(function(player)
    if playerESPVars.ESP then
        task.wait(2)
        createPlayerESP(player)
    end
end)
table.insert(connections, playerAddedConn)

local playerRemovingConn = Players.PlayerRemoving:Connect(function(player)
    removePlayerESP(player)
end)
table.insert(connections, playerRemovingConn)

-- ============================================
-- CHARACTER RESPAWN HANDLER
-- ============================================
LocalPlayer.CharacterRemoving:Connect(function()
    if autoSprintActive then stopAutoSprint() end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart", 10)
    task.wait(0.5)
    if Toggles.AutoSprint and Toggles.AutoSprint.Value then startAutoSprint() end
    if Toggles.AutoPickup and Toggles.AutoPickup.Value then startAutoPickup() end
end)

-- ============================================
-- ESP UTILITY FUNCTIONS
-- applyESPTextSize  – live-update all label font sizes
-- applyESPTransparency – live-update all highlight transparencies
-- ============================================
local function applyESPTextSize(size)
    espConfig.textSize = size
    local small = math.max(size - 2, 8)
    for _, sys in pairs(espSystems) do
        for _, esp in pairs(sys.instances) do
            if esp.NameLabel then esp.NameLabel.TextSize = size end
            if esp.DistLabel  then esp.DistLabel.TextSize  = small end
        end
    end
    for _, esp in pairs(mobESPInstances) do
        if esp.NameLabel then esp.NameLabel.TextSize = size end
        if esp.DistLabel  then esp.DistLabel.TextSize  = small end
    end
    for _, esp in pairs(structureESPInstances) do
        if esp.NameLabel then esp.NameLabel.TextSize = size end
        if esp.DistLabel  then esp.DistLabel.TextSize  = small end
    end
    for _, esp in pairs(playerESPInstances) do
        if esp.NameLabel   then esp.NameLabel.TextSize   = size  end
        if esp.ToolLabel   then esp.ToolLabel.TextSize   = small end
        if esp.HealthLabel then esp.HealthLabel.TextSize = small end
        if esp.DistLabel   then esp.DistLabel.TextSize   = small end
    end
end

local function applyESPTransparency()
    local fillT    = espConfig.fillTransparency
    local outlineT = espConfig.outlineTransparency
    local function updateH(esp)
        if esp.Highlight and esp.Highlight.Parent then
            esp.Highlight.FillTransparency    = fillT
            esp.Highlight.OutlineTransparency = outlineT
        end
    end
    for _, sys in pairs(espSystems) do
        for _, esp in pairs(sys.instances) do updateH(esp) end
    end
    for _, esp in pairs(mobESPInstances)       do updateH(esp) end
    for _, esp in pairs(structureESPInstances) do updateH(esp) end
    for _, esp in pairs(playerESPInstances)    do updateH(esp) end
end

-- ============================================
-- UI: VISUALS TAB
-- ============================================
do -- Visuals Tab local scope (fixes >200 local registers error)

-- Helper: apply Name/Distance to all ESP systems at once
local function setAllESPNames(state)
    mobOptions.Name = state; refreshMobESP()
    playerESPVars.Name = state; refreshPlayerESP()
    structureESPVars.Name = state; refreshStructureESP()
    for _, sys in pairs(espSystems) do sys.vars.Name = state; sys.refresh() end
end
local function setAllESPDistance(state)
    mobOptions.Distance = state; refreshMobESP()
    playerESPVars.Distance = state; refreshPlayerESP()
    structureESPVars.Distance = state; refreshStructureESP()
    for _, sys in pairs(espSystems) do sys.vars.Distance = state; sys.refresh() end
end

-- ESP Settings (Left) — shared controls for all ESP systems
local espSettingsGroup = Tabs.Visuals:AddLeftGroupbox("ESP Settings", "settings")

espSettingsGroup:AddSlider("ESPMaxDistance", {
    Text = "Max Distance", Default = 300, Min = 50, Max = 2000, Rounding = 0, Suffix = " studs",
    Tooltip = "Maximum render distance shared by all ESP systems.",
    Callback = function()
        refreshMobESP(); refreshPlayerESP(); refreshStructureESP()
        for _, sys in pairs(espSystems) do sys.refresh() end
    end,
})
espSettingsGroup:AddToggle("ESPShowNames",    { Text = "Show Names",    Default = false, Tooltip = "Show labels on all ESPs.", Callback = function(s) setAllESPNames(s)     end })
espSettingsGroup:AddToggle("ESPShowDistance", { Text = "Show Distance", Default = false, Tooltip = "Show distance on all ESPs.", Callback = function(s) setAllESPDistance(s) end })

-- [FIX #3] Text Size slider — live-updates all ESP label sizes
espSettingsGroup:AddSlider("ESPTextSize", {
    Text = "Text Size", Default = 10, Min = 8, Max = 24, Rounding = 0, Suffix = "px",
    Tooltip = "Font size for all ESP labels. Lower = less cluttered screen.",
    Callback = function(v) applyESPTextSize(v) end,
})
-- [FIX #4] Fill Transparency — controls how solid the Chams highlight fill is
espSettingsGroup:AddSlider("ESPFillTransparency", {
    Text = "Fill Transparency", Default = 40, Min = 0, Max = 100, Rounding = 0, Suffix = "%",
    Tooltip = "Chams fill opacity for all ESP. 0% = fully solid, 100% = invisible fill (outline only).",
    Callback = function(v) espConfig.fillTransparency = v / 100; applyESPTransparency() end,
})
-- [FIX #4] Outline Transparency
espSettingsGroup:AddSlider("ESPOutlineTransparency", {
    Text = "Outline Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%",
    Tooltip = "Chams outline opacity for all ESP. 0% = fully solid outline.",
    Callback = function(v) espConfig.outlineTransparency = v / 100; applyESPTransparency() end,
})

-- Mob ESP (Left)
local mobESPGroup = Tabs.Visuals:AddLeftGroupbox("Mob ESP", "eye")
mobESPGroup:AddToggle("MobESP",   { Text = "Mob ESP", Default = false, Tooltip = "Highlight zombies/monsters through walls.", Callback = function(s) mobOptions.ESP   = s; refreshMobESP() end })
mobESPGroup:AddToggle("MobChams", { Text = "Chams",   Default = false, Callback = function(s) mobOptions.Chams = s; refreshMobESP() end })

-- Player ESP (Left)
local playerESPGroup = Tabs.Visuals:AddLeftGroupbox("Player ESP", "users")
playerESPGroup:AddToggle("PlayerESP",    { Text = "Player ESP",   Default = false, Callback = function(s) playerESPVars.ESP    = s; refreshPlayerESP() end })
playerESPGroup:AddToggle("PlayerChams",  { Text = "Chams",         Default = false, Callback = function(s) playerESPVars.Chams  = s; refreshPlayerESP() end })
playerESPGroup:AddToggle("PlayerHealth", { Text = "Show Health",   Default = false, Tooltip = "Health bar + HP above players.", Callback = function(s) playerESPVars.Health = s; refreshPlayerESP() end })

-- Item ESP (Right) — all categories + structures in one groupbox
local itemESPGroup = Tabs.Visuals:AddRightGroupbox("Item ESP", "package")

itemESPGroup:AddToggle("ItemESPChams", {
    Text = "Chams (All Categories)", Default = false,
    Tooltip = "Chams highlight for all item categories.",
    Callback = function(s)
        for _, sys in pairs(espSystems) do sys.vars.Chams = s; sys.refresh() end
    end,
})
itemESPGroup:AddDivider()

local itemESPDefs = {
    { key = "Gun",      text = "Gun ESP",        tip = "Guns (Red)" },
    { key = "Melee",    text = "Melee ESP",       tip = "Melee (Orange)" },
    { key = "Medical",  text = "Medical ESP",     tip = "Medical Items (Green)" },
    { key = "Armor",    text = "Armor ESP",       tip = "Armor (Blue)" },
    { key = "Food",     text = "Food ESP",        tip = "Food (Lime)" },
    { key = "Resource", text = "Resources ESP",   tip = "Resources (Cyan)" },
    { key = "Fuel",     text = "Fuel ESP",        tip = "Fuel (Gold)" },
    { key = "Ability",  text = "Abilities ESP",   tip = "Abilities (Purple)" },
}
for _, d in ipairs(itemESPDefs) do
    -- [FIX #4] Color picker chained to each category toggle for live color control
    itemESPGroup:AddToggle(d.key .. "ESPEnabled", {
        Text = d.text, Default = false, Tooltip = d.tip,
        Callback = function(s) espSystems[d.key].vars.ESP = s; espSystems[d.key].refresh() end,
    }):AddColorPicker(d.key .. "ESPColor", {
        Default = espSystems[d.key].colors.fill,
        Title = d.text .. " Color",
        Callback = function(c)
            espSystems[d.key].colors.fill = c
            for _, esp in pairs(espSystems[d.key].instances) do
                if esp.Highlight and esp.Highlight.Parent then esp.Highlight.FillColor = c end
                if esp.NameLabel then esp.NameLabel.TextColor3 = c end
            end
        end,
    })
end

itemESPGroup:AddDivider()
itemESPGroup:AddLabel("Structures")
itemESPGroup:AddToggle("StructureESP",   { Text = "Structure ESP", Default = false, Callback = function(s) structureESPVars.ESP   = s; refreshStructureESP() end })
itemESPGroup:AddToggle("StructureChams", { Text = "Chams",         Default = false, Callback = function(s) structureESPVars.Chams = s; refreshStructureESP() end })

end -- Visuals Tab local scope

-- ============================================
-- UI: PLAYER TAB
-- ============================================
do -- Player Tab local scope

local movementGroup = Tabs.Player:AddLeftGroupbox("Movement", "move")

movementGroup:AddToggle("InfJump", {
    Text = "Inf Jump",
    Default = false,
    Callback = function(state)
        Library:Notify({
            Title = "Inf Jump",
            Description = state and "Enabled - jump anywhere!" or "Disabled",
            Time = 2,
        })
    end,
})

local jumpConn = UserInputService.JumpRequest:Connect(function()
    if Toggles.InfJump.Value then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)
table.insert(connections, jumpConn)

movementGroup:AddToggle("NoClip", {
    Text = "NoClip",
    Default = false,
    Callback = function(state)
        Library:Notify({
            Title = "NoClip",
            Description = state and "Enabled - walk through walls!" or "Disabled",
            Time = 2,
        })
    end,
})

movementGroup:AddToggle("AutoSprint", {
    Text = "Auto Sprint",
    Default = false,
    Callback = function(state)
        if state then
            startAutoSprint()
            Library:Notify({ Title = "Auto Sprint", Description = "Enabled (holding LeftShift)", Time = 2 })
        else
            stopAutoSprint()
            Library:Notify({ Title = "Auto Sprint", Description = "Disabled", Time = 2 })
        end
    end,
})

-- [ADDED v7.3] Bunny Hop toggle
movementGroup:AddToggle("BunnyHop", {
    Text = "Bunny Hop",
    Default = false,
    Tooltip = "Automatically jumps while moving for speed/momentum boost.",
    Callback = function(state)
        if state then
            startBhop()
            Library:Notify({ Title = "Bunny Hop", Description = "Enabled - jump while moving!", Time = 2 })
        else
            stopBhop()
            Library:Notify({ Title = "Bunny Hop", Description = "Disabled", Time = 2 })
        end
    end,
})

-- [ADDED] Funny Dance FE groupbox
local danceGroup = Tabs.Player:AddRightGroupbox("Funny Dance FE", "music")

danceGroup:AddToggle("FunnyDance", {
    Text = "Funny Dance",
    Default = false,
    Tooltip = "Plays a looping dance animation visible to all players. FE compatible!",
    Callback = function(state)
        if state then
            startFunnyDance()
            Library:Notify({ Title = "Funny Dance", Description = "Enabled – everyone can see your moves!", Time = 3 })
        else
            stopFunnyDance()
            Library:Notify({ Title = "Funny Dance", Description = "Disabled", Time = 2 })
        end
    end,
})

danceGroup:AddDropdown("DanceStyle", {
    Values = { "Shuffle (Dance 1)", "Twist (Dance 2)", "Robot (Dance 3)" },
    Default = 1,
    Text = "Dance Style",
    Tooltip = "Select dance style. Toggle off and on again to apply a new style.",
})

-- Update Notice groupbox
local updateNoticeGroup = Tabs.Player:AddRightGroupbox("Update Notice", "info")

updateNoticeGroup:AddLabel("I tried everything, but Speed Hack, Fly,")
updateNoticeGroup:AddLabel("and Bring Pickup Item could not be made")
updateNoticeGroup:AddLabel("to work. The server validates positions too")
updateNoticeGroup:AddLabel("aggressively to do anything with them.")
updateNoticeGroup:AddLabel("")
updateNoticeGroup:AddLabel("I still hope everyone enjoys this script,")
updateNoticeGroup:AddLabel("even if a few of the best features no")
updateNoticeGroup:AddLabel("longer work. Have fun!")

end -- Player Tab local scope

-- ============================================
-- UI: COMBAT TAB
-- ============================================
do -- Combat Tab local scope

local killAuraGroup = Tabs.Combat:AddLeftGroupbox("Kill Aura", "target")

killAuraGroup:AddToggle("KillAura", {
    Text = "Kill Aura",
    Default = false,
    Tooltip = "AoE auto-attack: hits ALL mobs in range in one swing. Priority, auto-equip, and visual indicator configurable below.",
    Callback = function(state)
        if state then
            startKillAura()
            Library:Notify({ Title = "Kill Aura", Description = "Enabled", Time = 2 })
        else
            stopKillAura()
            Library:Notify({ Title = "Kill Aura", Description = "Disabled", Time = 2 })
        end
    end,
})

killAuraGroup:AddDropdown("KillAuraPriority", {
    Values = {"Nearest", "Lowest HP", "Highest HP"},
    Default = 1,
    Text = "Target Priority",
    Tooltip = "Determines which mob is attacked first (relevant for RemoteClick fallback; AoE mode hits all anyway).",
})

killAuraGroup:AddToggle("KillAuraAutoEquip", {
    Text = "Auto-Equip Weapon",
    Default = false,
    Tooltip = "Automatically equips the fastest available weapon from your backpack when nothing is held.",
})

killAuraGroup:AddToggle("KillAuraShowIndicator", {
    Text = "Show Target Indicator",
    Default = true,
    Tooltip = "Draws a red snapline and circle to the current primary target.",
})

killAuraGroup:AddToggle("KillAuraExtendedRange", {
    Text = "Extended Range (+2 studs)",
    Default = true,
    Tooltip = "Adds 2 studs to your range. Helps the server register hits at the edge of reach.",
})

killAuraGroup:AddSlider("KillAuraRange", {
    Text = "Base Range",
    Default = 6,
    Min = 1,
    Max = 20,
    Rounding = 0,
    Suffix = " studs",
    Tooltip = "Base attack distance. Extended Range adds +2 studs. Normal melee reach is ~5-7 studs.",
})

killAuraGroup:AddSlider("KillAuraSwingRate", {
    Text = "Swing Delay",
    Default = 0.5,
    Min = 0.1,
    Max = 1.0,
    Rounding = 2,
    Suffix = " s",
    Tooltip = "Minimum delay between swings. Weapon speed is always enforced as a hard lower bound — you can never swing faster than the weapon physically allows (safe mode).",
})

killAuraGroup:AddLabel("Weapon Speeds:", { DoesWrap = true })
killAuraGroup:AddLabel("  Knife/Katana: 0.25-0.3s", { DoesWrap = true })
killAuraGroup:AddLabel("  Bat/Hatchet: 0.4-0.45s", { DoesWrap = true })
killAuraGroup:AddLabel("  Fire Axe/Sledgehammer: 0.55-0.6s", { DoesWrap = true })

-- ============================================
-- AIMBOT UI
-- [ADDED v7.3] Combat tab - Aimbot controls
-- ============================================
local aimbotGroup = Tabs.Combat:AddRightGroupbox("Aimbot", "crosshair")

aimbotGroup:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Tooltip = "Automatically aims camera at the nearest valid target within FOV and range.",
    Callback = function(state)
        if state then
            startAimbot()
            Library:Notify({ Title = "Aimbot", Description = "Enabled - aim at targets!", Time = 2 })
        else
            stopAimbot()
            Library:Notify({ Title = "Aimbot", Description = "Disabled", Time = 2 })
        end
    end,
})

aimbotGroup:AddDropdown("AimbotTarget", {
    Text = "Target Mode",
    Default = "Mobs",
    Values = {"Mobs", "Players", "Both"},
    Tooltip = "What type of entities to target. Mobs = zombies/monsters, Players = other players, Both = either.",
})

aimbotGroup:AddDropdown("AimbotPart", {
    Text = "Aim Part",
    Default = "Head",
    Values = {"Head", "HumanoidRootPart", "Torso", "UpperTorso"},
    Tooltip = "Which body part to aim at. Head = headshots, HumanoidRootPart = center mass.",
})

aimbotGroup:AddDropdown("AimbotPriority", {
    Text = "Target Priority",
    Default = "Distance",
    Values = {"Distance", "FOV"},
    Tooltip = "How to choose which target to aim at. Distance = closest in 3D space, FOV = closest to crosshair.",
})

aimbotGroup:AddSlider("AimbotRange", {
    Text = "Max Range",
    Default = 200,
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Suffix = " studs",
    Tooltip = "Maximum distance to search for targets.",
})

aimbotGroup:AddSlider("AimbotFOV", {
    Text = "FOV Radius",
    Default = 100,
    Min = 10,
    Max = 500,
    Rounding = 0,
    Suffix = " px",
    Tooltip = "Maximum distance from screen center to consider targets. Lower = more precise, higher = wider aim.",
})

aimbotGroup:AddSlider("AimbotSmoothness", {
    Text = "Smoothness",
    Default = 0.3,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Tooltip = "0 = instant snap, 1 = very smooth tracking. Higher = more legit-looking.",
})

aimbotGroup:AddToggle("AimbotPrediction", {
    Text = "Velocity Prediction",
    Default = false,
    Tooltip = "Predict where moving targets will be based on their velocity.",
})

aimbotGroup:AddSlider("AimbotPredictionAmount", {
    Text = "Prediction Amount",
    Default = 0.15,
    Min = 0.05,
    Max = 0.5,
    Rounding = 2,
    Suffix = " s",
    Tooltip = "How far ahead to predict. Higher = more prediction for fast-moving targets.",
})

aimbotGroup:AddDivider()

aimbotGroup:AddToggle("AimbotFOVCircle", {
    Text = "FOV Circle",
    Default = false,
    Tooltip = "Draw a circle on screen showing the current Aimbot FOV radius.",
})

end -- Combat Tab local scope

-- ============================================
-- UI: EXPLOITS TAB
-- ============================================
do -- Exploits Tab local scope

-- LEFT: Auto Pickup (proximity-based, no player teleport)
local autoPickupGroup = Tabs.Exploits:AddLeftGroupbox("Auto Pickup", "magnet")

autoPickupGroup:AddToggle("AutoPickup", {
    Text = "Auto Pickup",
    Default = false,
    Tooltip = "Automatically picks up items within radius. Uses up to 4 FE methods in parallel.",
    Callback = function(state)
        if state then
            startAutoPickup()
            Library:Notify({ Title = "Auto Pickup", Description = "Active – " .. (Options.AutoPickupRadius and Options.AutoPickupRadius.Value or 20) .. " stud radius", Time = 2 })
        else
            stopAutoPickup()
            Library:Notify({ Title = "Auto Pickup", Description = "Stopped", Time = 2 })
        end
    end,
})

autoPickupGroup:AddSlider("AutoPickupRadius", {
    Text = "Radius",
    Default = 20,
    Min = 5,
    Max = 35,
    Rounding = 0,
    Suffix = " studs",
    Tooltip = "How far away items are picked up. Combine methods A+B+C for best coverage at range.",
})

autoPickupGroup:AddToggle("AutoPickupAll", {
    Text = "All Items",
    Default = false,
    Tooltip = "Pick up every item in the folder. Disable to use the whitelist filter below.",
})

autoPickupGroup:AddDivider()
autoPickupGroup:AddLabel("FE Methods (combine to test)", { DoesWrap = true })

autoPickupGroup:AddToggle("AutoPickupMethodRemote", {
    Text = "A – Remote (PickUpItem)",
    Default = true,
    Tooltip = "FireServer on Remotes.Interaction.PickUpItem + AdjustBackpack. Fast, works when server has no strict distance check.",
})

autoPickupGroup:AddToggle("AutoPickupMethodTouch", {
    Text = "B – Touch Simulate",
    Default = true,
    Tooltip = "firetouchinterest(HRP, itemPart) – simulates the player touching the item part. Fires server-side Touched handlers.",
})

autoPickupGroup:AddToggle("AutoPickupMethodPrompt", {
    Text = "C – ProximityPrompt",
    Default = true,
    Tooltip = "fireproximityprompt(prompt) – fires the item's ProximityPrompt if one exists. Useful for items using prompt-based pickup.",
})

autoPickupGroup:AddDivider()
autoPickupGroup:AddLabel("Item Whitelist (when All Items is off)")
autoPickupGroup:AddDropdown("AutoPickupWhitelist", {
    Values = itemNames,
    Default = 1,
    Multi = true,
    Text = "Whitelist",
    Tooltip = "Items to pick up. Only active when 'All Items' is disabled.",
    Searchable = true,
})

autoPickupGroup:AddDivider()
autoPickupGroup:AddLabel("Blacklist (blocks PickUpItem remote)")
autoPickupGroup:AddDropdown("AutoPickupBlacklist", {
    Values = itemNames,
    Default = {
        -- Food (auto-consume on pickup)
        "Chips", "Carrot", "Bloxiade", "Beans", "MRE", "Bloxy Cola",
        -- Fuel
        "Nuclear Fuel", "Refined Fuel", "Fuel",
        -- Misc (not in Bring Pickup)
        "Power Armor Arm", "Power Armor Core", "Radio Tower Part",
        -- Resources
        "AC", "Battery", "Battery Pack", "Bucket", "Dumbell", "Exhaust Pipe",
        "Reactor Component", "Refined Metal", "Satellite Dish", "Scrap", "Screws",
        "Spatula", "Tray", "TV", "Watch", "Zombie Heart",
        -- Abilities
        "Airstrike", "Attack Order", "Call of the Dead", "Summon Brute",
        "Summon Zombies", "Taunt", "The Future", "The Past", "The Present",
    },
    Multi = true,
    Text = "Blacklist",
    Tooltip = "Blacklisted items skip the PickUpItem remote. AdjustBackpack still fires so they are stored. Pre-selected: all items not in the Bring Pickup filter (Food, Fuel, Resources, Misc, Abilities).",
    Searchable = true,
})

-- RIGHT (second): Repair Aura
local repairAuraGroup = Tabs.Exploits:AddRightGroupbox("Repair Aura", "wrench")

repairAuraGroup:AddToggle("RepairAura", {
    Text    = "Repair Aura",
    Default = false,
    Tooltip = "Automatically repairs structures within range. Repair Hammer must be equipped.",
    Callback = function(state)
        if state then
            startRepairAura()
            Library:Notify({ Title = "Repair Aura", Description = "Active – repairing structures within " .. (Options.RepairAuraRange and Options.RepairAuraRange.Value or 30) .. " studs", Time = 2 })
        else
            stopRepairAura()
            Library:Notify({ Title = "Repair Aura", Description = "Stopped", Time = 2 })
        end
    end,
})

repairAuraGroup:AddSlider("RepairAuraRange", {
    Text     = "Range",
    Default  = 30,
    Min      = 5,
    Max      = 30,
    Rounding = 0,
    Suffix   = " studs",
    Tooltip  = "Maximum distance to structures that will be repaired.",
})

repairAuraGroup:AddSlider("RepairAuraRate", {
    Text     = "Rate",
    Default  = 1,
    Min      = 1,
    Max      = 10,
    Rounding = 0,
    Suffix   = "/s",
    Tooltip  = "How many repair remote fires per second (1 = minimum, 10 = maximum).",
})

repairAuraGroup:AddLabel("Requires: Repair Hammer equipped", { DoesWrap = true })

end -- Exploits Tab local scope

-- ============================================
-- UI: MISC TAB
-- ============================================
do -- Misc Tab local scope

local utilityGroup = Tabs.Misc:AddLeftGroupbox("Utilities", "shield-check")

utilityGroup:AddToggle("AntiAFK", {
    Text = "Anti-AFK",
    Default = true,
    Tooltip = "Prevents the game from kicking you for being idle",
    Callback = function(state)
        if state then
            startAntiAFK()
            Library:Notify({ Title = "Anti-AFK", Description = "Enabled - you won't be kicked for idling", Time = 2 })
        else
            stopAntiAFK()
            Library:Notify({ Title = "Anti-AFK", Description = "Disabled", Time = 2 })
        end
    end,
})

utilityGroup:AddToggle("Fullbright", {
    Text = "Fullbright",
    Default = false,
    Tooltip = "Brightens the game world by modifying lighting properties. Restores originals when disabled.",
    Callback = function(state)
        if state then
            enableFullbright()
            Library:Notify({ Title = "Fullbright", Description = "Enabled", Time = 2 })
        else
            disableFullbright()
            Library:Notify({ Title = "Fullbright", Description = "Disabled - original lighting restored", Time = 2 })
        end
    end,
})

utilityGroup:AddToggle("RemoveFog", {
    Text = "Remove Fog",
    Default = false,
    Tooltip = "Removes visual fog for clear long-distance visibility. Restores original fog when disabled.",
    Callback = function(state)
        if state then
            enableRemoveFog()
            Library:Notify({ Title = "Remove Fog", Description = "Enabled - fog removed for clear visibility", Time = 2 })
        else
            disableRemoveFog()
            Library:Notify({ Title = "Remove Fog", Description = "Disabled - original fog restored", Time = 2 })
        end
    end,
})

-- [ADDED v7.3] Server Tools groupbox
local serverGroup = Tabs.Misc:AddRightGroupbox("Server Tools", "server")

serverGroup:AddButton("Server Hop", function()
    Library:Notify({ Title = "Server Hop", Description = "Finding new server...", Time = 2 })
    serverHop()
end)

serverGroup:AddButton("Rejoin Server", function()
    Library:Notify({ Title = "Rejoin", Description = "Rejoining server...", Time = 2 })
    rejoinServer()
end)

serverGroup:AddDivider()
serverGroup:AddLabel("Current Job ID:")
serverGroup:AddLabel("JobId", { Text = game.JobId ~= "" and game.JobId:sub(1, 30) .. "..." or "Unknown", DoesWrap = true })

-- [ADDED v7.3] Remote Spy groupbox
local remoteSpyGroup = Tabs.Misc:AddRightGroupbox("Remote Spy", "bug")

remoteSpyGroup:AddToggle("RemoteSpyEnabled", {
    Text = "Enable Remote Spy",
    Default = false,
    Tooltip = "Logs all RemoteEvent/RemoteFunction calls for analysis.",
    Callback = function(state)
        if state then
            startRemoteSpy()
        else
            stopRemoteSpy()
        end
    end,
})

remoteSpyGroup:AddLabel("Logs remote calls to console.")
remoteSpyGroup:AddLabel("Check Developer Console (F9)")

-- [ADDED v7.3.3] FPS Unlocker groupbox
local fpsUnlockerGroup = Tabs.Misc:AddRightGroupbox("FPS Unlocker", "zap")

fpsUnlockerGroup:AddSlider("FPSCap", {
    Text = "FPS Cap",
    Default = 144,
    Min = 30,
    Max = 360,
    Rounding = 0,
    Suffix = " fps",
    Tooltip = "Set the target FPS cap. Applied when Unlock FPS is enabled.",
    Callback = function(value)
        if Toggles.FPSUnlock and Toggles.FPSUnlock.Value then
            pcall(function() if setfpscap then setfpscap(value) end end)
        end
    end,
})

fpsUnlockerGroup:AddToggle("FPSUnlock", {
    Text = "Unlock FPS",
    Default = false,
    Tooltip = "Remove the default 60 FPS cap using setfpscap() executor API.",
    Callback = function(state)
        pcall(function()
            if setfpscap then
                if state then
                    local cap = Options.FPSCap and Options.FPSCap.Value or 144
                    setfpscap(cap)
                    Library:Notify({ Title = "FPS Unlocker", Description = "FPS cap set to " .. cap, Time = 2 })
                else
                    setfpscap(60)
                    Library:Notify({ Title = "FPS Unlocker", Description = "FPS restored to 60", Time = 2 })
                end
            else
                Library:Notify({ Title = "FPS Unlocker", Description = "setfpscap() not available in this executor.", Time = 3 })
            end
        end)
    end,
})

end -- Misc Tab local scope

-- ============================================
-- UNLOAD CLEANUP
-- [CHANGED] Cleans up all 6 category ESP systems
-- ============================================
Library:OnUnload(function()
    -- Clean up Mob ESP
    for char, _ in pairs(mobESPInstances) do
        removeMobESP(char)
    end

    -- Clean up all 6 category ESP systems
    for _, sys in pairs(espSystems) do
        for item, _ in pairs(sys.instances) do
            sys.remove(item)
        end
    end

    -- Clean up Player ESP
    for player, _ in pairs(playerESPInstances) do
        removePlayerESP(player)
    end

    -- Clean up Structure ESP
    for structure, _ in pairs(structureESPInstances) do
        removeStructureESP(structure)
    end

    -- Disconnect all connections with pcall safety
    for _, conn in ipairs(connections) do
        if typeof(conn) == "RBXScriptConnection" then
            pcall(function() conn:Disconnect() end)
        end
    end
    connections = {}

    -- Stop all active features
    stopAutoPickup()
    stopBringPickup()
    stopRepairAura()
    stopFly()
    stopAutoSprint()
    stopKillAura()
    stopAimbot()  -- [ADDED v7.3] Clean up aimbot on unload
    stopBhop()        -- [ADDED v7.3] Clean up bunny hop on unload
    stopFunnyDance()  -- Clean up funny dance on unload
    stopRemoteSpy()   -- [ADDED v7.3] Clean up remote spy on unload
    -- [ADDED v7.3.3] Restore FPS cap on unload
    pcall(function() if setfpscap then setfpscap(60) end end)
    -- [ADDED v7.3.3] Remove FOV circle drawing on unload
    if fovCircle then pcall(function() fovCircle:Remove() end); fovCircle = nil end
    -- [REMOVED v7.3.1] No Stamina Drain - game uses hunger, not stamina
    -- Restore Remove Fog
    if Toggles.RemoveFog and Toggles.RemoveFog.Value then
        disableRemoveFog()
    end

    -- Restore Speed Hack
    if Toggles.SpeedHack and Toggles.SpeedHack.Value then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalValues.walkSpeed or 16
            end
        end
    end

    -- Restore Fullbright
    if Toggles.Fullbright and Toggles.Fullbright.Value then
        disableFullbright()
    end

    -- Stop Anti-AFK
    stopAntiAFK()

    Library:Notify({ Title = "SPYMM", Description = "Unloaded. Bye!", Time = 3 })
    print("SPYMM v8.3 unloaded.")
end)

-- ============================================
-- UI SETTINGS TAB
-- ============================================
do -- UI Settings Tab local scope

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end,
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})

MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})

MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value)
        Library:SetDPIScale(DPI)
    end,
})

MenuGroup:AddSlider("UICornerSlider", {
    Text = "Corner Radius",
    Default = Library.CornerRadius,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Callback = function(value)
        Window:SetCornerRadius(value)
    end,
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
    :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

end -- UI Settings Tab local scope

Library.ToggleKeybind = Options.MenuKeybind

-- ============================================
-- THEME & SAVE MANAGERS
-- ============================================
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("SPYMM")
SaveManager:SetFolder("SPYMM/survive-the-apocalypse")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

-- ============================================
-- INIT NOTIFICATION
-- ============================================
Library:Notify({ Title = "SPYMM v8.3", Description = "Loaded! Gun|Melee|Medical|Armor|Food|Resources\nRight Shift = toggle menu.", Time = 5 })

local espCounts = { Gun="Red", Melee="Orange", Medical="Green", Armor="Blue", Food="Lime", Resource="Silver" }
print("SPYMM v8.3 loaded | " .. #itemNames .. " items tracked | Right Shift = menu")
for cat, col in pairs(espCounts) do
    print(string.format("  %s ESP (%s) - %d items", cat, col, #espSystems[cat].items))
end
