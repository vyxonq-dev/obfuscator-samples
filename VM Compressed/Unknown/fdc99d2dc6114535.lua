loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.GameId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game, search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end

wait(2)


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



-- Mewy23's message --
-- I'll kill you if you leak this e-e --
-- [ Reaper ] --
-- [ Reaper! ] --

LoudVolume = false
Submerged = false
Music = true
--script.Name = "Reaper"
Player = game.Players.LocalPlayer
c = Player.Character
Head = c.Head
c.Animate.Disabled = true
anim = c.Humanoid.Animator anim.Parent = nil
rage = false
p = game.Players.LocalPlayer
Music = false
PhaseEnabled = true
TeleportEnabled = true


local GUI = Instance.new("ScreenGui",Player.PlayerGui)
local Frame = Instance.new("Frame",GUI)Frame.Size = UDim2.new(0.1,0,0.05,0) Frame.Position = UDim2.new(0.9,0,0.425,0)
Frame.BackgroundTransparency = 0.5 Frame.BorderSizePixel = 0 Frame.BackgroundColor3 = Color3.new(85/255,40/255,113/255)
local UltT = Instance.new("TextLabel",Frame)UltT.Size = UDim2.new(1,0,1,0)UltT.BackgroundTransparency = 1 UltT.Text = "0%"
UltT.TextColor3 = Color3.new(1,1,1) UltT.TextScaled = true UltT.TextWrapped = true

local Frame2 = Instance.new("Frame",GUI)Frame2.Size = UDim2.new(0.1,0,0.05,0) Frame2.Position = UDim2.new(0.9,0,0.535,0)
Frame2.BackgroundTransparency = 0.5 Frame2.BorderSizePixel = 0 Frame2.BackgroundColor3 = Color3.new(85/255,40/255,113/255)
local AmmoT = Instance.new("TextLabel",Frame2)AmmoT.Size = UDim2.new(1,0,1,0)AmmoT.BackgroundTransparency = 1 AmmoT.Text = "8/8"
AmmoT.TextColor3 = Color3.new(1,1,1) AmmoT.TextScaled = true AmmoT.TextWrapped = true

local Effects = {}
attack = false
local attacking = false
vt = Vector3.new
bc = BrickColor.new
br = BrickColor.random
it = Instance.new
cf = CFrame.new
euler = CFrame.fromEulerAnglesXYZ
angles = CFrame.Angles
matr = math.random
mouse = Player:GetMouse()

 c.Humanoid.WalkSpeed = 24 c.Humanoid.JumpPower = 50

  RSC0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
  RSC1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
  LSC0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
  LSC1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
  RHC0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
  RHC1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
  LHC0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
  LHC1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
  NC0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
  NC1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
  RJC0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
  RJC1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
  RS = c.Torso:FindFirstChild("Right Shoulder")
  LS = c.Torso:FindFirstChild("Left Shoulder")
  RH = c.Torso:FindFirstChild("Right Hip")
  LH = c.Torso:FindFirstChild("Left Hip")
  RJ = c.HumanoidRootPart:FindFirstChild("RootJoint")
  N = c.Torso:FindFirstChild("Neck")
  cf = CFrame.new
  ang = CFrame.Angles
  rd = math.rad
  rd2 = math.random

c.Humanoid.JumpPower = 45
function swait(num)
if num==0 or num==nil then
game:service'RunService'.Heartbeat:wait(0)
else
for i=0,num do
game:service'RunService'.Heartbeat:wait(0)
end
end
end
	
function lerpz(joint, prop, cfrmz, alp)
joint[prop] = joint[prop]:lerp(cfrmz, alp)
end
function resetlerp()
RJ.C0 = RJC0
RJ.C1 = RJC1
N.C0 = NC0
N.C1 = NC1
RS.C0 = RSC0
RS.C1 = RSC1
LS.C0 = LSC0
LS.C1 = LSC1
RH.C0 = RHC0
RH.C1 = RHC1
LH.C0 = LHC0
LH.C1 = LHC1
end

