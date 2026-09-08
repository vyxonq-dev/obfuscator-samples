-- t.me/arceusxcommunity <3
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

if getgenv and getgenv().SearchPartyHubUnload then
	pcall(getgenv().SearchPartyHubUnload)
end

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/Beta.lua"))()

local netTable, keyTable, varTable
local frameworkOk = pcall(function()
	local MainScript = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("MainScript"))
	netTable = MainScript.Network
	varTable = MainScript.Modules._Variable
	keyTable = varTable.Keys
end)
if not netTable or not keyTable then frameworkOk = false end

local Flags = {
	CrewmateAura = false,
	MoneyAura = false,
	AuraRange = 14,

	KillAura = false,
	KillAuraRange = 12,
	AimSurvivor = false,

	AutoRescue = false,
	StealthReturn = true,
	AutoMoney = false,
	ActionDelay = 0.3,

	KillerESP = true,
	SurvivorESP = false,
	CrewmateESP = true,
	MoneyESP = false,
	ShowDistance = true,
	KillerAlert = true,
	AlertDistance = 60,

	FullBright = false,
	NoFog = false,

	InfiniteStamina = false,
}

local Running = true
local Connections = {}
local EspCache = {}
local LightingBackup = nil
local LastAlert = 0
local LastClaw = 0

local function getChar()
	return LocalPlayer.Character
end
local function getHRP()
	local c = getChar()
	return c and c:FindFirstChild("HumanoidRootPart")
end

local function pickPart(model)
	if not model then return nil end
	return model.PrimaryPart
		or model:FindFirstChild("HumanoidRootPart")
		or model:FindFirstChild("Head")
		or model:FindFirstChild("Torso")
		or model:FindFirstChildWhichIsA("BasePart")
end

local function teleportTo(pos, offset)
	local hrp = getHRP()
	if not hrp then return false end
	hrp.CFrame = CFrame.new(pos + (offset or Vector3.new(0, 0, 3)))
	return true
end

local function nearestCrewmate()
	local hrp = getHRP()
	local folder = workspace:FindFirstChild("Interact")
	if not hrp or not folder then return nil end
	local best, bestDist
	for _, ch in ipairs(folder:GetChildren()) do
		if ch:GetAttribute("InteractType") == "Crewmate" then
			local ok, pivot = pcall(function() return ch:GetPivot().Position end)
			if ok then
				local d = (pivot - hrp.Position).Magnitude
				if not bestDist or d < bestDist then
					bestDist = d
					best = ch
				end
			end
		end
	end
	return best, bestDist
end

local function rescueOne()
	if not frameworkOk then return false end
	local hrp = getHRP()
	if not hrp then return false end
	local crew = nearestCrewmate()
	if not crew then return false end
	local saved = hrp.CFrame
	local ok, pivot = pcall(function() return crew:GetPivot().Position end)
	if not ok then return false end
	hrp.CFrame = CFrame.new(pivot + Vector3.new(0, 0, 4))
	task.wait(0.15)
	pcall(function() netTable[keyTable.InteractFunction]:InvokeServer(crew) end)
	task.wait(0.1)
	if Flags.StealthReturn and getHRP() then
		getHRP().CFrame = saved
	end
	return true
end

local function isMoney(m)
	return m.Name:find("_Money") ~= nil
end

local function isContainer(m)
	return m.Name:find("_Locker") ~= nil or m.Name:find("_Drawer") ~= nil
end

local function closedContainerPrompt(t)
	local pp = t:FindFirstChildWhichIsA("ProximityPrompt", true)
	if pp and pp.Enabled and pp.ActionText == "Open" then
		return pp
	end
	return nil
end

local ContainerCooldown = setmetatable({}, { __mode = "k" })

local function containerReadyPrompt(t)
	local pp = closedContainerPrompt(t)
	if not pp then return nil end
	local last = ContainerCooldown[t]
	if last and (os.clock() - last) < 2.5 then return nil end
	return pp
end

