--[[
	patchma hub by MyWorld
	one last unpatch... 

    IDs of accessories:
    
	-for arms 11159410305,11263254795 or 14255556501,14255554762
	
	-for legs 14768693948,14768701869 or 11159483910,12652786974
	
	-for torso 14255528083 or 13421786478 or 14768678294
	
	or anything else that covers ur torso. examples:
    13423624885,11502853991,14053485259,13779879140,14443132226
    can be same stuff but different colors
    
    there are 32 ways to make a rig with the ids above
]]

--findfirstchildofclass faster than getservice
local plrs=game:FindFirstChildOfClass("Players")
local rs=game:FindFirstChildOfClass("RunService")
local ws=game:FindFirstChildOfClass("Workspace")
local uis=game:FindFirstChildOfClass("UserInputService")
local gs=game:FindFirstChildOfClass("GuiService")
local cg=game:FindFirstChildOfClass("CoreGui")
local lp=plrs.LocalPlayer
local pg=lp:FindFirstChildOfClass("PlayerGui")
local mouse=lp:GetMouse()
local stepped=rs.Stepped
local heartbeat=rs.Heartbeat
local renderstepped=rs.RenderStepped

local osclock=os.clock
local tspawn=task.spawn
local twait=task.wait
local schar=string.char
local sbyte=string.byte
local ssub=string.sub
local sfind=string.find
local supper=string.upper
local mrandom=math.random
local clamp=math.clamp
local sin=math.sin
local cos=math.cos
local abs=math.abs
local rad=math.rad
local tinsert=table.insert
local tclear=table.clear
local tclone=table.clone
local tfind=table.find
local tunpack=table.unpack

--the loops dont have to read globals to get the "pairs" or "next" variable every time
local pairs=pairs 
local next=next

local i=Instance.new 
local v2=Vector2.new 
local v3=Vector3.new
local c3=Color3.new 
local cf=CFrame.new
local angles=CFrame.Angles
local u2=UDim2.new
local e=Enum 
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 

local sine=osclock()
local deltaTime=0
local v3_0=v3(0,0,0)
local v3_101=v3(1,0,1)
local v3_010=v3(0,1,0)
local v3_001=v3(0,0,1)
local cf_0=cf(0,0,0)
local v3_xz=v3_101*10
local v3_net=v3_010*25.01

local function makepcall(f)
	if type(f)=="function" then
		return function(...)
			local a={...}
			local r=nil
			pcall(function()
				r={f(tunpack(a))}
			end)
			return tunpack(r or {})
		end
	end
	return function() end
end
local function rs(l) 
	l=l or mrandom(8,15) 
	local s="" 
	for i=1,l do 
		if mrandom(1,2)==1 then 
			s=s..schar(mrandom(65,90)) 
		else 
			s=s..schar(mrandom(97,122)) 
		end 
	end 
	return s 
end 
local function dfind(t,v)
	for i,v1 in pairs(t) do
		if v1==v then
			return i
		end
	end
	return nil
end
local function gp(p,n,cl)
	if typeof(p)=="Instance" then
		local c=p:GetChildren()
		for i=1,#c do
			local v=c[i]
			if (v.Name==n) and v:IsA(cl) then
				return v
			end
		end
	end
	return nil
end
local function loopgp(...)
	while true do
		local r=gp(...)
		if r then
			return r
		end
		stepped:Wait()
	end
end
local function timegp(p,n,c,t)
	t=osclock()+t
	while t>osclock() do
		local r=gp(p,n,c)
		if r then
			return r
		end
		stepped:Wait()
	end
	return nil
end
local function getNetlessVelocity(realVel)
	--if true then return v3_0 end
	--if true then return realPartVelocity end
	--if true then return v3_net end
	if realVel.Magnitude>25.01 then
		realVel=realVel.Unit*25.01
	end
	return realVel*v3_xz+v3_net
end
local sft=1/60
local function getFallingTime(startY,destY,gravity)
	local velY=25.01
	local currY=startY
	local fallingTime=0
	while (currY>destY) or (velY>0) do
		fallingTime=fallingTime+sft
		velY=velY-sft*gravity
		currY=currY+velY*sft
	end
	return fallingTime
end
local isClientInstance=makepcall(function(i)
	return ssub(i:GetDebugId(),1,1)=="0"
end)
local isServerInstance=function(i)
	return not isClientInstance(i)
end
local shp=(((type(getfenv)=="function") and getfenv()) or {}).sethiddenproperty

local guiTheme={
	guiTitle="Hiso hub",
	windowTopColor=c3(0,0,0),
	windowBottomColor=c3(0,0,0),
	windowMinimizedSize=u2(0,290,0,22),
	windowRegularSize=u2(0,290,0,700),
	buttonsTextColor=c3(1,1,1),
	labelsTextColor=c3(0.5,0.5,0.5),
	listTopColor=c3(0,0,0),
	listBottomColor=c3(0.5,0,0)
}

local i1=i("Frame") 
local i2=i("Frame") 
local i3=i("ScrollingFrame") 
local i4=i("UIListLayout") 
local i5=i("UIGradient") 
local i6=i("TextLabel") 
local i7=i("TextButton") 
local i8=i("UIGradient") 
local i9=i("ScreenGui") 
local i10=i("TextButton")

i1.AnchorPoint=v2(0.5,0) 
i1.BackgroundColor3=c3(1,0,0) 
i1.BorderSizePixel=0 
i1.Position=u2(0.5,0,0.5,-150) 
i1.Size=guiTheme.windowRegularSize 
i1.Name=rs() 
i1.Parent=i9 
i2.BackgroundColor3=c3(1,0,0) 
i2.BorderSizePixel=0 
i2.Position=u2(0,5,0,20) 
i2.Size=u2(1,-10,1,-25) 
i2.Name=rs() 
i2.Parent=i1 
i3.Active=true 
i3.BackgroundTransparency=1 
i3.BorderSizePixel=0 
i3.Size=u2(1,-3,1,0) 
i3.AutomaticCanvasSize=e.AutomaticSize.Y 
i3.CanvasSize=u2(0,0,0,0) 
i3.ScrollBarThickness=7 
i3.Name=rs() 
i3.Parent=i2 
i4.Name=rs() 
i4.Parent=i3 
i4.SortOrder=e.SortOrder.LayoutOrder 
i5.Name=rs() 
i5.Parent=i2 
i5.Color=cs({[1]=csk(0,guiTheme.listTopColor),[2]=csk(1,guiTheme.listBottomColor)}) 
i5.Rotation=90 
i6.Font=e.Font.SourceSansBold
i6.FontSize=e.FontSize.Size18 
i6.Text=guiTheme.guiTitle 
i6.TextColor3=c3(1,1,1) 
i6.TextSize=16 
i6.BackgroundTransparency=1 
i6.BorderSizePixel=0 
i6.Position=u2(0,1,0,1) 
i6.Size=u2(1,-2,0,20) 
i6.Name=rs() 
i6.Parent=i1 
i7.AnchorPoint=v2(1,0) 
i7.BackgroundTransparency=1 
i7.Position=u2(1,0,0,0) 
i7.Size=u2(0,40,1,0) 
i7.Name=rs() 
i7.Parent=i6 
i7.Font=e.Font.SourceSansBold 
i7.FontSize=e.FontSize.Size18 
i7.Text="=" 
i7.TextColor3=c3(1,1,1) 
i7.TextSize=16 
i8.Name=rs() 
i8.Parent=i1 
i8.Color=cs({[1]=csk(0,guiTheme.windowTopColor),[2]=csk(1,guiTheme.windowBottomColor)}) 
i8.Rotation=90 
i9.ZIndexBehavior=e.ZIndexBehavior.Sibling 
i9.IgnoreGuiInset=true 
i9.ResetOnSpawn=false 
i9.Name=rs() 
i10.AnchorPoint=v2(1,0) 
i10.BackgroundTransparency=1 
i10.Position=u2(0.13,0,0,0) 
i10.Size=u2(0,40,1,0) 
i10.Name=rs() 
i10.Parent=i6 
i10.Font=e.Font.SourceSansBold 
i10.FontSize=e.FontSize.Size18 
i10.RichText = true
i10.Text="<b>X</b>"
i10.TextColor3=c3(1,1,1) 
i10.TextSize=16

local stopreanimate=function() return nil end

local min=false
i7.MouseButton1Click:Connect(function()
	min = not min
	if min then
		i2.Visible=false 
		i8.Color=cs({[1]=csk(0,c3(0,0,0)),[2]=csk(1,c3(0,0,0))}) 
		i1.Size=guiTheme.windowMinimizedSize 
	else
		i1.Size=guiTheme.windowRegularSize 
		i8.Color=cs({[1]=csk(0,c3(0,0,0)),[2]=csk(1,c3(0,0,0))}) 
		i2.Visible=true 
	end
end)

i10.MouseButton1Click:Connect(function()
    i1:Destroy()
    i2:Destroy()
    i3:Destroy()
    i4:Destroy()
    i5:Destroy()
    i6:Destroy()
    i7:Destroy()
    i8:Destroy()
    i9:Destroy()
    stopreanimate()
end)

local function Draggable(window,obj)
	local MB1enum = e.UserInputType.MouseButton1
	local TOUCHenum = e.UserInputType.Touch
	obj = obj or window
	local activeEntered = 0
	local mouseStart = nil
	local dragStart = nil
	local inputbegancon = nil
	local rendersteppedcon = nil
	local inputendedcon = nil
	local function inputendedf(a)
		a=a.UserInputType
		if (a==MB1enum) or (a==TOUCHenum) then
			rendersteppedcon:Disconnect()
			inputendedcon:Disconnect()
		end
	end
	local function rendersteppedf()
		local off = uis:GetMouseLocation()-mouseStart
		window.Position=dragStart+u2(0,off.X,0,off.Y)
	end
	local function inputbeganf(a)
		a=a.UserInputType
		if ((a==MB1enum) or (a==TOUCHenum)) and (activeEntered==0) and not uis:GetFocusedTextBox() then
			mouseStart=uis:GetMouseLocation()
			dragStart=window.Position
			if rendersteppedcon then rendersteppedcon:Disconnect() end
			rendersteppedcon = renderstepped:Connect(rendersteppedf)
			if inputendedcon then inputendedcon:Disconnect() end
			inputendedcon = uis.InputEnded:Connect(inputendedf)
		end
	end
	obj.MouseEnter:Connect(function()
		if inputbegancon then inputbegancon:Disconnect() end
		inputbegancon = uis.InputBegan:Connect(inputbeganf)
	end)
	obj.MouseLeave:Connect(function()
		inputbegancon:Disconnect()
	end)
	local function ondes(d)
		if d:IsA("GuiObject") then
			local thisEntered = false
			local thisAdded = false
			local con0 = d.MouseEnter:Connect(function()
				thisEntered = true
				if (not thisAdded) and d.Active then
					activeEntered = activeEntered + 1
					thisAdded = true
				end
			end)
			local con1 = d.MouseLeave:Connect(function()
				thisEntered = false
				if thisAdded then
					activeEntered = activeEntered - 1
					thisAdded = false
				end
			end)
			local con2 = d:GetPropertyChangedSignal("Active"):Connect(function()
				if thisEntered then
					if thisAdded and not d.Active then
						activeEntered = activeEntered - 1
						thisAdded = false
					elseif d.Active and not thisAdded then
						activeEntered = activeEntered + 1
						thisAdded = true
					end
				end
			end)
			local con3 = nil
			con3 = d.AncestryChanged:Connect(function()
				if not d:IsDescendantOf(window) then
					if thisEntered then
						activeEntered = activeEntered - 1
					end
					con0:Disconnect()
					con1:Disconnect()
					con2:Disconnect()
					con3:Disconnect()
				end
			end)
		end
	end
	window.DescendantAdded:Connect(ondes)
	local des=window:GetDescendants()
	for i=1,#des do 
		ondes(des[i])
	end
end
local function btn(txt, f)
	local i1=i("TextButton") 
	i1.AutomaticSize=e.AutomaticSize.Y 
	i1.BackgroundTransparency=1 
	i1.Size=u2(1,0,0,0) 
	i1.Name=rs() 
	i1.Font=e.Font.SourceSans
	i1.FontSize=e.FontSize.Size14 
	i1.Text=txt 
	i1.TextColor3=guiTheme.buttonsTextColor 
	if f then 
		i1.MouseButton1Click:Connect(f) 
	end 
	i1.Parent=i3 
	return i1
end
local function lbl(txt)
	local i1=i("TextLabel") 
	i1.Font=e.Font.SourceSansBold
	i1.FontSize=e.FontSize.Size14 
	i1.Text=txt 
	i1.TextColor3=guiTheme.labelsTextColor 
	i1.AutomaticSize=e.AutomaticSize.Y 
	i1.BackgroundTransparency=1 
	i1.Size=u2(1,0,0,0) 
	i1.Name=rs() 
	i1.Parent=i3 
	return i1
end

Draggable(i1)

lbl("---------------------------------------")
lbl("By: hiso")
lbl("powered by patchma")
lbl("---------------------------------------")


local allowshiftlock=nil
local ctrltp=nil
local simrad=nil
local placeholders=nil
local clickfling=nil
local highlightflingtargets=nil
local claimwait=nil