UltCharge = 0
Ammo = 8
local vls = math.random(1,2)
if vls == 1 then
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://612647950" GS.Volume = 3 GS:Play()
else
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://612648243" GS.Volume = 3 GS:Play()	
end
PS = Instance.new("Sound",c.HumanoidRootPart)PS.SoundId = "rbxassetid://882101831" PS.Volume = 3 PS:Play()
--[[local Hood = Instance.new("Part",c)Hood.Size = Vector3.new(0.2,0.2,0.2)Hood.BrickColor = BrickColor.new("Really black")
local HM = Instance.new("SpecialMesh",Hood)HM.MeshId = "rbxassetid://16952952" HM.Scale = Vector3.new(1.05,1.05,1.05)
local HW = Instance.new("Weld",c.Head)HW.Part0 = c.Head HW.Part1 = Hood HW.C0 = CFrame.new(0,0.25,0)]]
LeftGun = Instance.new("Part",game.Workspace)LeftGun.Size = Vector3.new(0.4,1.4,4)LeftGun.CanCollide = false LeftGun.Anchored = false LeftGun.Name = "HellfireGun" LeftGun.Archivable = false
local LeftM = Instance.new("SpecialMesh",LeftGun)LeftM.MeshId = "rbxassetid://651422978" LeftM.TextureId = "rbxassetid://651423359" LeftM.Scale = Vector3.new(0.35,0.35,0.35)
local LeftW = Instance.new("Weld",c["Left Arm"])LeftW.Part0 = c["Left Arm"] LeftW.Part1 = LeftGun LeftW.C0 = CFrame.new(0,-2,-0.25)*CFrame.Angles(math.rad(-90),0,0)
local RightGun = Instance.new("Part",game.Workspace)RightGun.Size = Vector3.new(0.4,1.4,4)RightGun.CanCollide = false RightGun.Anchored = false RightGun.Name = "HellfireGun" RightGun.Archivable = false
local RightM = Instance.new("SpecialMesh",RightGun)RightM.MeshId = "rbxassetid://651422978" RightM.TextureId = "rbxassetid://651423359" RightM.Scale = Vector3.new(0.35,0.35,0.35)
local RightW = Instance.new("Weld",c["Right Arm"])RightW.Part0 = c["Right Arm"] RightW.Part1 = RightGun RightW.C0 = CFrame.new(0,-2,-0.25)*CFrame.Angles(math.rad(-90),0,0)
local LeftEffect = Instance.new("Part",LeftGun)LeftEffect.Size = Vector3.new(0.2,0.2,0.2)LeftEffect.Transparency = 1 LeftEffect.CanCollide = false
local LEFW = Instance.new("Weld",LeftGun)LEFW.Part0 = LeftGun LEFW.Part1 = LeftEffect LEFW.C0 = CFrame.new(0,0.4,-2.4)
local RightEffect = Instance.new("Part",RightGun)RightEffect.Size = Vector3.new(0.2,0.2,0.2)RightEffect.Transparency = 1 RightEffect.CanCollide = false
local REFW = Instance.new("Weld",RightGun)REFW.Part0 = RightGun REFW.Part1 = RightEffect REFW.C0 = CFrame.new(0,0.4,-2.4)
local ExpColors = {ColorSequenceKeypoint.new(0, Color3.new(255/255,144/255,46/255)),ColorSequenceKeypoint.new(0.121, Color3.new(0/255,0/255,0/255)),ColorSequenceKeypoint.new(1, Color3.new(0/255,0/255,0/255))}
local LeftExp = Instance.new("ParticleEmitter",LeftEffect) LeftExp.Texture = "rbxassetid://850216805"
LeftExp.LightEmission = 0.85 LeftExp.Color = ColorSequence.new(ExpColors) LeftExp.Rate = 500 LeftExp.Rotation = NumberRange.new(-360,360)
LeftExp.Lifetime = NumberRange.new(1) LeftExp.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.0138,2,0),NumberSequenceKeypoint.new(1,4,0)})
LeftExp.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)}) LeftExp.Speed = NumberRange.new(2) LeftExp.SpreadAngle = Vector2.new(25,25) LeftExp.Name = "Explosion"
LeftExp.VelocityInheritance = 0.5 LeftExp.ZOffset = 2 LeftExp.Enabled = false LeftExp.EmissionDirection = "Front"
local RightExp = Instance.new("ParticleEmitter",RightEffect) RightExp.Texture = "rbxassetid://850216805"
RightExp.LightEmission = 0.85 RightExp.Color = ColorSequence.new(ExpColors) RightExp.Rate = 500 RightExp.Rotation = NumberRange.new(-360,360)
RightExp.Lifetime = NumberRange.new(1) RightExp.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.0138,2,0),NumberSequenceKeypoint.new(1,4,0)})
RightExp.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)}) RightExp.Speed = NumberRange.new(2) RightExp.SpreadAngle = Vector2.new(25,25) RightExp.Name = "Explosion"
RightExp.VelocityInheritance = 0.5 RightExp.ZOffset = 2 RightExp.Enabled = false RightExp.EmissionDirection = "Front"

