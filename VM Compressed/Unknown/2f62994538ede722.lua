--// Load Library
local PHCzack = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHCzack/PHCzackScript/refs/heads/main/library.lua"))()

--// Create Window
local Window = PHCzack:CreateWindow({
    Name = "PHCzack Script [Plants Vs Brainrot]"
})

--// Show a startup notification
Window:Notify({
    Title = "Welcome!",
    Content = "Updated 10/23/25 - Bug Fixed✅",
    Duration = 5
})

--// Create Tabs
local AutoTab = Window:CreateTab("Auto")
local FarmTab = Window:CreateTab("Farm")
local ShopTab = Window:CreateTab("Shop")
local BrainrotsTab = Window:CreateTab("Brainrots")
local MiscTab = Window:CreateTab("Misc")
--local VisualTab = Window:CreateTab("Visual")
local PlatformTab = Window:CreateTab("PlatForm")

--// Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--// =========================
-- Variables
--// =========================
local autoClaimEnabled = false
local autoSellEnabled = false
local autoSellPlantsEnabled = false
local autoEquipEnabled = false
local autoBuyEnabled = false
local autoBuyGearEnabled = false
local followAttackEnabled = false
local espEnabled = false 
local legendaryAttackEnabled = false
local selectedVisuals = {}
local hiddenObjects = {}
local selectedPlots = {}
local selectedSeeds = {}
local selectedGears = {}
local claimInterval = 0.1
local originalPosition = nil
local selectedRarities = {}
local equipDelay = 5  
local selectedRarityAttackEnabled = false
local frostBlowerEnabled = false
local bananaGunEnabled = false
local carrotLauncherEnabled = false
local freezeEnabled = false
local autoOpenLuckyEggEnabled = false
local autoOpenSecretLuckyEggEnabled = false
local autoOpenMemeLuckyEggEnabled = false
local autoFuseEnabled = false
local autoRebirthEnabled = false
local autoBuyAllPlantsEnabled = false
local autoBuyAllGearEnabled = false
local unlimitedJump = false
local antiAFKEnabled = false
local afkConnection = nil
local limitedAttackEnabled = false
-- Variables
local selectedPlants = {}
local selectedBrainrots = {}
local autoFuseEnabled = false
local hasFused = false
-- Variables
local selectedFuseItems = {}
local autoFuseV2Enabled = false

-- Fuse combinations mapping
local fuseCombinations = {
    ["Bombardilo Watermelondrilo"] = {"Watermelon", "Bombardiro Crocodilo"},
    ["Noobini Cactusini"] = {"Cactus", "Noobini Bananini"},
    ["Orangutini Strawberrini"] = {"Strawberry", "Orangutini Ananassini"},
    ["Svinino Pumpkinino"] = {"Pumpkin", "Svinino Bombondino"},
    ["Brr Brr Sunflowerim"] = {"Sunflower", "Brr Brr Patapim"},
    ["Dragonfrutina Dolphinita"] = {"Dragon Fruit", "Bananita Dolphinita"},
    ["Eggplantini Burbalonini"] = {"Eggplant", "Eggplantini Burbalonini"},
    ["Cocotanko Giraffanto"] = {"Cocotank", "Cocotanko Giraffanto"},
    ["Carnivourita Tralalerita"] = {"Carnivorous Plant", "Carnivourita Tralalerita"},
    ["Los Mr Carrotitos"] = {"Mr Carrot", "Los Mr Carrotitos"},
    ["Lemowzio"] = {"King Limone", "Lemowzio"}
}


-- Seeds & Gear List
local seedsList = {
    "Cactus Seed","Strawberry Seed","Pumpkin Seed","Sunflower Seed",
    "Dragon Fruit Seed","Eggplant Seed","Watermelon Seed","Grape Seed",
    "Cocotank Seed","Carnivorous Plant Seed","Mr Carrot Seed",
    "Tomatrio Seed","Shroombino Seed", "Mango Seed", "King Limone Seed"
}

local gearList = {
    "Water Bucket","Frost Grenade","Banana Gun","Frost Blower","Carrot Launcher"
}


local plantsList1 = {
    "Cactus", "Strawberry", "Pumpkin", "Sunflower",
            "Dragon Fruit", "Eggplant", "Watermelon", "Grape",
            "Cocotank", "Carnivorous Plant", "Tomade Torelli",
            "Mr Carrot", "Tomatrio", "Shroombino", "Mango", "King Limone"
}


-- ✅ Safe Plots Loader
local plots = workspace:WaitForChild("Plots", 10)
if not plots then
    warn("⚠️ Plots not found, creating dummy folder.")
    plots = Instance.new("Folder", workspace)
    plots.Name = "Plots"
end

local function safeGetPlot(id, childName)
    local plot = plots:FindFirstChild(tostring(id))
    if plot then
        return plot:FindFirstChild(childName)
    end
end

-- ✅ Safe Visual Targets
local visualTargets = {
    ["Board"] = {
        safeGetPlot(1,"Other") and safeGetPlot(1,"Other"):FindFirstChild("Tier3") and safeGetPlot(1,"Other").Tier3:FindFirstChild("Model"),
        safeGetPlot(2,"Other") and safeGetPlot(2,"Other"):FindFirstChild("Tier1") and safeGetPlot(2,"Other").Tier1:FindFirstChild("Model"),
        safeGetPlot(3,"Other") and safeGetPlot(3,"Other"):FindFirstChild("Tier1") and safeGetPlot(3,"Other").Tier1:FindFirstChild("Model"),
        safeGetPlot(4,"Other") and safeGetPlot(4,"Other"):FindFirstChild("Tier1") and safeGetPlot(4,"Other").Tier1:FindFirstChild("Model"),
        safeGetPlot(5,"Other") and safeGetPlot(5,"Other"):FindFirstChild("Tier1") and safeGetPlot(5,"Other").Tier1:FindFirstChild("Model"),
        safeGetPlot(6,"Other") and safeGetPlot(6,"Other"):FindFirstChild("Tier1") and safeGetPlot(6,"Other").Tier1:FindFirstChild("Model")
    },
    ["Rows"] = {
        safeGetPlot(1,"Rows"),
        safeGetPlot(2,"Rows"),
        safeGetPlot(3,"Rows"),
        safeGetPlot(4,"Rows"),
        safeGetPlot(5,"Rows"),
        safeGetPlot(6,"Rows")
    },
    ["Plants"] = {
        safeGetPlot(1,"Plants"),
        safeGetPlot(2,"Plants"),
        safeGetPlot(3,"Plants"),
        safeGetPlot(4,"Plants"),
        safeGetPlot(5,"Plants"),
        safeGetPlot(6,"Plants")
    },
    ["PlatForms"] = {
        safeGetPlot(1,"Brainrots"),
        safeGetPlot(2,"Brainrots"),
        safeGetPlot(3,"Brainrots"),
        safeGetPlot(4,"Brainrots"),
        safeGetPlot(5,"Brainrots"),
        safeGetPlot(6,"Brainrots")
    }
}

-- Plots teleport points
local plotLocations = {
    ["Plot 1"] = {Vector3.new(94,10,685),Vector3.new(93,10,697),Vector3.new(93,10,707)},
    ["Plot 2"] = {Vector3.new(-7,10,685),Vector3.new(-7,10,697),Vector3.new(-6,10,707)},
    ["Plot 3"] = {Vector3.new(-107,10,685),Vector3.new(-108,10,696),Vector3.new(-108,10,708)},
    ["Plot 4"] = {Vector3.new(-209,10,685),Vector3.new(-209,10,697),Vector3.new(-209,10,708)},
    ["Plot 5"] = {Vector3.new(-310,10,685),Vector3.new(-311,10,696),Vector3.new(-310,10,707)},
    ["Plot 6"] = {Vector3.new(-411,10,685),Vector3.new(-412,10,697),Vector3.new(-412,10,708)},
}

--// =========================
-- Helper Functions
--// =========================


local function fireRemoteSafely(remote, args)
    local success, err = pcall(function()
        remote:FireServer(unpack(args))
    end)
    if not success then warn("Remote error:", err) end
    return success
end

local function getRarity(brainrot)
    if brainrot then
        local rarity = brainrot:FindFirstChild("Rarity") or brainrot:GetAttribute("Rarity")
        if rarity then
            return rarity.Value or rarity
        end
    end
    return "Unknown"
