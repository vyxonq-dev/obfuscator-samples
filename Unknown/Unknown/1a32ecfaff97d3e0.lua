--[[ 

Leaked by Kass
Edit by HelloMyFrlen3

Hats need:
https://www.roblox.com/catalog/7548993875/Slasher

]]--

wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Hello Edits: Info";
    Text = "Leaked by Kass";
    Duration = "8";
})
warn("[Hello Edits] Leaked by Kass")
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Hello Edits: Edit";
    Text = "Edited by Hello Edits (Discord : discord.gg/XgQtumaqH9)";
    Duration = "9";
})
warn("Edited by Hello Edits (Discord : discord.gg/XgQtumaqH9)")

wait(2)



local shake = true
local Util = {}

RS = game:GetService("RunService").RenderStepped

function Util:Tween(Obj, Dir, Style, Duration, Goal)
    local tweenService    = game:GetService("TweenService")
    local tweenInfo        = TweenInfo.new(
        Duration,
        Enum.EasingStyle[Style],
        Enum.EasingDirection[Dir]
    )
    local tween = tweenService:Create(Obj,tweenInfo,Goal)
    tween:Play()
    return tween
end

 -- its in case u wanna replicate deez songs :troll:
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
	if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
	game:GetService("RunService").Heartbeat:connect(function()
	v.Velocity = Vector3.new(31,0,0)
	end)
	end
	end
	mode = 1
	Bypass = "death"
	loadstring(game:GetObjects("rbxassetid://5325226148")[1].Source)()
	for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
	if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
	game:GetService("RunService").Heartbeat:connect(function()
	v.Velocity = Vector3.new(0,30,0)
	wait(0.5)
	end)
	end
	end
	local p = game.Players.LocalPlayer
	local char = p.Character
	local mouse = p:GetMouse()
	local larm = char["Left Arm"]
	local rarm = char["Right Arm"]
	local lleg = char["Left Leg"]
	local rleg = char["Right Leg"]
	local hed = char.Head
	local torso = char.Torso
	local hum = char.Humanoid
	local cam = game.Workspace.CurrentCamera
	local root = char.HumanoidRootPart
	for i,v in pairs (char:GetChildren()) do
		if v:IsA("Accessory") then
			v.Handle.Massless = true
			v.Handle.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
		end
	end
	hed.Massless = true
	hed.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	torso.Massless = true
	torso.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	rarm.Massless = true
	rarm.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	larm.Massless = true
	larm.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	lleg.Massless = true
	lleg.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	rleg.Massless = true
	rleg.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	root.Massless = true
	root.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	warn("Netless Activated!")
	Bypass = "Death"
	plr = game.Players.LocalPlayer
	dead = false
	char = plr.Character
	
	
	
	bullet = workspace[plr.Name]["HumanoidRootPart"]
	bullet.Transparency = 0.6
bullet.BrickColor = BrickColor.new("Really red")
bullet.Material = "Neon"
	bhandle = bullet
	bullet.Massless = true
	
	mouse = plr:GetMouse()
	head = char.Head
	camera = workspace.CurrentCamera
	lt = true
	ltt = false
	charascum = Instance.new("BodyAngularVelocity")
charascum.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
charascum.AngularVelocity = Vector3.new(9e9,9e9,9e9)
charascum.MaxTorque = Vector3.new(9e9,9e9,9e9)
charascum.P = Vector3.new(9e9,9e9,9e9)
	local function IsFirstPerson()
		 return (head.CFrame.p - camera.CFrame.p).Magnitude < 1
	end
	
		 bbv = Instance.new("BodyPosition",bhandle)
		 bbv.Position = char.Torso.CFrame.p
	   
		 
		 
		 mouse.Button1Down:Connect(function()
			 if dead == false then
			lt = false
			ltt = false
		 bbav = Instance.new("BodyAngularVelocity",bhandle)
		 bbav.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		 bbav.P = 1000000000000000000000000000
		 bbav.AngularVelocity = Vector3.new(10000000000000000000000000000000,100000000000000000000000000,100000000000000000)
		 game:GetService("Debris"):AddItem(bbav,0.1)
			if game.Players:GetPlayerFromCharacter(mouse.Target.Parent) then
				if mouse.Target.Parent.Name == char.Name or mouse.Target.Parent.Name == "non" then return end
				  --repeat 
				game:GetService("RunService").RenderStepped:Wait()
				bbv.Position = (CFrame.new(mouse.Target.Parent.HumanoidRootPart.CFrame.p,char.Torso.CFrame.p) * CFrame.new(0,0,0)).p
				bhandle.Position = (CFrame.new(mouse.Target.Parent.HumanoidRootPart.CFrame.p,char.Torso.CFrame.p) * CFrame.new(0,0,0)).p
				wait(1)
				--until char.Humanoid.Health == 100 or char.Humanoid.Health == 0
			elseif game.Players:GetPlayerFromCharacter(mouse.Target.Parent.Parent) then
				if mouse.Target.Parent.Name == char.Name or mouse.Target.Parent.Name == "non" then return end
				--repeat 
				game:GetService("RunService").RenderStepped:Wait()
				bbv.Position = (CFrame.new(mouse.Target.Parent.Parent.HumanoidRootPart.CFrame.p,char.Torso.CFrame.p) * CFrame.new(0,0,0)).p
				bhandle.Position = (CFrame.new(mouse.Target.Parent.Parent.HumanoidRootPart.CFrame.p,char.Torso.CFrame.p) * CFrame.new(0,0,0)).p
				wait(1)
				--until char.Humanoid.Health == 100 or char.Humanoid.Health == 0
				
				else
		   -- repeat 
			game:GetService("RunService").RenderStepped:Wait()
			wait(1)
			--until char.Humanoid.Health == 100 or char.Humanoid.Health == 0
			end
			wait()
			lt = true
			 end
			 end)
			 
		spawn(
			function()
				while true do
					game:GetService("RunService").Heartbeat:Wait()
					bullet.Velocity = Vector3.new(0,26,0)
			 end
		end)
	
	 plr:GetMouse().Button1Down:Connect(function()
	attackingwithhrp = true	
	end)
	
	 
	plr:GetMouse().Button1Up:Connect(function()
	attackingwithhrp = false
	end)
	
	plr:GetMouse().Button1Down:Connect(function()
	repeat wait() until attackingwithhrp == true
	repeat
	game:GetService("RunService").Heartbeat:Wait()
	if plr:GetMouse().Target ~= nil then
	bullet.Position = game:GetService("Players").LocalPlayer:GetMouse().Hit.p
	end
	until attackingwithhrp == false
	end)

wait(1/60)
for i,v in pairs(char:GetChildren()) do -- gets all ur characters children
if v:IsA("Accessory") and v.Name == "Starslayer Railgun" then -- dex name for the hat 
v.Name = "Back_AccAccessory" -- name it whatever you want
end
end




att0 = Instance.new("Attachment",char["Back_AccAccessory"].Handle) -- creates a attachment into the hat
att0.Orientation = Vector3.new(50, -88, 0) -- rotation
att0.Position = Vector3.new(-1.5, 0.6, 0) -- position

att1 = Instance.new("Attachment",char["Right Arm"]) -- what body part that the hat should be attached to (to make it work with r15 go down
-- make it a r15 body part name or just do humanoidroopart

ap = Instance.new("AlignPosition",char["Back_AccAccessory"].Handle) -- align position
ap.Attachment0 = att0
ap.Attachment1 = att1
ap.RigidityEnabled = true -- if its false it will make the hat be wobbly


ao = Instance.new("AlignOrientation",char["Back_AccAccessory"].Handle) -- align rotation
ao.Attachment0 = att0
ao.Attachment1 = att1
ao.RigidityEnabled = true
local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local CF = {N=CFrame.new,A=CFrame.Angles,fEA=CFrame.fromEulerAnglesXYZ}
local C3 = {tRGB= function(c3) return c3.r*255,c3.g*255,c3.b*255 end,N=Color3.new,RGB=Color3.fromRGB,HSV=Color3.fromHSV,tHSV=Color3.toHSV}
local V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}
local M = {C=math.cos,R=math.rad,S=math.sin,P=math.pi,RNG=math.random,MRS=math.randomseed,H=math.huge,RRNG = function(min,max,div) return math.rad(math.random(min,max)/(div or 1)) end}
local R3 = {N=Region3.new}
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players

Player = game.Players.LocalPlayer
Character = workspace.non
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = workspace.non
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
local TIME = 0
local sick = Instance.new("Sound",Torso)
kan = sick
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
local FORCERESET = false
Frame_Speed = 1 / 60
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = true
local COMBO = 3
local Rooted = false
local SINE = 5
Player_Size = 1
SIZE = 1
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
--ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "BanishV4Gui"
local Weapon = IT("Model")
Weapon.Name = "Adds"
local Effects = IT("Folder", Weapon)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character:FindFirstChild("Animate")
local UNANCHOR = true
local TOBANISH = {}
local TAIL = {}
local Func = Instance.new("RemoteFunction")
local MODE = "VoidWalker"
function Tween(obj,props,time,easing,direction,repeats,backwards)
	local info = TweenInfo.new(time or .5, easing or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out, repeats or 0, backwards or false)
	local tween = S.TweenService:Create(obj, info, props)
	
	tween:Play()
