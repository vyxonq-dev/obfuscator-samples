
local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local Lighting = game:GetService("Lighting")
_G.EN = nil
pcall(function()
for i = 1,6 do 
Lighting:FindFirstChildWhichIsA('Atmosphere'):Destroy()
Lighting:FindFirstChildWhichIsA('BloomEffect'):Destroy() end end)
Lighting.ClockTime = 0
Lighting.Ambient = Color3.fromRGB(108, 124, 144)
Lighting.Brightness = 2.25
Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top = Color3.fromRGB(215,190,135)
Lighting.EnvironmentDiffuseScale = 0.2
Lighting.EnvironmentSpecularScale = 0.2
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(106, 106, 106)
Lighting.ShadowSoftness = 0.2
Lighting.ExposureCompensation = .2
pcall(function() sethiddenproperty(Lighting, "Technology", "ShadowMap")
 end)
local Atmosphere = Instance.new("Atmosphere", Lighting)

Atmosphere.Density = 0.2;
Atmosphere.Offset = 0.5559999942779541;
Atmosphere.Color = Color3.new(1/2, 0.686275/2, 0.65098/2);
Atmosphere.Glare = 0.36000001430511475;
Atmosphere.Haze = 1.7200000286102295;
Atmosphere.Decay = Color3.new(0, 0, 0);

local Bloom  = Instance.new("BloomEffect", Lighting)

Bloom.Threshold = 0.500000011920929;
Bloom.Intensity = 0.30000001192092896;
Bloom.Size = 10;																					local yes = 9999
Bloom.Name = 'BLOOMM'
function info(t_ype, txt,dly)
notif:SendNotification(t_ype, txt, dly)
end
--AUDIO FUNCTION
getgenv().ChatText = true 

makefolder('TSB')
function GetFile(filename,filetype)
local result
local success, response = pcall(function()
result = readfile('TSB/'..filename..filetype)
end)
if success then

else
info('Info','Downloading '..filename..filetype,7)
local filep = game:HttpGet('https://github.com/Reapvitalized/AllAssetsForRecent/raw/refs/heads/main/'..filename..filetype)
writefile('TSB/'..filename..filetype,filep)
info('Success','Downloaded '..filename..filetype..'!',7)
end
end
GetFile('Vahika','.mov')
GetFile('AkihaVermillion','.mp3')

local parts = game.CoreGui.HeadsetDisconnectedDialog:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
part:Destroy() 
end end

local s= Instance.new('Sound')
s.SoundId = getcustomasset('TSB/AkihaVermillion.mp3')
s.Parent = game.CoreGui.HeadsetDisconnectedDialog
s.Volume = 1
s.Looped = true
s.Name = '1'
s:Play()
pcall(function()
_G.AkihaVermillion:Disconnect()
end)
_G.Gay = true
warn('Loading CameraShaker..')
notif:SendNotification("Info", 'Loading CameraShaker..', 6)
CameraShaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/AllAssetsForRecent/refs/heads/main/CameraShaker.lua"))()

notif:SendNotification("Info", 'Loading CameraShakeInstance..', 6)
warn('Loading CameraShakeInstance..')
CameraShakeInstance = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/AllAssetsForRecent/refs/heads/main/CameraShakeInstance.lua"))()
pcall(function() game:GetService("ReplicatedStorage").WR:Destroy() end)

