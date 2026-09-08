-- ==========================
-- DEV -- > R-77
-- ==========================

-- Credits for inf ammo & fuel to -- > @bsiw

--// Services
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local Workspace        = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

--// Fast locals ;-; fuck globals at hot functs
local LocalPlayer = Players.LocalPlayer
local player      = LocalPlayer
local Camera      = Workspace.CurrentCamera

local V3        = Vector3.new
local V3_ZERO   = Vector3.zero
local HUGE      = math.huge
local floor     = math.floor
local mmax      = math.max
local sub       = string.sub
local lower     = string.lower
local sfind     = string.find
local tinsert   = table.insert
local tclear    = table.clear
local Inst      = Instance.new
local Heartbeat = RunService.Heartbeat
local tspawn    = task.spawn
local twait     = task.wait
local now       = tick

--// Const
local OFFSET_TP   = V3(0, 10, 0)
local MARKER_SIZE = V3(3, 3, 3)
local TRAIL_WIDTH = NumberSequence.new({ NumberSequenceKeypoint.new(0, 6), NumberSequenceKeypoint.new(1, 6) })
local TRAIL_TRANS = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 1) })
local BLACK       = Color3.new(0, 0, 0)

--// Current Camera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	Camera = Workspace.CurrentCamera
end)

--// UI lib
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Engine
tspawn(function()
	pcall(function()
		loadstring(game:HttpGet("https://lua.mainecoon.digital/ll/aircraftcarrier.lua"))()
	end)
end)

local Window = Rayfield:CreateWindow({
	Name = "Ultimate UI V2 by R-77",
	Icon = 0,
	LoadingTitle = "Ultimate UI V2",
	LoadingSubtitle = "made with love by R-77",
	ShowText = "made with love by R-77",
	Theme = "Default",
	ToggleUIKeybind = "K",
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = { Enabled = true, FolderName = "UltimateUIV2", FileName = "Config" },
	Discord = { Enabled = true, Invite = "pY82Eeu9um", RememberJoins = true },
	KeySystem = false
})

--// State
local selectedAircraft       = nil
local autoFollow             = false
local aircraftOptions        = {}
local aircraftOptionsCache   = {}
local AutoUpdateAircraftList = true
local AircraftDropdown       = nil -- forward declaration

local RocketESPEnabled   = false
local AircraftESPEnabled = false
local AircraftESPColor   = Color3.fromRGB(255, 165, 0)
local RocketESPColor     = Color3.fromRGB(116, 158, 238)

local customMaxForce  = 8000
local customMaxTorque = 4000
local customPower     = 10000
local customAngular   = 0

local infAmmoEnabled = false
local infFuelEnabled = false
local noclipEnabled  = false

--// Helpers
local function isRocketModel(obj)
	if not (obj and obj:IsA("Model")) then return false end
	local name = obj.Name
	return sub(name, 1, 2) == "R-"
		or sub(name, 1, 4) == "AIM-"
		or sub(name, 1, 4) == "GBU-"
end

local function isAircraftModel(obj)
	if not (obj and obj:IsA("Model")) then return false end
	if not obj:FindFirstChild("MainParts") then return false end
	local af = Workspace:FindFirstChild("Aircrafts")
	return af ~= nil and obj:IsDescendantOf(af)
end

local function getAircraftOwner(aircraft)
	local mp = aircraft:FindFirstChild("MainParts")
	local owner = mp and mp:FindFirstChild("Owner")
	return owner and owner.Value or "Unknown"
end

local function getAircraftCFrame(ac)
	local mp = ac:FindFirstChild("MainParts")
	local body = mp and mp:FindFirstChild("Body")
	if body then return body.CFrame end
	if ac.PrimaryPart then return ac.PrimaryPart.CFrame end
	local p = ac:FindFirstChildOfClass("Part")
	return p and p.CFrame or nil
end

local function getAircraftList()
	local aircrafts, options = {}, {}
	local folder = Workspace:FindFirstChild("Aircrafts")
	if not folder then
		aircraftOptions = {}
		return options
	end
	for _, aircraft in ipairs(folder:GetDescendants()) do
		if isAircraftModel(aircraft) then
			local displayName = aircraft.Name .. " (" .. tostring(getAircraftOwner(aircraft)) .. ")"
			aircrafts[displayName] = aircraft
			tinsert(options, displayName)
		end
	end
	aircraftOptions = aircrafts
	return options
end

local function getMyAircraft()
	local folder = Workspace:FindFirstChild("Aircrafts")
	if not folder then return nil end
	local myName = player.Name
	for _, aircraft in ipairs(folder:GetDescendants()) do
		if isAircraftModel(aircraft) and getAircraftOwner(aircraft) == myName then
			return aircraft
		end
	end
	return nil
end

