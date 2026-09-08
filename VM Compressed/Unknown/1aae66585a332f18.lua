getgenv().deletewhendupefound = true
local lib = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Lib-18698"))()
lib.makelib("Zombies Vs Humans (2AreYouMental110)")
local main = lib.maketab("Main")
local movement = lib.maketab("Movement")
local esp = lib.maketab("ESP")
local anti = lib.maketab("Antis")
local hw = lib.maketab("Human Weld")
local oscr = lib.maketab("Other Scripts")
local localplr = game.Players.LocalPlayer
local on = true
local toc = {}
lib.makelabel("\u{26A0}\u{FE0F} Warning: All of these features can get you banned! This game has a report system on discord, do NOT cheat if you have tons of progress!",main)
local currposl = lib.makelabel("Current Position:",main)
local cfrcheckl = lib.makelabel("Death Magnitude (reach 0 = anticheat death):",main)
local ha = false
lib.maketoggle("Hit Aura",main,function(bool)
	ha = bool
end)
local bha = false
local bhas = 20
local newprt = Instance.new("Part")
newprt.Size = Vector3.new(bhas*2,bhas*2,bhas*2)
newprt.Anchored = true
newprt.Transparency = 1
newprt.CanCollide = false
newprt.Shape = Enum.PartType.Ball
newprt.Parent = workspace
lib.maketoggle("Block Hit Aura (Gravedigger)",main,function(bool)
	bha = bool
	if bha then
		newprt.Transparency = 0.8
	else
		newprt.Transparency = 1
	end
end)
lib.makeslider("Block Hit Aura Size",main,0,20,function(n)
	bhas = n
	newprt.Size = Vector3.new(n*2,n*2,n*2)
end)
local gha = false
lib.maketoggle("Charge Hit Aura (Gladiator) (BROKEN)",main,function(bool)
	gha = bool
end)
local comb = 0
function addcomb()
	comb = comb + 1
	if comb > 3 then
		comb = 1
	end
end
function getmelee()
	local sword = nil
	for i,v in pairs(localplr.Backpack:GetChildren()) do
		if v:IsA("Tool") and (string.find(v.Name,"Sword") or string.find(v.Name:lower(),"axe") or string.find(v.Name,"Dagger") or string.find(v.Name,"Hammer") or v.Name == "Trident") then
			sword = v
			v.Parent = localplr.Character
		end
	end
	if not sword and localplr.Character then
		for i,v in pairs(localplr.Character:GetChildren()) do
			if v:IsA("Tool") and (string.find(v.Name,"Sword") or string.find(v.Name:lower(),"axe") or string.find(v.Name,"Dagger") or string.find(v.Name,"Hammer") or v.Name == "Trident") then
				sword = v
			end
		end
	end
	return sword
end
local swordcooldowns = {
	WoodenSword = 0.35,
	Trident = 0.85,
	StoneSword = 0.425,
	GravediggersPickaxe = 2.2,
	ObsidianHammer = 1.4,
	IronSword = 0.525,
	GladiatorsSword = 2,
	FlintDagger = 0.2,
	EmeraldAxe = 1.5,
	DiamondSword = 0.8,
}
local partdelays = {}
function adelay(part,checksword)
	partdelays[part] = true
	if typeof(checksword) == "Instance" then
		checksword = swordcooldowns[checksword.Name] and swordcooldowns[checksword.Name]/9
	end
	task.delay((typeof(checksword) == "Number" and checksword) or 0.1,function()
		partdelays[part] = nil
	end)
end
function checkdelay(part)
	return partdelays[part] == nil
