--------------------------------------------------
-- LOAD ENGINE (rbimgui-2)
--------------------------------------------------
local engine = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"
))()

--------------------------------------------------
-- SERVICES
--------------------------------------------------
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local CoreGui = game:GetService("CoreGui")

local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser") -- Remove This if You Got Kicked by Experience

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local humanoid

local NoFogEnabled = false
local renderConn
local heartbeatConn

--------------------------------------------------
-- STATES
--------------------------------------------------
local WalkSpeedEnabled = false
local InstantInteractEnabled = false
local InfiniteJumpEnabled = false
local AntiAFKEnabled = false
local antiAFKConnection = nil
local wiggleTime = 60 -- tiap 60 detik
local hrp = nil

local NoclipEnabled = false

local DEFAULT_WALKSPEED = 16
local TargetWalkSpeed = DEFAULT_WALKSPEED
local walkSpeedConn

local InvisibleEnabled = false
local invisibleThread
local invisibleLoading = false

local AutoClickerEnabled = false
local AutoClickerLoaded = false

--------------------------------------------------
-- NO FOG
--------------------------------------------------
local Lighting = game:GetService("Lighting")

local tickConn

-- Save defaults
local DEFAULT = {
	FogStart = Lighting.FogStart,
	FogEnd   = Lighting.FogEnd,
	Atmosphere = {},
}

--------------------------------------------------
-- FLY STATES
--------------------------------------------------
local flying = false
local flyConnection = nil

--------------------------------------------------
-- NOCLIP STATES
--------------------------------------------------
local noclipConn
local originalCollisions = {}

--------------------------------------------------
-- RUNTIME & FPS
--------------------------------------------------
local startTime = os.clock()
local fps = 0
local frameCount = 0
local lastFpsUpdate = os.clock()

--------------------------------------------------
-- FLY FUNCTIONS (CLEAN & SAFE)
--------------------------------------------------
local function startFlying()
	if flying then return end
	flying = true

	local character = player.Character
	if not character then return end

	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local gyro = Instance.new("BodyGyro")
	gyro.Name = "FlyGyro"
	gyro.P = 9e4
	gyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	gyro.CFrame = camera.CFrame
	gyro.Parent = hrp

	local velocity = Instance.new("BodyVelocity")
	velocity.Name = "FlyVelocity"
	velocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	velocity.Parent = hrp

	flyConnection = RunService.RenderStepped:Connect(function()
		if not flying then return end

		local moveVec = Vector3.zero
		local camCF = camera.CFrame
		local speed = WalkSpeedEnabled and TargetWalkSpeed or DEFAULT_WALKSPEED

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec += camCF.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec -= camCF.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec -= camCF.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec += camCF.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVec += camCF.UpVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveVec -= camCF.UpVector end

		velocity.Velocity = moveVec.Magnitude > 0 and moveVec.Unit * speed or Vector3.zero
		gyro.CFrame = camCF
	end)
end

local function stopFlying()
	flying = false

	if flyConnection then
		flyConnection:Disconnect()
		flyConnection = nil
	end

	local character = player.Character
	if not character then return end

	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	for _, v in ipairs(hrp:GetChildren()) do
		if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then
			v:Destroy()
		end
	end
end

--------------------------------------------------
-- INVISIBLE (EXTERNAL SCRIPT)
--------------------------------------------------

local INVISIBLE_URL = "https://raw.githubusercontent.com/Kixdev/roblox-invisible-hybrid-script/refs/heads/main/main.lua"

local function enableInvisible()
	if invisibleLoading then return end
	invisibleLoading = true
	InvisibleEnabled = true

	local char = player.Character
	if not char then
		invisibleLoading = false
		return
	end

	char:WaitForChild("HumanoidRootPart", 5)
	task.wait(0.15)

	print("[Invisible] running")

	loadstring(game:HttpGet(INVISIBLE_URL))()

	invisibleLoading = false
end

local function disableInvisible()
	if not InvisibleEnabled then return end
	InvisibleEnabled = false

	if player.Character then
		player.Character:BreakJoints()
	end
end

local AUTO_CLICKER_URL = "https://raw.githubusercontent.com/Kixdev/smart-auto-clicker-roblox/refs/heads/main/main.lua"

