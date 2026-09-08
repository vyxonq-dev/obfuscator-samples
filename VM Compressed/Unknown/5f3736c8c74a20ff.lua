loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()



if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end


local Vector3_101 = Vector3.new(1, 0, 1)
local netless_Y = Vector3.new(0, 25.1, 0)
local function getNetlessVelocity(realPartVelocity) --edit this if you have a better netless method
    local netlessVelocity = realPartVelocity * Vector3_101
    local mag = netlessVelocity.Magnitude
    if mag > 0.1 then
        netlessVelocity = (100 / mag) * netlessVelocity
    end
    netlessVelocity = netless_Y + netlessVelocity
    return netlessVelocity
end
local simradius = "shp" --simulation radius (net bypass) method
--"shp" - sethiddenproperty
--"ssr" - setsimulationradius
--false - disable
local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
local newanimate = true --disables the animate script and enables after reanimation
local discharscripts = true --disables all localScripts parented to your character before reanimation
local R15toR6 = true --tries to convert your character to r6 if its r15
local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
local hedafterneck = true --disable aligns for head and enable after neck is removed
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
local v3_0 = v3(0, 0, 0)
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
	Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)

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

addtools = addtools and gp(lp, "Backpack", "Backpack")

local fenv = getfenv()
if simradius == "shp" then
	local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
	if shp then
		spawn(function()
			while c and heartbeat:Wait() do
				shp(lp, "SimulationRadius", inf)
			end
		end)
	end
elseif simradius == "ssr" then
	local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.set_simulation_rad or fenv.setsimulationrad
	if ssr then
		spawn(function()
			while c and heartbeat:Wait() do
				ssr(inf)
			end
		end)
	end
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

local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
	for i, v in pairs(hum:GetPlayingAnimationTracks()) do
		v:Stop()
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
local cl = c:Clone()
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
		if destroyhum and v:IsA("Humanoid") then
			v:Destroy()
		else
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
end
local head = gp(model, "Head", "BasePart")
local torso = gp(model, "Torso", "BasePart") or gp(model, "UpperTorso", "BasePart")
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

local modelDes = {}
for i, v in pairs(model:GetDescendants()) do
	if v:IsA("BasePart") then
		i = tostring(i)
		v.Destroying:Connect(function()
			modelDes[i] = nil
		end)
		modelDes[i] = v
	end
end
local modelcolcon = nil
local function modelcolf()
	if model then
		for i, v in pairs(modelDes) do
			v.CanCollide = false
		end
	else
		modelcolcon:Disconnect()
	end
end
modelcolcon = stepped:Connect(modelcolf)
modelcolf()

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

if (typeof(hedafterneck) == "Instance") and head then
	local aligns = {}
	local con = nil
	con = hedafterneck.Changed:Connect(function(prop)
	    if (prop == "Parent") and not hedafterneck.Parent then
	        con:Disconnect()
    		for i, v in pairs(aligns) do
    			v.Enabled = true
    		end
		end
	end)
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
		hum0.Changed:Connect(function(prop)
			if hum1 and (prop == "Jump") then
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


if game.GameId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui")b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ResetOnSpawn=false b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: [UP] Just a baseplate. /  Green baseplate., game creator: the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer) return end


 
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

print("Move list")
print("---------")
print("Shift = Boost")
print("Ctrl = Mach Speed Boost")
print("Q = Left QuickStep, E  = Right QuickStep")
print("C = Slide, in air to stomp")
print("Jump Then Hold B near a wall to wallrun")
print("M to change music, if you're standing still you'll do a special animation!")
print("Space near a wall to walljump, away from a wall homing attack")

wait(0.07)
Player=game:GetService("Players").LocalPlayer
Character=Player.Character
PlayerGui=Player.PlayerGui
Backpack=Player.Backpack
Torso=Character.Torso
Head=Character.Head
Humanoid=Character.Humanoid
LeftArm=Character["Left Arm"]
LeftLeg=Character["Left Leg"]
RightArm=Character["Right Arm"]
RightLeg=Character["Right Leg"]
LS=Torso["Left Shoulder"]
LH=Torso["Left Hip"]
RS=Torso["Right Shoulder"]
RH=Torso["Right Hip"]
Face = Head.face
Neck=Torso.Neck
it=Instance.new
attacktype=1
attacktype2=1
vt=Vector3.new
cf=CFrame.new
cn=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
combo = 0
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=Character.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
attack = false
attackdebounce = false
trispeed=.2
attackmode='none'
local idle=0
local Anim="Idle"
stance = false
local ff = 2
noleg = false
evadecooldown = false
Humanoid.Animator.Parent = nil
equip = false
local Effects = {}
 attackspeed = 0.14 
 df = false
 Swing = 1
local sine = 0
local change = 1
local val = 0
local speed = 0
local rs = game:GetService("RunService").RenderStepped
cam = workspace.CurrentCamera
local FELOADLIBRARY = LoadLibrary("RbxUtility")
local Create = FELOADLIBRARY.Create
deb = game:GetService("Debris")
Face.Transparency = 0
--Face.Texture = "rbxassetid://176217905" --176217905
Humanoid.WalkSpeed = 64
local freefall = 0
local headsunsound = RootPart:FindFirstChild("Running") or Instance.new("Sound",RootPart)
headsunsound.SoundId = "rbxassetid://758199523"
headsunsound.Volume = 2
local boost = false
Humanoid.JumpPower = 88
local musicnum = 1
    
local spd = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).magnitude + 10
local dir = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).unit
 local GravPoint = RootPart.Velocity.y
 local NV = Vector3.new(0,0,0)

		music = Instance.new("Sound",RootPart)
		music.Volume = 1
		music.TimePosition = 0
		music.Pitch = 1
		music.SoundId = "rbxassetid://1251555494"
		music.Looped = true
		music:Play()
		

		boostsound = Instance.new("Sound",RootPart)
		boostsound.Volume = .6
		boostsound.TimePosition = 0
		boostsound.Pitch = 1
		boostsound.SoundId = "rbxassetid://924922553"
		boostsound.Looped = false



		stompsound = Instance.new("Sound",RootPart)
		stompsound.Volume = 2
		stompsound.TimePosition = 0
		stompsound.Pitch = 1
		stompsound.SoundId = "rbxassetid://1295424184"
		stompsound.Looped = false



		so = function(id,par,vol,pit)
		coroutine.resume(coroutine.create(function()
		local sou = Instance.new("Sound",par or workspace)
		sou.Volume=vol
		sou.Pitch=pit or 1
		sou.SoundId=id
		sou:play()
		game:GetService("Debris"):AddItem(sou,8)
		end))
		end
		
		--save shoulders
		RSH, LSH=nil, nil
		--welds
		RW, LW=Instance.new("Weld"), Instance.new("Weld")
		RW.Name="Right Shoulder" LW.Name="Left Shoulder"
		LH=Torso["Left Hip"]
		RH=Torso["Right Hip"]
		TorsoColor=Torso.BrickColor
		function NoOutline(Part)
		Part.TopSurface,Part.BottomSurface,Part.LeftSurface,Part.RightSurface,Part.FrontSurface,Part.BackSurface = 10,10,10,10,10,10
		end
		player=Player
		ch=Character
		RSH=ch.Torso["Right Shoulder"]
		LSH=ch.Torso["Left Shoulder"]
		--
		RSH.Parent=nil
		LSH.Parent=nil
		--
		RW.Name="Right Shoulder"
		RW.Part0=ch.Torso
		RW.C0=cf(1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.3, 0, -0.5)
		RW.C1=cf(0, 0.5, 0)
		RW.Part1=ch["Right Arm"]
		RW.Parent=ch.Torso
		--
		LW.Name="Left Shoulder"
		LW.Part0=ch.Torso
		LW.C0=cf(-1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.7, 0, 0.8)
		LW.C1=cf(0, 0.5, 0)
		LW.Part1=ch["Left Arm"]
		LW.Parent=ch.Torso
		 
		 
		newWeld = function(wp0, wp1, wc0x, wc0y, wc0z)
		    local wld = Instance.new("Weld", wp1)
		    wld.Part0 = wp0
		    wld.Part1 = wp1
		    wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
		end
		 local rs = game:GetService("RunService").RenderStepped
		 
		newWeld(RootPart, Torso, 0, -1, 0)
		Torso.Weld.C1 = CFrame.new(0, -1, 0)
		newWeld(Torso, LeftLeg, -0.5, -1, 0)
		LeftLeg.Weld.C1 = CFrame.new(0, 1, 0)
		newWeld(Torso, RightLeg, 0.5, -1, 0)
		RightLeg.Weld.C1 = CFrame.new(0, 1, 0)
		
		    Player=game:GetService('Players').LocalPlayer
		    Character=Player.Character
		    mouse=Player:GetMouse()
		    m=Instance.new('Model',Character)
		 
		 
		    local function weldBetween(a, b)
		        local weldd = Instance.new("ManualWeld")
		        weldd.Part0 = a
		        weldd.Part1 = b
		        weldd.C0 = CFrame.new()
		        weldd.C1 = b.CFrame:inverse() * a.CFrame
		        weldd.Parent = a
		        return weldd
		    end
		   
		    ArtificialHB = Instance.new("BindableEvent", script)
		ArtificialHB.Name = "Heartbeat"
		 
		script:WaitForChild("Heartbeat")
		 
		frame = 1 / 80
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
		 