local function fireContainer(t, pp)
	ContainerCooldown[t] = os.clock()
	pcall(function() fireproximityprompt(pp) end)
end

local function teleportMoneyStep()
	local hrp = getHRP()
	if not hrp then return false end
	local best, bestDist, bestPrompt, bestIsContainer
	local function consider(inst, pp, isCont)
		local ok, pos = pcall(function() return inst:GetPivot().Position end)
		if ok then
			local d = (pos - hrp.Position).Magnitude
			if not bestDist or d < bestDist then
				bestDist = d
				best = inst
				bestPrompt = pp
				bestIsContainer = isCont
			end
		end
	end
	local client = workspace:FindFirstChild("Client")
	if client then
		for _, m in ipairs(client:GetChildren()) do
			if isMoney(m) then
				local pp = m:FindFirstChildWhichIsA("ProximityPrompt", true)
				if pp and pp.Enabled then consider(m, pp, false) end
			end
		end
	end
	local towers = workspace:FindFirstChild("Towers")
	if towers then
		for _, t in ipairs(towers:GetChildren()) do
			if isContainer(t) then
				local pp = containerReadyPrompt(t)
				if pp then consider(t, pp, true) end
			end
		end
	end
	if not bestPrompt then return false end
	local saved = hrp.CFrame
	local ok, pos = pcall(function() return best:GetPivot().Position end)
	if not ok then return false end
	hrp.CFrame = CFrame.new(pos + Vector3.new(0, 0, 3))
	task.wait(0.12)
	if bestIsContainer then
		fireContainer(best, bestPrompt)
	else
		pcall(function() fireproximityprompt(bestPrompt) end)
	end
	task.wait(0.06)
	if Flags.StealthReturn and getHRP() then
		getHRP().CFrame = saved
	end
	return true
end

local function auraRescue()
	if not frameworkOk then return end
	local hrp = getHRP()
	local folder = workspace:FindFirstChild("Interact")
	if not hrp or not folder then return end
	for _, ch in ipairs(folder:GetChildren()) do
		if ch:GetAttribute("InteractType") == "Crewmate" then
			local ok, pos = pcall(function() return ch:GetPivot().Position end)
			if ok and (pos - hrp.Position).Magnitude <= Flags.AuraRange then
				pcall(function() netTable[keyTable.InteractFunction]:InvokeServer(ch) end)
			end
		end
	end
end

local function auraMoney()
	local hrp = getHRP()
	if not hrp then return end
	local towers = workspace:FindFirstChild("Towers")
	if towers then
		for _, t in ipairs(towers:GetChildren()) do
			if isContainer(t) then
				local pp = containerReadyPrompt(t)
				if pp then
					local ok, pos = pcall(function() return t:GetPivot().Position end)
					if ok and (pos - hrp.Position).Magnitude <= Flags.AuraRange then
						fireContainer(t, pp)
					end
				end
			end
		end
	end
	local client = workspace:FindFirstChild("Client")
	if client then
		for _, m in ipairs(client:GetChildren()) do
			if isMoney(m) then
				local pp = m:FindFirstChildWhichIsA("ProximityPrompt", true)
				if pp and pp.Enabled then
					local ok, pos = pcall(function() return m:GetPivot().Position end)
					if ok and (pos - hrp.Position).Magnitude <= Flags.AuraRange then
						pcall(function() fireproximityprompt(pp) end)
					end
				end
			end
		end
	end
end

local function isKiller()
	local c = getChar()
	return c ~= nil and c:GetAttribute("Team") == "Killer"
end

local function nearestSurvivor(hrp, maxRange)
	local best, bestDist
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character and p.Character:GetAttribute("Team") == "Survivor" then
			local part = pickPart(p.Character)
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			if part and (not hum or hum.Health > 0) then
				local d = (part.Position - hrp.Position).Magnitude
				if d <= maxRange and (not bestDist or d < bestDist) then
					bestDist = d
					best = part
				end
			end
		end
	end
	return best, bestDist