end
local ii = game.ReplicatedStorage.Remotes.ItemInteract
local proj = workspace.Projectiles
local graves = workspace.Graves
local blocks = workspace.Blocks
local supportsgpip = workspace.GetPartsInPart ~= nil
local charged = false
local speed = nil
local nofog = false
local ors = game:GetService("RunService").RenderStepped:Connect(function()
	debug.profilebegin("ZVHRenderStepped")
	if localplr.Character and localplr.Character:FindFirstChild("HumanoidRootPart") then
		local pos = localplr.Character.HumanoidRootPart.Position
		pos = Vector3.new(math.floor(pos.X),math.floor(pos.Y),math.floor(pos.Z))
		currposl.Text = "Current Position: "..tostring(pos)
		local dm = 99999
        local v1 = (750 - math.abs(pos.X))
        local v2 = (800 - math.abs(pos.Y))
        local v3 = (900 - math.abs(pos.Z))
		if v1 < dm then
			dm = (750 - math.abs(pos.X))
		end
		if v2 < dm then
			dm = (800 - math.abs(pos.Y))
		end
		if v3 < dm then
			dm = (900 - math.abs(pos.Z))
		end
		cfrcheckl.Text = "Death Magnitude (reach 0 = anticheat death): "..tostring(dm).." | "..v1..", "..v2..", "..v3
	end
	if speed and localplr.Character and localplr.Character:FindFirstChild("Humanoid") then
		localplr.Character.Humanoid.WalkSpeed = speed
	end
    if nofog then
        game.Lighting.Atmosphere.Density = 0
    end
	if ha or bha then
		local sword = getmelee()
		if localplr.Character and localplr.Character:FindFirstChild("HumanoidRootPart") then
			if ha and sword then
				if not gha or sword.Name ~= "GladiatorsSword" then
					for i,v in pairs(game.Players:GetPlayers()) do
						if v ~= localplr and v.Team ~= localplr.Team and v.Character and checkdelay(v.Character) and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - localplr.Character.HumanoidRootPart.Position).Magnitude < 20 and v.Character.Humanoid.Health > 0 then
							adelay(v.Character,sword)
							coroutine.wrap(function()
								addcomb()
								ii:InvokeServer(
									sword,
									"Hit",
									v.Character,
									comb
								)
							end)()
							task.wait()
						end
					end
				end
				for i,v in pairs(proj:GetChildren()) do
					if v:IsA("BasePart") and checkdelay(v) and (v.Position - localplr.Character.HumanoidRootPart.Position).Magnitude < 40 then
						if v.Name ~= "Cannonball" then
							continue
						end
						adelay(v,0.05)
						coroutine.wrap(function()
							addcomb()
							ii:InvokeServer(
								sword,
								"ProjectileHit",
								v,
								comb
							)
						end)()
					end
				end
				for i,v in pairs(graves:GetChildren()) do
					if checkdelay(v) and (((v:IsA("BasePart") and v.CFrame) or (v:IsA("Model") and v:GetPivot())).Position - localplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
						adelay(v,sword)
						coroutine.wrap(function()
							addcomb()
							ii:InvokeServer(
								sword,
								"GraveHit",
								v,
								comb
							)
						end)()
					end
				end
			end
			if bha and sword and sword.Name == "GravediggersPickaxe" then
				if supportsgpip then
					newprt.CFrame = localplr.Character.HumanoidRootPart.CFrame
					local parts = workspace:GetPartsInPart(newprt)
					for i,v in pairs(parts) do
						if v:IsDescendantOf(blocks) and v:IsA("BasePart") and checkdelay(v) then
							adelay(v,0.5)
							if v.Name == "Root" then
								v = v.Parent
							end
							coroutine.wrap(function()
								addcomb()
								pcall(function()
									ii:InvokeServer(
										sword,
										"BlockHit",
										v,
										comb
									)
								end)
							end)()
						end
					end
				else
					for i,v in pairs(blocks:GetChildren()) do
						if v:IsA("BasePart") and (v.Position - localplr.Character.HumanoidRootPart.Position).Magnitude < bhas and checkdelay(v) then
							adelay(v,0.5)
							addcomb()
							coroutine.wrap(function()
								ii:InvokeServer(
									sword,
									"BlockHit",
									v,
									comb
								)
							end)()
						end
					end
				end
			end
		end
	end
	debug.profileend()
end)
local antij = false
local oldfunc1 = nil
lib.maketoggle("Anti Jump Fatigue",anti,function(bool)
	antij = bool
	local r = require(localplr.PlayerScripts.Client.Character.JumpFatigue)
	if antij then
		oldfunc1 = r.GetCanFatigue
		r.GetCanFatigue = function()
		end
	else
		r.GetCanFatigue = oldfunc1
	end
end)
local antiwh = false
local oldfunc2 = nil
lib.maketoggle("Anti Anti Wall Hop",anti,function(bool)
	antiwh = bool
	local r = require(localplr.PlayerScripts.Client.Game.NoWallhop)
	if antiwh then
		oldfunc2 = r.GetIsOnGround
		r.GetIsOnGround = function()
			return true
		end
	else
		r.GetIsOnGround = oldfunc2
	end
end)
local deathreq = game.ReplicatedStorage.Remotes:WaitForChild("RequestThyDeath")
local antifm = false
lib.maketoggle("Anti Anti Fly Machine",anti,function(bool)
	antifm = bool
	if antifm then
		deathreq.Parent = workspace
	else
		deathreq.Parent = game.ReplicatedStorage.Remotes
	end
end)
local antifd = false
local oldfunc3 = nil
lib.maketoggle("Anti Fall Damage",anti,function(bool)
	antifd = bool
	local r = require(localplr.PlayerScripts.Client.Game.FallDamage)
	if antifd then
		oldfunc3 = r.GetFallDamage
		r.GetFallDamage = function()
			return 0
		end
	else
		r.GetFallDamage = oldfunc3
	end
end)
local antird = false
local oldfunc4 = nil
local oldfunc5 = nil
lib.maketoggle("Anti Ragdoll (sometimes doesnt work)",anti,function()
	local r = require(game.ReplicatedStorage.Packages.Ragdoll)
	if antird then
		oldfunc4 = r.EnableCharacterRagdoll
		r.EnableCharacterRagdoll = function()
		end
		oldfunc5 = r.StunCharacter
		r.StunCharacter = function()
		end
		while antird do
			task.wait()
			r:DisableCharacterRagdoll(localplr.Character)
			r:CancelCharacterStun(localplr.Character)
		end
	else
		r.EnableCharacterRagdoll = oldfunc4
		r.StunCharacter = oldfunc5
	end
end)
local scaffoldblocks = {}
local antisc = false
lib.maketoggle("Climb Scaffolding as a Zombie",anti,function(bool)
	antisc = bool
	for b,o in pairs(scaffoldblocks) do
		if not b or not b.Parent then
			scaffoldblocks[b] = nil
		else
			b[o[1]] = (antisc and o[3]) or o[2]
		end
	end
end)
function doblock(b)
	if not b or not b.Parent then
		return
	end
	if b.Name == "Scaffold" or b.Name == "Truss" then
		for i,v in pairs(b.Model:GetChildren()) do
			if v.Name == "Truss" then
				scaffoldblocks[v] = {
					"CollisionGroup",
					v.CollisionGroup,
					"BlockRoot"
				}
				if antisc then
					v.CollisionGroup = "BlockRoot"
				end
			elseif v.Name == "ZombieCollision" then
				scaffoldblocks[v] = {
					"Parent",
					v.Parent,
					game.CoreGui
				}
				if antisc then
					v.Parent = game.CoreGui
				end
			end
		end
	end
