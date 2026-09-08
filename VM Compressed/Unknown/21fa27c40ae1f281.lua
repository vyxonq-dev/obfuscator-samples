
local FEManager = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/a003ea305dd302eab1f8d372daed38b4/raw/9db59962b28555fd699a7c29891efb85d45677ab/gistfile1.txt"))()

-- tables
local ScriptOptions = {
	Settings = {
		AnimationSpeed = 1.25;
		Fling = true;
		Music = true;
		FOVEffects = true;
		CameraEffects = true;
		InfiniteJump = false;
	};
	Customization = { 
		HitboxColor = Color3.fromRGB(255, 255, 255);
		Hitmarker = 103397225855135;
	};
	FlingOptions = {
		HatFling = false,
		Highlight = false,
		PredictionFling = true,
		Timeout = 0.5,
		ToolFling = false,
	};
	Reanimate_Settings = {
		Frequency = 6, -- this is basically how fast the oscillation goes
		Amplification = 6, -- this is how far the oscillation goes
		FrontOffset = 2.5, -- this is how much youre in front of the player during prediction
	}
}

local AnimatorCache = {
	Joints = {};
	AnimDefaults = {};
	Rigs = {};
}

local ScriptCache = {
	StoredMotors = {};
	TrashBin = {};
	HitHumanoids = {};
	ActiveConnections = {};
}

local Directories = {
	Main = "FEVerse/",
	RBXMs ="FEVerse/RBXMs/",
	Sounds = "FEVerse/Sounds/",
	Songs = "FEVerse/Songs/",
}

local States = {
	Movement = {
		Idle = false;
		Walking = false;
		Running = false;
		Crouching = false;
		Sitting = false;
	};
	Input = {
		Debounce = false;
		Shift = false;
		KillMode = false;
	};
	Waypoint = {
		SavedPosition = nil;
		TVLocation = nil;
	}
}

local Services = {
	RunService = game:GetService("RunService");
	UserInputService = game:GetService("UserInputService");
	TweenService = game:GetService("TweenService");
	Debris = game:GetService("Debris");
	Players = game:GetService("Players");
	InsertService = game:GetService("InsertService");
}

for i, v in pairs(Directories) do FEManager.EnsureFolder(v) end
task.spawn(function()
	StarterGui = cloneref(game:GetService("StarterGui"))
	StarterGui:SetCore("SendNotification",{
		Title = "Cherry's Club",
		Text = "Files are currently downloading, you may need to run the script again after files download. (ignore this if you already have them)",
		Duration = 5,
	})
	FEManager.DownloadFile(Directories.RBXMs, "Locust.rbxm", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/RBXMs/Locust.rbxm")
	StarterGui:SetCore("SendNotification",{
		Title = "Cherry's Club",
		Text = "RBXMs Downloaded.",
		Duration = 2,
	})
	FEManager.DownloadFile(Directories.Songs, "LocustTheme.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Songs/LocustTheme.mp3")
 

end)


-- effects setup
local script = Services.InsertService:LoadLocalAsset(getcustomasset(Directories.RBXMs.."Locust.rbxm"))
local Animations = script:WaitForChild("Animations")
local Objects = script:WaitForChild("Objects")

-- reanim start
do
	local Accessories = {}
	local Aligns = {}
	local Attachments = {}
	local BindableEvent = nil
	local Blacklist = {}
	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new
	local Character = nil
	local CurrentCamera = nil
	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local UserInputType = Enum.UserInputType
	local MouseButton1 = UserInputType.MouseButton1
	local Touch = UserInputType.Touch
	local Exceptions = {}
	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin
	local mathpi = math.pi

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	local Color3fromRGB = Color3.fromRGB

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model
					HighlightObject.OutlineColor = Color3fromRGB(255, 0, 0)
					HighlightObject.FillColor = Color3fromRGB(0, 0, 0)

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)


		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)
			tableclear(Accessories)
			for _, child in next, GetChildren(Rig) do
				if IsA(child, "Accoutrement") then
					Destroy(child)
				end
			end


			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									local BaseOffset = (Position - LastPosition) / DeltaTime * 0.13
									local Frequency = ScriptOptions.Reanimate_Settings.Frequency
									local Amplification = ScriptOptions.Reanimate_Settings.Amplification
									local Time = tick()
									local TargetFace = Target.CFrame.LookVector
									local Oscillation = mathsin(Time * mathpi * 2 * Frequency) * Amplification
									local OscillatedOffset = TargetFace * Oscillation
									local FrontFaceOffset = TargetFace * ScriptOptions.Reanimate_Settings.FrontOffset
									Offset = BaseOffset + OscillatedOffset + FrontFaceOffset
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = CFrame.new(Target.Position + Offset) * CFrame.Angles(0, Target.Orientation.Y, 0)
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}

			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")

				tableclear(Tools)

				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)

					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end

				UnequipTools(Humanoid)
			end

			taskwait(OptionsBreakJointsDelay)

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)
			tableclear(Aligns)
			tableclear(Blacklist)
			tableclear(Accessories)
			-- pretty much FORCE welds to delete cause games with ragdoll messed ts up and only 3 hats worked (fixed)
			for i, v in next, GetChildren(Rig) do
				if IsA(v, "Accoutrement") then
					Destroy(v)
				end
			end
			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")

				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end

			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		local UserInputType = InputObject.UserInputType

		if UserInputType == MouseButton1 or UserInputType == Touch then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		for Index, Descendant in next, GetChildren(Rig) do
			if IsA(Descendant, "BasePart") then
				Descendant.CanCollide = false
			end
		end
	end

	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Objects:FindFirstChild("StarterCharacter"):Clone()
			Rig.Name = "non"
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