--[[]
		function swait(num)
		    if num == 0 or num == nil then
		        ArtificialHB.Event:wait()
		    else
		        for i = 0, num do
		            ArtificialHB.Event:wait()
		        end
		    end
	end

	]]
	



	function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait()
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait()
		end
	end
end

		function RemoveOutlines(part)
		    part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
		end
		   
		
		part = function(formfactor, parent, reflectance, transparency, brickcolor, name, size)
		  local fp = it("Part")
		  fp.formFactor = formfactor
		  fp.Parent = parent
		  fp.Reflectance = reflectance
		  fp.Transparency = transparency
		  fp.CanCollide = false
		  fp.Locked = true
		  fp.BrickColor = brickcolor
		  fp.Name = name
		  fp.Size = size
		  fp.Position = Torso.Position
		  NoOutline(fp)
		  if fp.BrickColor == BrickColor.new("Dark indigo") then
		    fp.Material = "Neon"
		  else
		    if fp.BrickColor == BrickColor.new("Really black") then
		      fp.BrickColor = BrickColor.new("Really black")
		      fp.Material = "Metal"
		    else
		      fp.Material = "Neon"
		    end
		  end
		  fp:BreakJoints()
		  return fp
		end
		
		mesh = function(Mesh, part, meshtype, meshid, offset, scale)
		  local mesh = it(Mesh)
		  mesh.Parent = part
		  if Mesh == "SpecialMesh" then
		    mesh.MeshType = meshtype
		    mesh.MeshId = meshid
		  end
		  mesh.Offset = offset
		  mesh.Scale = scale
		  return mesh
		end
		
		weld = function(parent, part0, part1, c0)
		  local weld = it("Weld")
		  weld.Parent = parent
		  weld.Part0 = part0
		  weld.Part1 = part1
		  weld.C0 = c0
		  return weld
		end
		
		F1 = Instance.new("Folder", Character)
		F1.Name = "Effects Folder"
		F2 = Instance.new("Folder", F1)
		F2.Name = "Effects"
		Triangle = function(a, b, c)
		end
		
		MagicBlock = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
		  local prt = part(3, F2, 0, 0, brickcolor, "Effect", vt())
		  prt.Anchored = true
		  prt.CanCollide = false
		  prt.CFrame = cframe
		  prt.Name = "prt"
		  msh = mesh("BlockMesh", prt, "", "", vt(0, 0, 0), vt(x1, y1, z1))
		  game:GetService("Debris"):AddItem(prt, 5)
		  table.insert(Effects, {prt, "Block1", delay, x3, y3, z3})
		end
		
		
		
		MagicCircle = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
		  local prt = part(3, F2, 0, 0, brickcolor, "Effect", vt())
		  prt.Anchored = true
		  prt.CanCollide = false
		  prt.CFrame = cframe
		  prt.Name = "prt"
		  local msh = mesh("SpecialMesh", prt, "Sphere", "", vt(0, 0, 0), vt(x1, y1, z1))
		  game:GetService("Debris"):AddItem(prt, 5)
		  table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3})
		end
		
		MagicWave = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
		  local prt = part(3, F2, 0, 0, brickcolor, "Effect", vt())
		  prt.Anchored = true
		  prt.CFrame = cframe
		  local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=20329976", vt(0, 0, 0), vt(x1, y1, z1))
		  game:GetService("Debris"):AddItem(prt, 5)
		  table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3})
		end
		
		MagicCylinder = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
		  local prt = part(3, F2, 0, 0, brickcolor, "Effect", vt(0.2, 0.2, 0.2))
		  prt.Anchored = true
		  prt.CFrame = cframe
		  msh = mesh("SpecialMesh", prt, "Head", "", vt(0, 0, 0), vt(x1, y1, z1))
		  game:GetService("Debris"):AddItem(prt, 5)
		  Effects[#Effects + 1] = {prt, "Cylinder", delay, x3, y3, z3}
		end
		
		MagicCylinder2 = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
		  local prt = part(3, F2, 0, 0, brickcolor, "Effect", vt(0.2, 0.2, 0.2))
		  prt.Anchored = true
		  prt.CFrame = cframe
		  msh = mesh("CylinderMesh", prt, "", "", vt(0, 0, 0), vt(x1, y1, z1))
		  game:GetService("Debris"):AddItem(prt, 5)
		  Effects[#Effects + 1] = {prt, "Cylinder", delay, x3, y3, z3}
		end
		
		MagicBlood = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
		  local prt = part(3, F2, 0, 0, brickcolor, "Effect", vt())
		  prt.Anchored = true
		  prt.CFrame = cframe
		  local msh = mesh("SpecialMesh", prt, "Sphere", "", vt(0, 0, 0), vt(x1, y1, z1))
		  game:GetService("Debris"):AddItem(prt, 5)
		  table.insert(Effects, {prt, "Blood", delay, x3, y3, z3})
		end
		
		ElecEffect = function(cff, x, y, z)
		  local prt = part(3, F2, 0, 0, BrickColor.new("Dark indigo"), "Part", vt(1, 1, 1))
		  prt.Anchored = true
		  prt.CFrame = cff * cf(math.random(-x, x), math.random(-y, y), math.random(-z, z))
		  prt.CFrame = cf(prt.Position)
		  game:GetService("Debris"):AddItem(prt, 2)
		  xval = math.random() / 2
		  yval = math.random() / 2
		  zval = math.random() / 2
		  msh = mesh("BlockMesh", prt, "", "", vt(0, 0, 0), vt(xval, yval, zval))
		  Effects[#Effects + 1] = {prt, "Elec", 0.1, x, y, z, xval, yval, zval}
		end
		
		function FindNearestTorso(Position, Distance, SinglePlayer)
			if SinglePlayer then
				return (SinglePlayer.Torso.CFrame.p - Position).magnitude < Distance
			end
			local List = {}
			for i, v in pairs(workspace:GetChildren()) do
				if v:IsA("Model") then
					if v:findFirstChild("Torso") then
						if v ~= Character then
							if (v.Torso.Position - Position).magnitude <= Distance then
								table.insert(List, v)
							end 
						end 
					end 
				end 
			end
			return List
		end
		
		
		function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part"){
		Parent = Parent,
		Reflectance = Reflectance,
		Transparency = Transparency,
		CanCollide = false,
		Locked = true,
		BrickColor = BrickColor.new(tostring(BColor)),
		Name = Name,
		Size = Size,
		Material = Material,
	}
	RemoveOutlines(Part)
	return Part
end
	
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	local Msh = Create(Mesh){
		Parent = Part,
		Offset = OffSet,
		Scale = Scale,
	}
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
		
		
		
function BlockEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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
	end
end

function SphereEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function RingEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay,material)
local prt=CreatePart(workspace,material,0,0,brickcolor,"Effect",vt(.5,.5,.5))--part(3,workspace,"SmoothPlastic",0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
msh=CreateMesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=3270017",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh,num) 
for i=0,1,delay do
swait()
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh,(math.random(0,1)+math.random())/5)
end

function CylinderEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function WaveEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "rbxassetid://20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function SpecialEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "rbxassetid://24388358", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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


function MoonEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "rbxassetid://259403370", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function HeadEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "Head", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function BreakEffect(brickcolor, cframe, x1, y1, z1)
	local prt = CreatePart(workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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
		
		local lerp = function(a, b, t)
	return a * (1 - t) + b * t
end
		
		function clerp(a,b,t)
		local qa = {QuaternionFromCFrame(a)}
		local qb = {QuaternionFromCFrame(b)}
		local ax, ay, az = a.x, a.y, a.z
		local bx, by, bz = b.x, b.y, b.z
		local _t = 1-t
		return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t))
		end
		 
		function QuaternionFromCFrame(cf)
		local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
		local trace = m00 + m11 + m22
		if trace > 0 then
		local s = math.sqrt(1 + trace)
		local recip = 0.5/s
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5
		else
		local i = 0
		if m11 > m00 then
		i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
		i = 2
		end
		if i == 0 then
		local s = math.sqrt(m00-m11-m22+1)
		local recip = 0.5/s
		return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip
		elseif i == 1 then
		local s = math.sqrt(m11-m22-m00+1)
		local recip = 0.5/s
		return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip
		elseif i == 2 then
		local s = math.sqrt(m22-m00-m11+1)
		local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip
		end
		end
		end
		

		function QuaternionToCFrame(px, py, pz, x, y, z, w)
		local xs, ys, zs = x + x, y + y, z + z
		local wx, wy, wz = w*xs, w*ys, w*zs
		local xx = x*xs
		local xy = x*ys
		local xz = x*zs
		local yy = y*ys
		local yz = y*zs
		local zz = z*zs
		return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy))
		end
		function QuaternionSlerp(a, b, t)
		local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4]
		local startInterp, finishInterp;
		if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
		local theta = math.acos(cosTheta)
		local invSinTheta = 1/math.sin(theta)
		startInterp = math.sin((1-t)*theta)*invSinTheta
		finishInterp = math.sin(t*theta)*invSinTheta  
		else
		startInterp = 1-t
		finishInterp = t
		end
		else
		if (1+cosTheta) > 0.0001 then
		local theta = math.acos(-cosTheta)
		local invSinTheta = 1/math.sin(theta)
		startInterp = math.sin((t-1)*theta)*invSinTheta
		finishInterp = math.sin(t*theta)*invSinTheta
		else
		startInterp = t-1
		finishInterp = t
		end
		end
		return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp
		end
		 
		function weld5(part0, part1, c0, c1)
		    weeld=Instance.new("Weld", part0)
		    weeld.Part0=part0
		    weeld.Part1=part1
		    weeld.C0=c0
		    weeld.C1=c1
		    return weeld
		end
		 
		--Example: Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		 
		function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
		return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
	end
	
	
	



 
 local f = 0
 local b = Instance.new("BlurEffect",cam)
