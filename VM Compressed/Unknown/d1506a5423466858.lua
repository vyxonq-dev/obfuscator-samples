loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.PlaceId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game, search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game:[UP] Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end

wait(2)

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




 
function LoadLibrary(a)
local t = {}
 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------JSON Functions Begin----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
 
--JSON Encoder and Parser for Lua 5.1
-- 
--Copyright 2007 Shaun Brown (http://www.chipmunkav.com)
--All Rights Reserved.
 
--Permission is hereby granted, free of charge, to any person
--obtaining a copy of this software to deal in the Software without
--restriction, including without limitation the rights to use,
--copy, modify, merge, publish, distribute, sublicense, and/or
--sell copies of the Software, and to permit persons to whom the
--Software is furnished to do so, subject to the following conditions:
 
--The above copyright notice and this permission notice shall be
--included in all copies or substantial portions of the Software.
--If you find this software useful please give www.chipmunkav.com a mention.
 
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
--EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
--OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
--IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
--ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
--CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
--CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
local string = string
local math = math
local table = table
local error = error
local tonumber = tonumber
local tostring = tostring
local type = type
local setmetatable = setmetatable
local pairs = pairs
local ipairs = ipairs
local assert = assert
 
 
local StringBuilder = {
buffer = {}
}
 
function StringBuilder:New()
local o = {}
setmetatable(o, self)
self.__index = self
o.buffer = {}
return o
end
 
function StringBuilder:Append(s)
self.buffer[#self.buffer+1] = s
end
 
function StringBuilder:ToString()
return table.concat(self.buffer)
end
 
local JsonWriter = {
backslashes = {
['\b'] = "\\b",
['\t'] = "\\t",
['\n'] = "\\n",
['\f'] = "\\f",
['\r'] = "\\r",
['"'] = "\\\"",
['\\'] = "\\\\",
['/'] = "\\/"
}
}
 
function JsonWriter:New()
local o = {}
o.writer = StringBuilder:New()
setmetatable(o, self)
self.__index = self
return o
end
 
function JsonWriter:Append(s)
self.writer:Append(s)
end
 
function JsonWriter:ToString()
return self.writer:ToString()
end
 
function JsonWriter:Write(o)
local t = type(o)
if t == "nil" then
self:WriteNil()
elseif t == "boolean" then
self:WriteString(o)
elseif t == "number" then
self:WriteString(o)
elseif t == "string" then
self:ParseString(o)
elseif t == "table" then
self:WriteTable(o)
elseif t == "function" then
self:WriteFunction(o)
elseif t == "thread" then
self:WriteError(o)
elseif t == "userdata" then
self:WriteError(o)
end
end
 
function JsonWriter:WriteNil()
self:Append("null")
end
 
function JsonWriter:WriteString(o)
self:Append(tostring(o))
end
 
function JsonWriter:ParseString(s)
self:Append('"')
self:Append(string.gsub(s, "[%z%c\\\"/]", function(n)
local c = self.backslashes[n]
if c then return c end
return string.format("\\u%.4X", string.byte(n))
end))
self:Append('"')
end
 
function JsonWriter:IsArray(t)
local count = 0
local isindex = function(k)
if type(k) == "number" and k > 0 then
if math.floor(k) == k then
return true
end
end
return false
end
for k,v in pairs(t) do
if not isindex(k) then
return false, '{', '}'
else
count = math.max(count, k)
end
end
return true, '[', ']', count
end
 
function JsonWriter:WriteTable(t)
local ba, st, et, n = self:IsArray(t)
self:Append(st)
if ba then
for i = 1, n do
self:Write(t[i])
if i < n then
self:Append(',')
end
end
else
local first = true;
for k, v in pairs(t) do
if not first then
self:Append(',')
end
first = false;
self:ParseString(k)
self:Append(':')
self:Write(v)
end
end
self:Append(et)
end
 
function JsonWriter:WriteError(o)
error(string.format(
"Encoding of %s unsupported",
tostring(o)))
end
 
function JsonWriter:WriteFunction(o)
if o == Null then
self:WriteNil()
else
self:WriteError(o)
end
end
 
local StringReader = {
s = "",
i = 0
}
 
function StringReader:New(s)
local o = {}
setmetatable(o, self)
self.__index = self
o.s = s or o.s
return o
end
 
function StringReader:Peek()
local i = self.i + 1
if i <= #self.s then
return string.sub(self.s, i, i)
end
return nil
end
 
function StringReader:Next()
self.i = self.i+1
if self.i <= #self.s then
return string.sub(self.s, self.i, self.i)
end
return nil
end
 
function StringReader:All()
return self.s
end
 
local JsonReader = {
escapes = {
['t'] = '\t',
['n'] = '\n',
['f'] = '\f',
['r'] = '\r',
['b'] = '\b',
}
}
 
function JsonReader:New(s)
local o = {}
o.reader = StringReader:New(s)
setmetatable(o, self)
self.__index = self
return o;
end
 
function JsonReader:Read()
self:SkipWhiteSpace()
local peek = self:Peek()
if peek == nil then
error(string.format(
"Nil string: '%s'",
self:All()))
elseif peek == '{' then
return self:ReadObject()
elseif peek == '[' then
return self:ReadArray()
elseif peek == '"' then
return self:ReadString()
elseif string.find(peek, "[%+%-%d]") then
return self:ReadNumber()
elseif peek == 't' then
return self:ReadTrue()
elseif peek == 'f' then
return self:ReadFalse()
elseif peek == 'n' then
return self:ReadNull()
elseif peek == '/' then
self:ReadComment()
return self:Read()
else
return nil
end
end
 
function JsonReader:ReadTrue()
self:TestReservedWord{'t','r','u','e'}
return true
end
 
function JsonReader:ReadFalse()
self:TestReservedWord{'f','a','l','s','e'}
return false
end
 
function JsonReader:ReadNull()
self:TestReservedWord{'n','u','l','l'}
return nil
end
 
function JsonReader:TestReservedWord(t)
for i, v in ipairs(t) do
if self:Next() ~= v then
error(string.format(
"Error reading '%s': %s",
table.concat(t),
self:All()))
end
end
end
 
function JsonReader:ReadNumber()
local result = self:Next()
local peek = self:Peek()
while peek ~= nil and string.find(
peek,
"[%+%-%d%.eE]") do
result = result .. self:Next()
peek = self:Peek()
end
result = tonumber(result)
if result == nil then
error(string.format(
"Invalid number: '%s'",
result))
else
return result
end
end
 
function JsonReader:ReadString()
local result = ""
assert(self:Next() == '"')
while self:Peek() ~= '"' do
local ch = self:Next()
if ch == '\\' then
ch = self:Next()
if self.escapes[ch] then
ch = self.escapes[ch]
end
end
result = result .. ch
end
assert(self:Next() == '"')
local fromunicode = function(m)
return string.char(tonumber(m, 16))
end
return string.gsub(
result,
"u%x%x(%x%x)",
fromunicode)
end
 
function JsonReader:ReadComment()
assert(self:Next() == '/')
local second = self:Next()
if second == '/' then
self:ReadSingleLineComment()
elseif second == '*' then
self:ReadBlockComment()
else
error(string.format(
"Invalid comment: %s",
self:All()))
end
end
 
function JsonReader:ReadBlockComment()
local done = false
while not done do
local ch = self:Next()
if ch == '*' and self:Peek() == '/' then
done = true
end
if not done and
ch == '/' and
self:Peek() == "*" then
error(string.format(
"Invalid comment: %s, '/*' illegal.",
self:All()))
end
end
self:Next()
end
 
function JsonReader:ReadSingleLineComment()
local ch = self:Next()
while ch ~= '\r' and ch ~= '\n' do
ch = self:Next()
end
end
 
function JsonReader:ReadArray()
local result = {}
assert(self:Next() == '[')
local done = false
if self:Peek() == ']' then
done = true;
end
while not done do
local item = self:Read()
result[#result+1] = item
self:SkipWhiteSpace()
if self:Peek() == ']' then
done = true
end
if not done then
local ch = self:Next()
if ch ~= ',' then
error(string.format(
"Invalid array: '%s' due to: '%s'",
self:All(), ch))
end
end
end
assert(']' == self:Next())
return result
end
 
function JsonReader:ReadObject()
local result = {}
assert(self:Next() == '{')
local done = false
if self:Peek() == '}' then
done = true
end
while not done do
local key = self:Read()
if type(key) ~= "string" then
error(string.format(
"Invalid non-string object key: %s",
key))
end
self:SkipWhiteSpace()
local ch = self:Next()
if ch ~= ':' then
error(string.format(
"Invalid object: '%s' due to: '%s'",
self:All(),
ch))
end
self:SkipWhiteSpace()
local val = self:Read()
result[key] = val
self:SkipWhiteSpace()
if self:Peek() == '}' then
done = true
end
if not done then
ch = self:Next()
if ch ~= ',' then
error(string.format(
"Invalid array: '%s' near: '%s'",
self:All(),
ch))
end
end
end
assert(self:Next() == "}")
return result
end
 
function JsonReader:SkipWhiteSpace()
local p = self:Peek()
while p ~= nil and string.find(p, "[%s/]") do
if p == '/' then
self:ReadComment()
else
self:Next()
end
p = self:Peek()
end
end
 
function JsonReader:Peek()
return self.reader:Peek()
end
 
function JsonReader:Next()
return self.reader:Next()
end
 
function JsonReader:All()
return self.reader:All()
end
 
function Encode(o)
local writer = JsonWriter:New()
writer:Write(o)
return writer:ToString()
end
 
function Decode(s)
local reader = JsonReader:New(s)
return reader:Read()
end
 
function Null()
return Null
end
-------------------- End JSON Parser ------------------------
 
t.DecodeJSON = function(jsonString)
pcall(function() warn("RbxUtility.DecodeJSON is deprecated, please use Game:GetService('HttpService'):JSONDecode() instead.") end)
 
if type(jsonString) == "string" then
return Decode(jsonString)
end
print("RbxUtil.DecodeJSON expects string argument!")
return nil
end
 
t.EncodeJSON = function(jsonTable)
pcall(function() warn("RbxUtility.EncodeJSON is deprecated, please use Game:GetService('HttpService'):JSONEncode() instead.") end)
return Encode(jsonTable)
end
 
 
 
 
 
 
 
 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--------------------------------------------Terrain Utilities Begin-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--makes a wedge at location x, y, z
--sets cell x, y, z to default material if parameter is provided, if not sets cell x, y, z to be whatever material it previously w
--returns true if made a wedge, false if the cell remains a block
t.MakeWedge = function(x, y, z, defaultmaterial)
return game:GetService("Terrain"):AutoWedgeCell(x,y,z)
end
 
t.SelectTerrainRegion = function(regionToSelect, color, selectEmptyCells, selectionParent)
local terrain = game:GetService("Workspace"):FindFirstChild("Terrain")
if not terrain then return end
 
assert(regionToSelect)
assert(color)
 
if not type(regionToSelect) == "Region3" then
error("regionToSelect (first arg), should be of type Region3, but is type",type(regionToSelect))
end
if not type(color) == "BrickColor" then
error("color (second arg), should be of type BrickColor, but is type",type(color))
end
 
-- frequently used terrain calls (speeds up call, no lookup necessary)
local GetCell = terrain.GetCell
local WorldToCellPreferSolid = terrain.WorldToCellPreferSolid
local CellCenterToWorld = terrain.CellCenterToWorld
local emptyMaterial = Enum.CellMaterial.Empty
 
-- container for all adornments, passed back to user
local selectionContainer = Instance.new("Model")
selectionContainer.Name = "SelectionContainer"
selectionContainer.Archivable = false
if selectionParent then
selectionContainer.Parent = selectionParent
else
selectionContainer.Parent = game:GetService("Workspace")
end
 
local updateSelection = nil -- function we return to allow user to update selection
local currentKeepAliveTag = nil -- a tag that determines whether adorns should be destroyed
local aliveCounter = 0 -- helper for currentKeepAliveTag
local lastRegion = nil -- used to stop updates that do nothing
local adornments = {} -- contains all adornments
local reusableAdorns = {}
 
local selectionPart = Instance.new("Part")
selectionPart.Name = "SelectionPart"
selectionPart.Transparency = 1
selectionPart.Anchored = true
selectionPart.Locked = true
selectionPart.CanCollide = false
selectionPart.Size = Vector3.new(4.2,4.2,4.2)
 
local selectionBox = Instance.new("SelectionBox")
 
-- srs translation from region3 to region3int16
local function Region3ToRegion3int16(region3)
local theLowVec = region3.CFrame.p - (region3.Size/2) + Vector3.new(2,2,2)
local lowCell = WorldToCellPreferSolid(terrain,theLowVec)
 
local theHighVec = region3.CFrame.p + (region3.Size/2) - Vector3.new(2,2,2)
local highCell = WorldToCellPreferSolid(terrain, theHighVec)
 
local highIntVec = Vector3int16.new(highCell.x,highCell.y,highCell.z)
local lowIntVec = Vector3int16.new(lowCell.x,lowCell.y,lowCell.z)
 
return Region3int16.new(lowIntVec,highIntVec)
end
 
-- helper function that creates the basis for a selection box
function createAdornment(theColor)
local selectionPartClone = nil
local selectionBoxClone = nil
 
if #reusableAdorns > 0 then
selectionPartClone = reusableAdorns[1]["part"]
selectionBoxClone = reusableAdorns[1]["box"]
table.remove(reusableAdorns,1)
 
selectionBoxClone.Visible = true
else
selectionPartClone = selectionPart:Clone()
selectionPartClone.Archivable = false
 
selectionBoxClone = selectionBox:Clone()
selectionBoxClone.Archivable = false
 
selectionBoxClone.Adornee = selectionPartClone
selectionBoxClone.Parent = selectionContainer
 
selectionBoxClone.Adornee = selectionPartClone
 
selectionBoxClone.Parent = selectionContainer
end
 
if theColor then
selectionBoxClone.Color = theColor
end
 
return selectionPartClone, selectionBoxClone
end
 
-- iterates through all current adornments and deletes any that don't have latest tag
function cleanUpAdornments()
for cellPos, adornTable in pairs(adornments) do
 
if adornTable.KeepAlive ~= currentKeepAliveTag then -- old news, we should get rid of this
adornTable.SelectionBox.Visible = false
table.insert(reusableAdorns,{part = adornTable.SelectionPart, box = adornTable.SelectionBox})
adornments[cellPos] = nil
end
end
end
 
-- helper function to update tag
function incrementAliveCounter()
aliveCounter = aliveCounter + 1
if aliveCounter > 1000000 then
aliveCounter = 0
end
return aliveCounter
end
 
-- finds full cells in region and adorns each cell with a box, with the argument color
function adornFullCellsInRegion(region, color)
local regionBegin = region.CFrame.p - (region.Size/2) + Vector3.new(2,2,2)
local regionEnd = region.CFrame.p + (region.Size/2) - Vector3.new(2,2,2)
 
local cellPosBegin = WorldToCellPreferSolid(terrain, regionBegin)
local cellPosEnd = WorldToCellPreferSolid(terrain, regionEnd)
 
currentKeepAliveTag = incrementAliveCounter()
for y = cellPosBegin.y, cellPosEnd.y do
for z = cellPosBegin.z, cellPosEnd.z do
for x = cellPosBegin.x, cellPosEnd.x do
local cellMaterial = GetCell(terrain, x, y, z)
 
if cellMaterial ~= emptyMaterial then
local cframePos = CellCenterToWorld(terrain, x, y, z)
local cellPos = Vector3int16.new(x,y,z)
 
local updated = false
for cellPosAdorn, adornTable in pairs(adornments) do
if cellPosAdorn == cellPos then
adornTable.KeepAlive = currentKeepAliveTag
if color then
adornTable.SelectionBox.Color = color
end
updated = true
break
end
end
 
if not updated then
local selectionPart, selectionBox = createAdornment(color)
selectionPart.Size = Vector3.new(4,4,4)
selectionPart.CFrame = CFrame.new(cframePos)
local adornTable = {SelectionPart = selectionPart, SelectionBox = selectionBox, KeepAlive = currentKeepAliveTag}
adornments[cellPos] = adornTable
end
end
end
end
end
cleanUpAdornments()
end
 
 
------------------------------------- setup code ------------------------------
lastRegion = regionToSelect
 
if selectEmptyCells then -- use one big selection to represent the area selected
local selectionPart, selectionBox = createAdornment(color)
 
selectionPart.Size = regionToSelect.Size
selectionPart.CFrame = regionToSelect.CFrame
 
adornments.SelectionPart = selectionPart
adornments.SelectionBox = selectionBox
 
updateSelection =
function (newRegion, color)
if newRegion and newRegion ~= lastRegion then
lastRegion = newRegion
selectionPart.Size = newRegion.Size
selectionPart.CFrame = newRegion.CFrame
end
if color then
selectionBox.Color = color
end
end
else -- use individual cell adorns to represent the area selected
adornFullCellsInRegion(regionToSelect, color)
updateSelection =
function (newRegion, color)
if newRegion and newRegion ~= lastRegion then
lastRegion = newRegion
adornFullCellsInRegion(newRegion, color)
end
end
 
end
 
local destroyFunc = function()
updateSelection = nil
if selectionContainer then selectionContainer:Destroy() end
adornments = nil
end
 
return updateSelection, destroyFunc
end
 
-----------------------------Terrain Utilities End-----------------------------
 
 
 
 
 
 
 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Signal class begin------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--[[
A 'Signal' object identical to the internal RBXScriptSignal object in it's public API and semantics. This function
can be used to create "custom events" for user-made code.
API:
Method :connect( function handler )
Arguments: The function to connect to.
Returns: A new connection object which can be used to disconnect the connection
Description: Connects this signal to the function specified by |handler|. That is, when |fire( ... )| is called for
the signal the |handler| will be called with the arguments given to |fire( ... )|. Note, the functions
connected to a signal are called in NO PARTICULAR ORDER, so connecting one function after another does
NOT mean that the first will be called before the second as a result of a call to |fire|.
 
Method :disconnect()
Arguments: None
Returns: None
Description: Disconnects all of the functions connected to this signal.
 
Method :fire( ... )
Arguments: Any arguments are accepted
Returns: None
Description: Calls all of the currently connected functions with the given arguments.
 
Method :wait()
Arguments: None
Returns: The arguments given to fire
Description: This call blocks until
]]
 
function t.CreateSignal()
local this = {}
 
local mBindableEvent = Instance.new('BindableEvent')
local mAllCns = {} --all connection objects returned by mBindableEvent::connect
 
--main functions
function this:connect(func)
if self ~= this then error("connect must be called with `:`, not `.`", 2) end
if type(func) ~= 'function' then
error("Argument #1 of connect must be a function, got a "..type(func), 2)
end
local cn = mBindableEvent.Event:Connect(func)
mAllCns[cn] = true
local pubCn = {}
function pubCn:disconnect()
cn:Disconnect()
mAllCns[cn] = nil
end
pubCn.Disconnect = pubCn.disconnect
 
return pubCn
end
 
function this:disconnect()
if self ~= this then error("disconnect must be called with `:`, not `.`", 2) end
for cn, _ in pairs(mAllCns) do
cn:Disconnect()
mAllCns[cn] = nil
end
end
 
function this:wait()
if self ~= this then error("wait must be called with `:`, not `.`", 2) end
return mBindableEvent.Event:Wait()
end
 
function this:fire(...)
if self ~= this then error("fire must be called with `:`, not `.`", 2) end
mBindableEvent:Fire(...)
end
 
this.Connect = this.connect
this.Disconnect = this.disconnect
this.Wait = this.wait
this.Fire = this.fire
 
return this
end
 
------------------------------------------------- Sigal class End ------------------------------------------------------
 
 
 
 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------Create Function Begins---------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--[[
A "Create" function for easy creation of Roblox instances. The function accepts a string which is the classname of
the object to be created. The function then returns another function which either accepts accepts no arguments, in
which case it simply creates an object of the given type, or a table argument that may contain several types of data,
in which case it mutates the object in varying ways depending on the nature of the aggregate data. These are the
type of data and what operation each will perform:
1) A string key mapping to some value:
Key-Value pairs in this form will be treated as properties of the object, and will be assigned in NO PARTICULAR
ORDER. If the order in which properties is assigned matter, then they must be assigned somewhere else than the
|Create| call's body.
 
2) An integral key mapping to another Instance:
Normal numeric keys mapping to Instances will be treated as children if the object being created, and will be
parented to it. This allows nice recursive calls to Create to create a whole hierarchy of objects without a
need for temporary variables to store references to those objects.
 
3) A key which is a value returned from Create.Event( eventname ), and a value which is a function function
The Create.E( string ) function provides a limited way to connect to signals inside of a Create hierarchy
for those who really want such a functionality. The name of the event whose name is passed to
Create.E( string )
 
4) A key which is the Create function itself, and a value which is a function
The function will be run with the argument of the object itself after all other initialization of the object is
done by create. This provides a way to do arbitrary things involving the object from withing the create
hierarchy.
Note: This function is called SYNCHRONOUSLY, that means that you should only so initialization in
it, not stuff which requires waiting, as the Create call will block until it returns. While waiting in the
constructor callback function is possible, it is probably not a good design choice.
Note: Since the constructor function is called after all other initialization, a Create block cannot have two
constructor functions, as it would not be possible to call both of them last, also, this would be unnecessary.
 
 
Some example usages:
 
A simple example which uses the Create function to create a model object and assign two of it's properties.
local model = Create'Model'{
Name = 'A New model',
Parent = game.Workspace,
}
 
 
An example where a larger hierarchy of object is made. After the call the hierarchy will look like this:
Model_Container
|-ObjectValue
| |
| `-BoolValueChild
`-IntValue
 
local model = Create'Model'{
Name = 'Model_Container',
Create'ObjectValue'{
Create'BoolValue'{
Name = 'BoolValueChild',
},
},
Create'IntValue'{},
}
 
 
An example using the event syntax:
 
local part = Create'Part'{
[Create.E'Touched'] = function(part)
print("I was touched by "..part.Name)
end,
}
 
 
An example using the general constructor syntax:
 
local model = Create'Part'{
[Create] = function(this)
print("Constructor running!")
this.Name = GetGlobalFoosAndBars(this)
end,
}
 
 
Note: It is also perfectly legal to save a reference to the function returned by a call Create, this will not cause
any unexpected behavior. EG:
local partCreatingFunction = Create'Part'
local part = partCreatingFunction()
]]
 
