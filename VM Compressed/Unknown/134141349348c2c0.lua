--[[
scp 106
--]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()


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

wait(1 / 60)
Effects = { }
local Player = game.Players.localPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local mouse = Player:GetMouse()
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Head = Character.Head
local Torso = Character.Torso
local cam = game.Workspace.CurrentCamera
local RootPart = Character.HumanoidRootPart
local RootJoint = RootPart.RootJoint
local equipped = false
local attack = false
local Anim = 'Idle'
local idle = 0
local attacktype = 1
local Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local velocity = RootPart.Velocity.y
local sine = 0
local change = 1
local grabbed = false
local cn = CFrame.new
local mr = math.rad
local angles = CFrame.Angles
local ud = UDim2.new
local c3 = Color3.new
local autofind = false
local NeckCF = cn(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
Humanoid.Animator:Destroy()
Character.Animate:Destroy()
EFS = Instance.new("Sound")
EFS.Parent = Torso
EFS.SoundId = "rbxassetid://"
EFS.Volume = 4
EFS.Looped = false
EFS:Play()
EFS2 = Instance.new("Sound")
EFS2.Parent = Torso
EFS2.SoundId = "rbxassetid://177339878"
EFS2.Volume = 0.2
EFS2.Looped = true
EFS2:Play()
EFS3 = Instance.new("Sound")
EFS3.Parent = Torso
EFS3.SoundId = "rbxassetid://585364476"
EFS3.Volume = 0.8
EFS3.Looped = false



ATS = Instance.new("Sound")
ATS.Parent = Torso
ATS.SoundId = "rbxassetid://347611423"
ATS.Volume = 2
ATS.Looped = false


ff = Instance.new("ForceField", game.Players.LocalPlayer.Character)
ff.Visible = false


Character.Humanoid.WalkSpeed = 3



local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)

RSH, LSH = nil, nil 

RW = Instance.new("Weld") 
LW = Instance.new("Weld")

RH = Torso["Right Hip"]
LH = Torso["Left Hip"]

RSH = Torso["Right Shoulder"] 
LSH = Torso["Left Shoulder"] 

RSH.Parent = nil 
LSH.Parent = nil 

RW.Name = "RW"
RW.Part0 = Torso 
RW.C0 = cn(1.5, 0.5, 0)
RW.C1 = cn(0, 0.5, 0) 
RW.Part1 = RightArm
RW.Parent = Torso 

LW.Name = "LW"
LW.Part0 = Torso 
LW.C0 = cn(-1.5, 0.5, 0)
LW.C1 = cn(0, 0.5, 0) 
LW.Part1 = LeftArm
LW.Parent = Torso 

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
	local startInterp, finishInterp; 
	if cosTheta >= 0.0001 then 
		if (1 - cosTheta) > 0.0001 then 
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1 / math.sin(theta) 
			startInterp = math.sin((1 - t) * theta) * invSinTheta 
			finishInterp = math.sin(t * theta) * invSinTheta  
		else 
			startInterp = 1 - t 
			finishInterp = t 
		end 
	else 
		if (1 + cosTheta) > 0.0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1 / math.sin(theta) 
			startInterp = math.sin((t - 1) * theta) * invSinTheta 
			finishInterp = math.sin(t * theta) * invSinTheta 
		else 
			startInterp = t - 1 
			finishInterp = t 
		end 
	end 
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp 
end

function swait(num)
	if num == 0 or num == nil then
		game:service'RunService'.RenderStepped:wait(0)
	else
		for i = 0, num do
			game:service'RunService'.RenderStepped:wait(0)
		end
	end
end

local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
	
function CreatePart(FormFactor, Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part"){
		formFactor = FormFactor,
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
	
function CreateWeld(Parent, Part0, Part1, C0, C1)
	local Weld = Create("Weld"){
		Parent = Parent,
		Part0 = Part0,
		Part1 = Part1,
		C0 = C0,
		C1 = C1,
	}
	return Weld
end

function rayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

function CreateSound(id, par, vol, pit) 
	coroutine.resume(coroutine.create(function()
		local sou = Instance.new("Sound", par or workspace)
		sou.Volume = vol
		sou.Pitch = pit or 1
		sou.SoundId = id
		wait() 
		sou:play() 
		game:GetService("Debris"):AddItem(sou, 6)
	end))
end

local function getclosest(obj, distance)
	local last, lastx = distance + 1
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA'Model' and v ~= Character and v:findFirstChild('Humanoid') and v:findFirstChild('Torso') and v:findFirstChild('Humanoid').Health > 0 then
			local t = v.Torso
			local dist = (t.Position - obj.Position).magnitude
			if dist <= distance then
				if dist < last then
					last = dist
					lastx = v
				end
			end
		end
	end
	return lastx
end

function Damage(hit, damage, cooldown, Color1, Color2, HSound, HPitch)

end


function BlockEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
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
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "nil", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function RingEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.new(x1, y1, z1)
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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

function CylinderEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
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
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "24388358", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "nil", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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


	

	for i = 0, 1, 0.05 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(5), math.rad(0), math.rad(0)), .1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(5), math.rad(0), math.rad(5)), 0.1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
		if Torsovelocity > 2 then
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-50 * math.cos(sine / 4)), math.rad(0), math.rad(4 * math.cos(sine / 4))), .2)
		RH.C0 = clerp(RH.C0, cn(1, -1 + .1 * math.cos(sine / 5), 0) * RHCF * angles(math.rad(-2), math.rad(0), math.rad(30 * math.cos(sine / 4))), .3)
		LH.C0 = clerp(LH.C0, cn(-1, -1 + .1 * math.cos(sine / 5), 0) * LHCF * angles(math.rad(-2), math.rad(0), math.rad(30 * math.cos(sine / 4))), .3)
		elseif Torsovelocity < 1 then
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(5), math.rad(0), math.rad(5)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-2), math.rad(5), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(-2), math.rad(5), math.rad(0)), .1)
		end
	end
	attack = false



game:GetService'RunService'.Stepped:connect(function()
	Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
	velocity = RootPart.Velocity.y
	sine = sine + change
	local hit, pos = rayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, Character)
	if equipped == true or equipped == false then
		if RootPart.Velocity.y > 1 and hit == nil then 
			Anim = "Jump"
			if attack == false then
					RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0, 0, 0) * angles(math.rad(-5), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-40), math.rad(0), math.rad(30)), .1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-40), math.rad(0), math.rad(-30)), .1)
					RH.C0 = clerp(RH.C0, cn(1, -.9, -.3) * RHCF * angles(math.rad(3), math.rad(0), math.rad(0)), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -.7, -.5) * LHCF * angles(math.rad(-3), math.rad(0), math.rad(0)), .1)
			end
		elseif RootPart.Velocity.y < -1 and hit == nil then 
			Anim = "Fall"
			if attack == false then
					RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0, 0, 0) * angles(math.rad(10), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-20), math.rad(0), math.rad(50)), .1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-20), math.rad(0), math.rad(-50)), .1)
					RH.C0 = clerp(RH.C0, cn(1, -1, -.3) * RHCF * angles(math.rad(-5), math.rad(0), math.rad(0)), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -.8, -.3) * LHCF * angles(math.rad(-5), math.rad(0), math.rad(0)), .1)
			end
		elseif Torsovelocity < 1 and hit ~= nil then
			Anim = "Idle"
			if attack == false then
				change = .3
					RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0, 0, -0.1 + 0.05 * math.cos(sine / 25)) * angles(math.rad(0), math.rad(0), math.rad(5)), .05)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25 - 1 * math.cos(sine / 25)), math.rad(0), math.rad(-5)), .05)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(5 + 3 * math.cos(sine / 25))), 0.05)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(-5 - 3 * math.cos(sine / 25))), 0.05)
					RH.C0 = clerp(RH.C0, cn(1, -.9 - 0.05 * math.cos(sine / 25), 0) * RHCF * angles(math.rad(-2 + 1 * math.cos(sine / 25)), math.rad(-2), math.rad(0 + 0 * math.cos(sine / 25))), .05)
					LH.C0 = clerp(LH.C0, cn(-1, -.9 - 0.05 * math.cos(sine / 25), 0) * LHCF * angles(math.rad(-2 + 1 * math.cos(sine / 25)), math.rad(-2), math.rad(0 + 0 * math.cos(sine / 25))), .05)
			end
		elseif Torsovelocity > 2 and hit ~= nil then
			Anim = "Walk"
			if attack == false then
              change = 0.3
                RootJoint.C0 = clerp(RootJoint.C0, RootCF *  CFrame.new(0, 0, -0.175 + 0.025 * math.cos(sine / 3.5) + -math.sin(sine / 3.5) / 7) * angles(math.rad(5 - 2.5 * math.cos(sine / 3.5)), math.rad(0), math.rad(10 * math.cos(sine / 7))), 0.15)
                Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF *  CFrame.new(0, 0, 0 + 0.025 * math.cos(sine / 3.5)) * angles(math.rad(0 - 4.5 * math.cos(sine / 3.5)), math.rad(5 - 6.5 * math.cos(sine / 3.5)), math.rad(-10 * math.cos(sine / 7))), 0.15)
                RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(15 * math.cos(sine / 7)) + math.sin(sine / 7) / 2.5, math.rad(0), math.rad(10)), 0.05)
                LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-15 * math.cos(sine / 7)) + -math.sin(sine / 7) / 2.5, math.rad(0), math.rad(-10)), 0.05)
                RH.C0 = clerp(RH.C0,  CFrame.new(1, -0.925 - 0.5 * math.cos(sine / 7) / 2, 0.5 * math.cos(sine / 7) / 2) * angles(math.rad(-15 - 15 * math.cos(sine / 7)) + -math.sin(sine / 7) / 2.5, math.rad(90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 2.5 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.15)
                LH.C0 = clerp(LH.C0,  CFrame.new(-1, -0.925 + 0.5 * math.cos(sine / 7) / 2, -0.5 * math.cos(sine / 7) / 2) * angles(math.rad(-15 + 15 * math.cos(sine / 7)) + math.sin(sine / 7) / 2.5, math.rad(-90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 2.5 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.15)
			end
		end
	end
	--[[
	if #Effects > 0 then
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
						if not Thing[1].Mesh then return end
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Cylinder" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							local Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, .5, 0)
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
	]]
end)






				function SpawnAnim1()
					attack = true

			for i = 0, 1, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,-2.5) * angles(math.rad(90), math.rad(0), math.rad(0)), .4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-2), math.rad(-20), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.1) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(0), math.rad(0), math.rad(24)), 0.4)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-15), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(5), math.rad(0), math.rad(0)), .4)
		end
end
function SpawnAnim2()

						
			for i = 0, .2, 0.2 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,-2.5) * angles(math.rad(90), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-2), math.rad(-10), math.rad(0)), .1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.1) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(0), math.rad(0), math.rad(11)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-5), math.rad(0), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(2), math.rad(0), math.rad(0)), .1)
		end



			for i = 0, 2, 0.2 do		
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,-1,-.5) * angles(math.rad(45), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.1) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -.8, 0) * RHCF * angles(math.rad(-2), math.rad(5), math.rad(45)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -.8, -.7) * LHCF * angles(math.rad(-2), math.rad(5), math.rad(20)), .1)
		end
			for i = 0, 2, 0.2 do		
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,-1,-.5) * angles(math.rad(45), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.1) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -.8, 0) * RHCF * angles(math.rad(-2), math.rad(5), math.rad(45)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -.8, -.7) * LHCF * angles(math.rad(-2), math.rad(5), math.rad(20)), .1)
			end
						for i = 0, 2, 0.2 do		
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,-1,-.5) * angles(math.rad(45), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.1) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -.8, 0) * RHCF * angles(math.rad(-2), math.rad(5), math.rad(45)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -.8, -.7) * LHCF * angles(math.rad(-2), math.rad(5), math.rad(20)), .1)
		end

			for i = 0, 2, 0.2 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.3, 0.5, -.1) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-2), math.rad(5), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(-2), math.rad(5), math.rad(0)), .1)
		end
			
		

				
			
			attack = false
			end	



local Create = LoadLibrary("RbxUtility").Create

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
	
CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
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
--remove these lines if u want it purple--------
if Part.BrickColor == BrickColor.new("Mulberry") then
Part.BrickColor = BrickColor.new("Crimson")
end
if Part.BrickColor == BrickColor.new("Royal purple") then
Part.BrickColor = BrickColor.new("Bright red")
end
if Part.BrickColor == BrickColor.new("Alder") or Part.BrickColor == BrickColor.new("Dark indigo") then
Part.BrickColor = BrickColor.new("Really red")
end
------------------------------------------------
			RemoveOutlines(Part)
			return Part
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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
		end;
	};
	
	["Weld"] = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	["Sound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 6)
			end))
		end;
	};
	
	["ParticleEmitter"] = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter"){
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
				VelocitySpread = VelocitySpread,
			}
			return fp
		end;
	};

	CreateTemplate = {
	
	};
}

--

New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
if Object:IsA("BasePart") then
Object.CanCollide = false
Object.Anchored = false
end
	return Object
