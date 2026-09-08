--OPTIONS

-- thanks to: trixlua (fucking amazing at this bruh) Never_Acrchanid &HOW DO I SPELL IT& Spookitys *go sub* and bruh54233 for ideas cuase im unorignal :D - also theres valiant uh idk why hes here but ok

if not game:IsLoaded() then
	local notLoaded = Instance.new("Message",workspace)
	notLoaded.Text = 'SWORDS FE STAR IS WAITING FOR THE GAME TO LOAD'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

local voicelines = false -- toggles the funny chat lol Ex: [ILLUSION] NOTHING IS AS IT SEEMS --
local credits = false -- toggles if ya say the credits (PEOPLE WHO MADE THIS GLITCHER OR HELPED) --

--Options end here!


workspace.DescendantAdded:Connect(function(seat)
    if seat:IsA("Seat") then
       wait()
       seat:Destroy()
    end
end)

for _,delete in pairs(workspace:GetDescendants()) do
    if delete:IsA("Seat") then
        delete:Destroy()
    end
end

local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
hrp.Size = Vector3.new(1000000, hrp.Size.Y, 1000000)


setfflag("AbuseReportScreenshotPercentage", 0)

setfflag("DFFlagAbuseReportScreenshot", "False")

setfflag("AbuseReportScreenshot", "False")

setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")

setfflag("CrashUploadToBacktracePercentage", "0")

setfflag("CrashUploadToBacktraceBlackholeToken", "")

setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")

loadstring(game:HttpGet("https://raw.githubusercontent.com/SacredLua/ProjectX/main/reanimate.lua",true))()



