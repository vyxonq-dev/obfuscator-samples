local Place = game.placeId
if Place == 17574618959 then
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
end
if not isfile("Dances/Sphere.mp3") then
	writefile("Dances/Sphere.mp3",
	     game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Sphere.mp3?raw=true"))
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/main/MobileKeyboard.txt'))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/9274837292748/aawdadadadada/refs/heads/main/kasck"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Reanimate.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AstraOutlight/my-scripts/refs/heads/main/namertag"))()
    game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 5;
	Text = "This Script Was Made By Hemi(original creator), Modified By Paradigm/Theo"
})
task.wait(6.005)
if not getgenv()["Animator"] then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end
task.wait(2.750)
local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if not character then return end
    -- Play animation
    local Intro = Animator.new(character, 92181805385450)
    Intro:Play()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
task.wait(1.950)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 14
Intro:Stop()



-- Made By Hemi(Es Um Janki)
-- Modded By Theo(Theo_TheoBenzo,アウタースペース・テオ )
if not isfolder("Dances")then 
makefolder("Dances")
     end
--local Idle = Anim(UUUUUU, 124935083750779)
local is = game:GetService("InsertService")
local idleanim = game:GetObjects("rbxassetid://111486572129102")[1]
local walkanim = game:GetObjects("rbxassetid://82396468395739")[1]
local AllowOverheadText = true 
local set = false
local randompart = Instance.new("Part",game:GetService("RunService"))
local coolparticles = is:LoadLocalAsset("rbxassetid://87299663038091").ParticleAttachment
coolparticles.Parent = randompart
local sprintanim = is:LoadLocalAsset("rbxassetid://121272703640067")
local sprinting = false 
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
if AllowOverheadText == true then
local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local workspace = game:GetService("Workspace")
    local SG = Instance.new("ScreenGui")
    SG.Parent = player:WaitForChild("PlayerGui")
local CaptionStroke = Instance.new("UIStroke")
local Caption = Instance.new("TextLabel")
local G = Color3.fromRGB(100, 100, 100)
local A = Color3.fromRGB(255,255,255)
local W = Color3.fromRGB(255, 255, 255)
local H = ColorSequence.new{
    ColorSequenceKeypoint.new(0, A),
    ColorSequenceKeypoint.new(0.500, G),
    ColorSequenceKeypoint.new(1, W)
}


local Text2 = Instance.new("UIStroke")
local Text3 = Instance.new("UIStroke")
local Yu = Instance.new("UIStroke")
local C = Instance.new("UIGradient")
local CaptionGradient = Instance.new("UIGradient")
local G = Instance.new("UIGradient")
local Rq = Instance.new("UIGradient")
local billboard2 = Instance.new("BillboardGui")
        billboard2.Name = "Test"
        billboard2.Size = UDim2.new(0, 100, 0, 40)
        billboard2.StudsOffset = Vector3.new(0, 5, 0)
        billboard2.Adornee = player.Character.Head
        billboard2.AlwaysOnTop = true
        billboard2.MaxDistance = 25
        billboard2.Parent = player.Character.Head
    local Q = Instance.new("TextLabel")
    Q.Text = "─V3─"
    Q.Font = Enum.Font.Sarpanch
    Q.TextSize = 30
    Q.TextColor3 = Color3.fromRGB(0, 0, 0)
    Q.BackgroundTransparency = 1
    Q.Parent = billboard2
    Q.Position = UDim2.new(0.5, -50, 1, -15) 
    Q.Size = UDim2.new(1, 0, 1, 0)
    Q.Rotation = 0