end

local function faceTarget(hrp, targetPos)
	local origin = hrp.Position
	local flat = Vector3.new(targetPos.X, origin.Y, targetPos.Z)
	if (flat - origin).Magnitude > 0.1 then
		hrp.CFrame = CFrame.lookAt(origin, flat)
	end
end

local function triggerClaw()
	if not varTable or type(varTable.Keybinds) ~= "table" then return false end
	local kb = varTable.Keybinds.M1
	if type(kb) ~= "table" or type(kb.OnDown) ~= "function" then return false end
	pcall(function() kb.OnDown() end)
	if type(kb.OnUp) == "function" then
		task.delay(0.05, function() pcall(function() kb.OnUp() end) end)
	end
	return true
end

local function killerLoop()
	while Running do
		if isKiller() then
			local hrp = getHRP()
			if hrp then
				if Flags.KillAura then
					local part = nearestSurvivor(hrp, Flags.KillAuraRange)
					if part then
						faceTarget(hrp, part.Position)
						if (os.clock() - LastClaw) > 0.35 then
							LastClaw = os.clock()
							triggerClaw()
						end
					end
				elseif Flags.AimSurvivor then
					local part = nearestSurvivor(hrp, 120)
					if part then faceTarget(hrp, part.Position) end
				end
			end
		end
		task.wait(0.1)
	end
end

local function farmLoop()
	while Running do
		if Flags.CrewmateAura then auraRescue() end
		if Flags.MoneyAura then auraMoney() end
		local acted = false
		if Flags.AutoRescue and frameworkOk then
			acted = rescueOne()
		end
		if not acted and Flags.AutoMoney then
			acted = teleportMoneyStep()
		end
		if acted then
			task.wait(Flags.ActionDelay)
		else
			task.wait(0.3)
		end
	end
end

local COLORS = {
	Killer = Color3.fromRGB(255, 45, 45),
	Survivor = Color3.fromRGB(60, 220, 90),
	Crewmate = Color3.fromRGB(0, 200, 255),
	Money = Color3.fromRGB(255, 215, 0),
}

local function makeEsp(model, color, label)
	local part = pickPart(model)
	if not part then return nil end
	local h = Instance.new("Highlight")
	h.FillColor = color
	h.OutlineColor = color
	h.FillTransparency = 0.55
	h.OutlineTransparency = 0
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Adornee = model
	h.Parent = model

	local bb = Instance.new("BillboardGui")
	bb.Name = "SPHudTag"
	bb.Size = UDim2.fromOffset(160, 24)
	bb.StudsOffset = Vector3.new(0, 2.6, 0)
	bb.AlwaysOnTop = true
	bb.MaxDistance = 1000
	bb.Adornee = part
	bb.Parent = part

	local lbl = Instance.new("TextLabel")
	lbl.BackgroundTransparency = 1
	lbl.Size = UDim2.fromScale(1, 1)
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 14
	lbl.TextColor3 = color
	lbl.TextStrokeTransparency = 0.4
	lbl.Text = label
	lbl.Parent = bb

	return { h = h, bb = bb, lbl = lbl, part = part }
end

local function destroyEsp(entry)
	if entry.h then entry.h:Destroy() end
	if entry.bb then entry.bb:Destroy() end
end

local function clearEsp()
	for model, entry in pairs(EspCache) do
		destroyEsp(entry)
		EspCache[model] = nil
	end
end

local function collectTargets()
	local list = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character then
			local team = p.Character:GetAttribute("Team")
			if team == "Killer" and Flags.KillerESP then
				table.insert(list, { model = p.Character, color = COLORS.Killer, name = "KILLER" })
			elseif team == "Survivor" and Flags.SurvivorESP then
				table.insert(list, { model = p.Character, color = COLORS.Survivor, name = p.Name })
			end
		end
	end
	if Flags.CrewmateESP then
		local folder = workspace:FindFirstChild("Interact")
		if folder then
			for _, ch in ipairs(folder:GetChildren()) do
				if ch:GetAttribute("InteractType") == "Crewmate" then
					table.insert(list, { model = ch, color = COLORS.Crewmate, name = "Crewmate" })
				end
			end
		end
	end
	if Flags.MoneyESP then
		local folder = workspace:FindFirstChild("Client")
		if folder then
			for _, m in ipairs(folder:GetChildren()) do
				if isMoney(m) then
					table.insert(list, { model = m, color = COLORS.Money, name = "$" })
				end
			end
		end
	end
	return list