Player = game:GetService("Players").LocalPlayer
        Cam = workspace.CurrentCamera
        Character = game.Players.LocalPlayer.Character
        Head = Character.Head
        Cam.CameraSubject = Head
	local data = {}

	local script = game:GetObjects("rbxassetid://5446036971")[1]

	script.WingPiece.qPerfectionWeld:Destroy()

	do
		local NEVER_BREAK_JOINTS = false

		local function CallOnChildren(Instance, FunctionToCall)
			FunctionToCall(Instance)

			for _, Child in next, Instance:GetChildren() do
				CallOnChildren(Child, FunctionToCall)
			end
		end

		local function GetBricks(StartInstance)
			local List = {}
			CallOnChildren(StartInstance, function(Item)
				if Item:IsA("BasePart") then
					List[#List+1] = Item;
				end
			end)

			return List
		end

		local function Modify(Instance, Values)
			assert(type(Values) == "table", "Values is not a table");

			for Index, Value in next, Values do
				if type(Index) == "number" then
					Value.Parent = Instance
				else
					Instance[Index] = Value
				end
			end
			return Instance
		end

		local function Make(ClassType, Properties)
			return Modify(Instance.new(ClassType), Properties)
		end

		local Surfaces = {"TopSurface", "BottomSurface", "LeftSurface", "RightSurface", "FrontSurface", "BackSurface"}
		local HingSurfaces = {"Hinge", "Motor", "SteppingMotor"}

		local function HasWheelJoint(Part)
			for _, SurfaceName in pairs(Surfaces) do
				for _, HingSurfaceName in pairs(HingSurfaces) do
					if Part[SurfaceName].Name == HingSurfaceName then
						return true
					end
				end
			end

			return false
		end

		local function ShouldBreakJoints(Part)
			if NEVER_BREAK_JOINTS then
				return false
			end

			if HasWheelJoint(Part) then
				return false
			end

			local Connected = Part:GetConnectedParts()

			if #Connected == 1 then
				return false
			end

			for _, Item in pairs(Connected) do
				if HasWheelJoint(Item) then
					return false
				elseif not Item:IsDescendantOf(script.Parent) then
					return false
				end
			end

			return true
		end

		local function WeldTogether(Part0, Part1, JointType, WeldParent)

			JointType = JointType or "Weld"
			local RelativeValue = Part1:FindFirstChild("qRelativeCFrameWeldValue")

			local NewWeld = Part1:FindFirstChild("qCFrameWeldThingy") or Instance.new(JointType)
			Modify(NewWeld, {
				Name = "qCFrameWeldThingy";
				Part0  = Part0;
				Part1  = Part1;
				C0     = CFrame.new();--Part0.CFrame:inverse();
				C1     = RelativeValue and RelativeValue.Value or Part1.CFrame:toObjectSpace(Part0.CFrame); --Part1.CFrame:inverse() * Part0.CFrame;-- Part1.CFrame:inverse();
				Parent = Part1;
			})

			if not RelativeValue then
				RelativeValue = Make("CFrameValue", {
					Parent     = Part1;
					Name       = "qRelativeCFrameWeldValue";
					Archivable = true;
					Value      = NewWeld.C1;
				})
			end

			return NewWeld
		end

		local function WeldParts(Parts, MainPart, JointType, DoNotUnanchor)

			for _, Part in pairs(Parts) do
				if ShouldBreakJoints(Part) then
					Part:BreakJoints()
				end
			end

			for _, Part in pairs(Parts) do
				if Part ~= MainPart then
					WeldTogether(MainPart, Part, JointType, MainPart)
				end
			end

			if not DoNotUnanchor then
				for _, Part in pairs(Parts) do
					Part.Anchored = false
				end
				MainPart.Anchored = false
			end
		end

		local function PerfectionWeld()	
			local Parts = GetBricks(script.WingPiece)
			WeldParts(Parts, script.WingPiece.Main, "Weld", false)
		end
		PerfectionWeld()
	end

	--// Shortcut Variables \\--
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
	local UIS = S.UserInputService

	local Player = game.Players.LocalPlayer
	data.User = Player
	data.Local = Player
	local Char = Player.Character
	local Mouse = Player:GetMouse()
	local Hum = Char:FindFirstChildOfClass'Humanoid'
	local Torso = Char.Torso
	local RArm = Char["Right Arm"]
	local LArm = Char["Left Arm"]
	local RLeg = Char["Right Leg"]
	local LLeg = Char["Left Leg"]	
	local Root = Char:FindFirstChild'HumanoidRootPart'
	local Head = Char.Head
	local Sine = 0;
	local Change = 1
	local Attack=false
	local NeutralAnims=true
	local timePos=30;
	local walking=true;
	local legAnims=true;
	local movement = 8
	local footsound=0;
	local WalkSpeed=16;
	local Combo=0;
	local Mode='POWER'
	local vaporwaveMode=false;
	local WingAnim='NebG1'
	local music;
	local hue = 0;
	local WingSine=0;
	local MusicMode=1;
	local visSong = 1702473314;
	local EffectFolder = script:WaitForChild'FXFolder'
	local PrimaryColor = Color3.new(1,1,1)
	local ClickTimer = 0;
	local ClickAttack = 1;
	local camera = workspace.CurrentCamera
	local LastSphere = time();
	local Frame_Speed = 60
	local VaporwaveSongs={
		2231500330;
		654094806;
		743334292;
		334283059;
		2082142910;
	}


	local WingPiece = script:WaitForChild'WingPiece'
	WingPiece.Parent=nil
	local WingAnims={}
	local Playlist={
		Default=1702473314;
		ScrapBoy=1215691669;
		Defeated=860594509;
		Annihilate=2116461106;
		DashAndDodge=2699922745;
		ZenWavy=2231500330;
		Beachwalk=334283059;
		Pyrowalk=2082142910;
		Vapor90s=654094806;
	}

--[[
Achromatic - The Big Black - Lost Soul
Iniquitous
Mythical - Legendary
Ruined - Th1rt3en
Atramentous - Vanta Black
Subzero - Frostbite
Troubadour
Infectious - Radioactive
Love - Lust
]]

	--2699922745
	local modeInfo={
		{Name="POWER",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(150, 150, 0);Music=1504604335,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='NebG1'};
		{Name="WORMHOLE",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(150, 150, 0);Music=1842621252,LeftWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lilac'.Color,Enum.Material.Neon};WingAnim='Worm'};
		{Name="PULSAR",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(0, 0, 255);Music=1842621252,LeftWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark blue'.Color,Enum.Material.Neon};WingAnim='PULSE'};
		{Name="FORCE",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(0, 0, 255);Music=511836626,LeftWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark blue'.Color,Enum.Material.Neon};WingAnim='FORCE'};
		{Name="HYBRID",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 0, 0);Music=1842621252,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='Things'};
		{Name="APCOCLYPTIC",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(150, 0, 0);Music=1282491661,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='HAHAHA1'};
		{Name="GENOCIDE",Walkspeed=60,moveVal=10,Font=Enum.Font.Antique,StrokeColor=C3.N(255, 0, 0);Music=4736655124,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Maroon'.Color,Enum.Material.Neon};WingAnim='GENOCIDE'};
		{Name="BURNING BRAIN",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 0, 0);Music=833779944,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='ZENITH'};
		{Name="PESTILENCE",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(0, 0, 0);Music=4177790309,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='PEST1'};
	    {Name="ACE-OF-SPADES",Walkspeed=66,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 238, 0);Music=1446376775,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='PROESTGAMER'};
		{Name="PUNISHED",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 0, 0);Music=1074484884,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='PUNISHED'};
		{Name="PURGED",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 0, 0);Music=1074484884,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='PUNISHED'};
	    {Name="???",Walkspeed=60,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(150, 150, 0);Music=234242423,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='Question'};
		{Name="R E M E M B E R E D",Walkspeed=16,moveVal=10,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(255, 255, 255);Music=614032233,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};WingAnim='REMEMBER'};
		{Name="Splits",Walkspeed=16,moveVal=10,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(0, 38, 255);Music=614032233,LeftWing={0,BrickColor.new'Really blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='NebG2'};
		{Name="GREATSWORD",Walkspeed=16,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 255, 255);Music=614032233,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='GSWORD'};
		{Name="TIME WARP",Walkspeed=66,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 140, 0);Music=348832364,LeftWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};WingAnim='PERSON'};
		{Name="Nefarious",Walkspeed=16,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(255, 0, 0);Music=6614038981,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='Star7'};
		{Name="ECHO",Walkspeed=16,moveVal=8,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(0, 0, 0);Music=573736432,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Echo1'};
		{Name="Ɇ₵ⱧØ",Walkspeed=16,moveVal=8,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(0, 0, 0);Music=573736432,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Echo2'};
		{Name="Liar X",Walkspeed=16,moveVal=10,Font=Enum.Font.Fantasy,StrokeColor=C3.N(235, 0, 0);Music=1751171913,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='LIES'};
		{Name="EXCALIBUR",Walkspeed=40,moveVal=10,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0, 0, 0);Music=1751171913,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='Sword1'};
		{Name="Deleterious",Walkspeed=40,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(100, 0, 0);Music=573736432,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='DELETE'};
		{Name="EXCALIBUR X",Walkspeed=40,moveVal=10,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0, 0, 0);Music=1751171913,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='Sword1'};
		{Name="YING-YANG",Walkspeed=16,moveVal=10,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0, 0, 0);Music=1842859173,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='Atoms'};
		{Name="Atomic Collisions",Walkspeed=66,moveVal=10,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0, 0, 0);Music=1837612618,LeftWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Camo'.Color,Enum.Material.Neon};WingAnim='Atomic'};
		{Name="FUTURE",Walkspeed=16,moveVal=10,Font=Enum.Font.SourceSansItalic,StrokeColor=C3.N(0, 0, 0);Music=3405566511,LeftWing={0,BrickColor.new'Lilac'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};WingAnim='Future'};
		{Name="SYSTEM_32",Walkspeed=16,moveVal=10,Font=Enum.Font.Bodoni,StrokeColor=C3.N(100, 0, 0);Music=3405566511,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='SYS32'};
		{Name="Overclocked",Walkspeed=200,moveVal=30,Font=Enum.Font.Arcade,StrokeColor=C3.N(255, 140, 0);Music=1138145518,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Tr. Red'.Color,Enum.Material.Neon};WingAnim='NebG3'};
		{Name="S P A C E T I M E",Walkspeed=150,moveVal=10,Font=Enum.Font.Arcade,StrokeColor=C3.N(0, 0, 255);Music=4597078271,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really blue'.Color,Enum.Material.Neon};WingAnim='SPACETIME'};
		{Name="INEVITABLE",Walkspeed=16,moveVal=10,Font=Enum.Font.Arcade,StrokeColor=C3.N(255, 255, 255);Music=6215034956,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='isgonnahappensoon'};
		{Name="ERROR_404",Walkspeed=16,moveVal=10,Font=Enum.Font.Code,StrokeColor=C3.N(255, 0, 0);Music=2954216473,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Doom'};
	    {Name="CRAZED",Walkspeed=200,moveVal=10,Font=Enum.Font.Code,StrokeColor=C3.N(0, 0, 0);Music=719008519,LeftWing={0,BrickColor.new'Dark blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='KRAZY'};
		{Name="MURDEROUS",Walkspeed=10,moveVal=5,Font=Enum.Font.Antique,StrokeColor=C3.N(155, 0, 0);Music=5926497202,LeftWing={0,BrickColor.new'Maroon'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Dead'};
		{Name="Lightning Cannon",Walkspeed=99,moveVal=5,Font=Enum.Font.Antique,StrokeColor=C3.N(255, 255, 255);Music=5485798026,LeftWing={0,BrickColor.new'Maroon'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='LC1'};
		{Name="INFINITE",Walkspeed=66,moveVal=5,Font=Enum.Font.Bodoni,StrokeColor=C3.N(155, 0, 0);Music=5926497202,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};WingAnim='Liquid'};
		{Name="SINGULARITY",Walkspeed=66,moveVal=5,Font=Enum.Font.Bodoni,StrokeColor=C3.N(0, 0, 0);Music=1838627204,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='BLACKHOLE'};
		{Name="DESTROYED",Walkspeed=250,moveVal=10,Font=Enum.Font.Antique,StrokeColor=C3.N(0,0,0);Music=1837797865,LeftWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Bruh'};
		{Name="god slayer",Walkspeed=16,moveVal=6,Font=Enum.Font.Antique,StrokeColor=C3.N(0,0,0);Music=2116461106,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};WingAnim='Star1'};
		{Name="Radioactivity",Walkspeed=100,moveVal=15,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(0,0,0);Music=4920807873,LeftWing={0,BrickColor.new'Camo'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='Star2'};
		{Name="Fearless",Walkspeed=50,moveVal=10,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,0,0);Music=5548894866,LeftWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Star3'};
		{Name="L0st",Walkspeed=17,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.2,.2,.2);Music=143367704,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Granite};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Grass};WingAnim='Lost'};
		{Name="Destiny",Walkspeed=40,moveVal=10,Font=Enum.Font.SourceSansLight,StrokeColor=C3.N(.2,.2,.2);Music=2071274388,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Destiny'};
		{Name="Calamity",Walkspeed=40,moveVal=10,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(.2,.2,.2);Music=3221578654,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};WingAnim='Calam'};
		{Name="SPEED OF LIGHT",Walkspeed=1000,moveVal=10,Font=Enum.Font.SourceSansBold,StrokeColor=C3.N(.2,.2,.2);Music=3221578654,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};WingAnim='LIGHTSPEED'};
		{Name="Catastrophe",Walkspeed=40,moveVal=10,Font=Enum.Font.Antique,StrokeColor=C3.N(.2,.2,.2);Music=4554066200,LeftWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Cata'};
		{Name="Cataclysm",Walkspeed=50,moveVal=13,Font=Enum.Font.Garamond,StrokeColor=C3.N(.2,.2,.2);Music=143367704,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='Cataclysm'};
		{Name="PLATFORM",Walkspeed=50,moveVal=13,Font=Enum.Font.Bodoni,StrokeColor=C3.N(140,140,140);Music=1256962511,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='PLATFORM'};
		{Name="Mythical",Walkspeed=40,moveVal=10,Font=Enum.Font.Antique,StrokeColor=C3.N(.2,.2,.2);Music=1301290348,LeftWing={0,BrickColor.new'Lilac'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Neon};WingAnim='Mythic'};
		{Name="80s",Walkspeed=16,moveVal=5,Font=Enum.Font.Jura,StrokeColor=C3.N(.2,.2,.2);Music=1217805820,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='GEO'};
		{Name="THE VOID",Walkspeed=16,moveVal=5,Font=Enum.Font.Jura,StrokeColor=C3.N(.2,.2,.2);Music=1836762394,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='VOID'};
		{Name="90s",Walkspeed=66,moveVal=2,Font=Enum.Font.SourceSansItalic,StrokeColor=C3.N(.2,.2,.2);Music=1169573062,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='Solaris'};
		{Name="Inferno",Walkspeed=190,moveVal=5,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.2,.2,.2);Music=1609011649,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};WingAnim='bot2'};
		{Name="Volcanic",Walkspeed=190,moveVal=5,Font=Enum.Font.Antique,StrokeColor=C3.N(.2,.2,.2);Music=5865332363,LeftWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='bot3'};
		{Name="ILLUSION",Walkspeed=190,moveVal=5,Font=Enum.Font.Arcade,StrokeColor=C3.N(.6,.0,.9);Music=6545552463,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Hypnotic'};
		{Name="F0RG0TT3N",Walkspeed=14,moveVal=5,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,.0,0);Music=2598224585,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='LOST2'};
		{Name="Looped Error",Walkspeed=14,moveVal=5,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,.0,0);Music=2113856318,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='Error303'};
		{Name="HYPNOTIC",Walkspeed=190,moveVal=5,Font=Enum.Font.Arcade,StrokeColor=C3.N(.6,.0,.9);Music=873042302,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Hyposis'};
		{Name="DIMENSIONAL",Walkspeed=190,moveVal=5,Font=Enum.Font.Arcade,StrokeColor=C3.N(.6,.0,.9);Music=873042302,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Dimension'};
    	{Name="Toxicities",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSansBold,StrokeColor=C3.RGB(98,220,109);Music=983667055,LeftWing={0,BrickColor.new'Camo'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='Toxicities'};	
    	{Name="bored",Walkspeed=66,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(.2,.2,.2);Music=1117396305,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='ihavenothingtodo'};	
    	{Name="CaTAstOphIc",Walkspeed=66,moveVal=8,Font=Enum.Font.Antique,StrokeColor=C3.RGB(179, 0, 255);Music=930541401,LeftWing={0,BrickColor.new'Dark blue'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.Neon};WingAnim='Catastophic'};	
    	{Name="ยɭՇгครкเ๔๔є๔",Walkspeed=66,moveVal=8,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255, 0, 0);Music=4835535512,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='Blood'};	
    	{Name="Euclidiean",Walkspeed=66,moveVal=8,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255, 0, 0);Music=4615217001,LeftWing={0,BrickColor.new'Dark blue'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='Solid'};	
    	{Name="CMD:_____",Walkspeed=66,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=5042439286,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really red'.Color,Enum.Material.Neon};WingAnim='Glitch'};	
    	{Name="Sub-Normal",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(0, 0, 0);Music=983667055,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='Notnormal'};
	    {Name="WITHERED X",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(0, 0, 0);Music=983667055,LeftWing={0,BrickColor.new'Gray'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='Notnormal'};
    	{Name="Normal",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(0, 0, 0);Music=2910839557,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='normal'};	
    	{Name="DESTRUCTION",Walkspeed=66,moveVal=8,Font=Enum.Font.Antique,StrokeColor=C3.RGB(255, 0, 0);Music=4615964997,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Destruction'};	
    	{Name="CLOCKWISE",Walkspeed=16,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(255, 255, 255);Music=4755356172,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='FIGHT'};	
    	{Name="ⱧɎ₱ɆⱤ₴₭łĐĐɆĐ",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(0, 0, 0);Music=412333048,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='NUKE'};	
    	{Name="OMEGA",Walkspeed=66,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=577543579,LeftWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};WingAnim='OMEGA'};	
    	{Name="ARCADE",Walkspeed=66,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=6882952717,LeftWing={0,BrickColor.new'Brick yellow'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Brick yellow'.Color,Enum.Material.Neon};WingAnim='Cave'};	
    	{Name="WITHERED",Walkspeed=66,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=1470848774,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='WITHERED'};	
    	{Name="I N S A N E",Walkspeed=66,moveVal=8,Font=Enum.Font.Bodoni,StrokeColor=C3.RGB(255, 0, 0);Music=1899417820,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='Hell'};	
    	{Name="MENTALLY INSANE",Walkspeed=66,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.RGB(255, 0, 0);Music=2722935436,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='xd'};	
    	{Name="COMPLETELY LOST",Walkspeed=66,moveVal=8,Font=Enum.Font.Antique,StrokeColor=C3.RGB(0, 0, 0);Music=3539622212,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='COMPLETELYLOST'};	
    	{Name="Hydro",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(0, 0, 0);Music=4211108982,LeftWing={0,BrickColor.new'Dark blue'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};WingAnim='bot'};	
    	{Name="PSYCHO",Walkspeed=66,moveVal=8,Font=Enum.Font.IndieFlower,StrokeColor=C3.RGB(255, 0, 0);Music=1588725965,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='mylifeispain'};
    	{Name="UNMERCIFUL",Walkspeed=66,moveVal=8,Font=Enum.Font.IndieFlower,StrokeColor=C3.RGB(255, 0, 0);Music=6901111184,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='UNMERCIFUL1'};
    	{Name="CURED",Walkspeed=66,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.RGB(255, 238, 0);Music=5544632371,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='CURED'};
    	{Name="₴₱ØØ₭ł₮Ɏ₴",Walkspeed=66,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.RGB(1, 1, 1);Music=5544632371,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Neon};WingAnim='Spookbday'}; -- Made for Spookitys / Typical Flame for his bday!
    	{Name="Relax",Walkspeed=66,moveVal=8,Font=Enum.Font.SourceSans,StrokeColor=C3.RGB(0, 0, 0);Music=3013643030,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='inf'};
    	{Name="SHATTERED",Walkspeed=66,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.RGB(155, 0, 255);Music=4755976868,LeftWing={0,BrickColor.new'Royal purple'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='Shatter'};
    	{Name="disintegrated",Walkspeed=120,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=3539622212,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='nonexistant'};
    	{Name="E̶̠̰͕͔͂̐̓̾Ņ̷̢̗̖̰̗̤̘̈́̅̿̑Ḓ̶͍̖̗͇̞͓͈͕̌͂̍͗́͗͑̿͊͝ͅĻ̸̨̥̼̳̖̟͗̅̍̔͗̀̉̆͌̍E̴̘̝̘̻̞͗̂͒͛͊̀͘͝S̷͖̯̳̲̲͛͒̓͊Ş̷̩͇̣͙̩͓̺̎ͅ ̷̢͙̹͙̀̽͑̊̇̚̚͠S̷̡̱̠̳̻̖̳̻̉͌͋̒͌̔́I̴̢̼͈̩͛͑̚L̷̡͔̰̩̺̱͌͆́̓̋̆̓̈͘E̶̡͇̽̾͜N̷̛̼̺̈́̿̑̀͛͑̓͠͝C̴͍͔̆͊͋̅̕͜Ē̸̛̯͔̥̜̺͆",Walkspeed=120,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=3539622212,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='hi'};
    	{Name="BYE BYE",Walkspeed=120,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(0, 0, 0);Music=5841497754,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='bye'};
	}

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

	function newMotor(P0,P1,C0,C1)
		return NewInstance('Motor',P0,{Part0=P0,Part1=P1,C0=C0,C1=C1})
	end

	local welds = {}
	local WeldDefaults = {}

	table.insert(welds,newMotor(Torso,Head,CF.N(0,1.5,0),CF.N()))
	table.insert(welds,newMotor(Root,Torso,CF.N(),CF.N()))
	table.insert(welds,newMotor(Torso,RLeg,CF.N(.5,-1,0),CF.N(0,1,0)))
	table.insert(welds,newMotor(Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0)))
	table.insert(welds,newMotor(Torso,LLeg,CF.N(-.5,-1,0),CF.N(0,1,0)))
	table.insert(welds,newMotor(Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0)))

	WeldDefaults={}
	for i = 1,#welds do
		local v=welds[i]
		WeldDefaults[i]=v.C0
	end

	local NK,RJ,RH,RS,LH,LS=unpack(welds)

	local NKC0,RJC0,RHC0,RSC0,LHC0,LSC0=unpack(WeldDefaults)

	function makeMusic(id,pit,timePos)
		local sound = Torso:FindFirstChild(Player.Name.."song") or Char:FindFirstChild(Player.Name.."song")
		local parent = (MusicMode==2 and Char or Torso)
		if(not sound)then 
			sound = NewInstance("Sound",parent,{Name=Player.Name.."song",Volume=(MusicMode==3 and 0 or 5),Pitch=(pit or 1),Looped=true})
			NewInstance("EqualizerSoundEffect",sound,{HighGain=0,MidGain=2,LowGain=10})
		end
		if(id=='stop')then
			if(sound)then
				sound:Stop()
			end
		else
			local timePos = typeof(timePos)=='number' and timePos or sound.TimePosition
			sound.Volume = (MusicMode==3 and 0 or 5)
			sound.Name = Player.Name.."song"
			sound.Looped=true
			sound.SoundId = "rbxassetid://"..id
			sound.Pitch=(pit or 1)
			sound:Play()
			sound.TimePosition = timePos
		end
		return sound;
	end

	function playMusic(id,pitch,timePos)
		return makeMusic(id,pitch,timePos)
	end

	for _,v in next, Hum:GetPlayingAnimationTracks() do
		v:Stop(0);
	end

	-- SCRIPT STUFF --

	function swait(num)
		if num == 0 or num == nil then
			game:GetService("RunService").RenderStepped:wait()
		else
			for i = 0, num do
				game:GetService("RunService").RenderStepped:wait()
			end
		end
	end

	--// Effects \\--

	function Tween(obj,props,time,easing,direction,repeats,backwards)
		local info = TweenInfo.new(time or .5, easing or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out, repeats or 0, backwards or false)
		local tween = S.TweenService:Create(obj, info, props)

		tween:Play()
	end

	function StartShake(Settings)
		return true
	end

	function Camshake(shakedata)
		StartShake(shakedata)
	end

	local Effects=NewInstance("Folder",Char)
	Effects.Name=Player.Name..'Effects'


	function ShowDamage(Pos, Text, Time, Color)
		local Pos = Pos or V3.N(0, 0, 0)
		local Text = tostring(Text or "")
		local Time = Time or 2
		local Color = Color or C3.N(1, 0, 1)
		local EffectPart = Part(Effects,Color,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),CFrame.new(Pos),true,false)
		EffectPart.Transparency=1
		local BillboardGui = NewInstance("BillboardGui",EffectPart,{
			Size = UDim2.new(3,0,3,0),
			Adornee = EffectPart,
		})

		local TextLabel = NewInstance("TextLabel",BillboardGui,{
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = Text,
			TextColor3 = Color,
			TextScaled = true,
			Font = Enum.Font.ArialBold, 
		})
		S.Debris:AddItem(EffectPart, Time+.5)
		delay(0, function()
			local rot=math.random(-10,10)/15
			local raise=.2
			local Frames = Time/Frame_Speed
			for i=0,1.1,.02 do
				swait()
				TextLabel.Rotation=TextLabel.Rotation+rot
				raise=raise-.008
				EffectPart.Position = EffectPart.Position + Vector3.new(0, raise, 0)
				TextLabel.TextTransparency=i
				TextLabel.TextStrokeTransparency=i
			end
			if EffectPart and EffectPart.Parent then
				EffectPart:Destroy()
			end
		end)
	end


	local baseSound = IN("Sound")

	function Soond(parent,id,pitch,volume,looped,effect,autoPlay)
		local Sound = baseSound:Clone()
		Sound.SoundId = "rbxassetid://".. tostring(id or 0)
		Sound.Pitch = pitch or 1
		Sound.Volume = volume or 1
		Sound.Looped = looped or false
		if(autoPlay)then
			coroutine.wrap(function()
				repeat wait() until Sound.IsLoaded
				Sound.Playing = autoPlay or false
			end)()
		end
		if(not looped and effect)then
			Sound.Stopped:connect(function()
				Sound.Volume = 0
				Sound:destroy()
			end)
		elseif(effect)then
			warn("Sound can't be looped and a sound effect!")
		end
		Sound.Parent =parent or Torso
		return Sound
	end

	function SoondPart(id,pitch,volume,looped,effect,autoPlay,cf)
		local soundPart = NewInstance("Part",Effects,{Transparency=1,CFrame=cf or Torso.CFrame,Anchored=true,CanCollide=false,Size=V3.N()})
		local Sound = IN("Sound")
		Sound.SoundId = "rbxassetid://".. tostring(id or 0)
		Sound.Pitch = pitch or 1
		Sound.Volume = volume or 1
		Sound.Looped = looped or false
		if(autoPlay)then
			coroutine.wrap(function()
				repeat wait() until Sound.IsLoaded
				Sound.Playing = autoPlay or false
			end)()
		end
		if(not looped and effect)then
			Sound.Stopped:connect(function()
				Sound.Volume = 0
				soundPart:destroy()
			end)
		elseif(effect)then
			warn("Sound can't be looped and a sound effect!")
		end
		Sound.Parent = soundPart
		return Sound,soundPart
	end

	function SoundPart(...)
		return SoondPart(...)
	end

	function Sound(...)
		return Soond(...)
	end

	function Part(parent,color,material,size,cframe,anchored,cancollide)
		local part = IN("Part")
		part.Parent = parent or Char
		part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
		part.Material = material or Enum.Material.SmoothPlastic
		part.TopSurface,part.BottomSurface=10,10
		part.Size = size or V3.N(1,1,1)
		part.CFrame = cframe or CF.N(0,0,0)
		part.CanCollide = cancollide or false
		part.Anchored = anchored or false
		return part
	end

	function Weld(part0,part1,c0,c1)
		local weld = IN("Weld")
		weld.Parent = part0
		weld.Part0 = part0
		weld.Part1 = part1
		weld.C0 = c0 or CF.N()
		weld.C1 = c1 or CF.N()
		return weld
	end

	function Mesh(parent,meshtype,meshid,textid,scale,offset)
		local part = IN("SpecialMesh")
		part.MeshId = meshid or ""
		part.TextureId = textid or ""
		part.Scale = scale or V3.N(1,1,1)
		part.Offset = offset or V3.N(0,0,0)
		part.MeshType = meshtype or Enum.MeshType.Sphere
		part.Parent = parent
		return part
	end

	function GotEffect(data)
		-- just for easy reference
		local color = data.Color or Color3.new(.7,.7,.7);
		local endcolor = data.EndColor or nil;
		local mat = data.Material or Enum.Material.SmoothPlastic;
		local cframe = data.CFrame or CFrame.new();
		local endpos = data.EndPos or nil;
		local meshdata = data.Mesh or {}
		local sounddata = data.Sound or {}
		local size = data.Size or Vector3.new(1,1,1)
		local endsize = data.EndSize or Vector3.new(6,6,6)
		local rotinc = data.RotInc or {0,0,0} -- ONLY FOR LEGACY SYSTEM
		local transparency = data.Transparency or NumberRange.new(0,1)
		local acceleration = data.Acceleration or nil; -- ONLY FOR LEGACY SYSTEM
		local endrot = data.EndRotation or {0,0,0} -- ONLY FOR EXPERIMENTAL SYSTEM
		local style = data.Style or false; -- ONLY FOR EXPERIMENTAL SYSTEM
		local lifetime = data.Lifetime or 1;
		local system = data.FXSystem;
		local setpart = typeof(data.Part)=='string' and EffectFolder:FindFirstChild(tostring(data.Part)):Clone() or typeof(data.Part)=='Instance' and data.Part or nil

		local S,PM;

		local P = setpart or Part(Effects,color,mat,Vector3.new(1,1,1),cframe,true,false)

		if(not P:IsA'MeshPart' and not P:IsA'UnionOperation')then
			if(meshdata == "Blast")then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://20329976','',size,Vector3.new(0,0,-size.X/8))
			elseif(meshdata == 'Ring')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://559831844','',size,Vector3.new(0,0,0))
			elseif(meshdata == 'Slash1')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(size.X/10,.001,size.Z/10),Vector3.new(0,0,0))
			elseif(meshdata == 'Slash2')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(size.X/1000,size.Y/100,size.Z/100),Vector3.new(0,0,0))
			elseif(meshdata == 'Tornado1')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://443529437','',size/10,Vector3.new(0,0,0))
			elseif(meshdata == 'Tornado2')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://168892432','',size/4,Vector3.new(0,0,0))
			elseif(meshdata == 'Skull')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://4770583','',size*2,Vector3.new(0,0,0))
			elseif(meshdata == 'Crystal')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://9756362','',size,Vector3.new(0,0,0))
			elseif(meshdata == 'Cloud')then
				PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://1095708','',size,Vector3.new(0,0,0))
			elseif(typeof(meshdata) == 'table')then
				local Type = meshdata.Type or Enum.MeshType.Brick
				local ID = meshdata.ID or '';
				local Tex = meshdata.Texture or '';
				local Offset = meshdata.Offset or Vector3.new(0,0,0)
				PM = Mesh(P,Type,ID,Tex,size,Offset)
			else
				PM = Mesh(P,Enum.MeshType.Brick,'','',size)
			end
		end
		local startTrans = typeof(transparency) == 'number' and transparency or typeof(transparency) == 'NumberRange' and transparency.Min or typeof(transparency) == 'table' and transparency[1] or 0
		local endTrans = typeof(transparency) == 'NumberRange' and transparency.Max or typeof(transparency) == 'table' and transparency[2] or 1

		P.Material = mat
		P.CFrame = cframe
		P.Color = (typeof(color)=='BrickColor' and color.Color or color)
		P.Anchored = true
		P.CanCollide = false
		P.Transparency = startTrans
		P.Parent = Effects
		local random = Random.new();
		game:service'Debris':AddItem(P,lifetime+3)


		-- actual effect stuff
		local mult = 1;
		if(PM)then
			if(PM.MeshId == 'rbxassetid://20329976')then
				PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
			elseif(PM.MeshId == 'rbxassetid://4770583')then
				mult = 2
			elseif(PM.MeshId == 'rbxassetid://168892432')then
				mult = .25
			elseif(PM.MeshId == 'rbxassetid://443529437')then
				mult = .1
			elseif(PM.MeshId == 'rbxassetid://443529437')then
				mult = .1
			end
		end	
		coroutine.wrap(function()
			if(system == 'Legacy' or system == 1 or system == nil)then
				local frames = (typeof(lifetime) == 'NumberRange' and random:NextNumber(lifetime.Min,lifetime.Max) or typeof(lifetime) == 'number' and lifetime or 1)*Frame_Speed
				for i = 0, frames do
					local div = (i/frames)
					P.Transparency=(startTrans+(endTrans-startTrans)*div)

					if(PM)then PM.Scale = size:lerp(endsize*mult,div) else P.Size = size:lerp(endsize*mult,div) end

					local RotCF=CFrame.Angles(0,0,0)

					if(rotinc == 'random')then
						RotCF=CFrame.Angles(math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)))
					elseif(typeof(rotinc) == 'table')then
						RotCF=CFrame.Angles(unpack(rotinc))
					end

					if(PM and PM.MeshId == 'rbxassetid://20329976')then
						PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
					end

					if(endpos and typeof(endpos) == 'CFrame')then
						P.CFrame=cframe:lerp(endpos,div)*RotCF
					elseif(acceleration and typeof(acceleration) == 'table' and acceleration.Force)then
						local force = acceleration.Force;
						if(typeof(force)=='CFrame')then
							force=force.p;
						end
						if(typeof(force)=='Vector3')then
							if(acceleration.LookAt)then
								P.CFrame=(CFrame.new(P.Position,force)+force)*RotCF
							else
								P.CFrame=(P.CFrame+force)*RotCF
							end
						end
					else
						P.CFrame=P.CFrame*RotCF
					end

					if(endcolor and typeof(endcolor) == 'Color3')then
						P.Color = color:lerp(endcolor,div)
					end
					swait()
				end
				P:destroy()
			elseif(system == 'Experimental' or system == 2)then
				local info = TweenInfo.new(lifetime,style,Enum.EasingDirection.InOut,0,false,0)
				local info2 = TweenInfo.new(lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
				if(style == Enum.EasingStyle.Elastic)then
					info = TweenInfo.new(lifetime*2,style,Enum.EasingDirection.Out,0,false,0)
				elseif(style == Enum.EasingStyle.Bounce)then
					info = TweenInfo.new(lifetime,style,Enum.EasingDirection.Out,0,false,0)
				end
				local tweenPart = game:service'TweenService':Create(P,info2,{
					CFrame=(typeof(endpos) == 'CFrame' and endpos or P.CFrame)*CFrame.Angles(unpack(endrot)),
					Color=typeof(endcolor) == 'Color3' and endcolor or color,
					Transparency=endTrans,
				})
				local off = Vector3.new(0,0,0)
				if(PM.MeshId == 'rbxassetid://20329976')then off=Vector3.new(0,0,(endsize*mult).Z/8) end

				local tweenMesh = game:service'TweenService':Create(PM,info,{
					Scale=endsize*mult,
					Offset=off,
				})
				tweenPart:Play()
				tweenMesh:Play()
			end
		end)()
	end

	function Effect(edata)
		GotEffect(edata)
	end

	function Trail(data)
		coroutine.wrap(function()
			data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
			data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
			local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
			data.EndPos=nil
			local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
			trailPart.Transparency=1
			local start = data.CFrame
			for i = 1, data.Frames do
				trailPart.CFrame = start:lerp(ep,i/data.Frames)
				data.CFrame = trailPart.CFrame
				Effect(data)
				swait()
			end	
		end)()
	end

	function ClientTrail(data)
		coroutine.wrap(function()
			data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
			data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
			local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
			data.EndPos=nil
			local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
			trailPart.Transparency=1
			local start = data.CFrame
			for i = 1, data.Frames do
				trailPart.CFrame = start:lerp(ep,i/data.Frames)
				data.CFrame = trailPart.CFrame
				GotEffect(data)
				swait()
			end	
		end)()
	end


	if(Char:FindFirstChild('NGRWings'..Player.Name))then
		Char['NGRWings'..Player.Name]:destroy()
	end

	for _,v in next, Char:children() do
		if(v.Name:lower():find'wings')then 
			v:destroy()
		end
	end

	local wingModel = Instance.new("Model",Char)
	wingModel.Name="NGRWings"..Player.Name
	local rightWing = NewInstance("Model",wingModel,{Name='Right'})
	local leftWing = NewInstance("Model",wingModel,{Name='Left'})

	local MPASword = {}
	for _,v in pairs(Char:GetChildren()) do
		if v:IsA("Accessory") and v.Name:find("MeshPartAccessory") and v.Handle.Size == Vector3.new(4,4,1) then
			table.insert(MPASword,v)
		end
	end

	local LWP1 = WingPiece:Clone();
	if MPASword[1] then
		for _,v in pairs(LWP1:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",LWP1.PrimaryPart)
		local atho = Instance.new("Attachment",LWP1.PrimaryPart)

		local HatChoice = MPASword[1]
		print(MPASword[1].Handle.Name)
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-2,0)
		atho.Rotation = Vector3.new(0,0,45)
		table.remove(MPASword,1)
	end
	LWP1.Parent = leftWing
	local LWP2 = WingPiece:Clone();
	if MPASword[1] then
		for _,v in pairs(LWP2:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",LWP2.PrimaryPart)
		local atho = Instance.new("Attachment",LWP2.PrimaryPart)

		local HatChoice = MPASword[1]
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-2,0)
		atho.Rotation = Vector3.new(0,0,45)
		table.remove(MPASword,1)
	end

	LWP2.Parent = leftWing
	local LWP3 = WingPiece:Clone();
	if Char:FindFirstChild("BladeMasterAccessory") then
		for _,v in pairs(LWP3:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",LWP3.PrimaryPart)
		local atho = Instance.new("Attachment",LWP3.PrimaryPart)

		local HatChoice = Char:FindFirstChild("BladeMasterAccessory")
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-1.75,0)
		atho.Rotation = Vector3.new(0,0,48)
	end
	LWP3.Parent = leftWing
	local RWP1 = WingPiece:Clone();
	if MPASword[1] then
		for _,v in pairs(RWP1:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",RWP1.PrimaryPart)
		local atho = Instance.new("Attachment",RWP1.PrimaryPart)

		local HatChoice = MPASword[1]
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-2,0)
		atho.Rotation = Vector3.new(0,0,45)
		table.remove(MPASword,1)
	end
	RWP1.Parent = rightWing
	local RWP2 = WingPiece:Clone();
	if MPASword[1] then
		for _,v in pairs(RWP2:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",RWP2.PrimaryPart)
		local atho = Instance.new("Attachment",RWP2.PrimaryPart)

		local HatChoice = MPASword[1]
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-2,0)
		atho.Rotation = Vector3.new(0,0,45)
		table.remove(MPASword,1)
	end
	RWP2.Parent = rightWing
	local RWP3 = WingPiece:Clone();
	if Char:FindFirstChild("ShadowBladeMasterAccessory") then
		for _,v in pairs(RWP3:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",RWP3.PrimaryPart)
		local atho = Instance.new("Attachment",RWP3.PrimaryPart)

		local HatChoice = Char:FindFirstChild("ShadowBladeMasterAccessory")
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-1.75,0)
		atho.Rotation = Vector3.new(0,0,48)
	end

	RWP3.Parent = rightWing
	local RWP4 = WingPiece:Clone();
	if Char:FindFirstChild("Meshes/Crystal MoonAccessory") then
		for _,v in pairs(RWP4:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",RWP4.PrimaryPart)
		local atho = Instance.new("Attachment",RWP4.PrimaryPart)

		local HatChoice = Char:FindFirstChild("Meshes/Crystal MoonAccessory")
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-1.5,0)
		atho.Rotation = Vector3.new(0,0,4)
	end

	RWP4.Parent = rightWing
	local RWP5 = WingPiece:Clone();
	if Char:FindFirstChild("Divine Aura") then
		for _,v in pairs(RWP5:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local athp = Instance.new("Attachment",RWP4.PrimaryPart)
		local atho = Instance.new("Attachment",RWP4.PrimaryPart)

		local HatChoice = Char:FindFirstChild("Divine Aura")
		HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
		HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

		athp.Position = Vector3.new(0,-1.5,0)
		atho.Rotation = Vector3.new(0,0,4)
	end



	RWP5.Parent = rightWing
	local LWP1W=Weld(LWP1.PrimaryPart,Torso,CF.N(2,-2,-1)*CF.A(0,0,0))
	local LWP2W=Weld(LWP2.PrimaryPart,Torso,CF.N(4.25,-1,-1)*CF.A(0,0,M.R(15)))
	local LWP3W=Weld(LWP3.PrimaryPart,Torso,CF.N(6.5,.5,-1)*CF.A(0,0,M.R(30)))

	local RWP1W=Weld(RWP1.PrimaryPart,Torso,CF.N(-2,-2,-1)*CF.A(0,0,0))
	local RWP2W=Weld(RWP2.PrimaryPart,Torso,CF.N(-4.25,-1,-1)*CF.A(0,0,M.R(-15)))
	local RWP3W=Weld(RWP3.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
	local RWP4W=Weld(RWP4.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
	local RWP5W=Weld(RWP5.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))

	local bbg=Head:FindFirstChild'Nametag' or NewInstance("BillboardGui",Head,{
		Adornee=Head;
		Name='Nametag';
		Size=UDim2.new(4,0,1.2,0);
		StudsOffset=V3.N(-8,5.3,0);
	})
	local text=bbg:FindFirstChild'TextLabel' or NewInstance("TextLabel",bbg,{
		Size=UDim2.new(5,0,3.5,0);
		TextScaled=true;
		BackgroundTransparency=1;
		TextStrokeTransparency=0;
		Font=Enum.Font.Arcade;
		TextColor3=C3.N(1,1,1);
		Text='POWER'
	})

	function getMode(modeName)
		for i,v in next, modeInfo do
			if(v.Name==modeName)then
				return v
			end
		end
		return modeInfo[1]
	end

	function IsVaporwave(song)
		for i = 1,#VaporwaveSongs do
			if(VaporwaveSongs[i]==song)then
				return true
			end
		end
		return false
	end

	local blush = NewInstance('Decal',Head,{Transparency=1,Texture='rbxassetid://0',Color3=(Player.UserId==5719877 and C3.N(.45,0,1) or C3.N(1,0,0))})

	function changeMudo(modeName)
		local info = getMode(modeName)
		Mode=info.Name
		WalkSpeed=info.Walkspeed
		movement=info.moveVal
		music=makeMusic(info.Music or 0,info.Pitch or 1,info.TimePos or music and music.TimePosition or 0)
		WingAnim=info.WingAnim or 'NebG1'
		text.Text = info.Name
		text.TextColor3 = info.LeftWing[2]
		text.TextStrokeColor3 = info.StrokeColor
		text.Font=info.Font;
		if(Mode=='Love' or Mode=='Lust')then
			blush.Transparency=0
			blush.Texture='rbxassetid://2664127437'
		else
			blush.Transparency=1
			blush.Texture='rbxassetid://0'
		end
		for _,v in next,leftWing:GetDescendants() do
			if(v:IsA'BasePart' and v.Name~='Main')then
				--v.Transparency=info.LeftWing[1]
				v.Color=info.LeftWing[2]
				v.Material=info.LeftWing[3]
			elseif(v:IsA'Trail')then
				--v.Transparency=NumberSequence.new(info.LeftWing[1],1)
				v.Color=ColorSequence.new(info.LeftWing[2])	
			end
		end

		for _,v in next,rightWing:GetDescendants() do
			if(v:IsA'BasePart' and v.Name~='Main')then
				--v.Transparency=info.RightWing[1]
				v.Color=info.RightWing[2]
				v.Material=info.RightWing[3]
			elseif(v:IsA'Trail')then
				--v.Transparency=NumberSequence.new(info.RightWing[1],1)
				v.Color=ColorSequence.new(info.RightWing[2])	
			end
		end

		PrimaryColor = info.PrimaryColor or info.LeftWing[2]
	end

	function changeMode(modeName)
		changeMudo(modeName)
	end	

	function syncStuff(data)
		local neut,legwelds,c0s,c1s,sine,mov,walk,inc,musicmode,tpos,pit,wingsin,visSett,mode,newhue=unpack(data)
		local head0,torso0,rleg0,rarm0,lleg0,larm0=unpack(c0s)
		local head1,torso1,rleg1,rarm1,lleg1,larm1=unpack(c1s)
		legAnims=legwelds
		NeutralAnims=neut
		if(not neut)then
			NK.C0=head0
			RJ.C0=torso0
			RH.C0=rleg0
			RS.C0=rarm0
			LH.C0=lleg0
			LS.C0=larm0

			NK.C1=head1
			RJ.C1=torso1
			RH.C1=rleg1
			RS.C1=rarm1
			LH.C1=lleg1
			LS.C1=larm1
		end
		if(Mode~=mode)then
			changeMudo(mode)
		end
		movement=mov
		walking=walk
		Change=inc
		print(MusicMode,musicmode)
		if(musicmode~=MusicMode and music)then
			MusicMode=musicmode
			if(MusicMode==1)then
				music:Pause()
				music.Volume=5
				music.Parent=Torso
				music:Resume()
			elseif(MusicMode==2)then
				music:Pause()
				music.Volume=5
				music.Parent=Char
				music:Resume()
			elseif(MusicMode==3)then
				music.Volume = 0
			end
		end
		if(Sine-sine>.8 or Sine-sine<-.8)then
			Sine=sine
		end
		if(hue-newhue>.8 or hue-newhue<-.8)then
			hue=newhue
		end
		if(WingSine-wingsin>.8 or WingSine-wingsin<-.8)then
			WingSine=wingsin
		end
		if(music and (music.TimePosition-tpos>.8 or music.TimePosition-tpos<-.8))then
			music.TimePosition=tpos
		end
		if(music and pit)then
			music.Pitch = pit
		end
		if(Mode=='Troubadour' and music.SoundId~='rbxassetid://'..visSett.Music)then
			music.SoundId='rbxassetid://'..visSett.Music
		end
		getMode('Troubadour').Music = visSett.Music
		getMode('Troubadour').Pitch = visSett.Pitch
	end


	local footstepSounds = {
		[Enum.Material.Grass]=510933218;
		[Enum.Material.Metal]=1263161138;
		[Enum.Material.CorrodedMetal]=1263161138;
		[Enum.Material.DiamondPlate]=1263161138;
		[Enum.Material.Wood]=2452053757;
		[Enum.Material.WoodPlanks]=2452053757;
		[Enum.Material.Sand]=134456884;
		[Enum.Material.Snow]=2452051182;
	}


	function Vaporwaveify(s)
		local function wide(a)
			if a<'!' or a>'~' then return a end
			if a==' ' then return '  ' end 
			a = a:byte()+160
			if a<256 then return string.char(239,188,a-64) end
			return string.char(239,189,a-128)
		end
		return(s:gsub(".",wide))
	end



	function Choot(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Antique,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
	end
	
		function Choot2(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Fantasy,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
		end
		
		
				function Choot8(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.SourceSans,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
		end
		
		function Choot3(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Fondamento,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
		end
		function Choot4(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.SourceSansItalic,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
	end

		function Choot5(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Arcade,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
		end
		function Choot6(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Jura,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
		end
		function Choot7(text)
		--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,15,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Bodoni,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='Troubadour')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
				wait((vaporwaveMode) and .1 or .025)
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='Troubadour' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
		--else
		--	Chat2(text)
		--end
	end

	function Chat(text)
		Choot(text)
	end
	
	function Chat7(text)
		Choot7(text)
	end
	
		function Chat8(text)
		Choot8(text)
	end
	
    function Chat2(text)
		Choot2(text)
    end
    
    function Chat3(text)
		Choot3(text)
    end
    
    function Chat4(text)
		Choot4(text)
    end

    function Chat5(text)
		Choot5(text)
    end
    
    function Chat6(text)
		Choot6(text)
	end

	function DealDamage(...)
		return true
	end

	function getRegion(point,range,ignore)
		return workspace:FindPartsInRegion3WithIgnoreList(R3.N(point-V3.N(1,1,1)*range/2,point+V3.N(1,1,1)*range/2),ignore,100)
	end
	function AOEDamage(where,range,options)
		local hit = {}
		for _,v in next, getRegion(where,range,{Char}) do
			if(v.Parent and v.Parent:FindFirstChildOfClass'Humanoid' and not hit[v.Parent:FindFirstChildOfClass'Humanoid'])then
				local callTable = {Who=v.Parent}
				hit[v.Parent:FindFirstChildOfClass'Humanoid'] = true
				for _,v in next, options do callTable[_] = v end
				DealDamage(callTable)
			end
		end
		return hit
	end


	function Click1()
		Attack=true
		NeutralAnims=false
		legAnims=false
		local orig = WalkSpeed
		WalkSpeed=4
		for i = 0, 1, 0.1 do
			swait()
			local Alpha = .3
			RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(-44.6),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.8,-1,-0.3)*CF.A(M.R(-17.4),M.R(44.4),M.R(7.1)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.4,-1,0)*CF.A(M.R(1.6),M.R(-13.1),M.R(7)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.3)*CF.A(M.R(90),M.R(0),M.R(-44.6)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.1)*CF.A(M.R(90),M.R(0),M.R(-44.6)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(44.6),M.R(0)),Alpha)
		end
		for i = 0, 1, 0.1 do
			swait()
			AOEDamage(RArm.CFrame.p,2,{
				DamageColor=(Mode=='Troubadour' and C3.HSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor);
				MinimumDamage=5;
				MaximumDamage=15;
			})
			local Alpha = .3
			RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.7)*CF.A(M.R(0),M.R(50.5),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7,-0.6)*CF.A(M.R(-26),M.R(0),M.R(0)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.6,-1.1,-0.1)*CF.A(M.R(20.2),M.R(-47.6),M.R(15.2)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,0)*CF.A(M.R(0),M.R(0),M.R(-20.4)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(50.5)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(-50.5),M.R(0)),Alpha)
		end
		WalkSpeed=orig
		legAnims=true
		Attack=false
		NeutralAnims=true
	end

	function SwordSummon()
		Attack = true
		NeutralAnims = false
		local orig=WalkSpeed
		WalkSpeed=4
		legAnims=false
		for i = 0, 1, 0.1 do
			swait()
			local Alpha = .3
			Effect{
				Lifetime=.25;
				Mesh={Type=Enum.MeshType.Sphere};
				CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
				Color=PrimaryColor;
				Transparency={.5,1};
				Material=Enum.Material.Neon;
				Size=Vector3.new(.6,1,.6);
				EndSize=Vector3.new(.1,3,.1);
			}
			RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,-0.1)*CF.A(M.R(-12.4),M.R(-15.7),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7,-0.5)*CF.A(M.R(16.2),M.R(15.2),M.R(-0.8)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(-28.5),M.R(0),M.R(0)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1.4,0.5,0)*CF.A(M.R(27.2),M.R(-3.8),M.R(-5)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.3,0.6,0)*CF.A(M.R(-33.8),M.R(-18.1),M.R(24.8)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(13.4),M.R(15.3),M.R(-3.6)),Alpha)
		end
		for i = 0, 5 do
			delay(.05*i,function()
				local pos = Root.CFrame*CF.N(0,-2,-2-i*4)*CF.A(M.R(80),0,0)
				local pos2 = Root.CFrame*CF.N(0,-3,-2-i*4)
				Camshake({
					Duration=.2;
					FadeOut=.2;
					Intensity=1.5;
					Position=Vector3.new(.5,.5,.5);
					Rotation=Vector3.new(.5,.5,3);
					DropDist=15;
					IneffectiveDist=40;
					Origin=pos2;
				})
				AOEDamage(pos.p,5,{
					DamageColor=(Mode=='Troubadour' and C3.HSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor);
					MinimumDamage=(Mode=='Troubadour' and music.PlaybackLoudness/10 or 10);
					MaximumDamage=(Mode=='Troubadour' and music.PlaybackLoudness/8 or 35);
				})
				SoundPart(178452221,1,2,false,true,true,pos)
				Effect{
					Lifetime=.4;
					Part='Sword',
					--Mesh={Type=Enum.MeshType.Sphere};
					CFrame=pos;
					Color=PrimaryColor;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=V3.N(0.8,2.5,6.8);
					EndSize=V3.N(0.8,2.5,16);
				}
				Effect{
					Lifetime=.4;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=pos2;
					Color=PrimaryColor;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=V3.N(4,.1,4);
					EndSize=V3.N(6,.1,6);
				}
				Effect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=pos;
					Color=PrimaryColor;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=V3.N(7,7,7);
					EndSize=V3.N(12,12,12);
				}
				for i = 1, 5 do
					Effect{
						Lifetime=.5;
						Mesh={Type=Enum.MeshType.Sphere};
						CFrame=pos;
						Color=PrimaryColor;
						Transparency={0,1};
						Material=Enum.Material.Neon;
						Size=V3.N(1,1,1);
						EndSize=V3.N(1,1,1);
						Acceleration={Force=V3.N(M.RNG(-75,75)/100,M.RNG(-75,75)/100,M.RNG(-75,75)/100)};
					}
				end
			end)
		end
		for i = 0, 1, 0.1 do
			swait()
			local Alpha = .3
			RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(70.7),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(-14.4)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.6,-1,0)*CF.A(M.R(15.1),M.R(-63.2),M.R(13.5)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1.3,0.6,-0.1)*CF.A(M.R(0),M.R(15.9),M.R(-25.4)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.4,0.3,-0.2)*CF.A(M.R(0),M.R(19.3),M.R(157.1)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(-70.7),M.R(0)),Alpha)
		end
		legAnims=true
		WalkSpeed=orig
		Attack = false
		NeutralAnims = true
	end

	function Bombs()
		Attack=true
		NeutralAnims=false
		legAnims=false
		local orig = WalkSpeed
		WalkSpeed=0
		for i = 0, 1, 0.1 do
			swait()
			local Alpha = .3
			RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(19.1)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(-21.3)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		end
		coroutine.wrap(function()
			for i = 0, 2 do
				Camshake({
					Duration=.2;
					FadeOut=.2;
					Intensity=1.5;
					Position=Vector3.new(.5,.5,.5);
					Rotation=Vector3.new(.5,.5,3);
					DropDist=15;
					IneffectiveDist=40;
					Origin=Root.CFrame*CF.N(0,0,-4-i*4);
				})
				SoundPart(206083252,.8,4,false,true,true,Root.CFrame*CF.N(0,0,-4-i*4))
				AOEDamage(Root.CFrame*CF.N(0,0,-4-i*4).p,5,{
					DamageColor=PrimaryColor;
					MinimumDamage=25;
					MaximumDamage=45;
				})
				Effect{
					Lifetime=.4;
					Mesh={Type=Enum.MeshType.Sphere};
					Color=PrimaryColor;
					Material=Enum.Material.Neon;
					CFrame=Root.CFrame*CF.N(0,0,-4-i*4);
					Size=V3.N(1,1,1);
					EndSize=V3.N(10,10,10);
				}
				Effect{
					Lifetime=.4;
					Part='Ring';
					Color=PrimaryColor;
					Material=Enum.Material.Neon;
					CFrame=Root.CFrame*CF.N(0,0,-4-i*4)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					RotInc={M.RNG(-25,25)/100,M.RNG(-25,25)/100,M.RNG(-25,25)/100};
					Size=V3.N(4,4,.2);
					EndSize=V3.N(13,13,.2);
				}
				Effect{
					Lifetime=.4;
					Part='Ring';
					Color=PrimaryColor;
					Material=Enum.Material.Neon;
					CFrame=Root.CFrame*CF.N(0,0,-4-i*4)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					RotInc={M.RNG(-25,25)/100,M.RNG(-25,25)/100,M.RNG(-25,25)/100};
					Size=V3.N(4,4,.2);
					EndSize=V3.N(13,13,.2);
				}
				swait(4)
			end
		end)()
		for i = 0, 1, 0.1 do
			swait()
			local Alpha = .3
			RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,0.7)*CF.A(M.R(18.2),M.R(0),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.4)*CF.A(M.R(-33.4),M.R(0),M.R(0)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,-0.2)*CF.A(M.R(-6.7),M.R(0),M.R(0)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4,0.1)*CF.A(M.R(90.7),M.R(-2.5),M.R(-50)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,0.2)*CF.A(M.R(89.5),M.R(2.6),M.R(50)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		end
		WalkSpeed=orig
		legAnims=true
		Attack=false
		NeutralAnims=true
	end


	function ClickCombo()
		ClickTimer=180
		if(Combo==1)then
			Click1()
			Combo=2
		elseif(Combo==2)then
			SwordSummon()
			Combo=3
		elseif(Combo==3)then
			Bombs()
			Combo=1
		end
	end

	function VaporTaunt()
		Attack = true
		NeutralAnims = false
		local orig=WalkSpeed
		WalkSpeed=0
		legAnims=false
		Chat"You need to chill out.."
		for i = 0, 14, 0.1 do
			swait()
			local Alpha = .1
			RJ.C0 = RJ.C0:lerp(CF.N(-0.1,-0.1-.1*M.S(Sine/36),0.6)*CF.A(M.R(55.3+2.5*M.C(Sine/36)),M.R(0),M.R(0)),Alpha)
			LH.C0 = LH.C0:lerp(CF.N(-0.6,-1.2,-0.1)*CF.A(M.R(56.3+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
			RH.C0 = RH.C0:lerp(CF.N(0.9,-1.2,-0.2)*CF.A(M.R(25+5*M.C(Sine/36)),M.R(3.5),M.R(-43.9)),Alpha)
			LS.C0 = LS.C0:lerp(CF.N(-1,0.8,0)*CF.A(M.R(11.4-5*M.C(Sine/42)),M.R(-3.3),M.R(137.5)),Alpha)
			RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.2)*CF.A(M.R(61-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
			NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.3)*CF.A(M.R(-38.9-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
		end
		legAnims=true
		WalkSpeed=orig
		Attack = false
		NeutralAnims = true
	end



	UIS.InputBegan:connect(function(io,gpe)
		if(gpe or Attack or data.User~=data.Local)then return end
		--MODES
		if(io.KeyCode == Enum.KeyCode.One and Mode~='POWER')then 
			changeMode'POWER'
			game.Lighting.FogEnd = 999999999
			Chat7"THE EARTH QUAKES BENEATH ME!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[POWER] THE EARTH QUAKES BENEATH ME!", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.U and Mode=='POWER')then 
			changeMode'FORCE'
			game.Lighting.FogEnd = 999999999
			Chat7"THE EARTH QUAKES BENEATH ME!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[POWER] THE EARTH QUAKES BENEATH ME!", "All")
else
end


elseif(io.KeyCode == Enum.KeyCode.U and Mode=='PSYCHO')then 
			changeMode'F0RG0TT3N'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"End my forgotten existence"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[FORGOTTEN] end my FORGOTTEN existence", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.P and Mode=='S P A C E T I M E')then 
			changeMode'PULSAR'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat"Pulsing Energy"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[PULSAR] PULSING ENERGY", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.T and Mode=='PUNISHED')then 
			changeMode'HYBRID'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"I AM YOU AND ME!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[HYBRID] 2 Of Us?", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.U and Mode=='PSYCHO')then 
			changeMode'F0RG0TT3N'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"End my forgotten existence"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[FORGOTTEN] end my FORGOTTEN existence", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='DESTRUCTION')then 
			changeMode'APCOCLYPTIC'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"APOCOLYPSE!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[APCOCLYPTIC] HAHAHAHAHAHAH", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.U and Mode=='ACE-OF-SPADES')then 
			changeMode'BURNING BRAIN'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"WEILD THE POWER"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ZENITH] THE ALMIGHTY!", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.H and Mode=='MURDEROUS')then 
			changeMode'PUNISHED'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"YOU SHALL BE PUNISHED"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[PUNISHED] YOU SHALL BE PUNISHED.", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.L and Mode~='ACE-OF-SPADES')then 
			changeMode'ACE-OF-SPADES'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"LETS SEE SOME MAGIC!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[PUNISHED] YOU SHALL BE PUNISHED.", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.G and Mode=='S P A C E T I M E')then 
			changeMode'WORMHOLE'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"INSTANT TRAVEL"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[WORMHOLE] INSTANT TRAVEL", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='ECHO')then 
			changeMode'Deleterious'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"CLEAR THIS REALITY"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Deleterious] CLEAR THIS REALITY", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.B and Mode~='???')then 
			changeMode'???'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"Question your existence"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[???] Question your purpose...", "All")