end











EffectModel = Create("Model"){
	Parent = Character,
	Name = "Effects",
}

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
			end
		end;
	};
	
	Cylinder = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part..Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.2, 0.2, 0.2))
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 2)
			Effects[#Effects + 1] = {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3
			}
		end;
	};
	
	Head = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Head", "nil", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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
		end;
	};
	
	Sphere = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3,y2, delay)
			local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, y2, 0), Vector3.new(x1, y1, z1))
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
		end;
	};
	
	Elect = {
		Create = function(cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, BrickColor.new("Lime green"), "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x, x), math.random(-y, y), math.random(-z, z))
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 2)
			local xval = math.random() / 2
			local yval = math.random() / 2
			local zval = math.random() / 2
			local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			table.insert(Effects, {
				prt,
				"Elec",
				0.1,
				x,
				y,
				z,
				xval,
				yval,
				zval
			})
		end;

	};
	
	Ring = {
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
		end;
	};


	Wave = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
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
		end;
	};

	Break = {
		Create = function(brickcolor, cframe, x1, y1, z1)
			local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
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
		end;
	};
	
	Fire = {
		Create = function(brickcolor, cframe, x1, y1, z1, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Fire",
				delay,
				1,
				1,
				1,
				msh
			})
		end;
	};
	
	FireWave = {
		Create = function(brickcolor, cframe, x1, y1, z1, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 1, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, -2.93, 0), Vector3.new(x1, y1, z1))
			local d = Create("Decal"){
				Parent = prt,
				Texture = "rbxassetid://129418678",
				Face = "Top",
			}
			local d = Create("Decal"){
				Parent = prt,
				Texture = "rbxassetid://129418678",
				Face = "Bottom",
			}
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"FireWave",
				delay,
				5,
				30,
				5,
				msh
			})
		end;
	};
	
	Lightning = {
		Create = function(p0, p1, tym, ofs, col, th, tra, last)
			local magz = (p0 - p1).magnitude
			local curpos = p0
			local trz = {
				-ofs,
				ofs
			}
			for i = 1, tym do
				local li = CFuncs.Part.Create(EffectModel, "Neon", 0, tra or 0.4, col, "Ref", Vector3.new(th, th, magz / tym))
				local ofz = Vector3.new(trz[math.random(1, 2)], trz[math.random(1, 2)], trz[math.random(1, 2)])
				local trolpos = CFrame.new(curpos, p1) * CFrame.new(0, 0, magz / tym).p + ofz
				li.Material = "Neon"
				if tym == i then
					local magz2 = (curpos - p1).magnitude
					li.Size = Vector3.new(th, th, magz2)
					li.CFrame = CFrame.new(curpos, p1) * CFrame.new(0, 0, -magz2 / 2)
					table.insert(Effects, {
						li,
						"Disappear",
						last
					})
				else
					do
						do
							li.CFrame = CFrame.new(curpos, trolpos) * CFrame.new(0, 0, magz / tym / 2)
							curpos = li.CFrame * CFrame.new(0, 0, magz / tym / 2).p
							game.Debris:AddItem(li, 10)
							table.insert(Effects, {
								li,
								"Disappear",
								last
							})
						end
					end
				end
			end
		end
	};

	EffectTemplate = {

	};
}


























local m = Create("Model"){
	Parent = Character,
	Name = "WeaponModel",
}

