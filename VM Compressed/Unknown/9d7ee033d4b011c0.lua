if getgenv().bleach then warn("Bleachhack is already executed") return end
getgenv().bleach = true

local players = game:GetService("Players")
local stats = game:GetService("Stats")
local socialService = game:GetService("SocialService")
local coreGui = game:GetService("CoreGui")
local textChatService = game:GetService("TextChatService")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local debris = game:GetService("Debris")
local teleportService = game:GetService("TeleportService")

local player = players.LocalPlayer

local camera = workspace.CurrentCamera
local balls = workspace:FindFirstChild("Balls")
local runtime = workspace:FindFirstChild("Runtime")
local alive = workspace:FindFirstChild("Alive")

local opponent = nil
local ball = nil
local event = socialService:WaitForChild("\n")
local parried = false
local targetted = false
local falseCurve = false
local spamFiringSpeed = 0
local lastCurve = 1
local zeroSpeedBall = false

local lastTargetted = os.clock()
local targetHistory = {}

local ping = 0
local timeBetweenTarget = 0
local curveUponTarget = 0
local lastSpamSpeed = 0

local spamming = false
local manualSpamming = false

local spamThreads = {}

local debug = loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/debug/main/updated.lua"))()
local fastThreads = loadstring(game:HttpGet('https://raw.githubusercontent.com/devdoroz/fastThread/main/main.lua'))()
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/bleachhack-ui-lib/main/no.lua"))()
local spamUI = game:GetObjects("rbxassetid://17800356936")[1]:Clone()
spamUI.Parent = (gethui and gethui()) or game:GetService("CoreGui")
spamUI.Enabled = false
spamUI.Spam.MouseButton1Click:Connect(function()
	manualSpamming = not manualSpamming
	spamUI.Spam.Text = manualSpamming and "Spamming.." or "Spam"
end)

local UI = Lib:Create()

local Combat = UI:CreateCategory("Combat", "rbxassetid://17761728916")
local Movement = UI:CreateCategory("Movement", "rbxassetid://17763774168")
local Render = UI:CreateCategory("Render", "rbxassetid://17786550051")
local Misc = UI:CreateCategory("Misc", "rbxassetid://17786897326")

local spamSpeed = {Value = 0}
local autoParry = Combat:CreateModule("AutoParry")
local autoSpam = autoParry:CreateToggle({Title = "AutoSpam", Value = _G.autoRanked})
local manualSpam = autoParry:CreateToggle({Title = "ManualSpam", Callback = function(v)
	spamUI.Enabled = v
end,})
local manualSpamKey = autoParry:CreateKeybind({Title = "Spam Key", Value = {Name = "None"}})
local autoSpamType = autoParry:CreateSwitch({Title = "Spam Type", Range = {"Fast", "Optimized"}, Callback = function(v)
	if not newSpamThread then return end
	if v == "Optimized" then
		newSpamThread(0, 0)
	else
		newSpamThread(math.round(1 + (spamSpeed.Value / 4)), math.round(1 + (spamSpeed.Value / 2)))
	end
end,})
local showVisualizer = autoParry:CreateToggle({Title = "Visualise"})
local debugMode = autoParry:CreateToggle({Title = "Debug"})

local targetFrequency = 0

local speedModule = Movement:CreateModule("Speed")

local autoWalk = Movement:CreateModule("AutoWalk")

local speedValue = speedModule:CreateSlider({
	Title = "Speed",
	Range = {36, 100}
})

local autoWalkType = autoWalk:CreateSwitch({
	Title = "Type",
	Range = {"Passive", "Aggressive"}
})

local approachIfTargetted = autoWalk:CreateToggle({
	Title = "Approach If Targetted",
	Value = _G.autoRanked
})

local lookBall = autoWalk:CreateToggle({
	Title = "Look at Ball",
	Callback = function(v)
		if v then return end
		player.Character.HumanoidRootPart:FindFirstChildWhichIsA("BodyGyro"):Destroy()
		player.Character.Humanoid.AutoRotate = true
	end,
	Value = _G.autoRanked
})