local v = Instance.new('Folder')
v.Parent = game:GetService("ReplicatedStorage")
v.Name = 'WR'
local r = Instance.new('Folder')
r.Parent = v
r.Name = 'RS'
local rs = Instance.new('Folder')
rs.Parent = r
rs.Name = 'Effects'
warn('Loading Lightning..')
notif:SendNotification("Info", 'Loading Lightning Effect..', 6)
local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/AllAssetsForRecent/refs/heads/main/LightningModule.lua"))()
notif:SendNotification("Success", 'Loaded!', 6)
warn('Done!')
_G.Gay = false 
spawn(function()
local ddf = nil
for i, part in ipairs(game.Players.LocalPlayer.PlayerGui.TopbarPlus.TopbarContainer:GetChildren()) do
if part.Name == 'UnnamedIcon' then
for i, sex in ipairs(part.DropdownContainer.DropdownFrame:GetChildren()) do
if sex.Name == 'Bald' then
ddf = sex.Parent
end end end end
_G.AkihaVermillion = ddf.ChildAdded:Connect(function(pp)
if pp.name == 'HunterMastery' then 
local ib = pp:WaitForChild('Frame', 15).IconButton
local sai = ib.IconImage
local ye = Instance.new('VideoFrame')
local yee = Instance.new('UICorner')
yee.Parent = ye
ye.Parent = ib
ye.Size = sai.Size 
ye.Position = sai.Position 
ye.Name = 'Akiha Vermillion'
ye.AnchorPoint = sai.AnchorPoint
ye.Video = getcustomasset('TSB/Vahika.mov')
ye:Play()
ye.ZIndex = yes

ye.Looped = true 
local e = ib.IconLabel
spawn(function()
for i = 1,9999 do if _G.Gay == true or e.Parent ~= ib then break end
pcall(function()
sai.Image = 'rbxassetid://0'

ib.IconLabel.Text = 'Akiha Vermillion'
sai.IconGlow2.ImageTransparency = .8+math.sin(i/55)/25
end)
task.wait(.01) end end) end end)
end)
function MainEnv()
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack 
function randomstring()
	local e = {}
	for i = 1,math.random(140,180) do
		table.insert(e,#e+1,utf8.char(math.random(1111,1112)))
	end
	return table.concat(e)
end
getgenv().connections = getgenv().connections or {}
local function DestroySignals()
    for i,v in pairs(getgenv().connections) do
        if typeof(v) == "RBXScriptConnection" then
					warn('\nDUPLICATE FOUND!\nDisconnected! '..i)
            v:Disconnect()
        end
    end
end
local function SetupSignals()
    if getgenv().connections then
        DestroySignals()
    else
        getgenv().connections = {}
    end
end
SetupSignals()
getgenv().connections = nil 
getgenv().connections = getgenv().connections or {}
local function AddSignal(connection, name)
local str = randomstring()
warn('CONNECTION ADDED! '..name..'\nUNIQUE CONNECTION ID: '..str)
notif:SendNotification("Warning", 'CONNECTION ADDED! \n ~ '..'"'..name..'"', .3)
if getgenv().connections then
getgenv().connections[name..str or #getgenv().connections + 1] = connection
return connection
end
end

local function DestroySignal(name)
if getgenv().connections then
for key, connection in pairs(connections) do
if key:match(name) == name then
warn('CONNECTION REMOVED! '..name)
getgenv().connections[key]:Disconnect()
return connection
else 
warn('NOT A VALID CONNECTION! '..name)
end end
end end


getgenv().CameraShaker = CameraShaker.new(



Enum.RenderPriority.Camera.Value + 1, function(ShakeCFrame)


workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * ShakeCFrame


end)


getgenv().CameraShaker:Start()

getgenv().gay = true 
task.wait(.4)
getgenv().gay = false
local Combo = false
local lastHitTime = os.clock()
local timeout = 5
local health = nil
local ohealth = char.Humanoid.Health
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local HitCounter = Instance.new("TextLabel")
local DamageCounter = Instance.new("TextLabel")
local bh = Instance.new("TextLabel")
pcall(function() game.CoreGui.ComboCounter:Destroy() end)
task.delay(.1,function()
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = 'ComboCounter'
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundTransparency = 1
MainFrame.Position = UDim2.new(.93,0,.4,0)
MainFrame.Size = UDim2.new(.3,0,.1,0)
local Hits = Instance.new("NumberValue")
local Dmg =  Instance.new("NumberValue")
HitCounter.Parent = MainFrame
HitCounter.Font=Enum.Font.Arcade
HitCounter.TextColor3=Color3.new(1,1,1)
HitCounter.Position = UDim2.new(0,0,0,0)
HitCounter.Size = UDim2.new(.1,0,.1,0)
HitCounter.BackgroundTransparency = 1
HitCounter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HitCounter.BorderColor3 = Color3.fromRGB(255, 0, 0)
HitCounter.Visible = false
DamageCounter.Visible = false
DamageCounter.Parent = MainFrame
DamageCounter.Font=Enum.Font.Arcade
DamageCounter.TextColor3=Color3.new(1,1,1)
DamageCounter.Position = UDim2.new(-.05,0,.25,0)
DamageCounter.Size = UDim2.new(.1,0,.1,0)
DamageCounter.BackgroundTransparency = 1
DamageCounter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DamageCounter.BorderColor3 = Color3.fromRGB(255, 0, 0)

bh.Visible = false
bh.Parent = MainFrame
bh.Font=Enum.Font.Arcade
bh.Position = UDim2.new(-.1,0,.5,0)
bh.Size = UDim2.new(.1,0,.1,0)
bh.BackgroundTransparency = 1
bh.Text = 'BLOOD HEAT!!'
bh.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bh.BorderColor3 = Color3.fromRGB(255, 0, 0)


local prevdmg = char:GetAttribute('LastDamageDone')

Hits.Value = 1
local dep = false 
local connection = char:GetAttributeChangedSignal('LastDamageDone'):Connect(function()

lastHitTime = os.clock()

for i, part in ipairs(workspace.Live:GetChildren()) do
if part:IsA('Model') and part:FindFirstChild('HumanoidRootPart', 1) then

pcall(function()
local You = string.sub(char:GetAttribute('LastDamageDone'), 1, 13)
local Them = string.sub(part:GetAttribute('LastDamage'), 1, 13)

if You == Them then

_G.EN = part
health = part.Humanoid.Health 
end
end)
end end
if health == 0 and dep  == false then bh.Visible = true 
Ult()
dep = true task.delay(37,function() dep = false 
bh.Visible = false
end)
bh.TextSize = 155
bh.TextColor3=Color3.new(1,0,0)
game.TweenService:Create(bh,
TweenInfo.new(.2,Enum.EasingStyle.Quint),{TextSize = 35,
TextColor3 = Color3.new(1,.7,.7)}):Play()
task.delay(.2,function()
game.TweenService:Create(bh,
TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, -1),
{TextColor3 = Color3.new(1,0,0)}):Play()
for i = 1,2555 do if getgenv().gay == true or dep == false then break end 
bh.Position = UDim2.new(-.1+math.sin(i/66)/45,0,.6+math.cos(i/25)/45,0)
task.wait(.01) end
end)
end
spawn(function()
if _G.Jumping == true then 
hrp:FindFirstChildWhichIsA('BodyPosition', 2).MaxForce=Vector3.new(0,0,0)

v3.Name = 'Client' 
v3.MaxForce = Vector3.new(0,1,0)*100000 
v3.D = 2500 
v3.P = 25000
v3.Position = hrp.Position+Vector3.new(0,25,0)+
(_G.EN.HumanoidRootPart.Position+Vector3.new(0,12,0) - hrp.Position) * 1.3
end
end)
if Dmg.Value >= 80 or hrp.CFrame.Y >= 450 then 

local p = Instance.new('Part')
p.Parent = workspace.Thrown
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(120+math.random(15,45),0,120+math.random(15,45))
p.Anchored=true p.CanCollide=false
p.Transparency = 1
game:GetService("Debris"):AddItem(p, 2)
local orig = hrp.Position
local dir = Vector3.new(0, -255, 0)
local par = RaycastParams.new()
par.FilterDescendantsInstances = {char}
par.FilterType = Enum.RaycastFilterType.Exclude

local result = workspace:Raycast(orig, dir, par)

local hit = result.Position

local newCFrame = CFrame.new(hit + Vector3.new(0,25,0)) 


p.CFrame = newCFrame
game.TweenService:Create(p,TweenInfo.new(.4),{Position = p.Position-
Vector3.new(0,25,0)}):Play()

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://10802450464"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1,1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,45),
NumberSequenceKeypoint.new(1,0)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld.RotSpeed = NumberRange.new(-100,100)
bld:Emit(25)
bld.LockedToPart = true

game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://10802450464"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1,1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,12)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 35
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld.RotSpeed = NumberRange.new(-100,100)
bld:Emit(25)
bld.LockedToPart = true

bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)
end
local d=  .03
local pp = Instance.new('Part')
pp.Parent = workspace.Thrown
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
local v = Instance.new("Highlight")
v.OutlineTransparency = 1 
v.FillColor=Color3.new(1,1,1)
v.FillTransparency = 0
v.Parent = pp

local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
pp.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1,15,1)


game:GetService("Debris"):AddItem(pp, 1.5)
task.delay(d,function()
msh2.Scale = Vector3.new(4.5,1,4.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,7,0)
}):Play()
end)
local p = Instance.new('Part')
p.Parent = workspace.Thrown
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,5,1)