function Armor() -- Don't like how the armor shows up at first while the character is invisible
RightArmHandle=CFuncs.Part.Create(Character["Right Arm"],Enum.Material.Plastic,0,1,"Medium stone grey","RightArmHandle",Vector3.new(1.0117017, 2.02340055, 1.01170254))
RightArmHandleWeld=CFuncs.Weld.Create(m,Character["Right Arm"],RightArmHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.000328063965, 0.000292792916, 0.000274658203, 1, 6.48181754e-007, 2.88981391e-006, 6.48181754e-007, 0.999999881, -4.58399541e-010, 2.88981391e-006, -4.58399541e-010, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504295349, 0.0224113464, -0.154676437, 0.000263542519, -0.000128559201, -1, 0.970265985, -0.24203977, 0.00029243101, -0.242041096, -0.970266283, 5.95508573e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.400000006))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.326925993))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496276855, -0.176352754, -0.129585266, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.367791742))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388278961, -0.196606636, 0.320396423, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388439178, -0.378845215, 0.167448044, -1, 0.000147737563, 3.67819157e-005, -7.9684818e-005, -0.258836746, -0.965921104, -0.000132944187, -0.965921104, 0.258836895))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388267517, -0.19661504, -0.0985488892, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.38829422, -0.000816345215, -0.0369873047, -1, 0.000147737563, 3.67819157e-005, 6.32018055e-005, 0.642772079, -0.766057611, -0.000141528857, -0.766057432, -0.642772198))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.285402298, -0.295471191, -0.432151794, 0.500171542, 0.865926921, -0.000232767779, 0.865926564, -0.50017041, -0.000295688864, -0.000378248165, -5.36642074e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.600000024, 0.349999994, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.224761635))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388191223, 0.0322570801, -0.148422241, -1, 0.000147737563, 3.67819157e-005, 0.000141528857, 0.766057014, 0.642772675, 6.32018782e-005, 0.642772555, -0.766057074))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388195038, -0.23739624, -0.326156616, -1, 0.000147737563, 3.67819157e-005, 8.68119532e-005, 0.766031206, -0.642803371, -0.000128410262, -0.642803311, -0.766031444))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.349999994, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388202667, -0.153205872, -0.273921967, -1, 0.000147737563, 3.67819157e-005, 3.76535245e-005, 0.499982685, -0.866035581, -0.000150358697, -0.866035402, -0.499982744))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.349999994, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(1.03186011, 0.776449621, 1.03186023))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.81469727e-005, -0.625537932, 0.00699615479, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.224761769, 0.296276659))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388275146, -0.186428398, -0.338600159, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388282776, -0.0581741333, -0.0940246582, -1, 0.000147737563, 3.67819157e-005, 0.000141528857, 0.766057014, 0.642772675, 6.32018782e-005, 0.642772555, -0.766057074))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.316709578))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388214111, 0.119171143, -0.0602874756, -1, 0.000147737563, 3.67819157e-005, -6.77998178e-005, -0.173666015, -0.98480463, -0.000139387237, -0.984804511, 0.17366603))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.227526337, -0.459342957, -0.405273438, -0.000203925607, -0.99999994, 5.83409928e-005, -1.00000012, 0.000202648298, 0.000364783366, -0.000370574882, -5.82661487e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.216838658, 0.216838822, 0.776449323))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.495471954, 0.432418823, 0.166039735, 1, 0.000219255715, -0.00039579341, -0.00040155524, -8.14841624e-005, -1, -0.000217994995, 0.999999881, -8.13983061e-005))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.173473358, 0.437576294, -0.299474716, 0.939617872, 0.342227578, -0.000403211976, -0.0004070047, -7.65974837e-005, -1, -0.342226416, 0.939617038, 6.53370662e-005))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0261306763, 0.437713623, -0.229450226, 0.866131127, -0.49981609, -0.00030468902, -0.000408853055, -8.88829672e-005, -1, 0.499817163, 0.866131425, -0.000278447667))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.600000024, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.245258331, 0.437797546, -0.0368394852, 0.984769821, 0.173865423, -0.000411116838, -0.000409536355, -7.77006935e-005, -1, -0.173864245, 0.984769404, -6.31882904e-006))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.161447525, 0.175319672, -0.405158997, -0.499822646, 0.866127074, 0.000139049152, 0.866128087, 0.499823779, -0.000350035174, -0.000378454744, -5.45206749e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.400000006, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.184986115, -0.398830414, -0.405380249, 0.7659145, -0.642941415, -0.00024379525, -0.642942488, -0.765915334, 0.000285808288, -0.000376264245, -6.21579675e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.238075256, -0.0317344666, -0.405128479, -0.499822646, 0.866127074, 0.000139049152, 0.866128087, 0.499823779, -0.000350035174, -0.000378454744, -5.45206749e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0851974487, 0.296497345, -0.405174255, 0.500171542, 0.865926921, -0.000235747983, 0.865926564, -0.50017041, -0.000293662306, -0.000377983903, -5.72584322e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 1.17489111, 0.367791772))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.455463409, -0.0221786499, 0.442047179, 1, -0.000117756375, -0.000372785726, -0.000378575787, -8.74835532e-005, -1, 0.000119009223, 0.999999881, -8.75283658e-005))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.600000024, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.572120905, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496189117, -0.329588413, -0.395172119, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.357575566, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496147156, 0.13525632, -0.395133972, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504524231, 0.468618393, -0.209846497, 0.00030053372, -0.00018155307, -1, -0.484704494, 0.874677181, -0.000307273061, 0.874678075, 0.484705657, 0.000179925206))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504516602, 0.421760559, 0.405538559, 0.000272540521, -0.000140570803, -1, -0.994534075, -0.10441269, -0.000262121524, -0.104411356, 0.994533956, -0.000168863568))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504447937, 0.383110046, 0.154088974, 0.000271539786, -0.000144593927, -1, -0.961293817, -0.275526524, -0.000226745877, -0.275525302, 0.961293459, -0.000215407039))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504211426, 0.418453217, 0.430289507, -0.000270541554, 0.000133567024, 1, 0.997555554, -0.0698769838, 0.000284979236, 0.0698783174, 0.997555673, -0.000113932976))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504425049, 0.29598999, -0.320083618, 0.000272540085, -0.000143580837, -1, -0.913495362, 0.406848073, -0.000312660093, 0.406849205, 0.913495779, -1.79274466e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504341125, 0.0844573975, -0.0917243958, 0.000261541747, -0.000133565642, -1, -0.913494468, 0.40685004, -0.000298538478, 0.406851172, 0.913494885, -1.32526311e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504241943, 0.160745621, -0.344959259, -0.000224551739, 7.25848513e-005, 1, 0.55929637, 0.828968465, 6.86519197e-005, -0.82896781, 0.559295177, -0.000231534301))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.600000024, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410995483, -0.470344543, 0.0471916199, -1, 0.000116743155, 3.67826069e-005, 6.2420324e-005, 0.173694044, 0.984799623, 0.00010886728, 0.984799683, -0.173694074))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410968781, -0.0135574341, -0.177940369, 1, -0.000147737563, -3.67819157e-005, 7.2914263e-005, 0.69463259, -0.719364643, 0.000136784278, 0.719364524, 0.694632947))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410972595, -0.109760284, -0.0746383667, 1, -0.000147737563, -3.67819157e-005, 0.000143772035, 0.994518042, -0.104565434, 5.79129264e-005, 0.104565397, 0.994518161))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50453186, 0.549198151, -0.0208511353, 0.000282533205, -0.000185603378, -1, -0.819082558, 0.57367456, -0.00034262886, 0.573675692, 0.819083273, 1.33724207e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.483680725, 0.272553444, -0.396469116, 0.000288938085, 0.0521913469, -0.99863714, 0.000111813541, 0.998637021, 0.0521913953, 1, -0.000125445484, 0.000288488518))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410972595, -0.119522095, 0.057723999, 1, -0.000147737563, -3.67819157e-005, 0.000122033991, 0.587812066, 0.808997691, -9.55414725e-005, -0.808997452, 0.587812245))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410968781, 0.103988647, -0.145017624, 1, -0.000147737563, -3.67819157e-005, -3.20669205e-005, 0.0697234422, -0.997566521, 0.000151642118, 0.997566342, 0.0697234422))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410964966, -0.250419617, 0.171031952, -1, 0.000114746399, 3.67826324e-005, -1.53697183e-005, 0.224910572, -0.97437942, -0.000122634956, -0.974379301, -0.224910572))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410957336, -0.0422668457, 0.285446167, -1, 0.000114746399, 3.67826324e-005, -0.000103830207, -0.601848364, -0.798610389, -6.70543523e-005, -0.79861033, 0.601848423))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410961151, -0.0189056396, 0.190279007, 1, -0.000147737563, -3.67819157e-005, 3.20669205e-005, -0.0697234422, 0.997566521, -0.000151642118, -0.997566342, -0.0697234422))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410961151, 0.202838898, -0.0363540649, 1, -0.000147737563, -3.67819157e-005, -0.000147369865, -0.829057157, -0.559163868, 4.80528724e-005, 0.559163809, -0.829057395))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410961151, 0.157485962, -0.132907867, 1, -0.000147737563, -3.67819157e-005, -0.000103596474, -0.438400656, -0.89877975, 0.000115300703, 0.898779631, -0.438400716))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410961151, -0.37702179, -0.0033416748, -1, 0.000114746399, 3.67826324e-005, 2.75017555e-005, 0.544602752, -0.838694274, -0.000120498778, -0.838694036, -0.544602811))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504508972, 0.24685958, -0.461833954, 0.000283539703, -0.000144595819, -1, 0.000129905311, 0.999999881, -0.000144559541, 1, -0.000128574728, 0.000289338117))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.41091156, -0.112014771, 0.275939941, 1, -0.000106737025, -3.67828397e-005, -8.56020197e-005, -0.933564425, 0.358409822, -7.84567528e-005, -0.358409703, -0.933564544))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.275843859))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410987854, 0.0453997925, 0.307884216, 1, -0.000111751266, -3.67827379e-005, -0.000113044436, -0.99999994, 4.43603894e-005, -4.25673643e-005, -4.43553618e-005, -1))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410964966, 0.131492615, -0.246994019, 1, -0.000114746399, -3.67826324e-005, -9.44891872e-005, -0.939675748, 0.342066318, -7.96902168e-005, -0.342066258, -0.939675927))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.400000006))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410923004, -0.195152283, 0.304946899, -1, 0.000116743155, 3.67826069e-005, 0.000117783602, 0.766076028, 0.642749846, 4.3264783e-005, 0.642749786, -0.766076267))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410896301, 0.45009613, 0.185099363, -1, 0.000116743155, 3.67826069e-005, 3.84225677e-005, -0.0348523967, 0.99939245, 0.000119450931, 0.99939245, 0.0348524116))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.41091156, -0.412086487, 0.35200882, 1, -0.000115752227, -3.67825705e-005, -8.0032718e-005, -0.342061341, -0.939677656, 9.54284333e-005, 0.939677477, -0.3420614))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410972595, 0.362792969, 0.119937897, -1, 7.3745854e-005, 3.67835273e-005, 6.9411195e-005, 0.406802952, 0.913516104, 5.12315346e-005, 0.913515866, -0.406803012))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.400000006))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410907745, -0.0938911438, 0.183761597, -1, 0.000116743155, 3.67826069e-005, -0.000108874476, -0.984799147, 0.173697144, 6.24205131e-005, 0.173697129, 0.984799147))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410972595, -0.214584351, -0.18421936, 1, -0.000114746399, -3.67826324e-005, -0.000121785037, -0.866048515, -0.499960005, 2.11590668e-005, 0.499959975, -0.866048634))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410900116, -0.329032898, -0.229385376, -1, 8.67396666e-005, 3.67832727e-005, -5.00770693e-005, -0.087201342, -0.996190786, -8.39964559e-005, -0.996190786, 0.0872013792))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410934448, 0.0279159546, 0.434230804, -1, 0.000116743155, 3.67826069e-005, 9.58899691e-005, 0.500041127, 0.866001785, 8.09386984e-005, 0.866001606, -0.500041246))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410919189, -0.203201294, 0.225597382, -1, 0.000116743155, 3.67826069e-005, -3.7389691e-007, -0.341975003, 0.939709127, 0.000125485472, 0.939709008, 0.341974974))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410980225, 0.144927979, 0.155738831, -1, 0.000116743155, 3.67826069e-005, 8.03718576e-005, 0.342064261, 0.939676583, 9.63669227e-005, 0.939676464, -0.342064351))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417160034, 0.085773468, -0.189151764, -0.000344439643, -5.15180727e-005, -1, -0.866087675, -0.499893814, 0.000319062994, -0.499892741, 0.866086662, 0.000124674101))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504264832, -0.250984192, -0.259490967, 0.000228549266, -8.85594054e-005, -1, -0.559294462, -0.828969836, -5.76447565e-005, -0.828969181, 0.559293211, -0.000243782881))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, 0.244930267, -0.0811271667, -0.000403443584, -8.0506652e-005, -1, 0.17351748, -0.984830439, 1.0284165e-005, -0.984831035, -0.173518762, 0.000405601342))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.41734314, 0.298152924, -0.0665493011, -0.000344439643, -5.15180727e-005, -1, -0.866087675, -0.499893814, 0.000319062994, -0.499892741, 0.866086662, 0.000124674101))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51153183, 0.0897979736, -0.158996582, 1, -0.000117741496, -0.000241784524, -0.000250321988, -0.766075134, -0.642750919, -0.000113137648, 0.642750978, -0.766075313))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.5115242, 0.153572083, -0.16759491, 1, -0.000117741496, -0.000241784524, -0.000196534165, -0.939709306, -0.34197405, -0.000191927538, 0.341974109, -0.939709485))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511508942, -0.13369751, 0.106483459, 1, -0.000117741496, -0.000241784524, 2.71728131e-005, 0.939674377, -0.342070103, 0.000273349637, 0.342070013, 0.939674616))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511512756, -0.126716614, -0.0299186707, 1, -0.000117741496, -0.000241784524, -0.000154883761, 0.499955595, -0.866051197, 0.000226875345, 0.866051018, 0.499955624))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511512756, 0.229206085, -0.138748169, 1, -0.000117741496, -0.000241784524, -7.42440752e-005, -0.984798908, 0.173698202, -0.000264480303, -0.173698187, -0.984798968))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511497498, 0.237724304, 0.181190476, 1, -0.000117741496, -0.000241784524, 0.000247569813, 4.74790759e-005, 1, -0.00011903447, -0.999999881, 4.75084635e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.296276689))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511455536, -0.400665283, -0.116775513, 1, -0.000118747324, -0.000239784378, -0.000271812751, -0.342066288, -0.939675927, 2.88048632e-005, 0.939675808, -0.342066348))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511489868, 0.0188293457, 0.251922607, 1, -0.000117741496, -0.000241784524, 0.00022687536, 0.866050601, 0.49995628, 0.000154883688, -0.49995622, 0.86605078))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511554718, 0.0990829468, 0.100013733, 1, -0.000117741496, -0.000241784524, -0.000266168005, -0.642823577, -0.766014159, -6.79542354e-005, 0.766014099, -0.642823696))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.5115242, 0.0646362305, 0.00978851318, 1, -0.000117741496, -0.000241784524, 0.000273349404, 0.342065394, 0.939676285, -2.71807221e-005, -0.939676106, 0.342065483))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511535645, -0.0146827698, 0.00257873535, 1, -0.000117741496, -0.000241784524, -2.71879162e-005, -0.939675093, 0.342068017, -0.000273351383, -0.342067957, -0.939675331))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.491127014, 0.453292847, 0.171007797, 1, -0.000119745702, -0.000241784408, 0.000247569929, 4.84923949e-005, 1, -0.000121038604, -0.999999881, 4.8522259e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511634827, 0.06980896, -0.0550994873, 1, -0.000117741496, -0.000241784524, 0.000196526613, 0.939710021, 0.341971993, 0.000191927742, -0.341972053, 0.939710259))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511550903, 0.609474182, 0.531238556, -1, 0.000113755435, 0.000240784531, 0.000271043566, 0.342068374, 0.939675152, 2.37680615e-005, 0.939674973, -0.342068434))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511665344, 0.24779892, -0.21282196, 1, -0.000117748947, -0.000241783651, 7.42364064e-005, 0.984798372, -0.173700735, 0.000264478615, 0.17370075, 0.984798431))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51166153, 0.148300171, -0.0453567505, 1, -0.000117741496, -0.000241784524, -6.79472723e-005, 0.766011059, -0.642827451, 0.000266168063, 0.642827272, 0.766011119))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511680603, 0.618110657, 0.452018738, 1, -0.000115752191, -0.000241784524, -0.00019261126, 0.341972828, -0.939710021, 0.000194656575, 0.939709842, 0.341972768))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511680603, 0.345146179, 0.149419785, 1, -0.000117741496, -0.000241784524, -0.000223140451, 0.173599422, -0.984816372, 0.000160211639, 0.984816313, 0.173599422))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511569977, 0.0109024048, -0.248100281, 1, -0.000117741496, -0.000241784524, 0.000160211508, 0.984816611, 0.173597425, 0.000223140611, -0.17359744, 0.98481673))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511627197, 0.129051208, 0.18813324, 1, -0.000117741496, -0.000241784524, -0.000154883761, 0.499955595, -0.866051197, 0.000226875345, 0.866051018, 0.499955624))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511695862, 0.616630554, 0.334281921, 1, -0.000115752191, -0.000241784524, -6.94746414e-005, 0.766011059, -0.642827451, 0.000264882838, 0.642827272, 0.766011119))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511581421, -0.0587234497, 0.677345276, -1, 0.000113755435, 0.000240784531, 0.000192356209, -0.341971576, 0.939710438, 0.000192436244, 0.939710259, 0.341971576))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511631012, 0.463775635, 0.638645172, -1, 0.000113755435, 0.000240784531, 0.000271043566, 0.342068374, 0.939675152, 2.37680615e-005, 0.939674973, -0.342068434))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511676788, -0.0533447266, 0.698778152, 1, -0.000115752191, -0.000241784524, -0.000264133792, -0.173697159, -0.984799087, 7.2277202e-005, 0.984799027, -0.173697159))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511615753, -0.319847107, 0.672073364, -1, 0.000113755435, 0.000240784531, 7.03688638e-005, -0.766010165, 0.642828584, 0.000262826507, 0.642828465, 0.766010225))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511600494, 0.313552856, 0.584598541, -1, 0.000113755435, 0.000240784531, 0.000271043566, 0.342068374, 0.939675152, 2.37680615e-005, 0.939674973, -0.342068434))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51166153, -0.184135437, 0.675708771, 1, -0.000115752191, -0.000241784524, -0.000264133792, -0.173697159, -0.984799087, 7.2277202e-005, 0.984799027, -0.173697159))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511615753, -0.138504028, 0.683759689, -1, 0.000113755435, 0.000240784531, 0.000222849951, -0.173598513, 0.984816492, 0.000156098875, 0.984816432, 0.173598528))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511665344, 0.0774307251, 0.705162048, 1, -0.000117741496, -0.000241784524, -0.000273349462, -0.342067122, -0.939675629, 2.71805529e-005, 0.93967545, -0.342067212))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.296276689))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511566162, 0.399703979, 0.149036407, 1, -0.000117741496, -0.000241784524, 0.000273351296, 0.342066258, 0.939675927, -2.71806366e-005, -0.939675808, 0.342066348))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.416992188, 0.459632874, 0.00236076862, -0.000396448741, -0.00011150194, -1, 1.00000012, -0.000118754753, -0.000390655739, -0.000120005861, -0.999999881, 0.000111549271))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511650085, 0.416511536, 0.525382996, 1, -0.000115752191, -0.000241784524, -0.00019261126, 0.341972828, -0.939710021, 0.000194656575, 0.939709842, 0.341972768))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.41733551, 0.233234406, 0.0431079865, -0.000389445486, -9.04924964e-005, -1, -0.939651012, 0.342134237, 0.000329551112, 0.342135549, 0.939651072, -0.000216297456))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417289734, -0.156667709, 0.0191993713, -0.000339440623, -5.64659931e-005, -1, 0.34189257, -0.939738572, -6.10124189e-005, -0.939739287, -0.341893673, 0.000332859723))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511569977, 0.00520896912, 0.39793396, 1, -0.000117748947, -0.000241783651, 7.42364064e-005, 0.984798372, -0.173700735, 0.000264478615, 0.17370075, 0.984798431))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, 0.0805511475, 0.250875473, -0.000396447169, -0.000101518206, -1, -0.939651966, 0.342131168, 0.000332358759, 0.342132419, 0.939652205, -0.000229052181))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417190552, -0.231136322, 0.100609779, -0.000371439994, -5.55074948e-005, -1, -0.984786391, 0.173769146, 0.000350451679, 0.173770443, 0.984786391, -0.000118204414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.41733551, 0.224536896, -0.0618000031, -0.000389446213, -9.54992574e-005, -1, -0.866084218, -0.499899626, 0.00038002769, -0.499898553, 0.866083205, 0.00010908363))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.430000007, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417160034, 0.255838394, -0.430774689, 0.000386443135, 7.55024375e-005, 1, -0.499885589, 0.866090715, 0.0001248958, -0.866091669, -0.499886721, 0.000367432192))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.200000003, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.416999817, -0.275058746, 0.355922699, -0.000391443638, -7.84819276e-005, -1, -0.642685592, 0.766129196, 0.000187732905, 0.766130328, 0.642686427, -0.000345908309))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.416999817, -0.283462524, -0.326116562, 0.000390444708, 8.55153776e-005, 1, -0.86596179, 0.500109196, 0.000290337892, -0.500110388, -0.865962446, 0.000266428367))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417144775, 0.175773621, -0.36309433, 0.000385444175, 8.25061143e-005, 1, 0.17377694, 0.984785199, -0.000147228187, -0.984785259, 0.173775703, 0.000359550351))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.41708374, 0.656784058, 0.361309052, 0.000403443235, 7.64833676e-005, 1, 0.866086483, 0.499895841, -0.000382644823, -0.499894738, 0.866085529, 0.000132548375))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417121887, -0.273510188, -0.377922058, -0.00039144812, -0.000107479427, -1, -0.000125929379, -0.99999994, 0.000107528424, -1.00000012, 0.000124670521, 0.000385655032))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417114258, 0.527671814, 0.117294312, 0.000399442564, 7.24904676e-005, 1, 0.866086483, 0.499895841, -0.000377183896, -0.499894738, 0.866085529, 0.000134006681))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417106628, 0.498235762, -0.367706299, 0.000391444686, 8.55152175e-005, 1, 0.000131913781, 0.999999881, -8.55665203e-005, -1, 0.000130660788, 0.000385653751))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417114258, -0.301620483, -0.465762138, 0.00038944374, 7.94954976e-005, 1, -0.98478663, 0.173767999, 0.000364013307, -0.17376928, -0.98478657, 0.000144955571))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417190552, 0.149868011, -0.202709198, -0.00038744061, -5.95283491e-005, -1, 0.765962422, -0.642884314, -0.000254067825, -0.642885566, -0.765963256, 0.000290961121))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417068481, 0.459686279, 0.436964452, 0.000403446611, 9.84773505e-005, 1, 1.00000012, -0.000118754753, -0.000397655182, 0.000120006807, 0.999999881, -9.85254956e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417190552, -0.276691437, 0.103364944, -0.000395444047, -8.25045863e-005, -1, -0.939734519, -0.341907352, 0.000394390052, -0.34190613, 0.939733624, 5.56958839e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417366028, 0.413482666, 0.0416736603, -0.000389445486, -9.04924964e-005, -1, -0.865962803, 0.500107288, 0.000286984112, 0.500108421, 0.865963399, -0.00027023803))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.430000007, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417137146, -0.399623871, -0.145516396, -0.000394444418, -8.34882085e-005, -1, -0.984829068, -0.173529476, 0.000397255935, -0.173528224, 0.984828591, -1.47777164e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417182922, -0.285552979, 0.0272340775, -0.000394444069, -8.25047318e-005, -1, -0.984786272, 0.17377013, 0.000368414272, 0.173771366, 0.984786272, -0.00014878872))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, 0.0754985809, -0.157909393, -0.000396443676, -8.05076852e-005, -1, -0.342140973, -0.939649105, 0.000209311504, -0.939648867, 0.342139602, 0.000339541904))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417175293, -0.338485718, 0.120929718, -0.000390444038, -8.14921077e-005, -1, -0.765962422, 0.642884314, 0.000242248134, 0.642885625, 0.765963197, -0.000309715339))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417236328, -0.0827102661, 0.0710887909, -0.000400449906, -0.000118475073, -1, -0.939652264, 0.342130303, 0.000330318551, 0.342131466, 0.939652503, -0.000246354903))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417289734, 0.123802185, 0.0236358643, -0.00039244676, -9.84789949e-005, -1, -0.642691612, 0.766124129, 0.000173060107, 0.766125202, 0.642692447, -0.000359527301))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417167664, 0.186263442, -0.388122559, -0.00039144812, -0.000107479427, -1, -0.000125929379, -0.99999994, 0.000107528424, -1.00000012, 0.000124670521, 0.000385655032))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417289734, 0.0655403137, -0.000379562378, -0.000396447955, -0.000106495165, -1, -0.939732671, -0.341912329, 0.000403535814, -0.341911107, 0.939731777, 3.34964789e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, -0.113883972, 0.0671386719, -0.000390446512, -9.74958384e-005, -1, -0.341900557, 0.939735591, 3.98970442e-005, 0.939736485, 0.341901779, -0.000394819508))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417358398, 0.214199066, 0.262556076, -0.000389446213, -9.54992574e-005, -1, -0.866084218, -0.499899626, 0.00038002769, -0.499898553, 0.866083205, 0.00010908363))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.430000007, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417411804, 0.384922028, 0.137599945, -0.000392445567, -9.15052951e-005, -1, -0.939733267, -0.341910571, 0.000394649367, -0.341909379, 0.939732552, 4.62137323e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417381287, 0.203924179, 0.28465271, -0.000391446025, -9.44856729e-005, -1, -0.342136979, -0.939650536, 0.000220734597, -0.939650416, 0.342135727, 0.000330064388))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504364014, 0.209217072, -0.0522956848, 0.000259542023, -0.000131598383, -1, -0.559294462, -0.828969836, -3.93007867e-005, -0.828969181, 0.559293211, -0.000293546414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504386902, 0.148723602, 0.193184853, 0.000262542424, -0.000129572334, -1, -0.96129477, -0.275523454, -0.000222236151, -0.275522202, 0.961294293, -0.000198487061))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1.29999995))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504257202, -0.134284973, -0.00554275513, 0.000261541747, -0.000133565642, -1, -0.913494468, 0.40685004, -0.000298538478, 0.406851172, 0.913494885, -1.32526311e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50428009, -0.195178986, 0.289588928, 0.000260543893, -0.000120571785, -1, -0.809087217, -0.587689757, -0.000144619378, -0.587688923, 0.809086084, -0.000254069426))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504295349, 0.0224113464, -0.154676437, 0.000263542519, -0.000128559201, -1, 0.970265985, -0.24203977, 0.00029243101, -0.242041096, -0.970266283, 5.95508573e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.400000006))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504394531, 0.00591659546, 0.084854126, 0.000259542023, -0.000131598383, -1, -0.559294462, -0.828969836, -3.93007867e-005, -0.828969181, 0.559293211, -0.000293546414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504203796, 0.717723846, 0.156257629, -0.000248541008, 0.000139553944, 1, 0.694746673, 0.719255567, 7.63125136e-005, -0.719254673, 0.694745421, -0.000279876695))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504386902, 0.0999422073, 0.349708557, 0.000261540321, -0.000142595687, -1, 0.275510103, -0.96129775, 0.000210727507, -0.961298227, -0.275511324, -0.000217687237))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504226685, 0.298980713, -0.314445496, -0.000224551972, 7.15715869e-005, 1, 0.898846865, 0.43826443, 0.000175664987, -0.438263148, 0.89884603, -0.000165278834))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.600000024, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504394531, 0.00591659546, 0.084854126, 0.000259542023, -0.000131598383, -1, -0.559294462, -0.828969836, -3.93007867e-005, -0.828969181, 0.559293211, -0.000293546414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504341125, 0.0844573975, -0.0917243958, 0.000261541747, -0.000133565642, -1, -0.913494468, 0.40685004, -0.000298538478, 0.406851172, 0.913494885, -1.32526311e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.265627563, 0.347358912))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496185303, -0.033338815, -0.231636047, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.224761769, 0.245194495))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496154785, 0.0279518738, 0.268928528, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.34735921, 0.418873906))
PartWeld=CFuncs.Weld.Create(m,RightArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496192932, 0.140328363, 0.1820755, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504501343, 0.496192932, 0.182048798, 0.000278538238, -0.000154578782, -1, -0.997555554, 0.069876954, -0.000294424593, 0.0698782951, 0.997555673, -0.000134334594))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504295349, 0.526973724, 0.0621414185, -0.000248541008, 0.000139553944, 1, 0.559296191, 0.828968585, 2.65537165e-005, -0.828967929, 0.559294999, -0.000288876297))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50440979, 0.132255554, 0.0659236908, 0.000260543165, -0.000124565253, -1, -0.913495183, 0.406848371, -0.000293964404, 0.406849533, 0.913495719, -5.43762144e-006))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504180908, 0.371734619, -0.189682007, 0.000231549464, -8.656313e-005, -1, 0.913494408, -0.40685004, 0.000252017577, -0.406851351, -0.913494885, -1.74815414e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504257202, -0.402713776, 0.0517959595, 0.000258544402, -0.000117591262, -1, 0.898846149, 0.438265622, 0.000186049961, 0.43826443, -0.898845375, 0.000221541355))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50428009, -0.0886383057, 0.0971984863, 0.000259542488, -0.000129571839, -1, -0.913495183, 0.406848371, -0.000295087229, 0.406849504, 0.91349566, -1.04182855e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504249573, 0.213688374, -0.24924469, -0.000226548815, 9.15691489e-005, 1, 0.0698869452, 0.997555017, -7.51097541e-005, -0.997554898, 0.0698856264, -0.000238159919))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504272461, -0.273704529, 0.0105292797, 0.000258541375, -0.000135591763, -1, -0.997555614, 0.0698769987, -0.000273149926, 0.0698783323, 0.997555673, -0.000116791285))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504257202, 0.372005463, 0.267033577, -0.000228548219, 9.45794454e-005, 1, 0.96129477, 0.275523484, 0.000199199072, -0.275522202, 0.961294353, -0.000155482398))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504203796, -0.302482605, -0.169031143, -0.000228548772, 9.15694254e-005, 1, -0.828965902, 0.559297919, -0.000245465635, -0.559299171, -0.828966618, -5.51506855e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504150391, -0.158781052, 0.506530762, -0.000224551128, 7.65783479e-005, 1, -0.55929637, -0.828968465, -6.53411553e-005, 0.82896781, -0.559295177, 0.000233767438))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.600000024, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504264832, 0.147003174, -0.495708466, -0.000252541358, 0.000136604111, 1, -0.587679029, 0.809093356, -0.000262336369, -0.809094489, -0.587679863, -0.000128725864))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504196167, -0.602104187, -0.254190445, -0.000258542714, 0.000127574982, 1, -0.96129477, -0.275523454, -0.000218941539, 0.275522202, -0.961294293, 0.000195465007))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50428009, -0.195178986, 0.289588928, 0.000260543893, -0.000120571785, -1, -0.809087217, -0.587689757, -0.000144619378, -0.587688923, 0.809086084, -0.000254069426))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightArmHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504386902, 0.148723602, 0.193184853, 0.000262542424, -0.000129572334, -1, -0.96129477, -0.275523454, -0.000222236151, -0.275522202, 0.961294293, -0.000198487061))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1.29999995))
TorsoHandle=CFuncs.Part.Create(Character["Torso"],Enum.Material.Plastic,0,1,"Medium stone grey","TorsoHandle",Vector3.new(2,2,1))
TorsoHandleWeld=CFuncs.Weld.Create(m,Character["Torso"],TorsoHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(7.2479248e-005, 0.000236198306, 0.000152587891, 1, 6.4818812e-007, 2.88982847e-006, 6.4818812e-007, 0.999999881, -4.57326621e-010, 2.88982847e-006, -4.57326621e-010, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0.8,"Really black","Part",Vector3.new(2.05,2.05,1.05))
Part.Shape = "Block" 
PartWeld=CFuncs.Weld.Create(m,TorsoHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0,0,0))
RightLegHandle=CFuncs.Part.Create(Character["Right Leg"],Enum.Material.Plastic,0,1,"Medium stone grey","RightLegHandle",Vector3.new(1.0117017, 2.02340055, 1.01170254))
RightLegHandleWeld=CFuncs.Weld.Create(m,Character["Right Leg"],RightLegHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.000335693359, -0.000207066536, 0.000152587891, 1, 6.48181754e-007, 2.88981391e-006, 6.48181754e-007, 0.999999881, -4.58399541e-010, 2.88981391e-006, -4.58399541e-010, 1))

Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504295349, 0.0224113464, -0.154676437, 0.000263542519, -0.000128559201, -1, 0.970265985, -0.24203977, 0.00029243101, -0.242041096, -0.970266283, 5.95508573e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.400000006))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0.7,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.326925993))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496276855, -0.176352754, -0.129585266, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.367791742))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388278961, -0.196606636, 0.320396423, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388439178, -0.378845215, 0.167448044, -1, 0.000147737563, 3.67819157e-005, -7.9684818e-005, -0.258836746, -0.965921104, -0.000132944187, -0.965921104, 0.258836895))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388267517, -0.19661504, -0.0985488892, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.38829422, -0.000816345215, -0.0369873047, -1, 0.000147737563, 3.67819157e-005, 6.32018055e-005, 0.642772079, -0.766057611, -0.000141528857, -0.766057432, -0.642772198))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.285402298, -0.295471191, -0.432151794, 0.500171542, 0.865926921, -0.000232767779, 0.865926564, -0.50017041, -0.000295688864, -0.000378248165, -5.36642074e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.600000024, 0.349999994, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.224761635))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388191223, 0.0322570801, -0.148422241, -1, 0.000147737563, 3.67819157e-005, 0.000141528857, 0.766057014, 0.642772675, 6.32018782e-005, 0.642772555, -0.766057074))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388195038, -0.23739624, -0.326156616, -1, 0.000147737563, 3.67819157e-005, 8.68119532e-005, 0.766031206, -0.642803371, -0.000128410262, -0.642803311, -0.766031444))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.349999994, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388202667, -0.153205872, -0.273921967, -1, 0.000147737563, 3.67819157e-005, 3.76535245e-005, 0.499982685, -0.866035581, -0.000150358697, -0.866035402, -0.499982744))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.349999994, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(1.03186011, 0.776449621, 1.03186023))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(3.81469727e-005, -0.625537932, 0.00699615479, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.224761769, 0.296276659))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388275146, -0.186428398, -0.338600159, -1, 0.000147737563, 3.67819157e-005, 0.000149032334, 0.999999881, -2.23378756e-005, -4.25648541e-005, -2.23315201e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388282776, -0.0581741333, -0.0940246582, -1, 0.000147737563, 3.67819157e-005, 0.000141528857, 0.766057014, 0.642772675, 6.32018782e-005, 0.642772555, -0.766057074))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.800000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.25541088, 0.20432891, 0.316709578))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.388214111, 0.119171143, -0.0602874756, -1, 0.000147737563, 3.67819157e-005, -6.77998178e-005, -0.173666015, -0.98480463, -0.000139387237, -0.984804511, 0.17366603))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.227526337, -0.459342957, -0.405273438, -0.000203925607, -0.99999994, 5.83409928e-005, -1.00000012, 0.000202648298, 0.000364783366, -0.000370574882, -5.82661487e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.216838658, 0.216838822, 0.776449323))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.495471954, 0.432418823, 0.166039735, 1, 0.000219255715, -0.00039579341, -0.00040155524, -8.14841624e-005, -1, -0.000217994995, 0.999999881, -8.13983061e-005))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.173473358, 0.437576294, -0.299474716, 0.939617872, 0.342227578, -0.000403211976, -0.0004070047, -7.65974837e-005, -1, -0.342226416, 0.939617038, 6.53370662e-005))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0261306763, 0.437713623, -0.229450226, 0.866131127, -0.49981609, -0.00030468902, -0.000408853055, -8.88829672e-005, -1, 0.499817163, 0.866131425, -0.000278447667))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.600000024, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.245258331, 0.437797546, -0.0368394852, 0.984769821, 0.173865423, -0.000411116838, -0.000409536355, -7.77006935e-005, -1, -0.173864245, 0.984769404, -6.31882904e-006))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.161447525, 0.175319672, -0.405158997, -0.499822646, 0.866127074, 0.000139049152, 0.866128087, 0.499823779, -0.000350035174, -0.000378454744, -5.45206749e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.400000006, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.184986115, -0.398830414, -0.405380249, 0.7659145, -0.642941415, -0.00024379525, -0.642942488, -0.765915334, 0.000285808288, -0.000376264245, -6.21579675e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.238075256, -0.0317344666, -0.405128479, -0.499822646, 0.866127074, 0.000139049152, 0.866128087, 0.499823779, -0.000350035174, -0.000378454744, -5.45206749e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.800000012, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.20432891, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0851974487, 0.296497345, -0.405174255, 0.500171542, 0.865926921, -0.000235747983, 0.865926564, -0.50017041, -0.000293662306, -0.000377983903, -5.72584322e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 1.17489111, 0.367791772))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.455463409, -0.0221786499, 0.442047179, 1, -0.000117756375, -0.000372785726, -0.000378575787, -8.74835532e-005, -1, 0.000119009223, 0.999999881, -8.75283658e-005))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.600000024, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.572120905, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496189117, -0.329588413, -0.395172119, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.357575566, 0.204328775))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496147156, 0.13525632, -0.395133972, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504524231, 0.468618393, -0.209846497, 0.00030053372, -0.00018155307, -1, -0.484704494, 0.874677181, -0.000307273061, 0.874678075, 0.484705657, 0.000179925206))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504516602, 0.421760559, 0.405538559, 0.000272540521, -0.000140570803, -1, -0.994534075, -0.10441269, -0.000262121524, -0.104411356, 0.994533956, -0.000168863568))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504447937, 0.383110046, 0.154088974, 0.000271539786, -0.000144593927, -1, -0.961293817, -0.275526524, -0.000226745877, -0.275525302, 0.961293459, -0.000215407039))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504211426, 0.418453217, 0.430289507, -0.000270541554, 0.000133567024, 1, 0.997555554, -0.0698769838, 0.000284979236, 0.0698783174, 0.997555673, -0.000113932976))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504425049, 0.29598999, -0.320083618, 0.000272540085, -0.000143580837, -1, -0.913495362, 0.406848073, -0.000312660093, 0.406849205, 0.913495779, -1.79274466e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504341125, 0.0844573975, -0.0917243958, 0.000261541747, -0.000133565642, -1, -0.913494468, 0.40685004, -0.000298538478, 0.406851172, 0.913494885, -1.32526311e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504241943, 0.160745621, -0.344959259, -0.000224551739, 7.25848513e-005, 1, 0.55929637, 0.828968465, 6.86519197e-005, -0.82896781, 0.559295177, -0.000231534301))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.600000024, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410995483, -0.470344543, 0.0471916199, -1, 0.000116743155, 3.67826069e-005, 6.2420324e-005, 0.173694044, 0.984799623, 0.00010886728, 0.984799683, -0.173694074))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410968781, -0.0135574341, -0.177940369, 1, -0.000147737563, -3.67819157e-005, 7.2914263e-005, 0.69463259, -0.719364643, 0.000136784278, 0.719364524, 0.694632947))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410972595, -0.109760284, -0.0746383667, 1, -0.000147737563, -3.67819157e-005, 0.000143772035, 0.994518042, -0.104565434, 5.79129264e-005, 0.104565397, 0.994518161))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50453186, 0.549198151, -0.0208511353, 0.000282533205, -0.000185603378, -1, -0.819082558, 0.57367456, -0.00034262886, 0.573675692, 0.819083273, 1.33724207e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.483680725, 0.272553444, -0.396469116, 0.000288938085, 0.0521913469, -0.99863714, 0.000111813541, 0.998637021, 0.0521913953, 1, -0.000125445484, 0.000288488518))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410972595, -0.119522095, 0.057723999, 1, -0.000147737563, -3.67819157e-005, 0.000122033991, 0.587812066, 0.808997691, -9.55414725e-005, -0.808997452, 0.587812245))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410968781, 0.103988647, -0.145017624, 1, -0.000147737563, -3.67819157e-005, -3.20669205e-005, 0.0697234422, -0.997566521, 0.000151642118, 0.997566342, 0.0697234422))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410964966, -0.250419617, 0.171031952, -1, 0.000114746399, 3.67826324e-005, -1.53697183e-005, 0.224910572, -0.97437942, -0.000122634956, -0.974379301, -0.224910572))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410957336, -0.0422668457, 0.285446167, -1, 0.000114746399, 3.67826324e-005, -0.000103830207, -0.601848364, -0.798610389, -6.70543523e-005, -0.79861033, 0.601848423))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410961151, -0.0189056396, 0.190279007, 1, -0.000147737563, -3.67819157e-005, 3.20669205e-005, -0.0697234422, 0.997566521, -0.000151642118, -0.997566342, -0.0697234422))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410961151, 0.202838898, -0.0363540649, 1, -0.000147737563, -3.67819157e-005, -0.000147369865, -0.829057157, -0.559163868, 4.80528724e-005, 0.559163809, -0.829057395))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410961151, 0.157485962, -0.132907867, 1, -0.000147737563, -3.67819157e-005, -0.000103596474, -0.438400656, -0.89877975, 0.000115300703, 0.898779631, -0.438400716))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410961151, -0.37702179, -0.0033416748, -1, 0.000114746399, 3.67826324e-005, 2.75017555e-005, 0.544602752, -0.838694274, -0.000120498778, -0.838694036, -0.544602811))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504508972, 0.24685958, -0.461833954, 0.000283539703, -0.000144595819, -1, 0.000129905311, 0.999999881, -0.000144559541, 1, -0.000128574728, 0.000289338117))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.41091156, -0.112014771, 0.275939941, 1, -0.000106737025, -3.67828397e-005, -8.56020197e-005, -0.933564425, 0.358409822, -7.84567528e-005, -0.358409703, -0.933564544))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.275843859))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410987854, 0.0453997925, 0.307884216, 1, -0.000111751266, -3.67827379e-005, -0.000113044436, -0.99999994, 4.43603894e-005, -4.25673643e-005, -4.43553618e-005, -1))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410964966, 0.131492615, -0.246994019, 1, -0.000114746399, -3.67826324e-005, -9.44891872e-005, -0.939675748, 0.342066318, -7.96902168e-005, -0.342066258, -0.939675927))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.400000006))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410923004, -0.195152283, 0.304946899, -1, 0.000116743155, 3.67826069e-005, 0.000117783602, 0.766076028, 0.642749846, 4.3264783e-005, 0.642749786, -0.766076267))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410896301, 0.45009613, 0.185099363, -1, 0.000116743155, 3.67826069e-005, 3.84225677e-005, -0.0348523967, 0.99939245, 0.000119450931, 0.99939245, 0.0348524116))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.41091156, -0.412086487, 0.35200882, 1, -0.000115752227, -3.67825705e-005, -8.0032718e-005, -0.342061341, -0.939677656, 9.54284333e-005, 0.939677477, -0.3420614))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410972595, 0.362792969, 0.119937897, -1, 7.3745854e-005, 3.67835273e-005, 6.9411195e-005, 0.406802952, 0.913516104, 5.12315346e-005, 0.913515866, -0.406803012))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.400000006))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410907745, -0.0938911438, 0.183761597, -1, 0.000116743155, 3.67826069e-005, -0.000108874476, -0.984799147, 0.173697144, 6.24205131e-005, 0.173697129, 0.984799147))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.410972595, -0.214584351, -0.18421936, 1, -0.000114746399, -3.67826324e-005, -0.000121785037, -0.866048515, -0.499960005, 2.11590668e-005, 0.499959975, -0.866048634))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.600000024, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410900116, -0.329032898, -0.229385376, -1, 8.67396666e-005, 3.67832727e-005, -5.00770693e-005, -0.087201342, -0.996190786, -8.39964559e-005, -0.996190786, 0.0872013792))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410934448, 0.0279159546, 0.434230804, -1, 0.000116743155, 3.67826069e-005, 9.58899691e-005, 0.500041127, 0.866001785, 8.09386984e-005, 0.866001606, -0.500041246))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410919189, -0.203201294, 0.225597382, -1, 0.000116743155, 3.67826069e-005, -3.7389691e-007, -0.341975003, 0.939709127, 0.000125485472, 0.939709008, 0.341974974))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.410980225, 0.144927979, 0.155738831, -1, 0.000116743155, 3.67826069e-005, 8.03718576e-005, 0.342064261, 0.939676583, 9.63669227e-005, 0.939676464, -0.342064351))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417160034, 0.085773468, -0.189151764, -0.000344439643, -5.15180727e-005, -1, -0.866087675, -0.499893814, 0.000319062994, -0.499892741, 0.866086662, 0.000124674101))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504264832, -0.250984192, -0.259490967, 0.000228549266, -8.85594054e-005, -1, -0.559294462, -0.828969836, -5.76447565e-005, -0.828969181, 0.559293211, -0.000243782881))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, 0.244930267, -0.0811271667, -0.000403443584, -8.0506652e-005, -1, 0.17351748, -0.984830439, 1.0284165e-005, -0.984831035, -0.173518762, 0.000405601342))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.41734314, 0.298152924, -0.0665493011, -0.000344439643, -5.15180727e-005, -1, -0.866087675, -0.499893814, 0.000319062994, -0.499892741, 0.866086662, 0.000124674101))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.699999988, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51153183, 0.0897979736, -0.158996582, 1, -0.000117741496, -0.000241784524, -0.000250321988, -0.766075134, -0.642750919, -0.000113137648, 0.642750978, -0.766075313))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.5115242, 0.153572083, -0.16759491, 1, -0.000117741496, -0.000241784524, -0.000196534165, -0.939709306, -0.34197405, -0.000191927538, 0.341974109, -0.939709485))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511508942, -0.13369751, 0.106483459, 1, -0.000117741496, -0.000241784524, 2.71728131e-005, 0.939674377, -0.342070103, 0.000273349637, 0.342070013, 0.939674616))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511512756, -0.126716614, -0.0299186707, 1, -0.000117741496, -0.000241784524, -0.000154883761, 0.499955595, -0.866051197, 0.000226875345, 0.866051018, 0.499955624))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511512756, 0.229206085, -0.138748169, 1, -0.000117741496, -0.000241784524, -7.42440752e-005, -0.984798908, 0.173698202, -0.000264480303, -0.173698187, -0.984798968))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511497498, 0.237724304, 0.181190476, 1, -0.000117741496, -0.000241784524, 0.000247569813, 4.74790759e-005, 1, -0.00011903447, -0.999999881, 4.75084635e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.296276689))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511455536, -0.400665283, -0.116775513, 1, -0.000118747324, -0.000239784378, -0.000271812751, -0.342066288, -0.939675927, 2.88048632e-005, 0.939675808, -0.342066348))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511489868, 0.0188293457, 0.251922607, 1, -0.000117741496, -0.000241784524, 0.00022687536, 0.866050601, 0.49995628, 0.000154883688, -0.49995622, 0.86605078))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511554718, 0.0990829468, 0.100013733, 1, -0.000117741496, -0.000241784524, -0.000266168005, -0.642823577, -0.766014159, -6.79542354e-005, 0.766014099, -0.642823696))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.5115242, 0.0646362305, 0.00978851318, 1, -0.000117741496, -0.000241784524, 0.000273349404, 0.342065394, 0.939676285, -2.71807221e-005, -0.939676106, 0.342065483))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511535645, -0.0146827698, 0.00257873535, 1, -0.000117741496, -0.000241784524, -2.71879162e-005, -0.939675093, 0.342068017, -0.000273351383, -0.342067957, -0.939675331))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.491127014, 0.453292847, 0.171007797, 1, -0.000119745702, -0.000241784408, 0.000247569929, 4.84923949e-005, 1, -0.000121038604, -0.999999881, 4.8522259e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511634827, 0.06980896, -0.0550994873, 1, -0.000117741496, -0.000241784524, 0.000196526613, 0.939710021, 0.341971993, 0.000191927742, -0.341972053, 0.939710259))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511550903, 0.609474182, 0.531238556, -1, 0.000113755435, 0.000240784531, 0.000271043566, 0.342068374, 0.939675152, 2.37680615e-005, 0.939674973, -0.342068434))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511665344, 0.24779892, -0.21282196, 1, -0.000117748947, -0.000241783651, 7.42364064e-005, 0.984798372, -0.173700735, 0.000264478615, 0.17370075, 0.984798431))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51166153, 0.148300171, -0.0453567505, 1, -0.000117741496, -0.000241784524, -6.79472723e-005, 0.766011059, -0.642827451, 0.000266168063, 0.642827272, 0.766011119))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511680603, 0.618110657, 0.452018738, 1, -0.000115752191, -0.000241784524, -0.00019261126, 0.341972828, -0.939710021, 0.000194656575, 0.939709842, 0.341972768))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511680603, 0.345146179, 0.149419785, 1, -0.000117741496, -0.000241784524, -0.000223140451, 0.173599422, -0.984816372, 0.000160211639, 0.984816313, 0.173599422))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511569977, 0.0109024048, -0.248100281, 1, -0.000117741496, -0.000241784524, 0.000160211508, 0.984816611, 0.173597425, 0.000223140611, -0.17359744, 0.98481673))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511627197, 0.129051208, 0.18813324, 1, -0.000117741496, -0.000241784524, -0.000154883761, 0.499955595, -0.866051197, 0.000226875345, 0.866051018, 0.499955624))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511695862, 0.616630554, 0.334281921, 1, -0.000115752191, -0.000241784524, -6.94746414e-005, 0.766011059, -0.642827451, 0.000264882838, 0.642827272, 0.766011119))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511581421, -0.0587234497, 0.677345276, -1, 0.000113755435, 0.000240784531, 0.000192356209, -0.341971576, 0.939710438, 0.000192436244, 0.939710259, 0.341971576))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511631012, 0.463775635, 0.638645172, -1, 0.000113755435, 0.000240784531, 0.000271043566, 0.342068374, 0.939675152, 2.37680615e-005, 0.939674973, -0.342068434))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511676788, -0.0533447266, 0.698778152, 1, -0.000115752191, -0.000241784524, -0.000264133792, -0.173697159, -0.984799087, 7.2277202e-005, 0.984799027, -0.173697159))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511615753, -0.319847107, 0.672073364, -1, 0.000113755435, 0.000240784531, 7.03688638e-005, -0.766010165, 0.642828584, 0.000262826507, 0.642828465, 0.766010225))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511600494, 0.313552856, 0.584598541, -1, 0.000113755435, 0.000240784531, 0.000271043566, 0.342068374, 0.939675152, 2.37680615e-005, 0.939674973, -0.342068434))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51166153, -0.184135437, 0.675708771, 1, -0.000115752191, -0.000241784524, -0.000264133792, -0.173697159, -0.984799087, 7.2277202e-005, 0.984799027, -0.173697159))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.511615753, -0.138504028, 0.683759689, -1, 0.000113755435, 0.000240784531, 0.000222849951, -0.173598513, 0.984816492, 0.000156098875, 0.984816432, 0.173598528))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511665344, 0.0774307251, 0.705162048, 1, -0.000117741496, -0.000241784524, -0.000273349462, -0.342067122, -0.939675629, 2.71805529e-005, 0.93967545, -0.342067212))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.296276689))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511566162, 0.399703979, 0.149036407, 1, -0.000117741496, -0.000241784524, 0.000273351296, 0.342066258, 0.939675927, -2.71806366e-005, -0.939675808, 0.342066348))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.416992188, 0.459632874, 0.00236076862, -0.000396448741, -0.00011150194, -1, 1.00000012, -0.000118754753, -0.000390655739, -0.000120005861, -0.999999881, 0.000111549271))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511650085, 0.416511536, 0.525382996, 1, -0.000115752191, -0.000241784524, -0.00019261126, 0.341972828, -0.939710021, 0.000194656575, 0.939709842, 0.341972768))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.41733551, 0.233234406, 0.0431079865, -0.000389445486, -9.04924964e-005, -1, -0.939651012, 0.342134237, 0.000329551112, 0.342135549, 0.939651072, -0.000216297456))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417289734, -0.156667709, 0.0191993713, -0.000339440623, -5.64659931e-005, -1, 0.34189257, -0.939738572, -6.10124189e-005, -0.939739287, -0.341893673, 0.000332859723))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.511569977, 0.00520896912, 0.39793396, 1, -0.000117748947, -0.000241783651, 7.42364064e-005, 0.984798372, -0.173700735, 0.000264478615, 0.17370075, 0.984798431))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, 0.0805511475, 0.250875473, -0.000396447169, -0.000101518206, -1, -0.939651966, 0.342131168, 0.000332358759, 0.342132419, 0.939652205, -0.000229052181))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417190552, -0.231136322, 0.100609779, -0.000371439994, -5.55074948e-005, -1, -0.984786391, 0.173769146, 0.000350451679, 0.173770443, 0.984786391, -0.000118204414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.41733551, 0.224536896, -0.0618000031, -0.000389446213, -9.54992574e-005, -1, -0.866084218, -0.499899626, 0.00038002769, -0.499898553, 0.866083205, 0.00010908363))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.430000007, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417160034, 0.255838394, -0.430774689, 0.000386443135, 7.55024375e-005, 1, -0.499885589, 0.866090715, 0.0001248958, -0.866091669, -0.499886721, 0.000367432192))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.200000003, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.416999817, -0.275058746, 0.355922699, -0.000391443638, -7.84819276e-005, -1, -0.642685592, 0.766129196, 0.000187732905, 0.766130328, 0.642686427, -0.000345908309))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.416999817, -0.283462524, -0.326116562, 0.000390444708, 8.55153776e-005, 1, -0.86596179, 0.500109196, 0.000290337892, -0.500110388, -0.865962446, 0.000266428367))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417144775, 0.175773621, -0.36309433, 0.000385444175, 8.25061143e-005, 1, 0.17377694, 0.984785199, -0.000147228187, -0.984785259, 0.173775703, 0.000359550351))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.41708374, 0.656784058, 0.361309052, 0.000403443235, 7.64833676e-005, 1, 0.866086483, 0.499895841, -0.000382644823, -0.499894738, 0.866085529, 0.000132548375))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417121887, -0.273510188, -0.377922058, -0.00039144812, -0.000107479427, -1, -0.000125929379, -0.99999994, 0.000107528424, -1.00000012, 0.000124670521, 0.000385655032))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417114258, 0.527671814, 0.117294312, 0.000399442564, 7.24904676e-005, 1, 0.866086483, 0.499895841, -0.000377183896, -0.499894738, 0.866085529, 0.000134006681))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417106628, 0.498235762, -0.367706299, 0.000391444686, 8.55152175e-005, 1, 0.000131913781, 0.999999881, -8.55665203e-005, -1, 0.000130660788, 0.000385653751))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417114258, -0.301620483, -0.465762138, 0.00038944374, 7.94954976e-005, 1, -0.98478663, 0.173767999, 0.000364013307, -0.17376928, -0.98478657, 0.000144955571))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417190552, 0.149868011, -0.202709198, -0.00038744061, -5.95283491e-005, -1, 0.765962422, -0.642884314, -0.000254067825, -0.642885566, -0.765963256, 0.000290961121))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.417068481, 0.459686279, 0.436964452, 0.000403446611, 9.84773505e-005, 1, 1.00000012, -0.000118754753, -0.000397655182, 0.000120006807, 0.999999881, -9.85254956e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417190552, -0.276691437, 0.103364944, -0.000395444047, -8.25045863e-005, -1, -0.939734519, -0.341907352, 0.000394390052, -0.34190613, 0.939733624, 5.56958839e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417366028, 0.413482666, 0.0416736603, -0.000389445486, -9.04924964e-005, -1, -0.865962803, 0.500107288, 0.000286984112, 0.500108421, 0.865963399, -0.00027023803))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.430000007, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417137146, -0.399623871, -0.145516396, -0.000394444418, -8.34882085e-005, -1, -0.984829068, -0.173529476, 0.000397255935, -0.173528224, 0.984828591, -1.47777164e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417182922, -0.285552979, 0.0272340775, -0.000394444069, -8.25047318e-005, -1, -0.984786272, 0.17377013, 0.000368414272, 0.173771366, 0.984786272, -0.00014878872))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, 0.0754985809, -0.157909393, -0.000396443676, -8.05076852e-005, -1, -0.342140973, -0.939649105, 0.000209311504, -0.939648867, 0.342139602, 0.000339541904))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417175293, -0.338485718, 0.120929718, -0.000390444038, -8.14921077e-005, -1, -0.765962422, 0.642884314, 0.000242248134, 0.642885625, 0.765963197, -0.000309715339))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417236328, -0.0827102661, 0.0710887909, -0.000400449906, -0.000118475073, -1, -0.939652264, 0.342130303, 0.000330318551, 0.342131466, 0.939652503, -0.000246354903))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417289734, 0.123802185, 0.0236358643, -0.00039244676, -9.84789949e-005, -1, -0.642691612, 0.766124129, 0.000173060107, 0.766125202, 0.642692447, -0.000359527301))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417167664, 0.186263442, -0.388122559, -0.00039144812, -0.000107479427, -1, -0.000125929379, -0.99999994, 0.000107528424, -1.00000012, 0.000124670521, 0.000385655032))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417289734, 0.0655403137, -0.000379562378, -0.000396447955, -0.000106495165, -1, -0.939732671, -0.341912329, 0.000403535814, -0.341911107, 0.939731777, 3.34964789e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417243958, -0.113883972, 0.0671386719, -0.000390446512, -9.74958384e-005, -1, -0.341900557, 0.939735591, 3.98970442e-005, 0.939736485, 0.341901779, -0.000394819508))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417358398, 0.214199066, 0.262556076, -0.000389446213, -9.54992574e-005, -1, -0.866084218, -0.499899626, 0.00038002769, -0.499898553, 0.866083205, 0.00010908363))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.430000007, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417411804, 0.384922028, 0.137599945, -0.000392445567, -9.15052951e-005, -1, -0.939733267, -0.341910571, 0.000394649367, -0.341909379, 0.939732552, 4.62137323e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.400000006, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.245194674, 0.25541091))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.417381287, 0.203924179, 0.28465271, -0.000391446025, -9.44856729e-005, -1, -0.342136979, -0.939650536, 0.000220734597, -0.939650416, 0.342135727, 0.000330064388))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504364014, 0.209217072, -0.0522956848, 0.000259542023, -0.000131598383, -1, -0.559294462, -0.828969836, -3.93007867e-005, -0.828969181, 0.559293211, -0.000293546414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504386902, 0.148723602, 0.193184853, 0.000262542424, -0.000129572334, -1, -0.96129477, -0.275523454, -0.000222236151, -0.275522202, 0.961294293, -0.000198487061))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1.29999995))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504257202, -0.134284973, -0.00554275513, 0.000261541747, -0.000133565642, -1, -0.913494468, 0.40685004, -0.000298538478, 0.406851172, 0.913494885, -1.32526311e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50428009, -0.195178986, 0.289588928, 0.000260543893, -0.000120571785, -1, -0.809087217, -0.587689757, -0.000144619378, -0.587688923, 0.809086084, -0.000254069426))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504295349, 0.0224113464, -0.154676437, 0.000263542519, -0.000128559201, -1, 0.970265985, -0.24203977, 0.00029243101, -0.242041096, -0.970266283, 5.95508573e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.349999994, 0.400000006))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504394531, 0.00591659546, 0.084854126, 0.000259542023, -0.000131598383, -1, -0.559294462, -0.828969836, -3.93007867e-005, -0.828969181, 0.559293211, -0.000293546414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504203796, 0.717723846, 0.156257629, -0.000248541008, 0.000139553944, 1, 0.694746673, 0.719255567, 7.63125136e-005, -0.719254673, 0.694745421, -0.000279876695))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504386902, 0.0999422073, 0.349708557, 0.000261540321, -0.000142595687, -1, 0.275510103, -0.96129775, 0.000210727507, -0.961298227, -0.275511324, -0.000217687237))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504226685, 0.298980713, -0.314445496, -0.000224551972, 7.15715869e-005, 1, 0.898846865, 0.43826443, 0.000175664987, -0.438263148, 0.89884603, -0.000165278834))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.600000024, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504394531, 0.00591659546, 0.084854126, 0.000259542023, -0.000131598383, -1, -0.559294462, -0.828969836, -3.93007867e-005, -0.828969181, 0.559293211, -0.000293546414))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504341125, 0.0844573975, -0.0917243958, 0.000261541747, -0.000133565642, -1, -0.913494468, 0.40685004, -0.000298538478, 0.406851172, 0.913494885, -1.32526311e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.899999976, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.265627563, 0.347358912))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496185303, -0.033338815, -0.231636047, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.224761769, 0.245194495))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496154785, 0.0279518738, 0.268928528, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.20432879, 0.34735921, 0.418873906))
PartWeld=CFuncs.Weld.Create(m,RightLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496192932, 0.140328363, 0.1820755, 1.00000012, -0.000117368945, -0.000372461276, -0.000118621472, -0.999999881, 9.2011076e-005, -0.000378251745, -9.19664453e-005, -1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200000003, 0.800000012, 1.10000002))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504501343, 0.496192932, 0.182048798, 0.000278538238, -0.000154578782, -1, -0.997555554, 0.069876954, -0.000294424593, 0.0698782951, 0.997555673, -0.000134334594))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504295349, 0.526973724, 0.0621414185, -0.000248541008, 0.000139553944, 1, 0.559296191, 0.828968585, 2.65537165e-005, -0.828967929, 0.559294999, -0.000288876297))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50440979, 0.132255554, 0.0659236908, 0.000260543165, -0.000124565253, -1, -0.913495183, 0.406848371, -0.000293964404, 0.406849533, 0.913495719, -5.43762144e-006))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504180908, 0.371734619, -0.189682007, 0.000231549464, -8.656313e-005, -1, 0.913494408, -0.40685004, 0.000252017577, -0.406851351, -0.913494885, -1.74815414e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504257202, -0.402713776, 0.0517959595, 0.000258544402, -0.000117591262, -1, 0.898846149, 0.438265622, 0.000186049961, 0.43826443, -0.898845375, 0.000221541355))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.300000012, 0.699999988))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50428009, -0.0886383057, 0.0971984863, 0.000259542488, -0.000129571839, -1, -0.913495183, 0.406848371, -0.000295087229, 0.406849504, 0.91349566, -1.04182855e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504249573, 0.213688374, -0.24924469, -0.000226548815, 9.15691489e-005, 1, 0.0698869452, 0.997555017, -7.51097541e-005, -0.997554898, 0.0698856264, -0.000238159919))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504272461, -0.273704529, 0.0105292797, 0.000258541375, -0.000135591763, -1, -0.997555614, 0.0698769987, -0.000273149926, 0.0698783323, 0.997555673, -0.000116791285))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504257202, 0.372005463, 0.267033577, -0.000228548219, 9.45794454e-005, 1, 0.96129477, 0.275523484, 0.000199199072, -0.275522202, 0.961294353, -0.000155482398))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504203796, -0.302482605, -0.169031143, -0.000228548772, 9.15694254e-005, 1, -0.828965902, 0.559297919, -0.000245465635, -0.559299171, -0.828966618, -5.51506855e-005))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504150391, -0.158781052, 0.506530762, -0.000224551128, 7.65783479e-005, 1, -0.55929637, -0.828968465, -6.53411553e-005, 0.82896781, -0.559295177, 0.000233767438))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.600000024, 0.300000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504264832, 0.147003174, -0.495708466, -0.000252541358, 0.000136604111, 1, -0.587679029, 0.809093356, -0.000262336369, -0.809094489, -0.587679863, -0.000128725864))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.504196167, -0.602104187, -0.254190445, -0.000258542714, 0.000127574982, 1, -0.96129477, -0.275523454, -0.000218941539, 0.275522202, -0.961294293, 0.000195465007))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 1))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.50428009, -0.195178986, 0.289588928, 0.000260543893, -0.000120571785, -1, -0.809087217, -0.587689757, -0.000144619378, -0.587688923, 0.809086084, -0.000254069426))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.400000006, 0.800000012))
Wedge=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Wedge",Vector3.new(0.20432879, 0.20432891, 0.326926023))
WedgeWeld=CFuncs.Weld.Create(m,RightLegHandle,Wedge,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.504386902, 0.148723602, 0.193184853, 0.000262542424, -0.000129572334, -1, -0.96129477, -0.275523454, -0.000222236151, -0.275522202, 0.961294293, -0.000198487061))
CFuncs.Mesh.Create("SpecialMesh",Wedge,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.699999988, 1.29999995))