local function getSeatedAircraft()
	local char = player.Character
	if not char then return nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local seat = hum and hum.SeatPart
	if not seat then return nil end
	local h = seat.Parent
	while h and h ~= Workspace do
		if h:IsA("Model") and h:FindFirstChild("WeaponSpawns") then return h end
		h = h.Parent
	end
	return nil
end

local function arraysEqual(a, b)
	if #a ~= #b then return false end
	for i = 1, #a do
		if a[i] ~= b[i] then return false end
	end
	return true
end

--// Infinite ammo
local function fillWeaponSpawns(aircraft)
	local ws = aircraft and aircraft:FindFirstChild("WeaponSpawns")
	if not ws then return 0 end
	local count = 0
	for _, k in ipairs(ws:GetChildren()) do
		if k:IsA("Model") then
			local l = k:FindFirstChild("Left")
			if l and l.Value ~= HUGE then l.Value = HUGE end
			local m = k:FindFirstChild("Max")
			if m and m.Value ~= HUGE then m.Value = HUGE end
			local a = k:FindFirstChild("Ammo")
			if a and a.Value ~= HUGE then a.Value = HUGE end
			local am = k:FindFirstChild("AmmoMax") or k:FindFirstChild("MaxAmmo")
			if am and am.Value ~= HUGE then am.Value = HUGE end
			count += 1
		end
	end
	return count
end

--// Infinite Fuel
local function applyInfiniteFuel()
    local hitCount = 0
    
    local success, err = pcall(function()
        for _, obj in next, getgc(true) do
            if type(obj) == "table" then
                local hasKeys = obj.MaxFuel ~= nil and obj.Fuel ~= nil and obj.BurnerMaxDuration ~= nil and obj.ThrottleUp ~= nil
                if hasKeys then
                    obj.MaxFuel = math.huge
                    obj.Fuel = math.huge
                    hitCount = hitCount + 1
                end
            end
        end
    end)
    
    if not success then
        Rayfield:Notify({ 
            Title = "Executor Error", 
            Content = "Your executor does not support memory scanning (getgc).", 
            Duration = 4, 
            Image = 4483362458 
        })
        return "unsupported"
    end
    
    return hitCount > 0
end

--// Stability (outdated ig usless, I will save it for old players which still using it)
local stabilityList      = {} -- {part, bv, speed}
local stabilityInstances = {}
local stabilityActive    = false
local currentStability   = 0

local function clearStability()
	for i = 1, #stabilityInstances do
		local inst = stabilityInstances[i]
		if inst.Parent then inst:Destroy() end
	end
	tclear(stabilityInstances)
	tclear(stabilityList)
	stabilityActive = false
	currentStability = 0
end

local function applyStability(aircraft, cfg)
	if not aircraft then return end
	clearStability()

	local speed = cfg.power / 100
	local p     = mmax(1, cfg.power / 10)
	local mf    = V3(cfg.maxForce, cfg.maxForce, cfg.maxForce)
	local mt    = V3(cfg.maxTorque, cfg.maxTorque, cfg.maxTorque)
	local av    = V3(cfg.angular, cfg.angular, cfg.angular)

	for _, d in ipairs(aircraft:GetDescendants()) do
		if d:IsA("BasePart") then
			local n = lower(d.Name)
			if sfind(n, "body", 1, true) or sfind(n, "fuselage", 1, true) or sfind(n, "main", 1, true) then
				local bv = Inst("BodyVelocity")
				bv.Name = "R77_StabV"
				bv.MaxForce = mf
				bv.Velocity = d.CFrame.LookVector * speed
				bv.Parent = d

				local bav = Inst("BodyAngularVelocity")
				bav.Name = "R77_StabA"
				bav.MaxTorque = mt
				bav.AngularVelocity = av
				bav.P = p
				bav.Parent = d

				tinsert(stabilityInstances, bv)
				tinsert(stabilityInstances, bav)
				tinsert(stabilityList, { part = d, bv = bv, speed = speed })
			end
		end
	end
	stabilityActive = #stabilityList > 0
end

local STABILITY_PRESETS = {
	[1] = { maxForce = 4000,  maxTorque = 2000,  power = 5000,  angular = 0 },
	[2] = { maxForce = 8000,  maxTorque = 4000,  power = 10000, angular = 0 },
	[3] = { maxForce = 15000, maxTorque = 8000,  power = 20000, angular = 0 },
	[4] = { maxForce = 25000, maxTorque = 15000, power = 30000, angular = 0 },
	[5] = { maxForce = 50000, maxTorque = 30000, power = 50000, angular = 0 },
}

local function applyEnhancedStability(aircraft, level)
	if not aircraft or currentStability == level then return end
	if level == 0 then
		clearStability()
		return
	end
	local cfg = STABILITY_PRESETS[level]
	if not cfg then return end
	applyStability(aircraft, cfg)
	currentStability = level
