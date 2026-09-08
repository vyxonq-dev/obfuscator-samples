local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local RL = rawget(getfenv(), "STATE")

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local conns = {}
local drawings = {}
local espCache = {}
local running = true
local unloadAll
local WeaponPatch

local function bind(signal, fn)
	local c = signal:Connect(fn)
	table.insert(conns, c)
	return c
end

local function newDraw(class, props)
	local d = Drawing.new(class)
	for k, v in pairs(props) do
		d[k] = v
	end
	table.insert(drawings, d)
	return d
end

cleardrawcache()

local Config = {
	AimEnabled = false,
	AimMode = "Right Mouse (hold)",
	AimPart = "Head",
	AimSelect = "Crosshair",
	AimFOV = 120,
	AimShowFOV = true,
	AimSmooth = 5,
	AimSens = 0.9,
	AimTeamCheck = true,
	AimVisible = true,
	AimMaxDist = 500,

	TrigEnabled = false,
	TrigDelay = 0.05,
	TrigTeamCheck = true,

	EspEnabled = false,
	EspHighlight = true,
	EspFill = true,
	EspName = true,
	EspDist = true,
	EspHealth = true,
	EspTeamCheck = true,
	EspMaxDist = 1200,
	EspVisibleColor = Color3.fromRGB(70, 255, 120),
	EspWallColor = Color3.fromRGB(255, 70, 70),

	WorldFOV = false,
	WorldFOVValue = 90,
	WorldFullbright = false,
	WorldCrosshair = false,
	WorldBhop = false,
	WorldNoFlash = false,

	DrawScale = 1,
}

local function getFolders()
	local chars = Workspace:FindFirstChild("Characters")
	if not chars then
		return {}
	end
	local out = {}
	local t = chars:FindFirstChild("Terrorists")
	local ct = chars:FindFirstChild("Counter-Terrorists")
	if t then
		table.insert(out, t)
	end
	if ct then
		table.insert(out, ct)
	end
	return out
end

local function getHumanoid(model)
	return model:FindFirstChildOfClass("Humanoid")
end

local function isAlive(model)
	local hum = getHumanoid(model)
	return hum ~= nil and hum.Health > 0 and model:FindFirstChild("Head") ~= nil
end

local function iterEnemies(teamCheck)
	local localChar = LocalPlayer.Character
	local localFolder = localChar and localChar.Parent
	local list = {}
	for _, folder in ipairs(getFolders()) do
		for _, model in ipairs(folder:GetChildren()) do
			if model:IsA("Model") and model ~= localChar then
				if not (teamCheck and model.Parent == localFolder) then
					if isAlive(model) then
						table.insert(list, model)
					end
				end
			end
		end
	end
	return list
end

local function isVisible(part, model)
	local origin = Camera.CFrame.Position
	local dir = part.Position - origin
	local rp = RaycastParams.new()
	rp.FilterType = Enum.RaycastFilterType.Exclude
	local ignore = { Camera }
	if LocalPlayer.Character then
		table.insert(ignore, LocalPlayer.Character)
	end
	rp.FilterDescendantsInstances = ignore
	rp.IgnoreWater = true
	local res = Workspace:Raycast(origin, dir, rp)
	if not res then
		return true
	end
	return res.Instance:IsDescendantOf(model)
end

local OVERLAY_NAME = "caruno_overlay"
local overlayGui, fovRing, crossH, crossV