local Rad = math.rad

Empyrean = Start({
	Accessories = {
		-- Swords / Spears Rig
		{ Name = "RigTorso", MeshId = "92048094600083",  TextureId = "89519907183882", Offset = CFrame.new(0, -2, 0) * CFrame.Angles(0, Rad(0), Rad(60)) },
		{ Name = "RigUpperRL", MeshId = "76624859423759",  TextureId = "81203167910667", Offset = CFrame.new(0, 1.25, 0) * CFrame.Angles(Rad(0), Rad(-180), Rad(135)) },
		{ Name = "RigUpperLL", MeshId = "76624859423759",  TextureId = "124580012086562", Offset = CFrame.new(0, 1.25, 0) * CFrame.Angles(Rad(0), 0, Rad(135)) },
		{ Name = "RigLowerRL", MeshId = "18610679741",  TextureId = "18625348232", Offset = CFrame.new(.2, 2, 0) * CFrame.Angles(Rad(135),  Rad(0), Rad(0)) },
		{ Name = "RigLowerLL", MeshId = "18610679813",  TextureId = "18626048026", Offset = CFrame.new(-.2, 2, 0) * CFrame.Angles(Rad(135), Rad(0), Rad(0)) },
		{ Name = "RigUpperLA", MeshId = "75709149822509",  TextureId = "120166750183004", Offset = CFrame.new(0, 2.25, 0) * CFrame.Angles(Rad(0), Rad(0), Rad(-45)) },
		{ Name = "RigUpperRA", MeshId = "17605983196",  TextureId = "17606581728", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(Rad(0), Rad(0), Rad(0)) },
		{ Name = "RigLowerLA", MeshId = "110382824830787",  TextureId = "119800753686181", Offset = CFrame.new(0, 5.5, 0) * CFrame.Angles(0, Rad(-0), Rad(0)) },
		{ Name = "RigLowerRA", MeshId = "110382824830787",  TextureId = "119800753686181", Offset = CFrame.new(0, 5.5, 0) * CFrame.Angles(0, Rad(-0), Rad(0)) },
		-- Block Rig
		{ Name = "RigTorso", MeshId = "17345242336",  TextureId = "17345250641", Offset = CFrame.new(0, -2, 0) * CFrame.Angles(0, Rad(0), Rad(0)) },
		{ Name = "RigUpperLL", MeshId = "70807086513216",  TextureId = "87564259970629", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(Rad(0),  Rad(0), Rad(0)) },
		{ Name = "RigLowerLL", MeshId = "98818051326497",  TextureId = "87142331045456", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(Rad(0),  Rad(0), Rad(0)) },
		{ Name = "RigUpperRL", MeshId = "115322100534609",  TextureId = "140198794837319", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(Rad(0),  Rad(0), Rad(0)) },
		{ Name = "RigLowerRL", MeshId = "97418736735022",  TextureId = "84047101371984", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(Rad(0),  Rad(0), Rad(0)) },
		{ Name = "RigUpperLA", MeshId = "106942781700680",  TextureId = "90838563977106", Offset = CFrame.new(0, 2.25, 0) * CFrame.Angles(Rad(0), Rad(0), Rad(0)) },
		{ Name = "RigUpperRA", MeshId = "82433902584666",  TextureId = "129625048922193", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(Rad(0), Rad(0), Rad(0)) },
		{ Name = "RigLowerLA", MeshId = "17323421898",  TextureId = "75930329122564", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(0, Rad(-0), Rad(0)) },
		{ Name = "RigLowerRA", MeshId = "17323421898",  TextureId = "95461117386269", Offset = CFrame.new(0, 2, 0) * CFrame.Angles(0, Rad(-0), Rad(0)) },
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.265,
	ClickFling = false,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = true,
		Timeout = 0.5,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, -30, 0),
	ParentCharacter = true,
	RigSize = 1,
	RigTransparency = 0.75,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})