else
end

elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='EXCALIBUR')then 
			changeMode'GREATSWORD'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"LONGEST SWORD KNOWN TO MAN"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[GREATSWORD] THE LARGEST SWORD", "All")
else
end



	elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='Toxicities')then 
			changeMode'Atomic Collisions'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"ATOMIC FUSION"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ATOMIC COLLISIONS] NUCLEAR FUSION", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='ยɭՇгครкเ๔๔є๔')then 
			changeMode'Lightning Cannon'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"LIGHTNING CANNON MODE, BY ME"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[LIGHTNING CANNON] I WILL STRIKE!", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.G and Mode=='MURDEROUS')then 
			changeMode'ECHO'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat8"Ɇ₵ⱧØ Has Arrived."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Player.Name.." Has Arrived", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='ECHO')then 
			changeMode'Ɇ₵ⱧØ'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat8"Ɇ₵ⱧØ Has Arrived."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Cheems glitcher v1.2] Welcome "..game.Players.LocalPlayer.Name.."...", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='SINGULARITY')then 
			changeMode'THE VOID'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"ETERNAL DARKNESS"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[THE VOID] ENDLESS DARKNESS!", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.V and Mode~='INEVITABLE')then 
			changeMode'INEVITABLE'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"Everything you know is in your mind..."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[INEVITABLE] Everything you know is in your mind...", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.B and Mode~='Nefarious')then 
			changeMode'Nefarious'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"JUST DIE ALREADY!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Nefarious] JUST DIE ALREADY!", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='Nefarious')then 
			changeMode'UNMERCIFUL'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"I ₩Ø₦₮ spare you."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[UNMERCIFUL] DONT SPARE ANYONE", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='CURED')then 
			changeMode'SPEED OF LIGHT'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"FASTER THEN HYPER SPEED"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[SPEED OF LIGHT] BEYOND SPEED", "All")