end
sick = Instance.new("Sound", Character)
sick.Volume = 10
sick.TimePosition = 0
sick.PlaybackSpeed = 1
sick.Pitch = 1
sick.SoundId = "rbxassetid://3055588389"
sick.Name = "wrecked"
sick.Looped = true
sick:Play()

local NAMEBILL = Instance.new("BillboardGui",Character)
NAMEBILL.AlwaysOnTop = true
NAMEBILL.Size = UDim2.new(0, 0,0, 0)
NAMEBILL.StudsOffset = Vector3.new(0,2,0)
NAMEBILL.MaxDistance = 10000
NAMEBILL.Adornee = Head
NAMEBILL.Name = "NameBillboard"
local NAMEMODE = Instance.new("TextLabel",NAMEBILL)
NAMEMODE.BackgroundTransparency = 0.6
NAMEMODE.BackgroundColor3 = Color3.new(0.50,0,0)
NAMEMODE.TextScaled = false
NAMEMODE.BorderSizePixel = 0
NAMEMODE.Text = "Sea-Walker"
NAMEMODE.Font = "Antique"
NAMEMODE.TextSize = 24
NAMEMODE.TextStrokeTransparency = 0
NAMEMODE.Size = UDim2.new(1,0,0.5,0)
NAMEMODE.Parent = NAMEBILL
NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
NAMEMODE.TextStrokeColor3 = Color3.new(0, 0, 0)
game:GetService("Lighting").ClockTime = 0
game:GetService("Lighting").Brightness = 0
game:GetService("Lighting").FogColor = Color3.new(0,0,0)
game:GetService("Lighting").FogEnd = 100
game:GetService("Lighting").Ambient = Color3.new(0.7,0.5,0.5)
game:GetService("Lighting").OutdoorAmbient = Color3.new(0.7,0.5,0.5)
local light = Instance.new("SurfaceLight",char["Head"])
light.Face = "Bottom"
light.Brightness = 10
light.Angle = 180
light.Color = Color3.new(255,0,0)

--//=================================\\
--\\=================================//

--//=================================\\
--||          COMPATIBILTY
--\\=================================//

cf = CF
angles = ANGLES
sine = SINE
mouse = Mouse
RH = RightHip
LH = LeftHip
RW = RightShoulder
LW = LeftShoulder
clerp = Clerp
necko = NECKC0
RootCF = ROOTC0

--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

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
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
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

NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
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


local naeeym2 = Instance.new("BillboardGui",Character)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(7,35,3,15)
naeeym2.StudsOffset = Vector3.new(0,2,0)
naeeym2.MaxDistance = 10000
naeeym2.Adornee = Head
naeeym2.Name = "Name2"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BackgroundColor3 = Color3.new(0.2,0,0)
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = "Sea-Walker"
tecks2.Font = "Highway"
tecks2.TextSize = 35
tecks2.TextStrokeTransparency = 0
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2
tecks2.TextColor3 = Color3.new(1,0,0)
coroutine.resume(coroutine.create(function()
				while true do
					Swait()
					tecks2.Font = tecks2.Font
				end
			end))
local thetext = tecks2.Text
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


			
function chatfunc(text)
	local chat = coroutine.wrap(function()
	if Character:FindFirstChild("TalkingBillBoard")~= nil then
		Character:FindFirstChild("TalkingBillBoard"):destroy()
	end
	local Bill = Instance.new("BillboardGui",Character)
	Bill.Size = UDim2.new(0,35,0,18)
	Bill.StudsOffset = Vector3.new(0,4.5,0)
	Bill.Adornee = Character.Head
	Bill.Name = "TalkingBillBoard"
	local Hehe = Instance.new("TextLabel",Bill)
	Hehe.BackgroundTransparency = 1
	Hehe.BorderSizePixel = 0
	Hehe.Text = ""
	Hehe.Font = tecks2.Font
	Hehe.TextSize = 23
	Hehe.TextStrokeTransparency = 0
Hehe.TextColor3 = tecks2.TextColor3
	Hehe.Size = UDim2.new(1,0,0.5,0)
	coroutine.resume(coroutine.create(function()
		while Hehe ~= nil do
			wait()	
			
		end
	end))
	spawn(function() RainbowifyText(Hehe) end)
	for i = 1,string.len(text),1 do
		wait()
		Hehe.Text = string.sub(text,1,i)
	end
	wait(3)
	for i = 0, 5, .025 do
		wait()
		Bill.ExtentsOffset = Vector3.new(math.random(-i, i), math.random(-i, i), math.random(-i, i))
		Hehe.TextStrokeTransparency = i
		Hehe.TextTransparency = i
	end
	Bill:Destroy()
	end)
chat()
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
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end
local boomboxpart = CreatePart(0, Character, "SmoothPlastic", 0, 1, "Bright blue", "GunPartXD", VT(1.1, 1.1, 1.1),false)
local boomweld = CreateWeldOrSnapOrMotor("Weld", Torso, Torso, boomboxpart, CF(0*SIZE,-.5*SIZE,0*SIZE), CF(0, 0, 0))
local UsingBoombox = false
local boomboxname = ""
function Align(part0,part1,pos,rot)
pcall(function()
Instance.new("Attachment",part0.Handle)
Instance.new("AlignPosition",part0.Handle)
Instance.new("AlignOrientation", part0.Handle)
Instance.new("Attachment",part1)
part0.Handle.AlignPosition.Attachment0 = part0.Handle.Attachment
part0.Handle.AlignOrientation.Attachment0 = part0.Handle.Attachment
part0.Handle.AlignPosition.Attachment1 = part1.Attachment
part0.Handle.AlignOrientation.Attachment1 = part1.Attachment
part0.Handle.Attachment.Position = pos
part0.Handle.Attachment.Orientation = rot
part0.Handle.AlignPosition.Responsiveness = 200
part0.Handle.AlignOrientation.Responsiveness = 200
part0.Handle.AlignPosition.RigidityEnabled = true
part0.Handle.AlignOrientation.RigidityEnabled = true
end)
end
local TryBoombox = pcall(function() 
boomboxname = Character:FindFirstChildOfClass("Tool").Name
boomboxname.CanCollide = false
wait(1)
Align(boomboxname,char.Torso,Vector3.new(-0.35,0,0),Vector3.new(0,0,-90))
if boomboxname ~= nil then
UsingBoombox = true
else
UsingBoombox = false
end
end)
--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
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
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
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
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end

function timeposition(position)
pcall(function()
kan.TimePosition = position
end)
pcall(function()
char.Parent.Parent[boomboxname].Handle:FindFirstChildOfClass("Sound").TimePosition = position
end)
end
local actual_last_song = nil
function gettheboomboxsong()
pcall(function()
kan.SoundId = kan.SoundId
end)
pcall(function()
char.Parent.Parent[boomboxname]:FindFirstChildOfClass("RemoteEvent"):FireServer("PlaySong", (kan.SoundId:match('%d+')))
end)
end

