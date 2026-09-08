if game.PlaceId ~= 136599248168660 then
	for i=1, 100 do
		warn("This script is only for Solo Hunters.")
		task.wait()
	end
	return 
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

repeat
	task.wait()
until game:IsLoaded()

print("[+] BigCraniusHub - Solo Hunters")
print("[+] Game loaded.")

local PortalCache = {}
pcall(function()
	PortalCache = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenixRoblox/ScriptingUtilities/refs/heads/main/SoloHunters/portal_cache.lua"))() or {}
end)

if type(PortalCache) ~= "table" then
	PortalCache = {}
end

print("[+] Portal cache loaded:", (function()
	local c = 0
	for _ in PortalCache do c += 1 end
	return c
end)())

-- Variables
local LocalPlayer = Players.LocalPlayer
local PlayerUi = LocalPlayer:WaitForChild("PlayerGui")
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Human = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")

PlayerUi.TriangleTilingGui.Enabled = false
PlayerUi.Transitions.Enabled = false
PlayerUi.DungeonCleared.Enabled = false

PlayerUi.ChildAdded:Connect(function(c) --the big main loading screen
	if c.Name == "ActualLoadingScreen" then
		c.Enabled = false
	end
end)

getgenv().BigCraniusHub = getgenv().BigCraniusHub or {}
local BigCraniusHub = getgenv().BigCraniusHub

if BigCraniusHub.Library then
	pcall(function()
		BigCraniusHub.Library:Unload()
	end)
end

if BigCraniusHub.Connections then
	for _, connection in BigCraniusHub.Connections do
		if typeof(connection) == "RBXScriptConnection" then
			connection:Disconnect()
		elseif typeof(connection) == "thread" then
			task.cancel(connection)
		end
	end
end

BigCraniusHub.Connections = {}

getgenv().protectgui = getgenv().protectgui or function() end
getgenv().gethui = function() return PlayerUi end

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(([[
gethui = function()
	return game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end
]] .. game:HttpGet(repo .. "Library.lua")))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles
local Labels = Library.Labels

do
	local setside = Library.SetNotifySide
	Library.SetNotifySide = function(self, side)
		pcall(setside, self, side)
	end
end

BigCraniusHub.Connections.CharacterAdded = LocalPlayer.CharacterAdded:Connect(function(char)
	Char = char
	Human = char:WaitForChild("Humanoid")
	Root = char:WaitForChild("HumanoidRootPart")
	BigCraniusHub.NeedWeaponEquip = LocalPlayer:GetAttribute("DungeonId") ~= nil
end)

-- Funciton Holders
local FetchFuncs: {[string]: any} = {}
local ProcessFuncs: {[string]: any} = {}
local ActionFuncs: {[string]: any} = {}
local SelectedWeapon = nil

-- Remotes
local RemoteService = ReplicatedStorage:WaitForChild("RemoteServices")
local Portals = RemoteService:WaitForChild("PortalService"):WaitForChild("RF")
local Dungeons = RemoteService:WaitForChild("DungeonService"):WaitForChild("RF")
local BossDrops = RemoteService:WaitForChild("BossDropsService"):WaitForChild("RF")
local _Combat = RemoteService:WaitForChild("CombatService"):WaitForChild("RF")
local Inventory = RemoteService:WaitForChild("InventoryService"):WaitForChild("RF")
local Healing = RemoteService:WaitForChild("HealingService"):WaitForChild("RF")
local Merchant = RemoteService:WaitForChild("MerchantService"):WaitForChild("RF")

local OpenChest = BossDrops:WaitForChild("OpenChest")
local _EnterPortal = Portals:WaitForChild("EnterPortal")
local _StartFromGate = Portals:WaitForChild("StartDungeonFromGate")
local RetryDungeon = Dungeons:WaitForChild("SpawnQuickPortal")
local StartDungeon = Dungeons:WaitForChild("StartDungeon")
local LeaveDungeon = Dungeons:WaitForChild("TeleportToLobby")
local UseAbility = ReplicatedStorage:WaitForChild("Abilities"):WaitForChild("Templates"):WaitForChild("ToolTemplate"):WaitForChild("RemoteEvent")
local QueuePortal = Portals:WaitForChild("QueuePortal")
local BypassCleared = BossDrops:WaitForChild("ClaimAvailableChests")
local Equip = Inventory:WaitForChild("Equip")
local ApplySP = Inventory:WaitForChild("UseSkillPoints")
local UseMana = Healing.UseMana
local UseHeal = Healing.UseHeal
local Sell = Inventory.Sell
local Buy = Merchant.Buy
local GetItems = Merchant.GetItems
local FullDungeonRemote = ReplicatedStorage.Remotes.FullDungeonRemote

local DungeonData = {
	room = 0,
	mobskilled = 0,
	totalmobs = 0,
	started = false,
	cleared = false,
	claimpending = false,
	claimat = 0,
	joinedat = 0,
	bossattempted = false,
	bossreachable = false,
	gateopened = false,
	bossat = 0,
	bosshp = nil,
	bossmaxhp = nil,
	bosshurt = false,
	gatewatchat = 0,
	gateretries = 0,
}

local DungeonState = {
	state = "Idle",
}


local Rarites = {
	[2] = "Common",
	[4] = "Rare",
	[5] = "Epic",
	[6] = "Legendary",
	[7] = "Mythic"
}

function DungeonState:SetState(state)
	if self.state == state then return end

	local wasgate = self.state == "Boss Battle" or self.state == "Awaiting Boss"
	local isgate = state == "Boss Battle" or state == "Awaiting Boss"

	if isgate then
		if DungeonData.bossat == 0 then
			DungeonData.bossat = tick()
		end
	elseif wasgate then
		DungeonData.bossat = 0
	end

	self.state = state
end

function DungeonState:GetState()
	return self.state
end

BigCraniusHub.Connections.DungeonEvent = FullDungeonRemote.OnClientEvent:Connect(function(name, id, ...)
	if id ~= ProcessFuncs.GetCurrentDungeonId() then return end

    if name == "MobKilled" then
		local killed, total = ...
		DungeonData.mobskilled = tonumber(killed) or DungeonData.mobskilled
		DungeonData.totalmobs = tonumber(total) or DungeonData.totalmobs
		DungeonData.started = true
		DungeonState:SetState("Clearing")
    end

	if name == "ClearedDungeon" then
		DungeonData.cleared = true
		DungeonData.claimpending = true
		DungeonData.claimat = tick() + 0.5
		DungeonState:SetState("Boss Died")
	end

	if name == "NewRoomReminder" or name == "NewRoomRemote" then
		local room = ...
		DungeonData.room = tonumber(room) or DungeonData.room
		DungeonData.started = DungeonData.room > 0
	end
end)

BigCraniusHub.Connections.DungeonChanged = LocalPlayer:GetAttributeChangedSignal("DungeonId"):Connect(function()
	DungeonData.room = 0
	DungeonData.mobskilled = 0
	DungeonData.totalmobs = 0
	DungeonData.started = false
	DungeonData.cleared = false
	DungeonData.claimpending = false
	DungeonData.claimat = 0
	DungeonData.joinedat = ProcessFuncs.GetCurrentDungeonId() and tick() or 0
	DungeonData.bossattempted = false
	DungeonData.bossreachable = false
	DungeonData.gateopened = false
	DungeonData.bossat = 0
	DungeonData.bosshp = nil
	DungeonData.bossmaxhp = nil
	DungeonData.bosshurt = false
	DungeonData.gatewatchat = 0
	DungeonData.gateretries = 0
	BigCraniusHub.AutoEnterPortal = nil
	BigCraniusHub.OpeningBossRoom = false

	if ProcessFuncs.GetCurrentDungeonId() then
		DungeonState:SetState("Starting")
		BigCraniusHub.NeedWeaponEquip = true
		task.defer(function()
			pcall(ActionFuncs.EnsureWeaponHeld)
		end)
	else
		DungeonState:SetState("Idle")
	end
end)

-- Controllers
local _CombatController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("Combat"):WaitForChild("CombatController"))
local ShiftlockController = require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("CustomShiftLock"):WaitForChild("SmoothShiftLock"))
local SkillsController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("Economy"):WaitForChild("InventoryController"):WaitForChild("Skills"))
local DataController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("Core"):WaitForChild("DataController"))
local WeaponsModule = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("WeaponsModule"))
local CooldownManager = require(ReplicatedStorage:WaitForChild("Abilities"):WaitForChild("Templates"):WaitForChild("ToolTemplate"):WaitForChild("CooldownManager"))
local Data = DataController:GetReplica()

-- Modules
local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
--Module.Prompt({ invite = "https://discord.gg/bigcranius", name = "bigcranius" })
Inviter.Join("https://discord.gg/n9KKTfusTR")

---

local ShiftLock = ShiftlockController.new()

---

