game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "↓ Converted By",
    Text = "ToraWa Noya"
})

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Have fun!",
    Text = "ToraWa Noya is C00l_Ch4os"
})

game.ReplicatedStorage["01_server"]:FireServer("cmd", "-r6")
wait(2)
game.ReplicatedStorage["01_server"]:FireServer("cmd", "-gh 108622273884500 107226489545452")
wait(3)
game.ReplicatedStorage["01_server"]:FireServer("cmd", "-net")
wait(1.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/oldhacfard/The-script/refs/heads/main/Reanimate.luau"))()

Player=game:GetService("Players").LocalPlayer
Character=Player.Character
PlayerGui=Player.PlayerGui
Backpack=Player.Backpack
Torso=Character.Torso
Head=Character.Head
Humanoid=Character:FindFirstChildOfClass("Humanoid")
m=Instance.new('Model',Character)
m2=Instance.new('Model',Character)
effs=Instance.new('Model',Character)
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
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
cloaked=false
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
deb=false
equipped=true
hand=false
MMouse=nil
combo=0
mana=0
trispeed=.2
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
player=nil
mana=0
local CurrentMode = "Unsheathed"

mouse=Player:GetMouse()

RSH, LSH=nil, nil

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

RSH.Parent=nil
LSH.Parent=nil

RW.Name="Right Shoulder"
RW.Part0=ch.Torso
RW.C0=cf(1.5, 0.5, 0)
RW.C1=cf(0, 0.5, 0)
RW.Part1=ch["Right Arm"]
RW.Parent=ch.Torso

LW.Name="Left Shoulder"
LW.Part0=ch.Torso
LW.C0=cf(-1.5, 0.5, 0)
LW.C1=cf(0, 0.5, 0)
LW.Part1=ch["Left Arm"]
LW.Parent=ch.Torso

        local function weldBetween(a, b)
            local weldd = Instance.new("ManualWeld")
            weldd.Part0 = a
            weldd.Part1 = b
            weldd.C0 = CFrame.new()
            weldd.C1 = b.CFrame:inverse() * a.CFrame
            weldd.Parent = a
            return weldd
        end

        function nooutline(part)
                part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
        end

        function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
                local fp=it("Part")
                fp.formFactor=formfactor
                fp.Parent=parent
                fp.Reflectance=reflectance
                fp.Transparency=transparency
                fp.CanCollide=false
                fp.Locked=true
                fp.BrickColor=BrickColor.new(tostring(brickcolor))
                fp.Name=name
                fp.Size=size
                fp.Position=Character.Torso.Position
                nooutline(fp)
                fp.Material=material
                fp:BreakJoints()
                return fp
        end

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")
frame = 0.015
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
function swait(num)
  if num == 0 or num == nil then
    ArtificialHB.Event:wait(0)
  else
    for i = 0, num do
      ArtificialHB.Event:wait(0)
    end
  end
end

        function mesh(Mesh,part,meshtype,meshid,offset,scale)
                local mesh=it(Mesh)
                mesh.Parent=part
                if Mesh=="SpecialMesh" then
                        mesh.MeshType=meshtype
                        mesh.MeshId=meshid
                end
                mesh.Offset=offset
                mesh.Scale=scale
                return mesh
        end

        function weld(parent,part0,part1,c0,c1)
                local weld=it("Weld")
                weld.Parent=parent
                weld.Part0=part0
                weld.Part1=part1
                weld.C0=c0
                weld.C1=c1
                return weld
        end

local function CFrameFromTopBack(at, top, back)
local right = top:Cross(back)
return CFrame.new(at.x, at.y, at.z,
right.x, top.x, back.x,
right.y, top.y, back.y,
right.z, top.z, back.z)
end

function Triangle(a, b, c)
local edg1 = (c-a):Dot((b-a).unit)
local edg2 = (a-b):Dot((c-b).unit)
local edg3 = (b-c):Dot((a-c).unit)
if edg1 <= (b-a).magnitude and edg1 >= 0 then
a, b, c = a, b, c
elseif edg2 <= (c-b).magnitude and edg2 >= 0 then
a, b, c = b, c, a
elseif edg3 <= (a-c).magnitude and edg3 >= 0 then
a, b, c = c, a, b
else
assert(false, "unreachable")
end

local len1 = (c-a):Dot((b-a).unit)
local len2 = (b-a).magnitude - len1
local width = (a + (b-a).unit*len1 - c).magnitude

local maincf = CFrameFromTopBack(a, (b-a):Cross(c-b).unit, -(b-a).unit)

local list = {}

if len1 > 0.01 then
local w1 = Instance.new('WedgePart', m)
game:GetService("Debris"):AddItem(w1,5)
w1.Material = "SmoothPlastic"
w1.FormFactor = 'Custom'
w1.BrickColor = BrickColor.new("White")
w1.Transparency = 0
w1.Reflectance = 0
w1.Material = "Neon"
w1.CanCollide = false
NoOutline(w1)
local sz = Vector3.new(0.2, width, len1)
w1.Size = sz
local sp = Instance.new("SpecialMesh",w1)
sp.MeshType = "Wedge"
sp.Scale = Vector3.new(0,1,1) * sz/w1.Size
w1:BreakJoints()
w1.Anchored = true
w1.Parent = workspace
w1.Transparency = 0.3
table.insert(Effects,{w1,"Disappear",.03})
w1.CFrame = maincf*CFrame.Angles(math.pi,0,math.pi/2)*CFrame.new(0,width/2,len1/2)
table.insert(list,w1)
end
if len2 > 0.01 then
local w2 = Instance.new('WedgePart', m)
game:GetService("Debris"):AddItem(w2,5)
w2.Material = "SmoothPlastic"
w2.FormFactor = 'Custom'
w2.BrickColor = BrickColor.new("White")
w2.Transparency = 0
w2.Reflectance = 0
w2.Material = "Neon"
w2.CanCollide = false
NoOutline(w2)
local sz = Vector3.new(0.2, width, len2)
w2.Size = sz
local sp = Instance.new("SpecialMesh",w2)
sp.MeshType = "Wedge"
sp.Scale = Vector3.new(0,1,1) * sz/w2.Size
w2:BreakJoints()
w2.Anchored = true
w2.Parent = workspace
w2.Transparency = 0.3
table.insert(Effects,{w2,"Disappear",.03})
w2.CFrame = maincf*CFrame.Angles(math.pi,math.pi,-math.pi/2)*CFrame.new(0,width/2,-len1 - len2/2)
table.insert(list,w2)
end
return unpack(list)
end

so = function(id,par,vol,pit)
coroutine.resume(coroutine.create(function()
local sou = Instance.new("Sound",par or workspace)
sou.Volume=vol
sou.Pitch=pit or 1
sou.SoundId=id
swait()
sou:play()
game:GetService("Debris"):AddItem(sou,6)
end))
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

function rayCast(Pos, Dir, Max, Ignore)
return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end

local Sword1 = Character:FindFirstChild("Accessory (Rainbow Sword 1)")
local Sword2 = Character:FindFirstChild("Accessory (Rainbow Sword 2)")

handle = Sword1.Handle
for _, joint in ipairs(handle:GetChildren()) do
	if joint:IsA("Weld") or joint:IsA("WeldConstraint") or joint:IsA("ManualWeld") then
		joint:Destroy()
	end
end
handle.Anchored = false
handle.CanCollide = false
handle.Massless = true
handleweld=weld(handle,Character["Left Arm"],handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.00324273, 0.013961792, -0.00828075409, -1.38366803e-013, -0.999999881, 4.25688995e-009, 2.4656245e-007, -4.25688951e-009, -1, 1, -1.373172e-013, 2.4656245e-007))
Hitbox=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0.5,1,"White","Hitbox",Vector3.new(1.04400003, 6.35600042, 0.600000024))
Hitboxweld=weld(m,handle,Hitbox,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
mesh("BlockMesh",Hitbox,"","",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.579999983))

