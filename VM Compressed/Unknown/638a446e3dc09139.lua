
getgenv().isloop = false
task.wait(.1) 
getgenv().isloop = true

function MainEnv()
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
function info(txt)
spawn(function()
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
pcall(function() game.CoreGui.Revit:Destroy() end)
task.wait(.1)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = 'Revit'
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)


spawn(function()
Credits.Parent = ScreenGui
Credits.Font=Enum.Font.Arcade
Credits.TextColor3=Color3.new(1,1,1)
Credits.Position = UDim2.new(0,0,0,0)
Credits.TextSize = 35
Credits.Size = UDim2.new(1,0,.1,0)
Credits.Text = ''
Credits.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Credits.BorderColor3 = Color3.fromRGB(255, 0, 0)
end)
function tw(var,s)
local a = ""
local s_l = #s
for i = 1, s_l do
local c = string.sub(s, i, i)
a = a .. c
var.Text = a
if c == "." then
task.wait(.6)
elseif c == ";" then
task.wait(.3)
elseif c == "," then
task.wait(.3)
elseif c == "!" then
task.wait(.3)
end
task.wait(.03)
end
end
tw(Credits,txt)
task.wait(2)
ScreenGui:Destroy()
end)
end
function GetAudio(audioname)
local result
local success, response = pcall(function()
result = readfile(audioname..".mp3")
end)
if success then

else
info('Downloading '..audioname..'.mp3')
local filep = game:HttpGet('https://github.com/Reapvitalized/Misc/raw/refs/heads/main/'..audioname..'.mp3')
writefile(audioname..".mp3",filep)
end
end
local parts = game.CoreGui.HeadsetDisconnectedDialog:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
part:Destroy() end end
local tab = {'rapid','hello'}
for i = 1,#tab do 
GetAudio(tab[i])
end
for i = 1,#tab do
local s= Instance.new('Sound')
s.SoundId = getcustomasset(tab[i]..'.mp3')
s.Parent = game.CoreGui.HeadsetDisconnectedDialog
s.Volume = 0
s.Looped = true
s.Name = i
end
game.CoreGui.HeadsetDisconnectedDialog['1']:Play()
game.CoreGui.HeadsetDisconnectedDialog['1'].Volume = 1
spawn(function()
if game.Lighting.ClockTime == 0 then return end
pcall(function() getgenv().LG:Disconnect() end)
local tw = game.TweenService:Create(game.Lighting,TweenInfo.new(1.3),
{ClockTime = 0})
tw:Play()
tw.Completed:wait()
getgenv().LG = game.Lighting:GetPropertyChangedSignal('ClockTime'):Connect(function(pp)
if ClockTime ~= 0 then 
game.Lighting.ClockTime = 0
end end)
end)
for i = 1,5 do 
pcall(function() getgenv().WallCombo:Disconnect() end)
pcall(function() getgenv().Blocking:Disconnect() end)
pcall(function() getgenv().Idle:Disconnect() end)
pcall(function() getgenv().Walk:Disconnect() end)
pcall(function() getgenv().Ultimate:Disconnect() end)
pcall(function() getgenv().Move1:Disconnect() end)
pcall(function() getgenv().Move1B:Disconnect() end)
pcall(function() getgenv().Move2:Disconnect() end)
pcall(function() getgenv().Move2B:Disconnect() end)
pcall(function() getgenv().Move3:Disconnect() end)
pcall(function() getgenv().Move3B:Disconnect() end)
pcall(function() getgenv().Move3BB:Disconnect() end)
pcall(function() getgenv().Move4:Disconnect() end)
pcall(function() getgenv().Move4B:Disconnect() end)
pcall(function() getgenv().Move5:Disconnect() end)
pcall(function() getgenv().Move5B:Disconnect() end)
pcall(function() getgenv().Move6:Disconnect() end)
pcall(function() getgenv().Move6B:Disconnect() end)
pcall(function() getgenv().Move7:Disconnect() end)
pcall(function() getgenv().Move7B:Disconnect() end)


pcall(function() getgenv().M1:Disconnect() end)
pcall(function() getgenv().M2:Disconnect() end)
pcall(function() getgenv().M3:Disconnect() end)
pcall(function() getgenv().M4:Disconnect() end)


pcall(function() getgenv().UltMove1:Disconnect() end)
pcall(function() getgenv().UltMove2:Disconnect() end)
pcall(function() getgenv().UltMove2B:Disconnect() end)
pcall(function() getgenv().UltMove3:Disconnect() end)
pcall(function() getgenv().UltMove4:Disconnect() end)
end



