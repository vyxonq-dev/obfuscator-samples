--fe zen

loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.GameId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui")b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ResetOnSpawn=false b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: [UP] Just a baseplate. /  Green baseplate., game creator: the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer) return end


wait(1)

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


local FELOADLIBRARY = LoadLibrary("RbxUtility")
local p = game.Players.LocalPlayer
local char = p.Character
local Character = char
local Mau5 = p:GetMouse()
local larm = char["Left Arm"]
local rarm = char["Right Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local hed = char.Head
local torso = char.Torso
local hum = char.Humanoid
local cam = game.Workspace.CurrentCamera
local root = char.HumanoidRootPart
local RootPart = root
local l = game:GetService("Lighting")
local debris = game:GetService("Debris")
local rs = game:GetService("RunService").RenderStepped
local Damaged = {}
it = Instance.new
vt = Vector3.new
cn = CFrame.new
euler = CFrame.fromEulerAnglesXYZ
angles = CFrame.Angles
local HandCF = CFrame.new(root.Position - Vector3.new(0, 3, 0)) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
Debounces = {
	CanAttack = true,
	NoIdle = false,
	Anger = false,
	OrbMove1 = false,
	OrbMove2 = false,
	OrbMove3 = false,
	OrbMove4 = false,
	OrbMove5 = false,
	OrbMove6 = false,
	OrbMove7 = false,
	OrbMove8 = false
}
function Lerp(a, b, t)
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
local Lerp = CFrame.new().lerp
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
		if i == 0 and m00 or m11 < m22 then
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
			local invSinTheta = 1 / math.sin(theta)
			startInterp = math.sin((1 - t) * theta) * invSinTheta
			finishInterp = math.sin(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
			if 1 + cosTheta > 1.0E-4 then
				local theta = math.acos(-cosTheta)
				local invSinTheta = 1 / math.sin(theta)
				startInterp = math.sin((t - 1) * theta) * invSinTheta
				finishInterp = math.sin(t * theta) * invSinTheta
			else
				startInterp = t - 1
				finishInterp = t
				return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
			end
		end
	end
end
function scaleTween(strt, fnsh, tim)
	local com1 = {
		strt.X,
		strt.Y,
		strt.Z
	}
	local com2 = {
		fnsh.X,
		fnsh.Y,
		fnsh.Z
	}
	for i, v in pairs(com1) do
		com1[i] = v + (com2[i] - v) * tim
	end
	return Vector3.new(com1[1], com1[2], com1[3])
end
function newWeld(wp0, wp1, wc0x, wc0y, wc0z)
	local wld = Instance.new("Weld", wp1)
	wld.Part0 = wp0
	wld.Part1 = wp1
	wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end

function TakeDamage(a, b)
--a:TakeDamage(b)
end

function WeldBetween(a, b)
	weld = Instance.new("Weld", a)
	weld.Name = "W"
	weld.Part0 = a
	weld.Part1 = b
	weld.C0 = a.CFrame:inverse() * b.CFrame
	return weld
end
function Lerp2(a, b, i)
	return a:lerp(b, i)
end
function HasntDamaged(plrname)
	local ret = true
	for _, v in pairs(Damaged) do
		if v == plrname then
			ret = false
		end
	end
	return ret
end
function nooutline(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function part(formfactor, parent, material, reflectance, transparency, brickcolor, name, size)
	local fp = it("Part")
	fp.formFactor = formfactor
	fp.Parent = parent
	fp.Reflectance = reflectance
	fp.Transparency = transparency
	fp.CanCollide = false
	fp.Locked = true
	fp.BrickColor = BrickColor.new(tostring(brickcolor))
	fp.Name = name
	fp.Size = size
	fp.Position = Character.Torso.Position
	nooutline(fp)
	fp.Material = material
	fp:BreakJoints()
	return fp
end
function mesh(Mesh, part, meshtype, meshid, offset, scale)
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
function weld(parent, part0, part1, c0, c1)
	local weld = it("Weld")
	weld.Parent = parent
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0
	weld.C1 = c1
	return weld
end
function Damagefunc(Part, hit, minim, maxim, knockback, Type, Property, Delay, KnockbackType, decreaseblock)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChild("Humanoid")
	for _, v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if hit.Parent.Parent:FindFirstChild("Torso") ~= nil then
		h = hit.Parent.Parent:FindFirstChild("Humanoid")
	end
	if hit.Parent.className == "Hat" then
		hit = hit.Parent.Parent:findFirstChild("Head")
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil and hit.Parent.DebounceHit.Value == true then
			return
		end
		local c = Instance.new("ObjectValue")
		c.Name = "creator"
		c.Value = game:service("Players").LocalPlayer
		c.Parent = h
		game:GetService("Debris"):AddItem(c, 0.5)
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil then
			print(block.className)
			if block.className == "NumberValue" and block.Value > 0 then
				blocked = true
				if decreaseblock == nil then
					block.Value = block.Value - 1
				end
			end
			if block.className == "IntValue" and block.Value > 0 then
				blocked = true
				if decreaseblock ~= nil then
					block.Value = block.Value - 1
				end
			end
		end
		if blocked == false then
			--TakeDamage(h, Damage)
			ShowDamage(hit.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		else
			--TakeDamage(h, Damage / 2)
			ShowDamage(hit.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, BrickColor.new("Bright blue").Color)
		end
		if Type == "Knockdown" then
			hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = (hit.Position - (Property.Position + Vector3.new(0, 0, 0))).unit
			local bodvol = Instance.new("BodyVelocity")
			bodvol.velocity = angle * knockback
			bodvol.P = 5000
			bodvol.maxForce = Vector3.new(8000, 8000, 8000)
			bodvol.Parent = hit
			local rl = Instance.new("BodyAngularVelocity")
			rl.P = 3000
			rl.maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000
			rl.angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10))
			rl.Parent = hit
			game:GetService("Debris"):AddItem(bodvol, 0.5)
			game:GetService("Debris"):AddItem(rl, 0.5)
		elseif Type == "Normal" then
			local vp = Instance.new("BodyVelocity")
			vp.P = 500
			vp.maxForce = Vector3.new(math.huge, 0, math.huge)
			if KnockbackType == 1 then
				vp.velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05
			elseif KnockbackType == 2 then
				vp.velocity = Property.CFrame.lookVector * knockback
			end
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end
			game:GetService("Debris"):AddItem(vp, 0.1)
		elseif Type == "Up" then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.velocity = vt(0, 60, 0)
			bodyVelocity.P = 5000
			bodyVelocity.maxForce = Vector3.new(8000, 8000, 8000)
			bodyVelocity.Parent = hit
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
			local rl = Instance.new("BodyAngularVelocity")
			rl.P = 3000
			rl.maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000
			rl.angularvelocity = Vector3.new(math.random(-30, 30), math.random(-30, 30), math.random(-30, 30))
			rl.Parent = hit
			game:GetService("Debris"):AddItem(rl, 0.5)
		elseif Type == "Snare" then
			local bp = Instance.new("BodyPosition")
			bp.P = 2000
			bp.D = 100
			bp.maxForce = Vector3.new(math.huge, math.huge, math.huge)
			bp.position = hit.Parent.Torso.Position
			bp.Parent = hit.Parent.Torso
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Target" then
			local Targetting = false
			if Targetting == false then
				local ZTarget = hit.Parent.Torso
				coroutine.resume(coroutine.create(function(Part)
					so("http://www.roblox.com/asset/?id=15666462", Part, 1, 1.5)
					swait(5)
					so("http://www.roblox.com/asset/?id=15666462", Part, 1, 1.5)
				end), ZTarget)
				local TargHum = ZTarget.Parent:findFirstChild("Humanoid")
				local targetgui = Instance.new("BillboardGui")
				targetgui.Parent = ZTarget
				targetgui.Size = UDim2.new(10, 100, 10, 100)
				local targ = Instance.new("ImageLabel")
				targ.Parent = targetgui
				targ.BackgroundTransparency = 1
				targ.Image = "rbxassetid://4834067"
				targ.Size = UDim2.new(1, 0, 1, 0)
				cam.CameraType = "Scriptable"
				cam.CoordinateFrame = CFrame.new(Head.CFrame.p, ZTarget.Position)
				local dir = Vector3.new(cam.CoordinateFrame.lookVector.x, 0, cam.CoordinateFrame.lookVector.z)
				workspace.CurrentCamera.CoordinateFrame = CFrame.new(Head.CFrame.p, ZTarget.Position)
				Targetting = true
				local RocketTarget = ZTarget
				for i = 1, Property do
					if 0 < TargHum.Health and Character.Parent ~= nil and 0 < TargHum.Health and TargHum.Parent ~= nil and Targetting == true then
						swait()
					end
					cam.CoordinateFrame = CFrame.new(Head.CFrame.p, ZTarget.Position)
					dir = Vector3.new(cam.CoordinateFrame.lookVector.x, 0, cam.CoordinateFrame.lookVector.z)
					cam.CoordinateFrame = CFrame.new(Head.CFrame.p, ZTarget.Position) * cf(0, 5, 10) * euler(-0.3, 0, 0)
				end
				Targetting = false
				RocketTarget = nil
				targetgui.Parent = nil
				cam.CameraType = "Custom"
			end
		end
		local debounce = Instance.new("BoolValue")
		debounce.Name = "DebounceHit"
		debounce.Parent = hit.Parent
		debounce.Value = true
		game:GetService("Debris"):AddItem(debounce, Delay)
		c = Instance.new("ObjectValue")
		c.Name = "creator"
		c.Value = Player
		c.Parent = h
		game:GetService("Debris"):AddItem(c, 0.5)
	end
end
function ShowDamage(Pos, Text, Time, Color)
	local Rate = 0.03333333333333333
	local Pos = Pos or Vector3.new(0, 0, 0)
	local Text = Text or ""
	local Time = Time or 2
	local Color = Color or Color3.new(1, 0, 0)
	local EffectPart = part("Custom", workspace, "Neon", 0, 1, BrickColor.new(Color), "Effect", vt(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Instance.new("BillboardGui")
	BillboardGui.Size = UDim2.new(3, 3, 3, 3)
	BillboardGui.Adornee = EffectPart
	local TextLabel = Instance.new("TextLabel")
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(3, 3, 3, 3)
	TextLabel.Text = Text
	TextLabel.TextColor3 = Color
	TextLabel.TextStrokeColor3 = BrickColor.new("Really black").Color
	TextLabel.TextScaled = true
	TextLabel.TextStrokeTransparency = 0
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Parent = BillboardGui
	BillboardGui.Parent = EffectPart
	game.Debris:AddItem(EffectPart, Time + 0.1)
	EffectPart.Parent = game:GetService("Workspace")
	Delay(0, function()
		local Frames = Time / Rate
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = Frame / Frames
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
			TextLabel.TextStrokeTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end
function LoadOutfit()
	local Player = game.Players.LocalPlayer
	local InsertService = game:GetService("InsertService")
	local char = Player.Character
	local face = char.Head.face
	local color = char["Body Colors"]
	local Data = {
		Pants = "rbxassetid://163845518",
		Shirt = "rbxassetid://225706293",
		Hat = 30380659,
		Face = "rbxassetid://159139241",
		BodyColor = "Pastel brown"
	}
	for i, v in pairs(char:children()) do
		if v.ClassName == "Hat" then
			v:Destroy()
		elseif v.ClassName == "Shirt" then
			v:Destroy()
		elseif v.ClassName == "Pants" then
			v:Destroy()
		end
	end
	color.HeadColor = BrickColor.new("Pastel brown")
	color.TorsoColor = BrickColor.new("Pastel brown")
	color.LeftArmColor = BrickColor.new("Pastel brown")
	color.LeftLegColor = BrickColor.new("Pastel brown")
	color.RightArmColor = BrickColor.new("Pastel brown")
	color.RightLegColor = BrickColor.new("Pastel brown")
	face.Texture = Data.Face
	InsertService:LoadAsset(Data.Hat):children()[1].Parent = char
	local shirt = Instance.new("Shirt", char)
	shirt.ShirtTemplate = Data.Shirt
	local pants = Instance.new("Pants", char)
	pants.PantsTemplate = Data.Pants
end
function MakeOrb(Type)
	local this = {}
	local LightOrDark
	if Type == nil then
		LightOrDark = math.random(0, 1)
	else
		LightOrDark = Type
	end
	local Orb = Instance.new("Part", Orbs)
	Orb.Anchored = true
	Orb.Material = "Neon"
	if LightOrDark == 1 then
		Orb.BrickColor = BrickColor.new("Fucking Gray")
	else
		Orb.BrickColor = BrickColor.new("Fucking Gray")
	end
	Orb.CFrame = torso.CFrame
	Orb.CanCollide = false
	Orb.Shape = "Ball"
	Orb.Size = Vector3.new(0.9, 0.9, 0.9)
	Orb.BottomSurface = "Smooth"
	Orb.TopSurface = "Smooth"
	Orb.Locked = true
	local Outline = Instance.new("Part", Orbs)
	Outline.Anchored = true
	Outline.Material = "Neon"
	if LightOrDark == 1 then
		Outline.BrickColor = BrickColor.new("Fucking Gray")
	else
		Outline.BrickColor = BrickColor.new("Fucking Gray")
	end
	Outline.CFrame = torso.CFrame
	Outline.CanCollide = false
	Outline.Shape = "Ball"
	Outline.Size = Vector3.new(1, 1, 1)
	Outline.BottomSurface = "Smooth"
	Outline.TopSurface = "Smooth"
	Outline.Transparency = 0.75
	Outline.Locked = true
	local OrbWeld = newWeld(Outline, Orb, 0, 0, 0)
	weld = Instance.new("Weld", Orb)
	weld.Part0 = Orb
	weld.Part1 = Outline
	weld.C0 = CFrame.new(0, 0, 0)
	local OrbMesh = Instance.new("SpecialMesh", Orb)
	OrbMesh.MeshType = "Sphere"
	OrbMesh.Scale = Vector3.new(0.9, 0.9, 0.9)
	local OutlineMesh = Instance.new("SpecialMesh", Outline)
	OutlineMesh.MeshType = "Sphere"
	OutlineMesh.Scale = Vector3.new(1, 1, 1)
	function this.Size(v3)
		OrbMesh.Scale = Lerp2(OrbMesh.Scale, v3 - Vector3.new(0.1, 0.1, 0.1), 0.3)
		OutlineMesh.Scale = Lerp2(OutlineMesh.Scale, v3, 0.3)
	end
	function this.CFrame(cf)
		Orb.CFrame = cf
		Outline.CFrame = Orb.CFrame
	end
	return Orb, Outline, this
end
function TailedBeastBomb()
	local this = {}
	local TailedBeastBomb = Instance.new("Model", char)
	local Outer = Instance.new("Part", TailedBeastBomb)
	Outer.Material = "Neon"
	Outer.Name = "Outer"
	Outer.BrickColor = BrickColor.new("Really black")
	Outer.CFrame = CFrame.new(0, 0, 0)
	Outer.Locked = true
	Outer.Size = Vector3.new(4, 4, 4)
	Outer.CanCollide = false
	Outer.Transparency = 0.25
	local OuterMesh = Instance.new("SpecialMesh", Outer)
	OuterMesh.MeshType = "Sphere"
	OuterMesh.Scale = Vector3.new(1, 1, 1)
	local Inner = Instance.new("Part", TailedBeastBomb)
	Inner.Material = "Neon"
	Inner.Name = "Inner"
	Inner.BrickColor = BrickColor.new("Institutional white")
	Inner.CFrame = Outer.CFrame
	Inner.Locked = true
	Inner.Size = Outer.Size - Vector3.new(1, 1, 1)
	Inner.CanCollide = false
	Inner.Transparency = 0.8
	local InnerMesh = Instance.new("SpecialMesh", Inner)
	InnerMesh.MeshType = "Sphere"
	InnerMesh.Scale = Vector3.new(1, 1, 1)
	local InnerOuterWeld = Instance.new("Weld", Inner)
	InnerOuterWeld.Part0 = Inner
	InnerOuterWeld.Part1 = Outer
	InnerOuterWeld.C0 = CFrame.new(0, 0, 0)
	local Core = Instance.new("Part", TailedBeastBomb)
	Core.Material = "Neon"
	Core.Name = "Core"
	Core.BrickColor = BrickColor.new("New Yeller")
	Core.CFrame = Outer.CFrame
	Core.Locked = true
	Core.Size = Inner.Size - Vector3.new(2, 2, 2)
	Core.CanCollide = false
	Core.Shape = 0
	Core.Transparency = 0
	local CoreMesh = Instance.new("SpecialMesh", Core)
	CoreMesh.MeshType = "Sphere"
	CoreMesh.Scale = Vector3.new(1, 1, 1)
	local InnerCoreWeld = Instance.new("Weld", Inner)
	InnerCoreWeld.Part0 = Inner
	InnerCoreWeld.Part1 = Core
	InnerCoreWeld.C0 = CFrame.new(0, 0, 0)
	function this.reSize(v3)
		Outer.Size = Lerp2(Outer.Size, v3, 0.3)
		Inner.Size = Lerp2(Inner.Size, Outer.Size - Vector3.new(1, 1, 1), 0.3)
		Core.Size = Lerp2(Core.Size, Inner.Size - Vector3.new(2, 2, 2), 0.3)
	end
	return Outer, Inner, Core, this
end
function SpawnRasengan(m, cf)
	local Rasengan = Instance.new("Part", m)
	Rasengan.BrickColor = BrickColor.new("Bright blue")
	Rasengan.Material = "Neon"
	Rasengan.Anchored = true
	Rasengan.CFrame = cf or CFrame.new(0, 0, 0)
	Rasengan.CanCollide = false
	Rasengan.CanCollide = true
	Rasengan.BottomSurface = "Smooth"
	Rasengan.TopSurface = "Smooth"
	Rasengan.Locked = true
	Rasengan.Size = Vector3.new(0.9, 0.9, 0.9)
	local RasenganMesh = Instance.new("SpecialMesh", Rasengan)
	RasenganMesh.MeshType = "Sphere"
	local Outline = Instance.new("Part", m)
	Outline.BrickColor = BrickColor.new("Institutional white")
	Outline.Material = "Neon"
	Outline.Transparency = 0.7
	Outline.Anchored = true
	Outline.CanCollide = false
	Outline.CanCollide = true
	Outline.BottomSurface = "Smooth"
	Outline.TopSurface = "Smooth"
	Outline.Locked = true
	Outline.CFrame = Rasengan.CFrame
	Outline.Size = Rasengan.Size + Vector3.new(0.1, 0.1, 0.1)
	local OutlineMesh = Instance.new("SpecialMesh", Outline)
	OutlineMesh.MeshType = "Sphere"
	local RasenWeld = Instance.new("Weld", Rasengan)
	RasenWeld.Part0 = Rasengan
	RasenWeld.Part1 = Outline
	RasenWeld.C0 = CFrame.new(0, 0, 0)
	return Rasengan, Outline
end
function SpawnRasenShurikan(m, cf)
	local Rasengan, Outline = SpawnRasengan(m, cf)
	local this = {}
	local interval = 0
	Rasengan.BrickColor = BrickColor.new("Crimson")
	Outline.BrickColor = BrickColor.new("Really black")
	local Shurikan = Instance.new("Part", m)
	Shurikan.BrickColor = BrickColor.new("Institutional white")
	Shurikan.Material = "Neon"
	Shurikan.Anchored = true
	Shurikan.CanCollide = false
	Shurikan.BottomSurface = "Smooth"
	Shurikan.TopSurface = "Smooth"
	Shurikan.Locked = true
	Shurikan.Size = Vector3.new(1, 1, 1)
	Shurikan.CFrame = Rasengan.CFrame
	local ShurikanMesh = Instance.new("SpecialMesh", Shurikan)
	ShurikanMesh.MeshType = "FileMesh"
	ShurikanMesh.MeshId = "rbxassetid://11376946"
	ShurikanMesh.Scale = Vector3.new(7, 7, 7)
	ShurikanMesh.TextureId = "rbxassetid://269748808"
	function this.Start()
		local Event = game:GetService("RunService").RenderStepped:connect(function()
			interval = interval + 60
			Shurikan.CFrame = Rasengan.CFrame * CFrame.Angles(math.rad(0), math.rad(interval), math.rad(0))
		end)
		this.Connections = Event
	end
	function this.Stop()
		this.Connections:disconnect()
		Shurikan.CFrame = Rasengan.CFrame * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
	end
	return Rasengan, Outline, Shurikan, ShurikanMesh, this
end
function InstanceService()
	local OldInstance = Instance
	local Instance = newproxy(true)
	local Meta = getmetatable(Instance)
	local InstanceData = {
		Properties = {
			__READONLY = {ClassName = "Instance"}
		},
		Methods = {},
		Events = {},
		Private = {
			Registered = {},
			Util = FELOADLIBRARY
		},
		__META = {SERVICE_MODEL_VERSION = "0.1.0"}
	}
	local Properties = InstanceData.Properties
	local Methods = InstanceData.Methods
	local Events = InstanceData.Events
	local Private = InstanceData.Private
	local function CreateEvent(EventName)
		Events[EventName] = {}
		local Signal = Private.Util.CreateSignal()
		local Event = InstanceData.Events[EventName]
		function Event:connect(func)
			local this = {}
			if self ~= Event then
				error("connect must be called with `:`, not `.`", 2)
			end
			if type(func) ~= "function" then
				error("Argument #1 of connect must be a function, got a " .. type(func), 2)
			end
			Signal:connect(func)
			function this:disconnect()
				if self ~= this then
					error("disconnect must be called with `:`, not `.`", 2)
				end
				Signal:disconnect()
			end
			return this
		end
		return Signal
	end
	local CheckSelf = function(self)
		repeat
			if not self then
				return false, [==[":" Expected, got "."]==]
			else
				if not self or type(self) == "table" then
				end
				do return false, [==["userdata or table" Expected, got "" .. type(self) .. ""]==] end
				do break end
				if not self or type(self) ~= "table" then
				end
				return true
			end
		until true
	end
	local function MetaIndex(_table, index)
		if Properties[index] and index:sub(1, 2) ~= "__" then
			return Properties[index]
		elseif Properties.__READONLY[index] then
			return Properties.__READONLY[index]
		elseif Methods[index] then
			return Methods[index]
		elseif Events[index] then
			return Events[index]
		end
	end
	local function MetaNewIndex(_table, index, value)
		if Properties[index] and index:sub(1, 2) ~= "__" and type(value) ~= "function" then
			if index:sub(1, 2) == "__" then
				return error(index .. " is not a valid member of " .. Properties.__READONLY.ClassName)
			else
				Properties[index] = value
			end
		end
	end
	function Methods.register(name, constructor)
		if type(name) ~= "string" then
			error("Argument #1 of register must be a string, got a " .. type(name))
		end
		if type(constructor) ~= "function" then
			error("Argument #2 of register must be a function, got a " .. type(constructor))
		end
		Private.Registered[name] = constructor
	end
	function Methods.new(name, parent, options)
		local Parent
		if type(parent) == "table" then
			if parent[Parent] then
				Parent = options[Parent]
			else
				Parent = nil
			end
		elseif type(parent) == "userdata" then
			Parent = parent
		end
		if Private.Registered[name] then
			return Private.Registered[name](Parent, options)
		else
			return OldInstance.new(name, Parent)
		end
	end
	Meta.__index = MetaIndex
	Meta.__newindex = MetaNewIndex
	Meta.__metatable = "The metatable is locked"
	return Instance
end
function TruthSeekerOrb()
	local O1, O2 = MakeOrb()
	local Orb = newproxy(true)
	local OrbMeta = getmetatable(Orb)
	local OrbProperties = {
		ReadOnly = {
			ClassName = "TruthSeekerOrb",
			_VERSION = "0.1.0"
		},
		Parent = Orbs,
		CFrame = CFrame.new(0, 0, 0),
		Size = Vector3.new(0, 0, 0),
		Touched = O1.Touched,
		Outline = O2
	}
	local OrbPrivateData = {Orb = O1, Outline = O2}
	local OrbMethods = {}
	function OrbMeta.__index(_table, index)
		if OrbProperties[index] then
			if index == "CFrame" then
				return OrbPrivateData.Orb.CFrame
			elseif index == "Size" then
				return OrbPrivateData.Orb.Size
			elseif index == "ReadOnly" then
				return nil
			elseif index == "Parent" then
				return OrbPrivateData.Orb.Parent
			else
				return OrbProperties[index]
			end
		elseif OrbProperties.ReadOnly[index] then
			return OrbProperties.ReadOnly[index]
		elseif OrbMethods[index] then
			return OrbMethods[index]
		end
	end
	function OrbMeta.__newindex(_table, index, value)
		if OrbProperties[index] then
			if not type(value) ~= "function" then
				if index == "CFrame" then
					OrbPrivateData.Orb.CFrame = value
					OrbPrivateData.Outline.CFrame = value
				elseif index == "Size" then
					OrbPrivateData.Orb.Mesh.Scale = Lerp2(OrbPrivateData.Orb.Mesh.Scale, value - Vector3.new(0.1, 0.1, 0.1), 0.3)
					OrbPrivateData.Outline.Mesh.Scale = Lerp2(OrbPrivateData.Outline.Mesh.Scale, value, 0.3)
				elseif index == "Parent" then
					OrbPrivateData.Orb.Parent = value
					OrbPrivateData.Outline.Parent = value
				elseif index == "ReadOnly" then
					return error("can't set protected value")
				else
					OrbProperties[index] = value
				end
			end
		elseif OrbProperties.ReadOnly[index] then
			return error("can't set value")
		end
	end
	local CheckSelf = function(s)
		if not s then
			return false, [==[":" Expected, got "."]==]
		end
		return true, ""
	end
	function OrbMethods:Destroy()
		assert(CheckSelf(self))
		OrbPrivateData.Orb:Destroy()
		OrbPrivateData.Outline:Destroy()
	end
	return Orb
end
function Rasengan(m, options)
	local m = Instance.new("Model", m)
	local r, o = SpawnRasengan(m, options.CFrame or nil)
	local Rasengan = newproxy(true)
	local RasenganMeta = getmetatable(Rasengan)
	local RasenganData = {Rasengan = r, Outline = o}
	local RasenganProperties = {
		__Protected = {ClassName = "Rasengan"},
		Parent = m,
		Size = Vector3.new(0, 0, 0),
		CFrame = CFrame.new(0, 0, 0),
		Transparency = 0
	}
	local RasenganMethods = {}
	local RasenganEvents = {}
	local CreateSignal = function()
		local this = {}
		local mBindableEvent = Instance.new("BindableEvent")
		local mAllCns = {}
		function this:connect(func)
			if self ~= this then
				error("connect must be called with `:`, not `.`", 2)
			end
			if type(func) ~= "function" then
				error("Argument #1 of connect must be a function, got a " .. type(func), 2)
			end
			local cn = mBindableEvent.Event:connect(func)
			mAllCns[cn] = true
			local pubCn = {}
			function pubCn:disconnect()
				cn:disconnect()
				mAllCns[cn] = nil
			end
			return pubCn
		end
		function this:disconnect()
			if self ~= this then
				error("disconnect must be called with `:`, not `.`", 2)
			end
			for cn, _ in pairs(mAllCns) do
				cn:disconnect()
				mAllCns[cn] = nil
			end
		end
		function this:wait()
			if self ~= this then
				error("wait must be called with `:`, not `.`", 2)
			end
			return mBindableEvent.Event:wait()
		end
		function this:fire(...)
			if self ~= this then
				error("fire must be called with `:`, not `.`", 2)
			end
			mBindableEvent:Fire(...)
		end
		return this
	end
	local function CreateEvent(EventName)
		RasenganEvents[EventName] = {}
		local Signal = CreateSignal()
		local Event = RasenganEvents[EventName]
		function Event:connect(func)
			local this = {}
			if self ~= Event then
				error("connect must be called with `:`, not `.`", 2)
			end
			if type(func) ~= "function" then
				error("Argument #1 of connect must be a function, got a " .. type(func), 2)
			end
			Signal:connect(func)
			function this:disconnect()
				if self ~= this then
					error("disconnect must be called with `:`, not `.`", 2)
				end
				Signal:disconnect()
			end
			return this
		end
		return Signal
	end
	local Touched = CreateEvent("Touched")
	local Method = RasenganMethods
	local CheckSelf = function(self)
		if not self then
			return false, [==[":" Expected, got "."]==]
		else
			return true
		end
	end
	function Method:Destroy()
		assert(CheckSelf(self))
		if m then
			m:Destroy()
		end
		if RasenganData.Outline then
			RasenganData.Outline:Destroy()
		end
		if RasenganData.Rasengan then
			RasenganData.Rasengan:Destroy()
		end
	end
	local function Handle_GET_Property(index)
		if index == "Parent" then
			return RasenganData.Rasengan.Parent
		elseif index == "Size" then
			return RasenganData.Rasengan.Size
		elseif index == "CFrame" then
			return RasenganData.Rasengan.CFrame
		elseif index == "Transparency" then
			return RasenganData.Rasengan.Transparency
		end
	end
	local function Handle_SET_Property(index, value)
		if index == "Parent" then
			RasenganData.Rasengan.Parent = value
			RasenganData.Outline.Parent = value
		elseif index == "Size" then
			RasenganData.Rasengan.Size = Lerp2(RasenganData.Rasengan.Size, value - Vector3.new(0.1, 0.1, 0.1) * value, 0.3)
			RasenganData.Outline.Size = Lerp2(RasenganData.Outline.Size, value, 0.3)
		elseif index == "CFrame" then
			RasenganData.Rasengan.CFrame = value
			RasenganData.Outline.CFrame = value
		elseif index == "Transparency" then
			RasenganData.Rasengan.Transparency = value / 0.7
			RasenganData.Outline.Transparency = value / 0.7
		end
	end
	function RasenganMeta.__index(_table, index)
		if RasenganProperties[index] then
			if index:sub(1, 2) == "__" then
				return nil
			else
				return Handle_GET_Property(index)
			end
		elseif RasenganProperties.__Protected[index] then
			return RasenganProperties.__Protected[index]
		elseif RasenganMethods[index] then
			return RasenganMethods[index]
		elseif RasenganEvents[index] then
			return RasenganEvents[index]
		else
			error(index .. " is not a valid member of " .. RasenganProperties.__Protected.ClassName)
		end
	end
	function RasenganMeta.__newindex(_table, index, value)
		if RasenganProperties[index] then
			if not type(value) ~= "function" then
				if index:sub(1, 2) == "__" then
					return error(index .. " is not a valid member of " .. RasenganProperties.__Protected.ClassName)
				else
					Handle_SET_Property(index, value)
				end
			end
		elseif RasenganProperties.__Protected[index] then
			return error("can't set value")
		else
			error(index .. " is not a valid member of " .. RasenganProperties.__Protected.ClassName)
		end
	end
	RasenganMeta.__metatable = "The metatable is locked"
	return Rasengan
end
function RasenShurikan(m, options)
	local m = Instance.new("Model", m)
	local r, o, s, sm, lib = SpawnRasenShurikan(m, options.CFrame or nil)
	local Rasengan = newproxy(true)
	local RasenganMeta = getmetatable(Rasengan)
	local RasenganData = {
		Rasengan = r,
		Outline = o,
		Shurikan = s,
		ShurikanMesh = sm,
		Lib = lib
	}
	local RasenganProperties = {
		__Protected = {ClassName = "Rasengan"},
		Parent = m,
		Size = Vector3.new(0, 0, 0),
		CFrame = CFrame.new(0, 0, 0),
		Transparency = 0,
		Base = r,
		Outline = o
	}
	local RasenganMethods = {}
	local RasenganEvents = {}
	local CreateSignal = function()
		local this = {}
		local mBindableEvent = Instance.new("BindableEvent")
		local mAllCns = {}
		function this:connect(func)
			if self ~= this then
				error("connect must be called with `:`, not `.`", 2)
			end
			if type(func) ~= "function" then
				error("Argument #1 of connect must be a function, got a " .. type(func), 2)
			end
			local cn = mBindableEvent.Event:connect(func)
			mAllCns[cn] = true
			local pubCn = {}
			function pubCn:disconnect()
				cn:disconnect()
				mAllCns[cn] = nil
			end
			return pubCn
		end
		function this:disconnect()
			if self ~= this then
				error("disconnect must be called with `:`, not `.`", 2)
			end
			for cn, _ in pairs(mAllCns) do
				cn:disconnect()
				mAllCns[cn] = nil
			end
		end
		function this:wait()
			if self ~= this then
				error("wait must be called with `:`, not `.`", 2)
			end
			return mBindableEvent.Event:wait()
		end
		function this:fire(...)
			if self ~= this then
				error("fire must be called with `:`, not `.`", 2)
			end
			mBindableEvent:Fire(...)
		end
		return this
	end
	local function CreateEvent(EventName)
		RasenganEvents[EventName] = {}
		local Signal = CreateSignal()
		local Event = RasenganEvents[EventName]
		function Event:connect(func)
			local this = {}
			if self ~= Event then
				error("connect must be called with `:`, not `.`", 2)
			end
			if type(func) ~= "function" then
				error("Argument #1 of connect must be a function, got a " .. type(func), 2)
			end
			Signal:connect(func)
			function this:disconnect()
				if self ~= this then
					error("disconnect must be called with `:`, not `.`", 2)
				end
				Signal:disconnect()
			end
			return this
		end
		return Signal
	end
	local Method = RasenganMethods
	local CheckSelf = function(self)
		if not self then
			return false, [==[":" Expected, got "."]==]
		else
			return true
		end
	end
	function Method:Start()
		assert(CheckSelf(self))
		RasenganData.Lib.Start()
	end
	function Method:Stop()
		assert(CheckSelf(self))
		RasenganData.Lib.Stop()
	end
	function Method:Destroy(t)
		assert(CheckSelf(self))
		if t == "Rasengan" then
			RasenganData.Rasengan:Destroy()
		elseif t == "Outline" then
			RasenganData.Outline:Destroy()
		elseif t == "Shurikan" then
			RasenganData.Shurikan:Destroy()
		else
			if m then
				m:Destroy()
			end
			if RasenganData.Rasengan then
				RasenganData.Rasengan:Destroy()
			end
			if RasenganData.Outline then
				RasenganData.Outline:Destroy()
			end
			if RasenganData.Shurikan then
				RasenganData.Shurikan:Destroy()
			end
		end
	end
	local function Handle_GET_Property(index)
		if index == "Parent" then
			return RasenganData.Rasengan.Parent
		elseif index == "Size" then
			return RasenganData.Rasengan.Size
		elseif index == "CFrame" then
			return RasenganData.Rasengan.CFrame
		elseif index == "Transparency" then
			return RasenganData.Rasengan.Transparency
		else
			return RasenganProperties[index]
		end
	end
	local function Handle_SET_Property(index, value)
		if index == "Parent" then
			RasenganData.Rasengan.Parent = value
			RasenganData.Outline.Parent = value
			RasenganData.Shurikan.Parent = value
		elseif index == "Size" then
			RasenganData.Rasengan.Size = Lerp2(RasenganData.Rasengan.Size, value - Vector3.new(0.1, 0.1, 0.1) * value, 0.3)
			RasenganData.Outline.Size = Lerp2(RasenganData.Outline.Size, value, 0.3)
			RasenganData.ShurikanMesh.Scale = Lerp2(RasenganData.ShurikanMesh.Scale, value * 5.5, 0.3)
		elseif index == "CFrame" then
			RasenganData.Rasengan.CFrame = value
			RasenganData.Outline.CFrame = value
			RasenganData.Shurikan.CFrame = value
		elseif index == "Transparency" then
			RasenganData.Rasengan.Transparency = value / 0.7
			RasenganData.Outline.Transparency = value / 0.7
		end
	end
	function RasenganMeta.__index(_table, index)
		if RasenganProperties[index] then
			if index:sub(1, 2) == "__" then
				return nil
			else
				return Handle_GET_Property(index)
			end
		elseif RasenganProperties.__Protected[index] then
			return RasenganProperties.__Protected[index]
		elseif RasenganMethods[index] then
			return RasenganMethods[index]
		elseif RasenganEvents[index] then
			return RasenganEvents[index]
		else
			error(index .. " is not a valid member of " .. RasenganProperties.__Protected.ClassName)
		end
	end
	function RasenganMeta.__newindex(_table, index, value)
		if RasenganProperties[index] then
			if not type(value) ~= "function" then
				if index:sub(1, 2) == "__" then
					return error(index .. " is not a valid member of " .. RasenganProperties.__Protected.ClassName)
				else
					Handle_SET_Property(index, value)
				end
			end
		elseif RasenganProperties.__Protected[index] then
			return error("can't set value")
		else
			error(index .. " is not a valid member of " .. RasenganProperties.__Protected.ClassName)
		end
	end
	RasenganMeta.__metatable = "The metatable is locked"
	return Rasengan
end
local Instance = InstanceService()
Instance.register("TruthSeekerOrb", TruthSeekerOrb)
Instance.register("Rasengan", Rasengan)
Instance.register("RasenShurikan", RasenShurikan)
newWeld(torso, larm, -1.5, 0.5, 0)
larm.Weld.C1 = CFrame.new(0, 0.5, 0)
newWeld(torso, rarm, 1.5, 0.5, 0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)
newWeld(torso, hed, 0, 1.5, 0)
newWeld(torso, lleg, -0.5, -1, 0)
lleg.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(torso, rleg, 0.5, -1, 0)
rleg.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(root, torso, 0, -1, 0)
torso.Weld.C1 = CFrame.new(0, -1, 0)
local laDef = CFrame.new(-1.5, 0.5, 0)
local raDef = CFrame.new(1.5, 0.5, 0)
local hDef = CFrame.new(0, 1.5, 0)
local tDef = CFrame.new(0, -1, 0)
local llDef = CFrame.new(-0.5, -1, 0)
local rlDef = CFrame.new(0.5, -1, 0)
Orbs = Instance.new("Model", char)
Orbs.Name = "Truthseeker Orbs"
local Orb1 = Instance.new("TruthSeekerOrb")
local Orb2 = Instance.new("TruthSeekerOrb")
local Orb3 = Instance.new("TruthSeekerOrb")
local Orb4 = Instance.new("TruthSeekerOrb")
local Orb5 = Instance.new("TruthSeekerOrb")
local Orb6 = Instance.new("TruthSeekerOrb")
local Orb7 = Instance.new("TruthSeekerOrb")
local Orb8 = Instance.new("TruthSeekerOrb")
local Orbs_ = {
	Orb1 = Orb1,
	Orb2 = Orb2,
	Orb3 = Orb3,
	Orb4 = Orb4,
	Orb5 = Orb5,
	Orb6 = Orb6,
	Orb7 = Orb7,
	Orb8 = Orb8
}
local CurrentHealth = hum.Health
local DebounceShot = false
local OGDesign = 1
function TailedBeastBombAttack()
	hum.WalkSpeed = 0
	Debounces.CanAttack = false
	Debounces.NoIdle = true
	for i = 1, 10 do
		larm.Weld.C0 = Lerp(larm.Weld.C0, laDef * CFrame.Angles(math.rad(0), math.rad(20), math.rad(-80)), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, 45, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.2)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, raDef * CFrame.Angles(math.rad(0), math.rad(-20), math.rad(80)), 0.2)
		hed.Weld.C0 = Lerp(hed.Weld.C0, hDef * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.2)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, llDef * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-20)), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, rlDef * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(20)), 0.2)
		wait()
	end
	function FindNearestTorso(Position, Distance, SinglePlayer)
		if SinglePlayer then
			return Distance > (SinglePlayer.Torso.CFrame.p - Position).magnitude
		end
		local List = {}
		for i, v in pairs(workspace:GetChildren()) do
			if v:IsA("Model") and v:findFirstChild("Torso") and v ~= char and Distance >= (v.Torso.Position - Position).magnitude then
				table.insert(List, v)
			end
		end
		return List
	end
	local Outer, Inner, Core, Control = TailedBeastBomb()
	local SetupWeld = Instance.new("Weld", Inner)
	SetupWeld.Part0 = Inner
	SetupWeld.Part1 = torso
	SetupWeld.C0 = CFrame.new(0, 0, 10)
	wait()
	Core.Anchored = true
	Outer.Anchored = true
	Inner.Anchored = true
	for i = 1, 16 do
		Control.reSize(Lerp2(Outer.Size, Vector3.new(23, 23, 23), 0.3))
		wait()
	end
	wait(0.5)
	for i = 1, 20 do
		larm.Weld.C0 = Lerp(larm.Weld.C0, laDef * CFrame.Angles(math.rad(0), math.rad(-80), math.rad(-80)), 0.2)
		torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, 45, 0) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0)), 0.2)
		rarm.Weld.C0 = Lerp(rarm.Weld.C0, raDef * CFrame.Angles(math.rad(0), math.rad(80), math.rad(80)), 0.2)
		hed.Weld.C0 = Lerp(hed.Weld.C0, hDef * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 0.2)
		lleg.Weld.C0 = Lerp(lleg.Weld.C0, llDef * CFrame.Angles(math.rad(10), math.rad(0), math.rad(-20)), 0.2)
		rleg.Weld.C0 = Lerp(rleg.Weld.C0, rlDef * CFrame.Angles(math.rad(10), math.rad(0), math.rad(20)), 0.2)
		wait()
	end
	SetupWeld:remove()
	Core.Anchored = false
	Outer.Anchored = false
	Inner.Anchored = false
	Shooter = Instance.new("BodyVelocity", Inner)
	Shooter.maxForce = Vector3.new(1, 1, 1) * math.huge
	Shooter.velocity = torso.CFrame.lookVector * 100
	Shooter2 = Instance.new("BodyVelocity", Core)
	Shooter2.maxForce = Vector3.new(1, 1, 1) * math.huge
	Shooter2.velocity = torso.CFrame.lookVector * 100
	Shooter3 = Instance.new("BodyVelocity", Outer)
	Shooter3.maxForce = Vector3.new(1, 1, 1) * math.huge
	Shooter3.velocity = torso.CFrame.lookVector * 100
	Explode = Core.Touched:connect(function(hit)
		if hit ~= char and hit.Name ~= "Outer" and hit.Name ~= "Inner" then
			Inner:Destroy()
			Outer:Destroy()
			do
				local cf = Core.CFrame
				Shooter2:Destroy()
				Core.Anchored = true
				Explode:disconnect()
				Core.Size = Vector3.new(3, 3, 3)
				Core.Touched:connect(function(hit)
				end)
				Core.CanCollide = false
				local part3 = Instance.new("Part", rarm)
				part3.Anchored = true
				part3.CanCollide = false
				part3.Locked = true
				part3.TopSurface = "SmoothNoOutlines"
				part3.BottomSurface = "SmoothNoOutlines"
				part3.FormFactor = "Custom"
				part3.Size = Vector3.new(1, 1, 1)
				part3.CFrame = Core.CFrame
				part3.Transparency = 0
				part3.BrickColor = BrickColor.new("Institutional white")
				local mesh3 = Instance.new("SpecialMesh", part3)
				mesh3.MeshType = "Sphere"
				mesh3.Scale = Vector3.new(1, 1, 1)
				local part4 = Instance.new("Part", rarm)
				part4.Material = "Neon"
				part4.Anchored = true
				part4.CanCollide = false
				part4.Locked = true
				part4.TopSurface = "SmoothNoOutlines"
				part4.BottomSurface = "SmoothNoOutlines"
				part4.FormFactor = "Custom"
				part4.Size = Vector3.new(1, 1, 1)
				part4.CFrame = Core.CFrame
				part4.Transparency = 1
				part4.BrickColor = BrickColor.new("New Yeller")
				local mesh4 = Instance.new("SpecialMesh", part4)
				mesh4.MeshType = "Sphere"
				mesh4.Scale = Vector3.new(0.5, 0.5, 0.5)
				local part7 = Instance.new("Part", rarm)
				part7.Material = "Neon"
				part7.Anchored = true
				part7.CanCollide = false
				part7.Locked = true
				part7.TopSurface = "SmoothNoOutlines"
				part7.BottomSurface = "SmoothNoOutlines"
				part7.FormFactor = "Custom"
				part7.Size = Vector3.new(1, 1, 1)
				part7.CFrame = Core.CFrame
				part7.Transparency = 0
				part7.BrickColor = BrickColor.new("Really black")
				local mesh7 = Instance.new("SpecialMesh", part7)
				mesh7.MeshType = "Sphere"
				mesh7.Scale = Vector3.new(0.1, 0.1, 0.1)
				for i, v in pairs(FindNearestTorso(Core.CFrame.p, 80)) do
					if v:FindFirstChild("Humanoid") then
						Damagefunc(Core, v.Torso, 10, 20, math.random(3, 6), "Normal", RootPart, 0.05, 1)
						v.Humanoid.PlatformStand = true
						v:FindFirstChild("Torso").Velocity = hed.CFrame.lookVector * 100
					end
				end
				local acos = math.acos
				local sqrt = math.sqrt
				local Vec3 = Vector3.new
				local fromAxisAngle = CFrame.fromAxisAngle
				local function toAxisAngle(CFr)
					local X, Y, Z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = CFr:components()
					local Angle = math.acos((R00 + R11 + R22 - 1) / 2)
					local A = (R21 - R12) ^ 2 + (R02 - R20) ^ 2 + (R10 - R01) ^ 2
					A = A == 0 and 1.0E-5 or A
					local B = (R21 - R12) ^ 2 + (R02 - R20) ^ 2 + (R10 - R01) ^ 2
					B = B == 0 and 1.0E-5 or B
					local C = (R21 - R12) ^ 2 + (R02 - R20) ^ 2 + (R10 - R01) ^ 2
					C = C == 0 and 1.0E-5 or C
					local x = (R21 - R12) / sqrt(A)
					local y = (R02 - R20) / sqrt(B)
					local z = (R10 - R01) / sqrt(C)
					return Vec3(x, y, z), Angle
				end
				function ApplyTrig(Num, Func)
					local Min, Max = Func(0), Func(1)
					local i = Func(Num)
					return (i - Min) / (Max - Min)
				end
				function LerpCFrame(CFrame1, CFrame2, Num)
					local Vec, Ang = toAxisAngle(CFrame1:inverse() * CFrame2)
					return CFrame1 * fromAxisAngle(Vec, Ang * Num) + (CFrame2.p - CFrame1.p) * Num
				end
				function Crater(Torso, Radius)
					Spawn(function()
						local Ray = Ray.new(Torso.Position, Vector3.new(0, -1, 0) * 10)
						local Ignore = {}
						for i, v in pairs(game:GetService("Players"):GetPlayers()) do
							if v.Character ~= nil then
								Ignore[#Ignore + 1] = v.Character
							end
						end
						local Hit, Pos, SurfaceNorm = Workspace:FindPartOnRayWithIgnoreList(Ray, Ignore)
						if Hit == nil then
							return
						end
						local Parts = {}
						for i = 1, 360, 10 do
							local P = Instance.new("Part", Torso.Parent)
							P.Anchored = true
							P.FormFactor = "Custom"
							P.BrickColor = BrickColor.new("Really black")
							P.Material = "Neon"
							P.TopSurface = "Smooth"
							P.BottomSurface = "Smooth"
							P.Size = Vector3.new(5, 10, 10) * (math.random(80, 100) / 100)
							P.CFrame = (CFrame.new(Pos, Pos + SurfaceNorm) * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0, 7, 0)) * CFrame.Angles(math.rad(math.random(-50, 50)), math.rad(math.random(-50, 50)), math.rad(math.random(-50, 50)))
							Parts[#Parts + 1] = {
								P,
								P.CFrame,
								(CFrame.new(Pos, Pos + SurfaceNorm) * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0, 1, 0)) * CFrame.Angles(0, math.rad(i), 0) * CFrame.new(0, 0, -Radius) * CFrame.Angles(math.rad(math.random(-50, -20)), math.rad(math.random(-15, 15)), math.rad(math.random(-15, 15))),
								P.Size
							}
							if math.random(0, 5) == 0 then
								local P = Instance.new("Part", Torso.Parent)
								P.Anchored = true
								P.FormFactor = "Custom"
								P.BrickColor = Hit.BrickColor
								P.Material = Hit.Material
								P.TopSurface = "Smooth"
								P.BottomSurface = "Smooth"
								P.Size = Vector3.new(2, 2, 2) * (math.random(80, 100) / 100)
								P.CFrame = (CFrame.new(Pos, Pos + SurfaceNorm) * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0, 2.5, 0)) * CFrame.Angles(math.rad(math.random(-50, 50)), math.rad(math.random(-50, 50)), math.rad(math.random(-50, 50)))
								Parts[#Parts + 1] = {
									P,
									P.CFrame,
									CFrame.new(Pos, Pos + SurfaceNorm) * CFrame.Angles(math.rad(90), 0, 0) * CFrame.Angles(0, math.rad(i), 0) * CFrame.new(0, 0, -Radius - 8) * CFrame.Angles(math.rad(math.random(-90, 90)), math.rad(math.random(-90, 90)), math.rad(math.random(-90, 90))),
									P.Size
								}
							end
						end
						for i = 0, 1, 0.05 do
							for i2, v in pairs(Parts) do
								v[1].CFrame = LerpCFrame(v[2], v[3], ApplyTrig(i, math.cos))
							end
							wait(0.02)
						end
						for i, v in pairs(Parts) do
							if v[1].Size.X > 2.1 then
								v[1].CFrame = v[1].CFrame + Vector3.new(0, 2, 0)
							end
							v[1].Anchored = false
						end
						for i = 0, 1, 0.05 do
							for i2, v in pairs(Parts) do
								v[1].Transparency = i
								if i == 1 then
									v[1]:Destroy()
								elseif i >= 0.25 then
									v[1].CanCollide = false
								end
							end
							wait(0.02)
						end
						Parts = nil
					end)
				end
				function ROW(out, trans, s, wt, t, ang, plus)
					for i = 1, 360, 360 / t do
						local c = Instance.new("Part", game.Workspace)
						c.FormFactor = 3
						c.TopSurface = 0
						c.BottomSurface = 0
						c.Size = s
						c.Anchored = true
						c.CanCollide = wt
						c.Material = "Neon"
						c.Transparency = trans
						c.BrickColor = BrickColor.new("Really black")
						c.CFrame = CFrame.new(Core.CFrame.x, 0, Core.CFrame.z) * CFrame.Angles(math.rad(20), math.rad(i + plus), 0) * CFrame.new(0, 0, out) * ang
						c.Locked = true
						game.Debris:AddItem(c, 15)
					end
				end
				function Part(x, y, z, color, tr, cc, an, parent)
					local p = Instance.new("Part", parent or Weapon)
					p.formFactor = "Custom"
					p.Size = Vector3.new(x, y, z)
					p.BrickColor = BrickColor.new(color)
					p.CanCollide = cc
					p.Transparency = tr
					p.Anchored = an
					p.TopSurface, p.BottomSurface = 0, 0
					p.Locked = true
					p:BreakJoints()
					return p
				end
				function Mesh(par, num, x, y, z)
					local msh = _
					if num == 1 then
						msh = Instance.new("CylinderMesh", par)
					elseif num == 2 then
						msh = Instance.new("SpecialMesh", par)
						msh.MeshType = 3
					elseif num == 3 then
						msh = Instance.new("BlockMesh", par)
					elseif num == 4 then
						msh = Instance.new("SpecialMesh", par)
						msh.MeshType = "Torso"
					elseif type(num) == "string" then
						msh = Instance.new("SpecialMesh", par)
						msh.MeshId = num
					end
					msh.Scale = Vector3.new(x, y, z)
					return msh
				end
				function explosion(col1, col2, cfr, sz, rng, dmg)
					local a = Part(1, 1, 1, col1, 0.5, false, true, workspace)
					local a2 = Part(1, 1, 1, col2, 0.5, false, true, workspace)
					local a3 = Part(1, 1, 1, col2, 0.5, false, true, workspace)
					v1, v2, v3 = sz.x, sz.y, sz.z
					local m = Mesh(a, "http://www.roblox.com/asset/?id=1185246", v1, v2, v3)
					local m2 = Mesh(a2, 3, v1 / 3, v2 / 3, v3 / 3)
					local m3 = Mesh(a3, 3, v1 / 3, v2 / 3, v3 / 3)
					a.CFrame = cfr
					a2.CFrame = cfr * CFrame.Angles(math.random(), math.random(), math.random())
					a3.CFrame = cfr * CFrame.Angles(math.random(), math.random(), math.random())
					Spawn(function()
						while wait() do
							if a.Transparency >= 1 then
								a:Destroy()
								a2:Destroy()
								a3:Destroy()
								break
							end
							m.Scale = m.Scale + Vector3.new(0.1, 0.1, 0.1)
							m2.Scale = m2.Scale + Vector3.new(0.1, 0.1, 0.1)
							m3.Scale = m3.Scale + Vector3.new(0.1, 0.1, 0.1)
							a.Transparency = a.Transparency + 0.05
							a2.Transparency = a2.Transparency + 0.05
							a3.Transparency = a3.Transparency + 0.05
						end
					end)
				end
				local part = Instance.new("Part", rarm)
				part.Anchored = true
				part.CanCollide = false
				part.Locked = true
				part.FormFactor = "Custom"
				part.Size = Vector3.new(1, 1, 1)
				part.CFrame = Core.CFrame * CFrame.new(0, 0, 0)
				part.Transparency = 1
				part.BrickColor = BrickColor.new("Really black")
				local mesh = Instance.new("SpecialMesh", part)
				mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
				mesh.Scale = Vector3.new(2, 2, 2)
				local part2 = part:clone()
				part2.Parent = rarm
				part2.BrickColor = BrickColor.new("Really black")
				local part5 = part:clone()
				part5.Parent = rarm
				part5.BrickColor = BrickColor.new("New Yeller")
				local part6 = part:clone()
				part6.Parent = rarm
				part6.BrickColor = BrickColor.new("Institutional white")
				local mesh2 = mesh:clone()
				mesh2.Parent = part2
				mesh2.Scale = Vector3.new(3, 3, 3)
				local mesh5 = mesh:clone()
				mesh5.Parent = part5
				mesh5.Scale = Vector3.new(3, 3, 3)
				local mesh6 = mesh:clone()
				mesh6.Parent = part6
				mesh6.Scale = Vector3.new(3, 3, 3)
				local blast = Instance.new("Part", rarm)
				blast.BrickColor = BrickColor.new("Really black")
				blast.Anchored = true
				blast.CanCollide = false
				blast.Locked = true
				blast.Size = Vector3.new(1, 1, 1)
				blast.TopSurface = "Smooth"
				blast.BottomSurface = "Smooth"
				blast.Transparency = 0.9
				blast.CFrame = HandCF
				local bm = Instance.new("SpecialMesh", blast)
				bm.Scale = Vector3.new(5, 1, 5)
				bm.MeshId = "rbxassetid://3270017"
				local blast2 = Instance.new("Part", rarm)
				blast2.BrickColor = BrickColor.new("New Yeller")
				blast2.Anchored = true
				blast2.CanCollide = false
				blast2.Locked = true
				blast2.Size = Vector3.new(1, 1, 1)
				blast2.TopSurface = "Smooth"
				blast2.BottomSurface = "Smooth"
				blast2.Transparency = 0.9
				blast2.CFrame = HandCF
				local bm2 = Instance.new("SpecialMesh", blast2)
				bm2.Scale = Vector3.new(3, 1, 3)
				bm2.MeshId = "rbxassetid://3270017"
				local blast3 = Instance.new("Part", rarm)
				blast3.BrickColor = BrickColor.new("Institutional white")
				blast3.Anchored = true
				blast3.CanCollide = false
				blast3.Locked = true
				blast3.Size = Vector3.new(1, 1, 1)
				blast3.TopSurface = "Smooth"
				blast3.BottomSurface = "Smooth"
				blast3.Transparency = 0.9
				blast3.CFrame = HandCF
				local bm3 = Instance.new("SpecialMesh", blast3)
				bm3.Scale = Vector3.new(3, 1, 3)
				bm3.MeshId = "rbxassetid://3270017"
				for i = 1, 120 do
					rs:wait()
					Core.Transparency = Core.Transparency + 0.008333333333333333
					part.Transparency = part.Transparency + 0.008333333333333333
					part2.Transparency = part2.Transparency + 0.008333333333333333
					part3.Transparency = part3.Transparency + 0.008333333333333333
					part4.Transparency = part4.Transparency + 0.008333333333333333
					part5.Transparency = part5.Transparency + 0.008333333333333333
					part6.Transparency = part6.Transparency + 0.008333333333333333
					part7.Transparency = part7.Transparency + 0.008333333333333333
					blast.Transparency = blast.Transparency + 0.008333333333333333
					blast2.Transparency = blast2.Transparency + 0.008333333333333333
					blast3.Transparency = blast3.Transparency + 0.008333333333333333
					Core.Size = Core.Size + Vector3.new(0.8, 0.8, 0.8)
					mesh.Scale = mesh.Scale + Vector3.new(1, 0.2, 1)
					mesh2.Scale = mesh2.Scale + Vector3.new(1.1, 0.2, 1.1)
					mesh3.Scale = mesh3.Scale + Vector3.new(3, 3, 3)
					mesh4.Scale = mesh4.Scale + Vector3.new(1.7, 1.7, 1.7)
					mesh5.Scale = mesh5.Scale + Vector3.new(1.6, 0.2, 1.6)
					mesh6.Scale = mesh6.Scale + Vector3.new(2, 0.2, 2)
					mesh7.Scale = mesh7.Scale + Vector3.new(4, 4, 4)
					bm.Scale = bm.Scale + Vector3.new(6, 6, 0.2)
					bm2.Scale = bm2.Scale + Vector3.new(4, 4, 0.2)
					bm3.Scale = bm3.Scale + Vector3.new(4, 4, 0.2)
					Core.CFrame = cf
					part.CFrame = Core.CFrame * CFrame.Angles(0, math.rad(i * 2), 0)
					part2.CFrame = Core.CFrame * CFrame.Angles(0, math.rad(-i * 2), 0)
					part3.CFrame = Core.CFrame
					part4.CFrame = Core.CFrame
					part7.CFrame = Core.CFrame
					part5.CFrame = Core.CFrame * CFrame.Angles(0, math.rad(i * 2.6), 0)
					part6.CFrame = Core.CFrame * CFrame.Angles(0, math.rad(-i * 2.4), 0)
					blast.CFrame = Core.CFrame * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
					blast2.CFrame = Core.CFrame * CFrame.Angles(math.rad(-i * 4), math.rad(i * 4), math.rad(0))
					blast3.CFrame = Core.CFrame * CFrame.Angles(math.rad(180 + i * 4), math.rad(90 - i * 4), math.rad(0))
					rs:wait()
				end
				Core:Destroy()
				part:Destroy()
				part2:Destroy()
				part3:Destroy()
				part4:Destroy()
				part5:Destroy()
				part6:Destroy()
				part7:Destroy()
				blast:Destroy()
				blast2:Destroy()
				blast3:Destroy()
			end
		end
	end)
	Debounces.CanAttack = true
	Debounces.NoIdle = false
	hum.WalkSpeed = 30