end

local function getBrainrotUUID(brainrot)
    if not brainrot then return nil end
    if brainrot:GetAttribute("Uuid") then
        return brainrot:GetAttribute("Uuid")
    end
    local uuidObj = brainrot:FindFirstChild("Uuid")
    if uuidObj and uuidObj:IsA("StringValue") then
        return uuidObj.Value
    end
    return brainrot.Name
end

local function getPredictedPosition(brainrot, delay)
    local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
    if not hrp then return nil end

    local speedValue = brainrot:FindFirstChild("Speed")
    local velocity = hrp.Velocity
    local speed = speedValue and speedValue.Value or velocity.Magnitude
    local direction = velocity.Magnitude > 0 and velocity.Unit or Vector3.zero
    local predicted = hrp.Position + direction * (speed * delay)
    return predicted
end

local function getTargetPosition(brainrot)
    if not brainrot then return nil end
    local head = brainrot:FindFirstChild("Head")
    if head and head:IsA("BasePart") then
        return head.Position
    end
    local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
    if hrp then
        return hrp.Position + Vector3.new(0, 2, 0)
    end
    return nil
end

--// Weapon & Gear Equip Functions
local WeaponAttack = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("AttacksServer"):WaitForChild("WeaponAttack")
local UseItem = ReplicatedStorage.Remotes:WaitForChild("UseItem")
local weaponName = "Leather Grip Bat"

local function equipWeapon()
    local char = LocalPlayer.Character
    if not char then return end
    if char:FindFirstChildOfClass("Tool") and char:FindFirstChildOfClass("Tool").Name == weaponName then
        return
    end
    local tool = LocalPlayer.Backpack:FindFirstChild(weaponName)
    if tool then
        char.Humanoid:EquipTool(tool)
    end
end

local function getFrostGrenade()
    local char = LocalPlayer.Character
    local backpack = LocalPlayer.Backpack
    if not char or not backpack then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, "Frost Grenade") then
            return tool
        end
    end
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, "Frost Grenade") then
            return tool
        end
    end
    return nil
end

local function equipFrostGrenade()
    local char = LocalPlayer.Character
    if not char then return nil end
    local grenade = getFrostGrenade()
    if grenade and not char:FindFirstChild(grenade.Name) then
        char.Humanoid:EquipTool(grenade)
        return grenade
    end
    return grenade
end

local function equipFrostBlower()
    local char = LocalPlayer.Character
    if not char then return nil end
    local blower = char:FindFirstChildWhichIsA("Tool")
    if blower and blower.Name:match("Frost Blower") then
        return blower
    end
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool.Name:match("Frost Blower") then
            char.Humanoid:EquipTool(tool)
            return tool
        end
    end
    return nil
end

local function equipBananaGun()
    local char = LocalPlayer.Character
    if not char then return nil end
    local gun = char:FindFirstChildWhichIsA("Tool")
    if gun and gun.Name:match("Banana Gun") then
        return gun
    end
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool.Name:match("Banana Gun") then
            char.Humanoid:EquipTool(tool)
            return tool
        end
    end
    return nil
end

local function getCarrotLauncher()
    local char = LocalPlayer.Character
    local backpack = LocalPlayer.Backpack
    if not char or not backpack then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, "Carrot Launcher") then
            return tool
        end
    end
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, "Carrot Launcher") then
            return tool
        end
    end
    return nil
end

local function equipCarrotLauncher()
    local char = LocalPlayer.Character
    if not char then return nil end
    local launcher = getCarrotLauncher()
    if launcher and not char:FindFirstChild(launcher.Name) then
        char.Humanoid:EquipTool(launcher)
        return launcher
    end
    return launcher
end

--// Get Nearest Brainrot Functions
local function getNearestBrainrot()
    local folder = workspace:FindFirstChild("ScriptedMap") and workspace.ScriptedMap:FindFirstChild("Brainrots")
    if not folder then return nil end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local closest, dist = nil, math.huge
    for _, brainrot in ipairs(folder:GetChildren()) do
        if brainrot:IsA("Model") then
            local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local mag = (hrp.Position - root.Position).Magnitude
                if mag < dist then
                    closest, dist = brainrot, mag
                end
            end
        end
    end
    return closest
end

local function getNearestLegendaryBrainrot()
    local folder = workspace:FindFirstChild("ScriptedMap") and workspace.ScriptedMap:FindFirstChild("Brainrots")
    if not folder then return nil end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local closest, dist = nil, math.huge
    for _, brainrot in ipairs(folder:GetChildren()) do
        if brainrot:IsA("Model") and getRarity(brainrot) == "Legendary" then
            local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local mag = (hrp.Position - root.Position).Magnitude
                if mag < dist then
                    closest, dist = brainrot, mag
                end
            end
        end
    end
    return closest
end

local function getNearestLimitedBrainrot()
    local folder = workspace:FindFirstChild("ScriptedMap") and workspace.ScriptedMap:FindFirstChild("Brainrots")
    if not folder then return nil end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local closest, dist = nil, math.huge
    for _, brainrot in ipairs(folder:GetChildren()) do
        if brainrot:IsA("Model") and getRarity(brainrot) == "Rare" then
            local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local mag = (hrp.Position - root.Position).Magnitude
                if mag < dist then
                    closest, dist = brainrot, mag
                end
            end
        end
    end
    return closest
end

local function getNearestSelectedRarityBrainrot()
    local folder = workspace:FindFirstChild("ScriptedMap") and workspace.ScriptedMap:FindFirstChild("Brainrots")
    if not folder or #selectedRarities == 0 then return nil end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local closest, dist = nil, math.huge
    for _, brainrot in ipairs(folder:GetChildren()) do
        if brainrot:IsA("Model") then
            local rarity = getRarity(brainrot)
            if table.find(selectedRarities, rarity) then
                local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
                if hrp then
                    local mag = (hrp.Position - root.Position).Magnitude
                    if mag < dist then
                        closest, dist = brainrot, mag
                    end
                end
            end
        end
    end
    return closest
end

--// Attack & Item Use Functions
local function followAndAttack(targetBrainrot)
    local brainrot = targetBrainrot
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if brainrot and root then
        local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
        if hrp then
            equipWeapon()
            root.CFrame = root.CFrame:Lerp(CFrame.new(hrp.Position + Vector3.new(0, 3, 0)), 0.2)
            local uuid = getBrainrotUUID(brainrot)
            if uuid then
                WeaponAttack:FireServer({uuid})
            end
        end
    end
end

local function throwFrostGrenade(brainrot)
    local predictedPos = getPredictedPosition(brainrot, 0.5)
    local grenade = equipFrostGrenade()
    if grenade and predictedPos then
        UseItem:FireServer({
            Toggle = true,
            Time = 0.5,
            Tool = grenade,
            Pos = predictedPos
        })
    end
end

local function fireFrostBlower(brainrot)
    local targetPos = getTargetPosition(brainrot)
    if not targetPos then return end
    local blower = equipFrostBlower()
    if blower then
        UseItem:FireServer({
            Tool = blower,
            Toggle = true
        })
    end
end

local function fireBananaGun(brainrot)
    local predictedPos = getPredictedPosition(brainrot, 0.3)
    local gun = equipBananaGun()
    if gun and predictedPos then
        UseItem:FireServer({
            Toggle = true,
            Time = 0.3,
            Tool = gun,
            Pos = predictedPos
        })
    end
end

local function fireCarrotLauncher(brainrot)
    local launcher = equipCarrotLauncher()
    if not launcher then return end
    local predictedPos = getPredictedPosition(brainrot, 0.3)
    if predictedPos then
        UseItem:FireServer({
            Toggle = true,
            Time = 0.3,
            Tool = launcher,
            Pos = predictedPos
        })
    end
end