function GunFade(Gun)
Spawn(function()
wait(3)
for i = 1,50 do
Gun.Transparency = Gun.Transparency + 1/50
swait()
end
Gun:remove()
end)
end

function Reload()
attack = true
for i = 1,15 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(45), rd(125)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-45), rd(-125)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
for i = 1,5 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.25) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(-65), rd(75)), 0.25) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(65), rd(-75)), 0.25) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.25)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.25)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)
swait()
end
RightGun.Archivable = true LeftGun.Archivable = true
local RD = RightGun:clone() RD.Parent = game.Workspace RD.CanCollide = true RD.Position = RightGun.Position RD.CFrame = RightGun.CFrame
local LD = LeftGun:clone() LD.Parent = game.Workspace LD.CanCollide = true LD.Position = LeftGun.Position LD.CFrame = LeftGun.CFrame
local BV = Instance.new("BodyVelocity",RD)BV.Velocity = c.HumanoidRootPart.CFrame.rightVector*15 BV.Velocity = BV.Velocity+c.HumanoidRootPart.CFrame.lookVector*25 BV.maxForce = Vector3.new(math.huge,math.huge,math.huge) game.Debris:AddItem(BV,0.05)
local BV2 = Instance.new("BodyVelocity",LD)BV2.Velocity = c.HumanoidRootPart.CFrame.rightVector*-15 BV2.Velocity = BV2.Velocity+c.HumanoidRootPart.CFrame.lookVector*25 BV2.maxForce = Vector3.new(math.huge,math.huge,math.huge) game.Debris:AddItem(BV2,0.05)
local hit = false local hit2 = false
RD.Touched:connect(function(T)
if hit == false and T.Parent ~= c and T.Name ~= "HellfireGun" then hit = true
GS = Instance.new("Sound",RD)GS.SoundId = "rbxassetid://247874314" GS.Volume = 0.5 GS:Play()
end
end)
LD.Touched:connect(function(T)
if hit2 == false and T.Parent ~= c and T.Name ~= "HellfireGun" then hit2 = true
GS = Instance.new("Sound",LD)GS.SoundId = "rbxassetid://247874314" GS.Volume = 0.5 GS:Play()
end
end)
GunFade(RD) GunFade(LD)
RightGun.Transparency = 1 LeftGun.Transparency = 1
for i = 1,25 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.25) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(-65), rd(75)), 0.25) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(65), rd(-75)), 0.25) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.25)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.25)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)
swait()
end
for i = 1,15 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.25) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(-65), rd(-25)), 0.25) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(65), rd(25)), 0.25) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.25)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.25)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.25)
swait()
end
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://882101831" GS.Volume = 3 GS:Play()
RightGun.Transparency = 0 LeftGun.Transparency = 0 Ammo = 8 attack = false
RightGun.Archivable = false LeftGun.Archivable = false
end
function ShotBullets(Gun)
local ColorsArray = {ColorSequenceKeypoint.new(0, Color3.new(255/255,0/255,0/255)),ColorSequenceKeypoint.new(1, Color3.new(255/255,0/255,0/255))}
for i = 1,15 do
local Bul = Instance.new("Part",game.Workspace)Bul.Transparency = 1 Bul.Size = Vector3.new(0.2,0.2,0.2) Bul.CanCollide = false
Bul.CFrame = CFrame.new(Gun.CFrame:toWorldSpace(CFrame.new(0,0,0)).p,mouse.hit.p)
Bul.CFrame = Bul.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5)))
local Atch1 = Instance.new("Attachment",Bul)Atch1.Position = Vector3.new(0,0.05,0)
local Atch2 = Instance.new("Attachment",Bul)Atch2.Position = Vector3.new(0,-0.05,0)
local Trail = Instance.new("Trail",Bul)Trail.Attachment0 = Atch1 Trail.Attachment1 = Atch2
Trail.Texture = "rbxassetid://22636887" Trail.Lifetime = 0.1 Trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
Trail.Color = ColorSequence.new(ColorsArray) Trail.LightEmission = 1 Trail.Enabled = true Trail.MinLength = 1
local BV = Instance.new("BodyVelocity",Bul)BV.maxForce = Vector3.new(math.huge,math.huge,math.huge) BV.Velocity = Bul.CFrame.lookVector*150
game.Debris:AddItem(Bul,0.5) local hit = false
local damage = 0
Bul.Touched:connect(function(Hit)
if hit == false then 
if Hit.Parent:findFirstChild("Humanoid")~= nil and Hit.Parent ~= c then hit = true
Hit.Parent.Humanoid:TakeDamage(damage) UltCharge = UltCharge + 0
end
end
end)
Spawn(function()
for i = 1,100 do
if damage < 0 then break end
damage = damage - 0
swait()
end
damage = 0.0
end)
end
end