Text2.Thickness = 1
Text2.Color = Color3.fromRGB(255,255,255)
Text2.Parent = Q
Text2.LineJoinMode = Enum.LineJoinMode.Miter
Rq.Parent = Text2
Rq.Color = H
Rq.Name = "Test3"
Rq.Enabled = true 
Rq.Rotation = 85
Rq.Offset = Vector2.new(-1,0)
local textLabel1 = Instance.new("TextLabel")
textLabel1.Text = "─「 KRYSTAL DANCE 」─"
textLabel1.Font = Enum.Font.Sarpanch
textLabel1.TextSize = 50
textLabel1.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabel1.BackgroundTransparency = 100
textLabel1.Parent = billboard2
textLabel1.Size = UDim2.new(1, 0, 1, 0)
textLabel1.Rotation = 0
Text3.Thickness = 1
Text3.Color = Color3.fromRGB(255,255,255)
Text3.Parent = textLabel1
Text3.LineJoinMode = Enum.LineJoinMode.Miter
C.Parent = Text3
C.Color = H
C.Name = "Test2"
C.Enabled = true 
C.Rotation = 85
C.Offset = Vector2.new(0,0)
end
-- Put Your Captions Here if you want!!!!!
-- Pls The Captions Must Be Specific According To Yhe Dance...
-- First Page vvvvvvv
local Intro = "What is this feeling?"
local Rat = "i Feel Rat-ish"
local Boogie = "Boogie!"
local Assumptions = "Summer!"
local BJ = "He-He!!"
local Egypt = "Egypt!"
local CaramellDansen = "Dance on my ball-"
local Fein = "Fein Fein!"
local Stock = "Moves Like A Stock Images!"
local Gangnam = "Opa Gangnam Style!"
local HappyWalk = "Just Walkin Here!!!"
local Uhh = "Is This Supposed To Be A Vibe?"
local Griddy = "Hit The Griddy Move"
local Kazotsky = "I like this, TF2 Reference!!!"
local Bumblebee = "Sweet Little Bumblebee!!"
local Mesmerizer = "Im Mesmerized"
local Domino = "Im A Domino!!"
local ShubaDuck = "Shuba Duck!"
local Crank = "Crank it!"
local KeepUp = "Im Too Fast"
local Yamero = "Ayo Wtf"
local LeftRight = "Thats Left Right Left Right Go!"
local SmoothMoves = "I Have Smooth Moves!"
local Lemon = "Want Some?"
--First Page^^^^^^^^
-- Second Pagevvvvvv
local Unlockit = "Hit The Nostalgia"
local InternetAngel = "Am I An Angel?"
local DoodlePoint = "Yeah! Point At Them!!!"
local MioHonda = "ただ音楽を楽しんでください！"
local Smuggin = "Is This A Hat Kid Reference?"
local DoTheFlop = "Everybody Do The Flop!"
local PP = "Wtf Is This?"
local Tripaloski = "Three Stripes!"
local Hakari = "Did i Hit The Jackpot?"
local Peashooterr = "Me When In Serious Situations:"
local Bloodpop = "Come Vibe With Me"
local HeavyLove = "Heavy Love!!!"
local Lay = "Can I check"
local Clubbin = "Welcome To Club Penguin"
local ItBurns = "AH MY MOUTH IS BURNING!!!!!"
local Headlock = "Hm"
local Runaway = "I Wanna Run Away🤑"
local AssumptionsV2 = "Hit Them With The Summer Shuffle!"
local Boombox = "Deploy The Boombox!"
local Distraction = "Great For Distracting Enemies!"
local Liar ="Im A Liar!"
local Million = "I Want A Million"
-- Second Page^^^^^^^^
-- Third Pagevvvvvvv
local Firework ="Firework"
local Monster = "Im A Monster"
local Neon = "Reach The Skies!"
local Apex = "Ugh..."
local Crazy = "Im Not Crazy Right?"
local Lightbringer = "I Shall Bring The Light Itself"
local Pixelation = "Ive Been Pixelated..."
local Memory = "I Have Been Forgotten..."
local C14 = "Hm"
local LoveForU = "Heres Some Love!"
local Billy = "Ill Make You Say How Proud You Are!"
local Jevil = "I Can Do Anything!"
local Goat = "Dance If Your a Goat!"
local Static = "Im Static..."
local Heel = "Im Hopping!!!"
local SlickBack = "Slickback!!!"
local Yippie = "YIPPIE!!"
local Pickup = "Pickup The Phone :("
local Chinese = "Just Give Me The Food Bro 😔"
local Rat2 = "I Feel Rat-ish Again...."
local Box = "Form A Box!.."
local Spooky = "It Iz Da Spooky Month!!"
local Monkey = "Im About To Explode!!!"
--- Page 4
local Fight= "Come Fight Me!!"
local Bread = "Lemme Eat A Bread"
local Break = "Commercial Break"
local Popipo = "Eat Your Veggies"
local Birdbrain = "I Have a Bird Brain"
local XO = "Dont Say No!"
local Savor = "W!!"
local Roar = "Your Gonna Hear Me Roar!"
--Some Text Speedsvvvvvvvvvv
local Default = 0.05
local Introspeed = 0.10
local RatSpeed = 0.150
local UhhSpeed = .250
local YameroSpeed = .150
local InternetAngelSpeed = .150
local ApexSpeed =.250
local NeonSpeed = .250
local Introspeed = 0.01

-- Pls Dont Touch Below Or Else I Will Touch You
local function Chat(fulltext, typespeed)
local G1 = Color3.fromRGB(255,255, 255)
local A1 = Color3.fromRGB(100,100,100)
local W1 = Color3.fromRGB(10, 10,  10)
local DR = ColorSequence.new{
    ColorSequenceKeypoint.new(0, A1),
    ColorSequenceKeypoint.new(0.500, G1),
    ColorSequenceKeypoint.new(1, W1)
}
local CaptionStroke = Instance.new("UIStroke")
local B = Instance.new("UIGradient")
local X = Instance.new("TextLabel")
local SG = Instance.new("ScreenGui")
SG.Parent = player:WaitForChild("PlayerGui")
X.Text = " "
X.Font = Enum.Font.Sarpanch
X.TextSize = 20
X.TextColor3 = Color3.fromRGB(0, 0, 0)
X.BackgroundTransparency = 100
X.Parent = SG
X.Size = UDim2.new(0.80,150,1.55,0)
X.Rotation = 0
CaptionStroke.Thickness = 1
CaptionStroke.Color = Color3.fromRGB(255,255,255)
CaptionStroke.Parent = X
CaptionStroke.LineJoinMode = Enum.LineJoinMode.Miter
B.Parent = CaptionStroke 
B.Color = DR
B.Enabled = true 
B.Name = "Gradient"
B.Rotation = 100
B.Offset = Vector2.new(1,0)

for i = 1, #fulltext  do
X.Visible = true
X.Text = string.sub(fulltext, 1 ,i)
task.wait(typespeed)
end
task.wait(1.595)
X:Destroy()
end
-- Pls Dont Touch The Above, i will touch you if you did
Chat( Intro, Introspeed)


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
				seconds = (seconds < 0.000001) and 0.000001 or seconds -- absolute limit of roblo anything below just crashes lol so this limits it so it doesnt crash
			
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
			speed = 1.5
		end
        if dancing == true then 
            idle = false 
            char.Humanoid:Move(Vector3.new(0,0,-1),true)
            walking = false 
        end
        wait(.005)
        if isadance == true  then 
            sound69.Volume = 1
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
    --print(loopsplaying)
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
         writefile(id,game:HttpGet("https://github.com/Solary-3/Scripts/tree/Audios-1"..idwithoutthatbit))
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
            sound69.SoundId = customasset("Dances/Sphere.mp3")
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
                if walking == false and idle == true and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
                task.spawn(function()
                playanim(0,2000,false,idleanim)
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
	


------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
if mode == 1 then 
	if k == "q" then
		if dancing == false then
if not isfile("Dances/rat.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/rat.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/rat.mp3?raw=true"))
	warn("rat Downloaded!")