--the Create function need to be created as a functor, not a function, in order to support the Create.E syntax, so it
--will be created in several steps rather than as a single function declaration.
local function Create_PrivImpl(objectType)
if type(objectType) ~= 'string' then
error("Argument of Create must be a string", 2)
end
--return the proxy function that gives us the nice Create'string'{data} syntax
--The first function call is a function call using Lua's single-string-argument syntax
--The second function call is using Lua's single-table-argument syntax
--Both can be chained together for the nice effect.
return function(dat)
--default to nothing, to handle the no argument given case
dat = dat or {}
 
--make the object to mutate
local obj = Instance.new(objectType)
local parent = nil
 
--stored constructor function to be called after other initialization
local ctor = nil
 
for k, v in pairs(dat) do
--add property
if type(k) == 'string' then
if k == 'Parent' then
-- Parent should always be set last, setting the Parent of a new object
-- immediately makes performance worse for all subsequent property updates.
parent = v
else
obj[k] = v
end
 
 
--add child
elseif type(k) == 'number' then
if type(v) ~= 'userdata' then
error("Bad entry in Create body: Numeric keys must be paired with children, got a: "..type(v), 2)
end
v.Parent = obj
 
 
--event connect
elseif type(k) == 'table' and k.__eventname then
if type(v) ~= 'function' then
error("Bad entry in Create body: Key `[Create.E\'"..k.__eventname.."\']` must have a function value\
got: "..tostring(v), 2)
end
obj[k.__eventname]:connect(v)
 
 
--define constructor function
elseif k == t.Create then
if type(v) ~= 'function' then
error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \
got: "..tostring(v), 2)
elseif ctor then
--ctor already exists, only one allowed
error("Bad entry in Create body: Only one constructor function is allowed", 2)
end
ctor = v
 
 
else
error("Bad entry ("..tostring(k).." => "..tostring(v)..") in Create body", 2)
end
end
 
