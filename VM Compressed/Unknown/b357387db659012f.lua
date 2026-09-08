-- ============================================================
--  Build a Gun Army - Auto Farm
--  Author: hidevin
--  UI: ObsidianUltra (https://github.com/joustingmatch/ObsidianUltra)
--  Press RIGHT SHIFT to open/close this menu.
-- ============================================================

-- STATE guard: works under live-reload, and falls back gracefully standalone.
local STATE = STATE or {
	alive = function()
		return true
	end,
	onCleanup = function() end,
	connect = function(signal, fn)
		return signal:Connect(fn)
	end,
}

-- ------------------------------------------------------------
-- Load UI library
-- ------------------------------------------------------------
local repo = "https://raw.githubusercontent.com/joustingmatch/ObsidianUltra/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

-- ------------------------------------------------------------
-- Services & game data
-- ------------------------------------------------------------
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local RE = RS:WaitForChild("RemoteEvents")

local WeaponConfigModule = require(RS:WaitForChild("WeaponConfigModule"))
local HelperModule = require(RS:WaitForChild("HelperModule"))
local WeaponStats = WeaponConfigModule.WeaponStats

local RarityNames = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret" }

-- ------------------------------------------------------------
-- Clean up a previous instance of this UI (rejoin / re-exec)
-- ------------------------------------------------------------
local function destroyOldUI()
	local hui = (gethui and gethui()) or game:GetService("CoreGui")
	for _, gui in ipairs(hui:GetChildren()) do
		if gui:IsA("ScreenGui") and gui:GetAttribute("BuildAGunArmyUI") == true then
			gui:Destroy()
		end
	end
end
destroyOldUI()

-- ------------------------------------------------------------
-- Create window
-- ------------------------------------------------------------
local Window = Library:CreateWindow({
	Title = "Build a Gun Army",
	Icon = "crosshair",
	Footer = "Please leave a like on Rscripts if it works. Author:hidevin",
	ToggleKeybind = Enum.KeyCode.RightShift,
	SearchbarSize = UDim2.fromScale(0.26, 1),
	NotifySide = "Right",
	Center = true,
	AutoShow = true,
	ShowCustomCursor = true,
})

local ScreenGuiRef = nil
if Library.MainFrame then
	ScreenGuiRef = Library.MainFrame:FindFirstAncestorWhichIsA("ScreenGui")
	if ScreenGuiRef then
		ScreenGuiRef:SetAttribute("BuildAGunArmyUI", true)
	end
end

-- ------------------------------------------------------------
-- Tabs
-- ------------------------------------------------------------
local Tabs = {
	Boxes = Window:AddTab({ Name = "Boxes", Icon = "gift", Description = "Mystery box automation" }),
	Rebirth = Window:AddTab({ Name = "Rebirth", Icon = "infinity", Description = "Auto rebirth for a cash multiplier" }),
	Coins = Window:AddTab({ Name = "Coins", Icon = "coins", Description = "Auto collect coins" }),
	["UI Settings"] = Window:AddTab({ Name = "UI Settings", Icon = "settings", Description = "Config & menu" }),
}

-- ------------------------------------------------------------
-- Boxes tab
-- ------------------------------------------------------------
local BoxAutoGroup = Tabs.Boxes:AddLeftGroupbox("Auto Open Mystery Box", "gift")
BoxAutoGroup:AddToggle("AutoOpenBox", {
	Text = "Auto Open & Place Guns",
	Default = false,
	Tooltip = "Rolls the mystery box, buys the rolled weapons, and automatically places your guns down on the plot so they start shooting for you.",
})
BoxAutoGroup:AddLabel("BoxHintLabel", {
	Text = "Rolls the box, buys weapons, and auto-places your guns for you.",
	DoesWrap = true,
})
BoxAutoGroup:AddSlider("OpenInterval", {
	Text = "Open Interval",
	Min = 0.1,
	Max = 30,
	Default = 2,
	Rounding = 1,
	Suffix = "s",
})
BoxAutoGroup:AddToggle("TeleportToBox", {
	Text = "TP To Box / Gun",
	Default = true,
	Tooltip = "Teleports you to the box or gun spot when out of range, so the action works.",
})

local BoxFilterGroup = Tabs.Boxes:AddRightGroupbox("Buy Filters", "filter")
BoxFilterGroup:AddToggle("BuyByRarity", {
	Text = "Buy By Rarity",
	Default = false,
	Tooltip = "Only buy rolled weapons whose rarity is selected below.",
})
BoxFilterGroup:AddDropdown("Rarities", {
	Text = "Rarities To Buy",
	Values = RarityNames,
	Default = 1,
	Multi = true,
	SelectAllButtons = true,
	Tooltip = "Multi-select the rarities you want to keep.",
})
Options.Rarities:SetValue({
	Common = true,
	Uncommon = true,
	Rare = true,
	Epic = true,
	Legendary = true,
	Mythic = true,
	Secret = true,
})
BoxFilterGroup:AddSlider("RarityInterval", {
	Text = "Rarity Check Interval",
	Min = 0.1,
	Max = 30,
	Default = 2,
	Rounding = 1,
	Suffix = "s",
})
BoxFilterGroup:AddToggle("DiscardUnwanted", {
	Text = "Discard Unwanted Rolls",
	Default = true,
	Tooltip = "Discards (re-rolls) any weapon that does not match your filters.",
})

-- ------------------------------------------------------------
-- Rebirth tab
-- ------------------------------------------------------------
local RebirthGroup = Tabs.Rebirth:AddLeftGroupbox("Auto Rebirth", "infinity")
RebirthGroup:AddToggle("AutoRebirth", {
	Text = "Auto Rebirth",
	Default = false,
	Tooltip = "Automatically rebirths when your wave reaches the minimum below. Rebirth resets your waves and guns but gives you a permanent cash multiplier.",
})
RebirthGroup:AddSlider("MinRebirthWave", {
	Text = "Min Wave To Rebirth",
	Min = 20,
	Max = 200,
	Default = 20,
	Rounding = 0,
	Suffix = "",
})
RebirthGroup:AddSlider("RebirthInterval", {
	Text = "Check Interval",
	Min = 0.1,
	Max = 30,
	Default = 3,
	Rounding = 1,
	Suffix = "s",
})

-- ------------------------------------------------------------
-- Coins tab
-- ------------------------------------------------------------
local CoinGroup = Tabs.Coins:AddLeftGroupbox("Auto Collect Coins", "coins")
CoinGroup:AddToggle("AutoCollectCoins", {
	Text = "Auto Collect Coins",
	Default = false,
	Tooltip = "Collects every coin that has dropped on the map.",
})
CoinGroup:AddSlider("CollectInterval", {
	Text = "Collect Interval",
	Min = 0.1,
	Max = 30,
	Default = 1,
	Rounding = 1,
	Suffix = "s",
})

-- ------------------------------------------------------------
-- UI Settings tab
-- ------------------------------------------------------------
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "keyboard")
MenuGroup:AddLabel("ToggleHint", {
	Text = "Press RIGHT SHIFT to open/close this menu",
	DoesWrap = true,
})
MenuGroup:AddLabel("MenuKeybindLabel", { Text = "Menu Keybind" })
	:AddKeyPicker("MenuKeybind", {
		Default = "RightShift",
		NoUI = true,
		Text = "Menu keybind",
	})