local    c = Instance.new('PointLight', Torso)
c.Range = 16
c.Color = Color3.new(0, 1,1)
c.Brightness = 1.5
 game:GetService("RunService"):BindToRenderStep("W0tT", 0, function()

b.Size = b.Size - 4
if boost == true then
c.Enabled = true
    cam.FieldOfView = lerp(cam.FieldOfView, 110, 0.5)
   -- cam.FieldOfView = 110
    freefall = 0
    Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,3),0.25)
 SphereEffect(BrickColor.new("Cyan"),RightLeg.CFrame*CFrame.new(0,-1,0)*angles(math.random(-180,180),math.random(-180,180),math.random(-180,180)),1.4,12,1.4,2.8,26,2.8,0.07)
  SphereEffect(BrickColor.new("Cyan"),LeftLeg.CFrame*CFrame.new(0,-1,0)*angles(math.random(-180,180),math.random(-180,180),math.random(-180,180)),1.4,12,1.4,2.8,26,2.8,0.07)
  if hitfloor ~= nil and Anim ~= "runIdle" then
  SpecialEffect(BrickColor.new("Cyan"),RootPart.CFrame*CFrame.new(0,-3.4,.78) ,2,2,2, 1.5,1.5,1.5,.09)
  end
end
if boost == false then
    cam.FieldOfView = lerp(cam.FieldOfView, 70, 0.076)
    --cam.FieldOfView = 70
    c.Enabled = false
end
end)



						 mouse.KeyDown:connect(function(key)
    if string.byte(key) == 48 then
        b.Size = 40
		Swing = 2
		freefall = 0
		
coroutine.resume(coroutine.create(function()
    for i = 0,1,0.1 do
        swait()
        Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(math.random(-0.35*1.8,0.35*1.8),math.random(-0.35*1.8,0.35*1.8),math.random(-0.35*1.8,0.35*1.8)),0.24)
end
end))
        Humanoid.WalkSpeed = 180
        RootPart.Velocity = RootPart.CFrame.lookVector*150
        RingEffect(BrickColor.new("Cyan"), RootPart.CFrame*CFrame.new(0,0,-9.2) , 1, 1, 1, 8, 8, 8, 0.14,"Neon") 
        boost = true
        boostsound:Play()
end
end)

