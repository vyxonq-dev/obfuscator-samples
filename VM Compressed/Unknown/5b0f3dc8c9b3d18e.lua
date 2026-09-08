-- just because it says old reanimation doesnt mean its bad ok?
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

wait(1)

local username = player.Name
local displayName = player.DisplayName

StarterGui:SetCore("SendNotification", {
    Title = "Loading Everything!";
    Text = "Hello, " .. displayName .. " (" .. username .. ")!";
    Duration = 5 
})

-- Credits:
	--[[
		Gelatek - Everything
		Emper - Optimization Tips
		Syndi/Mizt - Hat Renamer (to be changed with own one later)
	]]
	local Game = game
	local RunService = Game:GetService("RunService")
	local StartGui = Game:GetService("StarterGui")
	local TestService = Game:GetService("TestService")
	local Workspace = Game:GetService("Workspace")
	local Players = Game:GetService("Players")
	local PreSim = RunService.PreSimulation
	local PostSim = RunService.PostSimulation
	local CurrentCam = Workspace.CurrentCamera

	local Speed = tick()
	local Warn = warn
	local Error = error

	local Wait = task.wait
	local Infinite = math.huge
	local V3new = Vector3.new
	local INew = Instance.new
	local CFNew = CFrame.new
	local CFAngles = CFrame.Angles
	local MathRandom = math.random
	local Insert = table.insert
	local Clear = table.clear
	local Type = type

	local Global = (getgenv and getgenv()) or shared

	if not Global.RayfieldConfig then Global.RayfieldConfig = {} end
	local PermanentDeath = Global.RayfieldConfig["Permanent Death"]  or true
	local CollideFling = Global.RayfieldConfig["Torso Fling"]  or false -- changeable combat mode! 
	local BulletEnabled = Global.RayfieldConfig["Bullet Enabled"] or false
	local KeepHairWelds = Global.RayfieldConfig["Keep Hats On Head"] or true
	local HeadlessPerma = Global.RayfieldConfig["Headless On Perma"] or false -- changeable headless (or bubblechat hider)
	local DisableAnimations = Global.RayfieldConfig["Disable Anims"] or false
	local Collisions = Global.RayfieldConfig["Enable Collisions"] or true
	local AntiVoid = Global.RayfieldConfig["Anti Void"] or true
	if CollideFling and BulletEnabled then CollideFling = false end
	if not Global.TableOfEvents then Global.TableOfEvents = {} end

	local Player = Players.LocalPlayer
	local Character = Player.Character
	if Character.Name == "GelatekReanimate" then Error("Reanimation Already Working") end
	if (not Character:FindFirstChildOfClass("Humanoid")) or Character:FindFirstChildOfClass("Humanoid").Health == 0 then Error("Player Is Dead.") end

	local PlayerDied = false
	local IGNORETORSOCHECK = "Torso"
	local Is_NetworkOwner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
	local HiddenProps = sethiddenproperty or function() end 

	local SpawnPoint = Workspace:FindFirstChildOfClass("SpawnLocation",true) and Workspace:FindFirstChildOfClass("SpawnLocation",true) or CFrame.new(0,20,0)

	-- [[ Events ]] --
	local PostSimEvent
	local PreSimEvent
	local TorsoFlingEvent
	local DeathEvent
	local ResetEvent

	local BulletInfo = nil
	local HatData = nil

	local CF0 = CFNew(0,0,0)
	local Velocity = V3new(0,-26,0)


	Global.PartDisconnected = false
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	if not Humanoid then return end
	local RootPart = Character:FindFirstChild("HumanoidRootPart")
	local R15 = Humanoid.RigType.Name == "R15" and true or false
	local Sin, Cos, Inf, Clamp, Clock = math.sin, math.cos, math.huge, math.clamp, os.clock
	local FakeHats = INew("Folder"); do FakeHats.Name = "FakeHats"; FakeHats.Parent = TestService end
	Character.Archivable = true
	Humanoid:ChangeState(16)


	for Index, RagdollStuff in pairs(Character:GetDescendants()) do
		if RagdollStuff:IsA("BallSocketConstraint") or RagdollStuff:IsA("HingeConstraint") then
			RagdollStuff:Destroy()
		end
	end


	-- Mizt's Hat Renamer
	local HatsNames = {}
	for Index, Accessory in pairs(Character:GetDescendants()) do
		if Accessory:IsA("Accessory") then
			if HatsNames[Accessory.Name] then
				if HatsNames[Accessory.Name] == "Unknown" then
					HatsNames[Accessory.Name] = {}
				end
				Insert(HatsNames[Accessory.Name], Accessory)
			else
				HatsNames[Accessory.Name] = "Unknown"
			end	
		end
	end
	for Index, Tables in pairs(HatsNames) do
		if Type(Tables) == "table" then
			local Number = 1
			for Index2, Names in ipairs(Tables) do
				Names.Name = Names.Name .. Number
				Number = Number + 1
			end		
		end
	end
	Clear(HatsNames)

	local Figure = INew("Model"); do
		local Limbs = {}
		local Attachments = {}
		local function CreateJoint(Name,Part0,Part1,C0,C1)
			local Joint = INew("Motor6D"); Joint.Name = Name
			Joint.Part0 = Part0; Joint.Part1 = Part1
			Joint.C0 = C0; Joint.C1 = C1
			Joint.Parent = Part0
		end
		for i = 0,18 do
			local Attachment = INew("Attachment")
			Attachment.Axis,Attachment.SecondaryAxis = V3new(1,0,0), V3new(0,1,0)
			Insert(Attachments, Attachment)
		end
		for i = 0,3 do
			local Limb = INew("Part")
			Limb.Size = V3new(1, 2, 1); Limb.CanCollide = false
			Limb.Parent = Figure
			Insert(Limbs, Limb)
		end
		Limbs[1].Name = "Right Arm"; Limbs[2].Name = "Left Arm"
		Limbs[3].Name = "Right Leg"; Limbs[4].Name = "Left Leg"
		local Head = INew("Part")
		Head.Size = V3new(2,1,1)
		Head.Locked = true; Head.CanCollide = false
		Head.Name = "Head"
		Head.Parent = Figure
		local Torso = INew("Part")
		Torso.Size = V3new(2, 2, 1)
		Torso.Locked = true; Torso.CanCollide = false
		Torso.Name = "Torso"
		Torso.Parent = Figure
		local Root = Torso:Clone()
		Root.Transparency = 1
		Root.Name = "HumanoidRootPart"
		Root.Parent = Figure
		CreateJoint("Neck", Torso, Head, CFNew(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
		CreateJoint("RootJoint", Root, Torso, CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
		CreateJoint("Right Shoulder", Torso, Limbs[1], CFNew(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
		CreateJoint("Left Shoulder", Torso, Limbs[2], CFNew(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
		CreateJoint("Right Hip", Torso, Limbs[3], CFNew(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
		CreateJoint("Left Hip", Torso, Limbs[4], CFNew(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
		local Humanoid = INew("Humanoid")
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		Humanoid.Parent = Figure
		local Animator = INew("Animator", Humanoid)
		local HumanoidDescription = INew("HumanoidDescription", Humanoid)
		local HeadMesh = INew("SpecialMesh")
		HeadMesh.Scale = V3new(1.25, 1.25, 1.25)
		HeadMesh.Parent = Head
		local Face = INew("Decal")
		Face.Name = "face"
		Face.Texture = "http://www.roblox.com/asset/?id=158044781"
		Face.Parent = Head
		local Animate = INew("LocalScript")
		Animate.Name = "Animate"
		Animate.Parent = Figure
		local Health = INew("Script")
		Health.Name = "Health"
		Health.Parent = Figure
		Attachments[1].Name = "FaceCenterAttachment"; Attachments[1].Position = V3new(0, 0, 0)
		Attachments[2].Name = "FaceFrontAttachment"; Attachments[2].Position = V3new(0, 0, -0.6)
		Attachments[3].Name = "HairAttachment"; Attachments[3].Position = V3new(0, 0.6, 0)
		Attachments[4].Name = "HatAttachment"; Attachments[4].Position = V3new(0, 0.6, 0)
		Attachments[5].Name = "RootAttachment"; Attachments[5].Position = V3new(0, 0, 0)
		Attachments[6].Name = "RightGripAttachment"; Attachments[6].Position = V3new(0, -1, 0)
		Attachments[7].Name = "RightShoulderAttachment"; Attachments[7].Position = V3new(0, 1, 0)
		Attachments[8].Name = "LeftGripAttachment"; Attachments[8].Position = V3new(0, -1, 0)
		Attachments[9].Name = "LeftShoulderAttachment"; Attachments[9].Position = V3new(0, 1, 0)
		Attachments[10].Name = "RightFootAttachment"; Attachments[10].Position = V3new(0, -1, 0)
		Attachments[11].Name = "LeftFootAttachment"; Attachments[11].Position = V3new(0, -1, 0)
		Attachments[12].Name = "BodyBackAttachment"; Attachments[12].Position = V3new(0, 0, 0.5)
		Attachments[13].Name = "BodyFrontAttachment"; Attachments[13].Position = V3new(0, 0, -0.5)
		Attachments[14].Name = "LeftCollarAttachment"; Attachments[14].Position = V3new(-1, 1, 0)
		Attachments[15].Name = "NeckAttachment"; Attachments[15].Position = V3new(0, 1, 0)
		Attachments[16].Name = "RightCollarAttachment"; Attachments[16].Position = V3new(1, 1, 0)
		Attachments[17].Name = "WaistBackAttachment"; Attachments[17].Position = V3new(0, -1, 0.5)
		Attachments[18].Name = "WaistCenterAttachment"; Attachments[18].Position = V3new(0, -1, 0)
		Attachments[19].Name = "WaistFrontAttachment"; Attachments[19].Position = V3new(0, -1, -0.5)
		Attachments[1].Parent = Head; Attachments[2].Parent = Head; Attachments[3].Parent = Head Attachments[4].Parent = Head
		Attachments[5].Parent = Root
		Attachments[6].Parent = Limbs[1]; Attachments[7].Parent = Limbs[1]
		Attachments[8].Parent = Limbs[2]; Attachments[9].Parent = Limbs[2]
		Attachments[10].Parent = Limbs[3]; Attachments[11].Parent = Limbs[4]
		for i = 0,7 do Attachments[12 + i].Parent = Torso end
		Figure.Name = "GelatekReanimate"
		Figure.PrimaryPart = Head
		Figure.Archivable = true
		Figure.Parent = Workspace
		Figure:MoveTo(RootPart.Position)
	end

	local FigureHum = Figure:FindFirstChildWhichIsA("Humanoid")
	Figure:MoveTo(Character.Head.Position + V3new(0, 2.5, 0))
	for i,v in pairs(Figure:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Decal") then
			v.Transparency = 1
		end
	end

	local FigureDescendants = Figure:GetDescendants()
	local CharacterChildren = Character:GetChildren()

	local function VoidEvent()
		if AntiVoid == true then
			Figure:MoveTo(SpawnPoint.Position)
		else
			if PostSimEvent then PostSimEvent:Disconnect() end
			if PreSimEvent then PreSimEvent:Disconnect() end
			if DeathEvent then DeathEvent:Disconnect() end
			if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
			if ResetEvent then ResetEvent:Disconnect() end
			if FakeHats then FakeHats:Destroy() end
			pcall(function()
				CurrentCam.FieldOfView = 70
				Global.Stopped = true
				for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
				Character.Parent = Workspace
				Player.Character = Workspace[Character.Name]
				Humanoid:ChangeState(15)
				if Figure then Figure:Destroy() end
				if TestService:FindFirstChild("ScriptCheck") then
					TestService:FindFirstChild("ScriptCheck"):Destroy()
				end
				Wait(0.125)
				Global.RealChar = nil
				Global.Stopped = false
			end)
		end
	end

			
	for i,v in pairs(Character:GetDescendants()) do -- Disable Scripts / Accessories
		if v:IsA("BasePart") then
			v.RootPriority = 127
			local ClaimInfo = INew("SelectionBox"); do
				ClaimInfo.Adornee = v
				ClaimInfo.Name = "ClaimCheck"
				ClaimInfo.Transparency = 1
				ClaimInfo.Parent = v
			end
		end
		
		if v:IsA("Motor6D") and v.Name ~= "Neck" then
			v:Destroy()
		end
		
		if v:IsA("Script") then
			v.Disabled = true
		end
		
		if v:IsA("Accessory") then
			local FakeAccessory = v:Clone()
			local Handle = FakeAccessory:FindFirstChild("Handle")
			pcall(function() Handle:FindFirstChildWhichIsA("Weld"):Destroy() end)
			local Weld = INew("Weld"); do
				Weld.Name = "AccessoryWeld"
				Weld.Part0 = Handle
			end
			local Attachment = Handle:FindFirstChildOfClass("Attachment")
			if Attachment then
				Weld.C0 = Attachment.CFrame
				Weld.C1 = Figure:FindFirstChild(tostring(Attachment), true).CFrame
				Weld.Part1 = Figure:FindFirstChild(tostring(Attachment), true).Parent
			else
				Weld.Part1 = Figure:FindFirstChild("Head")
				Weld.C1 = CFNew(0,Figure:FindFirstChild("Head").Size.Y / 2,0) * FakeAccessory.AttachmentPoint:Inverse()
			end
			Handle.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:Inverse()
			Handle.Transparency = 1
			Weld.Parent = Handle
			FakeAccessory.Parent = Figure
			local FakeAccessory2 = FakeAccessory:Clone()
			FakeAccessory2.Parent = FakeHats
		end
	end
	for i, v in next, Humanoid:GetPlayingAnimationTracks() do
		v:Stop();
	end

	if BulletEnabled == true then
		if R15 == false then
			if PermanentDeath == true then
				Character:FindFirstChild("HumanoidRootPart").Name = "Bullet"
				BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("HumanoidRootPart"), CF0}
				HatData = nil
			else
				Character:FindFirstChild("Right Leg").Name = "Bullet"
				BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Right Leg"), CF0}
				if Character:FindFirstChild("Robloxclassicred") then
					HatData = {Character:FindFirstChild("Robloxclassicred"), Figure:FindFirstChild("Right Leg"), CFAngles(math.rad(90),0,0)}
					Character:FindFirstChild("Robloxclassicred").Handle:FindFirstChild("Mesh"):Destroy()
				else HatData = nil end
			end
		else
			Character:FindFirstChild("LeftUpperArm").Name = "Bullet"
			BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)}
			if Character:FindFirstChild("SniperShoulderL") then
				HatData = {Character:FindFirstChild("SniperShoulderL"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.5, 0)}
			else HatData = nil end
		end
		if HatData then
			HatData[1].Handle:BreakJoints()
		end
		
		local Bullet = Character:FindFirstChild("Bullet")
		local Highlight = INew("SelectionBox"); do
			local Extra 
			Highlight.Adornee = Bullet
			Highlight.Name = "Highlight"
			Highlight.Color3 = Color3.fromRGB(0, 223, 37)
			Highlight.Parent = Bullet
			Extra = PreSim:Connect(function()
				if not Figure and Figure.Parent then Extra:Disconnect() end
				if (not TestService:FindFirstChild("ScriptCheck")) or Figure:FindFirstChild("AnimPlayer") then
					Highlight.Transparency = 1
				else
					Highlight.Transparency = 0
				end
			end)
		end
	end

	-- Collide Fling
	if CollideFling == true then
		if R15 == false then
			local Torso = Character:FindFirstChild("Torso")
			if PermanentDeath == true then
				IGNORETORSOCHECK = "adfasdkogpasdfjopghsfdjofipsdjghsfopgjospadgjsaj"
				task.spawn(function()
					Wait(1)
					local BodyAngularVelocity = INew("BodyAngularVelocity")
					BodyAngularVelocity.MaxTorque = V3new(1,1,1) * Infinite
					BodyAngularVelocity.P = math.huge
					BodyAngularVelocity.AngularVelocity = V3new(1950,1950,1950)
					BodyAngularVelocity.Name = "TorsoFlinger"
					BodyAngularVelocity.Parent = Character:FindFirstChild("HumanoidRootPart")
				end)
			else
				TorsoFlingEvent = PostSim:Connect(function()
					if FigureHum.MoveDirection.Magnitude < 0.1 then
						Torso.Velocity = Velocity
					elseif FigureHum.MoveDirection.Magnitude > 0.1 then
						Torso.Velocity = V3new(1250,1250,1250)+Velocity
					end
				end)
			end
		else
			local Torso = Character:FindFirstChild("UpperTorso")
			TorsoFlingEvent = PostSim:Connect(function()
				if FigureHum.MoveDirection.Magnitude < 0.1 then
					Torso.RotVelocity = V3new()
				elseif FigureHum.MoveDirection.Magnitude > 0.1 then
					Torso.RotVelocity = V3new(2500,2500,2500)
				end
			end)
		end
	end

	if not TestService:FindFirstChild("OwnershipBoost") then
		local Part = INew("Part")
		Part.Name = "OwnershipBoost"
		Part.Parent = TestService
		PreSim:Connect(function()
			HiddenProps(Player, "MaximumSimulationRadius", 10e+5)
			HiddenProps(Player, "SimulationRadius", Player.MaximumSimulationRadius)
		end)
	end
	local FallHeight = Workspace.FallenPartsDestroyHeight
	local function MiniRandom() return "0." .. MathRandom(6, 8) .. MathRandom(1, 9) .. MathRandom(1, 9) end
	PreSimEvent = PreSim:Connect(function() -- Noclip
		local AntiVoidOffset = Global.RayfieldConfig["Anti Void Offset"] or 75
		if Figure.HumanoidRootPart.Position.Y <= FallHeight + AntiVoidOffset then VoidEvent() end
		for _,v in pairs(CharacterChildren) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		
		if not Collisions then
			for _,v in pairs(FigureDescendants) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)

	for i,v in pairs(Character:GetDescendants()) do -- Break Joints
		if v:IsA("Motor6D") and v.Name ~= "Neck" then
			v:Destroy()
		end
	end

	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			local Attachment = v.Handle:FindFirstChildWhichIsA("Attachment")
			if KeepHairWelds == true and Attachment.Name ~= "HatAttachment" and Attachment.Name ~= "FaceFrontAttachment" and Attachment.Name ~= "HairAttachment" and Attachment.Name ~= "FaceCenterAttachment" then
				v.Handle:BreakJoints()
			end
			if KeepHairWelds == false or PermanentDeath == true then -- Overwrites the check if perma is on
				v.Handle:BreakJoints()
			end
		end
	end

	local function Align(Part0, Part1, Offset)
		local CFOffset = Offset or CF0
		local OwnerShip = Part0:FindFirstChild("ClaimCheck")
		if Is_NetworkOwner(Part0) == true then
			if OwnerShip then OwnerShip.Transparency = 1 end
			if (CollideFling and Part0.Name ~= IGNORETORSOCHECK) or not CollideFling then 
				Part0.AssemblyLinearVelocity = V3new(MathRandom(-2,2), -30 - MiniRandom(), MathRandom(-2,2)) + FigureHum.MoveDirection * (Part0.Mass * 10)
			end
			if (CollideFling and Part0.Name ~= "HumanoidRootPart") or not CollideFling then Part0.RotVelocity = Part1.RotVelocity end
			Part0.CFrame = Part1.CFrame * CFOffset * CFNew(0.0085 * Cos(Clock() * 10), 0.0085 * Sin(Clock() * 10), 0)
		else
			if OwnerShip then OwnerShip.Transparency = 0 end
		end
	end

	local Offsets;
	if not R15 then 
		Offsets = {
			["HumanoidRootPart"] = {Figure:FindFirstChild("HumanoidRootPart"), CF0},
			["Torso"] = {Figure:FindFirstChild("Torso"), CF0},
			["Right Arm"] = {Figure:FindFirstChild("Right Arm"), CF0},
			["Left Arm"] = {Figure:FindFirstChild("Left Arm"), CF0},
			["Right Leg"] = {Figure:FindFirstChild("Right Leg"), CF0},
			["Left Leg"] = {Figure:FindFirstChild("Left Leg"), CF0},
		}
	else 
		Offsets = {
			["UpperTorso"] = {Figure:FindFirstChild("Torso"), CFNew(0, 0.194, 0)},
			["LowerTorso"] = {Figure:FindFirstChild("Torso"), CFNew(0, -0.79, 0)},
			["HumanoidRootPart"] = {Character:FindFirstChild("UpperTorso"), CF0},
			
			["RightUpperArm"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, 0.4085, 0)},
			["RightLowerArm"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, -0.184, 0)},
			["RightHand"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, -0.83, 0)},

			["LeftUpperArm"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)},
			["LeftLowerArm"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, -0.184, 0)},
			["LeftHand"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, -0.83, 0)},

			["RightUpperLeg"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, 0.575, 0)},
			["RightLowerLeg"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, -0.199, 0)},
			["RightFoot"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, -0.849, 0)},

			["LeftUpperLeg"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, 0.575, 0)},
			["LeftLowerLeg"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, -0.199, 0)},
			["LeftFoot"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, -0.849, 0)}
		}
	end

	local PostSimEvent = PostSim:Connect(function()
		for i,v in pairs(Offsets) do -- Body Align [2]
			if Character:FindFirstChild(i) then
				Align(Character:FindFirstChild(i), v[1], v[2])
			end
		end
		for i,v in pairs(CharacterChildren) do
			if v:IsA("Accessory") then
				if (HatData and v.Name ~= HatData[1].Name) or not HatData then
					Align(v.Handle, Figure[v.Name].Handle)
				end
			end
		end
		if HatData then
			Align(HatData[1].Handle, HatData[2], HatData[3])
		end
		if BulletInfo then
			BulletInfo[1].Velocity = Velocity
			if Global.PartDisconnected == false then
				Align(BulletInfo[1], BulletInfo[2], BulletInfo[3])
			end
		end
	end)

	-- Permanent Death
	if PermanentDeath then
		task.spawn(function()
			Wait(game:FindFirstChildWhichIsA("Players").RespawnTime + 0.5)
			if HeadlessPerma == true then
				Character:FindFirstChild("Head"):Remove()
			else
				Character:FindFirstChild("Head"):BreakJoints()
				Offsets["Head"] = {Figure:FindFirstChild("Head"), CF0}
			end
		end)
	end

	-- Ending Process
	Global.RealChar = Character	
	Character.Parent = Figure
	Player.Character = Figure
	CurrentCam.CameraSubject = FigureHum

	DeathEvent = FigureHum.Died:Connect(function()
		if PostSimEvent then PostSimEvent:Disconnect() end
		if PreSimEvent then PreSimEvent:Disconnect() end
		if DeathEvent then DeathEvent:Disconnect() end
		if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
		if ResetEvent then ResetEvent:Disconnect() end
		if FakeHats then FakeHats:Destroy() end
		for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
		pcall(function()
			CurrentCam.FieldOfView = 70
			Global.Stopped = true
			Character.Parent = Workspace
			Player.Character = Workspace[Character.Name]
			Humanoid:ChangeState(15)
			if Figure then Figure:Destroy() end
			if TestService:FindFirstChild("ScriptCheck") then
				TestService:FindFirstChild("ScriptCheck"):Destroy()
			end
			Wait(0.125)
			Global.RealChar = nil
			Global.Stopped = false
		end)
	end)

	ResetEvent = Character:GetPropertyChangedSignal("Parent"):Connect(function(Parent)
		if Parent == nil then
			if PostSimEvent then PostSimEvent:Disconnect() end
			if PreSimEvent then PreSimEvent:Disconnect() end
			if DeathEvent then DeathEvent:Disconnect() end
			if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
			if ResetEvent then ResetEvent:Disconnect() end
			if FakeHats then FakeHats:Destroy() end
			for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
			pcall(function()
				if Figure then Figure:Destroy() end
				CurrentCam.FieldOfView = 70
				Global.RealChar = nil
				Global.Stopped = true
				if TestService:FindFirstChild("ScriptCheck") then TestService:FindFirstChild("ScriptCheck"):Destroy() end
				Wait(0.125)
				Global.Stopped = false
			end)
		end
	end)

	Warn("Reanimated in " .. string.sub(tostring(tick()-Speed),1,string.find(tostring(tick()-Speed),".")+5))
	if not DisableAnimations then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Addons/Animations.lua"))()
	end
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Prepared!";
			Duration = 4;
			Text = "Old Gelatek Reanimation is now active."
	})
	
	task.wait(0.5)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "❤️";
			Duration = 4;
			Text = "Thank you for using this script."
	})
	-- Krystal Dance V3, Made by Hemi (es muy janky)
	if not getgenv()["Animator"] then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
	end
	task.wait(1.5)
	local player = game:GetService("Players").LocalPlayer
		local character = player.Character
		if not character then return end
		-- Play animation
		local Intro = Animator.new(character, 124033675853489)
		Intro:Play()
loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal_Dance_Edit/refs/heads/main/ihadtoaddthisbecauseupdatingbothversionsistediousaf.lua"))()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Original KDV3";
		Duration = 2;
		Text = "Credits to Hemi/Nitro-GT (Former Oxide Owner...)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "KDV3 Modded";
		Duration = 2;
		Text = "To SonixDev/Crimson (seriously though, his script's my inspiration)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Modded Gelatek Reanim";
		Duration = 2;
		Text = "To Theo/Paradigm (not much though. Gelatekussy the OG tho!)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Audio Downloader Idea";
		Duration = 2;
		Text = "To Theo/Paradigm"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Music Change";
		Duration = 2;
		Text = "To Test_033333/Venlafaxine"
	})
	--sonixery was here
	--hi skid
	--you know i really hate skids...