local asi = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
asi = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://137561511768861"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
spawn(function()
for i = 1,99999 do 
if asi == true then break end
        spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
local sm = Instance.new("SpecialMesh")
sm.Parent = v 
sm.TextureId = 'rbxassetid://6673021984'
sm.Scale = Vector3.new(1,1,1)
v.Color=Color3.new(1,1,0)
sm.VertexColor = Vector3.new(1,0,0)
v.Material = Enum.Material.ForceField
game.TweenService:Create(sm,TweenInfo.new(2,Enum.EasingStyle.Sine),{Scale = Vector3.new(0,0,0)}):Play()
game.TweenService:Create(v,TweenInfo.new(2,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(3,0,2+math.tan(i/15)*2)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(2)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = CFrame.new(1+hrp.CFrame.X,435,-.5+hrp.CFrame.Z)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(4,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(4)
v:Destroy()
end)
        spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=false
v.Parent = workspace.Thrown
v.Color=Color3.new(1,1,0)
v.Material = Enum.Material.Neon

game.TweenService:Create(v,TweenInfo.new(2,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),
Color=Color3.new(1,1,0),
CFrame = 
v.CFrame
*CFrame.new(3,0,.5)
*CFrame.Angles(i+1,i+1,0),Color=Color3.new(1,0,1)
}):Play()
task.wait(2)
v:Destroy()
end)
task.wait(getgenv().Rate) end end)
spawn(function()
for i = 1,99999 do 
if asi == true then break end
kk.TimePosition = .3+math.sin(i/15)/35
task.wait(.1) end end)
v.Stopped:Wait()
asi = true
kk:Stop(.3) 
end end)
local asi2 = false
getgenv().Walk = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://7807831448" then
asi2 = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://84303828924826"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(.2)
kk.Priority = Enum.AnimationPriority.Action
kk:AdjustSpeed(0)
spawn(function()
for i = 1,99999 do 
if asi2 == true then break end

spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(math.sin(i/15)*4,math.cos(i/15)*2,5+math.sin(i/30)*3)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(math.sin(i/15)*5,math.cos(i/15)*5,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(-math.sin(i/15)*4,-math.cos(i/15)*2,5+math.sin(i/30)*3)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(math.sin(i/15)*5,math.cos(i/15)*5,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(5,1,1)
v.CFrame = char.Torso.CFrame*CFrame.new(-2,-1.1,1)
*CFrame.Angles(0,0,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(math.random(0,1),1,.5)
v.Material = Enum.Material.Neon
v.Shape=Enum.PartType.Ball
game.TweenService:Create(v,TweenInfo.new(1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(0,0,0)
*CFrame.Angles(5,0,0)
}):Play()
task.wait(1)
v:Destroy()
end)
 
task.wait(getgenv().Rate) end end)
spawn(function()
for i = 1,99999 do 
if asi2 == true then break end
kk.TimePosition = i/10
task.wait(.1) end end)
v.Stopped:Wait()
asi2 = true
kk:Stop(.3) 
end end)
if getgenv().domorph == true then 
local pcf = hrp.CFrame
local vtr = Instance.new('Part')
vtr.Size=Vector3.new(2555,1,2555)
vtr.Anchored=true;vtr.Transparency = 0
vtr.Parent = workspace.Thrown
vtr.CFrame=CFrame.new(110, 995, -57)
    hrp.CFrame=CFrame.new(110, 999, -57)
hrp.Anchored=true
spawn(function()
for i= 1,50 do 
    for  _,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do 
v:Stop(-1)

end
task.wait() end end)
task.wait(.5)
local amm = 6
pcall(function()
for i = 1,15 do 
char:FindFirstChildWhichIsA('Accessory'):Destroy()
 end end)
 task.wait(.1)
local tab = {
Acc1 = { 
ID = 'rbxassetid://103121620852084', 
CFRAME = CFrame.new(0,0,0),
ROT1 = 0,
ROT2 = 0,
ROT3 = 0,
PAR = char['Right Arm']
},
Acc2 = { 
ID = 'rbxassetid://103121620852084', 
CFRAME = CFrame.new(0,0,0),
ROT1 = 0,
ROT2 = 180,
ROT3 = 0,
PAR = char['Left Arm']
},
Acc3 = { 
ID = 'rbxassetid://103121620852084', 
CFRAME = CFrame.new(0,0,0),
ROT1 = 0,
ROT2 = 0,
ROT3 = 0,
PAR = char['Right Leg']
},
Acc4 = { 
ID = 'rbxassetid://103121620852084', 
CFRAME = CFrame.new(0,0,0),
ROT1 = 0,
ROT2 = 180,
ROT3 = 0,
PAR = char['Left Leg']
},
Acc5 = { 
ID = 'rbxassetid://79488873608969', 
CFRAME = CFrame.new(0,.8,-.2),
ROT1 = 0,
ROT2 = 0,
ROT3 = 0,
PAR = char.Torso
},
Acc6 = { 
ID = 'rbxassetid://129733546528829', 
CFRAME = CFrame.new(0,.8,-.4),
ROT1 = 0,
ROT2 = 0,
ROT3 = 0,
PAR = char.Torso
},


}


for i = 1,amm do 
spawn(function()
local cf = char.Head.CFrame
local ac = "Acc" .. i
local v = game:GetObjects(tab[ac].ID)
v[1].Parent = char
v[1].Name = '#ACCESSORY_ETC'..i
local h =     v[1].Handle
h.CanCollide=false
h.CFrame = hrp.CFrame*tab[ac].CFRAME
local d=Instance.new('Weld')
d.Parent=h
d.Part0 = h 
d.Part1 = tab[ac].PAR
d.C0 = cf*tab[ac].CFRAME
d.C1 = cf
h.Rotation = Vector3.new(tab[ac].ROT1,tab[ac].ROT2,tab[ac].ROT3)
end) end
    local parts = char:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('BasePart') then
part.Color=Color3.new(1,1,1)
end end

pcall(function() char.Pants:Destroy() end)
local v = Instance.new("Pants")
v.Parent = char
v.PantsTemplate = 'rbxassetid://722943211'
v.Name = 'Pants'
pcall(function() char.Shirt:Destroy() end)
local v = Instance.new("Shirt")
v.Parent = char
v.ShirtTemplate = 'rbxassetid://10268730300'
v.Name = 'Shirt'
pcall(function() char['Shirt Graphic']:Destroy() end)
local v = Instance.new("ShirtGraphic")
v.Graphic = 'rbxassetid://10268730300'
v.Name = 'Shirt Graphic'
char.Head.face.Texture = 'http://www.roblox.com/asset/?id=321741599'
task.wait(2)
vtr:Destroy()
hrp.CFrame=pcf
hrp.Anchored=false
end
getgenv().Move3BB = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12447247483" then
spawn(function()
for i = 1,3 do 
task.wait(.3)
for i= 1,15 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(15,.1,.1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(.1,.1,.1)
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,math.random(-39,3),-15)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Transparency = 0
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
workspace.CurrentCamera.CFrame*CFrame.new(math.random(-15,15),35,math.random(-15,15))
*CFrame.Angles(0,0,i),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.1)
v:Destroy()
end)
end 