FetchFuncs.EquippedWeapon = function()
    if not Char then return nil  end
    
    local tool = Char:FindFirstChildWhichIsA("Tool")
    if tool then
        if tool:GetAttribute("Type") == "Weapon" then
            return tool
        end
    end
    
    return nil
end

FetchFuncs.InventoryWeapon = function()
    if not LocalPlayer or not LocalPlayer.Backpack then return nil end
    for _, tool in LocalPlayer.Backpack:GetChildren() do
        if tool:IsA("Tool") then
            if tool:GetAttribute("Type") == "Weapon" then
                return tool
            end
        end
    end
    return nil
end

FetchFuncs.WeaponById = function(id)
	if not id then return nil end
	local want = tostring(id)

	for _, container in {Char, LocalPlayer.Backpack} do
		if not container then continue end
		for _, tool in container:GetChildren() do
			if not tool:IsA("Tool") or tool:GetAttribute("Type") ~= "Weapon" then continue end
			if tostring(tool:GetAttribute("UUID")) == want then return tool end
		end
	end

	return nil
end

FetchFuncs.BackpackWeaponById = function(id)
	if not id or not LocalPlayer.Backpack then return nil end
	local want = tostring(id)

	for _, tool in LocalPlayer.Backpack:GetChildren() do
		if not tool:IsA("Tool") or tool:GetAttribute("Type") ~= "Weapon" then continue end
		if tostring(tool:GetAttribute("UUID")) == want then return tool end
	end

	return nil
end

FetchFuncs.IsAlive = function(mob)
    local humanoid = mob:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    return humanoid.Health > 0
end

FetchFuncs.IsMyDungeon = function(dungeonid)
    return ProcessFuncs.GetCurrentDungeonId() == dungeonid
end

FetchFuncs.BossSpawned = function()
    local mobs = ProcessFuncs.GetMobs()
    for _, mob in mobs do
        if FetchFuncs.MyDungeonMob(mob) and FetchFuncs.IsBoss(mob) and FetchFuncs.IsAlive(mob) then
            return true
        end
    end
    return false
end

FetchFuncs.IsWeaponEquipped = function()
    return FetchFuncs.EquippedWeapon() ~= nil
end

FetchFuncs.IsBoss = function(mob)
    local info = ProcessFuncs.GetMobInfo(mob)
    return info.isboss
end

FetchFuncs.MyDungeonMob = function(mob)
    local info = ProcessFuncs.GetMobInfo(mob)
    if info.dungeonid == ProcessFuncs.GetCurrentDungeonId() then
        return true
    end
    return false
end

FetchFuncs.CurrentDungeon = function()
	local dungeonid = ProcessFuncs.GetCurrentDungeonId()
	if not dungeonid then return nil end
    return Workspace.Map:FindFirstChild(dungeonid)
end

FetchFuncs.GetMobCount = function()
    local c = 0
    local mobs = ProcessFuncs.GetMobs()
    for _, mob in mobs do
        if FetchFuncs.MyDungeonMob(mob) and not FetchFuncs.IsBoss(mob) and FetchFuncs.IsAlive(mob) then
            c += 1
        end
    end
    return c
end

FetchFuncs.IsAbilityOnCooldown = function(ability) -- based off slots 1-5
	if type(ability) ~= "number" or ability < 1 or ability > 5 then return false end

	local replica = DataController:GetReplica()
	if not replica then return false end
	local data = replica.Data.Main
	if not data then return false end

	local id = data.EquippedItems.Weapon
	local wdata = data.Items.Weapon[id]
	if not wdata then return false end
	local wname = WeaponsModule[wdata.Base]
	if not wname then return false end

	local ok, set = pcall(require, wname.AbilitySet)
	if not ok or not set then return false end
	local abilities = set.Moves
	local aname = abilities[ability]

	if not aname then return false end
	local cd = CooldownManager.AbilityCooldowns[aname]
	if not cd or not cd.EndTime then return false end

	local endt = cd.EndTime
	if endt > 1e9 then
		return endt > os.time()
	end
	return endt > tick()
end

FetchFuncs.CanStartDungeon = function()
    return FetchFuncs.GetMobCount() == 0 and not FetchFuncs.BossSpawned() and ProcessFuncs.GetCurrentDungeonId() ~= nil
end

FetchFuncs.IsDungeonCleared = function()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    
    local dungeonCleared = playerGui:FindFirstChild("DungeonCleared")
    if not dungeonCleared then return false end
    
    return dungeonCleared.Visible == true
end

FetchFuncs.ShouldUseMana = function(threshold)
    local mana = Human:GetAttribute("Mana")
    local max = Human:GetAttribute("MaxMana")
    if mana and max and mana / max < threshold then
        return true
    end
    return false
    
end

FetchFuncs.ShouldUseHeals = function(threshold)
    local hp = Human.Health
    local max = Human.MaxHealth
    if hp and max and hp / max < threshold then
        return true
    end
    return false
end

FetchFuncs.HasPotions = function()
    local bp = LocalPlayer.Backpack
    if not bp then return 0, 0 end

    local mp = 0
    local hp = 0

    for _, item in bp:GetChildren() do
        if item:IsA("Tool") and item:GetAttribute("Count") then
            if item.Name == "ManaPotion" then
                mp = item:GetAttribute("Count")
            end
            if item.Name == "Potion" then
                hp = item:GetAttribute("Count")
            end
        end
    end

    return mp, hp
end

FetchFuncs.GetSkillPoints = function()
    return tonumber(SkillsController.CalculateSkillPointsRemaining(LocalPlayer)) or 0
end

---

ProcessFuncs.GetDistance = function(position)
    return LocalPlayer:DistanceFromCharacter(position)
end

ProcessFuncs.ShouldUsePortalCache = function()
	if not Toggles or not Toggles.UsePortalCache then return true end
	return Toggles.UsePortalCache.Value == true
end

ProcessFuncs.GetPlayerLevel = function()
	local stats = LocalPlayer:FindFirstChild("leaderstats")
	local level = stats and stats:FindFirstChild("Level")
	return level and tonumber(level.Value) or 0
end

ProcessFuncs.GetPortalAttr = function(portal, attr)
	if typeof(portal) == "Instance" then
		return portal:GetAttribute(attr)
	end

	if type(portal) ~= "table" then return nil end
	if portal.Attributes and portal.Attributes[attr] ~= nil then
		return portal.Attributes[attr]
	end
	return portal[attr]
end

ProcessFuncs.GetPortalName = function(portal)
	if typeof(portal) == "Instance" then return portal.Name end
	return portal and portal.Name or nil
end

ProcessFuncs.IsValidPortalName = function(name)
	if not name or name:find("Part") or name:find("LocalOnly") then return false end
	return name:find("%d") ~= nil
end

ProcessFuncs.GetPortalCFrame = function(portal)
	if typeof(portal) == "Instance" then return portal.CFrame end
	return portal and portal.CFrame or nil
end

ProcessFuncs.GetPortalPosition = function(portal)
	if typeof(portal) == "Instance" then
		return portal:GetPivot().Position
	end
	if type(portal) ~= "table" then return nil end
	if portal.Position then return portal.Position end
	if portal.CFrame then return portal.CFrame.Position end
	return nil
end

ProcessFuncs.ResolvePortal = function(portal)
	if typeof(portal) == "Instance" then return portal end

	local name = ProcessFuncs.GetPortalName(portal)
	if not name then return portal end

	local folder = Workspace:FindFirstChild("PortalSpawns") and Workspace.PortalSpawns:FindFirstChild("Normal")
	if not folder then return portal end

	local pos = ProcessFuncs.GetPortalPosition(portal)
	local bestmatch = nil
	local bestdist = math.huge

	for _, child in folder:GetChildren() do
		if child.Name ~= name then continue end

		if not pos then
			return child
		end

		local d = (child:GetPivot().Position - pos).Magnitude
		if d < bestdist then
			bestdist = d
			bestmatch = child
		end
	end

	return bestmatch or portal
end

ProcessFuncs.GetLivePortalLevel = function(portal)
	local resolved = ProcessFuncs.ResolvePortal(portal)
	if typeof(resolved) == "Instance" then
		local live = tonumber(resolved:GetAttribute("Level"))
		if live then return live, resolved end
	end
	return tonumber(ProcessFuncs.GetPortalAttr(portal, "Level")), resolved
end

ProcessFuncs.CanEnterPortal = function(portal)
	if not portal then return false, nil end
	local plrlevel = ProcessFuncs.GetPlayerLevel()
	local live, resolved = ProcessFuncs.GetLivePortalLevel(portal)
	if not live then return false, nil, resolved end
	return live <= plrlevel, live, resolved
end

ProcessFuncs.GetWorldPortals = function()
	local folder = Workspace:FindFirstChild("PortalSpawns") and Workspace.PortalSpawns:FindFirstChild("Normal")
	if not folder then return {} end
	return folder:GetChildren()