local function buildOverlay()
	local pg = LocalPlayer:FindFirstChild("PlayerGui")
	if not pg then
		return
	end
	local old = pg:FindFirstChild(OVERLAY_NAME)
	if old then
		old:Destroy()
	end
	overlayGui = Instance.new("ScreenGui")
	overlayGui.Name = OVERLAY_NAME
	overlayGui.IgnoreGuiInset = true
	overlayGui.ResetOnSpawn = false
	overlayGui.DisplayOrder = 9999
	overlayGui.Parent = pg

	fovRing = Instance.new("Frame")
	fovRing.AnchorPoint = Vector2.new(0.5, 0.5)
	fovRing.Position = UDim2.fromScale(0.5, 0.5)
	fovRing.Size = UDim2.fromOffset(240, 240)
	fovRing.BackgroundTransparency = 1
	fovRing.Visible = false
	fovRing.Parent = overlayGui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = fovRing
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 1.5
	stroke.Transparency = 0.3
	stroke.Parent = fovRing

	crossH = Instance.new("Frame")
	crossH.AnchorPoint = Vector2.new(0.5, 0.5)
	crossH.Position = UDim2.fromScale(0.5, 0.5)
	crossH.Size = UDim2.fromOffset(16, 2)
	crossH.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
	crossH.BorderSizePixel = 0
	crossH.Visible = false
	crossH.Parent = overlayGui

	crossV = Instance.new("Frame")
	crossV.AnchorPoint = Vector2.new(0.5, 0.5)
	crossV.Position = UDim2.fromScale(0.5, 0.5)
	crossV.Size = UDim2.fromOffset(2, 16)
	crossV.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
	crossV.BorderSizePixel = 0
	crossV.Visible = false
	crossV.Parent = overlayGui
end

local function overlayAlive()
	return overlayGui ~= nil and overlayGui:IsDescendantOf(game) and fovRing ~= nil
end

local ESP_HL = "caruno_esp_hl"
local ESP_TAG = "caruno_esp_tag"

local function destroyEsp(e)
	if e.highlight then
		pcall(function() e.highlight:Destroy() end)
	end
	if e.billboard then
		pcall(function() e.billboard:Destroy() end)
	end
end

local function sweepOldEsp()
	local chars = Workspace:FindFirstChild("Characters")
	if not chars then
		return
	end
	for _, inst in ipairs(chars:GetDescendants()) do
		if inst.Name == ESP_HL or inst.Name == ESP_TAG then
			pcall(function() inst:Destroy() end)
		end
	end
	local pg = LocalPlayer:FindFirstChild("PlayerGui")
	if pg then
		local o = pg:FindFirstChild(OVERLAY_NAME)
		if o then
			pcall(function() o:Destroy() end)
		end
	end
end

local function makeEsp(model, head)
	local k = Camera.ViewportSize.Y / 1080
	local hl = Instance.new("Highlight")
	hl.Name = ESP_HL
	hl.Adornee = model
	hl.FillTransparency = 0.65
	hl.OutlineTransparency = 0
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.Parent = model

	local bb = Instance.new("BillboardGui")
	bb.Name = ESP_TAG
	bb.AlwaysOnTop = true
	bb.LightInfluence = 0
	bb.Size = UDim2.fromOffset(240 * k, 40 * k)
	bb.StudsOffsetWorldSpace = Vector3.new(0, 2.8, 0)
	bb.Parent = head

	local nameL = Instance.new("TextLabel")
	nameL.BackgroundTransparency = 1
	nameL.Size = UDim2.new(1, 0, 0, 20 * k)
	nameL.Position = UDim2.new(0, 0, 0, 0)
	nameL.Font = Enum.Font.GothamBold
	nameL.TextSize = 14 * k
	nameL.TextStrokeTransparency = 0.35
	nameL.TextColor3 = Color3.new(1, 1, 1)
	nameL.Parent = bb

	local infoL = Instance.new("TextLabel")
	infoL.BackgroundTransparency = 1
	infoL.Size = UDim2.new(1, 0, 0, 18 * k)
	infoL.Position = UDim2.new(0, 0, 0, 20 * k)
	infoL.Font = Enum.Font.Gotham
	infoL.TextSize = 12 * k
	infoL.TextStrokeTransparency = 0.4
	infoL.TextColor3 = Color3.new(1, 1, 1)
	infoL.Parent = bb

	return { highlight = hl, billboard = bb, nameL = nameL, infoL = infoL }
end

local function espAlive(e)
	return e.highlight and e.highlight.Parent ~= nil and e.billboard and e.billboard:IsDescendantOf(game)
end

