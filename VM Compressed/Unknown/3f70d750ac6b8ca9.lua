local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

--------------------------------------------------------------------------------
-- 🔒 ENCRYPTED STRINGS (Anti-Skid Visuals)
--------------------------------------------------------------------------------
local _S = {
    -- "HEAVEN STEP v2 | by tomato.txt"
    _T = "\72\69\65\86\69\78\32\83\84\69\80\32\118\50\32\124\32\98\121\32\116\111\109\97\116\111\46\116\120\116",
    -- "dev. by tomato.txt"
    _Sub = "\100\101\118\46\32\98\121\32\116\111\109\97\116\111\46\116\120\116",
    -- "tomato.txt"
    _C = "\116\111\109\97\116\111\46\116\120\116" 
}

--------------------------------------------------------------------------------
-- SETTINGS & GUI STATE
--------------------------------------------------------------------------------
local SETTINGS = {
	Enabled = true,
	MobileMode = false,
	TriggerKey = Enum.KeyCode.R,
	TimePerWaypoint = 0.06, 
	SelectedEffect = "Lightning" 
}

-- LOAD RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = _S._T, 
	LoadingTitle = "Initializing...",
	LoadingSubtitle = _S._Sub,
	ConfigurationSaving = { Enabled = false },
	KeySystem = false, 
})

--------------------------------------------------------------------------------
-- HELPERS
--------------------------------------------------------------------------------
local dirtCache = {} 
local characterVisCache = {} 

local function disableDirtsCollision()
	dirtCache = {} 
	local dirtsFolder = workspace:FindFirstChild("Dirts")
	if dirtsFolder then
		for _, part in pairs(dirtsFolder:GetDescendants()) do
			if part:IsA("BasePart") then
				dirtCache[part] = part.CanCollide
				part.CanCollide = false
			end
		end
	end
end

local function restoreDirtsCollision()
	for part, wasCollidable in pairs(dirtCache) do
		if part and part.Parent then part.CanCollide = wasCollidable end
	end
	dirtCache = {}
end

local function restoreCharacterVisible()
	for instance, originalTrans in pairs(characterVisCache) do
		if instance then instance.Transparency = originalTrans end
	end
	characterVisCache = {}
end

local function setCharacterInvisible(char)
	-- Safety check: Restore first if cache exists to prevent perm-invisibility
	if next(characterVisCache) ~= nil then restoreCharacterVisible() end
	
	characterVisCache = {}
	for _, desc in pairs(char:GetDescendants()) do
		if desc:IsA("BasePart") or desc:IsA("Decal") or desc:IsA("Texture") then
			if desc.Transparency < 1 then -- Only hide visible parts
				characterVisCache[desc] = desc.Transparency
				desc.Transparency = 1
			end
		end
	end
end

local function generateTrussesForCustomLadders()
	local parts = {}
	for _, desc in pairs(workspace:GetDescendants()) do
		if desc:IsA("BasePart") and desc.CanCollide == true and desc.Transparency < 1 then
			if desc.Size.X < 20 and desc.Size.Z < 20 and not desc:IsA("TrussPart") then
				table.insert(parts, desc)
			end
		end
	end
	local columns = {}
	for _, part in ipairs(parts) do
		local key = string.format("%d:%d", math.floor(part.Position.X), math.floor(part.Position.Z))
		if not columns[key] then columns[key] = {} end
		table.insert(columns[key], part)
	end
	for key, colParts in pairs(columns) do
		table.sort(colParts, function(a, b) return a.Position.Y < b.Position.Y end)
		local currentChain = {colParts[1]}
		for i = 1, #colParts - 1 do
			local p1 = colParts[i]; local p2 = colParts[i+1]
			local verticalGap = (p2.Position.Y - p1.Position.Y) - (p1.Size.Y/2) - (p2.Size.Y/2)
			if verticalGap > -0.5 and verticalGap < 4.0 then
				table.insert(currentChain, p2)
			else
				if #currentChain >= 3 then createTrussFromChain(currentChain) end
				currentChain = {p2}
			end
		end
		if #currentChain >= 3 then createTrussFromChain(currentChain) end
	end
end