local rnd = math.random(-360,360)
local rnd2 = math.random(-360,360)
local rnd3 = math.random(-360,360)

p.CFrame = _G.EN.HumanoidRootPart.CFrame
*CFrame.Angles(rnd,rnd2,rnd3)
pp.CFrame = _G.EN.HumanoidRootPart.CFrame
*CFrame.Angles(rnd,rnd2,rnd3)

game:GetService("Debris"):AddItem(p, 1.5)
task.delay(d,function()
msh2.Scale = Vector3.new(3,1+Dmg.Value/10,3)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,15,0)
}):Play()
end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://11751891032"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,1)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
bld.LockedToPart = true
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,12)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://10802450464"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1,.2)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,8)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(15)
bld.LockedToPart = true

bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://10802450464"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1,.2)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,8)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})


bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,15)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(15)
bld.LockedToPart = true

bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://10802450464"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,45),
NumberSequenceKeypoint.new(1,-15)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
bld.LockedToPart = true
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://11789331771"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,4),
NumberSequenceKeypoint.new(1,15)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
bld.LockedToPart = true
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

Combo = true
if ohealth ~= health then 
if health >= ohealth then
else 
Dmg.Value = Dmg.Value+ohealth -health

end
Hits.Value = Hits.Value+1
HitCounter.Visible = true
DamageCounter.Visible = true
HitCounter.TextSize = 155
HitCounter.TextColor3 = Color3.new(1,1,1-Hits.Value/35)
DamageCounter.Text = math.floor(Dmg.Value)..' Damage!'
DamageCounter.TextSize = 155
HitCounter.Text = Hits.Value..' Hits!'
DamageCounter.TextColor3 = Color3.new(1,1-Dmg.Value/100,1-Dmg.Value/100)
local v = Instance.new('Part')
v.Parent = workspace
v.CanCollide = false 
v.Anchored=true
if UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value >= 8 then 
v.Size=Vector3.new(1,3,1)
game.TweenService:Create(v,TweenInfo.new(.6),
{Size=Vector3.new(3+Dmg.Value/25,10,3),Transparency = 1
}):Play()
v.Material = Enum.Material.Glass 
local h = Instance.new("Highlight",v)
h.FillTransparency = 1;h.OutlineTransparency = 1
v.Transparency = 5
spawn(function()
for i = 1,45 do 
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(4,.5,-4)
task.wait() end end)
else 
v.CFrame = workspace.CurrentCamera.CFrame*
CFrame.new(4+math.random(-5,5)/5,.5+math.random(-5,5)/25,
-4)
game:GetService("Debris"):AddItem(v,.03)
v.Size=Vector3.new(0,0,0)
game.TweenService:Create(v,TweenInfo.new(.03),
{Size=Vector3.new(.2,.2,.2)
}):Play()
v.Color = Color3.new(1,1-Dmg.Value/100,1-Dmg.Value/100)
v.Material = Enum.Material.Neon 
local h = Instance.new("Highlight",v)
h.FillTransparency = 1;h.OutlineTransparency = 1

end
game:GetService("Debris"):AddItem(v,.5)




local msh2 = Instance.new("SpecialMesh",v)
msh2.MeshType = "Sphere"
game.TweenService:Create(HitCounter,
TweenInfo.new(.2,Enum.EasingStyle.Quint),{TextSize = 35}):Play()
MainFrame.Position = UDim2.new(.9,0,.3,0)

game.TweenService:Create(DamageCounter,
TweenInfo.new(.2,Enum.EasingStyle.Quint),{TextSize = 35}):Play()



game.TweenService:Create(MainFrame,
TweenInfo.new(.2,Enum.EasingStyle.Quint),{Position = UDim2.new(.93,0,.4,0)}):Play()