end
stopanim()
dancing = true
Chat(Rat,RatSpeed)
task.wait(.005)
----Idle:Stop()()
sound69.SoundId = customasset("Dances/rat.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
playanim(98260902889120,1.5)
else
stopanim()
task.wait(.1)
		end
	elseif k == "e" then 
		if dancing == false then 
if not isfile("Dances/xxanteria, isq - FUNKED UP (SLOWED) (320kbps).mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/xxanteria, isq - FUNKED UP (SLOWED) (320kbps).mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/xxanteria%2C%20isq%20-%20FUNKED%20UP%20(SLOWED)%20(320kbps).mp3?raw=true"))
	warn("xxanteria, isq - FUNKED UP (SLOWED) (320kbps) Downloaded!")
end
stopanim()
dancing = true
Chat(Boogie,Default)
task.wait(.005)
----Idle:Stop()()()
sound69.SoundId = customasset("Dances/xxanteria, isq - FUNKED UP (SLOWED) (320kbps).mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
sound69.Volume = .75
coolparticles.Parent = char.Torso
playanim(16769959846,1.2)
		else
stopanim()
task.wait(.1)
end
	elseif k == "r" then 
if dancing == false then 
if not isfile("Dances/Assumptions.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Assumptions.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Assumptions.mp3?raw=true"))
	warn("Assumptions Downloaded!")
end
	stopanim()
dancing = true
Chat(Assumptions,Default)
task.wait(.005)
--Idle:Stop()()
	sound69.SoundId = customasset("Dances/Assumptions.mp3")
	sound69.PlaybackSpeed = 1
	timeposcur = sound69.TimePosition 
sound69:Play()
	playanim(75148929064618,1.2)
else
	stopanim()
	sound69.PlaybackSpeed = 1
task.wait(.1)

end
elseif k == "t" then
if dancing == false then 
if not isfile("Dances/Bjean.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Bjean.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Bjean.mp3?raw=true"))
	warn("Bjean Downloaded!")
end
stopanim()
dancing = true
Chat(BJ,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Bjean.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(108805310510119,1.2)
	else
stopanim()
sound69.PlaybackSpeed = 1
task.wait(.1)
end
elseif k == "y" then 
if dancing == false then 
if not isfile("Dances/Egypt.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Egypt.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Egypt.mp3?raw=true"))
	warn("Egypt Downloaded!")
end
stopanim()
dancing = true
Chat(Egypt,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Egypt.mp3")
sound69.PlaybackSpeed = 1
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(95986135548450,1.5)
		else
stopanim()
end
elseif k == "u" then 
if dancing == false then 
if not isfile("Dances/caramell.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/caramell.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/caramell.mp3?raw=true"))
	warn("caramell Downloaded!")
end
    stopanim()
dancing = true
Chat(CaramellDansen,Default)
task.wait(.005)
--Idle:Stop()()
    sound69.SoundId = customasset("Dances/caramell.mp3")
    sound69.PlaybackSpeed = 1
    timeposcur = sound69.TimePosition 
sound69:Play()
    playanim(103597509139287,1.5)
    
else
    stopanim()
    sound69.PlaybackSpeed = 1
task.wait(.1)

 end
elseif k == "f" then 
     
    if dancing == false then 
if not isfile("Dances/Stock.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Stock.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Stock.mp3?raw=true"))
	warn("Stock Downloaded!")
end
        stopanim()
dancing = true
Chat(Stock,Defualt)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Stock.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(15039780593,1.5)
        
    else
        stopanim()
task.wait(.1)

    end
elseif k == "g" then 
     
    if dancing == false then 
if not isfile("Dances/gangnamm.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/gangnamm.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/gangnamm.mp3?raw=true"))
	warn("gangnamm Downloaded!")
end
        stopanim()
dancing = true
Chat(Gangnam,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/gangnamm.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(12438774071,1.5)
        
    else
        stopanim()
task.wait(.1)
    end
elseif k == "p" then 
     
    if dancing == false then 
if not isfile("Dances/Fein.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Fein.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Fein.mp3?raw=true"))
	warn("Fein Downloaded!")
end
        stopanim()
dancing = true
Chat(Fein,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Fein.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(115727639577589,1.5)

    else
        stopanim()
task.wait(.1)

    end
elseif k == "j" then 
     
    if dancing == false then 
if not isfile("Dances/dancingin.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/dancingin.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/dancingin.mp3?raw=true"))
	warn("dancingin Downloaded!")
end
        stopanim()
dancing = true
Chat(Uhh,UhhSpeed)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/dancingin.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(96444866125796,1.5)
       
    else
        stopanim()
task.wait(.1)

    end

elseif k == "l" then 
     
    if dancing == false then 
    if not isfile("Dances/griddy.mp3") then
         game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/griddy.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/griddy.mp3?raw=true"))
	warn("griddy Downloaded!")
end
        stopanim()
    dancing = true
    Chat(Griddy,Defualt)
    task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/griddy.mp3")
        char.Humanoid.WalkSpeed = 4*char:GetScale()
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(15704995372,1.5)
        
    else
        char.Humanoid.WalkSpeed = 14*char:GetScale()
        stopanim()
task.wait(.1)

    end
elseif k == "z" then
    if dancing == false then 
        if not isfile("Dances/LeftRight.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/LeftRight.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/LeftRight.mp3?raw=true"))
	warn("LeftRight Downloaded!")
