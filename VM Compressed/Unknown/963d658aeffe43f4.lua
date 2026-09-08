local PrestigeUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/sbertinato7-boop/PrestigeUILib/refs/heads/main/main"))()
local window = PrestigeUI:Create("Prestige Hub")

-- Global variables
getgenv().customerWalkSpeed = 16
getgenv().customerSpeedEnabled = false
getgenv().autoCollectCoins = false
getgenv().autoSell = false
getgenv().autoItemPickup = false
getgenv().autoOpenContainers = false
getgenv().autoBuyOPContainer = false
getgenv().autoUpgrades = false
getgenv().autoBuyContainers = false
getgenv().selectedContainer = "Junk [100]"
getgenv().upgradeSettings = getgenv().upgradeSettings or {
    inventoryItems = false,
    flowers = false,
    customers = false,
    enchantmentSlots = false,
    containers = false,
    plotItems = false
}
getgenv().pickedUpItems = getgenv().pickedUpItems or {}
getgenv().startingMoney = getgenv().startingMoney or 0

-- Helper function to convert money strings to numbers
local function safeToNumber(value)
    if type(value) == "number" then
        return value
    elseif type(value) == "string" then
        local numStr = value:gsub(",", ""):upper()
        local multiplier = 1
        
        if numStr:find("K") then
            multiplier = 1000
            numStr = numStr:gsub("K", "")
        elseif numStr:find("M") then
            multiplier = 1000000
            numStr = numStr:gsub("M", "")
        elseif numStr:find("B") then
            multiplier = 1000000000
            numStr = numStr:gsub("B", "")
        elseif numStr:find("T") then
            multiplier = 1000000000000
            numStr = numStr:gsub("T", "")
        end
        
        local number = tonumber(numStr)
        if number then
            return number * multiplier
        end
    end
    return 0
end

-- Initialize starting money
spawn(function()
    task.wait(2)
    pcall(function()
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money") then
            if getgenv().startingMoney == 0 then
                getgenv().startingMoney = safeToNumber(player.leaderstats.Money.Value)
            end
        end
    end)
end)