--------------------------------------------------
-- AUTO CLICKER (EXTERNAL SCRIPT)
--------------------------------------------------
local function enableAutoClicker()
	if AutoClickerLoaded then
		warn("[AutoClicker] already loaded")
		return
	end

	AutoClickerLoaded = true
	AutoClickerEnabled = true

	print("[AutoClicker] loading external script...")
	task.spawn(function()
		pcall(function()
			loadstring(game:HttpGet(AUTO_CLICKER_URL))()
		end)
	end)
end

--------------------------------------------------
-- WALK SPEED GUARD (ANTI RESET)
--------------------------------------------------
local function applyWalkSpeedGuard()
	if not humanoid then return end

	humanoid.WalkSpeed = TargetWalkSpeed

	if walkSpeedConn then
		walkSpeedConn:Disconnect()
	end

	walkSpeedConn = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if WalkSpeedEnabled and humanoid.WalkSpeed ~= TargetWalkSpeed then
			humanoid.WalkSpeed = TargetWalkSpeed
		end
	end)
end

--------------------------------------------------
-- HUMANOID SETUP (RESPAWN SAFE)
--------------------------------------------------
local function setupHumanoid(char)
	humanoid = char:WaitForChild("Humanoid")
	DEFAULT_WALKSPEED = humanoid.WalkSpeed

	stopFlying()

	if WalkSpeedEnabled then
		task.delay(0.1, applyWalkSpeedGuard)
	end
end

if player.Character then setupHumanoid(player.Character) end
player.CharacterAdded:Connect(setupHumanoid)

--------------------------------------------------
-- VISUAL RESET ON RESPAWN (CRITICAL FIX)
--------------------------------------------------

local function resetVisualEffects()
	-- Restore Lighting fog
	Lighting.FogStart = DEFAULT.FogStart
	Lighting.FogEnd   = DEFAULT.FogEnd

	-- Restore Atmosphere
	for atmo, data in pairs(DEFAULT.Atmosphere) do
		if atmo and atmo.Parent then
			atmo.Density = data.Density
			atmo.Haze    = data.Haze
			atmo.Offset  = data.Offset
		end
	end

	-- Remove / normalize post-processing effects
	for _, v in ipairs(Lighting:GetChildren()) do
		if v:IsA("ColorCorrectionEffect") then
			v.Brightness = 0
			v.Contrast = 0
			v.Saturation = 0
			v.TintColor = Color3.new(1,1,1)
		elseif v:IsA("BlurEffect") then
			v.Size = 0
		elseif v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end

	for _, v in ipairs(camera:GetChildren()) do
		if v:IsA("ColorCorrectionEffect") then
			v.Brightness = 0
			v.Contrast = 0
			v.Saturation = 0
			v.TintColor = Color3.new(1,1,1)
		elseif v:IsA("BlurEffect") then
			v.Size = 0
		elseif v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end
end

player.CharacterAdded:Connect(function(char)
	task.wait(0.25)
	resetVisualEffects()

	if NoFogEnabled then
		task.wait(0.1)
		applyNoFog()
	end

	if InvisibleEnabled then
		task.wait(0.2)
		enableInvisible()
	end
end)

--------------------------------------------------
-- UI WINDOW
--------------------------------------------------
local window = engine.new({
	text = "Movement Utilities by Kixdev",
	size = Vector2.new(350, 335),
})
window.open()

local tab = window.new({ text = "=> Hide All UI : , (Comma)" })

--------------------------------------------------
-- UI THEME (CLIENT SIDE)
--------------------------------------------------
local TARGET_TEXT_SIZE = 20
local TARGET_FONT = Enum.Font.GothamSemibold

local imgui = CoreGui:WaitForChild("imgui2")

local function applyTheme(obj)
	if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
		obj.TextSize = TARGET_TEXT_SIZE
		obj.Font = TARGET_FONT
	end
end

for _, v in ipairs(imgui:GetDescendants()) do
	applyTheme(v)
end
imgui.DescendantAdded:Connect(applyTheme)