end

local function espLoop()
	while Running do
		local anyEsp = Flags.KillerESP or Flags.SurvivorESP or Flags.CrewmateESP or Flags.MoneyESP
		local seen = {}
		local hrp = getHRP()
		if anyEsp and hrp then
			local targets = collectTargets()
			for _, t in ipairs(targets) do
				seen[t.model] = true
				local entry = EspCache[t.model]
				if not entry or not entry.part or not entry.part.Parent then
					if entry then destroyEsp(entry) end
					entry = makeEsp(t.model, t.color, t.name)
					EspCache[t.model] = entry
				end
				if entry then
					local dist = math.floor((entry.part.Position - hrp.Position).Magnitude)
					if Flags.ShowDistance then
						entry.lbl.Text = t.name .. " [" .. dist .. "m]"
					else
						entry.lbl.Text = t.name
					end
				end
			end
		end
		for model, entry in pairs(EspCache) do
			if not seen[model] then
				destroyEsp(entry)
				EspCache[model] = nil
			end
		end

		if Flags.KillerAlert and hrp then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LocalPlayer and p.Character and p.Character:GetAttribute("Team") == "Killer" then
					local kp = pickPart(p.Character)
					if kp then
						local d = (kp.Position - hrp.Position).Magnitude
						if d <= Flags.AlertDistance and (os.clock() - LastAlert) > 4 then
							LastAlert = os.clock()
							pcall(function()
								Fluent:Notify({
									Title = "Killer Nearby!",
									Content = "The killer is " .. math.floor(d) .. "m away",
									Duration = 2,
								})
							end)
						end
					end
				end
			end
		end

		task.wait(0.2)
	end
end

local function ensureLightingBackup()
	if not LightingBackup then
		LightingBackup = {
			Brightness = Lighting.Brightness,
			ClockTime = Lighting.ClockTime,
			Ambient = Lighting.Ambient,
			OutdoorAmbient = Lighting.OutdoorAmbient,
			FogEnd = Lighting.FogEnd,
			FogStart = Lighting.FogStart,
			ExposureCompensation = Lighting.ExposureCompensation,
		}
	end
end

-- Infinite Stamina -----------------------------------------------------------
-- Stamina/sprint is fully client-side: stored as attribute "LocalStateStaminaTag"
-- on Character.StateMachine in the form "Stat, cur, min, max, flag, persist".
-- Keeping cur == max means it never depletes. Works for survivor AND killer
-- (same system for both roles), so we key off the attribute, not the team.
local STAM_ATTR = "LocalStateStaminaTag"

local function topUpStamina()
	if not Flags.InfiniteStamina then return end
	local char = getChar()
	local folder = char and char:FindFirstChild("StateMachine")
	if not folder then return end
	local raw = folder:GetAttribute(STAM_ATTR)
	if type(raw) ~= "string" then return end
	local p = string.split(raw, ", ")
	if p[1] ~= "Stat" or not p[4] then return end
	local cur, max = tonumber(p[2]), tonumber(p[4])
	if cur and max and cur < max then
		p[2] = p[4] -- current := max, keep every other field untouched
		folder:SetAttribute(STAM_ATTR, table.concat(p, ", "))
	end
end

