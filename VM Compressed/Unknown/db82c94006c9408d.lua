--[[
idle: RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1.4,0),angles(-2.897246558310587,0,3.141592653589793)),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.7,1.5,-0.4),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,-0.4),angles(0,-1.5707963267948966,-1.7453292519943295)),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.9,-0.4),angles(1.7278759594743862,1.5707963267948966,0.15707963267948966)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1.4,0),angles(0,0,3.141592653589793)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(0,1.5707963267948966,0)),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0,0,0.09972775727510452),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.5,-1),angles(0,-1.5707963267948966,0)),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0,1,-3),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.7,1,-3),deltaTime) 

walk: Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1.4,0),angles(0,0,3.141592653589793)),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0,0,0.09972775727510452),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1.5,0.1),angles(0.6457718232379019,-1.5707963267948966,0.3490658503988659*sin(sine*1))),deltaTime)  LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.3,0.5,-0.7),angles(0,-1.5707963267948966,-1.7453292519943295+0.8726646259971648*sin(sine*1))),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.3,0.9,-0.7),angles(1.7278759594743862,1.5707963267948966,0.15707963267948966+0.8726646259971648*sin(sine*1))),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.7,1.5+0.3*sin(sine*1),-1),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0,1,-3),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.7,0.5+0.3*sin(sine*1),-3),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1.5,0),angles(0.5235987755982988,1.5707963267948966,0.3490658503988659*sin(sine*1))),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1,0),angles(-2.897246558310587,0,3.141592653589793)),deltaTime)

poop: LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,-0.4),angles(0,-1.5707963267948966,-1.7453292519943295)),deltaTime)  Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1.4,0),angles(0,0,3.141592653589793)),deltaTime)  RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1.4,0),angles(-2.897246558310587,0,3.141592653589793)),deltaTime)  LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.5,-1),angles(0,-1.5707963267948966,0)),deltaTime)  RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(0,1.5707963267948966,0)),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.7,1.5,-0.4),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0,1,-5),deltaTime)  RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.9,-0.4),angles(1.7278759594743862,1.5707963267948966,0.15707963267948966)),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0,0,0.09972775727510452),deltaTime)  AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.7,1,-3),deltaTime)
]]
coroutine.wrap(function() game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 12644224237 7241027024 7241027024") end)()
wait(0.5)
loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Just-A-Baseplate-Working-Reanimation-39126"))()
wait(1)
local char = game.Players.LocalPlayer.Character

	local list = {}
	for i, v in next, char:GetChildren() do
		if v.Name == "CueBall" then
			table.insert(list, v.Handle.AccessoryWeld)
		end
	end

local AccessoryWeld = {list[1], list[2], char["Poop Head"].Handle.AccessoryWeld}
print(AccessoryWeld[3])
local LeftHip = char.Torso["Left Hip"]
local RightHip = char.Torso["Right Hip"]
local LeftShoulder = char.Torso["Left Shoulder"]
local RightShoulder = char.Torso["Right Shoulder"]
local RootJoint = char.Humanoid.RootPart.RootJoint
local Neck = char.Torso.Neck

local cf = CFrame.new
local cf_0 = cf()
local v3 = Vector3.new
local v3_0 = v3()
local v3_101 = v3(1, 0, 1)
local angles = CFrame.Angles
local sin = math.sin
local sine = 0

local getMetamethodFromErrorStack=function(userdata,f,test)
	local ret=nil
	xpcall(f,function()
		ret=di(2,"f")
	end,userdata,nil,0)
	if (type(ret)~="function") or not test(ret) then
		return f
	end
	return ret
end
insSet=getMetamethodFromErrorStack(game,function(a,b,c) a[b]=c end,function(f) local a=i("Folder") local b=rs() f(a,"Name",b) return a.Name==b end)
insGet=getMetamethodFromErrorStack(game,function(a,b) return a[b] end,function(f) local a=i("Folder") local b=rs() a.Name=b return f(a,"Name")==b end)
cfGet=getMetamethodFromErrorStack(cf_0,function(a,b) return a[b] end,function(f) return f(cf(1,2,3),"Position")==v3(1,2,3) end)
cfMul=getMetamethodFromErrorStack(cf_0,function(a,b) return a*b end,function(f) return angles(1,2,3)*angles(1,2,3)==f(angles(1,2,3),angles(1,2,3)) end)
cfAdd=getMetamethodFromErrorStack(cf_0,function(a,b) return a+b end,function(f) return cf(1,2,3)+v3(1,2,3)==f(cf(1,2,3),v3(1,2,3)) end)
v3Get=getMetamethodFromErrorStack(v3_0,function(a,b) return a[b] end,function(f) return v3(1,2,3).Unit==f(v3(1,2,3),"Unit") end)

char.Animate:Destroy()
char.Humanoid.Animator:Destroy()
local Inverse=cfGet(cf_0,"Inverse")
local Lerp=cfGet(cf_0,"Lerp")

local deltaTime = 10

game["Run Service"].RenderStepped:Connect(function(d)
	deltaTime = d * 10
	sine = tick() * (char.Humanoid.WalkSpeed / 2)
	local ismoving = (char.Humanoid.MoveDirection * v3_101).Magnitude > 0.1
	if ismoving then
		Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1.4,0),angles(0,0,3.141592653589793)),deltaTime)
		LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1.5,0.1),angles(0.6457718232379019,-1.5707963267948966,0.3490658503988659*sin(sine*1))),deltaTime)
		LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-0.3,0.5,-0.7),angles(0,-1.5707963267948966,-1.7453292519943295+0.8726646259971648*sin(sine*1))),deltaTime)
		RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(0.3,0.9,-0.7),angles(1.7278759594743862,1.5707963267948966,0.15707963267948966+0.8726646259971648*sin(sine*1))),deltaTime)
		RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1.5,0),angles(0.5235987755982988,1.5707963267948966,0.3490658503988659*sin(sine*1))),deltaTime)
		RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1,0),angles(-2.897246558310587,0,3.141592653589793)),deltaTime)
	else
		RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-1.4,0),angles(-2.897246558310587,0,3.141592653589793)),deltaTime) 
		AccessoryWeld[1].C0=Lerp(AccessoryWeld[1].C0,cf(-0.7,0.2,-2.5),deltaTime)
		LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,-0.4),angles(0,-1.5707963267948966,-1.7453292519943295)),deltaTime)
		RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.9,-0.4),angles(1.7278759594743862,1.5707963267948966,0.15707963267948966)),deltaTime)
		Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1.4,0),angles(0,0,3.141592653589793)),deltaTime)
		RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(0,1.5707963267948966,0)),deltaTime)
		--AccessoryWeld[2].C0=Lerp(AccessoryWeld[2].C0,cf(0,0,0.09972775727510452),deltaTime)
		AccessoryWeld[3].C0=Lerp(AccessoryWeld[3].C0,cf(0,5,1),deltaTime)
		LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.5,-1),angles(0,-1.5707963267948966,0)),deltaTime)
		AccessoryWeld[2].C0=Lerp(AccessoryWeld[2].C0,cf(0.7,0.2,-2.5),deltaTime) 
	end 
end)
wait(1)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")