MenuGroup:AddButton({ Text = "Unload Script", Func = function()
	Library:Unload()
end })

Library.ToggleKeybind = Options.MenuKeybind

-- ------------------------------------------------------------
-- SaveManager (configs)
-- ------------------------------------------------------------
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
SaveManager:SetFolder("BuildAGunArmy")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

-- ------------------------------------------------------------
-- Logic helpers
-- ------------------------------------------------------------
local function getPlot()
	return HelperModule.findPlayersPlot(LP)
end

local function getWeaponBox()
	local plot = getPlot()
	return plot and plot:FindFirstChild("WeaponBox") or nil
end

local function getBoxPrompt()
	local wb = getWeaponBox()
	if not wb then
		return nil
	end
	for _, c in ipairs(wb:GetDescendants()) do
		if c:IsA("ProximityPrompt") and c.Name == "WeaponBoxPrompt" then
			return c
		end
	end
	return nil
end

local function getRoll()
	local wb = getWeaponBox()
	if not wb then
		return nil
	end
	local rw = wb:FindFirstChild("RolledWeapon")
	if not rw then
		return nil
	end
	local unitName = rw:GetAttribute("unitName")
	if type(unitName) ~= "string" then
		return nil
	end
	local stats = WeaponStats[unitName]
	return {
		unitName = unitName,
		tier = rw:GetAttribute("unitTier"),
		cost = rw:GetAttribute("Cost"),
		dps = rw:GetAttribute("DPS") or (stats and stats.DPS or 0),
		rarity = stats and stats.Rarity or 1,
	}
end

local function teleportNear(targetPosition)
	local char = LP.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp or not targetPosition then
		return false
	end
	if (hrp.Position - targetPosition).Magnitude > 10 then
		pcall(function()
			hrp.CFrame = CFrame.new(targetPosition + Vector3.new(0, 4, 0))
		end)
		return true
	end
	return false
end

local function openBox()
	if Toggles.TeleportToBox.Value then
		local wb = getWeaponBox()
		local zone = wb and wb:FindFirstChild("Zone")
		if zone and teleportNear(zone.Position) then
			task.wait(0.5)
		end
	end
	local prompt = getBoxPrompt()
	if prompt then
		pcall(function()
			fireproximityprompt(prompt)
		end)
	end
end

local function buyRoll()
	if Toggles.TeleportToBox.Value then
		local wb = getWeaponBox()
		local zone = wb and wb:FindFirstChild("Zone")
		if zone and teleportNear(zone.Position) then
			task.wait(0.5)
		end
	end
	pcall(function()
		RE.WeaponBoxBuy:FireServer()
	end)
end

local function discardRoll()
	pcall(function()
		RE.WeaponBoxDiscard:FireServer()
	end)