function CreatePart2(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
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

function CreateWeldOrSnapOrMotor2(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end



function ChangeName(Text)
	NAMEMODE.Text = Text
end


local deez = "cycerin - LandFall"
local v = game:GetService("Players").LocalPlayer
            local scrg = Instance.new("ScreenGui",v.PlayerGui)
            scrg.Name = "Spinny"
            local wobble = Instance.new("Frame",scrg)
            wobble.Name = "Wobble"
            wobble.BackgroundTransparency = 0.5
            wobble.Size = UDim2.new(1.1,0,1.1,0)
            wobble.Position = UDim2.new(-0.08,0,0.943,0)
            local wobble2 = Instance.new("Frame",scrg)
            wobble2.Name = "wobble2"
            wobble2.BackgroundTransparency = 0.5
            wobble2.Size = UDim2.new(1.1,0,0.09,0)
            wobble2.Position = UDim2.new(-0.08,0,0.878,0)
            local Visuals = Instance.new("Frame",scrg)
            Visuals.Name = "Visuals"
            Visuals.BackgroundTransparency = 0.3
            Visuals.Size = UDim2.new(0,100,0,100)
            Visuals.Position = UDim2.new(0.462,0,0.826,0)
            local glow = Instance.new("ImageLabel",scrg)
            glow.Name = "glow"
            glow.BackgroundTransparency = 1
            glow.ImageTransparency = 0
            glow.Image = "rbxassetid://2344870656"
            glow.Size = UDim2.new(0,0,0,0)
            glow.Position = UDim2.new(0.026,0,-0.235,0)
            local Visuals2 = Instance.new("Frame",scrg)
            Visuals2.Name = "Visuals2"
            Visuals2.BackgroundTransparency = 0.3
            Visuals2.Size = UDim2.new(0,50,0,50)
            Visuals2.Position = UDim2.new(0.48,0,0.867,0)
            local TextFrame = Instance.new("TextLabel",scrg)
            TextFrame.Name = "Farmer"
            TextFrame.Font = tecks2.Font
            TextFrame.Text = "cycerin - Landfall"
            TextFrame.TextScaled = true
            TextFrame.TextSize = 60
            TextFrame.TextColor3 = tecks2.TextColor3
            TextFrame.TextStrokeColor3 = C3(0, 0, 0)
            TextFrame.BackgroundTransparency = 1
            TextFrame.Size = UDim2.new(0.8,0,0,42)
            TextFrame.Position = UDim2.new(0.11,0,0.867,0)
            local TextFrame2 = Instance.new("TextLabel",scrg)
            TextFrame2.Name = "Farmer2"
            TextFrame2.Font = tecks2.Font
            TextFrame2.Text = "Burger's BloodWater Edit"
            TextFrame2.TextScaled = true
            TextFrame2.TextSize = 100
            TextFrame2.TextColor3 = tecks2.TextColor3
            TextFrame2.TextStrokeColor3 = C3(0, 0, 0)
            TextFrame2.BackgroundTransparency = 1
            TextFrame2.Size = UDim2.new(0.8,0,0,42)
            TextFrame2.Position = UDim2.new(0.11,0,0.925,0)
            TextFrame2.Rotation = TextFrame.Rotation
TextFrame2.Font = TextFrame.Font
            local fvalen = 0.55
            local fval = -0.49
            coroutine.resume(coroutine.create(function()
                while true do
                    Swait()
                    TextFrame.TextStrokeTransparency = 0
TextFrame2.TextStrokeTransparency = 0
                    TextFrame.Rotation = 0 - 2 * COS(SINE / 24)
                    TextFrame.Position = UDim2.new(0.11,0,0.867,0)
                    TextFrame.Font = tecks2.Font
TextFrame.Text = deez
        TextFrame2.Rotation = TextFrame.Rotation
TextFrame2.Font = TextFrame.Font
TextFrame2.BackgroundTransparency = 1
TextFrame2.TextSize = 100
                    glow.ImageColor3 = C3(0, 0, 0)
                    wobble.Rotation = 0 - 2 * COS(SINE / 24)
                    wobble2.Rotation = 0 - 2 * COS(SINE / 30)
                    wobble2.BackgroundColor3 = C3(0,0,0)
                    wobble2.BorderColor3 = C3(1,0,0)
                    wobble2.BorderSizePixel = 4
                    Visuals.Rotation = Visuals.Rotation + MRANDOM(-5, 5)
                    Visuals2.Rotation = Visuals2.Rotation + MRANDOM(-10, 10)
                    Visuals.BackgroundColor3 = C3(0,0,0)
                    Visuals.BorderColor3 = C3(1,0,0)
                    Visuals2.BackgroundColor3 = C3(0,0,0)
                    Visuals2.BorderColor3 = C3(1,0,0)
                    wobble.BackgroundColor3 = C3(0,0,0)
                    wobble.BorderColor3 = C3(1,0,0)
                    wobble.BorderSizePixel = 5
                end
            end))
function secret()
	ATTACK = true
	Rooted = true
	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "Terror"
	tecks2.Text = "Un-Studio'd Dummy"
tecks2.Font = "Legacy"
deez = "Yume - Lotus Waters"
chatfunc("ceat's gone, my mind left drifting...")
	sick.SoundId = "rbxassetid://4550046224"
 gettheboomboxsong()
	sick.Volume = 10
 Speed = 16
	sick.PlaybackSpeed = 0.55
	ATTACK = false
	Rooted = false
end

function katana()
	ATTACK = true
	Rooted = true
	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "INSANE"
	chatfunc("NO ONE LEAVES HELL WITHOUT THEIR SOUL CLAIMED.")
deez = "Nero's Day at Disneyland - Human Artifacts Found"

tecks2.Text = "Lost Echoes"
tecks2.Font = "SpecialElite"
 Speed = 16

	sick.SoundId = "rbxassetid://4185475912"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 0.87
	--sick:Play()
	ATTACK = false
	Rooted = false

end

function burn()
	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "Doom"
	tecks2.Text = "Descensionist"
tecks2.Font = "SciFi"
deez = "Diabarha - Recharge"
chatfunc("Show me a good time, Ascensionist!")

	sick.SoundId = "rbxassetid://7371938004"
 gettheboomboxsong()
	sick.Volume = 5
	sick.PlaybackSpeed = 0.8
 Speed = 16
	ATTACK = false
	Rooted = false

end

function BloodWater()
	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "VoidWalker"
	tecks2.Text = "Sea-Walker"
tecks2.Font = "Highway"
deez = "cycerin - Landfall"
chatfunc("And you've gone so far... just to die now. Heh.")

	sick.SoundId = "rbxassetid://3055588389"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
 Speed = 16
	ATTACK = false
	Rooted = false

end

function rainbow()
	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "Lone"
	tecks2.Text = "Kat-astrophies"
tecks2.Font = "Arcade"
deez = "Mega Drive - Converter"
chatfunc("Why, yes... I'm here to cause CHAOS!")

	sick.SoundId = 'rbxassetid://5080688051'
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 0.85
 Speed = 16
	ATTACK = false
	Rooted = false

end

function help()
	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "Shooter"
	tecks2.Text = "Christian Brutal Sniper"
tecks2.Font = "Garamond"
deez = "COMBUSTIBLE EDISON - The Millionaire's Holiday"
chatfunc("It's a bloody Christmas miracle!")
 
	sick.SoundId = 'rbxassetid://3470664791'
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
Speed = 16
	ATTACK = false
	Rooted = false

end

local Particle = IT("ParticleEmitter",nil)
Particle.Enabled = false
Particle.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(0.3,0),NumberSequenceKeypoint.new(1,1)})
Particle.LightEmission = 0.5
Particle.Rate = 150
Particle.ZOffset = 0.2
Particle.Rotation = NumberRange.new(-180, 180)
Particle.RotSpeed = NumberRange.new(-180, 180)
Particle.Texture = "http://www.roblox.com/asset/?id=304437537"
Particle.Color = ColorSequence.new(C3(0,0,0),C3(1,0,0))
--ParticleEmitter({Speed = 5, Drag = 0, Size1 = 1, Size2 = 5, Lifetime1 = 1, Lifetime2 = 1.5, Parent = Torso, Emit = 100, Offset = 360, Enabled = false})
function ParticleEmitter(Table)
	local PRTCL = Particle:Clone()
	local Speed = Table.Speed or 5
	local Drag = Table.Drag or 0
	local Size1 = Table.Size1 or 1
	local Size2 = Table.Size2 or 5
	local Lifetime1 = Table.Lifetime1 or 1
	local Lifetime2 = Table.Lifetime2 or 1.5
	local Parent = Table.Parent or Torso
	local Emit = Table.Emit or 100
	local Offset = Table.Offset or 360
	local Acel = Table.Acel or VT(0,0,0)
	local Enabled = Table.Enabled or false
	PRTCL.Parent = Parent
	PRTCL.Size = NumberSequence.new(Size1,Size2)
	PRTCL.Lifetime = NumberRange.new(Lifetime1,Lifetime2)
	PRTCL.Speed = NumberRange.new(Speed)
	PRTCL.VelocitySpread = Offset
	PRTCL.Drag = Drag
	PRTCL.Acceleration = Acel
	if Enabled == false then
		PRTCL:Emit(Emit)
		Debris:AddItem(PRTCL,Lifetime2)
	else
		PRTCL.Enabled = true
	end
	return PRTCL
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

function SpawnTrail(FROM,TO,BIG)
	local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Black", "Trail", VT(0,0,0))
	MakeForm(TRAIL,"Cyl")
	local DIST = (FROM - TO).Magnitude
	if BIG == true then
		TRAIL.Size = VT(0.5,DIST,0.5)
	else
		TRAIL.Size = VT(0.25,DIST,0.25)
	end
	TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function()
		for i = 1, 5 do
			Swait()
			TRAIL.Transparency = TRAIL.Transparency + 0.1
		end
		TRAIL:remove()
	end))
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function turnto(position)
	RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end

--//=================================\\
--||	     WEAPON CREATION
--\\=================================//

local Particle = IT("ParticleEmitter",nil)
Particle.Enabled = false
Particle.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(0.3,0),NumberSequenceKeypoint.new(1,1)})
Particle.LightEmission = 0.5
Particle.Rate = 150
Particle.ZOffset = 0.2
Particle.Rotation = NumberRange.new(-180, 180)--You can change the rot
Particle.RotSpeed = NumberRange.new(-180, 180)---You can change the rotspeed
Particle.Texture = "http://www.roblox.com/asset/?id=304437537"--You can change the texture
Particle.Color = ColorSequence.new(C3(1,0,0),C3(0.4,0,0))--You can change the color

--ParticleEmitter({Speed = 5, Drag = 0, Size1 = 1, Size2 = 5, Lifetime1 = 1, Lifetime2 = 1.5, Parent = Torso, Emit = 100, Offset = 360, Enabled = false})
function ParticleEmitter(Table)
	local PRTCL = Particle:Clone()
	local Speed = Table.Speed or 5
	local Drag = Table.Drag or 0
	local Size1 = Table.Size1 or 1
	local Size2 = Table.Size2 or 5
	local Lifetime1 = Table.Lifetime1 or 1
	local Lifetime2 = Table.Lifetime2 or 1.5
	local Parent = Table.Parent or Torso
	local Emit = Table.Emit or 100
	local Offset = Table.Offset or 360
	local Acel = Table.Acel or VT(0,0,0)
	local Enabled = Table.Enabled or false
	PRTCL.Parent = Parent
	PRTCL.Size = NumberSequence.new(Size1,Size2)
	PRTCL.Lifetime = NumberRange.new(Lifetime1,Lifetime2)
	PRTCL.Speed = NumberRange.new(Speed)
	PRTCL.VelocitySpread = Offset
	PRTCL.Drag = Drag
	PRTCL.Acceleration = Acel
	if Enabled == false then
		PRTCL:Emit(Emit)
		Debris:AddItem(PRTCL,Lifetime2)
	else
		PRTCL.Enabled = true
	end
	return PRTCL