local function updateEsp()
	local present = {}
	if Config.EspEnabled then
		local origin = Camera.CFrame.Position
		for _, model in ipairs(iterEnemies(Config.EspTeamCheck)) do
			local head = model:FindFirstChild("Head")
			local hum = getHumanoid(model)
			if head and hum then
				local dist = (head.Position - origin).Magnitude
				if dist <= Config.EspMaxDist then
					present[model] = true
					local e = espCache[model]
					if not e or not espAlive(e) then
						if e then
							destroyEsp(e)
						end
						e = makeEsp(model, head)
						espCache[model] = e
					end
					local col = isVisible(head, model) and Config.EspVisibleColor or Config.EspWallColor
					local hl = e.highlight
					hl.Enabled = Config.EspHighlight
					hl.FillColor = col
					hl.OutlineColor = col
					hl.FillTransparency = Config.EspFill and 0.65 or 1
					local hpPct = math.clamp(hum.Health / (hum.MaxHealth > 0 and hum.MaxHealth or 100), 0, 1)
					local showName = Config.EspName
					local showInfo = Config.EspHealth or Config.EspDist
					e.billboard.Enabled = showName or showInfo
					e.nameL.Visible = showName
					e.nameL.Text = model.Name
					e.nameL.TextColor3 = col
					e.infoL.Visible = showInfo
					local parts = {}
					if Config.EspDist then
						table.insert(parts, string.format("%dm", math.floor(dist)))
					end
					if Config.EspHealth then
						table.insert(parts, string.format("%dhp", math.floor(hum.Health)))
					end
					e.infoL.Text = table.concat(parts, " | ")
					e.infoL.TextColor3 = Color3.fromRGB(255, 80, 80):Lerp(Color3.fromRGB(80, 255, 90), hpPct)
				end
			end
		end
	end
	for model, e in pairs(espCache) do
		if not present[model] then
			destroyEsp(e)
			espCache[model] = nil
		end
	end
end

local function aimCenter()
	local p = Camera:WorldToViewportPoint(Camera.CFrame.Position + Camera.CFrame.LookVector * 1000)
	return Vector2.new(p.X, p.Y)
end

local function getAimTarget()
	local center = aimCenter()
	local origin = Camera.CFrame.Position
	local best, bestScore
	for _, model in ipairs(iterEnemies(Config.AimTeamCheck)) do
		local part = model:FindFirstChild(Config.AimPart) or model:FindFirstChild("Head")
		local root = model:FindFirstChild("HumanoidRootPart") or part
		if part and root then
			local dist = (root.Position - origin).Magnitude
			if dist <= Config.AimMaxDist then
				local sv = Camera:WorldToViewportPoint(part.Position)
				if sv.Z > 0 then
					local sp = Vector2.new(sv.X, sv.Y)
					local screenDist = (sp - center).Magnitude
					if screenDist <= Config.AimFOV * (Camera.ViewportSize.Y / 1080) then
						local score
						if Config.AimSelect == "Distance" then
							score = dist
						elseif Config.AimSelect == "Low HP" then
							local hum = getHumanoid(model)
							score = hum and hum.Health or 100
						else
							score = screenDist
						end
						if not bestScore or score < bestScore then
							if not Config.AimVisible or isVisible(part, model) then
								bestScore = score
								best = part
							end
						end
					end
				end
			end
		end
	end
	return best
end

local aimHeld = false
local function inputMatches(input)
	local m = Config.AimMode
	if m == "Right Mouse (hold)" then
		return input.UserInputType == Enum.UserInputType.MouseButton2
	elseif m == "Left Mouse (hold)" then
		return input.UserInputType == Enum.UserInputType.MouseButton1
	elseif m == "Key: E" then
		return input.KeyCode == Enum.KeyCode.E
	elseif m == "Key: Q" then
		return input.KeyCode == Enum.KeyCode.Q
	elseif m == "Key: C" then
		return input.KeyCode == Enum.KeyCode.C
	elseif m == "Key: V" then
		return input.KeyCode == Enum.KeyCode.V
	end
	return false
end