end

ProcessFuncs.GetCachedPortals = function()
	local portals = {}
	for _, data in PortalCache do
		if type(data) ~= "table" then continue end
		if not ProcessFuncs.IsValidPortalName(data.Name) then continue end
		if not data.Level and not ProcessFuncs.GetPortalAttr(data, "Level") then continue end
		table.insert(portals, data)
	end
	return portals
end

ProcessFuncs.GetBestPortal = function()
	local plrlevel = ProcessFuncs.GetPlayerLevel()
	local source = ProcessFuncs.ShouldUsePortalCache() and ProcessFuncs.GetCachedPortals() or ProcessFuncs.GetWorldPortals()

	if ProcessFuncs.ShouldUsePortalCache() and #source == 0 then
		source = ProcessFuncs.GetWorldPortals()
	end

	local candidates = {}

	for _, portal in source do
		local name = ProcessFuncs.GetPortalName(portal)
		if not ProcessFuncs.IsValidPortalName(name) then continue end

		local cached = tonumber(ProcessFuncs.GetPortalAttr(portal, "Level"))
		if not cached or cached > plrlevel then continue end

		table.insert(candidates, portal)
	end

	table.sort(candidates, function(a, b)
		return tonumber(ProcessFuncs.GetPortalAttr(a, "Level") or 0) > tonumber(ProcessFuncs.GetPortalAttr(b, "Level") or 0)
	end)

	for _, portal in candidates do
		local ok, live, resolved = ProcessFuncs.CanEnterPortal(portal)
		if not ok then continue end

		local best_name = ProcessFuncs.GetPortalAttr(resolved, "PortalZone") or ProcessFuncs.GetPortalName(resolved)
		return best_name, resolved or portal, live
	end

	return nil, nil, nil
end

ProcessFuncs.GetCurrentDungeonId = function()
    return LocalPlayer:GetAttribute("DungeonId") or nil
end

ProcessFuncs.GetMobs = function()
	local mobs = Workspace:FindFirstChild("Mobs")
	if not mobs then return {} end
    return mobs:GetChildren()
end

ProcessFuncs.GetNPCS = function()
	local folder = Workspace:FindFirstChild("NPCs")
	if not folder then return {} end

	local tbl = {}
	for _, npc in folder:GetChildren() do
		if npc:IsA("Model") then
			table.insert(tbl, npc)
		end
	end

	return tbl
end

ProcessFuncs.GetMobInfo = function(mob)
    local info = {}
	local root = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")

    info.dungeonid = mob:GetAttribute("DungeonId") --string
    info.uuid = mob:GetAttribute("UUID") --string
    info.mobid = mob:GetAttribute("MobId") --number
    info.name = mob:GetAttribute("Base") or mob.Name --string
    info.ismob = mob:GetAttribute("Mob") --bool
    info.isboss = mob:GetAttribute("Boss") or false --bool
    info.isimmune = mob:GetAttribute("Immune") or false --bool
    info.cframe = root and root.CFrame or nil --CFrame
	info.instance = mob
	info.root = root
	info.hum = hum
	info.health = hum and hum.Health or 0
	info.maxhealth = hum and hum.MaxHealth or 0

    return info
end

ProcessFuncs.Tween = function(instance, properties, duration, style, direction)
    duration = duration or 1
    style = style or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    
    local info = TweenInfo.new(duration, style, direction)
    local tween = TweenService:Create(instance, info, properties)
    tween:Play()
        
    return tween
end

ProcessFuncs.Click = function(instance)
    local centerX = math.floor(instance.AbsolutePosition.X + instance.AbsoluteSize.X / 2)
    local centerY = math.floor(instance.AbsolutePosition.Y + instance.AbsoluteSize.Y / 2)
    
    local LC = instance:FindFirstAncestorOfClass("ScreenGui")
    if not LC then
        LC = LocalPlayer.PlayerGui
    end
    
    VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 1, true, LC, 0)
    task.wait()
    VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 1, false, LC, 0)
    
    return true
end

ProcessFuncs.LookAt = function(part)
    local rp = Root.Position
    local tp = part.Position
    
    tp = Vector3.new(tp.X, rp.Y, tp.Z)
    Root.CFrame = CFrame.lookAt(rp, tp)
end

ProcessFuncs.GetAttackTargets = function(pos, range)
    local targets = {}
    local mobs = ProcessFuncs.GetMobs()
    if not mobs then return targets end

    for _, mob in mobs do
        if not FetchFuncs.MyDungeonMob(mob) then continue end
        local info = ProcessFuncs.GetMobInfo(mob)
        if not info.hum or info.health <= 0 or not info.root then continue end

        if (pos - info.root.Position).Magnitude <= range then
            table.insert(targets, mob)
        end
    end
	
    return targets
end

ProcessFuncs.GetNearestMob = function()
	local nearest = nil
	local distance = math.huge
	if not Root then return nil, distance end

	for _, mob in ProcessFuncs.GetMobs() do
		if not FetchFuncs.MyDungeonMob(mob) then continue end

		local info = ProcessFuncs.GetMobInfo(mob)
		if info.health <= 0 or not info.root or info.isimmune then continue end

		local current = (Root.Position - info.root.Position).Magnitude
		if current >= distance then continue end

		nearest = mob
		distance = current
	end

	return nearest, distance
end

ProcessFuncs.GetBossMob = function()
	for _, mob in ProcessFuncs.GetMobs() do
		if not FetchFuncs.MyDungeonMob(mob) then continue end
		local info = ProcessFuncs.GetMobInfo(mob)
		if not info.isboss or info.health <= 0 or not info.root then continue end
		return mob, info
	end
	return nil, nil
end

ProcessFuncs.GetFarmTarget = function()
	if not Root then return nil, nil end

	local boss, bossinfo = ProcessFuncs.GetBossMob()
	local best_add = nil
	local best_add_dist = math.huge
	local best_any = nil
	local best_any_dist = math.huge

	for _, mob in ProcessFuncs.GetMobs() do
		if not FetchFuncs.MyDungeonMob(mob) then continue end

		local info = ProcessFuncs.GetMobInfo(mob)
		if info.health <= 0 or not info.root or info.isimmune then continue end

		local d = (Root.Position - info.root.Position).Magnitude
		if not info.isboss and d < best_add_dist then
			best_add_dist = d
			best_add = mob
		end
		if d < best_any_dist then
			best_any_dist = d
			best_any = mob
		end
	end

	if best_add then
		return best_add, ProcessFuncs.GetMobInfo(best_add)
	end

	if boss and bossinfo and not bossinfo.isimmune then
		return boss, bossinfo
	end

	if best_any then
		return best_any, ProcessFuncs.GetMobInfo(best_any)
	end

	return nil, nil
end

ProcessFuncs.HasAttackableMobs = function()
	local mob = ProcessFuncs.GetFarmTarget()
	return mob ~= nil
end

ProcessFuncs.UpdateBossDamage = function()
	local _, info = ProcessFuncs.GetBossMob()
	if not info then return end

	local hp = info.health
	if DungeonData.bosshp == nil then
		DungeonData.bosshp = hp
		DungeonData.bossmaxhp = info.maxhealth
		if DungeonData.gatewatchat == 0 then
			DungeonData.gatewatchat = tick()
		end
		return
	end

	if hp < (DungeonData.bosshp - 0.5) then
		DungeonData.bosshp = hp
		DungeonData.bosshurt = true
	elseif hp < DungeonData.bosshp then
		DungeonData.bosshp = hp
	end
end

ProcessFuncs.FormatPortalRank = function(rank)
	local clean = tostring(rank or "Unknown"):gsub("[%d%s]", "")
	return clean
end

ProcessFuncs.FormatPortalDisplay = function(portal)
	local live = ProcessFuncs.GetLivePortalLevel(portal)
	local cached = tonumber(ProcessFuncs.GetPortalAttr(portal, "Level"))
	local level = live or cached or "unknown"
	local rank = ProcessFuncs.FormatPortalRank(ProcessFuncs.GetPortalAttr(portal, "Rank") or ProcessFuncs.GetPortalName(portal))
	if live and cached and live ~= cached then
		return string.format("%s | Lvl: %s (cache %s)", rank, tostring(live), tostring(cached))
	end
	return string.format("%s | Lvl: %s", rank, tostring(level))
end

