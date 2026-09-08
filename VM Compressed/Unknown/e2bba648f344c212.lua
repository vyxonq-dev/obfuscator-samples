

if getgenv().bleach then warn("Bleachhack is already executed") return end
getgenv().bleach = true


loadstring([[
    function LPH_NO_VIRTUALIZE(f) return f end;
]])();

local debris = game:GetService("Debris")
local contentProvider = game:GetService("ContentProvider")
local scriptContext = game:GetService("ScriptContext")
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local statsService = game:GetService("Stats")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local httpService = game:GetService("HttpService")
local starterGui = game:GetService("StarterGui")

local player = players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local values = replicatedStorage:FindFirstChild("Values")

local IS_PRACTICE = game.PlaceId == 8206123457
local IS_SOLARA = string.match(getexecutorname(), "Solara")
local AC_BYPASS = IS_PRACTICE

local moveToUsing = {}

if not values or IS_PRACTICE then
	if replicatedStorage:FindFirstChild("Values") then
		replicatedStorage:FindFirstChild("Values"):Destroy()
	end
	values = Instance.new("Folder")
	local status = Instance.new("StringValue")
	status.Name = "Status"
	status.Value = "InPlay"
	status.Parent = values
	values.Parent = replicatedStorage
	values.Name = "Values"
end