local function hookStaminaChar(char)
	if not char then return end
	local folder = char:WaitForChild("StateMachine", 10)
	if not folder then return end
	if Connections.StaminaAttr then
		pcall(function() Connections.StaminaAttr:Disconnect() end)
	end
	-- instant revert the moment the game spends stamina
	-- (no recursion: once cur == max, topUpStamina is a no-op)
	Connections.StaminaAttr = folder:GetAttributeChangedSignal(STAM_ATTR):Connect(topUpStamina)
	topUpStamina()
end

Connections.StaminaChar = LocalPlayer.CharacterAdded:Connect(function(char)
	task.spawn(hookStaminaChar, char)
end)
if LocalPlayer.Character then
	task.spawn(hookStaminaChar, LocalPlayer.Character)
end

Connections.Heartbeat = RunService.Heartbeat:Connect(function()
	topUpStamina() -- per-frame safety net (event revert is primary)
	if Flags.FullBright then
		ensureLightingBackup()
		Lighting.Brightness = 2.5
		Lighting.ClockTime = 12
		Lighting.ExposureCompensation = 0.2
		Lighting.Ambient = Color3.fromRGB(150, 150, 150)
		Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
		for _, e in ipairs(Lighting:GetChildren()) do
			if e:IsA("ColorCorrectionEffect") and (e.Name == "ShroudColorCorrection" or e.Name == "ZoneColorCorrection") then
				e.Brightness = 0
				e.Contrast = 0
				e.TintColor = Color3.fromRGB(255, 255, 255)
			elseif e:IsA("BlurEffect") then
				e.Size = 0
			end
		end
	end
	if Flags.NoFog then
		ensureLightingBackup()
		Lighting.FogEnd = 1000000
		Lighting.FogStart = 0
	end
end)

local function restoreLighting()
	if LightingBackup then
		Lighting.Brightness = LightingBackup.Brightness
		Lighting.ClockTime = LightingBackup.ClockTime
		Lighting.Ambient = LightingBackup.Ambient
		Lighting.OutdoorAmbient = LightingBackup.OutdoorAmbient
		Lighting.FogEnd = LightingBackup.FogEnd
		Lighting.FogStart = LightingBackup.FogStart
		Lighting.ExposureCompensation = LightingBackup.ExposureCompensation
		LightingBackup = nil
	end
end

local Window = Fluent:CreateWindow({
	Title = "Search Party",
	SubTitle = "by bac0nh1ckoff",
	Search = true,
	Icon = "tv",
	TabWidth = 150,
	Size = UDim2.fromOffset(500, 400),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightControl,
})

local Minimizer = Fluent:CreateMinimizer({
	Icon = "tv",
	Size = UDim2.fromOffset(46, 46),
	Position = UDim2.new(0, 20, 0, 120),
	Acrylic = false,
	Corner = 12,
	Transparency = 0.2,
	Draggable = true,
	Visible = true,
})