local targettedRadius = autoWalk:CreateSlider({
	Title = "Targetted Radius",
	Range = {0, 100},
	Value = 0,
})

local followRadius = autoWalk:CreateSlider({
	Title = "Follow Radius",
	Range = {0, 100},
	Value = 15
})

local noRender = Render:CreateModule("NoRender")
local noRenderVFX; noRenderVFX = noRender:CreateToggle({Title = "VFX", Callback = function(v)
	repeat task.wait() until noRender.Value or not noRenderVFX.Value
	if not noRender.Value then
		v = false
	end
	player.PlayerScripts.EffectScripts.ClientFX.Enabled = not v
end,})
local noRenderTextures; noRenderTextures = noRender:CreateToggle({Title = "Textures", Callback = function(v)
	repeat task.wait() until noRender.Value or not noRenderTextures.Value
	if not noRender.Value then
		v = false
	end
	print("Textures ", v)
	local function newPart(p: BasePart)
		task.wait()
		if not p:IsA("BasePart") and not p:IsA("MeshPart") then return end
		if v then
			local currentMaterial = p.Material
			p:SetAttribute("lastMaterial", currentMaterial.Name)
			p.Material = Enum.Material.SmoothPlastic
			
			if p:IsA("MeshPart") then
				p:SetAttribute("textureId", p.TextureID)
				p.TextureID = ""
			end
			
			for index, child in pairs(p:GetChildren()) do
				if child:IsA("Texture") or child:IsA("Decal") then
					child:Destroy()
				end
			end
		else
			local textureID = p:GetAttribute("textureID")
			local currentMaterial = p:GetAttribute("lastMaterial")
			
			if textureID then
				p.TextureID = textureID
			end
			
			if currentMaterial then
				p.Material = Enum.Material[currentMaterial]
			end
		end
	end
	
	for index, part in pairs(workspace:GetDescendants()) do
		newPart(part)
	end
end,})

local autoCurve = Combat:CreateModule("AutoCurve")

local autoCurveType = autoCurve:CreateSwitch({
	Title = "Type",
	Range = {"Random", "Up"}
})

local curveFuncs = {
	["Random"] = function()
		return CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
	end,
	["Up"] = function()
		return CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + Vector3.new(0, 1, 0))
	end,
}

local visualizer = Instance.new("Part")
visualizer.Parent = workspace
visualizer.CastShadow = false
visualizer.CanCollide = false
visualizer.Anchored = true
visualizer.Material = Enum.Material.ForceField
visualizer.Shape = Enum.PartType.Ball

function parry(isSpam)
	local cf = (autoCurve.Value and not isSpam) and curveFuncs[autoCurveType.Value]() or camera.CFrame
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

	local screen = camera:WorldToScreenPoint(player.Character.HumanoidRootPart.Position)
	local tbl = {}

	for index, player in pairs(players:GetPlayers()) do
		local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			tbl[tostring(player.Name)] = camera:WorldToScreenPoint(humanoidRootPart.Position) 
		end
	end

	local args = {
		0,
		CFrame.new(x,y,z,R00,R01,R02,R10,R11,R12,R20,R21,R22),
		tbl,
		{
			screen.X,
			screen.Y
		},
		false
	}

	event = _G.event or event or socialService:WaitForChild("\n")

	_G.event = event

	event:FireServer(unpack(args))
end

function onKill(character)
end

