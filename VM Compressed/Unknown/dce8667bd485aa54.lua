loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.GameId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui")b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ResetOnSpawn=false b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: [UP] Just a baseplate. /  Green baseplate., game creator: the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer) return end

game.ReplicatedStorage["01_server"]:FireServer("cmd", "-gh 12103270510")

wait(2.5)

local Vector3_101 = Vector3.new(1, 0, 1)
local netless_Y = Vector3.new(0, 25.1, 0)
local function getNetlessVelocity(realPartVelocity) --edit this if you have a better netless method
    local unit = realPartVelocity.Unit
    if (unit.Y > 0.9) or (unit.Y < -0.9) then
        return realPartVelocity * (25.1 / realPartVelocity.Y)
    end
    realPartVelocity = Vector3_101 * realPartVelocity
    local mag = realPartVelocity.Magnitude
    if (mag > 1) and (mag < 100) then
        realPartVelocity = unit * Vector3_101 * 100
    end
    return realPartVelocity + netless_Y
end
local simradius = "shp" --simulation radius (net bypass) method
--"shp" - sethiddenproperty
--"ssr" - setsimulationradius
--false - disable
local noclipAllParts = false --set it to true if you want noclip
local flingpart = "HumanoidRootPart" --the part that will be used to fling (ctrl + F "fling function")
local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
local newanimate = true --disables the animate script and enables after reanimation
local discharscripts = true --disables all localScripts parented to your character before reanimation
local R15toR6 = true --tries to convert your character to r6 if its r15
local hatcollide = false --makes hats cancollide (credit to ShownApe) (works only with reanimate method 0)
local humState16 = true --enables collisions for limbs before the humanoid dies (using hum:ChangeState)
local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
local hedafterneck = true --disable aligns for head and enable after neck or torso is removed
local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
local method = 3 --reanimation method
--methods:
--0 - breakJoints (takes [loadtime] seconds to laod)
--1 - limbs
--2 - limbs + anti respawn
--3 - limbs + breakJoints after [loadtime] seconds
--4 - remove humanoid + breakJoints
--5 - remove humanoid + limbs
local alignmode = 2 --AlignPosition mode
--modes:
--1 - AlignPosition rigidity enabled true
--2 - 2 AlignPositions rigidity enabled both true and false
--3 - AlignPosition rigidity enabled false

local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local stepped = rs.Stepped
local heartbeat = rs.Heartbeat
local renderstepped = rs.RenderStepped
local sg = game:GetService("StarterGui")
local ws = game:GetService("Workspace")
local cf = CFrame.new
local v3 = Vector3.new
local v3_0 = Vector3.zero
local inf = math.huge

local c = lp.Character

if not (c and c.Parent) then
	return
end

c.Destroying:Connect(function()
	c = nil
end)

local function gp(parent, name, className)
	if typeof(parent) == "Instance" then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				return v
			end
		end
	end
	return nil
end



local function align(Part0, Part1)
	Part0.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

	local att0 = Instance.new("Attachment", Part0)
	att0.Orientation = v3_0
	att0.Position = v3_0
	att0.Name = "att0_" .. Part0.Name
	local att1 = Instance.new("Attachment", Part1)
	att1.Orientation = v3_0
	att1.Position = v3_0
	att1.Name = "att1_" .. Part1.Name

	if (alignmode == 1) or (alignmode == 2) then
		local ape = Instance.new("AlignPosition", att0)
		ape.ApplyAtCenterOfMass = false
		ape.MaxForce = inf
		ape.MaxVelocity = inf
		ape.ReactionForceEnabled = false
		ape.Responsiveness = 200
		ape.Attachment1 = att1
		ape.Attachment0 = att0
		ape.Name = "AlignPositionRtrue"
		ape.RigidityEnabled = true
	end

	if (alignmode == 2) or (alignmode == 3) then
		local apd = Instance.new("AlignPosition", att0)
		apd.ApplyAtCenterOfMass = false
		apd.MaxForce = inf
		apd.MaxVelocity = inf
		apd.ReactionForceEnabled = false
		apd.Responsiveness = 200
		apd.Attachment1 = att1
		apd.Attachment0 = att0
		apd.Name = "AlignPositionRfalse"
		apd.RigidityEnabled = false
	end

	local ao = Instance.new("AlignOrientation", att0)
	ao.MaxAngularVelocity = inf
	ao.MaxTorque = inf
	ao.PrimaryAxisOnly = false
	ao.ReactionTorqueEnabled = false
	ao.Responsiveness = 200
	ao.Attachment1 = att1
	ao.Attachment0 = att0
	ao.RigidityEnabled = false

	if type(getNetlessVelocity) == "function" then
	    local realVelocity = v3_0
        local steppedcon = stepped:Connect(function()
            Part0.Velocity = realVelocity
        end)
        local heartbeatcon = heartbeat:Connect(function()
            realVelocity = Part0.Velocity
            Part0.Velocity = getNetlessVelocity(realVelocity)
        end)
        Part0.Destroying:Connect(function()
            Part0 = nil
            steppedcon:Disconnect()
            heartbeatcon:Disconnect()
        end)
    end
end

local function respawnrequest()
	local ccfr = ws.CurrentCamera.CFrame
	local c = lp.Character
	lp.Character = nil
	lp.Character = c
	local con = nil
	con = ws.CurrentCamera.Changed:Connect(function(prop)
	    if (prop ~= "Parent") and (prop ~= "CFrame") then
	        return
	    end
	    ws.CurrentCamera.CFrame = ccfr
	    con:Disconnect()
    end)
end

local destroyhum = (method == 4) or (method == 5)
local breakjoints = (method == 0) or (method == 4)
local antirespawn = (method == 0) or (method == 2) or (method == 3)

hatcollide = hatcollide and (method == 0)

addtools = addtools and gp(lp, "Backpack", "Backpack")

local fenv = getfenv()
local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.set_simulation_rad or fenv.setsimulationrad

if shp and (simradius == "shp") then
	spawn(function()
		while c and heartbeat:Wait() do
			shp(lp, "SimulationRadius", inf)
		end
	end)
elseif ssr and (simradius == "ssr") then
	spawn(function()
		while c and heartbeat:Wait() do
			ssr(inf)
		end
	end)
end

antiragdoll = antiragdoll and function(v)
	if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
		v.Parent = nil
	end
end

if antiragdoll then
	for i, v in pairs(c:GetDescendants()) do
		antiragdoll(v)
	end
	c.DescendantAdded:Connect(antiragdoll)
end

if antirespawn then
	respawnrequest()
end

if method == 0 then
	wait(loadtime)
	if not c then
		return
	end
end

if discharscripts then
	for i, v in pairs(c:GetChildren()) do
		if v:IsA("LocalScript") then
			v.Disabled = true
		end
	end
elseif newanimate then
	local animate = gp(c, "Animate", "LocalScript")
	if animate and (not animate.Disabled) then
		animate.Disabled = true
	else
		newanimate = false
	end
end