local stopreanimate=function() return nil end
local function reanimate()
	--[[
	    FDless reanimate by MyWorld
	    aka no client sided instances
	    "what else do i optimize here"
	]]

	local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them
	local placeholders = placeholders --makes client sided accessories replacing the real ones when unavailable
	local speedlimit = 3000 --makes your parts move slower if the magnitude of their velocity is higher than this
	local retVelTime = 0.51 --time that claimed parts have velocity to reclaim in case u lose them
	local R15toR6 = true --adds fake r6 parts and joints for animations if your character is r15
	local walkSpeed = 16 --your walkspeed (can be changed at runtime)
	local jumpPower = 50 --your jump power (can be changed at runtime)
	local allowshiftlock = allowshiftlock --allows the user to use shiftlock (can be changed at runtime)
	local gravity = 196.2 --how fast the characters velocity decreases while falling (can be changed at runtime)
	local simrad = simrad --sets simulation radius to this with sethiddenproperty if its set to a number
	local ctrlclicktp = ctrltp --makes you teleport where u point ur mouse cursor at when click and hold ctrl down
	local clickfling = clickfling --makes you fling the person you clicked when its available to do so
	local flingvel = v3(15000,16000,15000) --the rotation velocity that ur character will have while flinging
	local highlightflingtargets = highlightflingtargets --highlights characters that are going to get flung

	local c=lp.Character
	if stopreanimate() or not (c and c:IsDescendantOf(ws)) then return end

	local hum=c:FindFirstChildOfClass("Humanoid")
	local rootpart=gp(c,"HumanoidRootPart","BasePart") or gp(c,"Torso","BasePart") or gp(c,"UpperTorso","BasePart") or (hum and hum.RootPart) or timegp(c,"HumanoidRootPart","BasePart",0.5) or c:FindFirstChildWhichIsA("BasePart")
	if not rootpart then return end

	R15toR6=R15toR6 and hum and (hum.RigType==e.HumanoidRigType.R15)
	simrad = (type(simrad)=="number") and (type(shp)=="function") and simrad

	local cam=nil
	--theres a way to have ws.currentcamera nil on heartbeat and still have the game run normally
	local function refcam()
		cam=ws.CurrentCamera
		while not cam do
			ws:GetPropertyChangedSignal("CurrentCamera"):Wait()
			cam=ws.CurrentCamera
		end
	end
	refcam()
	local camcf=cam.CFrame
	local enumCamS=e.CameraType.Scriptable
	local camt=cam.CameraType
	local camcon0=nil
	local camcon1=nil
	local function onnewcamera()
		refcam()
		if camcon0 then 
			camcon0:Disconnect()
			camcon0=nil
		end
		if not c then 
			if cam.CameraType==enumCamS then
				cam.CameraType=camt
			end
			return camcon1:Disconnect() 
		end
		camcon0=cam.Changed:Connect(function(p)
			if not c then
				camcon0:Disconnect()
				return camcon1:Disconnect()
			end
			if (p=="CFrame") and (cam.CFrame~=camcf) then
				cam.CFrame=camcf
			elseif (p=="CameraSubject") or (p=="CameraType") then
				local subj=cam.CameraSubject
				if subj and subj:IsA("Humanoid") and (subj.Parent==c) and (cam.CameraType~=enumCamS) then
					cam.CameraType = enumCamS
				end
			end
		end)
		local subj=cam.CameraSubject
		if subj and subj:IsA("Humanoid") and (subj.Parent==c) and (cam.CameraType~=enumCamS) then
			cam.CameraType=enumCamS
		end
		cam.CFrame=camcf
	end
	camcon1=ws:GetPropertyChangedSignal("CurrentCamera"):Connect(onnewcamera)
	onnewcamera()

	local rGravity=ws.Gravity
	ws:GetPropertyChangedSignal("Gravity"):Connect(function()
		rGravity=ws.Gravity
	end)

	local fpdh=ws.FallenPartsDestroyHeight
	novoid=novoid and (fpdh+1)

	local function getMeshOfPart(v)
		if typeof(v)=="Instance" then
			if v:IsA("MeshPart") then
				return v.MeshId, v.TextureID
			else
				v=v:FindFirstChildOfClass("SpecialMesh")
				if v then
					return v.MeshId, v.TextureId
				end
			end
		end
		return nil, nil
	end

	local joints={}
	local cframes={}
	local des=c:GetDescendants()
	for i=1,#des do
		local v=des[i]
		if v:IsA("JointInstance") then
			tinsert(joints,{
				Name=v.Name,
				C0=v.C0,
				C1=v.C1,
				Part0=v.Part0,
				Part1=v.Part1
			})
		elseif v:IsA("BasePart") then
			cframes[v]=v.CFrame
		end
	end

	local function makeplaceholder(v)
		if typeof(v)~="Instance" then
			return nil
		end
		if not v.Archivable then
			v.Archivable=true
		end
		v=v:Clone()
		local c=v:GetChildren()
		for i=1,#c do
			local v=c[i]
			if v:IsA("SpecialMesh") then
				v.Name=rs()
				v:ClearAllChildren()
			else
				v:Destroy()
			end
		end
		v.Name=rs()
		v.Anchored=true
		v.CanCollide=false
		v.Transparency=0.25
		v.Parent=ws
		return v
	end

	local function filterInstance(v)
		local ins=v
		if isClientInstance(v) then
			v={CFrame=v.CFrame,Name=v.Name,Anchored=true}
		else
			local meshid,textureid=getMeshOfPart(v)
			if meshid and (meshid~="") and textureid and (textureid~="") and (v.Parent~=c) then
				if placeholders then
					v={CFrame=v.CFrame,Name=v.Name,Anchored=true,meshid=meshid,textureid=textureid,placeholder=makeplaceholder(v)}
				else
					v={CFrame=v.CFrame,Name=v.Name,Anchored=true,meshid=meshid,textureid=textureid}
				end
			else
				v={CFrame=v.CFrame,Name=v.Name,Anchored=true}
			end
		end
		for i,v1 in pairs(tclone(cframes)) do
			if i==ins then
				cframes[ins]=nil
				cframes[v]=v1
			end
		end
		for i,v1 in pairs(joints) do
			if v1.Part0==ins then
				v1.Part0=v
			elseif v1.Part1==ins then
				v1.Part1=v
			end
		end
		if rootpart==ins then
			rootpart=v
		end
		return v
	end
	for i,v in pairs(joints) do
		v.Part0=filterInstance(v.Part0)
		v.Part1=filterInstance(v.Part1)
	end

	local Yvel=0
	local cfr=rootpart.CFrame
	local pos=cfr.Position
	local primarypart=nil
	local shiftlock=false
	local firstperson=false
	local xzvel=v3_0
	local v3_0150=v3_010*1.5
	local camoff=cf(v3_0,camcf.LookVector)
	camoff=camoff-v3_001*(camcf.Position-(pos+v3_0150)).Magnitude

	local refreshjointsinternal=nil
	refreshjointsinternal=function(part,refreshed)
		if not part then return end
		tinsert(refreshed,part)
		for i,v in pairs(joints) do
			local part0=v.Part0
			local part1=v.Part1
			if part1 and (part0==part) then
				cframes[part1]=cframes[part]*v.C0*v.C1:Inverse()
				if not tfind(refreshed,part1) then
					refreshjointsinternal(part1,refreshed)
				end
			elseif part0 and (part1==part) then
				cframes[part0]=cframes[part]*v.C1*v.C0:Inverse()
				if not tfind(refreshed,part0) then
					refreshjointsinternal(part0,refreshed)
				end
			end
		end
	end
	local function refreshjoints(v)
		refreshjointsinternal(v,{})
	end

	if R15toR6 then
		local R6parts={ 
			head={Name="Head",Anchored=true},
			torso={Name="Torso",Anchored=true},
			root={Name="HumanoidRootPart",Anchored=true},
			leftArm={Name="Left Arm",Anchored=true},
			rightArm={Name="Right Arm",Anchored=true},
			leftLeg={Name="Left Leg",Anchored=true},
			rightLeg={Name="Right Leg",Anchored=true}
		}
		for i,v in pairs(R6parts) do
			cframes[v]=cfr
		end
		tinsert(joints,{
			Name="Neck",
			Part0=R6parts.torso,Part1=R6parts.head,
			C0=cf(0,1,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
		})
		tinsert(joints,{
			Name="RootJoint",
			Part0=R6parts.root,Part1=R6parts.torso,
			C0=cf(0,0,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,0,0,-1,0,0,0,0,1,0,1,-0)
		})
		tinsert(joints,{
			Name="Right Shoulder",
			Part0=R6parts.torso,Part1=R6parts.rightArm,
			C0=cf(1,0.5,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
		})
		tinsert(joints,{
			Name="Left Shoulder",
			Part0=R6parts.torso,Part1=R6parts.leftArm,
			C0=cf(-1,0.5,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
		})
		tinsert(joints,{
			Name="Right Hip",
			Part0=R6parts.torso,Part1=R6parts.rightLeg,
			C0=cf(1,-1,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
		})
		tinsert(joints,{
			Name="Left Hip" ,
			Part0=R6parts.torso,Part1=R6parts.leftLeg,
			C0=cf(-1,-1,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
		})
		tinsert(joints,{
			Part0=R6parts.root,Part1=rootpart,
			C0=cf_0,C1=cf_0
		})
		refreshjoints(rootpart)
		local function getpart(n)
			for i,_ in pairs(cframes) do
				if (i.Name==n) and not dfind(R6parts,i) then
					return i
				end
			end
			return nil
		end
		local function makejoint(p0, p1, p2)
			p1=getpart(p1)
			p2=getpart(p2)
			if not (p1 and p2) then return end
			for i,v in pairs(joints) do
				if (v.Part0==p1) and (v.Part1==p2) then
					joints[i]=nil
				elseif (v.Part0==p2) and (v.Part1==p1) then
					joints[i]=nil
				end
			end
			tinsert(joints,{
				Part0=p0,Part1=p1,
				C0=cf_0,
				C1=cframes[p1]:Inverse()*cframes[p0]
			})
		end
		makejoint(R6parts.head,"Head","UpperTorso")
		makejoint(R6parts.leftArm,"LeftUpperArm","UpperTorso")
		makejoint(R6parts.rightArm,"RightUpperArm","UpperTorso")
		makejoint(R6parts.leftLeg,"LeftUpperLeg","LowerTorso")
		makejoint(R6parts.rightLeg,"RightUpperLeg","LowerTorso")
		makejoint(R6parts.torso,"LowerTorso","HumanoidRootPart")
	end

	local function getPart(name,blacklist)
		for i,v in pairs(cframes) do
			if (i.Name==name) and not (blacklist and tfind(blacklist,i)) then
				return i
			end
		end
		return nil
	end

	local function getPartFromMesh(meshid,textureid,blacklist)
		for v,_ in pairs(cframes) do
			if (type(v)=="table") and not (blacklist and tfind(blacklist,v)) then
				if v.meshid and sfind(v.meshid,meshid) and sfind(v.textureid,textureid) then
					return v
				end
			end
		end
		return nil
	end

	local function getJoint(name)
		for i,v in pairs(joints) do
			if v.Name==name then
				return v
			end
		end
		return {C0=cf_0,C1=cf_0}
	end

	local function getPartJoint(handle)
		for i,v in pairs(joints) do
			if v.Part0==handle then
				return v
			end
		end
		for i,v in pairs(joints) do
			if v.Part1==handle then
				return v
			end
		end
		return nil
	end
	
	local function getAccWeldFromMesh(...)
		return getPartJoint(getPartFromMesh(...) or {}) or {C0=cf_0,C1=cf_0}
	end

	local accessorylimbs={	
		
		{meshid="4819720316",textureid="4819722776",C0=angles(0,0,rad(15)),Name="Torso"},
        {meshid="14768684979",textureid="",C0=angles(rad(0),rad(0),rad(-90)),Name="Left Arm"},
        {meshid="14768684979",textureid="",C0=angles(rad(0),rad(0),rad(90)),Name="Right Arm"},
        {meshid="11263221350",textureid="11263219250",C0=angles(rad(0),rad(0),rad(-90)),Name="Left Leg"},
        {meshid="11159370334",textureid="11159284657",C0=angles(rad(0),rad(0),rad(90)),Name="Right Leg"},
        
        {meshid="14255522247",textureid="14255543546",C0=angles(rad(0),rad(0),rad(-90)),Name="Left Leg"},
        {meshid="14255522247",textureid="14255543546",C0=angles(rad(0),rad(0),rad(90)),Name="Right Leg"},
      
      	{meshid="4819720316",textureid="4819722776",C0=angles(0,0,rad(15)),Name="Torso"},
		{meshid="14768666349",textureid="",C0=cf_0,Name="Torso"},
		{meshid="14241018198",textureid="",C0=cf_0,Name="Torso"},
		{meshid="13421774668",textureid="",C0=cf_0,Name="Torso"}
	}

	local alignblacklist={}
	for i=1,#accessorylimbs do
		local v=accessorylimbs[i]
		local p=getPart(v.Name)
		local h=getPartFromMesh(v.meshid,v.textureid,alignblacklist)
		local w=getPartJoint(h)
		if p and w then
			w.C0=v.C0
			w.Part0=h
			w.C1=cf_0
			w.Part1=p
			tinsert(alignblacklist,h)
		end
	end

	local raycastparams=RaycastParams.new()
	raycastparams.FilterType=e.RaycastFilterType.Blacklist
	raycastparams.RespectCanCollide=true
	local rayfilter={}
	local characters={}
	local function refreshrayfilter()
		tclear(rayfilter)
		for i,v in pairs(characters) do
			tinsert(rayfilter,v)
		end
		raycastparams.FilterDescendantsInstances=rayfilter
	end
	local flingtable={}
	local cframes1={}
	local lastpositions={}
	local claimtimes={}
	local rootparts={}
	local ondes=nil
	ondes=function(v)
		local meshid1,textureid1=getMeshOfPart(v)
		if meshid1 then
			for i,v1 in pairs(cframes) do
				if type(i)=="table" and not dfind(cframes1,i) then 
					local meshid=i.meshid
					if meshid and (meshid1==meshid) and (textureid1==i.textureid) then
						cframes1[v]=i
						lastpositions[v]=v.Position
						break
					end
				end
			end
		elseif v:IsA("SpecialMesh") then
			ondes(v.Parent)
		end
	end
	local function onplayer(v)
		local lastc=nil
		local function oncharacter()
			local newc=v.Character
			if newc and (newc ~= lastc) then
				lastc=newc
				characters[v]=newc
				refreshrayfilter()
				local hrp=timegp(newc,"HumanoidRootPart","BasePart",10)
				if not (hrp and c and newc:IsDescendantOf(ws)) then return end
				if v==lp then
					c=newc
					local fi,fv=next(flingtable)
					if fi then
						for i,v in pairs(tclone(flingtable)) do
							if not c then
								return
							end
							local startpos=i.Position
							local stoptime=sine+3
							while true do
								twait()
								if sine>stoptime then
									break
								end
								if (startpos-i.Position).Magnitude>200 then
									break
								end
								local tcf=i.CFrame+i.Velocity*(sin(sine*15)+1)
								if novoid and (tcf.Y<novoid) then
									tcf=tcf+v3_010*(novoid-tcf.Y)
								end
								hrp.CFrame=tcf
								hrp.Velocity=i.Velocity*v3_101*75
								hrp.RotVelocity=flingvel
							end
							if v then
								v:Destroy()
							end
							flingtable[i]=nil
						end
						hrp.Velocity=v3_0
						hrp.RotVelocity=v3_0
						hrp.CFrame=cfr
						twait(0.26)
					end
					local startpos=pos+v3(mrandom(-32,32),0,mrandom(-32,32))
					local dir=nil
					local poscheck=true
					while poscheck do
						poscheck=false
						for i,v in pairs(rootparts) do
							local diff=(startpos-v.Position)*v3_101
							if diff.Magnitude<10 then
								poscheck=true
								dir=dir or diff.Unit
								startpos=startpos+dir
							end
						end
						local diff=(startpos-pos)*v3_101
						if diff.Magnitude<10 then
							poscheck=true
							dir=dir or diff.Unit
							startpos=startpos+dir
						end
					end
					startpos=cfr.Rotation+startpos
					primarypart=c.PrimaryPart or hrp
					hrp.CFrame=startpos
					hrp.Velocity=v3_0
					hrp.RotVelocity=v3_0
					if claimwait then
						twait(0.26)
					else
						lp.Character=nil
					end
					newc:BreakJoints()
					tclear(cframes1)
					tclear(claimtimes)
					tclear(lastpositions)
					local cd=newc:GetDescendants()
					for i=1,#cd do
						tspawn(ondes,cd[i])
					end
					newc.DescendantAdded:Connect(ondes)
				else
					rootparts[v]=hrp
				end
			end
		end
		v:GetPropertyChangedSignal("Character"):Connect(oncharacter)
		oncharacter()
	end
	local plrst=plrs:GetPlayers()
	for i=1,#plrst do onplayer(plrst[i]) end
	plrs.PlayerAdded:Connect(onplayer)
	plrs.PlayerRemoving:Connect(function(v)
		characters[v]=nil
		rootparts[v]=nil
	end)

	local mradN05=rad(-0.5)
	local KeyCode=e.KeyCode
	local enumMLC=e.MouseBehavior.LockCenter
	local enumMB2=e.UserInputType.MouseButton2
	local enumMLCP=e.MouseBehavior.LockCurrentPosition
	local enumMD=e.MouseBehavior.Default
	local enumMW=e.UserInputType.MouseWheel

	local mode="default"
	local defaultmode={}
	local modes={default=defaultmode}
	
	local function emptyfunction() end
	
	local lerpsIdle=emptyfunction
	local lerpsWalk=emptyfunction
	local lerpsJump=emptyfunction
	local lerpsFall=emptyfunction
	
	local function addmode(key,mode)
		if (type(key)~="string") or (type(mode)~="table") then
			return
		end
		for i,v in pairs(mode) do
			if type(v)~="function" then
				mode[i]=nil
			end
		end
		if key=="default" then
			defaultmode=mode
			modes.default=mode
			lerpsIdle=mode.idle or emptyfunction
			lerpsWalk=mode.walk or emptyfunction
			lerpsJump=mode.jump or emptyfunction
			lerpsFall=mode.fall or emptyfunction
			if mode.modeEntered then
				mode.modeEntered()
			end
		elseif #key==1 then
			key=KeyCode[supper(ssub(key,1,1))]
			modes[key]=mode
		end
	end

	local keyW=KeyCode.W
	local Wpressed=uis:IsKeyDown(keyW)
	local keyA=KeyCode.A
	local Apressed=uis:IsKeyDown(keyA)
	local keyS=KeyCode.S
	local Spressed=uis:IsKeyDown(keyS)
	local keyD=KeyCode.D
	local Dpressed=uis:IsKeyDown(keyD)
	local keySpace=KeyCode.Space
	local spacePressed=uis:IsKeyDown(keySpace)
	
	local keyShift=KeyCode.LeftShift
	uis.InputBegan:Connect(function(a)
		if gs.MenuIsOpen or uis:GetFocusedTextBox() then
			return
		end
		a=a.KeyCode
		if a==keyW then
			Wpressed=true
		elseif a==keyA then
			Apressed=true
		elseif a==keyS then
			Spressed=true
		elseif a==keyD then
			Dpressed=true
		elseif a==keySpace then
			spacePressed=true
		elseif a==keyShift then
			shiftlock=allowshiftlock and not shiftlock
		elseif modes[a] then
			if modes[mode].modeLeft then
				modes[mode].modeLeft()
			end
			if mode==a then
				mode="default"
			else
				mode=a
			end
			local modet=modes[mode]
			lerpsIdle=modet.idle or defaultmode.idle or emptyfunction
			lerpsWalk=modet.walk or defaultmode.walk or emptyfunction
			lerpsJump=modet.jump or defaultmode.jump or emptyfunction
			lerpsFall=modet.fall or defaultmode.fall or emptyfunction
			if modes[mode].modeEntered then
				modes[mode].modeEntered()
			end
		end
	end)
	uis.InputEnded:Connect(function(a)
		a=a.KeyCode
		if a==keyW then
			Wpressed=false
		elseif a==keyA then
			Apressed=false
		elseif a==keyS then
			Spressed=false
		elseif a==keyD then
			Dpressed=false
		elseif a==keySpace then
			spacePressed=false
		end
	end)
	uis.InputChanged:Connect(function(a,b)
		if (not b) and (a.UserInputType==enumMW) then
			camoff=camoff+a.Position*v3_001*(0.75-camoff.Z/4)
			if camoff.Z>0 then
				camoff=camoff-camoff.Position
			end
			firstperson=camoff.Z==0
		end
	end)

	local function predictionfling(target)
		if not c then
			return twait() and false
		end
		if typeof(target)~="Instance" then 
			target=mouse.Target
			if not target then
				return twait() and false
			end
		end
		if target:IsA("Humanoid") or target:IsA("BasePart") then 
			target=target.Parent 
			if target:IsA("Accessory") then
				target=target.Parent
			end
		end
		if (not target:IsA("Model")) or (target==c) then
			return twait() and false
		end
		local targetpart=gp(target,"HumanoidRootPart","BasePart") or gp(target,"Torso","BasePart") or gp(target,"UpperTorso","BasePart")
		if not (targetpart and targetpart:IsDescendantOf(ws)) then
			return twait() and false
		end
		if highlightflingtargets then
			local h=i("Highlight")
			h.Name=rs()
			h.Adornee=target
			h.FillColor=c3(1,0,0)
			h.OutlineColor=c3(1,0,0)
			h.FillTransparency=0.5
			h.OutlineTransparency=0
			h.Parent=i9
			flingtable[targetpart]=h
		else
			flingtable[targetpart]=false
		end
		twait()
		return true
	end

	if ctrlclicktp then
		ctrlclicktp=KeyCode.LeftControl
		local tpoff=v3_010*3
		if clickfling then
			mouse.Button1Down:Connect(function()
				if mouse.Target then
					if uis:IsKeyDown(ctrlclicktp) then
						pos=mouse.Hit.Position+tpoff
						cfr=cf(pos,pos+camoff.LookVector*v3_101)
						xzvel=v3_0
						Yvel=0
					else
						predictionfling()
					end
				end
			end)
		else
			mouse.Button1Down:Connect(function()
				if mouse.Target and uis:IsKeyDown(ctrlclicktp) then
					pos=mouse.Hit.Position+tpoff
					cfr=cf(pos,pos+camoff.LookVector*v3_101)
					xzvel=v3_0
					Yvel=0
				end
			end)
		end
	elseif clickfling then
		mouse.Button1Down:Connect(predictionfling)
	end

	local noYvelTime=1
	local lastsine=sine
	local con=nil
	local function mainFunction()
		if not c then 
			for i,v in pairs(cframes) do
				local p=i.placeholder
				if p then
					p:Destroy()
				end
			end
			for i,v in pairs(flingtable) do
				if v then
					v:Destroy()
				end
			end
			uis.MouseBehavior=enumMD
			onnewcamera()
			local c=lp.Character
			if c then
				cam.CameraSubject=c:FindFirstChildOfClass("Humanoid")
			end
			return con and con:Disconnect() 
		end

		sine=osclock()
		local delta=sine-lastsine
		deltaTime=clamp(delta*10,0,1)
		lastsine=sine

		if shiftlock then
			if allowshiftlock then
				uis.MouseBehavior=enumMLC
				local rotation=uis:GetMouseDelta()*mradN05
				local camoffpos=camoff.Position
				camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
			else
				shiftlock=false
			end
		elseif firstperson then
			uis.MouseBehavior=enumMLC
			local rotation=uis:GetMouseDelta()*mradN05
			local camoffpos=camoff.Position
			camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		elseif uis:IsMouseButtonPressed(enumMB2) then
			uis.MouseBehavior=enumMLCP
			local rotation=uis:GetMouseDelta()*mradN05
			local camoffpos=camoff.Position
			camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		else
			uis.MouseBehavior=enumMD
		end

		local raycastresult=ws:Raycast(pos,v3_010*(fpdh-pos.Y),raycastparams)
		local onground=nil
		if raycastresult then
			raycastresult=raycastresult.Position
			onground=(pos.Y-raycastresult.Y)<3.01
			if onground then
				Yvel=0
				cfr=cfr+v3_010*(raycastresult.Y+3-pos.Y)*clamp(delta*20,0,1)
				if spacePressed then
					Yvel=jumpPower
				end
			else
				Yvel=Yvel-gravity*delta
				if pos.Y+Yvel*delta<raycastresult.Y then
					Yvel=0
					cfr=cfr+v3_010*(raycastresult.Y+3-pos.Y)
				end
			end
		else
			Yvel=0
			onground=false
		end
		xzvel=v3_0
		if Wpressed then
			xzvel=xzvel+(camoff.LookVector*v3_101).Unit
		end
		if Spressed then
			xzvel=xzvel-(camoff.LookVector*v3_101).Unit
		end
		if Apressed then
			xzvel=xzvel-(camoff.RightVector*v3_101).Unit
		end
		if Dpressed then
			xzvel=xzvel+(camoff.RightVector*v3_101).Unit
		end
		pos=cfr.Position
		if shiftlock or firstperson then
			if xzvel.Magnitude>0 then
				xzvel=xzvel.Unit*walkSpeed
			end
			cfr=cf(pos,pos+camoff.LookVector*v3_101)
		elseif xzvel.Magnitude>0 then
			xzvel=xzvel.Unit*walkSpeed
			cfr=cfr:Lerp(cf(pos,pos+xzvel),deltaTime)
		end
		cfr=cfr+(xzvel+(v3_010*Yvel))*delta
		pos=cfr.Position

		camcf=cf(pos,pos+camoff.LookVector)+camoff.LookVector*camoff.Z+v3_0150
		if shiftlock and not firstperson then
			camcf=camcf+camcf.RightVector*1.75
		end
		if cam then
			cam.CFrame=camcf
		end

		if onground then
			if xzvel==v3_0 then
				lerpsIdle()
			else
				lerpsWalk()
			end
		elseif Yvel>0 then
			lerpsJump()
		else
			lerpsFall()
		end

		cframes[rootpart]=cfr
		refreshjoints(rootpart)

		if abs(Yvel)>1 then
			noYvelTime=0
		else
			noYvelTime=clamp(noYvelTime+delta*0.3,0,1)
			xzvel=xzvel*(1-noYvelTime)
		end

		local idlerv=v3(sin((sine-0.0375)*16),sin(sine*16),sin((sine+0.075)*16))
		local idleoff=idlerv*0.001

		for i,v in pairs(cframes) do
			local p=i.placeholder
			if p then
				if p.Parent~=ws then
					p.Parent=ws
				end
				p.CFrame=v
			end
		end
		local claimpos=primarypart.Position
		for i,v in pairs(cframes1) do
			if (not i.Anchored) and i:IsDescendantOf(ws) then
				if i.ReceiveAge==0 then
					local p=v.placeholder
					if p and p.Parent then
						p.Parent=nil
					end
					v=cframes[v]
					local lastpos=lastpositions[i]
					local vel=(v.Position-lastpos)/delta
					if vel.Magnitude>speedlimit then
						vel=vel.Unit*speedlimit
						v=v+(lastpos+vel*delta)-v.Position
					end
					lastpositions[i]=v.Position
					if vel.Magnitude<0.15 then
						v=v+idleoff
					end
					if novoid and (v.Y<novoid) then
						v=v+v3_010*(novoid-v.Y)
					end
					local claimtime=claimtimes[i]
					if claimtime then
						if sine-claimtime<retVelTime then
							i.Velocity=(claimpos-v.Position)*v3_101/getFallingTime(v.Y,claimpos.Y,rGravity)+v3_net
						else
							i.Velocity=getNetlessVelocity(vel*noYvelTime+xzvel)
						end
					else
						claimtimes[i]=sine
						i.Velocity=getNetlessVelocity(vel*noYvelTime+xzvel)
					end
					i.CFrame=v
					i.RotVelocity=idlerv
				else
					claimtimes[i]=nil
					lastpositions[i]=i.Position
				end
			end
		end

		if simrad then
			shp(lp,"SimulationRadius",simrad)
		end
	end

	sine=osclock()
	lastsine=sine
	con=heartbeat:Connect(mainFunction)
	mainFunction()

	stopreanimate=function()
		if c then
			c=nil
			return true
		else
			return false
		end
	end

	local legcfR=cf(1,-1,0)
	local legcfL=cf(-1,-1,0)
	local raydir=v3_010*-2
	local function raycastlegs() --this returns 2 values: right leg raycast offset, left leg raycast offset
		local rY=ws:Raycast((cfr*legcfR).Position,raydir,raycastparams)
		local lY=ws:Raycast((cfr*legcfL).Position,raydir,raycastparams)
		return rY and (rY.Position.Y-(pos.Y-3)) or 0,lY and (lY.Position.Y-(pos.Y-3)) or 0
	end

	local function velbycfrvec() --this returns 2 values: forward/backwards movement (from -1 to 1), right/left movement (from -1 to 1)
		local fw=cfr.LookVector*xzvel/walkSpeed
		local rt=cfr.RightVector*xzvel/walkSpeed
		return fw.X+fw.Z,rt.X+rt.Z
	end

	local lastvel=v3_0
	local velchg1=v3_0
	local function velchgbycfrvec() --this returns 2 values: forward/backwards velocity change, right/left velocity change
		velchg1=velchg1+(lastvel-xzvel) --i recommend setting velchg1 to v3_0 when u start using this function or it will look worse
		lastvel=xzvel
		velchg1=velchg1:Lerp(v3_0,deltaTime/2)
		local fw=cfr.LookVector*velchg1/32
		local rt=cfr.RightVector*velchg1/32
		return fw.X+fw.Z,rt.X+rt.Z
	end

	local function lerp(number1,number2,alpha)
		return number1 + (number2-number1)*alpha
	end

	local lastYvel=0
	local velYchg1=0
	local function velYchg() --this returns Y axis velocity change
		velYchg1=clamp(velYchg1+(lastYvel-Yvel),-50,50) --i recommend setting velYchg1 to 0 when u start using this function or it will look worse
		lastYvel=Yvel
		velYchg1=velYchg1-velYchg1*(deltaTime/2)
		return velYchg1
	end

	local function rotToMouse(alpha) --this rotates ur character towards your mouse hit position
		local mpos=mouse.Hit.Position
		cfr=cfr:Lerp(cf(pos,v3(mpos.X,pos.Y,mpos.Z)),alpha or deltaTime)
	end

	local function setWalkSpeed(n)
		if type(n) ~= "number" then
			n=16
		end
		walkSpeed=n
	end
	local function setJumpPower(n)
		if type(n) ~= "number" then
			n=50
		end
		jumpPower=n
	end
	local function setGravity(n)
		if type(n) ~= "number" then
			n=196.2
		end
		gravity=n
	end

	return {
		cframes=cframes,
		joints=joints,
		fling=predictionfling,
		predictionfling=predictionfling,
		refreshjoints=refreshjoints,
		raycastlegs=raycastlegs,
		velbycfrvec=velbycfrvec,
		velchgbycfrvec=velchgbycfrvec,
		velYchg=velYchg,
		addmode=addmode,
		getPart=getPart,
		getPartFromMesh=getPartFromMesh,
		getAccWeldFromMesh=getAccWeldFromMesh,
		getJoint=getJoint,
		getPartJoint=getPartJoint,
		rotToMouse=rotToMouse,
		setWalkSpeed=setWalkSpeed,
		setJumpPower=setJumpPower,
		setGravity=setGravity
	}
end

-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_mePJlendwa"] = Instance.new("ScreenGui");
	["_gORyKtYIR"] = Instance.new("Frame");
	["_GHsGMiFAuvgEM"] = Instance.new("Frame");
	["_jGfSJASrn"] = Instance.new("ScrollingFrame");
	["_OaYFElLszAC"] = Instance.new("UIListLayout");
	["_TzUgufoWV"] = Instance.new("TextButton");
	["_PlayAnim"] = Instance.new("LocalScript");
	["_Debug"] = Instance.new("LocalScript");
	["_CbAENbcjp"] = Instance.new("TextLabel");
	["_RJTvnjkTY"] = Instance.new("TextLabel");
	["_OqvqcAisCGTxu"] = Instance.new("TextLabel");
	["_uYaitPKWBy"] = Instance.new("TextLabel");
	["_TMKvshIy"] = Instance.new("TextLabel");
	["_RsdxDtFJv"] = Instance.new("TextLabel");
	["_fyIrjzFeyAGp"] = Instance.new("TextButton");
	["_PlayAnim1"] = Instance.new("LocalScript");
	["_Debug1"] = Instance.new("LocalScript");
	["_wMDeGiypKlcU"] = Instance.new("TextButton");
	["_PlayAnim2"] = Instance.new("LocalScript");
	["_Debug2"] = Instance.new("LocalScript");
	["_bqOPBbgYToAKyE"] = Instance.new("TextLabel");
	["_VfwcfmNNwX"] = Instance.new("TextLabel");
	["_aVFtyguEQ"] = Instance.new("TextButton");
	["_PlayAnim3"] = Instance.new("LocalScript");
	["_Debug3"] = Instance.new("LocalScript");
	["_sOMqGiGZ"] = Instance.new("TextButton");
	["_PlayAnim4"] = Instance.new("LocalScript");
	["_Debug4"] = Instance.new("LocalScript");
	["_zchqeicavByX"] = Instance.new("TextButton");
	["_PlayAnim5"] = Instance.new("LocalScript");
	["_Debug5"] = Instance.new("LocalScript");
	["_TqtjyRqWczS"] = Instance.new("TextButton");
	["_PlayAnim6"] = Instance.new("LocalScript");
	["_Debug6"] = Instance.new("LocalScript");
	["_eCEtMpoJnyzhbeP"] = Instance.new("TextButton");
	["_PlayAnim7"] = Instance.new("LocalScript");
	["_Debug7"] = Instance.new("LocalScript");
	["_SMnLKpSSP"] = Instance.new("TextButton");
	["_PlayAnim8"] = Instance.new("LocalScript");
	["_Debug8"] = Instance.new("LocalScript");
	["_mbvodsNQVYpZw"] = Instance.new("TextLabel");
	["_ufHLWYOaqubMee"] = Instance.new("TextLabel");
	["_XqftdBOsauvlllo"] = Instance.new("TextButton");
	["_PlayAnim9"] = Instance.new("LocalScript");
	["_Debug9"] = Instance.new("LocalScript");
	["_uouCpgCUbZFw"] = Instance.new("TextLabel");
	["_EiFtaoIR"] = Instance.new("TextLabel");
	["_dIkWMzevKUjuh"] = Instance.new("TextButton");
	["_PlayAnim10"] = Instance.new("LocalScript");
	["_Debug10"] = Instance.new("LocalScript");
	["_zLaKgrFcEwwmaRp"] = Instance.new("TextLabel");
	["_NnnthMrHnVSae"] = Instance.new("TextButton");
	["_PlayAnim11"] = Instance.new("LocalScript");
	["_KEXDKHmISGQX"] = Instance.new("TextButton");
	["_PlayAnim12"] = Instance.new("LocalScript");
	["_Debug11"] = Instance.new("LocalScript");
	["_ZwCFfAnNB"] = Instance.new("TextButton");
	["_PlayAnim13"] = Instance.new("LocalScript");
	["_Debug12"] = Instance.new("LocalScript");
	["_UICorner"] = Instance.new("UICorner");
	["_UIStroke"] = Instance.new("UIStroke");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIStroke1"] = Instance.new("UIStroke");
	["_ZRIIxFwQEEg"] = Instance.new("TextLabel");
	["_AjhdgfgfgcyujgAG"] = Instance.new("TextLabel");
	["_ylrVgfAkFyMB"] = Instance.new("TextButton");
	["_LocalScript"] = Instance.new("LocalScript");
	["_LocalScript1"] = Instance.new("LocalScript");
	["_SettingB"] = Instance.new("TextButton");
	["_UIStroke2"] = Instance.new("UIStroke");
	["_UICorner2"] = Instance.new("UICorner");
	["_LocalScript2"] = Instance.new("LocalScript");
	["_Settings"] = Instance.new("Frame");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIStroke3"] = Instance.new("UIStroke");
	["_LM"] = Instance.new("TextButton");
	["_UIStroke4"] = Instance.new("UIStroke");
	["_LocalScript3"] = Instance.new("LocalScript");
	["_UICorner4"] = Instance.new("UICorner");
	["_DM"] = Instance.new("TextButton");
	["_UIStroke5"] = Instance.new("UIStroke");
	["_UICorner5"] = Instance.new("UICorner");
	["_LocalScript4"] = Instance.new("LocalScript");
	["_SettingC"] = Instance.new("TextButton");
	["_UIStroke6"] = Instance.new("UIStroke");
	["_UICorner6"] = Instance.new("UICorner");
	["_LocalScript5"] = Instance.new("LocalScript");
	["_UIGradient4"] = Instance.new("UIGradient");
}

-- Properties:



Converted["_UIGradient4"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(112.000000923872, 0, 197.0000034570694)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
Converted["_UIGradient4"].Rotation = -90
Converted["_UIGradient4"].Parent = Converted["_gORyKtYIR"]

Converted["_mePJlendwa"].IgnoreGuiInset = true
Converted["_mePJlendwa"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_mePJlendwa"].ResetOnSpawn = false
Converted["_mePJlendwa"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_mePJlendwa"].Name = "mePJlendwa"
Converted["_mePJlendwa"].Parent = game:GetService("CoreGui")

Converted["_gORyKtYIR"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_gORyKtYIR"].BackgroundColor3 = Color3.fromRGB(47.0000009983778, 47.0000009983778, 47.0000009983778)
Converted["_gORyKtYIR"].BorderSizePixel = 0
Converted["_gORyKtYIR"].Position = UDim2.new(0.5, 0, 0.377434134, -150)
Converted["_gORyKtYIR"].Size = UDim2.new(0, 507, 0, 395)
Converted["_gORyKtYIR"].Name = "gORyKtYIR"
Converted["_gORyKtYIR"].Parent = Converted["_mePJlendwa"]

Converted["_GHsGMiFAuvgEM"].BackgroundColor3 = Color3.fromRGB(34.00000177323818, 34.00000177323818, 34.00000177323818)
Converted["_GHsGMiFAuvgEM"].BorderSizePixel = 0
Converted["_GHsGMiFAuvgEM"].Position = UDim2.new(0, 22, 0, 54)
Converted["_GHsGMiFAuvgEM"].Size = UDim2.new(0.936941206, -10, 0.880657017, -25)
Converted["_GHsGMiFAuvgEM"].Name = "GHsGMiFAuvgEM"
Converted["_GHsGMiFAuvgEM"].Parent = Converted["_gORyKtYIR"]

Converted["_jGfSJASrn"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_jGfSJASrn"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_jGfSJASrn"].ScrollBarThickness = 7
Converted["_jGfSJASrn"].Active = true
Converted["_jGfSJASrn"].BackgroundTransparency = 1
Converted["_jGfSJASrn"].BorderSizePixel = 0
Converted["_jGfSJASrn"].Position = UDim2.new(-4.46250533e-06, 0, 0.000737513939, 0)
Converted["_jGfSJASrn"].Size = UDim2.new(1.00036085, -3, 1.00590158, 0)
Converted["_jGfSJASrn"].Name = "jGfSJASrn"
Converted["_jGfSJASrn"].Parent = Converted["_GHsGMiFAuvgEM"]

Converted["_OaYFElLszAC"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_OaYFElLszAC"].Name = "OaYFElLszAC"
Converted["_OaYFElLszAC"].Parent = Converted["_jGfSJASrn"]

Converted["_TzUgufoWV"].Font = Enum.Font.Arial
Converted["_TzUgufoWV"].Text = "Reset"
Converted["_TzUgufoWV"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TzUgufoWV"].TextSize = 14
Converted["_TzUgufoWV"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_TzUgufoWV"].BackgroundTransparency = 1
Converted["_TzUgufoWV"].Size = UDim2.new(1, 0, 0, 0)
Converted["_TzUgufoWV"].Name = "TzUgufoWV"
Converted["_TzUgufoWV"].Parent = Converted["_jGfSJASrn"]

Converted["_CbAENbcjp"].Font = Enum.Font.ArialBold
Converted["_CbAENbcjp"].Text = "By: Zyphon"
Converted["_CbAENbcjp"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CbAENbcjp"].TextSize = 14
Converted["_CbAENbcjp"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_CbAENbcjp"].BackgroundTransparency = 1
Converted["_CbAENbcjp"].Size = UDim2.new(1, 0, 0, 0)
Converted["_CbAENbcjp"].Name = "CbAENbcjp"
Converted["_CbAENbcjp"].Parent = Converted["_jGfSJASrn"]

Converted["_RJTvnjkTY"].Font = Enum.Font.ArialBold
Converted["_RJTvnjkTY"].Text = "powered by patchma"
Converted["_RJTvnjkTY"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_RJTvnjkTY"].TextSize = 14
Converted["_RJTvnjkTY"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_RJTvnjkTY"].BackgroundTransparency = 1
Converted["_RJTvnjkTY"].Size = UDim2.new(1, 0, 0, 0)
Converted["_RJTvnjkTY"].Name = "RJTvnjkTY"
Converted["_RJTvnjkTY"].Parent = Converted["_jGfSJASrn"]

Converted["_OqvqcAisCGTxu"].Font = Enum.Font.ArialBold
Converted["_OqvqcAisCGTxu"].Text = "---------------------------------------"
Converted["_OqvqcAisCGTxu"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_OqvqcAisCGTxu"].TextSize = 14
Converted["_OqvqcAisCGTxu"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_OqvqcAisCGTxu"].BackgroundTransparency = 1
Converted["_OqvqcAisCGTxu"].Position = UDim2.new(0.00202429155, 0, 0.159695819, 0)
Converted["_OqvqcAisCGTxu"].Size = UDim2.new(1, 0, 0, 0)
Converted["_OqvqcAisCGTxu"].Name = "OqvqcAisCGTxu"
Converted["_OqvqcAisCGTxu"].Parent = Converted["_jGfSJASrn"]

Converted["_uYaitPKWBy"].Font = Enum.Font.ArialBold
Converted["_uYaitPKWBy"].Text = "Zyphon's Animations"
Converted["_uYaitPKWBy"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_uYaitPKWBy"].TextSize = 14
Converted["_uYaitPKWBy"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_uYaitPKWBy"].BackgroundTransparency = 1
Converted["_uYaitPKWBy"].Size = UDim2.new(1, 0, 0, 0)
Converted["_uYaitPKWBy"].Name = "uYaitPKWBy"
Converted["_uYaitPKWBy"].Parent = Converted["_jGfSJASrn"]

Converted["_TMKvshIy"].Font = Enum.Font.ArialBold
Converted["_TMKvshIy"].Text = "---------------------------------------"
Converted["_TMKvshIy"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TMKvshIy"].TextSize = 14
Converted["_TMKvshIy"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_TMKvshIy"].BackgroundTransparency = 1
Converted["_TMKvshIy"].Size = UDim2.new(1, 0, 0, 0)
Converted["_TMKvshIy"].Name = "TMKvshIy"
Converted["_TMKvshIy"].Parent = Converted["_jGfSJASrn"]

Converted["_RsdxDtFJv"].Font = Enum.Font.ArialBold
Converted["_RsdxDtFJv"].Text = "Paid hats"
Converted["_RsdxDtFJv"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_RsdxDtFJv"].TextSize = 14
Converted["_RsdxDtFJv"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_RsdxDtFJv"].BackgroundTransparency = 1
Converted["_RsdxDtFJv"].Size = UDim2.new(1, 0, 0, 0)
Converted["_RsdxDtFJv"].Name = "RsdxDtFJv"
Converted["_RsdxDtFJv"].Parent = Converted["_jGfSJASrn"]

Converted["_fyIrjzFeyAGp"].Font = Enum.Font.Arial
Converted["_fyIrjzFeyAGp"].Text = "Pandora"
Converted["_fyIrjzFeyAGp"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_fyIrjzFeyAGp"].TextSize = 14
Converted["_fyIrjzFeyAGp"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_fyIrjzFeyAGp"].BackgroundTransparency = 1
Converted["_fyIrjzFeyAGp"].Size = UDim2.new(1, 0, 0, 0)
Converted["_fyIrjzFeyAGp"].Name = "fyIrjzFeyAGp"
Converted["_fyIrjzFeyAGp"].Parent = Converted["_jGfSJASrn"]

Converted["_wMDeGiypKlcU"].Font = Enum.Font.Arial
Converted["_wMDeGiypKlcU"].Text = "Dodanuki"
Converted["_wMDeGiypKlcU"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_wMDeGiypKlcU"].TextSize = 14
Converted["_wMDeGiypKlcU"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_wMDeGiypKlcU"].BackgroundTransparency = 1
Converted["_wMDeGiypKlcU"].Size = UDim2.new(1, 0, 0, 0)
Converted["_wMDeGiypKlcU"].Name = "wMDeGiypKlcU"
Converted["_wMDeGiypKlcU"].Parent = Converted["_jGfSJASrn"]

Converted["_bqOPBbgYToAKyE"].Font = Enum.Font.ArialBold
Converted["_bqOPBbgYToAKyE"].Text = "---------------------------------------"
Converted["_bqOPBbgYToAKyE"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_bqOPBbgYToAKyE"].TextSize = 14
Converted["_bqOPBbgYToAKyE"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_bqOPBbgYToAKyE"].BackgroundTransparency = 1
Converted["_bqOPBbgYToAKyE"].Size = UDim2.new(1, 0, 0, 0)
Converted["_bqOPBbgYToAKyE"].Name = "bqOPBbgYToAKyE"
Converted["_bqOPBbgYToAKyE"].Parent = Converted["_jGfSJASrn"]

Converted["_VfwcfmNNwX"].Font = Enum.Font.ArialBold
Converted["_VfwcfmNNwX"].Text = "No hats"
Converted["_VfwcfmNNwX"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_VfwcfmNNwX"].TextSize = 14
Converted["_VfwcfmNNwX"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_VfwcfmNNwX"].BackgroundTransparency = 1
Converted["_VfwcfmNNwX"].Size = UDim2.new(1, 0, 0, 0)
Converted["_VfwcfmNNwX"].Name = "VfwcfmNNwX"
Converted["_VfwcfmNNwX"].Parent = Converted["_jGfSJASrn"]

Converted["_aVFtyguEQ"].Font = Enum.Font.Arial
Converted["_aVFtyguEQ"].Text = "Kirby"
Converted["_aVFtyguEQ"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_aVFtyguEQ"].TextSize = 14
Converted["_aVFtyguEQ"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_aVFtyguEQ"].BackgroundTransparency = 1
Converted["_aVFtyguEQ"].Size = UDim2.new(1, 0, 0, 0)
Converted["_aVFtyguEQ"].Name = "aVFtyguEQ"
Converted["_aVFtyguEQ"].Parent = Converted["_jGfSJASrn"]

Converted["_sOMqGiGZ"].Font = Enum.Font.Arial
Converted["_sOMqGiGZ"].Text = "Headless (no hats)"
Converted["_sOMqGiGZ"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_sOMqGiGZ"].TextSize = 14
Converted["_sOMqGiGZ"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_sOMqGiGZ"].BackgroundTransparency = 1
Converted["_sOMqGiGZ"].Size = UDim2.new(1, 0, 0, 0)
Converted["_sOMqGiGZ"].Name = "sOMqGiGZ"
Converted["_sOMqGiGZ"].Parent = Converted["_jGfSJASrn"]

Converted["_zchqeicavByX"].Font = Enum.Font.Arial
Converted["_zchqeicavByX"].Text = "Better Basics"
Converted["_zchqeicavByX"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_zchqeicavByX"].TextSize = 14
Converted["_zchqeicavByX"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_zchqeicavByX"].BackgroundTransparency = 1
Converted["_zchqeicavByX"].Size = UDim2.new(1, 0, 0, 0)
Converted["_zchqeicavByX"].Name = "zchqeicavByX"
Converted["_zchqeicavByX"].Parent = Converted["_jGfSJASrn"]

Converted["_TqtjyRqWczS"].Font = Enum.Font.Arial
Converted["_TqtjyRqWczS"].Text = "Flappy dude"
Converted["_TqtjyRqWczS"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TqtjyRqWczS"].TextSize = 14
Converted["_TqtjyRqWczS"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_TqtjyRqWczS"].BackgroundTransparency = 1
Converted["_TqtjyRqWczS"].Position = UDim2.new(0.00216357945, 0, 0.603513539, 0)
Converted["_TqtjyRqWczS"].Size = UDim2.new(1, 0, 0, 0)
Converted["_TqtjyRqWczS"].Name = "TqtjyRqWczS"
Converted["_TqtjyRqWczS"].Parent = Converted["_jGfSJASrn"]

Converted["_eCEtMpoJnyzhbeP"].Font = Enum.Font.Arial
Converted["_eCEtMpoJnyzhbeP"].Text = "Mario"
Converted["_eCEtMpoJnyzhbeP"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_eCEtMpoJnyzhbeP"].TextSize = 14
Converted["_eCEtMpoJnyzhbeP"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_eCEtMpoJnyzhbeP"].BackgroundTransparency = 1
Converted["_eCEtMpoJnyzhbeP"].Size = UDim2.new(1, 0, 0, 0)
Converted["_eCEtMpoJnyzhbeP"].Name = "eCEtMpoJnyzhbeP"
Converted["_eCEtMpoJnyzhbeP"].Parent = Converted["_jGfSJASrn"]

Converted["_SMnLKpSSP"].Font = Enum.Font.Arial
Converted["_SMnLKpSSP"].Text = "Car"
Converted["_SMnLKpSSP"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SMnLKpSSP"].TextSize = 14
Converted["_SMnLKpSSP"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_SMnLKpSSP"].BackgroundTransparency = 1
Converted["_SMnLKpSSP"].Size = UDim2.new(1, 0, 0, 0)
Converted["_SMnLKpSSP"].Name = "SMnLKpSSP"
Converted["_SMnLKpSSP"].Parent = Converted["_jGfSJASrn"]

Converted["_mbvodsNQVYpZw"].Font = Enum.Font.ArialBold
Converted["_mbvodsNQVYpZw"].Text = "---------------------------------------"
Converted["_mbvodsNQVYpZw"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_mbvodsNQVYpZw"].TextSize = 14
Converted["_mbvodsNQVYpZw"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_mbvodsNQVYpZw"].BackgroundTransparency = 1
Converted["_mbvodsNQVYpZw"].Size = UDim2.new(1, 0, 0, 0)
Converted["_mbvodsNQVYpZw"].Name = "mbvodsNQVYpZw"
Converted["_mbvodsNQVYpZw"].Parent = Converted["_jGfSJASrn"]

Converted["_ufHLWYOaqubMee"].Font = Enum.Font.ArialBold
Converted["_ufHLWYOaqubMee"].Text = "Remakes"
Converted["_ufHLWYOaqubMee"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ufHLWYOaqubMee"].TextSize = 14
Converted["_ufHLWYOaqubMee"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_ufHLWYOaqubMee"].BackgroundTransparency = 1
Converted["_ufHLWYOaqubMee"].Size = UDim2.new(1, 0, 0, 0)
Converted["_ufHLWYOaqubMee"].Name = "ufHLWYOaqubMee"
Converted["_ufHLWYOaqubMee"].Parent = Converted["_jGfSJASrn"]

Converted["_XqftdBOsauvlllo"].Font = Enum.Font.Arial
Converted["_XqftdBOsauvlllo"].Text = "Gunner V2 (W.I.P. Unobtainable for now)"
Converted["_XqftdBOsauvlllo"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_XqftdBOsauvlllo"].TextSize = 14
Converted["_XqftdBOsauvlllo"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_XqftdBOsauvlllo"].BackgroundTransparency = 1
Converted["_XqftdBOsauvlllo"].Size = UDim2.new(1, 0, 0, 0)
Converted["_XqftdBOsauvlllo"].Name = "XqftdBOsauvlllo"
Converted["_XqftdBOsauvlllo"].Parent = Converted["_jGfSJASrn"]

Converted["_uouCpgCUbZFw"].Font = Enum.Font.ArialBold
Converted["_uouCpgCUbZFw"].Text = "---------------------------------------"
Converted["_uouCpgCUbZFw"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_uouCpgCUbZFw"].TextSize = 14
Converted["_uouCpgCUbZFw"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_uouCpgCUbZFw"].BackgroundTransparency = 1
Converted["_uouCpgCUbZFw"].Size = UDim2.new(1, 0, 0, 0)
Converted["_uouCpgCUbZFw"].Name = "uouCpgCUbZFw"
Converted["_uouCpgCUbZFw"].Parent = Converted["_jGfSJASrn"]

Converted["_EiFtaoIR"].Font = Enum.Font.ArialBold
Converted["_EiFtaoIR"].Text = "Other's animations"
Converted["_EiFtaoIR"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_EiFtaoIR"].TextSize = 14
Converted["_EiFtaoIR"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_EiFtaoIR"].BackgroundTransparency = 1
Converted["_EiFtaoIR"].Size = UDim2.new(1, 0, 0, 0)
Converted["_EiFtaoIR"].Name = "EiFtaoIR"
Converted["_EiFtaoIR"].Parent = Converted["_jGfSJASrn"]

Converted["_dIkWMzevKUjuh"].Font = Enum.Font.Arial
Converted["_dIkWMzevKUjuh"].Text = "Pot (Paid Tin pot)"
Converted["_dIkWMzevKUjuh"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_dIkWMzevKUjuh"].TextSize = 14
Converted["_dIkWMzevKUjuh"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_dIkWMzevKUjuh"].BackgroundTransparency = 1
Converted["_dIkWMzevKUjuh"].Size = UDim2.new(1, 0, 0, 0)
Converted["_dIkWMzevKUjuh"].Name = "dIkWMzevKUjuh"
Converted["_dIkWMzevKUjuh"].Parent = Converted["_jGfSJASrn"]

Converted["_zLaKgrFcEwwmaRp"].Font = Enum.Font.ArialBold
Converted["_zLaKgrFcEwwmaRp"].Text = "---------------------------------------"
Converted["_zLaKgrFcEwwmaRp"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_zLaKgrFcEwwmaRp"].TextSize = 14
Converted["_zLaKgrFcEwwmaRp"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_zLaKgrFcEwwmaRp"].BackgroundTransparency = 1
Converted["_zLaKgrFcEwwmaRp"].Size = UDim2.new(1, 0, 0, 0)
Converted["_zLaKgrFcEwwmaRp"].Name = "zLaKgrFcEwwmaRp"
Converted["_zLaKgrFcEwwmaRp"].Parent = Converted["_jGfSJASrn"]

Converted["_NnnthMrHnVSae"].Font = Enum.Font.Arial
Converted["_NnnthMrHnVSae"].Text = "Destroy UI"
Converted["_NnnthMrHnVSae"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_NnnthMrHnVSae"].TextSize = 14
Converted["_NnnthMrHnVSae"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_NnnthMrHnVSae"].BackgroundTransparency = 1
Converted["_NnnthMrHnVSae"].Size = UDim2.new(1, 0, 0, 0)
Converted["_NnnthMrHnVSae"].Name = "NnnthMrHnVSae"
Converted["_NnnthMrHnVSae"].Parent = Converted["_jGfSJASrn"]

Converted["_KEXDKHmISGQX"].Font = Enum.Font.Arial
Converted["_KEXDKHmISGQX"].Text = "Stop reanimate"
Converted["_KEXDKHmISGQX"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_KEXDKHmISGQX"].TextSize = 14
Converted["_KEXDKHmISGQX"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_KEXDKHmISGQX"].BackgroundTransparency = 1
Converted["_KEXDKHmISGQX"].Size = UDim2.new(1, 0, 0, 0)
Converted["_KEXDKHmISGQX"].Name = "KEXDKHmISGQX"
Converted["_KEXDKHmISGQX"].Parent = Converted["_jGfSJASrn"]

Converted["_ZwCFfAnNB"].Font = Enum.Font.Arial
Converted["_ZwCFfAnNB"].Text = "Rejoin"
Converted["_ZwCFfAnNB"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ZwCFfAnNB"].TextSize = 14
Converted["_ZwCFfAnNB"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_ZwCFfAnNB"].BackgroundTransparency = 1
Converted["_ZwCFfAnNB"].Size = UDim2.new(1, 0, 0, 0)
Converted["_ZwCFfAnNB"].Name = "ZwCFfAnNB"
Converted["_ZwCFfAnNB"].Parent = Converted["_jGfSJASrn"]

Converted["_UICorner"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner"].Parent = Converted["_GHsGMiFAuvgEM"]

Converted["_UIStroke"].Thickness = 2.700000047683716
Converted["_UIStroke"].Parent = Converted["_GHsGMiFAuvgEM"]

Converted["_UICorner1"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner1"].Parent = Converted["_gORyKtYIR"]

Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke1"].Thickness = 4.5
Converted["_UIStroke1"].Parent = Converted["_gORyKtYIR"]

Converted["_ZRIIxFwQEEg"].Font = Enum.Font.ArialBold
Converted["_ZRIIxFwQEEg"].Text = "Zyph Hub"
Converted["_ZRIIxFwQEEg"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ZRIIxFwQEEg"].TextScaled = true
Converted["_ZRIIxFwQEEg"].TextSize = 16
Converted["_ZRIIxFwQEEg"].TextWrapped = true
Converted["_ZRIIxFwQEEg"].BackgroundColor3 = Color3.fromRGB(165.00000536441803, 165.00000536441803, 165.00000536441803)
Converted["_ZRIIxFwQEEg"].BackgroundTransparency = 1
Converted["_ZRIIxFwQEEg"].BorderSizePixel = 0
Converted["_ZRIIxFwQEEg"].Position = UDim2.new(0, 0, 0, 7)
Converted["_ZRIIxFwQEEg"].Size = UDim2.new(0.994082868, -2, 0.0689572319, 20)
Converted["_ZRIIxFwQEEg"].Name = "ZRIIxFwQEEg"
Converted["_ZRIIxFwQEEg"].Parent = Converted["_gORyKtYIR"]

Converted["_AjhdgfgfgcyujgAG"].Font = Enum.Font.ArialBold
Converted["_AjhdgfgfgcyujgAG"].Text = "Zyph Hub"
Converted["_AjhdgfgfgcyujgAG"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AjhdgfgfgcyujgAG"].TextScaled = true
Converted["_AjhdgfgfgcyujgAG"].TextSize = 16
Converted["_AjhdgfgfgcyujgAG"].TextWrapped = true
Converted["_AjhdgfgfgcyujgAG"].BackgroundColor3 = Color3.fromRGB(165.00000536441803, 165.00000536441803, 165.00000536441803)
Converted["_AjhdgfgfgcyujgAG"].BackgroundTransparency = 1
Converted["_AjhdgfgfgcyujgAG"].BorderSizePixel = 0
Converted["_AjhdgfgfgcyujgAG"].Position = UDim2.new(0, 6, 0, 0)
Converted["_AjhdgfgfgcyujgAG"].Size = UDim2.new(0.994082868, -2, 0.0689572468, 20)
Converted["_AjhdgfgfgcyujgAG"].Name = "AjhdgfgfgcyujgAG"
Converted["_AjhdgfgfgcyujgAG"].Parent = Converted["_gORyKtYIR"]

Converted["_ylrVgfAkFyMB"].Font = Enum.Font.SourceSansBold
Converted["_ylrVgfAkFyMB"].RichText = true
Converted["_ylrVgfAkFyMB"].Text = "<b>X</b>"
Converted["_ylrVgfAkFyMB"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ylrVgfAkFyMB"].TextSize = 16
Converted["_ylrVgfAkFyMB"].AnchorPoint = Vector2.new(1, 0)
Converted["_ylrVgfAkFyMB"].BackgroundTransparency = 1
Converted["_ylrVgfAkFyMB"].Position = UDim2.new(0.0665745214, 0, -0.275201499, 0)
Converted["_ylrVgfAkFyMB"].Size = UDim2.new(0, 40, 1, 0)
Converted["_ylrVgfAkFyMB"].Name = "ylrVgfAkFyMB"
Converted["_ylrVgfAkFyMB"].Parent = Converted["_AjhdgfgfgcyujgAG"]

Converted["_SettingB"].Font = Enum.Font.ArialBold
Converted["_SettingB"].Text = "UI Settings"
Converted["_SettingB"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SettingB"].TextSize = 14
Converted["_SettingB"].BackgroundColor3 = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997)
Converted["_SettingB"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SettingB"].BorderSizePixel = 0
Converted["_SettingB"].Position = UDim2.new(0.730419755, 0, 0.0165417641, 0)
Converted["_SettingB"].Size = UDim2.new(0, 113, 0, 34)
Converted["_SettingB"].Name = "SettingB"
Converted["_SettingB"].Parent = Converted["_gORyKtYIR"]

Converted["_UIStroke2"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke2"].Thickness = 4.5
Converted["_UIStroke2"].Parent = Converted["_SettingB"]

Converted["_UICorner2"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner2"].Parent = Converted["_SettingB"]

Converted["_Settings"].BackgroundColor3 = Color3.fromRGB(49.000004678964615, 49.000004678964615, 49.000004678964615)
Converted["_Settings"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Settings"].BorderSizePixel = 0
Converted["_Settings"].Position = UDim2.new(1.0138067, 0, 0, 0)
Converted["_Settings"].Size = UDim2.new(0, 265, 0, 395)
Converted["_Settings"].Visible = false
Converted["_Settings"].Name = "Settings"
Converted["_Settings"].Parent = Converted["_gORyKtYIR"]

Converted["_UICorner3"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner3"].Parent = Converted["_Settings"]

Converted["_UIStroke3"].Thickness = 3.799999952316284
Converted["_UIStroke3"].Parent = Converted["_Settings"]

Converted["_LM"].Font = Enum.Font.ArialBold
Converted["_LM"].Text = "Light mode"
Converted["_LM"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_LM"].TextSize = 14
Converted["_LM"].BackgroundColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257)
Converted["_LM"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_LM"].BorderSizePixel = 0
Converted["_LM"].Position = UDim2.new(0.283737481, 0, 0.191225305, 0)
Converted["_LM"].Size = UDim2.new(0, 113, 0, 90)
Converted["_LM"].Name = "LM"
Converted["_LM"].Parent = Converted["_Settings"]

Converted["_UIStroke4"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke4"].Thickness = 4.5
Converted["_UIStroke4"].Parent = Converted["_LM"]

Converted["_UICorner4"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner4"].Parent = Converted["_LM"]

Converted["_DM"].Font = Enum.Font.ArialBold
Converted["_DM"].Text = "Dark mode"
Converted["_DM"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_DM"].TextSize = 14
Converted["_DM"].BackgroundColor3 = Color3.fromRGB(47.0000009983778, 47.0000009983778, 47.0000009983778)
Converted["_DM"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_DM"].BorderSizePixel = 0
Converted["_DM"].Position = UDim2.new(0.283737481, 0, 0.570972145, 0)
Converted["_DM"].Size = UDim2.new(0, 113, 0, 90)
Converted["_DM"].Name = "DM"
Converted["_DM"].Parent = Converted["_Settings"]

Converted["_UIStroke5"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke5"].Thickness = 4.5
Converted["_UIStroke5"].Parent = Converted["_DM"]

Converted["_UICorner5"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner5"].Parent = Converted["_DM"]

Converted["_SettingC"].Font = Enum.Font.ArialBold
Converted["_SettingC"].Text = "UI Settings"
Converted["_SettingC"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SettingC"].TextSize = 14
Converted["_SettingC"].BackgroundColor3 = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997)
Converted["_SettingC"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_SettingC"].BorderSizePixel = 0
Converted["_SettingC"].Position = UDim2.new(0.730419755, 0, 0.0165417641, 0)
Converted["_SettingC"].Size = UDim2.new(0, 113, 0, 34)
Converted["_SettingC"].Name = "SettingC"
Converted["_SettingC"].Parent = Converted["_gORyKtYIR"]

Converted["_UIStroke6"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke6"].Thickness = 4.5
Converted["_UIStroke6"].Parent = Converted["_SettingC"]

Converted["_UICorner6"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner6"].Parent = Converted["_SettingC"]

-- Fake Module Scripts:

local fake_module_scripts = {}


-- Fake Local Scripts:

local function TEOLRV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.TzUgufoWV.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_TzUgufoWV"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		stopreanimate()
	end)
end
local function YPZMHZX_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.TzUgufoWV.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_TzUgufoWV"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Canceled reanimate")
	end)
end
local function IUWUYC_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.fyIrjzFeyAGp.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_fyIrjzFeyAGp"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local velYchg=t.velYchg
		local setWalkSpeed=t.setWalkSpeed
		local getPartFromMesh=t.getPartFromMesh
		local getPartJoint=t.getPartJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		local AccessoryWeld = getPartFromMesh(13610799467,13610799583)  
		local AccessoryWeld = getPartJoint(AccessoryWeld)
		local ring = getPartFromMesh(4481952601,4481952883)
		local ring = getPartJoint(ring)
	
		t.setWalkSpeed(20)
	
		addmode("default", {
			idle = function()
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.05235987755982989*sin(sine*2),3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*4),0)*angles(0,1.5707963267948966-0.03490658503988659*sin(sine*2),0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.48863983154296875,19,0.4705667495727539)*angles(0,0,0),deltaTime) 
				ring.C0=ring.C0:Lerp(cf(0,19-0.5*sin(sine*1),0.5)*angles(0,0,0),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,Head,0,0,0,4,-110,0,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,Torso,0,0,0,4,-90,,0,4,0,0.2,0,4,-0,3,0,2,0,0,0,4,180,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1,-0.2,0,4,90,-2,0,2,0,0,0,4,0,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-90,0,0,4,0,0,0,4,0,0,0,4,ArmTool_Handle,-0.48863983154296875,0,0,4,0,0,0,4,19,0,0,4,0,0,0,4,0.4705667495727539,0,0,4,0,0,0,4,MeshPartAccessory_Handle,,0,0,1,0,0,0,1,19,-0.5,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1
	
			end,
			walk = function()
				local Vfw, Vrt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.05235987755982989*sin(sine*2),3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.2*sin(sine*4),0)*angles(0,1.5707963267948966-0.03490658503988659*sin(sine*2),-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.3*sin(sine*4),0)*angles(0,-1.5707963267948966,-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.48863983154296875,19,0.4705667495727539)*angles(0,0,0),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,19-0.5*sin(sine*1),0.5)*angles(0,0,0),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,Head,0,0,0,4,-110,5,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,Torso,0,0,0,4,-90,,0,4,0,0.2,0,4,-0,3,0,2,0,0,0,4,180,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1,0.2,0,4,90,-2,0,2,0,0,0,4,0,-40,10,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.3,0,4,-90,0,0,4,0,0,0,4,0,-40,10,4,ArmTool_Handle,-0.48863983154296875,0,0,4,0,0,0,4,19,0,0,4,0,0,0,4,0.4705667495727539,0,0,4,0,0,0,4,MeshPartAccessory_Handle,,0,0,1,0,0,0,1,19,-0.5,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1
	
			end
		})
	
		local attackAnimation=nil
		mouse.Button1Down:Connect(function()
			if attackAnimation then return end
			attackAnimation=function()
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-19,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.3161255787892263),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(2.5,0.5396773815155029,0.7)*angles(0,-0.17453292519943295,0),deltaTime) 
				ring.C0=ring.C0:Lerp(cf(1.5,-1.5,1.5)*angles(1.5707963267948966,0,0),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,1,-0,0,0,1,-19,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,190,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,20,0,0,1,0,0,0,1,-50,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,ArmTool_Handle,2.5,0,0,1,0,0,0,1,0.5396773815155029,0,0,1,-10,0,0,1,0.7,0,0,1,0,0,0,1,MeshPartAccessory_Handle,1.5,0,0,0.1,90,0,0,1,-1.5,,0,1,,0,0,1,1.5,0,0,0.1,0,0,0,1 
	
	
			end
			task.wait(0.3) 
			attackAnimation=function()
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-19,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636,0,3.3161255787892263),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(2.5,0.5396773815155029,0.7)*angles(-0.5235987755982988,-0.17453292519943295,0),deltaTime) 
				ring.C0=ring.C0:Lerp(cf(1.5,-1.5,1)*angles(1.5707963267948966,0,0),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,1,-0,0,0,1,-19,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-80,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,190,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,20,0,0,1,0,0,0,1,-50,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,ArmTool_Handle,2.5,0,0,1,-30,0,0,1,0.5396773815155029,0,0,1,-10,0,0,1,0.7,0,0,1,0,0,0,1,MeshPartAccessory_Handle,1.5,0,0,0.1,90,0,0,1,-1.5,,0,1,,0,0,1,1,0,0,0.1,0,0,0,1 
	
			end
	
			task.wait(0.3) 
	
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-19,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636,0,3.3161255787892263),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(2.5,0.5396773815155029,0.7)*angles(-0.5235987755982988,-0.17453292519943295,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.5,-1.5,1)*angles(1.5707963267948966,0,0),deltaTime) 
			--MW_animatorProgressSave: LeftArm,-1,0,0,1,-0,0,0,1,-19,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-80,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,190,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,20,0,0,1,0,0,0,1,-50,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,ArmTool_Handle,2.5,0,0,1,-30,0,0,1,0.5396773815155029,0,0,1,-10,0,0,1,0.7,0,0,1,0,0,0,1,MeshPartAccessory_Handle,1.5,0,0,0.1,90,0,0,1,-1.5,,0,1,,0,0,1,1.,0,0,0.1,0,0,0,1 
	
	
			attackAnimation=nil 
		end)
	
		addmode("default",{
			idle=function()
				if attackAnimation then return attackAnimation() end
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.05235987755982989*sin(sine*2),3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*4),0)*angles(0,1.5707963267948966-0.03490658503988659*sin(sine*2),0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.48863983154296875,19,0.4705667495727539)*angles(0,0,0),deltaTime) 
				ring.C0=ring.C0:Lerp(cf(0,19-0.5*sin(sine*1),0.5)*angles(0,0,0),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,Head,0,0,0,4,-110,0,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,Torso,0,0,0,4,-90,,0,4,0,0.2,0,4,-0,3,0,2,0,0,0,4,180,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1,-0.2,0,4,90,-2,0,2,0,0,0,4,0,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-90,0,0,4,0,0,0,4,0,0,0,4,ArmTool_Handle,-0.48863983154296875,0,0,4,0,0,0,4,19,0,0,4,0,0,0,4,0.4705667495727539,0,0,4,0,0,0,4,MeshPartAccessory_Handle,,0,0,1,0,0,0,1,19,-0.5,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1
	
	
			end,
	
			walk = function()
				local Vfw, Vrt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.05235987755982989*sin(sine*2),3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.2*sin(sine*4),0)*angles(0,1.5707963267948966-0.03490658503988659*sin(sine*2),-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.3*sin(sine*4),0)*angles(0,-1.5707963267948966,-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.48863983154296875,19,0.4705667495727539)*angles(0,0,0),deltaTime) 
				ring.C0=ring.C0:Lerp(cf(0,19-0.5*sin(sine*1),0.5)*angles(0,0,0),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,Head,0,0,0,4,-110,5,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,Torso,0,0,0,4,-90,,0,4,0,0.2,0,4,-0,3,0,2,0,0,0,4,180,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1,0.2,0,4,90,-2,0,2,0,0,0,4,0,-40,10,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.3,0,4,-90,0,0,4,0,0,0,4,0,-40,10,4,ArmTool_Handle,-0.48863983154296875,0,0,4,0,0,0,4,19,0,0,4,0,0,0,4,0.4705667495727539,0,0,4,0,0,0,4,MeshPartAccessory_Handle,,0,0,1,0,0,0,1,19,-0.5,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1
	
			end
		})
	end)
end
local function IXLQQ_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.fyIrjzFeyAGp.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_fyIrjzFeyAGp"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function GHOVZR_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.wMDeGiypKlcU.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_wMDeGiypKlcU"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local velYchg=t.velYchg
		local setWalkSpeed=t.setWalkSpeed
		local getPartFromMesh=t.getPartFromMesh
		local getPartJoint=t.getPartJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		local AccessoryWeld = getPartFromMesh(11379559730,11152519811)  
		local AccessoryWeld = getPartJoint(AccessoryWeld)
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://8756658612"
		t.setWalkSpeed(14)
	
		addmode("default", {
			idle = function()
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.1+0.1*sin(sine*1.e+25),0.1 * sin(sine*1.e+34),0.1 * sin(sine*9999999999999))*angles(0,0,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*4),0)*angles(0,1.3962634015954636+0.06981317007977318*sin(sine*2),0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),0)*angles(0,-1.3962634015954636-0.06981317007977318*sin(sine*2),0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.03490658503988659*sin(sine*2),3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,4,-90,5,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,staff_Handle,1.1,0.1,0,9999999999999999999999999,-0,0,0,4,0,0.1,0,9999999999999999999999999999999999,0,0,0,4,0,0.1,0,9999999999999,-0,0,0,4,RightLeg,1,-,0,2,0,0,0,4,-1,-0.2,0,4,80,4,0,2,0,0,0,4,0,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-80,-4,0,2,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,2,0,2,0,0,0,4,180,0,0,4
	
			end,
			walk = function()
				local Vfw, Vrt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1+0.1*sin(sine*1.e+32),0.1 * sin(sine*10000000000000000000),0.1 * sin(sine*10000000000000000))*angles(0,0,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.2*sin(sine*4),0)*angles(0,1.3962634015954636+0.06981317007977318*sin(sine*2),-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.3*sin(sine*4),0)*angles(0,-1.3962634015954636-0.06981317007977318*sin(sine*2),-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.03490658503988659*sin(sine*2),3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,4,-90,5,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,staff_Handle,1,0.1,0,99999999999999999999999999999999,-0,0,0,4,0,0.1,0,9999999999999999999,0,0,0,4,0,0.1,0,9999999999999999,-0,0,0,4,RightLeg,1,-,0,2,0,0,0,4,-1,0.2,0,4,80,4,0,2,0,0,0,4,0,-40,10,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.3,0,4,-80,-4,0,2,0,0,0,4,0,-40,10,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,2,0,2,0,0,0,4,180,0,0,4 
	
			end
		})
	
		local attackAnimation=nil
		mouse.Button1Down:Connect(function()
			if attackAnimation then return end
			attackAnimation=function()
	
				-- Assuming 'sound' is a variable that refers to the Sound object
				sound:Play()
	
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.6179938779914944,0.3490658503988659),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1,0,-2.3)*angles(0.8726646259971648,2.0943951023931953,-0.3490658503988659),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,-0.17453292519943295,3.3161255787892263),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,150,0,0,1,0,0,0,1,20,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1,staff_Handle,1.,0,0,1,50,0,0,1,0.,0,0,1,120,0,0,1,-2.3,0,0,1,-20,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-10,0,0,1,0,0,0,1,190,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1 
	
			end
			task.wait(0.2) 
			attackAnimation=function()
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.0471975511965976,0.8726646259971648),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.5,1,-3.5)*angles(0.8726646259971648,3.6651914291880923,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.3161255787892263),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,60,0,0,1,0,0,0,1,50,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1,staff_Handle,1.5,0,0,1,50,0,0,1,1,0,0,1,210,0,0,1,-3.5,0,0,1,-0,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,190,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1
	
			end
	
			task.wait(0.3) 
	
	
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.6179938779914944,0.3490658503988659),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1,0,-2.3)*angles(0.8726646259971648,2.0943951023931953,-0.3490658503988659),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,-0.17453292519943295,3.3161255787892263),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,150,0,0,1,0,0,0,1,20,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1,staff_Handle,1.,0,0,1,50,0,0,1,0.,0,0,1,120,0,0,1,-2.3,0,0,1,-20,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-10,0,0,1,0,0,0,1,190,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1 
	
	
			attackAnimation=nil 
		end)
	
		addmode("default",{
			idle=function()
				if attackAnimation then return attackAnimation() end
				local rY, lY = raycastlegs()
	
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.1+0.1*sin(sine*1.e+25),0.1 * sin(sine*1.e+34),0.1 * sin(sine*9999999999999))*angles(0,0,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*4),0)*angles(0,1.3962634015954636+0.06981317007977318*sin(sine*2),0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),0)*angles(0,-1.3962634015954636-0.06981317007977318*sin(sine*2),0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.03490658503988659*sin(sine*2),3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,4,-90,5,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,staff_Handle,1.1,0.1,0,9999999999999999999999999,-0,0,0,4,0,0.1,0,9999999999999999999999999999999999,0,0,0,4,0,0.1,0,9999999999999,-0,0,0,4,RightLeg,1,-,0,2,0,0,0,4,-1,-0.2,0,4,80,4,0,2,0,0,0,4,0,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-80,-4,0,2,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,2,0,2,0,0,0,4,180,0,0,4
	
	
			end,
	
			walk = function()
				local Vfw, Vrt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.3490658503988659,0.8726646259971648),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1+0.1*sin(sine*1.e+32),0.1 * sin(sine*10000000000000000000),0.1 * sin(sine*10000000000000000))*angles(0,0,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.2*sin(sine*4),0)*angles(0,1.3962634015954636+0.06981317007977318*sin(sine*2),-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.3*sin(sine*4),0)*angles(0,-1.3962634015954636-0.06981317007977318*sin(sine*2),-0.6981317007977318*sin((sine+10)*4)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.3490658503988659,-0.8726646259971648),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0.03490658503988659*sin(sine*2),3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,4,-90,5,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-20,0,0,4,0,0,0,4,50,0,0,4,staff_Handle,1,0.1,0,99999999999999999999999999999999,-0,0,0,4,0,0.1,0,9999999999999999999,0,0,0,4,0,0.1,0,9999999999999999,-0,0,0,4,RightLeg,1,-,0,2,0,0,0,4,-1,0.2,0,4,80,4,0,2,0,0,0,4,0,-40,10,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.3,0,4,-80,-4,0,2,0,0,0,4,0,-40,10,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,20,0,0,4,0,0,0,4,-50,0,0,4,Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,2,0,2,0,0,0,4,180,0,0,4 
	
			end
		})
	end)
end
local function EWPMIWF_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.wMDeGiypKlcU.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_wMDeGiypKlcU"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function VAHWV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.aVFtyguEQ.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_aVFtyguEQ"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local velYchg=t.velYchg
		local setWalkSpeed=t.setWalkSpeed
		local getPartFromMesh=t.getPartFromMesh
		local getPartJoint=t.getPartJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		local tank = getPartFromMesh(12459488661,12459536185)
		local tank = getPartJoint(tank) 
		t.setWalkSpeed(20)
	
		addmode("default", {
			idle = function()
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,-19+0.2*sin(sine*4),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,18-0.2*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-0.2 * sin(sine*4),-0.5)*angles(0,0,-1.5707963267948966+0.17453292519943295*sin((sine+10)*4)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,18,0)*angles(-1.5707963267948966-0.17453292519943295*sin((sine+10)*4),0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,18-0.2*sin(sine*4),0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,-0.2 * sin(sine*4),-0.5)*angles(0,0,1.5707963267948966-0.17453292519943295*sin((sine+10)*4)),deltaTime) 
				--MW_animatorProgressSave: Torso,0,0,0,4,-90,0,0,4,-19,0.2,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,18,-0.2,0,4,-90,0,0,4,0,0,0,4,0,0,0,4,LeftArm,-1.,0,0,4,-0,0,0,4,,-0.2,0,4,0,0,0,4,-0.5,0,0,4,-90,10,10,4,Head,0,0,0,4,-90,-10,10,4,18,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,RightLeg,1,0,0,4,0,0,0,4,18,-0.2,0,4,90,0,0,4,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,0,0,4,,-0.2,0,4,0,0,0,4,-0.5,0,0,4,90,-10,10,4
	
			end,
			walk = function()
				local Vfw, Vrt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				Neck.C0=Neck.C0:Lerp(cf(0,18,0)*angles(-1.5707963267948966-0.17453292519943295*sin((sine+5)*8),0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,18+0.2*sin(sine*8),0)*angles(0,-1.5707963267948966,0.6981317007977318*sin((sine+5)*8)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,-19+0.2*sin(sine*8),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,18-0.3*sin(sine*8),0)*angles(0,1.5707963267948966,0.6981317007977318*sin((sine+5)*8)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,-0.2 * sin(sine*8),-0.5)*angles(0,0,1.5707963267948966-0.17453292519943295*sin((sine+5)*8)),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-0.2 * sin(sine*8),-0.5)*angles(0,0,-1.5707963267948966+0.17453292519943295*sin((sine+5)*8)),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,8,-90,-10,5,8,18,0,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,LeftLeg,-1,0,0,8,-0,0,0,8,18,0.2,0,8,-90,0,0,8,0,0,0,8,0,40,5,8,Torso,0,0,0,8,-90,0,0,8,-19,0.2,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,RightLeg,1,0,0,8,0,0,0,8,18,-0.3,0,8,90,0,0,8,0,0,0,8,0,40,5,8,RightArm,1,0,0,8,0,0,0,8,,-0.2,0,8,0,0,0,8,-0.5,0,0,8,90,-10,5,8,LeftArm,-1.,0,0,8,-0,0,0,8,,-0.2,0,8,0,0,0,8,-0.5,0,0,8,-90,10,5,8
	
			end
		})
	
		addmode("q", {
			idle = function()
				velYchg()
				tank.C0=tank.C0:Lerp(cf(-0.03246307373046875,-0.2,1.2)*angles(-1.5707963267948966,0,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(0,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,-1.5+0.2*sin(sine*160),0)*angles(-3.141592653589793+0.08726646259971647*sin(sine*160),0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(0,1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(0,1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(0,0.5,0)*angles(0,1.5707963267948966,0),deltaTime) 
			end
		})
	end)
end
local function OLLTTL_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.aVFtyguEQ.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_aVFtyguEQ"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function WRIEI_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.sOMqGiGZ.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_sOMqGiGZ"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local velchgbycfrvec=t.velchgbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local getPartFromMesh=t.getPartFromMesh
		local getPartJoint=t.getPartJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		local AccessoryWeld = getPartFromMesh(5548423017,5548423938)  
		local AccessoryWeld = getPartJoint(AccessoryWeld)
	
		t.setWalkSpeed(20)
	
		addmode("default", {
			idle = function()
				t.setWalkSpeed(20)
				local rY, lY = raycastlegs()
	
				Neck.C0=Neck.C0:Lerp(cf(0,-50000,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,1,-90,0,0,1,-50000,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1 
	
			end,
			walk = function()
				local fw, rt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				Neck.C0=Neck.C0:Lerp(cf(0,-50000,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0.8726646259971648*sin(sine*8)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,-0.8726646259971648*sin(sine*8)),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0.8726646259971648*sin(sine*8)),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-0.8726646259971648*sin(sine*8)),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,8,-90,0,0,8,-50000,0,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,LeftLeg,-1,0,0,8,-0,0,0,8,-1,0,0,8,-90,0,0,8,0,0,0,8,0,50,0,8,Torso,0,0,0,8,-90,0,0,8,0,0,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,RightArm,1,0,0,8,0,0,0,8,0.5,0,0,8,90,0,0,8,0,0,0,8,0,-50,0,8,RightLeg,1,0,0,8,0,0,0,8,-1,0,0,8,90,0,0,8,0,0,0,8,0,50,0,8,LeftArm,-1,0,0,8,-0,0,0,8,0.5,0,0,8,-90,0,0,8,0,0,0,8,0,-50,0,8 
	
			end
		})
	
		addmode("q", {
			idle = function()
				t.setWalkSpeed(35)
	
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1.7-0.2*sin(sine*2),0.2-0.2*sin(sine*2))*angles(-0.17453292519943295*sin((sine+2)*2),0.8726646259971648-0.08726646259971647*sin(sine*1),0.5235987755982988),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0,-0.5)*angles(0.3490658503988659+0.17453292519943295*sin(sine*2),0.8726646259971648,0.8726646259971648),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-0.6981317007977318+0.17453292519943295*sin(sine*1),0.17453292519943295*sin(sine*1),3.141592653589793+0.17453292519943295*sin(sine*1)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,-1.2+0.2*sin(sine*2),0.2 * sin((sine+1)*2))*angles(-2.792526803190927+0.08726646259971647*sin((sine+2)*2),-0.3490658503988659+0.08726646259971647*sin(sine*1),3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.5-0.2*sin(sine*2),0.2-0.2*sin(sine*2))*angles(0.5235987755982988-0.17453292519943295*sin((sine+2)*2),-1.0471975511965976-0.08726646259971647*sin(sine*1),0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-0.2 * sin(sine*2),-1-0.2*sin(sine*2))*angles(1.5707963267948966,-1.2217304763960306-0.08726646259971647*sin(sine*1),-0.5235987755982988),deltaTime) 
	
			end,	
			walk = function()
				local fw, rt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.5+0.2*sin((sine + 2)*10),0)*angles(-2.443460952792061+0.17453292519943295*sin(sine*10),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5 * sin(sine*10),0)*angles(-1.5707963267948966,-0.8726646259971648,-0.8726646259971648),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5 * sin(sine*10),0)*angles(-1.5707963267948966,0.8726646259971648,0.8726646259971648),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 6)*-10),-0.2-0.5*sin((sine + 3)*10))*angles(0.8726646259971648*sin(sine*10),-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-0.8726646259971648,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.5*sin((sine + 6)*-10),-0.2-0.5*sin((sine + 3)*10))*angles(0.8726646259971648*sin(sine*-10),1.5707963267948966,0),deltaTime)  
	
			end
		})
	end)
end
local function VANQL_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.sOMqGiGZ.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_sOMqGiGZ"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function TDOH_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.zchqeicavByX.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_zchqeicavByX"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local velchgbycfrvec=t.velchgbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		addmode("default", {
			idle = function()
				local rY, lY = raycastlegs()
	
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.17453292519943295*sin((sine+10)*4),0,3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5+0.1*sin(sine*4),0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*4),0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5+0.2*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: Head,0,0,0,4,-90,-10,10,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0.1,0,4,90,0,0,4,0,0,0,4,0,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-90,0,0,4,0,0,0,4,0,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1,-0.2,0,4,90,0,0,4,0,0,0,4,0,0,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0.2,0,4,-90,0,0,4,0,0,0,4,0,0,0,4,Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,0,0,4,0,0,0,4,180,0,0,4
	
			end,
			walk = function()
				local fw, rt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.17453292519943295*sin((sine+10)*4),0,3.141592653589793+0.08726646259971647*sin((sine+10)*1)),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.4*sin(sine*4),0)*angles(0,1.5707963267948966,-0.8726646259971648*sin((sine+10)*4)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.4*sin(sine*4),0)*angles(0,-1.5707963267948966,-0.8726646259971648*sin((sine+10)*4)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966-0.17453292519943295*sin(sine*4),-0.8726646259971648*sin(sine*4)),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966-0.17453292519943295*sin(sine*4),-0.8726646259971648*sin(sine*4)),deltaTime) 
				--MW_animatorProgressSave: Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,Head,0,0,0,4,-90,-10,10,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,5,10,1,RightLeg,1,0,0,4,0,0,0,4,-1,0.4,0,4,90,0,0,4,0,0,0,4,0,-50,10,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.4,0,4,-90,0,0,4,0,0,0,4,0,-50,10,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,90,-10,0,4,0,0,0,4,0,-50,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0,0,4,-90,-10,0,4,0,0,0,4,0,-50,0,4
			end,
			jump = function()
				local fw, rt = velbycfrvec()
	
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.3962634015954636,0.17453292519943295),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.3962634015954636,-0.17453292519943295),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.3962634015954636,-2.9670597283903604),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.3962634015954636,2.9670597283903604),deltaTime) 
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-80,0,0,1,0,0,0,1,10,0,0,1,Head,0,0,0,1,-60,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,80,0,0,1,0,0,0,1,-10,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-80,0,0,1,0,0,0,1,-170,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,80,0,0,1,0,0,0,1,170,0,0,1
			end,
			fall = function()
				local fw, rt = velbycfrvec()
	
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.3962634015954636,-0.17453292519943295),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.3962634015954636,0.17453292519943295),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.3962634015954636,-2.6179938779914944),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.3962634015954636,2.6179938779914944),deltaTime) 
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-80,0,0,1,0,0,0,1,-10,0,0,1,Head,0,0,0,1,-120,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,80,0,0,1,0,0,0,1,10,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-80,0,0,1,0,0,0,1,-150,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,80,0,0,1,0,0,0,1,150,0,0,1
			end
		})
	end)
end
local function HLMSR_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.zchqeicavByX.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_zchqeicavByX"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function VYEW_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.TqtjyRqWczS.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_TqtjyRqWczS"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local velbycfrvec=t.velbycfrvec
		local raycastlegs=t.raycastlegs
		local getJoint=t.getJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		t.setWalkSpeed(40)
	
		t.addmode("default", {
			idle = function()
				local rY, lY = raycastlegs()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.2*sin(sine*8),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,0.5+0.2*sin(sine*8),-0.5)*angles(0,0,0.8726646259971648+0.6981317007977318*sin((sine-2.5)*8)),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.5+0.2*sin(sine*8),-0.5)*angles(0,0,-0.8726646259971648-0.6981317007977318*sin((sine-2.5)*8)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953+0.17453292519943295*sin((sine+1.25)*8),0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,-0.17453292519943295-0.17453292519943295*sin((sine+10)*8)),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0.17453292519943295+0.17453292519943295*sin((sine+10)*8)),deltaTime) 
				--MW_animatorProgressSave: Torso,0,0,0,8,-90,0,0,8,3,0.2,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,RightArm,1.5,0,0,8,0,0,0,8,0.5,0.2,0,8,,0,0,8,-0.5,0,0,8,50,40,-2.5,8,LeftArm,-1.5,0,0,8,-0,0,0,8,0.5,0.2,0,8,,0,0,8,-0.5,0,0,8,-50,-40,-2.5,8,Head,0,0,0,8,-120,10,1.25,8,1,0,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,LeftLeg,-1,0,0,8,-0,0,0,8,-1,,0,8,-90,0,0,8,0,0,0,8,-10,-10,10,8,RightLeg,1,0,0,8,0,0,0,8,-1,,0,8,90,0,0,8,0,0,0,8,10,10,10,8
	
			end,
			walk = function()
				local fw, rt = velbycfrvec()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.2*sin(sine*8),0)*angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,0.5+0.2*sin(sine*8),-0.5)*angles(0,0,0.8726646259971648+0.6981317007977318*sin((sine-2.5)*8)),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.5+0.2*sin(sine*8),-0.5)*angles(0,0,-0.8726646259971648-0.6981317007977318*sin((sine-2.5)*8)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953+0.17453292519943295*sin((sine+1.25)*8),0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0.17453292519943295+0.17453292519943295*sin((sine+10)*8)),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,-0.17453292519943295-0.17453292519943295*sin((sine+10)*8)),deltaTime) 
				--MW_animatorProgressSave: Torso,0,0,0,8,-110,0,0,8,3,0.2,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,RightArm,1.5,0,0,8,0,0,0,8,0.5,0.2,0,8,,0,0,8,-0.5,0,0,8,50,40,-2.5,8,LeftArm,-1.5,0,0,8,-0,0,0,8,0.5,0.2,0,8,,0,0,8,-0.5,0,0,8,-50,-40,-2.5,8,Head,0,0,0,8,-120,10,1.25,8,1,0,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,LeftLeg,-1,0,0,8,-0,0,0,8,-1,,0,8,-90,0,0,8,0,0,0,8,10,10,10,8,RightLeg,1,0,0,8,0,0,0,8,-1,,0,8,90,0,0,8,0,0,0,8,-10,-10,10,8
	
			end
		})
	end)
end
local function BGQMUV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.TqtjyRqWczS.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_TqtjyRqWczS"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function TREG_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.eCEtMpoJnyzhbeP.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_eCEtMpoJnyzhbeP"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local addmode=t.addmode
		local getJoint=t.getJoint
		local velbycfrvec=t.velbycfrvec
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		t.setWalkSpeed(30)
	
		addmode("default",{
			idle=function()
	
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*4),0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5+0.1*sin(sine*4),0)*angles(0,1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.17453292519943295*sin((sine+10)*4),0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5+0.1*sin(sine*4),0)*angles(0,-1.5707963267948966,0),deltaTime) 
				--MW_animatorProgressSave: RightLeg,1,0,0,4,0,0,0,4,-1,-0.2,0,4,90,0,0,4,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0.1,0,4,90,0,0,4,0,0,0,4,0,0,0,4,Head,0,0,0,4,-90,-10,10,4,1,,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-90,0,0,4,0,0,0,4,0,0,0,4,Torso,0,0,0,4,-90,0,0,4,0,0.2,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftArm,-1,0,0,4,-0,0,0,4,0.5,0.1,0,4,-90,0,0,4,0,0,0,4,0,0,0,4 
	
			end,
			walk=function()
				local fw,rt=velbycfrvec()
	
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.2*sin(sine*8),0)*angles(0,1.5707963267948966,1.0471975511965976*sin(sine*8)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5+0.2*sin(sine*8),-0.2 * sin(sine*8))*angles(0,1.5707963267948966,1.0471975511965976*sin(sine*8)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*8),0)*angles(0,-1.5707963267948966,1.0471975511965976*sin(sine*8)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*16),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5+0.2*sin(sine*8),0.2 * sin(sine*8))*angles(0,-1.5707963267948966,0.8726646259971648*sin(sine*8)),deltaTime) 
				--MW_animatorProgressSave: RightLeg,1,0,0,8,0,0,0,8,-1,-0.2,0,8,90,0,0,8,0,0,0,8,0,60,0,8,RightArm,1,0,0,8,0,0,0,8,0.5,0.2,0,8,90,0,0,8,0,-0.2,0,8,0,60,0,8,Head,0,0,0,8,-90,0,10,16,1,,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,LeftLeg,-1,0,0,8,-0,0,0,8,-1,-0.2,0,8,-90,0,0,8,0,0,0,8,0,60,0,8,Torso,0,0,0,8,-90,0,0,8,0,0.2,0,16,-0,0,0,8,0,0,0,8,180,0,0,8,LeftArm,-1,0,0,8,-0,0,0,8,0.5,0.2,0,8,-90,0,0,8,,0.2,0,8,0,50,0,8
	
			end,
	
			jump = function()
				local fw, rt = velbycfrvec()
	
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,-180,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1
	
			end,
			fall = function()
				local fw, rt = velbycfrvec()
	
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,-180,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1
	
			end
		})
	end)
end
local function TPEHEBS_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.eCEtMpoJnyzhbeP.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_eCEtMpoJnyzhbeP"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function HUGT_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.SMnLKpSSP.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_SMnLKpSSP"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local velchgbycfrvec=t.velchgbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local getPartFromMesh=t.getPartFromMesh
		local getPartJoint=t.getPartJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
	
		t.setWalkSpeed(10)
	
		addmode("default", {
			idle = function()
				t.setWalkSpeed(90)
				local rY, lY = raycastlegs()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.3 * sin(sine*128),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				--MW_animatorProgressSave: Torso,0,0,0,128,-90,0,0,128,0,0.3,0,128,-0,0,0,128,0,0,0,128,180,0,0,128,Head,0,0,0,128,-90,0,0,128,1,0,0,128,-0,0,0,128,0,0,0,128,180,0,0,128,RightLeg,1,0,0,128,0,0,0,128,-1,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,RightArm,1,0,0,128,0,0,0,128,0.5,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,LeftArm,-1,0,0,128,-0,0,0,128,0.5,0,0,128,-90,0,0,128,0,0,0,128,-90,0,0,128,LeftLeg,-1,0,0,128,-0,0,0,128,-1,0,0,128,-90,0,0,128,0,0,0,128,-90,0,0,128
	
			end,
			walk = function()
				local fw, rt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.3 * sin(sine*128),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				--MW_animatorProgressSave: Torso,0,0,0,128,-90,0,0,128,0,0.3,0,128,-0,0,0,128,0,0,0,128,180,0,0,128,Head,0,0,0,128,-90,0,0,128,1,0,0,128,-0,0,0,128,0,0,0,128,180,0,0,128,RightLeg,1,0,0,128,0,0,0,128,-1,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,RightArm,1,0,0,128,0,0,0,128,0.5,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,LeftArm,-1,0,0,128,-0,,0,2,0.5,0,0,128,-90,,0,2,0,0,0,128,-90,,0,2,LeftLeg,-1,0,0,128,-0,0,0,128,-1,0,0,128,-90,0,0,128,0,0,0,128,-90,0,0,128
	
			end,
	
			jump = function()
				local fw, rt = velbycfrvec()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.3 * sin(sine*128),50 * sin(sine*128))*angles(-1.5707963267948966+174532925.19943297*sin(sine*128),0,3.141592653589793+174.53292519943295*sin(sine*128)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				--MW_animatorProgressSave: Torso,0,,0,128,-90,10000000000,0,128,0,0.3,0,128,-0,0,0,128,0,50,0,128,180,10000,0,128,Head,0,0,0,128,-90,0,0,128,1,0,0,128,-0,0,0,128,0,0,0,128,180,0,0,128,RightLeg,1,0,0,128,0,0,0,128,-1,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,RightArm,1,0,0,128,0,0,0,128,0.5,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,LeftArm,-1,0,0,128,-0,,0,2,0.5,0,0,128,-90,,0,2,0,0,0,128,-90,,0,2,LeftLeg,-1,0,0,128,-0,0,0,128,-1,0,0,128,-90,0,0,128,0,0,0,128,-90,0,0,128 
	
			end,
			fall = function()
				local fw, rt = velbycfrvec()
	
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.3 * sin(sine*128),50 * sin(sine*128))*angles(-1.5707963267948966+174532925.19943297*sin(sine*128),0,3.141592653589793+174.53292519943295*sin(sine*128)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,1.5707963267948966),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,-1.5707963267948966),deltaTime) 
				--MW_animatorProgressSave: Torso,0,,0,128,-90,10000000000,0,128,0,0.3,0,128,-0,0,0,128,0,50,0,128,180,10000,0,128,Head,0,0,0,128,-90,0,0,128,1,0,0,128,-0,0,0,128,0,0,0,128,180,0,0,128,RightLeg,1,0,0,128,0,0,0,128,-1,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,RightArm,1,0,0,128,0,0,0,128,0.5,0,0,128,90,0,0,128,0,0,0,128,90,0,0,128,LeftArm,-1,0,0,128,-0,,0,2,0.5,0,0,128,-90,,0,2,0,0,0,128,-90,,0,2,LeftLeg,-1,0,0,128,-0,0,0,128,-1,0,0,128,-90,0,0,128,0,0,0,128,-90,0,0,128 
	
			end
		})
	end)
end
local function SKPD_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.SMnLKpSSP.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_SMnLKpSSP"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function VCDROW_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.XqftdBOsauvlllo.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_XqftdBOsauvlllo"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local t=reanimate()
		if type(t)~="table" then return end
		local raycastlegs=t.raycastlegs
		local velbycfrvec=t.velbycfrvec
		local addmode=t.addmode
		local getJoint=t.getJoint
		local velYchg=t.velYchg
		local setWalkSpeed=t.setWalkSpeed
		local getPartFromMesh=t.getPartFromMesh
		local getPartJoint=t.getPartJoint
		local RootJoint=getJoint("RootJoint")
		local RightShoulder=getJoint("Right Shoulder")
		local LeftShoulder=getJoint("Left Shoulder")
		local RightHip=getJoint("Right Hip")
		local LeftHip=getJoint("Left Hip")
		local Neck=getJoint("Neck")
		local AccessoryWeld = getPartFromMesh(11711334005,11711465232)  
		local AccessoryWeld = getPartJoint(AccessoryWeld)
		Camera.FieldOfView = 150
	
		t.setWalkSpeed(16)
	
		addmode("default", {
			idle = function()
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5+0.1*sin(sine*2),0.1 * sin(sine*2))*angles(0,-1.5707963267948966,-0.2792526803190927),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1.3-0.2*sin(sine*2),-0.5)*angles(0,1.3962634015954636,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.0943951023931953,0.8726646259971648+0.08726646259971647*sin(sine*2)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin((sine+10)*2),0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.0999984741210938,0.2,1.5+0.1*sin(sine*2))*angles(-0.7853981633974483-0.08726646259971647*sin(sine*2),-0.5235987755982988,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*2),-0.5+0.1*sin(sine*2))*angles(0,-1.5707963267948966,-0.2617993877991494),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*2),0)*angles(-2.0943951023931953,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,2,-0,0,0,2,0.5,0.1,0,2,-90,0,0,2,0,0.1,0,2,-16,0,0,2,RightLeg,1,0,0,2,0,0,0,2,-1.3,-0.2,0,2,80,0,0,2,-0.5,0,0,2,0,0,0,2,RightArm,1,0,0,2,0,0,0,2,0.5,0,0,2,120,0,0,2,0,0,0,2,50,5,0,2,Head,0,0,0,2,-60,-10,10,2,1,0,0,2,-0,0,0,2,0,0,0,2,180,0,0,2,MeshPartAccessory_Handle,-1.0999984741210938,0,0,2,-45,-5,0,2,0.2,,0,2,-30,0,0,2,1.5,0.1,0,2,0,,0,2,LeftLeg,-1,0,0,2,-0,0,0,2,-1,-0.2,0,2,-90,0,0,2,-0.5,0.1,0,2,-15,,0,2,Torso,0,0,0,2,-120,0,0,2,0,0.2,0,2,-0,0,0,2,0,0,0,2,180,0,0,2
	
			end,
			walk = function()
				local Vfw, Vrt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				local Ychg=velYchg()/20
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5-0.1*sin((sine + 10)*4),0.1 * sin(sine*4))*angles(0,-1.5707963267948966,-0.2792526803190927),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.4*sin(sine*4),0)*angles(0,1.3962634015954636,-0.8726646259971648*sin((sine+5)*4)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.0943951023931953,0.8726646259971648+0.08726646259971647*sin((sine+10)*4)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin((sine+10)*4),0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.0999984741210938,0.2,1.5+0.1*sin((sine + 10)*4))*angles(-0.7853981633974483-0.08726646259971647*sin((sine+10)*4),-0.5235987755982988,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.4*sin(sine*4),-0.5+0.1*sin(sine*4))*angles(0,-1.5707963267948966,-0.2617993877991494-0.8726646259971648*sin((sine+5)*4)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-2.0943951023931953,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,4,-0,0,0,4,0.5,-0.1,10,4,-90,0,0,4,0,0.1,0,4,-16,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1,0.4,0,4,80,0,0,4,0,0,0,4,0,-50,5,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,120,0,0,4,0,0,0,4,50,5,10,4,Head,0,0,0,4,-60,-10,10,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,MeshPartAccessory_Handle,-1.0999984741210938,0,0,4,-45,-5,10,4,0.2,,0,4,-30,0,0,4,1.5,0.1,10,4,0,,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.4,0,4,-90,0,0,4,-0.5,0.1,0,4,-15,-50,5,4,Torso,0,0,0,4,-120,0,0,4,0,0.2,0,4,-0,0,0,4,0,0,0,4,180,0,0,4
	
			end
		})
	
		local attackAnimation=nil
		mouse.Button1Up:Connect(function()
			if attackAnimation then return end
			attackAnimation=function()
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,-0.17453292519943295,3.839724354387525),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,1,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,2,-0,0,0,2,0.5,0,0,2,-90,0,0,2,0,0,0,2,,0,0,2,RightLeg,1,0,0,2,0,0,0,2,-1,0,0,2,90,0,0,2,0,0,0,2,0,0,0,2,RightArm,1,0,0,2,0,0,0,2,0.5,0,0,2,100,0,0,2,0,0,0,2,90,0,0,2,LeftLeg,-1,0,0,2,-0,0,0,2,-1,0,0,2,-90,0,0,2,0,0,0,2,0,0,0,2,Head,0,0,0,2,-90,0,0,2,1,0,0,2,-10,0,0,2,0,0,0,2,220,0,0,2,MeshPartAccessory_Handle,-1.3,0,0,2,-80,0,0,2,1,0,0,2,-10,0,0,2,2.3,0,0,2,,0,0,2,Torso,0,0,0,2,-90,0,0,2,0,0,0,2,-0,0,0,2,0,0,0,2,170,0,0,2
	
	
	
			end
			task.wait(0.2) 
			attackAnimation=function()
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(0,0.5,-0.5)*angles(0,-2.6179938779914944,-2.443460952792061),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.17453292519943295,2.9670597283903604),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,1,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-0,0,0,2,-0,0,0,2,0.5,0,0,2,-150,0,0,2,-0.5,0,0,2,-140,0,0,2,RightLeg,1,0,0,2,0,0,0,2,-1,0,0,2,90,0,0,2,0,0,0,2,0,0,0,2,RightArm,1,0,0,2,0,0,0,2,0.5,0,0,2,100,0,0,2,0,0,0,2,90,0,0,2,LeftLeg,-1,0,0,2,-0,0,0,2,-1,0,0,2,-90,0,0,2,0,0,0,2,0,0,0,2,Head,0,0,0,2,-90,0,0,2,1,0,0,2,10,0,0,2,0,0,0,2,170,0,0,2,MeshPartAccessory_Handle,-1.3,0,0,2,-80,0,0,2,1,0,0,2,-10,0,0,2,2.3,0,0,2,,0,0,2,Torso,0,0,0,2,-90,0,0,2,0,0,0,2,-0,0,0,2,0,0,0,2,170,0,0,2
	
			end
			task.wait(0.2) 
			attackAnimation=function()
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(0,0.5,-0.2)*angles(0,-2.6179938779914944,-2.443460952792061),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.17453292519943295,2.9670597283903604),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,1,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-0,0,0,2,-0,0,0,2,0.5,0,0,2,-150,0,0,2,-0.2,0,0,2,-140,0,0,2,RightLeg,1,0,0,2,0,0,0,2,-1,0,0,2,90,0,0,2,0,0,0,2,0,0,0,2,RightArm,1,0,0,2,0,0,0,2,0.5,0,0,2,100,0,0,2,0,0,0,2,90,0,0,2,LeftLeg,-1,0,0,2,-0,0,0,2,-1,0,0,2,-90,0,0,2,0,0,0,2,0,0,0,2,Head,0,0,0,2,-90,0,0,2,1,0,0,2,10,0,0,2,0,0,0,2,170,0,0,2,MeshPartAccessory_Handle,-1.3,0,0,2,-80,0,0,2,1,0,0,2,-10,0,0,2,2.3,0,0,2,,0,0,2,Torso,0,0,0,2,-90,0,0,2,0,0,0,2,-0,0,0,2,0,0,0,2,170,0,0,2
	
			end
	
			task.wait(0.3) 
	
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(0,0.5,-0.5)*angles(0,-2.6179938779914944,-2.443460952792061),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.17453292519943295,2.9670597283903604),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,1,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
			--MW_animatorProgressSave: LeftArm,-0,0,0,2,-0,0,0,2,0.5,0,0,2,-150,0,0,2,-0.5,0,0,2,-140,0,0,2,RightLeg,1,0,0,2,0,0,0,2,-1,0,0,2,90,0,0,2,0,0,0,2,0,0,0,2,RightArm,1,0,0,2,0,0,0,2,0.5,0,0,2,100,0,0,2,0,0,0,2,90,0,0,2,LeftLeg,-1,0,0,2,-0,0,0,2,-1,0,0,2,-90,0,0,2,0,0,0,2,0,0,0,2,Head,0,0,0,2,-90,0,0,2,1,0,0,2,10,0,0,2,0,0,0,2,170,0,0,2,MeshPartAccessory_Handle,-1.3,0,0,2,-80,0,0,2,1,0,0,2,-10,0,0,2,2.3,0,0,2,,0,0,2,Torso,0,0,0,2,-90,0,0,2,0,0,0,2,-0,0,0,2,0,0,0,2,170,0,0,2
	
			attackAnimation=nil 
		end)
	
		local attackAnimation=nil
		mouse.Button1Down:Connect(function()
			if attackAnimation then return end
			attackAnimation=function()
	
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.3490658503988659,3.3161255787892263),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,1,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				--MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,100,0,0,1,0,0,0,1,90,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,20,0,0,1,0,0,0,1,190,0,0,1,MeshPartAccessory_Handle,-1.3,0,0,1,-80,0,0,1,1,0,0,1,-10,0,0,1,2.3,0,0,1,,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1
	
	
	
			end
			task.wait(0.2) 
			attackAnimation=function()
	
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0.3)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.2617993877991494,3.3161255787892263),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,0.8,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
				--MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,100,0,0,1,0.3,0,0,1,90,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,15,0,0,1,0,0,0,1,190,0,0,1,MeshPartAccessory_Handle,-1.3,0,0,1,-80,0,0,1,0.8,0,0,1,-10,0,0,1,2.3,0,0,1,,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1
	
			end
	
			task.wait(0.3) 
	
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0.3)*angles(0,1.7453292519943295,1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.2617993877991494,3.3161255787892263),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.3,0.8,2.3)*angles(-1.3962634015954636,-0.17453292519943295,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
			--MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,100,0,0,1,0.3,0,0,1,90,0,0,1,LeftArm,-1,0,0,1,-0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,15,0,0,1,0,0,0,1,190,0,0,1,MeshPartAccessory_Handle,-1.3,0,0,1,-80,0,0,1,0.8,0,0,1,-10,0,0,1,2.3,0,0,1,,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,170,0,0,1
	
			attackAnimation=nil 
		end)
	
	
	
	
	
		addmode("default",{
			idle=function()
				if attackAnimation then return attackAnimation() end
				t.setWalkSpeed(16)
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5+0.1*sin(sine*4),0.1 * sin(sine*4))*angles(0,-1.5707963267948966,-0.2792526803190927),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1.3-0.2*sin(sine*4),-0.5)*angles(0,1.3962634015954636,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.0943951023931953,0.8726646259971648+0.08726646259971647*sin(sine*4)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.2*sin(sine*4),-0.5+0.1*sin(sine*4))*angles(0,-1.5707963267948966,-0.2617993877991494),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin((sine+5)*4),0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.0999984741210938,0.2,1.5+0.1*sin(sine*4))*angles(-0.7853981633974483-0.08726646259971647*sin(sine*4),-0.5235987755982988,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*4),0)*angles(-2.0943951023931953,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,4,-0,0,0,4,0.5,0.1,0,4,-90,0,0,4,0,0.1,0,4,-16,0,0,4,RightLeg,1,0,0,4,0,0,0,4,-1.3,-0.2,0,4,80,0,0,4,-0.5,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,0,0,4,0.5,0,0,4,120,0,0,4,0,0,0,4,50,5,0,4,LeftLeg,-1,0,0,4,-0,0,0,4,-1,-0.2,0,4,-90,0,0,4,-0.5,0.1,0,4,-15,,0,4,Head,0,0,0,4,-60,-10,5,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,MeshPartAccessory_Handle,-1.0999984741210938,0,0,4,-45,-5,0,4,0.2,,0,4,-30,0,0,4,1.5,0.1,0,4,0,,0,4,Torso,0,0,0,4,-120,0,0,4,0,0.2,0,4,-0,0,0,4,0,0,0,4,180,0,0,4
	
	
			end,
	
			walk = function()
				local fw, rt = velbycfrvec()
	
				local rY, lY = raycastlegs()
	
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5-0.1*sin((sine + 5)*8),0.1 * sin(sine*8))*angles(0,-1.5707963267948966,-0.2792526803190927),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.4*sin(sine*8),0)*angles(0,1.3962634015954636,-0.8726646259971648*sin((sine+2.5)*8)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.0943951023931953,0.8726646259971648+0.08726646259971647*sin((sine+5)*8)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.4*sin(sine*8),-0.5+0.1*sin(sine*8))*angles(0,-1.5707963267948966,-0.2617993877991494-0.8726646259971648*sin((sine+2.5)*8)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin((sine+5)*8),0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.0999984741210938,0.2,1.5+0.1*sin((sine + 5)*8))*angles(-0.7853981633974483-0.08726646259971647*sin((sine+5)*8),-0.5235987755982988,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*8),0)*angles(-2.0943951023931953,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: LeftArm,-1,0,0,8,-0,0,0,8,0.5,-0.1,5,8,-90,0,0,8,0,0.1,0,8,-16,0,0,8,RightLeg,1,0,0,8,0,0,0,8,-1,0.4,0,8,80,0,0,8,0,0,0,8,0,-50,2.5,8,RightArm,1,0,0,8,0,0,0,8,0.5,0,0,8,120,0,0,8,0,0,0,8,50,5,5,8,LeftLeg,-1,0,0,8,-0,0,0,8,-1,-0.4,0,8,-90,0,0,8,-0.5,0.1,0,8,-15,-50,2.5,8,Head,0,0,0,8,-60,-10,5,8,1,0,0,8,-0,0,0,8,0,0,0,8,180,0,0,8,MeshPartAccessory_Handle,-1.0999984741210938,0,0,8,-45,-5,5,8,0.2,,0,8,-30,0,0,8,1.5,0.1,5,8,0,,0,8,Torso,0,0,0,8,-120,0,0,8,0,0.2,0,8,-0,0,0,8,0,0,0,8,180,0,0,8
	
			end
		})
	end)