else
end

	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='F0RG0TT3N')then 
			changeMode'R E M E M B E R E D'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 4
			Chat5"I AM NOT FORGOTTEN JUST YET!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[REMEMBERED!] I AM NOT FORGOTTEN YET!!", "All")
else
end


	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='bored')then 
			changeMode'CLOCKWISE'
			game.Lighting.FogEnd = 999999999
			game.Lighting.ClockTime = 14
			Chat5"CLOCKWISE"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[CLOCKWISE] FORWARD OF TIME", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Two and Mode~='Splits')then 
			changeMode'Splits'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Splits] Ha!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.C and Mode~='PLATFORM')then 
			changeMode'PLATFORM'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[PLATFORM] is this helicopter?", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='POWER')then 
			changeMode'EXCALIBUR'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"I WILL DESTROY YOU!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[EXCALIBUR] YOU CANT DEFEAT ME!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='EXCALIBUR')then 
			changeMode'EXCALIBUR X'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"YOU THINK I WOULD FALL THAT EASY?!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[EXCALIBUR X] TRY AGAIN!!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='EXCALIBUR X')then 
			changeMode'EXCALIBUR'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[LETS GO BACK.. BUT NOT TOO FAR BACK.] Ha!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='ยɭՇгครкเ๔๔є๔')then 
			changeMode'ⱧɎ₱ɆⱤ₴₭łĐĐɆĐ'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"ł ₩łⱠⱠ ĐɆ₴₮ⱤØɎ ₮Ⱨł₴ ⱤɆ₳Ⱡł₮Ɏ"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ⱧɎ₱ɆⱤ₴₭łĐĐɆĐ] I WILL CORRUPT EVERYTHING!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.R and Mode=='S P A C E T I M E')then 
			changeMode'OMEGA'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[OMEGA] Ha!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.R and Mode=='MURDEROUS')then 
			changeMode'WITHERED'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"CEASE TO EXIST"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[WITHERED] CEASE TO EXIST!", "All")
else
end


		elseif(io.KeyCode == Enum.KeyCode.R and Mode=='ERROR_404')then 
			changeMode'SYSTEM_32'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[SYSTEM 32] ERROR", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='ERROR_404')then 
			changeMode'ARCADE'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ARCADE] 1000 - 0!", "All")
else
end


		elseif(io.KeyCode == Enum.KeyCode.X and Mode~='FUTURE')then 
			changeMode'FUTURE'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"10,000 YEARS!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[FUTURE] IM 10000 YEARS AHEAD OF YOU!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='POWER')then 
			changeMode'YING-YANG'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat2"Perfectly Balanced. As all things should be..."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[YING YANG] Perfectly Balanced. As all things should be...", "All")
else
end


		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='S P A C E T I M E')then 
			changeMode'Euclidiean'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"I Control every state of matter"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Euclidiean] SOLIDS", "All")
else
end


		elseif(io.KeyCode == Enum.KeyCode.E and Mode=='S P A C E T I M E')then 
			changeMode'DIMENSIONAL'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"INTER DIMENSIONAL!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[DIMENSIONAL] INTER DIMENSIONAL", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Liar X')then 
			changeMode'INFINITE'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat7"INFINITE POWER!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[INFINITE] INFINITE POWER!", "All")
else
end



		elseif(io.KeyCode == Enum.KeyCode.P and Mode=='MURDEROUS')then 
			changeMode'CRAZED'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"LETS SEE HOW LONG YOU LAST"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[CRAZED] LETS SEE HOW LONG YOU LAST!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.U and Mode=='MURDEROUS')then 
			changeMode'Liar X'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"I WILL BREAK THE TRUTH"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Liar X] I WILL BREAK THE TRUTH!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='S P A C E T I M E')then 
			changeMode'SINGULARITY'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"DES(^(UC*&*&ION"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[SINGULARITY] DESTROYED UNIVERSE", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='ILLUSION')then 
			changeMode'HYPNOTIC'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
		    Chat5"I WILL CONTROL YOU"
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[HYPNOTIC] I CAN CONTROL ANYTHING", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Z and Mode~='bored')then 
			changeMode'bored'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
		if voicelines == false then
		    Chat5"You make me bored every second of your existence"
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[bored] e", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='Sub-Normal')then 
			changeMode'ILLUSION'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat5"Everything is not as it seems"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ILLUSION] EVERYTHING IS NOT AS IT SEEMS", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Inferno')then 
			changeMode'Volcanic'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat3"RAINING FIRE!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Volcanic] RAINING FIRE", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='I N S A N E')then 
			changeMode'Fearless'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat"FEARLESS"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[FEARLESS] I FEAR NOTHING!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Three and Mode~='Overclocked')then 
			changeMode'Overclocked'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 999999999
		    Chat4"Hyper Power!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Over-clocked] Hyper power!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Overclocked')then 
			changeMode'TIME WARP'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 999999999
		    Chat4"Warping through time..."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[TIME WARP] I Difine who everyone is.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Four and Mode~='S P A C E T I M E')then 
			changeMode'S P A C E T I M E'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 40000
						Chat5"BENDING SPACE AND TIME..."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[S P A C E T I M E] Bending time and space!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Five and Mode~='ERROR_404')then 
			changeMode'ERROR_404'
			game.lighting.ClockTime = 3
			game.lighting.FogEnd = 300
						Chat"$#%#E$%#$%$#RR%#%O$R"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ERROR_404] ___ __ _______", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Six and Mode~='MURDEROUS')then 
			changeMode'MURDEROUS'
			game.lighting.ClockTime = 4
			game.lighting.FogEnd = 600
			Chat"DIE!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[MURDEROUS] I regret nothing.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Seven and Mode~='DESTROYED')then 
			changeMode'DESTROYED'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000
			Chat"YOUR EXISTENCE IS A MISTAKE!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[DESTROYED] ENOUGH!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Eight and Mode~='god slayer')then 
			changeMode'god slayer'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000
			Chat"YOUR EXISTANCE IS OBSOLETE."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[god slayer] YOUR EXISTANCE IS OBSOLETE.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Nine and Mode~='Toxicities')then 
			changeMode'Toxicities'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Toxicities] Poison!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='MURDEROUS')then 
			changeMode'I N S A N E'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000000000
			Chat"TRUE CARNAGE"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[I N S A N E] INSANITY IS UPON US!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Q and Mode~='L0st')then 
			changeMode'L0st'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[L0st] Where am i?", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.F and Mode~='Destiny')then 
			changeMode'Destiny'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Destiny] DESTINY HAS LEFT ME HERE!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Destiny')then 
			changeMode'Calamity'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 6000000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Calamity] YOU IDIOT.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.M and Mode=='Calamity')then 
			changeMode'Catastrophe'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Catastrophe] Bout time this world ends!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.N and Mode=='Catastrophe')then 
			changeMode'Mythical'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Mythical] This world is my fantasy!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.B and Mode=='Catastrophe')then 
			changeMode'Cataclysm'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Cataclysm] CHAOS!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='90s')then 
			changeMode'80s'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600
			Chat6"Dont play games with me..."
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[80s] Im back in time...", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.R and Mode=='Sub-Normal')then 
			changeMode'90s'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[90s] Im already here!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Toxicities')then 
			changeMode'Radioactivity'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 300
            Chat"T O X I C"
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Radioactivity] I'LL TOXICATE YOU!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Catastrophe')then 
			changeMode'CaTAstOphIc'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 6000000000
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[CaTAstOphIc] TORN APART.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.R and Mode=='Splits')then 
			changeMode'ยɭՇгครкเ๔๔є๔'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000000
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ยɭՇгครкเ๔๔є๔] JJsploit is the best!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Z and Mode=='ERROR_404')then 
			changeMode'CMD:_____'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 6000000000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[CMD:_____] ERADICATE YOURSELF.", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='ERROR_404')then 
			changeMode'Looped Error'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 6000000000000000
			Chat"ENDLESS ERROR!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Looped Error] ERADICATE YOURSELF.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Zero and Mode~='Sub-Normal')then 
			changeMode'Sub-Normal'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 6000000000000
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Sub-Normal] I've Changed.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Sub-Normal')then 
			changeMode'Normal'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 6000000000000
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Normal] Nothing in particular.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='MURDEROUS')then 
			changeMode'DESTRUCTION'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 500
			Chat"IL SAVE YOU FROM THIS HELL CALLED EARTH!"
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[DESTRUCTION] I'LL FREE YOU FROM THIS HELL!", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='DESTRUCTION')then 
			changeMode'GENOCIDE'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 500
			Chat"I WILL KILL EVERYBODY"
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[DESTRUCTION] I'LL FREE YOU FROM THIS HELL!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='L0st')then 
			changeMode'COMPLETELY LOST'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 400
			Chat("L O S T")
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Completley Lost] Shattered across time and space.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.R and Mode=='L0st')then 
			changeMode'PSYCHO'
			game.lighting.ClockTime = 4
			game.lighting.FogEnd = 99999999999999999
			Chat"PSYCHOTIC"
			wait(1)
			Chat"ՇՇ*&$(*ՇՇՇ*&$(*&T(894ՇՇՇ8794"
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[PSYCHO] YOU CAN RUN BUT NOT HIDE!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Splits')then 
			changeMode'Relax'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 1000000000000
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Relax] ;)", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='DESTROYED')then 
			changeMode'SHATTERED'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000000
			Chat2"I WILL SHRED THE THIS WORLD TO ITS CORE"
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[SHATTERED] I'LL SHRED THIS EARTH DOWN TO ITS CORE.", "All")
else
end

		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='PSYCHO')then 
			changeMode'CURED'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000000
						Chat"How the tables turn."
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[CURED] How the tables turn.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.E and Mode=='L0st')then 
			changeMode'disintegrated'
			game.lighting.ClockTime = 2
			game.lighting.FogEnd = 600
			Chat"Faded..."
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[disintegrated] faded", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.T and Mode=='disintegrated')then 
			changeMode'E̶̠̰͕͔͂̐̓̾Ņ̷̢̗̖̰̗̤̘̈́̅̿̑Ḓ̶͍̖̗͇̞͓͈͕̌͂̍͗́͗͑̿͊͝ͅĻ̸̨̥̼̳̖̟͗̅̍̔͗̀̉̆͌̍E̴̘̝̘̻̞͗̂͒͛͊̀͘͝S̷͖̯̳̲̲͛͒̓͊Ş̷̩͇̣͙̩͓̺̎ͅ ̷̢͙̹͙̀̽͑̊̇̚̚͠S̷̡̱̠̳̻̖̳̻̉͌͋̒͌̔́I̴̢̼͈̩͛͑̚L̷̡͔̰̩̺̱͌͆́̓̋̆̓̈͘E̶̡͇̽̾͜N̷̛̼̺̈́̿̑̀͛͑̓͠͝C̴͍͔̆͊͋̅̕͜Ē̸̛̯͔̥̜̺͆'