handle2 = Sword2.Handle
for _, joint in ipairs(handle2:GetChildren()) do
	if joint:IsA("Weld") or joint:IsA("WeldConstraint") or joint:IsA("ManualWeld") then
		joint:Destroy()
	end
end
handle2.Anchored = false
handle2.CanCollide = false
handle2.Massless = true
handle2weld=weld(handle2,Character["Right Arm"],handle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.00324273, 0.013961792, -0.00828075409, -1.38366803e-013, -0.999999881, 4.25688995e-009, 2.4656245e-007, -4.25688951e-009, -1, 1, -1.373172e-013, 2.4656245e-007)*CFrame.Angles(0, math.rad(180), 0))
Hitbox2=part(Enum.FormFactor.Custom,m2,Enum.Material.Neon,0.5,1,"White","Hitbox",Vector3.new(1.04400003, 6.35600042, 0.600000024))
Hitbox2weld=weld(m2,handle2,Hitbox2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
mesh("BlockMesh",Hitbox2,"","",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.579999983))

local att1 = Instance.new("Attachment",Hitbox)
att1.Name = "TrailAtt1"
att1.Position = Vector3.new(0, Hitbox.Size.Y/2, 0)
local att2 = Instance.new("Attachment",Hitbox)
att2.Name = "TrailAtt2"
att2.Position = Vector3.new(0, -Hitbox.Size.Y/2, 0)
local tr1 = Instance.new("Trail",Hitbox)
tr1.Color = ColorSequence.new(Hitbox.BrickColor.Color)
tr1.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 1)
})
tr1.Lifetime = 0.4
tr1.LightEmission = 1
tr1.Attachment0 = att1
tr1.Attachment1 = att2
tr1.Enabled = true

