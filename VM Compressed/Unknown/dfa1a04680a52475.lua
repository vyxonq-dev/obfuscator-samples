--[=[
	[[open source code]]
	thanks for using pshade ultimate
	
	pshade is made by content creator on youtube called @Im_patrick feel free to subs
	
	some code might be obfuscated for privacy or security reason (example : feedback)
	this is not mean to be edited/stolen
	
	This script is still in beta stage so make sure to use the loadstring so it can always be updated
	
	https://randomstring0.github.io/pshade.github.io/
]=]

if _G.pshade then return warn"pshade already loaded!" end
if not game then local game=Workspace['Parent'] end
if not game:IsLoaded() then game["Loaded"]:Wait() end



local update = [=[
	> running shaders now run realtime perfectly
	> added global illumination [ beta ]
	> fixed blur effect
	> added adjust auto load and fix ui size
	> small update for gui
	> fixed some features not showing up
	> faster preview
	> lighting element cannot be deleted fix
	> night theme
	> small fix and error handle 
	> small debug update
	> more games support
	> skybox added
	> filesystem fix
	> slow load fix
	> more adjustment stuff
	> new ui and old ui combination
	> gui dragging fix
	> shader load faster
]=]

_G.pshade=true
_G.vers="1.4.9"
local light

local game=game
local xpcall=xpcall
local type=type
local next=next
local pcall=pcall
local typeof=typeof

local mrandom,schar, mfloor,mhuge=math['random'],string['char'],math['floor'],math['huge']
local mfloor,mceil=math['floor'],math['ceil']
local twait,tspawn=task['wait'], task['spawn']
local mclam,mround=math['clamp'],math['round']
local mcos,msin,mtan=math['cos'],math['sin'],math['tan']
local mabs,mdeg,mrad=math['abs'],math['deg'],math['rad']
local msqrt=math['sqrt']
local di=debug['info']

local findclass=game["FindFirstChildOfClass"]
local getchild=game["GetChildren"]
local clone=game["Clone"]
local destroy=game["Destroy"]
local find=game['FindFirstChild']
local isa=game["IsA"]

local ins=Instance['new']
local ws=findclass(game,'Workspace')
local cam=find(ws,"Camera")
local lg=findclass(game,"Lighting")
local terr=findclass(ws,"Terrain")
local uis=findclass(game,"UserInputService")
local tween=findclass(game,"TweenService")
local http=findclass(game,"HttpService")
local market=findclass(game,"MarketplaceService")
local rs=findclass(game,"RunService")
local plrs=findclass(game,"Players")
local lp=plrs['LocalPlayer']
local pg=lp['PlayerGui']
local mouse=lp:GetMouse()
local sett1=nil
local fenv=getfenv()
local shp=fenv['sethiddenproperty'] or fenv['sethiddenprop'] or fenv['set_hidden_property'] or fenv['set_hidden_prop'] or function() return end
local ghp=fenv['gethiddenproperty'] or fenv['gethiddenprop'] or function() return end
local httpget=function(a) return loadstring(game:HttpGet(a))() end --fenv['HttpGet']
local read,write,file=fenv['readfile'],fenv['writefile'],fenv['isfile']
local setclip=fenv['setclipboard'] or function() return end
local fdist,fsize,ftrans={1.7,0.3,-0.3,-0.9},{0.7,0.2,1.2,0.45},{0.8,0.7,0.9,0.6}
local fls,sre,sflare,rmod={},ins('ScreenGui',pg),ins('ImageLabel'),1
local bmut,ber,lor=11,5,cam['CFrame']['LookVector']
local colorcor,atmosphere,bloom,blur,depth,sky,sray,cloud
local randomstring='https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/'
local technology=ghp(lg,'Technology') or 'ShadowMap'
local lan=httpget(randomstring..'lan/every.json')
local randomsky=randomstring..'sky/'
if rs:IsStudio() then return end
local src=randomstring..'src/'
local flare,motionblur
local wshade=true
local thick = tick()
local restore={}
local shader={}
local skybox={}
local new={}
local wl={}
shader.__index=shader


local sc=httpget(src..'ui')
local image=sc["mainmage"]
local main=image["main"]
local addfr=main["addtionframe"]['Frame']
local mbar=main["mainbar"]['Frame']
local mpage=main['mainpage']

local prop=main["propperty sample"]
local ntf=sc['notif']
local icon=sc['icon']

local click=sc['click']
local clicking=sc['clicking']
local color=sc['colorvalue']
local intro=sc['intro']

local intext=intro['main']['TextLabel']
local title=mbar['Frame']['maintitle']
local barfunc=mbar['functionbar']

local page=mpage['page']['Frame']
local spage=mpage['showpage']

local shadertog=addfr['toggleshaderframe']
local togd=shadertog['handle']
local home=spage['home']
local changelog=home['ScrollingFrame']['changelog']

local xddcc="70736861646520756C74696D617465"
coroutine['wrap'](function() httpget(src..'check.lua') end)()
local shader
local check=true
shp(lg,'Technology',"ShadowMap")

local adjust={
	['reflect']=nil,
	['waterspeed']=nil,
}

local tween=function(i,p,d)
	local d=d or 1
	return tween:Create(i,TweenInfo['new'](d,Enum['EasingStyle']['Exponential'],Enum['EasingDirection']['Out']),p):Play()
end

local drag=function(n,s)
	local dr,di,ds,sp=false,nil,Vector3['new'](0,0,0),nil
	local move=function(i)
		local d=i['Position']-ds
		local p=UDim2['new'](sp['X']['Scale'],sp['X']['Offset']+d['X'],sp['Y']['Scale'],sp['Y']['Offset']+d['Y'])
		tween(s,{Position=p},.15)
	end

	n['InputBegan']:Connect(function(i)
		if i['UserInputType'] == Enum['UserInputType']['MouseButton1'] or i['UserInputType'] == Enum['UserInputType']['Touch'] then
			dr,ds,sp=true,i['Position'],s['Position']
			i['Changed']:Connect(function()
				if i['UserInputState'] == Enum['UserInputState']['End'] then
					dr=false
				end
			end)
		end
	end)

	n['InputChanged']:Connect(function(i)
		if i['UserInputType'] == Enum['UserInputType']['MouseMovement'] or i['UserInputType'] == Enum['UserInputType']['Touch'] then
			di=i
		end
	end)

	uis['InputChanged']:Connect(function(i)
		if i==di and dr then
			move(i)
		end
	end)
end

local notif=function(t,d)
	coroutine['wrap'](function()
		local n=clone(ntf)
		n['Parent']=sc
		n['Image']=image['Image']
		n['title']['Text']=t
		n['Visible']=true
		n['Size']=UDim2['new'](0,0,0,0)
		tween(n,{Size=UDim2['new'](0.512,0,0.118,0)},.3)
		twait(d or 3)
		tween(n,{Position=UDim2['new'](0.5,0,0,-30)},.5)
		twait(.5)
		n:Destroy()
	end)()
end

local fh=function(s)
	return (s:gsub('..', function(c)
		return schar(tonumber(c, 16))
	end))
end

local random=function(l)
	local s=""
	local l=l or 5
	for i=1,l do
		local n=mrandom(1,3)
		if n==1 then
			s=s..schar(mrandom(65,90))
		elseif n==2 then
			s=s..schar(mrandom(97,122))
		else
			s=s..tostring(mrandom(0,9))
		end
	end
	return s
end

tspawn(function()
	for i=1,mrandom(5,35) do
		local x=ins("IntValue",lg)
		x.Name=random()
	end
end)