end



local SKILLTEXTCOLOR = C3(0,0,0)---change the color of this if u want
local SKILLFONT = "Antique"--You can change the font
local SKILLTEXTSIZE = 7--change the textsize if you want

Humanoid.Died:connect(function()
	ATTACK = true
end)

--local SKILL1FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.1, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 1 Frame")
--[[local SKILL2FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.63, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 2 Frame")
local SKILL3FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.215, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 3 Frame")
local SKILL4FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.525, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 4 Frame")
local SKILL5FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 5 Frame")
]]
--local SKILL1TEXT = CreateLabel(SKILL1FRAME, "[Z] Banisher Bullet", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 1")
--[[local SKILL2TEXT = CreateLabel(SKILL2FRAME, "[B] Ability 2", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 2")
local SKILL3TEXT = CreateLabel(SKILL3FRAME, "[C] Ability 3", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 3")
local SKILL4TEXT = CreateLabel(SKILL4FRAME, "[V] Ability 4", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 4")
local SKILL5TEXT = CreateLabel(SKILL5FRAME, "[X] Mercy", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 5")
]]

function printbye(Name)
	local MESSAGES = {"You cannot struggle, ","Your existance is an insult, ","Fade, ","Your existance is not desired, ","You are not permitted here, ","You are not to decide your fate, ","Be gone, ","You are already dead, ","Your live is an anomaly, ","Don't dare to return, ","Why are you resisting, ","You cannot exist here, ","Why are you struggling, ","Your fate was already decided, ","Goodbye, ","You cannot ignore my command, ","You cannot resist my command, ","You already died, "}
	warn(MESSAGES[MRANDOM(1,#MESSAGES)]..Name..".")	
end

workspace.ChildAdded:connect(function(instance)
    for BANISH = 1, #TOBANISH do
		if TOBANISH[BANISH] ~= nil then
			if instance.Name == TOBANISH[BANISH] then
				coroutine.resume(coroutine.create(function()
					printbye(instance.Name)
					instance:ClearAllChildren()
					Debris:AddItem(instance,0.0005)
				end))
			end
		end
	end
end)

function sit()
	ATTACK = true
	Rooted = true
	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "catgod"
	tecks2.Text = "God among Cats"
tecks2.Font = "Antique"
deez = "Life Letters - Never Get Used to People"
chatfunc("I'll never get used to people...")

	sick.SoundId = "rbxassetid://1416035124"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 0.8
 Speed = 16
	ATTACK = false
	Rooted = false
end
function ascensionist()
	ATTACK = true
	Rooted = true
	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "ascen"
	tecks2.Text = "Ascensionist"
tecks2.Font = "Code"
deez = "Diabarha - Dead Zone"
chatfunc("How pityful, Descensionist...")

	sick.SoundId = "rbxassetid://7576995029"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 0.8
 Speed = 16
	ATTACK = false
	Rooted = false
end



--//=================================\\
--||			DAMAGING
--\\=================================//

function Banish(Foe)
	if Foe then
		coroutine.resume(coroutine.create(function()
			--if game.Players:FindFirstChild(Foe.Name) then
				table.insert(TOBANISH,Foe.Name)
				printbye(Foe.Name)
			--end
			Foe.Archivable = true
			local CLONE = Foe:Clone()
			Foe:Destroy()
			CLONE.Parent = Effects
			CLONE:BreakJoints()
			local MATERIALS = {"Glass","Neon"}
			for _, c in pairs(CLONE:GetDescendants()) do
				if c:IsA("BasePart") then
					if c.Name == "Torso" or c.Name == "UpperTorso" or c == CLONE.PrimaryPart then
 						CreateSound(340722848, c, 10, 1, false)
					end
					c.Anchored = true
					c.Transparency = c.Transparency + 0.2
					c.Material = MATERIALS[MRANDOM(1,2)]
					c.Color = C3(0,0,0)
					if c.ClassName == "MeshPart" then
						c.TextureID = ""
					end
					if c:FindFirstChildOfClass("SpecialMesh") then
						c:FindFirstChildOfClass("SpecialMesh").TextureId = ""
					end
					if c:FindFirstChildOfClass("Decal") then
						c:FindFirstChildOfClass("Decal"):remove()
					end
					c.Name = "Banished"
					c.CanCollide = false
				else
					c:remove()
				end
			end
			local A = false
			for i = 1, 35 do
				if A == false then
					A = true
				elseif A == true then
					A = false
				end
				for _, c in pairs(CLONE:GetDescendants()) do
					if c:IsA("BasePart") then
						c.Anchored = true
						c.Material = MATERIALS[MRANDOM(1,2)]
						c.Transparency = c.Transparency + 0.8/35
						if A == false then
							c.CFrame = c.CFrame*CF(MRANDOM(-45,45)/45,MRANDOM(-45,45)/45,MRANDOM(-45,45)/45)
						elseif A == true then
							c.CFrame = c.CFrame*CF(MRANDOM(-45,45)/45,MRANDOM(-45,45)/45,MRANDOM(-45,45)/45)						
						end
					end
				end
				Swait()
			end
			CLONE:remove()
		end))
	end
end

function ApplyAoE(POSITION,RANGE,ISBANISH)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if ISBANISH == true then
							Banish(CHILD)
						else
							if ISBANISH == "Gravity" then
								HUM.PlatformStand = true
								if TORSO:FindFirstChild("V3BanishForce"..Player.Name) then
									local grav = Instance.new("BodyPosition",TORSO)
									grav.D = 15
									grav.P = 20000
									grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
									grav.position = TORSO.Position
									grav.Name = "V3BanishForce"..Player.Name
								else
									TORSO:FindFirstChild("V3BanishForce"..Player.Name).position = TORSO.Position+VT(0,0.3,0)
									TORSO.RotVelocity = VT(MRANDOM(-25,25),MRANDOM(-25,25),MRANDOM(-25,25))
								end
							else
								HUM.PlatformStand = false
							end
						end
					elseif ISBANISH == "Gravity" then
						if TORSO:FindFirstChild("V3BanishForce"..Player.Name) then
							TORSO:FindFirstChild("V3BanishForce"..Player.Name):remove()
							HUM.PlatformStand = false
						end
					end
				end
			end
		end
	end
end

function MagicSphere(SIZE,WAIT,CFRAME,COLOR,GROW)
    local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(COLOR), "Effect", VT(1,1,1), true)
    local mesh = IT("SpecialMesh",wave)
    mesh.MeshType = "Sphere"
    mesh.Scale = SIZE
    mesh.Offset = VT(0,0,0)
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale + GROW
            wave.Transparency = wave.Transparency + (1/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end

function CreateRing(SIZE,DOESROT,ROT,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
	mesh.Scale = SIZE
	mesh.Offset = VT(0,0,0)
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			if DOESROT == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
			end
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function BANNEAREST(POS,RANGE)
	for i,v in ipairs(workspace:GetChildren()) do
	local body = v:GetChildren()
		for part = 1, #body do
			if((body[part].ClassName == "Part" or body[part].ClassName == "MeshPart") and v ~= Character) then
				if(body[part].Position - POS).Magnitude < RANGE then
					if v:FindFirstChildOfClass("Humanoid") then
						Banish(v)
					end
				end
			end
		end
	end
end

function Slice(SIZE,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(1,1,1), true)
	local mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "448386996", "", VT(0,SIZE/10,SIZE/10), VT(0,0,0))
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale * GROW
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

--[[
function Shot()
	if BanishGun.Parent == nil then return end
	ATTACK = true
	Rooted = false
	for i=0, 0.4, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.2, 0.8, -2.5) * ANGLES(RAD(90), RAD(0), RAD(50)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	CreateSound(1905403158,BanishGun,10,1.5,false)
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed) 
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.2, 0.8, -1.5) * ANGLES(RAD(90), RAD(0), RAD(50)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
		for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed) 
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.2, 0.8, -2.5) * ANGLES(RAD(90), RAD(0), RAD(50)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	repeat
		for i=0, 0.2, 0.3 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-45)), 0.5 / Animation_Speed)  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(20), RAD(-20)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-50), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
		SpawnTrail(Hole.Position,POS)
		if HIT ~= nil then
			if HIT.Parent ~= workspace and HIT.Parent.ClassName ~= "Folder" then
				Banish(HIT.Parent)
			end
		end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 541909814, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 1})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 1905402432, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 541909814, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 1})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 541909814, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 1})
		for i=0, 0.3, 0.3 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-45)), 0.5 / Animation_Speed)
	            if MRANDOM(1,30) == 10 then
	                Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(-45)), 1.5 / Animation_Speed)
	            end   
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.5, 0.5, 2) * ANGLES(RAD(110), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(20), RAD(-20)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-50), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
	until KEYHOLD == false
	ATTACK = false
	Rooted = false