local att3 = Instance.new("Attachment",Hitbox2)
att3.Name = "TrailAtt3"
att3.Position = Vector3.new(0, Hitbox2.Size.Y/2, 0)
local att4 = Instance.new("Attachment",Hitbox2)
att4.Name = "TrailAtt4"
att4.Position = Vector3.new(0, -Hitbox2.Size.Y/2, 0)
local tr2 = Instance.new("Trail",Hitbox2)
tr2.Color = ColorSequence.new(Hitbox2.BrickColor.Color)
tr2.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 1)
})
tr2.Lifetime = 0.4
tr2.LightEmission = 1
tr2.Attachment0 = att3
tr2.Attachment1 = att4
tr2.Enabled = true

local Lite = it("PointLight",Torso)
Lite.Color = Color3.new(.7,0,1)
Lite.Range = 8
Lite.Brightness = 10
Lite.Shadows = true

musid = "rbxassetid://413641131"
local mus = Instance.new("Sound",Character)
mus.Name = "mus"
mus.SoundId = musid
mus.Looped = true
mus.Volume = 4
mus:Play()

function BreakEffect(brickcolor,cframe,x1,y1,z1)
local prt=part("Custom",effs,"Neon",0,0,"White","Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
local msh=mesh("SpecialMesh",prt,"Sphere","",vt(0,0,0),vt(x1,y1,z1))
coroutine.resume(coroutine.create(function(Part,CF,Numbb,randnumb)
CF=Part.CFrame
Numbb=0
randnumb=math.random()-math.random()
for i=0,1,0.05 do
swait()
CF=CF*cf(0,1,0)

Part.CFrame=CF*euler(Numbb,0,0)
Part.Transparency=i
Numbb=Numbb+randnumb
end
Part.Parent=nil
end),prt)
end

neons = {}
for i, v in pairs(Character:GetDescendants()) do
if v:IsA("BasePart") and (v.Parent == m or v.Parent == m2) and v.BrickColor == BrickColor.new("White") then
table.insert(neons,v)
v.Material = "Neon"
end
end

function updateCol2(col)
tr2.Color = ColorSequence.new(col)
tr1.Color = ColorSequence.new(col)
Lite.Color = col
for i, v in pairs(effs:children()) do
v.Color = col
end
for i=1,#neons do
neons[i].Color = col
end
end

colrr = Color3.new()
coroutine.resume(coroutine.create(function()
while true do
for i = 0,256,16 do
colrr = Color3.new(1,i/256,0)
updateCol2(colrr)
swait()
end
for i = 0,256,16 do
colrr = Color3.new(1-i/256,1,0)
updateCol2(colrr)
swait()
end
for i = 0,256,16 do
colrr = Color3.new(0,1,i/256)
updateCol2(colrr)
swait()
end
for i = 0,256,16 do
colrr = Color3.new(0,1-i/256,1)
updateCol2(colrr)
swait()
end
for i = 0,256,16 do
colrr = Color3.new(i/256,0,1)
updateCol2(colrr)
swait()
end
for i = 0,256,16 do
colrr = Color3.new(1,0,1-i/256)
updateCol2(colrr)
swait()
end
end
end))

function attackone()
        attack=true
		tr1.Enabled = true
        local con=Hitbox.Touched:connect(function(hit) end)
        for i=0,1,0.1 do
                swait()
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(120),math.rad(0),math.rad(20)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-90)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-50),math.rad(-5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(120),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(50)),.3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
        end
        so("http://www.roblox.com/asset/?id=154965962",Hitbox,1,1)
        so("http://www.roblox.com/asset/?id=231917758",Hitbox,1,1)
        hitconasdf = Hitbox.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox,1,1)
                        for i = 1,10 do
                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)
                        end
                        hitconasdf:disconnect()
                end
        end)
                for i=0,1,0.1 do
                swait()

RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(110),math.rad(-90),math.rad(20)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-50)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-120),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(90)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(-50)),.3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
        end
        attack=false
		tr1.Enabled = true
        con:disconnect()
        scfr = nil

        pcall(function()
        hitconasdf:disconnect()
        end)
end

function attacktwo()
        attack=true
		tr1.Enabled = true
        local con=Hitbox.Touched:connect(function(hit) end)
        for i=0,1,0.1 do
                swait()
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(0),math.rad(90),math.rad(90)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-50)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-130),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(-50)),.3)
        end
        so("http://www.roblox.com/asset/?id=154965962",Hitbox,1,.9)
        so("http://www.roblox.com/asset/?id=231917758",Hitbox,1,.9)
        hitconasdf = Hitbox.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox,1,1)
                        for i = 1,10 do
                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)
                        end
                        hitconasdf:disconnect()
                end
        end)
        for i=0,1,0.1 do
                swait()

RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(0),math.rad(-50),math.rad(90)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-90)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-50),math.rad(-5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(130),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(50)),.3)
        end
        attack=false
		tr1.Enabled = true
        con:disconnect()
        scfr = nil
        pcall(function()
        hitconasdf:disconnect()
        end)
end

function attack2one()
        attack=true
		tr2.Enabled = true
        local con=Hitbox2.Touched:connect(function(hit) end)
        for i=0,1,0.1 do
                swait()
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(70)),.3)
RW.C0 = clerp(RW.C0,CFrame.new(1.40839815, 0.633968949, 0.140340954, 0.766044259, -0.642787933, 7.74860382e-07, 0.492404878, 0.586824119, -0.64278686, 0.413175166, 0.492403537, 0.766045213),0.3)
LW.C0 = clerp(LW.C0,CFrame.new(-1.35310566, 0.284592211, 0.109513491, 0.178405479, 0.982817411, 0.0473444164, 0.969994664, -0.167593122, -0.176132992, -0.165171936, 0.0773468912, -0.983227134),0.3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-130),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(-50)),.3)
end
        so("http://www.roblox.com/asset/?id=154965962",Hitbox2,1,1)
        so("http://www.roblox.com/asset/?id=231917758",Hitbox2,1,1)
        hitconasdf = Hitbox2.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox2,1,1)
                        for i = 1,10 do
                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)
                        end
                        hitconasdf:disconnect()
                end
        end)
                for i=0,1,0.1 do
                swait()

LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-130),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RW.C0 = clerp(RW.C0,CFrame.new(1.40839434, 0.633969903, 0.140334338, 0.766044557, -0.642787576, 1.93715096e-06, 0.492405057, 0.586823642, -0.642787158, 0.41317451, 0.49240455, 0.766044974),0.3)
LW.C0 = clerp(LW.C0,CFrame.new(-1.31502986, 0.279656291, -0.555327773, 0.691364348, -0.713763416, 0.11205925, 0.35895291, 0.204722002, -0.910627127, 0.627031207, 0.669799149, 0.397744954),0.3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(50)),.3)
        end
        attack=false
		tr2.Enabled = true
        con:disconnect()
        scfr = nil

        pcall(function()
        hitconasdf:disconnect()
        end)
end

function Stab()
attack=true
		tr1.Enabled = true
		tr2.Enabled = true