--// ESP Function
local function createESP(brainrot)
    if not espEnabled then return end
    
    local hrp = brainrot:FindFirstChild("HumanoidRootPart") or brainrot:FindFirstChildWhichIsA("BasePart")
    if hrp and not hrp:FindFirstChild("RarityESP") then
        local rarity = getRarity(brainrot)

        local rarityColor = Color3.fromRGB(255, 255, 255)
        if rarity == "Common" then
            rarityColor = Color3.fromRGB(0, 255, 0)
        elseif rarity == "Rare" then
            rarityColor = Color3.fromRGB(0, 0, 255)
        elseif rarity == "Epic" then
            rarityColor = Color3.fromRGB(128, 0, 128)
        elseif rarity == "Legendary" then
            rarityColor = Color3.fromRGB(255, 215, 0)
        end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "RarityESP"
        billboard.Parent = hrp
        billboard.Adornee = hrp
        billboard.Size = UDim2.new(0, 50, 0, 25)
        billboard.StudsOffset = Vector3.new(0, 3, 0)

        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = billboard
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = rarity
        textLabel.TextColor3 = rarityColor
        textLabel.TextStrokeTransparency = 0.8
        textLabel.TextScaled = false
        textLabel.TextSize = 14
    end
end

--// Main Loop
RunService.Heartbeat:Connect(function()
    if freezeEnabled and #selectedRarities > 0 then
        local target = getNearestSelectedRarityBrainrot()
        if target then throwFrostGrenade(target) end
    elseif frostBlowerEnabled and #selectedRarities > 0 then
        local target = getNearestSelectedRarityBrainrot()
        if target then fireFrostBlower(target) end
    elseif bananaGunEnabled and #selectedRarities > 0 then
        local target = getNearestSelectedRarityBrainrot()
        if target then fireBananaGun(target) end
    elseif carrotLauncherEnabled and #selectedRarities > 0 then
        local target = getNearestSelectedRarityBrainrot()
        if target then fireCarrotLauncher(target) end
    else
        if followAttackEnabled then
            local target = getNearestBrainrot()
            if target then followAndAttack(target) end
        elseif legendaryAttackEnabled then
            local target = getNearestLegendaryBrainrot()
            if target then followAndAttack(target) end
        elseif limitedAttackEnabled then
            local target = getNearestLimitedBrainrot()
            if target then followAndAttack(target) end
        elseif selectedRarityAttackEnabled and #selectedRarities > 0 then
            local target = getNearestSelectedRarityBrainrot()
            if target then followAndAttack(target) end
        end
    end

    if espEnabled then
        local folder = workspace:FindFirstChild("ScriptedMap") and workspace.ScriptedMap:FindFirstChild("Brainrots")
        if folder then
            for _, brainrot in ipairs(folder:GetChildren()) do
                if brainrot:IsA("Model") then
                    createESP(brainrot)
                end
            end
        end
    end
end)

-- Function to equip items based on partial name matching (except seeds)
local function equipExactItem(itemName)
    local char = LocalPlayer.Character
    local backpack = LocalPlayer.Backpack
    if not char or not backpack then return false end
    
    -- Look for partial name match in character (already equipped)
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, itemName) then
            -- Skip if it's a seed
            if not string.find(tool.Name, "Seed") then
                -- Item already equipped with partial name match
                return true
            end
        end
    end
    
    -- Look for partial name match in backpack
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, itemName) then
            -- Skip if it's a seed
            if not string.find(tool.Name, "Seed") then
                -- Equip the item with partial name match
                char.Humanoid:EquipTool(tool)
                return true
            end
        end
    end
    
    return false
end

-- Function to scan plants from inventory GUI (only non-seed plants)
local function scanPlantsFromInventory()
    local plantsList = {}
    local success, result = pcall(function()
        local plantsCategory = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory.Categories.Plants
        
        if plantsCategory then
            for _, plantFrame in ipairs(plantsCategory:GetDescendants()) do
                if plantFrame:IsA("TextLabel") or plantFrame:IsA("TextButton") then
                    local plantName = plantFrame.Text
                    -- Filter out empty texts, seeds, and add to list
                    if plantName and plantName ~= "" and not string.find(plantName, "Seed") and not table.find(plantsList, plantName) then
                        table.insert(plantsList, plantName)
                    end
                end
            end
        end
        return plantsList
    end)
    
    if not success then
        warn("Failed to scan plants from inventory:", result)
        return {
            "Cactus", "Strawberry", "Pumpkin", "Sunflower",
            "Dragon Fruit", "Eggplant", "Watermelon", "Grape",
            "Cocotank", "Carnivorous Plant", "Tomade Torelli",
            "Mr Carrot", "Tomatrio", "Shroombino", "Mango", "King Limone"
        }
    end
    
    return plantsList
end

-- Function to scan brainrots from inventory GUI
local function scanBrainrotsFromInventory()
    local brainrotsList = {}
    local success, result = pcall(function()
        local brainrotsCategory = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory.Categories.Brainrots
        
        if brainrotsCategory then
            for _, brainrotFrame in ipairs(brainrotsCategory:GetDescendants()) do
                if brainrotFrame:IsA("TextLabel") or brainrotFrame:IsA("TextButton") then
                    local brainrotName = brainrotFrame.Text
                    -- Filter out empty texts and add to list
                    if brainrotName and brainrotName ~= "" and not table.find(brainrotsList, brainrotName) then
                        table.insert(brainrotsList, brainrotName)
                    end
                end
            end
        end
        return brainrotsList
    end)
    
    if not success then
        warn("Failed to scan brainrots from inventory:", result)
        return {
            "Fluri Flura", "Trulimero Trulicina", "Agarrini La Palini", "Lirili Larila",
            "Noobini Bananini", "Orangutini Ananassini", "Pipi Kiwi", "Espresso Signora",
            "Tim Cheese", "Noobini Cactusini", "Orangutini Strawberrini", "Bambini Crostini",
            "Trippi Troppi", "Brr Brr Patapim", "Cappuccino Assasino", "Svinino Bombondino",
            "Alessio", "Orcalero Orcala", "Bandito Bobrito", "Rinoccio Verdini",
            "Svinino Pumpkinino", "Brr Brr Sunflowerim", "Ballerina Cappuccina", "Bananita Dolphinita",
            "Elefanto Cocofanto", "Burbaloni Luliloli", "Bottellini", "Gangster Footera",
            "Madung", "Dragonfrutina Dolphinita", "Eggplantini Burbalonini", "Bombardiro Crocodilo",
            "Bombini Gussini", "Frigo Camelo", "Pesto Mortioni", "Baby Peperoncini And Marmellata",
            "Matteo", "Tralalero Tralala", "Giraffa Celeste", "Luis Traffico", "Kiwissimo",
            "Cocotanko Giraffanto", "Carnivourita Tralalerita", "La Tomatoro", "Crazylone Pizalone",
            "Brri Brri Bicus Dicus Bombicus", "Garamararam", "Blueberrinni Octopussini", "Los Tralaleritos",
            "Pot Hotspot", "Los Sekolitos", "Meowzio Sushini", "Los Mr Carrotitos", "Lemowzio",
            "Tung Tung Tung Sahur", "Mattone Rotto", "Odin Din Din Dun", "Vacca Saturno Saturnita", "67"
        }
    end
    
    return brainrotsList
end

--// =========================
-- FUSE TAB
--// =========================

-- Plants Selection Section
local FuseSection = AutoTab:CreateSection("Fuse Machine")


-- Plants Selection (Dynamic from inventory)
FuseSection:CreateDropdown({
    Name = "Plants",
    Options = scanPlantsFromInventory(),
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(selected)
        selectedPlants = selected
    end
})

-- Brainrots Selection (Dynamic from inventory)
FuseSection:CreateDropdown({
    Name = "Brainrots",
    Options = scanBrainrotsFromInventory(),
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(selected)
        selectedBrainrots = selected
    end
})