LeftLegHandle=CFuncs.Part.Create(Character["Left Leg"],Enum.Material.Plastic,0,1,"Medium stone grey","LeftLegHandle",Vector3.new(1.0117017, 2.02340055, 1.01170254))
LeftLegHandleWeld=CFuncs.Weld.Create(m,Character["Left Leg"],LeftLegHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.000335693359, -0.000207066536, 0.000152587891, 1, 6.48181754e-007, 2.88981391e-006, 6.48181754e-007, 0.999999881, -4.58399541e-010, 2.88981391e-006, -4.58399541e-010, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0.6,"Really black","Part",Vector3.new(1.05,2.05,1.05))
Part.Shape = "Block" 
PartWeld=CFuncs.Weld.Create(m,LeftLegHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0,0,0))

LeftArmHandle=CFuncs.Part.Create(Character["Left Arm"],Enum.Material.Plastic,0,1,"Medium stone grey","LeftArmHandle",Vector3.new(1.0117017, 2.02340055, 1.01170254))
LeftArmHandleWeld=CFuncs.Weld.Create(m,Character["Left Arm"],LeftArmHandle,CFrame.new(0.015, 0, 0),CFrame.new(0, 0, 0))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0.6,"Really black","Part",Vector3.new(1.05,2.05,1.05))
Part.Shape = "Block" 
PartWeld=CFuncs.Weld.Create(m,LeftArmHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0,0,0))