end
function doblockmodel(c)
	table.insert(toc,c.ChildAdded:Connect(function(b)
		doblock(b)
	end))
	for i,b in pairs(c:GetChildren()) do
		doblock(b)
	end
end
table.insert(toc,workspace.Blocks.ChildAdded:Connect(function(c)
	doblockmodel(c)
end))
for i,c in pairs(workspace.Blocks:GetChildren()) do
	doblockmodel(c)
end
local antikb = false
lib.maketoggle("Disable kill bricks (you will die when you go TOO far from the island or stay in the water for more than 3 seconds)",anti,function(bool)
	antikb = bool
	for i,v in pairs(workspace.Map.KillZones:GetChildren()) do
		v.CanTouch = not antikb
	end
end)
lib.maketextbox("Set Sword Cooldown",main,function(txt)
	txt = tonumber(txt)
	for i,v in pairs(game:GetService("ReplicatedStorage").Modules.ItemData:GetChildren()) do
		if v:IsA("ModuleScript") then
			local r = require(v)
			if r.Swings then
				for i,v in pairs(r.Swings) do
					v.SwingCooldown = txt
				end
			end
		end
	end
end)
lib.maketoggle("No Fog",main,function(bool)
    nofog = bool
end)
lib.makebutton("AntiStuck (teleport upwards)",movement,function()
	localplr.Character.HumanoidRootPart.CFrame = localplr.Character.HumanoidRootPart.CFrame + Vector3.new(0,40,0)
	localplr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
end)
lib.makelabel("Fastest human speed: 26 (build round: 30)",movement)
lib.makelabel("Fastest zombie speed: 28 (32 if rusher)",movement)
lib.makeslider("Speed (PATCHED)",movement,18,32,function(n)
	speed = math.floor(n)
end)
local zesp = false
local hesp = false
local phl = {}
local hlf = Instance.new("Folder")
hlf.Name = "hls"
hlf.Parent = game.CoreGui
function doplr(plr)
	local function dochar(c)
	end
	if plr == localplr then
		dochar = function(c)
			local h = c:WaitForChild("Humanoid")
			h.Died:Connect(function()
				if CurrentWeld then
					task.wait(3)
					CurrentWeld:Destroy()
					workspace.Camera.CameraSubject = c.Humanoid
				end
			end)
		end
	else
		dochar = function(c)
			local team = plr.Team
			local highlight = Instance.new("Highlight")
			highlight.Parent = hlf
			highlight.FillTransparency = 0.5
			highlight.FillColor = (plr.Team ~= localplr.Team and Color3.fromRGB(255,0,0)) or Color3.fromRGB(0,255,0)
			highlight.OutlineColor = plr.Team.TeamColor.Color
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Adornee = c
			local bbgui = nil
			if team == game.Teams.Humans and hesp then
				highlight.Parent = hlf
				highlight.Enabled = true
			elseif team == game.Teams.Monsters and zesp then
				highlight.Parent = hlf
				highlight.Enabled = true
				bbgui = Instance.new("BillboardGui")
				bbgui.Size = UDim2.new(10,0,1.5,0)
				bbgui.StudsOffset = Vector3.new(0,3.5,0)
				bbgui.Adornee = c:WaitForChild("Head",10)
				bbgui.AlwaysOnTop = true
				bbgui.Parent = highlight
				local txt = Instance.new("TextLabel")
				txt.TextScaled = true
				txt.BackgroundTransparency = 1
				txt.Size = UDim2.new(0,100,0,20)
				txt.Position = UDim2.new(0,0,0,0)
				txt.TextStrokeTransparency = 0
				txt.TextStrokeColor3 = Color3.fromRGB(255,255,255)
				txt.Text = ""
				txt.TextColor3 = Color3.fromRGB(255,255,355)
				txt.TextXAlignment = Enum.TextXAlignment.Center
				txt.Parent = bbgui
				coroutine.wrap(function()
					local thing = c:WaitForChild("Bomb",5)
					local thing2
					if not thing then
						thing2 = plr.Backpack:WaitForChild("Bomb",5)
					end
					if thing or thing2 then
						txt.Text = "Bomber"
						txt.TextColor3 = Color3.fromRGB(0,0,0)
					end
				end)()
				coroutine.wrap(function()
					local thing = c:WaitForChild("Dynamite",5)
					local thing2
					if not thing then
						thing2 = plr.Backpack:WaitForChild("Dynamite",5)
					end
					if thing or thing2 then
						txt.Text = "Rusher"
						txt.TextColor3 = Color3.fromRGB(255,155,0)
					end
				end)()
				coroutine.wrap(function()
					local thing = c:WaitForChild("Cannon",5)
					local thing2
					if not thing then
						thing2 = plr.Backpack:WaitForChild("Cannon",5)
					end
					if thing or thing2 then
						txt.Text = "Cannoneer"
						txt.TextColor3 = Color3.fromRGB(60,60,60)
					end
				end)()
				coroutine.wrap(function()
					local thing = c:WaitForChild("GravediggersPickaxe",5)
					local thing2
					if not thing then
						thing2 = plr.Backpack:WaitForChild("GravediggersPickaxe",5)
					end
					if thing or thing2 then
						txt.Text = "Gravedigger"
						txt.TextColor3 = Color3.fromRGB(0,150,0)
					end
				end)()
				coroutine.wrap(function()
					local thing = c:WaitForChild("GladiatorsSword",5)
					local thing2
					if not thing then
						thing2 = plr.Backpack:WaitForChild("GladiatorsSword",5)
					end
					if thing or thing2 then
						txt.Text = "Gladiator"
						txt.TextColor3 = Color3.fromRGB(200,0,0)
					end
				end)()
				coroutine.wrap(function()
					local thing = c:WaitForChild("HuntersBow",5)
					local thing2
					if not thing then
						thing2 = plr.Backpack:WaitForChild("HuntersBow",5)
					end
					if thing or thing2 then
						txt.Text = "Hunter"
						txt.TextColor3 = Color3.fromRGB(0,200,200)
					end
				end)()
			else
				highlight.Enabled = false
			end
			phl[highlight] = {tn=team.Name,p=plr,c=c,bb=bbgui}
		end
	end
	if plr.Character then
		dochar(plr.Character)
	end
	table.insert(toc,plr.CharacterAdded:Connect(dochar))
	table.insert(toc,plr.CharacterRemoving:Connect(function(c)
		for i,v in pairs(phl) do
			if v.c == c then
				phl[i] = nil
				i:Destroy()
			end
		end
	end))