end
for i, part in ipairs(workspace.Live:GetChildren()) do
if part:IsA('Model') and part:FindFirstChild('HumanoidRootPart', 1) then
--i know this isnt practical it just feel wrong with one end
pcall(function()
local You = string.sub(char:GetAttribute('LastDamageDone'), 1, 13)
local Them = string.sub(part:GetAttribute('LastDamage'), 1, 13)

if You == Them then

ohealth = part.Humanoid.Health 
end
end)
end end
end)

spawn(function()
while true do if getgenv().gay  == true then 
connection:Disconnect()

break end
if Combo and (os.clock() - lastHitTime >= timeout) then
Combo = false
HitCounter.Visible = false
DamageCounter.Visible = false
Hits.Value = 0
Dmg.Value = 0
end
task.wait(0.1)
end
end) end)
game.Players.LocalPlayer.Character:SetAttribute("UltimateName", 
string.upper('blood heat'))
local IdPlaying = false
AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
IdPlaying = true
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://118178916008905"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(1)
spawn(function()
local r = 0
for i  =1,2525555 do r=r+1
if IdPlaying == false then break end 
if r >= 250+math.random(130,270) then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://95171537920426"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(1.7)
k.Priority = Enum.AnimationPriority.Movement
k:AdjustSpeed(.1)

task.wait(.3)
k:AdjustSpeed(-.1)
task.wait(.3)
k:Stop(.3)
spawn(function()
	v.Stopped:Wait() IdPlaying = false 
k:Stop(.2)
end)
k.Stopped:Wait()
r = 0 end
task.wait(.01) end end)
v.Stopped:Wait() IdPlaying = false 
k:Stop(.4)
end end), "Idle")
function doshit(shitdoeslighting,dir,amm)
function custshake() 
local c = CameraShakeInstance.new(4, 12, 0, .5)
c.PositionInfluence = Vector3.new(.5, .5, .5)
c.RotationInfluence = Vector3.new(0,0,0)
return c
end

getgenv().CameraShaker:Shake(custshake())
spawn(function()
if dir == nil then dir = 15 end
if amm == nil then amm = 3 end
if shitdoeslighting == true then 
for i = 1,amm do 
local myBolt = l.new(hrp.Position+Vector3.new(
	math.random(-2,2),
	math.random(-2,6),
	math.random(-2,2)
), _G.EN.HumanoidRootPart.Position+Vector3.new(0,dir,0)
+_G.EN.HumanoidRootPart.CFrame.LookVector*5, {
  color = BrickColor.new("Really red");

})

myBolt:Draw(workspace)
end
end
end)



local p = Instance.new('Part')
p.Parent = workspace.Thrown
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,1,15)
spawn(function()
for i = 1,55 do 
p.CFrame = _G.EN.HumanoidRootPart.CFrame*
CFrame.new(0,0,-2+i/3)
task.wait(.01) end end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.3),{
Scale=Vector3.new(0,0,15)
}):Play()
for i= 1,5 do 
local p = Instance.new('Part')
p.Parent = workspace.Thrown
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(3,1,3)
spawn(function()
for i = 1,35 do 
p.CFrame = _G.EN.HumanoidRootPart.CFrame*CFrame.new(0,0,0)*CFrame.Angles(
math.random(-90,90),
math.random(-90,90),
math.random(-90,90)
)
task.wait(.01) end end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,5+i*4,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://11751891032"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,1)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
bld.LockedToPart = true
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,12)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://10802450464"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,45),
NumberSequenceKeypoint.new(1,-15)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
bld.LockedToPart = true
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)

local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://11789331771"
bld.Rate = 0
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,4),
NumberSequenceKeypoint.new(1,15)
})
bld.Orientation = 'VelocityPerpendicular'

bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})

bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
bld.LockedToPart = true
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
game:GetService("Debris"):AddItem(bld,2)
end end
AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://105405781808472" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14875678235"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
add = 1 task.delay(2,function() add = .1 end)
v.Stopped:Wait() 
k:Stop()
doshit(true)
end end), "Move1End")
AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://72533960079559" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18462892217"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(2)
doshit(true)
task.wait(.5)
k:Stop()

end end), "Move1Start")
AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://102989537449083" then

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15134211820"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(2)

v.Stopped:Wait() k:Stop(.3)
doshit(true)
end end), "Move12nd")


AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://82365328621192" then

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://89182028873490"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = 3.3
v.Stopped:Wait() k:Stop(.3)
doshit()
end end), "Move13nd")
workspace.Gravity = 80
char.Humanoid.JumpPower = 25 
char.Humanoid.JumpHeight = 7.2 

AddSignal(char.Humanoid:GetPropertyChangedSignal('JumpPower'):Connect(function()
if char.Humanoid.JumpPower ~= 25  then 
char.Humanoid.JumpPower = 25
end

 end),'Jump Power Modifier')