function hookBall(nwBall: BasePart) task.wait()
	if not nwBall:GetAttribute('realBall') then return end
	
	ball = nwBall
	targetted = nwBall:GetAttribute("target") == player.Name
	
	nwBall:GetAttributeChangedSignal("target"):Connect(function()
		targetted = nwBall:GetAttribute("target") == player.Name
		parried = false
		
		targetHistory[#targetHistory + 1] = player.Name
		
		if targetted then
			curveUponTarget = getCurve(nwBall)
			timeBetweenTarget = os.clock() - lastTargetted
			lastTargetted = os.clock()
			targetFrequency += 1
			
			task.delay(0.5, function()
				targetFrequency -= 1
			end)
		else
			opponent = alive:FindFirstChild(nwBall:GetAttribute("target"))
		end
	end)
end

function getCurve(ball)
	local desiredDirection = (player.Character.HumanoidRootPart.Position - ball.Position).Unit
	local direction = ball.AssemblyLinearVelocity.Unit
	
	return (desiredDirection - direction).Magnitude / 2
end

function xIsMovingAwayFromY(x, y)
	local humanoid = x:FindFirstChild("Humanoid")
	local xPos = x.HumanoidRootPart.Position 

	local walkToPoint = humanoid.WalkToPoint
	local moveDirection = (walkToPoint.Magnitude > 0 and (walkToPoint - xPos).Unit) or humanoid.MoveDirection

	return ( (xPos + moveDirection) - y ).Magnitude > ( xPos - y ).Magnitude, moveDirection.Magnitude > 0
end

function getPing()
	return stats.PerformanceStats.Ping:GetValue()
end

function getServerPing()
	return stats.Network.ServerStatsItem['Data Ping']:GetValue()
end

function newSpamThread(threads, interval)
	for index, thread in pairs(spamThreads) do
		thread:Disconnect()
	end

	for _ = 1, threads, 1 do
		local thread = fastThreads:Hook(function()
			if not spamming and not manualSpamming then return end
			for _ = 1, interval, 1 do
				task.wait()
				if not spamming and not manualSpamming then break end
				parry(true)
				spamFiringSpeed = spamFiringSpeed + 1
				task.delay(1, function()
					spamFiringSpeed = spamFiringSpeed - 1
				end)
			end
		end)

		spamThreads[#spamThreads + 1] = thread
	end
end

function onSelfChar(char)
end

function onChar(char)
	local humanoid = char:WaitForChild("Humanoid")
	
	humanoid.Died:Connect(function()
		if targetHistory[#targetHistory - 1] == player.Name then
			onKill(char)
		end
	end)
end

for index, ball in pairs(balls:GetChildren()) do
	hookBall(ball)
end

alive.ChildAdded:Connect(onChar)
balls.ChildAdded:Connect(hookBall)

task.spawn(function()
	while true do
		task.wait(0.1)
		ping = (getPing() + getServerPing()) / 1000
	end
end)

task.spawn(function()

	local function findFarthestPosition(position)
		local rotateCFrame = CFrame.new(0, 0, 0)
		local iterations = 8

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Include
		raycastParams.FilterDescendantsInstances = {workspace:FindFirstChild("Map")}

		local farthestPosition = Vector3.new(0, 0, 0)
		local farthestDistance = 0

		for i = 1,16,1 do
			rotateCFrame *= CFrame.Angles(0, math.rad(360 / i), 0)

			local lookVector = rotateCFrame.LookVector
			local ray = workspace:Raycast(position, lookVector * 500, raycastParams)

			if not ray then continue end

			local distance = (ray.Position - position).Magnitude - (position - player.Character.HumanoidRootPart.Position).Magnitude

			if distance > farthestDistance then
				farthestDistance = distance
				farthestPosition = ray.Position
			end
		end

		return farthestPosition
	end

	while true do
		task.wait()
		local character = player.Character
		local humanoid = character and character:FindFirstChild("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if not character or not humanoid or not humanoidRootPart then continue end
		if not autoWalk.Value then
			if humanoidRootPart:FindFirstChildWhichIsA("BodyGyro") then
				humanoidRootPart:FindFirstChildWhichIsA("BodyGyro"):Destroy()
				humanoid.AutoRotate = true
			end
			continue
		end
		if not ball then continue end
		if player.Team and player.Team.Name == "Waiting" then continue end

		local opponentDistance = opponent and opponent:FindFirstChild("HumanoidRootPart") and (opponent.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude or 1000

		if lookBall.Value then
			local bodyGyro = character.HumanoidRootPart:FindFirstChild("BodyGyro") or Instance.new("BodyGyro")
			bodyGyro.D = 100
			bodyGyro.P = 3000
			bodyGyro.MaxTorque = lookBall.Value and Vector3.new(0, math.huge, 0) or Vector3.new(0, 0, 0)
			bodyGyro.Parent = character.HumanoidRootPart
			bodyGyro.CFrame = CFrame.lookAt(character.HumanoidRootPart.Position, ball.Position)
			player.Character.Humanoid.AutoRotate = false
		end

		if ball.AssemblyLinearVelocity.Magnitude <= 0 or (targetted and not parried and player.PlayerGui.Hotbar.Block.UIGradient.Offset ~= Vector2.new(0, 0.5)) then
			local position = findFarthestPosition(ball.Position)
			humanoid:MoveTo(position)
			continue
		end

		if autoWalkType.Value == "Aggressive" then
			local position = ball.Position + ball.AssemblyLinearVelocity.Unit * -15

			if opponentDistance < (targetted and targettedRadius.Value or followRadius.Value) then humanoid:MoveTo(humanoidRootPart.Position) continue end

			humanoid:MoveTo(position)
		elseif autoWalkType.Value == "Passive" then
			local position = (not targetted or not approachIfTargetted.Value) and findFarthestPosition(ball.Position) or ball.Position
			if opponentDistance < (targetted and targettedRadius.Value or followRadius.Value) then humanoid:MoveTo(humanoidRootPart.Position) continue end

			humanoid:MoveTo(position)
		end
	end
end)

debug:newValue("speed", 0)
debug:newValue("parried", false)
debug:newValue("falseCurve", false)
debug:newValue("curve", 0)
debug:newValue("curveThreshold", 0)
debug:newValue("timeBetweenTarget", 0)
debug:newValue("distance", 0)
debug:newValue("radius", 0)
debug:newValue("spamFiringSpeed", 0)
debug:newValue("opponentDistance", 0)
debug:newValue("buffer", 0)
debug:newValue("zeroSpeedBall", false)

onSelfChar(player.Character)
player.CharacterAdded:Connect(onSelfChar)

runtime.ChildAdded:Connect(function(c)
	if noRenderVFX.Value then
		repeat runService.RenderStepped:Wait() c:Destroy() until not c.Parent
	end
end)

userInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	print(manualSpamKey.Value)
	if input.KeyCode == manualSpamKey.Value and manualSpam.Value then
		manualSpamming = not manualSpamming
		spamUI.Spam.Text = manualSpamming and "Spamming.." or "Spam"
	end
end)

task.spawn(function()
	while true do
		task.wait()
		if (spamming or manualSpamming) and autoSpamType.Value == "Optimized" then
			parry(true)
			spamFiringSpeed = spamFiringSpeed + 1
			task.delay(1, function()
				spamFiringSpeed = spamFiringSpeed - 1
			end)
		end
	end
end)

do
	local HttpService = game:GetService("HttpService")
	local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
	local requestUrl = 'http://127.0.0.1:6463/rpc?v=1'
	local discord_invite = 'xtbJcrbr2m'

	local requestData = {
		cmd = 'INVITE_BROWSER',
		args = {
			code = discord_invite
		},
		nonce = HttpService:GenerateGUID(false)
	}

	local headers = {
		['Content-Type'] = 'application/json',
		['Origin'] = 'https://discord.com'
	}

	local success, response = pcall(httprequest, {
		Url = requestUrl,
		Method = 'POST',
		Headers = headers,
		Body = HttpService:JSONEncode(requestData)
	})
end

fastThreads:Hook(function()
	local character = player.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	
	coreGui.debug.Enabled = debugMode.Value
	visualizer.Transparency = showVisualizer.Value and 0 or 1
	
	if not ball then return end
	if not character or not humanoidRootPart then return end
	if not autoParry.Value then return end
	
	if speedModule.Value then
		player.Character.Humanoid.WalkSpeed = speedValue.Value
	end
	
	local velocity = ball.AssemblyLinearVelocity
	local speed = velocity.Magnitude
	local distance = (ball.Position - humanoidRootPart.Position).Magnitude
	local curve = getCurve(ball)
	
	local opponentDistance = opponent and opponent:FindFirstChild("HumanoidRootPart") and (opponent.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude or 1000
	
	local movingAway, moving = true, true
	local opponentMovingAway, opponentMoving = true, true
	
	if opponent and opponent:FindFirstChild("HumanoidRootPart") then
		movingAway, moving = xIsMovingAwayFromY(player.Character, opponent.HumanoidRootPart.Position)
		opponentMovingAway, opponentMoving = xIsMovingAwayFromY(opponent, humanoidRootPart.Position)
	end
	
	local movingTowards = not movingAway and moving
	local opponentMovingTowards = not opponentMovingAway and opponentMoving
	
	local buffer = 0.05 + (movingTowards and 0.05 or 0) + (opponentMovingTowards and 0.05 or 0) + ping
	local spamSpeed = opponentDistance / buffer
	
	local radius = (speed * 0.44) + (speed * ping)
	radius /= (curve * 0.4 + 1)
	
	radius = math.max(radius, 25)
	
	local curveBuffer = (1/opponentDistance) * (7 + (speed / 150))
	
	local curveCheck = curve < 0.45 + curveBuffer
	local falseCurveCheck = (falseCurve or math.abs(curve - lastCurve) > 0.5)
	local earlyCurveCheck = (math.abs(curve - curveUponTarget) > 0.1)
	
	local checks = (curveCheck and not falseCurveCheck and earlyCurveCheck) or timeBetweenTarget < (0.5 + (movingTowards and 0.1 or 0)) or distance < 20
	
	falseCurve = falseCurveCheck
	
	if falseCurveCheck then
		falseCurve = (curve < 0.2) and speed > 3 and opponentDistance > 35 and (os.clock() - lastTargetted < 0.1)
	end
	
	spamming = autoSpam.Value and (speed > spamSpeed or targetFrequency > 2) and timeBetweenTarget < 0.5 and (os.clock() - lastTargetted < 1)
	
	visualizer.Position = humanoidRootPart.Position
	visualizer.Size = spamming and Vector3.new(15, 15, 15) or Vector3.new(radius, radius, radius)
	visualizer.Material = Enum.Material.ForceField
	visualizer.Color = spamming and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
	
	if speed < 3 then
		parried = false
	end
	
	if speed <= 0 then
		zeroSpeedBall = true
		targetted = targetted or ball:GetAttribute("targetted") == player.Name
	end
	
	if (checks or zeroSpeedBall) and distance < (radius * (zeroSpeedBall and 1.1 or 1)) and targetted and not parried and not spamming and speed > 0 and player.PlayerGui.Hotbar.Block.UIGradient.Offset == Vector2.new(0, 0.5) then
		parried = true
		zeroSpeedBall = false
		parry()
	end
	
	debug:updateValue("speed", math.round(speed))
	debug:updateValue("curve", curve)
	debug:updateValue("distance", distance)
	debug:updateValue("radius", radius)
	debug:updateValue('curveThreshold', 0.5 + curveBuffer)
	debug:updateValue('falseCurve', falseCurveCheck)
	debug:updateValue('parried', parried)
	debug:updateValue("timeBetweenTarget", timeBetweenTarget)
	debug:updateValue("spamFiringSpeed", spamFiringSpeed)
	debug:updateValue("buffer", buffer)
	debug:updateValue("opponentDistance", opponentDistance)
	debug:updateValue("zeroSpeedBall", zeroSpeedBall)
	
	lastCurve = curve
end)

newSpamThread(1, 1)