mouse.KeyUp:connect(function(key)
    if string.byte(key) == 48 then
		Swing = 1
        Humanoid.WalkSpeed = 64
        boost = false
        boostsound:Stop()

end
end)




						 mouse.KeyDown:connect(function(key)
    if string.byte(key) == 50 then
        b.Size = 40
        freefall = 0
		Swing = 2
		
coroutine.resume(coroutine.create(function()
    for i = 0,1,0.1 do
        swait()
        Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(math.random(-0.35*2.8,0.35*2.8),math.random(-0.35*2.8,0.35*2.8),math.random(-0.35*2.8,0.35*2.8)),0.48)
end
end))
		
        Humanoid.WalkSpeed = 320
        RootPart.Velocity = RootPart.CFrame.lookVector*550
        RingEffect(BrickColor.new("Cyan"), RootPart.CFrame*CFrame.new(0,0,-9.2) , 1, 1, 1, 18, 18, 18, 0.14,"Neon") 
        RingEffect(BrickColor.new("White"), RootPart.CFrame*CFrame.new(0,0,-11.2) , 1, 1, 1, 18, 18, 18, 0.14,"Neon") 
        RingEffect(BrickColor.new("Cyan"), RootPart.CFrame*CFrame.new(0,0,-13.2) , 1, 1, 1, 18, 18, 18, 0.14,"Neon") 
        boost = true
        boostsound:Play()
end
end)

mouse.KeyUp:connect(function(key)
    if string.byte(key) == 50 then
		Swing = 1
        Humanoid.WalkSpeed = 64
        boost = false
        boostsound:Stop()

end
end)


local lastwall = nil
local jumped = false



		 
		 
		 
		 local vwall = false
		 
		 		 mouse.KeyDown:connect(function(key)
		     if key == 'b' and hitfloor == nil and attack == false then
	vrun()
end
 end)
 
 
 function vrun()
     		 	local ray = Ray.new(
		RootPart.CFrame.p, RootPart.CFrame.lookVector *2.5
	)
	local hit, position, normal = workspace:FindPartOnRay(ray, character)
	
	if hit then
	    if hit.Parent.Parent ~= Character and hit.Parent ~= Character and hit.Name ~= "prt" and hit.CanCollide == true then
	    vwall = true
	        local NV = Vector3.new(0,0,0)
	             local spd = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).magnitude + 10
local dir = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).unit
 local GravPoint = RootPart.Velocity.y
		local velo = Instance.new("BodyVelocity",Torso)
		velo.MaxForce = Vector3.new(400000,400000,400000)

		attack = true
while vwall == true and ray and hit do
swait()
change = 0.84+ Humanoid.WalkSpeed/132
if Humanoid.WalkSpeed > 40 and Humanoid.WalkSpeed < 70 then
velo.Velocity =  Vector3.new(0,40,0)
end
if Humanoid.WalkSpeed > 70 and Humanoid.WalkSpeed < 200 then
		velo.Velocity =  Vector3.new(0,80,0)
		end
		if Humanoid.WalkSpeed > 200 then
		velo.Velocity =  Vector3.new(0,130,0)
		end
		 ray = Ray.new(
		RootPart.CFrame.p, RootPart.CFrame.lookVector *2.5
	)
	hit, position, normal = workspace:FindPartOnRay(ray, character)
		Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1-0.52*math.cos(sine/2), .6) * angles(math.rad(96), math.rad(0), math.rad(0)+ RootPart.RotVelocity.Y / 26), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-11+20*math.sin(sine/2)),math.rad(0),math.rad(0+5*math.sin(sine/4)) + RootPart.RotVelocity.Y / 13),.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.1) * angles(math.rad(-90-7*math.sin(sine/4))+ RootPart.RotVelocity.Y / -34, math.rad(0), math.rad(15+2*math.sin(sine/4))- RootPart.RotVelocity.Y / 34),.15)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0.1)*angles(math.rad(-90-7*math.sin(sine/4))+ RootPart.RotVelocity.Y / 34,math.rad(0),math.rad(-15+2*math.sin(sine/4))+ RootPart.RotVelocity.Y / -34),.15)
		LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.28*math.cos(sine/4), 0-0.32*math.cos(sine/4)) * CFrame.Angles(math.rad(0+104*math.sin(sine/4)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)+ RootPart.RotVelocity.Y / -54), 0.3+ Humanoid.WalkSpeed/272)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1-0.28*math.cos(sine/4),0+0.32*math.cos(sine/4)) * CFrame.Angles(math.rad(0-104*math.sin(sine/4)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)- RootPart.RotVelocity.Y / 54), 0.3+ Humanoid.WalkSpeed/272)
end
		velo:Destroy()
		wait(0.07)

if vwall == false then

 RootPart.Velocity = -RootPart.CFrame.lookVector*68 + Vector3.new(0,86,0)

--[[]
		for i = 0,5,0.2 do
rs:wait()
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -0.79, 0) * CFrame.Angles(math.rad(0+100*i), math.rad(0), math.rad(0)), 0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(20),math.rad(0),math.rad(0)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(180), math.rad(-60), math.rad(40)),.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(180), math.rad(60), math.rad(-40)),.2)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
end
]]


for i = 0,4,0.1 do
swait()
Humanoid.CameraOffset = Vector3.new(0,0,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0+260*i), math.rad(0), math.rad(0)), 0.6)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(70),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(90)), 0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
end

 		attack = false


end


		if vwall == true then
 RootPart.Velocity = RootPart.CFrame.lookVector*38 + Vector3.new(0,86,0)

--[[]
		for i = 0,5,0.2 do
rs:wait()
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -0.79, 0) * CFrame.Angles(math.rad(0+100*i), math.rad(0), math.rad(0)), 0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(20),math.rad(0),math.rad(0)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(180), math.rad(-60), math.rad(40)),.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(180), math.rad(60), math.rad(-40)),.2)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
end
]]


for i = 0,4,0.15 do
swait()
Humanoid.CameraOffset = Vector3.new(0,0,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0-260*i), math.rad(0), math.rad(0)), 0.6)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(70),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(90)), 0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
end

 		attack = false

end


end
end
end
 
 

 
 	 mouse.KeyUp:connect(function(key)
		     if key == 'b' and vwall == true then
	         vwall = false
	         end
	         end)
		 


		 
		 
function Ldash()
    
    

evadecooldown = true
attack = true
k = math.random(1,2) 
if k == 1 then
so("http://www.roblox.com/asset/?id=807766310", Head, 2.5, 1)
else
 so("http://www.roblox.com/asset/?id=807768137", Head, 2.5, 1)
 end
 
 
 


 --+173.8*i
for i = 0,.7,0.1 do
swait()
Head.Velocity = Head.CFrame.rightVector * -135
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(32)), 0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(0),math.rad(-9),math.rad(-14)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -0.2) * angles(math.rad(27), math.rad(0), math.rad(30)),.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(30), math.rad(0), math.rad(30)),.2)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(12)), 0.2)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(8)), 0.2)
end

attack = false
wait(0.08)
evadecooldown = false
 
 
end





function Rdash()
    
    

evadecooldown = true
attack = true
k = math.random(1,2) 
if k == 1 then
so("http://www.roblox.com/asset/?id=807766310", Head, 2.5, 1)
else
 so("http://www.roblox.com/asset/?id=807768137", Head, 2.5, 1)
 end
 
 
 
 

 --+173.8*i
for i = 0,.7,0.1 do
swait()
Head.Velocity = Head.CFrame.rightVector * 135
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-32)), 0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(0),math.rad(9),math.rad(14)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(30), math.rad(0), math.rad(-30)),.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -0.2) * angles(math.rad(27), math.rad(0), math.rad(-30)),.2)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-8)), 0.2)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-12)), 0.2)
end