ShotCoolDown = false
Combo = 1
mouse.Button1Down:connect(function()
if c.Humanoid.Health <= 0 then return end
if ShotCoolDown == true then return end
if attack == true then return end
if Ammo == 0 then
local S = Instance.new("Sound",LeftEffect)S.SoundId = "rbxassetid://596722009" S.Volume = 0.5 S:Play() game.Debris:AddItem(S,1) S.PlaybackSpeed = 0.9
else
ShotCoolDown = true Ammo = Ammo - 1
if Combo == 1 then Combo = 2 LeftExp.Enabled = true
ShotBullets(LeftEffect)
local S = Instance.new("Sound",LeftEffect)S.SoundId = "rbxassetid://181135016" S.Volume = 0.5 S:Play() game.Debris:AddItem(S,1) S.PlaybackSpeed = 0.9
for i = 1,3 do
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-125)), 0.35) -- Z, X, Y 
swait()
end
else Combo = 1 RightExp.Enabled = true
ShotBullets(RightEffect)
local S = Instance.new("Sound",RightEffect)S.SoundId = "rbxassetid://181135016" S.Volume = 0.5 S:Play() game.Debris:AddItem(S,1) S.PlaybackSpeed = 0.9
for i = 1,3 do
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(125)), 0.35) -- Z, X, Y 	
swait()
end
end
local S = Instance.new("Sound",RightEffect)S.SoundId = "rbxassetid://181135016" S.Volume = 0.5 S:Play() game.Debris:AddItem(S,1) S.PlaybackSpeed = 0.9
LeftExp.Enabled = false
RightExp.Enabled = false
wait(0.35)
ShotCoolDown = false	
end
end)