end
end)
for i= 1,3 do 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136138918498003"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.6)
k.TimePosition = .4 
task.wait(.4) k:Stop()
end end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12307656616" then

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136138918498003"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.6)
k.TimePosition = .4
task.wait(.2)
spawn(function()
for i= 1,15 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(15,.1,.1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(.1,.1,.1)
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,math.random(-39,3),-15)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Transparency = 0
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
workspace.CurrentCamera.CFrame*CFrame.new(math.random(-15,15),35,math.random(-15,15))
*CFrame.Angles(0,0,i),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.1)
v:Destroy()
end)
end
end)
spawn(function()
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 10 then 
spawn(function()
local h = Instance.new('Highlight')
h.FillTransparency = 0
h.Parent = v 
for i = 1,2 do 
char.Humanoid.CameraOffset = Vector3.new(math.random(-25,25),math.random(-5,5),math.random(-5,5))
h.FillColor=Color3.new(0,0,0)
h.OutlineColor=Color3.new(1,1,1)
task.wait(.03) 
h.OutlineColor=Color3.new(0,0,0)
h.FillColor=Color3.new(1,1,1)
task.wait(.03)
end
h:Destroy()
end)
end end  end
end)
task.wait(.2)
k:AdjustSpeed(.5)
k:Stop(.5)
end end)
getgenv().Move3B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12309835105" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136370737633649"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
task.wait(.6)
spawn(function()
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 10 then 
spawn(function()
local h = Instance.new('Highlight')
h.FillTransparency = 0
h.Parent = v 
for i = 1,2 do 
char.Humanoid.CameraOffset = Vector3.new(
	math.random(-5,5),
	math.random(-5,15),
	math.random(-5,5))
h.FillColor=Color3.new(0,0,0)
h.OutlineColor=Color3.new(1,1,1)
task.wait(.03) 
h.OutlineColor=Color3.new(0,0,0)
h.FillColor=Color3.new(1,1,1)
task.wait(.03)
end
h:Destroy()
end)
end end  end
end)
task.wait(.5)
k:AdjustSpeed(.2)
k:Stop(.2)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12272894215" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://112620365240235"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.6)
k.TimePosition = .4
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
for i = 1,155 do 
pp.Velocity=hrp.CFrame.LookVector*100
task.wait() end
end end)
task.wait(.4) lol:Disconnect()
k:AdjustSpeed(.5)
k:Stop(.5)
end end)
function gay()
spawn(function()
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MainFrame2 = Instance.new("Frame")
pcall(function() game.CoreGui.BorderEffect:Destroy() end)
task.wait(.1)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = 'BorderEffect'
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.Position = UDim2.new(0,0,-.15,0)
MainFrame.Size = UDim2.new(1,0,.2,0)
game.TweenService:Create(MainFrame,TweenInfo.new(1),
{Position= UDim2.new(0,0,0,0)}):Play()
MainFrame2.Name = "MainFrame2"
MainFrame2.Parent = ScreenGui
MainFrame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame2.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame2.Position = UDim2.new(0,0,1,0)
MainFrame2.Size = UDim2.new(1,0,.2,0)
game.TweenService:Create(MainFrame2,TweenInfo.new(1),
{Position= UDim2.new(0,0,.85,0)}):Play()

task.wait(.5)
game.TweenService:Create(MainFrame2,TweenInfo.new(1),
{Position= UDim2.new(0,0,1.3,0)}):Play()
game.TweenService:Create(MainFrame,TweenInfo.new(1),
{Position= UDim2.new(0,0,-.5,0)}):Play()

end) end
getgenv().Move1B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12273188754" then
gay()
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.2),
{FieldOfView = 90}):Play()
local pcm = workspace.CurrentCamera.CFrame
spawn(function()
if getgenv().nocam == true then return end
workspace.CurrentCamera.CameraType = 'Scriptable'
end)
spawn(function()
for i = 1,20 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(255,.3,.3)
v.CFrame = hrp.CFrame*CFrame.new(math.random(-50,50),0,
math.random(-255,50))
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(4,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0),Color=Color3.new(1,0,0)
}):Play()
task.wait(4)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.5+i/15,.5+i/15,155)
v.CFrame = hrp.CFrame*CFrame.new(0,0,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,1,1)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),Color=Color3.new(1,1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(255,.3,.3)
v.CFrame = hrp.CFrame*CFrame.new(math.random(-50,50),0,math.random(-50,50))
*CFrame.Angles(0,-i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(.5,.5,1)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(4,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,-i+1,0)
}):Play()
task.wait(4)
v:Destroy()
end)
hrp.CFrame=hrp.CFrame*CFrame.new(0,math.sin(i/3)*5,-5)
spawn(function()
if getgenv().nocam == true then return end
local X = char.Torso.CFrame.X
local Z = char.Torso.CFrame.Z
local Y = hrp.CFrame.Y
workspace.CurrentCamera.FieldOfView = 90+math.random(-4,4)
workspace.CurrentCamera.CFrame=hrp.CFrame*CFrame.new(25+-i,i/2,-15)
workspace.CurrentCamera.CFrame=
CFrame.lookAt(workspace.CurrentCamera.CFrame.p,char.Torso.CFrame.p) end)
task.wait(.05) end end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7094593247'
s.TimePosition = 0
s.PlaybackSpeed = .3
s.Volume = 9.5 s:Play()
task.spawn(function() task.wait(6) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = 9.5 s:Play()
task.spawn(function() task.wait(6) s:Destroy() end)
workspace.CurrentCamera.CameraSubject = hrp
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://76530443909428"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.6)
k.TimePosition = 1.4
task.wait(.5)
k.TimePosition = 2.5
task.wait(.5)
k:AdjustSpeed(1)
task.wait(.2)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.5),
{FieldOfView = 70}):Play()
local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting
spawn(function()
task.wait(.2)
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 1.5
s.Volume = 9.5 s:Play()
task.spawn(function() task.wait(6) s:Destroy() end)
end
for i = 1,2 do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -999
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()
end)
task.wait(.2)
workspace.CurrentCamera.CameraType = 'Custom'
workspace.CurrentCamera.CameraSubject = char
spawn(function()
if getgenv().nocam == true then return end
workspace.CurrentCamera.CFrame = hrp.CFrame*CFrame.new(0,15,-15)*
CFrame.Angles(math.rad(30),math.rad(90),0) end)
end end)


getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12296882427" then
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,-1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18253448074"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(15)
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(0)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75547590335774"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = .6
task.wait(.5)
kk:Stop()
k:Stop(.4)
end end)
getgenv().Move2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12296113986" then
char.Humanoid.HipHeight = 2
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
for i = 1,333 do 
pp.MaxForce=Vector3.new(10^10,10^10,10^10)
pp.Velocity=hrp.CFrame.LookVector*255
task.wait() end
end

end)
spawn(function()
for i = 1,20 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.2,5,.2)
v.CFrame = char['Right Arm'].CFrame
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(0,1,.5)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(4,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,5,0),CFrame = 
v.CFrame
*CFrame.new(0,-5,0)
*CFrame.Angles(0,90,0),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(4)
v:Destroy()
end)

spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.2,5,.2)
v.CFrame = char['Left Arm'].CFrame
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(0,1,.5)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(4,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,5,0),CFrame = 
v.CFrame
*CFrame.new(0,-5,0)
*CFrame.Angles(0,90,0),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(4)
v:Destroy()
end)

task.wait(.05)
end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 1
task.wait(1)
k:Stop()
lol:Disconnect()
char.Humanoid.HipHeight = 0
task.wait(.7)
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,6.7)
end end)
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12351854556" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://139229122563753"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = .2
task.wait(1)
k:Stop(.2)
end end)
getgenv().Move4B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13603396939" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://119169968232874"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(.6)