end

local function placeDown(unitName)
	local plot = getPlot()
	if not plot then
		return
	end
	local units = plot:FindFirstChild("Units")
	local unit = units and units:FindFirstChild(unitName)
	if not unit then
		return
	end
	if Toggles.TeleportToBox.Value then
		local base = unit:FindFirstChild("WeaponBasePart") or unit.PrimaryPart
		if base and teleportNear(base.Position) then
			task.wait(0.5)
		end
	end
	for _, d in ipairs(unit:GetDescendants()) do
		if d:IsA("ProximityPrompt") and d.ActionText == "Place Gun" then
			pcall(function()
				fireproximityprompt(d)
			end)
			return
		end
	end
end

local function collectCoins()
	local loot = workspace:FindFirstChild("LootSpawnedClient")
	if not loot then
		return
	end
	local names = {}
	for _, c in ipairs(loot:GetChildren()) do
		if c:GetAttribute("isLootVisual") then
			names[#names + 1] = c.Name
		end
	end
	if #names > 0 then
		pcall(function()
			RE.CurrencyPickup:FireServer(names)
		end)
	end
end

local function raritySelected(rarity)
	local active = Options.Rarities:GetActiveValues()
	local want = RarityNames[rarity] or ("Rarity " .. tostring(rarity))
	for _, v in ipairs(active) do
		if v == want then
			return true
		end
	end
	return false
end

local function boxTick()
	local t = 9e9
	pcall(function()
		if Toggles.AutoOpenBox.Value then
			t = math.min(t, Options.OpenInterval.Value)
		end
		if Toggles.BuyByRarity.Value then
			t = math.min(t, Options.RarityInterval.Value)
		end
	end)
	if t >= 9e9 then
		t = 1
	end
	return math.max(t, 0.2)
end

-- ------------------------------------------------------------
-- Anti-AFK (always enabled)
-- ------------------------------------------------------------
task.spawn(function()
	setthreadidentity(8)
	local VirtualUser = game:GetService("VirtualUser")
	STATE.connect(LP.Idled, function()
		pcall(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end)
end)

-- ------------------------------------------------------------
-- Box automation loop (place down -> buy/discard -> open)
-- ------------------------------------------------------------
task.spawn(function()
	setthreadidentity(8)
	while STATE.alive() do
		if ScreenGuiRef and not ScreenGuiRef.Parent then
			break
		end
		local waitTime = 0.5
		local ok, res = pcall(function()
			if not (Toggles.AutoOpenBox.Value or Toggles.BuyByRarity.Value) then
				return 0.5
			end
			local pending = LP:GetAttribute("PendingWeapon")
			if type(pending) == "string" and pending ~= "" then
				placeDown(pending)
			else
				local roll = getRoll()
				if not roll then
					openBox()
				else
					local want = true
					if Toggles.BuyByRarity.Value then
						want = raritySelected(roll.rarity)
					end
					if want then
						local cur = LP:GetAttribute("currency") or 0
						if cur >= (roll.cost or 0) then
							buyRoll()
						elseif Toggles.DiscardUnwanted.Value then
							discardRoll()
						end
					elseif Toggles.DiscardUnwanted.Value then
						discardRoll()
					end
				end
			end
			return boxTick()
		end)
		if ok then
			waitTime = res or 0.5
		end
		task.wait(waitTime)
	end
end)

-- ------------------------------------------------------------
-- Coin automation loop
-- ------------------------------------------------------------
task.spawn(function()
	setthreadidentity(8)
	while STATE.alive() do
		if ScreenGuiRef and not ScreenGuiRef.Parent then
			break
		end
		local waitTime = 0.5
		local ok, res = pcall(function()
			if Toggles.AutoCollectCoins.Value then
				collectCoins()
				return Options.CollectInterval.Value
			end
			return 0.5
		end)
		if ok then
			waitTime = res or 0.5
		end
		task.wait(waitTime)
	end
end)

-- ------------------------------------------------------------
-- Rebirth automation loop
-- ------------------------------------------------------------
task.spawn(function()
	setthreadidentity(8)
	while STATE.alive() do
		if ScreenGuiRef and not ScreenGuiRef.Parent then
			break
		end
		local waitTime = 0.5
		local ok, res = pcall(function()
			if not Toggles.AutoRebirth.Value then
				return 0.5
			end
			local plot = getPlot()
			local wave = plot and plot:GetAttribute("CurrentWave") or 0
			if wave >= Options.MinRebirthWave.Value then
				pcall(function()
					RE.RebirthButtonPress:FireServer()
				end)
			end
			return Options.RebirthInterval.Value
		end)
		if ok then
			waitTime = res or 0.5
		end
		task.wait(waitTime)
	end
end)

-- ------------------------------------------------------------
-- Teardown
-- ------------------------------------------------------------
STATE.onCleanup(function()
	pcall(function()
		Library:Unload()
	end)
end)

Library:Notify({
	Title = "Build a Gun Army",
	Description = "Loaded! Press RIGHT SHIFT to open/close the menu.",
	Type = "Success",
	Time = 5,
})