end
for i,v in pairs(game.Players:GetPlayers()) do
	doplr(v)
end
table.insert(toc,game.Players.PlayerAdded:Connect(doplr))
lib.maketoggle("Human ESP",esp,function(bool)
	hesp = bool
	for i,v in pairs(phl) do
		if v.tn == "Humans" then
			i.Enabled = hesp
			if v.bb then
				v.bb.Enabled = hesp
			end
		end
	end
end)
lib.maketoggle("Zombie ESP",esp,function(bool)
	zesp = bool
	for i,v in pairs(phl) do
		if v.tn == "Monsters" then
			i.Enabled = zesp
			if v.bb then
				v.bb.Enabled = zesp
			end
		end
	end
end)
local otc = localplr:GetPropertyChangedSignal("Team"):Connect(function()
	for i,v in pairs(phl) do
		i.FillColor = (v.p.Team ~= localplr.Team and Color3.fromRGB(255,0,0)) or Color3.fromRGB(0,255,0)
	end
end)
lib.makelabel("This method will likely get patched. Use it while you can!",hw)
lib.makelabel("Weld method originally discovered by Failedmite and Janmandio.",hw)
lib.makelabel("Code taken from \"Welder V2\" Plugin in Infinite Yield",hw)
lib.makelabel("Turn on Low sUNC Support if you are using an executor like Xeno or Solara.",hw)
local lss = false
lib.maketoggle("Low sUNC Support",hw,function(bool)
	lss = bool
end)
local killweld = false
lib.maketoggle("(almost) Instant Kill (won't give points)",hw,function(bool)
	killweld = bool
end)
local weldoffsetx = 0
lib.makeslider("Weld Offset (X)",hw,-20,20,function(n)
	weldoffsetx = math.floor(n)
end)
local weldoffsety = 0
lib.makeslider("Weld Offset (Y)",hw,-20,20,function(n)
	weldoffsety = math.floor(n)
end)
local weldoffsetz = 0
lib.makeslider("Weld Offset (Z)",hw,-20,20,function(n)
	weldoffsetz = math.floor(n)
end)
local PhysicsService = game:GetService("PhysicsService")
local RunService = game:GetService("RunService")
local Players = game.Players