--apply constructor function if it exists
if ctor then
ctor(obj)
end
 
if parent then
obj.Parent = parent
end
 
--return the completed object
return obj
end
end
 
--now, create the functor:
t.Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end})
 
--and create the "Event.E" syntax stub. Really it's just a stub to construct a table which our Create
--function can recognize as special.
t.Create.E = function(eventName)
return {__eventname = eventName}
end
 
-------------------------------------------------Create function End----------------------------------------------------
 
 
 
 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Documentation Begin-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
 
t.Help =
function(funcNameOrFunc)
--input argument can be a string or a function. Should return a description (of arguments and expected side effects)
if funcNameOrFunc == "DecodeJSON" or funcNameOrFunc == t.DecodeJSON then
return "Function DecodeJSON. " ..
"Arguments: (string). " ..
"Side effect: returns a table with all parsed JSON values"
end
if funcNameOrFunc == "EncodeJSON" or funcNameOrFunc == t.EncodeJSON then
return "Function EncodeJSON. " ..
"Arguments: (table). " ..
"Side effect: returns a string composed of argument table in JSON data format"
end
if funcNameOrFunc == "MakeWedge" or funcNameOrFunc == t.MakeWedge then
return "Function MakeWedge. " ..
"Arguments: (x, y, z, [default material]). " ..
"Description: Makes a wedge at location x, y, z. Sets cell x, y, z to default material if "..
"parameter is provided, if not sets cell x, y, z to be whatever material it previously was. "..
"Returns true if made a wedge, false if the cell remains a block "
end
if funcNameOrFunc == "SelectTerrainRegion" or funcNameOrFunc == t.SelectTerrainRegion then
return "Function SelectTerrainRegion. " ..
"Arguments: (regionToSelect, color, selectEmptyCells, selectionParent). " ..
"Description: Selects all terrain via a series of selection boxes within the regionToSelect " ..
"(this should be a region3 value). The selection box color is detemined by the color argument " ..
"(should be a brickcolor value). SelectionParent is the parent that the selection model gets placed to (optional)." ..
"SelectEmptyCells is bool, when true will select all cells in the " ..
"region, otherwise we only select non-empty cells. Returns a function that can update the selection," ..
"arguments to said function are a new region3 to select, and the adornment color (color arg is optional). " ..
"Also returns a second function that takes no arguments and destroys the selection"
end
if funcNameOrFunc == "CreateSignal" or funcNameOrFunc == t.CreateSignal then
return "Function CreateSignal. "..
"Arguments: None. "..
"Returns: The newly created Signal object. This object is identical to the RBXScriptSignal class "..
"used for events in Objects, but is a Lua-side object so it can be used to create custom events in"..
"Lua code. "..
"Methods of the Signal object: :connect, :wait, :fire, :disconnect. "..
"For more info you can pass the method name to the Help function, or view the wiki page "..
"for this library. EG: Help('Signal:connect')."
end
if funcNameOrFunc == "Signal:connect" then
return "Method Signal:connect. "..
"Arguments: (function handler). "..
"Return: A connection object which can be used to disconnect the connection to this handler. "..
"Description: Connectes a handler function to this Signal, so that when |fire| is called the "..
"handler function will be called with the arguments passed to |fire|."
end
if funcNameOrFunc == "Signal:wait" then
return "Method Signal:wait. "..
"Arguments: None. "..
"Returns: The arguments passed to the next call to |fire|. "..
"Description: This call does not return until the next call to |fire| is made, at which point it "..
"will return the values which were passed as arguments to that |fire| call."
end
if funcNameOrFunc == "Signal:fire" then
return "Method Signal:fire. "..
"Arguments: Any number of arguments of any type. "..
"Returns: None. "..
"Description: This call will invoke any connected handler functions, and notify any waiting code "..
"attached to this Signal to continue, with the arguments passed to this function. Note: The calls "..
"to handlers are made asynchronously, so this call will return immediately regardless of how long "..
"it takes the connected handler functions to complete."
end
if funcNameOrFunc == "Signal:disconnect" then
return "Method Signal:disconnect. "..
"Arguments: None. "..
"Returns: None. "..
"Description: This call disconnects all handlers attacched to this function, note however, it "..
"does NOT make waiting code continue, as is the behavior of normal Roblox events. This method "..
"can also be called on the connection object which is returned from Signal:connect to only "..
"disconnect a single handler, as opposed to this method, which will disconnect all handlers."
end
if funcNameOrFunc == "Create" then
return "Function Create. "..
"Arguments: A table containing information about how to construct a collection of objects. "..
"Returns: The constructed objects. "..
"Descrition: Create is a very powerfull function, whose description is too long to fit here, and "..
"is best described via example, please see the wiki page for a description of how to use it."
end
end
 
--------------------------------------------Documentation Ends----------------------------------------------------------
 
return t
end



local FavIDs = {
	340106355, --Nefl Crystals
	927529620, --Dimension
	876981900, --Fantasy
	398987889, --Ordinary Days
	1117396305, --Oh wait, it's you.
	885996042, --Action Winter Journey
	919231299, --Sprawling Idiot Effigy
	743466274, --Good Day Sunshine
	727411183, --Knife Fight
	1402748531, --The Earth Is Counting On You!
	595230126 --Robot Language
	}



--The reality of my life isn't real but a Universe -makhail07
wait()
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
print('Local User is '..plr.Name)
local char = plr.Character
local hum = char.Humanoid
local ra = char["Right Arm"]
local la= char["Left Arm"]
local rl= char["Right Leg"]
local ll = char["Left Leg"]
local hed = char.Head
local root = char.HumanoidRootPart
local rootj = root.RootJoint
local tors = char.Torso
local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)
-------------------------------------------------------
--Start Good Stuff--
-------------------------------------------------------
CF = CFrame.new
angles = CFrame.Angles
attack = false
Euler = CFrame.fromEulerAnglesXYZ
Rad = math.rad
IT = Instance.new
BrickC = BrickColor.new
Cos = math.cos
Acos = math.acos
Sin = math.sin
Asin = math.asin
Abs = math.abs
Mrandom = math.random
Floor = math.floor
-------------------------------------------------------
--End Good Stuff--
-------------------------------------------------------
necko = CF(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
RSH, LSH = nil, nil 
RW = Instance.new("Weld") 
LW = Instance.new("Weld")
RH = tors["Right Hip"]
LH = tors["Left Hip"]
RSH = tors["Right Shoulder"] 
LSH = tors["Left Shoulder"] 
RSH.Parent = nil 
LSH.Parent = nil 
RW.Name = "RW"
RW.Part0 = tors 
RW.C0 = CF(1.5, 0.5, 0)
RW.C1 = CF(0, 0.5, 0) 
RW.Part1 = ra
RW.Parent = tors 
LW.Name = "LW"
LW.Part0 = tors 
LW.C0 = CF(-1.5, 0.5, 0)
LW.C1 = CF(0, 0.5, 0) 
LW.Part1 = la
LW.Parent = tors
Effects = {}

-------------------------------------------------------
--Start HeartBeat--
-------------------------------------------------------
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false


lastframe = tick()
script.Heartbeat:Fire()


game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
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
-------------------------------------------------------
--End HeartBeat--
-------------------------------------------------------

-------------------------------------------------------
--Start Important Functions--
-------------------------------------------------------
function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end
function thread(f)
	coroutine.resume(coroutine.create(f))
end
function clerp(a, b, t)
	local qa = {
		QuaternionFromCFrame(a)
	}
	local qb = {
		QuaternionFromCFrame(b)
	}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
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
		if m00 < m11 then
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
			local recip = 0.5 / s
			return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
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
	local startInterp, finishInterp
	if cosTheta >= 1.0E-4 then
		if 1 - cosTheta > 1.0E-4 then
			local theta = math.acos(cosTheta)
			local invSinTheta = 1 / Sin(theta)
			startInterp = Sin((1 - t) * theta) * invSinTheta
			finishInterp = Sin(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	elseif 1 + cosTheta > 1.0E-4 then
		local theta = math.acos(-cosTheta)
		local invSinTheta = 1 / Sin(theta)
		startInterp = Sin((t - 1) * theta) * invSinTheta
		finishInterp = Sin(t * theta) * invSinTheta
	else
		startInterp = t - 1
		finishInterp = t
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end
function rayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end
local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

if game.PlaceId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game, search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game:[UP] Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end


-------------------------------------------------------
--Start Damage Function--
-------------------------------------------------------
function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChildOfClass("Humanoid")
	for _, v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
         if h ~= nil and hit.Parent.Name ~= char.Name and hit.Parent:FindFirstChild("UpperTorso") ~= nil then
	
         print("hi")
         end

	if h ~= nil and hit.Parent.Name ~= char.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil then
			if hit.Parent.DebounceHit.Value == true then
				return
			end
		end
         if insta == true then
         print("yes")
         end
		local c = Create("ObjectValue"){
			Name = "creator",
			Value = owner,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
		if HitSound ~= nil and HitPitch ~= nil then
			CFuncs.Sound.Create(HitSound, hit, 1, HitPitch) 
		end
		local Damage = 0
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil then
			if block.className == "IntValue" then
				if block.Value > 0 then
					blocked = true
					block.Value = block.Value - 1
					print(block.Value)
				end
			end
		end
		if blocked == false then
			h.Health = h.Health - Damage
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, tors.BrickColor.Color)
		else
			h.Health = h.Health - (Damage / 2)
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, tors.BrickColor.Color)
		end
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = (hit.Position - (Property.Position + Vector3.new(0, 0, 0))).unit
			local bodvol = Create("BodyVelocity"){
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodvol, .5)
			game:GetService("Debris"):AddItem(rl, .5)
		elseif Type == "Normal" then
			local vp = Create("BodyVelocity"){
				P = 500,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05,
			}
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end
			game:GetService("Debris"):AddItem(vp, .5)
		elseif Type == "Up" then
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, .5)
		elseif Type == "DarkUp" then
			coroutine.resume(coroutine.create(function()
				for i = 0, 1, 0.1 do
					swait()
					Effects.Block.Create(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, .08, 1)
				end
			end))
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Snare" then
			local bp = Create("BodyPosition"){
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Freeze" then
			local BodPos = Create("BodyPosition"){
				P = 50000,
				D = 1000,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			local BodGy = Create("BodyGyro") {
				maxTorque = Vector3.new(4e+005, 4e+005, 4e+005) * math.huge ,
				P = 20e+003,
				Parent = hit.Parent.Torso,
				cframe = hit.Parent.Torso.CFrame,
			}
			hit.Parent.Torso.Anchored = true
			coroutine.resume(coroutine.create(function(Part) 
				swait(1.5)
				Part.Anchored = false
			end), hit.Parent.Torso)
			game:GetService("Debris"):AddItem(BodPos, 3)
			game:GetService("Debris"):AddItem(BodGy, 3)
		end
		local debounce = Create("BoolValue"){
			Name = "DebounceHit",
			Parent = hit.Parent,
			Value = true,
		}
		game:GetService("Debris"):AddItem(debounce, Delay)
		c = Create("ObjectValue"){
			Name = "creator",
			Value = Player,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
	end
end
-------------------------------------------------------
--End Damage Function--
-------------------------------------------------------

-------------------------------------------------------
--Start Damage Function Customization--
-------------------------------------------------------
function ShowDamage(Pos, Text, Time, Color)
	local Rate = (1 / 30)
	local Pos = (Pos or Vector3.new(0, 0, 0))
	local Text = (Text or "")
	local Time = (Time or 2)
	local Color = (Color or Color3.new(1, 0, 1))
	local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui"){
		Size = UDim2.new(3, 0, 3, 0),
		Adornee = EffectPart,
		Parent = EffectPart,
	}
	local TextLabel = Create("TextLabel"){
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		Font = "Bodoni",
		TextColor3 = Color,
		TextScaled = true,
		TextStrokeColor3 = Color3.fromRGB(0,0,0),
		Parent = BillboardGui,
	}
	game.Debris:AddItem(EffectPart, (Time))
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		local Frames = (Time / Rate)
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = (Frame / Frames)
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end
-------------------------------------------------------
--End Damage Function Customization--
-------------------------------------------------------

function MagniDamage(Part, magni, mindam, maxdam, knock, Type)
  for _, c in pairs(workspace:children()) do
    local hum = c:findFirstChild("Humanoid")
    if hum ~= nil then
      local head = c:findFirstChild("Head")
      if head ~= nil then
        local targ = head.Position - Part.Position
        local mag = targ.magnitude
        if magni >= mag and c.Name ~= plr.Name then
          Damage(head, head, mindam, maxdam, knock, Type, root, 0.1, "http://www.roblox.com/asset/?id=0", 1.2)
        end
      end
    end
  end
end


CFuncs = {
	Part = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part")({
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material
			})
			RemoveOutlines(Part)
			return Part
		end
	},
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh)({
				Parent = Part,
				Offset = OffSet,
				Scale = Scale
			})
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end
	},
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh)({
				Parent = Part,
				Offset = OffSet,
				Scale = Scale
			})
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end
	},
	Weld = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld")({
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1
			})
			return Weld
		end
	},
	Sound = {
		Create = function(id, par, vol, pit)
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound")({
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace
				})
				wait()
				S:play()
				game:GetService("Debris"):AddItem(S, 6)
			end))
		end
	},
	ParticleEmitter = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter")({
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread
			})
			return fp
		end
	}
}
function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreatePart(FormFactor, Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part")({
		formFactor = FormFactor,
		Parent = Parent,
		Reflectance = Reflectance,
		Transparency = Transparency,
		CanCollide = false,
		Locked = true,
		BrickColor = BrickColor.new(tostring(BColor)),
		Name = Name,
		Size = Size,
		Material = Material
	})
	RemoveOutlines(Part)
	return Part