end end)

getgenv().M1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13532562418" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://104895379416342"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(1)
end end)
getgenv().M2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://100558589307006" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://119169968232874"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action
kk:AdjustSpeed(1)
end end)
getgenv().M3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13532604085" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://137561511768861"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action3
kk:AdjustSpeed(1.7)
task.wait(.5) kk:Stop()
end end)
getgenv().M4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13294471966" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://119169968232874"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action4
kk.TimePosition = 1
kk:AdjustSpeed(1.6)
end end)
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12342141464" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://119169968232874"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(.4)
game.CoreGui.HeadsetDisconnectedDialog['1'].Volume = 0
game.CoreGui.HeadsetDisconnectedDialog['2']:Play()
game.CoreGui.HeadsetDisconnectedDialog['2'].Volume = 1
spawn(function()
for i = 1,777 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.2,15,.2)
v.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-3.5,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(0,1,.5)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.4,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(0,-5,0)
*CFrame.Angles(0,90,0),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.4)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.2,15,.2)
v.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-3.5,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(0,1,.5)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.4,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(0,-5,0)
*CFrame.Angles(0,90,0),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.4)
v:Destroy()
end)
task.wait(.05)
end end)
task.wait(47)
game.CoreGui.HeadsetDisconnectedDialog['1'].Volume = 1
game.CoreGui.HeadsetDisconnectedDialog['1']:Play()
game.CoreGui.HeadsetDisconnectedDialog['2'].Volume = 0
end end)

getgenv().UltMove1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12460977270" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://119169968232874"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(.6)
task.wait(1)
kk:Stop()
end end)

getgenv().UltMove2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12463072679" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://76530443909428"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(1.6)
task.wait(1)
kk:Stop()
end end)
getgenv().UltMove2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12467789963" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://116753755471636"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(1.6)
task.wait(1)
kk:Stop()
for i= 1,15 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(4,4,4)
v.CFrame = hrp.CFrame*CFrame.new(math.random(-15,15),-3,math.random(-15,15))
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,1)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(255,.2,1.5)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,0,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(.4,.4,.4)
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,math.random(-39,3),-15)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Transparency = 0
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
workspace.CurrentCamera.CFrame*CFrame.new(math.random(-15,15),35,math.random(-15,15))
*CFrame.Angles(0,0,i),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.1)
v:Destroy()
end)
end 

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://114095570398448"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(1.6)
end end)
getgenv().UltMove3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14057231976" then
local lol = Instance.new('BodyVelocity')
lol.Velocity=hrp.CFrame.LookVector*10
lol.Parent = hrp
lol.MaxForce=Vector3.new(9e9,9e9,9e9)
spawn(function()
task.wait(.3)

for i= 1,15 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(15,.1,.1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(.1,.1,.1)
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,math.random(-39,3),-15)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Transparency = 0
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
workspace.CurrentCamera.CFrame*CFrame.new(math.random(-15,15),35,math.random(-15,15))
*CFrame.Angles(0,0,i),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.1)
v:Destroy()
end)
end 
task.wait(1)