AddSignal(game:GetService("UserInputService").JumpRequest:Connect(function() 
_G.Jumping = true 
if db == true then return end
db = true 
 local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://121032789756540"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
spawn(function()
v2 = Instance.new('BodyGyro',char.HumanoidRootPart) 
game.Debris:AddItem(v2,8)
v2.Name = 'Client' 
v2.MaxTorque = Vector3.new(1,1,1)*10^1555
v2.D = 4500
v2.P = 15500

char.Humanoid:ChangeState(Enum.HumanoidStateType.Flying)
v2.CFrame = char.HumanoidRootPart.CFrame*CFrame.Angles(
	math.rad(-45),math.rad(0),math.rad(0))
	local pcf = char.HumanoidRootPart.CFrame
char.Humanoid.AutoRotate = false 
local e = 
char.Humanoid:GetPropertyChangedSignal('AutoRotate'):Connect(function(pp)
if char.Humanoid.AutoRotate == true then 
char.Humanoid.AutoRotate = false 
end
end)

k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1) k.TimePosition = 5

for i = 1,1177 do 
if v2.Parent ~= char.HumanoidRootPart then 
e:Disconnect()
char.Humanoid.AutoRotate = true
break end
v2.D = 1500-math.sin(i/7)*1500


task.wait(.01) end

end)
task.delay(.2,function() db = false 

local an = 0

k:AdjustSpeed(.2) task.delay(2,function() k:AdjustSpeed(0) end)
repeat task.wait() until char.Humanoid.FloorMaterial ~= Enum.Material.Air 
v2:Destroy() 
_G.Jumping = false
k:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18462892217"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1.4)
task.wait(.4) 
k:Stop(.3)
end)


end), 'Jump Request')
AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://105442749844047" then

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17860467628"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)

game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(3),{FieldOfView = 
80}):Play()
task.wait(1.2)
k:Stop()

end end), "Move2 ~ Start")

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://131820095363270" then
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(3),{FieldOfView = 
120}):Play()
workspace.Gravity = 240
local ag = -1
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
task.delay(.3,function() ag = .2 end)
for i = 1,45 do 
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,ag-.3)
task.wait(.01) end
end end)
task.delay(1.5,function()
lol:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17278415853"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(.8)
k.TimePosition = 2.2
task.wait(2)
k:AdjustSpeed(.1)
k:Stop(.3)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.4),{FieldOfView = 
70}):Play()
workspace.Gravity = 80
end end), "Move2 ~ End")

AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://94638356008696" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17278415853"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
k.TimePosition = 2.2
task.wait(1.2)
workspace.Gravity = 80
doshit(true,-25,1)
local r = Instance.new('ColorCorrectionEffect',game.Lighting)
r.Brightness = .3 
game.TweenService:Create(r,TweenInfo.new(1),{Brightness = 0}):Play() 
local v = Instance.new("Highlight")
v.OutlineTransparency = 1 
v.FillColor=Color3.new(1,1,1)
v.FillTransparency = 0
v.Parent = char 
game.TweenService:Create(v,TweenInfo.new(.3),{FillTransparency = 1,
OutlineTransparency = 1}):Play() 
game:GetService("Debris"):AddItem(v,.3)
game:GetService("Debris"):AddItem(r,.3)
workspace.CurrentCamera.FieldOfView = 120
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.3),{FieldOfView = 
70}):Play() 
k:Stop(.3)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15134211820"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(.7)
task.wait(.7)
workspace.Gravity = 80
doshit(true,-25,2)
local r = Instance.new('ColorCorrectionEffect',game.Lighting)
r.Brightness = .3 
game.TweenService:Create(r,TweenInfo.new(1),{Brightness = 0}):Play() 
local v = Instance.new("Highlight")
v.OutlineTransparency = 1 
v.FillColor=Color3.new(1,0,0)
v.FillTransparency = 0
v.Parent = char 
game.TweenService:Create(v,TweenInfo.new(.3),{FillTransparency = 1,
OutlineTransparency = 1}):Play() 
game:GetService("Debris"):AddItem(v,.3)
game:GetService("Debris"):AddItem(r,.3)
workspace.CurrentCamera.FieldOfView = 120
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.3),{FieldOfView = 
70}):Play() 
k:Stop()

task.wait(.9)
workspace.Gravity = 80
doshit(true,-25,3)
local r = Instance.new('ColorCorrectionEffect',game.Lighting)
r.Brightness = .3 
game.TweenService:Create(r,TweenInfo.new(1),{Brightness = 0}):Play() 
local v = Instance.new("Highlight")
v.OutlineTransparency = 1 
v.FillColor=Color3.new(1,0,0)
v.FillTransparency = 0
v.Parent = char 
game.TweenService:Create(v,TweenInfo.new(1.3),{FillTransparency = 1,
OutlineTransparency = 1}):Play() 
game:GetService("Debris"):AddItem(v,1.3)
game:GetService("Debris"):AddItem(r,1.3)
workspace.CurrentCamera.FieldOfView = 15
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(1.3),{FieldOfView = 
70}):Play() 
k:Stop()
end end), "Move2 ~ Hit")


AddSignal(hrp.ChildAdded:Connect(function(obj)
if obj.Name == "BODYGYRO" then

game:GetService("RunService").RenderStepped:Wait()
obj:Destroy()
hrp.moveme:Destroy()

end
end),'something')
AddSignal(char.Humanoid:GetPropertyChangedSignal('PlatformStand'):Connect(function()
if char.Humanoid.PlatformStand == true then 
char.Humanoid.PlatformStand = false
end

 end),'fuck off platform stand')
 AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13532562418" 