end
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	local Msh = Create(Mesh)({
		Parent = Part,
		Offset = OffSet,
		Scale = Scale
	})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
function CreateWeld(Parent, Part0, Part1, C0, C1)
	local Weld = Create("Weld")({
		Parent = Parent,
		Part0 = Part0,
		Part1 = Part1,
		C0 = C0,
		C1 = C1
	})
	return Weld
end


-------------------------------------------------------
--Start Effect Function--
-------------------------------------------------------
EffectModel = Instance.new("Model", char)
Effects = {
  Block = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      if Type == 1 or Type == nil then
        table.insert(Effects, {
          prt,
          "Block1",
          delay,
          x3,
          y3,
          z3,
          msh
        })
      elseif Type == 2 then
        table.insert(Effects, {
          prt,
          "Block2",
          delay,
          x3,
          y3,
          z3,
          msh
        })
      else
        table.insert(Effects, {
          prt,
          "Block3",
          delay,
          x3,
          y3,
          z3,
          msh
        })
      end
    end
  },
  Sphere = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
  Cylinder = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
  Wave = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://20329976", Vector3.new(0, 0, 0), Vector3.new(x1 / 60, y1 / 60, z1 / 60))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3 / 60,
        y3 / 60,
        z3 / 60,
        msh
      })
    end
  },
  Ring = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
  Break = {
    Create = function(brickcolor, cframe, x1, y1, z1)
      local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
      prt.Anchored = true
      prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      local num = math.random(10, 50) / 1000
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Shatter",
        num,
        prt.CFrame,
        math.random() - math.random(),
        0,
        math.random(50, 100) / 100
      })
    end
  },
Spiral = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://1051557", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
Push = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://437347603", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  }
}
-------------------------------------------------------
--End Effect Function--
-------------------------------------------------------

function CreateSound(ID, PARENT, VOLUME, PITCH)
	local NSound = nil
	coroutine.resume(coroutine.create(function()
		NSound = Instance.new("Sound", PARENT)
		NSound.Volume = VOLUME
		NSound.Pitch = PITCH
		NSound.SoundId = "http://www.roblox.com/asset/?id="..ID
		swait()
		NSound:play()
		game:GetService("Debris"):AddItem(NSound, 10)
	end))
	return NSound
end

function Eviscerate(dude)
print("hi")
end
function SphereAura(bonuspeed, FastSpeed, type, pos, x1, y1, z1, value, color, outerpos)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector * outerpos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = Vector3.new(x1, y1, z1)
	local scaler2 = 1
	local speeder = FastSpeed
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
                        rng.BrickColor = BrickColor.random()
			speeder = speeder - 0.01 * FastSpeed * bonuspeed
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector * speeder * bonuspeed
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, scaler2 * bonuspeed, 0)
		end
		rng:Destroy()
	end))
end

function FindNearestHead(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return Distance > (SinglePlayer.Torso.CFrame.p - Position).magnitude
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v:findFirstChild("Head") and v ~= char and Distance >= (v.Head.Position - Position).magnitude then
			table.insert(List, v)
		end
	end
	return List
end
function SoulSteal(dude)
if dude.Name ~= char then
local bgf = IT("BodyGyro", dude.Head)
bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(Rad(-90), 0, 0)
local val = IT("BoolValue", dude)
val.Name = "IsHit"
local torso = (dude:FindFirstChild'Head' or dude:FindFirstChild'Torso' or dude:FindFirstChild'UpperTorso' or dude:FindFirstChild'LowerTorso' or dude:FindFirstChild'HumanoidRootPart')
local soulst = coroutine.wrap(function()
local soul = Instance.new("Part",dude)
soul.Size = Vector3.new(1,1,1)
soul.CanCollide = false
soul.Anchored = false
soul.Position = torso.Position
soul.Transparency = 1
local PartEmmit1 = IT("ParticleEmitter", soul)
PartEmmit1.LightEmission = 1
PartEmmit1.Texture = "rbxassetid://569507414"
PartEmmit1.Color = ColorSequence.new(maincolor.Color)
PartEmmit1.Rate = 250
PartEmmit1.Lifetime = NumberRange.new(1.6)
PartEmmit1.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1, 0),
	NumberSequenceKeypoint.new(1, 0, 0)
})
PartEmmit1.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0, 0),
	NumberSequenceKeypoint.new(1, 1, 0)
})
PartEmmit1.Speed = NumberRange.new(0, 0)
PartEmmit1.VelocitySpread = 30000
PartEmmit1.Rotation = NumberRange.new(-360, 360)
PartEmmit1.RotSpeed = NumberRange.new(-360, 360)
local BodPoss = IT("BodyPosition", soul)
BodPoss.P = 3000
BodPoss.D = 1000
BodPoss.maxForce = Vector3.new(50000000000, 50000000000, 50000000000)
BodPoss.position = torso.Position + Vector3.new(Mrandom(-15, 15), Mrandom(-15, 15), Mrandom(-15, 15))
wait(1.6)
soul.Touched:connect(function(hit)
	if hit.Parent == char then
	soul:Destroy()
	end
end)
wait(1.2)
while soul do
	swait()
	PartEmmit1.Color = ColorSequence.new(maincolor.Color)
	BodPoss.Position = tors.Position
end
end)
	soulst()
	end
end
function FaceMouse()
local	Cam = workspace.CurrentCamera
	return {
		CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, char.Torso.Position.y, mouse.Hit.p.z)),
		Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
	}
end
-------------------------------------------------------
--End Important Functions--
-------------------------------------------------------
--[[
		Thanks for using Build-To-Lua by jarredbcv.
]]--

New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end
	