--------------------------------------------------
-- MOBILE DRAG FIX (TOUCH)
--------------------------------------------------
do
	local function enableTouchDrag(guiObj)
		if not guiObj or not guiObj:IsA("GuiObject") then return end
		if guiObj:GetAttribute("TouchDragEnabled") then return end
		guiObj:SetAttribute("TouchDragEnabled", true)

		guiObj.Active = true -- important for touch to register

		local dragging = false
		local dragInput = nil
		local dragStart = nil
		local startPos = nil

		local function update(input)
			local delta = input.Position - dragStart
			guiObj.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end

		guiObj.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch then

				dragging = true
				dragStart = input.Position
				startPos = guiObj.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		guiObj.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if dragging and input == dragInput then
				update(input)
			end
		end)
	end

	-- rbimgui-2 biasanya bikin window utama bernama "Main" (ImageLabel) di CoreGui.imgui2
	task.defer(function()
		local cg = CoreGui:FindFirstChild("imgui2")
		if not cg then return end

		local main = nil
		for _, v in ipairs(cg:GetChildren()) do
			if v:IsA("ImageLabel") and v.Name == "Main" then
				main = v
				break
			end
		end

		-- Fallback: cari descendant bernama Main kalau struktur beda
		if not main then
			for _, d in ipairs(cg:GetDescendants()) do
				if d:IsA("ImageLabel") and d.Name == "Main" then
					main = d
					break
				end
			end
		end

		if main then
			enableTouchDrag(main)
		end
	end)
end
--------------------------------------------------
-- END MOBILE DRAG FIX
--------------------------------------------------

--------------------------------------------------
-- UI LABELS
--------------------------------------------------
local runtimeLabel = tab.new("label", { text = "Runtime: 00:00:00" })
local statsLabel = tab.new("label", { text = "FPS: 0 | Ping: 0 ms" })

--------------------------------------------------
-- WALKSPEED
--------------------------------------------------
tab.new("switch", { text = "Enable WalkSpeed" }).event:Connect(function(v)
	WalkSpeedEnabled = v
	if v and humanoid then
		applyWalkSpeedGuard()
	elseif humanoid then
		if walkSpeedConn then walkSpeedConn:Disconnect() end
		humanoid.WalkSpeed = DEFAULT_WALKSPEED
	end
end)

tab.new("slider", {
	text = "Walk Speed",
	min = 16,
	max = 300,
	value = DEFAULT_WALKSPEED,
}).event:Connect(function(v)
	TargetWalkSpeed = v
	if WalkSpeedEnabled and humanoid then
		humanoid.WalkSpeed = v
	end
end)

--------------------------------------------------
-- FLY MODE (CLEAN)
--------------------------------------------------
tab.new("switch", { text = "Fly Mode" }).event:Connect(function(state)
	if state then
		startFlying()
	else
		stopFlying()
	end
end)

--------------------------------------------------
-- OTHER FEATURES
--------------------------------------------------
tab.new("switch", { text = "Instant Interact" }).event:Connect(function(v)
	InstantInteractEnabled = v
end)

tab.new("switch", { text = "Infinite Jump" }).event:Connect(function(v)
	InfiniteJumpEnabled = v
end)

local lastInput = tick()

UserInputService.InputBegan:Connect(function()
	lastInput = tick()
end)

tab.new("switch", { text = "Anti AFK" }).event:Connect(function(v)
	AntiAFKEnabled = v
end)

--------------------------------------------------
-- NOCLIP
--------------------------------------------------
local noclipSwitch = tab.new("switch", { text = "Noclip" })
noclipSwitch.set(false)

noclipSwitch.event:Connect(function(state)
	NoclipEnabled = state

	if state then
		table.clear(originalCollisions)

		for _, part in ipairs(humanoid.Parent:GetDescendants()) do
			if part:IsA("BasePart") then
				originalCollisions[part] = part.CanCollide
				part.CanCollide = false
			end
		end

		noclipConn = RunService.Stepped:Connect(function()
			for _, part in ipairs(humanoid.Parent:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end)
	else
		if noclipConn then noclipConn:Disconnect() end
		for part, canCollide in pairs(originalCollisions) do
			if part and part.Parent then
				part.CanCollide = canCollide
			end
		end
	end
end)

--------------------------------------------------
-- INVISIBLE
--------------------------------------------------
tab.new("switch", { text = "Invicible Character" }).event:Connect(function(state)
	if state then
		enableInvisible()
	else
		disableInvisible()
	end
end)

--------------------------------------------------
-- AUTO CLICKER
--------------------------------------------------
tab.new("switch", { text = "Auto Clicker (Custom Target)" }).event:Connect(function(state)
	if state then
		enableAutoClicker()
	else
		AutoClickerEnabled = false
		warn("[AutoClicker] toggle OFF (script tetap loaded)")
	end
end)

--------------------------------------------------
-- ATMOSPHERE
--------------------------------------------------
local function getAtmospheres()
	local t = {}
	for _, v in ipairs(Lighting:GetChildren()) do
		if v:IsA("Atmosphere") then
			table.insert(t, v)
		end
	end
	return t
end

local function cacheAtmosphere(a)
	if DEFAULT.Atmosphere[a] then return end
	DEFAULT.Atmosphere[a] = {
		Density = a.Density,
		Haze = a.Haze,
	}
end

--------------------------------------------------
-- APPLY / RESTORE (FOG ONLY)
--------------------------------------------------
local function applyNoFog()
	-- Classic fog
	Lighting.FogStart = 1e7
	Lighting.FogEnd   = 1e7 + 1000

	-- Atmosphere haze ONLY
	for _, a in ipairs(getAtmospheres()) do
		cacheAtmosphere(a)
		a.Density = 0
		a.Haze = 0
	end
end

local function restoreFog()
	Lighting.FogStart = DEFAULT.FogStart
	Lighting.FogEnd   = DEFAULT.FogEnd

	for a, d in pairs(DEFAULT.Atmosphere) do
		if a and a.Parent then
			a.Density = d.Density
			a.Haze = d.Haze
		end
	end
end

--------------------------------------------------
-- EVENT HOOKS (SAFE)
--------------------------------------------------
Lighting.ChildAdded:Connect(function(child)
	if NoFogEnabled and child:IsA("Atmosphere") then
		task.delay(0.1, applyNoFog)
	end
end)

Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
	if NoFogEnabled then
		task.delay(0.1, applyNoFog)
	end
end)