-- Fuse Machine Toggle
FuseSection:Toggle({
    Name = "Fuse Machine",
    CurrentValue = false,
    Callback = function(state)
        fuseMachineEnabled = state
        if state then
            task.spawn(function()
                -- Teleport to fuse machine position first
                local teleportPos = Vector3.new(-137.6483612060547, 11.562851905822754, 977.7113037109375)
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = CFrame.new(teleportPos)
                    task.wait(1.0)
                end
                
                while fuseMachineEnabled do
                    -- First: Equip related plants from selected list (excluding seeds)
                    for _, plantName in ipairs(selectedPlants) do
                        if not fuseMachineEnabled then break end
                        -- Skip if plant name contains "Seed"
                        if not string.find(plantName, "Seed") then
                            equipExactItem(plantName)
                            task.wait(0.5)
                            
                            -- Step 1: Fire PlacePlant ProximityPrompt
                            local placePlantPrompt = workspace.ScriptedMap.FuseMachine.PlacePlant.ProximityPrompt
                            if placePlantPrompt then
                                fireproximityprompt(placePlantPrompt)
                                task.wait(0.5)
                            end
                        end
                    end
                    
                    -- Second: Equip related brainrots from selected list
                    for _, brainrotName in ipairs(selectedBrainrots) do
                        if not fuseMachineEnabled then break end
                        equipExactItem(brainrotName)
                        task.wait(0.5)
                        
                        -- Step 2: Fire PlaceBrainrot ProximityPrompt
                        local placeBrainrotPrompt = workspace.ScriptedMap.FuseMachine.PlaceBrainrot.ProximityPrompt
                        if placeBrainrotPrompt then
                            fireproximityprompt(placeBrainrotPrompt)
                            task.wait(0.5)
                        end
                    end
                    
                    -- Step 3: Fire Confirm ProximityPrompt
                    local confirmPrompt = workspace.ScriptedMap.FuseMachine.Confirm.ProximityPrompt
                    if confirmPrompt then
                        fireproximityprompt(confirmPrompt)
                        task.wait(0.5)
                    end
                    
                    -- Turn off toggle after step 3 is complete
                    fuseMachineEnabled = false
                    break
                end
            end)
        end
    end
})

--// =========================
-- FUSE MACHINE V2 TAB
--// =========================

local Fusev2Section = AutoTab:CreateSection("Fuse Machine v2")


-- Variables

-- Fuse combinations mapping
local fuseCombinations = {
    ["Bombardilo Watermelondrilo"] = {"Watermelon", "Bombardiro Crocodilo"},
    ["Noobini Cactusini"] = {"Cactus", "Noobini Bananini"},
    ["Orangutini Strawberrini"] = {"Strawberry", "Orangutini Ananassini"},
    ["Svinino Pumpkinino"] = {"Pumpkin", "Svinino Bombondino"},
    ["Brr Brr Sunflowerim"] = {"Sunflower", "Brr Brr Patapim"},
    ["Dragonfrutina Dolphinita"] = {"Dragon Fruit", "Bananita Dolphinita"},
    ["Eggplantini Burbalonini"] = {"Eggplant", "Eggplantini Burbalonini"},
    ["Cocotanko Giraffanto"] = {"Cocotank", "Cocotanko Giraffanto"},
    ["Carnivourita Tralalerita"] = {"Carnivorous Plant", "Carnivourita Tralalerita"},
    ["Los Mr Carrotitos"] = {"Mr Carrot", "Los Mr Carrotitos"},
    ["Lemowzio"] = {"King Limone", "Lemowzio"}
}


-- Fuse Items Selection
Fusev2Section:CreateDropdown({
    Name = "Select Fuse Items",
    Options = {
        "Bombardilo Watermelondrilo",
        "Noobini Cactusini",
        "Orangutini Strawberrini", 
        "Svinino Pumpkinino",
        "Brr Brr Sunflowerim",
        "Dragonfrutina Dolphinita",
        "Eggplantini Burbalonini",
        "Cocotanko Giraffanto",
        "Carnivourita Tralalerita",
        "Los Mr Carrotitos",
        "Lemowzio"
    },
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(selected)
        selectedFuseItems = selected
    end
})

-- Auto Fuse v2 Toggle
Fusev2Section:Toggle({
    Name = "Auto Fuse",
    CurrentValue = false,
    Callback = function(state)
        autoFuseV2Enabled = state
        if state then
            task.spawn(function()
                -- Teleport to fuse machine position first
                local teleportPos = Vector3.new(-137.6483612060547, 11.562851905822754, 977.7113037109375)
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = CFrame.new(teleportPos)
                    task.wait(1.0)
                end
                
                while autoFuseV2Enabled do
                    for _, fuseItem in ipairs(selectedFuseItems) do
                        if not autoFuseV2Enabled then break end
                        
                        local components = fuseCombinations[fuseItem]
                        if components then
                            local plantName = components[1]
                            local brainrotName = components[2]
                            
                            -- Equip plant first
                            equipExactItem(plantName)
                            task.wait(0.5)
                            
                            -- Step 1: Fire PlacePlant ProximityPrompt
                            local placePlantPrompt = workspace.ScriptedMap.FuseMachine.PlacePlant.ProximityPrompt
                            if placePlantPrompt then
                                fireproximityprompt(placePlantPrompt)
                                task.wait(0.5)
                            end
                            
                            -- Equip brainrot second
                            equipExactItem(brainrotName)
                            task.wait(0.5)
                            
                            -- Step 2: Fire PlaceBrainrot ProximityPrompt
                            local placeBrainrotPrompt = workspace.ScriptedMap.FuseMachine.PlaceBrainrot.ProximityPrompt
                            if placeBrainrotPrompt then
                                fireproximityprompt(placeBrainrotPrompt)
                                task.wait(0.5)
                            end
                            
                            -- Step 3: Fire Confirm ProximityPrompt
                            local confirmPrompt = workspace.ScriptedMap.FuseMachine.Confirm.ProximityPrompt
                            if confirmPrompt then
                                fireproximityprompt(confirmPrompt)
                                task.wait(0.5)
                            end
                        end
                    end
                    
                    -- Turn off toggle after all fusions are complete
                    autoFuseV2Enabled = false
                    break
                end
            end)
        end
    end
})

--// =========================
-- AUTO EVENT BR TAB
--// ========================







--// =========================
-- FARM TAB - ORGANIZED INTO SECTIONS
--// =========================

-- Auto Claim Section
local ClaimSection = FarmTab:CreateSection("Auto Claim")

ClaimSection:CreateDropdown({
    Name = "Select Plots to Claim",
    Options = {"Plot 1","Plot 2","Plot 3","Plot 4","Plot 5","Plot 6"},
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(list) selectedPlots = list end
})

ClaimSection:CreateDropdown({
    Name = "Claim Every?",
    Options = {"Fast Claim","Claim Every 5s","Claim Every 30s","Claim Every 1m","Claim Every 10m"},
    CurrentOption = "Fast Claim",
    Callback = function(opt)
        if opt=="Fast Claim" then claimInterval=0.1
        elseif opt=="Claim Every 5s" then claimInterval=5
        elseif opt=="Claim Every 30s" then claimInterval=30
        elseif opt=="Claim Every 1m" then claimInterval=60
        elseif opt=="Claim Every 10m" then claimInterval=600 end
    end
})

ClaimSection:Toggle({
    Name = "Auto Claim",
    CurrentValue = false,
    Callback = function(state)
        autoClaimEnabled = state
        if state then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = LocalPlayer.Character.HumanoidRootPart.Position
            end
            task.spawn(function()
                while autoClaimEnabled do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LocalPlayer.Character.HumanoidRootPart
                        for _, plotName in ipairs(selectedPlots) do
                            if not autoClaimEnabled then break end
                            local plot = plotLocations[plotName]
                            if plot then
                                for _, pos in ipairs(plot) do
                                    if not autoClaimEnabled then break end
                                    hrp.CFrame = CFrame.new(pos)
                                    task.wait(0.2)
                                end
                            end
                        end
                        if originalPosition and autoClaimEnabled then
                            hrp.CFrame = CFrame.new(originalPosition)
                        end
                    end
                    task.wait(claimInterval)
                end
            end)
        end
    end
})

-- Auto Sell Section
local SellSection = FarmTab:CreateSection("Auto Sell")

SellSection:Toggle({
    Name = "Auto Sell Brainrot",
    CurrentValue = false,
    Callback = function(state)
        autoSellEnabled = state
        if state then
            task.spawn(function()
                local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ItemSell")
                while autoSellEnabled do
                    fireRemoteSafely(remote,{})
                    task.wait(0.05)
                end
            end)
        end
    end
})

SellSection:Toggle({
    Name = "Auto Sell Plants",
    CurrentValue = false,
    Callback = function(state)
        autoSellPlantsEnabled = state
        if state then
            task.spawn(function()
                local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ItemSell")
                while autoSellPlantsEnabled do
                    fireRemoteSafely(remote,{[2]=true})
                    task.wait(0.05)
                end
            end)
        end
    end
})