if addtools then
	for i, v in pairs(addtools:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = c
		end
	end
end

pcall(function()
	settings().Physics.AllowSleep = false
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
end)

local OLDscripts = {}

for i, v in pairs(c:GetDescendants()) do
	if v.ClassName == "Script" then
		table.insert(OLDscripts, v)
	end
end

local scriptNames = {}

for i, v in pairs(c:GetDescendants()) do
	if v:IsA("BasePart") then
		local newName = tostring(i)
		local exists = true
		while exists do
			exists = false
			for i, v in pairs(OLDscripts) do
				if v.Name == newName then
					exists = true
				end
			end
			if exists then
				newName = newName .. "_"    
			end
		end
		table.insert(scriptNames, newName)
		Instance.new("Script", v).Name = newName
	end
end

c.Archivable = true
local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
	for i, v in pairs(hum:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end
local cl = c:Clone()
cl.Name = lp.Name
if hum and humState16 then
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    if destroyhum then
        wait(1.6)
    end
end
if hum and hum.Parent and destroyhum then
    hum:Destroy()
end

if not c then
    return
end

local head = gp(c, "Head", "BasePart")
local torso = gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart")
local root = gp(c, "HumanoidRootPart", "BasePart")
if hatcollide and c:FindFirstChildOfClass("Accessory") then
    local anything = c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script")
    if not (torso and root and anything) then
        return
    end
    torso:Destroy()
    root:Destroy()
    if shp then
        for i,v in pairs(c:GetChildren()) do
            if v:IsA("Accessory") then
                shp(v, "BackendAccoutrementState", 0)
            end 
        end
    end
    anything:Destroy()
end

for i, v in pairs(cl:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
		v.Anchored = false
	end
end

local model = Instance.new("Model", c)
model.Name = model.ClassName

model.Destroying:Connect(function()
	model = nil
end)

for i, v in pairs(c:GetChildren()) do
	if v ~= model then
		if addtools and v:IsA("Tool") then
			for i1, v1 in pairs(v:GetDescendants()) do
				if v1 and v1.Parent and v1:IsA("BasePart") then
					local bv = Instance.new("BodyVelocity", v1)
					bv.Velocity = v3_0
					bv.MaxForce = v3(1000, 1000, 1000)
					bv.P = 1250
					bv.Name = "bv_" .. v.Name
				end
			end
		end
		v.Parent = model
	end
end

if breakjoints then
	model:BreakJoints()
else
	if head and torso then
		for i, v in pairs(model:GetDescendants()) do
			if v:IsA("Weld") or v:IsA("Snap") or v:IsA("Glue") or v:IsA("Motor") or v:IsA("Motor6D") then
				local save = false
				if (v.Part0 == torso) and (v.Part1 == head) then
					save = true
				end
				if (v.Part0 == head) and (v.Part1 == torso) then
					save = true
				end
				if save then
					if hedafterneck then
						hedafterneck = v
					end
				else
					v:Destroy()
				end
			end
		end
	end
	if method == 3 then
		spawn(function()
			wait(loadtime)
			if model then
				model:BreakJoints()
			end
		end)
	end
end

cl.Parent = c
for i, v in pairs(cl:GetChildren()) do
	v.Parent = c
end
cl:Destroy()

local noclipmodel = (noclipAllParts and c) or model
local noclipcon = nil
local function uncollide()
	if noclipmodel then
		for i, v in pairs(noclipmodel:GetDescendants()) do
		    if v:IsA("BasePart") then
			    v.CanCollide = false
		    end
		end
	else
		noclipcon:Disconnect()
	end
end
noclipcon = stepped:Connect(uncollide)
uncollide()

for i, scr in pairs(model:GetDescendants()) do
	if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
		local Part0 = scr.Parent
		if Part0:IsA("BasePart") then
			for i1, scr1 in pairs(c:GetDescendants()) do
				if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
					local Part1 = scr1.Parent
					if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
						align(Part0, Part1)
						break
					end
				end
			end
		end
	end
end

for i, v in pairs(c:GetDescendants()) do
	if v and v.Parent then
		if v.ClassName == "Script" then
			if table.find(scriptNames, v.Name) then
				v:Destroy()
			end
		elseif not v:IsDescendantOf(model) then
			if v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("ForceField") then
				v.Visible = false
			elseif v:IsA("Sound") then
				v.Playing = false
			elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			end
		end
	end
end

if newanimate then
	local animate = gp(c, "Animate", "LocalScript")
	if animate then
		animate.Disabled = false
	end
end

if addtools then
	for i, v in pairs(c:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = addtools
		end
	end
end

local hum0 = model:FindFirstChildOfClass("Humanoid")
if hum0 then
    hum0.Destroying:Connect(function()
        hum0 = nil
    end)
end

local hum1 = c:FindFirstChildOfClass("Humanoid")
if hum1 then
    hum1.Destroying:Connect(function()
        hum1 = nil
    end)
end

if hum1 then
	ws.CurrentCamera.CameraSubject = hum1
	local camSubCon = nil
	local function camSubFunc()
		camSubCon:Disconnect()
		if c and hum1 then
			ws.CurrentCamera.CameraSubject = hum1
		end
	end
	camSubCon = renderstepped:Connect(camSubFunc)
	if hum0 then
		hum0:GetPropertyChangedSignal("Jump"):Connect(function()
			if hum1 then
				hum1.Jump = hum0.Jump
			end
		end)
	else
		respawnrequest()
	end
end

local rb = Instance.new("BindableEvent", c)
rb.Event:Connect(function()
	rb:Destroy()
	sg:SetCore("ResetButtonCallback", true)
	if destroyhum then
		c:BreakJoints()
		return
	end
	if hum0 and (hum0.Health > 0) then
		model:BreakJoints()
		hum0.Health = 0
	end
	if antirespawn then
	    respawnrequest()
	end
end)
sg:SetCore("ResetButtonCallback", rb)

spawn(function()
	while c do
		if hum0 and hum1 then
			hum1.Jump = hum0.Jump
		end
		wait()
	end
	sg:SetCore("ResetButtonCallback", true)
end)

R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
if R15toR6 then
    local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
	if part then
	    local cfr = part.CFrame
		local R6parts = { 
			head = {
				Name = "Head",
				Size = v3(2, 1, 1),
				R15 = {
					Head = 0
				}
			},
			torso = {
				Name = "Torso",
				Size = v3(2, 2, 1),
				R15 = {
					UpperTorso = 0.2,
					LowerTorso = -0.8
				}
			},
			root = {
				Name = "HumanoidRootPart",
				Size = v3(2, 2, 1),
				R15 = {
					HumanoidRootPart = 0
				}
			},
			leftArm = {
				Name = "Left Arm",
				Size = v3(1, 2, 1),
				R15 = {
					LeftHand = -0.85,
					LeftLowerArm = -0.2,
					LeftUpperArm = 0.4
				}
			},
			rightArm = {
				Name = "Right Arm",
				Size = v3(1, 2, 1),
				R15 = {
					RightHand = -0.85,
					RightLowerArm = -0.2,
					RightUpperArm = 0.4
				}
			},
			leftLeg = {
				Name = "Left Leg",
				Size = v3(1, 2, 1),
				R15 = {
					LeftFoot = -0.85,
					LeftLowerLeg = -0.15,
					LeftUpperLeg = 0.6
				}
			},
			rightLeg = {
				Name = "Right Leg",
				Size = v3(1, 2, 1),
				R15 = {
					RightFoot = -0.85,
					RightLowerLeg = -0.15,
					RightUpperLeg = 0.6
				}
			}
		}
		for i, v in pairs(c:GetChildren()) do
			if v:IsA("BasePart") then
				for i1, v1 in pairs(v:GetChildren()) do
					if v1:IsA("Motor6D") then
						v1.Part0 = nil
					end
				end
			end
		end
		part.Archivable = true
		for i, v in pairs(R6parts) do
			local part = part:Clone()
			part:ClearAllChildren()
			part.Name = v.Name
			part.Size = v.Size
			part.CFrame = cfr
			part.Anchored = false
			part.Transparency = 1
			part.CanCollide = false
			for i1, v1 in pairs(v.R15) do
				local R15part = gp(c, i1, "BasePart")
				local att = gp(R15part, "att1_" .. i1, "Attachment")
				if R15part then
					local weld = Instance.new("Weld", R15part)
					weld.Name = "Weld_" .. i1
					weld.Part0 = part
					weld.Part1 = R15part
					weld.C0 = cf(0, v1, 0)
					weld.C1 = cf(0, 0, 0)
					R15part.Massless = true
					R15part.Name = "R15_" .. i1
					R15part.Parent = part
					if att then
						att.Parent = part
						att.Position = v3(0, v1, 0)
					end
				end
			end
			part.Parent = c
			R6parts[i] = part
		end
		local R6joints = {
			neck = {
				Parent = R6parts.torso,
				Name = "Neck",
				Part0 = R6parts.torso,
				Part1 = R6parts.head,
				C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
				C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
			},
			rootJoint = {
				Parent = R6parts.root,
				Name = "RootJoint" ,
				Part0 = R6parts.root,
				Part1 = R6parts.torso,
				C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
				C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
			},
			rightShoulder = {
				Parent = R6parts.torso,
				Name = "Right Shoulder",
				Part0 = R6parts.torso,
				Part1 = R6parts.rightArm,
				C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
				C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			},
			leftShoulder = {
				Parent = R6parts.torso,
				Name = "Left Shoulder",
				Part0 = R6parts.torso,
				Part1 = R6parts.leftArm,
				C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
				C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			},
			rightHip = {
				Parent = R6parts.torso,
				Name = "Right Hip",
				Part0 = R6parts.torso,
				Part1 = R6parts.rightLeg,
				C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
				C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			},
			leftHip = {
				Parent = R6parts.torso,
				Name = "Left Hip" ,
				Part0 = R6parts.torso,
				Part1 = R6parts.leftLeg,
				C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
				C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			}
		}
		for i, v in pairs(R6joints) do
			local joint = Instance.new("Motor6D")
			for prop, val in pairs(v) do
				joint[prop] = val
			end
			R6joints[i] = joint
		end
		hum1.RigType = Enum.HumanoidRigType.R6
		hum1.HipHeight = 0
	end
end

local torso1 = torso
torso = gp(c, "Torso", "BasePart") or ((not R15toR6) and gp(c, torso.Name, "BasePart"))
if (typeof(hedafterneck) == "Instance") and head and torso and torso1 then
	local conNeck = nil
	local conTorso = nil
	local contorso1 = nil
	local aligns = {}
	local function enableAligns()
	    conNeck:Disconnect()
        conTorso:Disconnect()
        conTorso1:Disconnect()
		for i, v in pairs(aligns) do
			v.Enabled = true
		end
	end
	conNeck = hedafterneck.Changed:Connect(function(prop)
	    if table.find({"Part0", "Part1", "Parent"}, prop) then
	        enableAligns()
		end
	end)
	conTorso = torso:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
	conTorso1 = torso1:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
	for i, v in pairs(head:GetDescendants()) do
		if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
			i = tostring(i)
			aligns[i] = v
			v.Destroying:Connect(function()
			    aligns[i] = nil
			end)
			v.Enabled = false
		end
	end
end

--[[
    fling function
    usage: fling(target, duration, velocity)
    target can be set to: basePart, CFrame, Vector3, character model or humanoid
    duration (fling time) can be set to a number or a string containing the number (in seconds) will be set to 0.5 if not provided,
    velocity (fling part rotation velocity) can be set to a vector3 value (Vector3.new(20000, 20000, 20000) if not provided)
]]

local flingpart0 = gp(model, flingpart, "BasePart")
local flingpart1 = gp(c, flingpart, "BasePart")

local fling = function() end
if flingpart0 and flingpart1 then
    flingpart0.Destroying:Connect(function()
        flingpart0 = nil
        fling = function() end
    end)
    flingpart0.Archivable = true
    flingpart1.Destroying:Connect(function()
        flingpart1 = nil
        fling = function() end
    end)
    local att0 = gp(flingpart0, "att0_" .. flingpart0.Name, "Attachment")
    local att1 = gp(flingpart1, "att1_" .. flingpart1.Name, "Attachment")
    if att0 and att1 then
        att0.Destroying:Connect(function()
            att0 = nil
            fling = function() end
        end)
        att1.Destroying:Connect(function()
            att1 = nil
            fling = function() end
        end)
        local lastfling = nil
        fling = function(target, duration, rotVelocity)
            if typeof(target) == "Instance" then
                if target:IsA("BasePart") then
                    target = target.Position
                elseif target:IsA("Model") then
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                elseif target:IsA("Humanoid") then
                    local parent = target.Parent
                    if not (parent and parent:IsA("Model")) then
                        return
                    end
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                else
                    return
                end
            elseif typeof(target) == "CFrame" then
                target = target.Position
            elseif typeof(target) ~= "Vector3" then
                return
            end
            lastfling = target
            if type(duration) ~= "number" then
                duration = tonumber(duration) or 0.5
            end
            if typeof(rotVelocity) ~= "Vector3" then
                rotVelocity = v3(20000, 20000, 20000)
            end
            if not (target and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            local flingpart = flingpart0:Clone()
            flingpart.Transparency = 1
            flingpart.Size = v3(0.01, 0.01, 0.01)
            flingpart.CanCollide = false
            flingpart.Name = "flingpart_" .. flingpart0.Name
            flingpart.Anchored = true
            flingpart.Velocity = v3_0
            flingpart.RotVelocity = v3_0
            flingpart.Destroying:Connect(function()
                flingpart = nil
            end)
            flingpart.Parent = flingpart1
            if flingpart0.Transparency > 0.5 then
                flingpart0.Transparency = 0.5
            end
            att1.Parent = flingpart
            for i, v in pairs(att0:GetChildren()) do
                if v:IsA("AlignOrientation") then
                    v.Enabled = false
                end
            end
            local con = nil
            con = heartbeat:Connect(function()
                if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                    flingpart0.RotVelocity = rotVelocity
                    flingpart.Position = target
                else
                    con:Disconnect()
                end
            end)
            local steppedRotVel = v3(
                ((rotVelocity.X > 0) and -1) or 1,
                ((rotVelocity.Y > 0) and -1) or 1,
                ((rotVelocity.Z > 0) and -1) or 1
            )
            local con = nil
            con = stepped:Connect(function()
                if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                    flingpart0.RotVelocity = steppedRotVel
                    flingpart.Position = target
                else
                    con:Disconnect()
                end
            end)
            wait(duration)
            if lastfling ~= target then
                if flingpart then
                    if att1 and (att1.Parent == flingpart) then
                        att1.Parent = flingpart1
                    end
                    flingpart:Destroy()
                end
                return
            end
            target = nil
            if not (flingpart and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            flingpart0.RotVelocity = v3_0


            att1.Parent = flingpart1
            for i, v in pairs(att0:GetChildren()) do
                if v:IsA("AlignOrientation") then
                    v.Enabled = true
                end
            end
            if flingpart then
                flingpart:Destroy()
            end
        end
    end
end



wait(0.2)

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 25
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
local FADERS = true

--//=================================\\
--\\=================================//


--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

local script = Instance.new("Folder", game.Players.LocalPlayer.Character)

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

--//=================================\\
--\\=================================//

--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
 
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "rbxassetid://"..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

function R_RANDOM(CFRAME,DIST)
	return CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,-DIST)
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	local Ignore = ((type(Ignore) == "table" and Ignore) or {Ignore})
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, DIRECTION * Distance), Ignore)
end

local DECAL = IT("Decal")
function MagicRing()
	local RING = CreatePart(3, Effects, "Granite", 0, 1, "Maroon", "MagicRing", VT(0,0,0),true)
	local MESH = IT("BlockMesh",RING)
	local BOTTOMTEXTURE = DECAL:Clone()
	BOTTOMTEXTURE.Parent = RING
	BOTTOMTEXTURE.Face = "Bottom"
	BOTTOMTEXTURE.Name = "BottomTexture"
	local TOPTEXTURE = DECAL:Clone()
	TOPTEXTURE.Parent = RING
	TOPTEXTURE.Face = "Top"
	TOPTEXTURE.Name = "TopTexture"
	BOTTOMTEXTURE.Texture = "http://www.roblox.com/asset/?id=1208118228"
	TOPTEXTURE.Texture = "http://www.roblox.com/asset/?id=1208118228"
	BOTTOMTEXTURE.Color3 = C3(0,0,0)
	TOPTEXTURE.Color3 = C3(0,0,0)
	return RING,MESH,TOPTEXTURE,BOTTOMTEXTURE
end



function CharacterFade(COLOR,TIMER,MOVEDIRECTION,PARENT)
	coroutine.resume(coroutine.create(function()
		local FADE = IT("Model",Effects)
		if PARENT ~= nil then
			FADE.Parent = PARENT
		end
		--FADE.Name = "FadingEffect"
		--for _, c in pairs(Character:GetChildren()) do
			--if c.ClassName == "Part" then
				--c.CanCollide = false
				--local FADER = CreatePart(3, FADE, "Neon", 0, 0.75, BRICKC("Pearl"), c.Name, c.Size, true)
				--FADER.CFrame = c.CFrame
				--FADER.Color = COLOR
				--if FADER.Name == "Head" then
					--Head:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = FADER
				--elseif FADER.Name == "HumanoidRootPart" then
					--FADE.PrimaryPart = FADER
					--FADER.Transparency = 1
				--end
			--end
		--end
		local TRANS = 0.25/TIMER
		local DIST = nil
		if MOVEDIRECTION ~= nil then
			DIST = (FADE.PrimaryPart.Position - MOVEDIRECTION).Magnitude
		end
		for i = 1, TIMER do
			Swait()
			for _, c in pairs(FADE:GetChildren()) do
				if c.ClassName == "Part" then
					c.Transparency = c.Transparency + TRANS
				end
			end
			if MOVEDIRECTION ~= nil then
				local ORI = FADE.PrimaryPart.Orientation
				FADE:SetPrimaryPartCFrame(CF(CF(FADE.PrimaryPart.Position,MOVEDIRECTION)*CF(0,0,-DIST/TIMER).p) * ANGLES(RAD(ORI.X), RAD(ORI.Y), RAD(ORI.Z)))
			end
		end
		FADE:remove()
	end))
end

--//=================================\\
--||	    GUIS AND MISC
--\\=================================//

local EYE = CreatePart(3, Character, "Neon", 0, 0, BRICKC("Really black"), "TheEye", VT(0.16,0.16,0.16), true)
MakeForm(EYE,"Ball")
CreateWeldOrSnapOrMotor("Weld", Head, Head, EYE, CF(-0.15, 0.2, -0.57) * ANGLES(RAD(0), RAD(15), RAD(0)) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local BLADE = CreatePart(3, Effects, "Fabric", 0, 0, BRICKC("Really black"), "Abyssal_Sword", VT(1, 7.6, 1), true)
CreateMesh("SpecialMesh", BLADE, "FileMesh", "0", "0", VT(1,1,1), VT(0,0,0))
BLADE.CFrame = RootPart.CFrame * CF(0.4,1,4) * ANGLES(RAD(195), RAD(15), RAD(15))



game:GetService("Players").LocalPlayer.Character["PlaneModel"].Handle.att1_Handle.Parent = BLADE
BLADE.att1_Handle.Position = Vector3.new(-0,1,-0.5)
BLADE.att1_Handle.Rotation = Vector3.new(-90,-0,-0)

local SKILLTEXTCOLOR = C3(0,0,0)
local SKILLFONT = "Fantasy"
local SKILLTEXTSIZE = 4
local SKILLTEXTSIZE2 = 12

local ATTACKS = {"this no work too - :(","Abyssal Dash - X","sorry this no work - :(","no work - :(","Nightmare Fall - Q"}

for i = 1, #ATTACKS do
	local SKILLFRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.74, 0, 0.97-(0.04*i), 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill Frame")
	local SKILLTEXT = CreateLabel(SKILLFRAME, "["..ATTACKS[i].."]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 1, "Skill text")
	SKILLTEXT.TextXAlignment = "Right"
	SKILLTEXT.Rotation = i*3
end

local BMUSIC = IT("Sound",RootPart)
local VOLUME = 5
local PITCH = 1
local SONGID = 9048378262
local A = IT("Attachment",Torso)

coroutine.resume(coroutine.create(function()
	while wait(1) do
		if FADERS == true then
			coroutine.resume(coroutine.create(function()
				local R,M,T,B = MagicRing()
				R.Anchored = false
				CreateWeldOrSnapOrMotor("Weld", EYE, EYE, R, CF(0,0,0), CF(0, 0, 0))
				local R2,M2,T2,B2 = MagicRing()
				R2.Anchored = false
				CreateWeldOrSnapOrMotor("Weld", EYE, EYE, R2, CF(0,0,0), CF(0, 0, 0))
				for i = 1, 35 do
					Swait()
					M.Scale = M.Scale + VT(1,0,1)*1.2
					T.Transparency = i/35
					B.Transparency = i/35
					M2.Scale = M2.Scale + VT(1,0,1)*0.6
					T2.Transparency = i/35
					B2.Transparency = i/35
				end
				R:Remove()
				R2:Remove()
			end))
		end
	end
end))

--//=================================\\
--||			DAMAGING
--\\=================================//


function ApplyDamage(Humanoid,Damage)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health < 2000 then
		if Humanoid.Health - Damage > 0 then
			Humanoid.Health = Humanoid.Health - Damage
		else
			
		end
	else
		
	end
end


--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

function Melee()
	ATTACK = true
	BLADE.CanCollide = true
	Rooted = false
	EQUIPPED = true
	local HIT = function()
		local HITS = {}
		local TOUCH = BLADE.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent ~= Character then
				local HUM = hit.Parent:FindFirstChildOfClass("Humanoid")
				local TORSO = hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso")
				if TORSO and HUM.Health > 0 then
					local PASS = true
					for i = 1, #HITS do
						if HITS[i] == hit.Parent then
							PASS = false
						end
					end
					table.insert(HITS,hit.Parent)
						if PASS == true then
						ApplyDamage(HUM,MRANDOM(0,0))
					end
				end
			end
		end)
		return TOUCH
	end
	if COMBO == 1 then
		for i=0, 0.35, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(15)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35, -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
		end
		CreateSound(1489705211,BLADE,MRANDOM(7,8),MRANDOM(8,13)/12,false)
		local TOUCHED = HIT()
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(35)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-35)), 0.9 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.8, 0.5, -0.7) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(15), RAD(180), RAD(0)) * RIGHTSHOULDERC0, 0.6 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35, -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
		end
		TOUCHED:Disconnect()
		COMBO = 2
	elseif COMBO == 2 then
		for i=0, 0.35, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.75, 0) * ANGLES(RAD(160), RAD(0), RAD(-5)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35, -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
		end
		CreateSound(1489705211,BLADE,MRANDOM(7,8),MRANDOM(8,13)/12,false)
		local TOUCHED = HIT()
		for i=0, 0.35, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(15)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 0.8 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.25, -0.5) * ANGLES(RAD(85), RAD(0), RAD(-5)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35, -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
		end
		TOUCHED:Disconnect()
		for i=0, 0.2, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(15)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 0.8 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.25, -0.5) * ANGLES(RAD(85), RAD(0), RAD(-5)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35, -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RootPart.CFrame*CF(4,0.3,0) * ANGLES(RAD(195), RAD(-25), RAD(15)),0.4)
		end
		COMBO = 1
	end
	coroutine.resume(coroutine.create(function()
		for i = 1, 50 do
			Swait()
			if ATTACK == true then
				break
			end
		end
		if ATTACK == false then
			COMBO = 1
		end
	end))
	BLADE.CanCollide = false
	ATTACK = false
	Rooted = false
	EQUIPPED = false
