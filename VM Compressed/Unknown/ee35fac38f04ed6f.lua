-- [[ Admin : Reanimate ]] --

--[[
  Credits:
  // Melon - Created this script
  // Emper - Created the reanimation used
  // ZerX - Movement scripting (last part only, i edited it a bit)
  // Xoaterz - Created the assets used to make this script.

  Note: if there's bugs pls let me know so i can fix them
  the code may be unoptimized at some parts

  Free hats:
  // Voidstar: https://www.roblox.com/catalog/2309346267/Classic-PC-Hat
 
  Free rig:
  // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
  // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
  // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
  // https://www.roblox.com/catalog/3033908130/International-Fedora-France
  // https://www.roblox.com/catalog/4819740796/Robox

  Paid hats are found in this game:
  // https://www.roblox.com/games/15541318313/Melons-Baseplate
]] 

local Directories = {
	Main = "FEVerse/",
	RBXMs ="FEVerse/RBXMs/",
	Sounds = "FEVerse/Sounds/",
	Songs = "FEVerse/Songs/",
}

local FEManager = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/a003ea305dd302eab1f8d372daed38b4/raw/9db59962b28555fd699a7c29891efb85d45677ab/gistfile1.txt"))()
for i, v in pairs(Directories) do FEManager.EnsureFolder(v) end
task.spawn(function()
FEManager.DownloadFile(Directories.RBXMs, "Admin.rbxmx", "https://drive.usercontent.google.com/download?id=1sYex5UmZvaFkQrc6P8AW5cWyX1a3RGoQ&export=download")
FEManager.DownloadFile(Directories.Sounds, "Chase.mp3", "https://raw.githubusercontent.com/MelonsStuff/FEVerse/refs/heads/main/Sounds/Admin/Chase.MP3")
FEManager.DownloadFile(Directories.Sounds, "Ambience.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Ambience.mp3")
FEManager.DownloadFile(Directories.Sounds, "Execution.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Execution.mp3")
FEManager.DownloadFile(Directories.Sounds, "NovaExplode.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/NovaExplode.mp3")
FEManager.DownloadFile(Directories.Sounds, "NovaThrow.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/NovaThrow.mp3")
FEManager.DownloadFile(Directories.Sounds, "ObservantStart.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/ObservantStart.mp3")
FEManager.DownloadFile(Directories.Sounds, "ObservantCancel.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/ObservantCancel.mp3")
FEManager.DownloadFile(Directories.Sounds, "ObservantTeleport.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/ObservantTeleport.mp3")
FEManager.DownloadFile(Directories.Sounds, "Stab.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Stab.mp3")
FEManager.DownloadFile(Directories.Sounds, "Stun.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/Stun.mp3")
FEManager.DownloadFile(Directories.Sounds, "VoidRushStart.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/VoidRushStart.mp3")
FEManager.DownloadFile(Directories.Sounds, "VoidRushCharge.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/VoidRushCharge.mp3")
FEManager.DownloadFile(Directories.Sounds, "VoidRushSlam.mp3", "https://github.com/MelonsStuff/FEVerse/raw/refs/heads/main/Sounds/Admin%20Reworked/VoidRushSlam.mp3")
end)

local IntroKeyframes = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/d1eab70e7877e0769f42e6c4d89fc6f4/raw/e2c4a9a2af52d8f8426aacfc54435372dd8cc587/AdminIntroKeyframes.lua"))().Keyframes
local OutroKeyframes = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/c4a31886c3099a91fe6a0b33d17045bc/raw/017c725d5cd8c84a5ee404e4b30e8477aae36c05/AdminOutroKeyframes.lua"))().Keyframes

local Reanimate_Settings = {
	Frequency = 6, -- this is basically how fast the oscillation goes
	Amplification = 6, -- this is how far the oscillation goes
	FrontOffset = 2.5, -- this is how much youre in front of the player during prediction
}

local Settings = {
	Fling = true;
	Earrape = false;
	CameraEffects = true;
	InfiniteJump = false;
	Spin = false;
	RigSize = 1;
	Ragdoll = false;
	Music = true;
}