end
        stopanim()
        dancing = true
        Chat(LeftRight,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/LeftRight.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(137845929482571,1.5)
        
    else
        stopanim()
task.wait(.1)
    end
elseif k == "x" then 
     
    if dancing == false then 
        if not isfile("Dances/kazot.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/kazot.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/kazot.mp3?raw=true"))
	warn("kazot Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Kazotsky,Defualt)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/kazot.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(114036336168567,1.5)
        
    else
        stopanim()
task.wait(.1)

    end
elseif k == "h" then 
     
    if dancing == false then 
        if not isfile("Dances/doodle - Zachz Winner.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/doodle - Zachz Winner.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/doodle%20-%20Zachz%20Winner.mp3?raw=true"))
	warn("doodle - Zachz Winner Downloaded!")
end
        stopanim()
        dancing = true
        Chat(HappyWalk,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/doodle - Zachz Winner.mp3")
        timeposcur = sound69.TimePosition 
         char.Humanoid.WalkSpeed = 7*char:GetScale()
sound69:Play()
        playanim(124074233795203,1.5)

    else
    char.Humanoid.WalkSpeed = 14*char:GetScale()
        stopanim()
task.wait(.1)

    end
elseif k == "v" then 
     
    if dancing == false then 
        if not isfile("Dances/Mesmerizer.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Mesmerizer.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Mesmerizer.mp3?raw=true"))
	warn("Mesmerizer Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Mesmerizer,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Mesmerizer.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(107578737342278,1.5)
        
    else
        stopanim()
task.wait(.1)

    end

elseif k == "c" then 
     
    if dancing == false then 
        if not isfile("Dances/Bumblebee.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Bumblebee.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Bumblebee.mp3?raw=true"))
	warn("Bumblebee Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Bumblebee,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Bumblebee.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(10048786578,1.5)
        
    else
        stopanim()
task.wait(.1)
    end
elseif k == "n" then 
     
    if dancing == false then 
        if not isfile("Dances/Domino.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Domino.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Domino.mp3?raw=true"))
	warn("Domino Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Domino,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Domino.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso

        playanim(126683576461381,1.5)
    else
        stopanim()
task.wait(.1)

    end

elseif k == "comma" then 
  
    if dancing == false then 
        if not isfile("Dances/Yamero.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Yamero.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Yamero.mp3?raw=true"))
	warn("Yamero Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Yamero,YameroSpeed)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Yamero.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(99905571448278,1.5)
        
    else
        stopanim()
task.wait(.1)

    end
elseif k == "leftbracket" then 
     
    if dancing == false then 
        if not isfile("Dances/Crank.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Crank.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Crank.mp3?raw=true"))
	warn("Crank Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Crank,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Crank.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(139148388599834,2)
        
    else
        stopanim()
task.wait(.1)
    end
elseif k == "k" then 
     
    if dancing == false then 
        if not isfile("Dances/SmoothMoves.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/SmoothMoves.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/SmoothMoves.mp3?raw=true"))
	warn("SmoothMoves Downloaded!")
end
        stopanim()
        dancing = true
        Chat(SmoothMoves,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/SmoothMoves.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(77170841283499,1.5)
        
    else
        stopanim()
task.wait(.1)

    end
    
elseif k == "rightbracket" then 
     
    if dancing == false then 
        if not isfile("Dances/Shuba Duck.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Shuba Duck.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Shuba%20Duck.mp3?raw=true"))
	warn("Shuba duck Downloaded!")
end
        stopanim()
        dancing = true
        Chat(ShubaDuck,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Shuba Duck.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(13357063395,1.5)
        
    else
        stopanim()
task.wait(.1)
    end
    
elseif k == "minus" then 
    
    if dancing == false then 
        if not isfile("Dances/Odetari - KEEP UP (Lyrics) (320kbps).mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Odetari - KEEP UP (Lyrics) (320kbps).mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Odetari%20-%20KEEP%20UP%20(Lyrics)%20(320kbps).mp3?raw=true"))
	warn("Odetari - KEEP UP (Lyrics) (320kbps) Downloaded!")
end
       stopanim()
        dancing = true
        Chat(KeepUp,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Odetari - KEEP UP (Lyrics) (320kbps).mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(84765927391240,1.5)
        
    else
        stopanim()
 task.wait(.1)

   end
elseif k == "b" then 
    
    if dancing == false then 
        if not isfile("Dances/Lemon.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Lemon.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Lemon.mp3?raw=true"))
	warn("Lemon Downloaded!")
end
       stopanim()
        dancing = true
        Chat(Lemon,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Lemon.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(120262284704633,1.5)
        
    else
        stopanim()
 task.wait(.1)

   end
 end
end
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
if mode == 2 then 
   if k == "q" then 
        
           if dancing == false then 
        if not isfile("Dances/unlockit.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/unlockit.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/unlockit.mp3?raw=true"))
	warn("unlockit Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Unlockit,Default)
        task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/unlockit.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(95877864781663,1.5)
    else
        stopanim()
 task.wait(.1)

           end 
   elseif k == "e" then
    
        if dancing == false then 
        if not isfile("Dances/InternetAngel.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/InternetAngel.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/InternetAngel.mp3?raw=true"))
	warn("InternetAngel Downloaded!")
end
        stopanim()
        dancing = true
        Chat(InternetAngel,InternetAngelSpeed)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/InternetAngel.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(93104787213396,2.5)
        
    else
        stopanim()
 task.wait(.1)
end 
elseif k == "r" then
if dancing == false then 
if not isfile("Dances/Assumptions.mp3") then
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Assumptions.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Assumptions.mp3?raw=true"))
	warn("Assumptions Downloaded!")
end
        stopanim()
        dancing = true
        Chat(AssumptionsV2,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Assumptions.mp3")
        game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(134470305964325,1.5)
    else
        stopanim()
        
end 
elseif k == "t" then 
if dancing == false then 
if not isfile("Dances/Boombox.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/APEX.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Boombox.mp3?raw=true"))
	warn("Boombox Downloaded!")