end
function AbyssalShriek()
	if ANIM ~= "Fall" and ANIM ~= "Jump" then
		ATTACK = true
		Rooted = true
		for i=0, 0.2, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.5 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(0), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-15)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(15)), 1 / Animation_Speed)
		end
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-35), RAD(MRANDOM(-5,5)), RAD(MRANDOM(-5,5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(-15+MRANDOM(-5,5)), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(15+MRANDOM(-5,5)), RAD(-35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.1) * ANGLES(RAD(0), RAD(85), RAD(MRANDOM(-5,5))) * ANGLES(RAD(-1), RAD(0), RAD(-12)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.1) * ANGLES(RAD(0), RAD(-85), RAD(MRANDOM(-5,5))) * ANGLES(RAD(-1), RAD(0), RAD(12)), 1 / Animation_Speed)
			until ATTACK == false
		end))
		WACKYEFFECT({Time = 65, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(25,25,25), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.Position+VT(0,1.5,0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 15})
		CreateSound(199978176,Head,5,1,false)
		for i = 1, 60 do
			Swait()
			ApplyAoE(RootPart.Position,17,1,1,0,false)
			local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight, Character)
			if HITFLOOR then
				WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(20,1,20), Size2 = VT(25+MRANDOM(0,8),7,25+MRANDOM(0,8)), Transparency = 0.95, Transparency2 = 1, CFrame = CF(HITPOS)*ANGLES(RAD(0),RAD(MRANDOM(0,360)),RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
			local SIZE = VT(1,3,1)
			WACKYEFFECT({EffectType = "Sphere", Size = VT(0,0,0), Size2 = SIZE*MRANDOM(10,65)/10, Transparency = 0.5, Transparency2 = 1, CFrame = CF(RootPart.Position) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))*CF(0,MRANDOM(1,17),MRANDOM(0,12)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 5})
		end
		wait(0.2)
		ATTACK = false
		Rooted = false
	end