end
function TruthSeekerOrbSheild()
	Debounces.CanAttack = false
	Debounces.NoIdle = true
	Defence = true
	CurrentHealth = hum.Health
	torso.Anchored = true
	Shield = Instance.new("Part", Orbs)
	Shield.Shape = "Ball"
	Shield.CanCollide = true
	Shield.Anchored = true
	Shield.Material = "Neon"
	Shield.Name = "Shield"
	Shield.Locked = true
	Shield.Transparency = 0.3
	Shield.BrickColor = BrickColor.new("Really black")
	Shield.Size = Vector3.new(10.1, 10.1, 10.1)
	Shield.CFrame = torso.CFrame
	function onDamage(Part)
		if Part:findFirstChild("Humanoid") == nil and Part:findFirstChild("BodyVelocity") ~= nil or Part:findFirstChild("Humanoid") == nil and Part:findFirstChild("RocketPropulsion") ~= nil then
			Part.Anchored = true
			if Part:findFirstChild("Mesh") ~= nil then
				z = Part:findFirstChild("Mesh")
				for i = 1, 5 do
					z.Scale = z.Scale + Vector3.new(1, 1, 1)
					wait(0.05)
				end
			end
		end
	end
	Checker = Instance.new("Part", char)
	Checker.Transparency = 0.99
	Checker.Shape = "Ball"
	Checker.Material = "Neon"
	Checker.BrickColor = BrickColor.new("Institutional white")
	Checker.Anchored = false
	Checker.Locked = true
	Checker.CFrame = torso.CFrame
	Checker.CanCollide = false
	Checker.Size = Vector3.new(20, 20, 20)
	newWeld(Checker, torso, 0, 0, 0)
	Checker.Touched:connect(onDamage)
	InnerShield = Instance.new("Part", Orbs)
	InnerShield.CanCollide = true
	InnerShield.Anchored = true
	InnerShield.Material = "Neon"
	InnerShield.Name = "InnerShield"
	InnerShield.Shape = "Ball"
	InnerShield.Locked = true
	InnerShield.BrickColor = BrickColor.new("Royal purple")
	InnerShield.Size = Vector3.new(10, 10, 10)
	InnerShield.CFrame = Shield.CFrame
	newWeld(InnerShield, Shield, 0, 0, 0)
	newWeld(Shield, torso, 0, 0, 0)
	spawn(function()
		while Defence == true do
			hum.Health = CurrentHealth
			hum.WalkSpeed = 0
			wait()
		end
	end)
	for i = 1, 16 do
		for i, v in pairs(Orbs:children()) do
			if v:IsA("Part") and v.Name ~= "InnerShield" and v.Name ~= "Shield" then
				v.Transparency = v.Transparency + 0.1
			end
		end
		wait()
	end
