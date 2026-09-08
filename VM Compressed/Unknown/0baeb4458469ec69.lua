print("achrommonic glitcher v2 edit loaded!")
print("IF THE REANIMATION IS BUGGY THEN REJOIN")
print("DONT EXECUTE THE SCRIPT more than 3 times it will break!")
print("Sub to golden exploits v2 on youtube he made the script and i re edited it!")
print("dont claim this edit as yours!")
print("im new at editing and i dont really know how to add custom animations for all single modes so thats why every mode has the same walk animation")
print("ENJOY!")

getgenv().ReanimateVersion = "v5"



loadstring(game:HttpGet("https://raw.githubusercontent.com/stangithuboffical/selexity/main/Reanimate", true))()


wait (2.10)






game.Players.LocalPlayer.Character.Humanoid:WaitForChild("Animator"):Destroy()





   
HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 5772000-67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 5772000
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "Ath_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "Ath_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = Position or Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AlignOri,AttachmentA,AttachmentB}
end




game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
	if v:IsA("Accessory") then
		if hatnameclone[v.Name] then
			if hatnameclone[v.Name] == "s" then
				hatnameclone[v.Name] = {}
			end
			table.insert(hatnameclone[v.Name],v)
		else
			hatnameclone[v.Name] = "s"
		end
	end
end
for _,v in pairs(hatnameclone) do
	if type(v) == "table" then
		local num = 1
		for _,w in pairs(v) do
			w.Name = w.Name..num
			num = num + 1
		end
	end
end
hatnameclone = nil

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

local CloneChar = DeadChar


for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		v.Handle.Massless = true
		v.Handle.CanCollide = false
		if v.Handle:FindFirstChildOfClass("Attachment") then
			local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
			if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or ath__.Name == "FaceFrontAttachment" or ath__.Name == "FaceCenterAttachment" then
				topacc = ath__.Name
			end
		end
        local bv = Instance.new("BodyVelocity",v.Handle)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			if topacc then
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.Torso,Vector3.new(0,1.5,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[2]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				alipos.Parent = CloneChar:FindFirstChild(v.Name).Handle
				alirot.Parent = CloneChar:FindFirstChild(v.Name).Handle
				while true do
					game:GetService("RunService").Stepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = p0.CFrame:lerp((((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse()),1)
						else
							v.Handle.CFrame = v.Handle.CFrame:lerp(alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alipos.Attachment1.Rotation.X),math.rad(alipos.Attachment1.Rotation.Y),math.rad(alipos.Attachment1.Rotation.Z)),1)
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end)()
    end
end