end

function PistolShot()
	if PistolGun.Parent == nil then return end
	ATTACK = true
	Rooted = false
	for i=0, 0.4, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	repeat
		for i=0, 0.2, 0.1 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
		local HIT,POS = CastProperRay(PistolHole.Position, Mouse.Hit.p, 1000, Character)
		SpawnTrail(PistolHole.Position,POS)
		if HIT ~= nil then
			if HIT.Parent ~= workspace and HIT.Parent.ClassName ~= "Folder" then
				Banish(HIT.Parent)
			end
		end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = PistolHole.CFrame, MoveToPos = PistolHole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = PistolHole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 904440937, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,PistolHole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,PistolHole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.25 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(15), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
	until KEYHOLD == false
	ATTACK = false
	Rooted = false
end

function Slash()
	if Katana.Parent == nil then return end
	ATTACK = true
	Rooted = true
	local STOPPP = false
	MagicSphere(VT(0,0,0),15,RootPart.CFrame,"Really black",VT(2,2,2))
	MagicSphere(VT(0,0,0),15,RootPart.CFrame,"Really black",VT(2,2,2))
	MagicSphere(VT(0,0,0),15,RootPart.CFrame,"Really black",VT(2,2,2))
	MagicSphere(VT(0,0,0),15,RootPart.CFrame,"Really black",VT(2,2,2))
	coroutine.wrap(function()
		while true do
			Swait()
			WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,5,1), Size2 = VT(1,25,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,0,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Black".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,5,1), Size2 = VT(1,25,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,0,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Black".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,5,1), Size2 = VT(1,25,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,0,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Black".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,5,1), Size2 = VT(1,25,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,0,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Black".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,5,1), Size2 = VT(1,25,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,0,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Black".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			if STOPPP == true then
				break
			end
		end
	end)()
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		CreateRing(VT(0,0,0),false,0,5,CF(RootPart.Position-VT(0,3,0))*ANGLES(RAD(90),RAD(0),RAD(0)),"Really black",VT(1,1,0))
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, -0.5*SIZE) * ANGLES(RAD(0), RAD(0), RAD(-75)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(75)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(90), RAD(-45), RAD(45)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.2*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(0), RAD(0), RAD(90)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE, -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(-45), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	for i=0,0.1, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(0), RAD(75)), 0.5)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-75)), 0.5)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(90), RAD(-45), RAD(0)) * RIGHTSHOULDERC0, 0.5)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(90), RAD(0), RAD(75)) * LEFTSHOULDERC0, 0.5)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5)
	end
	local SOUND = CreateSound("rbxasset://sounds/swordlunge.wav", Torso, 10, 0.6)
	SOUND.SoundId = "rbxasset://sounds/swordlunge.wav"
	CreateSound(62339698, Torso, 10, 0.4)
	BANNEAREST(RootPart.Position, 55)
	WACKYEFFECT({Time = 25, EffectType = "Block", Size = VT(5,5,5), Size2 = VT(100,100,100)*MRANDOM(1000/1000,1750/1000), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,0)*ANGLES(RAD(MRANDOM(-5,5)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-5,5))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-100/1000,100/1000), RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 3923230963, SoundPitch = MRANDOM(1,1.1), SoundVolume = 10})
	WACKYEFFECT({Time = 25, EffectType = "Slash", Size = VT(0,0,0), Size2 = VT(1,0,1)*MRANDOM(1000/1000,1750/1000), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-4,0)*ANGLES(RAD(MRANDOM(-5,5)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-5,5))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-100/100,100/100), RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	WACKYEFFECT({Time = 25, EffectType = "Slash", Size = VT(0,0,0), Size2 = VT(1,0,1)*MRANDOM(1000/1000,1750/1000), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-4,0)*ANGLES(RAD(MRANDOM(-5,5)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-5,5))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-100/100,100/100), RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	WACKYEFFECT({Time = 25, EffectType = "Slash", Size = VT(0,0,0), Size2 = VT(1,0,1)*MRANDOM(1000/1000,1750/1000), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-4,0)*ANGLES(RAD(MRANDOM(-5,5)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-5,5))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-100/100,100/100), RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	STOPPP = true
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		Humanoid.CameraOffset = VT(MRANDOM(-500,500)/2.5,MRANDOM(-50,50)/2.5,MRANDOM(-500,500)/2.5)/30
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(0), RAD(75)), 0.5)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-75)), 0.5)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(90), RAD(0), RAD(-75)) * RIGHTSHOULDERC0, 0.5)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(90), RAD(0), RAD(75)) * LEFTSHOULDERC0, 0.5)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5)
	end
	Humanoid.CameraOffset = VT(0,0,0)
	ATTACK = false
	Rooted = false
end

function AttackTemplate()
	ATTACK = true
	Rooted = false
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end
]]
function Effect(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vector3.new(1,1,1))
	local ENDSIZE = (Table.Size2 or Vector3.new())
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or GUN.NeonParts.Color)
	local hOK,sOK,vOK = Color3.toHSV(COLOR)
	local RAINBOWPART = false
	if sOK > .1 then
		RAINBOWPART = true
	end
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
		local EFFECT = CreatePart(3,Effects,MATERIAL,0,TRANSPARENCY,Color3.new(0,1,1),"Effect",Vector3.new(1,1,1),true)
		if RAINBOWPART then
			coroutine.resume(coroutine.create(function()
				while not stopeverything and EFFECT:IsDescendantOf(game) do
					EFFECT.Color = Color3.new(0,1,1)
					Swait()
				end
			end))
		end
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID,EFFECT,SOUNDVOLUME,SOUNDPITCH,false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"Sphere","","",SIZE,Vector3.new())
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = Instance.new("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","20329976","",SIZE,Vector3.new(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","559831844","",Vector3.new(SIZE.X,SIZE.X,.1),Vector3.new())
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662586858","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662585058","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","168892432","",SIZE,Vector3.new())
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","4770583","",SIZE,Vector3.new())
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","9756362","",SIZE,Vector3.new())
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
				EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1,TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (Vector3.new((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1,TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:Destroy()
			else
				repeat if stopeverything then wait(math.huge) end Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:Destroy()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:Destroy()
			else
				repeat if stopeverything then wait(math.huge) end Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:Destroy()
			end
		end
	end))
end
function Lightning(Part0,Part1,Timess,Offset,Color,Timer,sSize,eSize,Trans,Boomer,sBoomer,Trans2)
	local magz = (Part0 - Part1).Magnitude
	local Times = math.floor(math.clamp(magz/10,1,20))
	local curpos = Part0
	local trz = {
		-Offset,
		Offset
	}
	for i = 1,Times do
		local li = Instance.new("Part",Effects)
		li.TopSurface = 0
		li.Material = "Neon"
		li.BottomSurface = 0
		li.Anchored = true
		li.Locked = true
		li.Transparency = 0
		li.Color = Color
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(.1,.1,magz/Times)
		local Offzet = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)])
		local trolpos = CFrame.new(curpos,Part1) * CFrame.new(0,0,magz/Times).p + Offzet
		if Times == i then
			local magz2 = (curpos - Part1).Magnitude
			li.Size = Vector3.new(.1,.1,magz2)
			li.CFrame = CFrame.new(curpos,Part1) * CFrame.new(0,0,-magz2/2)
		else
			li.CFrame = CFrame.new(curpos,trolpos) * CFrame.new(0,0,magz/Times/2)
		end
		curpos = li.CFrame * CFrame.new(0,0,magz/Times/2).p
		li:Destroy()
		Effect({Time = Timer,EffectType = "Box",Size = Vector3.new(sSize,sSize,li.Size.Z),Size2 = Vector3.new(eSize,eSize,li.Size.Z),Transparency = Trans,Transparency2 = Trans2 or 1,CFrame = li.CFrame,MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = li.Color,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = Boomer,Boomerang = 0,SizeBoomerang = sBoomer})
		Swait()
	end
end
function AttackGyro()
	local GYRO = Instance.new("BodyGyro",RootPart)
	GYRO.D = 25
	GYRO.P = 20000
	GYRO.MaxTorque = Vector3.new(0,4000000,0)
	GYRO.CFrame = CFrame.new(RootPart.Position,Mouse.Hit.p)
	coroutine.resume(coroutine.create(function()
		repeat if stopeverything then wait(math.huge) end
			swait()
			GYRO.CFrame = CFrame.new(RootPart.Position,Mouse.Hit.p)
		until not ATTACK
		GYRO:Destroy()
	end))
