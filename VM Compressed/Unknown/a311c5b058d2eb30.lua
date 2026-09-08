--[[
 █████   █████          ████                       ███             █████   █████            █████    
▒▒███   ▒▒███          ▒▒███                      ▒▒▒             ▒▒███   ▒▒███            ▒▒███     
 ▒███    ▒███   ██████  ▒███   ██████   ████████  ████   █████     ▒███    ▒███  █████ ████ ▒███████ 
 ▒███    ▒███  ███▒▒███ ▒███  ▒▒▒▒▒███ ▒▒███▒▒███▒▒███  ███▒▒      ▒███████████ ▒▒███ ▒███  ▒███▒▒███
 ▒▒███   ███  ▒███ ▒███ ▒███   ███████  ▒███ ▒▒▒  ▒███ ▒▒█████     ▒███▒▒▒▒▒███  ▒███ ▒███  ▒███ ▒███
  ▒▒▒█████▒   ▒███ ▒███ ▒███  ███▒▒███  ▒███      ▒███  ▒▒▒▒███    ▒███    ▒███  ▒███ ▒███  ▒███ ▒███
    ▒▒███     ▒▒██████  █████▒▒████████ █████     █████ ██████     █████   █████ ▒▒████████ ████████ 
     ▒▒▒       ▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒ ▒▒▒▒▒▒     ▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒  
                                                                                                     

Made by 			░▒▓████████▓▒░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
				      ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
				      ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
				      ░▒▓██████▓▒░ ░▒▓█▓▒░    ░▒▓██████▓▒░  
				      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
				      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
				      ░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░     
                                      
Credits to Nebula Softworks © for the UI Library.

loadstring(game:HttpGet("https://raw.githubusercontent.com/flyrbo/Volaris/refs/heads/main/Loader.lua"))()


                      !!WARNING!!
This script is created for educational and testing purposes only.
I do not encourage or promote exploiting in any Roblox game.

By using this script, you acknowledge that:
- You are responsible for your own actions.
- Using exploits may violate Roblox's Terms of Service.
- Your account may be permanently banned or restricted.

I am not responsible for any consequences resulting from its use.

If you do not agree with these terms, do not use this script.
--]]

--/ UI Library import
local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()
local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()


--/ SUPPORTED FUNCTIONS CHECK
local function checkExecutor()
    local missing = {}

    local function check(name, func)
        if typeof(func) ~= "function" then
            table.insert(missing, name)
        end
    end

    check("loadstring", loadstring)
    check("HttpGet", game.HttpGet)
    check("getgenv", getgenv)
    check("firetouchinterest", firetouchinterest)
    check("fireproximityprompt", fireproximityprompt)

    if #missing > 0 then
        warn("Executor missing required functions:")

        for _, v in ipairs(missing) do
            warn("- " .. v)
        end

        return false
    end

    return true
end

--/ LOADER USED CHECK
if not getgenv().funcCheck then
    if not checkExecutor() then
        local Loaded = Starlight:Notification({
    	    Title = "Unsupported Executor",
    	    Icon = NebulaIcons:GetIcon('shield-x', 'Lucide'),
    	    Content = "This script will lose key functionality using this executor. Please report the name of the executor on the GitHub page.",
	    }, "UNSUPPORTED EXECUTOR")
        return
    end
end

--/ PLACE ID CHECK
if tostring(game.PlaceId) ~= "130818457717791" and tostring(game.PlaceId) ~= "80953732024525" then
	local Loaded = Starlight:Notification({
    	Title = "Invalid Game!",
    	Icon = NebulaIcons:GetIcon('shield-x', 'Lucide'),
    	Content = "This script is intended to be used in Survive The Island.",
	}, "INVALID_PLACEID")
	return
end

--// GLOBAL STATE
getgenv().Volaris = getgenv().Volaris or {
    Toggles = {},
    Running = {},
    Connections = {},
    Dropdowns = {}
}

local Global = getgenv().Volaris
Global.Toggles = Global.Toggles or {}
Global.Running = Global.Running or {}
Global.Connections = Global.Connections or {}
Global.Dropdowns = Global.Dropdowns or {}
Global.Dropdowns.AutoKill = Global.Dropdowns.AutoKill or {"Monsters"}


local toolData = {
	-- ROCK
	["Stone"] = {type="Rock", strength=1}, -- Stone / Rock (you said Oak can use this)

	-- AXES
	[70] = {type="Axe", strength=2}, -- Stone Axe
	[46] = {type="Axe", strength=3}, -- Iron Axe
	[47] = {type="Axe", strength=4}, -- Rizzium Axe
	[45] = {type="Axe", strength=5}, -- Basedium Axe
	[32] = {type="Axe", strength=6}, -- Gold Axe
	[44] = {type="Axe", strength=7}, -- Yeatite Axe
	[60] = {type="Axe", strength=9}, -- Goofyum Axe

	-- PICKAXES
	[69] = {type="Pickaxe", strength=2}, -- Stone Pickaxe
	[31] = {type="Pickaxe", strength=4}, -- Iron Pickaxe
	[43] = {type="Pickaxe", strength=5}, -- Rizzium Pickaxe
	[42] = {type="Pickaxe", strength=6}, -- Basedium Pickaxe
	[41] = {type="Pickaxe", strength=7}, -- Gold Pickaxe
	[39] = {type="Pickaxe", strength=8}, -- Yeatite Pickaxe 
	[40] = {type="Pickaxe", strength=9}, -- Goofyum Pickaxe (strongest)

	-- SWORDS
	[34] = {type="Sword", strength=2}, -- Stone Sword
	[71] = {type="Sword", strength=4}, -- Iron Sword
	[33] = {type="Sword", strength=5}, -- Rizzium Sword
	[36] = {type="Sword", strength=6}, -- Basedium Sword
	[35] = {type="Sword", strength=7}, -- Gold Sword
	[38] = {type="Sword", strength=8}, -- Yeatite Sword
	[37] = {type="Sword", strength=9}, -- Goofyum Sword (strongest)
}


--// FUNCTION HANDLER TABLE
local functions = {}