Gaunty = New("Model",char,"Gaunty",{})
Handle = New("Part",Gaunty,"Handle",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1, 1.26999998, 1),CFrame = CFrame.new(-5.67319345, 3.02064276, -77.6615906, 0.999894261, 0.010924357, 0.00963267777, -0.0110270018, 0.999882579, 0.0106679145, -0.00951499958, -0.0107729975, 0.999897003),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Mesh = New("BlockMesh",Handle,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.82765579, 3.62595344, -77.6579285, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.161155701, 0.603512526, 0.00862884521, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-6.13765526, 3.62595367, -77.6579285, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.471122265, 0.600126028, 0.00564575195, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.5176549, 3.62595415, -77.6579285, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.148812294, 0.606899738, 0.0116195679, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.21765471, 3.62595463, -77.6579285, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.448780537, 0.610177517, 0.014503479, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-6.13765526, 2.53595448, -77.6579285, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.459102631, -0.489744425, -0.00598144531, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.82765627, 2.53595448, -77.6579285, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.149136543, -0.486357927, -0.00299835205, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.51765537, 2.53595448, -77.6579361, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.160831451, -0.48297143, -1.52587891e-05, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.21765566, 2.53595424, -77.6579361, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.460799217, -0.479694128, 0.00286865234, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.07999992, 0.279999971, 1.06999993),CFrame = CFrame.new(-5.66865063, 3.64553881, -77.6613617, 0.999894857, 0.0109243635, 0.00963268708, -0.0110270083, 0.999883175, 0.0106679257, -0.00951500144, -0.0107729994, 0.999897599),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Mesh = New("BlockMesh",Part,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),C1 = CFrame.new(-0.00235080719, 0.624869347, 0.00694274902, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66490126, 3.73544312, -77.6652145, 0.999894857, 0.0109243635, 0.00963268708, -0.0110270083, 0.999883175, 0.0106679257, -0.00951500144, -0.0107729994, 0.999897599),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),C1 = CFrame.new(0.000443935394, 0.714845657, 0.00408172607, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66480446, 3.52554965, -77.65522, 0.999894857, 0.0109243635, 0.00963268708, -0.0110270083, 0.999883175, 0.0106679257, -0.00951500144, -0.0107729994, 0.999897599),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),C1 = CFrame.new(0.00275993347, 0.504870415, 0.0118331909, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.07999992, 0.279999971, 1.06999993),CFrame = CFrame.new(-5.6686511, 2.55553746, -77.6613541, 0.999894857, 0.0109243635, 0.00963268708, -0.0110270083, 0.999883175, 0.0106679257, -0.00951500144, -0.0107729994, 0.999897599),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Mesh = New("BlockMesh",Part,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),C1 = CFrame.new(0.00966835022, -0.465003252, -0.00468444824, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66490126, 2.64544272, -77.6652145, 0.999894857, 0.0109243635, 0.00963268708, -0.0110270083, 0.999883175, 0.0106679257, -0.00951500144, -0.0107729994, 0.999897599),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),C1 = CFrame.new(0.0124630928, -0.375026226, -0.00754547119, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66480494, 2.43554902, -77.65522, 0.999894857, 0.0109243635, 0.00963268708, -0.0110270083, 0.999883175, 0.0106679257, -0.00951500144, -0.0107729994, 0.999897599),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),C1 = CFrame.new(0.0147790909, -0.585001707, 0.000205993652, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265606, 3.62595463, -78.1079407, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(-0.0018901825, 0.61005497, -0.439842224, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265606, 3.62595558, -77.8179321, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(-0.00464963913, 0.606931448, -0.149864197, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 3.62595606, -77.4879303, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(-0.00278997421, 0.603431463, 0.180152893, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 3.62595654, -77.1979294, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(-0.00554895401, 0.600307703, 0.470123291, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 2.53595638, -77.1979294, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(0.0064702034, -0.489563704, 0.458496094, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 2.53595614, -77.4879303, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(0.00922966003, -0.486439705, 0.168525696, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265558, 2.53595638, -77.8179245, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(0.00736999512, -0.482939243, -0.161483765, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265606, 2.53595614, -78.1079254, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(0.0101289749, -0.479815245, -0.451454163, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765547, 3.62595677, -77.1979218, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(-0.00554943085, 0.600307941, 0.47013092, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 3.62595701, -77.4879303, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(-0.00278949738, 0.603432655, 0.180152893, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765451, 3.62595749, -77.8179321, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(0.000350952148, 0.606987953, -0.149810791, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765451, 3.62595749, -78.107933, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(0.00311040878, 0.61011219, -0.439788818, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.53595734, -78.107933, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(0.0151295662, -0.479759216, -0.451416016, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.5359571, -77.8179245, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(0.0123701096, -0.482883692, -0.161437988, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.5359571, -77.4879227, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(0.00923013687, -0.48643899, 0.168533325, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.53595686, -77.1979218, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C1 = CFrame.new(0.00647068024, -0.489563227, 0.458503723, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-6.13765478, 3.62595701, -77.6579132, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.471121788, 0.600129128, 0.00566101074, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.82765484, 3.62595725, -77.6579132, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.161154747, 0.603516102, 0.008644104, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.51765442, 3.62595773, -77.6579132, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.148812771, 0.606903076, 0.0116348267, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.21765375, 3.6259582, -77.6579132, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.44878149, 0.610180855, 0.0145187378, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.21765327, 2.53595781, -77.6579132, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.460801125, -0.47969079, 0.00289154053, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.51765299, 2.53595757, -77.6579208, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.160833359, -0.48296833, 0, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.82765341, 2.53595734, -77.6579208, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.149133682, -0.486355066, -0.00299072266, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-6.13765383, 2.53595734, -77.6579208, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(-0.4591012, -0.489741802, -0.00597381592, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.25000003),CFrame = CFrame.new(-5.66203499, 3.4509573, -77.7865677, 1.0000006, -6.18456397e-10, 3.7252903e-09, -6.18456397e-10, 1.0000006, 4.65661287e-09, 3.7252903e-09, 4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C1 = CFrame.new(0.00760126114, 0.431732178, -0.120269775, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.280000031),CFrame = CFrame.new(-5.66203451, 3.45095778, -77.5215683, -1.0000006, -6.18456397e-10, -9.12696123e-08, 6.18456397e-10, 1.0000006, -4.65661287e-09, 8.38190317e-08, 4.65661287e-09, -1.0000006),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -1, 0, 8.74227766e-08, 0, 1, 0, -8.74227766e-08, 0, -1),C1 = CFrame.new(0.00508022308, 0.428877592, 0.144706726, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.25000003),CFrame = CFrame.new(-5.66203403, 2.81095791, -77.7865601, -1.0000006, 8.81700544e-08, 3.7252903e-09, -8.69331416e-08, -1.0000006, 4.65661287e-09, -3.7252903e-09, -4.65661287e-09, 1.0000006),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -1, -8.74227766e-08, 0, 8.74227766e-08, -1, 0, 0, 0, 1),C1 = CFrame.new(0.0146594048, -0.208191872, -0.127082825, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.280000031),CFrame = CFrame.new(-5.66203356, 2.8209579, -77.5215607, 1.0000006, -8.69331416e-08, 8.38190317e-08, -8.81700544e-08, -1.0000006, -4.65661287e-09, 9.12696123e-08, -4.65661287e-09, -1.0000006),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 1, -8.74227766e-08, 8.74227766e-08, -8.74227766e-08, -1, -7.64274186e-15, 8.74227766e-08, 0, -1),C1 = CFrame.new(0.0120282173, -0.201047897, 0.137992859, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Wedge = New("WedgePart",Gaunty,"Wedge",{BrickColor = BrickColor.new("Black"),Size = Vector3.new(1.1099999, 0.569999993, 1.13),CFrame = CFrame.new(-5.6508193, 4.06113148, -77.6620178, -4.74974513e-08, -6.18456397e-10, 1.0000006, -5.58793545e-09, 1.0000006, -1.5279511e-10, -1.0000006, 4.65661287e-09, -4.00468707e-08),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Wedge,"mot",{Part0 = Wedge,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),C1 = CFrame.new(0.0109024048, 1.04061508, 0.010887146, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})

Gaunty2 = New("Model",char,"Gaunty2",{})
Handle2 = New("Part",Gaunty2,"Handle2",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1, 1.26999998, 1),CFrame = CFrame.new(-5.67319345, 3.02064276, -77.6615906, 0.999894261, 0.010924357, 0.00963267777, -0.0110270018, 0.999882579, 0.0106679145, -0.00951499958, -0.0107729975, 0.999897003),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Mesh = New("BlockMesh",Handle2,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.82765579, 3.62595367, -77.6579285, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.161155701, 0.603512764, 0.00862884521, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-6.13765526, 3.62595439, -77.6579285, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.471122265, 0.600126743, 0.00564575195, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.51765394, 3.6259551, -77.6579285, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.148813248, 0.606900692, 0.0116195679, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.21765375, 3.62595558, -77.6579285, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.44878149, 0.610178471, 0.014503479, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-6.13765621, 2.535954, -77.6579285, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.459103584, -0.489744902, -0.00598144531, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.82765722, 2.535954, -77.6579285, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.149137497, -0.486358404, -0.00299835205, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.5176549, 2.53595448, -77.6579514, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.160831928, -0.482971191, -3.05175781e-05, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.21765566, 2.535954, -77.6579361, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.460799217, -0.479694366, 0.00286865234, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.07999992, 0.279999971, 1.06999993),CFrame = CFrame.new(-5.66865063, 3.64554, -77.661377, 0.999896049, 0.0109243765, 0.00963270571, -0.0110270213, 0.999884367, 0.010667949, -0.0095150033, -0.0107730031, 0.999898791),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Mesh = New("BlockMesh",Part,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 0.999895453, -0.0110270148, -0.00951500237, 0.01092437, 0.999883771, -0.0107730012, 0.0096326964, 0.0106679378, 0.999898195),C1 = CFrame.new(-0.00235033035, 0.624870777, 0.00692749023, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.6649003, 3.73544407, -77.6652145, 0.999896049, 0.0109243765, 0.00963270571, -0.0110270213, 0.999884367, 0.010667949, -0.0095150033, -0.0107730031, 0.999898791),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 0.999895453, -0.0110270148, -0.00951500237, 0.01092437, 0.999883771, -0.0107730012, 0.0096326964, 0.0106679378, 0.999898195),C1 = CFrame.new(0.000444412231, 0.714846611, 0.00408172607, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66480446, 3.5255506, -77.65522, 0.999896049, 0.0109243765, 0.00963270571, -0.0110270213, 0.999884367, 0.010667949, -0.0095150033, -0.0107730031, 0.999898791),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 0.999895453, -0.0110270148, -0.00951500237, 0.01092437, 0.999883771, -0.0107730012, 0.0096326964, 0.0106679378, 0.999898195),C1 = CFrame.new(0.00275993347, 0.504871368, 0.0118331909, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.07999992, 0.279999971, 1.06999993),CFrame = CFrame.new(-5.6686511, 2.55553699, -77.6613541, 0.999896049, 0.0109243765, 0.00963270571, -0.0110270213, 0.999884367, 0.010667949, -0.0095150033, -0.0107730031, 0.999898791),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Mesh = New("BlockMesh",Part,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 0.999895453, -0.0110270148, -0.00951500237, 0.01092437, 0.999883771, -0.0107730012, 0.0096326964, 0.0106679378, 0.999898195),C1 = CFrame.new(0.00966835022, -0.465003729, -0.00468444824, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66490126, 2.64544272, -77.6652145, 0.999896049, 0.0109243765, 0.00963270571, -0.0110270213, 0.999884367, 0.010667949, -0.0095150033, -0.0107730031, 0.999898791),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 0.999895453, -0.0110270148, -0.00951500237, 0.01092437, 0.999883771, -0.0107730012, 0.0096326964, 0.0106679378, 0.999898195),C1 = CFrame.new(0.0124630928, -0.375026226, -0.00754547119, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.08999991, 0.0599999577, 1.07999992),CFrame = CFrame.new(-5.66480589, 2.43554854, -77.65522, 0.999896049, 0.0109243765, 0.00963270571, -0.0110270213, 0.999884367, 0.010667949, -0.0095150033, -0.0107730031, 0.999898791),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("BlockMesh",NeonPart,"Mesh",{Scale = Vector3.new(1.03999996, 1, 1.03999996),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 0.999895453, -0.0110270148, -0.00951500237, 0.01092437, 0.999883771, -0.0107730012, 0.0096326964, 0.0106679378, 0.999898195),C1 = CFrame.new(0.0147781372, -0.585002184, 0.000205993652, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265606, 3.62595463, -78.1079407, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(-0.0018901825, 0.61005497, -0.439842224, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265511, 3.6259563, -77.8179169, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(-0.00464916229, 0.606932163, -0.149848938, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765451, 3.62595701, -77.4879303, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(-0.00278902054, 0.603432655, 0.180152893, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 3.62595749, -77.1979294, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(-0.00554895401, 0.600308895, 0.470123291, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 2.53595638, -77.1979294, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.0064702034, -0.489563704, 0.458496094, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.13999987, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.66765547, 2.53595614, -77.4879303, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.00922966003, -0.486439705, 0.168525696, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265558, 2.53595638, -77.8179092, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.00736999512, -0.482939243, -0.161468506, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("Part",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.12999988, 0.109999999, 0.109999999),CFrame = CFrame.new(-5.67265606, 2.53595567, -78.1079254, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.0101289749, -0.479815722, -0.451454163, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765451, 3.62595749, -77.1979218, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(-0.00554847717, 0.600308895, 0.47013092, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765404, 3.62595797, -77.4879303, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(-0.0027885437, 0.603433609, 0.180152893, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765356, 3.6259594, -77.8179321, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.000351905823, 0.606989861, -0.149810791, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765356, 3.62595844, -78.107933, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.00311136246, 0.610113144, -0.439788818, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.53595734, -78.107933, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.0151295662, -0.479759216, -0.451416016, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.5359571, -77.8179092, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.0123701096, -0.48288393, -0.161422729, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.5359571, -77.4879227, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.00923013687, -0.48643899, 0.168533325, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.66765499, 2.53595662, -77.1979218, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.00647068024, -0.489563465, 0.458503723, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-6.13765478, 3.62595797, -77.6579132, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.471121788, 0.600130081, 0.00566101074, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.82765484, 3.6259582, -77.6579132, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.161154747, 0.603517056, 0.008644104, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.51765347, 3.62595868, -77.6579132, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.148813725, 0.60690403, 0.0116348267, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.2176528, 3.62595916, -77.6579132, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.448782444, 0.610181808, 0.0145187378, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.21765327, 2.53595757, -77.6579132, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.460801601, -0.479691029, 0.00289154053, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.51765299, 2.53595757, -77.6579361, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.160833836, -0.48296833, -1.52587891e-05, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-5.82765436, 2.5359571, -77.6579208, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.149134636, -0.486355305, -0.00299072266, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Part = New("Part",Gaunty2,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.Metal,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.15999985, 0.0700000003, 0.0700000003),CFrame = CFrame.new(-6.13765478, 2.53595734, -77.6579208, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(-0.459102154, -0.489741802, -0.00597381592, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.25000003),CFrame = CFrame.new(-5.66203403, 3.45095801, -77.7865524, 1.00000179, -2.26282282e-09, 1.11758709e-08, -2.28465069e-09, 1.00000179, 1.39698386e-08, 1.11758709e-08, 1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -1.44791557e-09, 7.4505806e-09, -1.44063961e-09, 1.00000119, 9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.00760221481, 0.431732655, -0.120254517, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.280000031),CFrame = CFrame.new(-5.66203356, 3.45095849, -77.521553, -1.00000179, -2.26282282e-09, -9.87201929e-08, 2.28465069e-09, 1.00000179, -1.39698386e-08, 7.63684511e-08, 1.39698386e-08, -1.00000179),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -1.00000119, 1.45519152e-09, 8.00937414e-08, -1.44063961e-09, 1.00000119, 9.31322575e-09, -9.49949026e-08, -9.31322575e-09, -1.00000119),C1 = CFrame.new(0.00508117676, 0.428878307, 0.144721985, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.25000003),CFrame = CFrame.new(-5.66203308, 2.81095791, -77.7865601, -1.00000179, 8.98216967e-08, 1.11758709e-08, -8.52742232e-08, -1.00000179, 1.39698386e-08, -1.11758709e-08, -1.39698386e-08, 1.00000179),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -1.00000119, -8.61036824e-08, -7.4505806e-09, 8.89922376e-08, -1.00000119, -9.31322575e-09, 7.4505806e-09, 9.31322575e-09, 1.00000119),C1 = CFrame.new(0.0146603584, -0.208191872, -0.127082825, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
NeonPart = New("WedgePart",Gaunty2,"NeonPart",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,Size = Vector3.new(1.14999998, 0.640000045, 0.280000031),CFrame = CFrame.new(-5.6620326, 2.82095814, -77.5215454, 1.00000179, -8.52887752e-08, 7.63684511e-08, -8.98362487e-08, -1.00000179, -1.39698386e-08, 9.87201929e-08, -1.39698386e-08, -1.00000179),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
mot = New("Motor",NeonPart,"mot",{Part0 = NeonPart,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, 1.00000119, -8.89995135e-08, 9.49949026e-08, -8.61109584e-08, -1.00000119, -9.31322575e-09, 8.00937414e-08, -9.31322575e-09, -1.00000119),C1 = CFrame.new(0.012029171, -0.201047897, 0.138008118, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})
Wedge = New("WedgePart",Gaunty2,"Wedge",{BrickColor = BrickColor.new("Black"),Size = Vector3.new(1.1099999, 0.569999993, 1.13),CFrame = CFrame.new(-5.6508193, 4.06113243, -77.6620178, -5.49480319e-08, -2.26282282e-09, 1.00000179, -1.67638063e-08, 1.00000179, -1.8189894e-09, -1.00000179, 1.39698386e-08, -3.25962901e-08),BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Wedge,"mot",{Part0 = Wedge,Part1 = Handle2,C0 = CFrame.new(0, 0, 0, -5.12227416e-08, -1.11758709e-08, -1.00000119, -1.44063961e-09, 1.00000119, 9.31322575e-09, 1.00000119, -9.89530236e-10, -3.63215804e-08),C1 = CFrame.new(0.0109024048, 1.04061604, 0.010887146, 0.999894261, -0.0110270018, -0.00951499958, 0.010924357, 0.999882579, -0.0107729975, 0.00963267777, 0.0106679145, 0.999897003),})


NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance,parent)
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

local HW = NewInstance('Motor', char, {Part0 = ra, Part1 = Handle, C0 = CF(0,-.51,0)})
local HW2 = NewInstance('Motor', char, {Part0 = la, Part1 = Handle2, C0 = CF(0,-.51,0) * angles(Rad(0),Rad(180),Rad(0))})

for _,v in next, Gaunty:children() do
	v.CanCollide = false
end
for _,v in next, Gaunty2:children() do
	v.CanCollide = false
end
local all, last = {}, nil
ArmourParts = {}
NeonParts = {}
function scan(p)
  for _, v in pairs(p:GetChildren()) do
    if v:IsA("BasePart") then
      if v.BrickColor == BrickColor.new("Black") then
        table.insert(ArmourParts, v)
      end
      if v.BrickColor == BrickColor.new("Institutional white") then
        table.insert(NeonParts, v)
      end
      if last then
        local w = Instance.new("Weld")
        w.Part0, w.Part1 = last, v
        w.C0 = v.CFrame:toObjectSpace(last.CFrame):inverse()
        w.Parent = last
      end
      table.insert(all, v)
      last = v
    end
    scan(v)
  end
end
scan(Gaunty)
local all2, last2 = {}, nil
ArmourParts2 = {}
NeonParts2 = {}
function scan2(p)
  for _, v in pairs(p:GetChildren()) do
    if v:IsA("BasePart") then
      if v.BrickColor == BrickColor.new("Black") then
        table.insert(ArmourParts2, v)
      end
      if v.BrickColor == BrickColor.new("Institutional white") then
        table.insert(NeonParts2, v)
      end
      if last2 then
        local w = Instance.new("Weld")
        w.Part0, w.Part1 = last2, v
        w.C0 = v.CFrame:toObjectSpace(last2.CFrame):inverse()
        w.Parent = last2
      end
      table.insert(all2, v)
      last2 = v
    end
    scan2(v)
  end
end
scan2(Gaunty2)
for i, v in pairs(ArmourParts) do
     v.BrickColor = BrickC("Black")
		end
for i, v in pairs(NeonParts) do
     v.BrickColor = BrickC("Really red")
      	end
for i, v in pairs(ArmourParts2) do
     v.BrickColor = BrickC("Black")
		end
for i, v in pairs(NeonParts2) do
     v.BrickColor = BrickC("Really red")
      	end
maincolor = BrickC("Really red")
-------------------------------------------------------
--Start Music Option--
-------------------------------------------------------
local Music = Instance.new("Sound",char)
Music.Volume = 2.5
Music.SoundId = "rbxassetid://550578451"
Music.Looped = true
Music.Pitch = 1 --Pitcher
Music:Play()
-------------------------------------------------------
--End Music Option--
-------------------------------------------------------
local naeeym2 = Instance.new("BillboardGui",char)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(5,35,2,35)
naeeym2.StudsOffset = Vector3.new(0,2,0)
naeeym2.Adornee = hed
naeeym2.Name = "Name"

local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = "Ender"
tecks2.Font = "Garamond"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(0,0,0)
tecks2.TextStrokeColor3 = Color3.new(0, 0, 0)
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2

function chatfunc(text, color)
	local chat = coroutine.wrap(function()
		if char:FindFirstChild("TalkingBillBoard") ~= nil then
			char:FindFirstChild("TalkingBillBoard"):destroy()
		end
		local naeeym2 = Instance.new("BillboardGui", char)
		naeeym2.Size = UDim2.new(0, 100, 0, 40)
		naeeym2.StudsOffset = Vector3.new(0, 5, 0)
		naeeym2.Adornee = hed
		naeeym2.Name = "TalkingBillBoard"
		local tecks2 = Instance.new("TextLabel", naeeym2)
		tecks2.BackgroundTransparency = 1
		tecks2.BorderSizePixel = 0
		tecks2.Text = ""
		tecks2.Font = "SciFi"
		tecks2.TextSize = 30
		tecks2.TextStrokeTransparency = 0
		tecks2.TextColor3 = color
		tecks2.TextStrokeColor3 = Color3.new(0, 0, 0)
		tecks2.Size = UDim2.new(1, 0, 0.5, 0)
		local tecks3 = Instance.new("TextLabel", naeeym2)
		tecks3.BackgroundTransparency = 1
		tecks3.BorderSizePixel = 0
		tecks3.Text = ""
		tecks3.Font = "SciFi"
		tecks3.TextSize = 30
		tecks3.TextStrokeTransparency = 0
		tecks3.TextColor3 = Color3.new(0, 0, 0)
		tecks3.TextStrokeColor3 = color
		tecks3.Size = UDim2.new(1, 0, 0.5, 0)
		coroutine.resume(coroutine.create(function()
			while true do
				swait(1)
					tecks2.TextColor3 = BrickColor.random().Color
					tecks3.TextStrokeColor3 = BrickColor.random().Color
				tecks2.Position = UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
				tecks3.Position = UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
				tecks2.Rotation = math.random(-5, 5)
				tecks3.Rotation = math.random(-5, 5)
			end
		end))
		for i = 1, string.len(text) do
			CFuncs.Sound.Create("rbxassetid://274118116", char, 0.25, 0.115)
			tecks2.Text = string.sub(text, 1, i)
			tecks3.Text = string.sub(text, 1, i)
			swait(1)
		end
		wait(1)
		local randomrot = math.random(1, 2)
		if randomrot == 1 then
			for i = 1, 50 do
				swait()
				tecks2.Rotation = tecks2.Rotation - 0.75
				tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency + 0.04
				tecks2.TextTransparency = tecks2.TextTransparency + 0.04
				tecks3.Rotation = tecks2.Rotation + 0.75
				tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency + 0.04
				tecks3.TextTransparency = tecks2.TextTransparency + 0.04
			end
		elseif randomrot == 2 then
			for i = 1, 50 do
				swait()
				tecks2.Rotation = tecks2.Rotation + 0.75
				tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency + 0.04
				tecks2.TextTransparency = tecks2.TextTransparency + 0.04
				tecks3.Rotation = tecks2.Rotation - 0.75
				tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency + 0.04
				tecks3.TextTransparency = tecks2.TextTransparency + 0.04
			end
		end
		naeeym2:Destroy()
	end)
	chat()
end
-------------------------------------------------------
--Start Attacks N Stuff--
-------------------------------------------------------
local sine=0
function HitboxFunction(Pose, lifetime, siz1, siz2, siz3, Radie, Min, Max, kb, atype)
  local Hitboxpart = Instance.new("Part", EffectModel)
  RemoveOutlines(Hitboxpart)
  Hitboxpart.Size = Vector3.new(siz1, siz2, siz3)
  Hitboxpart.CanCollide = false
  Hitboxpart.Transparency = 1
  Hitboxpart.Anchored = true
  Hitboxpart.CFrame = Pose
  game:GetService("Debris"):AddItem(Hitboxpart, lifetime)
  MagniDamage(Hitboxpart, Radie, Min, Max, kb, atype)
end
wait2 = false
combo = 1

task.spawn(function()
while game:GetService("RunService").Heartbeat:Wait() do
if attack then
fling(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Model").HumanoidRootPart.Position, 0.1)
end
end
end)

mouse.Button1Down:connect(function(key)
  if attack == false then
    attack = true
    hum.WalkSpeed = 3.01
    if combo == 1 and wait2 == false then
      wait2 = true
		for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(-5), math.rad(0), math.rad(-65)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(-10), math.rad(0), math.rad(-65)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.8) * angles(math.rad(90), math.rad(0), math.rad(20)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(0), math.rad(40)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, -0.2) * RHCF * angles(math.rad(-2.5), math.rad(0), math.rad(-0)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(15), math.rad(-20)), 0.3)
		  end
		CreateSound("138097048", ra, 3, .8)
		HitboxFunction(ra.CFrame, 0.01, 1, 1, 1, 7, 6, 9, 3, "Normal")
      for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(5), math.rad(0), math.rad(55)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(10), math.rad(0), math.rad(0)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -0.8) * angles(math.rad(95), math.rad(0), math.rad(40)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(0), math.rad(-10)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * angles(math.rad(-2.5), math.rad(-25), math.rad(-17)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(-0), math.rad(0)), 0.3)
      end
      combo = 2
    end
 	if combo == 2 and wait2 == false then
      wait2 = true
   for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(-5), math.rad(0), math.rad(65)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(-10), math.rad(0), math.rad(65)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.8) * angles(math.rad(-25), math.rad(0), math.rad(40)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(20)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, -0.2) * RHCF * angles(math.rad(-2.5), math.rad(0), math.rad(-0)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(15), math.rad(-20)), 0.3)
		  end
		CreateSound("138097048", ra, 3, .8)
		HitboxFunction(ra.CFrame, 0.01, 1, 1, 1, 7, 6, 9, 3, "Normal")
      for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(5), math.rad(0), math.rad(-55)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(10), math.rad(0), math.rad(0)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-25), math.rad(0), math.rad(10)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -0.8) * angles(math.rad(95), math.rad(0), math.rad(-40)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * angles(math.rad(-2.5), math.rad(-25), math.rad(-17)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(-0), math.rad(0)), 0.3)
      end
      combo = 3
    end
   if combo == 3 and wait2 == false then
	wait2 = true
    for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(-5), math.rad(0), math.rad(-35)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(-10), math.rad(0), math.rad(0)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.8) * angles(math.rad(90), math.rad(0), math.rad(20)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(0), math.rad(-10)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, -0.2) * RHCF * angles(math.rad(-2.5), math.rad(0), math.rad(-0)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(15), math.rad(-20)), 0.3)
      end
	CreateSound("138097048", ra, 3, .8)
      HitboxFunction(ra.CFrame, 0.01, 1, 1, 1, 7, 24, 36, 3, "Normal")
      for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(5), math.rad(0), math.rad(35)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(10), math.rad(0), math.rad(0)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -0.8) * angles(math.rad(96), math.rad(0), math.rad(10)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(0), math.rad(-10)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * angles(math.rad(-2.5), math.rad(-25), math.rad(-0)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(-0), math.rad(0)), 0.3)
      end
		Effects.Sphere.Create(maincolor, ra.CFrame * CFrame.new(0,-2,0) , 85, 85, 85, 1.1, 1.1, 1.1, 0.02)
		Effects.Ring.Create(maincolor, ra.CFrame * CFrame.new(0,-2,0) , 2, 2, 2, 1.1, 1.1, 1.1, 0.03)
		for i = 0, 2 do
			SphereAura(2, 0.2, "Add", ra.CFrame * CFrame.Angles(math.rad(-90 + math.random(-20, 20)), math.rad(math.random(-20, 20)), math.rad(math.random(-20, 20))), 0.5, 0.5, 5, -0.005, maincolor, 0)
			end
		coroutine.resume(coroutine.create(function() 
		for i = 0,1.8,0.1 do
			swait()
			hum.CameraOffset = Vector3.new(Mrandom(-1,1),0,Mrandom(-1,1))
		end
		for i = 0,1.8,0.1 do
			swait()
		hum.CameraOffset = Vector3.new(0,0,0)
		end
	  end))
		HitboxFunction(ra.CFrame, 0.01, 1, 1, 1, 7, 24, 36, 3, "Normal")
	for i = 0, 1.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CFrame.new(0, -0.5, 0) * angles(math.rad(5), math.rad(0), math.rad(-35)), 0.3)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(math.rad(10), math.rad(0), math.rad(0)), 0.1)
        RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -0.8) * angles(math.rad(25), math.rad(0), math.rad(10)), 0.1)
        LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(0), math.rad(-10)), 0.3)
        RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * angles(math.rad(-2.5), math.rad(-25), math.rad(-0)), 0.3)
        LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * angles(math.rad(-2.5), math.rad(-0), math.rad(0)), 0.3)
      end
      combo = 4
    end
	if combo == 4 and wait2 == false then
	for i = 0,1.2,0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-20), Rad(0), Rad(0)), 0.15)
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-20 - 2.5 * Sin(sine / 20)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-4.5), Rad(0), Rad(-20)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.4 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-6.5), Rad(5 * Cos(sine / 20)), Rad(25)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(200), Rad(0), Rad(25 - 2.5 * Sin(sine / 20))), 0.1)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(200), Rad(0), Rad(-25 + 2.5 * Sin(sine / 20))), 0.1)
	end