ProcessFuncs.GetPortalOptions = function()
	local options = {}
	local instances = {}
	local usecache = ProcessFuncs.ShouldUsePortalCache()
	local portals = usecache and ProcessFuncs.GetCachedPortals() or ProcessFuncs.GetWorldPortals()

	if usecache and #portals == 0 then
		portals = ProcessFuncs.GetWorldPortals()
	end

	table.sort(portals, function(a, b)
		return tonumber(ProcessFuncs.GetPortalAttr(a, "Level") or 0) < tonumber(ProcessFuncs.GetPortalAttr(b, "Level") or 0)
	end)

	local plrlevel = ProcessFuncs.GetPlayerLevel()

	for _, portal in portals do
		local name = ProcessFuncs.GetPortalName(portal)
		if not ProcessFuncs.IsValidPortalName(name) then continue end

		local cached = tonumber(ProcessFuncs.GetPortalAttr(portal, "Level"))
		if not cached or cached > plrlevel then continue end

		local resolved = ProcessFuncs.ResolvePortal(portal)
		local live = typeof(resolved) == "Instance" and tonumber(resolved:GetAttribute("Level")) or nil
		if live and live > plrlevel then continue end --if live portal is higher skip

		local display = ProcessFuncs.FormatPortalDisplay(resolved or portal)
		local dupe = instances[display]

		if dupe then
			local a = ProcessFuncs.GetPortalPosition(resolved)
			local b = ProcessFuncs.GetPortalPosition(dupe)
			if a and b and ProcessFuncs.GetDistance(a) < ProcessFuncs.GetDistance(b) then
				instances[display] = resolved
			end
			continue
		end

		table.insert(options, display)
		instances[display] = resolved
	end

	return options, instances
end

ProcessFuncs.FormatWeaponName = function(name)
	return tostring(name or "Unknown"):gsub("_", " "):gsub("(%u)(%u%l)", "%1 %2"):gsub("(%l)(%u)", "%1 %2")
end

ProcessFuncs.RankWeapons = function()
	local weapons = {}
	Data = DataController:GetReplica() or Data
	local items = Data and Data.Data and Data.Data.Main and Data.Data.Main.Items
	items = items and items.Weapon
	if not items then return weapons end

	for id, item in items do
		if item.Type ~= "Weapon" then continue end

		table.insert(weapons, {
			Id = id,
			Name = item.Base,
			Rarity = item.RarityOrder or 0,
			XP = item.Exp or 0,
			DamageRank = item.DamageRank or "?",
			Data = item,
		})
	end

	table.sort(weapons, function(a, b)
		if a.Rarity ~= b.Rarity then return a.Rarity > b.Rarity end
		if a.XP ~= b.XP then return a.XP > b.XP end
		return a.Name < b.Name
	end)

	return weapons
end

ProcessFuncs.GetWeaponOptions = function()
	local options = {}
	local weapons = {}
	local duplicates = {}

	for _, weapon in ProcessFuncs.RankWeapons() do
		local name = ProcessFuncs.FormatWeaponName(weapon.Name)
		local base = string.format("%s | Damage: %s | XP: %s", name, tostring(weapon.DamageRank), tostring(weapon.XP))
		duplicates[base] = (duplicates[base] or 0) + 1

		local display = duplicates[base] > 1 and string.format("%s (%d)", base, duplicates[base]) or base
		table.insert(options, display)
		weapons[display] = weapon
	end

	return options, weapons
end

ProcessFuncs.GetItemsByRarity = function(what, rarity)
	local data = DataController:GetReplica().Data.Main
	local items = {}
	
	for uuid, item in pairs(data.Items[what] or {}) do
		if item.Locked then continue end
		if what == "Weapon" and item.Base == "Wooden Sword" then continue end
		if tonumber(item.RarityOrder) == tonumber(rarity) then
			table.insert(items, {
				Type = what,
				UUID = uuid,
				Amount = 1
			})
		end
	end
	
	return items
end

---

ActionFuncs.UseWeapon = function()
	if BigCraniusHub.WeaponRecovery then return false end
	if tick() - (BigCraniusHub.LastAttack or 0) < 0.1 then return true end
	BigCraniusHub.LastAttack = tick()

	if not FetchFuncs.IsWeaponEquipped() then
		ActionFuncs.EquipWeapon()
	end
	if not FetchFuncs.IsWeaponEquipped() then
		BigCraniusHub.MissedAttacks = (BigCraniusHub.MissedAttacks or 0) + 1
		if BigCraniusHub.MissedAttacks >= 8 and tick() - (BigCraniusHub.LastRecovery or 0) >= 5 then
			BigCraniusHub.LastRecovery = tick()
			BigCraniusHub.MissedAttacks = 0
			task.spawn(ActionFuncs.RecoverWeapon)
		end
		return false
	end

	BigCraniusHub.MissedAttacks = 0
	local tool = FetchFuncs.EquippedWeapon()
	if not tool then return false end

	local success = pcall(function()
		tool:Activate()
	end)

	return success
end

ActionFuncs.UsePotion = function(options)
    options = options or {}
    options.mana = options.mana or 0.25
    options.heals = options.heals or 0.25
	options.usemana = options.usemana ~= false
	options.useheals = options.useheals ~= false
    local mp, hp = FetchFuncs.HasPotions()
    
    if options.usemana and FetchFuncs.ShouldUseMana(options.mana) and mp > 0 then
        repeat
            UseMana:InvokeServer()
            mp -= 1
            task.wait(0.1)
        until mp == 0 or not FetchFuncs.ShouldUseMana(options.mana)
    end

    if options.useheals and FetchFuncs.ShouldUseHeals(options.heals) and hp > 0 then
        repeat
            UseHeal:InvokeServer()
            hp -= 1
            task.wait(0.1)
        until hp == 0 or not FetchFuncs.ShouldUseHeals(options.heals)
    end
end

ActionFuncs.UseSkillPoints = function(stat, amount)
	local skills = {"Strength", "Agility", "Magic", "Energy", "Defense"}
	if not table.find(skills, stat) then return end 
	local current = FetchFuncs.GetSkillPoints()
	if amount <= 0 or current <= 0 then return end
	if current < amount then amount = current end --if current is less than amount sets to max amount I can allocate

    ApplySP:InvokeServer({[stat] = amount})
end

ActionFuncs.EquipInventoryWeapon = function(weapon)
	weapon = weapon or FetchFuncs.EquippedWeapon() or FetchFuncs.InventoryWeapon()
	if not weapon then return false end
	local uuid = typeof(weapon) == "Instance" and weapon:GetAttribute("UUID") or weapon
	if not uuid then return false end
	if FetchFuncs.WeaponById(uuid) then return false end

	Equip:InvokeServer("Weapon", uuid)
	return true
end

ActionFuncs.HoldTool = function(tool)
	if not tool or not Human or not LocalPlayer.Backpack then return false end
	if tool.Parent == Char then return true end
	if tool.Parent ~= LocalPlayer.Backpack then return false end

	pcall(function()
		Human:EquipTool(tool)
	end)
	return FetchFuncs.IsWeaponEquipped()
end

ActionFuncs.EnsureWeaponHeld = function()
	if not ProcessFuncs.GetCurrentDungeonId() then return false end
	if not LocalPlayer or not LocalPlayer.Backpack then return false end
	if not Char or not Human or not Human.Parent or Human.Health <= 0 then return false end

	local equipped = FetchFuncs.EquippedWeapon()
	if equipped then
		if not SelectedWeapon then return true end
		if tostring(equipped:GetAttribute("UUID")) == tostring(SelectedWeapon.Id) then
			return true
		end
	end

	local tool = nil
	if SelectedWeapon then
		tool = FetchFuncs.WeaponById(SelectedWeapon.Id)
		if not tool then
			ActionFuncs.EquipInventoryWeapon(SelectedWeapon.Id)
			task.wait(0.2)
			tool = FetchFuncs.BackpackWeaponById(SelectedWeapon.Id) or FetchFuncs.WeaponById(SelectedWeapon.Id)
		end
	else
		tool = equipped or FetchFuncs.InventoryWeapon()
	end

	if not tool then return false end
	if tool.Parent == Char then return true end
	return ActionFuncs.HoldTool(tool)
end

ActionFuncs.EquipWeapon = function()
	if not LocalPlayer or not LocalPlayer.Backpack or not Char or not Human then return end

	if ProcessFuncs.GetCurrentDungeonId() then
		ActionFuncs.EnsureWeaponHeld()
		return
	end

	if BigCraniusHub.WeaponRecovery then return end
	if tick() - (BigCraniusHub.LastEquipAttempt or 0) < 0.35 then return end

	local equipped = FetchFuncs.EquippedWeapon()

	if SelectedWeapon then
		local want = tostring(SelectedWeapon.Id)
		if equipped and tostring(equipped:GetAttribute("UUID")) == want then return end

		local selected = FetchFuncs.WeaponById(SelectedWeapon.Id)
		if selected then
			BigCraniusHub.LastEquipAttempt = tick()
			ActionFuncs.HoldTool(selected)
			return
		end

		BigCraniusHub.LastEquipAttempt = tick()
		ActionFuncs.EquipInventoryWeapon(SelectedWeapon.Id)
		task.wait(0.2)
		selected = FetchFuncs.BackpackWeaponById(SelectedWeapon.Id)
		if selected then
			ActionFuncs.HoldTool(selected)
		end
		return
	end

	if equipped then return end

	BigCraniusHub.LastEquipAttempt = tick()
	local weapon = FetchFuncs.InventoryWeapon()
	if weapon then ActionFuncs.HoldTool(weapon) end