end
function TruthSeekerOrbSheildUp()
	Defence = false
	Debounces.CanAttack = true
	Debounces.NoIdle = false
	Shield.CanCollide = false
	InnerShield.CanCollide = false
	for i = 1, 16 do
		Shield.Transparency = Shield.Transparency + 0.1
		InnerShield.Transparency = InnerShield.Transparency + 0.1
		wait()
	end
	Shield:Destroy()
	Checker:Destroy()
	torso.Anchored = false
	InnerShield:Destroy()
	hum.WalkSpeed = 30
	for i = 1, 16 do
		for i, v in pairs(Orbs:children()) do
			if v:IsA("Part") then
				v.Transparency = v.Transparency - 0.1
			end
		end
		wait()
	end
end
function TruthSeekerOrbAttack()
	local selected = math.random(1, 8)
	local Orb = Orbs_["Orb" .. selected]
	local Outline = Orb.Outline
	local nPos
	local sound = Instance.new("Sound", hed)
	sound.SoundId = "rbxassetid://553462044"
	sound.Volume = 0.35
	sound.Pitch = 1.4 + math.random() / 5
	sound:play()
	game:service("Debris"):AddItem(sound, 5)
	if Debounces["OrbMove" .. selected] == true then
		return
	end
	Debounces["OrbMove" .. selected] = true
	for i = 1, 12 do
		Orb.CFrame = Lerp(Outline.CFrame, Mau5.Hit, 0.3)
		nPos = Outline.CFrame.p
		wait()
	end
    Orb.Touched:connect(function(hit)
        if hit.Parent and hit.Parent:FindFirstChildOfClass'Humanoid' and hit.Parent.Name ~= game:service'Players'.LocalPlayer.Name and Debounces["OrbMove" .. selected] == true then
            --hit.Parent:FindFirstChildOfClass'Humanoid':TakeDamage(hit.Parent:FindFirstChildOfClass'Humanoid'.MaxHealth/2/2/2/2/2)
        end
    end)
	Debounces["OrbMove" .. selected] = false
	wait(0.1)