bind(UserInputService.InputBegan, function(input)
	if inputMatches(input) then
		aimHeld = true
	end
end)
bind(UserInputService.InputEnded, function(input)
	if inputMatches(input) then
		aimHeld = false
	end
end)

local function aimActive()
	if Config.AimMode == "Always On" then
		return true
	end
	return aimHeld
end

local function fovRadiusPx()
	return Config.AimFOV * (Camera.ViewportSize.Y / 1080)
end

local function updateAim()
	if not overlayAlive() then
		buildOverlay()
	end
	if fovRing then
		local r = fovRadiusPx()
		fovRing.Size = UDim2.fromOffset(r * 2, r * 2)
		fovRing.Visible = Config.AimEnabled and Config.AimShowFOV
	end
	if not Config.AimEnabled or not aimActive() or not isrbxactive() then
		return
	end
	local part = getAimTarget()
	if not part then
		return
	end
	local sv = Camera:WorldToViewportPoint(part.Position)
	local center = aimCenter()
	local dx = sv.X - center.X
	local dy = sv.Y - center.Y
	local vFov = math.rad(Camera.FieldOfView)
	local factor = math.tan(vFov * 0.5) / Camera.ViewportSize.Y * 1400
	local mds = UserInputService.MouseDeltaSensitivity
	if mds <= 0 then
		mds = 1
	end
	local sm = math.max(Config.AimSmooth, 1)
	local gain = factor * Config.AimSens / sm / mds
	mousemoverel(dx * gain, dy * gain)
end

local lastTrig = 0
local function updateTrigger(now)
	if not Config.TrigEnabled or not isrbxactive() then
		return
	end
	if now - lastTrig < Config.TrigDelay then
		return
	end
	local origin = Camera.CFrame.Position
	local dir = Camera.CFrame.LookVector * 1000
	local rp = RaycastParams.new()
	rp.FilterType = Enum.RaycastFilterType.Exclude
	local ignore = { Camera }
	if LocalPlayer.Character then
		table.insert(ignore, LocalPlayer.Character)
	end
	rp.FilterDescendantsInstances = ignore
	local res = Workspace:Raycast(origin, dir, rp)
	if res and res.Instance then
		local model = res.Instance:FindFirstAncestorOfClass("Model")
		if model then
			local folders = getFolders()
			local inTeam = false
			for _, f in ipairs(folders) do
				if model.Parent == f then
					inTeam = true
					break
				end
			end
			if inTeam and isAlive(model) then
				local localFolder = LocalPlayer.Character and LocalPlayer.Character.Parent
				local enemy = model.Parent ~= localFolder
				if (not Config.TrigTeamCheck) or enemy then
					if model ~= LocalPlayer.Character then
						mouse1click()
						lastTrig = now
					end
				end
			end
		end
	end
end

local savedLighting = {
	Brightness = Lighting.Brightness,
	ClockTime = Lighting.ClockTime,
	FogEnd = Lighting.FogEnd,
	Ambient = Lighting.Ambient,
	OutdoorAmbient = Lighting.OutdoorAmbient,
	GlobalShadows = Lighting.GlobalShadows,
}

local function applyWorld()
	if Config.WorldFullbright then
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 1e9
		Lighting.Ambient = Color3.fromRGB(178, 178, 178)
		Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
		Lighting.GlobalShadows = false
	end
	if Config.WorldFOV then
		Camera.FieldOfView = Config.WorldFOVValue
	end
	if crossH and crossV then
		crossH.Visible = Config.WorldCrosshair
		crossV.Visible = Config.WorldCrosshair
	end
end

local function updateNoFlash()
	if not Config.WorldNoFlash then
		return
	end
	local pg = LocalPlayer:FindFirstChild("PlayerGui")
	if pg then
		local sg = pg:FindFirstChild("FlashbangEffect")
		if sg then
			local f = sg:FindFirstChild("FlashOverlay")
			if f then
				f.Visible = false
			end
		end
	end
	local cc = Lighting:FindFirstChild("FlashbangColorCorrection")
	if cc then
		cc.Enabled = false
	end