end

ActionFuncs.RecoverWeapon = function()
	if BigCraniusHub.WeaponRecovery then return end
	if tick() - (BigCraniusHub.LastRecovery or 0) < 5 then return end
	BigCraniusHub.WeaponRecovery = true
	BigCraniusHub.LastRecovery = tick()

	local uuid = SelectedWeapon and SelectedWeapon.Id
	if not uuid then
		local weapon = FetchFuncs.EquippedWeapon() or FetchFuncs.InventoryWeapon()
		uuid = weapon and weapon:GetAttribute("UUID")
	end

	if uuid then
		pcall(function()
			local tool = FetchFuncs.WeaponById(uuid)
			if not tool then
				ActionFuncs.EquipInventoryWeapon(uuid)
				task.wait(0.2)
				tool = FetchFuncs.BackpackWeaponById(uuid) or FetchFuncs.WeaponById(uuid)
			end
			if tool then
				ActionFuncs.HoldTool(tool)
			end
		end)
	end

	BigCraniusHub.LastAttack = 0
	BigCraniusHub.MissedAttacks = 0
	BigCraniusHub.WeaponRecovery = false

	if ProcessFuncs.GetCurrentDungeonId() then
		ActionFuncs.EnsureWeaponHeld()
	end
end

ActionFuncs.TeleportToPortal = function(portal)
	if not portal or not Root then return false end

	local ok, live, resolved = ProcessFuncs.CanEnterPortal(portal)
	if not ok then
		print(string.format(
			"[+] Skip teleport: live portal level %s > player %s",
			tostring(live),
			tostring(ProcessFuncs.GetPlayerLevel())
		))
		return false
	end

	local cf = ProcessFuncs.GetPortalCFrame(resolved or portal)
	if not cf then return false end
	Root.CFrame = cf
	return true
end

ActionFuncs.EnterPortal = function(zone)
	if ProcessFuncs.GetCurrentDungeonId() then return false end

	local ok, live, resolved = ProcessFuncs.CanEnterPortal(zone)
	if not ok then
		print(string.format(
			"[+] Skip enter: live portal level %s > player %s",
			tostring(live),
			tostring(ProcessFuncs.GetPlayerLevel())
		))
		BigCraniusHub.AutoEnterPortal = nil
		return false
	end

	local target = resolved or zone
	local name = ProcessFuncs.GetPortalName(target) or (typeof(target) == "Instance" and target.Name) or tostring(target)
	if not name:find("^N_") then name = "N_" .. name end

	QueuePortal:InvokeServer(name)
	return true
end

ActionFuncs.StartDungeon = function()
	DungeonState:SetState("Starting")
    StartDungeon:InvokeServer()
end

ActionFuncs.UseAbility = function(slot)
	if type(slot) ~= "number" or slot < 1 or slot > 5 then return false end
	if BigCraniusHub.WeaponRecovery then return false end

	if not FetchFuncs.IsWeaponEquipped() then
		ActionFuncs.EquipWeapon()
	end
	if not FetchFuncs.IsWeaponEquipped() then return false end

	local replica = DataController:GetReplica()
	if not replica then return false end
	local data = replica.Data.Main
	local weaponId = data.EquippedItems.Weapon
	local weaponData = data.Items.Weapon[weaponId]
	if not weaponData then return false end
	local baseWeapon = WeaponsModule[weaponData.Base]
	if not baseWeapon then return false end

	local ok, abilitySet = pcall(require, baseWeapon.AbilitySet)
	if not ok or not abilitySet then return false end
	local ability = abilitySet.Moves and abilitySet.Moves[slot]
	if not ability then return false end

	local payload = {
		Direction = Root.CFrame.LookVector,
		Origin = Root.Position,
		Position = Root.Position + Root.CFrame.LookVector * 50
	}

	local success = pcall(function()
		UseAbility:FireServer(ability, payload, "Start", {"test"})
		UseAbility:FireServer(ability, payload, "End", {"test"})
	end)

	local keys = {
		[1] = Enum.KeyCode.F,
		[2] = Enum.KeyCode.R,
		[3] = Enum.KeyCode.C,
		[4] = Enum.KeyCode.G,
		[5] = Enum.KeyCode.V,
	}

	local key = keys[slot]
	if key then
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, key, false, game)
			task.wait()
			VirtualInputManager:SendKeyEvent(false, key, false, game)
		end)
	end

	return success == true
end

ActionFuncs.CollectAllDrops = function() -- range is ~120 studs
    local drops = {}
    local loc = Workspace.Camera.Drops
    if loc then 
        for _, drop in loc:GetChildren() do
            table.insert(drops, drop)
        end
    end
    
    for _, drop in drops do
        local prompt = drop:FindFirstChildWhichIsA("ProximityPrompt", true)
        if prompt then
            local p = prompt.Parent
            if p and p:IsA("BasePart") and LocalPlayer:DistanceFromCharacter(p.Position) > 120 then continue end
    
            pcall(function()
                fireproximityprompt(prompt)
            end)
        end
    end
end

ActionFuncs.CollectAllChests = function()
    while true do
        local unopened = {}

        local function scan(container)
            for _, obj in ipairs(container) do
                if (obj.Name:find("Chest") or obj:GetAttribute("ChestUUID")) and obj:GetAttribute("Owner") == LocalPlayer.Name and obj:GetAttribute("DungeonId") == ProcessFuncs.GetCurrentDungeonId() and obj:GetAttribute("Opened") ~= true then
                    table.insert(unopened, obj)
                end
            end
        end

        scan(Workspace:GetChildren())

        local dropsFolder = Workspace:FindFirstChild("Drops")
        if dropsFolder then
            scan(dropsFolder:GetDescendants())
        end

        if #unopened == 0 then break end

        for _, chest in ipairs(unopened) do
			local part = chest:IsA("BasePart") and chest or chest:FindFirstChildWhichIsA("BasePart", true)
			if part then
				Root.CFrame = part.CFrame * CFrame.new(0, 3, 0)
				task.wait(0.1)
			end

            pcall(function()
                OpenChest:InvokeServer(tostring(chest:GetAttribute("ChestUUID") or chest.Name))
            end)
        end

        task.wait(0.5)
    end
    print("All chests collected")
end

ActionFuncs.SellItems = function(what, rarity) -- SellItems("Armor", 4)
	local items = ProcessFuncs.GetItemsByRarity(what, rarity)
	if not items or #items == 0 then return end
	Sell:InvokeServer(items)
end

ActionFuncs.BuyMerchant = function()
	local items = table.pack(GetItems:InvokeServer())
	local stock = items[1]
	local now = workspace:GetServerTimeNow()
	local stamp = math.floor(now / 300)
    
	if type(stock) ~= "table" then return end
	for slot, amount in pairs(stock) do
		local c = 0
		repeat
			Buy:InvokeServer("Normal", tostring(slot), stamp)
			c += 1
			task.wait()
		until c >= amount
	end
	return
end

ActionFuncs.LeaveDungeon = function()
	DungeonState:SetState("Leaving")
    LeaveDungeon:InvokeServer()
end

ActionFuncs.RetryDungeon = function()
	DungeonState:SetState("Retrying")
    RetryDungeon:InvokeServer("retry")
end

ActionFuncs.ForceBypassDungeonCleared = function()
    BypassCleared:InvokeServer()
end

ActionFuncs.AttemptOpenBossRoom = function() --beta
	local dungeon = FetchFuncs.CurrentDungeon()
	if not dungeon then return end

	local map = dungeon:GetChildren()[1]
	if not map then return end
	local rooms = map:FindFirstChild("Map") and map.Map:FindFirstChild("Rooms")
	if not rooms then return end

	local room = rooms:FindFirstChild(tostring(#rooms:GetChildren() - 1))
	if not room then return end

	local hitbox = room:FindFirstChild("Hitbox", true)
	if not hitbox or not hitbox:IsA("BasePart") then return end
	if not Root or not Human then return end

	local hip = Human.HipHeight
	local weapon = FetchFuncs.EquippedWeapon()

	Root.CFrame = hitbox.CFrame
	Human.HipHeight = hitbox.Size.Y / 3.25
	ShiftLock:ToggleShiftLock(false)

	task.wait(0.2)
	ProcessFuncs.LookAt(hitbox)

	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
	task.wait()
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)

	if weapon then
		for _ = 1, 4 do
			pcall(function()
				weapon:Activate()
			end)
			task.wait(0.5)
		end
	end

	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
	task.wait()
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)

	task.wait(0.15)
	Human.HipHeight = hip
	DungeonData.gateopened = true
end