HeadHandle=CFuncs.Part.Create(Character["Head"],Enum.Material.Plastic,0,1,"Medium stone grey","LeftArmHandle",Vector3.new(1.0117017, 2.02340055, 1.01170254))
HeadHandleWeld=CFuncs.Weld.Create(m,Character["Head"],HeadHandle,CFrame.new(0.015, 0, 0),CFrame.new(0, 0, 0))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0.6,"Really black","Part",Vector3.new(1.265,1.265,1.265))
Part.Shape = "Block" 
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Head,"",Vector3.new(0, 0, 0),Vector3.new(1,1,1))
PartWeld=CFuncs.Weld.Create(m,HeadHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(.01,0,0))
trans = 1


for i,v in pairs(m:GetChildren()) do
if v.ClassName == "Part"	then
v.CanCollide = false

--v.Transparency = trans

	
end
end
attack = true
RootPart.Anchored = true
local fake = Instance.new("Part", Torso)
fake.Size = Vector3.new(.1,.2,.1)
fake.Transparency = 1
fake.Anchored = true
fake.Material = "Neon"
fake.CanCollide = false
fake.BrickColor = BrickColor.new("Really black")
fake.CFrame = Torso.CFrame * CFrame.new(0,-3,0)
fake1 = Instance.new("CylinderMesh", fake)
SpawnAnim1()