SphereAura(6, 0.3, "Add", root.CFrame * CF(0,-2,0) * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 0.5, 0.5, 5, -0.005, maincolor, 0)
		SphereAura(6, 0.3, "Add", root.CFrame * CF(0,-2,0) * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 0.5, 0.5, 5, -0.005, maincolor, 0)
        Effects.Sphere.Create(maincolor, root.CFrame * CFrame.new(0,-2,0) , 85, 85, 85, 15.1, 15.1, 15.1, 0.01)
	CreateSound("331666100", char, 10, 1)
        for i, v in pairs(FindNearestHead(tors.CFrame.p, 14.5)) do
		if v:FindFirstChild("Head") then
			SoulSteal(v)
			Eviscerate(v)
		end
	end
	coroutine.resume(coroutine.create(function() 
		for i = 0,1.8,0.1 do
			swait()
			hum.CameraOffset = Vector3.new(Mrandom(-1,1),0,Mrandom(-1,1))
		end
		for i = 0,1.8,0.1 do
			swait()
		hum.CameraOffset = Vector3.new(0,0,0)
		end
	  end))
	for i = 1,4.7,0.1 do
	rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -1.4 + 0.1 * Cos(sine / 20)) * angles(Rad(45), Rad(0), Rad(0)), 0.15)
	tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(35), Rad(0), Rad(0)), 0.3)
	RH.C0 = clerp(RH.C0, CF(1, .4 - 0.1 * Cos(sine / 20), -.6 + 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-5), Rad(0), Rad(45)), 0.15)
	LH.C0 = clerp(LH.C0, CF(-1, -0.6 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-5), Rad(0), Rad(-0)), 0.15)
	RW.C0 = clerp(RW.C0, CF(1.2, 0.1 + 0.05 * Sin(sine / 30), -.4 + 0.025 * Cos(sine / 20)) * angles(Rad(65), Rad(0), Rad(-34)), 0.1)
	LW.C0 = clerp(LW.C0, CF(-1.2, 0.1 + 0.05 * Sin(sine / 30), -.4 + 0.025 * Cos(sine / 20)) * angles(Rad(65), Rad(0), Rad(34)), 0.1)
	end
      wait(.6)
	combo = 1
	end
    hum.WalkSpeed = 16
    wait2 = false
    attack = false
	end