end
local origHealth = {}
local OrbOfHealingEquipped = false
local OrbOfDiscordEquipped = false
local Darkness = Instance.new("Sound", char.Torso)
Darkness.SoundId = "rbxassetid://418097747"
Darkness.Volume = 0.8
local Healing = Instance.new("Sound", char.Torso)
Healing.SoundId = "rbxassetid://418097928"
Healing.Volume = 0.8
function OrbOfDiscord(Target)
	if Target.Parent:IsA("Accessory") then
		Target = Target.Parent
	end
	local tplr = game:service("Players"):GetPlayerFromCharacter(Target)
	if tplr and tplr.TeamColor == p.TeamColor then
		return
	end
	if OrbOfDiscordEquipped == Target.Parent then
		print("same target?")
		return
	end
	if OrbOfHealingEquipped == Target.Parent then
		OrbOfHealingEquipped = false
	end
	if Target.Parent:findFirstChild("ForceField") then
		OrbOfDiscordEquipped = false
		return
	end
	OrbOfDiscordEquipped = Target.Parent
	local OD1, OD2 = MakeOrb(1)
	OD1.BrickColor = BrickColor.new("Royal purple")
	OD2.BrickColor = BrickColor.new("Really black")
	OD1.Parent = Target.Parent
	OD2.Parent = Target.Parent
	if not origHealth[Target.Parent] then
		origHealth[Target.Parent] = Target.Parent:findFirstChild("Humanoid").MaxHealth
	end
	Darkness:Play()
	spawn(function()
		while wait(0.2) and OrbOfDiscordEquipped == Target.Parent do
			Target.Parent:FindFirstChild("Humanoid").MaxHealth = origHealth[Target.Parent] * 0.7
			if OrbOfDiscordEquipped == false or OrbOfDiscordEquipped ~= Target.Parent then
				break
			end
			local chars = {}
			for i, v in pairs(workspace:children()) do
				if v:FindFirstChild("Humanoid") then
					table.insert(chars, v)
				end
			end
			local hit, pos, surfaceNormal = workspace:FindPartOnRayWithIgnoreList(Ray.new(root.Position, Target.Parent:FindFirstChild("HumanoidRootPart").Position - root.Position), {
				char,
				unpack(chars)
			})
			if hit then
				print("Line of sight broken!")
				OrbOfDiscordEquipped = false
				break
			end
		end
	end)
	while wait() and OrbOfDiscordEquipped == Target.Parent do
		OD1.CFrame = Lerp(OD1.CFrame, Target.Parent.Torso.CFrame * CFrame.new(3, 3 + math.sin(angle2) * 0.32, 2), 0.3)
		OD2.CFrame = Lerp(OD2.CFrame, Target.Parent.Torso.CFrame * CFrame.new(3, 3 + math.sin(angle2) * 0.32, 2), 0.3)
		if OrbOfDiscordEquipped == false then
			break
		end
	end
	local prevHealth = Target.Parent:FindFirstChild("Humanoid").Health
	Target.Parent:FindFirstChild("Humanoid").MaxHealth = origHealth[Target.Parent]
	Target.Parent:FindFirstChild("Humanoid").Health = prevHealth / (origHealth[Target.Parent] * 0.7) * origHealth[Target.Parent]
	OD1:Destroy()
	OD2:Destroy()
	if OrbOfDiscordEquipped == Target.Parent then
		OrbOfDiscordEquipped = false
	end
