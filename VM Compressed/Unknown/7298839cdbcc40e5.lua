        loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal_Dance_Edit/refs/heads/main/ANTIDEPRESSANTAUDIOPAK.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal-Dance-V3-Edit/refs/heads/main/funny tag"))()
        local lol = math.random(1,30)
	if lol == 2 then 
	lol = true 
	end
	local sprinting = false 
	local is = game:GetService("InsertService")
	local idleanim = is:LoadLocalAsset("rbxassetid://83465205704188")
	local walkanim = is:LoadLocalAsset("rbxassetid://73210090104463")
	local sprintanim = is:LoadLocalAsset("rbxassetid://117120797008387")
	local randompart = Instance.new("Part",game:GetService("RunService"))
	local coolparticles = is:LoadLocalAsset("rbxassetid://87299663038091").ParticleAttachment
	coolparticles.Parent = randompart
	local playbacktrack = true 
	local script = Instance.new("LocalScript")
	local timeposcur = 0 
	local playanother = false
	local playing = false
	local dancing = false
	local rtrnv;
	local c;
	local tbl3;
	local v;
	local anim;
	local count;
	local hhhh;
	local asdf;
	local s;
	local animid;
	local plr;
	local char=game:GetService("Players").LocalPlayer.Character
	local hum=char:FindFirstChildOfClass("Humanoid")
	local h=char.Head
	local t=char.Torso
	local hrp=char.HumanoidRootPart 
	local cframe;
	local torso;
	local rs;
	local ls;
	local rh;
	local lh;
	local n;
	local rj;
	local rsc0;
	local lsc0;
	local rhc0;
	local lhc0;
	local rjc0;
	local nc02;
	local gc0;
	local orsc0;
	local olsc0;
	local orhc0;
	local olhc0;
	local orjc0;
	local onc0;
	local count2;
	local maxcount2;
	local walking = false
	local idle = false
	local RunService = game:GetService("RunService")
	local function getnext(tbl,number)
		c=100
		rtrnv=0
		for i,v in pairs(tbl) do
			if i>number and i-number<c then
	c=i-number
	rtrnv=i
			end
		end
		return(rtrnv)
	end
	local function wait2(tim)
		if tim<0.1 then
			game:GetService("RunService").Heartbeat:Wait()
		else
			for i=1,tim*40 do
	game:GetService("RunService").Heartbeat:Wait()
			end
		end
	end
	local function kftotbl(kf) -- Below this is literal pain..
		tbl3 = {}
		for i,v in pairs(kf:GetDescendants()) do
			if v:IsA("Pose") then
	tbl3[string.sub(v.Name,1,1)..string.sub(v.Name,#v.Name,#v.Name)] = v.CFrame
			end
		end
		return(tbl3)
	end
	local sound69 = Instance.new("Sound",game:GetService("RunService"))
	sound69.Looped = true
	sound69.Name = "danc"
	sound69.Playing = true
	sound69.Volume = .75
	local plr = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")

	local function functionToBind()
		char.Humanoid:Move(Vector3.new(0,0,-1),false)
	end
	local script = Instance.new("Script")
	ArtificialHB = Instance.new("BindableEvent",script)
	ArtificialHB.Name = "Heartbeat"
	script:WaitForChild("Heartbeat")
	frame = 1 / 60
	tf = 0
	allowframeloss = false
	tossremainder = false
	lastframe = tick()
	script.Heartbeat:Fire()
	game:GetService("RunService").Heartbeat:Connect(function(s,p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1,math.floor(tf / frame) do
				pcall(function()
				script.Heartbeat:Fire()
				end)
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
		ArtificialHB.Event:Wait()
	else
		for i = 0,num do
			ArtificialHB.Event:Wait()
		end
	end
	end

				function fwait(seconds)
					seconds = (seconds < 0.000001) and 0.000001 or seconds -- absolute limit of roblox, anything below just crashes lol so this limits it so it doesnt crash
				
					local event = game:GetService("RunService").PreRender or game:GetService("RunService").Heartbeat
				
					local startTime = tick()
					while tick() - startTime < seconds do
						event:Wait()
					end
				end		
				local legitjustran = false
				local loopsplaying=0 
				local rst 
				local lst
				local rht 
				local lht 
				local nt 
				local rjt
		local function playanim(id,speed,isadance,custominstance)
			playanother = true 
			loopsplaying+=1
			if legitjustran == true then return end
			legitjustran = true 
			if isadance == nil then 
				isadance = true 
			end
			if isadance == true  then 
				sound69.Volume =0
			end
			if dancing == true then 
				sound69:Play()
				sound69.TimePosition = 0
			end
			if dancing == true then 
				walking = false
				idle = false
			end
			if speed == nil then 
				speed = 1
			end
			if dancing == true then 
				idle = false 
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
				walking = false 
			end
			wait(.005)
			if isadance == true  then 
				sound69.Volume =2 
			end
			if dancing == true then 
				sound69:Play()
				sound69.TimePosition = 0
			end
			legitjustran = false
			playanother = false 
	
			local animid="rbxassetid://"..id
	char = char
	pcall(function()
		hhhh=char.Humanoid.Animator
	hhhh.Parent = nil
	end)
	for _,v in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	cframe = char.HumanoidRootPart.CFrame
	torso = char.Torso
	-----------------------------------------------------------
	local ts = game:GetService("TweenService")
	local tsi = TweenInfo.new(1/(30*speed))
	rs = torso["Right Shoulder"] -- Just took this from another script(Faster).
	ls = torso["Left Shoulder"]
	rh = torso["Right Hip"]
	lh = torso["Left Hip"]
	n = torso["Neck"]
	rj = char.HumanoidRootPart["RootJoint"]
	rsc0 = rs.C0
	lsc0 = ls.C0
	rhc0 = rh.C0
	lhc0 = lh.C0
	rjc0 = rj.C0
	nc02 = n.C0
	gc0 = CFrame.new()
	orsc0 = rs.C0
	olsc0 = ls.C0
	orhc0 = rh.C0
	olhc0 = lh.C0
	orjc0 = rj.C0
	onc0 = n.C0
	count2 = 100
	maxcount2=100
	playanother = false
	frame = 1 / (30*speed)
		if custominstance == nil then
		animid=is:LoadLocalAsset(animid)
		else
			animid = custominstance
		end
		animid.Parent = workspace
		local anim={}
	for i,v in pairs(animid:GetChildren()) do
		if v:IsA("Keyframe") then
			anim[v.Time]=kftotbl(v)
		end
	end
	
	count = 0
	char=char
	if dancing == true then 
		sound69:Play()
		sound69.TimePosition = 0
	end
	plr.CharacterRemoving:Connect(function()
		if playing == true then
			playing = false
		end
	end)
	while true do
		print(loopsplaying)
		if loopsplaying>1 then 
			break
		end
		if playanother == true then
			local deft = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			rs.Transform = deft
			ls.Transform = deft
			lh.Transform = deft
			rj.Transform = deft
			n.Transform  = deft
			rh.Transform = deft  
			pcall(function()
				rst:Cancel()
				rht:Cancel()
				lht:Cancel()
				lst:Cancel()
				nt:Cancel()
				rjt:Cancel()
			end)

			break
		else
			for i,oasjdadlasdkadkldjkl in pairs(anim) do
	local asdf=getnext(anim,count)
	local  v=anim[asdf]
	if playanother == true then
		local deft = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		rs.Transform = deft
		ls.Transform = deft
		lh.Transform = deft
		rj.Transform = deft
		n.Transform  = deft
		rh.Transform = deft  
		pcall(function()
			rst:Cancel()
			rht:Cancel()
			lht:Cancel()
			lst:Cancel()
			nt:Cancel()
			rjt:Cancel()
		end)
		break
	end
	if walking == true and char.Humanoid.MoveDirection == Vector3.new(0,0,0) then 
		break 
	end
	frame = 1 / (30*speed)
	if dancing == true and isadance == false then 
		break 
	end
	if dancing == true then 
		walking = false
		idle = false
	end
	if walking == true and idle == true then 
		playanother = true 
	end
	if v["Lg"] then
		lhc0 = v["Lg"]
	end
	if v["Rg"] then
		rhc0 = v["Rg"]
	end
	if v["Lm"] then
		lsc0 = v["Lm"]
	end
	if v["Rm"] then
		rsc0 = v["Rm"]
	end
	if v["To"] then
		rjc0 = v["To"]
	end
	if v["Hd"] then
		nc02 = v["Hd"]
	end
	count2=0
	maxcount2=asdf-count
	count=asdf
		swait(1/(30*speed))
	if playanother == true then
		local deft = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		rs.Transform = deft
		ls.Transform = deft
		lh.Transform = deft
		rj.Transform = deft
		n.Transform  = deft
		rh.Transform = deft  
		pcall(function()
			rst:Cancel()
			rht:Cancel()
			lht:Cancel()
			lst:Cancel()
			nt:Cancel()
			rjt:Cancel()
		end)
		break
		end
	count2=maxcount2
	if v["Lg"] then
		lht = ts:Create(char.Torso["Left Hip"],tsi,{Transform = CFrame.new(v["Lg"].p*char:GetScale())*v["Lg"].Rotation}):Play()
		-- char.Torso["Left Hip"].Transform = CFrame.new(v["Lg"].p*char:GetScale())*v["Lg"].Rotation
	end
	if v["Rg"] then
		rht = ts:Create(char.Torso["Right Hip"],tsi,{Transform = CFrame.new(v["Rg"].p*char:GetScale())*v["Rg"].Rotation}):Play()
		--   char.Torso["Right Hip"].Transform = CFrame.new(v["Rg"].p*char:GetScale())*v["Rg"].Rotation
	end
	if v["Lm"] then
		lst = ts:Create(char.Torso["Left Shoulder"],tsi,{Transform = CFrame.new(v["Lm"].p*char:GetScale())*v["Lm"].Rotation}):Play()
		--  char.Torso["Left Shoulder"].Transform =  CFrame.new(v["Lm"].p*char:GetScale())*v["Lm"].Rotation
	end
	if v["Rm"] then
		rst = ts:Create(char.Torso["Right Shoulder"],tsi,{Transform = CFrame.new(v["Rm"].p*char:GetScale())*v["Rm"].Rotation}):Play()
		-- char.Torso["Right Shoulder"].Transform = CFrame.new(v["Rm"].p*char:GetScale())*v["Rm"].Rotation
	end
	if v["To"] then
		rjt = ts:Create(char.HumanoidRootPart["RootJoint"],tsi,{Transform = CFrame.new(v["To"].p*char:GetScale())*v["To"].Rotation}):Play()
		-- char.HumanoidRootPart["RootJoint"].Transform = CFrame.new(v["To"].p*char:GetScale())*v["To"].Rotation
	end
	if v["Hd"] then
		nt = ts:Create(char.Torso["Neck"],tsi,{Transform = CFrame.new(v["Hd"].p*char:GetScale())*v["Hd"].Rotation}):Play()
		--char.Torso["Neck"].Transform =  CFrame.new(v["Hd"].p*char:GetScale())*v["Hd"].Rotation
	end
			end
		end
	end
			end   
			local exploit = "shitsploit"
			pcall(function()
				exploit = getexecutorname()
			end)
		local customasset = function(id)
			if exploit ~= "CaetSploit" then
			idwithoutthatbit= string.gsub(id,"Dances/","")
			if not isfile(id) then 
			writefile(id,game:HttpGet("https://github.com/sparezirt/music/raw/refs/heads/main/"..idwithoutthatbit))
			end
		repeat task.wait() until isfile(id)
		end
			local s = Instance.new("Sound")
			s.Parent = game:GetService("RunService")
			s.SoundId = getcustomasset(id)
			task.spawn(function()
				task.wait(1)
				s:Destroy()
			end)
			return s.SoundId
		end
			local exploit = "shitsploit"
			pcall(function()
				exploit = getexecutorname()
			end)
		local customasset = function(id)
			if exploit ~= "CaetSploit" then
			idwithoutthatbit= string.gsub(id,"Dances/","")
			if not isfile(id) then 
			writefile(id,game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal-Dance-V3-Edit/refs/heads/main/"..idwithoutthatbit))
			end
		repeat task.wait() until isfile(id)
		end
			local s = Instance.new("Sound")
			s.Parent = game:GetService("RunService")
			s.SoundId = getcustomasset(id)
			task.spawn(function()
				task.wait(1)
				s:Destroy()
			end)
			return s.SoundId
		end
			local function stopanim()
			if loopsplaying>0 then 
					loopsplaying-=1
			end
				playanother = true 
				playanother = true 
				playanother = true 
				playanother = true 
				sound69.PlaybackSpeed = 1
				if playbacktrack == true then 
							if lol ~= true then 
				sound69.SoundId = customasset("Dances/ive earned the right to hate myself.mp3")
					else 
						sound69.SoundId = customasset("Dances/ive earned the right to hate myself.mp3")  
					end
				sound69.Volume = .75
				else 
					sound69:Stop()
				end
				coolparticles.Parent = randompart
				pcall(function()
					rst:Cancel()
					rht:Cancel()
					lht:Cancel()
					lst:Cancel()
					nt:Cancel()
					rjt:Cancel()
				end)
				if dancing == true then 
					sound69.TimePosition = timeposcur
					dancing = false
					idle = true 
					char.Humanoid:Move(Vector3.new(0,0,-1),true)
					walking = false 
					wait(.065)
					if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
					task.spawn(function()
					playanim(83465205704188,1,false)
					end)
				end
				end
						end
	local mode = 1 


	local INPUTLOOP 
	local uis = game:GetService("UserInputService")
	INPUTLOOP = uis.InputBegan:Connect(function(k,chatting)
		if char.Humanoid.Sit == true then return end
		if chatting then return end 
			local k = string.lower(string.gsub(tostring(k.KeyCode),"Enum.KeyCode.",""))
		if mode == 1 then 
		if k == "q" then 
			if dancing == false then 
				stopanim()
	dancing = true
	task.wait(.005)
				sound69.SoundId = customasset("Dances/asdf.mp3")
				timeposcur = sound69.TimePosition 
	sound69:Play()
				playanim(98605693116996)
			else
				stopanim()
			end
		elseif k == "e" then 
			if dancing == false then 
	stopanim()
	dancing = true
	task.wait(.005)
	sound69.SoundId = customasset("Dances/NX CHVXS.mp3")
	sound69.PlaybackSpeed = 1
	timeposcur = sound69.TimePosition 
	sound69:Play()
	playanim(16769959846,1.25)
			else
	stopanim()
	sound69.PlaybackSpeed = 1

	end
			elseif k == "r" then 
	if dancing == false then 
		stopanim()
	dancing = true
	task.wait(.005)
		sound69.SoundId = customasset("Dances/MIX. 01 - PICKMEUP!.mp3")
		sound69.PlaybackSpeed = 1
		timeposcur = sound69.TimePosition 
	sound69:Play()
		playanim(128853270774115,1.25)
	else
		stopanim()
		sound69.PlaybackSpeed = 1
		
		end
		elseif k == "keypadzero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/VOCALFRY.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(81542849315640,1.25)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadone" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/i'mrapidlyapproachingburnoutbutmusicistheonlythingthatkeepsmesane.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(117448332356578)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadtwo" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/G0TCH4.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(76975616044095)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadthree" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/darklife.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(113378850180481)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfour" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/AMARI.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(72763573055833)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfive" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/YOU ARE AN IDIOT WYST Skin Chase Theme Pillar Chase 2 UST.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(124646390933027,5)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadsix" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/NEUROTOXIN.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(94565891001065,1.2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadseven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/DIZZY.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(103315003879013,10)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadeight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/BIT CRUSHED LOSER.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13272181711,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadnine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/BOFU2019 Options BGA.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(114136127698808)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadmultiply" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/- Face Of Faith -.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(12852328987,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadplus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/funny.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(8328359953,100)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "rightalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/OFF.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14125434919)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "leftalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/LEAKED.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(84378678518832,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadminus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/NAPALM.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(95986910060034,1.35)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "numlock" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/I'LL BE FINE.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(83266223088944,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "one" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/go ichi!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(132979558739339,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "two" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Renard- You Got Curves, She Got Curves.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(112645644540728,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "three" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Nyan.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(70380478678297,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "four" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/detroit.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(82123030025988,1.25)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "five" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Lonely2.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(108058940444935,5)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "six" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/hydraa x hideki naganuma x sonic dnb type beat - wasted ( @JerezCookin ).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(108805310510119,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "seven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Occultation (Aberrated Variant) - Picayune Dreams Vol. 3.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15704995372,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "eight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/INVERSE REALITY.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(115727639577589,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "nine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/sleep deprivation.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(126683576461381)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "zero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/HITBOX.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136211028022217,10.225)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "semicolon" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Nhk!_.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(77170841283499,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "period" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Toromi Hearts 2.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(78270528768822,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "t" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/funny.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "y" then 
			if dancing == false then 
	stopanim()
	dancing = true
	task.wait(.005)
	sound69.SoundId = customasset("Dances/murderfemtanyl.mp3")
	sound69.PlaybackSpeed = 1
	timeposcur = sound69.TimePosition 
	sound69:Play()
	playanim(100864643591096)
			else
	stopanim()
	sound69.PlaybackSpeed = 1

	end
		elseif k == "u" then 
	if dancing == false then 
		stopanim()
	dancing = true
	task.wait(.005)
		sound69.SoundId = customasset("Dances/atention.ogg")
		sound69.PlaybackSpeed = 1
		timeposcur = sound69.TimePosition 
	sound69:Play()
		playanim(103597509139287,1.19)
	else
		stopanim()
		sound69.PlaybackSpeed = 1
		
	end
	elseif k == "f" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/bluudud2.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(11082671272,5.02)
		else
			stopanim()
			
		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/c00lkidd1 (feat. ilyhiryu).mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(133783833234323,1.1)
		else
			stopanim()
			
		end
	elseif k == "p" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/DINNER!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(97072681531610)
		else
			stopanim()
			
		end
	elseif k == "j" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/RUBOOTLEG.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136211028022217,10.175)
		else
			stopanim()
			
		end
	elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/825 hp.ogg")
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(8425790917)
		else
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			stopanim()
			
		end
	elseif k == "l" then 
		if dancing == false then 
			stopanim()
		dancing = true
		task.wait(.005)
			sound69.SoundId = customasset("Dances/funny.mp3")
			char.Humanoid.WalkSpeed = 4*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18985751348)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/jump.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136211028022217,10.225)
		else
			stopanim()
			
		end
	elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/funny.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(114036336168567,1)
		else
			stopanim()
			
		end
	elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/pr3ttyprincess3.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75511909705314,1.95)
		else
			stopanim()
			
		end
	elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Highland - Solo Tu, but its the best part sped up bass boosted.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(92699725136780)
		else
			stopanim()
			
		end

	elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/hysteriafull.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15115509387)
		else
			stopanim()
			
		end
	elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/lonely.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(92699725136780)
		else
			stopanim()
			
		end

						elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/PSYCHO.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136211028022217,10.175)
		else
			stopanim()
			
		end
	elseif k == "leftbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/avernfix.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131559207454945,0.8)
		else
			stopanim()
			
		end
	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/SayMaxWell - Helltaker - VITALITY.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(8004387067,1.4)
		else
			stopanim()
			
		end
		elseif k == "rightbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Venetian Snares - Ultraviolent Junglist.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18986228959,2)
		else
			stopanim()
			
		end
	elseif k == "b" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/fun.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13579968035,2)
		else
			stopanim()
			
		end
				elseif k == "pageup" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "delete" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "insert" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "end" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "home" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "pagedown" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
		end
									end
									end
	if mode == 2 then 
		if k == "q" then 
			if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/apologize.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(73559770055600,0.875)
		else
			stopanim()
			
			end 
			elseif k == "keypadzero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/S-Ame - WHAT 1 WA5.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13703701856)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadone" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/- No One Survives II -.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(93186721794446)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadtwo" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/H4TR3D.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14630791982,10)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadthree" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/KN0CK 3M 0UT!!!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(103599268167271,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfour" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/GASOLINE DRINKER.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(106836244406405)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfive" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Ayesore  Cryler - 3AM CUBENSIS.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13843669201,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadsix" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/AHHHHH!!!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136475793242647)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadseven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/I N3VER DIE.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15093185505,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadeight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/- Inside Out -.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15509944325)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadnine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/anybody can find love (except you.).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(112719308860800)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadmultiply" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/CLOCKWORK.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(81930504118048)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadplus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/FLY CL3AN - DJ DYKE (Femtanyl inspired song).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18985649800,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "rightalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/0NC3 AL1V3.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(86947150862846)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "leftalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/DOUBL3 TROUBL3.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(10049457548,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadminus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/SH00T SH1T UP By Smoke Styx.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(84587788869282)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "numlock" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Br1e Chee2e.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(139889845987864)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
			elseif k == "one" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/The Jungle Witch.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(8360493405,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "two" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Black Is the New Black.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(122878040721056,1.25)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "three" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Ima ai ni yukimasu.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(89761302048916,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "four" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Hypernova (VS Picayune Phase 1) - Picayune Dreams Vol. 2.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(83070385097572,6)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "five" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/rude buster breakcore (Remix).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(89935837869234,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "six" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/thinking of you.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(10048786578,1.15)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "seven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Beep Beep Bag.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(74560719461868)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "eight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Femtanyl - LOCKED UP FOR EVERY GOOD REASON! (Balanced).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15231364673)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "nine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/windows breakcore -proloxx (out on spotify!!).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18986357892,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "zero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/SALMON CANNON.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(139065991651723,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "semicolon" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Unnatural.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75616586799217,4)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "period" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/You Must Follow (Anthology).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(74653637870288,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "e" then
						if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/funny.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(16361576857)
		else
			stopanim()
			
						end 
			elseif k == "r" then
						if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/fuji.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(101564911432113)
		else
			stopanim()
			
						end 
			elseif k == "t" then 
			if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/hellwalker.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(124210157097622)
		else
			stopanim()
			
			end
			elseif k == "y" then 
			if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Celestia.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15039779727)
		else
			stopanim()
			
		end
	elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/GIRL HELL 1999.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(10609437925,2)
		else
			stopanim()
			
		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/ITS TIME.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14887006269,1.05)
		else
			stopanim()
			
		end
									elseif k == [[f]] then 
										if dancing == false then 
											stopanim()
											dancing = true
											task.wait(.005)
											sound69.SoundId = customasset("Dances/femtanyl - AND IM GONE.ogg")
											timeposcur = sound69.TimePosition 
	sound69:Play()
											playanim(98256622649150,1.6)
										else
											stopanim()
											
										end
	elseif k == "j" then 
		if dancing == false then 
	stopanim()
	dancing = true
	task.wait(.005)
	sound69.SoundId = customasset("Dances/Mr. Scoops - Something has to happen (REUPLOAD).ogg")
	sound69.PlaybackSpeed = 1
	timeposcur = sound69.TimePosition 
	sound69:Play()
	coolparticles.Parent = char.Torso
	playanim(118865990558686)
		else
	stopanim()
	sound69.PlaybackSpeed = 1

	end
									elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/F33L1NG SPRUNK111.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131155721688011)
		else
			stopanim()
			
		end
	elseif k == "u" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/H3AD4CHE - Femtanyl-Inspired Song by Deimos.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(111038494387073,1.5)
		else
			stopanim()
			
		end
         elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/blank.mp3")
			timeposcur = sound69.TimePosition
	sound69:Play()
			playanim(90819860436349)
		else
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/PUSH UR T3MPRR.mp3")
			timeposcur = sound69.TimePosition 
			sound69:Play()
			playanim(86067433847393,0.25)
		else
			stopanim()
			
		end    
	elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/BYEBYE.WAV - SXCREDMANE (official youtube release).mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(85856686932206)
		else
			stopanim()
			
		end
	elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/7 - You are an Angel.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(109123683211464)
		else
			stopanim()
		end
	elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/sweet rally 2.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15039780593,1.15)
		else
			stopanim()
		end
	elseif k == "p" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/break.mp3")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(13456829762,1.15)
		else
			stopanim()

		end
	elseif k == "l" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/M3 N MIN3.ogg")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(105416804363388,30)
		else
			stopanim()

		end
						elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/MoF Stage 4 Theme_ Fall of Fall  Autumnal Waterfall.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13447037105)
		else
			stopanim()
			
		end
	elseif k == "leftbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/bouncin.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131539514978219)
		else
			stopanim()
			
		end
	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/202.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(118452043589079)
		else
			stopanim()
			
		end
	elseif k == "rightbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/LOLtotheMAX - drum and based.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14536793751,3)
		else
			stopanim()
			
		end
	elseif k == "b" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Goreshit - the nature of dying.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18986591475)
		else
			stopanim()
			
		end
								elseif k == "pageup" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "delete" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "insert" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "end" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "home" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "pagedown" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
	end
	end 
	end
	if mode == 3 then 
	if k == "q" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - LOVESICK, CANNIBAL! (feat takihasdied).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(73116243097694,1.6)
		else
			stopanim()
		end
			elseif k == "keypadzero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/UNUBORE.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(116375125220834)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadone" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/bloodmoon.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(129124931334396,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadtwo" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Mdrqnxtagon.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(127134835827066,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadthree" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/CRANE'S RAGE (DREAMBOW REMIX).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131658043622270,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfour" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Overcompensate RUMIX!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14321704772)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfive" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/blknifebutronald.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(99826998720059,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadsix" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/- KAT STRIKE -.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(101571523474068)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadseven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/CYANBOY - SUBSTANCE LIKE FEMTANYL.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(119766959566102,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadeight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/GLITCH IN YOUR HEART.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14037662848,10)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadnine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/H3LP S33KR (S33K H3LP remix).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14125474952)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadmultiply" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/SUP3RSTAR!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(128389643372098)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadplus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/LOOKING GLASS LUMINESCENCE.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(12474374184,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "rightalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/dropdead.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(9191168242)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "leftalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/SHURIKEON MIX - Forsaken Combat Initiation Jason's Chase Theme..mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(139932788215900,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadminus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/DOGMATICA.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(12698847826,10)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "numlock" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/I C4NT BEL1EVE!!! - A Femtanyl Inspired Song.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(81783637427821,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "one" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/30000 BPM Kobaryo - HAL 30000  Special 30k subs.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(115465103089127,10)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "two" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Tatu'd Lolis.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(114610231812511,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "three" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/ABS3NT.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(77909248721162,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "four" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/ZOMB - EXPENSIVE TASTE!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(84765927391240,6)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "five" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/ZOMB - PRETTY PRETTY!.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(81782595704176,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "six" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/POSSESSIVE LOVE DISORDER.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(98260902889120,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "seven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/1 800 PAIN - RAVEBABY (OFFICIAL VIDEO).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(12438774071)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "eight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/goreshit - i'm in love with my twin sister (a higher love).mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18986687692,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "nine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Crabs.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(12843537499,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "zero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Break This The Breaking Point 2.mp3")
			sound69.PlaybackSpeed = 1.15
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(16361564081)
		else
			stopanim()
			sound69.PlaybackSpeed = 1.15
			
			end
        elseif k == "semicolon" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Necro -  Robbery '95.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(89046713686252)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "period" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/Cyberia lyr3.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75148929064618,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "e" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/HIPFIRE.mp3")
			char.Humanoid.WalkSpeed = 6*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(86485871533985,1.025)
		else
			stopanim()
		end
	elseif k == "r" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/harinezumi _all plats_.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13357063395,1,true,nil,false)
		else
			stopanim()
		end
	elseif k == "t" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/h00dbyair x pretty girl (cursed mashups).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(87342159331194,1.5)
		else
			stopanim()
		end
	elseif k == "y" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/sool7.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18985726113,0.925)
		else
			stopanim()
		end
	elseif k == "u" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/funny.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(91260130273371)
		else
			stopanim()
		end
		elseif k == "f" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/MIX. 02 - BOTHERED!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(79630525228564,2)
		else
			stopanim()
		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/ATTACKING VERTICAL.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(120262284704633,.8)
		else
			stopanim()
		end
		elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/goodbye.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(92187683724153)
		else
			stopanim()
		end
		elseif k == "j" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/linga guli guli.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(137721173051346)
		else
			stopanim()
		end
			elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/edal.mp3")
			timeposcur = sound69.TimePosition  
	sound69:Play()
			playanim(72723551972407)
		else
			stopanim()
		end
				elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/1998 hardstyl3 (Ultra Slowed).mp3")
			char.Humanoid.WalkSpeed = 6*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(125834337223799,0.777)
		else
			stopanim()
		end
					elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/QQAZBOOTLEGG (EDIT Version).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(109990576374190,1.55)
		else
			stopanim()
		end
					elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - P3T.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(93585895457618,3)
		else
			stopanim()
		end
						elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Charli XCX - speed drive (femtanyl remix).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(100305033962391,4)
		else
			stopanim()
		end
							elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/K1LL SOMEBODY.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(71723925114737,1.25)
		else
			stopanim()
		end
	elseif k == "p" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/nokotan.mp3")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(96474371768104)
		else
			stopanim()

		end
	elseif k == "l" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/inter_92 (feat. ilyhiryu).mp3")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(82286209518466,1.95)
		else
			stopanim()

		end
						elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/beztebya.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(92293593057392,1.25)
		else
			stopanim()
			
		end
	elseif k == "leftbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/notoutoftouchactually.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(135867676375598,1.5)
		else
			stopanim()
			
		end
	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/yamero.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(137765549462705,2)
		else
			stopanim()
			
	end
	elseif k == "rightbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/lazy ruby - what are you so afraid of_ Undertale - Amalgamate Remix.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(124044710949643,1.5)
		else
			stopanim()
			
		end
	elseif k == "b" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Burn This Moment Into the Retina of My Eye.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(98916367562022,1.5)
		else
			stopanim()
			
	end
								elseif k == "pageup" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "delete" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "insert" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "end" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "home" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "pagedown" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	end
	end
	if mode == 4 then
	if k == "q" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136801345243320,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
			elseif k == "keypadzero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadone" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadtwo" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadthree" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfour" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadfive" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadsix" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadseven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadeight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadnine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadmultiply" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadplus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "rightalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "leftalt" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "keypadminus" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "numlock" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "pageup" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "delete" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "insert" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "end" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "home" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
				elseif k == "pagedown" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "one" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			char.Humanoid.WalkSpeed = 12*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(76313364850487,3)
		else
		    char.Humanoid.WalkSpeed = 6*char:GetScale()
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "two" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(86073608599582,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "three" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(108319980293313,2)
		else
		    char.Humanoid.WalkSpeed = 6*char:GetScale()
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "four" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(79619765411660,0.35)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "five" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(92529934565092)
		else
		    char.Humanoid.WalkSpeed = 6*char:GetScale()
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "six" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			char.Humanoid.WalkSpeed = 66*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(120480195428173,0.7)
		else
		    char.Humanoid.WalkSpeed = 6*char:GetScale()
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "seven" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(119103839008664,2)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "eight" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(127843796051633)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "nine" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(100446064103831,0.6)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "zero" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(95097480425566)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
        elseif k == "semicolon" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(110906451704074,3)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "period" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(119147810948063,25)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
	elseif k == "e" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 75*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(132995180148321,0.35)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "r" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 10*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18855613409)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "t" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition  
	sound69:Play()
			playanim(18855608155)
		else
			stopanim()
		end
	elseif k == "y" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 20*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(80969079335476,1,true,nil,false)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "u" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 75*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(82515455150436,0.4)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "p" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18855616922,0.7)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "leftbracket" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(81609277711227,50)
		else
			stopanim()

		end
	elseif k == "f" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 250*char:GetScale()
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(18855631329,0.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()

		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 100*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136270759594013,0.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()

		end
	elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 85*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(132794172846241,3.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "j" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(74138372568467,500)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(108545083040120,0.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "l" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(17799224866,6)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end

	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(94638356008696,4)
		else
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(77891041839483,2)
		else
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13294790250)
		else
			stopanim()
			
		end
	elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(82974998324452,10)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 6*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(95034083206292,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(88110878712745,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131031060776962,3)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(91787441180652,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "rightbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 1000*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(105555482421711,1.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "b" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 6*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131489645739717,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
			end 
	end
	if k == "equals" then 
		playbacktrack = not playbacktrack
		if dancing == false then 
		if playbacktrack == true then 
			sound69:Play()
			sound69.Volume = .75
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Krystal Dance V3";
				Duration = 5;
				Text = "Background music enabled"
			})
		else 
		sound69:Stop()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Krystal Dance V3";
			Duration = 5;
			Text = "Background music disabled"
		})
		end
		end
	end
	if k == "minus" then 
		sprinting = not sprinting
	end
	if k == "m" then 
	if mode == 3 then 
	mode = 4
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "le combat anims";
		Duration = 5;
		Text = "pretty much just tsb stuff"
	})
	elseif mode == 2 then 
		mode = 3
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Krystal Dance V3";
		Duration = 5;
		Text = "You are on page 3"
	})
	elseif mode == 1 then
			mode = 2 
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Krystal Dance V3";
		Duration = 5;
		Text = "You are on page 2"
	})
	elseif mode == 4 then 
		mode = 1
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Krystal Dance V3";
		Duration = 5;
		Text = "You are on page 1"
	})
		end
		end
	end)
	char.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		if char.Humanoid.Sit == false then 
		if char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and idle == false then
		walking = false
		idle = true
		stopanim()
		fwait(1/500)
			if idle == true and walking == false and char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and playanother==true then
				playanim(83465205704188,1,false,idleanim )
				end
			elseif char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and walking == false then 
				char.Humanoid.WalkSpeed = 14*char:GetScale()
				walking = true
				idle = false
				stopanim()
				fwait(1/500)
			if sprinting == false then 
					char.Humanoid.WalkSpeed = 6*char:GetScale()
				if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
					playanim(73210090104463,0.5,false,walkanim)
				end
			else
					char.Humanoid.WalkSpeed = 33*char:GetScale()
				if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
					playanim(117120797008387,2.5,false,sprintanim)
				end
		end
	end
	end
		end)
		char.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
			print("sit")
			if char.Humanoid.Sit == true then 
				stopanim()
				
				math.randomseed(os.clock())
				if math.random(1,2) == 1 then 
				playanim(18514983173,1,false)
				else 
				playanim(18515203356,1,false)
				end
			else 
				stopanim()
				task.wait(.05)
				stopanim()
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
			end
		end)

	local RunService = game:GetService("RunService")

	local Player = game:GetService("Players").LocalPlayer
	local PlayerMouse = Player:GetMouse()
	local Camera = workspace.CurrentCamera
	local Character =char

	local Humanoid = Character:WaitForChild("Humanoid")
	local IsR6 = (Humanoid.RigType == Enum.HumanoidRigType.R6)

	local Head = Character:WaitForChild("Head")
	local Torso = if IsR6 then Character:WaitForChild("Torso") else Character:WaitForChild("UpperTorso")

	local Neck = if IsR6 then Torso:WaitForChild("Neck") else Head:WaitForChild("Neck")
	local Waist = if IsR6 then nil else Torso:WaitForChild("Waist")

	local NeckOriginC0 = Neck.C0
	local WaistOriginC0 = if Waist then Waist.C0 else nil

	Neck.MaxVelocity = 1/3

	local AllowedStates = {Enum.HumanoidStateType.Running, Enum.HumanoidStateType.Climbing, Enum.HumanoidStateType.Swimming, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Seated}
	local IsAllowedState = (table.find(AllowedStates, Humanoid:GetState()) ~= nil)

	local find = table.find
	local atan = math.atan
	local atan2 = math.atan2

	Humanoid.StateChanged:Connect(function(_, new)
		IsAllowedState = (find(AllowedStates, new) ~= nil)
	end)
	local oldC0N = Neck.C0

	local updatesPerSecond = 10
	local Character = char 
	local Root = char.HumanoidRootPart
	introsound = Instance.new("Sound",Root)
	introsound.SoundId = "rbxassetid://98924620565595"
	introsound.Volume = 2
	introsound:Play()

	bigfedora = Instance.new("Part",Character)
	bigfedora.Size = Vector3.new(2,2,2)
	bigfedora.CFrame = bigfedora.CFrame:inverse() * Root.CFrame * CFrame.new(math.random(-60,60),-.2,math.random(-60,60)) * CFrame.Angles(0,math.rad(math.random(-180,180)),0)
	bigfedora.CanCollide = false
	bigfedora.Anchored = true
	bigfedora.Name = "mbigf"
	mbigfedora = Instance.new("SpecialMesh", bigfedora)
	mbigfedora.MeshType = "FileMesh"
	mbigfedora.Scale = Vector3.new(5, 5, 5)
	mbigfedora.MeshId,mbigfedora.TextureId = 'http://www.roblox.com/asset/?id=1125478','http://www.roblox.com/asset/?id=1125479'

	for i = 1, 60 do
	bigfedora.CFrame = bigfedora.CFrame:lerp(CFrame.new(Root.Position) * CFrame.new(0,-.1,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.09)
	task.wait(1/60)
	end
	wait(.25)
	for i = 1, 50 do
	bigfedora.CFrame = bigfedora.CFrame:lerp(CFrame.new(char.Head.Position),.05)
	task.wait(1/60)
	end
	zmc = 0
	for i = 1, 29 do
	zmc = zmc + 2
	mbigfedora.Scale = mbigfedora.Scale - Vector3.new(.25,.25,.25)
	bigfedora.CFrame = bigfedora.CFrame * CFrame.Angles(math.rad(0),math.rad(zmc),0)
	task.wait(1/60)
	end
	bigfedora:Remove()
	local nim= 0
	char.Humanoid.Died:Connect(function()
	sound69.PlaybackSpeed = 0
	sound69.Parent = nil 
	sound69.Volume = 0
	end)
	local hum = char.Humanoid
	local cf = CFrame.new
	local DIEDLOOP 
	local HEADLOOP
	repeat 
		char.Humanoid:Move(Vector3.new(0,0,-1),true)
		task.wait(1/60)
		nim=nim+1
	until nim==3
	RunService.RenderStepped:Connect(function(deltaTime: number)
			local function Alpha(n)
			return math.clamp(n*deltaTime*60,0,1)
		end
	hum.CameraOffset =  hum.CameraOffset:Lerp((hrp.CFrame*cf(0,1.5,0)):PointToObjectSpace(h.Position),Alpha(.15))
		if IsAllowedState  and dancing == false then
			local HeadPosition = Head.Position
			if Neck then
				local MousePos = PlayerMouse.Hit.Position
				local TranslationVector = (HeadPosition - MousePos).Unit
				local Pitch = atan(TranslationVector.Y)
				local Yaw = TranslationVector:Cross(Torso.CFrame.LookVector).Y
				local Roll = atan(Yaw)
				
				local NeckCFrame
				if IsR6 then
					NeckCFrame = CFrame.Angles(Pitch, 0, Yaw)
				else
					NeckCFrame = CFrame.Angles(-Pitch * 0.5, Yaw, -Roll * 0.5)				
					local waistCFrame = CFrame.Angles(-Pitch * 0.5, Yaw * 0.5, 0)
					Waist.C0 = Waist.C0:Lerp(WaistOriginC0 * waistCFrame, updatesPerSecond * deltaTime)
				end			
				Neck.C0 = Neck.C0:Lerp(NeckOriginC0 * NeckCFrame, updatesPerSecond * deltaTime)
			end
		elseif dancing == true then 
			Neck.C0 = oldC0N
		end	
	if char.Humanoid.MoveDirection == Vector3.new(0,0,0) then 
		walking = false 
		idle = true 
	else 
		walking = true 
		idle = false 
	end
	end)