end)
function Destruction()
	attack = true
	local Ring1 = Instance.new("Part", char)
	Ring1.Anchored = true
	Ring1.BrickColor = maincolor
	Ring1.CanCollide = false
	Ring1.FormFactor = 3
	Ring1.Name = "Ring"
	Ring1.Material = "Neon"
	Ring1.Size = Vector3.new(1, 0.05, 1)
	Ring1.Transparency = 1
	Ring1.TopSurface = 0
	Ring1.BottomSurface = 0
	local Ring1Mesh = Instance.new("SpecialMesh", Ring1)
	Ring1Mesh.MeshType = "Brick"
	Ring1Mesh.Name = "SizeMesh"
	Ring1Mesh.Scale = Vector3.new(0, 1, 0)
	local InnerRing1 = Ring1:Clone()
	InnerRing1.Parent = char
	InnerRing1.Transparency = 0
	InnerRing1.BrickColor = BrickColor.new("New Yeller")
	InnerRing1.Size = Vector3.new(1, 1, 1)
	local InnerRing1Mesh = InnerRing1.SizeMesh
	InnerRing1Mesh.Scale = Vector3.new(0, 0, 0)
	InnerRing1Mesh.MeshType = "Sphere"
	Ring1:Destroy()
	for i = 0, 5, 0.1 do
		swait()
		SphereAura(7, 0.12, "Add", ra.CFrame * CF(0,-2,0) * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 0.5, 0.5, 5, -0.005, maincolor, 0)
		SphereAura(7, 0.12, "Add", ra.CFrame * CF(0,-2,0) * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 0.5, 0.5, 5, -0.005, BrickC("Institutional white"), 0)
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(5), Rad(0), Rad(0)), 0.15)
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-4.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-12.5 + 3 * Sin(sine / 20)), Rad(0), Rad(0 + 2.5 * Sin(sine / 20))), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5 + 3 * Sin(sine / 20)), Rad(0), Rad(0 + 2.5 * Sin(sine / 20))), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.1, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-25)), 0.1)
		LW.C0 = clerp(LW.C0, CF(-1.1, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(25)), 0.1)
		root.CFrame = FaceMouse()[1]
	end
	InnerRing1.Transparency = 1
	InnerRing1.CFrame = root.CFrame * CF(0, 0.5, 0) + root.CFrame.lookVector * 5
	CreateSound("294188875", char, 2.3, 1)
	local a = IT("Part", char)
	a.Name = "Direction"
	a.Anchored = true
	a.BrickColor = maincolor
	a.Material = "Neon"
	a.Transparency = 0
	a.Shape = "Cylinder"
	a.CanCollide = false
	local a2 = IT("Part", char)
	a2.Name = "Direction"
	a2.Anchored = true
	a2.BrickColor = maincolor
	a2.Color = maincolor.Color
	a2.Material = "Neon"
	a2.Transparency = 0.5
	a2.Shape = "Cylinder"
	a2.CanCollide = false
	local ba = IT("Part", char)
	ba.Name = "HitDirect"
	ba.Anchored = true
	ba.BrickColor = maincolor
	ba.Material = "Neon"
	ba.Transparency = 1
	ba.CanCollide = false
	local ray = Ray.new(InnerRing1.CFrame.p, (mouse.Hit.p - InnerRing1.CFrame.p).unit * 1000)
	local ignore = char
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	a2.BottomSurface = 10
	a2.TopSurface = 10
	local distance = (InnerRing1.CFrame.p - position).magnitude
	a.Size = Vector3.new(distance, 1, 1)
	a.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
	a2.Size = Vector3.new(distance, 1, 1)
	a2.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
	ba.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance)
	a.CFrame = a.CFrame * angles(0, Rad(90), 0)
	a2.CFrame = a2.CFrame * angles(0, Rad(90), 0)
	game:GetService("Debris"):AddItem(a, 20)
	game:GetService("Debris"):AddItem(a2, 20)
	game:GetService("Debris"):AddItem(ba, 20)
	local msh = Instance.new("SpecialMesh", a)
	msh.MeshType = "Sphere"
	msh.Scale = Vector3.new(1, 25, 25)
	local msh2 = Instance.new("SpecialMesh", a2)
	msh2.MeshType = "Sphere"
	msh2.Scale = Vector3.new(1, 30, 30)
	for i = 0, 10, 0.1 do
		swait()
		root.CFrame = FaceMouse()[1]
		hum.CameraOffset = Vector3.new(Mrandom(-1,1),0,Mrandom(-1,1))
		a2.Color = maincolor.Color
		InnerRing1.CFrame = root.CFrame * CF(0, 0.5, 0) + root.CFrame.lookVector * 4
		ray = Ray.new(InnerRing1.CFrame.p, (mouse.Hit.p - InnerRing1.CFrame.p).unit * 1000)
		hit, position, normal = workspace:FindPartOnRay(ray, ignore)
		distance = (InnerRing1.CFrame.p - position).magnitude
		a.Size = Vector3.new(distance, 1, 1)
		a.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
		a2.Size = Vector3.new(distance, 1, 1)
		a2.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
		ba.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance)
		a.CFrame = a.CFrame * angles(0, Rad(90), 0)
		a2.CFrame = a2.CFrame * angles(0, Rad(90), 0)
		msh.Scale = msh.Scale - Vector3.new(0, 0.25, 0.25)
		msh2.Scale = msh2.Scale - Vector3.new(0, 0.3, 0.3)
		SphereAura(5, 0.15, "Add", ba.CFrame * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 15, 15, 25, -0.15, maincolor, 0)
		SphereAura(5, 0.15, "Add", ba.CFrame * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 15, 15, 25, -0.15, maincolor, 0)
		for i, v in pairs(FindNearestHead(ba.CFrame.p, 14.5)) do
		if v:FindFirstChild("Head") then
			Eviscerate(v)
			SoulSteal(v)
		end
	end
	end
	a:Destroy()
	a2:Destroy()
	ba:Destroy()
	InnerRing1:Destroy()
	attack = false
	hum.CameraOffset = Vector3.new(0,0,0)