end
function AbyssalDash()
	ATTACK = true
	Rooted = true
	UNANCHOR = false
	for i=0, 0.4, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.5 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(0), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-15)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(15)), 1 / Animation_Speed)
	end
	CreateSound(1177785010,Torso,2,1,false)
	CreateSound(971125740,Torso,5,1,false)
	WACKYEFFECT({Time = 65, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(25,25,25), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 331666014, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
	for index, CHILD in pairs(Character:GetChildren()) do
		if CHILD:IsA("BasePart") then
			CHILD.Transparency = CHILD.Transparency + 1
		elseif CHILD:IsA("Accessory") then
			CHILD.Handle.Transparency = CHILD.Handle.Transparency + 1
		end
	end
	local HITS = {}
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		for index, CHILD in pairs(workspace:GetDescendants()) do
			if CHILD.ClassName == "Model" and CHILD ~= Character then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - RootPart.Position).Magnitude <= 25 then
							local PASS = true
							for E = 1, #HITS do
								if HITS[E] == CHILD then
									PASS = false
								end
							end
							if PASS == true then
								local DMG = MRANDOM(0,0)
								ApplyDamage(HUM,DMG)
								table.insert(HITS,CHILD)
							end
						end
					end
				end
			end
		end	
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(25,0,25), Transparency = 0.8, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,-6) * ANGLES(RAD(-90), RAD(MRANDOM(0,360)), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 50})
		for i = 1, 2 do
			RootPart.CFrame = RootPart.CFrame*CF(0,0,-1)
			CharacterFade(C3(0,0,0),25,R_RANDOM(Torso.CFrame,1.25).p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(65), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-25 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.5 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(-25), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(-25), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	end
	for index, CHILD in pairs(Character:GetChildren()) do
		if CHILD:IsA("BasePart") then
			CHILD.Transparency = CHILD.Transparency - 1
		elseif CHILD:IsA("Accessory") then
			CHILD.Handle.Transparency = CHILD.Handle.Transparency - 1
		end
	end
	for i=1, 25 do
		Swait()
		RootPart.CFrame = RootPart.CFrame*CF(0,0,-((25-i)/25))
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-35), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-35), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-45)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-25), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	UNANCHOR = true
	ATTACK = false
	Rooted = false