attack = false
wait(0.08)
evadecooldown = false
 
 
end
local sliding = false


function Slide()
    
     local spd = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).magnitude + 10
     spd = spd + 30
local dir = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).unit
 local GravPoint = RootPart.Velocity.y
 if spd > 40 and hitfloor ~= nil then
noleg = true

attack = true
k = math.random(1,2) 
if k == 1 then
so("http://www.roblox.com/asset/?id=807766310", Head, 2.5, 1)
else
 so("http://www.roblox.com/asset/?id=807768137", Head, 2.5, 1)
 end
 
 
 

 
 
 

 
 
 local NV = Vector3.new(0,0,0)
local bv = Instance.new("BodyVelocity", Torso)
bv.maxForce = Vector3.new(1/0,1/0,1/0)
bv.velocity = dir*spd
	        local bg = Instance.new("BodyGyro", Torso)
bg.maxTorque = Vector3.new(1/0,1/0,1/0)
bg.cframe = CFrame.new(NV, dir) * CFrame.Angles(math.pi/2.2,0.24,0)
headsunsound.SoundId = "rbxassetid://1295468446"
headsunsound.TimePosition = 0

Humanoid.PlatformStand = true
while spd > 2 and hitfloor ~= nil and sliding == true do
swait()
spd = spd - 0.95
bv.velocity = dir*spd + Vector3.new(0,0,0)
bg.cframe = CFrame.new(NV, dir) * CFrame.Angles(math.pi/2.2,0.24,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -2.3, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(12)), 0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(34),math.rad(0),math.rad(12)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(110), math.rad(0), math.rad(70)),.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -0.2) * angles(math.rad(0), math.rad(0), math.rad(-60)),.2)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -0.56, -0.2) * CFrame.Angles(math.rad(-24), math.rad(0), math.rad(0)), 0.2)
end
bv:Destroy()
bg:Destroy()
headsunsound.SoundId = "rbxassetid://758199523"
headsunsound.TimePosition = 0
Humanoid.PlatformStand = false
attack = false
sliding = false
wait(0.05)
evadecooldown = false
 
 
end
end

function land()
    attack = true
   RootPart.Velocity = Vector3.new(0,0,0)
    WaveEffect(BrickColor.new("Cyan"), RootPart.CFrame*CFrame.new(0,-1,0) , 1, 1, 1, 3, 0.8, 3, 0.06) 
     so("http://www.roblox.com/asset/?id=1295424585", Torso, 3.5, 1)

coroutine.resume(coroutine.create(function()
    for i = 0,1,0.1 do
        swait()
        Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(math.random(-0.55*2.8,0.55*2.8),math.random(-0.55*2.8,0.55*2.8),math.random(-0.55*2.8,0.55*2.8)),0.44)
        Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(-16), math.rad(0), math.rad(0)), 0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(7),math.rad(0),math.rad(0)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(87)),.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -0) * angles(math.rad(0), math.rad(0), math.rad(-87)),.5)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, 0, -0.5) * CFrame.Angles(math.rad(16), math.rad(0), math.rad(0)), 0.5)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1.14, 0.2) * CFrame.Angles(math.rad(-17), math.rad(0), math.rad(0)), 0.5)
       
end
attack = false


end))



end




function stomp()
    attack = true
    stompsound:Play()
    
   while hitfloor == nil do 
       swait()
       b.Size = 12
        WaveEffect(BrickColor.new("Cyan"), LeftLeg.CFrame*CFrame.new(0,-2.4,0) , 1, 1, 1, 0.8, 0.8, 0.8, 0.14) 
       RootPart.Velocity = Vector3.new(0,RootPart.Velocity.y/1.6,0) +Vector3.new(0,-150,0)
			       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.15)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0.2) * CFrame.Angles(math.rad(0+4*math.sin(sine/1.3)), math.rad(0), math.rad(0)),0.07)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.65, 0) * angles(math.rad(0), math.rad(0), math.rad(140+12*math.cos(sine/1.3))), 0.07)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.65, 0) * angles(math.rad(0), math.rad(0), math.rad(-140+12*math.cos(sine/1.3))), 0.07)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(60+7*math.sin(sine/1.3)),math.rad(0),math.rad(0)),0.07)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.17*math.cos(sine/1.3), -0.13) * CFrame.Angles(math.rad(0+4*math.cos(sine/1.3)), math.rad(3), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, .27+0.17*math.cos(sine/1.3), -0.56) * CFrame.Angles(math.rad(-12+4*math.cos(sine/1.3)), math.rad(0), math.rad(0)), 0.1)

end
 stompsound:Stop()
land()


end


function changemusic()
    musicnum = musicnum + 1
    music.TimePosition = 0
    local osix = false
    local spd = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).magnitude
    if musicnum > 14 then
        musicnum = 1
    end
    if musicnum == 1 then
        music.SoundId = "rbxassetid://179029173"
    end
    if musicnum == 2 then
        music.SoundId = "rbxassetid://146443855"
        end
        if musicnum == 3 then
           music.SoundId = "rbxassetid://1342408291" 
          end
          if musicnum == 4 then
            music.SoundId = "rbxassetid://201219416"  
        end
        if musicnum == 5 then
music.SoundId = "rbxassetid://1390472571" 
end
        if musicnum == 6 then
            osix = true
music.SoundId = "rbxassetid://249974783" 
end
if musicnum == 7 then
    music.SoundId = "rbxassetid://1851880603"
end
if musicnum == 8 then
 music.SoundId = "rbxassetid://412034984"
end
if musicnum == 9 then
   music.SoundId = "rbxassetid://536915629"
end
if musicnum == 10 then
music.SoundId = "rbxassetid://1200005861"
end
if musicnum == 11 then
    music.SoundId = "rbxassetid://1055930631"
end
if musicnum == 12 then
    music.SoundId = "rbxassetid://300269553"
end
if musicnum == 13 then
    music.SoundId = "rbxassetid://199897052"
end
if musicnum == 14 then
  music.SoundId = "rbxassetid://638115895"  
end

if spd < 14 then
Humanoid.Jump = true

if osix == false then
so("rbxassetid://537371462",RootPart,2,1)
end


RootPart.Velocity = Vector3.new(0,102,0)
attack = true
wait(0.08)
for i = 0,7,0.1 do
    swait()
    RootPart.Velocity = Vector3.new(0,2,0)
Humanoid.CameraOffset = Vector3.new(0,0,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0-260*i), math.rad(0), math.rad(0)), 0.6)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(70),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(90)), 0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)

end
b.Size = 40
MoonEffect(BrickColor.new("Cyan"), RootPart.CFrame*CFrame.new(0,0,0) , 1, 1, 1, 8, 8, 8, 0.06) 

if osix == true then
osix = false
so("rbxassetid://156821036",RootPart,2,1)
end

Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
for i = 0,5,0.1 do
    swait()