local RenderStepped = RunService.RenderStepped

local CurrentWeld = nil
local OriginalFPDH = workspace.FallenPartsDestroyHeight

local WELD_GROUP = (function()
	local buff = buffer.create(20)

	local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local clen = #charset

	for i = 1, 20 do
		local c = string.byte(charset, math.random(1, clen))
		buffer.writeu8(buff, i - 1, c)
	end

	return buffer.tostring(buff)
end)()

pcall(function()
	PhysicsService:RegisterCollisionGroup(WELD_GROUP)
	PhysicsService:CollisionGroupSetCollidable(WELD_GROUP, WELD_GROUP, true)
end)
function LowsUNCWeldTo(Part: BasePart, Speaker: Player, AnimationId: number | string): any
	if not Part.Parent then return end
	if Players:GetPlayerFromCharacter(Part.Parent :: Model) then
		local Humanoid = Part.Parent:FindFirstChildWhichIsA("Humanoid")
		workspace.Camera.CameraSubject = Humanoid
		if Humanoid then
			Humanoid.RequiresNeck = false
		end
	end
	local Character = Speaker.Character
	if not Character or not Character:FindFirstChild("HumanoidRootPart") then return nil end
	local Root = Character.HumanoidRootPart.AssemblyRootPart
	local Start = CFrame.new(Root.Position)
	local Weld = {}
	local Enabled = false
	local PartJoints: {JointInstance} = {}
	local OldProps = {}
	local OldCharProps = {}
	local AnimTrack = nil
	if AnimationId then
		local Animator = Character:FindFirstChildWhichIsA("Animator", true)
		if Animator then
			local Animation = Instance.new("Animation")
			Animation.AnimationId = "rbxassetid://" .. tostring(AnimationId)
			AnimTrack = Animator:LoadAnimation(Animation)
			AnimTrack:Play()
		end
	end
	Weld.Velocity = (killweld and (Vector3.new(0,10000,0))) or Vector3.zero
	function Weld:Enable(toggle)
		Enabled = toggle
		if not toggle then
			for _, Joint in next, PartJoints do Joint.Enabled = true end
			for PropName, Value in next, OldProps do (Part :: any)[PropName] = Value end
			for part, props in next, OldCharProps do
				if not part or not part.Parent then continue end
				part.CollisionGroup = props.Group
				part.CanCollide = props.Collide
			end
			return
		end
		PartJoints = Part:GetJoints() :: any
		for _, PropName in next, {
			"Size",
			"CanCollide",
			"Anchored",
			"Parent",
			"CollisionGroup"
			} do
			OldProps[PropName] = (Part :: any)[PropName]
		end
		for _, p in next, Character:GetDescendants() do
			if not p:IsA("BasePart") then continue end
			OldCharProps[p] = {
				Group = p.CollisionGroup,
				Collide = p.CanCollide
			}
			p.CollisionGroup = WELD_GROUP
			p.CanCollide = true
		end
		Part.Size = Vector3.new(25, 3, 25)
		Part.Anchored = false
		Part.CanCollide = true
		Part.CollisionGroup = WELD_GROUP
		Part.Parent = workspace.Terrain
		for _, Joint in next, PartJoints do
			Joint.Enabled = false
		end
	end
	local thread: thread = nil
	function Weld:Destroy()
		task.cancel(thread)
		Weld:Enable(false)
		if AnimTrack then AnimTrack:Stop(); AnimTrack:Destroy() end
	end
	thread = task.spawn(function()
		while task.wait() do
			if not Enabled then continue end

			Part.CFrame = Start
			Root.CFrame = Start * CFrame.new(weldoffsetx,weldoffsety,weldoffsetz)
			Part.AssemblyLinearVelocity = Vector3.zero
			Part.AssemblyAngularVelocity = Vector3.zero
			Root.AssemblyLinearVelocity = Weld.Velocity
			Root.AssemblyAngularVelocity = Vector3.zero

			RenderStepped:Wait()

			Part.CFrame = Start
			Root.CFrame = Start * CFrame.new(0, 4, 0)
			Part.AssemblyLinearVelocity = Vector3.zero
			Part.AssemblyAngularVelocity = Vector3.zero
		end
	end)
	Weld:Enable(true)
	return Weld