-- Auto Equip Section
local EquipSection = FarmTab:CreateSection("Auto Equip")

EquipSection:CreateDropdown({
    Name = "Equip Time",
    Options = {"5 Seconds", "10 Seconds", "30 Seconds", "1 Minute", "5 Minutes", "10 Minutes", "15 Minutes"},
    CurrentOption = "5 Seconds",
    Callback = function(option)
        if option == "5 Seconds" then equipDelay = 5
        elseif option == "10 Seconds" then equipDelay = 10
        elseif option == "30 Seconds" then equipDelay = 30
        elseif option == "1 Minute" then equipDelay = 60
        elseif option == "5 Minutes" then equipDelay = 300
        elseif option == "10 Minutes" then equipDelay = 600
        elseif option == "15 Minutes" then equipDelay = 900 end
    end
})

EquipSection:Toggle({
    Name = "Auto Equip Brainrots Pet",
    CurrentValue = false,
    Callback = function(state)
        autoEquipEnabled = state
        if state then
            task.spawn(function()
                local remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("EquipBestBrainrots", 9e9)
                while autoEquipEnabled do
                    remote:FireServer()
                    task.wait(equipDelay)
                end
            end)
        end
    end
})

-- Auto Open Eggs Section
local EggSection = FarmTab:CreateSection("Auto Open Eggs")

-- Function to equip egg by similar name (handles quantity like [1])
local function equipEggByName(eggName)
    local char = LocalPlayer.Character
    local backpack = LocalPlayer.Backpack
    if not char or not backpack then return false end
    
    -- Look for partial name match in character (already equipped)
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, eggName) then
            -- Item already equipped with partial name match
            return true
        end
    end
    
    -- Look for partial name match in backpack
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, eggName) then
            -- Equip the item with partial name match
            char.Humanoid:EquipTool(tool)
            return true
        end
    end
    
    return false
end

EggSection:Toggle({
    Name = "Auto Open Lucky Egg",
    CurrentValue = false,
    Callback = function(state)
        autoOpenLuckyEggEnabled = state
        if state then
            task.spawn(function()
                local remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("OpenEgg", 9e9)
                while autoOpenLuckyEggEnabled do
                    -- Equip egg first
                    if equipEggByName("Godly Lucky Egg") then
                        remote:FireServer("Godly Lucky Egg")
                        task.wait(1)
                    else
                        print("No Godly Lucky Egg found in inventory")
                        task.wait(1)
                    end
                end
            end)
        end
    end
})

EggSection:Toggle({
    Name = "Auto Open Secret Lucky Egg",
    CurrentValue = false,
    Callback = function(state)
        autoOpenSecretLuckyEggEnabled = state
        if state then
            task.spawn(function()
                local remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("OpenEgg", 9e9)
                while autoOpenSecretLuckyEggEnabled do
                    -- Equip egg first
                    if equipEggByName("Secret Lucky Egg") then
                        remote:FireServer("Secret Lucky Egg")
                        task.wait(1)
                    else
                        print("No Secret Lucky Egg found in inventory")
                        task.wait(1)
                    end
                end
            end)
        end
    end
})

EggSection:Toggle({
    Name = "Auto Open Meme Lucky Egg",
    CurrentValue = false,
    Callback = function(state)
        autoOpenMemeLuckyEggEnabled = state
        if state then
            task.spawn(function()
                local remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("OpenEgg", 9e9)
                while autoOpenMemeLuckyEggEnabled do
                    -- Equip egg first
                    if equipEggByName("Meme Lucky Egg") then
                        remote:FireServer("Meme Lucky Egg")
                        task.wait(1)
                    else
                        print("No Meme Lucky Egg found in inventory")
                        task.wait(1)
                    end
                end
            end)
        end
    end
})

-- Auto Progression Section
local ProgressionSection = FarmTab:CreateSection("Auto Progression")

ProgressionSection:Toggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Callback = function(state)
        autoRebirthEnabled = state
        if state then
            task.spawn(function()
                while autoRebirthEnabled do
                    -- Check if rebirth is available (StillNeed.Visible = false)
                    local rebirthGui = game:GetService("Players").LocalPlayer.PlayerGui.Main.Rebirth.Frame.Rebirth
                    local stillNeed = rebirthGui:FindFirstChild("StillNeed")
                    
                    if stillNeed and stillNeed.Visible == false then
                        -- Rebirth is available, fire the remote
                        print("Performing rebirth...")
                        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
                        task.wait(0.5) -- Wait 1 second after rebirth
                    else
                        print("Rebirth not available yet")
                    end
                    
                    if autoRebirthEnabled then
                        task.wait(0.5) -- Check every 2 seconds
                    end
                end
            end)
        end
    end
})

--// =========================
-- SHOP TAB - ORGANIZED INTO SECTIONS
--// =========================

-- Seeds v2 Section
local SeedsV2Section = ShopTab:CreateSection("Auto Buy Seed")

SeedsV2Section:CreateDropdown({
    Name = "Select Seeds",
    Options = seedsList,
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(selected)
        selectedSeedsV2 = selected
    end
})

SeedsV2Section:Toggle({
    Name = "Auto Buy Selected Seeds",
    CurrentValue = false,
    Callback = function(state)
        autoBuySeedsV2Enabled = state
        if state then
            task.spawn(function()
                while autoBuySeedsV2Enabled do
                    -- Get the seeds list from the GUI
                    local seedsFrame = game:GetService("Players").LocalPlayer.PlayerGui.Main.Seeds.Frame.ScrollingFrame
                    
                    if seedsFrame then
                        for _, seedObject in ipairs(seedsFrame:GetChildren()) do
                            if not autoBuySeedsV2Enabled then break end
                            
                            -- Check if it's a seed item with Stock text
                            local stockLabel = seedObject:FindFirstChild("Stock")
                            if stockLabel and stockLabel:IsA("TextLabel") then
                                local stockText = stockLabel.Text
                                local seedName = seedObject.Name
                                
                                -- Check if this seed is in our selected list AND stock is available
                                if table.find(selectedSeedsV2, seedName) then
                                    -- Check if stock is "x1" or above (contains numbers) but NOT "0x"
                                    if stockText and string.find(stockText, "%d") and not string.find(stockText, "0x") then
                                        -- Extract the number from stock text (e.g., "x1" -> 1, "x5" -> 5)
                                        local stockNumber = tonumber(string.match(stockText, "%d+"))
                                        
                                        -- Only buy if stock number is 1 or above
                                        if stockNumber and stockNumber >= 1 then
                                            print("Buying seed: " .. seedName .. " | Stock: " .. stockText)
                                            
                                            -- Fire the buy remote
                                            local args = {
                                                [1] = seedName,
                                                [2] = true
                                            }
                                            
                                            game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer(unpack(args))
                                            task.wait(0.5) -- Wait between purchases
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoBuySeedsV2Enabled then
                        task.wait(0.5) -- Wait 2 seconds before scanning again
                    end
                end
            end)
        end
    end
})


SeedsV2Section:Toggle({
    Name = "Auto Buy All Seeds",
    CurrentValue = false,
    Callback = function(state)
        autoBuySeedsV2Enabled = state
        if state then
            task.spawn(function()
                while autoBuySeedsV2Enabled do
                    -- Get the seeds list from the GUI
                    local seedsFrame = game:GetService("Players").LocalPlayer.PlayerGui.Main.Seeds.Frame.ScrollingFrame
                    
                    if seedsFrame then
                        for _, seedObject in ipairs(seedsFrame:GetChildren()) do
                            if not autoBuySeedsV2Enabled then break end
                            
                            -- Check if it's a seed item with Stock text
                            local stockLabel = seedObject:FindFirstChild("Stock")
                            if stockLabel and stockLabel:IsA("TextLabel") then
                                local stockText = stockLabel.Text
                                
                                -- Check if stock is "x1" or above (contains numbers) but NOT "0x"
                                if stockText and string.find(stockText, "%d") and not string.find(stockText, "0x") then
                                    -- Extract the number from stock text (e.g., "x1" -> 1, "x5" -> 5)
                                    local stockNumber = tonumber(string.match(stockText, "%d+"))
                                    
                                    -- Only buy if stock number is 1 or above
                                    if stockNumber and stockNumber >= 1 then
                                        local seedName = seedObject.Name
                                        print("Buying seed: " .. seedName .. " | Stock: " .. stockText)
                                        
                                        -- Fire the buy remote
                                        local args = {
                                            [1] = seedName,
                                            [2] = true
                                        }
                                        
                                        game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer(unpack(args))
                                        task.wait(0.5) -- Wait between purchases
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoBuySeedsV2Enabled then
                        task.wait(0.5) -- Wait 2 seconds before scanning again
                    end
                end
            end)
        end
    end
})