--/// MAIN FUNCTIONS
functions.autoKillFunction = function()
    if Global.Running.AutoKill then return end
    Global.Running.AutoKill = true

    local player = game:GetService("Players").LocalPlayer
    local mobsFolder = workspace:WaitForChild("Mobs")

    local remote = game:GetService("ReplicatedStorage")
        :WaitForChild("Remotes")
        :WaitForChild("Inv")
        :WaitForChild("HitObj")

    local animalIDs = {
        [14] = true,
        [15] = true
    }

    local monsterIDs = {
        [1] = true,
		[3] = true,
		[4] = true,
		[5] = true,
		[6] = true,
		[8] = true,
        [9] = true,
		[10] = true,
        [11] = true,
        [12] = true
    }

    local activeMobs = {}

    local function isValidTarget(model)
        local selections = Global.Dropdowns.AutoKill or {"Monsters"}

        local idValue
        for _, v in ipairs(model:GetChildren()) do
            if v:IsA("IntValue") then
                idValue = v.Value
                break
            end
        end

        if not idValue then return false end

        for _, option in ipairs(selections) do
            if option == "Animals" and animalIDs[idValue] then
                return true
            elseif option == "Monsters" and monsterIDs[idValue] then
                return true
            end
        end

        return false
    end

    local function handleMob(model)
        if activeMobs[model] then return end
        activeMobs[model] = true

        task.spawn(function()
            while Global.Toggles.AutoKill and model.Parent == mobsFolder do
                if isValidTarget(model) then
                    remote:InvokeServer(model)
                end
                task.wait(0.1)
            end

            activeMobs[model] = nil
        end)
    end

    for _, model in ipairs(mobsFolder:GetChildren()) do
        if model:IsA("Model") then
            handleMob(model)
        end
    end

    local conn
    conn = mobsFolder.ChildAdded:Connect(function(model)
        if model:IsA("Model") then
            handleMob(model)
        end
    end)

    task.spawn(function()
        while Global.Toggles.AutoKill do
            task.wait(0.5)
        end

        if conn then
            conn:Disconnect()
        end

        Global.Running.AutoKill = false
        table.clear(activeMobs)
    end)
end
functions.autoCollectFunction = function()
    if Global.Running.AutoCollect then return end
    Global.Running.AutoCollect = true

    local player = game:GetService("Players").LocalPlayer
    local droppedFolder = workspace:WaitForChild("GroundItems")

    task.spawn(function()
        while Global.Toggles.AutoCollect do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")

            for _, model in ipairs(droppedFolder:GetChildren()) do
                if model:IsA("Model") then
                    for _, obj in ipairs(model:GetDescendants()) do
                        if obj:IsA("BasePart") and obj:FindFirstChildOfClass("TouchTransmitter") then
                            firetouchinterest(hrp, obj, 0)
                            firetouchinterest(hrp, obj, 1)
                        end
                    end
                end
            end

            task.wait(0.2)
        end

        Global.Running.AutoCollect = false
    end)