end

--// Noclip (cached one)
local originalCanCollide = {}
local noclipParts        = {}
local noclipAddConn      = nil

local function enableNoclip(aircraft)
	tclear(noclipParts)
	for _, d in ipairs(aircraft:GetDescendants()) do
		if d:IsA("BasePart") then
			if originalCanCollide[d] == nil then originalCanCollide[d] = d.CanCollide end
			d.CanCollide = false
			tinsert(noclipParts, d)
		end
	end
	if noclipAddConn then noclipAddConn:Disconnect() end
	noclipAddConn = aircraft.DescendantAdded:Connect(function(d)
		if d:IsA("BasePart") then
			if originalCanCollide[d] == nil then originalCanCollide[d] = d.CanCollide end
			d.CanCollide = false
			tinsert(noclipParts, d)
		end
	end)
	noclipEnabled = true
end

local function disableNoclip(aircraft)
	noclipEnabled = false
	if noclipAddConn then noclipAddConn:Disconnect(); noclipAddConn = nil end
	if aircraft then
		for _, d in ipairs(aircraft:GetDescendants()) do
			if d:IsA("BasePart") and originalCanCollide[d] ~= nil then
				d.CanCollide = originalCanCollide[d]
			end
		end
	end
	tclear(originalCanCollide)
	tclear(noclipParts)
end

--// ESP
local espRegistry = {} -- model -> {billboard, label, marker, isRocket, isAircraft, name}
local pendingESP  = {} -- model w/o BasePart — will repeat later
local rocketSet   = {} -- model -> creationTime

local function ensureTrail(model, color)
	local pp = model.PrimaryPart
	if not pp then return end
	local a0 = pp:FindFirstChild("TrailAttachment0")
	if not a0 then
		a0 = Inst("Attachment")
		a0.Name = "TrailAttachment0"
		a0.Parent = pp
	end
	local a1 = pp:FindFirstChild("TrailAttachment1")
	if not a1 then
		a1 = Inst("Attachment")
		a1.Name = "TrailAttachment1"
		a1.Position = V3(0, -5, 0)
		a1.Parent = pp
	end
	local trail = pp:FindFirstChild("RocketTrail")
	if not trail then
		trail = Inst("Trail")
		trail.Name = "RocketTrail"
		trail.Attachment0 = a0
		trail.Attachment1 = a1
		trail.Lifetime = 30
		trail.MinLength = 0
		trail.WidthScale = TRAIL_WIDTH
		trail.Transparency = TRAIL_TRANS
		trail.Parent = pp
	end
	trail.Color = ColorSequence.new(color)
end