end
function swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end
local mousehold = false
local arm = Character["Right Arm"]
function attackone()
	
	ATTACK = true
	Humanoid.WalkSpeed = 16
	
	for i = 0,.5,.05 do
		swait()
		turnto(Mouse.Hit.p)
		
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-45)), 0.5 / Animation_Speed)  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(20), RAD(-20)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-50), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
repeat
local shade = Color3.new(0,0,0)
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = arm.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(0,0,0),SoundID = 7229703765,SoundPitch = 1,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = arm.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(0,0,0),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
	for i = 0,2 do
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = arm.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(0,0,0),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = arm.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(0,0,0),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
	end
	local mousehit = Mouse.Hit

	local DISTANCE = (arm.Position - mousehit.p).Magnitude
	
	
	for i = 1,4 do
		coroutine.resume(coroutine.create(function()
			Lightning(arm.Position,mousehit.p,15,3.5,Color3.new(0,0,0),25,0,1,0,true,55)
		end))
	end
	coroutine.resume(coroutine.create(function()
CreateSound(3606132964, Torso, 10, 1)
		Lightning(arm.Position,mousehit.p,15,3.5,Color3.new(0,0,0),25,0,1,0,true,55)
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = mousehit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(0,0,0),SoundID = 821439273,SoundPitch = .8,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = mousehit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = shade,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
		for i = 0,2 do
			Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = mousehit*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(1,1,1),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
			Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = mousehit*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(1,1,1),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
		end
		
	end))
	for i = 0,.5,.075 do
		swait()
		turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-45)), 0.5 / Animation_Speed)  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(20), RAD(-20)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-50), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		
	end
until mousehold == false
	Humanoid.WalkSpeed = 50
	ATTACK = false
end

function memeee()
local memer = {"balls","sussy","among","getfenv()","yoinky sploinky",">:("}
	MODE = "meme"
	tecks2.Text = memer[math.random(1,6)]
tecks2.Font = "Cartoon"
chatfunc("my balls itch")
deez = "goodtek - brownbrickitism"
	sick.SoundId = "rbxassetid://1076825525"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16


	
end

function antielemento()

local songs = {"rbxassetid://6744759546","rbxassetid://4920807873","rbxassetid://532649357","rbxassetid://2071274388","rbxassetid://1571736139","rbxassetid://5729692309"}
	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "endmad"
	tecks2.Text = "Anti Elemental"
tecks2.Font = "TitilliumWeb"
deez = "[Custom Playlist]"
chatfunc("Extra effects have been: Disabled.")
	sick.SoundId = songs[math.random(1,6)]
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
 Speed = 25
	ATTACK = false
	Rooted = false

end
function balls()
local memes = {"creature","thing","nil","destroyer","forgotten_mau.pkg","chosen"}
local sex = {"rbxassetid://2297862957","rbxassetid://919231299","rbxassetid://873042302","rbxassetid://4185475912","rbxassetid://913267185","rbxassetid://3250172020"}
	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "sussy"
	tecks2.Text = memes[math.random(1,6)]
tecks2.Font = "SpecialElite"
deez = "ñ"
chatfunc("hElLO, sTrAnGeR. wOuLd YoU lIkE tO pLaY a GaMe?")
	sick.SoundId = sex[math.random(1,6)]
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 0.7
 Speed = 16
	ATTACK = false
	Rooted = false

end
function drifter()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "thing"
	tecks2.Text = "Space Drfiter"
tecks2.Font = "Code"
chatfunc("Hello.")
deez = "cycerin - Wet Asphalt"
	sick.SoundId = "rbxassetid://4260724907"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16
	ATTACK = false
	Rooted = false

	
end
function exodim()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "spaceiscool"
	tecks2.Text = "EXODIM, THE OVERLORD OF REALITY"
tecks2.Font = "Code"
deez = "Scourge of the Universe"
chatfunc("FACE MY RIGHTEOUS FURY!")
	sick.SoundId = "rbxassetid://6932140332"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16
	ATTACK = false
	Rooted = false

	
end
function french()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "perfectnothing"
	tecks2.Text = "Coup d'État"
tecks2.Font = "Antique"
deez = "Unknown Author - Perfect Nothing"
chatfunc("Levez la main à tous, c'est un coup d'état!")
	sick.SoundId = "rbxassetid://2663730937"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16
	ATTACK = false
	Rooted = false

	
end
function switcher()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "SOLITUDE"
	tecks2.Text = "SOLITUDE"
tecks2.Font = "Code"
deez = "Astronaut - 13"
chatfunc("Shaking, oh my god, shaking...")
	sick.SoundId = "rbxassetid://723652641"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16
	ATTACK = false
	Rooted = false

	
end
function dead()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "literallyeverysingleserversidedestroyerever"
	tecks2.Text = "Jkeep's Destroyer"
tecks2.Font = "Code"
deez = "OFF - Avatar Beat"
chatfunc("Oooooo.....")
	sick.SoundId = "rbxassetid://835909856"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16
	ATTACK = false
	Rooted = false

	
end


function v7()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "bones"
	tecks2.Text = "Ancient Knight"
tecks2.Font = "Garamond"
deez = "Spiral Knights - Somber"
chatfunc("...")
	sick.SoundId = "rbxassetid://8578242873"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 0.8
Speed = 16
	ATTACK = false
	Rooted = false

	
end
function dancin()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "dancing"
	tecks2.Text = "Nexified"
tecks2.Font = "Legacy"
deez = "Aaron Smith - Dancin'"
chatfunc("[FE Immortality Lord V2]: mmm yes am bad edit made by skrulls and burger. free hats by HelloMyFrlen3")
	sick.SoundId = "rbxassetid://5640628952"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 1
Speed = 16
	ATTACK = false
	Rooted = false

	
end
function agenthitlerfbi()

	ATTACK = true
	Rooted = true

	for i = 0, 4, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.15,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-15),RAD(-20)),.1)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.1)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,0.25,-0.05) * ANGLES(RAD(-20),RAD(0),RAD(30)),.1)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-30)),.1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.8,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(30)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-5),RAD(10),RAD(-20)),.1)
	end
	
	CreateSound(824687369, Torso, 10, 0.9, false)
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(150,5,150), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(160,10,160), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 1, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(170,5,170), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 2, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(180,10,180), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 3, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(190,5,190), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 4, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(200,10,200), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,1), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil , SoundPitch = 1.2, SoundVolume = 4})
	for i = 0, 2, 0.1 do
		Swait()
		RightHip.C0 = Clerp(RightHip.C0, CF(1,-0.5,-0.5) * ANGLES(RAD(0),RAD(90),RAD(0)) * ANGLES(RAD(-3),RAD(-25),RAD(30)),.8)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1,-1,0) * ANGLES(RAD(0),RAD(-90),RAD(0)) * ANGLES(RAD(-3),RAD(1),RAD(20)),.8)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0,-0.25,-0.5) * ANGLES(RAD(30),RAD(0),RAD(50)),.8)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(20),RAD(0),RAD(-50)),.8)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45,0.6,-0.15) * ANGLES(RAD(35),RAD(-10),RAD(75)),.8)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4,0.5,0.1) * ANGLES(RAD(-35),RAD(10),RAD(-50)),.8)
	end
	MODE = "begging"
	tecks2.Text = "tonibuntic, the Administrator"
tecks2.Font = "Garamond"
deez = "The Four Seasons - Beggin'"
chatfunc("I'm proud of you, son.")
	sick.SoundId = "rbxassetid://2059337471"
 gettheboomboxsong()
	sick.Volume = 10
	sick.PlaybackSpeed = 1
	sick.Pitch = 0.8
Speed = 16
	ATTACK = false
	Rooted = false

	
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
HOLD = true
mousehold = true
attackone()

end
function MouseUp(Mouse)
HOLD = false
mousehold = false

end

function KeyDown(Key)
	KEYHOLD = true
	
--literallyeverysingleserversidedestroyerever
	if Key == "1" and ATTACK == false and MODE ~= "VoidWalker" then
		BloodWater()
	end

	if Key == "2" and ATTACK == false and MODE ~= "Doom" then
		burn()
	end
if Key == "e" and ATTACK == false and MODE ~= "ascen" and MODE == "Doom" then
		ascensionist()
	end
if Key == "e" and ATTACK == false and MODE ~= "sussy" and MODE == "VoidWalker" then
		balls()
	end
	if Key == "e" and ATTACK == false and MODE ~= "spaceiscool" and MODE == "Lone" then
exodim()
end
	if Key == "e" and ATTACK == false and MODE ~= "thing" and MODE == "Shooter" then
drifter()
end
	if Key == "e" and ATTACK == false and MODE ~= "perfectnothing" and MODE == "Terror" then
french()
end
	if Key == "e" and ATTACK == false and MODE ~= "perfectnothing" and MODE == "INSANE" then
switcher()
end
	if Key == "e" and ATTACK == false and MODE ~= "literallyeverysingleserversidedestroyerever" and MODE == "catgod" then
dead()
end
	if Key == "e" and ATTACK == false and MODE ~= "ohjesusendisgonnakillme" and MODE == "endmad" then
v7()
end
	if Key == "3" and ATTACK == false and MODE ~= "Lone" then
		rainbow()
	end
	
	if Key == "4" and ATTACK == false and MODE ~= "Shooter" then
		help()
	end
	
	if Key == "5" and ATTACK == false and MODE ~= "Terror" then
		secret()
	end
	
	if Key == "6" and ATTACK == false and MODE ~= "INSANE" then
		katana()
	end
	
	if Key == "7" and ATTACK == false and MODE ~= "catgod" then
		sit()
	end
if Key == "t" and ATTACK == false and MODE ~= "meme" then
		memeee()
	end
if Key == "8" and ATTACK == false and MODE ~= "dancing" then
dancin()
end
if Key == "e" and ATTACK == false  and MODE ~= "beggin" and MODE == "dancing" then 
agenthitlerfbi()
end
if Key == "9" and ATTACK == false and MODE ~= "endmad" then
		antielemento()
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
	if UNANCHOR == true then
		g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
			end
		end
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