end
function BURN_IN_HELL()
	attack = true
	chatfunc("BURN....", BrickColor.random().Color)
	for i = 0,5.2,0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-20), Rad(0), Rad(0)), 0.15)
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-20 - 2.5 * Sin(sine / 20)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-4.5), Rad(0), Rad(-20)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1, -0.3 - 0.1 * Cos(sine / 20), -.4 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-6.5), Rad(5 * Cos(sine / 20)), Rad(25)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(135), Rad(0), Rad(-45 - 2.5 * Sin(sine / 20))), 0.1)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(135), Rad(0), Rad(45 + 2.5 * Sin(sine / 20))), 0.1)
	end	
	chatfunc("IN....", BrickColor.random().Color)
	wait(2)
	CreateSound("331666100", char, 10, 1)
	Effects.Sphere.Create(BrickColor.Random(), root.CFrame * CF(0, -1, 0), 2, 2, 2, 10.6, 10.6, 10.6, 0.05)
	Effects.Sphere.Create(BrickColor.Random(), root.CFrame * CF(0, -1, 0), 2, 2, 2, 10.6, 10.6, 10.6, 0.05)
	Effects.Sphere.Create(BrickColor.Random(), root.CFrame * CF(0, -1, 0), 2, 2, 2, 10.6, 10.6, 10.6, 0.05)
	Effects.Sphere.Create(BrickColor.Random(), root.CFrame * CF(0, -1, 0), 2, 2, 2, 10.6, 10.6, 10.6, 0.05)
	Effects.Sphere.Create(BrickColor.Random(), root.CFrame * CF(0, -1, 0), 2, 2, 2, 10.6, 35.6, 10.6, 0.05)
	Effects.Sphere.Create(BrickColor.Random(), root.CFrame * CF(0, -3, 0), 2, 2, 2, 150.6, .4, 150.6, 0.05)
	chatfunc("HELL!!!!!", BrickColor.random().Color)
	for i, v in pairs(FindNearestHead(tors.CFrame.p, 52.5)) do
		if v:FindFirstChild("Head") then
			Eviscerate(v)
			SoulSteal(v)
		end
	end
	coroutine.resume(coroutine.create(function() 
		for i = 0,2.8,0.1 do
			swait()
			hum.CameraOffset = Vector3.new(Mrandom(-3,3),Mrandom(-3,3),Mrandom(-3,3))
		end
		for i = 0,1.8,0.1 do
			swait()
		hum.CameraOffset = Vector3.new(0,0,0)
		end
	end))
	for i = 0,3.7,0.1 do
		SphereAura(2.5, 0.75, "Add", root.CFrame * CFrame.new(math.random(-52.5, 52.5), -5, math.random(-52.5, 52.5)) * CFrame.Angles(math.rad(90 + math.rad(math.random(-45, 45))), math.rad(math.random(-45, 45)), math.rad(math.random(-45, 45))), 2.5, 2.5, 25, -0.025, BrickColor.random(), 0)
		SphereAura(2.5, 0.75, "Add", root.CFrame * CFrame.new(math.random(-52.5, 52.5), -5, math.random(-52.5, 52.5)) * CFrame.Angles(math.rad(90 + math.rad(math.random(-45, 45))), math.rad(math.random(-45, 45)), math.rad(math.random(-45, 45))), 2.5, 2.5, 25, -0.025, BrickColor.random(), 0)
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(20), Rad(0), Rad(0)), 0.15)
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(20 - 2.5 * Sin(sine / 20)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-4.5), Rad(0), Rad(20)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.4 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-6.5), Rad(5 * Cos(sine / 20)), Rad(-25)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(-40), Rad(0), Rad(25 - 2.5 * Sin(sine / 20))), 0.1)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(-40), Rad(0), Rad(-25 + 2.5 * Sin(sine / 20))), 0.1)
	end
	wait(.6)
	CreateSound("907332997", hed, 10, 1)
	attack = false
end
-------------------------------------------------------
--End Attacks N Stuff--
-------------------------------------------------------
mouse.KeyDown:connect(function(key)
	if attack == false then
		if key == 'f' then
		Destruction()
		elseif key == 'r' then
			BURN_IN_HELL()
		elseif key == 't' then
			chatfunc("HM, HM, HAHAHAHAHAHA", BrickColor.random().Color)
			CreateSound("300208779", hed, 10, 1)
		end
	end
end)






-------------------------------------------------------
--Start Animations--
-------------------------------------------------------
local equipped = false
local idle = 0
local change = 1
local val = 0
local toim = 0
local idleanim = 0.4
hum.Animator.Parent = nil
while true do
	swait()
for i, v in pairs(NeonParts) do
     v.BrickColor = BrickColor.Random()
      	end
for i, v in pairs(NeonParts2) do
     v.BrickColor = BrickColor.Random()
      	end
maincolor = BrickColor.Random()
Music.Parent = char
tecks2.TextStrokeColor3 = maincolor.Color
	sine = sine + change
	local torvel = (root.Velocity * Vector3.new(1, 0, 1)).magnitude
	local velderp = root.Velocity.y
	hitfloor, posfloor = rayCast(root.Position, CFrame.new(root.Position, root.Position - Vector3.new(0, 1, 0)).lookVector, 4, char)
	if equipped == true or equipped == false then
		if attack == false then
			idle = idle + 1
		else
			idle = 0
		end
		if 1 < root.Velocity.y and hitfloor == nil then
			Anim = "Jump"
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * angles(math.min(math.max(root.Velocity.Y/100,-Rad(65)),Rad(65)),0,0),0.3)
				tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-10), Rad(0), Rad(0)), 0.3)
				RW.C0 = clerp(RW.C0, CF(1.5, 0.5, 0) * angles(math.min(math.max(root.Velocity.Y/100,-Rad(65)),Rad(65)),0,Rad(15)),0.3)
				LW.C0 = clerp(LW.C0, CF(-1.5, 0.5, 0) * angles(math.min(math.max(root.Velocity.Y/100,-Rad(65)),Rad(65)),0,Rad(-15)),0.3)
				LH.C0=clerp(LH.C0, CF(-1,-.4-0.1 * Cos(sine / 20), -.6) * LHCF * angles(Rad(-5), Rad(-0), Rad(20)), 0.15)
				RH.C0=clerp(RH.C0, CF(1,-1-0.1 * Cos(sine / 20), -.3) * angles(Rad(0), Rad(90), Rad(0)), .3)
			end
		elseif -1 > root.Velocity.y and hitfloor == nil then
			Anim = "Fall"
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * angles(math.min(math.max(root.Velocity.Y/100,-Rad(65)),Rad(65)),0,0),0.3)
				tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(10), Rad(0), Rad(0)), 0.3)
				RW.C0 = clerp(RW.C0, CF(1.5, 0.5, 0) * angles(math.min(math.max(root.Velocity.Y/100,-Rad(65)),Rad(65)),0,Rad(30)),0.3)
				LW.C0 = clerp(LW.C0, CF(-1.5, 0.5, 0) * angles(math.min(math.max(root.Velocity.Y/100,-Rad(65)),Rad(65)),0,Rad(-30)),0.3)
				LH.C0 = clerp(LH.C0, CF(-1,-.4-0.1 * Cos(sine / 20), -.6) * LHCF * angles(Rad(-5), Rad(-0), Rad(20)), 0.15)
				RH.C0 = clerp(RH.C0, CF(1,-1-0.1 * Cos(sine / 20), -.3) * angles(Rad(0), Rad(90), Rad(0)), .3)
			end
		elseif torvel < 1 and hitfloor ~= nil then
			Anim = "Idle"
			change = 1.9
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(30), Rad(0), Rad(0)), 0.15)
				tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(35 - 2.5 * Sin(sine / 20)), Rad(-5 * Cos(sine / 0.465)), Rad(-5 * Cos(sine / 0.465))), 0.3)
				RH.C0 = clerp(RH.C0, CF(1, -1 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-7.5), Rad(0), Rad(30)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1, -1 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-7.5), Rad(0), Rad(-30)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(35 - 5 * Cos(sine / 0.465)), Rad(-5 * Cos(sine / 0.465)), Rad(15 + 7 * Sin(sine / 25))), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(35 - 5 * Cos(sine / 0.465)), Rad(-5 * Cos(sine / 0.465)), Rad(-15 - 7 * Sin(sine / 25))), 0.1)
			end
		elseif tors.Velocity.magnitude < 50 and hitfloor ~= nil then
			Anim = "Walk"
			change = 1
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.175 + 0.025 * Cos(sine / 3.5) + -Sin(sine / 3.5) / 7) * angles(Rad(15 - 2.5 * Cos(sine / 3.5)), Rad(0) - root.RotVelocity.Y / 75, Rad(4 * Cos(sine / 7))), 0.15)
				tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(13 - 2.5 * Sin(sine / 7)), Rad(-5 * Cos(sine / 0.465)), Rad(-5 * Cos(sine / 0.465))), 0.3)
				RH.C0 = clerp(RH.C0, CF(1, -0.925 - 0.5 * Cos(sine / 7) / 2, 0.5 * Cos(sine / 7) / 2) * angles(Rad(-15 - 5 * Cos(sine / 7)) - rl.RotVelocity.Y / 75 + -Sin(sine / 7) / 2.5, Rad(90 - 0.1 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 + 0.1 * Cos(sine / 7)), Rad(0), Rad(15)), 0.3)
         		LH.C0 = clerp(LH.C0, CF(-1, -0.925 + 0.5 * Cos(sine / 7) / 2, -0.5 * Cos(sine / 7) / 2) * angles(Rad(-15 + 5 * Cos(sine / 7)) + ll.RotVelocity.Y / 75 + Sin(sine / 7) / 2.5, Rad(-90 - 0.1 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 - 0.1 * Cos(sine / 7)), Rad(0), Rad(-15)), 0.3)
				RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 7), 0.025 * Cos(sine / 7)) * angles(Rad(65)  * Cos(sine / 7) , Rad(0), Rad(10 + 7 * Sin(sine / 7)) - ra.RotVelocity.Y / 75), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 7), 0.025 * Cos(sine / 7)) * angles(Rad(-65)  * Cos(sine / 7) , Rad(0), Rad(-10 - 7 * Sin(sine / 7)) + la.RotVelocity.Y / 75), 0.1)
			end
		end
	end
	if 0 < #Effects then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if 1 >= Thing[1].Transparency then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame + Vector3.new(0, 0, 0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)) + Vector3.new(0, 0.15, 0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Cylinder" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							local Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, 0.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
end
-------------------------------------------------------
--End Animations And Script--
-------------------------------------------------------