ActionFuncs.MobFarm = function()
	if not ProcessFuncs.GetCurrentDungeonId() or DungeonData.cleared then return end
	if BigCraniusHub.OpeningBossRoom then return end
	if not Root or not Root.Parent then return end

	local boss, bossinfo = ProcessFuncs.GetBossMob()
	if boss and bossinfo and not bossinfo.isimmune then
		DungeonData.bossreachable = true
	end

	local mob, info = ProcessFuncs.GetFarmTarget()

	if mob and info and info.root then
		local height = 10
		if Options and Options.FarmHeight then
			height = Options.FarmHeight.Value or 10
		end

		Root.CFrame = info.root.CFrame * CFrame.new(0, height, 0) * CFrame.Angles(math.rad(-90), 0, 0)
		Root.AssemblyLinearVelocity = Vector3.zero
		Root.AssemblyAngularVelocity = Vector3.zero
		ActionFuncs.UseWeapon()
		return
	end

	if boss and bossinfo and bossinfo.root and (DungeonData.bossreachable or DungeonData.gateopened) then
		local height = 10
		if Options and Options.FarmHeight then
			height = Options.FarmHeight.Value or 10
		end
		Root.CFrame = bossinfo.root.CFrame * CFrame.new(0, height, 0) * CFrame.Angles(math.rad(-90), 0, 0)
		Root.AssemblyLinearVelocity = Vector3.zero
		Root.AssemblyAngularVelocity = Vector3.zero
	end
end

---

local Window = Library:CreateWindow({
	Title = "Solo Hunter",
	Footer = "made by: bigcranius (88)",
	AutoShow = true,
	Resizable = true,
	NotifySide = "Right",
})

BigCraniusHub.Library = Library

local Tabs = {
	Main = Window:AddTab("Main", "chart-no-axes-column"),
	Economy = Window:AddTab("Economy", "coins"),
	Teleports = Window:AddTab("Teleports", "map"),
	Settings = Window:AddTab("Settings", "settings"),
}

local Statistics = Tabs.Main:AddLeftGroupbox("Dungeon Statistics", "chart-no-axes-column")
local Automations = Tabs.Main:AddRightGroupbox("Automations", "bot")
local SellingGroup = Tabs.Economy:AddLeftGroupbox("Selling", "badge-dollar-sign")
local PurchasingGroup = Tabs.Economy:AddRightGroupbox("Purchasing", "shopping-cart")
local PortalsGroup = Tabs.Teleports:AddLeftGroupbox("Portals", "door-open")
local NPCSGroup = Tabs.Teleports:AddRightGroupbox("Npcs", "users")
local ZonesGroup = Tabs.Teleports:AddRightGroupbox("Zones", "map-pinned")
local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu", "wrench")
local CreditsGroup = Tabs.Settings:AddRightGroupbox("Credits", "badge-info")

local RarityOptions = {}
local RarityValues = {}
for order, name in Rarites do
	table.insert(RarityOptions, name)
	RarityValues[name] = order
end

table.sort(RarityOptions, function(a, b)
	return RarityValues[a] < RarityValues[b]
end)

SellingGroup:AddDropdown("SellType", {
	Values = {"Armor", "Weapon"},
	Default = { Armor = true },
	Multi = true,
	Text = "Item Type",
})

SellingGroup:AddDropdown("SellRarity", {
	Values = RarityOptions,
	Default = { [RarityOptions[1]] = true },
	Multi = true,
	Text = "Rarity",
})

SellingGroup:AddToggle("AutoSell", {
	Text = "Auto Sell",
	Default = false,
})

PurchasingGroup:AddToggle("AutoBuyMerchant", {
	Text = "Auto Buy Merchant",
	Default = false,
})

MenuGroup:AddLabel("Menu Key")
	:AddKeyPicker("MenuKeybind", {
		Default = "LeftControl",
		NoUI = true,
		Text = "Menu Key",
	})

MenuGroup:AddButton({
	Text = "Unload",
	Func = function()
		Library:Unload()
	end,
})

CreditsGroup:AddLabel("Made by bigcranius (88) on Discord", true)
CreditsGroup:AddButton({
	Text = "Join Server",
	Func = function()
		Inviter.Join("https://discord.gg/n9KKTfusTR")
	end,
})

Library.ToggleKeybind = Options.MenuKeybind

Statistics:AddLabel("DungeonMessage", {
	Text = "Join a dungeon to view statistics.",
	DoesWrap = true,
})
Statistics:AddLabel("DungeonStatus", { Text = "", DoesWrap = true })
Statistics:AddLabel("DungeonMobs", { Text = "" })
Statistics:AddLabel("DungeonBoss", { Text = "" })
Statistics:AddLabel("BossHealth", { Text = "" })
Statistics:AddLabel("DungeonRoom", { Text = "" })
Statistics:AddLabel("DungeonTime", { Text = "" })
Statistics:AddLabel("PlayerStats", { Text = "" })
Statistics:AddLabel("PotionStats", { Text = "" })
Statistics:AddLabel("SkillPointStats", { Text = "" })
Statistics:AddLabel("WeaponStatus", { Text = "", DoesWrap = true })
Statistics:AddLabel("NearbyDrops", { Text = "" })

local PortalOptions, PortalInstances = ProcessFuncs.GetPortalOptions()
if #PortalOptions == 0 then PortalOptions = {"None"} end
local _, BestPortal = ProcessFuncs.GetBestPortal()
local SelectedPortal = BestPortal
local WeaponOptions, WeaponInstances = ProcessFuncs.GetWeaponOptions()
if #WeaponOptions == 0 then WeaponOptions = {"None"} end
SelectedWeapon = WeaponInstances[WeaponOptions[1]]

Automations:AddDropdown("AutomationWeapon", {
	Values = WeaponOptions,
	Default = WeaponOptions[1],
	Multi = false,
	Text = "Selected Weapon",
	Searchable = true,
})

Automations:AddButton({
	Text = "Try to fix weapon",
	Func = function()
		task.spawn(ActionFuncs.RecoverWeapon)
	end,
})

Automations:AddDivider()
Automations:AddDropdown("AutomationPortal", {
	Values = PortalOptions,
	Default = PortalOptions[1],
	Multi = false,
	Text = "Portal",
	Searchable = true,
})

Automations:AddToggle("UsePortalCache", {
	Text = "Use Cache",
	Default = true,
})

Automations:AddToggle("AutoBestPortal", {
	Text = "Auto Best Portal",
	Default = true,
})

Automations:AddLabel("SelectedPortal", {
	Text = "Selected Portal: " .. (SelectedPortal and ProcessFuncs.FormatPortalDisplay(SelectedPortal) or "None"),
	DoesWrap = true,
})

Automations:AddButton({
	Text = "Teleport to selected portal",
	Func = function()
		if not SelectedPortal then return end
		ActionFuncs.TeleportToPortal(SelectedPortal)
	end,
})

Automations:AddToggle("AutoEnter", {
	Text = "Auto Enter",
	Default = false,
})

Automations:AddToggle("AutoStart", {
	Text = "Auto Start",
	Default = false,
})

Automations:AddToggle("BossBattleTimeout", {
	Text = "Boss Battle Timeout",
	Default = true,
})

Automations:AddSlider("BossBattleTimeoutMinutes", {
	Text = "Boss Timeout",
	Default = 3,
	Min = 1,
	Max = 30,
	Rounding = 0,
	Suffix = "m",
})

Automations:AddToggle("AutoPickupDrops", {
	Text = "Auto Pickup Drops",
	Default = false,
})

Automations:AddToggle("AutoOpenChest", {
	Text = "Auto Open Chest",
	Default = false,
})

Automations:AddDivider()
Automations:AddToggle("MobFarm", {
	Text = "Mob Farm",
	Default = false,
})

Automations:AddSlider("FarmHeight", {
	Text = "Farm Height",
	Default = 5,
	Min = 0,
	Max = 15,
	Rounding = 1,
	Suffix = " studs",
})

Automations:AddToggle("AutoAbilities", {
	Text = "Auto Abilities",
	Default = false,
})

Automations:AddToggle("AutoPotions", {
	Text = "Auto Potions",
	Default = false,
})

Automations:AddToggle("HealthPotions", {
	Text = "Use Health Potions",
	Default = true,
})

Automations:AddSlider("HealthThreshold", {
	Text = "Health Threshold",
	Default = 50,
	Min = 1,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
})

Automations:AddToggle("ManaPotions", {
	Text = "Use Mana Potions",
	Default = true,
})

Automations:AddSlider("ManaThreshold", {
	Text = "Mana Threshold",
	Default = 50,
	Min = 1,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
})

Automations:AddDivider()
Automations:AddToggle("AutoSkillPoints", {
	Text = "Auto Use Skill Points",
	Default = false,
})

Automations:AddDropdown("SkillPointStat", {
	Values = {"Strength", "Agility", "Magic", "Energy", "Defense"},
	Default = "Strength",
	Multi = false,
	Text = "Stat",
})