local Tabs = {
	Farm = Window:AddTab({ Title = "Farm", Icon = "target" }),
	Esp = Window:AddTab({ Title = "ESP", Icon = "eye" }),
	Killer = Window:AddTab({ Title = "Killer", Icon = "skull" }),
	Player = Window:AddTab({ Title = "Player", Icon = "cat" }),
	Visual = Window:AddTab({ Title = "Visuals", Icon = "sun" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

Tabs.Farm:AddSection("Aura (no teleport)")

if not frameworkOk then
	Tabs.Farm:AddParagraph({
		Title = "Notice",
		Content = "Game network not detected. Crewmate features are disabled. Rejoin if this persists.",
	})
end

Tabs.Farm:AddToggle("CrewmateAura", { Title = "Crewmate Aura", Description = "Auto rescue crewmates near you", Default = false }):OnChanged(function(v)
	Flags.CrewmateAura = v
end)

Tabs.Farm:AddToggle("MoneyAura", { Title = "Money Aura", Description = "Collect money + open lockers near you", Default = false }):OnChanged(function(v)
	Flags.MoneyAura = v
end)

Tabs.Farm:AddSlider("AuraRange", {
	Title = "Aura Range",
	Description = "Studs around you",
	Default = 14, Min = 6, Max = 40, Rounding = 0,
	Callback = function(v) Flags.AuraRange = v end,
})

Tabs.Farm:AddSection("Auto Farm (teleport)")

Tabs.Farm:AddToggle("AutoRescue", { Title = "Auto Rescue Crewmates", Description = "Teleport to each crewmate and rescue", Default = false }):OnChanged(function(v)
	Flags.AutoRescue = v
end)

Tabs.Farm:AddToggle("StealthReturn", { Title = "Stealth Return", Description = "Return to your spot after every action", Default = true }):OnChanged(function(v)
	Flags.StealthReturn = v
end)

Tabs.Farm:AddSlider("ActionDelay", {
	Title = "Action Delay",
	Description = "Seconds between farm actions",
	Default = 0.3, Min = 0, Max = 1.5, Rounding = 2,
	Callback = function(v) Flags.ActionDelay = v end,
})

Tabs.Farm:AddSection("Collect")

Tabs.Farm:AddToggle("AutoMoney", { Title = "Auto Collect Money", Description = "Also opens closed lockers/drawers", Default = false }):OnChanged(function(v)
	Flags.AutoMoney = v
end)

Tabs.Farm:AddButton({
	Title = "Rescue Nearest Crewmate",
	Description = "One-shot manual rescue",
	Callback = function()
		if not frameworkOk then
			Fluent:Notify({ Title = "Unavailable", Content = "Network not detected", Duration = 3 })
			return
		end
		if not rescueOne() then
			Fluent:Notify({ Title = "No Target", Content = "No crewmate found", Duration = 2 })
		end
	end,
})

Tabs.Farm:AddButton({
	Title = "Teleport To Nearest Crewmate",
	Description = "One-shot manual teleport",
	Callback = function()
		local crew = nearestCrewmate()
		if crew then
			teleportTo(crew:GetPivot().Position, Vector3.new(0, 0, 4))
		else
			Fluent:Notify({ Title = "No Target", Content = "No crewmate found", Duration = 2 })
		end
	end,
})

Tabs.Esp:AddSection("Highlights")

Tabs.Esp:AddToggle("KillerESP", { Title = "Killer ESP", Description = "Red highlight on the killer", Default = true }):OnChanged(function(v)
	Flags.KillerESP = v
end)

Tabs.Esp:AddToggle("SurvivorESP", { Title = "Survivor ESP", Description = "Green highlight on survivors", Default = false }):OnChanged(function(v)
	Flags.SurvivorESP = v
end)

Tabs.Esp:AddToggle("CrewmateESP", { Title = "Crewmate ESP", Description = "Cyan highlight on rescue targets", Default = true }):OnChanged(function(v)
	Flags.CrewmateESP = v
end)

Tabs.Esp:AddToggle("MoneyESP", { Title = "Money ESP", Default = false }):OnChanged(function(v)
	Flags.MoneyESP = v
end)

Tabs.Esp:AddToggle("ShowDistance", { Title = "Show Distance", Default = true }):OnChanged(function(v)
	Flags.ShowDistance = v
end)

Tabs.Esp:AddSection("Alert")

Tabs.Esp:AddToggle("KillerAlert", { Title = "Killer Proximity Alert", Description = "Notify when the killer is close", Default = true }):OnChanged(function(v)
	Flags.KillerAlert = v
end)

Tabs.Esp:AddSlider("AlertDistance", {
	Title = "Alert Distance",
	Default = 60, Min = 20, Max = 150, Rounding = 0,
	Callback = function(v) Flags.AlertDistance = v end,
})

Tabs.Killer:AddSection("Combat")

Tabs.Killer:AddToggle("KillAura", { Title = "Kill Aura", Description = "Auto claw survivors in range", Default = false }):OnChanged(function(v)
	Flags.KillAura = v
end)

Tabs.Killer:AddSlider("KillAuraRange", {
	Title = "Kill Aura Range",
	Description = "Studs (claw reach is short)",
	Default = 12, Min = 6, Max = 30, Rounding = 0,
	Callback = function(v) Flags.KillAuraRange = v end,
})

Tabs.Killer:AddToggle("AimSurvivor", { Title = "Aim At Nearest Survivor", Description = "Face the closest survivor", Default = false }):OnChanged(function(v)
	Flags.AimSurvivor = v
end)

Tabs.Player:AddSection("Stamina")

Tabs.Player:AddToggle("InfiniteStamina", { Title = "Infinite Stamina", Description = "", Default = false }):OnChanged(function(v)
	Flags.InfiniteStamina = v
end)

Tabs.Visual:AddSection("Anti Darkness")

Tabs.Visual:AddToggle("FullBright", { Title = "Full Bright", Description = "See through lights out", Default = false }):OnChanged(function(v)
	Flags.FullBright = v
	if not v then restoreLighting() end
end)

Tabs.Visual:AddToggle("NoFog", { Title = "No Fog", Default = false }):OnChanged(function(v)
	Flags.NoFog = v
	if not v and not Flags.FullBright then restoreLighting() end
end)

Tabs.Settings:AddSection("Interface")

Tabs.Settings:AddParagraph({
	Title = "Auto Save",
	Content = "Your toggles and sliders save automatically and reload every time you run the script.",
})

local function unloadHub()
	Running = false
	for _, c in pairs(Connections) do
		pcall(function() c:Disconnect() end)
	end
	clearEsp()
	restoreLighting()
	pcall(function() Minimizer:Destroy() end)
	pcall(function() Window:Destroy() end)
	if getgenv then getgenv().SearchPartyHubUnload = nil end
end

if getgenv then getgenv().SearchPartyHubUnload = unloadHub end

Tabs.Settings:AddButton({
	Title = "Unload Hub",
	Description = "Disable everything and remove the menu",
	Callback = unloadHub,
})

pcall(function()
	local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:SetFolder("SearchPartyHub")
	InterfaceManager:BuildInterfaceSection(Tabs.Settings)
end)

local CONFIG_PATH = "SearchPartyHub.json"
local PERSIST_KEYS = {
	"CrewmateAura", "MoneyAura", "AuraRange",
	"AutoRescue", "StealthReturn", "AutoMoney", "ActionDelay",
	"KillerESP", "SurvivorESP", "CrewmateESP", "MoneyESP", "ShowDistance", "KillerAlert", "AlertDistance",
	"KillAura", "KillAuraRange", "AimSurvivor",
	"FullBright", "NoFog",
	"InfiniteStamina",
}

local function collectConfig()
	local data = {}
	for _, k in ipairs(PERSIST_KEYS) do
		data[k] = Flags[k]
	end
	return data
end

local function loadConfig()
	local raw
	local ok = pcall(function()
		if isfile and isfile(CONFIG_PATH) then
			raw = readfile(CONFIG_PATH)
		end
	end)
	if not ok or not raw then return end
	local ok2, data = pcall(function() return HttpService:JSONDecode(raw) end)
	if not ok2 or type(data) ~= "table" then return end
	for _, k in ipairs(PERSIST_KEYS) do
		if data[k] ~= nil then
			local opt = Fluent.Options[k]
			if opt and opt.SetValue then
				pcall(function() opt:SetValue(data[k]) end)
			else
				Flags[k] = data[k]
			end
		end
	end
end

local function autoSaveLoop()
	local last
	while Running do
		local ok, enc = pcall(function() return HttpService:JSONEncode(collectConfig()) end)
		if ok and enc ~= last then
			last = enc
			pcall(function() writefile(CONFIG_PATH, enc) end)
		end
		task.wait(1.5)
	end
end

loadConfig()

Window:SelectTab(1)

pcall(function()
	Fluent:Notify({
		Title = "Search Party Hub",
		Content = "Loaded successfully.",
		Duration = 5,
	})
end)

task.spawn(farmLoop)
task.spawn(espLoop)
task.spawn(killerLoop)
task.spawn(autoSaveLoop)