game.lighting.ClockTime = 1
			game.lighting.FogEnd = 300
			Chat"Silence eternally"
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[ETERNAL SILENCE] THIS IS THE LAST STRAW!", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='L0st')then 
			changeMode'BYE BYE'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000
					if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[BYE BYE] My bodys looking wrong.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='PSYCHO')then 
			changeMode'MENTALLY INSANE'
			game.lighting.ClockTime = 3
			game.lighting.FogEnd = 200
			Chat"GIVE HELP PLEASE SAVE HEFKJH$IUF..."
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[MENTALLY INSANE] HELP M$(*&(*", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.U and Mode=='L0st')then 
			changeMode'₴₱ØØ₭ł₮Ɏ₴'
			game.lighting.ClockTime = 4
			game.lighting.FogEnd = 600	
		    Chat"Horrifing.."
			if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[SPOOKITYS] Horrifing.", "All")
else
end
		elseif(io.KeyCode == Enum.KeyCode.Y and Mode=='Inferno')then 
			changeMode'Hydro'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 600000000000
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Hydro] The sea is mine to command!", "All")
else
    end
				elseif(io.KeyCode == Enum.KeyCode.N and Mode~='Inferno')then 
			changeMode'Inferno'
			game.lighting.ClockTime = 14
			game.lighting.FogEnd = 60000000000000
			Chat2"BURN, BURN!!"
		if voicelines == false then
else
end
if voicelines == true then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Inferno] BURN, BURN!", "All")
else
    end
			--TOGGLE MUSIC
		elseif(io.KeyCode == Enum.KeyCode.M and getMode(Mode))then 
			MusicMode=MusicMode+1
			if(MusicMode>3)then MusicMode=1 end
			if(MusicMode==1)then
				music:Pause()
				music.Volume=5
				music.Parent=Torso
				music:Resume()
			elseif(MusicMode==2)then
				music:Pause()
				music.Volume=5
				music.Parent=Char
				music:Resume()
			elseif(MusicMode==3)then
				music.Volume = 0
			end
		elseif(io.KeyCode==Enum.KeyCode.B)then
			--TAUNTS
			if(vaporwaveMode and Mode=='Troubadour')then
				VaporTaunt()
			end
		end
		if(vaporwaveMode)then return end
		--ATTACKS
		if(io.UserInputType==Enum.UserInputType.MouseButton1)then
			ClickCombo()
		end
	end)

	WingAnims.NebG1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(3.5,4,-.0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.5,4,-.0)*CF.A(M.R(170+-6000*M.C(WingSine/322)),0,M.R(-90)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+150*M.C(WingSine/32)),0,M.R(30+400*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3.5,4,-.0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-90)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.5,4,-.0)*CF.A(M.R(170+-6000*M.C(WingSine/322)),0,M.R(-90)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+150*M.C(WingSine/32)),0,M.R(-30-400*M.C(WingSine/32))),.2)
		--SPIN
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	end
		WingAnims.Solaris=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.9,-2,-1)*CF.A(M.R(5+700*M.C(WingSine/100)),0,M.R(0+300*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(5.8,-1,-1)*CF.A(M.R(10+700*M.C(WingSine/100)),0,M.R(15+300*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.7,.5,-1)*CF.A(M.R(15+700*M.C(WingSine/100)),0,M.R(30+300*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.9,-2,-1)*CF.A(M.R(5+700*M.C(WingSine/100)),0,M.R(0-300*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5.8,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+700*M.C(WingSine/100)),0,M.R(-15-300*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.7,.5,-1)*CF.A(M.R(15+700*M.C(WingSine/100)),0,M.R(-30-300*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
		WingAnims.Blood=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,3,5)*CF.A(M.R(100+6000*M.C(WingSine/322)),0,M.R(-40)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,6,5)*CF.A(M.R(0+-6000*M.C(WingSine/322)),0,M.R(-40)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,9,5)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-40)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,5)*CF.A(M.R(100+6000*M.C(WingSine/322)),0,M.R(40)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,6,5)*CF.A(M.R(0+-6000*M.C(WingSine/322)),0,M.R(40)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,9,5)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(40)),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end

	WingAnims.NebG2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+.35*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+50*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+23.50*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120-50*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5-.15*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-50*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-23.50*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+50*M.C(WingSine/32))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.NebG3=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+-8345*M.C(WingSine/600))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+6042*M.C(WingSine/600))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+-6523*M.C(WingSine/600))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+7425*M.C(WingSine/600))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(-120+-5357*M.C(WingSine/600))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-1+8547*M.C(WingSine/600))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Hell=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0+0*M.C(WingSine/90),6,4)*CF.A(M.R(0+-6000*M.C(WingSine/322)),10,M.R(10-720*M.C(WingSine/200))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0+0*M.C(WingSine/90),6,4)*CF.A(M.R(120+-6000*M.C(WingSine/322)),10,M.R(0-720*M.C(WingSine/200))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0+0*M.C(WingSine/90),6,4)*CF.A(M.R(240+-6000*M.C(WingSine/322)),10,M.R(0-720*M.C(WingSine/200))),.2)
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0+0*M.C(WingSine/90),1,4)*CF.A(M.R(0+10000*M.C(WingSine/222)),10,M.R(0-720*M.C(WingSine/200))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0+0*M.C(WingSine/90),1,4)*CF.A(M.R(120+10000*M.C(WingSine/222)),10,M.R(0-720*M.C(WingSine/200))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0+0*M.C(WingSine/90),1,4)*CF.A(M.R(240+10000*M.C(WingSine/222)),10,M.R(0-720*M.C(WingSine/200))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Mythic=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-5*M.C(WingSine/32),2.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+180*M.C(WingSine/52))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-5*M.C(WingSine/32),2.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+180*M.C(WingSine/52))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-5*M.C(WingSine/32),2.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+180*M.C(WingSine/52))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-5*M.C(WingSine/32),2.5+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120+180*M.C(WingSine/52))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5*M.C(WingSine/32),2.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(150+180*M.C(WingSine/52))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-5*M.C(WingSine/32),2.5+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(210+180*M.C(WingSine/52))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.GEO=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-4,2)*CF.A(M.R(200+-10*M.C(WingSine/32)),0,M.R(0+0*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,2)*CF.A(M.R(200+-15*M.C(WingSine/32)),0,M.R(-15+0*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(-100+20*M.C(WingSine/32)),0,M.R(30+150*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-4,2)*CF.A(M.R(200+-10*M.C(WingSine/32)),0,M.R(0-0*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,2+.05*M.S(WingSine/35))*CF.A(M.R(200+-15*M.C(WingSine/32)),0,M.R(15-0*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(-100+20*M.C(WingSine/32)),0,M.R(-30-150*M.C(WingSine/32))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
		WingAnims.Toxicities=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+100*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+144*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5+5*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+1000*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5+5*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+1000*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),1.5+100*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-90+720*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(5+5*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90+1000*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(5+5*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+1000*M.C(WingSine/32))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Calam=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,4,-6)*CF.A(1,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.C(WingSine/400))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,4,-1)*CF.A(2,M.R(0+7.5*M.C(WingSine/32)),M.R(60+2000*M.C(WingSine/400))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,4,-6)*CF.A(1,M.R(0+5*M.C(WingSine/39)),M.R(120+2000*M.C(WingSine/400))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,4,-1)*CF.A(2,M.R(0+2.5*M.C(WingSine/36)),M.R(180+2000*M.C(WingSine/400))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,4,-6)*CF.A(1,M.R(0+7.5*M.C(WingSine/32)),M.R(240+2000*M.C(WingSine/400))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(1,4,-1)*CF.A(2,M.R(0+5*M.C(WingSine/39)),M.R(300+2000*M.C(WingSine/400))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.SPACETIME=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(3.5,1,-.9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.5,1,-.9)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(3.5,1,-.9)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3.5,1,-.9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.5,1,-.9)*CF.A(M.R(120+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-3.5,1,-.9)*CF.A(M.R(240+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Worm=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(3.5,3,-.9)*CF.A(M.R(0+6000*M.C(WingSine/1300)),0,M.R(-90)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.5,3,-.9)*CF.A(M.R(120+6000*M.C(WingSine/1300)),0,M.R(-90)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(3.5,3,-.9)*CF.A(M.R(240+6000*M.C(WingSine/1300)),0,M.R(-90)),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3.5,3,-.9)*CF.A(M.R(0+6000*M.C(WingSine/1300)),0,M.R(-90)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.5,3,-.9)*CF.A(M.R(120+6000*M.C(WingSine/1300)),0,M.R(-90)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-3.5,3,-.9)*CF.A(M.R(240+6000*M.C(WingSine/1300)),0,M.R(-90)),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Doom=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(2,M.R(0+2.5*M.C(WingSine/36)),M.R(60+20000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(2,M.R(0+7.5*M.C(WingSine/32)),M.R(120+25000*M.C(WingSine/2000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(2,M.R(0+5*M.C(WingSine/39)),M.R(180+30000*M.C(WingSine/3000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(2,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+35000*M.C(WingSine/4000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(2,M.R(0+7.5*M.C(WingSine/32)),M.R(-120+40000*M.C(WingSine/5000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(2,M.R(0+5*M.C(WingSine/39)),M.R(-1+45000*M.C(WingSine/6000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Dead=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,1.5,-4)*CF.A(-7.3,M.R(3+2.5*M.C(WingSine/36)),M.R(0+-8000*M.C(WingSine/900))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,1.5,-4)*CF.A(-7.3,M.R(6+7.5*M.C(WingSine/32)),M.R(60+-8000*M.C(WingSine/900))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(2,1.5,-4)*CF.A(-7.3,M.R(3+5*M.C(WingSine/39)),M.R(120+-8000*M.C(WingSine/900))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(2,1.5,-4)*CF.A(-7.3,M.R(3+2.5*M.C(WingSine/36)),M.R(180+8000*M.C(WingSine/900))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(2,1.5,-4)*CF.A(-7.3,M.R(6+7.5*M.C(WingSine/32)),M.R(240+8000*M.C(WingSine/900))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(2,1.5,-4)*CF.A(-7.3,M.R(3+5*M.C(WingSine/39)),M.R(300+8000*M.C(WingSine/900))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Bruh=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+5000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+5000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-120+5000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-1+5000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Solid=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,-8,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,-8,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+5000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-8,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+5000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-8,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,-8,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-120+5000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,-8,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-1+5000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Destruction=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+3000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+3000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+3000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+3000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(-120+3000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-1+3000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Notnormal=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+5000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+5000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-120+5000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-1+5000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
		WingAnims.normal=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-1,-1)*CF.A(-5,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4,-1,-1)*CF.A(-5,M.R(0+7.5*M.C(WingSine/32)),M.R(120+5000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(4,-1,-1)*CF.A(-5,M.R(0+5*M.C(WingSine/39)),M.R(180+5000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(4,-1,-1)*CF.A(-5,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(4,-1,-1)*CF.A(-5,M.R(0+7.5*M.C(WingSine/32)),M.R(-120+5000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(4,-1,-1)*CF.A(-5,M.R(0+5*M.C(WingSine/39)),M.R(-1+5000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Cata=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/20)),M.R(60+-3000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/20)),M.R(120+3000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/20)),M.R(180+3000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/20)),M.R(-60+3000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/20)),M.R(-120+-3000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/20)),M.R(-1+3000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Glitch=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(200+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(100+15*M.C(WingSine/32)),0,M.R(15+40*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,-2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/1))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(200+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(100+15*M.C(WingSine/32)),0,M.R(-15-40*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1,-2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-5*M.C(WingSine/1))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Cataclysm=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/5)),M.R(60+-20000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/5)),M.R(120+20000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/5)),M.R(180+20000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/5)),M.R(-60+20000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/5)),M.R(-120+-20000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(0,M.R(0+5*M.C(WingSine/5)),M.R(-1+20000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Star2=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+20*M.C(WingSine/5)),M.R(60+-43363*M.C(WingSine/10))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,10,-1)*CF.A(0,M.R(0+20*M.C(WingSine/5)),M.R(120+-34633*M.C(WingSine/10))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+50*M.C(WingSine/5)),M.R(180+23452*M.C(WingSine/10))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,10,-1)*CF.A(0,M.R(0+20*M.C(WingSine/5)),M.R(-60+-63235*M.C(WingSine/10))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,5,-1)*CF.A(0,M.R(0+20*M.C(WingSine/5)),M.R(-120+13451*M.C(WingSine/10))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,10,-1)*CF.A(0,M.R(0+20*M.C(WingSine/5)),M.R(-1+43225*M.C(WingSine/10))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/5))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/5))),.2)
	end
	WingAnims.Star3=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,3)*CF.A(M.R(200+7.5*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-3,-1)*CF.A(M.R(200+10*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-3)*CF.A(M.R(15+200*M.C(WingSine/32)),0,M.R(30+200*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,3)*CF.A(M.R(200+7.5*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-3,-1+.05*M.S(WingSine/35))*CF.A(M.R(200+10*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+200*M.C(WingSine/32)),0,M.R(-30-200*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Star1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+1*M.S(WingSine/32),-1)*CF.A(0,0,M.R(160+400*M.C(WingSine/52))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1*M.C(WingSine/32),2.5+2*M.C(WingSine/32),-1)*CF.A(0,0,M.R(170+400*M.C(WingSine/52))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),3.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-400*M.C(WingSine/52))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5+1*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-400*M.C(WingSine/52))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1*M.C(WingSine/32),2.5+2*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-170-400*M.C(WingSine/52))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),3.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-180+400*M.C(WingSine/52))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Lost=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/12)),0,M.R(0+5*M.C(WingSine/2))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/22)),0,M.R(15+7.5*M.C(WingSine/42))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/23)),0,M.R(0-5*M.C(WingSine/12))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/2)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/22))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Destiny=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.FORCE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(5,2+5*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(60+567*M.C(WingSine/334))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,2+5*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(120+543*M.C(WingSine/333))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5,2+5*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(180+745*M.C(WingSine/234))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-7,2+5*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(240+453*M.C(WingSine/445))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-2,2+5*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(300+645*M.C(WingSine/343))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-5,2+5*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(360+565*M.C(WingSine/328))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.PULSE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+-2*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(-90+1000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+-2*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(90+1000*M.C(WingSine/400))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,6,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+2*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(180+1000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,2+2*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(0+1000*M.C(WingSine/400))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,6,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Things=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(40+10*M.C(WingSine/50))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(90+-10*M.C(WingSine/50))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(140+10*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-2+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Error303=function()
		LWP1W.C0 = LWP2W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-120-70*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-60-50*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+40*M.C(WingSine/10))),.2)

		RWP1W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(120+70*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(60+50*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+40*M.C(WingSine/10))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-100*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-100*M.C(WingSine/80))),.2)
	end
	
		WingAnims.HAHAHA1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,-10,-1)*CF.A(M.R(50+100*M.C(WingSine/22)),2,M.R(59+400*M.C(WingSine/50))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,-10,-1)*CF.A(M.R(50+100*M.C(WingSine/22)),2,M.R(20.5+400*M.C(WingSine/50))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/22)),0,M.R(30+9*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-10,-1)*CF.A(M.R(50+100*M.C(WingSine/22)),2,M.R(-59+400*M.C(WingSine/50))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,-10,-1)*CF.A(M.R(50+100*M.C(WingSine/22)),2,M.R(-20.5+400*M.C(WingSine/50))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/22)),0,M.R(-30-9*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.GENOCIDE=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(120+80*M.C(WingSine/50))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(120+50*M.C(WingSine/50))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-2,-0)*CF.A(M.R(-80+0*M.C(WingSine/32)),0,M.R(70+2*M.C(WingSine/1))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-120-80*M.C(WingSine/50))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-120-50*M.C(WingSine/50))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6,-4,-1)*CF.A(M.R(30+500*M.C(WingSine/32)),2,M.R(30+400*M.C(WingSine/63))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.PEST1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(5,0,-1)*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(89+600*M.C(WingSine/50))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(5,-5,-1)*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(89+600*M.C(WingSine/50))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,5,-1)*CF.A(M.R(50+50*M.C(WingSine/32)),0,M.R(89+600*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(5,0,-1)*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-89+600*M.C(WingSine/50))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(5,-5,-1)*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-89+600*M.C(WingSine/50))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(M.R(50+50*M.C(WingSine/32)),0,M.R(-89+600*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.ZENITH=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(100+-50*M.C(WingSine/10))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(7,-1,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(100+50*M.C(WingSine/10))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+32*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(-100+50*M.C(WingSine/10))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-7,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-100-50*M.C(WingSine/10))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+32*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.PROESTGAMER=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
	        LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(90+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.8,2,0-0*M.C(WingSine/500))*CF.A(M.R(180+9000*M.C(WingSine/500)),-9.5,M.R(-90)),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-180+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
	        RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(-90+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.8,2,0+0*M.C(WingSine/250))*CF.A(M.R(-180-9000*M.C(WingSine/500)),9.5,M.R(90)),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.PUNISHED=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6,-6,-1)*CF.A(M.R(60+200*M.C(WingSine/32)),2,M.R(60+200*M.C(WingSine/45))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6,-4,-1)*CF.A(M.R(30+200*M.C(WingSine/32)),2,M.R(30+400*M.C(WingSine/63))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6.5,3,-1)*CF.A(M.R(0+100*M.C(WingSine/32)),20,M.R(30+600*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Question=function()
    LWP1W.C0 = LWP1W.C0:lerp(CF.N(1.15*M.C(WingSine/52),3+3.25*M.S(WingSine/32),-1)*CF.A(45,0,M.R(260+425*M.C(WingSine/62))),.2)
    LWP2W.C0 = LWP2W.C0:lerp(CF.N(1.1*M.C(WingSine/52),3+2.28*M.C(WingSine/32),-1)*CF.A(45,0,M.R(390+465.5*M.C(WingSine/62))),.2)
    LWP3W.C0 = LWP3W.C0:lerp(CF.N(1.25*M.C(WingSine/52),1+5*M.S(WingSine/32),-1)*CF.A(45,0,M.R(120+315*M.C(WingSine/62))),.2)
    
    RWP1W.C0 = RWP1W.C0:lerp(CF.N(2.15*M.C(WingSine/52),4+2.15*M.C(WingSine/32),-1)*CF.A(45,0,M.R(-260+545*M.C(WingSine/62))),.2)
    RWP2W.C0 = RWP2W.C0:lerp(CF.N(2.1*M.C(WingSine/52),4+2.3*M.S(WingSine/32),-1)*CF.A(45,0,M.R(-390+434.5*M.C(WingSine/62))),.2)
    RWP3W.C0 = RWP3W.C0:lerp(CF.N(2.25*M.C(WingSine/52),2+5*M.S(WingSine/32),-1)*CF.A(45,0,M.R(-120+475*M.C(WingSine/62))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.PERSON=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(-0-5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(-0-5*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.GSWORD=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-1.3,0,1.8)*CF.A(M.R(100+0*M.C(WingSine/32)),3.23,M.R(-100+0*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-1.3,5,1.8)*CF.A(M.R(100+0*M.C(WingSine/32)),3.23,M.R(-100+0*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,1,5)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(180+0*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1.3,10,1.8)*CF.A(M.R(100+0*M.C(WingSine/32)),3.23,M.R(-100+0*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1.3,15,1.8)*CF.A(M.R(100+0*M.C(WingSine/32)),3.23,M.R(-100+0*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1,2,5)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-360+0*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.UNMERCIFUL1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-3,1,-1)*CF.A(M.R(0+-6000*M.C(WingSine/160)),0,M.R(-90)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-3,1,-1)*CF.A(M.R(170+-6000*M.C(WingSine/160)),0,M.R(-90)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-4,1,-1)*CF.A(M.R(170+-6000*M.C(WingSine/190)),0,M.R(-90)),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,4,-1)*CF.A(M.R(0+6000*M.C(WingSine/160)),0,M.R(-90)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3,4,-1)*CF.A(M.R(170+6000*M.C(WingSine/160)),0,M.R(-90)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4,1,-1)*CF.A(M.R(340+-6000*M.C(WingSine/190)),0,M.R(-90)),.2)
		--SPIN
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	end
	
	
		WingAnims.Star7=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+-20*M.C(WingSine/5))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(5,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+30*M.C(WingSine/5))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(7,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+-40*M.C(WingSine/5))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+20*M.C(WingSine/5))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-30*M.C(WingSine/5))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30+40*M.C(WingSine/5))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Atomic=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-4)*CF.A(M.R(0+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(100+50*M.C(WingSine/32)),0,M.R(15+0*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+2000*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-4)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(100+50*M.C(WingSine/32)),0,M.R(-15-0*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+2000*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.EMPTY=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(400,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(400,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(400,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-400,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-400,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-400,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.LC1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(1.3,-6,-1)*CF.A(M.R(40+0*M.C(WingSine/32)),0,M.R(-20+0*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(1.3,-6.1,-0.7)*CF.A(M.R(40+0*M.C(WingSine/32)),0,M.R(-20+0*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(1.3,-8,-1.3)*CF.A(M.R(30+5*M.C(WingSine/32)),0,M.R(-20-5*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(1.3,-6.2,-0.4)*CF.A(M.R(40+0*M.C(WingSine/32)),0,M.R(-20+0*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(1.3,-6.7,-0.7)*CF.A(M.R(40+0*M.C(WingSine/32)),0,M.R(-20+0*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(1.3,-8.2,-0.1)*CF.A(M.R(50+-5*M.C(WingSine/32)),0,M.R(-20+5*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Echo1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(300,1.2,-1.8)*CF.A(M.R(100+0*M.C(WingSine/32)),-0.4,M.R(-100+0*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(300,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+400*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(300,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(300,-2,-2)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(300,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-400*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(300,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end

		WingAnims.Echo2=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(1.3,0.5,1.5)*CF.A(M.R(100+0*M.C(WingSine/32)),0,M.R(-100+0*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(300,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+400*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(300,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(300,-2,-2)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(300,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-400*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(300,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.isgonnahappensoon=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/64))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(50+15*M.C(WingSine/64)),0,M.R(15+10*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/300))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/64))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(50+15*M.C(WingSine/64)),0,M.R(-15-10*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/300))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.FIGHT=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(6,-2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(6,-1,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(70+7.5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89-300*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6,-2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-70-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89-900*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end

		WingAnims.REMEMBER=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,3,-3)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+700*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.5,1,2)*CF.A(M.R(650+0*M.C(WingSine/32)),0,M.R(70+0*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-3)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89-700*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,-3,-2)*CF.A(M.R(15+5*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.LIGHTSPEED=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-4,2,0-0*M.C(WingSine/500))*CF.A(M.R(0+9000*M.C(WingSine/500)),-40,M.R(-90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-4,2,0-0*M.C(WingSine/500))*CF.A(M.R(180+9000*M.C(WingSine/500)),-40,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-4,2,0-0*M.C(WingSine/500))*CF.A(M.R(360+9000*M.C(WingSine/500)),-40,M.R(-90)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(4,2,0+0*M.C(WingSine/250))*CF.A(M.R(0-9000*M.C(WingSine/500)),-44.8,M.R(90)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(4,2,0+0*M.C(WingSine/250))*CF.A(M.R(180-9000*M.C(WingSine/500)),-44.8,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(4,2,0+0*M.C(WingSine/250))*CF.A(M.R(360-9000*M.C(WingSine/500)),-44.8,M.R(90)),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.LOST2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),-7.7+2*M.S(WingSine/32),2)*CF.A(-1,0,M.R(60+10*M.C(WingSine/42))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1*M.C(WingSine/32),-7.7+2*M.C(WingSine/32),2)*CF.A(-1,0,M.R(110+10*M.C(WingSine/42))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-2,-0)*CF.A(M.R(80+0*M.C(WingSine/32)),0,M.R(70+2*M.C(WingSine/1))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1*M.C(WingSine/32),-7.7+2*M.C(WingSine/32),2)*CF.A(-1,0,M.R(-60-10*M.C(WingSine/42))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1*M.C(WingSine/32),-7.7+2*M.S(WingSine/32),2)*CF.A(-1,0,M.R(-110-10*M.C(WingSine/42))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1*M.C(WingSine/32),-999.7+2*M.S(WingSine/32),2)*CF.A(-1,0,M.R(-10-10*M.C(WingSine/42))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-0.80+0*M.S(WingSine/6),-999)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-0.64+0*M.S(WingSine/6),-999)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.PLATFORM=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1.8,2,0-0*M.C(WingSine/500))*CF.A(M.R(0+9000*M.C(WingSine/500)),7.8,M.R(-90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1.8,2,0-0*M.C(WingSine/500))*CF.A(M.R(60+9000*M.C(WingSine/500)),7.8,M.R(-90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1.8,2,0-0*M.C(WingSine/500))*CF.A(M.R(120+9000*M.C(WingSine/500)),7.8,M.R(-90)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1.8,2,0+0*M.C(WingSine/250))*CF.A(M.R(0-9000*M.C(WingSine/500)),-7.8,M.R(90)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1.8,2,0+0*M.C(WingSine/250))*CF.A(M.R(240-9000*M.C(WingSine/500)),-7.8,M.R(90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1.8,2,0+0*M.C(WingSine/250))*CF.A(M.R(300-9000*M.C(WingSine/500)),-7.8,M.R(90)),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-100+0*M.S(WingSine/6),-2)*CF.A(500,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-100+0*M.S(WingSine/6),-2)*CF.A(500,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Sword1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-1.3,.4,2)*CF.A(M.R(100+0*M.C(WingSine/32)),3.23,M.R(-100+0*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+400*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,-2,-2)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-400*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,3,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.NUKE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0-3*M.C(WingSine/100),1+-5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+510*M.C(WingSine/100))),.2)
        LWP2W.C0 = LWP2W.C0:lerp(CF.N(0-3*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+0*M.C(WingSine/100))),.2)
        LWP3W.C0 = LWP3W.C0:lerp(CF.N(0+3*M.C(WingSine/50),1-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+0*M.C(WingSine/100))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0+3*M.C(WingSine/100),1+5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(0+510*M.C(WingSine/100))),.2)
    	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0-3*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+0*M.C(WingSine/100))),.2)
    	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0+3*M.C(WingSine/50),1+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+0*M.C(WingSine/100))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.OMEGA=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89-40*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+400*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+40*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89-40*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-400*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+40*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
	WingAnims.Star1=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+1*M.S(WingSine/32),-1)*CF.A(0,0,M.R(160+400*M.C(WingSine/52))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1*M.C(WingSine/32),2.5+2*M.C(WingSine/32),-1)*CF.A(0,0,M.R(170+400*M.C(WingSine/52))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),3.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-400*M.C(WingSine/52))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5+1*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-400*M.C(WingSine/52))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1*M.C(WingSine/32),2.5+2*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-170-400*M.C(WingSine/52))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),3.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-180+400*M.C(WingSine/52))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	WingAnims.Lost=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/12)),0,M.R(0+5*M.C(WingSine/2))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/22)),0,M.R(15+7.5*M.C(WingSine/42))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/23)),0,M.R(0-5*M.C(WingSine/12))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/2)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/22))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.WITHERED=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,4,-1)*CF.A(1.1,M.R(0+2.5*M.C(WingSine/36)),M.R(60+9000*M.C(WingSine/1000))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,4,-1)*CF.A(1.1,M.R(0+7.5*M.C(WingSine/32)),M.R(120+9000*M.C(WingSine/1000))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(2,6,-1)*CF.A(1,M.R(0+5*M.C(WingSine/39)),M.R(180+-5000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,4,-1)*CF.A(1.1,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+9000*M.C(WingSine/1000))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,4,-1)*CF.A(1.1,M.R(0+2.5*M.C(WingSine/36)),M.R(-120+9000*M.C(WingSine/1000))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(2,6,-1)*CF.A(1,M.R(0+5*M.C(WingSine/39)),M.R(-1+-5000*M.C(WingSine/1000))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
	
		WingAnims.SYS32=function()
        LWP1W.C0 = LWP1W.C0:lerp(CF.N(3*M.C(WingSine/52),3.2+.1*M.S(WingSine/32),-3)*CF.A(-4.2,0,M.R(380+3500*M.C(WingSine/232))),.2)
        LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/42),1.2+1*M.C(WingSine/42),-1)*CF.A(-4.2,0.1,M.R(180+555*M.C(WingSine/62))),.2)
        LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/42),5.2+1*M.S(WingSine/42),-2)*CF.A(-4,0.1,M.R(150+1555*M.C(WingSine/162))),.2)

        RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3*M.C(WingSine/52),3.2-.1*M.C(WingSine/32),-3)*CF.A(-4.2,0,M.R(-380-3500*M.C(WingSine/232))),.2)
        RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4*M.C(WingSine/42),1.2+1*M.S(WingSine/42),-1)*CF.A(-4.2,-0.1,M.R(-180-555*M.C(WingSine/62))),.2)
        RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4*M.C(WingSine/42),5.2+1*M.S(WingSine/42),-2)*CF.A(-4,-0.1,M.R(-150-1555*M.C(WingSine/162))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Cave=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+-5*M.C(WingSine/1))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+5*M.C(WingSine/1))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+-5*M.C(WingSine/1))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5*M.C(WingSine/1))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-120+5*M.C(WingSine/1))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-1+-5*M.C(WingSine/1))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Future=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(60+1000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(120+1000*M.C(WingSine/400))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(180+1000*M.C(WingSine/400))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(240+1000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(300+1000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(360+1000*M.C(WingSine/400))),.2)
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Atoms=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,-8,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/60))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(100+100*M.C(WingSine/20))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,-6,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+200*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-8,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/60))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-100-100*M.C(WingSine/20))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,-6,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89-200*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.Dimension=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+75*M.C(WingSine/50))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+50*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+75*M.C(WingSine/50))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+50*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
	
		WingAnims.BLACKHOLE=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(3.5,1,-0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.5,1,-0)*CF.A(M.R(170+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,4,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+500*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3.5,1,-0)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.5,1,-0)*CF.A(M.R(170+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+500*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.KRAZY=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(90+3000*M.C(WingSine/100))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2+2.5*M.C(WingSine/180),1.5+.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(147.5+3000*M.C(WingSine/100))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(2+2.5*M.C(WingSine/180),1.5-.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(32.5+3000*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(2+2.5*M.C(WingSine/180),1.5-.75*M.C(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/36),M.R(-90+3000*M.C(WingSine/100))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/37),M.R(-147.5+3000*M.C(WingSine/100))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(2+2.5*M.C(WingSine/180),1.5+.75*M.S(WingSine/25),-1)*CF.A(0,0-0*M.C(WingSine/51),M.R(-32.5+3000*M.C(WingSine/100))),.2)
    	--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end


		WingAnims.Liquid=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(5,-1,-1)*CF.A(M.R(10+500*M.C(WingSine/100)),0,M.R(15+500*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,7,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+500*M.C(WingSine/100)),0,M.R(-15-500*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,7,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.LIES=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),-5.5+1*M.S(WingSine/32),3)*CF.A(-1,0,M.R(90+10*M.C(WingSine/42))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1*M.C(WingSine/32),-5.5+1*M.C(WingSine/32),3)*CF.A(-1,0,M.R(120+10*M.C(WingSine/42))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1*M.C(WingSine/32),-5.5+1*M.S(WingSine/32),3)*CF.A(-1,0,M.R(60+10*M.C(WingSine/42))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1*M.C(WingSine/32),-5.5+1*M.C(WingSine/32),3)*CF.A(-1,0,M.R(-90-10*M.C(WingSine/42))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1*M.C(WingSine/32),-5.5+1*M.S(WingSine/32),3)*CF.A(-1,0,M.R(-120-10*M.C(WingSine/42))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1*M.C(WingSine/32),-5.5+1*M.S(WingSine/32),3)*CF.A(-1,0,M.R(-60-10*M.C(WingSine/42))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-1000*M.C(WingSine/220))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-1000*M.C(WingSine/220))),.2)
	end
		WingAnims.ihavenothingtodo=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,-5.7,-3.0)*CF.A(M.R(10+0*M.C(WingSine/32)),14.1,M.R(175+2*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-5.7,-3.0)*CF.A(M.R(10+0*M.C(WingSine/32)),14.1,M.R(175+2*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,-5.7,3.0)*CF.A(M.R(10+0*M.C(WingSine/32)),14.1,M.R(175+2*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,-5.7,3.0)*CF.A(M.R(10+0*M.C(WingSine/32)),14.1,M.R(175+2*M.C(WingSine/32))),.2)
		--SPIN
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
		end

		WingAnims.DELETE=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(3,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-2,-2,1.7)*CF.A(M.R(90+0*M.C(WingSine/32)),14.1,M.R(0+2*M.C(WingSine/32))),.2)
		--SPIN
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/1000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	end
		WingAnims.Hyposis=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-5,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+400*M.C(WingSine/16))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+400*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(89+400*M.C(WingSine/50))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-5,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-400*M.C(WingSine/16))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15+400*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-89+400*M.C(WingSine/50))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Hypnotic=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(0+300*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(100+300*M.C(WingSine/32)),0,M.R(15+300*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+300*M.C(WingSine/32)),0,M.R(30+300*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(0+300*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(100+300*M.C(WingSine/32)),0,M.R(-15+300*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+300*M.C(WingSine/32)),0,M.R(-30+300*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.bot3=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+200*M.C(WingSine/32)),0,M.R(0+200*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+200*M.C(WingSine/32)),0,M.R(30+100*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+200*M.C(WingSine/32)),0,M.R(0-200*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+200*M.C(WingSine/32)),0,M.R(-30-100*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.bot2=function()
            LWP1W.C0 = LWP1W.C0:lerp(CF.N(-3,-3,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+WingSine)),.2)
            LWP2W.C0 = LWP2W.C0:lerp(CF.N(-3,-3,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(90+WingSine)),.2)
            LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,1.5+5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(0+5000*M.C(WingSine/200))),.2)

            RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-3,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(180+WingSine)),.2)
            RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3,-3,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-90+WingSine)),.2)
            RWP3W.C0 = RWP3W.C0:lerp(CF.N(1,1.5+5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+5000*M.C(WingSine/200))),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
    RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),0-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2) 
	end
	WingAnims.bot=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(7.25,-1,-1)*CF.A(M.R(10+100*M.C(WingSine/32)),-2,M.R(15+100*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+125*M.C(WingSine/32)),-2,M.R(15+125*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(10.25,-1,-1)*CF.A(M.R(10+150*M.C(WingSine/32)),-2,M.R(15+150*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-7.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+100*M.C(WingSine/32)),2,M.R(-15-100*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+125*M.C(WingSine/32)),2,M.R(-15-125*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-10.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+150*M.C(WingSine/32)),2,M.R(-15-150*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Spookbday=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(6.5,.5,-0.3)*CF.A(M.R(-600+20*M.C(WingSine/32)),0,M.R(30+150*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+100*M.C(WingSine/32)),-2,M.R(15+100*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(30+100*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6.5,.5,-0.3)*CF.A(M.R(-600+20*M.C(WingSine/32)),0,M.R(-30-150*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+100*M.C(WingSine/32)),2,M.R(-15-100*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,2,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(-30-100*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.xd=function()
		    
		    
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,-4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/1000))),.2)
    	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(0+-1000*M.C(WingSine/400))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(180+5000*M.C(WingSine/1000))),.2)
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/1000))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(120+-1000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,2+6*M.C(WingSine/32),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(240+-1000*M.C(WingSine/400))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.bye=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(100+10*M.C(WingSine/32)),0,M.R(0+400*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(100+5*M.C(WingSine/32)),0,M.R(15+100*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-0.5,-1)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(30+400*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(100+10*M.C(WingSine/32)),0,M.R(0-400*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(100+5*M.C(WingSine/32)),0,M.R(-15-100*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,-0.5,-1)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-400*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.hi=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,0,-.9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-300)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4,0,-.9)*CF.A(M.R(170+6000*M.C(WingSine/322)),0,M.R(-300)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+400*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,0,-.9)*CF.A(M.R(0+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4,0,-.9)*CF.A(M.R(170+6000*M.C(WingSine/322)),0,M.R(-0)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-400*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.nonexistant=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,0,-1)*CF.A(M.R(5+0*M.C(WingSine/32)),0,M.R(-90+5*M.C(WingSine/1))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(100+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+100*M.C(WingSine/32))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,0,-1)*CF.A(M.R(5+0*M.C(WingSine/32)),0,M.R(90-5*M.C(WingSine/1))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(100+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-100*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(600,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.Shatter=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(-1.8,1,-2)*CF.A(M.R(0+-6000*M.C(WingSine/160)),0,M.R(90)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(-1.8,1,-2)*CF.A(M.R(170+-6000*M.C(WingSine/160)),0,M.R(90)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,-1.7,-6)*CF.A(M.R(0+5*M.C(WingSine/22)),0,M.R(0+5*M.C(WingSine/34))),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1.8,4,-2)*CF.A(M.R(0+6000*M.C(WingSine/160)),0,M.R(90)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1.8,4,-2)*CF.A(M.R(170+6000*M.C(WingSine/160)),0,M.R(90)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,1.7,6)*CF.A(M.R(176+-5*M.C(WingSine/23)),0,M.R(-0-5*M.C(WingSine/23))),.2)
		--SPIN
        RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),5.0+0.4*M.S(WingSine/32),-1)*CF.A(165,0,M.R(-0-0*M.C(WingSine/80))),.2)
        RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),5.+0.4*M.S(WingSine/32),-0)*CF.A(150,0,M.R(-0-0*M.C(WingSine/80))),.2)
	end
		WingAnims.inf=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-6,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+400*M.C(WingSine/32))),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,.5,-1)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(30+5*M.C(WingSine/1))),.2) --Blade master blade

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-6,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-400*M.C(WingSine/32))),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,.5,-1)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-5*M.C(WingSine/1))),.2) --Blade master blade
		--SPIN
		

		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end
		WingAnims.mylifeispain=function()
		    
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0.3,M.R(0+20*M.C(WingSine/5)),M.R(60+-43363*M.C(WingSine/10))),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0.3,M.R(0+20*M.C(WingSine/5)),M.R(120+-34633*M.C(WingSine/10))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),.6-.30*M.S(WingSine/32),-1)*CF.A(0.3,0,M.R(560-9*M.C(WingSine/32))),.2)
	
		RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,3,-1)*CF.A(0.3,M.R(0+20*M.C(WingSine/5)),M.R(-60+-63235*M.C(WingSine/10))),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,3,-1)*CF.A(0.3,M.R(0+20*M.C(WingSine/5)),M.R(-120+13451*M.C(WingSine/10))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),.6+.30*M.S(WingSine/32),-1)*CF.A(0.3,0,M.R(-560+9*M.C(WingSine/32))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
		
				WingAnims.VOID=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,2+-6*M.C(WingSine/1),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(60+100*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,2+-6*M.C(WingSine/1),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(120+100*M.C(WingSine/400))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,2+-6*M.C(WingSine/1),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(180+100*M.C(WingSine/400))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,2+-6*M.C(WingSine/1),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(240+100*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,2+-6*M.C(WingSine/1),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(300+100*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,2+-6*M.C(WingSine/1),-1)*CF.A(M.R(0+0*M.C(WingSine/50)),0,M.R(360+100*M.C(WingSine/400))),.2)
		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
				WingAnims.CURED=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(3.8,4,-2)*CF.A(M.R(0+-3000*M.C(WingSine/160)),0,M.R(90)),.2)
		LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.8,4,-2)*CF.A(M.R(170+-3000*M.C(WingSine/160)),0,M.R(90)),.2)
		LWP3W.C0 = LWP3W.C0:lerp(CF.N(-5.8,1,-2)*CF.A(M.R(170+-4000*M.C(WingSine/160)),0,M.R(90)),.2)

		RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3.8,4,-2)*CF.A(M.R(0+3000*M.C(WingSine/160)),0,M.R(90)),.2)
		RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.8,4,-2)*CF.A(M.R(170+3000*M.C(WingSine/160)),0,M.R(90)),.2)
		RWP3W.C0 = RWP3W.C0:lerp(CF.N(-5.8,1,-2)*CF.A(M.R(340+-4000*M.C(WingSine/160)),0,M.R(90)),.2)
		--SPIN
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/7000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0,-2,0)*CF.A(0,M.R(0*M.C(WingSine/7000)),M.R(0-WingSine))*CF.A(20.4,M.R(90),0)*CF.N(-0,3,0),.2)
		end

		WingAnims.Catastophic=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+0*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(60+500*M.C(WingSine/62))),.2)
    	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+0*M.C(WingSine/62),-1)*CF.A(0.5,0,M.R(90+500*M.C(WingSine/62))),.2)
    	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+0*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(210+500*M.C(WingSine/62))),.2)
    	
    	RWP1W.C0 = RWP1W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5-0*M.C(WingSine/62),-1)*CF.A(0.5,0,M.R(120+500*M.C(WingSine/62))),.2)
    	RWP2W.C0 = RWP2W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+0*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(150+500*M.C(WingSine/62))),.2)
    	RWP3W.C0 = RWP3W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+0*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(180+500*M.C(WingSine/62))),.2)
    		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		end
		WingAnims.COMPLETELYLOST=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+1*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(60+1000*M.C(WingSine/52))),.2)
    	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+1*M.C(WingSine/62),-1)*CF.A(0.5,0,M.R(90+1000*M.C(WingSine/52))),.2)
    	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+1*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(210+1000*M.C(WingSine/52))),.2)
    	
    	RWP1W.C0 = RWP1W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5-1*M.C(WingSine/62),-1)*CF.A(0.5,0,M.R(120+1000*M.C(WingSine/52))),.2)
    	RWP2W.C0 = RWP2W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+1*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(150+1000*M.C(WingSine/52))),.2)
    	RWP3W.C0 = RWP3W.C0:lerp(CF.N(5*M.C(WingSine/62),2.5+1*M.S(WingSine/62),-1)*CF.A(0.5,0,M.R(180+1000*M.C(WingSine/52))),.2)
    		--SPIN
		RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.80+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
		RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/6),-1.64+0*M.S(WingSine/6),-2)*CF.A(0,0,M.R(-0-2000*M.C(WingSine/80))),.2)
	end



	while true do
		swait()
		ClickTimer=math.max(ClickTimer-1,0)
		if(ClickTimer<=0 and Combo~=1)then
			print('reset')
			Combo=1
		end
		Sine=Sine+Change
		hue=hue+1
		if(hue>360)then hue=1 end
		local hitfloor,posfloor = workspace:FindPartOnRayWithIgnoreList(Ray.new(Root.CFrame.p,((CFrame.new(Root.Position,Root.Position - Vector3.new(0,1,0))).lookVector).unit * (4)), {Effects,Char,workspace[Player.Name]})
		local Walking = (math.abs(Root.Velocity.x) > 1 or math.abs(Root.Velocity.z) > 1)
		local State = (Hum.PlatformStand and 'Paralyzed' or Hum.Sit and 'Sit' or (not hitfloor or hitfloor.CanCollide==false) and Root.Velocity.y < -1 and "Fall" or (not hitfloor or hitfloor.CanCollide==false) and Root.Velocity.y > 1 and "Jump" or hitfloor and Walking and "Walk" or hitfloor and "Idle")
		Hum.WalkSpeed = WalkSpeed
		local sidevec = math.clamp((Torso.Velocity*Torso.CFrame.rightVector).X+(Torso.Velocity*Torso.CFrame.rightVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
		local forwardvec =  math.clamp((Torso.Velocity*Torso.CFrame.lookVector).X+(Torso.Velocity*Torso.CFrame.lookVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
		local sidevelocity = sidevec/Hum.WalkSpeed
		local forwardvelocity = forwardvec/Hum.WalkSpeed

		local lhit,lpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(LLeg.CFrame.p,((CFrame.new(LLeg.Position,LLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char,workspace[Player.Name]})
		local rhit,rpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(RLeg.CFrame.p,((CFrame.new(RLeg.Position,RLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char,workspace[Player.Name]})
		if(Mode=='Troubadour' and IsVaporwave(getMode'Troubadour'.Music))then
			vaporwaveMode=true
			text.Text='Ｖａｐｏｒｗａｖｅ'
			WingAnim='NebG3'
		else
			if(Mode=='Troubadour')then
				text.Text='Troubadour'
				WingAnim=getMode'Troubadour'.WingAnim
			end
			vaporwaveMode=false
		end

		if(Mode~='Lust' and WingAnim and WingAnims[WingAnim])then
			WingAnims[WingAnim]()
		elseif(Mode=='Lust')then
			if(State=='Idle')then
				WingAnims.LustFrench()
			else
				WingAnims.NebG3(1)	
			end
		elseif(WingAnim and typeof(WingAnim)=='table' and WingAnims[WingAnim[1]])then
			local gay={unpack(WingAnim)};
			table.remove(gay,1)
			WingAnims[WingAnim[1]](unpack(gay))
		else
			WingAnims.NebG1()
		end

		if(Mode=='Troubadour' and NeutralAnims)then
			WingSine=WingSine+(0.1+music.PlaybackLoudness/300)
		else
			WingSine=WingSine+1
		end
		
				if(Mode~='Lightning Cannon' and WingAnim and WingAnims[WingAnim])then
		WingAnims[WingAnim]()
	elseif(Mode=='Lightning Cannon')then
		if(State=='Idle')then
			WingAnims.LC1()
		else
			WingAnims.EMPTY(1)	
		end
	elseif(WingAnim and typeof(WingAnim)=='table' and WingAnims[WingAnim[1]])then
		local gay={unpack(WingAnim)};
		table.remove(gay,1)
		WingAnims[WingAnim[1]](unpack(gay))
	else
		WingAnims.NebG5()
	end

		if(music)then
			if(Mode=='Lightning Cannon')then
				local clr = Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1))
				local clr2 = Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/950,0,1))
				text.TextColor3 = clr
				PrimaryColor = clr2
				for _,v in next, wingModel:GetDescendants() do
					if(v:IsA'BasePart')then
						v.Color = clr2
					elseif(v:IsA'Trail')then
						v.Color = ColorSequence.new(clr2)
					end
				end
			end
		end

		if(Mode=='The Big Black')then
			local pos = Head.Position
			local dist = (camera.CFrame.p-pos).magnitude
			local DropDist = 1
			local IneffectiveDist = 15
			local modifier = dist < DropDist and 1 or dist < IneffectiveDist and (0 - 1) / (IneffectiveDist - DropDist) * (dist - DropDist) + 1 or 0
		end

		if(State == 'Idle')then
			if(Mode=='POWER')then
				local Alpha = .1
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,15,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				
																    local HCF = Root.CFrame * CF.N(math.random(-70,70),-4,(math.random(-70,70))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Neon orange'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})

				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+3*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-160-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,-0.3+.05*M.S(Sine/32),-0.4)*CF.A(0,M.R(-10-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.4,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='Destiny')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='PULSAR')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+1*M.C(Sine/32),0)*CF.A(M.R(10+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-225-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(25-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.5)*CF.A(-0.4,M.R(-5),-0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.7,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='Looped Error')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+2*M.C(Sine/32),0)*CF.A(M.R(-40+5*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(1,M.R(5+5*M.C(Sine/32)),M.R(-40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(1,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.1*M.C(Sine/32),-0.2)*CF.A(0.9,M.R(-5),-0.2),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.1*M.C(Sine/32),-0)*CF.A(0.9,M.R(-5),0.2),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
											elseif(Mode=='APCOCLYPTIC')then
				local Alpha = .1
				
								    													GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really red'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
																	GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(20+10*M.S(Sine/64)),M.R(5),0.5),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(130+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.4)*CF.A(-0.5,M.R(-5),-0.5),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.4)*CF.A(-0.5,M.R(-5),-0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
			elseif(Mode=='GENOCIDE')then
				local Alpha = .1
				
																								    												    local HCF = Root.CFrame * CF.N(math.random(-70,70),-4,(math.random(-70,70))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})	
		if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.3+0*M.C(Sine/32),0)*CF.A(M.R(-50+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.6,0.5+.05*M.S(Sine/32),-0.5+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(30-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.6,0.5+.05*M.S(Sine/32),-0.5+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-30+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.8,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.8,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='PESTILENCE')then
				local Alpha = .1
										     local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Really black'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(90+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-100-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(100+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.5,M.R(-5),-0.4),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.5,M.R(-5),0.4),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='BURNING BRAIN')then
				local Alpha = .1
														     local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0.5+.5*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-200-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(200+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.8-.05*M.C(Sine/32),-0.6)*CF.A(-0.4,M.R(-5),-0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.0-.05*M.C(Sine/32),-0)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='ACE-OF-SPADES')then
												    local HCF = Root.CFrame * CF.N(math.random(-70,70),-4,(math.random(-70,70))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Bright yellow'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
										    
										    									GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Bright yellow'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.5,0.5,0.5);
					EndSize=Vector3.new(0,0,4);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.5,0.5,0.5);
					EndSize=Vector3.new(0,0,4);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Bright yellow'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.5,0.5,0.5);
					EndSize=Vector3.new(0,0,4);
					}
					
					BrickColor.new("")
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.5,0.5,0.5);
					EndSize=Vector3.new(0,0,4);
					}
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,7+.5*M.C(Sine/32),0)*CF.A(M.R(0+5*M.S(Sine/32)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-160-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,-0.3+.05*M.S(Sine/32),-0.4)*CF.A(20,M.R(-10-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,1-.05*M.C(Sine/32),-0.8)*CF.A(-0.3,M.R(-5),-0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='DESTRUCTION')then
						     local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(150+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.7)*CF.A(-0.4,M.R(-5),-0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.7,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='???')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(10+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-25-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.5)*CF.A(-0.6,M.R(-5),-0.05),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.5)*CF.A(-0.4,M.R(-5),0.05),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='TIME WARP')then
				local Alpha = .1
				if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2.05*M.C(Sine/80),0)*CF.A(M.R(-0+10*M.S(Sine/32)),M.R(-0+999*M.C(Sine/80)),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-90-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end

							elseif(Mode=='Nefarious')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/20),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(-0.5,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.3)*CF.A(-0.3,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end

											elseif(Mode=='Atomic Collisions')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-200-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,-0.3+.05*M.S(Sine/32),-0.4)*CF.A(0,M.R(-10-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.8-.1*M.C(Sine/32),-0.3)*CF.A(-0.3,M.R(20),-0.08),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.4-.1*M.C(Sine/32),-0.3)*CF.A(-0.4,M.R(-20),0.08),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
				
											elseif(Mode=='Lightning Cannon')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+2*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(2.5,M.R(5+5*M.C(Sine/32)),M.R(-380-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0.4,M.R(5-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.6-.1*M.C(Sine/32),-0.3)*CF.A(-0.2,M.R(20),-0.08),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.4-.1*M.C(Sine/32),-0.3)*CF.A(-0.3,M.R(-20),0.08),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='Ɇ₵ⱧØ')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/1),0)*CF.A(0,M.R(5+20*M.C(Sine/1)),M.R(-20-20*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/10),0)*CF.A(0,M.R(-5),-0.05),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.2*M.C(Sine/10),0)*CF.A(0,M.R(-5),0.05),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='ECHO')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+0.1*M.C(Sine/10),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+0.4*M.S(Sine/10),0)*CF.A(-0.5,M.R(5+20*M.C(Sine/1)),M.R(-10-20*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+0.4*M.S(Sine/10),0)*CF.A(-0.5,M.R(5-20*M.C(Sine/1)),M.R(10+20*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/10),0)*CF.A(M.R(-18),0,M.R(-1)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.2*M.C(Sine/10),0)*CF.A(M.R(-18),0,M.R(1)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='THE VOID')then
				local Alpha = .1
															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/1)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),7,0),Alpha)
					end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,.4+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(124-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0.1+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-84+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.8,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.6,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,100,M.R(2.5)),Alpha)
					end
				end
				
															elseif(Mode=='FORCE')then
				local Alpha = .1
															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/1)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),7,0),Alpha)
					end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,.4+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(124-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(1.5,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.8,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.6,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,100,M.R(2.5)),Alpha)
					end
				end
				
															elseif(Mode=='HYBRID')then
				local Alpha = .1
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/1)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),7,0),Alpha)
					end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,.4+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(124-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0.1+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-84+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.8,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.6,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,100,M.R(2.5)),Alpha)
					end
				end
				
											elseif(Mode=='CLOCKWISE')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(10),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-15-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(15+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
											elseif(Mode=='SPEED OF LIGHT')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(0+10*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+0.2*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(160+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.3,.3,-0.5)*CF.A(M.R(30.5+3.5*M.S(Sine/24)),M.R(15),M.R(-8.3)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.5)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='YING-YANG')then
				local Alpha = .1
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.2,0.2,0.2);
				}	
				
								GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.2,0.2,0.2);
				}	
				

				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-1+0*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0+.05*M.S(Sine/32),-0.5)*CF.A(-4.6,M.R(5+10*M.C(Sine/32)),M.R(40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0+.05*M.S(Sine/32),-0.5)*CF.A(-4.6,M.R(5-10*M.C(Sine/32)),M.R(-40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-75),0,M.R(-5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.5)*CF.A(0,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='INFINITE')then
				local Alpha = .1
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				
								GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				

				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+3*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(150+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.4,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				

			elseif(Mode=='Splits')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-1.6+0*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(150+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-1.4,-6,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(1.4,6,M.R(2.5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
				
				
			elseif(Mode=='Sub-Normal')then
				local Alpha = .1
				if(NeutralAnims)then	
				    
				    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				
								    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				    
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(25),M.R(5+5*M.C(Sine/32)),M.R(-0-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(40),M.R(5-5*M.C(Sine/32)),M.R(0+5*M.C(Sine/32))),Alpha)
				end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end

			elseif(Mode=='Normal')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(25),M.R(5+5*M.C(Sine/32)),M.R(-0-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(40),M.R(5-5*M.C(Sine/32)),M.R(0+5*M.C(Sine/32))),Alpha)
				end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
							elseif(Mode=='god slayer')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='CMD:_____')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
							elseif(Mode=='CaTAstOphIc')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
elseif(Mode=='Overclocked')then

GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2.05*M.C(Sine/80),0)*CF.A(M.R(-336+350*M.S(Sine/80)),M.R(-335+330*M.C(Sine/80)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(0+5*M.C(Sine/1))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.01*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-85-10*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.01*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(85+10*M.C(Sine/32))),Alpha)
			end
					if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-6),M.R(25),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(6),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end

				
			elseif(Mode=='S P A C E T I M E')then
				local Alpha = .1
								    																		    local HCF = Root.CFrame * CF.N(math.random(-30,30),-4,(math.random(-30,30))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Dark blue'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				
													GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
																	GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Dark blue'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+0.4*M.C(Sine/32),0)*CF.A(M.R(20+3*M.S(Sine/64)),0,0.14),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.7,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.6)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
				
							elseif(Mode=='ยɭՇгครкเ๔๔є๔')then
				local Alpha = .1
				
													GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
																	GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really red'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+0.4*M.C(Sine/32),0)*CF.A(M.R(20+3*M.S(Sine/64)),0,0.14),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(4+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-63.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
			elseif(Mode=='F0RG0TT3N')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-1.4+.05*M.C(Sine/32),0)*CF.A(M.R(-20+0*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-150+5*M.C(Sine/32)),M.R(-75-2*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(150-5*M.C(Sine/32)),M.R(75+2*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0.5)*CF.A(M.R(-65),-0.2,M.R(-5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1.4-.05*M.C(Sine/32),-0.5)*CF.A(0.3,M.R(7),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='PUNISHED')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-1.4+.05*M.C(Sine/32),0)*CF.A(M.R(-20+0*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.3*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-4*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.3*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-4*M.C(Sine/32)),M.R(-25-4*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0.5)*CF.A(M.R(-65),-0.2,M.R(-5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1.4-.05*M.C(Sine/32),-0.5)*CF.A(0.3,M.R(7),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
				
							elseif(Mode=='INEVITABLE')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(30+5*M.S(Sine/64)),M.R(5),-10.),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(180+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0.5)*CF.A(-1.5,M.R(-5),-0.2),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),0.2),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
				
							elseif(Mode=='L')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='PLATFORM')then
							    
											    local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,8,0),
Size = Vector3.new(.5,0,0.5),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(85+10*M.S(Sine/64)),M.R(5),0),Alpha)  
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(-0.6,M.R(5+5*M.C(Sine/32)),M.R(-190-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(-0.6,M.R(5-5*M.C(Sine/32)),M.R(190+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-1.2,M.R(-5),-0.3),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.6,M.R(-5),0.0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='EXCALIBUR')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.0*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(-20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(10-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
											elseif(Mode=='EXCALIBUR X')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(-20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(10-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.6,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.8,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end

							elseif(Mode=='OMEGA')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-160-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,-0.3+.05*M.S(Sine/32),-0.4)*CF.A(0,M.R(-10-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='SYSTEM_32')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(-20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-60),0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-60),0,M.R(5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='bored')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,1+0*M.C(Sine/32),-0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='Deleterious')then
							    
							    										GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(2,2,2);
					EndSize=Vector3.new(.0,0,.0);
					}
							    
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.7*M.C(Sine/32),-0)*CF.A(M.R(0+5*M.S(Sine/32)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='Liar X')then
																									    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really red'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
																					    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}	    
										    
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-30+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
    				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(100-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.3,.3,-0.5)*CF.A(M.R(30.5+3.5*M.S(Sine/24)),M.R(15),M.R(-8.3)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.5)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='HYPNOTIC')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+5*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.6,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.8,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='ARCADE')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+1*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.6,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.8,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='ILLUSION')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(5,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.7,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.6)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='I N S A N E')then
							    
							    
							    				    
				    								    																		    local HCF = Root.CFrame * CF.N(math.random(-50,50),-4,(math.random(-50,50))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Really red'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.9,3,0.9),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
							    
							    																					    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
												    																																		GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
							    
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5+5*M.C(Sine/32)),M.R(-40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.7)*CF.A(-0.3,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='PSYCHO')then
										    local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
							    
							    																					    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
												    																																		GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
							    
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5+5*M.C(Sine/32)),M.R(-40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.7)*CF.A(-0.3,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='Volcanic')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(40+5*M.C(Sine/32)),M.R(-50-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-40-5*M.C(Sine/32)),M.R(50+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),-0.4),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),0.4),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='ⱧɎ₱ɆⱤ₴₭łĐĐɆĐ')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),-0.4),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),0.4),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='DIMENSIONAL')then
				local Alpha = .1
				if(NeutralAnims)then
				    				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				
								GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
												GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				    
				    
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(40+5*M.C(Sine/32)),M.R(-50-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-40-5*M.C(Sine/32)),M.R(50+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),-0.4),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-5),0.4),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='Inferno')then
				local Alpha = .1
				if(NeutralAnims)then	
				    
				    
												    local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Neon orange'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
									    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.7)*CF.A(-0.3,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='FUTURE')then
				local Alpha = .1
				if(NeutralAnims)then	
				    
				    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Bright blue'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
									    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lilac'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(40+5*M.C(Sine/32)),M.R(40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-40-5*M.C(Sine/32)),M.R(-40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.7,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.7)*CF.A(-0.6,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='CRAZED')then
				local Alpha = .1
				if(NeutralAnims)then	
				    
				    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
									    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Navy blue'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.4,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='Hydro')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+2*M.C(Sine/32),0)*CF.A(M.R(-40+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.7)*CF.A(-0.3,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='₴₱ØØ₭ł₮Ɏ₴')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(40+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5+5*M.C(Sine/32)),M.R(-40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.3-.05*M.C(Sine/32),-1)*CF.A(150,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(100,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='E̶̠̰͕͔͂̐̓̾Ņ̷̢̗̖̰̗̤̘̈́̅̿̑Ḓ̶͍̖̗͇̞͓͈͕̌͂̍͗́͗͑̿͊͝ͅĻ̸̨̥̼̳̖̟͗̅̍̔͗̀̉̆͌̍E̴̘̝̘̻̞͗̂͒͛͊̀͘͝S̷͖̯̳̲̲͛͒̓͊Ş̷̩͇̣͙̩͓̺̎ͅ ̷̢͙̹͙̀̽͑̊̇̚̚͠S̷̡̱̠̳̻̖̳̻̉͌͋̒͌̔́I̴̢̼͈̩͛͑̚L̷̡͔̰̩̺̱͌͆́̓̋̆̓̈͘E̶̡͇̽̾͜N̷̛̼̺̈́̿̑̀͛͑̓͠͝C̴͍͔̆͊͋̅̕͜Ē̸̛̯͔̥̜̺͆')then
				local Alpha = .1
				if(NeutralAnims)then	
		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,12+2*M.C(Sine/32),0)*CF.A(M.R(-35+1*M.S(Sine/64)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-155-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.4,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='SHATTERED')then
							    
							    				    								    																		    local HCF = Root.CFrame * CF.N(math.random(-80,80),-4,(math.random(-80,80))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Royal purple'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,90,0),
Size = Vector3.new(.5,100,0.5),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.7*M.C(Sine/32),-0)*CF.A(M.R(0+5*M.S(Sine/32)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
											elseif(Mode=='disintegrated')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.7*M.C(Sine/32),-0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='CURED')then
				local Alpha = .1
				
										    local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,2,0),
Size = Vector3.new(0.7,0,0.7),
EndSize = Vector3.new(15,15,15),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+2*M.C(Sine/32),0)*CF.A(M.R(0+5*M.S(Sine/32)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-140-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(140+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.5,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.6,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='Relax')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+.4*M.C(Sine/32),0)*CF.A(M.R(80+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.4,0.4+.05*M.S(Sine/32),0.3)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-230-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.4,0.4+.05*M.S(Sine/32),0.3)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(230+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.5,M.R(-9),0.3),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-9),-0.5),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='Euclidiean')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+.4*M.C(Sine/32),0)*CF.A(M.R(60+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-3),-0.4),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.4,M.R(-3),0.4),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			elseif(Mode=='Calamity')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='80s')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='WORMHOLE')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+.5*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.1,-0+.05*M.S(Sine/32),-0)*CF.A(M.R(175),M.R(-0),M.R(25-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(-0.1,0.7-.05*M.C(Sine/32),-0.5)*CF.A(-0.4,M.R(-5),0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.3-.05*M.C(Sine/32),-0.3)*CF.A(-0.6,M.R(-5),-0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
											elseif(Mode=='UNMERCIFUL')then
local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.2*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.2*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-200-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,-0.3+.2*M.S(Sine/32),-0.4)*CF.A(0,M.R(-10-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.4)*CF.A(-0.5,M.R(-5),-0.1),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.3-.05*M.C(Sine/32),-0.2)*CF.A(-0.2,M.R(-5),0.1),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
							elseif(Mode=='WITHERED')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(-20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(2,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(1,M.R(5-5*M.C(Sine/32)),M.R(30+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.8,M.R(-5),-0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.8-.05*M.C(Sine/32),-0.7)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='90s')then
				local Alpha = .1
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+.4*M.C(Sine/32),0)*CF.A(M.R(50+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
    				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(100-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.5,M.R(-9),0.3),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-9),-0.5),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
				
				
				
											elseif(Mode=='R E M E M B E R E D')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+3*M.C(Sine/32),0)*CF.A(M.R(20+10*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-160-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(70-5*M.C(Sine/32)),M.R(75+2*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.6,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.8,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
				
				
				
				
			elseif(Mode=='DESTROYED')then
				local Alpha = .1
									GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-20+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-160-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,-0.3+.05*M.S(Sine/32),-0.4)*CF.A(0,M.R(-10-5*M.C(Sine/32)),M.R(-90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.7,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-0.6)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
				

							elseif(Mode=='GREATSWORD')then
				local Alpha = .1
					
										GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(30+1*M.S(Sine/1)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),7,0),Alpha)
					end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,.4+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(124-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.8,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.6,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,100,M.R(2.5)),Alpha)
					end
				end
			elseif(Mode=='Catastrophe')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.2-.01*M.C(Sine/32),-0.4)*CF.A(-0.5,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,0,M.R(2.5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
			elseif(Mode=='Cataclysm')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(5,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.2-.01*M.C(Sine/32),-0.4)*CF.A(-0.5,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,0,M.R(2.5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
			elseif(Mode=='Radioactivity')then
				local Alpha = .1
				
													GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Camo'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Camo'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+2*M.C(Sine/32),0.6)*CF.A(M.R(40+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.6,0+.05*M.S(Sine/32),-0.5)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-210-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.6,0+.05*M.S(Sine/32),-0.5)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(210+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
									LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.4,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
			elseif(Mode=='Mythical')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+5*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.2,0+.05*M.S(Sine/32),-0.5)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-225-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.2,0+.05*M.S(Sine/32),-0.5)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(225+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.2-.01*M.C(Sine/32),-0.4)*CF.A(-0.5,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,0,M.R(2.5)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
					end
				end
			elseif(Mode=='L0st')then
				GotEffect{
					Lifetime=0.3;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Torso.CFrame*CF.N(0,0.4,-0.56)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0.9,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.6,0.2,0.6);
					EndSize=Vector3.new(1,0.3,1);
				}		


				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.2+.03*M.S(Sine/32),0)*CF.A(M.R(165),M.R(20-12.6*M.C(Sine/32)),M.R(-35-1.5*M.C(Sine/32))),Alpha)
				end

				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
							elseif(Mode=='Toxicities')then
				GotEffect{
					Lifetime=0.3;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Torso.CFrame*CF.N(0,0.4,-0.56)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0.9,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.6,0.2,0.6);
					EndSize=Vector3.new(1,0.3,1);
				}		


				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
					if(M.RNG(1,45)==1)then
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
					else
						NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
					end
					LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.2+.03*M.S(Sine/32),0)*CF.A(M.R(165),M.R(20-12.6*M.C(Sine/32)),M.R(-35-1.5*M.C(Sine/32))),Alpha)
				end

				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end

			elseif(Mode=='Fearless')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+1*M.C(Sine/32),0)*CF.A(M.R(-20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.4,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.5,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			elseif(Mode=='ERROR_404')then
				local Alpha = .1
				if(NeutralAnims)then	
				    				    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				    
				    				    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				    
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(25),M.R(5+5*M.C(Sine/32)),M.R(-0-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(40),M.R(5-5*M.C(Sine/32)),M.R(0+5*M.C(Sine/32))),Alpha)
				end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
						elseif(Mode=='BYE BYE')then
				local Alpha = .1
				if(NeutralAnims)then	
				    
				    				    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/1)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/1)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
			elseif(Mode=='SINGULARITY')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(150-1.5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(35+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.6,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.8,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			elseif(Mode=='MENTALLY INSANE')then
								    
								    				 local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/32),0)*CF.A(M.R(20+5*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5+5*M.C(Sine/32)),M.R(-40-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-1,M.R(5-5*M.C(Sine/32)),M.R(40+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(-0.6,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.7-.05*M.C(Sine/32),-1)*CF.A(-0.8,M.R(-5),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			
			
						elseif(Mode=='COMPLETELY LOST')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(25),M.R(5+5*M.C(Sine/32)),M.R(-5-10*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0+.05)*CF.A(M.R(40),M.R(5-5*M.C(Sine/32)),M.R(5+10*M.C(Sine/32))),Alpha)
				end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.0*M.C(Sine/32),0)*CF.A(M.R(27),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.0*M.C(Sine/32),0)*CF.A(M.R(27),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			elseif(Mode=='ยɭՇгครкเ๔๔є๔')then
			
GotEffect{
					Lifetime=0.3;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Torso.CFrame*CF.N(0,0.4,-0.56)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0.9,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.6,0.2,0.6);
					EndSize=Vector3.new(1,0.3,1);
				}

local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+2.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0.7,0.1+.03*M.S(Sine/32),0)*CF.A(0,M.R(20+12.6*M.C(Sine/32)),M.R(-210-2.4*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.7,0.1+.03*M.S(Sine/32),0)*CF.A(M.R(175),M.R(20-12.6*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.6-.05*M.C(Sine/32),-0.5)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			elseif(Mode=='MURDEROUS')then
				local Alpha = .1
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+0*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(25),0,M.R(-7)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(25),0,M.R(7)),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			end
		elseif(State == 'Walk')then
				if(Mode=='DESTROYED')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				    									GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
			elseif(Mode=='80s')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

			elseif(Mode=='EXCALIBUR')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(10-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

			elseif(Mode=='Ɇ₵ⱧØ')then
			local wsVal = 5
			local Alpha = .4
			if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+0.2*M.C(Sine/10),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/1),0)*CF.A(1.7,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

			elseif(Mode=='god slayer')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
								elseif(Mode=='BYE BYE')then
				local Alpha = .1
				if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+2*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/32)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/32)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.2*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(-10)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-45),0,M.R(10)),Alpha)
				end
								elseif(Mode=='E̶̠̰͕͔͂̐̓̾Ņ̷̢̗̖̰̗̤̘̈́̅̿̑Ḓ̶͍̖̗͇̞͓͈͕̌͂̍͗́͗͑̿͊͝ͅĻ̸̨̥̼̳̖̟͗̅̍̔͗̀̉̆͌̍E̴̘̝̘̻̞͗̂͒͛͊̀͘͝S̷͖̯̳̲̲͛͒̓͊Ş̷̩͇̣͙̩͓̺̎ͅ ̷̢͙̹͙̀̽͑̊̇̚̚͠S̷̡̱̠̳̻̖̳̻̉͌͋̒͌̔́I̴̢̼͈̩͛͑̚L̷̡͔̰̩̺̱͌͆́̓̋̆̓̈͘E̶̡͇̽̾͜N̷̛̼̺̈́̿̑̀͛͑̓͠͝C̴͍͔̆͊͋̅̕͜Ē̸̛̯͔̥̜̺͆')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				    														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
				    														GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,2,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),10+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='disintegrated')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='Overclocked')then
				local Alpha = .1
				if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2.05*M.C(Sine/80),0)*CF.A(M.R(-336+350*M.S(Sine/80)),M.R(-335+330*M.C(Sine/80)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(0,0,-M.R(0+5*M.C(Sine/1))),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.01*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-85-10*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.01*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(85+10*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-6),M.R(25),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(6),0,0),Alpha)
				end
								elseif(Mode=='SHATTERED')then
								    
								    							    				    								    																		    local HCF = Root.CFrame * CF.N(math.random(-80,80),-4,(math.random(-80,80))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Royal purple'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,90,0),
Size = Vector3.new(.5,100,0.5),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
												elseif(Mode=='₴₱ØØ₭ł₮Ɏ₴')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
												elseif(Mode=='ERROR_404')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 			    	LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  			    	RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='CURED')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),10+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
								elseif(Mode=='UNMERCIFUL')then
											    local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),1+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='Relax')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='PSYCHO')then
								    
								    										    local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
								    
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
												elseif(Mode=='POWER')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
					}
					
																	    local HCF = Root.CFrame * CF.N(math.random(-70,70),-4,(math.random(-70,70))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Bright yellow'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
					
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																elseif(Mode=='INFINITE')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				
								GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
					
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
				
																				elseif(Mode=='DIMENSIONAL')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				    				    				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				
								GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
												GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Royal purple'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				GotEffect{
					Lifetime=0.5;
					Mesh='Ring';
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={0.5};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0,0,0);
					EndSize=Vector3.new(0.5,0.5,0.5);
				}	
				    
					
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
							elseif(Mode=='SINGULARITY')then
				local Alpha = .1
				
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+.4*M.C(Sine/32),0)*CF.A(M.R(50+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
    				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(100-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.5,M.R(-9),0.3),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-9),-0.5),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
																elseif(Mode=='90s')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='FORCE')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='PULSAR')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='Looped Error')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='APCOCLYPTIC')then
				local Alpha = .1
												    													GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really red'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
																	GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='GENOCIDE')then
				local Alpha = .1
																								    
																				    												    local HCF = Root.CFrame * CF.N(math.random(-70,70),-4,(math.random(-70,70))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})	
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='PESTILENCE')then
				local Alpha = .1
										     local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Really black'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(60+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-150-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(150+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.8,M.R(-5),-0.4),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.8,M.R(-5),0.4),Alpha)
				end
				
																				elseif(Mode=='BURNING BRAIN')then
				local Alpha = .1
				
										     local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='ACE-OF-SPADES')then
																				    
																				    												    local HCF = Root.CFrame * CF.N(math.random(-70,70),-4,(math.random(-70,70))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Bright yellow'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='WORMHOLE')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='???')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='TIME WARP')then
				local Alpha = .1
				if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+2.05*M.C(Sine/80),0)*CF.A(M.R(-0+10*M.S(Sine/32)),M.R(-0+999*M.C(Sine/80)),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-90-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(90+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(-5),0),Alpha)
				end
				
																elseif(Mode=='Deleterious')then
																			    
					GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(2,2,2);
					EndSize=Vector3.new(.0,0,.0);
					}
					
										GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(2,2,2);
					EndSize=Vector3.new(.0,0,.0);
					}
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
				
																				elseif(Mode=='GREATSWORD')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,.4+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(124-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='Nefarious')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='Atomic Collisions')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='Lightning Cannon')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
			    	LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  			    	RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.6-.1*M.C(Sine/32),-0.3)*CF.A(-0.2,M.R(20),-0.08),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.4-.1*M.C(Sine/32),-0.3)*CF.A(-0.3,M.R(-20),0.08),Alpha)
					else
				end
				
																				elseif(Mode=='MENTALLY INSANE')then
 local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																								elseif(Mode=='R E M E M B E R E D')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-160-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(70-5*M.C(Sine/32)),M.R(75+2*M.C(Sine/1))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
				
																				elseif(Mode=='SPEED OF LIGHT')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='PLATFORM')then
																				    
																				    											    local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,8,0),