end
local function WeldTo(TargetPart: BasePart, Speaker: Player, AnimationId: number | string): any
	local Character = Speaker.Character
	if not Character then return nil end
	
	local Root = Character:FindFirstChild("HumanoidRootPart")
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	if not Root or not Humanoid then return nil end
	
	local AnimTrack = nil
	if AnimationId then
		local Animator = Character:FindFirstChildWhichIsA("Animator", true)
		if Animator then
			local Animation = Instance.new("Animation")
			Animation.AnimationId = "rbxassetid://" .. tostring(AnimationId)
			AnimTrack = Animator:LoadAnimation(Animation)
			AnimTrack:Play()
		end
	end

	local Weld = {}
	local Connection = nil
	
	for _, v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
			v.Massless = true
		end
	end
	
	Connection = RunService.Heartbeat:Connect(function()
		if not Character.Parent or not TargetPart.Parent then
			if Weld.Destroy then Weld:Destroy() end
			return
		end

		Root.CFrame = TargetPart.CFrame * CFrame.new(weldoffsetx,weldoffsety,weldoffsetz)
		Root.AssemblyLinearVelocity = (killweld and (Vector3.new(0,10000,0))) or Vector3.zero
		Root.AssemblyAngularVelocity = Vector3.zero
		
		if sethiddenproperty then
			pcall(function()
				sethiddenproperty(Root, "PhysicsRepRootPart", TargetPart)
			end)
		end
	end)

	function Weld:Destroy()
		if Connection then Connection:Disconnect() end
		if AnimTrack then AnimTrack:Stop(); AnimTrack:Destroy() end
		
		if Root then
			Root.AssemblyLinearVelocity = Vector3.zero
			Root.AssemblyAngularVelocity = Vector3.zero
		end
	end

	return Weld