end
function OrbOfHealing(Target)
	if Target.Parent:IsA("Accessory") then
		Target = Target.Parent
	end
	local tplr = game:service("Players"):GetPlayerFromCharacter(Target)
	if tplr and tplr.TeamColor ~= p.TeamColor then
		return
	end
	if OrbOfHealingEquipped == Target.Parent then
		return
	end
	if OrbOfDiscordEquipped == Target.Parent then
		OrbOfDiscordEquipped = false
	end
	if OrbOfHealingEquipped ~= false then
		OrbOfHealingEquipped = false
		wait()
	end
	if Target.Parent:findFirstChild("ForceField") then
		OrbOfHealingEquipped = false
		return
	end
	OrbOfHealingEquipped = Target.Parent
	local OH1, OH2 = MakeOrb(1)
	OH1.BrickColor = BrickColor.new("New Yeller")
	OH2.BrickColor = BrickColor.new("Institutional white")
	OH1.Parent = Target.Parent
	OH2.Parent = Target.Parent
	Healing:Play()
	spawn(function()
		while wait(1) and OrbOfHealingEquipped == Target.Parent do
			Target.Parent:FindFirstChild("Humanoid").Health = Target.Parent:FindFirstChild("Humanoid").Health + 5
			if OrbOfHealingEquipped == false then
				break
			end
		end
	end)
	spawn(function()
		while wait(0.2) do
			local chars = {}
			for i, v in pairs(workspace:children()) do
				if v:FindFirstChild("Humanoid") then
					table.insert(chars, v)
				end
			end
			local hit, pos, surfaceNormal = workspace:FindPartOnRayWithIgnoreList(Ray.new(root.Position, Target.Parent:FindFirstChild("HumanoidRootPart").Position - root.Position), {
				char,
				unpack(chars)
			})
			if hit then
				print("Line of sight broken!")
				OrbOfHealingEquipped = false
				break
			end
		end
	end)
	while OrbOfHealingEquipped do
		OH1.CFrame = Lerp(OH1.CFrame, Target.Parent.Torso.CFrame * CFrame.new(3, 1.8 + math.sin(angle2) * 0.32, 2), 0.3)
		OH2.CFrame = Lerp(OH2.CFrame, Target.Parent.Torso.CFrame * CFrame.new(3, 1.8 + math.sin(angle2) * 0.32, 2), 0.3)
		if OrbOfHealingEquipped == false then
			break
		end
		wait()
	end
	OH1:Destroy()
	OH2:Destroy()
	OrbOfHealingEquipped = false