do
  local ReanimateVoidstar

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
									local Frequency = Reanimate_Settings.Frequency
									local Amplification = Reanimate_Settings.Amplification
									local Time = tick()
									local TargetFace = Target.CFrame.LookVector
									local Oscillation = mathsin(Time * mathpi * 2 * Frequency) * Amplification
									local OscillatedOffset = TargetFace * Oscillation
									local FrontFaceOffset = TargetFace * Reanimate_Settings.FrontOffset
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
		if not Settings.Ragdoll then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
        else
            for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") and Descendant.Name ~= "HumanoidRootPart" and Descendant.Name ~= "VoidStar" then
					Descendant.CanCollide = true
				end
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

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = "non"
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			local CreateObject = function(Name)
				local Part = Instance.new("Part")
				Part.Name = Name
				Part.Massless = true
				Part.CanCollide = true
				Part.Transparency = 1
				Part.Size = Vector3new(0.1, 0.1, 0.1)
				Part.Anchored = true
				Part.Parent = Rig
				return Part
			end

            ReanimateVoidstar = CreateObject("Reanimate_Voidstar")

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
                ReanimateVoidstar.Anchored = false
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
        -- 2x Rig
        { Name = "Head", MeshId = "92572400594624",  TextureId = "117484156735788", Offset = CFrame.new(0, 2.15, 0) * CFrame.Angles(0, Rad(180), 0) },
        { Name = "Torso", MeshId = "111946216585470",  TextureId = "85260593368362", Offset = CFrame.new(0, 1.5, 0.25) },
        { Name = "Right Arm", MeshId = "93749227415046", TextureId = "103757531289975", Offset = CFrame.new(1, 0.85, 0) },
        { Name = "Left Arm", MeshId = "117649985156221", TextureId = "103757531289975", Offset = CFrame.new(-1, 0.85, 0) },
        { Name = "Right Leg",MeshId = "76010149115685",  TextureId = "103160995675216", Offset = CFrame.new(-0.55, 1, 0) },
        { Name = "Left Leg", MeshId = "137156465227879", TextureId = "103160995675216", Offset = CFrame.new(0.55, 1, 0) },
        -- Tords Rig
	 	{ Name = "Torso", MeshId = "97772676424430",  TextureId = "96282018871478", Offset = CFrame.identity },
 	    { Name = "Right Arm", MeshId = "128839203893104",  TextureId = "100542973447024", Offset = CFrame.identity },
 	    { Name = "Left Arm", MeshId = "113944263422349",  TextureId = "79061753792604", Offset = CFrame.identity },
		-- Hammer Head Rig
	 	{ Name = "Torso", MeshId = "139792224823925",  TextureId = "89183204903931", Offset = CFrame.Angles(0, 0, Rad(90)) },
 	    { Name = "Right Arm", MeshId = "105263225400272",  TextureId = "111402858657243", Offset = CFrame.Angles(0, 0, Rad(90)) },
 	    { Name = "Left Arm", MeshId = "105263225400272",  TextureId = "111402858657243", Offset = CFrame.Angles(0, 0, Rad(90)) },
    	-- Glitchy Limbs (Monochrome)
		{ Name = "Torso", MeshId = "94838871645327",  TextureId = "108681181592495", Offset = CFrame.identity },
		{ Name = "Right Arm", MeshId = "18885728798", TextureId = "18885728798", Offset = CFrame.identity },
		{ Name = "Left Arm", MeshId = "18885728798", TextureId = "18885728798", Offset = CFrame.identity },
		{ Name = "Right Leg",MeshId = "100080236046620",  TextureId = "78703116520529", Offset = CFrame.identity },
		{ Name = "Left Leg", MeshId = "91790195871679", TextureId = "108681181592495", Offset = CFrame.identity },
		-- Gojo Rig
		{ Name = "Torso", MeshId = "113465334594272",  TextureId = "94020114074172", Offset = CFrame.identity },
		{ Name = "Right Arm",MeshId = "82030652840870",  TextureId = "137595219926625", Offset = CFrame.identity },
		{ Name = "Left Arm", MeshId = "91244322746029", TextureId = "137595219926625", Offset = CFrame.identity },
		{ Name = "Right Leg", MeshId = "132187752780278", TextureId = "97394845862368", Offset = CFrame.Angles(3.15, 0, 0) },
		{ Name = "Left Leg", MeshId = "131967977780088", TextureId = "97394845862368", Offset =  CFrame.Angles(3.15, 0, 0) },
		-- New Free Hair Limbs
		{ MeshId = "319354652", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(0, -1.57, 0), TextureId = "376186990" },
		{ MeshId = "319354652", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(0, 1.57, 0), TextureId = "304117018" },
		{ MeshId = "81642452", Name = "Left Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858317942" },
		{ MeshId = "81642452", Name = "Right Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858318826" },
		-- New Free Rig
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.Angles(0, 0, -0.25), TextureId = "4819722776" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033903209" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "3360978739" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.new(0.15, 0, 0) * CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033898741" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, -1.57), TextureId = "3409604993" },
		-- Snake Banisher Rig
		{ MeshId = "125443585075666", Name = "Torso", Offset = CFrame.Angles(0, 3.15, 0), TextureId = "121023324229475" },
		{ MeshId = "121342985816617", Name = "Left Arm", Offset = CFrame.Angles(0, 0, 1.57), TextureId = "129264637819824" },
		{ MeshId = "121342985816617", Name = "Right Arm", Offset = CFrame.Angles(0, 3.15, 1.57), TextureId = "129264637819824" },
		{ MeshId = "83395427313429", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "97148121718581" },--18641142410
		-- Prosthetics (Furnace Rig)
		{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "99077561039115" },
		{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "99077561039115" },
		{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "84429400539007" },
		{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "84429400539007" },
		-- Classic Cheap Rig
		{ MeshId = "12344206657", Name = "Left Arm", Offset = CFrame.new(0.05, 0.05, -0.075) * CFrame.Angles(-2, 0, 0), TextureId = "12344206675" },
		{ MeshId = "12344207333", Name = "Right Arm", Offset = CFrame.new(-0.05, 0.05, -0.075) * CFrame.Angles(-1.95, 0, 0), TextureId = "12344207341" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(1.57, 1.57, 0), TextureId = "11159284657" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(1.57, -1.57, 0), TextureId = "11263219250" },
		-- Grey Mesh Rig 
		{ MeshId = "127552124837034", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--14255556501
		{ MeshId = "117287001096396", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "120169691545791" },--14255556501
		{ MeshId = "121304376791439", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--18641142410
		-- Classical Products rig (white/black arms)
		{ MeshId = "14241018198", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14251599953" },
		{ MeshId = "17374767929", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },
		{ MeshId = "17387586286", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },
		{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },
		-- Noob Rig
		{ MeshId = "18640899369", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "18640899481" },
		{ MeshId = "18640914129", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640914168" },
		{ MeshId = "18640901641", Names = { "Left Leg", "Right Leg"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640901676" },
		-- Genesis Black Rig
		{ MeshId = "110684113028749", Name = "Torso", Offset = CFrame.identity, TextureId = "70661572547971" },
		{ MeshId = "125405780718494", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		-- Genesis White Rig
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "130689541138804" },
		{ MeshId = "99608462237958", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
		{ MeshId = "139733645770094", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
		{ MeshId = "105141400603933", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "71060417496309" },
		{ MeshId = "90736849096372", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "79186624401216" },
		-- request
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "14768664565" },
		{ MeshId = "14768684979", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14768683674" },
	    -- Blocks
        -- 138094177071382 / Admin's Command Block
 		{ Name = "Reanimate_Voidstar", MeshId = "124450938319006", TextureId = "116140049379017", Offset =  CFrame.Angles(0, 0, 0) },
        -- 126174506610997 / Tesseract Void
 		{ Name = "Reanimate_Voidstar", MeshId = "114491662662773", TextureId = "116639272672519", Offset =  CFrame.Angles(0, 0, 0) },
        -- 79778797065018 / YAAI Noli Tab
 		{ Name = "Reanimate_Voidstar", MeshId = "75226925425816", TextureId = "114653511721119", Offset =  CFrame.Angles(0, 0, 0) },
        -- 107375989698675 / Noli's Nova
 		{ Name = "Reanimate_Voidstar", MeshId = "111761423287127", TextureId = "104436009988593", Offset =  CFrame.Angles(0, 0, 0) },
        -- 18427767574 / Bloxy Cola
 		{ Name = "Reanimate_Voidstar", MeshId = "18427706530", TextureId = "18427706831", Offset =  CFrame.Angles(Rad(-90), 0, 0) },
        -- 89392828628286 / Devesto F3X
 		{ Name = "Reanimate_Voidstar", MeshId = "93839976189892", TextureId = "87530318962700", Offset =  CFrame.Angles(0, 0, 0) },
        -- 81135739703341 / Red Room Cursor
 		{ Name = "Reanimate_Voidstar", MeshId = "133225911736441", TextureId = "93962139150200", Offset =  CFrame.Angles(0, 0, 0) },
        -- 75152516777442 / Umbra Eye
 		{ Name = "Reanimate_Voidstar", MeshId = "118568444522464", TextureId = "79834113476615", Offset =  CFrame.Angles(0, 0, 0) },
        -- 75152516777442 / R6 Noli Holdable
 		{ Name = "Reanimate_Voidstar", MeshId = "105852387370635", TextureId = "77723769921327", Offset =  CFrame.Angles(0, 0, 0) },
        -- 138094177071382 / PC Head (Free)
 		{ Name = "Reanimate_Voidstar", MeshId = "2309330801", TextureId = "2309333814", Offset = CFrame.Angles(0, 0, 0) },
    },
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = false,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = false,
		PredictionFling = true,
		Timeout = 0.1,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, -30, 0),
	ParentCharacter = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})

DefaultFlingOptions = {
	HatFling = false,
	Highlight = false,
	PredictionFling = true,
	Timeout = 0.25,
	ToolFling = false,
}

-- services
local script = game:GetObjects(getcustomasset(Directories.RBXMs.."Admin.rbxmx"))[1]

local FPS = setfpscap(60)
local Blend = 0.35 -- this is for animation smoothing.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local AnimatorModule = {}
local TrashBin = {}
local StoredMotors = {}

local GetAnimDefaults = function()
	return {
		["Voidstar"] = CFrame.new(0, Settings.RigSize-1, -Settings.RigSize+0.5),
		["Neck"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["RootJoint"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["Right Shoulder"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Shoulder"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		["Right Hip"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Hip"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		["Head"] = CFrame.new(0, Settings.RigSize, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["Torso"] = CFrame.new(0, Settings.RigSize-1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["Right Arm"] = CFrame.new(Settings.RigSize, Settings.RigSize-0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Arm"] = CFrame.new(-Settings.RigSize, Settings.RigSize-0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		["Right Leg"] = CFrame.new(Settings.RigSize, -Settings.RigSize, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
		["Left Leg"] = CFrame.new(-Settings.RigSize, -Settings.RigSize, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	}
end

local Edit = function(Joint, TargetCFrame, Duration, Style, Direction, Blend)
	if not Style or typeof(Style) ~= "EnumItem" or Style.EnumType ~= Enum.EasingStyle then
		Style = Enum.EasingStyle.Cubic
	end
	if not Direction or typeof(Direction) ~= "EnumItem" or Direction.EnumType ~= Enum.EasingDirection then
		Direction = Enum.EasingDirection.InOut
	end
	local StartCFrame = Joint.C0
	local Tween = TweenService:Create(Joint, TweenInfo.new(Duration, Style, Direction), {
		C0 = StartCFrame:Lerp(TargetCFrame, Blend)
	})
	Tween:Play()
	return Tween
end

function AnimatorModule:LoadAnimation(Rig, KeyframeSequence)
	local Sequence = KeyframeSequence
	local RigHumanoid = Rig:FindFirstChildOfClass("Humanoid")
	if RigHumanoid.RigType ~= Enum.HumanoidRigType.R6 then
		return error("Rig Humanoid is not R6!")
	end
	local Joints = {
		["Voidstar"] = Rig.HumanoidRootPart:FindFirstChild("Voidstar"),
		["Head"] = Rig.Torso["Neck"],
		["Torso"] = Rig.HumanoidRootPart:FindFirstChild("RootJoint") or Rig.HumanoidRootPart:FindFirstChild("Root Joint"),
		["Left Arm"] = Rig.Torso["Left Shoulder"],
		["Right Arm"] = Rig.Torso["Right Shoulder"],
		["Left Leg"] = Rig.Torso["Left Hip"],
		["Right Leg"] = Rig.Torso["Right Hip"],
	}
	local Class = {}
	Class.Speed = 1
	Class.KeepLast = 0
	local Keyframes = Sequence:GetKeyframes()
	table.sort(Keyframes, function(a, b) return a.Time < b.Time end)
	Class.Length = Keyframes[#Keyframes].Time
	local function Yield(Seconds)
		RunService.Heartbeat:Wait(Seconds / Class.Speed)
	end
	for _, v in ipairs(Sequence:GetDescendants()) do
		if v:IsA("IntValue") or v:IsA("StringValue") or v:IsA("Folder") then
			v:Destroy()
		elseif v:IsA("Pose") and not Rig:FindFirstChild(v.Name, true) then
			v:Destroy()
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
	function Class:Play(Speed)
		if Speed and Speed < 0 then
			Speed = math.abs(Speed)
		end
		Class.Speed = math.clamp(Speed or 180, 1, 180)
		Class.Stopped = false
		Class.IsPlaying = true
		task.spawn(function()
			Class.Completed:Connect(function()
				if Class.Looped then
					Class.TimePosition = 0
				end
			end)
			local Connection
			Connection = RunService.Heartbeat:Connect(function(dt)
				if Class.IsPlaying and not Class.Stopped and RigHumanoid.Health > 0 then
					Class.TimePosition += math.min(dt * Class.Speed, 1)
				else
					Connection:Disconnect()
				end
			end)
		end)
		task.spawn(function()
			repeat
				for K = 1, #Keyframes do
					local K0, K1, K2 = Keyframes[K-1], Keyframes[K], Keyframes[K+1]
					if not Class.Stopped and RigHumanoid.Health > 0 then
						if K0 then
							Yield(K1.Time - K0.Time)
						end
						task.spawn(function()
							for _, Pose in ipairs(K1:GetDescendants()) do
								if Joints[Pose.Name] then
									local AnimDefaults = GetAnimDefaults()
									local Duration = K2 and (K2.Time - K1.Time) / Class.Speed or 0.5
									Edit(Joints[Pose.Name], AnimDefaults[Pose.Name] * Pose.CFrame, Duration, Pose.EasingStyle, Pose.EasingDirection, Blend)
								end
							end
						end)
						if K == #Keyframes and Class.KeepLast > 0 then
							Yield(Class.KeepLast)
						end
						Reached:Fire(K1.Name)
					else
						break
					end
				end
				Completion:Fire()
			until not Class.Looped or Class.Stopped or RigHumanoid.Health == 0
			Class.IsPlaying = false
		end)
	end
	function Class:Stop()
		Class.Stopped = true
	end
	function Class:AdjustSpeed(Speed)
		if Speed < 0 then
			Speed = math.abs(Speed)
		end
		Class.Speed = math.clamp(Speed or Class.Speed, 1, 180)
	end
	return Class
end

-- booleans + table
local Idle, Walking, Running, Enraged = false, false, false, false
local Debounce, Shift, CanHitbox = false, false, false
local MeleeHit = false
local HitboxConnection
local LastRagdoll = Settings.Ragdoll

-- character setup
local Player = Players.LocalPlayer
local Character = Empyrean.Rig
local Head = Character:WaitForChild("Head")
local Torso = Character:WaitForChild("Torso")
local LeftArm, RightArm = Character:WaitForChild("Left Arm"), Character:WaitForChild("Right Arm")
local LeftLeg, RightLeg = Character:WaitForChild("Left Leg"), Character:WaitForChild("Right Leg")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
pcall(function()
	Character:FindFirstChild("Animate"):Destroy()
	Humanoid:FindFirstChild("Animator"):Destroy()
end)

-- player functions
local Mouse = Player:GetMouse()
local SetWalkSpeed = function(Speed) Humanoid.WalkSpeed = Speed end
local SetRootPartAnchor = function(Bool) RootPart.Anchored = Bool end

task.spawn(function()
    local ShitlockController = Player.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
    ShitlockController:FindFirstChild("BoundKeys").Value = "LeftControl, RightControl"
end)

-- effects setup
local Animations = script:WaitForChild("Animations")
local Objects = script:WaitForChild("Objects")

local Camera = workspace.CurrentCamera

local PlaySound = function(Audio)
	local Sound = Instance.new("Sound", RootPart)
	Sound.SoundId = "rbxassetid://" .. Audio
	Sound.Volume = 1
	if Settings.Earrape then
		Sound.Volume = 10
		Instance.new("DistortionSoundEffect", Sound)
	end
	Sound.PlayOnRemove = true
	Sound:Destroy()
end

local PlaySoundFromDisk = function(Audio)
	local Sound = Instance.new("Sound", RootPart)
	Sound.SoundId = getcustomasset(Directories.Sounds..Audio)
	Sound.Volume = 1
	if Settings.Earrape then
		Sound.Volume = 10
		Instance.new("DistortionSoundEffect", Sound)
	end
	Sound.PlayOnRemove = true
	Sound:Destroy()
end

local Theme = Instance.new("Sound", RootPart)
Theme.SoundId = getcustomasset(Directories.Sounds.."Chase.mp3")
Theme.Volume = 1
Theme.Looped = true
Theme:Play()

local Ambience = Instance.new("Sound", RootPart)
Ambience.SoundId = getcustomasset(Directories.Sounds.."Ambience.mp3")
Ambience.Volume = 0.5
Ambience.Looped = true
Ambience:Play()

local Voidstar = Objects:WaitForChild("Voidstar"):Clone()
Voidstar.Transparency = 1
Voidstar.Parent = Character
local VoidstarWeld = Instance.new("Weld")
VoidstarWeld.Name = "Voidstar"
VoidstarWeld.Parent = RootPart
VoidstarWeld.Part0 = RootPart
VoidstarWeld.Part1 = Voidstar
VoidstarWeld.C0 = CFrame.new(0, -0.1, 0)
VoidstarWeld.C1 = CFrame.new(0, -0.1, 0)

local ReanimateVS = Character:FindFirstChild("Reanimate_Voidstar") -- lazy, dont u think?
local ReanimateVSW = Instance.new("Weld")
ReanimateVSW.Name = "VSW"
ReanimateVSW.Parent = ReanimateVS
ReanimateVSW.Part0 = ReanimateVS
ReanimateVSW.Part1 = Voidstar

local TeleportingPart, WarningPart
local TeleportingPartTemplate = Objects:FindFirstChild("GeneratorIncoming"):Clone()
local WarningPartTemplate = Objects:FindFirstChild("GeneratorWarning"):Clone()
WarningPartTemplate.Anchored = true
WarningPartTemplate.CanCollide = false
TeleportingPartTemplate.Anchored = true
TeleportingPartTemplate.CanCollide = false

local FlashHitHighlight = function(Target)
	if not Target or not Target:IsA("Model") then return end
	if Target:FindFirstChild("HitHighlight") then return end 
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "HitHighlight"
	Highlight.Adornee = Target
	Highlight.FillColor = Color3.fromRGB(255, 60, 60)
	Highlight.OutlineColor = Color3.fromRGB(145, 0, 0)
	Highlight.FillTransparency = 1
	Highlight.OutlineTransparency = 1
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = Target
	local FlashIn = TweenService:Create(Highlight, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {FillTransparency = 0.3, OutlineTransparency = 0})
	local FadeOut = TweenService:Create(Highlight,TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{FillTransparency = 1,OutlineTransparency = 1})
	FlashIn:Play()
	FlashIn.Completed:Once(function() FadeOut:Play() end)
	FadeOut.Completed:Once(function() Highlight:Destroy() end)
end

local EnableHitbox = function()
	if HitboxConnection then
		HitboxConnection:Disconnect()
		HitboxConnection = nil
	end
	HitboxConnection = Voidstar.Touched:Connect(function(Hit)
		if not CanHitbox then return end
		if Hit:IsDescendantOf(Character) then return end
		local Target = Hit:FindFirstAncestorOfClass("Model")
		local TargetHumanoid = Target and Target:FindFirstChildOfClass("Humanoid")
		if TargetHumanoid then
			PlaySound(3417831369)
			if Settings.Fling then
            Empyrean.Fling(Target, DefaultFlingOptions)
			end
			FlashHitHighlight(Target)
			HitboxConnection:Disconnect()
			HitboxConnection = nil
		end
	end)
end

local IntroCameraAnimation = function()
    if not Settings.CameraEffects then return end
	local StartTime = tick()
	Camera.CameraType = Enum.CameraType.Scriptable
	local Index = 1
	local Connection
	Connection = RunService.RenderStepped:Connect(function()
		if Index >= #IntroKeyframes then Connection:Disconnect() Camera.CameraType = Enum.CameraType.Custom return end
		local CurrentTime = tick() - StartTime
		local KF1 = IntroKeyframes[Index]
		local KF2 = IntroKeyframes[Index + 1]
		local DeltaTime = KF2.Time - KF1.Time
		local Alpha = DeltaTime == 0 and 1 or math.clamp((CurrentTime - KF1.Time) / DeltaTime, 0, 1)
		local CF1 = KF1.CFrames.MainCFrame
		local CF2 = KF2.CFrames.MainCFrame
		local OffsetCFrame = CF1:Lerp(CF2, Alpha)
		Camera.CFrame = RootPart.CFrame * CFrame.new (0, -3, 0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0) ) * OffsetCFrame
		if CurrentTime >= KF2.Time then
			Index += 1
		end
	end)
end

local OutroCameraAnimation = function()
    if not Settings.CameraEffects then return end
	local StartTime = tick()
	Camera.CameraType = Enum.CameraType.Scriptable
	local Index = 1
	local Connection
	Connection = RunService.RenderStepped:Connect(function()
		if Index >= #OutroKeyframes then	Connection:Disconnect() Camera.CameraType = Enum.CameraType.Custom return end
		local CurrentTime = tick() - StartTime
		local KF1 = OutroKeyframes[Index]
		local KF2 = OutroKeyframes[Index + 1]
		local DeltaTime = KF2.Time - KF1.Time
		local Alpha = DeltaTime == 0 and 1 or math.clamp((CurrentTime - KF1.Time) / DeltaTime, 0, 1)
		local CF1 = KF1.CFrames.MainCFrame
		local CF2 = KF2.CFrames.MainCFrame
		local OffsetCFrame = CF1:Lerp(CF2, Alpha)
		Camera.CFrame = RootPart.CFrame * CFrame.new (0, -3, 0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0) ) * OffsetCFrame
		if CurrentTime >= KF2.Time then
			Index += 1
		end
	end)
end

-- animator functions
local PlayAnim = function(Rig, Animation, AnimSpeed)
	if not AnimatorModule[Rig] then
		AnimatorModule[Rig] = {}
	end
	if not AnimatorModule[Rig][Animation.Name] then
		AnimatorModule[Rig][Animation.Name] = AnimatorModule:LoadAnimation(Rig, Animation)
	end
	for Name, Track in pairs(AnimatorModule[Rig]) do
		if Name ~= Animation.Name then
			Track:Stop()
		end
	end
	local AnimInstance = AnimatorModule[Rig][Animation.Name]
	if not AnimInstance.IsPlaying then
		AnimInstance:Play(AnimSpeed or 1)
	end
	return AnimInstance
end

local StopAnim = function(Rig, Anim)
	if not AnimatorModule[Rig] then
		AnimatorModule[Rig] = {}
	end
	if not AnimatorModule[Rig][Anim.Name] then
		AnimatorModule[Rig][Anim.Name] = AnimatorModule:LoadAnimation(Rig, Anim)
	end
	AnimatorModule[Rig][Anim.Name]:Stop()
end

local RestoreMovement = function()
	if RootPart.Velocity.Magnitude < 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
		Idle = true
		Walking = false
		Running = false
		PlayAnim(Character, Animations.Idle, 1)
	elseif RootPart.Velocity.Magnitude > 1 and workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character) then
		Idle = false
		Walking = true
		Running = false
 		PlayAnim(Character, Animations.Walk, 1)
	end
end

-- attacks
-- slightly aged code so it might be a bit unoptimized (i reused the void rush from my old mafioso script)
local Intro = function()
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
	local IntroAnimation = PlayAnim(Character, Animations.Introduction_KillerRig, 1)
    IntroCameraAnimation()
	PlaySound(124667791992796)
	IntroAnimation.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	Camera.CameraType = Enum.CameraType.Custom
	RestoreMovement()
end

local Outro = function()
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
	local OutroAnimation = PlayAnim(Character, Animations.Victory_KillerRig, 1)
    OutroCameraAnimation()
	PlaySound(125557917165272)	
	OutroAnimation.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	Camera.CameraType = Enum.CameraType.Custom
	RestoreMovement()
end

local Stun = function()
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
    PlaySoundFromDisk("Stun.mp3")
	PlaySound(92316384695634)
	PlaySound(17837549788)
	local StunStart = PlayAnim(Character, Animations.Stunned_Start, 1)
	StunStart.Completed:Wait()
	local StunnedLoop = PlayAnim(Character, Animations.Stunned_Loop, 1)
	StunnedLoop.Completed:Wait(5)
	local StunnedEnd = PlayAnim(Character, Animations.Stunned_End, 1)
	StunnedEnd.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	RestoreMovement()
end

local Execute = function()
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	SetRootPartAnchor(true)
    PlaySound(104206188941961) -- i told you
    PlaySoundFromDisk("Execution.mp3")
	local KillerAnimation = PlayAnim(Character, Animations.Execution_KillerRig, 0, 1.2)
	KillerAnimation.Completed:Wait()
	Debounce = false
	SetRootPartAnchor(false)
	RestoreMovement()
end

local Stab = function()
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	CanHitbox = true
	EnableHitbox()
	local StabAnimation = PlayAnim(Character, Animations.Stab, 1)
    PlaySoundFromDisk("Stab.mp3")
	StabAnimation.Completed:Wait()
	Debounce = false
	CanHitbox = false
 	RestoreMovement()
end

local Void_Rush = function() -- ts so buns gng 🗣️
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	local Damaged = false
	SetRootPartAnchor(false)
	local StartAnim = PlayAnim(Character, Animations.VoidRush_StartDashInit, 0, 1)
    PlaySoundFromDisk("VoidRushStart.mp3")
	StartAnim.Completed:Wait()
	SetRootPartAnchor(false)
	local LoopAnim = PlayAnim(Character, Animations.VoidRush_LoopDashInit, 0, 1)
	local RushVelocity = Instance.new("BodyVelocity")
	RushVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
	RushVelocity.Parent = RootPart
	local VelocityUpdate
	VelocityUpdate = RunService.Heartbeat:Connect(function()
		RushVelocity.Velocity = RootPart.CFrame.LookVector * 45
	end)
	local TouchedConnection
	TouchedConnection = RootPart.Touched:Connect(function(Hit)
		if Hit:IsDescendantOf(Character) then return end
		local Hum = Hit.Parent:FindFirstChildOfClass("Humanoid")
		if Hum and not Damaged then
			Damaged = true
			RushVelocity:Destroy()
			VelocityUpdate:Disconnect()
			TouchedConnection:Disconnect()
			SetRootPartAnchor(true)
			PlaySound(117069245824496)
			local FirstHitAnimation = PlayAnim(Character, Animations.VoidRush_WeakHit, 0, 1)
			FirstHitAnimation.Completed:Wait()
			SetRootPartAnchor(false)
			local LoopAnimation = PlayAnim(Character, Animations.VoidRush_LoopDashInit, 0, 1)
			local SecondRushVelocity = Instance.new("BodyVelocity")
			SecondRushVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			SecondRushVelocity.Parent = RootPart
			local SecondVelocityUpdate
			SecondVelocityUpdate = RunService.Heartbeat:Connect(function()
				SecondRushVelocity.Velocity = RootPart.CFrame.LookVector * 45 * 1.2
			end)
			local SecondHit = false
			local SecondTouched
			local VoidRush2Sound = Instance.new("Sound", RootPart)
			VoidRush2Sound.SoundId = "rbxassetid://110418348779758"
			VoidRush2Sound:Play()
			SecondTouched = RootPart.Touched:Connect(function(Hit2)
				if Hit2:IsDescendantOf(Character) then return end
                local Target = Hit2:FindFirstAncestorOfClass("Model")
				local Hum2 = Target:FindFirstChildOfClass("Humanoid")
				if Hum2 and not SecondHit then
					SecondHit = true
					VoidRush2Sound:Stop()
					VoidRush2Sound:Destroy()
					SecondTouched:Disconnect()
					SecondVelocityUpdate:Disconnect()
					SecondRushVelocity:Destroy()
					SetRootPartAnchor(true)
                    PlaySoundFromDisk("VoidRushSlam.mp3")
                    FlashHitHighlight(Target)
 					local SlamAnimation = PlayAnim(Character, Animations.VoidRush_KillerRig, 0, 1.2)
					SlamAnimation.Completed:Wait()
					if Settings.Fling then
                    Empyrean.Fling(Target, DefaultFlingOptions)
		           	end
					Debounce = false
					SetRootPartAnchor(false)
					RestoreMovement()
				end
			end)
			task.delay(1, function()
				if not SecondHit then
					if SecondTouched.Connected then SecondTouched:Disconnect() end
					SecondVelocityUpdate:Disconnect()
					SecondRushVelocity:Destroy()
					SetRootPartAnchor(true)
					PlaySound(85216662975005)
					VoidRush2Sound:Stop()
					VoidRush2Sound:Destroy()
					local MissAnimation = PlayAnim(Character, Animations.VoidRush_EndDash, 0, 1)
					MissAnimation.Completed:Wait()
					Debounce = false
					SetRootPartAnchor(false)
					RestoreMovement()
				end
			end)
		end
	end)
	task.delay(0.35 + 1, function()
		if Damaged then return end
		if TouchedConnection.Connected then TouchedConnection:Disconnect() end
		VelocityUpdate:Disconnect()
		RushVelocity:Destroy()
		SetRootPartAnchor(true)
		PlaySound(71208557852255)
		local MissAnimation = PlayAnim(Character, Animations.VoidRush_EndDash, 0, 1)
		MissAnimation.Completed:Wait()
		Debounce = false
		SetRootPartAnchor(false)
		RestoreMovement()
	end)
end

local Observant = function()
	if Debounce then return end
	if ObservantActive then
		if WarningConnection then
			WarningConnection:Disconnect()
			WarningConnection = nil
		end
		if WarningPart then
			WarningPart:Destroy()
			WarningPart = nil
		end
        PlaySoundFromDisk("ObservantCancel.mp3")
		SetRootPartAnchor(false)
		ObservantActive = false
		Debounce = false
		RestoreMovement()
        return
	end
	Debounce = true
	ObservantActive = true
	PlaySoundFromDisk("ObservantStart.mp3")
	local ObservantStart = PlayAnim(Character, Animations.ObservantStart, 1)
    SetRootPartAnchor(true)
	local StartConn
	StartConn = ObservantStart.Completed:Connect(function()
		if not ObservantActive then
			StartConn:Disconnect()
			Debounce = false
			return
		end
		local ObservantLoop = PlayAnim(Character, Animations.ObservantLoop, 1)
		SetRootPartAnchor(true)
		WarningPart = WarningPartTemplate:Clone()
		WarningPart.Parent = workspace
		WarningConnection = RunService.RenderStepped:Connect(function()
			if ObservantActive and Mouse.Hit then
				WarningPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 1.745, 0))
			end
		end)
		Debounce = false
		StartConn:Disconnect()
	end)
end

local ObservantTeleport = function()
	if not ObservantActive then return end
    if Debounce then return end
    Debounce = true
 	if WarningConnection then
		WarningConnection:Disconnect()
		WarningConnection = nil
	end
	if WarningPart then
		WarningPart:Destroy()
		WarningPart = nil
	end
	local ObservantTeleport = PlayAnim(Character, Animations.ObservantTeleport, 1)
    PlaySoundFromDisk("ObservantTeleport.mp3")
 	local ObservantEvent
	local MousePosition = Mouse.Hit.Position
	TeleportingPart = TeleportingPartTemplate:Clone()
	TeleportingPart.CFrame = CFrame.new(MousePosition + Vector3.new(0, 1.745, 0))
	TeleportingPart.Parent = workspace
	PlaySound(99944767357389)
	ObservantEvent = ObservantTeleport.KeyframeReached:Connect(function(Keyframe)
		if Keyframe == "Teleport" then
			if Mouse.Hit then
				RootPart.CFrame = CFrame.new(MousePosition + Vector3.new(0, 3, 0))
			end
			ObservantEvent:Disconnect()
		end
	end)
	ObservantTeleport.Completed:Wait()
	if TeleportingPart then
		TeleportingPart:Destroy()
		TeleportingPart = nil
	end
    ObservantActive = false
    Debounce = false
 	SetRootPartAnchor(false)
	RestoreMovement()	
end

local NovaShoot = function()
	if Debounce then return end
    if ObservantActive then return end
	Debounce = true
	local Damaged, Thrown  = false, false
	local Projectile, ProjectileVelocity, Touched
	local ThrowConnection
	local NovaShootAnimation = PlayAnim(Character, Animations.NovaThrow, 1)
    PlaySoundFromDisk("NovaThrow.mp3")
	ThrowConnection = NovaShootAnimation.KeyframeReached:Connect(function(Keyframe)
		if Keyframe == "Thrown" and not Thrown then
			Thrown = true
			Projectile = Voidstar:Clone()
			Projectile.Anchored = false
			Projectile.CanCollide = false
			Projectile.CFrame = CFrame.new(RootPart.Position + RootPart.CFrame.LookVector * 5, Mouse.Hit.Position)
			Projectile.Parent = workspace
			ProjectileVelocity = Instance.new("BodyVelocity")
			ProjectileVelocity.Velocity = (Mouse.Hit.Position - Projectile.Position).Unit * 100
			ProjectileVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			ProjectileVelocity.Parent = Projectile
			game:GetService("Debris"):AddItem(Projectile, 3)
			game:GetService("Debris"):AddItem(ProjectileVelocity, 3)
			Touched = Projectile.Touched:Connect(function(Hit)
				if Damaged then return end
				if Hit:IsDescendantOf(Character) then return end
                local Target = Hit:FindFirstAncestorOfClass("Model")
				if Hit == Projectile then return end
 				local HitHumanoid = Hit.Parent:FindFirstChildOfClass("Humanoid")
				if not HitHumanoid then return end
				Damaged = true
                FlashHitHighlight(Target)
				if Settings.Fling then
                Empyrean.Fling(Target, DefaultFlingOptions)
		        end
				if ProjectileVelocity then ProjectileVelocity:Destroy() end
				if Projectile then Projectile:Destroy() end
				if Touched then Touched:Disconnect() end
                PlaySoundFromDisk("NovaExplode.mp3")
			end)
		end
	end)
	NovaShootAnimation.Completed:Wait()
	if ThrowConnection and ThrowConnection.Connected then
		ThrowConnection:Disconnect()
	end
	if Touched and Touched.Connected then
		Touched:Disconnect()
	end
	local NovaStart = PlayAnim(Character, Animations.NovaStart, 1)
	NovaStart.Completed:Wait()
	Debounce = false
	RestoreMovement()
end

-- Keybinds
local KeyDown = UserInputService.InputBegan:Connect(function(Key, GPE)
	if GPE then return end
 	if Key.KeyCode == Enum.KeyCode.One then
		Stun()
	end
	if Key.KeyCode == Enum.KeyCode.Two then
		Intro()
	end
	if Key.KeyCode == Enum.KeyCode.Three then
		Outro()
	end
 	if Key.KeyCode == Enum.KeyCode.Q then
		Void_Rush()
	end
	if Key.KeyCode == Enum.KeyCode.E then
		NovaShoot()
	end
	if Key.KeyCode == Enum.KeyCode.R then
		Observant()
	end
	if Key.KeyCode == Enum.KeyCode.Z then
		Execute()
	end
	if Key.UserInputType == Enum.UserInputType.MouseButton1 then
		if ObservantActive then
			ObservantTeleport()
		elseif not Debounce then
			Stab()
		end
	end
	if Key.UserInputType == Enum.UserInputType.Touch then
 		if ObservantActive then
			ObservantTeleport()
		end
	end
	if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
		if Debounce then return end
		Shift = true
		local Tween = TweenService:Create(Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {FieldOfView = 90})	
		Tween:Play()
	end
end)

local KeyUp = UserInputService.InputEnded:Connect(function(Key)
	if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
		Shift = false
		local Tween = TweenService:Create(Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {FieldOfView = 80})
		Tween:Play()
	end
end)
  
-- ragdoll setup
local CreateConstraint = function(Motor)
	local Part0 = Motor.Part0
	local Part1 = Motor.Part1
	if not Part0 or not Part1 then return end
	local Attach0 = Instance.new("Attachment")
	local Attach1 = Instance.new("Attachment")
	Attach0.CFrame = Motor.C0
	Attach1.CFrame = Motor.C1
	Attach0.Parent = Part0
	Attach1.Parent = Part1
	local BallSocketConstraint = Instance.new("BallSocketConstraint")
	BallSocketConstraint.Attachment0 = Attach0
	BallSocketConstraint.Attachment1 = Attach1
	BallSocketConstraint.LimitsEnabled = true
	BallSocketConstraint.TwistLimitsEnabled = true
	BallSocketConstraint.Parent = Part0
	return {Motor = Motor, Attachment0 = Attach0, attachment1 = Attach1, Socket = BallSocketConstraint}
end

local EnableRagdoll = function()
	if #StoredMotors > 0 then return end
	Settings.Ragdoll = true
	Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	Humanoid.AutoRotate = false
	for i, v in pairs(Character:GetDescendants()) do
		if v:IsA("Motor6D") then
			local Data = CreateConstraint(v)
			if Data then
				table.insert(StoredMotors, Data)
				v.Enabled = false
			end
        elseif v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.CanCollide = true
		end
	end
end

local DisableRagdoll = function()
	if #StoredMotors == 0 then return end
	Settings.Ragdoll = false
	Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    RootPart.CFrame = RootPart.CFrame + Vector3.new(0, 5, 0)
	Humanoid.AutoRotate = true
    for i, v in pairs(Character:GetDescendants()) do
         if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.CanCollide = false
		end
	end
	for i, v in pairs(StoredMotors) do
		if v.Motor then
			v.Motor.Enabled = true
		end
		if v.BallSocketConstraint then
			v.BallSocketConstraint:Destroy()
		end
		if v.Attachment0 then
			v.Attachment0:Destroy()
		end
		if v.Attachment1 then
			v.Attachment1:Destroy()
		end
	end
	table.clear(StoredMotors)
end

-- mobile ui
local GUI = script:WaitForChild("UIs").MobileUI
GUI.Parent = game:GetService("CoreGui")

local UpdateUI = function()
	local LastInput = UserInputService:GetLastInputType()
	if LastInput == Enum.UserInputType.Touch
	then GUI.Enabled = true
	else GUI.Enabled = false
	end
end

UpdateUI()

GUI.AbilitiesUI["Stab"].MouseButton1Down:connect(function() Stab() end)
GUI.AbilitiesUI["Nova"].MouseButton1Down:connect(function() NovaShoot() end)
GUI.AbilitiesUI["Observant"].MouseButton1Down:connect(function() Observant() end)
GUI.AbilitiesUI["Void Rush"].MouseButton1Down:connect(function() Void_Rush() end)
GUI.AbilitiesUI["Sprint"].MouseButton1Down:connect(function() Shift = not Shift end)
GUI.AbilitiesUI["Intro"].MouseButton1Down:connect(function() Intro() end)
GUI.AbilitiesUI["Outro"].MouseButton1Down:connect(function() Outro() end)
GUI.AbilitiesUI["Execute"].MouseButton1Down:connect(function() Execute() end)
GUI.AbilitiesUI["Stun"].MouseButton1Down:connect(function() Stun() end)

UserInputService.LastInputTypeChanged:Connect(UpdateUI)

-- settings ui
local MainGUI = script.UIs:WaitForChild("MainGUI")
MainGUI.Parent = game:GetService("CoreGui")

local SettingsFrame = MainGUI:WaitForChild("SettingsFrame")
local SettingsHolder = SettingsFrame:WaitForChild("SettingsHolder")

local SetupToggle = function(Setting)
	local Object = SettingsHolder:FindFirstChild(Setting)
	if not Object then return end
	local Button = Object:FindFirstChildWhichIsA("TextButton")
	if not Button then return end
	Button.BackgroundColor3 = Settings[Setting] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
	Button.MouseButton1Click:Connect(function()
		Settings[Setting] = not Settings[Setting]
		Button.BackgroundColor3 = Settings[Setting] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
	end)
end

local SetupTextBox = function(Setting) -- currently only used in the rigsize (no other textboxes will exist i think)
	local Object = SettingsHolder:FindFirstChild(Setting)
	if not Object then return end
	local TextBox = Object:FindFirstChildWhichIsA("TextBox")
	if not TextBox then return end
	TextBox.Text = tostring(Settings[Setting])
	TextBox.FocusLost:Connect(function()
		local Value = tonumber(TextBox.Text)
		if Value then
			Settings[Setting] = math.clamp(Value, 0.5, 5)
		else
			TextBox.Text = tonumber(Settings[Setting])
		end
	end)
end

for i, v in pairs(Settings) do
	local Object = SettingsHolder:FindFirstChild(i)
	if Object then
		if Object:FindFirstChild("Button") then
			SetupToggle(i)
		elseif Object:FindFirstChild("Value") then
			SetupTextBox(i)
		end
	end
end

local FloatingButton = MainGUI:WaitForChild("FloatingButton")
FloatingButton.Draggable = true
FloatingButton.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = not SettingsFrame.Visible
end)

UserInputService.JumpRequest:Connect(function()
	if Settings.InfiniteJump and Humanoid then
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

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
		print("No spawn or a spawn is somehow (??? how tf) too far")
     	end
 end)

-- runservice connection
local RunServiceConnection = RunService.Heartbeat:Connect(function(dt)
	Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp((RootPart.CFrame * CFrame.new(0, 1.5, 0)):PointToObjectSpace(Head.Position), math.clamp(8 * 60 * 60, 0, 1))
 	if Settings.Music then
		Theme.Playing = true
	else
		Theme.Playing = false
	end
	if Settings.Ragdoll ~= LastRagdoll then
		LastRagdoll = Settings.Ragdoll
		if Settings.Ragdoll then
			EnableRagdoll()
		else
			DisableRagdoll()
		end
	end
	if Settings.Spin and Character.PrimaryPart then
		Character:SetPrimaryPartCFrame(Character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
	end
	if Settings.Ragdoll then return end
	if Debounce then
		StopAnim(Character,Animations.Idle)
		StopAnim(Character,Animations.Walk)
		StopAnim(Character,Animations.Sprint)
	end
	if not Debounce then
		if Shift then
			SetWalkSpeed(24)
		else
			SetWalkSpeed(15)
		end
	end
	local HitFloor, HitPosition = workspace:FindPartOnRay(Ray.new(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(0, -1, 0))).LookVector * 4), Character)
	local TorsoVelocity = (RootPart.Velocity).Magnitude
	local TorsoVerticalVelocity = RootPart.Velocity.Y
	if TorsoVelocity < 1 and HitFloor ~= nil and Debounce == false then
		if Idle == false then
			Idle = true
			PlayAnim(Character,Animations.Idle, 1)
		end
		Walking = false
		Running = false
		StopAnim(Character,Animations.Sprint)
		StopAnim(Character,Animations.Walk)
	elseif TorsoVelocity > 1 and HitFloor ~= nil and Debounce == false and Shift == true then
		if Running == false then
			Running = true
			PlayAnim(Character,Animations.Sprint, 1)
		end
		Idle = false
		Walking = false
		StopAnim(Character,Animations.Walk)
		StopAnim(Character,Animations.Idle)
	elseif TorsoVelocity > 1 and HitFloor ~= nil and Debounce == false then
		if Walking == false then
			Walking = true
			PlayAnim(Character, Animations.Walk, 1)
		end
		Idle = false
		Running = false
		StopAnim(Character,Animations.Sprint)
		StopAnim(Character,Animations.Idle)
	end
end)

Empyrean.BindableEvent.Event:Once(function()
    print("Resetting.")
    for i, v in TrashBin do
        v:Destroy()
    end
	GUI:Destroy()
	MainGUI:Destroy()
	RunServiceConnection:Disconnect()
	KeyDown:Disconnect()
	KeyUp:Disconnect()
end)

local LoaderUI = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/adc8fbb119234b04744907ff26a407f8/raw/6d501829e2d6f376f57ed3777b4915ad609981cf/IntroAndDetector.luau"))()