end
local function JRIFQAV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.XqftdBOsauvlllo.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_XqftdBOsauvlllo"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function DLOV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.dIkWMzevKUjuh.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_dIkWMzevKUjuh"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		
	end)
end
local function GKNWLZB_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.dIkWMzevKUjuh.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_dIkWMzevKUjuh"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Animation played")
	end)
end
local function DQQZXRR_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.NnnthMrHnVSae.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_NnnthMrHnVSae"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	local screengui = script.Parent.Parent.Parent.Parent.Parent
	button.MouseButton1Click:Connect(function()
		screengui:Destroy()
		print("Zyph debug logger: UI Destroyed")
	end)
end
local function SDYV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.KEXDKHmISGQX.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_KEXDKHmISGQX"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		stopreanimate()
	end)
end
local function VBPZ_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.KEXDKHmISGQX.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_KEXDKHmISGQX"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Canceled reanimate")
	end)
end
local function GJPEAZP_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.ZwCFfAnNB.PlayAnim
    local script = Instance.new("LocalScript")
    script.Name = "PlayAnim"
    script.Parent = Converted["_ZwCFfAnNB"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, p)
	end)
end
local function LMZNQKJ_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.GHsGMiFAuvgEM.jGfSJASrn.ZwCFfAnNB.Debug
    local script = Instance.new("LocalScript")
    script.Name = "Debug"
    script.Parent = Converted["_ZwCFfAnNB"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		print("Zyph debug logger: Rejoined")
	end)