RootPart.Velocity = Vector3.new(0,3.5,0)
Humanoid.CameraOffset = Vector3.new(0,0,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1+0.1*i, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.21)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(22-2*i),math.rad(0),math.rad(0)),.21)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5+0.09*i, 0) * angles(math.rad(20-6*i), math.rad(0), math.rad(90+13*i)), 0.21)
LW.C0 = clerp(LW.C0, CFrame.new(-1.0-0.12*i, 0.5, -0.4+0.05*i) * angles(math.rad(20+13*i), math.rad(0), math.rad(20-13*i)), 0.21)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(45+6*i), math.rad(0), math.rad(-22-4*i)), 0.21)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(45+6*i), math.rad(0), math.rad(22+4*i)), 0.21)
end
attack = false
end
end


  mouse.KeyDown:connect(function(key)
if key == 'q' and attack == false and evadecooldown == false then
Ldash()
end
end)
 
 
 
   mouse.KeyDown:connect(function(key)
if key == 'e' and attack == false and evadecooldown == false then
Rdash()
end
end)

   mouse.KeyDown:connect(function(key)
if key == 'c' and attack == false and evadecooldown == false and hitfloor ~= nil then
     sliding = true
Slide()
end
end)

   mouse.KeyDown:connect(function(key)
if key == 'c' and attack == false and hitfloor == nil then
     stomp()
end
end)


local walljump = false


function walljumpp()
    	local ray = Ray.new(
		Torso.CFrame.p, RootPart.CFrame.lookVector *5
	)
	local hit, position, normal = workspace:FindPartOnRay(ray, character)
	
	if hit then
	    if  hit.Parent.Parent ~= Character and hit.Parent ~= Character then
	    local dir = Vector3.new(RootPart.Velocity.x,0,RootPart.Velocity.z).unit
	    GravPoint = 0
 	    freefall = 0
	    walljump = true 
	    Humanoid.AutoRotate = false
		local velo = Instance.new("BodyVelocity",Torso)
		velo.MaxForce = Vector3.new(400000,400000,400000)
		--game.Debris:AddItem(velo,0.1)
		attack = true
while hitfloor == nil and walljump == true and ray and hit  do
swait()
freefall = 0
GravPoint = GravPoint - 0.36
		 ray = Ray.new(
		RootPart.CFrame.p, RootPart.CFrame.lookVector *2.5
	)
	hit, position, normal = workspace:FindPartOnRay(ray, character)
velo.Velocity = vt(0,GravPoint,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0.9) * CFrame.Angles(math.rad(5), math.rad(90), math.rad(8)), 0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(7),math.rad(0),math.rad(86)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(120)),.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(-60)),.2)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-6), math.rad(14), math.rad(-12)), 0.2)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(23)), 0.2)
end
if walljump == false then
    k = math.random(1,3) 
if k == 1 then
so("http://www.roblox.com/asset/?id=800121776", Head, 2.5, 1)
else if k == 2 then
 so("http://www.roblox.com/asset/?id=804889329", Head, 2.5, 1)
else if k == 3 then
     so("http://www.roblox.com/asset/?id=804907617", Head, 2.5, 1)
     end
     end
end
 
    velo:Destroy()
        attack = false
    coroutine.resume(coroutine.create(function()
    for i = 0,1,0.1 do
        swait()
Humanoid.CameraOffset = Vector3.new(0,0,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0+260*i), math.rad(0), math.rad(0)), 0.6)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(70),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(90)), 0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
end
end))
    
    Humanoid.AutoRotate = true
    RootPart.Velocity = RootPart.CFrame.lookVector * -137 + Vector3.new(0,136,0)
    wait(0.07)
     RootPart.CFrame = CFrame.new(RootPart.CFrame.p,-RootPart.CFrame.lookVector)
end
if walljump == true then
 		attack = false
walljump = false
Humanoid.AutoRotate = true
velo:Destroy()
end
end
end
end

    
    local homed = nil
    function home()
        if walljump ~= true then
        		    	for i, v in pairs(FindNearestTorso(Torso.CFrame.p, 80)) do
				if v:FindFirstChild('Head') then
					Grabbed = true
					homed = v
				end
			end
    
    if homed ~= nil and homed:FindFirstChildOfClass("Humanoid").Health > 1 and walljump == false then
        					    so("http://www.roblox.com/asset/?id=162460823", Head, 1, .8)
        					    	   local SBall = Instance.new("Part",Character)
	SBall.Name = "Homing Ball"
	SBall.CanCollide = false
	SBall.Anchored = false
	SBall.Transparency = 0.64
	SBall.CFrame = CFrame.new(RootPart.CFrame.p)
	SBall.BrickColor = BrickColor.new("Toothpaste")
	SBall.Size = Vector3.new(1,1,1)
	SBall.Material = "Neon"
	SBallweld = Instance.new("Weld")
SBallweld.Parent = SBall
SBallweld.Part0 = RootPart
SBallweld.Part1 = SBall
SBallweld.C1 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
        SBallweld.Part0 = RootPart
	local SBallmesh = Instance.new("SpecialMesh",SBall)
	SBallmesh.MeshType = "Sphere"
	SBallmesh.Scale = Vector3.new(6,6,6)
        	trail = Instance.new("Trail", Character)
a2 = Instance.new("Attachment", Torso) a2.Position = Vector3.new(0,2,0)
a3 = Instance.new("Attachment", Torso)a3.Position = Vector3.new(0,-2.5,0)
trail.Texture = "rbxassetid://0"
trail.Attachment0 = a2
trail.Attachment1 = a3
trail.Lifetime  =  0.353
trail.MinLength = 0.03
trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,1)})
trail.Color = ColorSequence.new(Color3.new(0,1,1), Color3.new(0, 0,0))
trail.LightEmission = 4.8
trail.TextureLength = 0.034
        trail.Enabled = true
 attack = true
	local position = Instance.new("BodyPosition",Torso)
	position.P = 68350
	position.maxForce = Vector3.new(math.huge,math.huge,math.huge)
	
        while homed ~= nil and (homed.Torso.Position-RootPart.Position).magnitude > 8 do
        swait()
        SBall.CFrame = CFrame.new(RootPart.CFrame.p)
    Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0+420*math.abs(sine/3.2)), math.rad(0), math.rad(0)), 0.6)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(70),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-.7, -0.22, -0.5) * angles(math.rad(90), math.rad(0), math.rad(90)), 0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -.34, -0.7) * CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)), 0.1)
    position.Position = homed.Torso.Position + Vector3.new(0,2,0) 
end
		local bodvol=Instance.new("BodyVelocity")
bodvol.velocity= RootPart.CFrame.lookVector*240 + Vector3.new(0,30,0)
bodvol.P= 35200
bodvol.maxForce=Vector3.new(8e+003, 8e+003, 8e+003)
bodvol.Parent=homed.Head
game:GetService("Debris"):AddItem(bodvol, 0.2)
--homed:FindFirstChildOfClass("Humanoid"):TakeDamage(math.random(10,30))

position:Destroy()
trail.Enabled = false
SBall:Destroy()
RootPart.Velocity = Vector3.new(0,93.5,0)
    coroutine.resume(coroutine.create(function()
for i = 0,5,0.26 do
    swait()
Humanoid.CameraOffset = Vector3.new(0,0,0)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1+0.1*i, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.21)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(22-2*i),math.rad(0),math.rad(0)),.21)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5+0.09*i, 0) * angles(math.rad(20-6*i), math.rad(0), math.rad(90+13*i)), 0.21)
LW.C0 = clerp(LW.C0, CFrame.new(-1.0-0.12*i, 0.5, -0.4+0.05*i) * angles(math.rad(20+13*i), math.rad(0), math.rad(20-13*i)), 0.21)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(45+6*i), math.rad(0), math.rad(-22-4*i)), 0.21)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(45+6*i), math.rad(0), math.rad(22+4*i)), 0.21)
end
homed = nil
attack = false
end))