function Phase()
if PhaseEnabled == false then return end
PhaseEnabled = false
attack = true c.Humanoid.WalkSpeed = 48
local PhaseColors = {ColorSequenceKeypoint.new(0, Color3.new(65/255,0/255,98/255)),ColorSequenceKeypoint.new(0.121, Color3.new(5/255,0/255,32/255)),ColorSequenceKeypoint.new(1, Color3.new(65/255,0/255,98/255))}
for i,v in pairs(c:children()) do
if v.ClassName == "Part" and v.Name ~= "HumanoidRootPart" then
local PhaseEn = Instance.new("ParticleEmitter",v) PhaseEn.Texture = "rbxassetid://242102147"
PhaseEn.LightEmission = 0 PhaseEn.Color = ColorSequence.new(PhaseColors) PhaseEn.Rate = 250 PhaseEn.Rotation = NumberRange.new(-360,360)
PhaseEn.Lifetime = NumberRange.new(1) PhaseEn.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.0138,1,0),NumberSequenceKeypoint.new(1,0,0)})
PhaseEn.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0),NumberSequenceKeypoint.new(1,1,0)}) PhaseEn.Speed = NumberRange.new(0) PhaseEn.SpreadAngle = Vector2.new(25,25) PhaseEn.Name = "DarkEnergy"
PhaseEn.VelocityInheritance = 0.5 PhaseEn.ZOffset = 2 PhaseEn.Enabled = true PhaseEn.EmissionDirection = "Front" PhaseEn.Acceleration = Vector3.new(0,5,0)
end
end
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://834224978" GS.Volume = 3 GS:Play()
local PrevHealth = c.Humanoid.Health
local hp = c.Humanoid.HealthChanged:connect(function(Amnt)
if Amnt < PrevHealth then
c.Humanoid.Health = PrevHealth
end
end)
for i = 1,150 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0.5) * ang(rd(-15), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(105)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-105)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(15)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(-15)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
hp:disconnect()
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://834225054" GS.Volume = 3 GS:Play()
for i,v in pairs(c:children()) do
if v.ClassName == "Part" and v.Name ~= "HumanoidRootPart" then
if v:findFirstChild("DarkEnergy")~= nil then
v.DarkEnergy.Enabled = false game.Debris:AddItem(v.DarkEnergy,3)
end
end
end
Ammo = 8
c.Humanoid.WalkSpeed = 24
attack = false
Spawn(function()
wait(8)
PhaseEnabled = true
end)
end

function Teleport()
if TeleportEnabled == false then return end
if (c.HumanoidRootPart.Position-mouse.hit.p).magnitude >= 100 then return end
TeleportEnabled = false
local vl = math.random(1,4)
if vl == 1 then
local GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://612647830" GS.Volume = 3 GS:Play()
end
attack = true c.HumanoidRootPart.Anchored = true c.Humanoid.WalkSpeed = 0 c.Humanoid.JumpPower = 0 local Pos = mouse.hit.p
for i = 1,40 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(125)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-125)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
local PhaseColors = {ColorSequenceKeypoint.new(0, Color3.new(65/255,0/255,98/255)),ColorSequenceKeypoint.new(0.121, Color3.new(5/255,0/255,32/255)),ColorSequenceKeypoint.new(1, Color3.new(65/255,0/255,98/255))}
for i,v in pairs(c:children()) do
if v.ClassName == "Part" and v.Name ~= "HumanoidRootPart" then
local PhaseEn = Instance.new("ParticleEmitter",v) PhaseEn.Texture = "rbxassetid://242102147"
PhaseEn.LightEmission = 0 PhaseEn.Color = ColorSequence.new(PhaseColors) PhaseEn.Rate = 250 PhaseEn.Rotation = NumberRange.new(-360,360)
PhaseEn.Lifetime = NumberRange.new(1) PhaseEn.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.0138,2,0),NumberSequenceKeypoint.new(1,0,0)})
PhaseEn.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0),NumberSequenceKeypoint.new(1,1,0)}) PhaseEn.Speed = NumberRange.new(0) PhaseEn.SpreadAngle = Vector2.new(25,25) PhaseEn.Name = "DarkEnergy"
PhaseEn.VelocityInheritance = 0.5 PhaseEn.ZOffset = 2 PhaseEn.Enabled = true PhaseEn.EmissionDirection = "Front" PhaseEn.Acceleration = Vector3.new(0,5,0)
end
end
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://834224978" GS.Volume = 3 GS:Play()
for i = 1,50 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, -0.25*i) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(125)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-125)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
c.HumanoidRootPart.CFrame = CFrame.new(Pos)
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.new(0,2.5,0)
GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://834225054" GS.Volume = 3 GS:Play()
for i = 1,50 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(125)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-125)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
c.HumanoidRootPart.Anchored = false
c.Humanoid.WalkSpeed = 24 c.Humanoid.JumpPower = 50
local PrevHealth = c.Humanoid.Health
for i,v in pairs(c:children()) do
if v.ClassName == "Part" and v.Name ~= "HumanoidRootPart" then
if v:findFirstChild("DarkEnergy")~= nil then
v.DarkEnergy.Enabled = false game.Debris:AddItem(v.DarkEnergy,3)
end
end
end
attack = false
Spawn(function()
wait(10)
TeleportEnabled = true
end)
end