-- Buy OP Container function
local function buyOPContainer()
    if not getgenv().autoBuyOPContainer then return end
    pcall(function()
        local args = {
            buffer.fromstring("*"),
            buffer.fromstring("\254\000\000")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Warp"):WaitForChild("Index"):WaitForChild("Event"):WaitForChild("Reliable"):FireServer(unpack(args))
    end)
end

local function fireContainer(payload)
    local warpEvent = game:GetService("ReplicatedStorage"):WaitForChild("Modules")
        :WaitForChild("Shared"):WaitForChild("Warp"):WaitForChild("Index")
        :WaitForChild("Event"):WaitForChild("Reliable")

    for _, symbol in ipairs({"4", "6"}) do
        pcall(function()
            local args = {buffer.fromstring(symbol), buffer.fromstring(payload)}
            warpEvent:FireServer(unpack(args))
        end)
    end
end

-- Buy selected container function
local function buySelectedContainer()
    if not getgenv().selectedContainer then return end

    local containerName = getgenv().selectedContainer:match("([^%[]+)"):gsub("%s+$", "")

    local containerPayloads = {
        ["Junk"] = "\254\001\000\006\rJunkContainer",
        ["Scratched"] = "\254\001\000\006\018ScratchedContainer",
        ["Sealed"] = "\254\001\000\006\015SealedContainer",
        ["Military"] = "\254\001\000\006\017MilitaryContainer",
        ["Metal"] = "\254\001\000\006\014MetalContainer",
        ["Frozen"] = "\254\001\000\006\015FrozenContainer",
        ["Lava"] = "\254\001\000\006\rLavaContainer",
        ["Corrupted"] = "\254\001\000\006\018CorruptedContainer",
        ["Stormed"] = "\254\001\000\006\016StormedContainer",
        ["Lightning"] = "\254\001\000\006\018LightningContainer",
        ["Infernal"] = "\254\001\000\006\017InfernalContainer",
        ["Mystic"] = "\254\001\000\006\015MysticContainer",
        ["Glitched"] = "\254\001\000\006\017GlitchedContainer",
        ["Astral"] = "\254\001\000\006\015AstralContainer",
        ["Dream"] = "\254\001\000\006\014DreamContainer",
        ["Celestial"] = "\254\001\000\006\018CelestialContainer",
        ["Fire"] = "\254\001\000\006\rFireContainer",
        ["Golden"] = "\254\001\000\006\015GoldenContainer",
        ["Diamond"] = "\254\001\000\006\016DiamondContainer",
        ["Emerald"] = "\254\001\000\006\016EmeraldContainer",
        ["Ruby"] = "\254\001\000\006\rRubyContainer",
        ["Sapphire"] = "\254\001\000\006\017SapphireContainer",
        ["Space"] = "\254\001\000\006\014SpaceContainer",
        ["Deep Space"] = "\254\001\000\006\018DeepSpaceContainer",
        ["Vortex"] = "\254\001\000\006\015VortexContainer",
        ["Black Hole"] = "\254\001\000\006\018BlackHoleContainer",
        ["Camo"] = "\254\001\000\006\rCamoContainer"
    }

    local payload = containerPayloads[containerName]
    if payload then
        fireContainer(payload)
    end
end

-- Open all containers
local function openAllContainers()
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character.HumanoidRootPart then return end
    local playerPos = player.Character.HumanoidRootPart.Position
    
    for _, item in pairs(workspace:GetDescendants()) do
        if item:IsA("ProximityPrompt") and item.ActionText == "Open Container!" then
            local containerModel = item.Parent
            if containerModel then
                local containerPos = nil
                if containerModel:FindFirstChild("HumanoidRootPart") then
                    containerPos = containerModel.HumanoidRootPart.Position
                elseif containerModel:IsA("BasePart") then
                    containerPos = containerModel.Position
                elseif containerModel:IsA("Model") and containerModel.PrimaryPart then
                    containerPos = containerModel.PrimaryPart.Position
                elseif containerModel:IsA("Model") then
                    containerPos = containerModel:GetPivot().Position
                end
                
                if containerPos and (containerPos - playerPos).Magnitude <= 180 then
                    if containerModel:FindFirstChild("HumanoidRootPart") then
                        containerModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                    elseif containerModel:IsA("BasePart") then
                        containerModel.CFrame = CFrame.new(playerPos + Vector3.new(0, 2, 0))
                    elseif containerModel:IsA("Model") and containerModel.PrimaryPart then
                        containerModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                    elseif containerModel:IsA("Model") then
                        containerModel:PivotTo(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                    end
                    task.wait(0.1)
                    pcall(function() fireproximityprompt(item) end)
                end
            end
        end
    end
end

-- Auto open containers loop
local function autoOpenAllContainers()
    if not getgenv().autoOpenContainers then return end
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character.HumanoidRootPart then return end
    local playerPos = player.Character.HumanoidRootPart.Position
    
    for _, item in pairs(workspace:GetDescendants()) do
        if item:IsA("ProximityPrompt") and item.ActionText == "Open Container!" then
            local containerModel = item.Parent
            if containerModel then
                local containerPos = nil
                if containerModel:FindFirstChild("HumanoidRootPart") then
                    containerPos = containerModel.HumanoidRootPart.Position
                elseif containerModel:IsA("BasePart") then
                    containerPos = containerModel.Position
                elseif containerModel:IsA("Model") and containerModel.PrimaryPart then
                    containerPos = containerModel.PrimaryPart.Position
                elseif containerModel:IsA("Model") then
                    containerPos = containerModel:GetPivot().Position
                end
                
                if containerPos and (containerPos - playerPos).Magnitude <= 130 then
                    if containerModel:FindFirstChild("HumanoidRootPart") then
                        containerModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                    elseif containerModel:IsA("BasePart") then
                        containerModel.CFrame = CFrame.new(playerPos + Vector3.new(0, 2, 0))
                    elseif containerModel:IsA("Model") and containerModel.PrimaryPart then
                        containerModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                    elseif containerModel:IsA("Model") then
                        containerModel:PivotTo(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                    end
                    task.wait(0.1)
                    pcall(function() fireproximityprompt(item) end)
                end
            end
        end
    end
end

-- Collect container items
local function collectContainerItems()
    if not getgenv().autoItemPickup then return end
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character.HumanoidRootPart then return end
    local playerPos = player.Character.HumanoidRootPart.Position
    
    for _, item in pairs(workspace:GetDescendants()) do
        if item:IsA("ProximityPrompt") and item.ActionText == "Pick up!" then
            local itemModel = item.Parent
            if itemModel and itemModel.Name:match("^ITEM_") and not getgenv().pickedUpItems[itemModel.Name] then
                local itemPos
                if itemModel:FindFirstChild("HumanoidRootPart") then
                    itemPos = itemModel.HumanoidRootPart.Position
                elseif itemModel:IsA("BasePart") then
                    itemPos = itemModel.Position
                elseif itemModel:IsA("Model") and itemModel.PrimaryPart then
                    itemPos = itemModel.PrimaryPart.Position
                end
                
                if itemPos and (itemPos - playerPos).Magnitude <= 100 then
                    local inSellZone = false
                    pcall(function()
                        local gameplay = workspace:FindFirstChild("Gameplay")
                        if gameplay then
                            local plots = gameplay:FindFirstChild("Plots")
                            if plots then
                                for _, plot in pairs(plots:GetChildren()) do
                                    local plotLogic = plot:FindFirstChild("PlotLogic")
                                    if plotLogic then
                                        local zones = plotLogic:FindFirstChild("Zones")
                                        if zones then
                                            local sellableZone = zones:FindFirstChild("SellableZone")
                                            if sellableZone and sellableZone:IsA("Part") then
                                                if (itemPos - sellableZone.Position).Magnitude <= 20 then
                                                    inSellZone = true
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    
                    if not inSellZone then
                        if itemModel:FindFirstChild("HumanoidRootPart") then
                            itemModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                        elseif itemModel:IsA("BasePart") then
                            itemModel.CFrame = CFrame.new(playerPos + Vector3.new(0, 2, 0))
                        elseif itemModel:IsA("Model") and itemModel.PrimaryPart then
                            itemModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0)))
                        end
                        task.wait(0.05)
                        pcall(function() fireproximityprompt(item) end)
                        getgenv().pickedUpItems[itemModel.Name] = true
                    end
                end
            end
        end
    end
end

-- Collect all coins
local function collectAllCoins()
    if not getgenv().autoCollectCoins then return end
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character.HumanoidRootPart then return end
    local playerPos = player.Character.HumanoidRootPart.Position
    
    local coinHolder = workspace:FindFirstChild("Gameplay")
    if coinHolder then
        coinHolder = coinHolder:FindFirstChild("CoinHolder")
        if coinHolder then
            for _, coin in pairs(coinHolder:GetChildren()) do
                if coin.Name:find("MONEY_SPAWN") and coin:IsA("MeshPart") then
                    coin.CFrame = CFrame.new(playerPos + Vector3.new(0, 2, 0))
                    local proximityPrompt = coin:FindFirstChildOfClass("ProximityPrompt")
                    if proximityPrompt then
                        pcall(function() fireproximityprompt(proximityPrompt) end)
                    end
                end
            end
        end
    end
end

-- Check if player has items
local function hasItemsInInventory()
    local player = game.Players.LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    if backpack and #backpack:GetChildren() > 0 then
        return true
    end
    return false
end

-- Drop all items (sell)
local function dropAllItems()
    if not getgenv().autoSell then return end
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    if not hasItemsInInventory() then return end

    local sellZonePosition = nil
    local playerPos = player.Character.HumanoidRootPart.Position
    local closestDistance = math.huge

    pcall(function()
        local gameplay = workspace:FindFirstChild("Gameplay")
        if gameplay then
            local plots = gameplay:FindFirstChild("Plots")
            if plots then
                for _, plot in pairs(plots:GetChildren()) do
                    local plotLogic = plot:FindFirstChild("PlotLogic")
                    if plotLogic then
                        local zones = plotLogic:FindFirstChild("Zones")
                        if zones then
                            local sellableZone = zones:FindFirstChild("SellableZone")
                            if sellableZone and sellableZone:IsA("Part") then
                                local distance = (sellableZone.Position - playerPos).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    sellZonePosition = sellableZone.Position
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    if sellZonePosition then
        local currentPosition = player.Character.HumanoidRootPart.CFrame
        spawn(function()
            local targetPosition = Vector3.new(sellZonePosition.X, currentPosition.Position.Y, sellZonePosition.Z)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
            task.wait(0.15)

            -- Call both remotes (\v and \r)
            local warpEvent = game:GetService("ReplicatedStorage"):WaitForChild("Modules")
                :WaitForChild("Shared"):WaitForChild("Warp"):WaitForChild("Index")
                :WaitForChild("Event"):WaitForChild("Reliable")

            local argsV = {buffer.fromstring("\v"), buffer.fromstring("\254\000\000")}
            local argsR = {buffer.fromstring("\r"), buffer.fromstring("\254\000\000")}

            warpEvent:FireServer(unpack(argsV))
            task.wait(0.05)
            warpEvent:FireServer(unpack(argsR))

            task.wait(0.1)
            player.Character.HumanoidRootPart.CFrame = currentPosition
        end)
    end
end

-- Set customer speeds
local function setAllCustomersSpeed(speed)
    local customersFolder = workspace:FindFirstChild("Gameplay")
    if customersFolder then
        customersFolder = customersFolder:FindFirstChild("Customers")
        if customersFolder then
            for _, customer in pairs(customersFolder:GetChildren()) do
                if customer:IsA("Model") then
                    local humanoid = customer:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = speed
                    end
                end
            end
        end
    end
end

-- Monitor new customers
spawn(function()
    local customersFolder = workspace:FindFirstChild("Gameplay")
    if customersFolder then
        customersFolder = customersFolder:FindFirstChild("Customers")
        if customersFolder then
            customersFolder.ChildAdded:Connect(function(newCustomer)
                if newCustomer:IsA("Model") and getgenv().customerSpeedEnabled then
                    task.wait(0.5)
                    local humanoid = newCustomer:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = getgenv().customerWalkSpeed
                    end
                end
            end)
        end
    end
end)

-- Format money for display
local function formatMoney(amount)
    if amount >= 1000000000000 then
        return string.format("%.2fT", amount / 1000000000000)
    elseif amount >= 1000000000 then
        return string.format("%.2fB", amount / 1000000000)
    elseif amount >= 1000000 then
        return string.format("%.2fM", amount / 1000000)
    elseif amount >= 1000 then
        return string.format("%.2fK", amount / 1000)
    else
        return string.format("%.0f", amount)
    end
end

-- Create UI Tabs
local automationTab = window:AddTab("Automation")
local cratesTab = window:AddTab("Crates")
local itemsTab = window:AddTab("Items")
local upgradesTab = window:AddTab("Upgrades")
local customersTab = window:AddTab("Customers")
local statisticsTab = window:AddTab("Statistics")
local themeTab = window:AddTab("Themes")
local settingsTab = window:AddTab("Settings")

-- Automation Tab
window:AddLabel(automationTab, "Auto Features")
window:AddDivider(automationTab)

window:AddToggle(automationTab, "Auto Item Pickup", function(value)
    getgenv().autoItemPickup = value
    if value then
        spawn(function()
            while getgenv().autoItemPickup do
                collectContainerItems()
                task.wait(0.1)
            end
        end)
    end
end)

window:AddToggle(automationTab, "Auto Clear Pickup Cache", function(value)
    getgenv().autoClearCache = value
    if value then
        spawn(function()
            while getgenv().autoClearCache do
                task.wait(30)
                if getgenv().autoClearCache then
                    getgenv().pickedUpItems = {}
                    window:Notify({Title = "Cache Cleared", Message = "Pickup cache reset", Type = "Success"})
                end
            end
        end)
    end
end)

window:AddToggle(automationTab, "Auto Sell", function(value)
    getgenv().autoSell = value
    if value then
        spawn(function()
            while getgenv().autoSell do
                dropAllItems()
                task.wait(5)
            end
        end)
    end
end)

window:AddToggle(automationTab, "Auto Open Containers", function(value)
    getgenv().autoOpenContainers = value
    if value then
        spawn(function()
            while getgenv().autoOpenContainers do
                autoOpenAllContainers()
                task.wait(2)
            end
        end)
    end
end)

window:AddToggle(automationTab, "Auto Collect Coins", function(value)
    getgenv().autoCollectCoins = value
    if value then
        spawn(function()
            while getgenv().autoCollectCoins do
                collectAllCoins()
                task.wait(0.1)
            end
        end)
    end
end)

window:AddToggle(automationTab, "Auto Buy OP Container", function(value)
    getgenv().autoBuyOPContainer = value
    if value then
        spawn(function()
            while getgenv().autoBuyOPContainer do
                buyOPContainer()
                task.wait(900)
            end
        end)
    end
end)

-- Crates Tab
window:AddLabel(cratesTab, "Container Selection")
window:AddDivider(cratesTab)

local containers = {
    "Junk [100]", "Scratched [200]", "Sealed [700]", "Military [3k]", "Metal [10k]", 
    "Frozen [25k]", "Lava [50k]", "Corrupted [100k]", "Stormed [250k]", "Lightning [500k]", 
    "Infernal [750k]", "Mystic [1.5m]", "Glitched [5m]", "Astral [10m]", "Dream [25m]", 
    "Celestial [50m]", "Fire [100m]", "Golden [250m]", "Diamond [500m]", "Emerald [2.5b]", 
    "Ruby [10b]", "Sapphire [75b]", "Space [150b]", "Deep Space [500b]", "Vortex [1t]", 
    "Black Hole [2.5t]", "Camo [5t]"
}

window:AddDropdown(cratesTab, "Select Container", containers, function(container)
    getgenv().selectedContainer = container
    window:Notify({Title = "Container Selected", Message = container, Type = "Info"})
end)

window:AddButton(cratesTab, "Buy Selected Container", function()
    buySelectedContainer()
    window:Notify({Title = "Container", Message = "Buying " .. getgenv().selectedContainer, Type = "Info"})
end)

window:AddToggle(cratesTab, "Auto Buy Containers", function(value)
    getgenv().autoBuyContainers = value
    if value then
        spawn(function()
            while getgenv().autoBuyContainers do
                local startTime = tick()
                while tick() - startTime < 3 and getgenv().autoBuyContainers do
                    buySelectedContainer()
                    task.wait(0.1)
                end
                if getgenv().autoBuyContainers then
                    task.wait(5)
                end
            end
        end)
    end
end)

window:AddDivider(cratesTab)
window:AddLabel(cratesTab, "Container Actions")
window:AddDivider(cratesTab)

window:AddButton(cratesTab, "Open All Containers", function()
    openAllContainers()
    window:Notify({Title = "Opening", Message = "All containers nearby", Type = "Info"})
end)

-- Items Tab
window:AddLabel(itemsTab, "Item Management")
window:AddDivider(itemsTab)

window:AddButton(itemsTab, "Sell All Items", function()
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character.HumanoidRootPart then return end
    if not hasItemsInInventory() then 
        window:Notify({Title = "No Items", Message = "Inventory is empty", Type = "Warning"})
        return 
    end
    
    local sellZonePosition = nil
    local playerPos = player.Character.HumanoidRootPart.Position
    local closestDistance = math.huge
    
    pcall(function()
        local gameplay = workspace:FindFirstChild("Gameplay")
        if gameplay then
            local plots = gameplay:FindFirstChild("Plots")
            if plots then
                for _, plot in pairs(plots:GetChildren()) do
                    local plotLogic = plot:FindFirstChild("PlotLogic")
                    if plotLogic then
                        local zones = plotLogic:FindFirstChild("Zones")
                        if zones then
                            local sellableZone = zones:FindFirstChild("SellableZone")
                            if sellableZone and sellableZone:IsA("Part") then
                                local distance = (sellableZone.Position - playerPos).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    sellZonePosition = sellableZone.Position
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    if sellZonePosition then
        local currentPosition = player.Character.HumanoidRootPart.CFrame
        spawn(function()
            local targetPosition = Vector3.new(sellZonePosition.X, currentPosition.Position.Y, sellZonePosition.Z)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
            task.wait(0.15)
            local args = {buffer.fromstring("\r"), buffer.fromstring("\254\000\000")}
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Warp"):WaitForChild("Index"):WaitForChild("Event"):WaitForChild("Reliable"):FireServer(unpack(args))
            task.wait(0.1)
            player.Character.HumanoidRootPart.CFrame = currentPosition
        end)
        window:Notify({Title = "Selling", Message = "Items sold!", Type = "Success"})
    end
end)

window:AddButton(itemsTab, "Collect All Items", function()
    getgenv().pickedUpItems = getgenv().pickedUpItems or {}
    local player = game.Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local playerPos = player.Character.HumanoidRootPart.Position
    
    for _, item in pairs(workspace:GetDescendants()) do
        if item:IsA("ProximityPrompt") and item.ActionText == "Pick up!" then
            local itemModel = item.Parent
            if itemModel and itemModel.Name:match("^ITEM_") and not getgenv().pickedUpItems[itemModel.Name] then
                local itemPos
                if itemModel:FindFirstChild("HumanoidRootPart") then
                    itemPos = itemModel.HumanoidRootPart.Position
                elseif itemModel:IsA("BasePart") then
                    itemPos = itemModel.Position
                elseif itemModel:IsA("Model") and itemModel.PrimaryPart then
                    itemPos = itemModel.PrimaryPart.Position
                end
                
                if itemPos and (itemPos - playerPos).Magnitude <= 100 then
                    local inSellZone = false
                    pcall(function()
                        local gameplay = workspace:FindFirstChild("Gameplay")
                        if gameplay then
                            local plots = gameplay:FindFirstChild("Plots")
                            if plots then
                                for _, plot in pairs(plots:GetChildren()) do
                                    local plotLogic = plot:FindFirstChild("PlotLogic")
                                    if plotLogic then
                                        local zones = plotLogic:FindFirstChild("Zones")
                                        if zones then
                                            local sellableZone = zones:FindFirstChild("SellableZone")
                                            if sellableZone and sellableZone:IsA("Part") then
                                                if (itemPos - sellableZone.Position).Magnitude <= 20 then
                                                    inSellZone = true
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    
                    if not inSellZone then
                        if itemModel:FindFirstChild("HumanoidRootPart") then
                            pcall(function() itemModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0))) end)
                        elseif itemModel:IsA("BasePart") then
                            pcall(function() itemModel.CFrame = CFrame.new(playerPos + Vector3.new(0, 2, 0)) end)
                        elseif itemModel:IsA("Model") and itemModel.PrimaryPart then
                            pcall(function() itemModel:SetPrimaryPartCFrame(CFrame.new(playerPos + Vector3.new(0, 2, 0))) end)
                        end
                        task.wait(0.05)
                        pcall(function() fireproximityprompt(item) end)
                        getgenv().pickedUpItems[itemModel.Name] = true
                    end
                end
            end
        end
    end
    window:Notify({Title = "Items", Message = "Collected all nearby items", Type = "Success"})
end)

-- Upgrades Tab
window:AddLabel(upgradesTab, "Auto Upgrades")
window:AddDivider(upgradesTab)

local function fireUpgrade(key)
    local warpEvent = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Warp"):WaitForChild("Index"):WaitForChild("Event"):WaitForChild("Reliable")
    local payload = "\254\001\000\006" .. key

    for _, symbol in ipairs({":", "<"}) do
        pcall(function()
            local args = {buffer.fromstring(symbol), buffer.fromstring(payload)}
            warpEvent:FireServer(unpack(args))
        end)
    end
end

window:AddToggle(upgradesTab, "Auto Upgrade: Inventory Items", function(value)
    getgenv().upgradeSettings.inventoryItems = value
    if value then
        spawn(function()
            while getgenv().upgradeSettings.inventoryItems do
                fireUpgrade("\017MaxInventoryItems")
                task.wait(10)
            end
        end)
    end
end)

window:AddToggle(upgradesTab, "Auto Upgrade: Flowers", function(value)
    getgenv().upgradeSettings.flowers = value
    if value then
        spawn(function()
            while getgenv().upgradeSettings.flowers do
                fireUpgrade("\016MaxFlowersPlaced")
                task.wait(10)
            end
        end)
    end
end)

window:AddToggle(upgradesTab, "Auto Upgrade: Customers", function(value)
    getgenv().upgradeSettings.customers = value
    if value then
        spawn(function()
            while getgenv().upgradeSettings.customers do
                fireUpgrade("\fMaxCustomers")
                task.wait(10)
            end
        end)
    end
end)

window:AddToggle(upgradesTab, "Auto Upgrade: Enchantment Slots", function(value)
    getgenv().upgradeSettings.enchantmentSlots = value
    if value then
        spawn(function()
            while getgenv().upgradeSettings.enchantmentSlots do
                fireUpgrade("\019MaxEnchantmentSlots")
                task.wait(10)
            end
        end)
    end
end)

window:AddToggle(upgradesTab, "Auto Upgrade: Containers", function(value)
    getgenv().upgradeSettings.containers = value
    if value then
        spawn(function()
            while getgenv().upgradeSettings.containers do
                fireUpgrade("\rMaxContainers")
                task.wait(10)
            end
        end)
    end
end)

window:AddToggle(upgradesTab, "Auto Upgrade: Plot Items", function(value)
    getgenv().upgradeSettings.plotItems = value
    if value then
        spawn(function()
            while getgenv().upgradeSettings.plotItems do
                fireUpgrade("\014MaxItemsOnPlot")
                task.wait(10)
            end
        end)
    end
end)

-- ========================
-- MANUAL UPGRADES
-- ========================

window:AddDivider(upgradesTab)
window:AddLabel(upgradesTab, "Manual Upgrades")
window:AddDivider(upgradesTab)

window:AddButton(upgradesTab, "Upgrade Inventory Items", function()
    fireUpgrade("\017MaxInventoryItems")
    window:Notify({Title = "Upgrade", Message = "Inventory upgraded", Type = "Success"})
end)

window:AddButton(upgradesTab, "Upgrade Flowers", function()
    fireUpgrade("\016MaxFlowersPlaced")
    window:Notify({Title = "Upgrade", Message = "Flowers upgraded", Type = "Success"})
end)

window:AddButton(upgradesTab, "Upgrade Customers", function()
    fireUpgrade("\fMaxCustomers")
    window:Notify({Title = "Upgrade", Message = "Customers upgraded", Type = "Success"})
end)

window:AddButton(upgradesTab, "Upgrade Enchantment Slots", function()
    fireUpgrade("\019MaxEnchantmentSlots")
    window:Notify({Title = "Upgrade", Message = "Enchantment slots upgraded", Type = "Success"})
end)

window:AddButton(upgradesTab, "Upgrade Containers", function()
    fireUpgrade("\rMaxContainers")
    window:Notify({Title = "Upgrade", Message = "Containers upgraded", Type = "Success"})
end)

window:AddButton(upgradesTab, "Upgrade Plot Items", function()
    fireUpgrade("\014MaxItemsOnPlot")
    window:Notify({Title = "Upgrade", Message = "Plot items upgraded", Type = "Success"})
end)

-- Customers Tab
window:AddLabel(customersTab, "Customer Speed Control")
window:AddDivider(customersTab)

window:AddToggle(customersTab, "Enable Customer Speed", function(value)
    getgenv().customerSpeedEnabled = value
    if value then
        setAllCustomersSpeed(getgenv().customerWalkSpeed)
    else
        setAllCustomersSpeed(16)
    end
end)

window:AddSlider(customersTab, "Customer Speed", 1, 10, 1, function(value)
    local actualSpeed = value * 16
    getgenv().customerWalkSpeed = actualSpeed

    if getgenv().customerSpeedEnabled then
        setAllCustomersSpeed(actualSpeed)
    end
end, {
    Suffix = "x",       -- display multiplier
    Decimals = 0,       -- integer slider
    ShowMinMax = true
})

-- Statistics Tab
window:AddLabel(statisticsTab, "Profit Tracker")
window:AddDivider(statisticsTab)

window:AddButton(statisticsTab, "Show Profit/Loss", function()
    local currentMoney = 0
    pcall(function()
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money") then
            currentMoney = safeToNumber(player.leaderstats.Money.Value)
        end
    end)
    
    local startingMoney = safeToNumber(getgenv().startingMoney)
    local netProfit = currentMoney - startingMoney
    local profitSymbol = netProfit >= 0 and "+" or "-"
    local notificationTitle = netProfit >= 0 and "Profit Report" or "Loss Report"
    local notificationMessage = string.format("Start: $%s | Current: $%s\n%s$%s", formatMoney(startingMoney), formatMoney(currentMoney), profitSymbol, formatMoney(math.abs(netProfit)))
    
    window:Notify({Title = notificationTitle, Message = notificationMessage, Type = netProfit >= 0 and "Success" or "Warning"})
end)

window:AddButton(statisticsTab, "Reset Profit Tracker", function()
    pcall(function()
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money") then
            getgenv().startingMoney = safeToNumber(player.leaderstats.Money.Value)
            window:Notify({Title = "Tracker Reset", Message = "New baseline: $" .. formatMoney(getgenv().startingMoney), Type = "Success"})
        else
            window:Notify({Title = "Error", Message = "Could not access money data", Type = "Error"})
        end
    end)
end)

-- Theme Tab
getgenv().customThemes = getgenv().customThemes or {}
getgenv().currentCustomTheme = getgenv().currentCustomTheme or {
    Primary = Color3.fromRGB(0, 180, 255),
    Secondary = Color3.fromRGB(22, 22, 25),
    Tertiary = Color3.fromRGB(28, 28, 32),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(180, 180, 190),
    Dark = Color3.fromRGB(18, 18, 20),
    Accent = Color3.fromRGB(255, 100, 100)
}

window:AddLabel(themeTab, "Theme Presets")
window:AddDivider(themeTab)

local function getThemeList()
    local themes = {"Dark", "Ocean", "Sunset", "Forest", "Midnight", "Purple", "Cyberpunk", "Neon", "Dracula", "Nord", "Monokai", "Gruvbox", "Tokyo", "Rose"}
    for themeName, _ in pairs(getgenv().customThemes) do
        if not table.find(themes, themeName) then
            table.insert(themes, themeName)
        end
    end
    return themes
end

local themeDropdownContainer = nil
local currentThemeDropdown = nil

local function updateThemeDropdown()
    -- Store the old container reference
    local oldContainer = themeDropdownContainer
    
    -- Create new dropdown
    currentThemeDropdown = window:AddDropdown(themeTab, "Theme Preset", getThemeList(), function(theme)
        if getgenv().customThemes[theme] then
            window:CreateCustomTheme(getgenv().customThemes[theme])
            window:Notify({Title = "Custom Theme", Message = theme .. " loaded", Type = "Success"})
        else
            window:SetTheme(theme)
            window:Notify({Title = "Theme Changed", Message = theme .. " applied", Type = "Success"})
        end
    end)
    
    -- Store reference to the new container
    themeDropdownContainer = currentThemeDropdown
    
    -- If there was an old container, swap their LayoutOrders and then delete the old one
    if oldContainer and oldContainer.Parent then
        local oldOrder = oldContainer.LayoutOrder
        themeDropdownContainer.LayoutOrder = oldOrder
        oldContainer:Destroy()
    end
end

updateThemeDropdown()

window:AddDivider(themeTab)
window:AddLabel(themeTab, "Custom Theme Creator")
window:AddDivider(themeTab)

window:AddColorPicker(themeTab, "Primary Color", getgenv().currentCustomTheme.Primary, function(color)
    getgenv().currentCustomTheme.Primary = color
end)

window:AddColorPicker(themeTab, "Secondary Color", getgenv().currentCustomTheme.Secondary, function(color)
    getgenv().currentCustomTheme.Secondary = color
end)

window:AddColorPicker(themeTab, "Tertiary Color", getgenv().currentCustomTheme.Tertiary, function(color)
    getgenv().currentCustomTheme.Tertiary = color
end)

window:AddColorPicker(themeTab, "Text Color", getgenv().currentCustomTheme.Text, function(color)
    getgenv().currentCustomTheme.Text = color
end)

window:AddColorPicker(themeTab, "Secondary Text Color", getgenv().currentCustomTheme.TextSecondary, function(color)
    getgenv().currentCustomTheme.TextSecondary = color
end)

window:AddColorPicker(themeTab, "Dark Color", getgenv().currentCustomTheme.Dark, function(color)
    getgenv().currentCustomTheme.Dark = color
end)

window:AddColorPicker(themeTab, "Accent Color", getgenv().currentCustomTheme.Accent, function(color)
    getgenv().currentCustomTheme.Accent = color
end)

window:AddDivider(themeTab)

window:AddButton(themeTab, "Preview Custom Theme", function()
    window:CreateCustomTheme(getgenv().currentCustomTheme)
    window:Notify({Title = "Preview", Message = "Custom theme applied", Type = "Info"})
end)

window:AddTextBox(themeTab, "Theme Name", function(text)
    if text and text ~= "" then
        getgenv().customThemes[text] = {
            Primary = getgenv().currentCustomTheme.Primary,
            Secondary = getgenv().currentCustomTheme.Secondary,
            Tertiary = getgenv().currentCustomTheme.Tertiary,
            Text = getgenv().currentCustomTheme.Text,
            TextSecondary = getgenv().currentCustomTheme.TextSecondary,
            Dark = getgenv().currentCustomTheme.Dark,
            Accent = getgenv().currentCustomTheme.Accent
        }
        window:Notify({Title = "Theme Saved", Message = "'" .. text .. "' saved successfully", Type = "Success"})
        
        -- Update dropdown with new theme list
        updateThemeDropdown()
    end
end)

window:AddDivider(themeTab)
window:AddLabel(themeTab, "Manage Custom Themes")
window:AddDivider(themeTab)

window:AddButton(themeTab, "Delete Custom Theme", function()
    local customThemeNames = {}
    for themeName, _ in pairs(getgenv().customThemes) do
        table.insert(customThemeNames, themeName)
    end
    
    if #customThemeNames == 0 then
        window:Notify({Title = "No Themes", Message = "No custom themes to delete", Type = "Warning"})
        return
    end
    
    window:ShowDialog({
        Title = "Delete Custom Theme",
        Message = "Enter the exact name of the theme to delete:",
        Buttons = {
            {"Cancel", function() end},
            {"Confirm", function()
                window:Notify({Title = "Delete Theme", Message = "Type theme name in textbox above", Type = "Info"})
            end}
        }
    })
end)

window:AddTextBox(themeTab, "Delete Theme Name", function(text)
    if text and text ~= "" then
        if getgenv().customThemes[text] then
            getgenv().customThemes[text] = nil
            window:Notify({Title = "Theme Deleted", Message = "'" .. text .. "' removed", Type = "Success"})
            
            -- Update dropdown to remove deleted theme
            updateThemeDropdown()
        else
            window:Notify({Title = "Not Found", Message = "Theme '" .. text .. "' doesn't exist", Type = "Error"})
        end
    end
end)

window:AddButton(themeTab, "List All Custom Themes", function()
    local customThemeNames = {}
    for themeName, _ in pairs(getgenv().customThemes) do
        table.insert(customThemeNames, themeName)
    end
    
    if #customThemeNames == 0 then
        window:Notify({Title = "Custom Themes", Message = "No custom themes saved", Type = "Info"})
    else
        local themeList = table.concat(customThemeNames, ", ")
        window:Notify({Title = "Custom Themes", Message = themeList, Type = "Info", Duration = 5})
    end
end)

-- Settings Tab
window:AddLabel(settingsTab, "Player Settings")
window:AddSection(settingsTab, "Player Walkspeed")
local player = game.Players.LocalPlayer
local defaultWalkSpeed = (player and player.Character and player.Character:FindFirstChild("Humanoid")) and player.Character.Humanoid.WalkSpeed or 16

window:AddSlider(settingsTab, "Player WalkSpeed", 16, 500, defaultWalkSpeed, function(value)
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end, {
    Suffix = " studs/s",  -- show units
    Decimals = 0,
    ShowMinMax = true
})

window:AddButton(settingsTab, "Unload Hub", function()
    window:Notify({Title = "Prestige Hub", Message = "Unloading hub...", Type = "Info"})
    task.wait(0.5)
    window:Close()
    getgenv().customerWalkSpeed = nil
    getgenv().customerSpeedEnabled = nil
    getgenv().autoCollectCoins = nil
    getgenv().autoSell = nil
    getgenv().autoItemPickup = nil
    getgenv().autoOpenContainers = nil
    getgenv().autoBuyOPContainer = nil
    getgenv().autoUpgrades = nil
    getgenv().upgradeSettings = nil
end)

window:Notify({Title = "Prestige Hub", Message = "Successfully loaded!", Type = "Success", Duration = 3})