if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end













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
		local Mode='Undead'
		local vaporwaveMode=false;
		local WingAnim='NebG1'
		local music;
		local hue = 0;
		local WingSine=0;
		local MusicMode=1;
		local visSong = 319138964;
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
Undead - Astronaut - Lost Soul
=_-CalmNess-_=
Control - Synapse X
=-REBORN-= - Th1rt3en
INSANITY - Vanta Black
F R E Z Z E D - Frostbite
SYNAPSE-SCRIPTION
M-A-D - Radioactive
True-Love - DEATH
Uxi - Master of blades
]]

		--2699922745
		local modeInfo={
		   	{Name="Aura of happynes",Walkspeed=64,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1845132248,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Neon green'.Color,Enum.Material.Glass};WingAnim={'siktarelol',10}};
		  	{Name="Master of blades",Walkspeed=64,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1845132248,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Neon green'.Color,Enum.Material.Glass};WingAnim={'blades',10}};
		   	{Name="The Big Black",Walkspeed=64,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=183142252,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'Black',10}};
		   	{Name="Uxi",Walkspeed=20,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0.666667, 0, 0);Music=649386247,LeftWing={0,BrickColor.new'Bright red	'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Bright red'.Color,Enum.Material.Neon};WingAnim='uxinebg'};
		    {Name="Chillin",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=2533527428,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Red'.Color,Enum.Material.Neon};WingAnim='NEBGLOL'};
			{Name="LEGMAN",Walkspeed=35,moveVal=26,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.500);Music=1214497430,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarEF'};
			{Name="Undead",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=2533527428,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='NebG1'};
			{Name="=-XESTER-=",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1843358057,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='nebglul'};
			{Name="=_-CalmNess-_=",Walkspeed=16,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,152,220);Music=577543579,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='NebG6'};
			{Name="P O W E R",Walkspeed=45,moveVal=15,Font=Enum.Font.Fantasy,StrokeColor=C3.N(174, 122, 89);Music=3080022158,LeftWing={0,BrickColor.new'Neon orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};WingAnim='NebgPower'};
			{Name="Control",Walkspeed=56,moveVal=20,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.6,.0,.9);Music=819373905,LeftWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Alder'.Color,Enum.Material.Neon};WingAnim='controler'};
			{Name="=-REBORN-=",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=2027652726,LeftWing={0,Color3.fromRGB(190,104,98),Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='NebG5'};
			{Name="INSANITY",Walkspeed=14,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.1,.1,.1);Music=924339757,LeftWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Glass};WingAnim={'INSANEGREG',2}};
			{Name="F R E Z Z E D",Walkspeed=64,moveVal=15,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,190,190);Music=3330414980,LeftWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Glass};WingAnim='TSI'};	
			{Name="SYNAPSE-SCRIPTION",Walkspeed=26,moveVal=10,Font=Enum.Font.Arcade,StrokeColor=C3.N(.50,.50,.50);Music=visSong,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarT'};
			{Name="M-A-D",Walkspeed=16,moveVal=8,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(98,37,209);Music=603291385,LeftWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.DiamondPlate};WingAnim='MANGY'};
			{Name="True-Love",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,152,220);Music=1030177093,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};WingAnim='NebG7'};
			{Name="2008s Rise",Walkspeed=18,moveVal=9,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,152,220);Music=860317713,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};WingAnim='StarL'};
			{Name="Sonic",Walkspeed=270,moveVal=20,Font=Enum.Font.Fantasy,StrokeColor=C3.RGB(1,0,0);Music=144304272,LeftWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Bright blue'.Color,Enum.Material.Neon};WingAnim='StarA'};

			--MAJORS--
			{Name="=-_Lord Allah_-=",Walkspeed=26,moveVal=12,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,0);Music=1747430851,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};WingAnim='StarLF'};
			{Name="Mayhem",Walkspeed=15,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,0);Music=614032233,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarG'};
			{Name="N U C L E A R - WASTE",Walkspeed=18,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,255,0);Music=798163149,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='StarLE'};
			{Name="SCRIPTIONS DEMISE",Walkspeed=15,moveVal=12,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,255,0);Music=1591072638,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Fire Yellow'.Color,Enum.Material.Neon};WingAnim='StarLE'};
			{Name="Astronaut",Walkspeed=64,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=247971190,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'StarA'}};
			{Name="THE CHOSEN ONE",Walkspeed=64,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,.9,0);Music=2726143421,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'StarB'}};
			{Name="Synapse X",Walkspeed=64,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.N(.4,.4,0);Music=468018712,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Gold'.Color,Enum.Material.Glass};WingAnim={'StarA',10}};
			{Name="DEATH",Walkspeed=16,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255,255,255);Music=2415462372,LeftWing={0,BrickColor.new'Really Red'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really Red'.Color,Enum.Material.Neon};WingAnim='chickenislol'};
			{Name="-DESTRUCTION-",Walkspeed=38,moveVal=15,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(98,37,209);Music=1083649139,LeftWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.DiamondPlate};WingAnim='MANGYT'};
			{Name="=_-ANGRYNESS-_=",Walkspeed=22,moveVal=12,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,0,0);Music=1138145518,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='NebG6INSANE'};
			{Name="=-RED XESTER-=",Walkspeed=45,moveVal=15,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,.0,.0);Music=4664334689,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='NebG5'};
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
		for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v.Name:find("MeshPartAccessory") then
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
		if game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory") then
			for _,v in pairs(LWP3:GetChildren()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			local athp = Instance.new("Attachment",LWP3.PrimaryPart)
			local atho = Instance.new("Attachment",LWP3.PrimaryPart)

			local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory")
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
		if game.Players.LocalPlayer.Character:FindFirstChild("ShadowBladeMasterAccessory") then
			for _,v in pairs(RWP3:GetChildren()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			local athp = Instance.new("Attachment",RWP3.PrimaryPart)
			local atho = Instance.new("Attachment",RWP3.PrimaryPart)

			local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("ShadowBladeMasterAccessory")
			HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
			HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

			athp.Position = Vector3.new(0,-1.75,0)
			atho.Rotation = Vector3.new(0,0,48)
		end
		RWP3.Parent = rightWing
		local RWP4 = WingPiece:Clone();
        if Char:FindFirstChild("swordhalo") then
        	for _,v in pairs(RWP4:GetChildren()) do
	        	if v:IsA("BasePart") then
		        	v.Transparency = 1
	        	end
        	end
        	local athp = Instance.new("Attachment",RWP4.PrimaryPart)
        	local atho = Instance.new("Attachment",RWP4.PrimaryPart)

         	local HatChoice = Char:FindFirstChild("swordhalo")
        	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
        	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

        	athp.Position = Vector3.new(0,-1.5,0)
        	atho.Rotation = Vector3.new(0,0,51)
        end


        RWP4.Parent = rightWing
		local LWP1W=Weld(LWP1.PrimaryPart,Torso,CF.N(2,-2,-1)*CF.A(0,0,0))
		local LWP2W=Weld(LWP2.PrimaryPart,Torso,CF.N(4.25,-1,-1)*CF.A(0,0,M.R(15)))
		local LWP3W=Weld(LWP3.PrimaryPart,Torso,CF.N(6.5,.5,-1)*CF.A(0,0,M.R(30)))
		local RWP1W=Weld(RWP1.PrimaryPart,Torso,CF.N(-2,-2,-1)*CF.A(0,0,0))
		local RWP2W=Weld(RWP2.PrimaryPart,Torso,CF.N(-4.25,-1,-1)*CF.A(0,0,M.R(-15)))
		local RWP3W=Weld(RWP3.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
		local RWP4W=Weld(RWP4.PrimaryPart,Torso,CF.N(7.75,-.5,-1)*CF.A(0,0,M.R(45)))

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
			Text='Undead'
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
			if(Mode=='True-Love' or Mode=='DEATH')then
				blush.Transparency=0
				blush.Texture='rbxassetid://0'
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
			if(Mode=='SYNAPSE-SCRIPTION' and music.SoundId~='rbxassetid://'..visSett.Music)then
				music.SoundId='rbxassetid://'..visSett.Music
			end
			getMode('SYNAPSE-SCRIPTION').Music = visSett.Music
			getMode('SYNAPSE-SCRIPTION').Pitch = visSett.Pitch
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
				local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,0,40),StudsOffset=V3.N(0,2,0),Adornee=Head})
				local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Antique,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
				for i = 1, #text do
					--Txt.Text = Vaporwaveify(text:sub(1,i))
					Txt.TextColor3=(Mode=='SYNAPSE-SCRIPTION' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
					if(vaporwaveMode and Mode=='SYNAPSE-SCRIPTION')then
						Txt.Text = Vaporwaveify(text:sub(1,i))
					else
						Txt.Text = text:sub(1,i)
					end
					wait((vaporwaveMode) and .1 or .025)
				end
				for i = 0, 60 do
					Txt.TextColor3=(Mode=='SYNAPSE-SCRIPTION' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
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
					DamageColor=(Mode=='SYNAPSE-SCRIPTION' and C3.HSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor);
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
						DamageColor=(Mode=='SYNAPSE-SCRIPTION' and C3.HSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor);
						MinimumDamage=(Mode=='SYNAPSE-SCRIPTION' and music.PlaybackLoudness/10 or 10);
						MaximumDamage=(Mode=='SYNAPSE-SCRIPTION' and music.PlaybackLoudness/8 or 35);
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
			if(io.KeyCode == Enum.KeyCode.One and Mode~='Undead')then 
				changeMode'Undead'
				elseif(io.KeyCode == Enum.KeyCode.J and Mode~='Aura of happynes')then 
				changeMode'Aura of happynes'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [Aura of happynes] Always smile :)", "All")
				elseif(io.KeyCode == Enum.KeyCode.B and Mode~='Uxi')then 
				changeMode'Master of blades'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [Master of blades] no one can stop me!", "All")
                elseif(io.KeyCode == Enum.KeyCode.H and Mode~='The Big Black')then 
				changeMode'The Big Black'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                             [Big black] Riddle me this...", "All")
				elseif(io.KeyCode == Enum.KeyCode.C and Mode~='Uxi')then 
				changeMode'Uxi'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [Uxi] SPIN SPIN SPIN!", "All")
					elseif(io.KeyCode == Enum.KeyCode.G and Mode~='Chillin')then 
				changeMode'Chillin'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [Chillin] Just chill. ", "All")
			elseif(io.KeyCode == Enum.KeyCode.Two and Mode~='=_-CalmNess-_=')then 
				changeMode'=_-CalmNess-_='
			elseif(io.KeyCode == Enum.KeyCode.Three and Mode~='Control')then 
				changeMode'Control'
			elseif(io.KeyCode == Enum.KeyCode.P and Mode~='P O W E R')then 
				changeMode'P O W E R'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [Power] the solar power is the true power! ", "All")
			elseif(io.KeyCode == Enum.KeyCode.Four and Mode~='=-REBORN-=')then 
				changeMode'=-REBORN-='
			elseif(io.KeyCode == Enum.KeyCode.Five and Mode~='INSANITY')then 
				changeMode'INSANITY'
			elseif(io.KeyCode == Enum.KeyCode.Six and Mode~='F R E Z Z E D')then 
				changeMode'F R E Z Z E D'
			elseif(io.KeyCode == Enum.KeyCode.Seven and Mode~='SYNAPSE-SCRIPTION')then 
				changeMode'SYNAPSE-SCRIPTION'
			elseif(io.KeyCode == Enum.KeyCode.Eight and Mode~='M-A-D')then 
				changeMode'M-A-D'
			elseif(io.KeyCode == Enum.KeyCode.Q and Mode~='2008s Rise')then 
				changeMode'2008s Rise'
			elseif(io.KeyCode == Enum.KeyCode.K and Mode~='Sonic')then 
				changeMode'Sonic'					
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [Sonic] I never loose a race!", "All")
			elseif(io.KeyCode == Enum.KeyCode.Z and Mode~='=-XESTER-=')then 
				changeMode'=-XESTER-='
			elseif(io.KeyCode == Enum.KeyCode.L and Mode~='LEGMAN')then 
				changeMode'LEGMAN'
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                            [LEGMAN] You've been Trolled...", "All")
			elseif(io.KeyCode == Enum.KeyCode.Nine and Mode~='True-Love')then 
				changeMode'True-Love'
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Undead')then 
				changeMode'Astronaut'
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Astronaut')then 
				changeMode'THE CHOSEN ONE'
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Control')then 
				changeMode'Synapse X'
			elseif(io.KeyCode == Enum.KeyCode.Q and Mode=='2008s Rise')then 
				changeMode'SCRIPTIONS DEMISE'
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='=-XESTER-=')then 
				changeMode'=-RED XESTER-='
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='=_-CalmNess-_=')then 
				changeMode'=_-ANGRYNESS-_='
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='M-A-D')then 
				changeMode'-DESTRUCTION-'
			elseif(io.KeyCode == Enum.KeyCode.F and Mode=='2008s Rise')then 
				changeMode'Mayhem'
			elseif(io.KeyCode == Enum.KeyCode.V and Mode=='2008s Rise')then 
				changeMode'N U C L E A R - WASTE'
			elseif(io.KeyCode == Enum.KeyCode.R and Mode=='2008s Rise')then 
				changeMode'=-_Lord Allah_-='
			elseif(io.KeyCode == Enum.KeyCode.T and Mode=='True-Love')then 
				changeMode'DEATH'
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
				if(vaporwaveMode and Mode=='SYNAPSE-SCRIPTION')then
					VaporTaunt()
				end
			end
			if(vaporwaveMode)then return end
			--ATTACKS
			if(io.UserInputType==Enum.UserInputType.MouseButton1)then
				ClickCombo()
			end
		end)

		WingAnims.StarG=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(-8,2,-1)*CF.A(M.R(5+20*M.C(WingSine/32)),0,M.R(-35-9*M.C(WingSine/32))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(-10.60,1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+25*M.C(WingSine/32)),0,M.R(-40-9*M.C(WingSine/32))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(-12.20,.10,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-45-9*M.C(WingSine/32))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
		end

		WingAnims.StarLO=function()
				mult=mult or 150
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-950*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-650*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-950*M.C(WingSine/mult))),.2)

	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-950*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-650*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-950*M.C(WingSine/mult))),.2)	
	end

		WingAnims.StarLF=function()
				LWP1W.C0 = LWP1W.C0:lerp(CF.N(10*M.C(WingSine/32),0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(90+360*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(10*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(25-2.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(10*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-150-5*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(10*M.C(WingSine/32),0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-90+360*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-10*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-25-2.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-10*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(150+5*M.C(WingSine/32))),.2)
end

		WingAnims.StarL=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
		end

		WingAnims.StarLK=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+500*M.C(WingSine/15))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+500*M.C(WingSine/15))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+500*M.C(WingSine/15))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-500*M.C(WingSine/15))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-500*M.C(WingSine/15))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-500*M.C(WingSine/15))),.2)
		end

		WingAnims.StarLE=function()
LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+500*M.C(WingSine/15))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+500*M.C(WingSine/15))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+500*M.C(WingSine/15))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-500*M.C(WingSine/15))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-500*M.C(WingSine/15))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-500*M.C(WingSine/15))),.2)
		end

		WingAnims.StarA=function()
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,2,M.R(-180-3200*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,3,M.R(-210-3200*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(180+5000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(240+5000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(1,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(300+5000*M.C(WingSine/400))),.2)
end

		WingAnims.StarB=function()
			div=div or 2
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),1-5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(0+500*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1*M.C(WingSine/32),1-5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(60+500*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1*M.C(WingSine/32),1-5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120+500*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),1-5*M.C(WingSine/32),-1)*CF.A(0,0,M.R(180+500*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(1*M.C(WingSine/32),1-5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(240+500*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(1*M.C(WingSine/32),1-5*M.S(WingSine/32),-1)*CF.A(0,0,M.R(300+500*M.C(WingSine/32))),.2)
end
  			

		WingAnims.StarEF=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0.0,5,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0.40,0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-30+10*M.C(WingSine/32))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.0,15,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0.40,-0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(30-10*M.C(WingSine/32))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.0,-0,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0.0,10,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
		end

		WingAnims.StarT=function()
				mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60-360*M.C(WingSine/50))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120-360*M.C(WingSine/50))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180-360*M.C(WingSine/50))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
end

		WingAnims.Cytus=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+.35*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+5*M.C(WingSine/32))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1*M.C(WingSine/32),1.5+.25*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+2.5*M.C(WingSine/32))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25*M.C(WingSine/32),1.5-.05*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120-5*M.C(WingSine/32))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5-.15*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-5*M.C(WingSine/32))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1*M.C(WingSine/32),1.5+.3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-2.5*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25*M.C(WingSine/32),1.5+.15*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+5*M.C(WingSine/32))),.2)
		end

		WingAnims.Aprins=function()
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/400))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(90+5000*M.C(WingSine/400))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(120+5000*M.C(WingSine/400))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/400))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(-90+5000*M.C(WingSine/400))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+5000*M.C(WingSine/400))),.2)
		end
		
		
		WingAnims.Black=function()
			div=div or 1
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
		end
		

     WingAnims.siktarelol=function()
      	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-1,2,-3)*CF.A(0,M.R(45+350*M.C(WingSine/45)),M.R(115+10000*M.C(WingSine/650))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-2,3,-3)*CF.A(0,M.R(15+255*M.C(WingSine/32)),M.R(115+10000*M.C(WingSine/650))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.5,.5,-3)*CF.A(M.R(45+250*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,2,-3)*CF.A(0,M.R(45+340*M.C(WingSine/45)),M.R(-115+10000*M.C(WingSine/650))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2,3,-3)*CF.A(0,M.R(15+255*M.C(WingSine/32)),M.R(-115+10000*M.C(WingSine/650))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.5,.5,-3)*CF.A(M.R(45+250*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
end


WingAnims.controler=function()
	div=div or 1
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,6,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,6,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,6,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,6,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,6,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,6,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
		end

		WingAnims.NebG1=function()
	mult=mult or 1
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
		end
		
		
		WingAnims.blades=function()
	         div=div or 1
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(6,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400))),.2)
	        LWP2W.C0 = LWP2W.C0:lerp(CF.N(6,4,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(60+5000*M.C(WingSine/400))),.2)
	        LWP3W.C0 = LWP3W.C0:lerp(CF.N(6,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(120+5000*M.C(WingSine/400))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(6,4,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(180+5000*M.C(WingSine/400))),.2)
	        RWP2W.C0 = RWP2W.C0:lerp(CF.N(6,4,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(240+5000*M.C(WingSine/400))),.2)
	        RWP3W.C0 = RWP3W.C0:lerp(CF.N(6,4,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(300+5000*M.C(WingSine/400))),.2)
end
		

		WingAnims.INSANEGREG=function()
					LWP1W.C0 = LWP1W.C0:lerp(CF.N(.67,10,-1)*CF.A(M.R(5+1000*M.C(WingSine/38)),0,M.R(66)),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,.10,-1)*CF.A(M.R(10+1555*M.C(WingSine/38)),0,M.R(10)),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,10,-1)*CF.A(M.R(15+2000*M.C(WingSine/38)),0,M.R(30)),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,10,-1)*CF.A(M.R(5-1000*M.C(WingSine/38)),0,M.R(-64)),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,10,-1)*CF.A(M.R(10-1555*M.C(WingSine/38)),0,M.R(-91)),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,10,-1)*CF.A(M.R(15-2000*M.C(WingSine/38)),0,M.R(-17)),.2)
			RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-1)*CF.A(0,0,M.R(-0-950*M.C(WingSine/300))),.2)
		end


    WingAnims.nebglul=function()
    	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(60)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(120)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(-60)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-120)),.7)