local bestname=random()
coroutine['wrap'](function()
if findclass(lg,"BloomEffect") then
	findclass(lg,"BloomEffect")['Enabled']=false
	local b=clone(findclass(lg,"BloomEffect"))
	b['Parent']=lg
	b['Enabled']=true
	bloom=b
	table['insert'](restore,b)
	table['insert'](new,bloom)
end
if findclass(lg,"Sky") then
	local b=clone(findclass(lg,"Sky"))
	b['Parent']=lg
	sky=b
	table['insert'](restore,b)
	table['insert'](new,sky)
end
if findclass(lg,"Atmosphere") then
	local b=clone(findclass(lg,"Atmosphere"))
	b['Parent']=lg
	atmosphere=b
	table['insert'](restore,b)
	table['insert'](new,sky)
end
if findclass(lg,"BlurEffect") then
	findclass(lg,"BlurEffect")['Size']=0
	local b=clone(findclass(lg,"BlurEffect"))
	b['Parent']=lg
	b['Enabled']=true
	blur=b
	table['insert'](restore,b)
	table['insert'](new,sky)
end
if findclass(lg,"DepthOfFieldEffect") then
	findclass(lg,"DepthOfFieldEffect")['Enabled']=false
	local b=clone(findclass(lg,"DepthOfFieldEffect"))
	b['Parent']=lg
	b['Enabled']=true
	depth=b
	table['insert'](restore,b)
	table['insert'](new,sky)
end
if findclass(lg,"ColorCorrectionEffect") then
	findclass(lg,"ColorCorrectionEffect")['Enabled']=false
	local b=clone(findclass(lg,"ColorCorrectionEffect"))
	b['Parent']=lg
	b['Enabled']=true
	colorcor=b
	table['insert'](restore,b)
	table['insert'](new,sky)
end
if findclass(lg,"SunRaysEffect") then
	findclass(lg,"SunRaysEffect")['Enabled']=false
	local b=clone(findclass(lg,"SunRaysEffect"))
	b['Parent']=lg
	b['Enabled']=true
	sray=b
	table['insert'](restore,b)
	table['insert'](new,sky)
end

	if findclass(terr,"Clouds") then
		cloud=v
		table['insert'](restore,b)
		table['insert'](new,cloud)
	end

	if not colorcor then
		colorcor=ins('ColorCorrectionEffect')
		colorcor['Parent']=lg
		table['insert'](new,colorcor)
	end
	if not atmosphere then
		atmosphere=ins('Atmosphere')
		atmosphere['Parent']=lg
		atmosphere['Density']=0
		table['insert'](new,atmosphere)
	end
	if not bloom then
		bloom=ins('BloomEffect')
		bloom['Parent']=lg
		table['insert'](new,bloom)
	end
	if not blur then
		blur=ins('BlurEffect')
		blur['Parent']=lg
		blur['Size']=0
		table['insert'](new,blur)
	end
	if not depth then
		depth=ins('DepthOfFieldEffect')
		depth['Parent']=lg
		table['insert'](new,depth)
	end
	if not sky then
		sky=ins('Sky')
		sky['Parent']=lg
		table['insert'](new,sky)
	end
	if not sray then
		sray=ins('SunRaysEffect')
		sray['Parent']=lg
		table['insert'](new,sray)
	end
	if not cloud then
		cloud=ins('Clouds')
		cloud['Parent']=terr
		cloud['Cover']=0
		cloud['Density']=0
		table['insert'](new,cloud)
	end

	terr['ChildRemoved']:Connect(function(a)
		if a['Name']==bestname then
			local v=clone(a)
			v['Parent']=terr
			if isa(a,"Clouds") then
				cloud=v
			end
		end
	end)

	lg['ChildRemoved']:Connect(function(a)
		if a['Name']==bestname then
			local v=clone(a)
			v['Parent']=lg
			if not isa(v,"Sky") and not isa(v,"Atmosphere") then
				table['insert'](restore,v)
			end
			if isa(v,"BloomEffect") then
				bloom=v
			elseif isa(v,"Sky") then
				sky=v
			elseif isa(v,"Atmosphere") then
				atmosphere=v
			elseif isa(v,"BlurEffect") then
				blur=v
			elseif isa(v,"DepthOfFieldEffect") then
				depth=v
			elseif isa(v,"ColorCorrectionEffect") then
				colorcor=v
			elseif isa(v,"SunRaysEffect") then
				sray=v
			end
		end
	end)
	
	for _,v in ipairs(restore) do
		v['Name']=bestname
	end
	for _,v in ipairs(new) do
		v['Name']=bestname
	end

	local ch=httpget(src..'blacklst.json')
	local noall=false

	for _, entry in ipairs(ch) do
 	  if entry['id'] == userId then
   	       noall = true
			write('.n', entry['reason'])
			coroutine['wrap'](function() lp:Kick('blacklisted, reason : ' .. entry['reason']) end)()
			wait(.7)
			lp:Destroy()
			game:Shutdown()
   	     break
   	  end
	end
end)()

local backup={
	['lighting']={
		['ClockTime']=lg['ClockTime'],
		['Ambient']=lg['Ambient'],
		['Brightness']=lg['Brightness'],
		['ColorShift_Bottom']=lg['ColorShift_Bottom'],
		['ColorShift_Top']=lg['ColorShift_Top'],
		['EnvironmentDiffuseScale']=lg['EnvironmentDiffuseScale'],
		['EnvironmentSpecularScale']=lg['EnvironmentSpecularScale'],
		['GlobalShadows']=lg['GlobalShadows'],
		['OutdoorAmbient']=lg['OutdoorAmbient'],
		['ShadowSoftness']=lg['ShadowSoftness'],
		['technology']=technology,
		['GeographicLatitude']=lg['GeographicLatitude'],
		['ExposureCompensation']=lg['ExposureCompensation'],
		['FogEnd']=lg['FogEnd'],
		['FogColor']=lg['FogColor'],
		['FogStart']=lg['FogStart']
	},
	['terrain']={
		['WaterColor']=terr['WaterColor'],
		['WaterReflectance']=terr['WaterReflectance'],
		['WaterTransparency']=terr['WaterTransparency'],
		['WaterWaveSize']=terr['WaterWaveSize'],
		['WaterWaveSpeed']=terr['WaterWaveSpeed']
	}
}

default={
	['yfbghj']=lg['Ambient'], 
	['tgvbyd']=lg['ClockTime'], 
	['ghuybhuyhj']=lg['GeographicLatitude'], 
	['khnbfth']=lg['Brightness'],
	['hgyghkg']=lg['ColorShift_Bottom'],
	['yfbhjku']=lg['ColorShift_Top'], 
	['ygyyfgvhbjytrt']=lg['EnvironmentDiffuseScale'],
	['sdfcddc']=lg['EnvironmentSpecularScale'],
	['hgnujuu7thgr']=lg['GlobalShadows'],
	['hyhnngtf']=lg['OutdoorAmbient'],
	['hdfr7thgr']=lg['ExposureCompensation'],
	
	['fhnchvhfjsd']=colorcor['Brightness'],
	['ugtbbjhygt']=colorcor['Contrast'],
	['tfbghuugbnjhg']=colorcor['Saturation'],
	['fvrtccvghghj']=colorcor['TintColor'],

	['jnfdhbnfcvh']=bloom['Intensity'],
	['fvtyghj']=bloom['Size'],
	['ygbhnj']=bloom['Threshold'],

	['njnfg']=blur['Size'],
	['jdfkd']=depth['FarIntensity'],
	['fvgsdfg']=depth['FocusDistance'],
	['sdkvkflv']=depth['InFocusRadius'],
	['hbjhd']=depth['NearIntensity'],

	['gyhgtg']=cloud['Cover'],
	['ygbhggv']=cloud['Density'],
	['jghbjhgyfd']=cloud['Color'],

	['shdbsnjfc']=atmosphere['Density'],
	['skdjfkdm']=atmosphere['Offset'],
	['sjdjncdjf']=atmosphere['Color'],
	['efjdjfk']=atmosphere['Decay'],
	['sejfd']=atmosphere['Glare'],
	['jddfjsd']=atmosphere['Haze']
}


light = default

local con=function(a,c,b) a[b or 'MouseButton1Click']:Connect(c) end

local function toHex(v) if type(v)=="number" then return v%1==0 and string.format("0x%X",v) or tostring(v) elseif type(v)=="string" then local h={} for i=1,#v do table.insert(h,string.format("\\x%02X",v:byte(i))) end return "\"" .. table.concat(h) .. "\"" else return tostring(v) end end
local function serializeTable(t,i) i=i or 0 local s=string.rep(" ",i) local r="{\n" for k,v in pairs(t) do local kf=type(k)=="string" and "[\""..k.."\"]" or "["..k.."]" local vf=typeof(v)=="Color3" and string.format("Color3.new(%g, %g, %g)",v.R,v.G,v.B) or (type(v)=="table" and serializeTable(v,i+1) or toHex(v)) r=r..s.." "..kf.."="..vf..",\n" end return r..s.."}" end

local function fromHexNumber(v) return tonumber(v,16) or v end
local function fromHexString(v) return v:gsub("\\x(%x%x)",function(h) return string.char(tonumber(h,16)) end) end
local function deserializeTable(t) local function fix(x) for k,v in pairs(x) do if type(v)=="string" then if v:match("^0x[%x]+$") then x[k]=tonumber(v,16) elseif v:match("\\x[%x][%x]") then x[k]=v:gsub("\\x(%x%x)",function(h) return string.char(tonumber(h,16)) end) end elseif type(v)=="table" then fix(v) end end return x end return fix(t) end


local snap=function(v,s)
	return mfloor(v/s+0.5)*s
end