end

local function updateBhop()
	if not Config.WorldBhop or not isrbxactive() then
		return
	end
	if not UserInputService:IsKeyDown(Enum.KeyCode.Space) then
		return
	end
	local char = LocalPlayer.Character
	if not char then
		return
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then
		return
	end
	local st = hum:GetState()
	if st ~= Enum.HumanoidStateType.Jumping and st ~= Enum.HumanoidStateType.Freefall then
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end

sweepOldEsp()

bind(RunService.RenderStepped, function()
	if not running then
		return
	end
	local ok = pcall(function()
		updateEsp()
		updateAim()
		updateTrigger(os.clock())
		applyWorld()
		updateBhop()
		updateNoFlash()
		if WeaponPatch then
			WeaponPatch.enforce()
		end
	end)
end)

WeaponPatch = {}
do
	local RS = game:GetService("ReplicatedStorage")
	local Bullet, Cam, CrossSettings, Data
	pcall(function()
		local inst = RS.Components.Weapon.Classes.Bullet
		Bullet = require(inst)
	end)
	pcall(function()
		local inst = RS.Controllers.CameraController
		Cam = require(inst)
	end)
	pcall(function()
		CrossSettings = require(RS.Interface.Screens.Gameplay.Middle.Crosshair.Settings)
	end)
	pcall(function()
		Data = require(RS.Controllers.DataController)
	end)
	local origSpread = Bullet and Bullet.getTrueSpread
	local origKick = Cam and Cam.weaponKick
	local origRecoil = Cam and Cam.setWeaponRecoil
	local origFollow = CrossSettings and CrossSettings["Follow Recoil"]
	local noRecoilOn = false
	local liveFollowSaved = nil
	local function liveCrosshairSettings()
		if not Data or not Data.Get then
			return nil
		end
		local ok, t = pcall(Data.Get, LocalPlayer, "Settings.Game.Crosshair")
		if ok and type(t) == "table" then
			return t
		end
		return nil
	end
	local function forceFollowRecoilOff()
		local t = liveCrosshairSettings()
		if t and t["Follow Recoil"] == true then
			if liveFollowSaved == nil then
				liveFollowSaved = true
			end
			t["Follow Recoil"] = false
		end
	end
	local function restoreFollowRecoil()
		if liveFollowSaved ~= nil then
			local t = liveCrosshairSettings()
			if t then
				t["Follow Recoil"] = liveFollowSaved
			end
			liveFollowSaved = nil
		end
	end
	function WeaponPatch.setNoSpread(on)
		if not Bullet or not origSpread then
			return false
		end
		Bullet.getTrueSpread = on and function()
			return 0
		end or origSpread
		return true
	end
	function WeaponPatch.setNoRecoil(on)
		if not Cam or not origKick or not origRecoil then
			return false
		end
		noRecoilOn = on and true or false
		Cam.weaponKick = on and function() end or origKick
		Cam.setWeaponRecoil = on and function() end or origRecoil
		if CrossSettings and origFollow ~= nil then
			if on then
				CrossSettings["Follow Recoil"] = false
			else
				CrossSettings["Follow Recoil"] = origFollow
			end
		end
		if on then
			forceFollowRecoilOff()
		else
			restoreFollowRecoil()
		end
		return true
	end
	function WeaponPatch.enforce()
		if not noRecoilOn then
			return
		end
		if CrossSettings then
			CrossSettings["Follow Recoil"] = false
		end
		forceFollowRecoilOff()
	end
	function WeaponPatch.restore()
		restoreFollowRecoil()
		if Bullet and origSpread then
			Bullet.getTrueSpread = origSpread
		end
		if Cam and origKick then
			Cam.weaponKick = origKick
		end
		if Cam and origRecoil then
			Cam.setWeaponRecoil = origRecoil
		end
		if CrossSettings and origFollow ~= nil then
			CrossSettings["Follow Recoil"] = origFollow
		end
	end
end