end
stopanim()
dancing = true
Chat(Boombox,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Boombox.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(84471848998012,1.5)
 else
stopanim()

end
elseif k == "y" then 
     if dancing == false then 
        if not isfile("Dances/balls.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/balls.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/balls.mp3?raw=true"))
	warn("Balls Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Peashooterr,Default)
        task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/balls.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(15039779727,1.5)

    else
        stopanim()
 task.wait(.1)

    end
elseif k == "h" then 
    if dancing == false then 
        if not isfile("Dances/Distraction.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Distraction.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Distraction.mp3?raw=true"))
	warn("Distraction Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Distraction,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Distraction.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(123261586961433,1.5)
    else
        stopanim()
        
    end
elseif k == "g" then 
    if dancing == false then 
        if not isfile("Dances/ItBurns.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/ItBurns.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/ItBurns.mp3?raw=true"))
	warn("ItBurns Downloaded!")
end
        stopanim()
        dancing = true
        Chat(ItBurns,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/ItBurns.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(78270528768822,1.5)
    else
        stopanim()
        
    end
elseif k == [[f]] then 
if dancing == false then 
if not isfile("Dances/chronoshift.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/chronoshift.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/chronoshift.mp3?raw=true"))
	warn("chronoshift Downloaded!")
end
stopanim() 
dancing = true
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/chronoshift.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(136302258505787,2)
else
     stopanim()
end
elseif k == "b" then 
if dancing == false then 
if not isfile("Dances/Million.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Million.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Million.mp3?raw=true"))
	warn("Million Downloaded!")
end
stopanim() 
dancing = true
Chat(Million,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Million.mp3")
timeposcur = sound69.TimePosition 
sound69:Play()
playanim(109123683211464,2)
else
     stopanim()
end
elseif k == "j" then 
    if dancing == false then 
if not isfile("Dances/Runaway.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Runaway.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Runaway.mp3?raw=true"))
	warn("Runaway Downloaded!")
end
stopanim()
dancing = true
Chat(Runaway,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Runaway.mp3")
sound69.PlaybackSpeed = 1
timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
playanim(119147810948063,1.5)
    else
stopanim()
sound69.PlaybackSpeed = 1

end
elseif k == "k" then 
    if dancing == false then 
        if not isfile("Dances/Headlock.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Headlock.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Headlock.mp3?raw=true"))
	warn("Headlock Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Headlock,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Headlock.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(80641587562132,5)
    else
        stopanim()
        
    end
elseif k == "u" then 
     
    if dancing == false then
        if not isfile("Dances/bloodpop.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/bloodpop.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/bloodpop.mp3?raw=true"))
	warn("Bloodpop Downloaded!")
end
         stopanim()
        dancing = true
        Chat(Bloodpop,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/bloodpop.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(132026285699359,1.5)
        
    else
        stopanim()
task.wait(.1)

    end
elseif k == "n" then 
     
    if dancing == false then 
        stopanim()
        dancing = true
        Chat(Lay,Default)
        
        task.wait(.005)
--Idle:Stop()()
        playanim(90819860436349,1.5)
     
    else
        stopanim()
task.wait(.1)

    end
elseif k == "x" then 
     
    if dancing == false then 
        if not isfile("Dances/heavylove.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/heavylove.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/heavylove.mp3?raw=true"))
	warn("heavylove Downloaded!")
end
        stopanim()
        dancing = true
        Chat(HeavyLove,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/heavylove.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(85856686932206,1.5)
        
    else
task.wait(.1)

        stopanim()   
    end
elseif k == "leftbracket" then 
     
    if dancing == false then 
        if not isfile("Dances/Smug.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Smug.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Smug.mp3?raw=true"))
	end
        stopanim()
        dancing = true
        Chat(Smuggin,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Smug.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(8360493405,1.5)
        
    else
task.wait(.1)

        stopanim() 
    end
elseif k == "rightbracket" then 
     
    if dancing == false then 
        if not isfile("Dances/Pp music.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Pp music.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Pp%20music.mp3?raw=true"))
	warn("Pp music Downloaded!")