for i=0,1,0.05 do
swait()
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(-50),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.2,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(90)),.1)
LW.C0=clerp(LW.C0,cf(-1.2,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.1)
LH.C0=clerp(LH.C0,cf(-1,-.9,0)*angles(math.rad(-50),math.rad(-60),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-.9,0)*angles(math.rad(-50),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
local con=Hitbox.Touched:connect(function(hit) end)
hitconasdf = Hitbox.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox,1,1)
                        for i = 1,10 do
                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)
                        end
                        hitconasdf:disconnect()
                end
        end)
local con2=Hitbox2.Touched:connect(function(hit) end)
hitconasdf2 = Hitbox2.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox2,1,1)
                        for i = 1,10 do
                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)
                        end
                        hitconasdf2:disconnect()
                end
        end)
so("http://www.roblox.com/asset/?id=154965962",Hitbox,1,.9)
so("http://www.roblox.com/asset/?id=231917758",Hitbox,1,.9)
for i=0,1,0.1 do
swait()

RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.4)
RW.C0=clerp(RW.C0,cf(1.2,0.5,0)*angles(math.rad(20),math.rad(100),math.rad(90)),.3)
LW.C0=clerp(LW.C0,cf(-1.2,0.5,0)*angles(math.rad(20),math.rad(-100),math.rad(-90)),.3)
LH.C0=clerp(LH.C0,cf(-1,-.9,0)*angles(math.rad(0),math.rad(-60),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-.9,0)*angles(math.rad(40),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
swait(5)
con:disconnect()
con2:disconnect()
swait(20)
attack=false
tr1.Enabled = true
tr2.Enabled = true
scfr = nil

pcall(function()
        hitconasdf:disconnect()
        hitconasdf2:disconnect()
        end)
end

function Spin()
attack=true
		tr1.Enabled = true
		tr2.Enabled = true
        local con=Hitbox.Touched:connect(function(hit) end)
        hitconasdf = Hitbox.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox,1,1)

                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)

                end
        end)
        local con2=Hitbox2.Touched:connect(function(hit) end)
        hitcon2asdf = Hitbox2.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox2,1,1)

                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)

                end
        end)
for i=0,1,1 do
so("http://roblox.com/asset/?id=154965962",Hitbox,1,1)
so("http://www.roblox.com/asset/?id=231917758",Hitbox,1,1)
swait()
for i=0,1,0.1 do
swait()

RW.C0=clerp(RW.C0,cf(1,0.5,-.5)*angles(math.rad(90),math.rad(0),math.rad(0)),.3)
LW.C0=clerp(LW.C0,cf(-1,0.5,-.5)*angles(math.rad(90),math.rad(0),math.rad(0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-.5,-1)*angles(math.rad(-20),math.rad(-90),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-.5,-1)*angles(math.rad(-20),math.rad(90),math.rad(0)),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,5)*euler(6*i,0,0),.5)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
end
attack=false
tr1.Enabled = true
tr2.Enabled = true
con:disconnect()
con2:disconnect()
scfr = nil

pcall(function()
        hitconasdf:disconnect()
        hitcon2asdf:disconnect()
        end)
end

function ContAttack()
        attack=true
		tr1.Enabled = true
		tr2.Enabled = true
        local con=Hitbox.Touched:connect(function(hit) end)
        hitconasdf = Hitbox.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox,1,1)

                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)

                end
        end)
        local con2=Hitbox2.Touched:connect(function(hit) end)
        hitcon2asdf = Hitbox2.Touched:connect(function(hit)
                local hum12 = hit.Parent:FindFirstChildOfClass("Humanoid")
                if hum12 and not hum12:IsDescendantOf(Character) then
                        so('http://roblox.com/asset/?id=154965973',Hitbox2,1,1)

                        BreakEffect(BrickColor.new("White"),hit.Parent.Head.CFrame*CFrame.new(0,-2,0),0.5,math.random(5,20),0.5)

                end
        end)
        for i=1,4 do
	    swait()
        for i=0,1,0.2 do
                swait()
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(120),math.rad(0),math.rad(20)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-90)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-50),math.rad(-5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(120),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(50)),.3)
        end
        so("http://www.roblox.com/asset/?id=154965962",Hitbox,1,1)
        so("http://www.roblox.com/asset/?id=231917758",Hitbox,1,1)
for i=0,1,0.2 do
swait()

RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(110),math.rad(-90),math.rad(20)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-50)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-120),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(90)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(-50)),.3)
        end
        for i=0,1,0.2 do
                swait()
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(0),math.rad(90),math.rad(90)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(-20),math.rad(-50)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-130),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(-50)),.3)
        end
        so("http://www.roblox.com/asset/?id=154965962",Hitbox,1,.9)
        so("http://www.roblox.com/asset/?id=231917758",Hitbox,1,.9)
        for i=0,1,0.2 do
                swait()
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(70)),.3)
RW.C0 = clerp(RW.C0,CFrame.new(1.40839815, 0.633968949, 0.140340954, 0.766044259, -0.642787933, 7.74860382e-07, 0.492404878, 0.586824119, -0.64278686, 0.413175166, 0.492403537, 0.766045213),0.3)
LW.C0 = clerp(LW.C0,CFrame.new(-1.35310566, 0.284592211, 0.109513491, 0.178405479, 0.982817411, 0.0473444164, 0.969994664, -0.167593122, -0.176132992, -0.165171936, 0.0773468912, -0.983227134),0.3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-130),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(-50)),.3)
end
        so("http://www.roblox.com/asset/?id=154965962",Hitbox2,1,1)
        so("http://www.roblox.com/asset/?id=231917758",Hitbox2,1,1)
                for i=0,1,0.2 do
                swait()
                local blcf = Hitbox2.CFrame*CFrame.new(0,.3,0)

LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-130),math.rad(5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(50),math.rad(10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RW.C0 = clerp(RW.C0,CFrame.new(1.40839434, 0.633969903, 0.140334338, 0.766044557, -0.642787576, 1.93715096e-06, 0.492405057, 0.586823642, -0.642787158, 0.41317451, 0.49240455, 0.766044974),0.3)
LW.C0 = clerp(LW.C0,CFrame.new(-1.31502986, 0.279656291, -0.555327773, 0.691364348, -0.713763416, 0.11205925, 0.35895291, 0.204722002, -0.910627127, 0.627031207, 0.669799149, 0.397744954),0.3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(50)),.3)
        end
        end
        attack=false
		tr1.Enabled = true
		tr2.Enabled = true
        con:disconnect()
        con2:disconnect()
        scfr = nil

        pcall(function()
        hitconasdf:disconnect()
        hitcon2asdf:disconnect()
        end)
end

function Sheathe()
attack = true
so("http://www.roblox.com/asset/?id=273797222",Hitbox,1,.9)
CurrentMode = "Sheathed"
for i = 0,1,0.1 do
swait()
handleweld.Part0 = Torso
handle2weld.Part0 = Torso
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(0),math.rad(-20)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(190),math.rad(0),math.rad(0)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-190),math.rad(0),math.rad(-0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-60),math.rad(-5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0.5,0.5,0.75)*angles(math.rad(90),math.rad(155),math.rad(90)),.3)
handle2weld.C0=clerp(handle2weld.C0,cf(-0.5,0.5,0.75)*angles(math.rad(90),math.rad(25),math.rad(90)),.3)
end
attack = false
end