wait(0.5)
local val = 5
while wait() and fake and fake.Transparency >= 0 do
	fake.Transparency  =fake.Transparency - 0.04
	val = val - 0.1
	fake1.Scale = fake1.Scale + Vector3.new(val,0,val)
end

--Character.Head.face:Destroy()
for i = 1,91 do
wait()
trans = trans - .01
for i,v in pairs(m:GetChildren()) do
if v.ClassName == "Part"	then
--v.Transparency = trans
	

	fake1.Scale = fake1.Scale - Vector3.new(.0025,0,.0025)
	
end
end
end
fake:Destroy()

wait(1)
--]]
SpawnAnim2()
RootPart.Anchored = false
end



Humanoid.DisplayDistanceType="None"
Humanoid.HealthDisplayDistance=0
Humanoid.NameDisplayDistance=0
Humanoid.NameOcclusion="EnemyOcclusion"



Armor()




-------------------------------------------------------
local Orbd = Instance.new("Part", Character)
Orbd.Name = "Orbd"
Orbd.Shape = Enum.PartType.Block
Orbd.CanCollide = false
Orbd.BrickColor = BrickColor.new("White")
Orbd.Transparency = 1
Orbd.Material = "Neon"
Orbd.Size = Vector3.new(0.2, 0.3, 0.2)
Orbd.TopSurface = Enum.SurfaceType.Smooth
Orbd.BottomSurface = Enum.SurfaceType.Smooth