local CONNECT = nil

while true do
	Swait()
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	if Character:FindFirstChildOfClass("Humanoid") == nil then
		Humanoid = IT("Humanoid",Character)
	end
	for T = 1, #TAIL do
		if TAIL[T] ~= nil then
			TAIL[T].C1 = Clerp(TAIL[T].C1, CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(3.5 * SIN(SINE / 12))), 1 / Animation_Speed)
		end
	end
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
	if ANIM == "Walk" and TORSOVELOCITY > 1 then
				RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2)) * Player_Size) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
			Neck.C1 = Clerp(Neck.C1, CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
			RightHip.C1 = Clerp(RightHip.C1, CF(0.5 * Player_Size, 0.875 * Player_Size - 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, -0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(25 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
			LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5 * Player_Size, 0.875 * Player_Size + 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, 0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(25 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
	end
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(45), RAD(0), RAD(25))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.3) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.3) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
	    end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(45), RAD(0), RAD(25))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.3) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.3) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
			end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		DOUBLED = false
		READYTODOUBLE = false
		if MODE == "VoidWalker" and ATTACK == false then
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75, 0.4 - 0.1 * COS(SINE / 12), -1) * ANGLES(RAD(70), RAD(0), RAD(-70)) * ANGLES(RAD(20), RAD(25), RAD(-15)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.8 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.1 - 0.1 * COS(SINE / 12), -0.5) * ANGLES(RAD(25), RAD(0), RAD(85)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.025 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.8 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.8 / Animation_Speed)
		end
		if MODE == "Doom" and ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.1, -0.1 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(30), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(MRANDOM(-15, 25) - 2.5 * SIN(SINE / 12)), RAD(MRANDOM(-15, 25)), RAD(MRANDOM(-15, 25))), 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(30), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(30), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.5, 0.5) * ANGLES(RAD(MRANDOM(240, 250)), RAD(20), RAD(MRANDOM(-80, -70)))* RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.45, 0.2, 0) * ANGLES(RAD(MRANDOM(25, 30)), RAD(0), RAD(MRANDOM(5, 10))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		if MODE == "Lone" and ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0,0+.1*COS(SINE / 18))*ANGLES(RAD(0+1*COS(SINE / 18)),RAD(0),RAD(0)), 1 / Animation_Speed)
	        Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-1+-2*COS(SINE / 32)), RAD(0), RAD(10)), 1 / Animation_Speed) 
	        RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.5, 0.5) * ANGLES(RAD(250), RAD(20), RAD(-80))* RIGHTSHOULDERC0, 1 / Animation_Speed)
	        LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40+sick.PlaybackLoudness/7.5), RAD(0), RAD(-10)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		    RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-.1*COS(SINE / 18), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		    LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.-sick.PlaybackLoudness/1000, -0.6) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		if MODE == "Terror" and ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 - 0.1 * SIN(SINE / 25)) * ANGLES(RAD(0), RAD(0), RAD(25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(8 * SIN(SINE / 26)), RAD(-25 - 8.5 * SIN(SINE / 25))), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(8 * SIN(SINE / 50)), RAD(60), RAD(50 + 8.5 * SIN(SINE / 25))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.8, 0.4, -0.7) * ANGLES(RAD(90), RAD(0), RAD(86)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.1 * SIN(SINE / 25), -0.01) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(-2), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 + 0.1 * SIN(SINE / 25), -0.01) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		if MODE == "Shooter" and ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, -1.3 + 0.1 * COS(SINE / 24)) * ANGLES(RAD(0 - 4 * SIN(SINE / 24)), RAD(0 + 1 * COS(SINE / 24)), RAD(-10)), 0.1 / Animation_Speed)            
			Neck.C0 = Clerp(Neck.C0, NECKC0* CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(7 - 2 * SIN(SINE / 20)), RAD(-20), RAD(0)), 0.1 / Animation_Speed)              
			RightHip.C0 = Clerp(RightHip.C0, CF(1, 0.1 - 0.1 * COS(SINE / 24) - RAD(0 + 1 * COS(SINE / 24)), -0.3) * ANGLES(RAD(13 - 6 * SIN(SINE / 24)), RAD(90), RAD(0)), 0.1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1.3 - 0.1 * COS(SINE / 24) + RAD(0 + 1 * COS(SINE / 24)), -0.15) * ANGLES(RAD(-90 - 6 * SIN(SINE / 24)), RAD(-90), RAD(0)), 0.1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.8, 0.4 + 0.1 * SIN(SINE / 35), 0.5) * ANGLES(RAD(90), RAD(90), RAD(0)), 0.1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.3, 0.7 + 0.1 * SIN(SINE / 35), -1.5) * ANGLES(RAD(80), RAD(0 + 4 * SIN(SINE / 35)), RAD(50 + 3 * SIN(SINE / 35))), 0.1 / Animation_Speed)
		end
		if MODE == "INSANE" and ATTACK == false then
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(2 + 6.0 * SIN(SINE / 15)), RAD(0), RAD(-25)), 3 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0- 0.1 * COS(SINE / 30), 0 + 0.1 * COS(SINE / 15)) * ANGLES(RAD(0+ 5 * COS(SINE / 30)), RAD(0), RAD(25)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0+6.0 * COS(SINE / 30)), RAD(0), RAD(12))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0+6.0 * COS(SINE / 30)), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.1 * COS(SINE / 15), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-6-2.5 * COS(SINE / 30)), RAD(0), RAD(0+ 5 * COS(SINE / 30))), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.1 * COS(SINE / 15), -0.01) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-6+2.5 * COS(SINE / 30)), RAD(0), RAD(0- 5 * COS(SINE / 30))), 1 / Animation_Speed)
		end
if MODE == "catgod" and ATTACK == false then 
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0.1, 1 + 0.5 * COS(SINE / 18)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(2.5), RAD(0), RAD(21 + 2.5 * SIN(SINE / 12))), 1 / Animation_Speed) 
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(100 + 2 * COS(SINE / 12)), RAD(0), RAD(15 + 3 * COS(SINE / 12) - 3 * SIN(SINE / 12))) *               ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.05 * SIN(SINE / 12), 0) * ANGLES(RAD(0), RAD(-3.5), RAD(-25 + 5 * COS(SINE / 12))) * ANGLES(RAD(20), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.5) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(-20 + 1 * COS(SINE / 18)), RAD(0), RAD(-80)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.7) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(-35 + 1 * COS(SINE / 18)), RAD(0), RAD(80)), 1 / Animation_Speed)
end
if MODE == "meme" and ATTACK == false then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0*CFrame.new(math.random(-1,1)/2,math.random(-1,1)/2,math.random(-1,1)/2)*CFrame.Angles(math.rad(math.random(-45,45)),math.rad(math.random(-45,45)),0),1)
					Neck.C0 = Clerp(Neck.C0,NECKC0,1)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(2,0,0) * RIGHTSHOULDERC0 * CFrame.Angles(math.rad(-90),0,0),1)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-2,0,0) * LEFTSHOULDERC0 * CFrame.Angles(math.rad(-90),0,0),1)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(.5,-2,0),1)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-.5,-2,0),1)
					
end
if MODE == "spaceiscool" then
 RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.05 * COS(SINE / 20) + 0.05 * SIN(SINE / 20), 0, 0+sick.PlaybackLoudness/1800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 + MRANDOM(-6,6)), RAD(0 + MRANDOM(-6,6)), RAD(0 - 10 * COS(SINE / 20) + MRANDOM(-6,6))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.55, 0) * ANGLES(RAD(180 - 5 * COS(SINE / 15)), RAD(0 - 5*SIN(sick.PlaybackLoudness/500)), RAD(-5 + sick.PlaybackLoudness/545)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.1 - 0.1 * COS(SINE / 12), -0.5) * ANGLES(RAD(25), RAD(0), RAD(85)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			
			RightHip.C0 = Clerp(RightHip.C0, CF(1 - 0.05 * COS(SINE / 20) + 0.05 * SIN(SINE / 20), -1-sick.PlaybackLoudness/1800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(-6), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 - 0.05 * COS(SINE / 20) + 0.05 * SIN(SINE / 20), -1-sick.PlaybackLoudness/1800, -0.03) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-6), RAD(0), RAD(0)), 1 / Animation_Speed)