end
local function QXYOJZG_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.AjhdgfgfgcyujgAG.ylrVgfAkFyMB.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_ylrVgfAkFyMB"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	local screengui = script.Parent.Parent.Parent.Parent
	
	button.MouseButton1Click:Connect(function()
		screengui:Destroy()
		print("Zyph debug logger: Closed")
	end)
end
local function QRDPTDK_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_gORyKtYIR"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
local function LCEP_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.SettingB.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_SettingB"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	local thingy = script.Parent.Parent.Settings
	local button2 = script.Parent.Parent.SettingC
	
	button.MouseButton1Click:Connect(function()
		thingy.Visible = true
		button2.Visible = true
		button.Visible = false
	end)
end
local function KVKDXD_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.Settings.LM.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_LM"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	local frame1 = script.Parent.Parent
	local frame2 = script.Parent.Parent.Parent
	local frame3 = script.Parent.Parent.Parent.GHsGMiFAuvgEM
	local bubbon = script.Parent.Parent.Parent.SettingB
	local bubbon2 = script.Parent.Parent.Parent.SettingC
	
	button.MouseButton1Click:Connect(function()
		frame1.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		frame2.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		bubbon.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		bubbon2.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		frame3.BackgroundColor3 = Color3.fromRGB(185, 185, 185)
	end)
	
