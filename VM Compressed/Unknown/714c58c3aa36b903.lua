-- ===================== Copy key site to clipboard =====================
pcall(function()
	if setclipboard then
		setclipboard('https://scriptsrbx.com/key/')
	end
end)

-- ===================== Load Rayfield UI =====================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ===================== UI =====================
local Window = Rayfield:CreateWindow({
	Name = 'Auto Farm | ScriptsRBX',
	LoadingTitle = 'ScriptsRBX.com Auto Farm',
	LoadingSubtitle = 'ScriptsRBX',
	Theme = 'Default',
	ShowText = 'Auto Farm GUI',
	ToggleUIKeybind = 'K',
	KeySystem = false,
})

local Tab = Window:CreateTab('Main', 4483362458)

-- ===================== Services =====================
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

-- ===================== HARD TELEPORT =====================
local function teleportToInstance(inst)
	if not inst then return end
	local character = getCharacter()

	if inst:IsA("Model") then
		character:PivotTo(inst:GetPivot() * CFrame.new(0, 5, 0))
	elseif inst:IsA("BasePart") then
		character:PivotTo(inst.CFrame * CFrame.new(0, 5, 0))
	end
end

-- ===================== DATA =====================
local CarryableNames = {}
local CrateMap = {}
local CrateNames = {}

local GiftMap = {}
local GiftNames = {}

-- ===================== REFRESH ALL =====================
local function refreshLists()
	table.clear(CarryableNames)
	table.clear(CrateMap)
	table.clear(CrateNames)
	table.clear(GiftMap)
	table.clear(GiftNames)

	-- Carryables (unique names)
	local carryables = workspace:FindFirstChild("_Carryables")
	if carryables then
		local seen = {}
		for _, model in ipairs(carryables:GetChildren()) do
			if model:IsA("Model") and not seen[model.Name] then
				seen[model.Name] = true
				table.insert(CarryableNames, model.Name)
			end
		end
	end
	table.sort(CarryableNames)

	-- Crates (duplicates allowed)
	local crates = workspace:FindFirstChild("_Crates")
	if crates then
		for i, inst in ipairs(crates:GetChildren()) do
			if inst:IsA("Model") or inst:IsA("BasePart") then
				local label = inst.Name .. " [" .. i .. "]"
				CrateMap[label] = inst
				table.insert(CrateNames, label)
			end
		end
	end

	-- Gifts (dynamic islands & locations)
	local islands = workspace:FindFirstChild("_Debris")
		and workspace._Debris:FindFirstChild("Islands")

	if islands then
		for _, island in ipairs(islands:GetChildren()) do
			for _, place in ipairs(island:GetChildren()) do
				local special = place:FindFirstChild("SpecialSpawns")
				if special then
					for _, gift in ipairs(special:GetChildren()) do
						if gift:IsA("Model") and gift.Name:match("^Gift") then
							local label =
								island.Name .. " | " .. place.Name .. " | " .. gift.Name
							GiftMap[label] = gift
							table.insert(GiftNames, label)
						end
					end
				end
			end
		end
	end
end

refreshLists()

-- ===================== LIVE CARRYABLE FIND =====================
local function findCarryableByName(name)
	local carryables = workspace:FindFirstChild("_Carryables")
	if not carryables then return nil end

	for _, model in ipairs(carryables:GetChildren()) do
		if model:IsA("Model") and model.Name == name then
			return model
		end
	end
	return nil
end

-- ===================== UI ELEMENTS =====================
local SelectedCarryable = nil
local SelectedCrate = nil
local SelectedGift = nil

-- ---- Carryables ----
local CarryableDropdown = Tab:CreateDropdown({
	Name = "Select Item",
	Options = CarryableNames,
	CurrentOption = { CarryableNames[1] },
	Callback = function(options)
		SelectedCarryable = options[1]
	end
})

Tab:CreateButton({
	Name = "Teleport To Selected Item",
	Callback = function()
		if not SelectedCarryable then return end
		refreshLists()
		CarryableDropdown:Refresh(CarryableNames)

		local target = findCarryableByName(SelectedCarryable)
		if not target then
			Rayfield:Notify({ Title="Teleport", Content="None left", Duration=2 })
			return
		end
		teleportToInstance(target)
	end
})

-- ---- Crates ----
local CrateDropdown = Tab:CreateDropdown({
	Name = "Teleport To Crate",
	Options = CrateNames,
	CurrentOption = { CrateNames[1] },
	Callback = function(options)
		SelectedCrate = options[1]
	end
})

Tab:CreateButton({
	Name = "Teleport To Selected Crate",
	Callback = function()
		if not SelectedCrate then return end
		refreshLists()
		CrateDropdown:Refresh(CrateNames)

		local crate = CrateMap[SelectedCrate]
		if not crate or not crate.Parent then
			Rayfield:Notify({ Title="Teleport", Content="Crate not found", Duration=2 })
			return
		end
		teleportToInstance(crate)
	end
})

-- ---- Gifts ----
local GiftDropdown = Tab:CreateDropdown({
	Name = "Teleport To Gift",
	Options = GiftNames,
	CurrentOption = { GiftNames[1] },
	Callback = function(options)
		SelectedGift = options[1]
	end
})

Tab:CreateButton({
	Name = "Teleport To Selected Gift",
	Callback = function()
		if not SelectedGift then return end
		refreshLists()
		GiftDropdown:Refresh(GiftNames)

		local gift = GiftMap[SelectedGift]
		if not gift or not gift.Parent then
			Rayfield:Notify({ Title="Teleport", Content="Gift not found", Duration=2 })
			return
		end
		teleportToInstance(gift)
	end
})

-- ---- Raft ----
Tab:CreateButton({
	Name = "Teleport To Raft",
	Callback = function()
		local raft = workspace:FindFirstChild("_Raft")
		if raft then teleportToInstance(raft) end
	end
})

-- ---- Manual Refresh ----
Tab:CreateButton({
	Name = "Refresh Items, Crates & Gifts",
	Callback = function()
		refreshLists()
		CarryableDropdown:Refresh(CarryableNames)
		CrateDropdown:Refresh(CrateNames)
		GiftDropdown:Refresh(GiftNames)
	end
})