or v.Animation.AnimationId == "rbxassetid://13532600125" 
or v.Animation.AnimationId == "rbxassetid://13532604085" 
then
if _G.Jumping == true then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://10471336737"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(2)
v.Stopped:Wait() 
k:Stop()
end
if v.Animation.AnimationId == "rbxassetid://13532562418" then
v:Stop() 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://77586961719115"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
task.delay(.2,function()
SetClaw(hrp.CFrame*CFrame.new(-1,2-2.5,-3.6)*CFrame.Angles(
	math.rad(65),0,math.rad(35)))
SetClaw(hrp.CFrame*CFrame.new(-1,3-2.5,-3.6)*CFrame.Angles(
	math.rad(65),0,math.rad(35)))
SetClaw(hrp.CFrame*CFrame.new(-1,1-2.5,-3.6)*CFrame.Angles(
	math.rad(65),0,math.rad(35)))
end)
k.TimePosition = .2
task.wait(.5) k:Stop(.3)
elseif v.Animation.AnimationId == "rbxassetid://13532600125" then
v:Stop() 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136363608783208"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1.3)
k.TimePosition = 2
task.delay(.2,function()
SetClaw(hrp.CFrame*CFrame.new(.7,2-1.5,-3.6)*CFrame.Angles(
	math.rad(90),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(.7,3-1.5,-3.6)*CFrame.Angles(
	math.rad(90),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(.7,1-1.5,-3.6)*CFrame.Angles(
	math.rad(90),0,math.rad(-35)))
end)
task.wait(.2) 
k:AdjustSpeed(.7)
task.wait(.3)
k:Stop(.1)
elseif v.Animation.AnimationId == "rbxassetid://13532604085" then
v:Stop() 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136363608783208"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.3)
k.TimePosition = 1
task.delay(.2,function()
SetClaw(hrp.CFrame*CFrame.new(2,2-2.5,-1)*CFrame.Angles(math.rad(99),0,math.rad(-15)))
SetClaw(hrp.CFrame*CFrame.new(2,3-2.5,-1)*CFrame.Angles(math.rad(99),0,math.rad(-15)))
SetClaw(hrp.CFrame*CFrame.new(2,1-2.5,-1)*CFrame.Angles(math.rad(99),0,math.rad(-15)))
SetClaw(hrp.CFrame*CFrame.new(-2,2-2.5,-1)*CFrame.Angles(math.rad(99),0,math.rad(15)))
SetClaw(hrp.CFrame*CFrame.new(-2,3-2.5,-1)*CFrame.Angles(math.rad(99),0,math.rad(15)))
SetClaw(hrp.CFrame*CFrame.new(-2,1-2.5,-1)*CFrame.Angles(math.rad(99),0,math.rad(15)))
end)
task.wait(.2) 
k:AdjustSpeed(.7)
task.wait(.3)
k:Stop(.1)
end
end end), "LMB SYSTEM ~ 1-3")
function SetClaw(cframe)
local p = Instance.new('Part')
p.Parent = workspace.Thrown
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local v = Instance.new("Highlight")
v.OutlineTransparency = 1 
v.FillColor=Color3.new(1,0,0)
v.FillTransparency = 0
v.Parent = p
p.CFrame = cframe
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
game:GetService("Debris"):AddItem(p, 1.5)

msh2.Scale = Vector3.new(1,1,1)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,7,0)
}):Play()
local a = Instance.new("Attachment",p)
local bld = Instance.new("ParticleEmitter",a)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityParallel'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 0
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 2
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true

bld.LightEmission = 15
bld.Brightness = 15



end





 AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13294471966" 
or v.Animation.AnimationId == "rbxassetid://10503381238" 
or v.Animation.AnimationId == "rbxassetid://10470104242" 

then
if _G.Jumping == true then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17860467628"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
k.TimePosition = .5
task.wait(.2)
k:AdjustSpeed(2)
task.wait(.1)
k:Stop(.3)
k.TimePosition = 2
SetClaw(hrp.CFrame*CFrame.new(2,0,0)*CFrame.Angles(math.rad(90),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(2,1,0)*CFrame.Angles(math.rad(90),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(2,-1,0)*CFrame.Angles(math.rad(90),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(-2,0,0)*CFrame.Angles(math.rad(90),0,math.rad(35)))
SetClaw(hrp.CFrame*CFrame.new(-2,1,0)*CFrame.Angles(math.rad(90),0,math.rad(35)))
SetClaw(hrp.CFrame*CFrame.new(-2,-1,0)*CFrame.Angles(math.rad(90),0,math.rad(35)))

else
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://128784561864624"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(.5)
k.TimePosition = .7
task.delay(.2,function()
SetClaw(hrp.CFrame*CFrame.new(2,2,-1)*CFrame.Angles(math.rad(140),0,math.rad(-15)))
SetClaw(hrp.CFrame*CFrame.new(2,3,-1)*CFrame.Angles(math.rad(140),0,math.rad(-15)))
SetClaw(hrp.CFrame*CFrame.new(2,1,-1)*CFrame.Angles(math.rad(140),0,math.rad(-15)))
SetClaw(hrp.CFrame*CFrame.new(-2,2,-1)*CFrame.Angles(math.rad(140),0,math.rad(15)))
SetClaw(hrp.CFrame*CFrame.new(-2,3,-1)*CFrame.Angles(math.rad(140),0,math.rad(15)))
SetClaw(hrp.CFrame*CFrame.new(-2,1,-1)*CFrame.Angles(math.rad(140),0,math.rad(15)))
end)
v.Stopped:Wait() 
k:Stop(.4)
end
end end), "LMB SYSTEM ~ 4")
local add = 0
AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10479335397" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://77002367518293"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(.2)
local i = 0
repeat i=i+.01
k.TimePosition= i+v.TimePosition*1
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,-.1+-add)
task.wait() until not char:FindFirstChild('HunterFists', 3) or v.TimePosition >=.45
local lol = 1.5 local sup = -2
k:AdjustSpeed(1.3)
k:Stop(.3)
SetClaw(hrp.CFrame*CFrame.new(2,lol+0,sup)*CFrame.Angles(math.rad(45),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(2,lol+1,sup)*CFrame.Angles(math.rad(45),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(2,lol+-1,sup)*CFrame.Angles(math.rad(45),0,math.rad(-35)))
SetClaw(hrp.CFrame*CFrame.new(-2,lol+0,sup)*CFrame.Angles(math.rad(45),0,math.rad(35)))
SetClaw(hrp.CFrame*CFrame.new(-2,lol+1,sup)*CFrame.Angles(math.rad(45),0,math.rad(35)))
SetClaw(hrp.CFrame*CFrame.new(-2,lol+-1,sup)*CFrame.Angles(math.rad(45),0,math.rad(35)))

end end), "Front Dash")
function Ult()
spawn(function()
_G.PS('9166224293',.5,0,.5)
_G.PS('9120060683',3,0,1.5)
task.wait(.8)
_G.PS('9166224293',4.5,0,1)
_G.PS('9120060683',3,1,1.3)
end)
bh.Visible = true
bh.TextSize = 155
bh.TextColor3=Color3.new(1,0,0)
game.TweenService:Create(bh,
TweenInfo.new(.2,Enum.EasingStyle.Quint),{TextSize = 35,
TextColor3 = Color3.new(1,.7,.7)}):Play()
task.delay(.2,function()
game.TweenService:Create(bh,
TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, -1),
{TextColor3 = Color3.new(1,0,0)}):Play()
for i = 1,2555 do if getgenv().gay == true or dep == false then break end 
bh.Position = UDim2.new(-.1+math.sin(i/66)/45,0,.6+math.cos(i/25)/45,0)
task.wait(.01) end
bh.Visible = false
end)