-- Gear v2 Section
local GearV2Section = ShopTab:CreateSection("Auto Buy Gear")

GearV2Section:CreateDropdown({
    Name = "Select Gears",
    Options = gearList,
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(selected)
        selectedGearsV2 = selected
    end
})

GearV2Section:Toggle({
    Name = "Auto Buy Selected Gears",
    CurrentValue = false,
    Callback = function(state)
        autoBuyGearsV2Enabled = state
        if state then
            task.spawn(function()
                while autoBuyGearsV2Enabled do
                    -- Get the gears list from the GUI
                    local gearsFrame = game:GetService("Players").LocalPlayer.PlayerGui.Main.Gears.Frame.ScrollingFrame
                    
                    if gearsFrame then
                        for _, gearObject in ipairs(gearsFrame:GetChildren()) do
                            if not autoBuyGearsV2Enabled then break end
                            
                            -- Check if it's a gear item with Stock text
                            local stockLabel = gearObject:FindFirstChild("Stock")
                            if stockLabel and stockLabel:IsA("TextLabel") then
                                local stockText = stockLabel.Text
                                local gearName = gearObject.Name
                                
                                -- Check if this gear is in our selected list AND stock is available
                                if table.find(selectedGearsV2, gearName) then
                                    -- Check if stock is "x1" or above (contains numbers) but NOT "0x"
                                    if stockText and string.find(stockText, "%d") and not string.find(stockText, "0x") then
                                        -- Extract the number from stock text (e.g., "x1" -> 1, "x5" -> 5)
                                        local stockNumber = tonumber(string.match(stockText, "%d+"))
                                        
                                        -- Only buy if stock number is 1 or above
                                        if stockNumber and stockNumber >= 1 then
                                            print("Buying gear: " .. gearName .. " | Stock: " .. stockText)
                                            
                                            -- Fire the buy remote for gears
                                            local args = {
                                                [1] = gearName,
                                                [2] = true
                                            }
                                            
                                            game:GetService("ReplicatedStorage").Remotes.BuyGear:FireServer(unpack(args))
                                            task.wait(0.5) -- Wait between purchases
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoBuyGearsV2Enabled then
                        task.wait(0.5) -- Wait 2 seconds before scanning again
                    end
                end
            end)
        end
    end
})

GearV2Section:Toggle({
    Name = "Auto Buy All Gears",
    CurrentValue = false,
    Callback = function(state)
        autoBuyGearsV2Enabled = state
        if state then
            task.spawn(function()
                while autoBuyGearsV2Enabled do
                    -- Get the gears list from the GUI (assuming similar structure to seeds)
                    local gearsFrame = game:GetService("Players").LocalPlayer.PlayerGui.Main.Gears.Frame.ScrollingFrame
                    
                    if gearsFrame then
                        for _, gearObject in ipairs(gearsFrame:GetChildren()) do
                            if not autoBuyGearsV2Enabled then break end
                            
                            -- Check if it's a gear item with Stock text
                            local stockLabel = gearObject:FindFirstChild("Stock")
                            if stockLabel and stockLabel:IsA("TextLabel") then
                                local stockText = stockLabel.Text
                                
                                -- Check if stock is "x1" or above (contains numbers) but NOT "0x"
                                if stockText and string.find(stockText, "%d") and not string.find(stockText, "0x") then
                                    -- Extract the number from stock text (e.g., "x1" -> 1, "x5" -> 5)
                                    local stockNumber = tonumber(string.match(stockText, "%d+"))
                                    
                                    -- Only buy if stock number is 1 or above
                                    if stockNumber and stockNumber >= 1 then
                                        local gearName = gearObject.Name
                                        print("Buying gear: " .. gearName .. " | Stock: " .. stockText)
                                        
                                        -- Fire the buy remote for gears (adjust remote name if different)
                                        local args = {
                                            [1] = gearName,
                                            [2] = true
                                        }
                                        
                                        game:GetService("ReplicatedStorage").Remotes.BuyGear:FireServer(unpack(args))
                                        task.wait(0.5) -- Wait between purchases
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoBuyGearsV2Enabled then
                        task.wait(0.5) -- Wait 2 seconds before scanning again
                    end
                end
            end)
        end
    end
})


--// =========================
-- PLATFORM TAB - ORGANIZED INTO SECTIONS
--// =========================

-- Auto Buy Platforms Section
local AutoBuyPlatformsSection = ShopTab:CreateSection("Auto Buy Others")

AutoBuyPlatformsSection:Toggle({
    Name = "Auto Buy Platforms",
    CurrentValue = false,
    Callback = function(state)
        autoBuyPlatformsEnabled = state
        if state then
            task.spawn(function()
                while autoBuyPlatformsEnabled do
                    -- Check all plots (1-6) and all plants (1-17)
                    for plotNum = 1, 6 do
                        for plantNum = 1, 17 do
                            if not autoBuyPlatformsEnabled then break end
                            
                            local plot = workspace.Plots[tostring(plotNum)]
                            if plot then
                                local plantsFolder = plot:FindFirstChild("Plants")
                                if plantsFolder then
                                    local plant = plantsFolder[tostring(plantNum)]
                                    if plant then
                                        local platformPrice = plant:FindFirstChild("PlatformPrice")
                                        if platformPrice then
                                            -- Check if PlatformPrice.Enabled property is true
                                            if platformPrice.Enabled == true then
                                                -- Platform is available for purchase, buy it
                                                print("Buying platform: Plot " .. plotNum .. " Plant " .. plantNum)
                                                
                                                local args = {
                                                    [1] = tostring(plantNum)
                                                }
                                                
                                                game:GetService("ReplicatedStorage").Remotes.BuyPlatform:FireServer(unpack(args))
                                                task.wait(0.2) -- Wait between purchases
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoBuyPlatformsEnabled then
                        task.wait(0.5) -- Wait 2 seconds before scanning again
                    end
                end
            end)
        end
    end
})

AutoBuyPlatformsSection:Toggle({
    Name = "Auto Buy Rows",
    CurrentValue = false,
    Callback = function(state)
        autoBuyRowsEnabled = state
        if state then
            task.spawn(function()
                while autoBuyRowsEnabled do
                    -- Check all plots (1-6) and all rows (1-7)
                    for plotNum = 1, 6 do
                        for rowNum = 1, 7 do
                            if not autoBuyRowsEnabled then break end
                            
                            local plot = workspace.Plots[tostring(plotNum)]
                            if plot then
                                local rowsFolder = plot:FindFirstChild("Rows")
                                if rowsFolder then
                                    local row = rowsFolder[tostring(rowNum)]
                                    if row then
                                        local button = row:FindFirstChild("Button")
                                        if button then
                                            local hitbox = button:FindFirstChild("Hitbox")
                                            if hitbox then
                                                -- Check if Locked property is false
                                                if hitbox.Locked == false then
                                                    -- Row is unlocked and can be purchased, buy it
                                                    print("Buying row: Plot " .. plotNum .. " Row " .. rowNum)
                                                    
                                                    local args = {
                                                        [1] = rowNum
                                                    }
                                                    
                                                    game:GetService("ReplicatedStorage").Remotes.BuyRow:FireServer(unpack(args))
                                                    task.wait(0.2) -- Wait between purchases
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoBuyRowsEnabled then
                        task.wait(0.5) -- Wait 2 seconds before scanning again
                    end
                end
            end)
        end
    end
})



--// =========================
-- BRAINROTS TAB - ORGANIZED INTO SECTIONS
--// =========================

-- Auto Attack Section
local AttackSection = BrainrotsTab:CreateSection("Auto Attack")

AttackSection:Toggle({
    Name = "Auto Hit Brainrot (All)",
    CurrentValue = false,
    Callback = function(state)
        followAttackEnabled = state
        if state then legendaryAttackEnabled = false end
        if followAttackEnabled then task.wait(1.0) end
    end
})