function ShotDBullets(Gun)
local ColorsArray = {ColorSequenceKeypoint.new(0, Color3.new(255/255,0/255,0/255)),ColorSequenceKeypoint.new(1, Color3.new(255/255,0/255,0/255))}
for i = 1,15 do
local Bul = Instance.new("Part",game.Workspace)Bul.Transparency = 1 Bul.Size = Vector3.new(2,2,2) Bul.CanCollide = false
Bul.CFrame = Gun.CFrame*CFrame.Angles(math.rad(math.random(-25,25)),math.rad(math.random(-25,25)),math.rad(math.random(-25,25)))
local Atch1 = Instance.new("Attachment",Bul)Atch1.Position = Vector3.new(0,0.05,0)
local Atch2 = Instance.new("Attachment",Bul)Atch2.Position = Vector3.new(0,-0.05,0)
local Trail = Instance.new("Trail",Bul)Trail.Attachment0 = Atch1 Trail.Attachment1 = Atch2
Trail.Texture = "rbxassetid://22636887" Trail.Lifetime = 0.1 Trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
Trail.Color = ColorSequence.new(ColorsArray) Trail.LightEmission = 1 Trail.Enabled = true Trail.MinLength = 1
local BV = Instance.new("BodyVelocity",Bul)BV.maxForce = Vector3.new(math.huge,math.huge,math.huge) BV.Velocity = Bul.CFrame.lookVector*150
game.Debris:AddItem(Bul,0.5)
end
for i,v in pairs(game.Workspace:children()) do
if v:FindFirstChild("Humanoid")~= nil and v:findFirstChild("HumanoidRootPart")~= nil and v ~= c then
if (v.HumanoidRootPart.Position-c.HumanoidRootPart.Position).magnitude <= 45 then
v.Humanoid:TakeDamage(0)
end
end
end
end

function Fade(PP)
Spawn(function()
for i = 1,20 do
PP.Transparency = PP.Transparency + 1/20
swait()
end
PP:remove()
end)
end
function DeathFire()
Spawn(function()
local m2 = Instance.new("Model",game.Workspace)
for i,v in pairs(c:children()) do
if v.ClassName == "Part" and v.Name ~= "HumanoidRootPart" then
local clone = v:clone()clone.BrickColor = BrickColor.new("Really black") clone.Anchored = true clone.CanCollide = false
if clone:findFirstChild("Mesh")~= nil then clone.Mesh.TextureId = "" end clone.Parent = m2 Fade(clone)
elseif v.ClassName == "Accessory" then
local clone = v.Handle:clone()clone.BrickColor = BrickColor.new("Really black") clone.Anchored = true clone.CanCollide = false
if clone:findFirstChild("Mesh")~= nil then clone.Mesh.TextureId = "" end clone.Parent = m2 Fade(clone)
end
m2:BreakJoints()
end
RightExp.Enabled = true
local S = Instance.new("Sound",RightEffect)S.SoundId = "rbxassetid://181135016" S.Volume = 0.5 S:Play() game.Debris:AddItem(S,1) S.PlaybackSpeed = 0.9
LeftExp.Enabled = true
local S2 = Instance.new("Sound",LeftEffect)S2.SoundId = "rbxassetid://181135016" S2.Volume = 0.5 S2:Play() game.Debris:AddItem(S2,1) S2.PlaybackSpeed = 0.9
wait(0.1)
RightExp.Enabled = false
LeftExp.Enabled = false
ShotDBullets(RightEffect)
ShotDBullets(LeftEffect)
end)
end