end
        stopanim()
        dancing = true
        Chat(PP,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Pp music.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(8483186407,1.5)
        
    else
task.wait(.1)

        stopanim()       
    end
elseif k == "l" then 
     
    if dancing == false then 
        if not isfile("Dances/ТРИ ПОЛОСКИ ⧸ KOLM TRIIPU ⧸ THREE STRIPES.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/ТРИ ПОЛОСКИ ⧸ KOLM TRIIPU ⧸ THREE STRIPES.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/%D0%A2%D0%A0%D0%98%20%D0%9F%D0%9E%D0%9B%D0%9E%D0%A1%D0%9A%D0%98%20%E2%A7%B8%20KOLM%20TRIIPU%20%E2%A7%B8%20THREE%20STRIPES.mp3?raw=true"))
	warn("ТРИ ПОЛОСКИ ⧸ KOLM TRIIPU ⧸ THREE STRIPES Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Tripaloski,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/ТРИ ПОЛОСКИ ⧸ KOLM TRIIPU ⧸ THREE STRIPES.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(13012728861,10)
        
    else
task.wait(.1)

        stopanim()    
    end
elseif k == "comma" then 
     
    if dancing == false then 
        if not isfile("Dances/TUCA DONKA.mp3") then
             game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/TUCA DONKA.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/TUCA%20DONKA.mp3?raw=true"))
	warn("TUCA DONKA Downloaded!")
end
        stopanim()
        dancing = true
        Chat(Hakari,Default)
        task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/TUCA DONKA.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(114322394064953,1.5)
        
    else
task.wait(.1)

        stopanim()      
    end
elseif k == "p" then
     
    if dancing == false then
       if not isfile("Dances/DO THE FLOP.mp3") then
            game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/DO THE FLOP.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/DO%20THE%20FLOP.mp3?raw=true"))
	warn("DO THE FLOP Downloaded!")
end
       stopanim()
       dancing = true
       Chat(DoTheFlop,Default)
       task.wait(.005)
--Idle:Stop()()
       sound69.SoundId = customasset("Dances/DO THE FLOP.mp3")
        timeposcur = sound69.TimePosition
       sound69:play()
       coolparticles.Parent = char.Torso
       playanim(122878040721056,1.2)
      
   else
task.wait(.1)

  stopanim()
    end
    
elseif k == "c" then
     
  if dancing == false then
    if not isfile("Dances/Doodle.mp3") then
         game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Doodle.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Doodle.mp3?raw=true"))
	warn("Doodle Downloaded!")
end
    stopanim()
    dancing = true
    Chat(DoodlePoint,Default)
    task.wait(.005)
--Idle:Stop()()
    sound69.SoundId = customasset("Dances/Doodle.mp3")
        timeposcur = sound69.TimePosition 
    sound69:Play()
    coolparticles.Parent = char.Torso
    playanim(137721173051346,1.5)
    
   else
task.wait(.1)

  stopanim()

  end

elseif k == "z" then
     
  if dancing == false then
   if not isfile("Dances/CLUB PENGUIN DANCE.mp3") then
        game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/CLUB PENGUIN DANCE.mp3",
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/CLUB%20PENGUIN%20DANCE.mp3?raw=true"))
	warn("CLUB PENGUIN DANCE Downloaded!")
end
    stopanim()
   dancing = true
   Chat(Clubbin,Default)
    task.wait(.005)
--Idle:Stop()()
    sound69.SoundId = customasset("Dances/CLUB PENGUIN DANCE.mp3")
        timeposcur = sound69.TimePosition 
    sound69:Play()
    coolparticles.Parent = char.Torso
    playanim(89761302048916,1.5)
    
   else
task.wait(.1)

  stopanim()

  end
elseif k == "v" then 
     
    if dancing == false then 
if not isfile("Dances/MioHonda.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/MioHonda.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/MioHonda.mp3?raw=true"))
	warn("MioHonda Downloaded!")
end
stopanim()
dancing = true
Chat(MioHonda,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/MioHonda.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(97072681531610,1.5)
      
    else
task.wait(.1)

        stopanim()
        
    end
elseif k == "minus" then 
    if dancing == false then 
if not isfile("Dances/Liar.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Liar.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Liar.mp3?raw=true"))
	warn("Liar Dance Downloaded!")
end
stopanim()
dancing = true
Chat(Liar,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Liar.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(83070385097572,2)
      
    else
task.wait(.1)

        stopanim()
        
    end
  end 
end
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
if mode == 3 then
     if k == "q" then 
     
    if dancing == false then 
  if not isfile("Dances/Firework.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Firework.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Firework.mp3?raw=true"))
	warn("Firework Downloaded!")
end
stopanim()
  dancing = true
  Chat(Firework,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Firework.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(89935837869234,1.5)
        
    else
task.wait(.1)

        stopanim()
end
elseif k == "e" then 
     
    if dancing == false then 
  if not isfile("Dances/Monster.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Monster.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Monster.mp3?raw=true"))
	warn("Monster Downloaded!")
end
stopanim()
  dancing = true
  Chat(Monster,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Monster.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(81782595704176,1.5)
        
    else
task.wait(.1)

        stopanim()
end
elseif k == "f" then 
     
    if dancing == false then 
  if not isfile("Dances/Crazy.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Crazy.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Crazy.mp3?raw=true"))
	warn("Crazy Downloaded!")
end
stopanim()
  dancing = true
  Chat(Crazy,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Crazy.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(137002925200340,1.5)
        
    else
task.wait(.1)

        stopanim()
end
elseif k == "r" then 
     
    if dancing == false then 
stopanim()
  dancing = true
  if not isfile("Dances/Pixelation.mp3") then
	writefile("Dances/Pixelation.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Pixelation.mp3?raw=true"))
	warn("Pixelation Downloaded!")
end
  Chat(Pixelation,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Pixelation.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(104677708563747,1.5)
        
    else
task.wait(.1)

        stopanim()
end
elseif k == "t" then 
    if dancing == false then 
  if not isfile("Dances/Memory.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Memory.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Memory.mp3?raw=true"))
	warn("Memory Downloaded!")
end
stopanim()
  dancing = true
  Chat(Memory,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Memory.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(83541779913786,1.5)
        
    else
task.wait(.1)
        stopanim()
end
elseif k == "y" then 
     
    if dancing == false then 
  if not isfile("Dances/APEX.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/APEX.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/APEX.mp3?raw=true"))
	warn("APEX Downloaded!")
end
stopanim()
  dancing = true
  Chat(Apex,ApexSpeed)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/APEX.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(116533429637262,1.5)
        
    else
task.wait(.1)

        stopanim()
end
elseif k == "u" then 

    if dancing == false then 
  if not isfile("Dances/Neon.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Neon.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Neon.mp3?raw=true"))
	warn("Neon Downloaded!")
end
         stopanim()
  dancing = true
  Chat(Neon,NeonSpeed)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Neon.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(121056037197960,1.5)
        
    else
task.wait(.1)

        stopanim()
end
elseif k == "p" then 
    if dancing == false then 
  if not isfile("Dances/LoveForU.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/LoveForU.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/LoveForU.mp3?raw=true"))
	warn("Love Downloaded!")
end
        stopanim()
  dancing = true
  Chat(LoveForU,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/LoveForU.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
        playanim(74560719461868,2)
    else
task.wait(.1)

        stopanim()
end
elseif k == "g" then 
     
    if dancing == false then 
  if not isfile("Dances/Lightbringer.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Lightbringer.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Lightbringer.mp3?raw=true"))
	warn("Lightbringer Downloaded!")