local Window = WindUI:CreateWindow({
	Title = "BloxStrike Multi",
	Icon = "crosshair",
	Author = "carunodev",
	Folder = "carunodev_bloxstrike",
	Size = UDim2.fromOffset(580, 440),
	Transparent = true,
	Theme = "Dark",
	Resize = true,
	OpenButton = {
		Title = "BloxStrike",
		Icon = "crosshair",
		CornerRadius = UDim.new(1, 0),
		Enabled = true,
		Draggable = true,
		OnlyMobile = false,
	},
})

pcall(function()
	Window:SetToggleKey(Enum.KeyCode.RightShift)
end)

local AimTab = Window:Tab({ Title = "Aimbot", Icon = "target" })
local TrigTab = Window:Tab({ Title = "Triggerbot", Icon = "zap" })
local EspTab = Window:Tab({ Title = "ESP", Icon = "eye" })
local WorldTab = Window:Tab({ Title = "World", Icon = "globe" })
local SetTab = Window:Tab({ Title = "Settings", Icon = "settings" })

AimTab:Toggle({ Title = "Enabled", Value = false, Callback = function(v) Config.AimEnabled = v end })
AimTab:Dropdown({
	Title = "Activation",
	Values = { "Right Mouse (hold)", "Left Mouse (hold)", "Key: E", "Key: Q", "Key: C", "Key: V", "Always On" },
	Value = "Right Mouse (hold)",
	Callback = function(v) Config.AimMode = v end,
})
AimTab:Dropdown({
	Title = "Target Part",
	Values = { "Head", "UpperTorso", "HumanoidRootPart" },
	Value = "Head",
	Callback = function(v) Config.AimPart = v end,
})
AimTab:Dropdown({
	Title = "Selection",
	Values = { "Crosshair", "Distance", "Low HP" },
	Value = "Crosshair",
	Callback = function(v) Config.AimSelect = v end,
})
AimTab:Slider({ Title = "FOV", Step = 5, Value = { Min = 20, Max = 600, Default = 120 }, Callback = function(v) Config.AimFOV = v end })
AimTab:Slider({ Title = "Smoothness", Step = 1, Value = { Min = 1, Max = 25, Default = 5 }, Callback = function(v) Config.AimSmooth = v end })
AimTab:Slider({ Title = "Sensitivity x100", Step = 5, Value = { Min = 10, Max = 300, Default = 90 }, Callback = function(v) Config.AimSens = v / 100 end })
AimTab:Slider({ Title = "Max Distance", Step = 10, Value = { Min = 50, Max = 1500, Default = 500 }, Callback = function(v) Config.AimMaxDist = v end })
AimTab:Toggle({ Title = "Show FOV Circle", Value = true, Callback = function(v) Config.AimShowFOV = v end })
AimTab:Toggle({ Title = "Team Check", Value = true, Callback = function(v) Config.AimTeamCheck = v end })
AimTab:Toggle({ Title = "Visible Check", Value = true, Callback = function(v) Config.AimVisible = v end })

TrigTab:Toggle({ Title = "Enabled", Value = false, Callback = function(v) Config.TrigEnabled = v end })
TrigTab:Slider({ Title = "Delay (ms)", Step = 10, Value = { Min = 0, Max = 500, Default = 50 }, Callback = function(v) Config.TrigDelay = v / 1000 end })
TrigTab:Toggle({ Title = "Team Check", Value = true, Callback = function(v) Config.TrigTeamCheck = v end })
TrigTab:Paragraph({ Title = "Note", Desc = "Fires when your crosshair is on an enemy. Requires the Roblox window focused." })