AttackSection:CreateDropdown({
    Name = "Auto Hit Selected Rarity",
    Options = {"Rare", "Epic", "Legendary", "Mythic", "Godly", "Secret", "Limited"},
    CurrentOption = {},
    MultiSelection = true,
    Callback = function(list)
        selectedRarities = list or {}
        if #selectedRarities > 0 then
            followAttackEnabled = false
            legendaryAttackEnabled = false
        end
    end
})

AttackSection:Toggle({
    Name = "Auto Hit Boss",
    CurrentValue = false,
    Callback = function(state)
        limitedAttackEnabled = state
        if state then 
            followAttackEnabled = false 
            legendaryAttackEnabled = false
        end
        if limitedAttackEnabled then task.wait(1.0) end
    end
})

AttackSection:Toggle({
    Name = "Enable Selected Rarity Attack (Equip Bat)",
    CurrentValue = false,
    Callback = function(state)
        selectedRarityAttackEnabled = state
        if state then
            followAttackEnabled = false
            legendaryAttackEnabled = false
        end
        if selectedRarityAttackEnabled then task.wait(1.0) end
    end
})

-- Weapons Section
--local WeaponsSection = BrainrotsTab:CreateSection("Weapons & Items")

AttackSection:Toggle({
    Name = "Freeze Brainrots (Frost Grenade)",
    CurrentValue = false,
    Callback = function(state)
        freezeEnabled = state
        if state then
            followAttackEnabled = false
            legendaryAttackEnabled = false
        end
        if freezeEnabled then task.wait(1.0) end
    end
})

AttackSection:Toggle({
    Name = "Auto Banana Gun",
    CurrentValue = false,
    Callback = function(state)
        bananaGunEnabled = state
        if state then
            followAttackEnabled = false
            legendaryAttackEnabled = false
            selectedRarityAttackEnabled = false
        end
        if bananaGunEnabled then task.wait(1.0) end
    end
})

AttackSection:Toggle({
    Name = "Auto Frost Blower",
    CurrentValue = false,
    Callback = function(state)
        frostBlowerEnabled = state
        if not state then
            local blower = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Frost Blower")
            if blower then
                UseItem:FireServer({
                    Tool = blower,
                    Toggle = false
                })
            end
        end
        if frostBlowerEnabled then task.wait(1.0) end
    end
})

AttackSection:Toggle({
    Name = "Auto Carrot Launcher",
    CurrentValue = false,
    Callback = function(state)
        carrotLauncherEnabled = state
        if state then
            followAttackEnabled = false
            legendaryAttackEnabled = false
            freezeEnabled = false
            frostBlowerEnabled = false
            bananaGunEnabled = false
        end
        if carrotLauncherEnabled then task.wait(1.0) end
    end
})

-- ESP Section
local ESPSection = BrainrotsTab:CreateSection("ESP")

ESPSection:Toggle({
    Name = "ESP Rarity Name",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
    end
})



--// =========================
-- MISC TAB - ORGANIZED INTO SECTIONS
--// =========================

-- Player Section
local PlayerSection = MiscTab:CreateSection("Player")

PlayerSection:Toggle({
    Name = "Unlimited Jump",
    CurrentValue = false,
    Callback = function(state)
        unlimitedJump = state
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if unlimitedJump and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

PlayerSection:Toggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Callback = function(state)
        antiAFKEnabled = state
        
        if state then
            if afkConnection then
                afkConnection:Disconnect()
            end
            
            afkConnection = RunService.Heartbeat:Connect(function()
                if antiAFKEnabled and LocalPlayer.Character then
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:Move(Vector3.new(1, 0, 0))
                        task.wait(0.1)
                        hum:Move(Vector3.new(-1, 0, 0))
                    end
                end
            end)
            
            LocalPlayer.Idled:Connect(function()
                if antiAFKEnabled then
                    local VirtualUser = game:GetService("VirtualUser")
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end
            end)
        else
            if afkConnection then
                afkConnection:Disconnect()
                afkConnection = nil
            end
        end
    end
})

-- Graphics Section
local GraphicsSection = MiscTab:CreateSection("Graphics")



GraphicsSection:Toggle({
    Name = "Reduce Lag",
    CurrentValue = false,
    Callback = function(state)
        if state then
            local decalsyeeted = true
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            for i, v in pairs(g:GetDescendants()) do
                if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                end
            end
        else
            local t = game.Workspace.Terrain
            t.WaterWaveSize = 0.5
            t.WaterWaveSpeed = 1
            t.WaterReflectance = 0.5
            t.WaterTransparency = 0.5
            game.Lighting.GlobalShadows = true
            game.Lighting.FogEnd = 1000
            game.Lighting.Brightness = 1
            settings().Rendering.QualityLevel = "Level20"
        end
    end
})

GraphicsSection:Toggle({
    Name = "Remove Fog",
    CurrentValue = false,
    Callback = function(state)
        if state then
            game.Lighting.FogEnd = 9e9
        else
            game.Lighting.FogEnd = 1000
        end
    end
})

-- Server Section
local ServerSection = MiscTab:CreateSection("Server")

ServerSection:Button({
    Name = "Reconnect to Server",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        local success, result = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
        
        if not success then
            warn("Reconnect failed:", result)
        end
    end
})



-- GUI Optimization Section
local GUISection = MiscTab:CreateSection("GUI Elements")


GUISection:Toggle({
    Name = "Show FPS",
    CurrentValue = false,
    Callback = function(state)
        local fpsCounter = game:GetService("Players").LocalPlayer.PlayerGui.Main.FPSCounter
        if fpsCounter then
            fpsCounter.Visible = state
        end
    end
})

--// =========================
-- VISUAL TAB - ORGANIZED INTO SECTIONS
--// =========================



GUISection:CreateDropdown({
    Name = "Select Visual(s)",
    Options = {"Board","Rows","Plants","PlatForms"},
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(list)
        selectedVisuals = list
    end
})

GUISection:Toggle({
    Name = "Hide/Show Selected (Reduce Lag)",
    CurrentValue = false,
    Callback = function(state)
        for _, visType in ipairs(selectedVisuals) do
            if visualTargets[visType] then
                if state then
                    hiddenObjects[visType] = {}
                    for _, obj in ipairs(visualTargets[visType]) do
                        if obj and obj.Parent then
                            table.insert(hiddenObjects[visType], obj.Parent)
                            obj.Parent = nil
                        end
                    end
                else
                    if hiddenObjects[visType] then
                        for i, obj in ipairs(visualTargets[visType]) do
                            if obj and not obj.Parent then
                                obj.Parent = hiddenObjects[visType][i]
                            end
                        end
                        hiddenObjects[visType] = nil
                    end
                end
            end
        end
    end
})





























--// =========================
-- PLANT EXTRACTOR TAB
--// =========================

-- Variables
local selectedExtractorPlants = {}
local autoPlantExtractorEnabled = false

-- Plant Extractor Section
local PlantExtractorSection = AutoTab:CreateSection("Plant Extractor")

-- Plants Selection for Extractor
PlantExtractorSection:CreateDropdown({
    Name = "Select Plants for Extractor",
    Options = {
        "Cactus",
        "Strawberry", 
        "Pumpkin",
        "Sunflower",
        "Dragon Fruit",
        "Eggplant",
        "Watermelon",
        "Grape",
        "Cocotank",
        "Carnivorous Plant",
        "Tomade Torelli",
        "Mr Carrot",
        "Tomatrio",
        "Shroombino",
        "Mango",
        "King Limone"
    },
    MultiSelection = true,
    CurrentOption = {},
    Callback = function(selected)
        selectedExtractorPlants = selected
    end
})