local TweenService = game:GetService("TweenService")
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://123464270068243"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 5
task.wait(.5)
local arty = false task.delay(37,function() arty = true 
wait(1) arty = false
end)
local r = Instance.new('ColorCorrectionEffect',game.Lighting)
r.Brightness = .3 
game.TweenService:Create(r,TweenInfo.new(1),{Brightness = 0}):Play() 
local v = Instance.new("Highlight")
v.OutlineTransparency = 1 
v.FillColor=Color3.new(1,1,1)
v.FillTransparency = 0
v.Parent = char 
game.TweenService:Create(v,TweenInfo.new(6.3),{FillTransparency = 1,
OutlineTransparency = 1}):Play() 
game:GetService("Debris"):AddItem(v,6.3)
game:GetService("Debris"):AddItem(r,2.3)
workspace.CurrentCamera.FieldOfView = 120
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(6.3),{FieldOfView = 
70}):Play() 
local v = Instance.new('Part')
v.Parent = workspace
v.CanCollide = false 
v.Anchored=true
v.Size=Vector3.new(1,3,1)
game.Debris:AddItem(v,1.4)
game.TweenService:Create(v,TweenInfo.new(1.6),
{Size=Vector3.new(10,10,.1),Transparency = 1
}):Play()
v.Material = Enum.Material.Glass 
local h = Instance.new("Highlight",v)
h.FillTransparency = 1;h.OutlineTransparency = 1
v.Transparency = 5
spawn(function()
for i = 1,45 do 
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,0,-4)*CFrame.Angles(0,0,i/6)
task.wait() end end)
spawn(function()
for i = 1,9999 do if arty == true then break end
task.wait(.1)
spawn(function()
local v = Instance.new('Part')
v.Parent = workspace.Thrown
v.CanCollide = false 
v.Anchored=true
v.Size=Vector3.new(1,1,.01)
game.Debris:AddItem(v,1.6)
game.TweenService:Create(v,TweenInfo.new(1.6),
{Size=Vector3.new(3,3,.1),Transparency = 1
}):Play()
v.Material = Enum.Material.Glass 
local h = Instance.new("Highlight",v)
h.FillTransparency = 1;h.OutlineTransparency = 1
v.Transparency = 1.1+math.random(.3,.5)
local rnd2 = math.random(-5,5)
local rnd3 = math.random(-2,1)
local ye = math.random(-1,1)*6
local yee = math.random(-1,1)*45
for i = 1,100 do 
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
	rnd2+math.cos(ye/i)/45,rnd3+
	math.cos(ye/i),-2+-i/25)*
CFrame.Angles(i/yee,0,i/ye)
if v.Parent ~= workspace.Thrown then break end
task.wait(.07)
end end) end end)

spawn(function()
    local thatsalottawords = {
        "NoBlock",
        "StopRunning",
        "Freeze",
        "Slowed",
        "ComboStun",
        "M1CD",
        "NoDash",
        "NoPunch",
        "UsedDash",
        "Ragdoll",
        "RagdollSim",
        "LaunchLanded",
        "LaunchEnded",
        "NoRotate",
        "BeingGrabbed",
        "NoVel",
        "BeingLaunched",
    }
    while task.wait() do
	 if arty == true then break end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if table.find(thatsalottawords, v.Name) then
                v:Destroy()
            end
        end
    end
end)
local BodyParts = {
"Head",
"Torso",
"Left Arm",
"Right Arm",
"Left Leg",
"Right Leg",

}
for i= 1,999999 do 
	 if arty == true then break end