end
functions.autoHarvestFunction = function()
    if Global.Running.AutoHarvest then return end

    local function getSelected()
        local sel = Global.Dropdowns.AutoHarvest
        if typeof(sel) == "table" then
            return sel[1]
        end
        return sel
    end

    local function canRun()
        return Global.Toggles.AutoHarvest
            and getSelected() ~= nil
            and Global.Values
            and tonumber(Global.Values.AutoHarvestQuantity)
    end

    if not canRun() then return end
    Global.Running.AutoHarvest = true

    local player = game:GetService("Players").LocalPlayer
    local invFolder = player:WaitForChild("Inv")
	local selectedItem = player:WaitForChild("SelectedItem")

    local terrainFolder = workspace:WaitForChild("TerrainBuildings")

    local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inv")
    local hitRemote = remotes:WaitForChild("HitObj")
    local moveRemote = remotes:WaitForChild("MoveInvItem")
    local equipRemote = remotes:WaitForChild("EquipItem")

    local selected = getSelected()
    local quantity = tonumber(Global.Values.AutoHarvestQuantity)

    local resourceFolder = terrainFolder:FindFirstChild(selected)
    if not resourceFolder then
        Global.Running.AutoHarvest = false
        return
    end

	local function getEquippedID()
    	local equipped = selectedItem.Value
    	if not equipped then return nil end

    	if equipped:FindFirstChild("ID") then
    	    return equipped.ID.Value
    	end

        local equippedName = tonumber(equipped.Name)
        if tostring(equipped.Name) == "Stone" then equippedName = "Stone" end

    	return equippedName
	end

	local axeResources = {
	    Oak=true, Birch=true, Spruce=true, Cherry=true, Palm=true, Ash=true
	}

	local pickaxeResources = {
	    Stone=true, Iron=true, Coal=true, Rizzium=true, Basedium=true, Yeatite=true, Gold=true, Goofyum=true
	}

	local resourceStrength = {
	    Oak = 1,
	    Birch = 2,
	    Spruce = 3,
	    Cherry = 4,
	    Palm = 5,
	    Ash = 7,

	    Stone = 2,
	    Iron = 3,
	    Coal = 2,
	    Rizzium = 4,
	    Basedium = 5,
	    Yeatite = 7,
	    Gold = 6,
	    Goofyum = 8
	}

	local function isValidTool(id)
	    return toolData[id] ~= nil
	end

	local function isCorrectTool(id)

	    local data = toolData[id]
	    if not data then return false end

	    if selected == "Oak" and data.type == "Rock" then
            return true
	    end

	    if axeResources[selected] then
	        return data.type == "Axe"
	    elseif pickaxeResources[selected] then
	        return data.type == "Pickaxe"
	    end

	    return false
	end

    local bestSlot, bestID, bestStrength = nil, nil, 0
	local requiredStrength = resourceStrength[selected] or 1

	for i = 1, 28 do
	    local slot = invFolder:FindFirstChild("Slot"..i)
	    if slot then
	        local item = slot:FindFirstChildOfClass("StringValue")
	        if item then
	            local id = tonumber(item.Value)
				if tostring(item.Value) == "Stone" then id = "Stone" end
	            local data = toolData[id]
	            if data and isCorrectTool(id) and data.strength >= requiredStrength then
	                if data.strength > bestStrength then
	                    bestStrength = data.strength
	                    bestID = id
	                    bestSlot = i
	                end
	            end
	        end
	    end
	end

    if not bestSlot then
        Starlight:Notification({
            Title = "Auto Harvest",
			Icon = NebulaIcons:GetIcon('triangle-alert', 'Lucide'),
            Content = "No suitable tool found in inventory.",
        }, "NO_TOOL")

        Global.Running.AutoHarvest = false
        return
    end

    local hotbarSlot = bestSlot

    if bestSlot > 7 then
        local targetSlot = nil

        for i = 1, 7 do
            if not invFolder:FindFirstChild("Slot"..i) then
                targetSlot = i
                break
            end
        end

        targetSlot = targetSlot or 1

        moveRemote:InvokeServer(653406975,653406975,bestSlot,targetSlot)
        hotbarSlot = targetSlot
    end

    equipRemote:InvokeServer(hotbarSlot)

    task.wait(0.2)

	if getEquippedID() ~= bestID then
	    Starlight:Notification({
	        Title = "Auto Harvest",
			Icon = NebulaIcons:GetIcon('octagon-alert', 'Lucide'),
	        Content = "Failed to equip tool.",
	    }, "EQUIP_FAIL")

	    Global.Running.AutoHarvest = false
	    return
	end

    Starlight:Notification({
        Title = "Auto Harvest",
		Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
        Content = "Started. Do not unequip tool.",
    }, "START")

    local resources = {}
    for _, v in ipairs(resourceFolder:GetChildren()) do
        if v:IsA("Model") then
            table.insert(resources, v)
        end
    end

    local amountToProcess = math.min(quantity, #resources)

    for i = 1, amountToProcess do
        local resource = resources[i]

        task.spawn(function()
            while resource
                and resource.Parent == resourceFolder
                and Global.Toggles.AutoHarvest do

                if getEquippedID() ~= bestID then
                    Starlight:Notification({
                        Title = "Auto Harvest",
						Icon = NebulaIcons:GetIcon('octagon-alert', 'Lucide'),
                        Content = "Tool unequipped. Cancelling.",
                    }, "UNEQUIP")

                    Global.Toggles.AutoHarvest = false
                    return
                end

                hitRemote:InvokeServer(resource)
                task.wait(0.1)
            end
        end)
    end

    task.spawn(function()
        while Global.Toggles.AutoHarvest do
            local remaining = 0

            for i = 1, amountToProcess do
                local res = resources[i]
                if res and res.Parent == resourceFolder then
                    remaining += 1
                end
            end

            if remaining == 0 then break end
            task.wait(0.2)
        end

        Starlight:Notification({
            Title = "Auto Harvest",
			Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
            Content = "Finished. Turn on Auto Collect.",
        }, "DONE")

        Global.Running.AutoHarvest = false
    end)
end
functions.autoTotemFunction = function()
    if Global.Running.AutoTotem then return end

    local function getSelected()
        local sel = Global.Dropdowns.AutoTotem
        if typeof(sel) == "table" then
            return sel[1]
        end
        return sel
    end

    if not Global.Toggles.AutoTotem or not getSelected() or not tonumber(Global.Values and Global.Values.AutoTotemAmount) then
        return
    end

    Global.Running.AutoTotem = true

    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local totemRoot = workspace:WaitForChild("LockedBuildings"):WaitForChild("Totem")

    local selected = getSelected()
    local amount = tonumber(Global.Values.AutoTotemAmount)

    local folderMap = {
        ["Totem of Conflict (Towers)"] = "Totem of Conflict",
        ["Totem of Cactus (Boss)"] = "Totem of Cactus",
        ["Totem of Dino (Boss)"] = "Totem of Dino",
        ["Totem of Pirate (Boss)"] = "Totem of Pirate",
        ["Totem of Shark (Boss)"] = "Totem of Shark",
    }

    local folderName = folderMap[selected]
    local folder = totemRoot:FindFirstChild(folderName)

    if not folder then
        Global.Running.AutoTotem = false
        return
    end

    local models = {}
    for _, v in ipairs(folder:GetChildren()) do
        if v:IsA("Model") then
            table.insert(models, v)
        end
    end

    if #models == 0 then
        Starlight:Notification({
            Title = "Auto Totem",
			Icon = NebulaIcons:GetIcon('triangle-alert', 'Lucide'),
            Content = "No totems yet.",
        }, "NO_TOTEMS")

        Global.Running.AutoTotem = false
        return
    end

    local amountToUse = math.min(amount, #models)

    local originalCF = hrp.CFrame

    for i = 1, amountToUse do
        local model = models[i]

        local foundPrompt = nil
        local foundPart = nil

        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                local prompt = part:FindFirstChildOfClass("ProximityPrompt")
                if prompt then
                    foundPrompt = prompt
                    foundPart = part
                    break
                end
            end
        end

        if foundPrompt and foundPart then
            hrp.CFrame = foundPart.CFrame
            task.wait(0.15)

            fireproximityprompt(foundPrompt)

            task.wait(0.25)
        end
    end

    hrp.CFrame = originalCF

    Starlight:Notification({
        Title = "Auto Totem",
		Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
        Content = "Finished activating totems.",
    }, "TOTEM_DONE")

    Global.Running.AutoTotem = false
end
functions.autoChestFunction = function()
    if Global.Running.AutoChest then return end

    local function getSelected()
        local sel = Global.Dropdowns.AutoChest
        if typeof(sel) == "table" then
            return sel[1]
        end
        return sel
    end

    if not Global.Toggles.AutoChest or not getSelected() or not tonumber(Global.Values and Global.Values.AutoChestAmount) then
        return
    end

    Global.Running.AutoChest = true

    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local chestRoot = workspace:WaitForChild("LockedBuildings"):WaitForChild("Chest")

    local selected = getSelected()
    local amount = tonumber(Global.Values.AutoChestAmount)

    local coinArgs = {Recipe = {}, ID = "Coin", Stack = 1/0}
    local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
    local invRemotes = remotes:WaitForChild("Inv")
    local remote = invRemotes:WaitForChild("CraftItem")

    local folderMap = {
        ["Common"] = "Common Chest",
        ["Rare"] = "Rare Chest",
        ["Legendary"] = "Legendary Chest"
    }

    local folderName = folderMap[selected]
    local folder = chestRoot:FindFirstChild(folderName)

    if not folder then
        Global.Running.AutoChest = false
        return
    end

    local models = {}
    for _, v in ipairs(folder:GetChildren()) do
        if v:IsA("Model") then
            table.insert(models, v)
        end
    end

    if #models == 0 then
        Starlight:Notification({
            Title = "Auto Chest",
			Icon = NebulaIcons:GetIcon('triangle-alert', 'Lucide'),
            Content = "There are currently no chests of this rarity",
        }, "NO_CHESTS")

        Global.Running.AutoChest = false
        return
    end

    local amountToUse = math.min(amount, #models)

    local originalCF = hrp.CFrame

    for i = 1, amountToUse do
        local model = models[i]

        local foundPrompt = nil
        local foundPart = nil

        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                local prompt = part:FindFirstChildOfClass("ProximityPrompt")
                if prompt then
                    foundPrompt = prompt
                    foundPart = part
                    break
                end
            end
        end

        if foundPrompt and foundPart then
            hrp.CFrame = foundPart.CFrame
            while foundPrompt.ActionText == "Interact" do task.wait() end

			local numbersOnly = string.gsub(foundPrompt.ActionText, "%D", "")
           	local fireRemote = remote:InvokeServer(unpack({coinArgs, tonumber(numbersOnly)}))

           	if fireRemote == nil then
            	Starlight:Notification({
                	Title = "Auto Chest",
					Icon = NebulaIcons:GetIcon('triangle-alert', 'Lucide'),
                	Content = "Please free up space in inventory to use this module.",
            	}, "CHEST_NO_SPACE")

               	hrp.CFrame = originalCF
               	Global.Running.AutoChest = false
               	return
           	end

           	task.wait(0.15)

           	fireproximityprompt(foundPrompt)

           	task.wait(0.25)
       	end
    end

    hrp.CFrame = originalCF

    Starlight:Notification({
        Title = "Auto Chest",
		Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
        Content = "Finished looting chests.",
    }, "CHESTS_DONE")

    Global.Running.AutoChest = false
end

--/// MISC FUNCTIONS
functions.spawnItemFunction = function()
	if Global.Running.SpawnItem then return end

    local function getSelected()
        local sel = Global.Dropdowns.SpawnItem
        if typeof(sel) == "table" then
            return sel[1]
        end
        return sel
    end

    if not getSelected() or not tonumber(Global.Values and Global.Values.SpawnItemAmount) then
        return
    end

    Global.Running.SpawnItem = true


	local v1 = game:GetService("ReplicatedStorage").Items
	local itemData = {
		["53"] = { ID = "53", Model = v1.CactusHat2, Name = "Strong Sombrero", Stack = 1 },
		["43"] = { ID = "43", Model = v1.PickBlue, Name = "Rizzium Pick", Stack = 1 },
		["73"] = { ID = "73", Model = v1.CookingPot, Name = "Cooking Pot" },
		["63"] = { ID = "63", Model = v1.StoneRoof, Name = "Roof (Stone)" },
		["93"] = { ID = "93", Model = v1.Birch_Cabbinet, Name = "Cabinet (Birch)" },
		["83"] = { ID = "83", Model = v1.Apple, Name = "Apple", Stack = 67 },
		["13"] = { ID = "13", Model = v1.HelmetPurple, Name = "Goofyum Helmet", Stack = 1 },
		["33"] = { ID = "33", Model = v1.SwordBlue, Name = "Rizzium Sword", Stack = 1 },
		["23"] = { ID = "23", Model = v1.LeggingsGold, Name = "Gold Leggings", Stack = 1 },
		["42"] = { ID = "42", Model = v1.PickOrange, Name = "Basedium Pick", Stack = 1 },
		["52"] = { ID = "52", Model = v1.CactusHat, Name = "Sombrero", Stack = 1 },
		["62"] = { ID = "62", Model = v1.CactusSpike, Name = "Cactus Nail", Stack = 67 },
		["72"] = { ID = "72", Model = v1.CampFire, Name = "Campfire" },
		["82"] = { ID = "82", Model = v1.RawPork, Name = "Raw Pork", Stack = 67 },
		["BasediumOre"] = { ID = "BasediumOre", Model = v1.OrangeOre, Name = "Basedium Ore" },
		["CherryWood"] = { ID = "CherryWood", Model = v1.CherryLog, Name = "Cherry Wood" },
		["GoldIngot"] = { ID = "GoldIngot", Model = v1.GoldIngot, Name = "Gold Ingot" },
		["Furnace"] = { ID = "Furnace", Model = v1.Furnace, Name = "Furnace" },
		["Floor"] = { ID = "Floor", Model = v1.Floor, Name = "Floor" },
		["12"] = { ID = "12", Model = v1.BootOrange, Name = "Basedium Boots", Stack = 1 },
		["22"] = { ID = "22", Model = v1.LeggingsOrange, Name = "Basedium Leggings", Stack = 1 },
		["32"] = { ID = "32", Model = v1.AxeGold, Name = "Gold Axe", Stack = 1 },
		["95"] = { ID = "95", Model = v1.Cherry_Cabbinet, Name = "Cherry Cabinet" },
		["85"] = { ID = "85", Model = v1.BerryStew, Name = "Berry Stew", Stack = 67 },
		["117"] = { ID = "117", Model = v1.RepairTool, Name = "Repair Tool", Stack = 1 },
		["65"] = { ID = "65", Model = v1.StoneWall, Name = "Wall (Stone)" },
		["55"] = { ID = "55", Model = v1.Bomerang2, Name = "Bomerang (Upgraded)", Stack = 1 },
		["45"] = { ID = "45", Model = v1.AxeOrange, Name = "Basedium Axe", Stack = 1 },
		["35"] = { ID = "35", Model = v1.SwordOrange, Name = "Basedium Sword", Stack = 1 },
		["Foundation"] = { ID = "Foundation", Model = v1.Foundation, Name = "Foundation" },
		["WorkBench"] = { ID = "WorkBench", Model = v1.WorkBench, Name = "Work Bench" },
		["1"] = { ID = "1", Model = v1.ChestIron, Name = "Iron Chestplate", Stack = 1 },
		["3"] = { ID = "3", Model = v1.ChestGold, Name = "Gold Chestplate", Stack = 1 },
		["2"] = { ID = "2", Model = v1.ChestGreen, Name = "Yeatite Chestplate", Stack = 1 },
		["5"] = { ID = "5", Model = v1.ChestPurple, Name = "Goofyum Chestplate", Stack = 1 },
		["4"] = { ID = "4", Model = v1.ChestBlue, Name = "Rizzium Chestplate", Stack = 1 },
		["7"] = { ID = "7", Model = v1.BootsGold, Name = "Gold Boots", Stack = 1 },
		["6"] = { ID = "6", Model = v1.BootsGreen, Name = "Yeatite Boots", Stack = 1 },
		["25"] = { ID = "25", Model = v1.GlovesGreen, Name = "Yeatite Gloves", Stack = 1 },
		["8"] = { ID = "8", Model = v1.BootsIron, Name = "Iron Boots", Stack = 1 },
		["OakWood"] = { ID = "OakWood", Model = v1.OakLog, Name = "Oak Wood" },
		["94"] = { ID = "94", Model = v1.Sprucce_Cabbinet, Name = "Cabinet (Sprucce)" },
		["74"] = { ID = "74", Model = v1.wheat, Name = "Wheat", Stack = 67 },
		["84"] = { ID = "84", Model = v1.Applepie, Name = "Apple Pie", Stack = 67 },
		["54"] = { ID = "54", Model = v1.Bomerang1, Name = "Bomerang", Stack = 1 },
		["64"] = { ID = "64", Model = v1.SharkTeeth, Name = "Shark Tooth", Stack = 67 },
		["34"] = { ID = "34", Model = v1.SwordStone, Name = "Stone Sword", Stack = 1 },
		["44"] = { ID = "44", Model = v1.AxeGreen, Name = "Yeatite Axe", Stack = 1 },
		["Pillar"] = { ID = "Pillar", Model = v1.Pillar, Name = "Pillar" },
		["102"] = { ID = "102", Model = v1.Ash_bench, Name = "Bench (Ash)" },
		["YeatiteOre"] = { ID = "YeatiteOre", Model = v1.GreenOre, Name = "Yeatite Ore" },
		["14"] = { ID = "14", Model = v1.HelmetGreen, Name = "Yeatite Helmet", Stack = 1 },
		["24"] = { ID = "24", Model = v1.LeggingsIron, Name = "Iron Leggings", Stack = 1 },
		["Wall"] = { ID = "Wall", Model = v1.Wall, Name = "Wall" },
		["87"] = { ID = "87", Model = v1.Ash_pall, Name = "Stool (Ash)" },
		["77"] = { ID = "77", Model = v1.Bread, Name = "Bread", Stack = 67 },
		["97"] = { ID = "97", Model = v1.Oak_pall, Name = "Stool (oak)" },
		["47"] = { ID = "47", Model = v1.AxeBlue, Name = "Rizzium Axe", Stack = 1 },
		["37"] = { ID = "37", Model = v1.SwordPurple, Name = "Goofyum Sword", Stack = 1 },
		["67"] = { ID = "67", Model = v1.PirateKey, Name = "Pirate Hook", Stack = 67 },
		["57"] = { ID = "57", Model = v1.FloorStone, Name = "Floor (Stone)" },
		["AshWood"] = { ID = "AshWood", Model = v1.AshLog, Name = "Ash Wood" },
		["SpruceWood"] = { ID = "SpruceWood", Model = v1.SpruceLog, Name = "Spruce Wood" },
		["112"] = { ID = "112", Model = v1.Ash_Table, Name = "Table (Ash)" },
		["115"] = { ID = "115", Model = v1.Sprucce_Table, Name = "Table (Sprucce)" },
		["Coin"] = { ID = "Coin", Model = v1.Coin, Name = "Coin" },
		["YeatiteIngot"] = { ID = "YeatiteIngot", Model = v1.GreenIngot, Name = "Yeatite Ingot" },
		["114"] = { ID = "114", Model = v1.Palm_Table, Name = "Table (Palm)" },
		["RizziumIngot"] = { ID = "RizziumIngot", Model = v1.BlueIngot, Name = "Rizzium Ingot" },
		["17"] = { ID = "17", Model = v1.HelmetOrange, Name = "Basedium Helmet", Stack = 1 },
		["76"] = { ID = "76", Model = v1.Slime, Name = "Slime", Stack = 67 },
		["86"] = { ID = "86", Model = v1.Oak_Cabbinet, Name = "Cabinet (Oak)" },
		["96"] = { ID = "96", Model = v1.Birch_Cabbinet, Name = "Cabinet (Palm)" },
		["36"] = { ID = "36", Model = v1.SwordGold, Name = "Gold Sword", Stack = 1 },
		["46"] = { ID = "46", Model = v1.AxeIron, Name = "Iron Axe", Stack = 1 },
		["103"] = { ID = "103", Model = v1.Birch_bench, Name = "Bench (Birch)" },
		["66"] = { ID = "66", Model = v1.StoneWindow, Name = "Window (Stone)" },
		["106"] = { ID = "106", Model = v1.Sprucce_bench, Name = "Bench (Sprucce)" },
		["GoldOre"] = { ID = "GoldOre", Model = v1.GoldOre, Name = "Gold Ore" },
		["Stairs"] = { ID = "Stairs", Model = v1.Stairs, Name = "Stairs" },
		["108"] = { ID = "108", Model = v1.Birch_Sofa, Name = "Couch (Birch)" },
		["HalfWall"] = { ID = "HalfWall", Model = v1.HalfWall, Name = "Half Wall" },
		["Roof"] = { ID = "Roof", Model = v1.Roof, Name = "Roof" },
		["16"] = { ID = "16", Model = v1.LeggingesPurple, Name = "Goofyum Leggings", Stack = 1 },
		["26"] = { ID = "26", Model = v1.GlovesIron, Name = "Iron Gloves", Stack = 1 },
		["PalmWood"] = { ID = "PalmWood", Model = v1.PalmLog, Name = "Palm Wood" },
		["107"] = { ID = "107", Model = v1.Ash_Sofa, Name = "Couch (Ash)" },
		["Stone"] = { ID = "Stone", Model = v1.Stone, Name = "Stone" },
		["61"] = { ID = "61", Model = v1.PillarStone, Name = "Pillar (Stone)" },
		["51"] = { ID = "51", Model = v1.RedBerry, Name = "Red Berries", Stack = 67 },
		["41"] = { ID = "41", Model = v1.PickGold, Name = "Gold Pick", Stack = 1 },
		["9"] = { ID = "9", Model = v1.BootsPurple, Name = "Goofyum Boots", Stack = 1 },
		["113"] = { ID = "113", Model = v1.Birch_Table, Name = "Table (Birch)" },
		["91"] = { ID = "91", Model = v1.Oak_Sofa, Name = "Couch (Oak)" },
		["81"] = { ID = "81", Model = v1.Pork, Name = "Pork", Stack = 67 },
		["59"] = { ID = "59", Model = v1.HalfwayStone, Name = "Half Wall (Stone)" },
		["49"] = { ID = "49", Model = v1.Anvil, Name = "Anvil" },
		["39"] = { ID = "39", Model = v1.PickGreen, Name = "Yeatite Pick", Stack = 1 },
		["29"] = { ID = "29", Model = v1.GLovesPurple, Name = "Goofyum Gloves", Stack = 1 },
		["99"] = { ID = "99", Model = v1.Cherry_pall, Name = "Stool (Cherry)" },
		["89"] = { ID = "89", Model = v1.Oak_bench, Name = "Bench (Oak)" },
		["79"] = { ID = "79", Model = v1.RawBeef, Name = "Raw Beef", Stack = 67 },
		["69"] = { ID = "69", Model = v1.PickStone, Name = "Stone Pick", Stack = 1 },
		["BirchWood"] = { ID = "BirchWood", Model = v1.BirchLog, Name = "Birch Wood" },
		["15"] = { ID = "15", Model = v1.HelmetBlue, Name = "Rizzium Helmet", Stack = 1 },
		["101"] = { ID = "101", Model = v1.Sprucce_pall, Name = "Stool (Sprucce)" },
		["110"] = { ID = "110", Model = v1.Palm_Sofa, Name = "Couch (Palm)" },
		["19"] = { ID = "19", Model = v1.HelmetIron, Name = "Iron Helmet", Stack = 1 },
		["56"] = { ID = "56", Model = v1.StoneDoor, Name = "Door (Stone)" },
		["92"] = { ID = "92", Model = v1.Ash_Cabbinet, Name = "Cabinet (Ash)" },
		["Ramp"] = { ID = "Ramp", Model = v1.Ramp, Name = "Ramp" },
		["Chest"] = { ID = "Chest", Model = v1.Chest, Name = "Chest" },
		["71"] = { ID = "71", Model = v1.SwordStone, Name = "Iron Sword", Stack = 1 },
		["116"] = { ID = "116", Model = v1.Cherry_Table, Name = "Table (Cherry)" },
		["100"] = { ID = "100", Model = v1.Palm_pall, Name = "Stool (Palm)" },
		["31"] = { ID = "31", Model = v1.PickIron, Name = "Iron Pick", Stack = 1 },
		["21"] = { ID = "21", Model = v1.LeggingsBlue, Name = "Rizzium Leggings", Stack = 1 },
		["11"] = { ID = "11", Model = v1.BootsBlue, Name = "Rizzium Boots", Stack = 1 },
		["75"] = { ID = "75", Model = v1.Doug, Name = "Dough", Stack = 67 },
		["60"] = { ID = "60", Model = v1.AxePurple, Name = "Goofyum Axe", Stack = 1 },
		["70"] = { ID = "70", Model = v1.AxeStone, Name = "Stone Axe", Stack = 1 },
		["40"] = { ID = "40", Model = v1.PickPurple, Name = "Goofyum Pick", Stack = 1 },
		["50"] = { ID = "50", Model = v1.YellowBerry, Name = "Yellow Berries", Stack = 67 },
		["98"] = { ID = "98", Model = v1.Birch_pall, Name = "Stool (Birch)" },
		["Door"] = { ID = "Door", Model = v1.Door, Name = "Door" },
		["80"] = { ID = "80", Model = v1.Beef, Name = "Beef", Stack = 67 },
		["90"] = { ID = "90", Model = v1.Oak_Table, Name = "Table (Oak)" },
		["48"] = { ID = "48", Model = v1.PurpleBerry, Name = "Purple Berries", Stack = 67 },
		["58"] = { ID = "58", Model = v1.FoundationStone, Name = "Foundation (Stone)" },
		["28"] = { ID = "28", Model = v1.GlovesOrange, Name = "Basedium Gloves", Stack = 1 },
		["38"] = { ID = "38", Model = v1.SwordGreen, Name = "Yeatite Sword", Stack = 1 },
		["88"] = { ID = "88", Model = v1.Furnituretable, Name = "Furniture Bench" },
		["IronOre"] = { ID = "IronOre", Model = v1.IronOre, Name = "Iron Ore" },
		["68"] = { ID = "68", Model = v1.DinoEgg, Name = "Dino Egg", Stack = 67 },
		["78"] = { ID = "78", Model = v1.Torch, Name = "Torch", Stack = 67 },
		["Coal"] = { ID = "Coal", Model = v1.Coal, Name = "Coal" },
		["IronIngot"] = { ID = "IronIngot", Model = v1.IronIngot, Name = "Iron Ingot" },
		["105"] = { ID = "105", Model = v1.Palm_bench, Name = "Bench (Palm)" },
		["RizziumOre"] = { ID = "RizziumOre", Model = v1.BlueOre, Name = "Rizzium Ore" },
		["111"] = { ID = "111", Model = v1.Sprucce_Sofa, Name = "Couch (Sprucce)" },
		["18"] = { ID = "18", Model = v1.HelmetGold, Name = "Gold Helmet", Stack = 1 },
		["GoofyumOre"] = { ID = "GoofyumOre", Model = v1.PurpleOre, Name = "Goofyum Ore" },
		["27"] = { ID = "27", Model = v1.GlovesGold, Name = "Gold Gloves", Stack = 1 },
		["BasediumIngot"] = { ID = "BasediumIngot", Model = v1.OrangeIngot, Name = "Basedium Ingot" },
		["GoofyumIngot"] = { ID = "GoofyumIngot", Model = v1.PurpleIngot, Name = "Goofyum Ingot" },
		["109"] = { ID = "109", Model = v1.Cherry_Sofa, Name = "Couch (Cherry)" },
		["104"] = { ID = "104", Model = v1.Cherry_bench, Name = "Bench (Cherry)" },
		["20"] = { ID = "20", Model = v1.LeggingsGreen, Name = "Yeatite Leggings", Stack = 1 },
		["30"] = { ID = "30", Model = v1.GlovesBlue, Name = "Rizzium Gloves", Stack = 1 },
		["Window"] = { ID = "Window", Model = v1.Window, Name = "Window" },
		["10"] = { ID = "10", Model = v1.ChestOrange, Name = "Basedium Chestplate", Stack = 1 }
	}

	local selected = getSelected()
    local amount = tonumber(Global.Values.SpawnItemAmount)

	local function getItemByName(tbl, name)
    	for _, item in pairs(tbl) do
        	if item.Name == name then
            	return {item.ID, item.Stack or (1/0)}
        	end
    	end
    	return nil
	end

	local item = getItemByName(itemData, tostring(selected))

	if item == nil then
		Starlight:Notification({
        	Title = "Spawn Item",
			Icon = NebulaIcons:GetIcon('octagon-alert', 'Lucide'),
        	Content = "Error trying to find the item in database. Report this issue.",
    	}, "NO_ITEM")
		Global.Running.SpawnItem = false
		return
	end

	local itemID = item[1]
	local itemStack = item[2]

	local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
	local inv = remotes:WaitForChild("Inv")
	local remote = inv:WaitForChild("CraftItem")

	local args = {{ Recipe = {}, ID = itemID, Stack = itemStack }, tonumber(amount)}
	remote:InvokeServer(unpack(args))

	Starlight:Notification({
        Title = "Spawn Item",
		Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
        Content = "Successfully spawned an item. If it is not in your inventory, check the ground.",
    }, "SPAWN_ITEM_DONE")
	Global.Running.SpawnItem = false
end
functions.antiAFKFunction = function()
    if Global.Running.AntiAFK then return end
    Global.Running.AntiAFK = true

    Starlight:Notification({
        Title = "Anti AFK",
        Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
        Content = "Anti-AFK enabled.",
    }, "ANTIAFK_ON")

    local player = game:GetService("Players").LocalPlayer

    if getconnections then
        for _, connection in pairs(getconnections(player.Idled)) do
            if connection.Disable then
                connection:Disable()
            elseif connection.Disconnect then
                connection:Disconnect()
            end
        end
    else
        Starlight:Notification({
            Title = "Anti AFK",
            Icon = NebulaIcons:GetIcon('triangle-alert', 'Lucide'),
            Content = "Using fallback method due to missing executor functionalities. This is unreliable.",
        }, "ANTIAFK_FALLBACK")

        local vu = game:GetService("VirtualUser")

        Global.Connections.AntiAFK = player.Idled:Connect(function()
            if not Global.Toggles.AntiAFK then return end
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end

    task.spawn(function()
        while Global.Toggles.AntiAFK do
            task.wait(0.5)
        end

        if Global.Connections.AntiAFK then
            Global.Connections.AntiAFK:Disconnect()
            Global.Connections.AntiAFK = nil
        end

        Starlight:Notification({
            Title = "Anti AFK",
            Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
            Content = "Anti-AFK disabled.",
        }, "ANTIAFK_OFF")

        Global.Running.AntiAFK = false
    end)
end



--// CLEANUP
local function cleanup()
    for k in pairs(Global.Toggles) do
        Global.Toggles[k] = false
    end

    Global.Running = {}
    Global.Connections = {}
end



Starlight:SetTheme("Orca")

--/ MAIN WINDOW
local window = Starlight:CreateWindow({
    Name = "Volaris Hub",
    Subtitle = "Survive The Island",
    Icon = 123456789,

    FileSettings = {
        RootFolder = "VolarisHub",
        ConfigFolder = "Survive The Island",
        ThemesInRoot = true
    },
})

Starlight:LoadAutoloadTheme()
Starlight:LoadAutoloadConfig()
Starlight:OnDestroy(cleanup)


--// DASHBOARD
window:CreateHomeTab({
    SupportedExecutors = {"Madium", "Potassium", "Opiumware"}, 
    UnsupportedExecutors = {"Solara", "Velocity"},
    DiscordInvite = "1234",
    Changelog = {       
        {
            Title = "Volaris Hub LAUNCH!",
            Date = "2nd April 2026",
            Description = "Official launch of Volaris Hub, with the release of a Survive The Island script!",
        }
    },
    Backdrop = nil,
    IconStyle = 1,
})


--// MAIN SECTION
local mainSection = window:CreateTabSection("Main")


--/// AUTO FARM TAB
local autoFarm = mainSection:CreateTab({
    Name = "Auto Farm",
    Icon = NebulaIcons:GetIcon('house', 'Lucide'),
    Columns = 1,
}, "STI_AF")


--//// AUTO KILL
local akGroupbox = autoFarm:CreateGroupbox({
    Name = "Auto Kill",
	Icon = NebulaIcons:GetIcon('sword', 'Lucide'),
    Column = 1,
}, "STI_AF_AKGB")
local autoKillToggle = akGroupbox:CreateToggle({
    Name = "Auto Kill",
    Tooltip = "Automatically kill selected entities.",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        Global.Toggles.AutoKill = Value

        if Value then
            functions.autoKillFunction()
        end
    end,
}, "STI_AF_AK")
autoKillToggle:AddDropdown({
    Options = {"Monsters", "Animals"},
    CurrentOptions = {"Monsters"},
    MultipleOptions = true,
    Placeholder = "None Selected",
    Callback = function(Options)
        Global.Dropdowns.AutoKill = Options
    end,
}, "AK_DROPDOWN")


--//// AUTO COLLECT
local acGroupbox = autoFarm:CreateGroupbox({
    Name = "Auto Collect",
	Icon = NebulaIcons:GetIcon('hand-grab', 'Lucide'),
    Column = 1,
}, "STI_AF_ACGB")
acGroupbox:CreateToggle({
    Name = "Auto Collect",
    Tooltip = "Automatically collect all dropped items.",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        Global.Toggles.AutoCollect = Value

        if Value then
            functions.autoCollectFunction()
        end
    end,
}, "STI_AF_AC")


--//// AUTO HARVEST
local ahGroupbox = autoFarm:CreateGroupbox({
    Name = "Auto harvest",
	Icon = NebulaIcons:GetIcon('Agriculture', 'Material'),
    Column = 1,
}, "STI_AF_AHGB")
local autoHarvestToggle = ahGroupbox:CreateToggle({
    Name = "Auto Harvest",
    Tooltip = "Automatically harvest resources based on your choosing.",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        Global.Toggles.AutoHarvest = Value

        if Value then
            functions.autoHarvestFunction()
        end
    end,
}, "STI_AF_AP")
autoHarvestToggle:AddDropdown({
    Options = {"Oak", "Birch", "Stone", "Iron", "Coal", "Spruce", "Rizzium", "Cherry", "Basedium", "Palm", "Yeatite", "Ash", "Gold", "Goofyum"},
    CurrentOptions = {"Monsters"},
    MultipleOptions = false,
    Placeholder = "None Selected",
    Callback = function(Options)
        Global.Dropdowns.AutoHarvest = Options

        if Global.Toggles.AutoHarvest then
            functions.autoHarvestFunction()
        end
    end,
}, "AH_DROPDOWN")
ahGroupbox:CreateInput({
    Name = "Quantity",
    CurrentValue = "",
    PlaceholderText = "Number",
    RemoveTextOnFocus = true,
    Numeric = true,
    Enter = true,
    Callback = function(Text)
        Global.Values = Global.Values or {}
        Global.Values.AutoHarvestQuantity = Text

        if Global.Toggles.AutoHarvest then
            functions.autoHarvestFunction()
        end
    end,
}, "INDEX")


--//// AUTO TOTEM
local atGroupbox = autoFarm:CreateGroupbox({
    Name = "Auto Totem",
	Icon = NebulaIcons:GetIcon('tower-control', 'Lucide'),
    Column = 1,
}, "STI_AF_ATGB")
local autoTotemToggle = atGroupbox:CreateToggle({
    Name = "Auto Totem",
    Tooltip = "Automatically activates selected totems.",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        Global.Toggles.AutoTotem = Value

        if Value then
            functions.autoTotemFunction()
        end
    end,
}, "STI_AF_AT")
autoTotemToggle:AddDropdown({
    Options = {
        "Totem of Conflict (Towers)",
        "Totem of Cactus (Boss)",
        "Totem of Dino (Boss)",
        "Totem of Pirate (Boss)",
        "Totem of Shark (Boss)"
    },
    CurrentOptions = {"Totem of Conflict (Towers)"},
    MultipleOptions = false,
    Placeholder = "Select Totem",
    Callback = function(Option)
        Global.Dropdowns.AutoTotem = Option

        if Global.Toggles.AutoTotem then
            functions.autoTotemFunction()
        end
    end,
}, "AT_DROPDOWN")
atGroupbox:CreateInput({
    Name = "Amount",
    PlaceholderText = "Number",
    Numeric = true,
    Enter = true,
    Callback = function(Text)
        Global.Values = Global.Values or {}
        Global.Values.AutoTotemAmount = Text

        if Global.Toggles.AutoTotem then
            functions.autoTotemFunction()
        end
    end,
}, "AT_INPUT")


--//// AUTO CHEST
local achGroupbox = autoFarm:CreateGroupbox({
    Name = "Auto Chest",
	Icon = NebulaIcons:GetIcon('treasure-chest', 'Phosphor'),
    Column = 1,
}, "STI_AF_ACHGB")
local autoChestToggle = achGroupbox:CreateToggle({
    Name = "Auto Chest",
    Tooltip = "Automatically loots selected chests.",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        Global.Toggles.AutoChest = Value

        if Value then
            functions.autoChestFunction()
        end
    end,
}, "STI_AF_ACH")
autoChestToggle:AddDropdown({
    Options = {
        "Common",
        "Rare",
        "Legendary"
    },
    CurrentOptions = {"Common"},
    MultipleOptions = false,
    Placeholder = "Select Chest Rarity",
    Callback = function(Option)
        Global.Dropdowns.AutoChest = Option

        if Global.Toggles.AutoChest then
            functions.autoChestFunction()
        end
    end,
}, "ACH_DROPDOWN")
achGroupbox:CreateInput({
    Name = "Amount",
    PlaceholderText = "Number",
    Numeric = true,
    Enter = true,
    Callback = function(Text)
        Global.Values = Global.Values or {}
        Global.Values.AutoChestAmount = Text

        if Global.Toggles.AutoChest then
            functions.autoChestFunction()
        end
    end,
}, "ACH_INPUT")



--/// MISC TAB
local misc = mainSection:CreateTab({
    Name = "Miscellaneous",
    Icon = NebulaIcons:GetIcon('bubbles', 'Lucide'),
    Columns = 1,
}, "STI_MSC")


--//// SPAWN ITEM
local siGroupbox = misc:CreateGroupbox({
    Name = "Spawn Items",
	Icon = NebulaIcons:GetIcon('package', 'Lucide'),
    Column = 1,
}, "STI_MSC_SIGB")
local spawnItemButton = siGroupbox:CreateButton({
    Name = "Spawn",
	Tooltip = "Click once options are selected. Will spawn item inside inventory if there is space or drop it outside if there isn't.",
	IndicatorStyle = 2,
	Style = 2,
    Icon = NebulaIcons:GetIcon('check', 'Material'),
    Callback = function()
        functions.spawnItemFunction()
    end,
}, "SI_BUTTON")
local spawnItemLabel = siGroupbox:CreateLabel({
    Name = "Select Item"
}, "SI_LABEL")
spawnItemLabel:AddDropdown({
    Options = {
		"Anvil",
		"Apple",
		"Apple Pie",
		"Ash Wood",
		"Basedium Axe",
		"Basedium Boots",
		"Basedium Chestplate",
		"Basedium Gloves",
		"Basedium Helmet",
		"Basedium Ingot",
		"Basedium Leggings",
		"Basedium Ore",
		"Basedium Pick",
		"Basedium Sword",
		"Beef",
		"Bench (Ash)",
		"Bench (Birch)",
		"Bench (Cherry)",
		"Bench (Oak)",
		"Bench (Palm)",
		"Bench (Sprucce)",
		"Berry Stew",
		"Birch Wood",
		"Bomerang",
		"Bomerang (Upgraded)",
		"Bread",
		"Cabinet (Ash)",
		"Cabinet (Birch)",
		"Cabinet (Cherry)",
		"Cabinet (Oak)",
		"Cabinet (Palm)",
		"Cabinet (Sprucce)",
		"Cactus Nail",
		"Campfire",
		"Cherry Wood",
		"Chest",
		"Coal",
		"Coin",
		"Cooking Pot",
		"Couch (Ash)",
		"Couch (Birch)",
		"Couch (Cherry)",
		"Couch (Oak)",
		"Couch (Palm)",
		"Couch (Sprucce)",
		"Dino Egg",
		"Door",
		"Door (Stone)",
		"Dough",
		"Floor",
		"Floor (Stone)",
		"Foundation",
		"Foundation (Stone)",
		"Furnace",
		"Furniture Bench",
		"Gold Axe",
		"Gold Boots",
		"Gold Chestplate",
		"Gold Gloves",
		"Gold Helmet",
		"Gold Ingot",
		"Gold Leggings",
		"Gold Ore",
		"Gold Pick",
		"Gold Sword",
		"Goofyum Axe",
		"Goofyum Boots",
		"Goofyum Chestplate",
		"Goofyum Gloves",
		"Goofyum Helmet",
		"Goofyum Ingot",
		"Goofyum Leggings",
		"Goofyum Ore",
		"Goofyum Pick",
		"Goofyum Sword",
		"Half Wall",
		"Half Wall (Stone)",
		"Iron Axe",
		"Iron Boots",
		"Iron Chestplate",
		"Iron Gloves",
		"Iron Helmet",
		"Iron Ingot",
		"Iron Leggings",
		"Iron Ore",
		"Iron Pick",
		"Iron Sword",
		"Oak Wood",
		"Palm Wood",
		"Pillar",
		"Pillar (Stone)",
		"Pirate Hook",
		"Pork",
		"Purple Berries",
		"Ramp",
		"Raw Beef",
		"Raw Pork",
		"Red Berries",
		"Repair Tool",
		"Rizzium Axe",
		"Rizzium Boots",
		"Rizzium Chestplate",
		"Rizzium Gloves",
		"Rizzium Helmet",
		"Rizzium Ingot",
		"Rizzium Leggings",
		"Rizzium Ore",
		"Rizzium Pick",
		"Rizzium Sword",
		"Roof",
		"Roof (Stone)",
		"Shark Tooth",
		"Slime",
		"Sombrero",
		"Spruce Wood",
		"Stairs",
		"Stone",
		"Stone Axe",
		"Stone Pick",
		"Stone Sword",
		"Stool (Ash)",
		"Stool (Birch)",
		"Stool (Cherry)",
		"Stool (Oak)",
		"Stool (Palm)",
		"Stool (Sprucce)",
		"Strong Sombrero",
		"Table (Ash)",
		"Table (Birch)",
		"Table (Cherry)",
		"Table (Oak)",
		"Table (Palm)",
		"Table (Sprucce)",
		"Torch",
		"Wall",
		"Wall (Stone)",
		"Wheat",
		"Window",
		"Window (Stone)",
		"Work Bench",
		"Yeatite Axe",
		"Yeatite Boots",
		"Yeatite Chestplate",
		"Yeatite Gloves",
		"Yeatite Helmet",
		"Yeatite Ingot",
		"Yeatite Leggings",
		"Yeatite Ore",
		"Yeatite Pick",
		"Yeatite Sword",
		"Yellow Berries"
	},
    CurrentOptions = {"Anvil"},
    MultipleOptions = false,
    Placeholder = "Select Item",
    Callback = function(Option)
		Global.Dropdowns.SpawnItem = Option
    end,
}, "SI_DROPDOWN")
siGroupbox:CreateInput({
    Name = "Amount",
    PlaceholderText = "Number",
    Numeric = true,
    Enter = true,
    Callback = function(Text)
		Global.Values = Global.Values or {}
        Global.Values.SpawnItemAmount = Text
    end,
}, "SI_INPUT")


--//// ANTI-AFK TAB
local aaGroupbox = misc:CreateGroupbox({
    Name = "Anti-Afk",
	Icon = NebulaIcons:GetIcon('package', 'Lucide'),
    Column = 1,
}, "STI_MSC_AAGB")
local antiAfkToggle = aaGroupbox:CreateToggle({
    Name = "Anti-Afk",
    Tooltip = "Will prevent the game from disconnecting you for inactivity.",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        Global.Toggles.AntiAFK = Value

        if Value then
            functions.antiAFKFunction()
        end
    end,
}, "STI_MSC_AA")



--/// OPTIONS TAB
local options = mainSection:CreateTab({
    Name = "Options",
    Icon = NebulaIcons:GetIcon('ellipsis', 'Lucide'),
    Columns = 2,
}, "STI_OPTN")


--//// THEMES
options:BuildThemeGroupbox(1)

--//// CONFIG
options:BuildConfigGroupbox(2)



--/ FINISHED LOADING NOTIFICATION
local Loaded = Starlight:Notification({
    Title = "Finished Loading!",
    Icon = NebulaIcons:GetIcon('circle-check', 'Lucide'),
    Content = "All components have finished loading.",
}, "LOAD_COMPLETE")