--------------------------------------------------
-- SAFETY TICK (SLOW & STABLE)
--------------------------------------------------
local function startTick()
	if tickConn then return end
	tickConn = task.spawn(function()
		while NoFogEnabled do
			applyNoFog()
			task.wait(1.2) -- SLOW = no war
		end
	end)
end

local function stopTick()
	if tickConn then
		task.cancel(tickConn)
		tickConn = nil
	end
end

--------------------------------------------------
-- UI TOGGLE
--------------------------------------------------
tab.new("switch", { text = "No Fog (Bright)" }).event:Connect(function(state)
	NoFogEnabled = state
	if state then
		applyNoFog()
		startTick()
	else
		stopTick()
		restoreFog()
	end
end)


--------------------------------------------------
-- LOGICS
--------------------------------------------------
ProximityPromptService.PromptShown:Connect(function(p)
	if InstantInteractEnabled then p.HoldDuration = 0 end
end)

UserInputService.JumpRequest:Connect(function()
	if InfiniteJumpEnabled and humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

player.Idled:Connect(function()
	if AntiAFKEnabled then
		VirtualUser:Button2Down(Vector2.new(), camera.CFrame)
		task.wait(0.05)
		VirtualUser:Button2Up(Vector2.new(), camera.CFrame)
	end
end)

--------------------------------------------------
-- TIMER, FPS & PING
--------------------------------------------------
RunService.Heartbeat:Connect(function()
	frameCount += 1
	local now = os.clock()

	if now - lastFpsUpdate >= 1 then
		fps = math.floor(frameCount / (now - lastFpsUpdate))
		frameCount = 0
		lastFpsUpdate = now
	end

	local t = math.floor(now - startTime)
	runtimeLabel.setText(string.format("Runtime: %02d:%02d:%02d", t//3600, (t%3600)//60, t%60))

	local ping = math.floor(player:GetNetworkPing() * 1000)
	statsLabel.setText(string.format("FPS: %d | Ping: %d ms", fps, ping))
end)

--------------------------------------------------
-- UI TOGGLE ( , ) [MOVEMENT + INVISIBLE]
--------------------------------------------------
local hidden = false

UserInputService.InputBegan:Connect(function(i, gp)
	if gp then return end
	if i.KeyCode ~= Enum.KeyCode.Comma then return end

	hidden = not hidden

	-- === HIDE MOVEMENT UI (imgui) ===
	if CoreGui:FindFirstChild("imgui2") then
		for _, v in ipairs(CoreGui.imgui2:GetChildren()) do
			if v:IsA("ImageLabel") and v.Name == "Main" then
				v.Visible = not hidden
			end
		end
	end

	-- === HIDE INVICIBLE UI ===
	local pg = player:FindFirstChild("PlayerGui")
	if pg then
		local invisibleUI = pg:FindFirstChild("InvisibleStatusUI")
		if invisibleUI then
			invisibleUI.Enabled = not hidden
		end
	end
end)

print("[Movement UI] Loaded successfully")