Automations:AddSlider("SkillPointAmount", {
	Text = "Points Per Use",
	Default = 1,
	Min = 1,
	Max = 100,
	Rounding = 0,
})

PortalsGroup:AddDropdown("PortalTeleport", {
	Values = PortalOptions,
	Default = PortalOptions[1],
	Multi = false,
	Text = "Portal",
	Searchable = true,
})

PortalsGroup:AddButton({
	Text = "Teleport",
	Func = function()
		local portal = PortalInstances[Options.PortalTeleport.Value]
		if not portal then return end
		ActionFuncs.TeleportToPortal(portal)
	end,
})

local NPCOptions = {}
local NPCInstances = {}

for _, npc in ProcessFuncs.GetNPCS() do
	table.insert(NPCOptions, npc.Name)
	NPCInstances[npc.Name] = npc
end

table.sort(NPCOptions)
if #NPCOptions == 0 then NPCOptions = {"None"} end

NPCSGroup:AddDropdown("NPCTeleport", {
	Values = NPCOptions,
	Default = NPCOptions[1],
	Multi = false,
	Text = "Npc",
	Searchable = true,
})

NPCSGroup:AddButton({
	Text = "Teleport",
	Func = function()
		local npc = NPCInstances[Options.NPCTeleport.Value]
		if not npc then return end
		Root.CFrame = npc:GetPivot()
	end,
})

ZonesGroup:AddLabel("Zones are currently WIP.", true)

Options.AutomationPortal:OnChanged(function()
	if Toggles.AutoBestPortal.Value then return end
	SelectedPortal = PortalInstances[Options.AutomationPortal.Value]
	BigCraniusHub.AutoEnterPortal = nil
end)

Options.AutomationWeapon:OnChanged(function()
	SelectedWeapon = WeaponInstances[Options.AutomationWeapon.Value]
end)

Toggles.AutoBestPortal:OnChanged(function()
	if not Toggles.AutoBestPortal.Value then
		SelectedPortal = PortalInstances[Options.AutomationPortal.Value]
		return
	end

	local _, portal = ProcessFuncs.GetBestPortal()
	SelectedPortal = portal
	BigCraniusHub.AutoEnterPortal = nil
end)

Toggles.UsePortalCache:OnChanged(function()
	local options, instances = ProcessFuncs.GetPortalOptions()
	if #options == 0 then options = {"None"} end

	PortalOptions = options
	PortalInstances = instances
	Options.AutomationPortal:SetValues(PortalOptions)
	Options.PortalTeleport:SetValues(PortalOptions)

	if Toggles.AutoBestPortal.Value then
		local _, portal = ProcessFuncs.GetBestPortal()
		SelectedPortal = portal
	else
		SelectedPortal = PortalInstances[Options.AutomationPortal.Value]
	end

	BigCraniusHub.AutoEnterPortal = nil
end)

Toggles.AutoEnter:OnChanged(function()
	BigCraniusHub.AutoEnterPortal = nil
	BigCraniusHub.LastEnterAttempt = 0
end)

if ProcessFuncs.GetCurrentDungeonId() then
	DungeonData.joinedat = tick()
	DungeonState:SetState("Starting")
end