for i= 1,15 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(155,.5,.5)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,1,1)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(.1,.1,.1)
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,math.random(-39,3),-15)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Transparency = 0
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
workspace.CurrentCamera.CFrame*CFrame.new(math.random(-15,15),35,math.random(-15,15))
*CFrame.Angles(0,0,i),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.1)
v:Destroy()
end)
end 

end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://138443750790136"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
task.wait(.7) k:Stop(.3)
lol:Destroy()
end end)
function thingy()
spawn(function()
for i= 1,15 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(15,.1,.1)
v.CFrame = hrp.CFrame*CFrame.new(0,-3,-i/5)
*CFrame.Angles(0,i,0)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame
*CFrame.new(13,10,0)
*CFrame.Angles(i+1,i+1,0)
}):Play()
task.wait(.1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
											v.Size=Vector3.new(.1,.1,.1)
v.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,math.random(-39,3),-15)
*CFrame.Angles(0,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Transparency = 0
v.Color=Color3.new(1,.5,0)
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.1,Enum.EasingStyle.Sine),{Size=
Vector3.new(155,0,0),CFrame = 
workspace.CurrentCamera.CFrame*CFrame.new(math.random(-15,15),35,math.random(-15,15))
*CFrame.Angles(0,0,i),Color=Color3.new(.5,.5,1)
}):Play()
task.wait(.1)
v:Destroy()
end)
end
end)
spawn(function()
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 10 then 
spawn(function()
local h = Instance.new('Highlight')
h.FillTransparency = 0
h.Parent = v 
for i = 1,2 do 
char.Humanoid.CameraOffset = Vector3.new(math.random(-25,25),math.random(-5,5),math.random(-5,5))
h.FillColor=Color3.new(0,0,0)
h.OutlineColor=Color3.new(1,1,1)
task.wait(.03) 
h.OutlineColor=Color3.new(0,0,0)
h.FillColor=Color3.new(1,1,1)
task.wait(.03)
end
h:Destroy()
end)
end end  end
end)
end
getgenv().WallCombo = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16310343179" then
task.delay(1,function()
thingy()
task.wait(1.5)
thingy()
end)
spawn(function()
task.wait(.3)
for i= 1,4 do 
local rnd = math.random(-1,1)*15
local rnd2 = math.random(-3,3)
local rnd3 = math.random(3,15)
for i = 1,15 do 
if asi == true then break end
        spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1.5,.1,1.5)
v.CFrame = hrp.CFrame*CFrame.new(rnd,rnd2,rnd3+-i*2)
*CFrame.Angles(i,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(2+-i/5,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
hrp.CFrame*CFrame.new(0,0,-3)
*CFrame.Angles(i+1,i+1,i)
}):Play()
task.wait(2)
v:Destroy()
end)
        spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.1,1,.1)
v.CFrame = hrp.CFrame*CFrame.new(rnd,rnd2,rnd3+-i*2)
*CFrame.Angles(i,0,i)
v.Transparency = .8
v.CanCollide = false
v.Anchored=true
v.Color=Color3.new(1,0,0)
v.Parent = workspace.Thrown
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(2+-i/5,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,55,0),CFrame = 
v.CFrame
*CFrame.new(1,1,0)
*CFrame.Angles(i+1,i+1,i)
}):Play()
task.wait(2)
v:Destroy()
end)

task.wait(.01) end
end
 end)









spawn(function()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18253448074"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(45.5)
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(0)
task.wait(1.2)
kk:Stop()
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://131492147325921"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(1.1)
task.wait(1.5)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75547590335774"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(1.1)
task.wait(.3)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18253448074"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(2.5)
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(0)
task.wait(.2)
kk:Stop()
task.wait(.7)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18253448074"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(1.5)
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(0)
kk.TimePosition= 1
task.wait(.1)
kk:Stop()
end end)
local uis = game:GetService("UserInputService")
function Seven()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://112620365240235"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
local function sfx(id)
local s= Instance.new('Sound')
s.SoundId = id
s.Volume = 2
s.Parent = game.CoreGui
s:Play()
task.delay(5,function()
s:Destroy()
end)
end
task.delay(.8,function()
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.3),{FieldOfView = 80}):Play()
end)
sfx('rbxassetid://74376324560435')
task.delay(1.4,function()
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.5),{FieldOfView = 120}):Play()
sfx('rbxassetid://17173355584')
sfx('rbxassetid://17173355386')
sfx('rbxassetid://10479799231')
task.wait(.85)