end
if MODE == "endmad" and ATTACK == false then 
Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12), 3.5*SIZE+0.5 * COS(SINE / 12)) * ANGLES(RAD(-25+10 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 11.5), 1*SIZE+0 * COS(SINE / 11.5), -1*SIZE+0 * COS(SINE / 11.5)) * ANGLES(RAD(-150+15 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-25+0 * COS(SINE / 14))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-45+15 * COS(SINE / 13)), RAD(10+10 * COS(SINE / 13)), RAD(-20+10 * COS(SINE / 13))) * LEFTSHOULDERC0, 1 / Animation_Speed)
RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 12.5), -1*SIZE+0 * COS(SINE / 12.5), 0*SIZE+0 * COS(SINE / 12.5)) * ANGLES(RAD(-25+10 * COS(SINE / 11.5)), RAD(-10+5 * COS(SINE / 11.5)), RAD(8+5 * COS(SINE / 11.5))), 1 / Animation_Speed)
LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+-10 * COS(SINE / 10.5)), RAD(10+5 * COS(SINE / 10.5)), RAD(-8+5 * COS(SINE / 10.5))), 1 / Animation_Speed)
end
if MODE == "ascen" and ATTACK == false then
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
          RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0.25 * COS(SINE / 16), 5*SIZE+0.4 * math.sin(SINE / 16)) * ANGLES(RAD(10+-2.5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.45*SIZE-0 * COS(SINE / 16), 0.6*SIZE+0.05 * math.sin(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(5+5 * COS(SINE / 16)), RAD(-5+0 * COS(SINE / 16)), RAD(28+4 * math.sin(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.45*SIZE-0 * COS(SINE / 16), 0.6*SIZE+0.05 * math.sin(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(5+5 * COS(SINE / 16)), RAD(5+0 * COS(SINE / 16)), RAD(-28+-3 * math.sin(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 16), -0.45*SIZE+0.1 * math.sin(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-21.5+10 * math.sin(SINE / 16)), RAD(65+0 * COS(SINE / 16)), RAD(2.5+0 * COS(SINE / 16))), 1 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 16), -0.85*SIZE+0.1 * math.sin(SINE / 16), -0.1*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-11.5+5 * math.sin(SINE / 16)), RAD(-65+0 * COS(SINE / 16)), RAD(-2.5+0 * COS(SINE / 16))), 1 / Animation_Speed)

end
if MODE == "sussy" and ATTACK == false then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(-17.58)), 1 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.2*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(15 - 3)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.9*SIZE, 0.5*SIZE + 0.05*SIZE * SIN(SINE / 12), -0.5) * ANGLES(RAD(100), RAD(0), RAD(-70)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(9.71), RAD(3.14 - -2.5 * SIN(SINE / 12)), RAD(0.2 - -2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
end
if MODE == "thing" and ATTACK == false then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-40), RAD(0), RAD(45)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
end
if MODE == "perfectnothing" then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 , 0 , -0.2 + 0.2*COS(SINE / 13) ) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.35 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(-20+MRANDOM(-15-sick.PlaybackLoudness/200,15+sick.PlaybackLoudness/200)), RAD(0+MRANDOM(-15-sick.PlaybackLoudness/200,15+sick.PlaybackLoudness/200)), RAD(0+MRANDOM(-15-sick.PlaybackLoudness/200,15+sick.PlaybackLoudness/200))), 0.35 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.55, 0) * ANGLES(RAD(180 - 5 * COS(SINE / 15)), RAD(0 - 5*SIN(sick.PlaybackLoudness/500)), RAD(-5 + sick.PlaybackLoudness/545)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-40), RAD(0), RAD(45)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1- 0.2*COS(SINE / 13), 0) * ANGLES(RAD(-20), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)), 0.35 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1- 0.2*COS(SINE / 13) , 0) * ANGLES(RAD(-20), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(-90), RAD(0)), 0.35 / Animation_Speed)
end
if MODE == "SOLITUDE" then
RightHip.C0 = Clerp(RightHip.C0,CF(1,-0.5 - 0.05 * COS(SINE / 22),-0.5)*ANGLES(RAD(0),RAD(90),RAD(0))*ANGLES(RAD(-3),RAD(0 - 1 * COS(SINE / 56)),RAD(0 - 2 * COS(SINE / 32))), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1 - 0.05 * COS(SINE / 22),0)*ANGLES(RAD(0),RAD(-90),RAD(0))*ANGLES(RAD(-3),RAD(0 - 1 * COS(SINE / 56)),RAD(0 + 2 * COS(SINE / 32))), 0.2 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 2 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(4 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(30), RAD(0), RAD(0 + 25 * COS(SINE / 20))), 0.15 / Animation_Speed)
		 
	        RightShoulder.C0 = Clerp(RightShoulder.C0, CF(.95, 0.5, 0.3) * ANGLES(RAD(-20), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 , 0.5 , 0 ) * ANGLES(RAD(0 +180*SIN(sick.PlaybackLoudness/300)), RAD(0), RAD(0 )) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
end
if MODE == "literallyeverysingleserversidedestroyerever" then
            RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 - 0.3 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5), RAD(0), RAD(-45)), 1 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1, 0.5, 0.5) * ANGLES(RAD(-20), RAD(-.6), RAD(-43)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, 0.5) * ANGLES(RAD(-20), RAD(-.6), RAD(43)) * LEFTSHOULDERC0, 1 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.3 * COS(SINE / 2),-0.01) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-6), RAD(0), RAD(0)), 0.5 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 + 0.3 * COS(SINE / 2),-0.01) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-6), RAD(0), RAD(0)), 0.5 / Animation_Speed)
end
if MODE == "bones" then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(-25 + 2.5 * SIN(SINE / 12)), RAD(-55 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
end
if MODE == "dancing" then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(-0.5*COS(SINE / 40),0,3-2*COS(SINE / 40))*ANGLES(RAD(-70 + 20 *COS(SINE / 40)),RAD(0),RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-15 + 25*COS(SINE / 40)), RAD(0), RAD(21 + 2.5 * SIN(SINE / 40))), 1 / Animation_Speed) 
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-20 + 40 * COS(SINE / 40)), RAD(0), RAD(15 + 3 * COS(SINE / 40) - 3 * SIN(SINE / 40))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-20 + 40 * COS(SINE / 40)), RAD(0), RAD(-15 + 3 * COS(SINE / 40) + 3 * SIN(SINE / 40))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
end
if MODE == "begging" then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(40), RAD(-10), RAD(0)), 0.15 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(10+5*SIN(sine/24))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-10-5*SIN(sine/24))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			if MODE == "VoidWalker" or MODE == "sussy" then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(MRANDOM(-15, 25) - 2.5 * SIN(SINE / 12)), RAD(MRANDOM(-15, 25)), RAD(MRANDOM(-15, 25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.5, 0.5) * ANGLES(RAD(250), RAD(20), RAD(-80))* RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(-5)) * LEFTSHOULDERC0, 0.35 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
			elseif MODE == "Terror" or MODE == "INSANE" then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(MRANDOM(-15, 25) - 2.5 * SIN(SINE / 12)), RAD(MRANDOM(-15, 25)), RAD(MRANDOM(-15, 25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(5)) * RIGHTSHOULDERC0, 0.35 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(-5)) * LEFTSHOULDERC0, 0.35 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
elseif MODE == "catgod"  then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.05) * ANGLES(RAD(0), RAD(0), RAD(-15 * COS(SINE / (WALKSPEEDVALUE)))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(10 * COS(SINE / (WALKSPEEDVALUE)))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(100 + 2 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(15)) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(70 * SIN(SINE / WALKSPEEDVALUE)), RAD(5), RAD(-25)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-10)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 2 / Animation_Speed)
elseif MODE == "endmad" or MODE == "ascen" or MODE == "thing" then
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0 + .5 * math.cos(SINE/50),0,3 - .5 * math.sin(SINE/50)) * CFrame.Angles(math.rad(40),math.rad(0),math.rad(0)),0.7/3)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 11), 0.5*SIZE+0.2 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(-10+-20 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(25+-10 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+-0.3 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(150+10 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-0.5,-0.5) * CFrame.Angles(math.rad(-20 + 9 * math.cos(SINE/74)),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(0 + 5 * math.cos(SINE/37)),math.rad(0),math.rad(0)),0.7/3)
				LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-20 - 9 * math.cos(SINE/54)),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(0 - 5 * math.cos(SINE/41)),math.rad(0),math.rad(0)),0.7/3)
elseif MODE == "spaceiscool" then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 8 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.1, -0.4) * ANGLES(RAD(150), RAD(0), RAD(0))* RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-60 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(-5)) * LEFTSHOULDERC0, 0.35 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
elseif MODE == "meme" then
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0*CFrame.new(math.random(-1,1)/2,math.random(-1,1)/2,math.random(-1,1)/2)*CFrame.Angles(math.rad(math.random(-45,45)),math.rad(math.random(-45,45)),0),1)
					Neck.C0 = Clerp(Neck.C0,NECKC0,1)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(2,0,0) * RIGHTSHOULDERC0 * CFrame.Angles(math.rad(-90),0,0),1)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-2,0,0) * LEFTSHOULDERC0 * CFrame.Angles(math.rad(-90),0,0),1)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(.5,-2,0),1)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-.5,-2,0),1)


       
                    
			else



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(MRANDOM(-15, 25) - 2.5 * SIN(SINE / 12)), RAD(MRANDOM(-15, 25)), RAD(MRANDOM(-15, 25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.5, 0.5) * ANGLES(RAD(250), RAD(20), RAD(-80))* RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(-5)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
			end	
		end
	end
	unanchor()

	Humanoid.MaxHealth = math.huge
	Humanoid.Health = math.huge
	tecks2.Rotation = 0+5*M.C(SINE/32)
pcall(function()
if UsingBoombox == true then
sick.Volume = 0
else
sick.Volume = 1
end
end) 
	NAMEMODE.TextColor3 = Color3.new(sick.PlaybackLoudness/0,0,0)
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end

end
--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--