local findsearch=function(t,i,c)
	local t=t:lower()
	local c=c or "Frame"
	if t~="" then
		for _,v in pairs(i:GetChildren()) do
			if isa(v,c) then
				if v['Name']~="sample" then
					local v=v
					if v['Name']:lower():sub(1,#t)==t then
						v['Visible']=true
					else
						v['Visible']=false
					end
				end
			end
		end
	else
		for _,v in pairs(i:GetChildren()) do
			if isa(v,c) then
				if v['Name']~="sample"then
					v['Visible']=true
				end
			end
		end
	end
end

local ob=function(u)
	return ws:FindPartOnRay(Ray['new'](cam['CFrame']['Position'],lg:GetSunDirection()*900),u)~=nil
end

local getsun=function()
	local camscreen=cam:WorldToScreenPoint(cam['CFrame']['Position']+lg:GetSunDirection())
	return Vector2['new'](camscreen['X'],camscreen['Y']),camscreen['Z']>0
end

local camcenter=function()
	return cam['ViewportSize']/2
end

local lightfolder=ins('Folder')
lightfolder['Parent']=ws
lightfolder['Name']=random()


local globalil={
	['gridsize']=25,
	['radius']=80,

	['shadowdirection']={
		Vector3.new(1, -1, 0), Vector3.new(-1, -1, 0),
		Vector3.new(0, -1, 1), Vector3.new(0, -1, -1),
		Vector3.new(1, -1, 1), Vector3.new(-1, -1, -1),
		Vector3.new(1, -1, -1), Vector3.new(-1, -1, 1)
	},
	
	['shadowlength']=8,
	['reflectdis']=10,

	['active']={},
	
}

local roundToGrid=function(v)
	return Vector3.new(
					mfloor(v.X / globalil['gridsize'] + 0.5) * globalil['gridsize'],
					mfloor(v.Y / globalil['gridsize'] + 0.5) * globalil['gridsize'],
					mfloor(v.Z / globalil['gridsize'] + 0.5) * globalil['gridsize']
	)
end

local hashVec3=function(v)
	return tostring(v.X).."_"..tostring(v.Y).."_"..tostring(v.Z)
end

local isIndoors=function(pos)
	local result = ws:Raycast(pos, Vector3.new(0, 500, 0))
	return result ~= nil
end

local simulateShadow=function(pos)
	for _, dir in ipairs(globalil['shadowdirection']) do
		local ray = ws:Raycast(pos, dir.Unit * globalil['shadowlength'])
		if ray then
			return true
		end
	end
	return false
end

local sampleSurfaceColor=function(pos)
	local directions = {Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, -1, 0), Vector3.new(0, 0, 1), Vector3.new(0, 0, -1)}
	for _, dir in ipairs(directions) do
		local ray = ws:Raycast(pos, dir.Unit * globalil['reflectdis'])
		if ray and ray.Instance and ray.Instance:IsA("BasePart") then
			return ray.Instance.Color:Lerp(Color3.new(1, 1, 1), 0.3) 
		end
	end
	return nil 
end

local blendColors=function(c1, c2, alpha)
	return Color3.new(
		c1.R * (1 - alpha) + c2.R * alpha,
		c1.G * (1 - alpha) + c2.G * alpha,
		c1.B * (1 - alpha) + c2.B * alpha
	)
end

local createLightPoint=function(pos)
	local part = ins("Part")
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = 1
	part.Size = Vector3.new(1, 1, 1)
	part.Position = pos
	part.Name = random()
	part.Parent = lightfolder

	local clight = ins("PointLight")
	clight.Range = 24
	clight.Brightness = 0
	clight.Shadows = false
	clight.Color = light['yfbghj']
	clight.Parent = part

	tspawn(function()
		while part['Parent'] do
			local indoor = isIndoors(pos)
			local inShadow = simulateShadow(pos)

			local baseColor = indoor and Color3.fromRGB(255, 240, 220) or light['hyhnngtf']
			local brightness = indoor and 0.35 or 0.75

			local r,g,b=0,0,0
			local hits = 0
			
			for _, dir in ipairs({
				Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0),
				Vector3.new(0, 1, 0), Vector3.new(0, -1, 0),
				Vector3.new(0, 0, 1), Vector3.new(0, 0, -1),
				Vector3.new(1, 1, 0), Vector3.new(-1, -1, 0),
				Vector3.new(1, 0, 1), Vector3.new(-1, 0, -1)
			}) do
				local ray = Workspace:Raycast(pos, dir.Unit * globalil['reflectdis'])
				if ray and ray.Instance and ray.Instance:IsA("BasePart") then
					local Color = ray.Instance.Color
					r+=Color.R
					g+=Color.G
					b+=Color.B
					hits += 1
				end
			end

			if hits > 0 then
				local avgColor = Color3.new(r / hits,g / hits,b / hits)
				baseColor = blendColors(baseColor, avgColor, 0.7)
				if inShadow then
					brightness *= 0.3 
				end
			elseif inShadow then
				brightness = 0
			end

			clight.Color = baseColor
			clight.Brightness = brightness

			twait(3)
		end
	end)

	return part
end



local mblur=ins("BlurEffect",cam)
mblur['Size']=0

ws['Changed']:Connect(function(p)
	if wl['mblur'] and p=="CurrentCamera" then
		mblur['Size']=bmsize
	end
end)

local absw=false
local abs=function(c,w)
	local w=w or .2
	coroutine['wrap'](function()
		if absw then return end
		absw=true
		for _,v in ipairs(c:GetDescendants()) do
			if isa(v,"GuiObject") then
				local old={
					pos=v['Position'],
					size=v['Size'],
					rot=v['Rotation'],
					trans=v['BackgroundTransparency']
				}
				v['Position']=UDim2['new'](mrandom(),0,mrandom(),0)
				v['Size']=UDim2['new'](0,0,0,0)
				v['BackgroundTransparency']=1
				tween(v,{Position=old['pos'],Size=old['size'],Rotation=old['rot'],BackgroundTransparency=old['trans']},w)
			end
		end
		absw=false
	end)()
end

wl={
	['dof']=true,
	['cor']=true,
	['sray']=false,
	['bl']=true,
	['blr']=false,
	['rays']=false,
	['sflare']=false,
	['mblur']=false,
	['tech']="ShadowMap",
	['global']=false
}

local defsky={
	['bk']=sky['SkyboxBk'],
	['dn']=sky['SkyboxDn'],
	['ft']=sky['SkyboxFt'],
	['lt']=sky['SkyboxLf'],
	['rt']=sky['SkyboxRt'],
	['up']=sky['SkyboxUp']
}


local cussky={
	['bk']='rbxassetid://9544505500',
	['dn']='rbxassetid://9544547905',
	['ft']='rbxassetid://9544504852',
	['lt']='rbxassetid://9544547694',
	['rt']='rbxassetid://9544547542',
	['up']='rbxassetid://9544547398'
}


coroutine['wrap'](function()
	local ss,fl=pcall(function() sett1=settings() end)
	if not ss then
		sett1={}
	end
	
	skybox={
		['default']=cussky,
		['game']=defsky,
		['morning']=httpget(randomsky..'m.json'),
		['midday']=httpget(randomsky..'n.json'),
		['afternoon']=httpget(randomsky..'a.json'),
		['evening']=httpget(randomsky..'e.json'),
		['rain']=httpget(randomsky..'r.json'),
		['cloudy']=httpget(randomsky..'c.json')
	}
end)()

local getsun=function()
	local camscreen=cam:WorldToScreenPoint(cam['CFrame']['Position']+lg:GetSunDirection())
	return Vector2['new'](camscreen['X'],camscreen['Y']),camscreen['Z']>0
end

local camcenter=function()
	return cam['ViewportSize']/2
end

local bmsize=26
local mblur=ins("BlurEffect",cam)
mblur['Size']=0

ws['Changed']:Connect(function(p)
	if wl['mblur'] and p=="CurrentCamera" then
		mblur['Size']=bmsize
	end
end)

sre['Name']='flare'
sre['Enabled']=false
sre['ResetOnSpawn']=false
sflare['Parent']=sre
sflare['Name']='sunfl'
sflare['SizeConstraint']='RelativeYY'
sflare['BackgroundTransparency']=1
sflare['ImageTransparency']=0
sflare['BorderSizePixel']=0
sflare['Image']='rbxassetid://277033149'
sflare['ImageColor3']=Color3['new'](1,1,0.95)
sflare['ZIndex']=0
sflare['Size']=UDim2['new'](15*0.2,0,15*0.2,0)