function DeathBlossom()
if UltCharge >= 100 then
UltCharge = 0
local SpinCharge = 1 c.HumanoidRootPart.Anchored = true
local GS = Instance.new("Sound",c.HumanoidRootPart)GS.SoundId = "rbxassetid://506001681" GS.Volume = 3 GS:Play()
for i = 1,15 do 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(125)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-125)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-45)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, -1) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(1, 1, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 1, 0) * ang(rd(-5), rd(0), rd(-45)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, -1) * ang(rd(0), rd(0), rd(35)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.35) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(1, 1, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 1, 0) * ang(rd(-5), rd(0), rd(-45)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-15)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(-90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(-15), rd(0), rd(15)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, -1) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.35) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(1, 1, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 1, 0) * ang(rd(-5), rd(0), rd(-45)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-25)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(15), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(0), rd(90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, -1) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(15)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(1, 1, 0) * ang(rd(-5), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 1, 0) * ang(rd(-5), rd(0), rd(-45)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
DeathFire()
for i = 1,15 do 
c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinCharge*5),0)
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(90), rd(90)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, -0.75) * ang(rd(0), rd(-90), rd(-90)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
swait()
end
c.HumanoidRootPart.Anchored = false
attack = false
Reload()
end
end

mouse.KeyDown:connect(function(key)
if c.Humanoid.Health <= 0 then return end
if attack == true then return end
if key == "q" then
Phase()
end
if key == "e" then
DeathBlossom()
end
if key == "r" then
Reload()
end
if key == "z" then
Teleport()
end
end)

idletime = 0
sine = 0
game:GetService("RunService").RenderStepped:connect(function()
if UltCharge >= 100 then
UltCharge = 100
UltT.Text = "100%"
else
UltT.Text = math.floor(UltCharge).."%"
end
AmmoT.Text = Ammo.."/8"
if attack == false then 
if c.HumanoidRootPart.Velocity.Y > 0.25 then idletime = 0
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(10), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(75)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-75)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(-25)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(25)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
elseif c.HumanoidRootPart.Velocity.Y < -0.25 then idletime = 0
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(10), rd(0), rd(0)), 0.1) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(125)), 0.1) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-125)), 0.1) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(25)), 0.1)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
lerpz(LH, "C0", LHC0 * cf(0, 0, 0) * ang(rd(-5), rd(0), rd(-25)), 0.1)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.1)
elseif (c.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude > 1 then idletime = 0
sine = sine + 1 
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0+(math.cos(sine/3)*0.05)) * ang(rd(10), rd(0), rd(0)), 0.2)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(-10), rd(0), rd(0)), 0.2) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(95+(math.cos(sine/3)*-2.5))), 0.2) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.2) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-(95+(math.cos(sine/3)*-2.5)))), 0.2) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.2) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0.05+(math.cos(sine/3)*-0.05), 0) * ang(rd(0), rd(0), rd(-(15+math.cos(sine/6)*75))), 0.2)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.2)
lerpz(LH, "C0", LHC0 * cf(0, 0.05+(math.cos(sine/3)*-0.05), 0) * ang(rd(0), rd(0), rd((15-math.cos(sine/6)*75))), 0.2)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.2)
swait()
else sine = sine + 1 idletime = idletime + 1
if idletime >= 200 then
lerpz(RJ, "C0", RJC0 * cf(0, 0, 0.1+(math.cos(sine/64)*-0.1)) * ang(rd(0), rd(0), rd(0)), 0.05)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(25+(math.cos(sine/64)*-4))), 0.05) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-(25+(math.cos(sine/64)*-4)))), 0.05) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0.1+(math.cos(sine/64)*0.1), 0) * ang(rd(-5), rd(0), rd(0)), 0.05)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05)
lerpz(LH, "C0", LHC0 * cf(0, 0.1+(math.cos(sine/64)*0.1), 0) * ang(rd(-5), rd(0), rd(0)), 0.05)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05)	
else
lerpz(RJ, "C0", RJC0 * cf(0, 0, (math.cos(sine/64)*-0.1)) * ang(rd(0), rd(0), rd(0)), 0.05)-- Y, X, Z
lerpz(N, "C0", NC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05) -- Y, X, Z
lerpz(RS, "C0", RSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(90+(math.cos(sine/64)*-4))), 0.05) -- Z, X, Y 
lerpz(RS, "C1", RSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05) -- Z, X, Y
lerpz(LS, "C0", LSC0 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(-(90+(math.cos(sine/64)*-4)))), 0.05) -- Z, X, Y
lerpz(LS, "C1", LSC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05) -- Z, X, Y
lerpz(RH, "C0", RHC0 * cf(0, 0.1+(math.cos(sine/64)*0.1), 0) * ang(rd(-5), rd(0), rd(0)), 0.05)
lerpz(RH, "C1", RHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05)
lerpz(LH, "C0", LHC0 * cf(0, 0.1+(math.cos(sine/64)*0.1), 0) * ang(rd(-5), rd(0), rd(0)), 0.05)
lerpz(LH, "C1", LHC1 * cf(0, 0, 0) * ang(rd(0), rd(0), rd(0)), 0.05)
end
swait()
end
--[[local ToMouse = (mouse.hit.p - Head.Position).unit
local Angle = math.acos(ToMouse:Dot(Vector3.new(0, 1, 0)))
local FromRightArmPos = (Head.Position + Head.CFrame:vectorToWorldSpace(Vector3.new(((Head.Size.X / 2) + (c["Right Arm"].Size.X / 2)), ((Head.Size.Y / 2) - (c["Right Arm"].Size.Z / 2)), 0)))
local ToMouseRightArm = ((mouse.hit.p - FromRightArmPos) * Vector3.new(1 ,0, 1)).unit
local Look = (Head.CFrame.lookVector * Vector3.new(1, 0, 1)).unit
local LateralAngle = math.acos(ToMouseRightArm:Dot(Look))
if tostring(LateralAngle) == "-1.#IND" then
LateralAngle = 0
end
local Cross = Head.CFrame.lookVector:Cross(ToMouseRightArm)
if LateralAngle > (math.pi / 2) then
LateralAngle = (math.pi / 2)
end
if Cross.Y < 0 then
LateralAngle = -LateralAngle
end
RS.C0 = CFrame.new(RS.C0.p) * CFrame.Angles(((math.pi / 2) - Angle), ((math.pi / 2) + LateralAngle), 0)
RS.C0 = RS.C0*CFrame.Angles(0,0,math.rad(90))
local FromLeftArmPos = (Head.Position + Head.CFrame:vectorToWorldSpace(Vector3.new(((Head.Size.X / 2) + (c["Left Arm"].Size.X / 2)), ((Head.Size.Y / 2) - (c["Left Arm"].Size.Z / 2)), 0)))
local ToMouseLeftArm = ((mouse.hit.p - FromLeftArmPos) * Vector3.new(1 ,0, 1)).unit
local Look = (Head.CFrame.lookVector * Vector3.new(1, 0, 1)).unit
local LateralAngle = math.acos(ToMouseLeftArm:Dot(Look))
if tostring(LateralAngle) == "-1.#IND" then
LateralAngle = 0
end
local Cross = Head.CFrame.lookVector:Cross(ToMouseLeftArm)
if LateralAngle > (math.pi * 2) then
LateralAngle = (math.pi * 2)
end
if Cross.Y < 0 then
LateralAngle = -LateralAngle
end
LS.C0 = CFrame.new(LS.C0.p) * CFrame.Angles(((math.pi / 2) - Angle), ((math.pi / 2) + LateralAngle), 0)
LS.C0 = LS.C0*CFrame.Angles(0,0,math.rad(90)) LS.C0 = LS.C0*CFrame.Angles(0,math.rad(180),0)]]
end
end)