end



	WingAnims.MANGY=function()
LWP1W.C0 = LWP1W.C0:lerp(CF.N(0.49,7,8)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.25,1.5,-1)*CF.A(M.R(10+300*M.C(WingSine/65)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/110)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0.49,7,8)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.25,1.5,-1+.05*M.S(WingSine/32))*CF.A(M.R(10+300*M.C(WingSine/65)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/110)),0,M.R(-30-9*M.C(WingSine/32))),.2)
end
		WingAnims.TSI=function()
   div=div or 1
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
	        LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(90+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
         	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0*M.C(WingSine/1),5*M.C(WingSine/16),-1)*CF.A(100,2,M.R(-90-5000*M.C(WingSine/322)))*CF.A(20.5,M.R(2),0)*CF.N(-0,3,0),.2)
         	
         LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
	        LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,7,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(90+5000*M.C(WingSine/400)))*CF.A(20.5,M.R(2),0)*CF.N(-0,4,0),.2)
         	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0*M.C(WingSine/1),5*M.C(WingSine/16),-1)*CF.A(100,2,M.R(-90-5000*M.C(WingSine/322)))*CF.A(20.5,M.R(2),0)*CF.N(-0,3,0),.2)
		end

		WingAnims.NebG2=function(div)
			div=div or 25
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
		end

		WingAnims.NebG3=function(mult)
			mult=mult or 1
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
		end

		WingAnims.NebgPower=function(div)
		 div=div or 1
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,10,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+5000*M.C(WingSine/400))),.2)
	        LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,10,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(60+5000*M.C(WingSine/400))),.2)
	        LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,10,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(120+5000*M.C(WingSine/400))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,10,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(180+5000*M.C(WingSine/400))),.2)
	        RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,10,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(240+5000*M.C(WingSine/400))),.2)
	        RWP3W.C0 = RWP3W.C0:lerp(CF.N(1,10,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(300+5000*M.C(WingSine/400))),.2)
         end

		WingAnims.NebG5=function(div)
			div=div or 6
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(5,4.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5,2.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(5.5,5.5,-5)*CF.A(M.R(15+6000*M.C(WingSine/322)),0,M.R(120)),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-5.5,5.5,-5)*CF.A(M.R(5+6000*M.C(WingSine/322)),0,M.R(-60)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(5,20.10,-6)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(5,4.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
end

		WingAnims.NebG6=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+25*M.C(WingSine/32))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+35*M.C(WingSine/32))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(11.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+50*M.C(WingSine/32))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-35*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(-11.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-50*M.C(WingSine/32))),.2)
		end

		WingAnims.NebG6INSANE=function()
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(5+10*M.C(WingSine/36)),0,M.R(60+5000*M.C(WingSine/400))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(90+5000*M.C(WingSine/400))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(15+20*M.C(WingSine/39)),0,M.R(120+5000*M.C(WingSine/400))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(5+10*M.C(WingSine/36)),0,M.R(-60+5000*M.C(WingSine/400))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/32))*CF.A(M.R(90+5000*M.C(WingSine/400)),0,M.R(-15-35*M.C(WingSine/32))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(M.R(15+20*M.C(WingSine/39)),0,M.R(-120+5000*M.C(WingSine/400))),.2)
		end
		WingAnims.NebG7=function()
			mult=mult or 28
			LWP1W.C0 = LWP1W.C0:lerp(CF.N(1,9,-6)*CF.A(M.R(10+8000*M.C(WingSine/400)),0,M.R(900)),.999999)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,9,-6)*CF.A(M.R(10+8000*M.C(WingSine/400)),0,M.R(90)),.999999)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1,9,-6)*CF.A(M.R(10+8000*M.C(WingSine/400)),0,M.R(50)),.999999)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(1,9,-6)*CF.A(M.R(10+8000*M.C(WingSine/400)),0,M.R(900)),.999999)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(1,9,-6)*CF.A(M.R(10+8000*M.C(WingSine/400)),0,M.R(300)),.999999)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(1,9,-6)*CF.A(M.R(10+8000*M.C(WingSine/400)),0,M.R(600)),.999999)
	
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1)*CF.A(M.R(10+350*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+300*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+350*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(15+400*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
end


		WingAnims.DEATHFrench=function()
				LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
		end
		
		

               WingAnims.uxinebg=function()
	div=div or 1
		LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
			LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
			LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)

			RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,2,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
			RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,2,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
			RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,2,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
		end


		

		if(data.User==data.Local)then
			Player.Chatted:connect(function(m)
				if(m:sub(1,3) == "/e")then m=m:sub(4) end
				if(m:sub(1,5) == "play/")then
					getMode('SYNAPSE-SCRIPTION').Music=Playlist[m:sub(6)] or tonumber(m:sub(6)) or 0
					music.SoundId="rbxassetid://"..getMode('SYNAPSE-SCRIPTION').Music;
				elseif(m:sub(1,5) == "tpos/")then
					music.TimePosition = tonumber(m:sub(6)) or 0
				elseif(m:sub(1,6) == "pitch/")then
					music.Pitch = tonumber(m:sub(7)) or 0
					getMode('SYNAPSE-SCRIPTION').Pitch=music.Pitch
				end
			end)
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
			if(Mode=='SYNAPSE-SCRIPTION' and IsVaporwave(getMode'SYNAPSE-SCRIPTION'.Music))then
				vaporwaveMode=true
				text.Text='Ｖａｐｏｒｗａｖｅ'
				WingAnim='NebG3'
			else
				if(Mode=='SYNAPSE-SCRIPTION')then
					text.Text='SYNAPSE-SCRIPTION'
					WingAnim=getMode'SYNAPSE-SCRIPTION'.WingAnim
				end
				vaporwaveMode=false
			end

			if(Mode~='DEATH' and WingAnim and WingAnims[WingAnim])then
				WingAnims[WingAnim]()
			elseif(Mode=='DEATH')then
				if(State=='Idle')then
					WingAnims.StarT()
				else
					WingAnims.StarT(1)	
				end
			elseif(WingAnim and typeof(WingAnim)=='table' and WingAnims[WingAnim[1]])then
				local gay={unpack(WingAnim)};
				table.remove(gay,1)
				WingAnims[WingAnim[1]](unpack(gay))
			else
				WingAnims.NebG1()
			end

			if(Mode=='SYNAPSE-SCRIPTION' and NeutralAnims)then
				WingSine=WingSine+(0.1+music.PlaybackLoudness/300)
			else
				WingSine=WingSine+1
			end

			if(music)then
				if(Mode=='SYNAPSE-SCRIPTION')then
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

			if(Mode=='Astronaut')then
				local pos = Head.Position
				local dist = (camera.CFrame.p-pos).magnitude
				local DropDist = 1
				local IneffectiveDist = 15
				local modifier = dist < DropDist and 1 or dist < IneffectiveDist and (0 - 1) / (IneffectiveDist - DropDist) * (dist - DropDist) + 1 or 0
			end

			if(Mode=='SYNAPSE-SCRIPTION' and data.User==data.Local)then
				Tween(camera,{FieldOfView=70-(music.PlaybackLoudness/20)},.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
			else
				Tween(camera,{FieldOfView=70},.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
			end

			if(State == 'Idle')then
				if(Mode=='SYNAPSE-SCRIPTION' and NeutralAnims and not vaporwaveMode)then Change = 0.1+music.PlaybackLoudness/200 else Change = 1 end
				if(Mode=='Undead')then
					local Alpha = .1
					if(NeutralAnims)then	
							RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),8+.2*M.C(Sine/32),0)*CF.A(M.R(-85+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
									LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(23),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
									RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-23),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
									NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
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
					
					
					elseif(Mode=='Aura of happynes')then
				local Alpha = .1
					if(NeutralAnims)then
						GotEffect{
							Lifetime=.5;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'Black'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(-15-2*M.S(Sine/36))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(15+2*M.S(Sine/36))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(RHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end
					
				elseif(Mode=='=_-CalmNess-_=')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
						if(M.RNG(1,45)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
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
				elseif(Mode=='=_-ANGRYNESS-_=')then
					local Alpha = .1
				if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,7+.05*M.C(Sine/32),0)*CF.A(M.R(15+25*M.S(Sine/64)),M.R(-25),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(0,0,M.R(0+5*M.S(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.8,1,-0.4)*CF.A(M.R(-162),M.R(-11.2),M.R(-22.6)),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
					RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
			
			elseif(Mode=='Master of blades')then
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+2*M.C(Sine/39),5+2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-180),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
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
				
			
				elseif(Mode=='=-XESTER-=')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
						if(M.RNG(1,45)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
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
				elseif(Mode=='LEGMAN')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,17+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
						if(M.RNG(1,45)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
						end
						LS.C0 = LH.C0:lerp(LHC0*CF.N(0,28-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
						RS.C0 = RH.C0:lerp(RHC0*CF.N(0,28-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-17-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(-0)),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-17-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(0)),Alpha)
						else
							LH.C0 = LH.C0:lerp(LHC0*CF.A(0,-0,M.R(-0)),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.A(0,-0,M.R(0)),Alpha)
						end
					end

				elseif(Mode=='=-RED XESTER-=')then
					local Alpha = .1
					if(NeutralAnims)then
						GotEffect{
							Lifetime=.2;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'Crimson'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						GotEffect{
							Lifetime=.2;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'Crimson'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(2),M.R(-40-2*M.S(Sine/36))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(40+2*M.S(Sine/36))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(RHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end

				elseif(Mode=='Control')then
		local Alpha = .1
		if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.9+.40*M.C(Sine/32),0)*CF.A(0,M.R(28),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(-28),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,-.2+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-.6,-0.8)*CF.A(M.R(-20+3.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end	
		
  				
				elseif(Mode=='P O W E R')then
					local Alpha = .1
					if(NeutralAnims)then	
						GotEffect{
							Lifetime=.5;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,555),M.RRNG(0,555),M.RRNG(0,555));
							Color=BrickColor.new'Flame reddish orange'.Color;
							Transparency={.5,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.3,2,.3);
							EndSize=Vector3.new(.1,1,.1);
						}
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,25+10.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(RHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end
				elseif(Mode=='=-REBORN-=')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-5+1*M.S(Sine/64)),M.R(-25),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-10),M.R(25),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(LHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end
				elseif(Mode=='Mayhem')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-5+1*M.S(Sine/64)),M.R(-25),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-10),M.R(25),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(LHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end
		--[[elseif(Mode=='INSANITY')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),.5+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,0,M.R(-15+5*M.S(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,0,M.R(15-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,.5,-.2)*CF.A(0,0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end]]
				elseif(Mode=='INSANITY')then
					local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/7),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/7)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/7),0)*CF.A(M.R(25),M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/7),0)*CF.A(M.R(25),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/7),0)*CF.A(M.R(25),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/7),0)*CF.A(M.R(25),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
				elseif(Mode=='F R E Z Z E D')then
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+2*M.C(Sine/39),5+2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-180),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
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
				elseif(Mode=='SYNAPSE-SCRIPTION')then
					if(vaporwaveMode)then
						local Alpha = .1
						if(NeutralAnims)then
							RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2-.1*M.S(Sine/36),0.6)*CF.A(M.R(74.3+2.5*M.C(Sine/36)),M.R(0),M.R(0)),Alpha)
							LS.C0 = LS.C0:lerp(CF.N(-1,0.8,0)*CF.A(M.R(11.4-5*M.C(Sine/42)),M.R(-3.3),M.R(137.5)),Alpha)
							RS.C0 = RS.C0:lerp(CF.N(1,0.9,-0.1)*CF.A(M.R(13.7-5*M.C(Sine/42)),M.R(7.7),M.R(-136.2)),Alpha)
							NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.3)*CF.A(M.R(-16.6-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
							if(legAnims)then
								LH.C0 = LH.C0:lerp(CF.N(-0.7,-1,0)*CF.A(M.R(37.2+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
								RH.C0 = RH.C0:lerp(CF.N(0.8,-1.1,-0.1)*CF.A(M.R(5.9+5*M.C(Sine/36)),M.R(3.5),M.R(-43.9)),Alpha)
							end
						elseif(legAnims)then
							LH.C0 = LH.C0:lerp(LHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					else
						local Alpha = .3
						if(NeutralAnims)then	
							RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/20)+(music.PlaybackLoudness/5000),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(35),0),Alpha)
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(0+1*M.S(Sine/24)),M.R(-35),0),Alpha)
							LS.C0 = LS.C0:lerp(LSC0*CF.A(0,0,M.R(-15+10*M.C(Sine/20))),Alpha)
							RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(75-(music.PlaybackLoudness/7.5)),M.R(5),M.R(35)),Alpha)
						end
						if(legAnims)then 
							if(NeutralAnims)then
								LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-.05*M.C(Sine/20)-(music.PlaybackLoudness/5000),0)*CF.A(0,M.R(25),0),Alpha)
								RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-.05*M.C(Sine/20)-(music.PlaybackLoudness/5000),0),Alpha)
							else
								LH.C0 = LH.C0:lerp(LHC0,Alpha)
								RH.C0 = RH.C0:lerp(RHC0,Alpha)
							end
						end
					end
				elseif(Mode=='M-A-D')then
				local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),6+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(23),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.8,1,-0.4)*CF.A(M.R(-162),M.R(-11.2),M.R(-22.6)),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,.5,-.2)*CF.A(0,0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
				elseif(Mode=='-DESTRUCTION-')then
					local Alpha = .1
					if(NeutralAnims)then	
						GotEffect{
							Lifetime=.2;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'White'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						GotEffect{
							Lifetime=.2;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'Dark indigo'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(2),M.R(-30-2*M.S(Sine/36))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(-2),M.R(30+2*M.S(Sine/36))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(RHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end
				elseif(Mode=='True-Love')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(5),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
					if(legAnims)then 
						if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(CF.N(-0.7,-1,0)*CF.A(M.R(37.2+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1.3-.1*M.C(Sine/32),-0.5)*CF.A(M.R(9),0,0),Alpha)
					end
				elseif(legAnims)then
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
				elseif(Mode=='Astronaut')then
					local Alpha = .1
					if(NeutralAnims)then
						GotEffect{
							Lifetime=.5;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'Black'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
						if(M.RNG(1,25)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(-15-2*M.S(Sine/36))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(15+2*M.S(Sine/36))),Alpha)
					end
					if(legAnims)then 
						if(NeutralAnims)then
							LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
							RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
						else
							LH.C0 = LH.C0:lerp(RHC0,Alpha)
							RH.C0 = RH.C0:lerp(RHC0,Alpha)
						end
					end
				elseif(Mode=='THE CHOSEN ONE')then
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+2*M.C(Sine/39),5+2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-180),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
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
				elseif(Mode=='Synapse X')then
					local Alpha = .1
						if(NeutralAnims)then	
			    RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.15+5*M.C(Sine/39),17+5*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-17+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end

				elseif(Mode=='SCRIPTIONS DEMISE')then
				local Alpha = .1
			if(NeutralAnims)then	
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(-2),M.R(30+2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
				elseif(Mode=='2008s Rise')then
					local Alpha = .1
								if(NeutralAnims)then	
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,0),M.RRNG(0,0),M.RRNG(0,0));
					Color=BrickColor.new'Gold'.Color;
					Transparency={.5,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.3,2,.3);
					EndSize=Vector3.new(.3,2,.3);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
				elseif(Mode=='Sonic')then
					local Alpha = .1
					if(NeutralAnims)then
						GotEffect{
							Lifetime=.5;
							Mesh={Type=Enum.MeshType.Sphere};
							CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
							Color=BrickColor.new'Bright blue'.Color;
							Transparency={0,1};
							Material=Enum.Material.Neon;
							Size=Vector3.new(.5,1,.5);
							EndSize=Vector3.new(.1,3,.1);
						}
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.0+.0*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
						if(M.RNG(1,45)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
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

				elseif(Mode=='=-_Lord Allah_-=')then
						local Alpha = .1
			if(NeutralAnims)then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,2,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(20+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(20-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
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

           elseif(Mode=='Uxi')then
	local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,4.8+.2*M.C(Sine/24),0)*CF.A(M.R(30+5*M.S(Sine/24)),M.R(16.7),M.R(-9.4)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.1,1,0.2)*CF.A(M.R(173.3+1*M.S(Sine/28)),M.R(19.9+2*M.S(Sine/28)),M.R(38.7)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.7,0.3,-0.6)*CF.A(M.R(46.8+1*M.S(Sine/28)),M.R(6.4+2*M.S(Sine/28)),M.R(-79.6)),Alpha)
				NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.5)*CF.A(M.R(-40-5*M.S(Sine/24)),M.R(-18.7),M.R(-3.7)),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+7.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.4,-1,-0.8)*CF.A(M.R(-63.8+7.5*M.S(Sine/24)),M.R(-15),M.R(8.3)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
			
			
			elseif(Mode=='The Big Black')then
			local Alpha = .1
			if(NeutralAnims)then
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(CF.N(0,0+.05*M.C(Sine/32),0.2)*CF.A(M.R(15.5),M.R(20.8),M.R(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-0.9,0.4,-0.7)*CF.A(M.R(121.8),M.R(14.6),M.R(84.8))*CF.A(M.R(0+3*M.S(Sine/32)),0,0),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.3,0.3,-0.1)*CF.A(M.R(40+5*M.C(Sine/44)),M.R(-11.6),M.R(65.5+2.5*M.C(Sine/36))),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(M.R(-15.6),M.R(-20.1),M.R(-5.5))*CF.A(M.R(0+1.5*M.S(Sine/32)),0,0),Alpha)
				end
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.6,-1-.05*M.C(Sine/32),0.1)*CF.A(M.R(-27.6),M.R(0),M.R(13.8)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.6,-1.1-.05*M.C(Sine/32),-0.1)*CF.A(M.R(-16.5),M.R(-20),M.R(-5.8)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
			

	elseif(Mode=='Chillin')then
			
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2-.1*M.S(Sine/36),0.6)*CF.A(M.R(74.3+2.5*M.C(Sine/36)),M.R(0),M.R(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1,0.8,0)*CF.A(M.R(11.4-5*M.C(Sine/42)),M.R(-3.3),M.R(137.5)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1,0.9,-0.1)*CF.A(M.R(13.7-5*M.C(Sine/42)),M.R(7.7),M.R(-136.2)),Alpha)
				NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.3)*CF.A(M.R(-16.6-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.7,-1,0)*CF.A(M.R(37.2+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.8,-1.1,-0.1)*CF.A(M.R(5.9+5*M.C(Sine/36)),M.R(3.5),M.R(-43.9)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		


				elseif(Mode=='N U C L E A R - WASTE')then
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
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/32)),M.R(-20-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
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
				elseif(Mode=='DEATH')then
					local Alpha = .1
					if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.1+.2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
						if(M.RNG(1,45)==1)then
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
						else
							NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
						end
						LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
						RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
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
				end
				
				
			elseif(State == 'Walk')then
		--[[if(Mode=='INSANITY')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),.5+.2*M.C(Sine/32),0)*CF.A(M.R(-85+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(0,0,M.R(0+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(0,0,M.R(0-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
		else]]

				local wsVal = 4
				local Alpha = .2
				if(Mode=='F R E Z Z E D')then Change=.3 elseif(Mode=='Astronaut' or Mode=='Synapse X' or Mode=='=-RED XESTER-=')then Change=1 else Change=.5 end
				local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
				--end
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
					getMode('SYNAPSE-SCRIPTION');
					Mode;
					hue;
				}
			end
		end