end
local function QPLWUFV_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.Settings.DM.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_DM"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	local frame1 = script.Parent.Parent
	local frame2 = script.Parent.Parent.Parent
	local frame3 = script.Parent.Parent.Parent.GHsGMiFAuvgEM
	local bubbon = script.Parent.Parent.Parent.SettingB
	local bubbon2 = script.Parent.Parent.Parent.SettingC
	
	button.MouseButton1Click:Connect(function()
		frame1.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		frame2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		bubbon.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		bubbon2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		frame3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	end)
	
end
local function YHVQUT_fake_script() -- Fake Script: StarterGui.mePJlendwa.gORyKtYIR.SettingC.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_SettingC"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local button = script.Parent
	local thingy = script.Parent.Parent.Settings
	local button2 = script.Parent.Parent.SettingB
	
	button.MouseButton1Click:Connect(function()
		thingy.Visible = false
		button2.Visible = true
		button.Visible = false
	end)

placeholders=true
highlightflingtargets=true
allowshiftlock=true
ctrltp=true
clickfling=true
claimwait=true
end

coroutine.wrap(TEOLRV_fake_script)()
coroutine.wrap(YPZMHZX_fake_script)()
coroutine.wrap(IUWUYC_fake_script)()
coroutine.wrap(IXLQQ_fake_script)()
coroutine.wrap(GHOVZR_fake_script)()
coroutine.wrap(EWPMIWF_fake_script)()
coroutine.wrap(VAHWV_fake_script)()
coroutine.wrap(OLLTTL_fake_script)()
coroutine.wrap(WRIEI_fake_script)()
coroutine.wrap(VANQL_fake_script)()
coroutine.wrap(TDOH_fake_script)()
coroutine.wrap(HLMSR_fake_script)()
coroutine.wrap(VYEW_fake_script)()
coroutine.wrap(BGQMUV_fake_script)()
coroutine.wrap(TREG_fake_script)()
coroutine.wrap(TPEHEBS_fake_script)()
coroutine.wrap(HUGT_fake_script)()
coroutine.wrap(SKPD_fake_script)()
coroutine.wrap(VCDROW_fake_script)()
coroutine.wrap(JRIFQAV_fake_script)()
coroutine.wrap(DLOV_fake_script)()
coroutine.wrap(GKNWLZB_fake_script)()
coroutine.wrap(DQQZXRR_fake_script)()
coroutine.wrap(SDYV_fake_script)()
coroutine.wrap(VBPZ_fake_script)()
coroutine.wrap(GJPEAZP_fake_script)()
coroutine.wrap(LMZNQKJ_fake_script)()
coroutine.wrap(QXYOJZG_fake_script)()
coroutine.wrap(QRDPTDK_fake_script)()
coroutine.wrap(LCEP_fake_script)()
coroutine.wrap(KVKDXD_fake_script)()
coroutine.wrap(QPLWUFV_fake_script)()
coroutine.wrap(YHVQUT_fake_script)()