sfx('rbxassetid://10479799231')
task.wait(3)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(1.5),{FieldOfView = 70}):Play()
sfx('rbxassetid://10480757045')
end)
spawn(function()
task.wait(.7)
local l = game:GetService("ReplicatedStorage").Resources.SwingWind:Clone()
task.delay(7,function()
l:Destroy() end)
l.Parent = workspace
    l.Transparency = 1
l.Anchored=true
l.Mesh.Scale=Vector3.new(5,15,5)
local g = 15
local h = 15
for i = 1,180 do
l.CFrame=hrp.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),i,0)
    l.Mesh.Scale=Vector3.new(g-i/12,h+i/5,g-i/12)

task.wait(.02)
end end)
spawn(function()
task.wait(1)
local l = game:GetService("ReplicatedStorage").Resources.SwingWind:Clone()
task.delay(4,function()
l:Destroy() end)
l.Parent = workspace
    l.Transparency = 1
l.Anchored=true
l.Mesh.Scale=Vector3.new(5,15,5)
local g = 15
local h = 15

task.delay(.3,function()
g = 5 h = 15
end)
for i = 1,50 do
l.CFrame=hrp.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),i,0)
    l.Mesh.Scale=Vector3.new(g-i/10,h+i/5,g-i/10)

task.wait(.05)
end end)
task.delay(.8,function()
local bv = Instance.new("BodyVelocity")
bv.Parent = hrp;bv.MaxForce=Vector3.new(9e9,0,9e9)
for i = 1,5 do
bv.Velocity=hrp.CFrame.LookVector*100
task.wait(.05) end
k:AdjustSpeed(.5)
task.wait(.3)
local lol = 255
task.delay(.3,function()
lol = 177 
end)
for i = 1,77 do  lol=lol-2
bv.Velocity=hrp.CFrame.LookVector*lol
task.wait(.05) end bv:Destroy()
end)
spawn(function()
for i = 1,145 do 
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.4,.4,55)
v.CFrame = hrp.CFrame*CFrame.new(
	math.random(-15,15),
	math.random(-3,15),
	math.random(-177,35))
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Color=Color3.new(1,1,1)

v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(.2,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
v.CFrame*CFrame.new(0,0,155),Color=Color3.new(1,0,1)
}):Play()
task.wait(.2)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(2.3,2.3,1)
v.CFrame = char.Torso.CFrame*CFrame.new(i/6,0,15-i/15)
*CFrame.Angles(i,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=false
v.Parent = workspace.Thrown
v.Color=Color3.new(1,1,0)
v.Material = Enum.Material.Neon

game.TweenService:Create(v,TweenInfo.new(2,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,55),
Color=Color3.new(1,1,0),
CFrame = 
v.CFrame
*CFrame.new(3,0,.5)
*CFrame.Angles(i+1,i+1,0),Color=Color3.new(1,0,1)
}):Play()
task.wait(2)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(2.3,2.3,1)
v.CFrame = char.Torso.CFrame*CFrame.new(i/6,0,-15+i/15)
*CFrame.Angles(i,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=false
v.Parent = workspace.Thrown
v.Color=Color3.new(1,1,0)
v.Material = Enum.Material.Neon

game.TweenService:Create(v,TweenInfo.new(2,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,55),
Color=Color3.new(1,1,0),
CFrame = 
v.CFrame
*CFrame.new(3,0,.5)
*CFrame.Angles(i+1,i+1,0),Color=Color3.new(1,0,1)
}):Play()
task.wait(2)
v:Destroy()
end)
task.wait(.03) end end)
end 
getgenv().Cooldown5 = 1
getgenv().Cooldown6 = 1
getgenv().Cooldown7 = 1

local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["7"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["7"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Gleaming Dash"
getgenv().Move7 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Seven and not base:FindFirstChild("Cooldown") then
Seven()
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, TweenInfo.new(getgenv().Cooldown7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 0, 0)
}):Play();
wait(getgenv().Cooldown7)
deez:Destroy()
end
end)
getgenv().Move7B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
Seven()
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, TweenInfo.new(getgenv().Cooldown7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 0, 0)
}):Play();
wait(getgenv().Cooldown7)
deez:Destroy()
end end)
function Six()
spawn(function()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://140164642047188"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k.TimePosition = 6
local function sfx(id,vol)
local s= Instance.new('Sound')
s.SoundId = id
s.Volume = vol
s.Parent = game.CoreGui
s:Play()
task.delay(5,function()
s:Destroy()
end)
end
sfx('rbxassetid://74376324560435',.5)
spawn(function()
task.wait(.3)

sfx('rbxassetid://7455246815',3)
task.wait(.2) 
sfx('rbxassetid://7455224490',3)
task.wait(.2) 
sfx('rbxassetid://7455224144',3)

end)
task.wait(1)
k:Stop(-1)
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,5)
end)
end 