BigCraniusHub.Connections.Status = task.spawn(function()
	while task.wait(0.25) do
		local dungeonid = ProcessFuncs.GetCurrentDungeonId()

		if not dungeonid then
			Labels.DungeonMessage:SetText("Join a dungeon to view statistics.")
			Labels.DungeonStatus:SetText("")
			Labels.DungeonMobs:SetText("")
			Labels.DungeonBoss:SetText("")
			Labels.BossHealth:SetText("")
			Labels.DungeonRoom:SetText("")
			Labels.DungeonTime:SetText("")
			Labels.PlayerStats:SetText("")
			Labels.PotionStats:SetText("")
			Labels.SkillPointStats:SetText("")
			Labels.WeaponStatus:SetText("")
			Labels.NearbyDrops:SetText("")
			continue
		end

		local bossspawned = FetchFuncs.BossSpawned()
		local mobcount = FetchFuncs.GetMobCount()
		local boss = nil

		for _, mob in ProcessFuncs.GetMobs() do
			if not FetchFuncs.MyDungeonMob(mob) or not FetchFuncs.IsBoss(mob) then continue end
			boss = ProcessFuncs.GetMobInfo(mob)
			break
		end

		local drops = Workspace.Camera:FindFirstChild("Drops")
		local weapon = FetchFuncs.EquippedWeapon()
		local mp, hp = FetchFuncs.HasPotions()
		local elapsed = math.max(0, tick() - DungeonData.joinedat)
		local minutes = math.floor(elapsed / 60)
		local seconds = math.floor(elapsed % 60)

		if not DungeonData.cleared then
			if bossspawned then
				DungeonState:SetState("Boss Battle")
			elseif DungeonData.started and mobcount == 0 then
				DungeonState:SetState("Awaiting Boss")
			elseif DungeonData.started or mobcount > 0 then
				DungeonState:SetState("Clearing")
			else
				DungeonState:SetState("Starting")
			end
		end

		Labels.DungeonMessage:SetText("")
		Labels.DungeonStatus:SetText("Status: " .. DungeonState:GetState())
		Labels.DungeonMobs:SetText("Mobs Alive: " .. tostring(mobcount))
		Labels.DungeonBoss:SetText("Boss: " .. tostring(bossspawned))
		Labels.BossHealth:SetText(boss and string.format("Boss Health: %d/%d", boss.health, boss.maxhealth) or "Boss Health: N/A")
		Labels.DungeonRoom:SetText("Room: " .. tostring(DungeonData.room))
		Labels.DungeonTime:SetText(string.format("Elapsed: %02d:%02d", minutes, seconds))
		Labels.PlayerStats:SetText(string.format("Health: %d/%d | Mana: %d/%d", math.round(Human.Health), math.round(Human.MaxHealth), math.round(Human:GetAttribute("Mana") or 0), math.round(Human:GetAttribute("MaxMana") or 0)))
		Labels.PotionStats:SetText(string.format("Potions: %d Health | %d Mana", hp, mp))
		Labels.SkillPointStats:SetText("Skill Points: " .. tostring(FetchFuncs.GetSkillPoints()))
		local weaponname = weapon and weapon.Name or SelectedWeapon and SelectedWeapon.Name
		Labels.WeaponStatus:SetText("Weapon: " .. (weaponname and ProcessFuncs.FormatWeaponName(weaponname) or "Not Equipped") .. (BigCraniusHub.WeaponRecovery and " (Recovering)" or ""))
		Labels.NearbyDrops:SetText("Nearby Drops: " .. tostring(drops and #drops:GetChildren() or 0))
	end
end)

BigCraniusHub.Connections.Automations = task.spawn(function()
	while task.wait(0.1) do
		if tick() - (BigCraniusHub.LastPortalRefresh or 0) >= 5 then
			BigCraniusHub.LastPortalRefresh = tick()

			local options, instances = ProcessFuncs.GetPortalOptions()
			if #options == 0 then options = {"None"} end

			PortalOptions = options
			PortalInstances = instances
			Options.AutomationPortal:SetValues(PortalOptions)
			Options.PortalTeleport:SetValues(PortalOptions)
		end

		if tick() - (BigCraniusHub.LastWeaponRefresh or 0) >= 5 then
			BigCraniusHub.LastWeaponRefresh = tick()

			local options, weapons = ProcessFuncs.GetWeaponOptions()
			if #options == 0 then options = {"None"} end

			local selectedid = SelectedWeapon and tostring(SelectedWeapon.Id)
			WeaponOptions = options
			WeaponInstances = weapons
			Options.AutomationWeapon:SetValues(WeaponOptions)

			local found = nil
			local founddisplay = nil
			for display, weapon in WeaponInstances do
				if tostring(weapon.Id) ~= selectedid then continue end
				found = weapon
				founddisplay = display
				break
			end

			if found then
				SelectedWeapon = found
				Options.AutomationWeapon:SetValue(founddisplay)
			else
				SelectedWeapon = WeaponInstances[WeaponOptions[1]]
				Options.AutomationWeapon:SetValue(WeaponOptions[1])
			end
		end

		if Toggles.AutoBestPortal.Value then
			local _, portal = ProcessFuncs.GetBestPortal()
			SelectedPortal = portal
		elseif not SelectedPortal then
			SelectedPortal = PortalInstances[Options.AutomationPortal.Value]
		elseif SelectedPortal and not ProcessFuncs.CanEnterPortal(SelectedPortal) then
			SelectedPortal = nil
			BigCraniusHub.AutoEnterPortal = nil
		end

		Labels.SelectedPortal:SetText("Selected Portal: " .. (SelectedPortal and ProcessFuncs.FormatPortalDisplay(SelectedPortal) or "None"))

		if Toggles.AutoEnter.Value and SelectedPortal and not ProcessFuncs.GetCurrentDungeonId() then
			local ok = ProcessFuncs.CanEnterPortal(SelectedPortal)
			if not ok then
				SelectedPortal = nil
				BigCraniusHub.AutoEnterPortal = nil
			else
				if BigCraniusHub.AutoEnterPortal ~= SelectedPortal then
					if ActionFuncs.TeleportToPortal(SelectedPortal) then
						BigCraniusHub.AutoEnterPortal = SelectedPortal
						task.wait(0.1)
					else
						SelectedPortal = nil
						BigCraniusHub.AutoEnterPortal = nil
					end
				end

				if SelectedPortal and tick() - (BigCraniusHub.LastEnterAttempt or 0) >= 1.5 then
					BigCraniusHub.LastEnterAttempt = tick()
					if not ActionFuncs.EnterPortal(SelectedPortal) then
						SelectedPortal = nil
						BigCraniusHub.AutoEnterPortal = nil
					end
				end
			end
		end

		if Toggles.AutoStart.Value and FetchFuncs.CanStartDungeon() then
			if tick() - (BigCraniusHub.LastStartAttempt or 0) >= 0.5 then
				BigCraniusHub.LastStartAttempt = tick()
				ActionFuncs.StartDungeon()
			end
		end

		if Toggles.BossBattleTimeout.Value and ProcessFuncs.GetCurrentDungeonId() then
			local state = DungeonState:GetState()
			if state == "Boss Battle" or state == "Awaiting Boss" then
				if DungeonData.bossat == 0 then
					DungeonData.bossat = tick()
				end

				local limit = (Options.BossBattleTimeoutMinutes.Value or 3) * 60
				if tick() - DungeonData.bossat >= limit then
					if tick() - (BigCraniusHub.LastBossTimeout or 0) >= 3 then
						BigCraniusHub.LastBossTimeout = tick()
						print(string.format(
							"[+] Boss gate/battle timeout (%sm), leaving dungeon",
							tostring(Options.BossBattleTimeoutMinutes.Value)
						))
						DungeonData.bossat = 0
						BigCraniusHub.OpeningBossRoom = false
						BigCraniusHub.AutoEnterPortal = nil
						ActionFuncs.LeaveDungeon()
					end
				end
			end
		end

		if Toggles.MobFarm.Value then
			local boss, bossinfo = ProcessFuncs.GetBossMob()
			ProcessFuncs.UpdateBossDamage()

			if boss and bossinfo and not bossinfo.isimmune then
				DungeonData.bossreachable = true
			end

			local attackable = ProcessFuncs.HasAttackableMobs()
			local needgate = not attackable
				and not DungeonData.bossreachable
				and (
					DungeonState:GetState() == "Awaiting Boss"
					or (boss ~= nil and bossinfo ~= nil and bossinfo.isimmune == true and not DungeonData.gateopened)
				)

			local nodamage_retry = boss ~= nil
				and not DungeonData.bosshurt
				and DungeonData.gateretries < 4
				and DungeonData.gatewatchat > 0
				and tick() - DungeonData.gatewatchat >= 15

			if nodamage_retry then
				needgate = true
			end

			if needgate then
				if not BigCraniusHub.OpeningBossRoom
					and tick() - (BigCraniusHub.LastBossDoor or 0) >= 2.5
				then
					BigCraniusHub.LastBossDoor = tick()
					BigCraniusHub.OpeningBossRoom = true
					DungeonData.gateretries += 1
					DungeonData.bossreachable = false

					print(string.format(
						"[+] Opening boss gate (%d/4)%s",
						DungeonData.gateretries,
						nodamage_retry and " [no damage 15s]" or ""
					))

					task.spawn(function()
						pcall(ActionFuncs.AttemptOpenBossRoom)
						DungeonData.gateopened = true
						DungeonData.gatewatchat = tick()
						BigCraniusHub.OpeningBossRoom = false
					end)
				end
			end
		end

		if Toggles.AutoPotions.Value and ProcessFuncs.GetCurrentDungeonId() and not BigCraniusHub.PotionBusy then
			local mana = Options.ManaThreshold.Value / 100
			local heals = Options.HealthThreshold.Value / 100
			local usemana = Toggles.ManaPotions.Value and FetchFuncs.ShouldUseMana(mana)
			local useheals = Toggles.HealthPotions.Value and FetchFuncs.ShouldUseHeals(heals)

			if usemana or useheals then
				BigCraniusHub.PotionBusy = true
				task.spawn(function()
					ActionFuncs.UsePotion({
						mana = mana,
						heals = heals,
						usemana = Toggles.ManaPotions.Value,
						useheals = Toggles.HealthPotions.Value,
					})
					BigCraniusHub.PotionBusy = false
				end)
			end
		end

		if Toggles.AutoSkillPoints.Value and tick() - (BigCraniusHub.LastSkillPointUse or 0) >= 0.5 then
			BigCraniusHub.LastSkillPointUse = tick()
			ActionFuncs.UseSkillPoints(Options.SkillPointStat.Value, Options.SkillPointAmount.Value)
		end

		if Toggles.AutoPickupDrops.Value and tick() - (BigCraniusHub.LastDropCollect or 0) >= 0.2 then
			BigCraniusHub.LastDropCollect = tick()
			pcall(ActionFuncs.CollectAllDrops)
		end

		if Toggles.AutoOpenChest.Value and DungeonData.claimpending and tick() >= DungeonData.claimat then
			DungeonData.claimpending = false
			DungeonState:SetState("Claiming Chest")
			ActionFuncs.ForceBypassDungeonCleared()
			task.wait(0.5)
			ActionFuncs.CollectAllChests()
			ActionFuncs.LeaveDungeon()
		end
	end
end)

BigCraniusHub.Connections.KeepWeapon = task.spawn(function()
	while task.wait(0.5) do
		if not ProcessFuncs.GetCurrentDungeonId() then continue end

		if BigCraniusHub.NeedWeaponEquip then
			BigCraniusHub.NeedWeaponEquip = false
			task.wait(0.35)
		end

		if FetchFuncs.IsWeaponEquipped() then
			if SelectedWeapon then
				local held = FetchFuncs.EquippedWeapon()
				if held and tostring(held:GetAttribute("UUID")) == tostring(SelectedWeapon.Id) then
					continue
				end
			else
				continue
			end
		end

		pcall(ActionFuncs.EnsureWeaponHeld)
	end
end)

BigCraniusHub.Connections.MobFarmHeartbeat = RunService.Heartbeat:Connect(function()
	if not Toggles.MobFarm.Value then return end
	ActionFuncs.MobFarm()
end)

BigCraniusHub.Connections.AutoAbilities = task.spawn(function()
	while task.wait(0.25) do
		if not Toggles.AutoAbilities.Value then continue end
		if not ProcessFuncs.GetCurrentDungeonId() or DungeonData.cleared then continue end

		if not FetchFuncs.IsWeaponEquipped() then
			ActionFuncs.EnsureWeaponHeld()
			if not FetchFuncs.IsWeaponEquipped() then continue end
		end

		for slot = 1, 5 do
			local oncd = false
			local ok, result = pcall(FetchFuncs.IsAbilityOnCooldown, slot)
			if ok then oncd = result end
			if oncd then continue end
			pcall(ActionFuncs.UseAbility, slot)
			task.wait()
		end
	end
end)

BigCraniusHub.Connections.AutoSell = task.spawn(function()
	while task.wait(1) do
		if not Toggles.AutoSell.Value then continue end
		local selltypes = Options.SellType.Value
		local sellrarities = Options.SellRarity.Value
		if type(selltypes) ~= "table" or type(sellrarities) ~= "table" then continue end

		for selltype, typeon in selltypes do
			if not typeon then continue end
			for rarityname, rarityon in sellrarities do
				if not rarityon then continue end
				local rarity = RarityValues[rarityname]
				if not rarity then continue end

				pcall(ActionFuncs.SellItems, selltype, rarity)
				task.wait()
			end
		end
	end
end)

BigCraniusHub.Connections.AutoBuyMerchant = task.spawn(function()
	while task.wait(1) do
		if not Toggles.AutoBuyMerchant.Value then continue end
		pcall(ActionFuncs.BuyMerchant)
	end
end)

Library:OnUnload(function()
	if BigCraniusHub.Library == Library then
		BigCraniusHub.Library = nil
	end

	for _, connection in BigCraniusHub.Connections do
		if typeof(connection) == "RBXScriptConnection" then
			connection:Disconnect()
		elseif typeof(connection) == "thread" and connection ~= coroutine.running() then
			task.cancel(connection)
		end
	end
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind"})
ThemeManager:SetFolder("BigCraniusHub/SoloHunters")
SaveManager:SetFolder("BigCraniusHub/SoloHunters")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)
SaveManager:LoadAutoloadConfig()