-- character setup
local Camera = workspace.CurrentCamera
local Player = Services.Players.LocalPlayer
local Character = Empyrean.Rig
local Locust = Character:WaitForChild("Locust")
local Humanoid = Character:WaitForChild("Humanoid")
local Head = Character:WaitForChild("Head")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Mouse = Player:GetMouse()

local Theme = Instance.new("Sound", RootPart)
if Services.RunService:IsStudio() then
	Theme.SoundId = "rbxasset://Locust.mp3"
else
	Theme.SoundId = getcustomasset(Directories.Songs.."LocustTheme.mp3")
end
Theme.Volume = 1
Theme.Looped = true
Theme:Play()

-- animator module
local Contains = function(Table, Check)
	for Index, Value in next, Table do 
		if rawequal(Check, Index) or rawequal(Check, Value) then 
			return true
		end
	end
	return false
end

local Edit = function(Joint, Change, Duration, Style, Direction)
	if typeof(Style) == "EnumItem" and Style.Name == "Constant" then
		Joint.CFrame = Change
		return
	end 
	Style = Enum.EasingStyle[Style.Name]
	Direction = Enum.EasingDirection[Direction.Name]
	local Anim = game:GetService("TweenService"):Create(Joint, TweenInfo.new(Duration, Style, Direction), {CFrame = Change})
	Anim:Play()
	return Anim
end

for i, v in pairs(Locust:GetDescendants()) do
	if v:IsA("Bone") then
		AnimatorCache.AnimDefaults[v.Name] = v.CFrame
		AnimatorCache.Joints[v.Name] = v
	end
end