local Weld = Instance.new("Weld", Orbd)
Weld.Part0 = Character.Head
Weld.Part1 = Orbd
Weld.C1 = CFrame.new(-0.2, -0.2, 0.49)

local M1 = Instance.new("SpecialMesh")
M1.Parent = Orbd
M1.MeshType = "Sphere"
M1.Scale = Vector3.new(1,0,1)
--------------------------------------------------------
local Orbvc = Instance.new("Part", Character)
Orbvc.Name = "Orbvc"
Orbvc.Shape = Enum.PartType.Block
Orbvc.CanCollide = false
Orbvc.BrickColor = BrickColor.new("White")
Orbvc.Transparency = 1
Orbvc.Material = "Neon"
Orbvc.Size = Vector3.new(0.2, 0.3, 0.2)
Orbvc.TopSurface = Enum.SurfaceType.Smooth
Orbvc.BottomSurface = Enum.SurfaceType.Smooth



local Weld = Instance.new("Weld", Orbvc)
Weld.Part0 = Character.Head
Weld.Part1 = Orbvc
Weld.C1 = CFrame.new(0.2, -0.2, 0.49)

local M2 = Instance.new("SpecialMesh")
M2.Parent = Orbvc
M2.MeshType = "Sphere"
M2.Scale = Vector3.new(1,0,1)
---------------------------------------------------------
trailwait = false
function PortalEffect()
for i,v in pairs(Torso:GetChildren()) do
                  if v:IsA("Part") and v.Name == "trap" then
	
Effects.Wave.Create(BrickColor.new("Really black"), v.CFrame, 0, -.2, 0, .7, .02, .7, 0.08)	
v.CFrame = CFrame.new(v.CFrame.x,v.CFrame.y,v.CFrame.z) * angles(math.rad(0), math.rad(0 + 1000 * math.cos(sine)), math.rad(0))

end
end

end




function trail()
if trailwait == false and attack == false and Anim == "Idle" then
	trailwait = true
Effects.Sphere.Create(BrickColor.new("Really black"), RootPart.CFrame, 20, 10, 20,      .8, -.05, .8,      -2.94 ,0.004)	
wait(.5)
trailwait = false
end


if trailwait == false and attack == false and  Anim == "Walk" then
	trailwait = true
Effects.Sphere.Create(BrickColor.new("Really black"), RootPart.CFrame, 30, 10, 30,      .4, -.05, .4,      -2.94 ,0.005)	
wait(.3)
trailwait = false
end

end




function attack1()
	
	
	
	
		
					attack = true
RootPart.Anchored = true

Character.Humanoid.WalkSpeed = 0
Effects.Wave.Create(BrickColor.new("Really black"), RootPart.CFrame, 1, 1, 1, 0.2, .5, 0.2, 0.07)
							Effects.Block.Create(BrickColor.new("Really black"), RootPart.CFrame, 2, 2, 2, 10.2, 10.2, 10.2, 0.07)
wait()

				for i = 0, 2, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,-4) * angles(math.rad(90), math.rad(0), math.rad(0)), .4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
			end
				for i = 0, 1, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,-60,-4) * angles(math.rad(90), math.rad(0), math.rad(0)), 1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
						end
EFS3:Play()						
				for i = 0, .1, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,-60,-4) * angles(math.rad(0), math.rad(0), math.rad(180)), 1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
				end	
				Effects.Wave.Create(BrickColor.new("Really black"), Head.CFrame, 1, 1, 1, 0.2, 0.5, 0.2, 0.07)		
											Effects.Block.Create(BrickColor.new("Really black"), Torso.CFrame, 2, 2, 2, 10.2, 10.2, 10.2, 0.07)		
EFS.SoundId = "rbxassetid://518230185"
EFS:Play()		
				for i = 0, 2, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,-60,0) * angles(math.rad(0), math.rad(0), math.rad(180)), .2)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
			end						
local targetV5 = Character.Torso.CFrame				
wait()
				for i = 0, 0, 1 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(0)), 1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
			end

Character.HumanoidRootPart.CFrame = targetV5	

	
			attack = false
			
Character.Humanoid.WalkSpeed = 3
			RootPart.Anchored = false	
	
	
	
	
	
	
end