end
function ShadowCloak()
	if ANIM ~= "Fall" and ANIM ~= "Jump" then
		ATTACK = true
		Rooted = false
		UNANCHOR = false
		FADERS = false
		coroutine.resume(coroutine.create(function()
			coroutine.resume(coroutine.create(function()
				for i=1, 25 do
					Swait()
					RootPart.CFrame = RootPart.CFrame*CF(0,(25-i)/25,0)
				end
			end))
			repeat
				Swait()
				BLADE.Transparency = Torso.Transparency
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-35), RAD(MRANDOM(-5,5)), RAD(MRANDOM(-5,5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(-15+MRANDOM(-5,5)), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(15+MRANDOM(-5,5)), RAD(-35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.1) * ANGLES(RAD(0), RAD(85), RAD(MRANDOM(-5,5))) * ANGLES(RAD(-1), RAD(0), RAD(-12)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.1) * ANGLES(RAD(0), RAD(-85), RAD(MRANDOM(-5,5))) * ANGLES(RAD(-1), RAD(0), RAD(12)), 1 / Animation_Speed)
			until ATTACK == false
		end))
		WACKYEFFECT({Time = 65, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(25,1,25), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.Position-VT(0,3.5,0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 814168787, SoundPitch = 0.6, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 12})
		WACKYEFFECT({Time = 65, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(25,1,25), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.Position-VT(0,3.5,0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 814168787, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
		for i = 1, 50 do
			Swait()
			CharacterFade(C3(0,0,0),12,R_RANDOM(Torso.CFrame,1.25).p)
			for index, CHILD in pairs(Character:GetChildren()) do
				if CHILD:IsA("BasePart") then
					CHILD.Transparency = CHILD.Transparency + 1/50
				elseif CHILD:IsA("Accessory") then
					CHILD.Handle.Transparency = CHILD.Handle.Transparency + 1/50
				end
			end
		end
		for i = 1, 25 do
			Swait()
			CharacterFade(C3(0,0,0),12,R_RANDOM(Torso.CFrame,1.25).p)
		end
		RootPart.CFrame = CF(Mouse.Hit.p+VT(0,12,0)) * ANGLES(RAD(0), RAD(RootPart.Orientation.Y), RAD(0))
		for i = 1, 5 do
			WACKYEFFECT({Time = 50, EffectType = "Round Slash", Size = VT(0,0,0), Size2 = VT(0.3,0,0.3), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 10})
		end
		ApplyAoE(Torso.Position,15,12,22,150,false)
		CreateSound(331666014,Torso,5,1,false)
		for i = 1, 12 do
			Swait()
			CharacterFade(C3(0,0,0),12,R_RANDOM(Torso.CFrame,1.25).p)
		end
		for i = 1, 50 do
			Swait()
			CharacterFade(C3(0,0,0),12,R_RANDOM(Torso.CFrame,1.25).p)
			for index, CHILD in pairs(Character:GetChildren()) do
				if CHILD:IsA("BasePart") then
					CHILD.Transparency = CHILD.Transparency - 1/50
				elseif CHILD:IsA("Accessory") then
					CHILD.Handle.Transparency = CHILD.Handle.Transparency - 1/50
				end
			end
		end
		UNANCHOR = true
		ATTACK = false
		Rooted = false
		FADERS = true
	end
end
function BlackBlast()
	if ANIM ~= "Fall" and ANIM ~= "Jump" then
		ATTACK = true
		Rooted = true
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 25
		GYRO.P = 20000
		GYRO.MaxTorque = VT(0,4000000,0)
		GYRO.CFrame = CF(RootPart.Position,Mouse.Hit.p)
		CreateSound(429459101,Torso,5,1.5,false)
		local GYROING = true
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				GYRO.CFrame = CF(RootPart.Position,Mouse.Hit.p)
			until GYROING == false
			GYRO:Remove()
		end))
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.5 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(0), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-15)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(-70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(15)), 1 / Animation_Speed)
		end
		for i = 1, 13 do
			WACKYEFFECT({Time = 55, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(i,0,i)*2, Transparency = 0.8, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,7.5-i) * ANGLES(RAD(-90), RAD(MRANDOM(0,360)), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 50})
		end
		CreateSound(1368637781,Torso,5,1.5,false)
		WACKYEFFECT({Time = 65, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(12,12,12), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 331666014, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
		for index, CHILD in pairs(Character:GetChildren()) do
			if CHILD:IsA("BasePart") then
				CHILD.Transparency = CHILD.Transparency + 1
			elseif CHILD:IsA("Accessory") then
				CHILD.Handle.Transparency = CHILD.Handle.Transparency + 1
			end
		end
		GYROING = false
		coroutine.resume(coroutine.create(function()
			coroutine.resume(coroutine.create(function()
				for i=1, 25 do
					Swait()
					RootPart.CFrame = RootPart.CFrame*CF(0,0,(25-i)/25)
				end
			end))
			repeat
				Swait()
				CharacterFade(C3(0,0,0),12,R_RANDOM(Torso.CFrame,1.25).p)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-35), RAD(MRANDOM(-5,5)), RAD(MRANDOM(-5,5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(-15+MRANDOM(-5,5)), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(15+MRANDOM(-5,5)), RAD(-35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.1) * ANGLES(RAD(0), RAD(85), RAD(MRANDOM(-5,5))) * ANGLES(RAD(-1), RAD(0), RAD(-12)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.1) * ANGLES(RAD(0), RAD(-85), RAD(MRANDOM(-5,5))) * ANGLES(RAD(-1), RAD(0), RAD(12)), 1 / Animation_Speed)
			until ATTACK == false
		end))
		coroutine.resume(coroutine.create(function()
			local BULLETCFRAME = RootPart.CFrame
			local EXPLODED = false
			coroutine.resume(coroutine.create(function()
				repeat
					Swait()
					WACKYEFFECT({Time = 15, EffectType = "Block", Size = VT(15,15,15), Size2 = VT(10,10,10), Transparency = 0.3, Transparency2 = 1, CFrame = CF(BULLETCFRAME.p), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
					WACKYEFFECT({Time = 15, EffectType = "Block", Size = VT(15,15,15), Size2 = VT(25,25,25), Transparency = 0.8, Transparency2 = 1, CFrame = CF(BULLETCFRAME.p), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
				until EXPLODED == true
			end))
			for i=1, 50 do
				Swait()
				BULLETCFRAME = BULLETCFRAME*CF(0,0,-((50-i)/15))
				local RAY,HIT,NORM = Raycast(BULLETCFRAME.p,BULLETCFRAME.lookVector,7,Character)
				if RAY then
					ApplyAoE(BULLETCFRAME.p,25,12,54,350,false)
					WACKYEFFECT({Time = 45, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,0,160), Transparency = 0.6, Transparency2 = 1, CFrame = CF(HIT,HIT+NORM) * ANGLES(RAD(-90), RAD(MRANDOM(0,360)), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 765590102, SoundPitch = MRANDOM(9,11)/10, SoundVolume = 10})
					break
				end
			end
			wait(0.5)
			WACKYEFFECT({Time = 85, EffectType = "Sphere", Size = VT(25,25,25), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 1, CFrame = CF(BULLETCFRAME.p), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 401056199, SoundPitch = 0.7, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
			WACKYEFFECT({Time = 85, EffectType = "Sphere", Size = VT(25,25,25), Size2 = VT(50,50,50), Transparency = 0, Transparency2 = 1, CFrame = CF(BULLETCFRAME.p), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 401056199, SoundPitch = 1, SoundVolume = 10, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
			for E = 1, 3 do
				for i = 1, 5 do
					WACKYEFFECT({Time = 50, EffectType = "Round Slash", Size = VT(0,0,0), Size2 = VT(E,0,E)/2, Transparency = 0, Transparency2 = 1, CFrame = CF(BULLETCFRAME.p) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 10})
				end
			end
			ApplyAoE(BULLETCFRAME.p,125,25,75,250,false)
			EXPLODED = true
			for i = 1, 15 do
				Swait()
				WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,0,160), Transparency = 0.6, Transparency2 = 1, CFrame = BULLETCFRAME * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 1, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = MRANDOM(9,11)/10, SoundVolume = MRANDOM(9,11)/2})
			end
		end))
		wait(0.5)
		for index, CHILD in pairs(Character:GetChildren()) do
			if CHILD:IsA("BasePart") then
				CHILD.Transparency = CHILD.Transparency - 1
			elseif CHILD:IsA("Accessory") then
				CHILD.Handle.Transparency = CHILD.Handle.Transparency - 1
			end
		end
		ATTACK = false
		Rooted = false
	end
end
function NightmareFall()
	if ANIM ~= "Fall" and ANIM ~= "Jump" and DAMAGEMULTIPLIER == 1 then
		ATTACK = true
		Rooted = true
		EQUIPPED = true
		CreateSound(160740121,Head,10,1,false)
		for i=0, 2, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.4 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(120), RAD(0), RAD(0)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
		end
		for i=0, 2, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.15 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(140), RAD(0), RAD(0)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
			BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
		end
		local SIZE = 0
		local POS = RootPart.Position+VT(0,150,0)
		local BLOWN = false
		coroutine.resume(coroutine.create(function()
			coroutine.resume(coroutine.create(function()
				repeat
					Swait()
					if SIZE > 0 then
						WACKYEFFECT({Time = 15, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(SIZE,SIZE,SIZE)*2.5, Transparency = 0.3, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
						WACKYEFFECT({Time = 15, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(SIZE,SIZE,SIZE)*3, Transparency = 0.8, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
					end
				until BLOWN == true
			end))
			repeat
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(-5), RAD(12), RAD(25)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-35), RAD(0), RAD(-15)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.75, 0) * ANGLES(RAD(180), RAD(15), RAD(17)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35, -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
				BLADE.CFrame = Clerp(BLADE.CFrame,RightArm.CFrame*CF(0,-8,0) * ANGLES(RAD(180), RAD(90), RAD(0)),0.4)
			until ATTACK == false
		end))
		wait(0.2)
		for i = 1, 15 do
			wait(MRANDOM(2,6)/45)
			coroutine.resume(coroutine.create(function()
				local CFRAME = CF(BLADE.Position,POS) * ANGLES(RAD(0), RAD(0), RAD(MRANDOM(-90,90)))
				local HEIGHT = 45/5
				local DISTANCE = (BLADE.Position - POS).Magnitude
				for i = 1, 45 do
					Swait()
					CFRAME = CFRAME * CF(0,(HEIGHT-(i/2.575))/45,-DISTANCE/45)
					WACKYEFFECT({Time = 15, EffectType = "Block", Size = VT(3,3,3), Size2 = VT(0,0,0), Transparency = 0.3, Transparency2 = 1, CFrame = CFRAME, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 0})
				end
				SIZE = SIZE + 1
			end))
		end
		wait(2.5)
		BLOWN = true
		WACKYEFFECT({Time = 85, EffectType = "Sphere", Size = VT(25,25,25), Size2 = VT(150,50,150), Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 401056199, SoundPitch = 0.4, SoundVolume = 10, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
		for E = 1, 5 do
			for i = 1, 5 do
				WACKYEFFECT({Time = 50+(E*4), EffectType = "Round Slash", Size = VT(0,0,0), Size2 = VT(E,0,E)/2, Transparency = 0, Transparency2 = 1, CFrame = CF(POS) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 10})
			end
		end
		CreateSound(288641686,Effects,5,1,false)
		CreateSound(592877506,Effects,5,1,false)
		local HITS = {}
		for index, CHILD in pairs(workspace:GetDescendants()) do
			if CHILD.ClassName == "Model" and CHILD ~= Character then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - RootPart.Position).Magnitude <= 175 then
							local PASS = true
							for E = 1, #HITS do
								if HITS[E] == CHILD then
									PASS = false
								end
							end
							if PASS == true then
								table.insert(HITS,CHILD)
							end
						end
					end
				end
			end
		end	
		if #HITS > 0 then
			local DONE = false
			local HUMS = {}
			coroutine.resume(coroutine.create(function()
				for E = 1, #HITS do
					local HUM = HITS[E]:FindFirstChildOfClass("Humanoid")
					table.insert(HUMS,HUM)
					local TORSO = HITS[E]:FindFirstChild("Torso") or HITS[E]:FindFirstChild("UpperTorso")
					local grav = Instance.new("BodyPosition",TORSO)
					grav.D = 850
					grav.P = 4000
					grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
					grav.Position = TORSO.Position+VT(0,35,0)
					CreateSound(592877506,TORSO,5,0.5,false)
					if TORSO then
						coroutine.resume(coroutine.create(function()
							local B = IT("Attachment",TORSO)
							local ChainLink = IT("Beam",Torso)
							ChainLink.Texture = "rbxassetid://73042633"
							ChainLink.Color = ColorSequence.new(C3(0,0,0))
							ChainLink.TextureSpeed = -1
							ChainLink.FaceCamera = true
							ChainLink.Width0 = 3
							ChainLink.Width1 = 3
							ChainLink.TextureLength = 3
							ChainLink.Attachment0 = A
							ChainLink.Attachment1 = B
							ChainLink.CurveSize0 = 0
							ChainLink.CurveSize1 = 0
							ChainLink.FaceCamera = true
							ChainLink.TextureMode = "Static"
							ChainLink.Transparency = NumberSequence.new(0)
							repeat
								Swait()
								WACKYEFFECT({Time = 5, EffectType = "Block", Size = VT(2,2,2)*TORSO.Size.Z, Size2 = VT(0,0,0), Transparency = 0.6, Transparency2 = 1, CFrame = CF(TORSO.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 35})
							until DONE == true or HUM.Health < 1
							B:Remove()
							ChainLink:Remove()
							grav:Remove()
							if HUM.Health < 1 then
								for E = 1, 2 do
									for i = 1, 3 do
										WACKYEFFECT({Time = 15, EffectType = "Round Slash", Size = VT(0,0,0), Size2 = VT(E,0,E)/6, Transparency = 0, Transparency2 = 1, CFrame = CF(TORSO.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 10})
									end
								end
								WACKYEFFECT({Time = 5, EffectType = "Block", Size = VT(2,2,2)*TORSO.Size.Z, Size2 = VT(6,6,6)*TORSO.Size.Z, Transparency = 0.6, Transparency2 = 1, CFrame = CF(TORSO.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 160772554, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
								for _, c in pairs(HITS[E]:GetChildren()) do
									if c:IsA("BasePart") or c:IsA("Accessory") then
										
									end
								end
								local BONES = {
								Skull = {MeshId = 36869983,Size = VT(0.7,0.7,0.7)},
								Ribs = {MeshId = 546760032,Size = VT(2.18, 1.884, 1.105)}
								}
								local SELECTABLEBONES = {
								{MeshId = 546760045,Size = VT(0.468, 1.12, 0.346)},
								{MeshId = 546760042,Size = VT(0.366, 0.991, 0.365)},
								{MeshId = 546760029,Size = VT(0.441, 0.799, 0.347)},
								{MeshId = 546760030,Size = VT(0.605, 0.843, 0.4)}
								}
								for i = 1, 9 do
									local CHOSENPIECE = nil
									if i == 1 then
										CHOSENPIECE = BONES.Skull
									elseif i == 2 then
										CHOSENPIECE = BONES.Ribs
									else
										CHOSENPIECE = SELECTABLEBONES[MRANDOM(1,#SELECTABLEBONES)]
									end
									local BONE = CreatePart(3, HITS[E], "Neon", 0, 0, BRICKC("Salmon"), "RIP", CHOSENPIECE.Size, false)
									BONE.CanCollide = true
									BONE.CFrame = TORSO.CFrame*CF(MRANDOM(-10,10)/30,MRANDOM(-10,10)/30,MRANDOM(-10,10)/30)
									if CHOSENPIECE.MeshId == 36869983 then
										CreateMesh("SpecialMesh", BONE, "FileMesh", CHOSENPIECE.MeshId, "", VT(1,1,1)/1.5, VT(0,0,0))
									else
										CreateMesh("SpecialMesh", BONE, "FileMesh", CHOSENPIECE.MeshId, "", VT(1,1,1), VT(0,0,0))
									end
								end
							end
						end))
					end
				end
				wait(1)
				for i = 1, 250 do
					Swait()
					for E = 1, #HUMS do
						if HUMS[E] then
							if HUMS[E].Health > 0 then
								HUMS[E].Health = HUMS[E].Health - 0.3
								DAMAGEMULTIPLIER = DAMAGEMULTIPLIER + 0.0000000000001
								WACKYEFFECT({Time = 10, EffectType = "Round Slash", Size = VT(0,0,0), Size2 = VT(1.5,0,1.5)/20, Transparency = 0.9, Transparency2 = 1, CFrame = CF(Torso.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 10})
							end
						end
					end
				end
				local SKILLFRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0, 0, 0, 0), UD2(1, 0, 1, 0), C3(0,0,0), C3(0, 0, 0), "OWEXTRADAMAGE")
				local SKILLTEXT = CreateLabel(SKILLFRAME, "!You have increased damage!", SKILLTEXTCOLOR, SKILLTEXTSIZE2, SKILLFONT, 1, 2, 1, "AAAA")
				coroutine.resume(coroutine.create(function()
					CreateSound(743521450,Cam,5,0.6,false)
					for E = 1, 75 do
						Swait()
						SKILLTEXT.TextTransparency = SKILLTEXT.TextTransparency - 1/75
					end
					wait(4)
					for E = 1, 25 do
						Swait()
						SKILLTEXT.TextTransparency = SKILLTEXT.TextTransparency + 1/25
					end
					SKILLFRAME:Remove()
				end))
				DONE = true
				for i = 1, 50 do
					wait(0.5)
					for i = 1, 3 do
						WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(DAMAGEMULTIPLIER-1,0.1,DAMAGEMULTIPLIER-1)*1.5, Transparency = 0.6, Transparency2 = 1, CFrame = CF(RootPart.CFrame*CF(0,-3.25,0).p) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0)), MoveToPos = nil, RotationX = 1, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = MRANDOM(9,11)/10, SoundVolume = MRANDOM(9,11)/2, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 22})
					end
				end
				DAMAGEMULTIPLIER = 1
			end))
			wait(0.2)
		end
		wait(0.4)
		EQUIPPED = false
		ATTACK = false
		Rooted = false
	end
end
function Laugh()
	ATTACK = true
	Rooted = true
	CreateSound(160740121,Head,10,1,false)
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.8 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.6 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(0), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.45 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	for i=1, 185 do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1 + 0.05 * SIN(SINE/2)) - 1)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.55 + 0.15 * SIN(SINE/2), -0.7) * ANGLES(RAD(3 + 3 * SIN(SINE/2)), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.4 + 0.15 * SIN(SINE/2), -0.6) * ANGLES(RAD(3 + 3 * SIN(SINE/2)), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
	if ATTACK == false then
		Melee()
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "bro" and ATTACK == false then
		AbyssalShriek()
	end

	if Key == "x" and ATTACK == false then
		AbyssalDash()
	end

	if Key == "bro2" and ATTACK == false then
		ShadowCloak()
	end

	if Key == "bro3" and ATTACK == false then
		BlackBlast()
	end

	if Key == "q" and ATTACK == false then
		NightmareFall()
	end

	if Key == "t" and ATTACK == false then
		Laugh()
	end
end

function KeyUp(Key)
	KEYHOLD = false
end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

--//=================================\\
--\\=================================//

function unanchor()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c ~= RootPart then
			c.Anchored = false
		end
	end
	if UNANCHOR == true then
		RootPart.Anchored = false
	else
		RootPart.Anchored = true
	end
end

--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

while true do
	Swait()
	script.Parent = WEAPONGUI
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight, Character)
	local WALKSPEEDVALUE = 8 / (Humanoid.WalkSpeed / 16)
	Humanoid.HipHeight = 1
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(25 + 10 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(-25 - 10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4, -0.6) * ANGLES(RAD(1), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(45 + 10 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(-45 - 10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.7) * ANGLES(RAD(-25 + 5 * SIN(SINE / 12)), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.8, -0.3) * ANGLES(RAD(-10), RAD(-80), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.5 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(0), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-5), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(10), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.5 + 0.05 * SIN(SINE / 12), -0.7) * ANGLES(RAD(0), RAD(0), RAD(-95)) * ANGLES(RAD(5), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.75, 0.35 + 0.05 * SIN(SINE / 12), -0.6) * ANGLES(RAD(0), RAD(0), RAD(92)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.6 - 0.05 * SIN(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(-35)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(-15), RAD(-70), RAD(0)) * ANGLES(RAD(1), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	end
	if EQUIPPED == false then
		if TORSOVELOCITY > 1 then
			BLADE.CFrame = Clerp(BLADE.CFrame,RootPart.CFrame * CF(0.2,1.5 + 0.15 * SIN(SINE / 12),4) * ANGLES(RAD(195), RAD(15), RAD(15)),0.04)
		else
			BLADE.CFrame = Clerp(BLADE.CFrame,RootPart.CFrame * CF(1,1.5 + 0.15 * SIN(SINE / 12),4) * ANGLES(RAD(195), RAD(-25), RAD(15)),0.1)
		end
	end
	if ANIM ~= "Walk" and FADERS == true then
		if MRANDOM(1,7) == 1 then
			CharacterFade(C3(0,0,0),65,R_RANDOM(Torso.CFrame,0.5).p)
		end
	end
	unanchor()
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed+(DAMAGEMULTIPLIER/5)
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	BMUSIC.SoundId = "9048378262"
	BMUSIC.Looped = true
	BMUSIC.Pitch = PITCH
	BMUSIC.Volume = VOLUME
	BMUSIC.Playing = true
	if BMUSIC.Parent ~= RootPart then
		BMUSIC = IT("Sound",RootPart)
	end
	if Head:FindFirstChild("face") then
		
	end
	Humanoid.Name = "NONHUM"
	Humanoid.MaxHealth = 1e3
	Humanoid.Health = 1e3
end

--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--