end
Mau5.KeyDown:connect(function(key)
	if key == "g" then
	TailedBeastBombAttack()
	elseif key == "q" then
	SpawnRasenShurikan(workspace)
	end
	if key == "e" then
		local Targ = Mau5.Target
		Debounces.NoIdle = true
		for i = 1, 5 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(math.random(60, 90)), math.rad(math.random(-20, 20)), math.rad(20)), 0.8)
			larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.8)
			hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(0), 0, math.rad(0))
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-1.5, -1, -0.5) * angles(1.2 - 0.1 * math.cos(i / 7), 0, 1.3), 0.8)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(1.5, -1, -0.5) * angles(1.3 - 0.1 * math.cos(i / 7), 0, -1.2), 0.8)
			torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(i / 7), 0) * cn(0, 1 - 0.1 * math.cos(i / 7), 0) * angles(math.rad(0), 0.5, 0), 0.8)
			wait()
		end
		Debounces.NoIdle = false
		print(Targ.Parent:FindFirstChild("Humanoid"))
		if Targ and Targ.Parent and Targ.Parent:FindFirstChild("Humanoid") then
			OrbOfHealing(Targ.Parent:FindFirstChild("Torso") or Targ.Parent:FindFirstChild("UpperTorso"))
		end
		if Targ and Targ.Parent:IsA("Accessory") and Targ.Parent.Parent:FindFirstChild("Humanoid") then
			OrbOfHealing(Targ.Parent.Parent:FindFirstChild("Torso") or Targ.Parent.Parent:FindFirstChild("UpperTorso"))
		end
	end
	if key == "f" then
		local Targ = Mau5.Target
		Debounces.NoIdle = true
		for i = 1, 5 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(math.random(60, 90)), math.rad(math.random(-20, 20)), math.rad(20)), 0.8)
			larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.8)
			hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(0), 0, math.rad(0))
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-1.5, -1, -0.5) * angles(1.2 - 0.1 * math.cos(i / 7), 0, 1.3), 0.8)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(1.5, -1, -0.5) * angles(1.3 - 0.1 * math.cos(i / 7), 0, -1.2), 0.8)
			torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(i / 7), 0) * cn(0, 1 - 0.1 * math.cos(i / 7), 0) * angles(math.rad(0), 0.5, 0), 0.8)
			wait()
		end
		Debounces.NoIdle = false
		print(Targ.Parent:FindFirstChild("Humanoid"))
		if Targ and Targ.Parent and Targ.Parent:FindFirstChild("Humanoid") then
			OrbOfDiscord(Targ.Parent:FindFirstChild("Torso") or Targ.Parent:FindFirstChild("UpperTorso"))
		end
		if Targ and Targ.Parent:IsA("Accessory") and Targ.Parent.Parent:FindFirstChild("Humanoid") then
			OrbOfDiscord(Targ.Parent.Parent:FindFirstChild("Torso") or Targ.Parent.Parent:FindFirstChild("UpperTorso"))
		end
	end