function createTrussFromChain(chain)
	local bottomPart = chain[1]; local topPart = chain[#chain]
	local bottomY = (bottomPart.Position.Y - (bottomPart.Size.Y / 2)) - 2.0
	local topY = (topPart.Position.Y + (topPart.Size.Y / 2)) + 2.0
	local height = topY - bottomY
	local midY = bottomY + (height / 2)
	local truss = Instance.new("TrussPart")
	truss.Anchored = true; truss.CanCollide = true; truss.Transparency = 1
	truss.Size = Vector3.new(2, height, 2)
	local avgX = 0; local avgZ = 0
	for _, p in ipairs(chain) do avgX = avgX + p.Position.X; avgZ = avgZ + p.Position.Z end
	truss.Position = Vector3.new(avgX / #chain, midY, avgZ / #chain)
	truss.Parent = workspace
end

task.spawn(generateTrussesForCustomLadders)

--------------------------------------------------------------------------------
-- 🎨 VISUAL EFFECTS
--------------------------------------------------------------------------------
local Effects = {}

local function spawnFadePart(cframe, size, color, material, duration, shape)
	local p = Instance.new("Part")
	p.Anchored = true; p.CanCollide = false; p.CanQuery = false
	p.CFrame = cframe; p.Size = size; p.Color = color; p.Material = material
	if shape then p.Shape = shape end
	p.Parent = workspace
	local t = TweenService:Create(p, TweenInfo.new(duration), {Transparency = 1, Size = size * 0.1})
	t:Play()
	Debris:AddItem(p, duration + 0.1)
end

-- 1. Lightning
Effects.Lightning = {
	Start = function(lead) end,
	Update = function(p1, p2)
		local dist = (p2 - p1).Magnitude
		if dist < 0.1 then return end
		local core = Instance.new("Part")
		core.Anchored = true; core.CanCollide = false; core.Material = Enum.Material.Neon; core.Color = Color3.new(1,1,1)
		core.Size = Vector3.new(0.2, 0.2, dist); core.CFrame = CFrame.lookAt(p1, p2) * CFrame.new(0,0,-dist/2)
		core.Parent = workspace
		TweenService:Create(core, TweenInfo.new(0.3), {Transparency=1, Size=Vector3.new(0,0,dist)}):Play()
		Debris:AddItem(core, 0.35)
		local rng = Random.new()
		local jitter = Vector3.new(rng:NextNumber(-0.5,0.5), rng:NextNumber(-0.5,0.5), rng:NextNumber(-0.5,0.5))
		local glow = core:Clone()
		glow.Color = Color3.fromRGB(40, 200, 255); glow.Size = Vector3.new(0.6, 0.6, dist); glow.Transparency = 0.4
		glow.Position = glow.Position + jitter
		glow.Parent = workspace
		TweenService:Create(glow, TweenInfo.new(0.3), {Transparency=1, Size=Vector3.new(0,0,dist)}):Play()
		Debris:AddItem(glow, 0.35)
	end,
	Impact = function(pos)
		local light = Instance.new("PointLight"); light.Range=20; light.Brightness=5; light.Color=Color3.fromRGB(100,255,255)
		local f = Instance.new("Part"); f.Transparency=1; f.Position=pos; f.Anchored=true; f.CanCollide=false; f.Parent=workspace
		light.Parent = f
		Debris:AddItem(f, 0.2)
	end
}

-- 2. Fireball
Effects.Fireball = {
	Start = function(lead)
		local fire = Instance.new("Fire"); fire.Size = 8; fire.Heat = 20; fire.Parent = lead
		local light = Instance.new("PointLight"); light.Color = Color3.fromRGB(255, 100, 0); light.Range = 30; light.Parent = lead
	end,
	Update = function(p1, p2)
		local dist = (p2 - p1).Magnitude
		if dist < 0.5 then return end
		spawnFadePart(CFrame.lookAt(p1,p2)*CFrame.new(0,0,-dist/2), Vector3.new(2,2,dist), Color3.fromRGB(255,80,0), Enum.Material.Neon, 0.5)
	end,
	Impact = function(pos)
		local exp = Instance.new("Explosion"); exp.Position = pos; exp.BlastRadius = 0; exp.BlastPressure = 0; exp.Parent = workspace
	end
}

-- 3. Sonic
Effects.Sonic = {
	Start = function(lead)
		local mesh = Instance.new("SpecialMesh"); mesh.MeshType = Enum.MeshType.FileMesh
		mesh.MeshId = "rbxassetid://1033714"; mesh.Scale = Vector3.new(2,6,2); mesh.Parent = lead
		lead.Color = Color3.new(1,1,1); lead.Material = Enum.Material.Neon; lead.Transparency = 0.2
	end,
	Update = function(p1, p2)
		if math.random() > 0.7 then
			local ring = Instance.new("Part")
			ring.Shape = Enum.PartType.Cylinder
			ring.Anchored = true; ring.CanCollide = false; ring.Material = Enum.Material.Neon; ring.Color = Color3.new(1,1,1)
			ring.Size = Vector3.new(0.2, 6, 6); ring.CFrame = CFrame.lookAt(p1, p2) * CFrame.Angles(0, math.pi/2, 0)
			ring.Parent = workspace
			TweenService:Create(ring, TweenInfo.new(0.5), {Size = Vector3.new(0, 15, 15), Transparency = 1}):Play()
			Debris:AddItem(ring, 0.5)
		end
	end,
	Impact = function(pos)
		local ring = Instance.new("Part"); ring.Shape = Enum.PartType.Ball; ring.Size = Vector3.new(1,1,1); ring.Position = pos
		ring.Anchored=true; ring.CanCollide=false; ring.Material=Enum.Material.Neon; ring.Transparency=0.5; ring.Parent=workspace
		TweenService:Create(ring, TweenInfo.new(0.4), {Size=Vector3.new(40,40,40), Transparency=1}):Play()
		Debris:AddItem(ring, 0.4)
	end
}

-- 4. Void
Effects.Void = {
	Start = function(lead)
		local p = Instance.new("ParticleEmitter")
		p.Texture = "rbxassetid://243098098"; p.Color = ColorSequence.new(Color3.new(0,0,0)); p.Size = NumberSequence.new(3)
		p.Rate = 100; p.Speed = NumberRange.new(0); p.Lifetime = NumberRange.new(1); p.Parent = lead
	end,
	Update = function(p1, p2)
		local dist = (p2 - p1).Magnitude
		if dist < 0.5 then return end
		spawnFadePart(CFrame.lookAt(p1,p2)*CFrame.new(0,0,-dist/2), Vector3.new(3,3,dist), Color3.new(0,0,0), Enum.Material.ForceField, 0.8)
	end,
	Impact = function(pos)
		local orb = Instance.new("Part"); orb.Shape=Enum.PartType.Ball; orb.Color=Color3.new(0,0,0); orb.Material=Enum.Material.Neon
		orb.Size=Vector3.new(20,20,20); orb.Position=pos; orb.Anchored=true; orb.CanCollide=false; orb.Parent=workspace
		TweenService:Create(orb, TweenInfo.new(0.5), {Size=Vector3.new(0,0,0)}):Play() 
		Debris:AddItem(orb, 0.6)
	end
}

-- 5. Crazy
Effects.Crazy = {
	Start = function(lead)
		local s = Instance.new("Sparkles"); s.SparkleColor = Color3.fromRGB(255,0,255); s.Parent = lead
	end,
	Update = function(p1, p2)
		local dist = (p2 - p1).Magnitude
		local hue = (tick() % 1) 
		local col = Color3.fromHSV(hue, 1, 1)
		spawnFadePart(CFrame.lookAt(p1,p2)*CFrame.new(0,0,-dist/2), Vector3.new(math.random(1,3),math.random(1,3),dist), col, Enum.Material.Neon, 0.6)
	end,
	Impact = function(pos)
		for i=1, 20 do
			local p = Instance.new("Part"); p.Size = Vector3.new(1,1,1); p.Position = pos; p.Anchored = false; p.CanCollide=true
			p.Color = Color3.fromHSV(math.random(),1,1); p.Velocity = Vector3.new(math.random(-50,50), math.random(50,100), math.random(-50,50))
			p.Parent = workspace
			Debris:AddItem(p, 2)
		end
	end
}

-- 6. Tomato
Effects.Tomato = {
	Start = function(lead)
		lead.Transparency = 0
		lead.Color = Color3.fromRGB(255, 60, 60)
		lead.Material = Enum.Material.Plastic
		lead.Shape = Enum.PartType.Ball
		lead.Size = Vector3.new(3,3,3)
	end,
	Update = function(p1, p2)
		if math.random() > 0.5 then
			local drop = Instance.new("Part"); drop.Shape = Enum.PartType.Ball; drop.Size = Vector3.new(0.8,0.8,0.8)
			drop.Color = Color3.fromRGB(200, 0, 0); drop.Material = Enum.Material.Neon; drop.Anchored=true; drop.CanCollide=false
			drop.Position = p2
			drop.Parent = workspace
			TweenService:Create(drop, TweenInfo.new(0.5), {Size=Vector3.new(0,0,0)}):Play()
			Debris:AddItem(drop, 0.5)
		end
	end,
	Impact = function(pos)
		for i=1, 15 do
			local p = Instance.new("Part"); p.Shape = Enum.PartType.Ball; p.Size = Vector3.new(1,1,1)
			p.Position = pos; p.Color = Color3.fromRGB(255,0,0); p.Anchored=false; p.CanCollide=true
			p.Velocity = Vector3.new(math.random(-40,40), math.random(20,50), math.random(-40,40))
			p.Parent = workspace
			Debris:AddItem(p, 3)
		end
		local puddle = Instance.new("Part"); puddle.Shape = Enum.PartType.Cylinder; puddle.Size = Vector3.new(0.2, 10, 10)
		puddle.Color = Color3.fromRGB(180,0,0); puddle.Position = pos; puddle.Anchored=true; puddle.CanCollide=false
		puddle.CFrame = CFrame.new(pos) * CFrame.Angles(0,0,math.pi/2)
		puddle.Parent = workspace
		TweenService:Create(puddle, TweenInfo.new(2), {Transparency=1}):Play()
		Debris:AddItem(puddle, 2)
	end
}

-- 7. Quantum
Effects.Quantum = {
	Start = function(lead)
		local s = Instance.new("Sparkles"); s.SparkleColor = Color3.fromRGB(0, 255, 255); s.Parent = lead
		local light = Instance.new("PointLight"); light.Color = Color3.fromRGB(170, 0, 255); light.Range = 20; light.Parent = lead
	end,
	Update = function(p1, p2)
		if math.random() > 0.3 then
			local ring = Instance.new("Part"); ring.Shape = Enum.PartType.Cylinder; ring.Size = Vector3.new(0.5, 5, 5)
			ring.Color = Color3.fromRGB(85, 0, 255); ring.Material = Enum.Material.Neon; ring.Anchored=true; ring.CanCollide=false
			ring.CFrame = CFrame.lookAt(p2, p1) * CFrame.Angles(0, math.pi/2, 0)
			ring.Parent = workspace
			TweenService:Create(ring, TweenInfo.new(0.6), {Size=Vector3.new(0, 15, 15), Transparency=1}):Play()
			Debris:AddItem(ring, 0.6)
		end
	end,
	Impact = function(pos)
		local orb = Instance.new("Part"); orb.Shape=Enum.PartType.Ball; orb.Color=Color3.fromRGB(0,0,0); orb.Material=Enum.Material.Neon
		orb.Size=Vector3.new(30,30,30); orb.Position=pos; orb.Anchored=true; orb.CanCollide=false; orb.Transparency=0.2; orb.Parent=workspace
		TweenService:Create(orb, TweenInfo.new(0.3), {Size=Vector3.new(0,0,0)}):Play() 
		Debris:AddItem(orb, 0.4)
	end
}

-- 8. Demon
Effects.Demon = {
	Start = function(lead)
		local f = Instance.new("Fire"); f.Color = Color3.fromRGB(0,0,0); f.SecondaryColor = Color3.fromRGB(150,0,0); f.Size=10; f.Parent=lead
		local s = Instance.new("Smoke"); s.Color = Color3.fromRGB(0,0,0); s.Opacity=0.5; s.Parent=lead
	end,
	Update = function(p1, p2)
		local dist = (p2 - p1).Magnitude
		spawnFadePart(CFrame.lookAt(p1,p2)*CFrame.new(0,0,-dist/2), Vector3.new(2,2,dist), Color3.fromRGB(0,0,0), Enum.Material.Slate, 1.0)
	end,
	Impact = function(pos)
		local exp = Instance.new("Explosion"); exp.Position = pos; exp.BlastRadius = 0; exp.Parent = workspace
		for i=1,10 do
			local rock = Instance.new("Part"); rock.Color = Color3.fromRGB(20,20,20); rock.Material=Enum.Material.Slate
			rock.Position=pos; rock.Size=Vector3.new(2,2,2); rock.Velocity=Vector3.new(math.random(-30,30),50,math.random(-30,30))
			rock.Parent=workspace; Debris:AddItem(rock, 3)
		end
	end
}

-- 9. Angel
Effects.Angel = {
	Start = function(lead)
		local s = Instance.new("Sparkles"); s.SparkleColor = Color3.fromRGB(255,255,200); s.Parent = lead
		local l = Instance.new("PointLight"); l.Color=Color3.fromRGB(255,255,240); l.Brightness=5; l.Range=30; l.Parent=lead
	end,
	Update = function(p1, p2)
		if math.random() > 0.5 then
			local feather = Instance.new("Part"); feather.Size=Vector3.new(1,0.2,2); feather.Color=Color3.new(1,1,1); feather.Material=Enum.Material.Neon
			feather.Anchored=true; feather.CanCollide=false; feather.CFrame = CFrame.new(p2) * CFrame.Angles(math.random(), math.random(), math.random())
			feather.Parent = workspace
			TweenService:Create(feather, TweenInfo.new(1), {Transparency=1, Position=feather.Position+Vector3.new(0,-5,0)}):Play()
			Debris:AddItem(feather, 1)
		end
	end,
	Impact = function(pos)
		local ray = Instance.new("Part"); ray.Anchored=true; ray.CanCollide=false; ray.Size=Vector3.new(5, 100, 5); ray.Position=pos+Vector3.new(0,50,0)
		ray.Color=Color3.fromRGB(255,255,200); ray.Material=Enum.Material.Neon; ray.Transparency=0.5; ray.Parent=workspace
		TweenService:Create(ray, TweenInfo.new(1), {Transparency=1, Size=Vector3.new(0,100,0)}):Play()
		Debris:AddItem(ray, 1)
	end
}

-- 10. Santa
Effects.Santa = {
	Start = function(lead)
		lead.Transparency = 0; lead.Shape = Enum.PartType.Block; lead.Size = Vector3.new(4,4,4)
		lead.Color = Color3.fromRGB(255,0,0); lead.Material = Enum.Material.Plastic
		local box = Instance.new("SelectionBox"); box.Adornee = lead; box.Color3 = Color3.fromRGB(0,255,0); box.LineThickness=0.5; box.Parent=lead
	end,
	Update = function(p1, p2)
		if math.random() > 0.3 then
			local snow = Instance.new("Part"); snow.Size=Vector3.new(0.5,0.5,0.5); snow.Color=Color3.new(1,1,1); snow.Material=Enum.Material.Sand
			snow.Anchored=true; snow.CanCollide=false; snow.Position=p2 + Vector3.new(math.random(-2,2), math.random(-2,2), math.random(-2,2))
			snow.Parent=workspace
			TweenService:Create(snow, TweenInfo.new(1), {Position=snow.Position+Vector3.new(0,-5,0), Transparency=1}):Play()
			Debris:AddItem(snow, 1)
		end
	end,
	Impact = function(pos)
		for i=1, 10 do
			local gift = Instance.new("Part"); gift.Size=Vector3.new(1,1,1); gift.Color=Color3.fromHSV(math.random(), 1, 1); gift.Position=pos
			gift.Velocity = Vector3.new(math.random(-30,30), 40, math.random(-30,30)); gift.Parent=workspace
			Debris:AddItem(gift, 3)
		end
	end
}


--------------------------------------------------------------------------------
-- GUI TABS
--------------------------------------------------------------------------------
local MainTab = Window:CreateTab("Main", 4483362458)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local HelpTab = Window:CreateTab("Info", 4483362458)

MainTab:CreateSection("Settings")
MainTab:CreateToggle({Name="Enable Script", CurrentValue=true, Flag="Enabled", Callback=function(v) SETTINGS.Enabled=v end})
MainTab:CreateToggle({Name="Mobile Mode (Tap)", CurrentValue=false, Flag="MobileMode", Callback=function(v) SETTINGS.MobileMode=v end})
MainTab:CreateSlider({Name="Travel Speed (Sec/Node)", Range={0.04,0.2}, Increment=0.01, CurrentValue=0.06, Callback=function(v) SETTINGS.TimePerWaypoint=v end})

VisualsTab:CreateSection("Effect Selection")
VisualsTab:CreateDropdown({
	Name = "Visual Effect",
	Options = {"Lightning", "Fireball", "Sonic", "Void", "Crazy", "Tomato", "Quantum", "Demon", "Angel", "Santa"},
	CurrentOption = "Lightning",
	Callback = function(Option)
		SETTINGS.SelectedEffect = Option[1]
	end,
})

HelpTab:CreateParagraph({Title="Usage", Content="PC: Hold 'R' and Left Click to teleport.\nMobile: Enable 'Mobile Mode' and tap the screen."})
HelpTab:CreateParagraph({Title="Credits", Content="Script created by " .. _S._C}) 

--------------------------------------------------------------------------------
-- TELEPORT LOGIC
--------------------------------------------------------------------------------
local activeTeleportId = 0
local agentParams = {AgentRadius=1.0, AgentHeight=5.0, AgentCanJump=true, AgentCanClimb=true, AgentMaxSlope=89, WaypointSpacing=math.huge}

local function moveToPath(destination)
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local humanoid = char:FindFirstChild("Humanoid")
	
	activeTeleportId = activeTeleportId + 1
	local myId = activeTeleportId
	
	-- Restore before starting to prevent stuck invisible state
	if next(characterVisCache) ~= nil then restoreCharacterVisible() end
	
	local path = PathfindingService:CreatePath(agentParams)
	disableDirtsCollision()
	local success, _ = pcall(function() path:ComputeAsync(hrp.Position, destination) end)
	restoreDirtsCollision()

	if success and path.Status == Enum.PathStatus.Success then
		local waypoints = path:GetWaypoints()
		local totalDuration = math.max(1, #waypoints-1) * SETTINGS.TimePerWaypoint
		
		hrp.Anchored = false
		if humanoid then humanoid.PlatformStand = true; humanoid.AutoRotate = false end
		setCharacterInvisible(char)
		
		local startPos = hrp.Position
		local lead = Instance.new("Part")
		lead.Transparency = 1; lead.Size = Vector3.new(1,1,1); lead.CanCollide = false
		lead.Anchored = true; lead.Position = startPos; lead.Parent = workspace
		
		lead.CFrame = CFrame.lookAt(startPos, destination) * CFrame.Angles(math.rad(-90), 0, 0)
		
		camera.CameraSubject = lead
		
		local EffectModule = Effects[SETTINGS.SelectedEffect] or Effects.Lightning
		if EffectModule.Start then EffectModule.Start(lead) end
		
		local elapsedTime = 0
		local prevLeadPos = startPos
		local completed = false
		local startRotation = hrp.CFrame.Rotation
		local hipOffset = (humanoid.RigType == Enum.HumanoidRigType.R15) and humanoid.HipHeight + (hrp.Size.Y/2) or 3.0
		
		local connection
		connection = RunService.Heartbeat:Connect(function(dt)
			if activeTeleportId ~= myId or not char or not hrp.Parent then
				if connection then connection:Disconnect() end
				if lead then lead:Destroy() end
				if humanoid then camera.CameraSubject = humanoid end
				restoreCharacterVisible() 
				return
			end
			
			elapsedTime = elapsedTime + dt
			
			local progress = math.clamp(elapsedTime / totalDuration, 0, 1)
			local currentLeadPos = startPos:Lerp(destination, progress)
			
			lead.Position = currentLeadPos
			
			EffectModule.Update(prevLeadPos, currentLeadPos)
			prevLeadPos = currentLeadPos
			
			local currentSegFloat = elapsedTime / SETTINGS.TimePerWaypoint
			local segIdx = math.floor(currentSegFloat) + 1
			local nextPos
			
			if segIdx >= #waypoints then
				nextPos = waypoints[#waypoints].Position
				completed = true
			else
				local alpha = currentSegFloat - math.floor(currentSegFloat)
				nextPos = waypoints[segIdx].Position:Lerp(waypoints[segIdx+1].Position, alpha)
			end
			
			hrp.CFrame = CFrame.new(nextPos + Vector3.new(0, hipOffset, 0)) * startRotation
			hrp.AssemblyLinearVelocity = Vector3.zero
			
			if completed then
				if connection then connection:Disconnect() end
				EffectModule.Impact(destination)
				if humanoid then humanoid.PlatformStand=false; humanoid.AutoRotate=true; camera.CameraSubject=humanoid end
				restoreCharacterVisible()
				lead:Destroy()
			end
		end)
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed or not SETTINGS.Enabled then return end
	local isClick = (input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)
	
	if isClick then
		local shouldTeleport = SETTINGS.MobileMode or UserInputService:IsKeyDown(SETTINGS.TriggerKey)
		if shouldTeleport then
			local mouse = UserInputService:GetMouseLocation()
			local r = workspace.CurrentCamera:ViewportPointToRay(mouse.X, mouse.Y)
			local res = workspace:Raycast(r.Origin, r.Direction * 5000, RaycastParams.new())
			if res then moveToPath(res.Position) end
		end
	end
end)

Rayfield:Notify({Title = "Ready", Content = "Script Loaded. Credit: " .. _S._C, Duration = 5})