Size = Vector3.new(.5,0,0.5),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+0*M.C(Sine/32),0)*CF.A(M.R(70+10*M.S(Sine/64)),M.R(5),0),Alpha)  
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-190-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),-0)*CF.A(-0.5,M.R(5-5*M.C(Sine/32)),M.R(190+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-1.5,M.R(-5),-0.3),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0.6,M.R(-5),0.0),Alpha)
				end
				
																				elseif(Mode=='EXCALIBUR X')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5+5*M.C(Sine/1)),M.R(40-10*M.C(Sine/1))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(10-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																								elseif(Mode=='F0RG0TT3N')then
				local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0+.05*M.C(Sine/32),0)*CF.A(M.R(-40+5*M.S(Sine/64)),M.R(5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0.5,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(-150+5*M.C(Sine/32)),M.R(-75-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(150-5*M.C(Sine/32)),M.R(75+5*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='ยɭՇгครкเ๔๔є๔')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='ⱧɎ₱ɆⱤ₴₭łĐĐɆĐ')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='WITHERED')then
				local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+0*M.C(Sine/32),0)*CF.A(M.R(-40+1*M.S(Sine/64)),M.R(5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(1.5,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0.5,M.R(5-5*M.C(Sine/32)),M.R(30+5*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.7,M.R(-5),-0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.8-.05*M.C(Sine/32),-0.7)*CF.A(-0.4,M.R(-5),0),Alpha)
				end
				
																				elseif(Mode=='SYSTEM_32')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='ARCADE')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),10+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='FUTURE')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='Euclidiean')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
																				elseif(Mode=='CRAZED')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
																elseif(Mode=='Liar X')then
																    

				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
    				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(100-2*M.S(Sine/36))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.5+.05*M.S(Sine/32),0+.05)*CF.A(M.R(160),M.R(5-5*M.C(Sine/1)),M.R(-40+10*M.C(Sine/1))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
																elseif(Mode=='bored')then
				local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,1+0*M.C(Sine/32),-0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(20),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5+5*M.C(Sine/32)),M.R(-20-5*M.C(Sine/32))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(-0.5,M.R(5-5*M.C(Sine/32)),M.R(20+5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(90+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
			    	RH.C0 = RH.C0:lerp(CF.N(0.4,.3,-0.8)*CF.A(M.R(30+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
																elseif(Mode=='Inferno')then
																    
																    				    
												    local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Neon orange'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,100,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
																    
																    				    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
									    						    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Neon orange'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
																				elseif(Mode=='Volcanic')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
																elseif(Mode=='Hydro')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='COMPLETELY LOST')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='DESTRUCTION')then
				local Alpha = .1
				
										     local HCF = Root.CFrame * CF.N(math.random(-40,40),-4,(math.random(-40,40))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				elseif(Mode=='Sub-Normal')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='ILLUSION')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='HYPNOTIC')then
				local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,10+2*M.C(Sine/32),0)*CF.A(M.R(20+1*M.S(Sine/64)),M.R(5),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				end
				if(legAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.2,M.R(-5),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0.5-.05*M.C(Sine/32),-0.7)*CF.A(-0.3,M.R(-5),0),Alpha)
				end
				elseif(Mode=='Normal')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				elseif(Mode=='S P A C E T I M E')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				    								    																		    local HCF = Root.CFrame * CF.N(math.random(-30,30),-4,(math.random(-30,30))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Dark blue'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.7,7,0.7),
EndSize = Vector3.new(0.2,6,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
				    

				    
				    													GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Really black'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				
																	GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Dark blue'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 			    	LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  			    	RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
								elseif(Mode=='I N S A N E')then
				local Alpha = .1
				if(NeutralAnims)then
				    
				    							    																					    						    															GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
					
												    																																		GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.3,3,1);
					EndSize=Vector3.new(.1,1,.1);
					}
				    
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
				
												elseif(Mode=='HYBRID')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
												elseif(Mode=='Fearless')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
		    		LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
		    		RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
			elseif(Mode=='Radioactivity')then
				local Alpha = .1
				if(NeutralAnims)then
 		    		RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10+8*M.C(Sine/32)),M.R(-20-1*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,-0.12+.01*M.S(Sine/52),0)*CF.A(0,M.R(10-8*M.C(Sine/32)),M.R(20+1*M.C(Sine/32))),Alpha)
  			    	NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
					RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				end
			else

				local wsVal = 4
				local Alpha = .2
				if(Mode=='MURDEROUS')then Change=.3 elseif(Mode=='The Big Black' or Mode=='Legendary')then Change=1 else Change=.5 end
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
					NK.C0 = NK.C0:lerp(NKC0,Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0,0)*CF.A(M.R(0-55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
				end
				if(legAnims)then 
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
					local footstepIds = {141491460,141491460}
					if(lhit and lhit.CanCollide and footstepSounds[lhit.Material])then
						if(lhit.Material==Enum.Material.Sand and lhit.Color.r*255>=160 and lhit.Color.g*255>=160 and lhit.Color.b*255>=160)then
							footstepIds[1] = footstepSounds[Enum.Material.Snow]
						else
							footstepIds[1] = footstepSounds[lhit.Material]
						end
					end

					if(rhit and rhit.CanCollide and footstepSounds[rhit.Material])then
						if(rhit.Material==Enum.Material.Sand and rhit.Color.r*255>=160 and rhit.Color.g*255>=160 and rhit.Color.b*255>=160)then
							footstepIds[2] = footstepSounds[Enum.Material.Snow]
						else
							footstepIds[2] = footstepSounds[rhit.Material]
						end
					end


					if(M.C(Sine/wsVal)/2>=.2 and footsound==0 and lhit)then
						local step = Part(Effects,lhit.Color,lhit.Material,V3.N(1,.1,1),CF.N(lpos),true,false)
						step.Transparency=(footstepIds[1]==footstepSounds[Enum.Material.Snow] and 0 or 1)
						local snd = Soond(step,footstepIds[1],M.RNG(80,100)/100,3,false,true,true)
						footsound=1
						S.Debris:AddItem(step,snd.TimeLength+2)
					elseif(M.C(Sine/wsVal)/2<=-.2 and footsound==1 and rhit)then
						local step = Part(Effects,rhit.Color,rhit.Material,V3.N(1,.1,1),CF.N(rpos),true,false)
						step.Transparency=(footstepIds[2]==footstepSounds[Enum.Material.Snow] and 0 or 1)
						local snd = Soond(step,footstepIds[2],M.RNG(80,100)/100,3,false,true,true)
						footsound=0
						S.Debris:AddItem(step,snd.TimeLength+2)
					end
				end
			end
		elseif(State == 'Jump')then
			local Alpha = .1
			local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
			if(NeutralAnims)then
				LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)),Alpha)
				RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
			end
		elseif(State == 'Fall')then
			local Alpha = .1
			local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
			if(NeutralAnims)then
				LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)+idk),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)-idk),Alpha)
				RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
			end
		elseif(State == 'Paralyzed')then
			local Alpha = .1
			if(NeutralAnims)then
				LS.C0 = LS.C0:lerp(LSC0,Alpha)
				RS.C0 = RS.C0:lerp(RSC0,Alpha)
				RJ.C0 = RJ.C0:lerp(RJC0,Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		elseif(State == 'Sit')then

		end
		if(data.User==data.Local)then
			local syncStuff={
				NeutralAnims;
				legAnims;
				{NK.C0,RJ.C0,RH.C0,RS.C0,LH.C0,LS.C0};
				{NK.C1,RJ.C1,RH.C1,RS.C1,LH.C1,LS.C1};
				Sine;
				movement;
				walking;	
				Change;
				--// OPTIONAL SYNC \\--
				MusicMode;
				(music and music.TimePosition or 0);
				(music and music.Pitch or 1);
				WingSine;
				getMode('Troubadour');
				Mode;
				hue;
			}
		end
	end
	
	--End Of Script -- v5 Of SGw