end
    
end


end

mouse.KeyDown:connect(function(key)
		 		     wait(0.16)
		     if string.byte(key) == 32 and hitfloor == nil and attack == false and walljump == false and Humanoid.Jump == true then
		 walljumpp()
	 end
	 		     if string.byte(key) == 32 and hitfloor == nil and attack == false and walljump == false and Humanoid.Jump == true then
		 home()
	 end
	 
if string.byte(key) == 32 and hitfloor == nil and attack == true and walljump == true then
walljump = false
end
	 end)
		 


mouse.KeyDown:connect(function(key)
if key == 'm' and attack == false then
changemusic()
end
end)

local MutedMusic = false
mouse.KeyDown:connect(function(key)
if key == 'n' then
if not MutedMusic then
MutedMusic = true
music.Volume = 0
elseif MutedMusic then
MutedMusic = false
music.Volume = 1
end
end
end)




   mouse.KeyUp:connect(function(key)
       wait(0.05)
if key == 'c' and sliding == true then
     sliding = false
end
end)
local look = 0



				while true do
    swait()
sine = sine + change
--speed = speed + music.PlaybackLoudness/90
local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude
local velderp=RootPart.Velocity.y
hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
	
    local TiltVelocity = CFrame.new(RootPart.CFrame:vectorToObjectSpace(RootPart.Velocity))

local rlegray = Ray.new(RightLeg.Position+Vector3.new(0,0.54,0),Vector3.new(0, -1.75, 0))
local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, Character)

local llegray = Ray.new(LeftLeg.Position+Vector3.new(0,0.54,0),Vector3.new(0, -1.75, 0))
local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, Character)

    	local waterthing = Ray.new(RootPart.CFrame.p,Vector3.new(0,-1,0))
	local start, position = workspace:FindPartOnRay(waterthing, character)
	
	if start ~= nil and start.Material == "Water" then
	
    RootPart.Velocity = RootPart.Velocity + Vector3.new(0,6,0)
    
    end

headsunsound.Pitch = 0.76 + Humanoid.WalkSpeed/124
if torvel<1  and Swing == 2 then
    boost = false
elseif torvel>1   and Swing == 2 then
    boost = true
    freefall = 0
end
if hitfloor ~= nil and freefall < 150 then
    freefall = 0
end
if freefall > 150 and hitfloor ~= nil then
land()
freefall = 0
end







		if RootPart.Velocity.y > 1 and hitfloor==nil then
Anim="Jump"





if attack==false then
change = 1
look = 0
			       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.15)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(4), math.rad(0), math.rad(0)), 0.07)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10+2.05*math.cos(sine/5)),math.rad(0),math.rad(0)),0.07)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-20+2.05*math.cos(sine/5)), math.rad(-10), math.rad(50-2.05*math.cos(sine/5))), 0.07)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-20+2.05*math.cos(sine/5)), math.rad(-10), math.rad(-50+2.05*math.cos(sine/5))), 0.07)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1, -0.6) * CFrame.Angles(math.rad(-25+3.05*math.cos(sine/5)), math.rad(-3), math.rad(0)), 0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -.47, -0.7) * CFrame.Angles(math.rad(-12+3.05*math.cos(sine/5)), math.rad(0), math.rad(0)), 0.1)
end

elseif RootPart.Velocity.y < -1 and freefall <150 and hitfloor==nil then
Anim="Fall"
change = 1
freefall = freefall +0.77


if attack==false then
			       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.15)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0.2) * CFrame.Angles(math.rad(7+4*math.sin(sine/1.3)), math.rad(0), math.rad(0)),0.07)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.65, 0) * angles(math.rad(0), math.rad(0), math.rad(140+12*math.cos(sine/1.3))), 0.07)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.65, 0) * angles(math.rad(0), math.rad(0), math.rad(-140+12*math.cos(sine/1.3))), 0.07)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(40+7*math.sin(sine/1.3)),math.rad(0),math.rad(0)),0.07)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.17*math.cos(sine/1.3), -0.13) * CFrame.Angles(math.rad(18+7*math.cos(sine/1.3)), math.rad(3), math.rad(0)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -.37+0.17*math.cos(sine/1.3), -0.2) * CFrame.Angles(math.rad(32+7*math.cos(sine/1.3)), math.rad(0), math.rad(0)), 0.1)
end



elseif RootPart.Velocity.y < -1 and freefall > 150 and hitfloor==nil then
Anim="FreeFall"
change = 1


if attack==false then
			       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.15)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1, 0.2) * CFrame.Angles(math.rad(-90+3*math.sin(sine/1.3)), math.rad(0), math.rad(0)),0.07)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(14+12*math.cos(sine/1.3)), math.rad(0), math.rad(110)), 0.07)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(14+12*math.cos(sine/1.3)), math.rad(0), math.rad(-110)), 0.07)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-12+7*math.sin(sine/1.3)),math.rad(0),math.rad(0)),0.07)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.17*math.cos(sine/1.3),0.2) * CFrame.Angles(math.rad(-12+4*math.cos(sine/1.3)), math.rad(3), math.rad(-46)), 0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1+0.17*math.cos(sine/1.3), 0.2) * CFrame.Angles(math.rad(-12+4*math.cos(sine/1.3)), math.rad(0), math.rad(46)), 0.1)
end

elseif torvel<1 and hitfloor~=nil then
Anim="Idle"
change = 1
if attack==false and equip == false then
  
			       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.15)
Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1-0.04*math.cos(sine/40), -0) * CFrame.Angles(math.rad(0-0.81*math.cos(sine/40)), math.rad(-40), math.rad(0)), 0.1)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(0+2.6*math.sin(sine/40)),math.rad(0),math.rad(40)),0.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.55+0.04*math.sin(sine/40), 0-0.04*math.cos(sine/40)) * angles(math.rad(-2+1.3*math.cos(sine/40)), math.rad(0+4*math.sin(sine/40)), math.rad(6.3+2.2*math.cos(sine/40))),0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.55+0.04*math.sin(sine/40), 0-0.04*math.cos(sine/40)) * angles(math.rad(2+1.3*math.cos(sine/40)), math.rad(0-4*math.sin(sine/40)), math.rad(-6.3-2.2*math.cos(sine/40))),0.1)
LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, llegendPoint.Y-LeftLeg.Position.Y+0.04*math.cos(sine/40), 0) * CFrame.Angles(math.rad(0+0.81*math.cos(sine/40)), math.rad(18+0.81*math.cos(sine/40)), math.rad(-2-0.81*math.cos(sine/40))),0.1)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.57, rlegendPoint.Y-RightLeg.Position.Y+0.04*math.cos(sine/40), 0)  * CFrame.Angles(math.rad(0+0.81*math.cos(sine/40)), math.rad(-2+0.81*math.cos(sine/40)), math.rad(3-0.81*math.cos(sine/40))),0.1)
end


	
elseif torvel>1.5 and torvel<70 and hitfloor~=nil then
Anim="Walk"
change = 0.84+ Character.Humanoid.WalkSpeed/132
look = 0
if attack==false and equip == false then
					       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.02)
		Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1-0.52*math.cos(sine/2), -.8) * angles(math.rad(-26), math.rad(0), math.rad(0)+ RootPart.RotVelocity.Y / 26), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-11+20*math.sin(sine/2)),math.rad(0),math.rad(0+5*math.sin(sine/4)) + RootPart.RotVelocity.Y / 13),.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.1) * angles(math.rad(-60-7*math.sin(sine/4))+ RootPart.RotVelocity.Y / -34, math.rad(0), math.rad(15+2*math.sin(sine/4))- RootPart.RotVelocity.Y / 34),.15)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0.1)*angles(math.rad(-60-7*math.sin(sine/4))+ RootPart.RotVelocity.Y / 34,math.rad(0),math.rad(-15+2*math.sin(sine/4))+ RootPart.RotVelocity.Y / -34),.15)
		LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.28*math.cos(sine/4), 0-0.32*math.cos(sine/4)) * CFrame.Angles(math.rad(0+104*math.sin(sine/4)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)+ RootPart.RotVelocity.Y / -54), 0.3)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1-0.28*math.cos(sine/4),0+0.32*math.cos(sine/4)) * CFrame.Angles(math.rad(0-104*math.sin(sine/4)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)- RootPart.RotVelocity.Y / 54), 0.3)