function attack2()
		attack = true

					for i = 0, 1, 0.05 do	
					
						Character.Humanoid.WalkSpeed = .5							
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,-3.6) * angles(math.rad(90), math.rad(0), math.rad(0)), .4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(90), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(0, .5, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RW.C0 = clerp(RW.C0, CFrame.new(0, .5, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		RH.C0 = clerp(RH.C0, cn(0, 1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LH.C0 = clerp(LH.C0, cn(0, 1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
					end
				
for i = 1,121 do
	wait()
	Character.Humanoid.JumpPower = 0	
	Character.Humanoid.WalkSpeed = 40
Effects.Wave.Create(BrickColor.new("Really black"), Torso.CFrame, 4, -4, 1.02, -0.1, 0.001, -.005 , 0.03)			
Effects.Break.Create(BrickColor.new("Really black"), Torso.CFrame, 0.2, 0.2, 0.2,0.7)
	
end		

					
											Effects.Block.Create(BrickColor.new("Really black"), Torso.CFrame, 2, 2, 2, 6.2, 6.2, 6.2, 0.07)					
	Character.Humanoid.JumpPower = 50				
	Character.Humanoid.WalkSpeed = 3				
					
					
					
			attack = false			
end






function blink()
wait()
      for i = 0, 1, 0.1 do
        swait()
        M1.Scale = Vector3.new(1, 0.2 + 0.3 * i, .9)
        M2.Scale = Vector3.new(1, 0.2 + 0.3 * i, .9)
      end
wait(1)
      for i = 0, 1, 0.2 do
        wait()
        M1.Scale = Vector3.new(1, 0.7 - 1 * i, 1)
        M2.Scale = Vector3.new(1, 0.7 - 1 * i, 1)
      end
      for i = 0, 1, 0.2 do
        swait()
        M1.Scale = Vector3.new(1, 0.7 + 0.3 * i, 1)
        M2.Scale = Vector3.new(1, 0.7 + 0.3 * i, 1)
      end
    while true do wait()

      swait(math.random(220, 440))
      for i = 0, 1, 0.05 do
        wait()
        M1.Scale = Vector3.new(1, 0.7 - 1 * i, 1)
        M2.Scale = Vector3.new(1, 0.7 - 1 * i, 1)
      end
      for i = 0, 1, 0.05 do
        swait()
        M1.Scale = Vector3.new(1, 0.7 + 0.3 * i, 1)
        M2.Scale = Vector3.new(1, 0.7 + 0.3 * i, 1)
      end
    end
end








EFS.SoundId = "rbxassetid://177359995"
EFS:Play()

wait(.5)

Sound = Instance.new("Sound")
Sound.Parent = Torso
Sound.SoundId = "rbxassetid://649587991"
Sound.Volume = 5
Sound.Looped = true
Sound:Play()


Character.Humanoid.MaxHealth = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
Character.Humanoid.Health = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
game:GetService("RunService"):BindToRenderStep("ew", 0, function()
if Character.Humanoid.Health <=9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 then

Character.Humanoid.Health = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
end
end)

mouse.KeyDown:connect(function(key)
	if key == "z" and attack == false then
 attack1()
	end
end)



mouse.KeyDown:connect(function(key)
	if key == "x" and attack == false then
		 attack2()
	end
	end)



mouse.KeyDown:connect(function(key)
	if key == "v" then

if autofind == false then
autofind = true
else 
autofind = false		
end

end
end)


wait2 = false
mouse.KeyDown:connect(function(key)
	if key == "e" and wait2 == false then
		wait2 = true

			


EFS.SoundId = "rbxassetid://177359995"
EFS:Play()






wait(3.4)
wait2 = false
	end
	end)


hitwait = false










function onTouch(part)
if part.Parent and not part.Parent:IsA("Model") then return end

local humanoid = part.Parent:FindFirstChild("Humanoid")
local model = part.Parent
local torso = part.Parent:FindFirstChild("Torso")
local head = part.Parent:findFirstChild("Head")
local leftleg = part.Parent:findFirstChild("Left Leg")
local rightleg = part.Parent:findFirstChild("Right Leg")
local leftarm = part.Parent:findFirstChild("Left Arm")
local rightarm = part.Parent:findFirstChild("Right Arm")
	if hitwait == false and attack == false and model.Name == "Effects" == false then
	
hitwait = true			
---------------------------R15-------------------------------------------------

-------------------------------------------------------------------------------

	

if (humanoid ~=nil) and humanoid.Health >0.01 then
Effects.Block.Create(BrickColor.new("Really black"), head.CFrame, 2, 2, 2, 10.2, 10.2, 10.2, 0.07)
humanoid.Health = 100
attack = true
				for i = 0, 6, .5 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(-25)), .4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.2)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(160), math.rad(0), math.rad(90)), 0.2)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
				end
				ATS:Play()
								for i = 0, 5, .5 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(25)), .4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(0), math.rad(0)), .4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(-20), math.rad(0), math.rad(0)), 0.2)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(90), math.rad(0), math.rad(-20)), 0.2)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
			end
attack = false
end
	end

	hitwait = false
end
hitwait2 = false
 function onTouch2(part)

local humanoid = part.Parent:findFirstChild("Humanoid")
local model = part.Parent
local torso = part.Parent:FindFirstChild("Torso")
local head = part.Parent:findFirstChild("Head")
local leftleg = part.Parent:findFirstChild("Left Leg")
local rightleg = part.Parent:findFirstChild("Right Leg")
local leftarm = part.Parent:findFirstChild("Left Arm")
local rightarm = part.Parent:findFirstChild("Right Arm")
local rootpart = part.Parent:findFirstChild("HumanoidRootPart")
	if hitwait2 == false then 
	
hitwait2 = true			


	

 if (humanoid ~=nil) and humanoid.Health >0 and model.Name == ""..Character.Name == false and model.Name == "Effects" == false then
Effects.Block.Create(BrickColor.new("Really black"), head.CFrame, 2, 2, 2, 10.2, 10.2, 10.2, 0.07)

rootpart.Anchored = true
for i=1,120 do 
rootpart.CFrame = CFrame.new(rootpart.CFrame.x,rootpart.CFrame.y - .1,rootpart.CFrame.z)
wait()
end
rootpart.Anchored = false




local qw2 = Instance.new("Part",game.Workspace)
local qw3 = Instance.new("SpecialMesh",qw2)
local derp = CFrame.new(10050,1,10050)

qw2.CFrame = derp 
qw2.Name = 'sky'
qw2.Anchored = true 
qw3.MeshId = "rbxassetid://1527559"
 qw3.TextureId = "rbxassetid://1529455"
 qw3.Scale = Vector3.new(-1800,-2080,-1800)
 qw3.VertexColor = Vector3.new(0,.01,.01)

for i=1,200 do --100 is the amount of the bricks, change it if you want.
local qw = Instance.new("Part",game.Workspace)
qw.Shape = "Block"
qw.Size = Vector3.new(8+i/12, 8+i/99, 8+i/12) --The size of the bricks
qw.CFrame = CFrame.new(derp.x+i*math.random(), derp.y+i/20+math.random(1,2), derp.z+i*math.random()) --Position
qw.BrickColor = BrickColor.new("Black") --The colour of the mountain
qw.Anchored = true
qw.Name = "Part"
qw.TopSurface = "Smooth"
qw.BottomSurface = "Smooth"
qw.Material = "Granite"
        game:service'Debris':AddItem(qw, 50)
       
qw.Parent = game.Workspace
end
 game:service'Debris':AddItem(qw2, 50)
--GeniusBuilder--
wait()
    
model:MoveTo(Vector3.new(10100,101,10100))


ehp = 100
ehp2 = ehp/200	




for i=1,400 do 


	if (humanoid ~=nil) and humanoid.Health >0 then
humanoid.WalkSpeed = 4		
Effects.Break.Create(BrickColor.new("Really red"), head.CFrame, 0.2, 0.2, 0.2,0.7)	
humanoid:TakeDamage(0)
print(''..humanoid.Health)
for i=1,5 do

wait()
end

	end
end
	if (humanoid ~=nil) and humanoid.Health >0 then
		for i=1,10 do 
humanoid.Health = 100
wait()
end
end
print('your pocket dimension killed '..model.Name)
end
	end
wait(1)
	hitwait2 = false
end


Torso.Touched:connect(onTouch)

wait3 = false
hidden = false
thetrap = false
mouse.KeyDown:connect(function(key)
	if key == "c" then		
		if hidden == false and wait3 == false and attack == false then
		hidden = true
		wait3 = true
		Character.Humanoid.JumpPower = 0
attack = true
Character.Humanoid.WalkSpeed = 0

				for i = 0, 5, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,-10) * angles(math.rad(15), math.rad(0), math.rad(0)), .05)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(45), math.rad(0), math.rad(0)), .2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(25), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(25), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -.3, -.5) * RHCF * angles(math.rad(0), math.rad(0), math.rad(-15)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -.3, -.5) * LHCF * angles(math.rad(0), math.rad(0), math.rad(15)), .1)
			end
Character.Humanoid.WalkSpeed = 3

end
							

			
		if hidden == true and wait3 == false then	
		wait3 = true
		hidden = false

EFS3:Play()	
Character.Humanoid.WalkSpeed = 0
				for i = 0, 5, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(0)), .03)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-25), math.rad(0), math.rad(0)), .2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(-0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(160), math.rad(0), math.rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
			end		
Character.Humanoid.WalkSpeed = 3	
		Character.Humanoid.JumpPower = 50		
		
attack = false
	

end
wait()
wait3 = false		
end
end)
mouse.KeyDown:connect(function(key)
	if key == "q" and attack == false then
		attack = true
if thetrap == false then
Character.Humanoid.WalkSpeed = 0
Character.Humanoid.JumpPower = 0

				for i = 0, 2, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
			end



thetrap = true
local fake = Instance.new("Part", Torso)
fake.Size = Vector3.new(3.1,.4,3.1)
fake.Transparency = 1
fake.Anchored = true
fake.Material = "Neon"
fake.Name = "LoadingTrap...."
fake.CanCollide = false
fake.BrickColor = BrickColor.new("Really black")
fake.CFrame = Torso.CFrame * CFrame.new(0,-3,0)
fake1 = Instance.new("CylinderMesh", fake)
fake1.Scale = Vector3.new(2.5,1,2.5)



				for i = 0, 5, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,-6) * angles(math.rad(0), math.rad(0), math.rad(0)), .05)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
			end

--[[
for i=1,70 do
	
fake.Transparency = fake.Transparency -.01	

	wait()
	
 end
]]

fake.Touched:connect(onTouch2)
fake.Name = "trap"
				for i = 0, 5, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(0)), .05)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-25), math.rad(0), math.rad(0)), .2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(-20)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(20)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
			end



wait()
	Character.Humanoid.WalkSpeed = 3
Character.Humanoid.JumpPower = 50

else
Character.Humanoid.WalkSpeed = 0
Character.Humanoid.JumpPower = 0

				for i = 0, 1, 0.05 do				
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0,0,0) * angles(math.rad(0), math.rad(0), math.rad(0)), .2)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(25), math.rad(0), math.rad(0)), .2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
			end
--[[
for i,v in pairs(Torso:GetChildren()) do
                  if v:IsA("Part") and v.Name == "trap" then
	
	
	
	
for i=1,70 do
	
v.Transparency = v.Transparency +.01	

	wait()
	
	 end	
	
	
	v:Destroy()
	
	wait()
	
	
end
end
]]
	Character.Humanoid.WalkSpeed = 3
Character.Humanoid.JumpPower = 50
thetrap = false
end







attack = false


	end
	end)










AutoStuff=function()
	if attack == false and wait2 == false then
	local r=math.random(1,500)
		

	if r==1 then
	attack1()
	end
	if r==2 then
	attack2()
	end
	if r==3 then
		wait2 = true
Humanoid.Jump = true
wait(1.5)
wait2 = false
	end
	if r==4 then
		wait2 = true
		EFS.SoundId = "rbxassetid://177359995"
EFS:Play()
wait(1.5)
wait2 = false
	end

	
	
	
end
end	
	
	





function findNearestTorso(pos)
	local list = game.Workspace:children()
	local torso = nil
	local dist = 10000
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if (temp2.className == "Model") and (temp2 ~= Character) then
			temp = temp2:findFirstChild("HumanoidRootPart")
			human = temp2:findFirstChild("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0) then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end

game:GetService("RunService"):BindToRenderStep("ew", 0, function()

local r2=math.random(1,500)
if r2==1 then
	for i=1,10 do
PortalEffect()	
wait()
end
end
end)
game:GetService("RunService"):BindToRenderStep("ew", 0, function()
trail()	
end)

game:GetService("RunService"):BindToRenderStep("ew", 0, function()
	
	
	
	wait()
	if autofind == true then
	local target = findNearestTorso(Character.HumanoidRootPart.Position)
	if target ~= nil then
		Humanoid:MoveTo(target.Position, target)
		AutoStuff()
	end
Orbd.BrickColor = BrickColor.new("Really red")
Orbvc.BrickColor = BrickColor.new("Really red")
else
Orbd.BrickColor = BrickColor.new("White")
Orbvc.BrickColor = BrickColor.new("White")	
end
end)




NoClipCons = {} 
if #NoClipCons == 0 then 
local con = game:service("RunService").Stepped:connect(function() 
pcall(function() Player.Character.Torso.CanCollide = false end) 
pcall(function() Player.Character.Head.CanCollide = false end) 
end) 
table.insert(NoClipCons, con) 
else 
for i, v in pairs(NoClipCons) do 
v:disconnect() 
table.remove(NoClipCons, i) 
end 
end 


blink()