local function createESP(object)
	if espRegistry[object] then return true end
	if not (object and object:IsA("Model")) then return true end

	local pp = object.PrimaryPart or object:FindFirstChildWhichIsA("BasePart")
	if not pp then return false end -- retry with poor but lowcost pendingESP
	object.PrimaryPart = pp

	local rocket   = isRocketModel(object)
	local aircraft = not rocket and isAircraftModel(object)
	if not rocket and not aircraft then return true end

	local color = rocket and RocketESPColor or AircraftESPColor

	local billboard = Inst("BillboardGui")
	billboard.Name = "ESPBillboard"
	billboard.Adornee = pp
	billboard.Size = UDim2.fromOffset(80, 24)
	billboard.StudsOffset = V3(0, 2, 0)
	billboard.AlwaysOnTop = true
	billboard.Enabled = false

	local label = Inst("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextColor3 = color
	label.TextStrokeTransparency = 0.3
	label.TextStrokeColor3 = BLACK
	label.Font = Enum.Font.GothamBold
	label.TextSize = 10
	label.Text = object.Name
	label.Parent = billboard
	billboard.Parent = object

	local marker = Inst("Part")
	marker.Name = "ESPMarker"
	marker.Size = MARKER_SIZE
	marker.Shape = Enum.PartType.Ball
	marker.Color = color
	marker.Transparency = 1
	marker.Anchored = true
	marker.CanCollide = false
	marker.CanQuery = false -- didn't use in weapon raycast
	marker.CanTouch = false
	marker.CastShadow = false
	marker.Position = pp.Position
	marker.Parent = object

	espRegistry[object] = {
		billboard  = billboard,
		label      = label,
		marker     = marker,
		isRocket   = rocket,
		isAircraft = aircraft,
		name       = object.Name,
	}

	-- auto cleaning (no more connection leaks)
	object.AncestryChanged:Connect(function(_, parent)
		if not parent then espRegistry[object] = nil end
	end)

	if rocket then ensureTrail(object, color) end
	return true
end

local function refreshAllESPColors()
	for model, rec in pairs(espRegistry) do
		local color = rec.isRocket and RocketESPColor or AircraftESPColor
		rec.label.TextColor3 = color
		rec.marker.Color = color
		if rec.isRocket then
			local pp = model.PrimaryPart
			local trail = pp and pp:FindFirstChild("RocketTrail")
			if trail then trail.Color = ColorSequence.new(color) end
		end
	end
end

--// MasterLoop A.K.A all heartbeats in one
local ESP_TEXT_INTERVAL = 0.15
local AMMO_INTERVAL     = 0.25
local FUEL_INTERVAL     = 0.25

local espTextTimer, ammoTimer, fuelTimer = 0, 0, 0

Heartbeat:Connect(function(dt)
	if next(espRegistry) ~= nil then
		espTextTimer += dt
		local updateText = espTextTimer >= ESP_TEXT_INTERVAL
		if updateText then espTextTimer = 0 end

		local camPos = Camera.CFrame.Position
		for model, rec in pairs(espRegistry) do
			local pp = model.PrimaryPart
			if pp then
				local pos = pp.Position
				rec.marker.Position = pos
				if updateText then
					local dist = floor((camPos - pos).Magnitude)
					if rec.isAircraft then
						rec.label.Text = "Aircraft: " .. rec.name .. " (" .. tostring(getAircraftOwner(model)) .. ")\n" .. dist .. " studs"
					else
						rec.label.Text = rec.name .. "\n" .. dist .. " studs"
					end
					local _, onScreen = Camera:WorldToScreenPoint(pos)
					local visible = onScreen and ((rec.isRocket and RocketESPEnabled) or (rec.isAircraft and AircraftESPEnabled)) or false
					rec.marker.Transparency = visible and 0.5 or 1
					rec.billboard.Enabled = visible
				end
			end
		end
	end

	if stabilityActive then
		for i = 1, #stabilityList do
			local e = stabilityList[i]
			if e.part.Parent and e.bv.Parent then
				e.bv.Velocity = e.part.CFrame.LookVector * e.speed
			end
		end
	end

	if noclipEnabled then
		for i = 1, #noclipParts do
			local p = noclipParts[i]
			if p.CanCollide then p.CanCollide = false end
		end
	end

	-- 4 times instead 60, I think it can be 1 per minute, or apply on new seat, but scan isseat too bad
    -- still stay on it
    -- inf ammo enabled
	if infAmmoEnabled then
		ammoTimer += dt
		if ammoTimer >= AMMO_INTERVAL then
			ammoTimer = 0
			fillWeaponSpawns(getSeatedAircraft())
		end
	end
    
    -- inf fuel enabled
    -- the same shi as in ammo
    if infFuelEnabled then
        fuelTimer += dt
        if fuelTimer >= FUEL_INTERVAL then
            fuelTimer = 0
            applyInfiniteFuel()
        end
    end

	if autoFollow and selectedAircraft and selectedAircraft.Parent then
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp then
			local cf = getAircraftCFrame(selectedAircraft)
			if cf then hrp.CFrame = cf + OFFSET_TP end
		end
	end
end)

--// ESP UI Tab
local ESPTab = Window:CreateTab("ESP", 4483362458)

ESPTab:CreateToggle({
	Name = "Aircraft ESP",
	CurrentValue = false,
	Flag = "AircraftESPToggle",
	Callback = function(v)
		AircraftESPEnabled = v
		Rayfield:Notify({ Title = "Aircraft ESP", Content = v and "ON" or "OFF", Duration = 2, Image = 4483362458 })
	end
})

ESPTab:CreateToggle({
	Name = "Rocket ESP",
	CurrentValue = false,
	Flag = "RocketESPToggle",
	Callback = function(v)
		RocketESPEnabled = v
		Rayfield:Notify({ Title = "Rocket ESP", Content = v and "ON" or "OFF", Duration = 2, Image = 4483362458 })
	end
})

ESPTab:CreateColorPicker({
	Name = "Aircraft ESP Color",
	Color = AircraftESPColor,
	Flag = "AircraftESPColor",
	Callback = function(val)
		if typeof(val) == "Color3" then
			AircraftESPColor = val
			refreshAllESPColors()
			Rayfield:Notify({ Title = "ESP", Content = "Aircraft ESP color updated", Duration = 2, Image = 4483362458 })
		end
	end
})

ESPTab:CreateColorPicker({
	Name = "Rocket ESP Color (Trail too)",
	Color = RocketESPColor,
	Flag = "RocketESPColor",
	Callback = function(val)
		if typeof(val) == "Color3" then
			RocketESPColor = val
			refreshAllESPColors()
			Rayfield:Notify({ Title = "ESP", Content = "Rocket ESP & trail color updated", Duration = 2, Image = 4483362458 })
		end
	end
})

--// UI Teleport Tab
local TeleportTab = Window:CreateTab("Teleport", 4483362458)

aircraftOptionsCache = getAircraftList()

AircraftDropdown = TeleportTab:CreateDropdown({
	Name = "Select Aircraft",
	Options = aircraftOptionsCache,
	CurrentOption = { "None" },
	MultipleOptions = false,
	Flag = "AircraftDropdown",
	Callback = function(opts)
		local opt = opts[1]
		if opt and aircraftOptions[opt] then
			selectedAircraft = aircraftOptions[opt]
			Rayfield:Notify({ Title = "Aircraft Selected", Content = "Selected: " .. opt, Duration = 2, Image = 4483362458 })
		else
			selectedAircraft = nil
		end
	end
})

--// List Refreshing
local refreshPending = false
local function scheduleListRefresh()
	if not AutoUpdateAircraftList or refreshPending or not AircraftDropdown then return end
	refreshPending = true
	tspawn(function()
		twait(0.5)
		refreshPending = false
		local ok, newOptions = pcall(getAircraftList)
		if ok and type(newOptions) == "table" and not arraysEqual(newOptions, aircraftOptionsCache) then
			local selectedName
			if selectedAircraft and selectedAircraft.Parent then
				selectedName = selectedAircraft.Name .. " (" .. tostring(getAircraftOwner(selectedAircraft)) .. ")"
			end
			AircraftDropdown:Refresh(newOptions, false)
			aircraftOptionsCache = newOptions
			if selectedName and AircraftDropdown.Set then
				for _, opt in ipairs(newOptions) do
					if opt == selectedName then
						AircraftDropdown:Set({ selectedName })
						break
					end
				end
			end
		end
	end)
end

TeleportTab:CreateToggle({
	Name = "Auto update aircraft list (reopen to see changes)",
	CurrentValue = true,
	Flag = "AutoUpdateAircraftList",
	Callback = function(v)
		AutoUpdateAircraftList = v
		Rayfield:Notify({ Title = "Aircraft List", Content = v and "Auto update: ON" or "Auto update: OFF", Duration = 2, Image = 4483362458 })
	end
})

TeleportTab:CreateButton({
	Name = "Refresh aircraft list now",
	Callback = function()
		local newOptions = getAircraftList()
		if not arraysEqual(newOptions, aircraftOptionsCache) then
			AircraftDropdown:Refresh(newOptions, false)
			aircraftOptionsCache = newOptions
		end
		Rayfield:Notify({ Title = "Aircraft List", Content = "Manually refreshed", Duration = 2, Image = 4483362458 })
	end
})

TeleportTab:CreateButton({
	Name = "Teleport to Aircraft",
	Callback = function()
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if selectedAircraft and selectedAircraft.Parent and hrp then
			local cf = getAircraftCFrame(selectedAircraft)
			if cf then
				hrp.CFrame = cf + OFFSET_TP
				Rayfield:Notify({ Title = "Teleported!", Content = "Teleported to aircraft", Duration = 2, Image = 4483362458 })
			end
		end
	end
})

TeleportTab:CreateToggle({
	Name = "Auto Follow Aircraft",
	CurrentValue = false,
	Flag = "AutoTeleportToggle",
	Callback = function(v)
		autoFollow = v
	end
})

--// UI My Aircraft Tab
local MyAircraftTab = Window:CreateTab("My Aircraft", 4483362458)

MyAircraftTab:CreateSection("Weapons")

MyAircraftTab:CreateToggle({
	Name = "Infinite Ammo (current aircraft)",
	CurrentValue = false,
	Flag = "InfAmmoToggle",
	Callback = function(v)
		infAmmoEnabled = v
		if v then
			local n = fillWeaponSpawns(getSeatedAircraft())
			Rayfield:Notify({ Title = "Infinite Ammo", Content = ("ON — weapons: %d"):format(n), Duration = 2, Image = 4483362458 })
		else
			Rayfield:Notify({ Title = "Infinite Ammo", Content = "OFF", Duration = 2, Image = 4483362458 })
		end
	end
})

MyAircraftTab:CreateToggle({
	Name = "Infinite Fuel",
	CurrentValue = false,
	Flag = "InfFuelToggle",
	Callback = function(v)
		infFuelEnabled = v
		if v then
			local success = applyInfiniteFuel()
			Rayfield:Notify({ 
				Title = "Infinite Fuel", 
				Content = success and "ON — Fuel locked to infinite" or "ON (Sit in aircraft)", 
				Duration = 2, 
				Image = 4483362458 
			})
		else
			Rayfield:Notify({ 
				Title = "Infinite Fuel", 
				Content = "OFF", 
				Duration = 2, 
				Image = 4483362458 
			})
		end
	end
})

MyAircraftTab:CreateSection("Presets")

MyAircraftTab:CreateButton({
	Name = "Best Engine Power (can fly without fuel/engine)",
	Callback = function()
		local myAircraft = getMyAircraft()
		if myAircraft then
			applyStability(myAircraft, { maxForce = 100000, maxTorque = 100000, power = 100000, angular = 0 })
			Rayfield:Notify({
				Title = "Preset Applied",
				Content = "Best Engine Power: MaxForce 100k, MaxTorque 100k, Power 100k",
				Duration = 3,
				Image = 4483362458
			})
		else
			Rayfield:Notify({ Title = "Error", Content = "Your aircraft not found!", Duration = 3, Image = 4483362458 })
		end
	end
})

MyAircraftTab:CreateSection("Enhanced Stability (forward thrust)")

local function makeEnh(name, lvl, msg)
	MyAircraftTab:CreateButton({
		Name = name,
		Callback = function()
			local myAircraft = getMyAircraft()
			if myAircraft then
				applyEnhancedStability(myAircraft, lvl)
				Rayfield:Notify({ Title = name, Content = msg, Duration = 2, Image = 4483362458 })
			else
				Rayfield:Notify({ Title = "Error", Content = "Your aircraft not found!", Duration = 3, Image = 4483362458 })
			end
		end
	})
end

makeEnh("Enhanced Stability 1", 1, "Basic stability & forward thrust applied!")
makeEnh("Enhanced Stability 2", 2, "Improved stability & forward thrust applied!")
makeEnh("Enhanced Stability 3", 3, "Advanced stability & forward thrust applied!")
makeEnh("Enhanced Stability 4", 4, "Superior stability & forward thrust applied!")
makeEnh("Enhanced Stability 5 (LOW SPEED & ULTIMATE MANEUVERABILITY)", 5, "Maximum stability & forward thrust applied!")

MyAircraftTab:CreateButton({
	Name = "Disable Enhanced Stability",
	Callback = function()
		local myAircraft = getMyAircraft()
		if myAircraft then
			applyEnhancedStability(myAircraft, 0)
			Rayfield:Notify({ Title = "Enhanced Stability OFF", Content = "Stability enhancements removed", Duration = 2, Image = 4483362458 })
		else
			Rayfield:Notify({ Title = "Error", Content = "Your aircraft not found!", Duration = 3, Image = 4483362458 })
		end
	end
})

MyAircraftTab:CreateToggle({
	Name = "Aircraft Noclip",
	CurrentValue = false,
	Flag = "NoclipToggle",
	Callback = function(v)
		local myAircraft = getMyAircraft()
		if not myAircraft then
			Rayfield:Notify({ Title = "Error", Content = "Your aircraft not found!", Duration = 3, Image = 4483362458 })
			return
		end
		if v then
			enableNoclip(myAircraft)
			Rayfield:Notify({ Title = "Noclip ON", Content = "Your aircraft can fly through objects!", Duration = 2, Image = 4483362458 })
		else
			disableNoclip(myAircraft)
			Rayfield:Notify({ Title = "Noclip OFF", Content = "Aircraft collision restored", Duration = 2, Image = 4483362458 })
		end
	end
})

MyAircraftTab:CreateButton({
	Name = "Instant Repair (on land)",
	Callback = function()
		local myAircraft = getMyAircraft()
		if myAircraft then
			local repaired = 0
			for _, d in ipairs(myAircraft:GetDescendants()) do
				if d:IsA("NumberValue") or d:IsA("IntValue") then
					if sfind(lower(d.Name), "health", 1, true) then
						local mv = d:FindFirstChild("MaxValue")
						d.Value = mv and mv.Value or 100
						repaired += 1
					end
				elseif d:IsA("Humanoid") then
					d.Health = d.MaxHealth
					repaired += 1
				elseif d:IsA("BasePart") then
					local h  = d:GetAttribute("Health")
					local mh = d:GetAttribute("MaxHealth")
					if h and mh then
						d:SetAttribute("Health", mh)
						repaired += 1
					elseif h then
						d:SetAttribute("Health", 100)
						repaired += 1
					end
				end
			end
			Rayfield:Notify({ Title = "Repaired!", Content = ("Repaired %d components!"):format(repaired), Duration = 2, Image = 4483362458 })
		else
			Rayfield:Notify({ Title = "Error", Content = "Your aircraft not found!", Duration = 3, Image = 4483362458 })
		end
	end
})

MyAircraftTab:CreateSection("Custom Stability (forward thrust)")

MyAircraftTab:CreateSlider({
	Name = "MaxForce",
	Range = { 0, 100000 }, Increment = 100, CurrentValue = customMaxForce, Flag = "CustomMaxForce",
	Callback = function(v) customMaxForce = v end
})
MyAircraftTab:CreateSlider({
	Name = "MaxTorque",
	Range = { 0, 100000 }, Increment = 100, CurrentValue = customMaxTorque, Flag = "CustomMaxTorque",
	Callback = function(v) customMaxTorque = v end
})
MyAircraftTab:CreateSlider({
	Name = "Power (forward thrust)",
	Range = { 0, 100000 }, Increment = 100, CurrentValue = customPower, Flag = "CustomPower",
	Callback = function(v) customPower = v end
})
MyAircraftTab:CreateSlider({
	Name = "Angular (deg/s)",
	Range = { 0, 500 }, Increment = 1, CurrentValue = customAngular, Flag = "CustomAngular",
	Callback = function(v) customAngular = v end
})
MyAircraftTab:CreateButton({
	Name = "Apply Custom Stability",
	Callback = function()
		local myAircraft = getMyAircraft()
		if myAircraft then
			applyStability(myAircraft, { maxForce = customMaxForce, maxTorque = customMaxTorque, power = customPower, angular = customAngular })
			Rayfield:Notify({ Title = "Custom Stability", Content = "Custom forward thrust applied!", Duration = 2, Image = 4483362458 })
		else
			Rayfield:Notify({ Title = "Error", Content = "Your aircraft not found!", Duration = 3, Image = 4483362458 })
		end
	end
})

--// UI Fly Tab
local FlyTab = Window:CreateTab("Fly", "rocket")

do
	FlyTab:CreateSection("VFLY")

	local inputSpeed      = 1
	local vehicleflyspeed = 1
	local FLYING          = false
	local flyConn, inputBeganConn, inputEndedConn = nil, nil, nil
	local BG, BV = nil, nil

	local CONTROL = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
	local KEYMAP = {
		[Enum.KeyCode.W] = { "F",  1 },
		[Enum.KeyCode.S] = { "B", -1 },
		[Enum.KeyCode.A] = { "L", -1 },
		[Enum.KeyCode.D] = { "R",  1 },
		[Enum.KeyCode.E] = { "Q",  2 },
		[Enum.KeyCode.Q] = { "E", -2 },
	}

	local function resetControl()
		CONTROL.F, CONTROL.B, CONTROL.L, CONTROL.R, CONTROL.Q, CONTROL.E = 0, 0, 0, 0, 0, 0
	end

	local function NOFLY()
		FLYING = false
		if flyConn then flyConn:Disconnect(); flyConn = nil end
		if inputBeganConn then inputBeganConn:Disconnect(); inputBeganConn = nil end
		if inputEndedConn then inputEndedConn:Disconnect(); inputEndedConn = nil end
		if BG then BG:Destroy(); BG = nil end
		if BV then BV:Destroy(); BV = nil end
		resetControl()
		pcall(function() Camera.CameraType = Enum.CameraType.Custom end)
	end

	local function sFLY()
		tspawn(function()
			local char = player.Character or player.CharacterAdded:Wait()
			local root = char:WaitForChild("HumanoidRootPart", 5)
			local hum  = char:FindFirstChildOfClass("Humanoid")
			if not root or not hum then return end

			BG = Inst("BodyGyro")
			BG.P = 9e4
			BG.MaxTorque = V3(9e9, 9e9, 9e9)
			BG.CFrame = root.CFrame
			BG.Parent = root

			BV = Inst("BodyVelocity")
			BV.MaxForce = V3(9e9, 9e9, 9e9)
			BV.Velocity = V3_ZERO
			BV.Parent = root

			FLYING = true
			pcall(function() Camera.CameraType = Enum.CameraType.Track end)

			inputBeganConn = UserInputService.InputBegan:Connect(function(input, gpe)
				if gpe then return end -- don't fly on tap tap tap in the chat
				local e = KEYMAP[input.KeyCode]
				if e then CONTROL[e[1]] = e[2] * vehicleflyspeed end
			end)
			inputEndedConn = UserInputService.InputEnded:Connect(function(input)
				local e = KEYMAP[input.KeyCode]
				if e then CONTROL[e[1]] = 0 end
			end)

			flyConn = Heartbeat:Connect(function()
				if not root.Parent then NOFLY(); return end
				local f = CONTROL.F + CONTROL.B
				local s = CONTROL.L + CONTROL.R
				local v = CONTROL.Q + CONTROL.E
				local cam = Camera.CFrame
				if f ~= 0 or s ~= 0 or v ~= 0 then
					BV.Velocity = (cam.LookVector * f + cam:VectorToWorldSpace(V3(s, (f + v) * 0.2, 0))) * 50
				else
					BV.Velocity = V3_ZERO
				end
				BG.CFrame = cam
			end)

			hum.Died:Connect(NOFLY)
		end)
	end

	local vehicleToggle
	vehicleToggle = FlyTab:CreateToggle({
		Name = "Vehicle Fly — ON/OFF",
		CurrentValue = false,
		Flag = "FE_VFLY_Toggle",
		Callback = function(state)
			if state then
				vehicleflyspeed = inputSpeed
				sFLY()
				Rayfield:Notify({ Title = "Vehicle Fly", Content = "ON (speed x" .. tostring(vehicleflyspeed) .. ") — W/A/S/D, Q/E vertical", Duration = 4 })
			else
				NOFLY()
				Rayfield:Notify({ Title = "Vehicle Fly", Content = "OFF", Duration = 3 })
			end
			if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
		end
	})

	FlyTab:CreateInput({
		Name = "Set VFLY Speed (×)",
		PlaceholderText = "e.g., 1, 2.5, 10",
		RemoveTextAfterFocusLost = false,
		NumbersOnly = true,
		OnEnter = true,
		Flag = "FE_VFLY_SpeedInput",
		Callback = function(text)
			local n = tonumber(text)
			if n and n > 0 then
				inputSpeed = n
				Rayfield:Notify({ Title = "VFLY Speed (pending)", Content = "Will apply on next VFLY toggle: x" .. tostring(inputSpeed), Duration = 4 })
				if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
			else
				Rayfield:Notify({ Title = "Error", Content = "Enter a positive number (e.g., 1.5)", Duration = 4 })
			end
		end
	})

	FlyTab:CreateKeybind({
		Name = "Toggle VFLY",
		CurrentKeybind = "Z",
		HoldToInteract = false,
		Flag = "FE_VFLY_Bind",
		Callback = function()
			vehicleToggle:Set(not vehicleToggle.CurrentValue)
			if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
		end
	})

	FlyTab:CreateParagraph({ Title = "Note", Content = "Speed is applied only when VFLY is toggled ON." })
end

--// UI Gui Tab
local GuiTab = Window:CreateTab("GUI", "settings")
GuiTab:CreateSection("Interface")
--// Destroy != Unload all functions, etc. ; I will update it to unload all
GuiTab:CreateButton({
	Name = "Destroy this GUI",
	Callback = function()
		if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
		Rayfield:Destroy()
	end
})

if Rayfield and Rayfield.LoadConfiguration then
	pcall(function() Rayfield:LoadConfiguration() end)
end

--// Events hooks instead of always on scan
local function hookAircraftFolder(folder)
	folder.DescendantAdded:Connect(function(d)
		if d:IsA("Model") and isAircraftModel(d) then
			if not createESP(d) then pendingESP[d] = true end
			scheduleListRefresh()
		end
	end)
	folder.DescendantRemoving:Connect(function(d)
		if d:IsA("Model") then scheduleListRefresh() end
	end)
end

Workspace.ChildAdded:Connect(function(child)
	if child:IsA("Model") and isRocketModel(child) then
		rocketSet[child] = now()
		if not createESP(child) then pendingESP[child] = true end
	elseif child.Name == "Aircrafts" and child:IsA("Folder") then
		hookAircraftFolder(child)
		scheduleListRefresh()
	end
end)

--// First time scan (on script execution)
do
	for _, obj in ipairs(Workspace:GetChildren()) do
		if obj:IsA("Model") and isRocketModel(obj) then
			rocketSet[obj] = now()
			if not createESP(obj) then pendingESP[obj] = true end
		end
	end
	local folder = Workspace:FindFirstChild("Aircrafts")
	if folder then
		hookAircraftFolder(folder)
		for _, d in ipairs(folder:GetDescendants()) do
			if isAircraftModel(d) and not createESP(d) then
				pendingESP[d] = true
			end
		end
	end
end

--// Maintenance loop (1 hz) retry esp uns auto remove old rockets
tspawn(function()
	local tickCount = 0
	while twait(1) do
		tickCount += 1
		local t = now()

		for model, created in pairs(rocketSet) do
			if not model.Parent then
				rocketSet[model] = nil
			elseif t - created >= 120 then
				rocketSet[model] = nil
				pcall(function() model:Destroy() end)
			end
		end

		for model in pairs(pendingESP) do
			if not model.Parent then
				pendingESP[model] = nil
			elseif createESP(model) then
				pendingESP[model] = nil
			end
		end

		if tickCount % 5 == 0 then
			local folder = Workspace:FindFirstChild("Aircrafts")
			if folder then
				for _, d in ipairs(folder:GetDescendants()) do
					if d:IsA("Model") and not espRegistry[d] and isAircraftModel(d) then
						if not createESP(d) then pendingESP[d] = true end
					end
				end
			end
			if AutoUpdateAircraftList then scheduleListRefresh() end
		end
	end
end)

--// Cleanup
local function cleanup()
	autoFollow = false
	infAmmoEnabled = false
	if noclipEnabled then
		local myAircraft = getMyAircraft()
		disableNoclip(myAircraft)
	end
	clearStability()
end

Players.PlayerRemoving:Connect(function(plr)
	if plr == player then cleanup() end
end)

-- ==========================
-- DEV -- > R-77 | 26.07.2026
-- ==========================