end


		elseif torvel>=70 and torvel<200 and hitfloor~=nil then
		Anim="Run"
		change = 0.84+ Character.Humanoid.WalkSpeed/142
		if attack==false and equip == false then
					       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.02)
		Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1-0.52*math.cos(sine/1.5), -.8) * angles(math.rad(-37), math.rad(0), math.rad(0)+ RootPart.RotVelocity.Y / 26), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-11+25*math.sin(sine/1.5)),math.rad(0),math.rad(0+5*math.sin(sine/3)) + RootPart.RotVelocity.Y / 13),.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.3) * angles(math.rad(-72-8*math.sin(sine/1.5))+ RootPart.RotVelocity.Y / -34, math.rad(0), math.rad(1+0*math.cos(sine/3))- RootPart.RotVelocity.Y / 34),.25)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0.3)*angles(math.rad(-72-8*math.sin(sine/1.5))+ RootPart.RotVelocity.Y / 34,math.rad(0),math.rad(-1+0*math.cos(sine/3))+ RootPart.RotVelocity.Y / -34),.25)
		LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.32*math.cos(sine/3), 0-0.42*math.cos(sine/3)) * CFrame.Angles(math.rad(0+134*math.sin(sine/3)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)+ RootPart.RotVelocity.Y / -54), 0.44)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1-0.32*math.cos(sine/3),0+0.42*math.cos(sine/3)) * CFrame.Angles(math.rad(0-134*math.sin(sine/3)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)- RootPart.RotVelocity.Y / 54), 0.44)
		end
		
		--[[
		if attack==false then
		LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1-0.4*math.cos(sine/5.5)/2, 0 *math.sin(sine/6.6)/2) * CFrame.Angles(math.rad(0) + -math.sin(sine/5.5)/1.2, math.rad(0), 0), .8)
		RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1+0.4*math.cos(sine/5.5)/2,0 *-math.sin(sine/6.6)/2) * CFrame.Angles(math.rad(0) + math.sin(sine/5.5)/1.2, math.rad(0), 0), .8)
		end
		]]
		if attack==true and noleg == false then
		LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1-0.24*math.cos(sine/5), 0.+0.24*math.cos(sine/5)) * CFrame.Angles(math.rad(0-74*math.sin(sine/5)), math.rad(0), math.rad(0)), 0.3)
		   RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1+0.24*math.cos(sine/5),0.-0.24*math.cos(sine/5)) * CFrame.Angles(math.rad(0+74*math.sin(sine/5)), math.rad(0), math.rad(0)), 0.3)
		end
		
		
		
				elseif torvel>=200 and hitfloor~=nil then
		Anim="MachRun"
		change = 0.84+ Character.Humanoid.WalkSpeed/182
		if attack==false and equip == false then
					       Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Vector3.new(0,0,0),0.02)
		Torso.Weld.C0 = clerp(Torso.Weld.C0, CFrame.new(0, -1-0.52*math.cos(sine/1), -3.8) * angles(math.rad(-44), math.rad(0), math.rad(0)+ RootPart.RotVelocity.Y / 26), .2)
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-11+25*math.sin(sine/1)),math.rad(0),math.rad(0+5*math.sin(sine/2)) + RootPart.RotVelocity.Y / 13),.2)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.5) * angles(math.rad(-78-12*math.sin(sine/1))+ RootPart.RotVelocity.Y / -34, math.rad(0), math.rad(-24+0*math.cos(sine/2))- RootPart.RotVelocity.Y / 34),.35)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0.5)*angles(math.rad(-78-12*math.sin(sine/1))+ RootPart.RotVelocity.Y / 34,math.rad(0),math.rad(24+0*math.cos(sine/2))+ RootPart.RotVelocity.Y / -34),.35)
		LeftLeg.Weld.C0 = clerp(LeftLeg.Weld.C0, CFrame.new(-0.5, -1+0.42*math.cos(sine/2), 0-0.62*math.cos(sine/2)) * CFrame.Angles(math.rad(0+134*math.sin(sine/2)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)+ RootPart.RotVelocity.Y / -54), 0.52)
RightLeg.Weld.C0 = clerp(RightLeg.Weld.C0, CFrame.new(0.5, -1-0.42*math.cos(sine/2),0+0.62*math.cos(sine/2)) * CFrame.Angles(math.rad(0-134*math.sin(sine/2)), math.rad(0)+ RootPart.RotVelocity.Y / 42, math.rad(0)- RootPart.RotVelocity.Y / 54), 0.52)
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
            if Thing[1].Transparency <= 1 then
              if Thing[2] == "Block1" then
                Thing[1].CFrame = Thing[1].CFrame * euler(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
                Mesh = Thing[1]:FindFirstChild("Mesh")
                if not Mesh then
                  Mesh = Instance.new("BlockMesh")
                end
                Mesh.Scale = Mesh.Scale + vt(Thing[4], Thing[5], Thing[6])
                Thing[1].Transparency = Thing[1].Transparency + Thing[3]
              elseif Thing[2] == "Cylinder" then
                  Mesh = Thing[1]:FindFirstChild("Mesh")
                  if not Mesh then
                    Mesh = Instance.new("BlockMesh")
                  end
                  Mesh.Scale = Mesh.Scale + vt(Thing[4], Thing[5], Thing[6])
                  Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                elseif Thing[2] == "Blood" then
                    Mesh = Thing[1]:FindFirstChild("Mesh")
                    if not Mesh then
                      Mesh = Instance.new("BlockMesh")
                    end
                    Thing[1].CFrame = Thing[1].CFrame * cf(0, 0.5, 0)
                    Mesh.Scale = Mesh.Scale + vt(Thing[4], Thing[5], Thing[6])
                    Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                  elseif Thing[2] == "Elec" then
                      Mesh = Thing[1]:FindFirstChild("Mesh")
                      if not Mesh then
                        Mesh = Instance.new("BlockMesh")
                      end
                      Mesh.Scale = Mesh.Scale + vt(Thing[7], Thing[8], Thing[9])
                      Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                    elseif Thing[2] == "Disappear" then
                        Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                      end
            else
              Part.Parent = nil
              game:GetService("Debris"):AddItem(Part, 0)
              table.remove(Effects, e)
            end
          end
        end
      end
    end

end