if not LPH_OBFUSCATED then
    getfenv().LPH_NO_VIRTUALIZE = function(f) return f end
  end
  

  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  

  local Handshake = ReplicatedStorage.Remotes.CharacterSoundEvent
  local Hooks = {}
  local HandshakeInts = {}
  
  LPH_NO_VIRTUALIZE(function()
    for i, v in getgc() do
        if typeof(v) == "function" and islclosure(v) then
            if (#getprotos(v) == 1) and table.find(getconstants(getproto(v, 1)), 4000001) then
                hookfunction(v, function() end)
            end
        end
    end
  end)()
  
  Hooks.__namecall = hookmetamethod(game, "__namecall", LPH_NO_VIRTUALIZE(function(self, ...)
    local Method = getnamecallmethod()
    local Args = {...}
  
    if not checkcaller() and (self == Handshake) and (Method == "fireServer") and (string.find(Args[1], "AC")) then
        if (#HandshakeInts == 0) then
            HandshakeInts = {table.unpack(Args[2], 2, 18)}
        else
            for i, v in HandshakeInts do
                Args[2][i + 1] = v
            end
        end
    end
  
    return Hooks.__namecall(self, ...)
  end))
  
  task.wait(1)

if not isfolder("bleachhack") then
	makefolder("bleachhack")
end

local ping = 0
local fps = 0

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/bleachhack-ui-lib/main/zmacsploitsynchrousfix.lua"))()
local UI = Lib:Create()

local configSavingUI = game:GetObjects("rbxassetid://18187656247")[1]:Clone()
configSavingUI.Parent = (gethui and gethui()) or game:GetService("CoreGui")
configSavingUI.Enabled = false

local Catching = UI:CreateCategory("Catching", "")
local Physics = UI:CreateCategory("Physics", "")
local Throwing = UI:CreateCategory("Throwing", "")
local Visuals = UI:CreateCategory("Visuals", "")
local Automatics = UI:CreateCategory("Automatics", "")
local Player = UI:CreateCategory("Player", "")
local Configs = UI:CreateCategory("Configs", "")

function getPing()
	return statsService.PerformanceStats.Ping:GetValue()
end

function getServerPing()
	return statsService.Network.ServerStatsItem['Data Ping']:GetValue()
end

function findClosestBall()
	local lowestDistance = math.huge
	local nearestBall = nil

	local character = player.Character

	for index, ball in pairs(workspace:GetChildren()) do
		if ball.Name ~= "Football" then continue end
		if not ball:IsA("BasePart") then continue end
		if not character:FindFirstChild("HumanoidRootPart") then continue end
		local distance = (ball.Position - character.HumanoidRootPart.Position).Magnitude

		if distance < lowestDistance then
			nearestBall = ball
			lowestDistance = distance
		end
	end

	return nearestBall
end

function beamProjectile(g, v0, x0, t1)
	local c = 0.5*0.5*0.5;
	local p3 = 0.5*g*t1*t1 + v0*t1 + x0;
	local p2 = p3 - (g*t1*t1 + v0*t1)/3;
	local p1 = (c*g*t1*t1 + 0.5*v0*t1 + x0 - c*(x0+p3))/(3*c) - p2;

	local curve0 = (p1 - x0).magnitude;
	local curve1 = (p2 - p3).magnitude;

	local b = (x0 - p3).unit;
	local r1 = (p1 - x0).unit;
	local u1 = r1:Cross(b).unit;
	local r2 = (p2 - p3).unit;
	local u2 = r2:Cross(b).unit;
	b = u1:Cross(r1).unit;

	local cf1 = CFrame.new(
		x0.x, x0.y, x0.z,
		r1.x, u1.x, b.x,
		r1.y, u1.y, b.y,
		r1.z, u1.z, b.z
	)

	local cf2 = CFrame.new(
		p3.x, p3.y, p3.z,
		r2.x, u2.x, b.x,
		r2.y, u2.y, b.y,
		r2.z, u2.z, b.z
	)

	return curve0, -curve1, cf1, cf2;
end

function getNearestPartToPartFromParts(part, parts)
	local lowestDistance = math.huge
	local nearestPart = nil

	for index, p in pairs(parts) do
		local distance = (part.Position - p.Position).Magnitude

		if distance < lowestDistance then
			nearestPart = p
			lowestDistance = distance
		end
	end

	return nearestPart
end

task.spawn(function()
	while true do
		task.wait(0.1)
		ping = ( getPing() + getServerPing() ) / 1000
	end
end)

task.spawn(function()
	runService.RenderStepped:Connect(function()
		fps += 1
		task.delay(1, function()
			fps -= 1
		end)
	end)
end)

--// catching

local fakeBalls = {}
local pullVectoredBalls = {}

local magnets = Catching:CreateModule("Magnets")
local magnetsType = magnets:CreateSwitch({
	Title = "Type",
	Range = {"Blatant", "Legit", "League", "Custom"}
})
local magnetsCustomRadius = magnets:CreateSlider({
	Title = "Custom Radius",
	Range = {0, 70}
})
local showMagHitbox = magnets:CreateToggle({
	Title = "Show Hitbox"
})

firetouchinterest = (IS_SOLARA) and function(part2, part1, state)
	if AC_BYPASS then
		part1.CFrame = part2.CFrame
	else
		state = state == 1
		local fakeBall = fakeBalls[part1]
		if not fakeBall then return end

		local direction = (part2.Position - fakeBall.Position).Unit
		local distance = (part2.Position - fakeBall.Position).Magnitude

		for i = 1,5,1 do
			local percentage = i/5 + Random.new():NextNumber(0.01, 0.02)
			part1.CFrame = fakeBall.CFrame + (direction * distance * percentage)
		end
	end
end or firetouchinterest


local pullVector = Catching:CreateModule("PullVector")
local pullVectorDistance = pullVector:CreateSlider({
	Title = "Distance",
	Range = {0, 100}
})
local pullVectorType = pullVector:CreateSwitch({
	Title = "Type",
	Range = {"Glide", "Teleport"}
})
local pullVectorPower = pullVector:CreateSlider({
	Title = "Power",
	Range = {1, 5}
})

local velocity = {}
local isCatching = false

local part = Instance.new("Part")
part.Transparency = 0.5
part.Anchored = true
part.CanCollide = false
part.CastShadow = false

local function onCharacterCatching(character)
	local arm = character:WaitForChild('Left Arm')

	arm.ChildAdded:Connect(function(child)
		if not child:IsA("Weld") then return end
		isCatching = true
		task.wait(1.7)
		isCatching = false
	end)
end


workspace.ChildAdded:Connect(function(ball)
	if ball.Name ~= "Football" then return end
	if not ball:IsA("BasePart") then return end
	task.wait()

	local lastPosition = ball.Position
	local lastCheck = os.clock()
	local initalVelocity = ball.AssemblyLinearVelocity

	if (IS_SOLARA) and ball:FindFirstChildWhichIsA("Trail") and not ball.Anchored and camera.CameraSubject ~= ball then
		local fakeBall = ball:Clone()
		fakeBall.Name = "FFootball"
		fakeBall.Parent = workspace
		fakeBall.Anchored = true
		fakeBall.CanCollide = false
		fakeBall:FindFirstChildWhichIsA('PointLight'):Destroy()
		ball.Transparency = 1
		local spiralDegrees = 0
		fakeBalls[ball] = fakeBall
		task.spawn(function()
			while ball.Parent == workspace do
				local dt = runService.Heartbeat:Wait()
				spiralDegrees += 1500 * dt
				initalVelocity += Vector3.new(0, -28 * dt, 0)
				fakeBall.Position += initalVelocity * dt
				fakeBall.CFrame = CFrame.lookAt(fakeBall.Position, fakeBall.Position + initalVelocity) * CFrame.Angles(math.rad(90), math.rad(spiralDegrees), 0)

				if ball:FindFirstChildWhichIsA("Trail") then
					ball:FindFirstChildWhichIsA("Trail").Enabled = false
				end	
			end
			fakeBall:Destroy()
		end)
	end

	while ball.Parent do
		task.wait(0.1)

		local t = (os.clock() - lastCheck)
		velocity[ball] = (ball.Position - lastPosition) / t

		lastCheck = os.clock()
		lastPosition = ball.Position
	end
end)

task.spawn(function()
	while true do
		task.wait(1/60)
		local ball = findClosestBall(); if not ball then part.Parent = nil continue end
		local character = player.Character

		if not character then continue end

		local catchPart = getNearestPartToPartFromParts(ball, {character:FindFirstChild("CatchLeft"), character:FindFirstChild("CatchRight")})

		if not catchPart then continue end
		if not velocity[ball] then continue end
		if not magnets.Value then continue end

		--if magnetsType.Value == "League" then
		--	local predictedPosition = (fakeBalls[ball] or ball).Position + (velocity[ball] * ping)
		--	local distance = (catchPart.Position - predictedPosition).Magnitude
		--	local clientDistance = ((fakeBalls[ball] or ball).Position - catchPart.Position).Magnitude

		--	local y1 = predictedPosition.Y
		--	local y2 = catchPart.Position.Y

		--	part.Position = predictedPosition
		--	part.Parent = showMagHitbox.Value and workspace or nil

		--	part.Color = Color3.fromRGB(255, 255, 255)
		--	part.Size = Vector3.new(4, 1, 2)

		--	if (y1 - y2) > 3.5 then continue end
		--	if (distance) > 4 and clientDistance > 6 then continue end
		--	if not isCatching and IS_SOLARA then continue end

		--	part.Color = Color3.fromRGB(255, 0, 0)

		--	firetouchinterest(atchPart, ball, 0)
		--	firetouchinterest(catchPart, ball, 1)
		
		if magnetsType.Value == "LegitV2" then
			magnetsType.Value = "League"
			magnetsType.Update()
		end
		
		if magnetsType.Value == "League" then
			local predictedPosition = (fakeBalls[ball] or ball).Position + (velocity[ball] * ping)
			local distance = (catchPart.Position - predictedPosition).Magnitude
			
			part.Position = predictedPosition
			part.Size = Vector3.new(magnetsCustomRadius.Value, magnetsCustomRadius.Value, magnetsCustomRadius.Value)
			part.Parent = showMagHitbox.Value and workspace or nil
			
			if distance > magnetsCustomRadius.Value then continue end
			
			firetouchinterest(catchPart, ball, 0)
			firetouchinterest(catchPart, ball, 1)
		else
			local distance = (catchPart.Position - ball.Position).Magnitude
			local radius = ((magnetsType.Value == "Custom" and magnetsCustomRadius.Value) or magnetsType.Value == "Blatant" and 50 or 6)
			part.Position = (fakeBalls[ball] or ball).Position
			part.Size = Vector3.new(radius, radius, radius)
			part.Parent = showMagHitbox.Value and workspace or nil
			part.Color = Color3.fromRGB(173, 173, 173)

			if not isCatching and IS_SOLARA then continue end

			if distance < radius then
				firetouchinterest(catchPart, ball, 0)
				firetouchinterest(catchPart, ball, 1)
			end
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()
		local ball = findClosestBall() if not ball then continue end
		local character = player.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if not ball:FindFirstChildWhichIsA("Trail") then continue end
		if not character or not humanoidRootPart then continue end
		if not pullVector.Value then continue end
		if pullVectoredBalls[ball] then continue end
		if ball.Anchored then continue end

		local distance = (humanoidRootPart.Position - ball.Position).Magnitude
		if distance > pullVectorDistance.Value then continue end

		local direction = (ball.Position - humanoidRootPart.Position).Unit

		if pullVectorType.Value == "Teleport" then
			pullVectoredBalls[ball] = true
			local distance = 10 + ((pullVectorPower.Value - 1) * 5)
			humanoidRootPart.CFrame += direction * distance
		else
			humanoidRootPart.AssemblyLinearVelocity = direction * pullVectorPower.Value * 25
		end
	end
end)

onCharacterCatching(player.Character)
player.CharacterAdded:Connect(onCharacterCatching)

--// physics

local quickTP = Physics:CreateModule("QuickTP")
local quickTPSpeed = quickTP:CreateSlider({
	Title = "Speed",
	Range = {1, 5}
})
local quickTPBind = quickTP:CreateKeybind({
	Title = "Keybind",
	Value = Enum.KeyCode.F
})

local clickTackleAimbot = Physics:CreateModule("ClickTackleAimbot")
local clickTackleAimbotDistance = clickTackleAimbot:CreateSlider({
	Title = "Distance",
	Range = {0, 15}
})

local antiJam = Physics:CreateModule("AntiJam")
local antiBlock = Physics:CreateModule("AntiBlock")

local visualiseBallPath = Physics:CreateModule("VisualiseBallPath")
local noJumpCooldown = Physics:CreateModule("NoJumpCooldown")
local noFreeze = Physics:CreateModule("NoFreeze") 
local optimalJumpPredictions = Physics:CreateModule("OptimalJump")
local noBallTrail = Physics:CreateModule("NoBallTrail")

local bigHead = Physics:CreateModule("BigHead")
local bigHeadSize = bigHead:CreateSlider({
	Title = "Size",
	Range = {1, 5}
})

local optimalJumpType = optimalJumpPredictions:CreateSwitch({
	Title = "Type",
	Range = {"Jump", "Dive"},
	Value = "Jump"
})

local function findPossessor()
	for index, player in pairs(players:GetPlayers()) do
		local character = player.Character; if not character then continue end
		if not character:FindFirstChildWhichIsA("Tool") then continue end
		return player.Character
	end
end

local boundaries = {}

if not IS_PRACTICE then
	for index, part in pairs(workspace.Models.Boundaries:GetChildren()) do
		boundaries[#boundaries + 1] = part
	end
end

local antiOOB; antiOOB = Physics:CreateModule("AntiOOB", nil, function(v)
	v = antiOOB.Value
	for index, boundary in pairs(boundaries) do
		boundary.Parent = not v and workspace.Models.Boundaries or nil
	end
end)

if AC_BYPASS then
	local CFrameSpeed = Physics:CreateModule("CFrameSpeed")
	local CFrameSpeedValue = CFrameSpeed:CreateSlider({
		Title = "Speed",
		Range = {0, 10}
	})

	task.spawn(function()
		while true do task.wait();
			if not CFrameSpeed.Value then continue end
			
			local character = player.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChild("Humanoid")

			if not humanoidRootPart or not humanoid then continue end

			local moveDirection = ((os.clock() - (moveToUsing[#moveToUsing] or 0)) < 0.5 and (humanoid.WalkToPoint - character.HumanoidRootPart.Position).Unit) or (humanoid.MoveDirection)

			humanoidRootPart.CFrame += moveDirection * (CFrameSpeedValue.Value / 58.5)
		end
	end)
end

if firetouchinterest and not IS_SOLARA then
	local tackleExtender = Physics:CreateModule("TackleExtender")
	local tackleExtenderRadius = tackleExtender:CreateSlider({
		Title = "Radius",
		Range = {0, 10}
	})
	
	task.spawn(function()
		while true do
			task.wait()
			
			local possessor = findPossessor()
			local character = player.Character
			local hrp = character and character:FindFirstChild("HumanoidRootPart")
			
			if not hrp then continue end
			if not possessor then continue end
			
			local distance = (hrp.Position - possessor.HumanoidRootPart.Position).Magnitude
			
			if distance > tackleExtenderRadius.Value then continue end
			
			for index, part in pairs(possessor:GetChildren()) do
				if not part:IsA("BasePart") then continue end
				if not character:FindFirstChild(part.Name) then continue end
				firetouchinterest(character:FindFirstChild(part.Name), part, 0)
				firetouchinterest(character:FindFirstChild(part.Name), part, 1)
			end
		end
	end)
end

if AC_BYPASS then
	local blockExtender = Physics:CreateModule("BlockExtender")
	local blockExtenderRange = blockExtender:CreateSlider({Title = "Range", Range = {1, 20}})
	local blockExtenderRangeTransparency = blockExtender:CreateSlider({Title = "Transparency", Range = {0, 1}, Value = 1})
	
	local flying = false
	local flySpeed = 1
	
	local fly; fly = Physics:CreateModule("Fly", nil, function(v)
		v = fly.Value
		flying = v
		
		if v then
			player.Character.Humanoid.PlatformStand = true
			local bodyVelocity = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
			local camera = workspace.CurrentCamera
			bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bodyVelocity.Velocity = Vector3.new(0, 0, 0)
			local bodyGyro = Instance.new("BodyGyro", player.Character.HumanoidRootPart)
			bodyGyro.P = 15000
			bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			while flying do
				runService.Stepped:wait()
				local speed = 11 + (flySpeed * 2.5)
				local endPos = camera.CFrame.Position + camera.CFrame.LookVector * 500
				bodyGyro.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position, endPos)
				local velocity = Vector3.new(0, 0, 0)
				if not userInputService:GetFocusedTextBox() then
					if userInputService:IsKeyDown(Enum.KeyCode.W) then
						velocity += camera.CFrame.LookVector * speed
					end
					if userInputService:IsKeyDown(Enum.KeyCode.S) then
						velocity += camera.CFrame.LookVector * -speed
					end
					if userInputService:IsKeyDown(Enum.KeyCode.A) then
						velocity += player.Character.HumanoidRootPart.CFrame:vectorToWorldSpace(Vector3.new(-speed, 0, 0))
					end
					if userInputService:IsKeyDown(Enum.KeyCode.D) then
						velocity += player.Character.HumanoidRootPart.CFrame:vectorToWorldSpace(Vector3.new(speed, 0, 0))
					end
				end
				if player.Character.Humanoid.Health <= 0 then
					flying = false
				end
				bodyVelocity.Velocity = velocity
			end
			player.Character.Humanoid.PlatformStand = false
			bodyGyro:Destroy()
			bodyVelocity:Destroy()
		end
	end)
	
	local flySpeed = fly:CreateSlider({
		Title = "Speed",
		Range = {1, IS_PRACTICE and 20 or 5},
		Callback = function(v)
			flySpeed = v
		end,
	})
	
	task.spawn(function()
		while true do
			task.wait()
			
			local character = player.Character
			local blockPart = character and character:FindFirstChild("BlockPart")
		
			if not blockPart then continue end
			
			blockPart.Size = blockExtender.Value and Vector3.new(blockExtenderRange.Value, blockExtenderRange.Value, blockExtenderRange.Value) or Vector3.new(0.75, 5, 1.5)
			blockPart.Transparency = blockExtender.Value and blockExtenderRangeTransparency.Value or 1
		end
	end)	
end

local function onCharacterPhysics(char)
	local humanoid = char:WaitForChild("Humanoid")
	
	char.DescendantAdded:Connect(function(v)
		task.wait()
		if v.Name:match("FFmover") and antiBlock.Value then
			v:Destroy()
		end
	end)

	task.spawn(function()
		while true do
			task.wait()
			if noJumpCooldown.Value then
				humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			end

			local torso = char:FindFirstChild("Torso")
			local head = char:FindFirstChild("Head")

			if not torso or not head then return end

			if humanoid:GetState() == Enum.HumanoidStateType.Running and values.Status.Value == "InPlay" then
				torso.CanCollide = not antiJam.Value
				head.CanCollide = not antiJam.Value
			else
				torso.CanCollide = true
				head.CanCollide = true
			end
		end
	end)
end

task.spawn(function()
	local function applyChanges(character)
		local head = character and character:FindFirstChild("Head")
		local mesh = head and head:FindFirstChildWhichIsA("SpecialMesh")

		if not mesh then return end

		mesh.MeshType = bigHead.Value and Enum.MeshType.Sphere or Enum.MeshType.Head
		head.Size = bigHead.Value and Vector3.new(bigHeadSize.Value, 1, bigHeadSize.Value) or Vector3.new(2, 1, 1)
	end
	
	while true do
		task.wait()
		
		for index, player in pairs(players:GetPlayers()) do
			if player == players.LocalPlayer then continue end
			applyChanges(player.Character)
		end
	end
end)

workspace.ChildAdded:Connect(function(ball)
	task.wait()
	if ball.Name ~= "Football" then return end
	if not ball:IsA("BasePart") then return end

	if noBallTrail.Value and ball:FindFirstChildWhichIsA("Trail") then
		ball:FindFirstChildWhichIsA("Trail").Enabled = false
	end

	task.spawn(function()
		if not optimalJumpPredictions.Value then return end
		local initalVelocity = ball.AssemblyLinearVelocity
		local optimalPosition = Vector3.zero

		local currentPosition = ball.Position

		local t = 0

		while true do
			t += 0.05
			initalVelocity += Vector3.new(0, -28 * 0.05, 0)
			currentPosition += initalVelocity * 0.05
			local raycastParams = RaycastParams.new()
			raycastParams.FilterDescendantsInstances = {workspace:FindFirstChild("Models")}
			raycastParams.FilterType = Enum.RaycastFilterType.Include

			local ray = workspace:Raycast(currentPosition, Vector3.new(0, optimalJumpType.Value == "Jump" and -13 or -15, 0), raycastParams)
			local antiCrashRay = workspace:Raycast(currentPosition, Vector3.new(0, -500, 0), raycastParams)

			if ray and t > 0.75 then
				optimalPosition = ray.Position + Vector3.new(0, 2, 0)
				break
			end

			if not antiCrashRay then
				optimalPosition = currentPosition
				break
			end
		end

		local part = Instance.new("Part")
		part.Anchored = true
		part.Material = Enum.Material.Neon
		part.Size = Vector3.new(1.5, 1.5, 1.5)
		part.Position = optimalPosition
		part.CanCollide = false
		part.Parent = workspace

		repeat task.wait() until ball.Parent ~= workspace

		part:Destroy()
	end)

	task.spawn(function()
		if not visualiseBallPath.Value then return end
		local initalVelocity = ball.AssemblyLinearVelocity
		local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
		a0.Parent = workspace.Terrain; a1.Parent = workspace.Terrain

		local beam = Instance.new("Beam", workspace.Terrain)
		beam.Attachment0 = a0
		beam.Attachment1 = a1
		beam.Segments = 500
		beam.Width0 = 0.5
		beam.Width1 = 0.5
		beam.Transparency = NumberSequence.new(0)
		beam.Color = ColorSequence.new(Color3.fromHex("#FF8EA5"))

		local g = Vector3.new(0, -28 ,0)
		local x0 = ball.Position
		local v0 = initalVelocity

		local curve0, curve1, cf1, cf2 = beamProjectile(g, v0, x0, 5)

		beam.CurveSize0 = curve0
		beam.CurveSize1 = curve1
		a0.CFrame = a0.Parent.CFrame:inverse() * cf1
		a1.CFrame = a1.Parent.CFrame:inverse() * cf2

		repeat task.wait() until ball.Parent ~= workspace

		beam:Destroy()
	end)
end)

local quickTPCooldown = os.clock()

userInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode ~= quickTPBind.Value then return end

	local character = player.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	local humanoid = character and character:FindFirstChild("Humanoid")

	if not quickTP.Value then return end
	if not character or not humanoidRootPart or not humanoid then return end
	if (os.clock() - quickTPCooldown) < 0.1 then return end

	local speed = 2 + (quickTPSpeed.Value / 4)

	humanoidRootPart.CFrame += humanoid.MoveDirection * speed
	quickTPCooldown = os.clock()
end)

mouse.Button1Down:Connect(function()
	if not clickTackleAimbot.Value then return end

	local possessor = findPossessor()
	local character = player.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

	if not character or not humanoidRootPart then return end
	if not possessor then return end

	local distance = (possessor.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude
	if distance > clickTackleAimbotDistance.Value then return end

	humanoidRootPart.CFrame = possessor.HumanoidRootPart.CFrame
end)

onCharacterPhysics(player.Character)
player.CharacterAdded:Connect(onCharacterPhysics)

--// throwing

local QBAimbot = Throwing:CreateModule("QBAimbot")
local QBAimbotUI = QBAimbot:CreateToggle({Title = "UI", Value = true})
local QBAimbotVisualise = QBAimbot:CreateToggle({Title = "Visualise", Value = true})
local QBAimbotAutoAngle = QBAimbot:CreateToggle({Title = "AutoAngle"})
local QBAimbotAutoThrowType = QBAimbot:CreateToggle({Title = "AutoThrowType"})
local QBAimbot95PowerOnly = QBAimbot:CreateToggle({Title = "95PowerOnly"})
local QBAimbotAntiOOB = QBAimbot:CreateToggle({Title = "AntiOOB"})
local QBAimbotAntiOOBThreshold = QBAimbot:CreateSlider({Title = "Anti OOB Threshold", Range = {-10, 10}, Value = 0})
local QBAimbotXOffset = QBAimbot:CreateSlider({Title = "X Offset", Range = {-5, 5}, Value = 0})
local QBAimbotYOffset = QBAimbot:CreateSlider({Title = "Y Offset", Range = {-5, 5}, Value = 0})
local QBAimbotDimeKeybind = QBAimbot:CreateKeybind({Title = "Dime Bind", Value = Enum.KeyCode.One})
local QBAimbotJumpKeybind = QBAimbot:CreateKeybind({Title = "Jump Bind", Value = Enum.KeyCode.Two})
local QBAimbotBulletKeybind = QBAimbot:CreateKeybind({Title = "Bullet Bind", Value = Enum.KeyCode.Three})
local QBAimbotDiveKeybind = QBAimbot:CreateKeybind({Title = "Dive Bind", Value = Enum.KeyCode.Four})
local QBAimbotMagKeybind = QBAimbot:CreateKeybind({Title = "Mag Bind", Value = Enum.KeyCode.Five})
local QBAimbotExperimental = QBAimbot:CreateToggle({Title = "Experimental", Value = true})
local QBAimbotAdjustPowerGUI = QBAimbot:CreateToggle({Title = "AdjustPowerGUI"})

local trajectory = Throwing:CreateModule("Trajectory")
local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
a0.Parent = workspace.Terrain; a1.Parent = workspace.Terrain

local beam = Instance.new("Beam", workspace.Terrain)
beam.Attachment0 = a0
beam.Attachment1 = a1
beam.Segments = 500
beam.Width0 = 0.5
beam.Width1 = 0.5
beam.Transparency = NumberSequence.new(0)
beam.Color = ColorSequence.new(Color3.fromHex("#EBAFCC"))

local function findTarget(opp)
	local cc = workspace.CurrentCamera
	local target = nil
	local dist = math.huge

	local targets = {}

	for index, player in pairs(players:GetPlayers()) do
		if not opp then
			if players.LocalPlayer.Team and (players.LocalPlayer.Team ~= player.Team) then continue end
		else
			if players.LocalPlayer.Team and (players.LocalPlayer.Team == player.Team) then continue end
		end
		targets[#targets + 1] = player.Character
	end

	if IS_PRACTICE then
		targets[#targets + 1] = workspace.npcwr.a['bot 1']
		targets[#targets + 1] = workspace.npcwr.a['bot 2']
		targets[#targets + 1] = workspace.npcwr.b['bot 3']
		targets[#targets + 1] = workspace.npcwr.b['bot 4']
	end

	for i,v in pairs(targets) do
		local screenpoint,onscreen = cc:WorldToViewportPoint(v.HumanoidRootPart.Position)
		local check = (Vector2.new(userInputService:GetMouseLocation().X,userInputService:GetMouseLocation().Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
		if check < dist then
			target = v
			dist = check
		end
	end

	return target
end

task.spawn(function()
	while true do
		task.wait()
		local ballGui = player.PlayerGui:FindFirstChild("BallGui")
		local character = player.Character

		local head = character and character:FindFirstChild("Head")

		if not character or not head then continue end
		if not ballGui then beam.Parent = nil continue end
		if not trajectory.Value then beam.Parent = nil continue end

		beam.Parent = workspace.Terrain

		local power = tonumber(ballGui:FindFirstChild("Disp", true).Text)
		local direction = (mouse.Hit.Position - camera.CFrame.Position).Unit

		local origin = head.Position + direction * 5
		local curve0, curve1, cf1, cf2 = beamProjectile(Vector3.new(0, -28, 0), power * direction, origin, 10);

		beam.CurveSize0 = curve0
		beam.CurveSize1 = curve1

		a0.CFrame = a0.Parent.CFrame:inverse() * cf1
		a1.CFrame = a1.Parent.CFrame:inverse() * cf2
	end
end)

task.spawn(function()
	local target = nil
	local power = 65
	local direction = Vector3.new(0, 1, 0)
	local angle = 45
	local locked = false
	
	local firedRemoteEvent = false

	local within = table.find

	local throwType = "Dive"
	local nonVisualThrowType = nil
	
	local throwTypesSwitch = {
		["Dive"] = "Mag",
		["Mag"] = "Bullet",
		["Bullet"] = "Jump",
		["Jump"] = "Dime",
		["Dime"] = "Dive"
	}
	
	local moveDirection = {}

	local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
	a0.Parent = workspace.Terrain; a1.Parent = workspace.Terrain

	local beam = Instance.new("Beam", workspace.Terrain)
	beam.Attachment0 = a0
	beam.Attachment1 = a1
	beam.Segments = 500
	beam.Width0 = 0.5
	beam.Width1 = 0.5
	beam.Transparency = NumberSequence.new(0)
	beam.Color = ColorSequence.new(Color3.fromHex("#EBAFCC"))

	local cards = game:GetObjects("rbxassetid://18241514541")[1]:Clone()
	cards.Parent = (gethui and gethui()) or game:GetService("CoreGui")
	cards.Enabled = false

	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.fromHex("#6a64a2")
	highlight.Parent = replicatedStorage
	
	local part = Instance.new("Part")
	part.Parent = workspace
	part.Anchored = true
	part.CanCollide = false
	
	local inbPart = Instance.new("Part")
	inbPart.CanCollide = false
	inbPart.Anchored = true
	inbPart.Transparency = 1
	inbPart.Position = IS_PRACTICE and Vector3.new(245, 40.55, 0) or Vector3.new(0, 40.55, 0)
	inbPart.Size = Vector3.new(161, 75, 360)
	inbPart.Parent = workspace

	local keys = {
		R = function()
			angle = math.clamp(angle + 5, 5, 85)
		end,
		F = function()
			angle = math.clamp(angle - 5, 5, 85)
		end,
		Q = function()
			locked = not locked
		end,
		Z = function()
			throwType = throwTypesSwitch[throwType]
		end,
	}

	local sidewayRoutes = {"in/out", "flat"}
	local inAirAdditiveRoutes = {"stationary", "curl/comeback"}

	local offsets = {
		Dive = {
			xLead = 3,
			yLead = 4.5,
			routes = {
				["go"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["post/corner"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["slant"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["in/out"] = {
					xzOffset = -1,
					yOffset = -2
				},
				["flat"] = {
					xzOffset = 0,
					yOffset = -2
				},
				["curl/comeback"] = {
					xzOffset = 4,
					yOffset = 0
				},
				["stationary"] = {
					xzOffset = 0,
					yOffset = 0
				}
			}
		},
		Mag = {
			xLead = 3,
			yLead = 6,
			routes = {
				["go"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["post/corner"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["slant"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["in/out"] = {
					xzOffset = -1,
					yOffset = -2
				},
				["flat"] = {
					xzOffset = 0,
					yOffset = -2
				},
				["curl/comeback"] = {
					xzOffset = 6,
					yOffset = 0
				},
				["stationary"] = {
					xzOffset = 0,
					yOffset = 0
				}
			}
		},
		Jump = {
			xLead = 2,
			yLead = 3,
			routes = {
				["go"] = {
					xzOffset = 0,
					yOffset = -1.5
				},
				["post/corner"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["slant"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["in/out"] = {
					xzOffset = -1,
					yOffset = 3
				},
				["flat"] = {
					xzOffset = 0,
					yOffset = 3
				},
				["curl/comeback"] = {
					xzOffset = 2,
					yOffset = 4
				},
				["stationary"] = {
					xzOffset = 0,
					yOffset = 7.5
				}
			}
		},
		Dime = {
			xLead = 2,
			routes = {
				["go"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["post/corner"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["slant"] = {
					xzOffset = 0,
					yOffset = 0
				},
				["in/out"] = {
					xzOffset = -1,
					yOffset = -1
				},
				["flat"] = {
					xzOffset = 0,
					yOffset = -1
				},
				["curl/comeback"] = {
					xzOffset = 2,
					yOffset = 0
				},
				["stationary"] = {
					xzOffset = 0,
					yOffset = 0
				}
			}
		},
	}

	--// hooking

	if not (AC_BYPASS and not IS_PRACTICE) then
		local lastQBAimbotValue = false
		local remoteEvents = {}

		local handoffToggle = false

		local function onToggle()
			local character = player.Character
			local football = character:FindFirstChildWhichIsA("Tool")

			if football then
				if not remoteEvents[football] then
					remoteEvents[football] = football.Handle:FindFirstChildWhichIsA("RemoteEvent")
				end

				local coreScript = football.Handle:FindFirstChildWhichIsA("LocalScript")

				if not coreScript then return end

				coreScript.Enabled = false

				if QBAimbot.Value then
					local fakeRemoteEvent = Instance.new("BoolValue")
					fakeRemoteEvent.Name = "RemoteEvent"
					fakeRemoteEvent.Parent = football.Handle

					remoteEvents[football].Parent = replicatedStorage
				else
					if football.Handle:FindFirstChildWhichIsA("BoolValue") then
						football.Handle:FindFirstChildWhichIsA("BoolValue"):Destroy()
					end

					remoteEvents[football].Parent = football.Handle
				end

				coreScript.Enabled = true
			end
		end

		local function onCharacter(char)
			char.ChildAdded:Connect(function(tool)
				task.wait(); if not tool:IsA("Tool") then return end
				onToggle()
			end)
		end

		onCharacter(player.Character)
		player.CharacterAdded:Connect(onCharacter)

		scriptContext.Error:Connect(function(message, stackTrace)
			if not string.match(message, "Football") then return end

			local nwArgs = {"Clicked", player.Character.Head.Position, player.Character.Head.Position + direction * 10000, (IS_PRACTICE and power) or 95, power}

			if string.match(message, "ContextActionService") or string.match(stackTrace, "function ho") then
				handoffToggle = not handoffToggle
				nwArgs = {"x "..(handoffToggle and "down" or "up")}
			end

			local football = player.Character:FindFirstChildWhichIsA("Tool")
			local remoteEvent = remoteEvents[football]

			local function getAngle(from, vel)
				local cf = CFrame.lookAt(from, from + vel)
				local p = Instance.new("Part")
				p.CFrame = cf
				p:Destroy()

				return p.Orientation.X
			end
			
			firedRemoteEvent = true
			remoteEvent:FireServer(unpack(nwArgs))
		end)

		task.spawn(function()
			while true do
				task.wait()
				if lastQBAimbotValue ~= QBAimbot.Value then
					onToggle()
				end

				lastQBAimbotValue = QBAimbot.Value
			end
		end)
	else
		local __namecall; __namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
			local args = {...}
			local method = getnamecallmethod()
			
			if args[1] == "Clicked" and QBAimbot.Value and not checkcaller() then
				local nwArgs = {"Clicked", player.Character.Head.Position, player.Character.Head.Position + direction * 10000, (IS_PRACTICE and power) or args[4], power}
				firedRemoteEvent = true
				return __namecall(self, unpack(nwArgs))
			end
			
			return __namecall(self, ...)
		end))
	end
	
	--// input handling

	userInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if not keys[input.KeyCode.Name] then return end

		keys[input.KeyCode.Name]()
	end)
	
	userInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		
		if QBAimbotDimeKeybind.Value == input.KeyCode then
			throwType = "Dime"
		end
		
		if QBAimbotJumpKeybind.Value == input.KeyCode then
			throwType = "Jump"
		end
		
		if QBAimbotDiveKeybind.Value == input.KeyCode then
			throwType = "Dive"
		end
		
		if QBAimbotMagKeybind.Value == input.KeyCode then
			throwType = "Mag"
		end
		
		if QBAimbotBulletKeybind.Value == input.KeyCode then
			throwType = "Bullet"
		end
	end)

	--// functions

	local function getTimeForHeight(from, to, height)
		local g = Vector3.new(0, -28, 0)
		local conversionFactor = 4
		local xMeters = height * conversionFactor

		local a = 0.5 * g.Y
		local b = to.Y - from.Y
		local c = xMeters - from.Y

		local discriminant = b * b - 4 * a * c
		if discriminant < 0 then
			return nil
		end

		local t1 = (-b + math.sqrt(discriminant)) / (2 * a)
		local t2 = (-b - math.sqrt(discriminant)) / (2 * a)

		local t = math.max(t1, t2)
		return t
	end

	local function clamp_oobPosition(position)
		inbPart.Size = Vector3.new(161 + (QBAimbotAntiOOBThreshold.Value * 2), 75, 360 + (QBAimbotAntiOOBThreshold.Value * 2))
		return Vector3.new(
			math.clamp(position.X, -inbPart.Size.X / 2 + inbPart.Position.X, inbPart.Size.X / 2 + inbPart.Position.X),
			math.clamp(position.Y, -inbPart.Size.Y / 2, inbPart.Size.Y / 2),
			math.clamp(position.Z, -inbPart.Size.Z / 2 + inbPart.Position.Z, inbPart.Size.Z / 2 + inbPart.Position.Z)
		)
	end

	local function getVelocityForXYinTime(from, to, time)
		local g = Vector3.new(0, -28, 0)
		local v0 = (to - from - 0.5*g*time*time)/time;
		local dir = ((from + v0) - from).Unit
		local power = v0.Y / dir.Y
		return v0, dir, math.clamp(math.round(power), 0, 95)
	end

	local function getVelocityForAngle(from, to, angle, standingStill)
		local yMult = standingStill and
			angle / 90 / ((angle > 65 and 1 - (angle - 70) / 25) or (angle > 50 and 1.6 - (angle - 55) / 50) or (angle > 40 and 1.9) or (angle > 30 and 2.25) or (angle > 15 and 2.5) or 3)
			or angle / 90 / ((angle > 70 and 0.55 - ( (angle - 60) / 30 ) * 0.45) or (angle > 60 and 0.8 - ( (angle - 60) / 30 ) * 0.45) or (angle > 53 and 1) or (angle > 43 and 1.2) or (angle > 30 and 1.5) or 1.9)

		local distance = (from - to).Magnitude
		local height = yMult * distance

		local t = getTimeForHeight(from, to, height)
		local velocity = getVelocityForXYinTime(from, to, t)

		return velocity, t
	end

	local function finalCalc(char, angle, xLead, yLead, sideways)	
		xLead = xLead or 0

		local IS_PLAYER = players:GetPlayerFromCharacter(char)
		local moveDirection = IS_PLAYER and ((not sideways and QBAimbotExperimental.Value and moveDirection[char]) or char.Humanoid.MoveDirection) or (char.Humanoid.WalkToPoint - char.HumanoidRootPart.Position).Unit
		local _, t = getVelocityForAngle(player.Character.Head.Position, char.HumanoidRootPart.Position, angle, moveDirection.Magnitude <= 0)

		local pos = char.Head.Position + (moveDirection * 20 * t) + (moveDirection * xLead) + (moveDirection * 20 * ping) + Vector3.new(0, yLead, 0)
		
		pos = QBAimbotAntiOOB.Value and clamp_oobPosition(pos) or pos

		return getVelocityForXYinTime(player.Character.Head.Position, pos, t), pos, t
	end

	local function checkIfInterceptable(position, time)
		local blacklist = {}
		local interceptable = false

		blacklist[target.Name] = true

		if player.Team then
			for index, player in pairs(player.Team:GetPlayers()) do
				blacklist[player.Name] = true
			end
		end

		local targets = {}

		for index, player in pairs(players:GetPlayers()) do
			targets[#targets + 1] = player.Character
		end

		if IS_PRACTICE then
			targets[#targets + 1] = workspace.npcwr.a['bot 1']
			targets[#targets + 1] = workspace.npcwr.a['bot 2']
			targets[#targets + 1] = workspace.npcwr.b['bot 3']
			targets[#targets + 1] = workspace.npcwr.b['bot 4']
		end

		for index, character in pairs(targets) do
			if blacklist[character.Name] then continue end
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

			if not humanoidRootPart then continue end

			local distance = (humanoidRootPart.Position - position).Magnitude
			local radius = (20 * time) + 7.5

			interceptable = distance < radius
			if interceptable then break end
		end

		return interceptable
	end
	
	local function getPosInXTimeFromVel(initialPos, initialVelocity, gravity, time)
		local position = initialPos + initialVelocity * time + 0.5 * gravity * time * time
		return position
	end

	local function findRoute(character)
		local isPlayer = players:GetPlayerFromCharacter(character)

		local moveDirection = isPlayer and character.Humanoid.MoveDirection or (character.Humanoid.WalkToPoint - character.HumanoidRootPart.Position).Unit
		local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude

		local function isDiagonal()
			local absMD = Vector3.new(math.abs(moveDirection.X), 0, math.abs(moveDirection.Z))
			local diff = (absMD - Vector3.new(0.7, 0, 0.7)).Magnitude
			return diff < 0.5
		end

		local function isSideways()
			local direction = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Unit
			local highest = math.abs(direction.X) > math.abs(direction.Z) and "Z" or "X"
			return math.abs(moveDirection[highest]) > 0.8
		end

		local function towardsQB()
			local newDistance = ((character.HumanoidRootPart.Position + (moveDirection * 16)) - player.Character.HumanoidRootPart.Position).Magnitude
			return (distance - newDistance) > 12
		end

		local requirements = {
			["go"] = function()
				return not isDiagonal() and not towardsQB()
			end,
			["post/corner"] = function()
				return isDiagonal() and not towardsQB() and distance > 125
			end,
			["slant"] = function()
				return isDiagonal() and not towardsQB() and distance <= 125
			end,
			["in/out"] = function()
				return isSideways() and distance > 125
			end,
			["flat"] = function()
				return isSideways() and distance <= 125
			end,
			["curl/comeback"] = function()
				return towardsQB()
			end,
			["stationary"] = function()
				return moveDirection.Magnitude <= 0
			end,
		}

		local route = nil

		for routeName, func in pairs(requirements) do
			route = func() and routeName or route
			if route then break end
		end

		return route, moveDirection
	end

	local function determineAutoAngle(distance, route)
		local autoAngleFunc = {
			["go"] = function()
				return math.min(25 + (distance / 10), 40)
			end,
			["in/out"] = function()
				return 10 + math.max((distance - 100), 0) / 10
			end,
			["flat"] = function()
				return 10 + math.max((distance - 100), 0) / 10
			end,
			["curl/comeback"] = function()
				return 7.5 + math.max((distance - 100), 0) / 20
			end,
			["stationary"] = function()
				return 17 + math.max((distance - 100), 0) / 20
			end,
		}

		return (autoAngleFunc[route] or autoAngleFunc.go)()
	end

	local function determine95PowerOnlyAngle(distance, route)
		local IN_AIR = player.Character.Humanoid.FloorMaterial == Enum.Material.Air

		local autoAngleFunc = {
			["go"] = function()
				return distance > 150 and math.max(IN_AIR and (16 + math.max(distance - 100, 0) / 5) or (14 + math.max(distance - 100, 0) / 5), 25)
					or (IN_AIR and 16.5 + math.max(distance, 0) * (12.5 / 150) or 14 + math.max(distance, 0) * (12.5 / 150))
			end,
			["in/out"] = function()
				return 10 + math.max((distance - 100), 0) / 10
			end,
			["flat"] = function()
				return 10 + math.max((distance - 100), 0) / 10
			end,
			["curl/comeback"] = function()
				return 7.5 + math.max((distance - 100), 0) / 20
			end,
			["stationary"] = function()
				return 13.5 + math.max((distance - 100), 0) / 20
			end,
		}

		return (autoAngleFunc[route] or autoAngleFunc.go)()
	end
	
	local function determineAutoThrowType(route)
		if not target then return end
		
		local IS_PLAYER = players:GetPlayerFromCharacter(target)
		local dbDistance = math.huge
		
		for index, player in pairs(players:GetPlayers()) do
			if IS_PLAYER and IS_PLAYER.Team and IS_PLAYER.Team == player.Team then continue end
			if IS_PLAYER and player == IS_PLAYER then continue end
			
			local character = player.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			
			if not humanoidRootPart then continue end
			
			local distance = (humanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude
			
			if distance < dbDistance then
				dbDistance = distance
			end
		end
		
		local forwardRoutes = {"go", "post/corner", "slant", "curl/comeback", "stationary"}
		local sidewayRoutes = {"in/out", "flat"}
		
		if within(forwardRoutes, route) then
			if dbDistance > 5 then
				return (QBAimbot95PowerOnly.Value or angle < 40) and "Jump" or "Dime"
			elseif dbDistance > 2 then
				return "Dive" 
			end
			
			return "Mag"
		elseif within(sidewayRoutes, route) then
			if dbDistance > 4 then
				return "Dime"
			end
			
			return "Jump"
		end
		
		return "Dime"
	end
	
	local function findClosestMultiple(x, y)
		local m = math.round(y / x)
		return m * x
	end
	
	local function changePowerGui(power)
		local ballGui = player.PlayerGui:FindFirstChild("BallGui")
		if ballGui then
			for index, frame in pairs(ballGui['Frame0']:GetChildren()) do
				if frame.Name == "Disp" then continue end
				frame.BackgroundTransparency = tonumber(frame.Name) <= power and 0 or 0.9
			end
		end
		
		ballGui['Frame0'].Disp.Text = power
	end
	
	--// tracking
	
	task.spawn(function()
		local moveDirectionData = {}

		while true do task.wait(1/30);
			for index, player in pairs(players:GetPlayers()) do
				local character = player.Character
				local humanoid = character and character:FindFirstChild("Humanoid")

				if not humanoid then continue end

				if not moveDirectionData[character] then
					moveDirectionData[character] = {
						Direction = humanoid.MoveDirection,
						Started = os.clock()
					}
					moveDirection[character] = humanoid.MoveDirection
				end
				
				local newMoveDirection = humanoid.MoveDirection
				
				if (newMoveDirection - moveDirectionData[character].Direction).Magnitude > 0.2 then
					moveDirectionData[character] = {
						Direction = humanoid.MoveDirection,
						Started = os.clock()
					}
				else
					if (os.clock() - moveDirectionData[character].Started) > 0.5 then
						moveDirection[character] = humanoid.MoveDirection
						moveDirectionData[character] = {
							Direction = humanoid.MoveDirection,
							Started = os.clock()
						}
					end
				end
			end
		end
	end)
	
	--// main

	while true do task.wait();
		local s, e = pcall(function()
			cards.Enabled = QBAimbotUI.Value and QBAimbot.Value and (player.PlayerGui:FindFirstChild("BallGui") or camera.CameraSubject:IsA("BasePart"))
			beam.Enabled = QBAimbotVisualise.Value and QBAimbot.Value and (player.PlayerGui:FindFirstChild("BallGui") or camera.CameraSubject:IsA("BasePart"))
			highlight.Enabled = QBAimbotVisualise.Value and QBAimbot.Value and player.PlayerGui:FindFirstChild("BallGui")
			
			highlight.FillColor = locked and Color3.fromHex("#6a64a2") or Color3.fromRGB(255, 255, 255)
			highlight.OutlineColor = locked and Color3.fromRGB(255, 255, 255) or Color3.fromHex("#6a64a2")

			part.Transparency = QBAimbotVisualise.Value and QBAimbot.Value and (player.PlayerGui:FindFirstChild("BallGui") or camera.CameraSubject:IsA("BasePart")) and 0 or 1

			if not player.Character:FindFirstChild("Football") and player.PlayerGui:FindFirstChild("BallGui") then
				player.PlayerGui:FindFirstChild("BallGui").Parent = nil
			end

			if not player.PlayerGui:FindFirstChild("BallGui") then firedRemoteEvent = false return end
			if not QBAimbot.Value then return end
			if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

			target = (locked and target) or findTarget()

			if not target then return end
			
			if not target.Parent then locked = false return end
			if not target:FindFirstChild("HumanoidRootPart") then locked = false return end

			local IN_AIR = player.Character.Humanoid.FloorMaterial == Enum.Material.Air

			local distance = (target.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
			local route = findRoute(target)
			
			if QBAimbotAutoThrowType.Value then
				throwType = determineAutoThrowType(route)
			end
			
			nonVisualThrowType = throwType == "Bullet" and (IN_AIR and "Jump" or "Dime") or nil
			
			local realThrowType = throwType
			local throwType = nonVisualThrowType or throwType
			
			local QBAimbot95PowerOnly = realThrowType == "Bullet" and {
				Value = true
			} or QBAimbot95PowerOnly

			local xLead = offsets[throwType].xLead or 0
			local yLead = offsets[throwType].yLead or 0
			
			if QBAimbot95PowerOnly.Value and throwType == "Jump" then
				xLead += 3.5
				yLead -= 1
			end

			if angle > 30 and QBAimbot95PowerOnly.Value and route == "go" then
				yLead -= 0.5 + math.min(angle - 30, 5) / 10
			end

			if within(sidewayRoutes, route) and IN_AIR then
				yLead += 8
				xLead += 3
			end

			if within(inAirAdditiveRoutes, route) and IN_AIR then
				yLead += 4
			end

			xLead += offsets[throwType].routes[route].xzOffset or 0
			yLead += offsets[throwType].routes[route].yOffset or 0

			xLead += QBAimbotXOffset.Value
			yLead += QBAimbotYOffset.Value

			if IN_AIR and QBAimbot95PowerOnly.Value then
				yLead += 1
			end

			angle = (QBAimbot95PowerOnly.Value and determine95PowerOnlyAngle(distance, route, target)) or (QBAimbotAutoAngle.Value and determineAutoAngle(distance, route)) or angle

			if (not QBAimbotAutoAngle.Value and not QBAimbot95PowerOnly.Value) and (angle % 5 ~= 0) then
				angle = 45
			end

			local s, velocity, position, airtime = pcall(finalCalc, target, angle, xLead, yLead, table.find(sidewayRoutes, route))

			if not s then
				return
			end

			local isInterceptable = checkIfInterceptable(position, airtime)

			power = math.min(math.round(velocity.Magnitude), 95)
			direction = velocity.Unit
			local curve0, curve1, cf1, cf2 = beamProjectile(Vector3.new(0, -28, 0), power * direction, player.Character.Head.Position + (direction * 5), airtime);
			beam.CurveSize0 = curve0; beam.CurveSize1 = curve1
			a0.CFrame = a0.Parent.CFrame:inverse() * cf1
			a1.CFrame = a1.Parent.CFrame:inverse() * cf2

			cards.Container.Angle.Value.Text = math.round(angle * 10) / 10
			cards.Container.Player.Value.Text = target.Name
			cards.Container.Interceptable.Value.Text = tostring(isInterceptable)
			cards.Container.Power.Value.Text = power
			cards.Container.Mode.Value.Text = realThrowType 
			cards.Container.Route.Value.Text = route
			cards.Container.Distance.Value.Text = math.round(distance)

			part.Position = getPosInXTimeFromVel(player.Character.Head.Position + direction * 5, power * direction, Vector3.new(0, -28, 0), airtime)

			highlight.Parent = target
			highlight.Adornee = target
			
			if QBAimbotAdjustPowerGUI.Value then
				changePowerGui(findClosestMultiple(5, power))
			end
		end);
		
		--(not s and warn or function() end)("[CRITICAL ERROR] Bleachhack QB Aimbot: "..(e or ""))
	end
end)

--// visuals

local childAddedEvent = nil

local function toggleRenderingTextures(v)
	if childAddedEvent then
		childAddedEvent:Disconnect()
		childAddedEvent = nil
	end

	if not v then
		for index, part in pairs(workspace:GetDescendants()) do
			if not part:IsA("BasePart") then continue end
			part:SetAttribute("originalMaterial", part.Material.Name)
			part.Material = Enum.Material.SmoothPlastic
		end

		childAddedEvent = workspace.DescendantAdded:Connect(function(part)
			if not part:IsA("BasePart") then return end
			part:SetAttribute("originalMaterial", part.Material.Name)
			part.Material = Enum.Material.SmoothPlastic
		end)
	else
		for index, part in pairs(workspace:GetDescendants()) do
			if not part:IsA("BasePart") then continue end
			if not part:GetAttribute("originalMaterial") then continue end
			part.Material = Enum.Material[part:GetAttribute("originalMaterial")]
		end
	end
end

local cameraZoom = Visuals:CreateModule("CameraZoom", nil, function(v)
	player.CameraMaxZoomDistance = not v and 50 or player.CameraMaxZoomDistance
end)
cameraZoom:CreateSlider({
	Title = "Distance",
	Callback = function(v)
		player.CameraMaxZoomDistance = cameraZoom.Value and v or 50
	end,
	Range = {0, 1000},
	Value = player.CameraMaxZoomDistance
})

local noRender = Visuals:CreateModule("NoRender")
local textures; textures = noRender:CreateToggle({Title = "Textures", Callback = function(v)
	repeat task.wait() until noRender.Value or textures.Value ~= v
	toggleRenderingTextures(not textures.Value)
end,})

local SilentMode = Visuals:CreateModule("SilentMode")

task.spawn(function()
	local coreGui = game:GetService("CoreGui")

	while true do
		task.wait()
		coreGui.Bleachhack.ModulesList.Visible = not SilentMode.Value
		coreGui.Bleachhack.Server.Visible = not SilentMode.Value
	end
end)

--// automatics

local guardUI = game:GetObjects("rbxassetid://18271144228")[1]:Clone()
guardUI.Parent = (gethui and gethui()) or game:GetService("CoreGui")
guardUI.Enabled = false

local guardHighlight = Instance.new("Highlight")
guardHighlight.FillColor = Color3.fromRGB(173, 173, 173)
guardHighlight.Parent = replicatedStorage

local autoQB = Automatics:CreateModule("AutoQB")
local autoQBType = autoQB:CreateSwitch({
	Title = "Type",
	Range = {"Blatant", "Legit"}
})

local autoCaptain = Automatics:CreateModule("AutoCaptain")
local finishLine = not IS_PRACTICE and workspace.Models.LockerRoomA.FinishLine or Instance.new('Part')

local autoCatch = Automatics:CreateModule("AutoCatch")
local autoCatchRadius = autoCatch:CreateSlider({
	Title = "Radius",
	Range = {0, 50}
})

local autoSwat = Automatics:CreateModule("AutoSwat")
local autoSwatRadius = autoSwat:CreateSlider({
	Title = "Radius",
	Range = {0, 50}
})

local autoKicker = Automatics:CreateModule("AutoKick")
local autoKickerPower = autoKicker:CreateSlider({
	Title = "Power",
	Range = {0, 100},
	Value = 100
})
local autoKickerAccuracy = autoKicker:CreateSlider({
	Title = "Accuracy",
	Range = {0, 100},
	Value = 100
})
local autoKickerRandom = autoKicker:CreateToggle({
	Title = "Random"
})

local autoRush = Automatics:CreateModule("AutoRush")
local autoRushDelay = autoRush:CreateSlider({Title = "Delay", Range = {0, 1}})
local autoRushPredict = autoRush:CreateToggle({Title = "Predict"})

local autoBoost = Automatics:CreateModule("AutoBoost")
local autoBoostPower = autoBoost:CreateSlider({
	Title = "Power",
	Range = {1, 15}
})

local autoGuard = Automatics:CreateModule("AutoGuard")
local autoGuardBind = autoGuard:CreateKeybind({
	Title = "Lock Bind",
	Value = Enum.KeyCode.Q
})
local autoGuardVisualise = autoGuard:CreateToggle({
	Title = "Visualise",
	Value = true
})

--local autoWR = Automatics:CreateModule("AutoWR")

local function onCharacterAutomatics(character)
	local leftLeg = character:WaitForChild("Left Leg")
	local rightLeg = character:WaitForChild("Right Leg")
	
	local humanoid = character:WaitForChild("Humanoid")
	
	local function onTouch(hit)
		if not hit.Name:match("Arm") and not hit.Name:match("Head") then return end
		if hit:IsDescendantOf(character) then return end
		
		if humanoid.FloorMaterial ~= Enum.Material.Air then return end
		
		character.HumanoidRootPart.AssemblyLinearVelocity += Vector3.new(0, autoBoostPower.Value, 0)
	end
	
	leftLeg.Touched:Connect(onTouch)
	rightLeg.Touched:Connect(onTouch)
end

finishLine:GetPropertyChangedSignal("CFrame"):Connect(function()
	if autoCaptain.Value and not isCatching and finishLine.Position.Y > 0 then
		for i = 1,7,1 do
			task.wait(0.2)
			player.Character.HumanoidRootPart.CFrame = finishLine.CFrame + Vector3.new(0, 2, 0)
		end
	end
end)

player.PlayerGui.ChildAdded:Connect(function(child)
	if child.Name == "KickerGui" and autoKicker.Value then
		local cursor = child:FindFirstChild("Cursor", true)
		
		if autoKickerRandom.Value then
			autoKickerPower.Value = Random.new():NextNumber(75, 100)
			autoKickerAccuracy.Value = Random.new():NextNumber(75, 100)
			autoKickerPower.Update()
			autoKickerAccuracy.Update()
		end
		
		repeat task.wait() until cursor.Position.Y.Scale < 0.01 + ((100 - autoKickerPower.Value) * 0.012) + (fps < 45 and 0.01 or 0)
		mouse1click()
		repeat task.wait() until cursor.Position.Y.Scale > 0.9 - ((100 - autoKickerAccuracy.Value) * 0.001)
		mouse1click()
	end
end)

task.spawn(function()
	local guardLocked = false
	local target = nil
	
	userInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		
		if input.KeyCode == autoGuardBind.Value then
			guardLocked = not guardLocked
		end
	end)
	
	while true do
		task.wait()
		
		guardUI.Enabled = autoGuard.Value
		guardHighlight.Enabled = autoGuard.Value
		
		if not autoGuard.Value then continue end
		
		target = guardLocked and target or findTarget(true)
		
		if not target then continue end
		
		local character = player.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChild("Humanoid")
		
		if not humanoid or not hrp then continue end
		
		guardHighlight.Adornee = target
		guardUI.Info.Text = "Guarding: "..target.Name.." - Locked: "..tostring(guardLocked)
		
		local position = target.HumanoidRootPart.Position
		local timeToMoveTo = (hrp.Position - position).Magnitude / 20
		
		local predictedPosition = position + (target.Humanoid.MoveDirection * timeToMoveTo * 20)
		
		moveToUsing[#moveToUsing + 1] = os.clock()
		
		humanoid:MoveTo(predictedPosition)
	end
end)

task.spawn(function()
	while true do
		task.wait()
		
		local ball = findClosestBall()
		if not ball then continue end
		
		local character = player.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		
		if not character or not humanoidRootPart then continue end
		
		local distance = (humanoidRootPart.Position - ball.Position).Magnitude
		
		if distance < autoCatchRadius.Value and autoCatch.Value then
			mouse1click()
		end
		
		if distance < autoSwatRadius.Value and autoSwat.Value then
			keypress(0x52)
			keyrelease(0x52)
		end
	end
end)

task.spawn(function()
	local lastTeleported = os.clock()
	
	while true do
		task.wait()
		if not autoQB.Value then continue end
		if values.Status.Value ~= "PrePlay" then continue end	
		if values.PlayType.Value ~= "normal" then continue end
		if values.PossessionTag.Value ~= player.Team.Name then continue end

		local character = player.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChild("Humanoid")
		
		if not humanoidRootPart then continue end
		if not humanoid then continue end
		
		local ball = findClosestBall()
		if not ball then continue end
		
		if autoQBType.Value == "Blatant" then
			if (os.clock() - lastTeleported) < 3 then continue end
			lastTeleported = os.clock()
			humanoidRootPart.CFrame = ball.CFrame
		else
			moveToUsing[#moveToUsing + 1] = os.clock()
			humanoid:MoveTo(ball.Position)
		end
	end
end)

task.spawn(function()
	local log = {}

	while true do
		task.wait(1/30)
		local possessor = findPossessor()
		local character = player.Character
		local humanoid = character and character:FindFirstChild("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if not humanoidRootPart then continue end
		if not humanoid then continue end
		if not possessor then log = {} continue end
		if not possessor:FindFirstChild("HumanoidRootPart") then continue end

		local delayedPosition = log[math.max(#log - math.round(autoRushDelay.Value / (1/30)), 1)]
		
		log[#log + 1] = possessor.HumanoidRootPart.Position
		
		if not delayedPosition then continue end
		
		local timeToMoveTo = (humanoidRootPart.Position - delayedPosition).Magnitude / 20
		local predictedPosition = delayedPosition + (possessor.Humanoid.MoveDirection * timeToMoveTo * 20)

		if not autoRush.Value then continue end
		
		moveToUsing[#moveToUsing + 1] = os.clock()
		humanoid:MoveTo(autoRushPredict.Value and predictedPosition or delayedPosition)
	end
end)

onCharacterAutomatics(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(onCharacterAutomatics)

--// player

local speed = Player:CreateModule("Speed")
local speedValue = speed:CreateSlider({
	Title = "Speed",
	Range = {20, 23}
})

local jumpPower = Player:CreateModule("JumpPower")
local jumpPowerValue = jumpPower:CreateSlider({
	Title = "Power",
	Range = {50, 70},
})

local angleEnhancer = Player:CreateModule("AngleEnhancer")
local angleEnhancerJP = angleEnhancer:CreateSlider({
	Title = "JP",
	Range = {50, 70}
})
local angleEnhancerIndicator = angleEnhancer:CreateToggle({Title = "Indicator"})

local replicationLag = Player:CreateModule("ReplicationLag")
local replicationLagValue = replicationLag:CreateSlider({
	Title = "Lag",
	Range = {0, 100},
	NonDecimal = false,
	Value = 0
})

--local RTC = Player:CreateModule("RTC")

--local RTCDebug = RTC:CreateToggle({
--	Title = "Debug"
--})

local function onCharacterMovement(character)
	local humanoid = character:WaitForChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	task.spawn(function()
		while AC_BYPASS and humanoid.Parent do
			task.wait(.1)
			humanoid.JumpPower = jumpPower.Value and jumpPowerValue.Value or 50
		end
	end)

	humanoid.Jumping:Connect(function()
		if humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then return end
		if AC_BYPASS then return end
		task.wait(0.05)
		if jumpPower.Value then
			humanoidRootPart.AssemblyLinearVelocity += Vector3.new(0, jumpPowerValue.Value - 50, 0)
		end
	end)
end

onCharacterMovement(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(onCharacterMovement)

task.spawn(function()
	while true do
		task.wait()
		if not replicationLag.Value then settings():GetService("NetworkSettings").IncomingReplicationLag = 0 continue end
		settings():GetService("NetworkSettings").IncomingReplicationLag = replicationLagValue.Value / 100
	end
end)

task.spawn(function()
	local angleTick = os.clock()
	local oldLookVector = Vector3.new(0, 0, 0)
	
	local shiftLockEnabled = false
	local lastEnabled = false

	local function hookCharacter(character)
		local humanoid = character:WaitForChild("Humanoid")
		local hrp = character:WaitForChild("HumanoidRootPart")

		humanoid.Jumping:Connect(function()
			if humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then return end
			if os.clock() - angleTick > 0.2 then return end
			if not angleEnhancer.Value then return end

			if angleEnhancerIndicator.Value then
				local h = Instance.new("Hint")
				h.Text = "Angled"
				h.Parent = workspace

				debris:AddItem(h, 1)
			end
			
			if AC_BYPASS then return end

			task.wait(0.05); hrp.AssemblyLinearVelocity += Vector3.new(0, angleEnhancerJP.Value - 50, 0)
		end)
	end

	hookCharacter(player.Character or player.CharacterAdded:Wait())

	player.CharacterAdded:Connect(hookCharacter)
	
	userInputService:GetPropertyChangedSignal("MouseBehavior"):Connect(function()
		if userInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
			shiftLockEnabled = true
		else
			shiftLockEnabled = false
		end
	end)

	while true do
		task.wait()
		local character = player.Character; if not character then continue end
		local hrp = character:FindFirstChild("HumanoidRootPart"); if not hrp then continue end
		local humanoid = character:FindFirstChild("Humanoid"); if not humanoid then continue end

		local lookVector = hrp.CFrame.LookVector
		local difference = (oldLookVector - lookVector).Magnitude

		if not shiftLockEnabled and lastEnabled then
			angleTick = os.clock()
		end
		
		if AC_BYPASS then
			if (os.clock() - angleTick < 0.2) and angleEnhancer.Value then
				humanoid.JumpPower = (jumpPower.Value and jumpPowerValue.Value or 50) + (angleEnhancerJP.Value - 50)
			elseif not angleEnhancer.Value then
				humanoid.JumpPower = (jumpPower.Value and jumpPowerValue.Value or 50)
			end
		end

		oldLookVector = hrp.CFrame.LookVector
		lastEnabled = shiftLockEnabled
	end
end)

runService:BindToRenderStep("walkSpeed", Enum.RenderPriority.Character.Value, function()
	local character = player.Character
	local humanoid = character and character:FindFirstChild("Humanoid")

	if not character or not humanoid then return end
	if humanoid:GetState() ~= Enum.HumanoidStateType.Running then return end
	if humanoid.WalkSpeed == 0 and not noFreeze.Value then return end
	if not character:FindFirstChild("HumanoidRootPart") then return end

	local moveDirection = ((os.clock() - (moveToUsing[#moveToUsing] or 0)) < 0.5 and (humanoid.WalkToPoint - character.HumanoidRootPart.Position).Unit) or (humanoid.MoveDirection)
	local currentVel = character.HumanoidRootPart.AssemblyLinearVelocity

	if speed.Value or noFreeze.Value then
		local speedValue = speed.Value and (speedValue.Value > 20 and speedValue.Value) or 20
		character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDirection.X * speedValue, currentVel.Y, moveDirection.Z * speedValue)
	end
end)

--task.spawn(function()
--	local sayMessageRequest = replicatedStorage:FindFirstChild("SayMessageRequest", true)

--	local player = players.LocalPlayer
--	local IP = "https://shiny-hardtofind-sphere-devdoroz.replit.app/"

--	local messagesSeen = {}

--	local lastIndex = 0
--	local waitingForJobID = false
	
--	local realPrint = print
--	local print = function(...) if not RTCDebug.Value then return end realPrint(...) end

--	local commands = {
--		["/online"] = function(args)
--			local online = httpService:JSONDecode(request({
--				Url = IP.."/get-online",
--				Method = "POST"
--			}).Body)

--			local str = "There are "..#online.." players online right now: "

--			for index, player in pairs(online) do
--				str ..= player..", "
--			end

--			str = string.sub(str, 1, #str - 2)
--			createMessage(str)
--		end,
--		["/rtc"] = function(...)
--			local args = {...}
--			send(table.concat(args, " "))
--		end,
--		["/help"] = function()
--			createMessage("/online to get players online")
--			createMessage("/rtc to send a message")
--			createMessage("/join {player-name} to join a player")
--		end,
--		["/join"] = function(...)
--			local args = {...}
--			print(unpack(args))
--			waitingForJobID = true
--			print("Attempting to get job id of ", args[1])
--			send(nil, "get-job-id", {
--				User = args[1],
--				type = "get-job-id"
--			})
--		end,
--	}

--	function send(message, type, data)
--		return request({
--			Url = IP.."/message",
--			Method = "POST",
--			Body = httpService:JSONEncode(data or {
--				User = player.Name,
--				Message = message,
--				type = type or "message"
--			}),
--			Headers = {
--				["Content-Type"] = "application/json"
--			}
--		})
--	end
	
--	local receivingThread = nil

--	function receive()
--		local response = nil
		
--		task.spawn(function()
--			response = request({
--				Url = IP.."/message",
--				Method = "GET",
--			}).Body
--		end)
		
--		repeat task.wait() until response or not RTC.Value
		
--		writefile("bleachhackresponse.json", response)
		
--		return response
--	end

--	function heartbeat()
--		request({
--			Url = IP.."/heartbeat",
--			Method = "POST",
--			Body = httpService:JSONEncode({
--				User = player.Name,
--			}),
--			Headers = {
--				["Content-Type"] = "application/json"
--			}
--		})
--	end

--	function createMessage(text)
--		starterGui:SetCore("ChatMakeSystemMessage", {
--			Text = text,
--			Font = Enum.Font.SourceSans;
--			Color = Color3.fromRGB(0, 166, 255),
--			FontSize = Enum.FontSize.Size24;
--		})
--	end

--	player.Chatted:Connect(function(msg)
--		local command = string.split(msg, " ")[1]
--		local isCommand = commands[command]
--		if not isCommand then return end

--		sayMessageRequest.Parent = nil

--		commands[command](unpack(string.split(string.sub(msg, #command + 2, #msg), " ")))

--		task.wait()

--		sayMessageRequest.Parent = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
--	end)

--	task.spawn(function()
--		while true do
--			repeat task.wait() until RTC.Value
--			print("[RTC] Sending heartbeat...")
--			heartbeat()
--			print('[RTC] Successfully heartbeat!')
--			task.wait(5)
--		end
--	end)

--	task.spawn(function()
--		repeat task.wait() until RTC.Value
--		createMessage("Successfully connected to Bleachhack RTC.")
--		createMessage("/help to see commands!")
--		createMessage("THIS IS STILL EXPERIMENTAL, EXPECT BUGS")
--	end)
	
--	while true do
--		task.wait()
--		if not RTC.Value then continue end
--		local logs = httpService:JSONDecode(receive() or "[]")
--		if not RTC.Value then continue end

--		if lastIndex == 0 then
--			lastIndex = #logs
--			continue
--		end

--		print(logs)

--		print("Received a new message.", lastIndex)

--		for i = lastIndex + 1,#logs,1 do
--			local data = logs[i]
--			print("Reading message", data.type, data.user, data.message, i)
--			if data.type == "message" then
--				createMessage("[RTC] "..data.user..": "..data.message)
--			elseif data.type == "join" then
--				createMessage("[RTC] "..data.user.." joined")
--			elseif data.type == "leave" then
--				createMessage("[RTC] "..data.user.." has left")
--			elseif data.type == "get-job-id" then
--				task.delay(0.5, function()
--					if data.user:match(player.Name) then
--						print("Passed over job-id")
--						send(game.JobId, "job-id")
--					else
--						print(data.user, " invalid compare check for get-job-id")
--					end
--				end)
--			elseif data.type == "job-id" then
--				if waitingForJobID then
--					local message = Instance.new("Message")
--					message.Text = "Teleporting.."
--					message.Parent = workspace
--					print('[RTC] FOUND JOB-ID, teleporting')
--					RTC.Value = false
--					getgenv()['script_key'] = getgenv()['script_key'] or "KbEpNXxrYdzAGikrnSYfYVRXdRnNKXrb";
--					local queued = "script_key='"..getgenv()['script_key'].."'; getgenv().script_key="..getgenv()['script_key']..'; loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/bleachhack/main/loader.lua"))()'
--					queue_on_teleport(queued)
--					print("Queued code, "..queued)
--					task.delay(3, function()
--						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, data.message, player)
--					end)
--				else
--					print('[RTC] Skipped job-id, not waiting for')
--				end
--			end
--		end

--		print("Finished ", lastIndex)

--		lastIndex = #logs
--	end
--end)

--// configs

local Save = Configs:CreateModule("Save", true, function()
	configSavingUI.Enabled = true
	
	local configName = nil
	
	local connection; connection = configSavingUI.Frame.ConfirmButton.MouseButton1Click:Connect(function()
		configName = configSavingUI.Frame.ConfigName.Text
		connection:Disconnect()
	end)
	
	repeat task.wait() until configName
	
	configSavingUI.Enabled = false
	
	local exported = UI:Export()
	
	writefile("bleachhack/"..configName..".json", exported)
end)

local Load = Configs:CreateModule("Load", true, function()
	configSavingUI.Enabled = true

	local configName = nil

	local connection; connection = configSavingUI.Frame.ConfirmButton.MouseButton1Click:Connect(function()
		configName = configSavingUI.Frame.ConfigName.Text
		connection:Disconnect()
	end)

	repeat task.wait() until configName

	configSavingUI.Enabled = false
	
	if not isfile("bleachhack/"..configName..".json") then return end
	
	local contents = readfile("bleachhack/"..configName..".json")
	
	UI:Import(contents)
end)