end
lib.makebutton("Weld to a Random Human",hw,function()
	if CurrentWeld then
		CurrentWeld:Destroy()
	end
	local hrp = nil
	repeat
		task.wait()
		if #game.Teams.Humans:GetPlayers() > 0 + ((localplr.Team == game.Teams.Humans and 1) or 0) then
			randomplr = game.Teams.Humans:GetPlayers()[math.random(1,#game.Teams.Humans:GetPlayers())]
			if randomplr ~= localplr and randomplr.Character and randomplr.Character:FindFirstChild("HumanoidRootPart") then
				hrp = randomplr.Character.HumanoidRootPart
			end
		else
			break
		end
	until hrp
	if hrp then
		local weldfunc = nil
		if lss then
			weldfunc = LowsUNCWeldTo
		else
			weldfunc = WeldTo
		end
		CurrentWeld = weldfunc(hrp, localplr, 0)
	end
end)
lib.makebutton("Weld to a Random Zombie",hw,function()
	if CurrentWeld then
		CurrentWeld:Destroy()
	end
	local hrp = nil
	repeat
		task.wait()
		if #game.Teams.Monsters:GetPlayers() > 0 + ((localplr.Team == game.Teams.Monsters and 1) or 0) then
			randomplr = game.Teams.Monsters:GetPlayers()[math.random(1,#game.Teams.Monsters:GetPlayers())]
			if randomplr ~= localplr and randomplr.Character and randomplr.Character:FindFirstChild("HumanoidRootPart") then
				hrp = randomplr.Character.HumanoidRootPart
			end
		else
			break
		end
	until hrp
	if hrp then
		local weldfunc = nil
		if lss then
			weldfunc = LowsUNCWeldTo
		else
			weldfunc = WeldTo
		end
		CurrentWeld = weldfunc(hrp, localplr, 0)
	end
end)
lib.maketextbox("Weld to a Player",hw,function(plrname)
	if CurrentWeld then
		CurrentWeld:Destroy()
	end
	local hrp = nil
	for i,v in pairs(game.Players:GetPlayers()) do
		if (string.sub(v.DisplayName,1,#plrname):lower() == plrname or string.sub(v.Name,1,#plrname):lower() == plrname) and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
			hrp = v.Character.HumanoidRootPart
		end
	end
	if hrp then
		local weldfunc = nil
		if lss then
			weldfunc = LowsUNCWeldTo
		else
			weldfunc = WeldTo
		end
		CurrentWeld = weldfunc(hrp, localplr, 0)
	end
end)
lib.makebutton("Unweld",hw,function()
	if CurrentWeld then
		CurrentWeld:Destroy()
		workspace.Camera.CameraSubject = localplr.Character.Humanoid
	end
end)
lib.makebutton("Execute Infinite Yield",oscr,function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
lib.makebutton("Execute Telekinesis Script",oscr,function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Telekinesis-WIP-240257"))()
end)
if game:GetService("ReplicatedStorage").Remotes:FindFirstChild("ConsoleLog") then
	game:GetService("ReplicatedStorage").Remotes.ConsoleLog:Destroy()
	local fcl = Instance.new("RemoteFunction")
	fcl.Name = "ConsoleLog"
	fcl.Parent = game:GetService("ReplicatedStorage").Remotes
end
lib.ondestroyedfunc = function()
	on = false
	ha = false
	bha = false
	gha = false
	afc = false
	antisc = false
	antird = false
	hlf:Destroy()
	otc:Disconnect()
	ors:Disconnect()
	for i,v in pairs(toc) do
		v:Disconnect()
	end
	for i,v in pairs(workspace.Map.KillZones:GetChildren()) do
		v.CanTouch = true
	end
	localplr.PlayerGui.Overlay.Enabled = true
	newprt:Destroy()
	deathreq.Parent = game.ReplicatedStorage.Remotes
	if CurrentWeld then
		CurrentWeld:Destroy()
		workspace.Camera.CameraSubject = c.Humanoid
	end
	if oldfunc1 then
		require(localplr.PlayerScripts.Client.Character.JumpFatigue).GetCanFatigue = oldfunc1
	end
	if oldfunc2 then
		require(localplr.PlayerScripts.Client.Game.NoWallhop).GetIsOnGround = oldfunc2
	end
	if oldfunc3 then
		require(localplr.PlayerScripts.Client.Game.FallDamage).GetFallDamage = oldfunc3
	end
	if oldfunc4 then
		require(game.ReplicatedStorage.Packages.Ragdoll).EnableCharacterRagdoll = oldfunc4
	end
	if oldfunc5 then
		require(game.ReplicatedStorage.Packages.Ragdoll).StunCharacter = oldfunc5
	end
end