EspTab:Toggle({ Title = "Enabled", Value = false, Callback = function(v) Config.EspEnabled = v end })
EspTab:Toggle({ Title = "Highlight (glow on model)", Value = true, Callback = function(v) Config.EspHighlight = v end })
EspTab:Toggle({ Title = "Fill", Value = true, Callback = function(v) Config.EspFill = v end })
EspTab:Toggle({ Title = "Name", Value = true, Callback = function(v) Config.EspName = v end })
EspTab:Toggle({ Title = "Distance", Value = true, Callback = function(v) Config.EspDist = v end })
EspTab:Toggle({ Title = "Health", Value = true, Callback = function(v) Config.EspHealth = v end })
EspTab:Toggle({ Title = "Team Check", Value = true, Callback = function(v) Config.EspTeamCheck = v end })
EspTab:Slider({ Title = "Max Distance", Step = 10, Value = { Min = 50, Max = 2000, Default = 1200 }, Callback = function(v) Config.EspMaxDist = v end })
EspTab:Colorpicker({ Title = "Visible Color", Default = Config.EspVisibleColor, Callback = function(c) Config.EspVisibleColor = c end })
EspTab:Colorpicker({ Title = "Wall Color", Default = Config.EspWallColor, Callback = function(c) Config.EspWallColor = c end })

WorldTab:Toggle({ Title = "Fullbright", Value = false, Callback = function(v)
	Config.WorldFullbright = v
	if not v then
		Lighting.Brightness = savedLighting.Brightness
		Lighting.ClockTime = savedLighting.ClockTime
		Lighting.FogEnd = savedLighting.FogEnd
		Lighting.Ambient = savedLighting.Ambient
		Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
		Lighting.GlobalShadows = savedLighting.GlobalShadows
	end
end })
WorldTab:Toggle({ Title = "Custom FOV", Value = false, Callback = function(v) Config.WorldFOV = v end })
WorldTab:Slider({ Title = "FOV Value", Step = 1, Value = { Min = 40, Max = 120, Default = 90 }, Callback = function(v) Config.WorldFOVValue = v end })
WorldTab:Toggle({ Title = "Crosshair", Value = false, Callback = function(v) Config.WorldCrosshair = v end })
WorldTab:Toggle({ Title = "Auto Bhop (hold Space)", Value = false, Callback = function(v) Config.WorldBhop = v end })
WorldTab:Toggle({ Title = "No Flash (anti-flashbang)", Value = false, Callback = function(v) Config.WorldNoFlash = v end })
WorldTab:Section({ Title = "Weapon (client-side, use at own risk)" })
WorldTab:Toggle({ Title = "No Recoil", Value = false, Callback = function(v)
	local ok = WeaponPatch.setNoRecoil(v)
	if not ok then
		WindUI:Notify({ Title = "No Recoil", Content = "Weapon module not found", Duration = 3 })
	end
end })
WorldTab:Toggle({ Title = "No Spread", Value = false, Callback = function(v)
	local ok = WeaponPatch.setNoSpread(v)
	if not ok then
		WindUI:Notify({ Title = "No Spread", Content = "Bullet module not found", Duration = 3 })
	end
end })
WorldTab:Paragraph({ Title = "Warning", Desc = "No Recoil / No Spread modify client weapon behavior. This game runs a server anti-cheat; enable only if you accept the risk." })

unloadAll = function()
	running = false
	for _, c in ipairs(conns) do
		pcall(function() c:Disconnect() end)
	end
	for _, d in ipairs(drawings) do
		pcall(function() d:Remove() end)
	end
	for _, e in pairs(espCache) do
		destroyEsp(e)
	end
	espCache = {}
	pcall(sweepOldEsp)
	pcall(WeaponPatch.restore)
	Lighting.Brightness = savedLighting.Brightness
	Lighting.ClockTime = savedLighting.ClockTime
	Lighting.FogEnd = savedLighting.FogEnd
	Lighting.Ambient = savedLighting.Ambient
	Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
	Lighting.GlobalShadows = savedLighting.GlobalShadows
	pcall(function() Window:Destroy() end)
	pcall(cleardrawcache)
end

SetTab:Paragraph({ Title = "BloxStrike Multi", Desc = "Client-side only build (ESP + mouse-lock aim). No server remotes touched." })
SetTab:Button({ Title = "Unload", Callback = function()
	unloadAll()
end })

if RL then
	RL.onCleanup(function()
		unloadAll()
	end)
end

WindUI:Notify({ Title = "BloxStrike Multi", Content = "Loaded by carunodev", Duration = 4 })