local LoadBoneAnimation = function(Rig: Model, KeyframeSequence: KeyframeSequence)
	local Sequence = KeyframeSequence
	assert(Sequence:IsA("KeyframeSequence"), "KeyframeSequence Missing!")
	local Class = {}
	Class.Speed = 1
	Class.KeepLast = 0
	local Keyframes = KeyframeSequence:GetKeyframes()
	table.sort(Keyframes, function(a, b) return a.Time < b.Time end) -- Thanks 10k_i, roblox not sorting by default.
	Class.Length = Keyframes[#(Keyframes)].Time
	local Yield = function(Seconds)
		local Elapsed = 0
		local Target = Seconds / (Class.Speed * ScriptOptions.Settings.AnimationSpeed)
		repeat
			Elapsed += Services.RunService.Heartbeat:Wait()
		until Elapsed >= Target
	end
	if Sequence:FindFirstChild("xSIXxNull", true) or Sequence:FindFirstChild("xSIXxCustomDir", true) or Sequence:FindFirstChild("xSIXxCustomStyle", true) then -- Moon Suite Fix
		local Children = Sequence:GetChildren()
		for i = 1, #(Children) do
			if Children[i]:FindFirstChild("Torso") then
				local Limbs = Children[i].Torso:GetChildren()
				for l = 1, #(Limbs) do
					Limbs[l].Parent = Children[i].HumanoidRootPart.Torso
				end
				Children[i].Torso:Destroy()
			end
		end
	end
	local Descendants = Sequence:GetDescendants()
	for i = 1, #(Descendants) do
		if Descendants[i]:IsA("IntValue") or Descendants[i]:IsA("StringValue") or Descendants[i]:IsA("Folder") then
			Descendants[i]:Destroy()
		end
		if Descendants[i].Parent ~= Sequence and Descendants[i]:IsA("Pose") and not Rig:FindFirstChild(Descendants[i].Name, true) then
			Descendants[i]:Destroy()
		end
	end
	Class.Stopped = true
	Class.IsPlaying = false
	Class.TimePosition = 0
	Class.Looped = Sequence.Loop
	local Completion = Instance.new("BindableEvent")
	local Reached = Instance.new("BindableEvent")
	Class.Completed = Completion.Event
	Class.KeyframeReached = Reached.Event
	Class["Play"] = function(self, FadeIn, Speed)
		if Speed and Speed < 0 then
			Speed += (Speed*2)
		end
		Class.Speed = Speed or Class.Speed
		Class.Stopped = false
		Class.IsPlaying = true
		task.spawn(function()
			wait(1/60)
			if FadeIn ~= nil then
				Class.TimePosition -= FadeIn
			end
			Class.Completed:Connect(function()
				if Class.Looped ~= false then
					Class.TimePosition = 0
				end
			end)
			repeat game:GetService("RunService").Heartbeat:Wait()
				Class.TimePosition += (1 * Class.Speed) / (60 * Class.Speed) 
			until Class.IsPlaying == false or Class.Stopped ~= false
		end)
		task.spawn(function()
			if FadeIn ~= nil then
				task.wait(1/55)
				task.spawn(function()
					local Frames = Keyframes[1]:GetDescendants()
					for i = 1, #(Frames) do 
						local Pose = Frames[i]
						if Contains(AnimatorCache.Joints, Pose.Name) then 
							task.spawn(function()
								for i = 1, 2 do
									Edit(AnimatorCache.Joints[Pose.Name], AnimatorCache.AnimDefaults[Pose.Name] * Pose.CFrame, FadeIn, Pose.EasingStyle, Pose.EasingDirection)
									task.wait()
								end
							end)
						end
					end
				end)
				Yield(FadeIn)
			end
			repeat
				for K = 1, #(Keyframes) do 
					local K0, K1, K2 = Keyframes[K-1], Keyframes[K], Keyframes[K+1]
					if Class.Stopped ~= true then
						if K0 ~= nil then 
							Yield(K1.Time - K0.Time)
						end
						task.spawn(function()
							for i = 1, #(K1:GetDescendants()) do 
								local Pose = K1:GetDescendants()[i]
								if Contains(AnimatorCache.Joints, Pose.Name) then 
									local Duration = K2 ~= nil and (K2.Time - K1.Time) / Class.Speed or 0.5
									Edit(AnimatorCache.Joints[Pose.Name], AnimatorCache.AnimDefaults[Pose.Name] * Pose.CFrame, Duration, Pose.EasingStyle, Pose.EasingDirection)
								end
							end
						end)
						if K == #(Keyframes) and Class.KeepLast > 0 then
							Yield(Class.KeepLast)
						end
						Reached:Fire(K1.Name)
					else
						break
					end
				end
				Completion:Fire()
			until Class.Looped ~= true or Class.Stopped ~= false
			Class.IsPlaying = false
		end)
	end
	Class["Stop"] = function()
		Class.Stopped = true
		Class.IsPlaying = false
	end
	Class["AdjustSpeed"] = function(self, Speed)
		if Speed < 0 then
			Speed += (Speed*2)
		end
		Class.Speed = Speed or Class.Speed
	end
	return Class
end

-- animator functions
local PlayAnim = function(Rig: Model, Animation: KeyframeSequence, AnimSpeed: number)
	if not AnimatorCache.Rigs[Rig] then
		AnimatorCache.Rigs[Rig] = {}
	end
	if not AnimatorCache.Rigs[Rig][Animation.Name] then
		AnimatorCache.Rigs[Rig][Animation.Name] = LoadBoneAnimation(Rig, Animation)
	end
	for Name, Track in pairs(AnimatorCache.Rigs[Rig]) do
		if Name ~= Animation.Name then
			Track:Stop()
		end
	end
	local AnimInstance = AnimatorCache.Rigs[Rig][Animation.Name]
	if not AnimInstance.IsPlaying then
		AnimInstance:Play(AnimSpeed or 1)
	end
	return AnimInstance
end

local StopAnim = function(Rig: Model, Animation: KeyframeSequence)
	if not AnimatorCache.Rigs[Rig] then
		AnimatorCache.Rigs[Rig] = {}
	end
	if not AnimatorCache.Rigs[Rig][Animation.Name] then
		AnimatorCache.Rigs[Rig][Animation.Name] = LoadBoneAnimation(Rig, Animation)
	end
	AnimatorCache.Rigs[Rig][Animation.Name]:Stop()
end

local RestoreMovement = function()
	if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
		States.Movement.Idle = true
		States.Movement.Walking = false
		States.Movement.Running = false
		PlayAnim(Locust, Animations.Idle, .1)
	elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
		States.Movement.Idle = false
		States.Movement.Walking = true
		States.Movement.Running = false
		PlayAnim(Locust, Animations.Walk, .1)
	end
end

-- functions
local PlayUISFX = function(Audio: number)
	local Sound = Instance.new("Sound", workspace)
	Sound.SoundId = "rbxassetid://" .. Audio
	Sound.Volume = 1
	Sound.PlayOnRemove = true
	Sound:Destroy()
	return Sound
end

local PlaySFX = function(Audio: number)
	local Sound = Instance.new("Sound", RootPart)
	Sound.SoundId = "rbxassetid://" .. Audio
	Sound.Volume = 1
	Sound.PlayOnRemove = true
	Sound:Destroy()
	return Sound
end

local PlaySong = function(Parent: Instance, Audio: number)
	local Sound = Instance.new("Sound", Parent)
	Sound.Volume = 1
	Sound.SoundId = Audio
	return Sound
end

local FlashHitHighlight = function(Target: Model?)
	if not Target or not Target:IsA("Model") then return end
	if Target:FindFirstChild("HitHighlight") then return end 
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "HitHighlight"
	Highlight.Adornee = Target
	Highlight.FillColor = Color3.fromRGB(0, 0, 0)
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	Highlight.FillTransparency = 1
	Highlight.OutlineTransparency = 1
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = Target
	local FlashIn = Services.TweenService:Create(Highlight, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {FillTransparency = 0.3, OutlineTransparency = 0})
	local FadeOut = Services.TweenService:Create(Highlight,TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {FillTransparency = 1,OutlineTransparency = 1})
	FlashIn:Play()
	FlashIn.Completed:Once(function() FadeOut:Play() end)
	FadeOut.Completed:Once(function() Highlight:Destroy() end)
end

local CanHit = function(Target: Instance)
	local Time = os.clock()
	if ScriptCache.HitHumanoids[Target] and Time < ScriptCache.HitHumanoids[Target] then
		return false
	end
	ScriptCache.HitHumanoids[Target] = Time + 1.15
	return true
end

local NewHitbox = function(Position: Vector3 | CFrame, Size: number, HitSound: number)
	local Hitbox = Instance.new("Part")
	Hitbox.Size = Size or Vector3.new(4, 4, 4)
	Hitbox.Color = ScriptOptions.Customization.HitboxColor
	Hitbox.Material = Enum.Material.ForceField
	Hitbox.Transparency = 0.5
	Hitbox.Anchored = true
	Hitbox.CanCollide = false
	Hitbox.CanQuery = false
	Hitbox.CanTouch = true
	Hitbox.CFrame = Position or RootPart.CFrame -- RootPart.CFrame * CFrame.new(0, 0, -(4 / 2 + 2))
	Hitbox.Parent = workspace
	local OverlapParams = OverlapParams.new()
	OverlapParams.FilterType = Enum.RaycastFilterType.Exclude
	OverlapParams.FilterDescendantsInstances = {Character}
	local HitboxParts = workspace:GetPartsInPart(Hitbox, OverlapParams)
	for i, v in pairs(HitboxParts) do
		local Target = v:FindFirstAncestorOfClass("Model")
		if Target and Target:FindFirstChildOfClass("Humanoid")  then
			local TargetRoot = Target:FindFirstChild("HumanoidRootPart")
			if TargetRoot and CanHit(Target) then
				FlashHitHighlight(Target)
				if ScriptOptions.Settings.Fling then
					Empyrean.Fling(Target, ScriptOptions)
					PlaySFX(ScriptOptions.Customization.Hitmarker)
					PlaySFX(HitSound or 108515070727256)
				end
			end
		end
	end
	local HitboxFade = game:GetService("TweenService"):Create(Hitbox, TweenInfo.new(0.5), {Transparency = 1})
	HitboxFade:Play()
	game:GetService("Debris"):AddItem(Hitbox, 0.5)
	return Hitbox -- added incase you wanna make it animated or even position it somewhere else
end

local SetWalkSpeed = function(Speed: number)
	Humanoid.WalkSpeed = Speed
end

local SetRootAnchored = function(Anchored: boolean)
	RootPart.Anchored = Anchored
end

-- attacks
local ToggleCrouch = function()
	States.Movement.Crouching = not States.Movement.Crouching
	States.Movement.Idle = false
	States.Movement.Walking = false
	States.Movement.Running = false
	States.Movement.Sitting = false
end

local ToggleSit = function()
	States.Movement.Sitting = not States.Movement.Sitting
	States.Movement.Crouching = false
	States.Movement.Idle = false
	States.Movement.Walking = false
	States.Movement.Running = false
end

local Waypoint = function()
	if not States.Waypoint.SavedPosition then
		States.Waypoint.SavedPosition = RootPart.Position
		if States.Waypoint.TVLocation then States.Waypoint.TVLocation:Destroy() end
		local Part = Objects:WaitForChild("TeleportPart"):Clone()
		Part.CFrame = CFrame.new(States.Waypoint.SavedPosition + Vector3.new(0, -2.975, 0))
		Part.Parent = workspace
		States.Waypoint.TVLocation = Part
	else
		if States.Input.Debounce then return end
		if States.Waypoint.TVLocation then States.Waypoint.TVLocation:Destroy() States.Waypoint.TVLocation = nil end
		SetRootAnchored(true)
		States.Input.Debounce = true
		local TeleportAnim = PlayAnim(Locust, Animations.Spawn, 0.1)
		RootPart.CFrame = CFrame.new(States.Waypoint.SavedPosition)
		TeleportAnim.Completed:Wait()
		States.Waypoint.SavedPosition   = nil
		States.Input.Debounce = false
		SetRootAnchored(false)
		RestoreMovement()
	end
end

local ToggleKillMode = function()
	States.Input.KillMode = not States.Input.KillMode
end

local Kill = function(Target)
	if States.Input.Debounce then return end
	if not States.Input.KillMode then return end
	if not Target then return end
	local Model = Target and Target:FindFirstAncestorOfClass("Model")
	if not Model or not Model:FindFirstChildOfClass("Humanoid") then return end
	local TargetRoot = Model:FindFirstChild("HumanoidRootPart")
	if not TargetRoot then return end
	if not CanHit(Model) then return end
	States.Input.Debounce = true
	SetRootAnchored(true)
	local KillAnim = PlayAnim(Locust, Animations.Kill, 0.1)
	FlashHitHighlight(Model)
	if ScriptOptions.Settings.Fling then
		Empyrean.Fling(Target, ScriptOptions.FlingOptions)
		PlaySFX(ScriptOptions.Customization.Hitmarker or 108515070727256)
	end
	KillAnim.Completed:Wait()
	SetRootAnchored(false)
	States.Input.Debounce = false
	RestoreMovement()
end

-- input
local KeyDown = Services.UserInputService.InputBegan:Connect(function(Key, GPE)
	if GPE then return end
	if Key.UserInputType == Enum.UserInputType.MouseButton1 then
		Kill(Mouse.Target)
	end
	if Key.KeyCode == Enum.KeyCode.Q then
		ToggleCrouch()
	end
	if Key.KeyCode == Enum.KeyCode.C then
		ToggleSit()
	end
	if Key.KeyCode == Enum.KeyCode.X then
		ToggleKillMode()
	end
	if Key.KeyCode == Enum.KeyCode.E then
		Waypoint()
	end
	if Key.KeyCode == Enum.KeyCode.T then
	end
	if Key.KeyCode == Enum.KeyCode.LeftShift then
		States.Input.Shift = true
	end
end)
table.insert(ScriptCache.ActiveConnections, KeyDown)

local KeyUp = Services.UserInputService.InputEnded:Connect(function(Key, GPE)
	if GPE then return end
	if Key.KeyCode == Enum.KeyCode.LeftShift then
		States.Input.Shift = false
	end
end)
table.insert(ScriptCache.ActiveConnections, KeyUp)

local InfiniteJump = Services.UserInputService.JumpRequest:Connect(function()
	if ScriptOptions.Settings.InfiniteJump and Humanoid then
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
table.insert(ScriptCache.ActiveConnections, InfiniteJump)

-- mobile ui
local GUI = script:WaitForChild("UIs").MobileUI
GUI.Parent = game:GetService("CoreGui")
table.insert(ScriptCache.TrashBin, GUI)

local UpdateUI = function()
	local LastInput = Services.UserInputService:GetLastInputType()
	if LastInput == Enum.UserInputType.Touch
	then GUI.Enabled = true
	else GUI.Enabled = false
	end
end

UpdateUI()


Services.UserInputService.LastInputTypeChanged:Connect(UpdateUI)

GUI.AbilitiesUI["ToggleKill"].MouseButton1Down:connect(function() ToggleKillMode() end)
GUI.AbilitiesUI["Waypoint"].MouseButton1Down:connect(function() Waypoint() end)
GUI.AbilitiesUI["Sit"].MouseButton1Down:connect(function() ToggleSit() end)
GUI.AbilitiesUI["Crouch"].MouseButton1Down:connect(function() ToggleCrouch() end)
GUI.AbilitiesUI["Sprint"].MouseButton1Down:connect(function() States.Input.Shift = not States.Input.Shift end)

-- settings ui
local MainGUI = script.UIs:WaitForChild("MainGUI")
MainGUI.Parent = game:GetService("CoreGui")
table.insert(ScriptCache.TrashBin, MainGUI)

local SettingsFrame = MainGUI:WaitForChild("SettingsFrame")
local Vignette = MainGUI:WaitForChild("Vignette")
local SettingsHolder = SettingsFrame:WaitForChild("SettingsHolder")
local FloatingButton = MainGUI:WaitForChild("FloatingButton")
local UIDragDetector = Instance.new("UIDragDetector", FloatingButton)

UIDragDetector.DragStart:Connect(function()
	SettingsFrame.Visible = not SettingsFrame.Visible
	PlayUISFX(18755588842)
end)

FloatingButton.MouseEnter:Connect(function()
	PlayUISFX(122453173810540)
end)

local SetupToggle = function(Setting: boolean)
	local Object = SettingsHolder:FindFirstChild(Setting)
	if not Object then return end
	local Button = Object:FindFirstChildWhichIsA("TextButton")
	if not Button then return end
	Button.BackgroundColor3 = ScriptOptions.Settings[Setting] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
	Button.MouseButton1Click:Connect(function()
		PlayUISFX(18755588842)
		ScriptOptions.Settings[Setting] = not ScriptOptions.Settings[Setting]
		Button.BackgroundColor3 = ScriptOptions.Settings[Setting] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
	end)
end

local SetupTextBox = function(Setting: string | number) -- currently only used in the rigsize (no other textboxes will exist i think)
	local Object = SettingsHolder:FindFirstChild(Setting)
	if not Object then return end
	local TextBox = Object:FindFirstChildWhichIsA("TextBox")
	if not TextBox then return end
	TextBox.Text = tostring(ScriptOptions.Settings[Setting])
	TextBox.FocusLost:Connect(function()
		local Value = tonumber(TextBox.Text)
		if Value then
			ScriptOptions.Settings[Setting] = math.clamp(Value, 0.5, 5)
		else
			TextBox.Text = tonumber(ScriptOptions.Settings[Setting])
		end
	end)
end

for i, v in pairs(ScriptOptions.Settings) do
	local Object = SettingsHolder:FindFirstChild(i)
	if Object then
		if Object:FindFirstChild("Button") then
			SetupToggle(i)
		elseif Object:FindFirstChild("Value") then
			SetupTextBox(i)
		end
	end
end

SettingsHolder.TPToNearestSpawn.Button.MouseButton1Click:Connect(function()
	local RootPart = Character:FindFirstChild("HumanoidRootPart")
	local GetClosestSpawn = function()
		local ClosestSpawn, ClosestDistance = nil, math.huge
		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("SpawnLocation") then
				local Distance = (RootPart.Position - v.Position).Magnitude
				if Distance < ClosestDistance then
					ClosestSpawn = v
					ClosestDistance = Distance
				end
			end
		end
		return ClosestSpawn
	end
	local Spawn = GetClosestSpawn()
	if Spawn then
		RootPart.CFrame = Spawn.CFrame + Vector3.new(0, 5, 0)
	else
		warn("No one is around to help.")
	end
end)

-- runservice connection
local RunServiceConnection = Services.RunService.Heartbeat:Connect(function(dt)
	if States.Input.Debounce then
		StopAnim(Locust,Animations.Idle)
		StopAnim(Locust,Animations.Walk)
		StopAnim(Locust,Animations.Sprint)
	end
	if ScriptOptions.Settings.CameraEffects then
		local TargetOffset = States.Movement.Crouching and Vector3.new(0, 5, 0) or Vector3.new(0, 10, 0)
		Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp(TargetOffset, 0.1)
	else
		Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp(Vector3.zero, 0.1)
	end
	if not States.Input.Debounce then
		if States.Movement.Crouching then
			SetWalkSpeed(3)
		elseif States.Input.Shift then
			SetWalkSpeed(24)
		else
			SetWalkSpeed(6)
		end
	end
	if ScriptOptions.Settings.FOVEffects then
		Camera.FieldOfView = 80 + Theme.PlaybackLoudness / 100
		Vignette.ImageTransparency = 1 - Theme.PlaybackLoudness / 900
	else
		Camera.FieldOfView = 70
		Vignette.ImageTransparency = 1
	end
	if ScriptOptions.Settings.Music then
		Theme.Playing = true
	else
		Theme.Playing = false
	end
	local RootPartOrigin = RootPart.Position
	local Direction = Vector3.new(0, -1, 0) * 4
	local Params = RaycastParams.new()
	Params.FilterDescendantsInstances = {Character}
	Params.FilterType = Enum.RaycastFilterType.Exclude
	Params.IgnoreWater = true
	local Result = workspace:Raycast(RootPartOrigin, Direction, Params)
	local HitFloor = Result and Result.Instance
	local HitPosition = Result and Result.Position
	local TorsoVelocity = (RootPart.Velocity).Magnitude
	local TorsoVerticalVelocity = RootPart.Velocity.Y
	if TorsoVelocity < 0.001 and HitFloor ~= nil and not States.Input.Debounce then
		if States.Movement.Crouching then
			States.Movement.Crouching = true
			PlayAnim(Locust,Animations.IdleCrouch, 0.1)
		elseif States.Movement.Sitting then
			PlayAnim(Locust, Animations.Sit, 0.1) 
		elseif States.Movement.Idle == false then
			States.Movement.Idle = true
			PlayAnim(Locust,Animations.Idle, 0.1)
		end
		States.Movement.Walking = false
		States.Movement.Running = false
		StopAnim(Locust,Animations.Walk)
		StopAnim(Locust,Animations.Sprint)
	elseif TorsoVelocity > 6 and HitFloor ~= nil and not States.Input.Debounce and States.Input.Shift and not States.Movement.Crouching then
		if States.Movement.Running == false then
			States.Movement.Running = true
			PlayAnim(Locust, Animations.Sprint, 0.1)
		end
		States.Movement.Idle = false
		States.Movement.Walking = false
		StopAnim(Locust,Animations.Idle)
		StopAnim(Locust,Animations.Walk)
	elseif TorsoVelocity > 6 and HitFloor ~= nil and not States.Input.Debounce then
		if States.Movement.Crouching then
			States.Movement.Walking = true
			PlayAnim(Locust, Animations.WalkCrouch, 0.1)
		elseif States.Movement.Walking == false then
			States.Movement.Walking = true
			PlayAnim(Locust,Animations.Walk, 0.1)
		end
		States.Movement.Idle = false
		States.Movement.Running = false
		StopAnim(Locust,Animations.Idle)
		StopAnim(Locust,Animations.Sprint)
	end
end)
table.insert(ScriptCache.ActiveConnections, RunServiceConnection)

Empyrean.BindableEvent.Event:Once(function()
	print("Resetting.")
	for i, v in ScriptCache.TrashBin do
		v:Destroy()
	end
	for i, v in ScriptCache.ActiveConnections do
		v:Disconnect()
	end
end)