end)
Mau5.KeyUp:connect(function(key)
end)
WhichHand = 0
Mau5.Button1Down:connect(function()
	if DebounceShot == false and Debounces.NoIdle == false then
		Debounces.NoIdle = true
		if WhichHand == 0 then
			for i = 1, 5 do
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(math.random(60, 90)), math.rad(math.random(-20, 20)), math.rad(20)), 0.8)
				larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.8)
				hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(0), 0, math.rad(0))
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-1.5, -1, -0.5) * angles(1.2 - 0.1 * math.cos(i / 7), 0, 1.3), 0.8)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(1.5, -1, -0.5) * angles(1.3 - 0.1 * math.cos(i / 7), 0, -1.2), 0.8)
				torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(i / 7), 0) * cn(0, 1 - 0.1 * math.cos(i / 7), 0) * angles(math.rad(0), 0.5, 0), 0.8)
				wait()
			end
			WhichHand = 1
			Debounces.NoIdle = false
			TruthSeekerOrbAttack()
		else
			for i = 1, 5 do
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.8)
				larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-1.5, 0.5 - 0.1 * math.cos(i / 7) + math.sin(i / 7) / 7, 0) * angles(0 - 0.1 * math.cos(i / 7), 0, 0) * angles(math.rad(math.random(60, 90)), math.rad(math.random(-20, 20)), math.rad(20)), 0.8)
				hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(0), 0, math.rad(0))
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-1.5, -1, -0.5) * angles(1.2 - 0.1 * math.cos(i / 7), 0, 1.3), 0.8)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(1.5, -1, -0.5) * angles(1.3 - 0.1 * math.cos(i / 7), 0, -1.2), 0.8)
				torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(i / 7), 0) * cn(0, 1 - 0.1 * math.cos(i / 7), 0) * angles(math.rad(0), -0.5, 0), 0.8)
				wait()
			end
			WhichHand = 0
			Debounces.NoIdle = false
			TruthSeekerOrbAttack()
		end
	end