function Unsheathe()
attack = true
CurrentMode = "Unsheathed"
so("http://www.roblox.com/asset/?id=239169404",Hitbox,1,.9)
for i = 0,1,0.1 do
swait()
handleweld.Part0 = RightArm
handle2weld.Part0 = LeftArm
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(60)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(200),math.rad(0),math.rad(0)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-200),math.rad(0),math.rad(0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-60),math.rad(-5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
scfr = nil
attack = false
end

local Sit = false

mouse.Button1Down:connect(function()
        if attack==false then
                if attacktype==1 and CurrentMode == "Unsheathed" then
                        attack=true
                        attacktype=2
                        attackone()
                elseif attacktype==2 and CurrentMode == "Unsheathed" then
                        attack=true
                        attacktype=1
                        attack2one()
                end
        end
end)

mouse.KeyDown:connect(function(k)
        k=k:lower()
				if k=='m' then
				if Character:FindFirstChild("mus")~=nil then
				if mus.IsPlaying == true then
				mus:Stop()
				elseif mus.IsPaused == true then
				mus:Play()
				end
				elseif Character:FindFirstChild("mus")==nil then
				local mus = Instance.new("Sound",Character)
				mus.Name = "mus"
				mus.SoundId = musid
				mus.Looped = true
				mus.Volume = 1
				mus:Play()
				end
				elseif k=='l' then
				musid = "rbxassetid://147930134"
				mus.SoundId = musid
				mus:Play()
				elseif k=='k' then
				musid = "rbxassetid://700654812"
				mus.SoundId = musid
				mus:Play()
				end
        		if k=='q' then
                if attack==false and CurrentMode == "Unsheathed" then
                        Stab()
                end
                elseif k=='e' then
                if attack==false and CurrentMode == "Unsheathed" then
                        Spin()
                end
                elseif k=='r' then
                if attack==false and CurrentMode == "Unsheathed" then
                        ContAttack()
                end
                elseif k=='f' then
                if attack==false and CurrentMode == "Unsheathed" then
                        Sheathe()
                elseif k=='f' then
                if attack==false and Sit == false and CurrentMode == "Sheathed" then
                        Unsheathe()
                end
                end
                elseif k=='t' then
                if attack==false and Sit == false and CurrentMode == "Sheathed" then
                Sit = true
                elseif k=='t' then
                if attack==false and Sit == true and CurrentMode == "Sheathed" then
                Sit = false
                end
                end

        end
end)

local sine = 0
local change = 1
local val = 0

while true do
swait()
if Sit == true then
Humanoid.WalkSpeed = 0
Humanoid.JumpPower = 0
else
Humanoid.WalkSpeed = 60
Humanoid.JumpPower = 50
end
sine = sine + change
local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude
local velderp=RootPart.Velocity.y
hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
if equipped==true or equipped==false then
if attack==false then
idle=idle+1
else
idle=0
end
if idle>=500 then
if attack==false then
end
end
if RootPart.Velocity.y > 1 and hitfloor==nil then
Anim="Jump"
if attack==false and Sit == false and CurrentMode == "Unsheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(50),math.rad(0),math.rad(30)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-40),math.rad(5),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-.5,-1)*angles(math.rad(-20),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
if attack==false and Sit == false and CurrentMode == "Sheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(-10),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-20),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(0),math.rad(0),math.rad(30)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(0),math.rad(0),math.rad(-30)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,-.2)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,-.2)*angles(math.rad(0),math.rad(90),math.rad(5))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0.5,0.5,0.75)*angles(math.rad(90),math.rad(155),math.rad(90)),.3)
handle2weld.C0=clerp(handle2weld.C0,cf(-0.5,0.5,0.75)*angles(math.rad(90),math.rad(25),math.rad(90)),.3)
end
elseif RootPart.Velocity.y < -1 and hitfloor==nil then
Anim="Fall"
if attack==false and Sit == false and CurrentMode == "Unsheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(-5),math.rad(0),math.rad(20)),.3)
LW.C0=clerp(LW.C0,CFrame.new(-1.40685952, 0.347550094, -0.023207128, 0.965925872, 0.224143773, -0.129409492, -0.258818924, 0.836516261, -0.482963085, 0, 0.500000119, 0.866025388),.3)
LH.C0=clerp(LH.C0,cf(-1,-.5,-1)*angles(math.rad(-20),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
if attack==false and Sit == false and CurrentMode == "Sheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(0),math.rad(0),math.rad(50)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(0),math.rad(0),math.rad(-50)),.3)
LH.C0=clerp(LH.C0,cf(-1,-.5,-.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,-.5)*angles(math.rad(0),math.rad(90),math.rad(5))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0.5,0.5,0.75)*angles(math.rad(90),math.rad(155),math.rad(90)),.3)
handle2weld.C0=clerp(handle2weld.C0,cf(-0.5,0.5,0.75)*angles(math.rad(90),math.rad(25),math.rad(90)),.3)
end
elseif torvel<1 and hitfloor~=nil then
Anim="Idle"
if attack==false and Sit == false and CurrentMode == "Unsheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(40)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(40),math.rad(0),math.rad(20)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-10),math.rad(20),math.rad(-10)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-60),math.rad(-5))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(-10))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
if attack==false and Sit == false and CurrentMode == "Sheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-0),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(0),math.rad(0),math.rad(5)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(0),math.rad(0),math.rad(-5)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(5))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0.5,0.5,0.75)*angles(math.rad(90),math.rad(155),math.rad(90)),.3)
handle2weld.C0=clerp(handle2weld.C0,cf(-0.5,0.5,0.75)*angles(math.rad(90),math.rad(25),math.rad(90)),.3)
end
if attack==false and Sit == true and CurrentMode == "Sheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-2)*angles(math.rad(-10),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(-10),math.rad(0),math.rad(5)),.3)
LW.C0=clerp(LW.C0,cf(-1.3,0.5,0)*euler(math.rad(90),math.rad(0),math.rad(30)),.3)
LH.C0=clerp(LH.C0,cf(-1,.7,-.5)*angles(math.rad(0),math.rad(-90),math.rad(-10))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-.5,-.5)*angles(math.rad(0),math.rad(90),math.rad(70))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0.5,0.5,0.75)*angles(math.rad(90),math.rad(155),math.rad(90)),.3)
handle2weld.C0=clerp(handle2weld.C0,cf(-0.5,0.5,0.75)*angles(math.rad(90),math.rad(25),math.rad(90)),.3)
end
elseif torvel>2 and hitfloor~=nil then
Anim="Walk"
if attack==false and Sit == false and CurrentMode == "Unsheathed" then
change=2
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(-5),math.rad(0),math.rad(20)),.3)
LW.C0=clerp(LW.C0,CFrame.new(-1.40685952, 0.347550094, -0.023207128, 0.965925872, 0.224143773, -0.129409492, -0.258818924, 0.836516261, -0.482963085, 0, 0.500000119, 0.866025388),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
handleweld.C0 = clerp(handleweld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(0), math.rad(0)), .3)
handle2weld.C0 = clerp(handle2weld.C0, cf(0, -0.15, -3) * angles(math.rad(0), math.rad(180), math.rad(0)), .3)
end
if attack==false and Sit == false and CurrentMode == "Sheathed" then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(math.rad(45*math.cos(sine/10)),math.rad(0),math.rad(5)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(math.rad(-45*math.cos(sine/10)),math.rad(0),math.rad(-5)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2),math.rad(0),math.rad(0)),.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(5))*angles(math.rad(-2),math.rad(0),math.rad(0)),.3)
handleweld.C0=clerp(handleweld.C0,cf(0.5,0.5,0.75)*angles(math.rad(90),math.rad(155),math.rad(90)),.3)
handle2weld.C0=clerp(handle2weld.C0,cf(-0.5,0.5,0.75)*angles(math.rad(90),math.rad(25),math.rad(90)),.3)
end
end
end
if #Effects>0 then
for e=1,#Effects do
if Effects[e]~=nil then
local Thing=Effects[e]
if Thing~=nil then
local Part=Thing[1]
local Mode=Thing[2]
local Delay=Thing[3]
local IncX=Thing[4]
local IncY=Thing[5]
local IncZ=Thing[6]
if Thing[1].Transparency<=1 then
if Thing[2]=="Block1" then
Thing[1].CFrame=Thing[1].CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
Mesh=Thing[1].Mesh
Mesh.Scale=Mesh.Scale+vt(Thing[4],Thing[5],Thing[6])
Thing[1].Transparency=Thing[1].Transparency+Thing[3]
elseif Thing[2]=="Cylinder" then
Mesh=Thing[1].Mesh
Mesh.Scale=Mesh.Scale+vt(Thing[4],Thing[5],Thing[6])
Thing[1].Transparency=Thing[1].Transparency+Thing[3]
elseif Thing[2]=="Blood" then
Mesh=Thing[7]
Thing[1].CFrame=Thing[1].CFrame*cf(0,.5,0)
Mesh.Scale=Mesh.Scale+vt(Thing[4],Thing[5],Thing[6])
Thing[1].Transparency=Thing[1].Transparency+Thing[3]
elseif Thing[2]=="Elec" then
Mesh=Thing[1].Mesh
Mesh.Scale=Mesh.Scale+vt(Thing[7],Thing[8],Thing[9])
Thing[1].Transparency=Thing[1].Transparency+Thing[3]
elseif Thing[2]=="Disappear" then
Thing[1].Transparency=Thing[1].Transparency+Thing[3]
end
else
Part.Parent=nil
table.remove(Effects,e)
end
end
end
end
end
end