sc['Enabled']=true
coroutine['wrap'](function()
	for i=1,#fdist do
		local f=ins('ImageLabel',sre)
		f['Name']='aflare'
		f['Size']=UDim2['new'](fsize[i]*0.2,0,fsize[i]*0.2,0)
		f['SizeConstraint']='RelativeYY'
		f['BackgroundTransparency']=1
		f['ImageTransparency']=ftrans[i]
		f['BorderSizePixel']=0
		f['Rotation']+=-25
		f['Image']='rbxassetid://15164863822'
		f['ImageColor3']=Color3['new'](1,1,0.8)
		f['ZIndex']=-1
		fls[#fls+1]=f
	end
end)()

if not pcall(function() sc['Parent']=findclass(game,"CoreGui") end) then
	sc['Parent']=pg
end

notif("getting shader please wait..", 2)

local oldsize=intro['Size']
image['Visible']=false
intro['Visible']=true
intro['Size']=UDim2['new'](0,0,0,0)
tween(intro,{Size=oldsize})

local succ,err=pcall(function()
shader={
	['morning']=httpget(randomstring..'shr/morning.json'),
	['midday']=httpget(randomstring..'shr/midday.json'),
	['afternoon']=httpget(randomstring..'shr/afternoon.json'),
	['evening']=httpget(randomstring..'shr/evening%2Cjson'),
	['night']=httpget(randomstring..'shr/night.json'),
	['midnight']=httpget(randomstring..'shr/midnight.json'),
	['morninglite']=httpget(randomstring..'shr/morning1.json'),
	['middaylite']=httpget(randomstring..'shr/midday1.json'),
	['afternoonlite']=httpget(randomstring..'shr/afternoon1.json'),
	['eveninglite']=httpget(randomstring..'shr/evening1.json'),
	['nightlite']=httpget(randomstring..'shr/night1.json'),
	['midnightlite']=httpget(randomstring..'shr/midnight1.json'),
	['black']=httpget(randomstring..'shr/black.json'),
	['green']=httpget(randomstring..'shr/green.json'),
	['red']=httpget(randomstring..'shr/red.json'),
	['yellow']=httpget(randomstring..'shr/yellow.json'),
	['pink']=httpget(randomstring..'shr/pink.json'),
	['gray']=httpget(randomstring..'shr/gray.json'),
	['white']=httpget(randomstring..'shr/white.json'),
	['purple']=httpget(randomstring..'shr/purple.json'),
	['blacklite']=httpget(randomstring..'shr/black1.json'),
	['greenlite']=httpget(randomstring..'shr/green1.json'),
	['redlite']=httpget(randomstring..'shr/red1.json'),
	['yellowlite']=httpget(randomstring..'shr/yellow1.json'),
	['pinklite']=httpget(randomstring..'shr/pink1.json'),
	['graylite']=httpget(randomstring..'shr/gray1.json'),
	['whitelite']=httpget(randomstring..'shr/white1.json'),
	['purplelite']=httpget(randomstring..'shr/purple1.json'),
	['rain']=httpget(randomstring..'shr/rain.json'),
	['snow']=httpget(randomstring..'shr/snow.json'),
	['fog']=httpget(randomstring..'shr/fog.json'),
	['sunny']=httpget(randomstring..'shr/sunny.json'),
	['cloudy']=httpget(randomstring..'shr/cloudy.json'),
	['storm']=httpget(randomstring..'shr/storm.json'),
	['autumn']=httpget(randomstring..'shr/autumn.json'),
	['spring']=httpget(randomstring..'shr/spring.json'),
	['summer']=httpget(randomstring..'shr/summer.json'),
	['winter']=httpget(randomstring..'shr/winter.json')
}
end)

if succ then
	notif("shaders loaded successfully!")
else
	notif("error : " .. err)
end

tween(intro,{Size=UDim2['new'](0,0,0,0)})
twait(.2)
intro['Visible']=false
--image['Visible']=true

if _G.saved then
	local mf = deserializeTable(_G.saved)
	
	light=mf['Shader']
	cussky=mf['Skybox']
	wl['bl']=mf['Bloom'][1]
	light['jnfdhbnfcvh']=mf['Bloom'][1]
	light['fvtyghj']=mf['Bloom'][2]
	light['ygbhnj']=mf['Bloom'][3]
	wl['blr']=mf['Blur Effects']
	light['tgvbyd']=mf['Shader']['tgvbyd']
	light['ghuybhuyhj']=mf['Shader']['ghuybhuyhj']
	depth['Enabled']=mf['Depth Of Field'][1]
	light['jdfkd']=mf['Depth Of Field'][2]
	light['fvgsdfg']=mf['Depth Of Field'][3]
	light['sdkvkflv']=mf['Depth Of Field'][4]
	light['hbjhd']=mf['Depth Of Field'][5]
	light['shdbsnjfc']=mf['Atmosphere'][1]
	light['skdjfkdm']=mf['Atmosphere'][2]
	light['sejfd']=mf['Atmosphere'][3]
	light['jddfjsd']=mf['Atmosphere'][4]
	light['gyhgtg']=mf['Clouds'][1]
	light['ygbhggv']=mf['Clouds'][2]
	wl['cor']=mf['ColorCorrection'][1]
	light['fhnchvhfjsd']=mf['ColorCorrection'][2]
	light['ugtbbjhygt']=mf['ColorCorrection'][3]
	light['tfbghuugbnjhg']=mf['ColorCorrection'][4]
	wl['rays']=mf['Sunrays'][1]
	sray['Intensity']=mf['Sunrays'][2]
	sray['Spread']=mf['Sunrays'][3]
end

local mainvar=nil
local mainfunc=function()
if wshade then
	if wl['global'] then
		coroutine.wrap(function()
			if sett1['Rendering']['QualityLevel'] ~= Enum['QualityLevel']['Automatic'] then
				if sett1['Rendering']['QualityLevel']['Value'] < 5 then
					globalil['radius']=80
				else
					globalil['radius']=200
				end
			end
			local camPos = ws.CurrentCamera.CFrame.Position
			local min = camPos - Vector3.new(globalil['radius'], globalil['radius'], globalil['radius'])
			local max = camPos + Vector3.new(globalil['radius'], globalil['radius'], globalil['radius'])
			local seen = {}

			for x = min.X, max.X, globalil['gridsize'] do
				for y = min.Y, max.Y, globalil['gridsize'] do
					for z = min.Z, max.Z, globalil['gridsize'] do
						local pos = roundToGrid(Vector3.new(x, y, z))
						local hash = hashVec3(pos)
						seen[hash] = true

						if not globalil['active'][hash] then
							local dist = (pos - camPos).Magnitude
							if dist <= globalil['radius'] then
								local lightPart = createLightPoint(pos)
								globalil['active'][hash] = lightPart
							end
						end
					end
				end
			end

			for hash, part in pairs(globalil['active']) do
				if part and part:IsDescendantOf(ws) then
					local dist = (part.Position - camPos).Magnitude
					if dist > (globalil['gridsize'] + globalil['radius']) then
						part:Destroy()
						globalil['active'][hash] = nil
					end
				end
			end
			
			twait(1.5)
		end)()
	end
	if motionblur then
		local mag=(cam['CFrame']['LookVector']-lor)['Magnitude']
		mblur['Size']=mabs(mag)*bmut*ber/2
		lor=cam['CFrame']['LookVector']
	end
	if flare then
		local sunpos,front=getsun()
		local clear=not ob((lp['Character']:FindFirstChild("HumanoidRootPart")['Position']+Vector3['new'](0,1.5,0)-cam['CFrame']['Position'])['magnitude']<1.1 and lp['Character'] or nil)
		local tar=clear and 1 or 0
		rmod=rmod*(1-0.5)+tar*0.5
		local scen=camcenter()
		local vec=sunpos-scen
		for i,v in ipairs(fls) do
			v['ImageTransparency']=1-rmod+ftrans[i]*rmod
			local size,pos=v['AbsoluteSize'],scen+vec*fdist[i]
			v['Position']=UDim2['new'](0.004,pos['X']-size['X']/2,0.004,pos['Y']-size['Y']/2)
			v['Visible']=front
		end
		sflare['ImageTransparency']=1-rmod+0*rmod
		local zsize=sflare['AbsoluteSize']
		sflare['Position']=UDim2['new'](0.004,sunpos['X']-zsize['X']/2,0.004,sunpos['Y']-zsize['Y']/2)
		sflare['Visible']=front
	end
		if light then
			check=true
			
			flare=wl['sflare']
			motionblur=wl['mblur']
			sre['Enabled']=wl['sflare']
			sky['SkyboxBk']=cussky['bk']
			sky['SkyboxDn']=cussky['dn']
			sky['SkyboxFt']=cussky['ft']
			sky['SkyboxLf']=cussky['lt']
			sky['SkyboxRt']=cussky['rt']
			sky['SkyboxUp']=cussky['up']
			colorcor['Brightness']=light['fhnchvhfjsd']
			colorcor['Contrast']=light['ugtbbjhygt']
			colorcor['Saturation']=light['tfbghuugbnjhg']
			colorcor['TintColor']=light['fvrtccvghghj']
			colorcor['Enabled']=wl['cor']
			blur['Enabled']=wl['blr']
			bloom['Enabled']=wl['bl']
			bloom['Intensity']=light['jnfdhbnfcvh']
			bloom['Size']=light['fvtyghj']
			bloom['Threshold']=light['ygbhnj']
			blur['Size']=light['njnfg']
			lg['Ambient']=light['yfbghj']
			lg['ClockTime']=light['tgvbyd']
			lg['GeographicLatitude']=light['ghuybhuyhj']
			lg['Brightness']=light['khnbfth']
			lg['ColorShift_Bottom']=light['hgyghkg']
			lg['ColorShift_Top']=light['yfbhjku']
			lg['EnvironmentDiffuseScale']=light['ygyyfgvhbjytrt']
			lg['EnvironmentSpecularScale']=light['sdfcddc']
			lg['GlobalShadows']=light['hgnujuu7thgr']
			lg['OutdoorAmbient']=light['hyhnngtf']
			lg['ExposureCompensation']=light['hdfr7thgr']
			lg['FogEnd']=mhuge
			lg['FogColor']=Color3['fromRGB'](255,255,255)
			lg['FogStart']=mhuge
			cloud['Cover']=light['gyhgtg']
			cloud['Density']=light['ygbhggv']
			cloud['Color']=light['jghbjhgyfd']
			atmosphere['Density']=light['shdbsnjfc']
			atmosphere['Offset']=light['skdjfkdm']
			atmosphere['Color']=light['sjdjncdjf']
			atmosphere['Decay']=light['efjdjfk']
			atmosphere['Glare']=light['sejfd']
			atmosphere['Haze']=light['jddfjsd']
			depth['FarIntensity']=light['jdfkd']
			depth['FocusDistance']=light['fvgsdfg']
			depth['InFocusRadius']=light['sdkvkflv']
			depth['NearIntensity']=light['hbjhd']
			depth['Enabled']=wl['dof']
			sray['Enabled']=wl['rays']
		end
	else
		if check then
			check=false
			sky['SkyboxBk']=defsky['bk']
			sky['SkyboxDn']=defsky['dn']
			sky['SkyboxFt']=defsky['ft']
			sky['SkyboxLf']=defsky['lt']
			sky['SkyboxRt']=defsky['rt']
			sky['SkyboxUp']=defsky['up']
			atmosphere['Density']=default['shdbsnjfc']
			atmosphere['Offset']=default['skdjfkdm']
			atmosphere['Color']=default['sjdjncdjf']
			atmosphere['Decay']=default['efjdjfk']
			atmosphere['Glare']=default['sejfd']
			atmosphere['Haze']=default['jddfjsd']
			cloud['Cover']=default['gyhgtg']
			cloud['Density']=default['ygbhggv']
			cloud['Color']=default['jghbjhgyfd']
			lg['Ambient']=backup['lighting']['Ambient']
			lg['ClockTime']=backup['lighting']['ClockTime']
			lg['GeographicLatitude']=backup['lighting']['GeographicLatitude']
			lg['Brightness']=backup['lighting']['Brightness']
			lg['ColorShift_Bottom']=backup['lighting']['ColorShift_Bottom']
			lg['ColorShift_Top']=backup['lighting']['ColorShift_Top']
			lg['EnvironmentDiffuseScale']=backup['lighting']['EnvironmentDiffuseScale']
			lg['EnvironmentSpecularScale']=backup['lighting']['EnvironmentSpecularScale']
			lg['GlobalShadows']=backup['lighting']['GlobalShadows']
			lg['OutdoorAmbient']=backup['lighting']['OutdoorAmbient']
			lg['ExposureCompensation']=backup['lighting']['ExposureCompensation']
			lg['FogEnd']=backup['lighting']['FogEnd']
			lg['FogColor']=backup['lighting']['FogColor']
			lg['FogStart']=backup['lighting']['FogStart']
			terr['WaterReflectance']=backup['terrain']['WaterReflectance']
			terr['WaterTransparency']=backup['terrain']['WaterTransparency']
			terr['WaterWaveSize']=backup['terrain']['WaterWaveSize']
			terr['WaterWaveSpeed']=backup['terrain']['WaterWaveSpeed']
			flare=false
			motionblur=false
			sre['Enabled']=false
			if mainvar then
				mainvar:Disconnect()
			end
			for hash, part in pairs(globalil['active']) do
				if part and part:IsDescendantOf(ws) then
					part:Destroy()
					globalil['active'][hash] = nil
				end
			end
		end
	end
end

mainvar=con(rs,mainfunc,"PreRender")

local language='en'
local toggle=true
sc['Name']=random(4)
sc['Enabled']=true
title["Text"]=fh(xddcc)
coroutine['wrap'](function() if httpget(src..'check.lua') then	return 	end end)()

if file then
	if not file("pshade/welcome") then
		write('pshade/welcome','thanks for using pshade ultimate')
		write('pshade/lan', 'en')
		write('pshade/img', image['Image'])
		setclip('https://youtu.be/-moZS7duKRk?si=3vLOmrO_OF6lAXll')
	end
	if file('pshade/img') then
		image['Image']=read('pshade/img')
	end
	if file('pshade/lan') then
		language=read('pshade/lan')
	end
	if file('.n') then
		coroutine['wrap'](function() lp:Kick() end)()
		wait(.7)
		lp:Destroy()
		game:Shutdown()
	end
else
	read,write,file=function() return nil end,function() return end,function() return end
end

local oldsize=image['Size']
local switch=function()
	clicking:Play()
	toggle=not toggle
	tween(image,{Size= (toggle and oldsize or UDim2['new'](0,0,0,0))},.34)
	tween(icon,{Size= (toggle and UDim2['new'](0,0,0,0) or UDim2['new'](0.054,0,0.087,0))},.2)
	tween(icon,{Rotation= (toggle and 180 or 0)})
	--abs(main,.5)
	twait(.2)
	image['Visible']=toggle
	icon['Visible']=not toggle
end
con(icon['button'],switch)
con(mbar['functionbar']['minimize'],switch)

home['playerintro']['Frame']['title']['Text']=lan[language]['welcome']
home['playerintro']['Frame']['name']['Text']='@'..lp['Name']
home['playerintro']['playerimage']['Image']=plrs:GetUserThumbnailAsync(lp['UserId'],Enum['ThumbnailType']['AvatarBust'],Enum['ThumbnailSize']['Size100x100'])

local element=function(p)
	local b={}
	function b:button(n,c)
		local bn=clone(prop['button'])
		bn['Parent']=p
		bn['Visible']=true
		bn['Name']=n
		bn['TextButton']['Text']=n
		con(bn['TextButton'], function()
			clicking:Play()
			pcall(c)
		end)
	end
	function b:box(n,l,c)
		local box=clone(prop['box'])
		local u={}
		box['Parent']=p
		box['Visible']=true
		box['Name']=n
		box['TextButton']['Text']=n
		box['TextBox']['PlaceholderText']=l
		box['TextBox']['Text']=""
		con(box['TextBox'],function()
			local t=box['TextBox']['Text']
			if c then c(t) end
		end, 'FocusLost')
		function u:text(a)
			box['TextBox']['Text']=a
		end
		
		return u
	end
	function b:title(n)
		local n=n or "error"
		local t=clone(prop['label'])
		t['Parent']=p
		t['Visible']=true
		t['Name']=n
		t['Text']=n
	end
	function b:slider(n,m,x,c,st)
		local s=clone(prop['slider'])
		local h=s['Frame']['sliderhandle']
		local d=h['drag']
		local u={}
		local num=s['num']
		s['Visible']=true
		s['Parent']=p
		s['TextButton']['Text']=n
		s['Name']=n
		tspawn(function()
			local g=false
			local ipt,si,pi=nil
			local button1=Enum['UserInputType']['MouseButton1']
			local upd=function(i)
				local az, ap=h['AbsoluteSize'], h['AbsolutePosition']
				local cen=mclam((i['Position']["X"] - ap['X'])/az['X'],0,1)
				local scen=snap(cen,0.02)
				d['Position']=UDim2['new'](scen,0,d['Position']['Y']['Scale'],0)
				local v=mround((m*(1-scen)+(x*scen))*100)/100
				num['Text']=tostring(v)
				if c then pcall(c,v) end
			end
			
			d['InputBegan']:Connect(function(ip)
				if ip['UserInputType']==button1 or ip['UserInputType']==Enum['UserInputType']['Touch'] then
					g=true
					ip['Changed']:Connect(function()
						if ip['UserInputState']==Enum['UserInputState']['End'] then
							g=false
						end
					end)
				end
			end)
			d['InputChanged']:Connect(function(ip)
				if ip['UserInputType']==Enum['UserInputType']['MouseMovement'] or ip['UserInputType']==Enum['UserInputType']['Touch'] then
					ipt=ip
				end
			end)
			uis['InputChanged']:Connect(function(ip)
				if ip==ipt and g then
					upd(ip)
				end
			end)
		end)
		con(num,function()
			local v=tonumber(num['Text'])
			if v then
				local cen=mclam(v/x,0,1)
				d['Position']=UDim2['new'](cen,0,d['Position']['Y']['Scale'],0)
				local av=mround((m*(1-cen)+(x*cen))*100)/100
				num['Text']=tostring(av)
				if c then pcall(c,av) end
			end
		end,'FocusLost')
		
		if st then
			local v=tonumber(st)
			local cen=mclam(v/x,0,1)
			d['Position']=UDim2['new'](cen,0,d['Position']['Y']['Scale'],0)
			local av=mround((0*(1-cen)+(x*cen))*100)/100
			num['Text']=tostring(av)
		end

		function u:update(a)
			local az, ap=h['AbsoluteSize'], h['AbsolutePosition']
			local v=tonumber(a)
			local nap=mclam((v / ap['X'])/az['X'],0,1)
			local cen=snap(nap,0.02)
			d['Position']=UDim2['new'](cen,0,d['Position']['Y']['Scale'],0)
			local av=mround((0*(1-cen)+(x*cen))*100)/100
			num['Text']=tostring(av)
		end
		return u
	end
	function b:dropdown(n,h,f,cl)
		local d=clone(prop['dropdown'])
		local t=d['TextButton']
		local m=d['drophandle']
		local s=m['Frame']['sample']
		d['Parent']=p
		d['Visible']=true
		d['Name']=n
		t['Text']=n
		m['Text']=h
		for i,v in pairs(f) do
			local c=clone(s)
			c['Parent']=m['Frame']
			c['Visible']=true
			c['TextLabel']['Text']=v
			c['Name']=v
			con(c,function()
				m['Text']=v
				m['Frame']['Visible']=false
				if cl then pcall(cl,v) end
			end)
		end
		con(m,function()
			m['Frame']['Visible']=not m['Frame']['Visible']
		end)
	end
	function b:toggle(n,c,s)
		local s=s or false
		local d=clone(prop['toggle'])
		local h=d['fhandle']['hdl']
		local up={}
		d['Parent']=p
		d['Visible']=true
		d['Name']=n
		d['TextButton']['Text']=n
		if s then
			tween(h,{Position=UDim2['new'](0.47,0,0,0)},.2)
			h['BackgroundColor3']=Color3['new'](0,1,0)
		end
		con(h,function()
			if c then pcall(c,not s) end
			s=not s
			if s then
				tween(h,{Position=UDim2['new'](0.47,0,0,0)},.2)
				h['BackgroundColor3']=Color3['new'](0,1,0)
			else
				tween(h,{Position=UDim2['new'](0,0,0,0)},.2)
				h['BackgroundColor3']=Color3['new'](1,0,0)
			end
		end)
		
		function up:update(a)
			s=not s
			if a then
				tween(h,{Position=UDim2['new'](0.47,0,0,0)},.2)
				h['BackgroundColor3']=Color3['new'](0,1,0)
			else
				tween(h,{Position=UDim2['new'](0,0,0,0)},.2)
				h['BackgroundColor3']=Color3['new'](1,0,0)
			end
		end
		return up
	end
	return b
end


con(togd,function()
	click:Play()
	wshade=not wshade
	tween(togd,{Position=wshade and UDim2['new'](0.518,0,0,0) or UDim2['new'](0,0,0,0)},.2)
	togd['BackgroundColor3']=(wshade and Color3['new'](0,1,0)) or Color3['new'](1,0,0)
	notif("shaders turned to " .. (wshade and "on" or "off"), 1.3)
	for _,v in pairs(ws:GetDescendants()) do
		if isa(v,"BasePart") then
			v['Reflectance']=wshade and adjust['reflect'] or 1-1
		end
	end
	for i,v in pairs(restore) do
			if not isa(v,"Atmosphere") and not isa(v,"Sky") then
				v['Enabled']=not wshade
			end
	end
	shp(lg,"Technology",wshade and wl["tech"] or technology)
	for i,v in pairs(new) do
		if not isa(v,"Atmosphere") and not isa(v,"Sky") then
			v['Enabled']=wshade
		end
	end	
	
	for _,v in pairs(new) do
		if not isa(v,"Atmosphere") and not isa(v,"Sky") then
			v['Enabled']=wshade
		end
	end
	if wshade then
		mainvar=con(rs,mainfunc,"PreRender")
	end
	if not wl['global'] then
		for hash, part in pairs(globalil['active']) do
			if part and part:IsDescendantOf(ws) then
				part:Destroy()
				globalil['active'][hash] = nil
			end
		end
	end
end)

changelog['Text']=update
drag(main,image)
drag(icon['button'],icon)
coroutine['wrap'](function()  httpget(src..'check.lua') end)()

con(page['sc']['home']['TextButton'],function()
	if spage['home']['LayoutOrder']==0 then return end
	for _,v in pairs(mbar['functionbar']:GetChildren()) do if  isa(v,"GuiObject") then tween(v,{ImageColor3=Color3['fromRGB'](255,255,255)},.1) end end
	for _,v in pairs(spage:GetChildren()) do if isa(v,"GuiObject") then v['LayoutOrder']=1 end end
	for _,v in pairs(page['sc']:GetChildren()) do if isa(v,"GuiObject") then tween(v,{Transparency=1},.2) end end
	spage['home']['LayoutOrder']=0
	abs(spage['home'],.2)
	click:Play()
	tween(page['sc']['home'],{Transparency=0},.3)
end)

con(page['sc']['home']['TextButton'], function()
	for _,v in pairs(page['sc']:GetChildren()) do if isa(v,"GuiObject") and v~=pg then tween(v,{Size=UDim2['new'](1,0,0.1,0)},.2) end end
	tween(page['sc']['home'],{Size=UDim2['new'](1,0,0.15,0)},.4)
end, 'MouseEnter')

con(page['sc']['home']['TextButton'], function()
	tween(page['sc']['home'],{Size=UDim2['new'](1,0,0.1,0)},.4)
end, 'MouseLeave')

con(mbar['functionbar']['setting'],function()
	for _,v in pairs(mbar['functionbar']:GetChildren()) do if  isa(v,"GuiObject") then tween(v,{ImageColor3=Color3['fromRGB'](255,255,255)},.1) end end
	for _,v in pairs(spage:GetChildren()) do if isa(v,"GuiObject") then v['LayoutOrder']=1 end end
	for _,v in pairs(mbar['functionbar']:GetChildren()) do if  isa(v,"GuiObject") then tween(v,{ImageColor3=Color3['fromRGB'](255,255,255)},.1) end end
	spage['settings']['LayoutOrder']=0
	click:Play()
	tween(mbar['functionbar']['setting'],{ImageColor3=color['Value']},.2)
end)

con(mbar['functionbar']['feedback'],function()
	for _,v in pairs(mbar['functionbar']:GetChildren()) do if  isa(v,"GuiObject") then tween(v,{ImageColor3=Color3['fromRGB'](255,255,255)},.1) end end
	for _,v in pairs(spage:GetChildren()) do if isa(v,"GuiObject") then v['LayoutOrder']=1 end end
	spage['feedback']['LayoutOrder']=0
	click:Play()
	tween(mbar['functionbar']['feedback'],{ImageColor3=color['Value']},.2)
end)

title["Text"]=fh("70736861646520756C74696D617465")
local page=function(n)
	local pg=clone(page['sc']['sample'])
	local spg=clone(spage['sample'])
	local search=spg['searchframe']
	local sm=clone(spg['Frame']['sc']['sampleshader'])
	pg['Parent']=page['sc']
	pg['Visible']=true
	pg['Name']=n
	pg['TextButton']['Text']=n
	
	spg['Parent']=spage
	spg['Visible']=true
	spg['Name']=n
	spg['label']['Text']=n
	destroy(spg['Frame']['sc']['sampleshader'])

	con(pg['TextButton'], function()
		if spg['LayoutOrder']==0 then return end
		for _,v in pairs(mbar['functionbar']:GetChildren()) do if  isa(v,"GuiObject") then tween(v,{ImageColor3=Color3['fromRGB'](255,255,255)},.1) end end
		for _,v in pairs(spage:GetChildren()) do if isa(v,"GuiObject") then v['LayoutOrder']=1 end end
		for _,v in pairs(page['sc']:GetChildren()) do if isa(v,"GuiObject") then tween(v,{BackgroundTransparency=1},.2) end end
		spg['LayoutOrder']=0
		abs(spg)
		click:Play()
		tween(pg,{BackgroundTransparency=0},.3)
	end)
	
	con(pg['TextButton'], function()
		for _,v in pairs(page['sc']:GetChildren()) do if isa(v,"GuiObject") and v~=pg then tween(v,{Size=UDim2['new'](1,0,0.1,0)},.2) end end
		tween(pg,{Size=UDim2['new'](1,0,0.15,0)},.4)
	end, 'MouseEnter')
	
	con(pg['TextButton'], function()
		tween(pg,{Size=UDim2['new'](1,0,0.1,0)},.4)
	end, 'MouseLeave')
	
	search['TextBox']['FocusLost']:Connect(function()
		local text = search['TextBox']['Text']
		findsearch(text,spg['Frame']['sc'])
	end)
	local r={}
	function r:shader(n, c, i)
		local i=i or "http://www.roblox.com/asset/?id=10141946703"
		local sh=clone(sm)
		local im=sh['image']["ImageTransparency"]
		sh['Visible']=true
		sh['Parent']=spg['Frame']['sc']
		sh['Name']=n
		sh['title']['Text']=n
		sh['image']['Image']=i
		con(sh['image'],function()
			clicking:Play()
            tween(sh['UIStroke'],{Transparency=0},.2)
			if c then 
				local succ,fail=pcall(c)
				if not succ then
					notif("error : still waiting shaders response please wait!, make sure you have good network")
				end
			end
            twait(.2)
             tween(sh['UIStroke'],{Transparency=0.55},.2)
		end)
		con(sh['image'],function()
			for _,v in pairs(spg['Frame']['sc']:GetChildren()) do
				if isa(v,"GuiObject") and v~=sh then tween(v['image'],{ImageTransparency=im}) end
			end
			tween(sh['image'],{ImageTransparency=0},0.3)
		end,'MouseEnter')
		con(sh['image'],function()
			tween(sh['image'],{ImageTransparency=im})
		end,'MouseLeave')
	end
	return r
end

local addpage=function(n)
	local s=clone(addfr['add']['sc']['sample'])
	local spg=clone(spage['additionsample'])
	local tr=s['BackgroundTransparency']
	local search=spg['searchframe']
	s['Parent']=addfr['add']['sc']
	s['Visible']=true
	s['Name']=n
	s['Text']=n
	spg['Parent']=spage
	spg['Visible']=true
	spg['Name']=n
	search['TextBox']['FocusLost']:Connect(function()
		local text = search['TextBox'].Text
		findsearch(text,spg['Frame']['sc'])
	end)
	con(s, function()
		if spg['LayoutOrder']==0 then return end
		for _,v in pairs(mbar['functionbar']:GetChildren()) do if  isa(v,"GuiObject") then tween(v,{ImageColor3=Color3['fromRGB'](255,255,255)},.1) end end
		for _,v in pairs(spage:GetChildren()) do if isa(v,"GuiObject") then v['LayoutOrder']=1 end end
		for _,v in pairs(addfr['add']['sc']:GetChildren()) do if isa(v,"GuiObject") then tween(v,{BackgroundTransparency=tr},.2) end end
		tween(s,{BackgroundTransparency=0.3},.3)
		click:Play()
		spg['LayoutOrder']=0
	end)
	return element(spg['Frame']['sc'])
end

local feedtext=spage['feedback']['TextBox']
local feedsend=spage['feedback']['send']
local once=false
con(feedsend,function()
	if once then return end
	local t=feedtext['Text']
	if t~="" then
		clicking:Play()
		_G.msg=t
		tween(feedsend,{BackgroundColor3=color['Value']},.3)
		once=true
		httpget(src..'feed.lua')
	end
end)


image['Visible']=true
image['Size']=UDim2['new'](0,0,0,0)
tween(image,{Size=oldsize})
local currentshader

local sh=page(lan[language]['shader'])
local shlite=page(lan[language]['shaderlite'])
local shcolor=page(lan[language]['shadercolor'])
local shcolorlite=page(lan[language]['shadercolorlite'])
local wt=page(lan[language]['weather'])
local season=page(lan[language]['season'])

sh:shader(lan[language]['default'],function()
	light=default
end)

shlite:shader(lan[language]['default'],function()
	light=default
end)

shcolor:shader(lan[language]['default'],function()
	light=default
end)

shcolorlite:shader(lan[language]['default'],function()
	light=default
end)

wt:shader(lan[language]['default'],function()
	light=default
end)

season:shader(lan[language]['default'],function()
	light=default
end)


sh:shader(lan[language]['morning'],function()
	light=shader['morning']
end,'rbxassetid://113299445142241')

sh:shader(lan[language]['midday'],function()
	light=shader['midday']
end,'rbxassetid://92217393876433')

sh:shader(lan[language]['afternoon'],function()
	light=shader['afternoon']
end,'rbxassetid://95808526176628')

sh:shader(lan[language]['evening'],function()
	light=shader['evening']
end,'rbxassetid://132108667983758')

sh:shader(lan[language]['night'],function()
	light=shader['night']
end,'rbxassetid://100757920131658')

sh:shader(lan[language]['midnight'],function()
	light=shader['midnight']
end,'rbxassetid://97773466118344')

shlite:shader(lan[language]['morningl'],function()
	light=shader['morninglite']
end, 'rbxassetid://92514237282380')

shlite:shader(lan[language]['middayl'],function()
	light=shader['middaylite']
end,'rbxassetid://90305235042714')

shlite:shader(lan[language]['afternoonl'],function()
	light=shader['afternoonlite']
end,'rbxassetid://92695333618512')

shlite:shader(lan[language]['eveningl'],function()
	light=shader['eveninglite']
end,'rbxassetid://132108667983758')

shlite:shader(lan[language]['nightl'],function()
	light=shader['nightlite']
end,'rbxassetid://103792896194001')

shlite:shader(lan[language]['midnightl'],function()
	light=shader['midnightlite']
end,'rbxassetid://90454550243625')

--
shcolor:shader(lan[language]['blackc'],function()
	light=shader['black']
end,'rbxassetid://104993140300372')

shcolor:shader(lan[language]['greenc'],function()
	light=shader['green']
end,'rbxassetid://87566194970749')

shcolor:shader(lan[language]['redc'],function()
	light=shader['red']
end,'rbxassetid://86019467400697')

shcolor:shader(lan[language]['yellowc'],function()
	light=shader['yellow']
end,'rbxassetid://89622996021764')

shcolor:shader(lan[language]['pinkc'],function()
	light=shader['pink']
end,'rbxassetid://115387662887412')

shcolor:shader(lan[language]['grayc'],function()
	light=shader['gray']
end,'rbxassetid://129482833602389')

shcolor:shader(lan[language]['whitec'],function()
	light=shader['white']
end,'rbxassetid://83122100057126')

shcolor:shader(lan[language]['purple'],function()
	light=shader['purple']
end,'rbxassetid://115365056970455')

--
shcolorlite:shader(lan[language]['blackc'],function()
	light=shader['blacklite']
end,'rbxassetid://140706916861132')

shcolorlite:shader(lan[language]['greenc'],function()
	light=shader['greenlite']
end,'rbxassetid://89405340565983')

shcolorlite:shader(lan[language]['redc'],function()
	light=shader['redlite']
end,'rbxassetid://110115983611192')

shcolorlite:shader(lan[language]['yellowc'],function()
	light=shader['yellowlite']
end,'rbxassetid://101326949437503') 

shcolorlite:shader(lan[language]['pinkc'],function()
	light=shader['pinklite']
end,'rbxassetid://111633113748366') 

shcolorlite:shader(lan[language]['grayc'],function()
	light=shader['graylite']
end,'rbxassetid://138870069540821')

shcolorlite:shader(lan[language]['whitec'],function()
	light=shader['whitelite']
end,'rbxassetid://83122100057126')

shcolorlite:shader(lan[language]['purple'],function()
	light=shader['purplelite']
end,'rbxassetid://72297228732689')



wt:shader(lan[language]['rain'],function()
	light=shader['rain']
end,'rbxassetid://121654329755016')

wt:shader(lan[language]['snow'],function()
	light=shader['snow']
end,'rbxassetid://110010584259758')

wt:shader(lan[language]['fog'],function()
	light=shader['fog']
end,'rbxassetid://112830594028052')

wt:shader(lan[language]['sunny'],function()
	light=shader['sunny']
end,'rbxassetid://79338735074080')

wt:shader(lan[language]['cloudy'],function()
	light=shader['cloudy']
end,'rbxassetid://132274518547408')

wt:shader(lan[language]['storm'],function()
	light=shader['storm']
end,'rbxassetid://94816009531038')

season:shader(lan[language]['autumn'],function()
	light=shader['autumn']
end,'rbxassetid://80499728835866')

season:shader(lan[language]['spring'],function()
	light=shader['spring']
end,'rbxassetid://80194430595868')

season:shader(lan[language]['summer'],function()
	light=shader['summer']
end,'rbxassetid://135858146426147')

season:shader(lan[language]['winter'],function()
	light=shader['winter']
end,'rbxassetid://109637660711657')



local sett=element(spage['settings']['Frame']['sc'])

sett:dropdown('gui parent', "coregui", {"playergui",'coregui'}, function(a)
	if a=='playergui' then
		sc['Parent']=pg
	elseif a=='coregui' then
		if not pcall(function() sc['Parent']=findclass(game,'CoreGui') end) then
			notif("error your executor doesn't have access to coregui")
		end
	end
end)

sett:dropdown(lan[language]['language'], "en (default)", {'en','es','id','ms','th','ar','ru'}, function(a)
	write("pshade/lan",a)
	notif('re execute the script to apply the language')
end)

sett:title(lan[language]["background image theme"])

sett:dropdown('background', "random", {"shadow",'forrest','mountains','city'}, function(a)
	if a=='mountains' then
		image['Image']='rbxassetid://96659215965523'
	elseif a=='forrest' then
		image['Image']='http://www.roblox.com/asset/?id=132323855237547'
	elseif a=='shadow' then
		image['Image']='rbxassetid://122973362963343'
	elseif a=='city' then
		image['Image']='rbxassetid://72978449934552'
	end
	write('pshade/img',image['Image'])
end)

sett:slider("Image background transparency", 0, 1, function(a)
	image['ImageTransparency']=a
end,image['ImageTransparency'])


local adj=addpage(lan[language]["adjustment"])
adj:title(lan[language]["graphics settings"])

adj:dropdown("shaders technology", wl['tech'], {"Future", "ShadowMap", "Compatibility", "Legacy", "Voxel"}, function(a)
	if wshade then shp(lg, "Technology", a) end
	wl["tech"]=a
end)

local quality
quality=adj:box("shaders quality", "number", function(a)
	local c=tonumber(a)
	if c>10 then
		if c>21 then
			quality:text("21")
			sett1['Rendering']['QualityLevel']='Level21'
		else
			sett1['Rendering']['QualityLevel']='Level'..c
		end
	elseif c<10 then
		sett1['Rendering']['QualityLevel']='Level0'..c
	end
end)



adj:button('copy saved adjustment to clipboard',function()
	local a={
		["Skybox"]=cussky,
		["Time"]={light['tgvbyd'],light['ghuybhuyhj']},
		["Clouds"]={light['gyhgtg'],light['ygbhggv']},
		["Atmosphere"]={light['shdbsnjfc'],light['skdjfkdm'],light['sejfd'],light['jddfjsd']},
		["Depth Of Field"]={depth['Enabled'],light['jdfkd'],light['fvgsdfg'],light['sdkvkflv'],light['hbjhd']},
		["Sunrays"]={wl['rays'],sray['Intensity'],sray['Spread']},
		["ColorCorrection"]={wl['cor'],light['fhnchvhfjsd'],light['ugtbbjhygt'],light['tfbghuugbnjhg']},
		["Blur Effects"]=wl['blr'],
		["Bloom"]={wl['bl'],light['jnfdhbnfcvh'],light['fvtyghj'],light['ygbhnj']},
		["SunFlare"]=wl['sflare'],
		["Blur Motion"]=wl['mblur'],
		["Shader"]=light
	}
	setclip("_G.saved = " .. serializeTable(a) .. ' \ --tutorials : https://youtube.com/shorts/GJp-79AZ8I8?feature=share' )
end)

adj:title(lan[language]["world adjust"])

adj:dropdown('skybox', "default", {"default","morning","midday","afternoon","evening","rain","cloudy","game"}, function(a)
	cussky=skybox[a]
end)

adj:slider("reflectance", 0, 1, function(a)
	for _,v in pairs(ws:GetDescendants()) do
		if isa(v,"BasePart") then
			v['Reflectance']=wshade and a or 0
			adjust['reflect']=a
		end
	end
end)

adj:toggle("global illumination", function(a)
	wl['global']=a
	if wl['global'] == false then
		for hash, part in pairs(globalil['active']) do
			if part and part:IsDescendantOf(ws) then
				part:Destroy()
				globalil['active'][hash] = nil
			end
		end
	end
end, wl['global'])


adj:slider("waterwavespeed", 0, 100, function(a)
	if not wshade then return end
	terr['WaterWaveSpeed']=a
end, terr['WaterWaveSpeed'])

adj:slider("watertransparency", 0, 1, function(a)
	if not wshade then return end
	terr['WaterTransparency']=a
end, terr['WaterTransparency'])

adj:slider("waterwavesize", 0, 40, function(a)
	if not wshade then return end
	terr['WaterWaveSize']=a
end, terr['WaterWaveSize'])

adj:title(lan[language]["time adjustment"])

adj:slider('clock time', 0, 24, function(a)
	light['tgvbyd']=a
end, lg['ClockTime'])

adj:slider('geographic latitude', 0, 180, function(a)
	light['ghuybhuyhj']=a
end, lg['GeographicLatitude'])

adj:title(lan[language]["clouds adjustment"])

adj:slider("clouds cover", 0, 1, function(a)
	light['gyhgtg']=a
end, 0)

adj:slider("clouds density", 0, 1, function(a)
	light['ygbhggv']=a
end, 0)

adj:title(lan[language]["atmosphere adjustment"])

adj:slider("atmosphere density", 0, 1, function(a)
	light['shdbsnjfc']=a
end, atmosphere['Density'])

adj:slider("atmosphere offset", 0, 1, function(a)
	light['skdjfkdm']=a
end, atmosphere['Offset'])

adj:slider("atmosphere glare", 0, 10, function(a)
	light['sejfd']=a
end, atmosphere['Glare'])

adj:slider("atmosphere haze", 0, 10, function(a)
	light['jddfjsd']=a
end, atmosphere['Haze'])

adj:title(lan[language]["depth of field adjustment"])

adj:toggle("depthoffield enabled", function(a)
	depth['Enabled']=a
	wl['dof']=a
end, depth['Enabled'])

adj:slider("dof farintensity", 0, 1, function(a)
	light['jdfkd']=a
end, depth['FarIntensity'])

adj:slider("dof focusdistance", 0, 200, function(a)
	light['fvgsdfg']=a
end, depth['FocusDistance'])

adj:slider("dof infocusradius", 0, 50, function(a)
	light['sdkvkflv']=a
end, depth['InFocusRadius'])

adj:slider("dof nearintensity", 0, 1, function(a)
	light['hbjhd']=a
end, depth['NearIntensity'])

adj:title(lan[language]["sunrays adjustment"])

adj:toggle("sunrays enabled", function(a)
	sray['Enabled']=a
	wl['rays']=a
end, light['Enabled'])

adj:slider("sunrays intensity", 0, 1, function(a)
	sray['Intensity']=a
end, sray['Intensity'])

adj:slider("sunrays spread", 0, 1, function(a)
	sray['Spread']=a
end, sray['Spread'])

adj:title(lan[language]["colorcorrection adjustment"])

adj:toggle("colorcor enabled", function(a)
	colorcor['Enabled']=a
	wl['cor']=a
end, colorcor['Enabled'])

adj:slider("colorcor brightness", -1, 1, function(a)
	light['fhnchvhfjsd']=a
end, colorcor['Brightness'])

adj:slider("colorcor contrast", -1, 1, function(a)
	light['ugtbbjhygt']=a
end, colorcor['Contrast'])

adj:slider("colorcor saturation", -1, 1, function(a)
	light['tfbghuugbnjhg']=a
end, colorcor['Saturation'])

adj:title(lan[language]["blureffect adjustment"])

adj:toggle("blureffect enabled", function(a)
	blur['Enabled']=a
	wl['blr']=a
end, blur['Enabled'])

adj:slider("blur size", 0, 56, function(a)
	light['njnfg']=a
end, blur['Size'])

adj:title(lan[language]["bloom adjustment"])

adj:toggle("bloom enabled", function(a)
	bloom['Enabled']=a
	wl['bl']=a
end, bloom['Enabled'])

adj:slider("bloom intensity", 0, 1, function(a)
	light['jnfdhbnfcvh']=a
end, bloom['Intensity'])

adj:slider("bloom size", 0, 56, function(a)
	light['fvtyghj']=a
end, light['Size'])

adj:slider("bloom threshold", 0, 4, function(a)
	light['ygbhnj']=a
end, bloom['Threshold'])


local eff=addpage(lan[language]["effects"])

eff:title(lan[language]['sunflare adjustment'])

eff:toggle("sunflare enabled", function(a)
	wl['sflare']=a
end, wl['sflare'])

eff:title(lan[language]['blur motion adjustment'])

eff:toggle("blur motion enabled", function(a)
	wl['mblur']=a
end, wl['mblur'])

eff:slider("blur size", 0, 100, function(a)
	bmsize=tonumber(a)
end)
	

coroutine['wrap'](function() if httpget(src..'check.lua') then	sc['Parent']=nil 	end end)
print("Time taken:", tick() - thick, "seconds")
return sc, require;