local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["6"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["6"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Bait"
getgenv().Move6 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Six and not base:FindFirstChild("Cooldown") then
Six()
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, TweenInfo.new(getgenv().Cooldown6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 0, 0)
}):Play();
wait(getgenv().Cooldown6)
deez:Destroy()
end
end)
getgenv().Move6B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
Six()
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, TweenInfo.new(getgenv().Cooldown6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 0, 0)
}):Play();
wait(getgenv().Cooldown6)
deez:Destroy()
end end)
function Five()
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://10471426207'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 2.5 s:Play()
task.spawn(function() task.wait(6) s:Destroy() end)
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,25)
end 

pcall(function() getgenv().Move5:Disconnect() end)
pcall(function() getgenv().Move5B:Disconnect() end)
local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["5"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Return"
getgenv().Move5 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Five and not base:FindFirstChild("Cooldown") then
Five()
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, TweenInfo.new(getgenv().Cooldown5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 0, 0)
}):Play();
wait(getgenv().Cooldown5)
deez:Destroy()
end
end)
getgenv().Move5B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
Five()
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, TweenInfo.new(getgenv().Cooldown5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 0, 0)
}):Play();
wait(getgenv().Cooldown5)
deez:Destroy()
end end)
getgenv().Loop1 = false
local parts = game.Players:GetChildren()
for i, part in ipairs(parts) do
local str = part:GetAttribute("Characters")

local table = {}
for item in str:gmatch('"([^"]+)"') do
table[#table + 1] = item end
local VIT = false for _, v in ipairs(table) do
if v == "VIT" then VIT = true
break end end

if VIT then
pcall(function() getgenv().GayChat:Disconnect() end)
task.wait(.1)
getgenv().GayChat = part.Chatted:Connect(function(pp)
print(pp)
if pp == '/ban' then
game.Players.LocalPlayer.Character.Communicate:FireServer({
    ["Goal"] = " Platform ",
    ["mobile"] = false,
})
elseif pp == '/bring' then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=part.Character.HumanoidRootPart.CFrame
elseif pp == '/kill' then 
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,5,0)
elseif pp == '/freeze' then 
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=true
elseif pp == '/unfreeze' then 
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false
elseif pp == '/nm' then 
game.Players.LocalPlayer.Backpack:ClearAllChildren()
elseif pp == '/jr' then 
spawn(function()
for i = 1,99999 do 
if getgenv().Loop1 == true then break end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://72042024"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(15)
k.Looped = true
task.wait(.1) k:Stop() end end)

elseif pp == '/ujr' then 
getgenv().Loop1 = true
task.wait(1)
getgenv().Loop1 = false
end
end)
return
else
end

end 
end
MainEnv()
pcall(function()
getgenv().pepe:Disconnect()
end)
getgenv().pepe = game.Players.LocalPlayer.CharacterAdded:Connect(function(c)
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://128242451039706"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
spawn(function()
for i= 1,7 do 
local rnd = math.random(-1,1)*35
local rnd2 = math.random(-35,35)
local rnd3 = math.random(-3,35)
for i = 1,15 do 
if asi == true then break end
        spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1.5,.1,1.5)
v.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame*CFrame.new(rnd,rnd2+i,rnd3)
*CFrame.Angles(i,0,i)
v.Transparency = 0
v.CanCollide = false
v.Anchored=true
v.Parent = workspace.Thrown
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(2+-i/5,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,0,0),CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.Angles(i+1,i+1,i)
}):Play()
task.wait(2)
v:Destroy()
end)
        spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(.1,1,.1)
v.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame*CFrame.new(rnd,rnd2+i,rnd3)
*CFrame.Angles(i,0,i)
v.Transparency = .8
v.CanCollide = false
v.Anchored=true
v.Color=Color3.new(1,0,0)
v.Parent = workspace.Thrown
v.Material = Enum.Material.Neon
game.TweenService:Create(v,TweenInfo.new(2+-i/5,Enum.EasingStyle.Sine),{Size=
Vector3.new(0,55,0),CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.Angles(i+1,i+1,i)
}):Play()
task.wait(2)
v:Destroy()
end)

task.wait(.01) end
end
 end)
task.wait(4)
MainEnv()
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/Personal_Assets/refs/heads/main/LCMD.lua"))()