end)
local sine = 0
local twirl = 0
local change = 1
angle = 0
angle2 = 0
angle3 = 0
anglespeed = 2
anglespeed2 = 1
anglespeed3 = 0.4
game:GetService("RunService").RenderStepped:connect(function()
	angle = angle % 100 + anglespeed / 10
	angle2 = angle2 % 100 + anglespeed2 / 10
	angle3 = angle3 % 100 + anglespeed3 / 10
	char.Humanoid.FreeFalling:connect(function(f)
		if f then
			ffing = true
		else
			ffing = false
		end
	end)
	if Debounces.Anger == false then
		if Debounces.OrbMove1 == false then
			Orb1.CFrame = Lerp(Orb1.CFrame, torso.CFrame * CFrame.new(0, 3 + math.sin(angle2) * 0.2, 2), 0.04)
		end
		if Debounces.OrbMove2 == false then
			Orb2.CFrame = Lerp(Orb2.CFrame, torso.CFrame * CFrame.new(0, -3 + math.sin(angle2) * 0.32, 2), 0.03)
		end
		if Debounces.OrbMove3 == false then
			Orb3.CFrame = Lerp(Orb3.CFrame, torso.CFrame * CFrame.new(3, 0 + math.sin(angle2) * 0.22, 2), 0.06)
		end
		if Debounces.OrbMove4 == false then
			Orb4.CFrame = Lerp(Orb4.CFrame, torso.CFrame * CFrame.new(-3, 0 + math.sin(angle2) * 0.12, 2), 0.08)
		end
		if Debounces.OrbMove5 == false then
			Orb5.CFrame = Lerp(Orb5.CFrame, torso.CFrame * CFrame.new(-2, -2 + math.sin(angle2) * 0.12, 2), 0.07)
		end
		if Debounces.OrbMove6 == false then
			Orb6.CFrame = Lerp(Orb6.CFrame, torso.CFrame * CFrame.new(-2, 2 + math.sin(angle2) * 0.12, 2), 0.4)
		end
		if Debounces.OrbMove7 == false then
			Orb7.CFrame = Lerp(Orb7.CFrame, torso.CFrame * CFrame.new(2, 2 + math.sin(angle2) * 0.12, 2), 0.2)
		end
		if Debounces.OrbMove8 == false then
			Orb8.CFrame = Lerp(Orb8.CFrame, torso.CFrame * CFrame.new(2, -2 + math.sin(angle2) * 0.12, 2), 0.05)
		end
	else
		if Debounces.OrbMove1 == false then
			Orb1.CFrame = Lerp(Orb1.CFrame, torso.CFrame * CFrame.new(0, 3 + math.sin(angle2) * 0.2, 2) * CFrame.new(math.sin(angle / 6), math.tan(angle2 / 6), math.cos(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.04)
		end
		if Debounces.OrbMove2 == false then
			Orb2.CFrame = Lerp(Orb2.CFrame, torso.CFrame * CFrame.new(0, -3 + math.sin(angle2) * 0.32, 2) * CFrame.new(math.sin(angle / 6), math.tan(angle2 / 6), math.cos(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.03)
		end
		if Debounces.OrbMove3 == false then
			Orb3.CFrame = Lerp(Orb3.CFrame, torso.CFrame * CFrame.new(3, 0 + math.sin(angle2) * 0.22, 2) * CFrame.new(math.tan(angle / 6), math.sin(angle2 / 6), math.cos(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.06)
		end
		if Debounces.OrbMove4 == false then
			Orb4.CFrame = Lerp(Orb4.CFrame, torso.CFrame * CFrame.new(-3, 0 + math.sin(angle2) * 0.12, 2) * CFrame.new(math.tan(angle / 6), math.sin(angle2 / 6), math.cos(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.08)
		end
		if Debounces.OrbMove5 == false then
			Orb5.CFrame = Lerp(Orb5.CFrame, torso.CFrame * CFrame.new(-2, -2 + math.sin(angle2) * 0.12, 2) * CFrame.new(math.tan(angle / 6), -math.tan(angle2 / 6), math.cos(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.07)
		end
		if Debounces.OrbMove6 == false then
			Orb6.CFrame = Lerp(Orb6.CFrame, torso.CFrame * CFrame.new(-2, 2 + math.sin(angle2) * 0.12, 2) * CFrame.new(math.tan(angle / 6), math.tan(angle2 / 6), math.cos(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.4)
		end
		if Debounces.OrbMove7 == false then
			Orb7.CFrame = Lerp(Orb7.CFrame, torso.CFrame * CFrame.new(2, 2 + math.sin(angle2) * 0.12, 2) * CFrame.new(math.cos(angle / 6), math.tan(angle2 / 6), math.tan(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.2)
		end
		if Debounces.OrbMove8 == false then
			Orb8.CFrame = Lerp(Orb8.CFrame, torso.CFrame * CFrame.new(2, -2 + math.sin(angle2) * 0.12, 2) * CFrame.new(math.cos(angle / 6), -math.tan(angle2 / 6), math.tan(angle3 / 6)) * CFrame.Angles(math.sin(angle / 6), math.tan(angle2 / 6), math.floor(angle3 / 6)), 0.05)
		end
	end
	sine = sine + change
	if jumpn == true then
		animpose = "Jumping"
	elseif ffing == true then
		animpose = "Freefalling"
	elseif 2 > (torso.Velocity * Vector3.new(1, 0, 1)).magnitude then
		animpose = "Idle"
	elseif (torso.Velocity * Vector3.new(1, 0, 1)).magnitude < 20 then
		animpose = "Walking"
	elseif (torso.Velocity * Vector3.new(1, 0, 1)).magnitude > 20 then
		animpose = "Running"
	end
	if animpose ~= lastanimpose then
		sine = 0
		if Debounces.NoIdle ~= false or animpose == "Idle" then
		elseif animpose == "Walking" then
		else
			if animpose == "Running" then
			else
			end
		end
	end
	lastanimpose = animpose
	if Debounces.NoIdle == false then
		if animpose == "Idle" then
			change = 0.5
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(1.5, 0.5 - 0.1 * math.cos(sine / 7) + math.sin(sine / 7) / 7, 0) * angles(0 - 0.1 * math.cos(sine / 7), 0, 0) * angles(math.rad(0), math.rad(180), math.rad(-30)), 0.2)
			larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-1.5, 0.5 - 0.1 * math.cos(sine / 7) + math.sin(sine / 7) / 7, 0) * angles(0 - 0.1 * math.cos(sine / 7), 0, 0) * angles(math.rad(0), math.rad(180), math.rad(30)), 0.2)
			hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(0), 0, math.rad(0))
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-1.5, -1, -0.5) * angles(1.2 - 0.1 * math.cos(sine / 7), 0, 1.3), 0.4)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(1.5, -1, -0.5) * angles(1.3 - 0.1 * math.cos(sine / 7), 0, -1.2), 0.4)
			torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(sine / 7), 0) * cn(0, 1 - 0.1 * math.cos(sine / 7), 0) * angles(math.rad(0), 0, 0), 0.2)
		elseif animpose == "Walking" then
			change = 0.5
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(1.5, 0.5 - 0.1 * math.cos(sine / 7) + math.sin(sine / 7) / 7, 0) * angles(0 - 0.1 * math.cos(sine / 7), 0, 0) * angles(math.rad(0), math.rad(180), math.rad(-30)), 0.2)
			larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-1.5, 0.5 - 0.1 * math.cos(sine / 7) + math.sin(sine / 7) / 7, 0) * angles(0 - 0.1 * math.cos(sine / 7), 0, 0) * angles(math.rad(0), math.rad(180), math.rad(30)), 0.2)
			hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(0), 0, math.rad(0))
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-1.5, -1, -0.5) * angles(1.2 - 0.1 * math.cos(sine / 7), 0, 1.3), 0.4)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(1.5, -1, -0.5) * angles(1.3 - 0.1 * math.cos(sine / 7), 0, -1.2), 0.4)
			torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(sine / 7), 0) * cn(0, 1 - 0.1 * math.cos(sine / 7), 0) * angles(math.rad(0), 0, 0), 0.2)
		elseif animpose == "Running" then
			change = 0.5
			twirl = twirl + 1
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, cn(0.7, 0.5 - 0.1 * math.cos(sine / 7) + math.sin(sine / 7) / 7, -0.5) * angles(1.2 - 0.1 * math.cos(sine / 7), 0, -1.3), 0.2)
			larm.Weld.C0 = Lerp(larm.Weld.C0, cn(-0.7, 0.5 - 0.1 * math.cos(sine / 7) + math.sin(sine / 7) / 7, -0.5) * angles(1.3 - 0.1 * math.cos(sine / 7), 0, 1.2), 0.2)
			hed.Weld.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(10), 0.5, math.rad(0))
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.4)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.4)
			torso.Weld.C0 = Lerp(torso.Weld.C0, cn(0, -1.5 - 0.1 * math.cos(sine / 7), 0) * cn(0, 1 - 0.1 * math.cos(sine / 4), 0) * angles(math.rad(-90), 0, 0) * angles(0, sine / 10, 0), 0.5)
		elseif animpose == "Freefalling" then
			change = 0.5
		end
	end
end)