PlantExtractorSection:Toggle({
    Name = "Auto Plant Extractor",
    CurrentValue = false,
    Callback = function(state)
        autoPlantExtractorEnabled = state
        if state then
            task.spawn(function()
                while autoPlantExtractorEnabled do
                    local hasReadyLight = false
                    
                    -- Check all 5 lights first
                    for lightNum = 1, 5 do
                        if not autoPlantExtractorEnabled then break end
                        
                        local light = workspace.ScriptedMap.PlantExtractor.Input.Lights[tostring(lightNum)]
                        if light then
                            local fillColor = light:FindFirstChild("FillColor")
                            if fillColor then
                                -- Check if BrickColor is Black
                                if fillColor.BrickColor == BrickColor.new("Black") then
                                    hasReadyLight = true
                                    print("Light " .. lightNum .. " is ready - BrickColor is Black")
                                    break -- Found at least one ready light
                                end
                            end
                        end
                    end
                    
                    -- Only proceed if there's at least one ready light
                    if hasReadyLight then
                        -- No teleportation needed
                        
                        -- Equip selected plants one by one
                        for _, plantName in ipairs(selectedExtractorPlants) do
                            if not autoPlantExtractorEnabled then break end
                            
                            if equipExactItem(plantName) then
                                print("Equipped plant: " .. plantName)
                                task.wait(0.5)
                                
                                -- Fire the proximity prompt
                                local promptPart = workspace.ScriptedMap.PlantExtractor.Part
                                if promptPart then
                                    local prompt = promptPart:FindFirstChild("Prompt")
                                    if prompt then
                                        print("Firing prompt for plant: " .. plantName)
                                        fireproximityprompt(prompt)
                                        task.wait(0.5)
                                    else
                                        print("No prompt found")
                                    end
                                else
                                    print("Prompt part not found")
                                end
                            else
                                print("Could not equip plant: " .. plantName)
                            end
                        end
                    else
                        print("No ready lights found, skipping...")
                    end
                    
                    if autoPlantExtractorEnabled then
                        task.wait(0.5) -- Wait 0.5 seconds before checking again
                    end
                end
            end)
        end
    end
})



--// =========================
-- PLANT EXTRACTOR TAB - ADD TO EXISTING TAB
--// =========================


PlantExtractorSection:Toggle({
    Name = "Auto Claim Extractor",
    CurrentValue = false,
    Callback = function(state)
        autoClaimExtractorEnabled = state
        if state then
            task.spawn(function()
                while autoClaimExtractorEnabled do
                    -- Check if timer text is "Ready!"
                    local timerText = workspace.ScriptedMap.PlantExtractor.UI.GUI.Timer.Text
                    
                    if timerText == "Ready!" then
                        print("Plant extractor ready to claim!")
                        
                        -- Fire the prompt (6th child)
                        local children = workspace.ScriptedMap.PlantExtractor:GetChildren()
                        if #children >= 6 then
                            local promptPart = children[6]
                            local prompt = promptPart:FindFirstChild("Prompt")
                            if prompt then
                                print("Firing claim prompt")
                                fireproximityprompt(prompt)
                                task.wait(0.5)
                            else
                                print("No prompt found in 6th child")
                            end
                        else
                            print("Not enough children in PlantExtractor")
                        end
                    else
                        print("Plant extractor not ready. Timer: " .. timerText)
                    end
                    
                    if autoClaimExtractorEnabled then
                        task.wait(0.5) -- Wait 0.5 seconds before checking again
                    end
                end
            end)
        end
    end
})

--// =========================
-- BRAINROT INVASION TAB
--// =========================
-- Variables
local autoStartInvasionEnabled = false

-- Brainrot Invasion Section
local InvasionSection = AutoTab:CreateSection("Auto Start Invasion")

InvasionSection:Toggle({
    Name = "Auto Start Invasion",
    CurrentValue = false,
    Callback = function(state)
        autoStartInvasionEnabled = state
        if state then
            task.spawn(function()
                while autoStartInvasionEnabled do
                    -- Check if invasion timer is "00:00"
                    local timerText = game:GetService("Players").LocalPlayer.PlayerGui.Main.Brainrot_Invasion.Timer.Time.Text
                    
                    if timerText == "00:00" then
                        print("Invasion ready to start!")
                        
                        -- Fire the start invasion remote
                        game:GetService("ReplicatedStorage").Remotes.MissionServicesRemotes.RequestStartInvasion:FireServer()
                        print("Started brainrot invasion!")
                        task.wait(0.5) -- Wait 1 second after starting
                    else
                        print("Invasion not ready. Timer: " .. timerText)
                    end
                    
                    if autoStartInvasionEnabled then
                        task.wait(300) -- Wait 300 seconds before checking again
                    end
                end
            end)
        end
    end
})





--// =========================
-- AUTO DAILY EVENT TAB
--// =========================


-- Variables
local autoDailyEventEnabled = false
local submittedDailyBrainrots = {}

-- Auto Daily Event Section
local DailyEventSection = AutoTab:CreateSection("Auto Daily Event")

DailyEventSection:Toggle({
    Name = "Auto Daily Event",
    CurrentValue = false,
    Callback = function(state)
        autoDailyEventEnabled = state
        if state then
            submittedDailyBrainrots = {} -- Reset submitted brainrots when starting
            task.spawn(function()
                while autoDailyEventEnabled do
                    -- Check all plots (1-7) and all platforms (-1 to -5)
                    for plotNum = 1, 7 do
                        for platformNum = -1, -5, -1 do
                            if not autoDailyEventEnabled then break end
                            
                            local plotFolder = workspace.Plots[tostring(plotNum)]
                            if plotFolder then
                                local eventPlatforms = plotFolder:FindFirstChild("EventPlatforms")
                                if eventPlatforms then
                                    local platform = eventPlatforms[tostring(platformNum)]
                                    if platform then
                                        local platformEventUI = platform:FindFirstChild("PlatformEventUI")
                                        if platformEventUI and platformEventUI.Enabled == true then
                                            print("Daily event active on Plot " .. plotNum .. " Platform " .. platformNum)
                                            
                                            -- Teleport to event coordinates
                                            local teleportPos = Vector3.new(-211.9845733642578, 11.562851905822754, 978.3615112304688)
                                            local char = LocalPlayer.Character
                                            if char and char:FindFirstChild("HumanoidRootPart") then
                                                char.HumanoidRootPart.CFrame = CFrame.new(teleportPos)
                                                print("Teleported to daily event")
                                                task.wait(0.5)
                                            end
                                            
                                            local visualFolder = platform:FindFirstChild("VisualFolder")
                                            if visualFolder then
                                                -- Scan all brainrots in VisualFolder one by one
                                                for _, brainrot in ipairs(visualFolder:GetChildren()) do
                                                    if not autoDailyEventEnabled then break end
                                                    
                                                    if brainrot:IsA("Model") then
                                                        local brainrotName = brainrot.Name
                                                        
                                                        -- Skip if this brainrot was already submitted
                                                        if submittedDailyBrainrots[brainrotName] then
                                                            print("Skipping already submitted brainrot: " .. brainrotName)
                                                            continue
                                                        end
                                                        
                                                        print("Found brainrot: " .. brainrotName)
                                                        
                                                        -- Find and equip the brainrot from inventory
                                                        if equipExactItem(brainrotName) then
                                                            print("Equipped brainrot: " .. brainrotName)
                                                            task.wait(0.5)
                                                            
                                                            -- Fire the proximity prompt
                                                            local hitbox = platform:FindFirstChild("Hitbox")
                                                            if hitbox then
                                                                local proximityPrompt = hitbox:FindFirstChild("ProximityPrompt")
                                                                if proximityPrompt then
                                                                    print("Firing proximity prompt for: " .. brainrotName)
                                                                    fireproximityprompt(proximityPrompt)
                                                                    task.wait(0.5)
                                                                    
                                                                    -- Mark this brainrot as submitted
                                                                    submittedDailyBrainrots[brainrotName] = true
                                                                    print("Marked as submitted: " .. brainrotName)
                                                                else
                                                                    print("No proximity prompt found for: " .. brainrotName)
                                                                end
                                                            else
                                                                print("No hitbox found for platform: " .. platformNum)
                                                            end
                                                        else
                                                            print("Could not equip brainrot: " .. brainrotName)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if autoDailyEventEnabled then
                        task.wait(0.5) -- Wait 2 seconds before checking again
                    end
                end
            end)
        else
            -- Clear submitted brainrots when toggle is turned off
            submittedDailyBrainrots = {}
        end
    end
})



-- workspace.ScriptedMap.AdminChest.ChestBody.PromptAttachment.ProximityPrompt




--local Button1 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Brainrot_Invasion.Button_List.Not_Ready_Button.Main.SENSOR
--firesignal(Button1.MouseButton1Click)
--wait(1)
--firesignal(Button2.MouseButton1Click)