end
stopanim()
  dancing = true
  Chat(Lightbringer,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Lightbringer.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(76917086771202,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "h" then 
     
    if dancing == false then 
  if not isfile("Dances/C14.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/C14.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/C14.mp3?raw=true"))
	warn("C14 Downloaded!")
end
stopanim()
  dancing = true
  Chat(C14,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/C14.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(118452043589079,2)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "j" then 
     
    if dancing == false then 
  if not isfile("Dances/Goat.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Goat.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Goat.mp3?raw=true"))
	warn("Goat Downloaded!")
end
stopanim()
  dancing = true
  Chat(Goat,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Goat.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(88802480011454,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "k" then 
    if dancing == false then 
     
  if not isfile("Dances/Jevil.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Jevil.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Jevil.mp3?raw=true"))
	warn("Jevil Downloaded!")
end
stopanim()
  dancing = true
  Chat(Jevil,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Jevil.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(8550316999,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "l" then 
    if dancing == false then 
     
  if not isfile("Dances/Spooky.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Spooky.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Spooky.mp3?raw=true"))
	warn("Spooky MonthDownloaded!")
end
stopanim()
  dancing = true
  Chat(Spooky,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Spooky.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(15231364673,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "z" then 
     
    if dancing == false then 
  if not isfile("Dances/Billy.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Billy.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Billy.mp3?raw=true"))
	warn("Billy Downloaded!")
end
stopanim()
  dancing = true
  Chat(Billy,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Billy.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(108058940444935,1.65)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "x" then 
     
    if dancing == false then 
  if not isfile("Dances/SlickBack.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/SlickBack.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/SlickBack.mp3?raw=true"))
	warn("SlickBack Downloaded!")
end
stopanim()
  dancing = true
  Chat(SlickBack,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/SlickBack.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(18986357892,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "c" then 
     
    if dancing == false then 
  if not isfile("Dances/Static.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Static.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Static.mp3?raw=true"))
	warn("Static Downloaded!")
end
stopanim()
  dancing = true
  Chat(Static,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Static.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(139065991651723,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "v" then 
    if dancing == false then 
  if not isfile("Dances/Heel.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Heel.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Heel.mp3?raw=true"))
	warn("Heel Downloaded!")
end
stopanim()
  dancing = true
  Chat(Heel,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Heel.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(98256622649150,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "b" then 
    if dancing == false then 
  if not isfile("Dances/Yippie.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Yippie.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Yippie.mp3?raw=true"))
	warn("Yippie Downloaded!")
end
stopanim()
  dancing = true
  Chat(Yippie,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Yippie.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(91260130273371,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "n" then 
    if dancing == false then 
  if not isfile("Dances/Pickup.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Pickup.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Pickup.mp3?raw=true"))
	warn("Pickup The Phone Downloaded!")
end
stopanim()
  dancing = true
  Chat(Pickup,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Pickup.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(92187683724153,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "rightbracket" then 
    if dancing == false then 
  if not isfile("Dances/Chinese.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Chinese.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Chinese.mp3?raw=true"))
	warn("Kemusan Downloaded!")
end
stopanim()
  dancing = true
  Chat(Chinese,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Chinese.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(124210157097622,1.5)
    else
task.wait(.1)

        stopanim()
end
elseif k == "leftbracket" then 
    if dancing == false then 
  if not isfile("Dances/rat.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/rat.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/rat.mp3?raw=true"))
	warn("rat Downloaded!")
end
stopanim()
  dancing = true
  Chat(Rat2,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/rat.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(104525136565640,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "comma" then 
    if dancing == false then 
  if not isfile("Dances/Box.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Box.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Box.mp3?raw=true"))
	warn("Box Swing Downloaded!")
end
stopanim()
  dancing = true
  Chat(Box,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Box.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(75405139558088,1.5)     
    else
task.wait(.1)

        stopanim()
end
elseif k == "minus" then 
    if dancing == false then 
  if not isfile("Dances/Monkey.mp3") then
       game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Monkey.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Monkey.mp3?raw=true"))
	warn("Bomb Monkey Downloaded!")
end
stopanim()
  dancing = true
  Chat(Monkey,Default)
task.wait(.005)
--Idle:Stop()()
sound69.SoundId = customasset("Dances/Monkey.mp3")
       timeposcur = sound69.TimePosition 
sound69:Play() 
coolparticles.Parent = char.Torso
        playanim(75616586799217,1.5)     
    else
task.wait(.1)

        stopanim()
end
end
end
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
if mode == 4 then
if k == "e" then 
    if dancing == false then 
if not isfile("Dances/Break.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Break.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Break.mp3?raw=true"))
	warn("Commercial Break Downloaded!")
end
        stopanim()
dancing = true
Chat(Break,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Break.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(74653637870288,2)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "q" then 
if dancing == false then 
if not isfile("Dances/Popipo.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Popipo.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Popipo.mp3?raw=true"))
	warn("Popipo Downloaded!")
end
        stopanim()
dancing = true
Chat(Popipo,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Popipo.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(115465103089127,1.15)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "r" then 
if dancing == false then 
if not isfile("Dances/Birdbrain.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Birdbrain.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Birdbrain.mp3?raw=true"))
	warn("Birdbrain Downloaded!")
end
        stopanim()
dancing = true
Chat(Birdbrain,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Birdbrain.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(122216349954401,5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "t" then 
if dancing == false then 
        stopanim()
dancing = true
Chat(Bread,Default)
task.wait(.005)
--Idle:Stop()()
coolparticles.Parent = char.Torso
        playanim(77887053847258,2)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "y" then 
if dancing == false then 
        stopanim()
dancing = true
Chat(Fight,Default)
task.wait(.005)
--Idle:Stop()()
coolparticles.Parent = char.Torso
        playanim(118865990558686,2)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "u" then 
if dancing == false then 
if not isfile("Dances/XO.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/XO.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/XO.mp3?raw=true"))
	warn("XO Downloaded!")
end
        stopanim()
dancing = true
Chat(XO,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/XO.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(73559770055600,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "p" then 
if dancing == false then 
if not isfile("Dances/Roar.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Roar.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Roar.mp3?raw=true"))
	warn("Roar Downloaded!")
end
        stopanim()
dancing = true
Chat(Roar,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Roar.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(114610231812511,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "f" then 
if dancing == false then 
if not isfile("Dances/Savor.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Savor.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Savor.mp3?raw=true"))
	warn("Savor Downloaded!")
end
        stopanim()
dancing = true
Chat(Savor,Default)
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Savor.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(82123030025988,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "g" then 
if dancing == false then 
if not isfile("Dances/Prism.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Prism.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Prism.mp3?raw=true"))
	warn("Prism Downloaded!")
end
        stopanim()
dancing = true
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Prism.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(132979558739339,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "h" then 
if dancing == false then 
if not isfile("Dances/Rambunctious.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Rambunctious.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Rambunctious.mp3?raw=true"))
	warn("Rambunctious Downloaded!")
end
        stopanim()
dancing = true
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Rambunctious.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(112645644540728,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "j" then 
if dancing == false then 
if not isfile("Dances/TakeDown.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/TakeDown.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/TakeDown.mp3?raw=true"))
	warn("TakeDown Downloaded!")
end
        stopanim()
dancing = true
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/TakeDown.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(70380478678297,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "k" then 
if dancing == false then 
if not isfile("Dances/Soda.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Soda.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Soda.mp3?raw=true"))
	warn("Soda Pop Downloaded!")
end
        stopanim()
dancing = true
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Soda.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(77909248721162,1.5)    
    else
task.wait(.1)
        stopanim()
end
elseif k == "l" then 
if dancing == false then 
if not isfile("Dances/Jennie.mp3") then
     game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 2.5;
	Text = "Let The Audio Download"
})
	writefile("Dances/Jennie.mp3", 
	game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Jennie.mp3?raw=true"))
	warn("Dance With Jennie Downloaded!")
end
        stopanim()
dancing = true
task.wait(.005)
--Idle:Stop()()
        sound69.SoundId = customasset("Dances/Jennie.mp3")
        timeposcur = sound69.TimePosition 
sound69:Play()
coolparticles.Parent = char.Torso
        playanim(123466582577669,1.5)    
    else
task.wait(.1)
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
if k == "m" then  --Modes
    if mode == 3 then 
mode = 4

  game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 5;
	Text = "Page 4"
})
elseif mode == 2  then
    mode = 3 
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 5;
	Text = "Page 3"
})
elseif mode == 1 then
        mode = 2 
    game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 5;
	Text = "Page 2"
})
elseif mode == 4  then 
    mode = 1
    game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Krystal Dance V3";
	Duration = 5;
	Text = "Page 1"
})
    end
end
if k == "rightalt" then
sprinting = not sprinting
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
                task.wait(.1)
                 playanim(0,2000,false,idleanim)
            --Idle:Play()
            end
        elseif char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and walking == false then 
            char.Humanoid.WalkSpeed = 14*char:GetScale()
            walking = true
            idle = false
            stopanim()
            fwait(1/500)
    	 if sprinting == false then 
                 char.Humanoid.WalkSpeed = 14*char:GetScale()
            if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
                    --Idle:Stop()()
                playanim(130213485744288,.75,false,walkanim)
            end
        else
                char.Humanoid.WalkSpeed = 30*char:GetScale()
            if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then
                   --Idle:Stop()() 
                playanim(130213485744288,2.2,false,sprintanim)
            end
    end
end
end
    end)




	char.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
		if char.Humanoid.Sit == true then 
			stopanim()
			--Idle:Stop()
			math.randomseed(os.clock())
			if math.random(1,2) == 1 then 
			playanim(133312100962627,1,false)
			else 
			playanim(121056037197960,1.5,true)
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
introsound.SoundId = "rbxassetid://236146895"
introsound.Volume = 1
introsound:Play()
bigfedora = Instance.new("Part",Character)
bigfedora.Size = Vector3.new(2,2,2)
bigfedora.CFrame = bigfedora.CFrame:inverse() * Root.CFrame * CFrame.new(math.random(-60,60),-.2,math.random(-60,60)) * CFrame.Angles(0,math.rad(math.random(-180,180)),0)
bigfedora.CanCollide = false
bigfedora.Anchored = true
bigfedora.Name = "mbigf"
mbigfedora = Instance.new("SpecialMesh", bigfedora)
mbigfedora.MeshType = "FileMesh"
mbigfedora.Scale = Vector3.new(2.5, 2.5, 2.5)
mbigfedora.MeshId,mbigfedora.TextureId = 'http://www.roblox.com/asset/?id=1125478','http://www.roblox.com/asset/?id=1125479'

for i = 1, 60 do
bigfedora.CFrame = bigfedora.CFrame:lerp(CFrame.new(Root.Position) * CFrame.new(0,-.1,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.09)
task.wait(1/60)
end
wait(.25)
for i = 1, 50 do
bigfedora.CFrame = bigfedora.CFrame:lerp(CFrame.new(char.Head.Position),.5)
task.wait(1/60)
end
zmc = 0
for i = 1, 29 do
zmc = zmc + 2
mbigfedora.Scale = mbigfedora.Scale - Vector3.new(.15,.15,.15)
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
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Enjoy")
task.wait(.1)
stopanim()
task.wait(.1)
stopanim()