for i,v in pairs(lp.Character:GetChildren()) do 
if table.find(BodyParts, v.Name) then
local part = Instance.new("Part")
part.Anchored = true 
part.CanCollide = false 
part.Massless = true 
part.CFrame = v.CFrame
part.Size = v.Size
part.Transparency = .8
part.Color = Color3.new(1,1,1)
part.Material = Enum.Material.Neon
TweenService:Create(part,TweenInfo.new(.2),{Transparency = 1,
CFrame=part.CFrame*CFrame.new(0,.2,0),Size=v.Size*1.3+Vector3.new(0,0,-v.Size.Z)}):Play()
if v.Name == "Head" then 
local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.Head 
mesh.Scale = Vector3.new(1.25,1.25,1.25)
mesh.Parent = part
end
part.Parent = workspace.Thrown
game.Debris:AddItem(part, .2)
end end
task.wait(.1)
end
end 
local uis = game:GetService("UserInputService")
AddSignal(
uis.InputBegan:Connect(function(inputs, event)

if event == true then return end
if inputs.KeyCode == Enum.KeyCode.G then
if lp.PlayerGui.Bar.MagicHealth.Ult.Visible == true then 
repeat wait() until lp.PlayerGui.Bar.MagicHealth.Ult.Visible == false 
Ult()
end 
end end),"Ult Start Bind")
AddSignal( 
lp.PlayerGui.Bar.MagicHealth.ImageButton.MouseButton1Click:Connect(function()
if lp.PlayerGui.Bar.MagicHealth.Ult.Visible == true then 
repeat wait() until lp.PlayerGui.Bar.MagicHealth.Ult.Visible == false 
Ult()
end
end),"Ult Start Tap")
_G.Enabled = false
local uis = game:GetService("UserInputService")
local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"].Base
basemini.Visible = true
base.Reuse.Visible = false
getgenv().Cooldown4 = .2
function Four()
pcall(function() _G.yse:Disconnect() end)
if _G.Enabled == false then 
_G.Enabled = true
else  
_G.Enabled = false
end

if _G.Enabled == true then 
base.ToolName.Text = "Unlock"
else 
base.ToolName.Text = "Lock"
end
_G.yse = game:GetService("RunService").Heartbeat:Connect(function(step)
if _G.EN ~= nil then 
if _G.EN ~= char then 
hrp.CFrame = CFrame.lookAt(hrp.Position, 
Vector3.new(_G.EN.HumanoidRootPart.Position.X,hrp.Position.Y,_G.EN.HumanoidRootPart.Position.Z))
game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = CFrame.lookAt(hrp.Position, 
Vector3.new(_G.EN.HumanoidRootPart.Position.X,hrp.Position.Y,_G.EN.HumanoidRootPart.Position.Z))
end end
end) 
spawn(function()
repeat wait() until char.Humanoid.Health == 0 or _G.Enabled == false 
_G.yse:Disconnect()
end) end
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
base.ToolName.Text = "Lock"
AddSignal(
uis.InputBegan:Connect(function(inputs, event)

if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Four and not base:FindFirstChild("Cooldown") then
spawn(function() 		Four() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown4,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown4)
deez:Destroy()
end end),"Move4 Bind")
AddSignal( 
base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
spawn(function() 		Four() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown4,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown4)
deez:Destroy()
end
end),"Move4 Tap")
 AddSignal(char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://109617620932970" then
v:Stop()
local rnd = math.random(0,1)
if rnd == 0 then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://95171537920426"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = 1.3
add = 1
task.delay(4,function() add = 0 end)
_G.yas = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame = old*CFrame.new(0,0,-.5)*CFrame.Angles(0,math.rad(180),0)
game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old

end) 
task.wait(.5)
_G.yas:Disconnect()
k:Stop(.5)
else 

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15134211820"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.3)
add = 1
task.delay(4,function() add = 0 end)
_G.yas = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame = old*CFrame.new(0,0,-.5)*CFrame.Angles(0,math.rad(-90),0)
game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old

end) 
task.wait(.7)
_G.yas:Disconnect()
k:Stop(.4)
end
end end), "Move3")
game:GetService("StarterGui"):SetCore("SendNotification", 
{ Title = string.upper('Akiha Vermillion'); 
Text = "LOADED";
Duration = 5; Button1 = "hell yeah"; })

end
MainEnv()
notif:SendNotification("Success", '"AKIHA VERMILLION" LOADED!', 4)
task.wait(4)
notif:SendNotification("Warning", 'Made by reap4985 on discord', 4)
task.wait(4)
notif:SendNotification("Info", 'Credits: \nScript made by Reap', 3)
task.wait(3)
notif:SendNotification("Info", 'VFX by Reap', 3)
task.wait(3)
notif:SendNotification("Info", 'Moveset Animation Edit by Reap', 3)
task.wait(3)
notif:SendNotification("Info", 'Idle Animation Edit by Reap', 3)
task.wait(3)
notif:SendNotification("Info", 'Notification UI by IceMinisterq on Github', 3)
task.wait(3)
notif:SendNotification("Info", 'Lightning Effects by EvLightning on Github', 3)
task.wait(3)
notif:SendNotification("Info", 'Signal Script by i.am.an.agent on Discord', 3)
task.wait(3)
notif:SendNotification("Info", 'Character "Akiha Vermillion" from "Tsukihime"', 
16)
--[[
TODO: 
✅ make AIR LMB that work (impossible) (i did it somehow)
❌ find morph (yeah ok)
✅ add blood heat (idk how to detect it rn) (i figured ito ut)
✅ fix tatsumaki 4th ult move anim fucking your rot and pos
✅ do 1st move
✅ do 2nd move
✅ do 3rd move
✅ do 4th move
✅ figure out how the fuck to make that weird screen distort effect

STATUS: 8/9 COMPLETED
(press ctrl + num to modify)
]]

pcall(function()
getgenv().pepe:Disconnect()
end)
getgenv().pepe = game.Players.LocalPlayer.CharacterAdded:Connect(function(c)
task.wait(1.5)

MainEnv()

end)
