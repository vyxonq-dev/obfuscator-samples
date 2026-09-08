if getgenv().hasExecuted then getgenv().onExecuted() return end

getgenv().hasExecuted = true

-- Services:

local replicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local players = game:GetService("Players")
local insertService = game:GetService("InsertService")
local marketplaceService = game:GetService("MarketplaceService")
local teleportService = game:GetService("TeleportService")
local coreGui = gethui and gethui() or game:GetService("CoreGui")

-- Modules:

local orUtils = require(replicatedStorage.Utils.ORUtils)
local difficulties = require(replicatedStorage.Info.Difficulties)
local mainUIController = require(players.LocalPlayer.PlayerGui.MainUI.MainUIController)
local practiceController = require(players.LocalPlayer.PlayerGui.MainUI.MainUIController.PracticeController)

-- Variables: 

local DEFAULT_GRAVITY = workspace.Gravity
local GAME_Y = 222.69964599609375
local PRACTICE_Y = 252.12367248535156

local reGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

local localPlayer = players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local currentCamera = workspace.CurrentCamera
local guiInset = guiService:GetGuiInset()
local placeId = game.PlaceId
local jobId = game.JobId
local placeName = marketplaceService:GetProductInfo(placeId).Name
local rng = Random.new()

local PracticeUI = playerGui.MainUI.PracticeUI

local cursors = {
	arrowFarCursor = {
		icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png",
		size = UDim2.fromOffset(64, 64),
		offset = Vector2.new(-32, 4),
	},
	mouseLockedCursor = {
		icon = "rbxasset://textures/MouseLockedCursor.png",
		size = UDim2.fromOffset(32, 32),
		offset = Vector2.new(-16, 20),
	},
}

local util = {

}

local tas = {
	animationController = {
		_disabled = false,
		_animationQueue = {},
		_pose = nil, 
		_currentAnimationSpeed = 0.1,
		_dead = false,
		_originalWalkSpeed = nil,
		_originalJumpPower = nil,
	},

	cameraController = {
		_zoomControllers = {},	
		_cameraCFrame = currentCamera.CFrame,
	},

	inputController = {
		_cursor = nil,
		_cursorHolder = nil,
		_cursorFrame = nil,
		_resolution = nil,
		_shiftlockState = false,
		_mouseLockController = nil,
		_controls = nil,
	},

	core = {
		_isReplaying = false,
		_isRecording = false,
		_onStartRecording = nil,
		_onStopRecording = nil,
		_isUsingAllReplay = false,
		_recordingFrames = {},
		_isFrozen = false,
		_freezeFrame = 1,
		_seekDirection = 0,
		_goBackKey = nil,
		_goForwardKey = nil,
	},
}

local obbyRoyale = {
	autoPlayController = {
		_isAutoPlayEnabled = false,
		_isAutoPlaying = false,
	},

	tasController = {
		_stages = {},
		_oldCloseUI = nil,
		_oldOpenUI = nil,
		_oldPopulateStages = nil,
		_practiceENV = nil,
		_isSelectingStage = false,
		_isTASSING = false,
		_isPracticeUIHooked = false,
		_loadedStage = nil,
	},

	core = {
		_isServerhopping = false,
		_isRejoining = false,
		_isJoiningPro = false,
		_isResetDisabled = false,
		_unlockedPracticeStages = false,
	},
}

local interface = {
	_window = nil,
	_tabs = {},
	_regions = {},
	_createPopup = Instance.new("BindableEvent"),
}

-- Methods:

do -- util:
	function util:getHumanoid()
		local character = localPlayer.Character 
		if not character then return end 

		return character:FindFirstChildOfClass("Humanoid")
	end

	function util:getRootPart()
		local character = localPlayer.Character 
		if not character then return end 

		return character:FindFirstChild("HumanoidRootPart")
	end

	function util:roundNumber(number, digits)
		local multi = 10 ^ math.max(tonumber(digits) or 0, 0)

		return math.floor(number * multi + 0.5) / multi
	end

	function util:roundTable(tbl, digits)
		local roundedTable = {}

		for i, number in tbl do
			roundedTable[i] = self:roundNumber(number, digits)
		end

		return roundedTable
	end

	function util:vector3ToTable(vector3)
		return {vector3.X, vector3.Y, vector3.Z}
	end

	function util:tableToVector3(tbl)
		return Vector3.new(table.unpack(tbl))
	end

	function util:vector2ToTable(vector2)
		return {vector2.X, vector2.Y}
	end

	function util:tableToVector2(tbl)
		return Vector2.new(table.unpack(tbl))
	end

	function util:cframeToTable(cframe)
		return {cframe:GetComponents()}
	end

	function util:tableToCFrame(tbl)
		return CFrame.new(table.unpack(tbl))
	end
end

do -- tas:
	do -- animationController:
		function tas.animationController:stopAllAnimations()
			local humanoid = util:getHumanoid()
			if not humanoid then return end 

			for _, animationTrack in humanoid:GetPlayingAnimationTracks() do 
				animationTrack:Stop()
			end
		end

		function tas.animationController:isDead()
			return self._dead
		end

		function tas.animationController:getOriginalJumpPower()
			return self._originalJumpPower
		end

		function tas.animationController:getOriginalWalkSpeed()
			return self._originalWalkSpeed
		end

		function tas.animationController:setDisabled(state)
			self._disabled = state
		end

		function tas.animationController:setPose(pose)
			self._pose = pose
		end

		function tas.animationController:getPose()
			return self._pose
		end

		function tas.animationController:getAnimationQueue()
			return self._animationQueue
		end

		function tas.animationController:getAnimationSpeed()
			return self._currentAnimationSpeed
		end

		function tas.animationController:reAnimate()
			local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

			for _, obj in character:GetDescendants() do
				if not obj:IsA("LocalScript") or obj.Name ~= "Animate" then continue end

				obj:Destroy()
			end 

			self:stopAllAnimations()

			do -- Animate.lua
				local Torso = character:WaitForChild("Torso")
				local RightShoulder = Torso:WaitForChild("Right Shoulder")
				local LeftShoulder = Torso:WaitForChild("Left Shoulder")
				local RightHip = Torso:WaitForChild("Right Hip")
				local LeftHip = Torso:WaitForChild("Left Hip")
				local Humanoid = character:WaitForChild("Humanoid")

				local currentAnim = ""
				local currentAnimInstance = nil
				local currentAnimTrack = nil
				local currentAnimKeyframeHandler = nil

				local animTable = {}
				local animNames = { 
					idle = 	{	
						{ id = "http://www.roblox.com/asset/?id=180435571", weight = 8 },
						{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
					},
					walk = 	{ 	
						{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
					}, 
					run = 	{
						{ id = "run.xml", weight = 10 } 
					}, 
					jump = 	{
						{ id = "http://www.roblox.com/asset/?id=125750702", weight = 12 } 
					}, 
					fall = 	{
						{ id = "http://www.roblox.com/asset/?id=180436148", weight = 9 } 
					}, 
					climb = {
						{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
					}, 
					sit = 	{
						{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
					},	
					toolnone = {
						{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
					},
					toolslash = {
						{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
						--				{ id = "slash.xml", weight = 10 } 
					},
					toollunge = {
						{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
					},
					wave = {
						{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
					},
					point = {
						{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
					},
					dance1 = {
						{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
						{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
						{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
					},
					dance2 = {
						{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
						{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
						{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
					},
					dance3 = {
						{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
						{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
						{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
					},
					laugh = {
						{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
					},
					cheer = {
						{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
					},
				}
				local dances = {"dance1", "dance2", "dance3"}

				-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
				local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

				function configureAnimationSet(name, fileList)
					if (animTable[name] ~= nil) then
						for _, connection in pairs(animTable[name].connections) do
							connection:disconnect()
						end
					end
					animTable[name] = {}
					animTable[name].count = 0
					animTable[name].totalWeight = 0	
					animTable[name].connections = {}

					-- check for config values

					-- fallback to defaults
					if (animTable[name].count <= 0) then
						for idx, anim in pairs(fileList) do
							animTable[name][idx] = {}
							animTable[name][idx].anim = Instance.new("Animation")
							animTable[name][idx].anim.Name = name
							animTable[name][idx].anim.AnimationId = anim.id
							animTable[name][idx].weight = anim.weight
							animTable[name].count = animTable[name].count + 1
							animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
							--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
						end
					end
				end

				-- Setup animation objects

				-- Clear any existing animation tracks
				-- Fixes issue with characters that are moved in and out of the Workspace accumulating tracks
				local animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator") or nil
				if animator then
					local animTracks = animator:GetPlayingAnimationTracks()
					for i,track in ipairs(animTracks) do
						track:Stop(0)
						track:Destroy()
					end
				end


				for name, fileList in pairs(animNames) do 
					configureAnimationSet(name, fileList)
				end	

				-- ANIMATION

				-- declarations
				local toolAnim = "None"
				local toolAnimTime = 0

				local jumpAnimTime = 0
				local jumpAnimDuration = 0.3

				local toolTransitionTime = 0.1
				local fallTransitionTime = 0.3
				local jumpMaxLimbVelocity = 0.75

				-- functions

				function stopAllAnimations()
					local oldAnim = currentAnim

					-- return to idle if finishing an emote
					if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
						oldAnim = "idle"
					end

					currentAnim = ""
					currentAnimInstance = nil
					if (currentAnimKeyframeHandler ~= nil) then
						currentAnimKeyframeHandler:disconnect()
					end

					if (currentAnimTrack ~= nil) then
						currentAnimTrack:Stop()
						currentAnimTrack:Destroy()
						currentAnimTrack = nil
					end
					return oldAnim
				end

				function tas.animationController:setAnimationSpeed(speed)
					if speed ~= self._currentAnimationSpeed then
						self._currentAnimationSpeed = speed
						currentAnimTrack:AdjustSpeed(self._currentAnimationSpeed)
					end
				end

				function keyFrameReachedFunc(frameName)
					if (frameName == "End") then

						local repeatAnim = currentAnim
						-- return to idle if finishing an emote
						if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
							repeatAnim = "idle"
						end

						local animSpeed = self._currentAnimationSpeed
						self:playAnimation(repeatAnim, 0.0)
						self:setAnimationSpeed(animSpeed)
					end
				end

				function tas.animationController:playAnimation(animName, transitionTime, bypassAnimateDisabled)
					pcall(function()
						if self._disabled and not bypassAnimateDisabled then
							return
						end

						if tas.core:isRecording() then
							table.insert(self._animationQueue, { animName, transitionTime })
						end

						local humanoid = util:getHumanoid()
						if not humanoid then return end

						local roll = math.random(1, animTable[animName].totalWeight)
						local origRoll = roll
						local idx = 1

						while (roll > animTable[animName][idx].weight) do
							roll = roll - animTable[animName][idx].weight
							idx = idx + 1
						end

						--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
						local anim = animTable[animName][idx].anim

						-- switch animation		
						if (anim ~= currentAnimInstance) then
							if (currentAnimTrack ~= nil) then
								currentAnimTrack:Stop(transitionTime)
								currentAnimTrack:Destroy()
							end

							self._currentAnimationSpeed = 1.0

							-- load it to the humanoid, get AnimationTrack
							currentAnimTrack = humanoid:LoadAnimation(anim)
							currentAnimTrack.Priority = Enum.AnimationPriority.Core

							-- play the animation
							currentAnimTrack:Play(transitionTime)
							currentAnim = animName
							currentAnimInstance = anim

							-- set up keyframe name triggers
							if (currentAnimKeyframeHandler ~= nil) then
								currentAnimKeyframeHandler:disconnect()
							end
							currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)
						end
					end)
				end

				-------------------------------------------------------------------------------------------
				-------------------------------------------------------------------------------------------

				local toolAnimName = ""
				local toolAnimTrack = nil
				local toolAnimInstance = nil
				local currentToolAnimKeyframeHandler = nil

				function toolKeyFrameReachedFunc(frameName)
					if (frameName == "End") then
						--		print("Keyframe : ".. frameName)	
						playToolAnimation(toolAnimName, 0.0, Humanoid)
					end
				end


				function playToolAnimation(animName, transitionTime, humanoid, priority)	 

					local roll = math.random(1, animTable[animName].totalWeight) 
					local origRoll = roll
					local idx = 1
					while (roll > animTable[animName][idx].weight) do
						roll = roll - animTable[animName][idx].weight
						idx = idx + 1
					end
					--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
					local anim = animTable[animName][idx].anim

					if (toolAnimInstance ~= anim) then

						if (toolAnimTrack ~= nil) then
							toolAnimTrack:Stop()
							toolAnimTrack:Destroy()
							transitionTime = 0
						end

						-- load it to the humanoid, get AnimationTrack
						toolAnimTrack = humanoid:LoadAnimation(anim)
						if priority then
							toolAnimTrack.Priority = priority
						end

						-- play the animation
						toolAnimTrack:Play(transitionTime)
						toolAnimName = animName
						toolAnimInstance = anim

						currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
					end
				end

				function stopToolAnimations()
					local oldAnim = toolAnimName

					if (currentToolAnimKeyframeHandler ~= nil) then
						currentToolAnimKeyframeHandler:disconnect()
					end

					toolAnimName = ""
					toolAnimInstance = nil
					if (toolAnimTrack ~= nil) then
						toolAnimTrack:Stop()
						toolAnimTrack:Destroy()
						toolAnimTrack = nil
					end


					return oldAnim
				end

				-------------------------------------------------------------------------------------------
				------------------------------------------------------------------------------------------- 

				function tas.animationController:onRunning(speed) 
					if speed > 0.01 then
						self:playAnimation("walk", 0.1)
						if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
							self:setAnimationSpeed(speed / 14.5)
						end
						self._pose = "Running"
					else
						if emoteNames[currentAnim] == nil then
							self:playAnimation("idle", 0.1)
							self._pose = "Standing"
						end
					end
				end

				function tas.animationController:onDied()
					self._pose = "Dead"
				end

				function tas.animationController:onJumping()
					self:playAnimation("jump", 0.1)
					jumpAnimTime = jumpAnimDuration
					self._pose = "Jumping"
				end

				function tas.animationController:onClimbing(speed) 
					self:playAnimation("climb", 0.1)
					self:setAnimationSpeed(speed / 12.0)
					self._pose = "Climbing"
				end

				function tas.animationController:onGettingUp()
					self._pose = "GettingUp"
				end

				function tas.animationController:onFreeFall()
					if (jumpAnimTime <= 0) then
						self:playAnimation("fall", fallTransitionTime)
					end
					self._pose = "FreeFall"
				end

				function tas.animationController:onFallingDown()
					self._pose = "FallingDown"
				end

				function tas.animationController:onSeated()
					self._pose = "Seated"
				end

				function tas.animationController:onPlatformStanding()
					self._pose = "PlatformStanding"
				end

				function tas.animationController:onSwimming(speed)
					if speed > 0 then
						self._pose = "Running"
					else
						self._pose = "Standing"
					end
				end

				function getTool()	
					for _, kid in ipairs(character:GetChildren()) do
						if kid.className == "Tool" then return kid end
					end
					return nil
				end

				function getToolAnim(tool)
					for _, c in ipairs(tool:GetChildren()) do
						if c.Name == "toolanim" and c.className == "StringValue" then
							return c
						end
					end
					return nil
				end

				function animateTool()

					if (toolAnim == "None") then
						playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
						return
					end

					if (toolAnim == "Slash") then
						playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
						return
					end

					if (toolAnim == "Lunge") then
						playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
						return
					end
				end

				function moveSit()
					RightShoulder.MaxVelocity = 0.15
					LeftShoulder.MaxVelocity = 0.15
					RightShoulder:SetDesiredAngle(3.14 /2)
					LeftShoulder:SetDesiredAngle(-3.14 /2)
					RightHip:SetDesiredAngle(3.14 /2)
					LeftHip:SetDesiredAngle(-3.14 /2)
				end

				local lastTick = 0

				function move(time)
					if self._disabled then
						return
					end

					local amplitude = 1
					local frequency = 1
					local deltaTime = time - lastTick
					lastTick = time

					local climbFudge = 0
					local setAngles = false

					if (jumpAnimTime > 0) then
						jumpAnimTime = jumpAnimTime - deltaTime
					end

					if (self._pose == "FreeFall" and jumpAnimTime <= 0) then
						self:playAnimation("fall", fallTransitionTime)
					elseif (self._pose == "Seated") then
						self:playAnimation("sit", 0.5)
						return
					elseif (self._pose == "Running") then
						self:playAnimation("walk", 0.1)
					elseif (self._pose == "Dead" or self._pose == "GettingUp" or self._pose == "FallingDown" or self._pose == "Seated" or self._pose == "PlatformStanding") then
						--		print("Wha " .. pose)
						stopAllAnimations()
						amplitude = 0.1
						frequency = 1
						setAngles = true
					end

					if (setAngles) then
						local desiredAngle = amplitude * math.sin(time * frequency)

						RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
						LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
						RightHip:SetDesiredAngle(-desiredAngle)
						LeftHip:SetDesiredAngle(-desiredAngle)
					end

					-- Tool Animation handling
					local tool = getTool()
					if tool and tool:FindFirstChild("Handle") then

						local animStringValueObject = getToolAnim(tool)

						if animStringValueObject then
							toolAnim = animStringValueObject.Value
							-- message recieved, delete StringValue
							animStringValueObject.Parent = nil
							toolAnimTime = time + .3
						end

						if time > toolAnimTime then
							toolAnimTime = 0
							toolAnim = "None"
						end

						animateTool()		
					else
						stopToolAnimations()
						toolAnim = "None"
						toolAnimInstance = nil
						toolAnimTime = 0
					end
				end

				Humanoid.Died:connect(function(...)
					if self._disabled then
						return
					end

					self:onDied(...)
				end)

				Humanoid.Running:connect(function(Speed)
					if self._disabled then
						return
					end

					self:onRunning(Speed)
				end)
				Humanoid.Jumping:connect(function(...)
					if self._disabled then
						return
					end

					self:onJumping(...)
				end)
				Humanoid.Climbing:connect(function(Speed)
					if self._disabled then
						return
					end

					self:onClimbing(Speed)
				end)
				Humanoid.GettingUp:connect(function(...)
					if self._disabled then
						return
					end

					self:onGettingUp(...)
				end)
				Humanoid.FreeFalling:connect(function(...)
					if self._disabled then
						return
					end

					self:onFreeFall(...)
				end)
				Humanoid.FallingDown:connect(function(...)
					if self._disabled then
						return
					end
					--table.insert(AnimationQueue,7)
					self:onFallingDown(...)
				end)
				Humanoid.Seated:connect(function(...)
					if self._disabled then
						return
					end

					self:onSeated(...)
				end)
				Humanoid.PlatformStanding:connect(function(...)
					if self._disabled then
						return
					end

					self:onPlatformStanding(...)
				end)
				Humanoid.Swimming:connect(function(...)
					if self._disabled then
						return
					end

					self:onSwimming(...)
				end)

				game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
					local emote = ""
					if msg == "/e dance" then
						emote = dances[math.random(1, #dances)]
					elseif (string.sub(msg, 1, 3) == "/e ") then
						emote = string.sub(msg, 4)
					elseif (string.sub(msg, 1, 7) == "/emote ") then
						emote = string.sub(msg, 8)
					end

					if (self._pose == "Standing" and emoteNames[emote] ~= nil) then
						self:playAnimation(emote, 0.1)
					end

				end)

				self:playAnimation("idle", 0.1)
				self._pose = "Standing"

				spawn(function()
					while character.Parent ~= nil do
						local _, time = wait(0.1)
						move(time)
					end
				end)
			end
		end

		function tas.animationController:characterAdded(character)
			local humanoid = character:WaitForChild("Humanoid")

			self._originalJumpPower = humanoid.JumpPower
			self._originalWalkSpeed = humanoid.WalkSpeed

			self:reAnimate()

			humanoid.Died:Connect(function()
				self._dead = true
			end)

			self._dead = false
		end

		function tas.animationController:init()
			if localPlayer.Character then self:characterAdded(localPlayer.Character) end 

			localPlayer.CharacterAdded:Connect(function(character) self:characterAdded(character) end)
		end
	end

	do  -- cameraController:
		function tas.cameraController:setZoom(zoom)
			for _, zoomController in self._zoomControllers do
				pcall(function()
					zoomController:SetCameraToSubjectDistance(zoom)
				end)
			end
		end

		function tas.cameraController:getZoom()
			for _, zoomController in self._zoomControllers do
				local zoom = zoomController:GetCameraToSubjectDistance()

				if zoom and zoom ~= 12.5 then
					return zoom
				end
			end

			return 12.5
		end

		function tas.cameraController:setCFrame(cframe)
			self._cameraCFrame = cframe

			currentCamera.CFrame = cframe
		end

		function tas.cameraController:init()
			for _, obj in getgc(true) do
				if typeof(obj) == "table" and rawget(obj, "FIRST_PERSON_DISTANCE_THRESHOLD") then
					table.insert(self._zoomControllers, obj)
				end
			end

			currentCamera.Changed:Connect(function()
				if not tas.core:isReplaying() or not tas.core:isUsingAllReplay() then return end

				currentCamera.CFrame = self._cameraCFrame
			end)
		end
	end

	do -- inputController: 
		function tas.inputController:createCursor()
			local cursorHolder = Instance.new("ScreenGui")
			cursorHolder.DisplayOrder = 999
			cursorHolder.OnTopOfCoreBlur = true
			cursorHolder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			cursorHolder.Parent = coreGui

			self._resolution = cursorHolder.AbsoluteSize

			self._cursorHolder = cursorHolder

			local cursorFrame = Instance.new("ImageLabel")
			cursorFrame.BackgroundTransparency = 1
			cursorFrame.ZIndex = 999
			cursorFrame.Parent = cursorHolder

			self._cursorFrame = cursorFrame
		end

		function tas.inputController:setCursor(cursorName)
			self._cursor = cursors[cursorName]
		end

		function tas.inputController:getCursor()
			return self._cursor
		end

		function tas.inputController:getResolution()
			return self._resolution
		end

		function tas.inputController:disableControls()
			self._controls:Disable()
		end

		function tas.inputController:enableControls()
			self._controls:Enable()
		end

		function tas.inputController:getShiftLockState()
			return self._shiftlockState
		end

		function tas.inputController:toggleShiftLock(state)
			state = if state == nil then not self._shiftlockState else state

			if self._shiftlockState == state then return end 

			self._shiftlockState = state 

			if state then 
				self:setCursor("mouseLockedCursor")
			else 
				self:setCursor("arrowFarCursor")
			end

			self._mouseLockController:DoMouseLockSwitch("MouseLockSwitchAction", Enum.UserInputState.Begin, game)
		end

		function tas.inputController:init()
			self:createCursor()

			self:setCursor("arrowFarCursor")

			userInputService.MouseIconEnabled = false
			localPlayer:FindFirstChild("BoundKeys", true).Value = ""

			for _, obj in getgc(true) do 
				if typeof(obj) == "table" and rawget(obj, "activeMouseLockController") then 
					self._mouseLockController = obj.activeMouseLockController
					break
				end
			end

			for _, obj in getgc(true) do 
				if type(obj) == "table" and rawget(obj, "controls") then 
					self._controls = obj.controls
					break
				end
			end

			userInputService.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed or tas.core:isReplaying() then return end 

				if input.KeyCode == Enum.KeyCode.LeftShift then 
					self:toggleShiftLock()
				elseif input.KeyCode == tas.core:getFowardKeybind() then 
					tas.core:freeze(true) 

					if tas.core:getSeekDirection() == 0 then
						tas.core:setSeekDirection(1)
					end
				elseif input.KeyCode == tas.core:getBackKeybind() then 
					tas.core:freeze(true) 

					if tas.core:getSeekDirection() == 0 then
						tas.core:setSeekDirection(-1)
					end
				end
			end)

			userInputService.InputEnded:Connect(function(input, gameProcessed)
				if gameProcessed or tas.core:isReplaying() then return end 

				if input.KeyCode == tas.core:getFowardKeybind() then 
					if tas.core:getSeekDirection() == 1 then
						tas.core:setSeekDirection(0)
					end
				elseif input.KeyCode == tas.core:getBackKeybind() then 
					if tas.core:getSeekDirection() == -1 then 
						tas.core:setSeekDirection(0)
					end
				end
			end)       

			runService.RenderStepped:Connect(function()
				if not tas.core:isFrozen() then return end 

				local freezeFrame = tas.core:getFreezeFrame() + tas.core:getSeekDirection()
				local recordingFrames = tas.core:getRecordingFrames() 

				tas.core:setFreezeFrame(freezeFrame < 1 and 1 or freezeFrame > #recordingFrames and #recordingFrames or freezeFrame)
			end)

			task.spawn(function()
				while true do
					self._cursorFrame.Image = self._cursor.icon
					self._cursorFrame.Size = self._cursor.size

					local mousePosition = userInputService:GetMouseLocation()

					if userInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
						self._cursorFrame.Position = UDim2.fromOffset(
							(self._resolution.X / 2) + self._cursor.offset.X - guiInset.X,
							(self._resolution.Y / 2) + self._cursor.offset.Y - guiInset.Y - 18)
					else
						self._cursorFrame.Position = UDim2.fromOffset(mousePosition.X + self._cursor.offset.X - guiInset.X,
							mousePosition.Y + self._cursor.offset.Y - guiInset.Y - 36)
					end

					runService.RenderStepped:Wait()
				end
			end)
		end
	end

	do -- core: 
		function tas.core:setForwardKeybind(key)
			self._goForwardKey = key
		end

		function tas.core:getFowardKeybind()
			return self._goForwardKey
		end

		function tas.core:setBackKeybind(key)
			self._goBackKey = key
		end

		function tas.core:getBackKeybind()
			return self._goBackKey
		end

		function tas.core:saveToFile(fileName)
			if #self._recordingFrames == 0 then return end

			local success, encoded = pcall(function()
				return httpService:JSONEncode(self._recordingFrames) 
			end)

			if success then 
				writefile(`TAS Files/{fileName}.json`, encoded)
			end
		end

		function tas.core:getFile(fileName)
			if not isfolder("TAS Files") then 
				makefolder("TAS Files")
			end

			if not isfile(`TAS Files/{fileName}.json`) then return end

			local success, decoded = pcall(function()
				return httpService:JSONDecode(readfile(`TAS Files/{fileName}.json`))
			end)

			if success then 
				return decoded
			end
		end

		function tas.core:syncTASFiles()
			if not request then 
				return interface:sendConsoleMessage("Your executor doesnt support requests!")
			end

			interface:sendConsoleMessage("Checking TAS files...")

			if not isfolder("TAS Files") then 
				makefolder("TAS Files")
			end

			local result = request({
				Url = "https://api.github.com/repos/rxd977/Scripts/contents/Assets/ObbyRoyale",
				Method = "GET"
			})

			local success, files = pcall(function()
				return httpService:JSONDecode(result.Body)
			end)

			if not success or not files then
				return interface:sendConsoleMessage("Failed to fetch TAS file list!")
			end

			local downloadCount = 0

			for _, file in files do
				if file.type ~= "file" or not file.name:match("%.json$") then continue end

				local fileName = file.name:gsub("%.json$", "")
				local filePath = `TAS Files/{file.name}`

				if not isfile(filePath) then
					interface:sendConsoleMessage(`Downloading {file.name}...`)

					local downloadResult = request({
						Url = file.download_url,
						Method = "GET"
					})

					if downloadResult.StatusCode == 200 then
						writefile(filePath, downloadResult.Body)
						downloadCount = downloadCount + 1
						interface:sendConsoleMessage(`Downloaded {file.name}`)
					else
						interface:sendConsoleMessage(`Failed to download {file.name}`)
					end
				end
			end

			if downloadCount > 0 then
				interface:sendConsoleMessage(`Finished! Downloaded {downloadCount} file(s)`)
			else
				interface:sendConsoleMessage("All TAS files up to date!")
			end
		end

		function tas.core:isUsingAllReplay()
			return self._isUsingAllReplay
		end

		function tas.core:setSeekDirection(seekDirection)
			self._seekDirection = seekDirection
		end

		function tas.core:getSeekDirection()
			return self._seekDirection
		end

		function tas.core:setFreezeFrame(freezeFrame)
			self._freezeFrame = freezeFrame
		end

		function tas.core:getFreezeFrame()
			return self._freezeFrame
		end

		function tas.core:isFrozen()
			return self._isFrozen
		end

		function tas.core:getRecordingFrames()
			return self._recordingFrames
		end

		function tas.core:isReplaying()
			return self._isReplaying
		end

		function tas.core:isRecording()
			return self._isRecording
		end

		function tas.core:startRecording()
			if self._isRecording or self._isReplaying or self._isFrozen then return end		

			self._isRecording = true 
			self._recordingFrames = {}

			if setfpscap then setfpscap(60) end

			tas.inputController:enableControls()

			task.spawn(function()
				while self._isRecording do 
					if self._isFrozen then runService.RenderStepped:Wait() continue end

					local humanoid = util:getHumanoid()
					if not humanoid then runService.RenderStepped:Wait() continue end 

					local rootPart = util:getRootPart()
					if not rootPart then runService.RenderStepped:Wait() continue end 

					interface:setStatus("Recording")

					local frame = {}

					frame._rootPartCFrame = util:roundTable(util:cframeToTable(rootPart.CFrame), 3)
					frame._rootPartVelocity = util:roundTable(util:vector3ToTable(rootPart.Velocity), 3)
					frame._rootPartRotVelocity = util:roundTable(util:vector3ToTable(rootPart.RotVelocity), 3)
					frame._cameraCFrame = util:roundTable(util:cframeToTable(currentCamera.CFrame), 3)
					frame._zoom = util:roundNumber(tas.cameraController:getZoom(), 3)
					frame._humanoidState = humanoid:GetState().Value
					frame._pose = tas.animationController:getPose()
					frame._animationQueue = tas.animationController:getAnimationQueue()
					frame._animationSpeed = util:roundNumber(tas.animationController:getAnimationSpeed(), 3)
					frame._shiftlockState = tas.inputController:getShiftLockState()
					frame._mousePosition = util:roundTable(util:vector2ToTable(userInputService:GetMouseLocation()), 3)

					table.insert(self._recordingFrames, frame)

					tas.animationController._animationQueue = {}

					runService.RenderStepped:Wait()
				end
			end)
		end

		function tas.core:stopRecording()
			if not self._isRecording or self._isReplaying then return end 

			interface:setStatus("Not Recording")

			self._isRecording = false
			tas.animationController._animationQueue = {}
		end

		function tas.core:startReplaying(frames, useAll)
			if self._isReplaying or self._isRecording then return end 

			setthreadidentity(8)

			self._isReplaying = true
			self._isUsingAllReplay = useAll

			interface:setStatus("Replaying")

			frames = frames or self._recordingFrames

			tas.animationController:setDisabled(true) 
			tas.inputController:disableControls()

			workspace.Gravity = 0 

			local frameIndex = 1

			task.spawn(function()
				while self._isReplaying do 
					local humanoid = util:getHumanoid()
					if not humanoid then runService.Heartbeat:Wait() continue end 

					local rootPart = util:getRootPart()
					if not rootPart then runService.Heartbeat:Wait() continue end 

					local frame = frames[frameIndex]
					if not frame then runService.Heartbeat:Wait() self:stopReplaying() continue end


					tas.animationController:setDisabled(true) 

					workspace.Gravity = 0 

					humanoid.WalkSpeed = 0 
					humanoid.JumpPower = 0 

					if useAll then
						tas.cameraController:setCFrame(util:tableToCFrame(frame._cameraCFrame))
						tas.cameraController:setZoom(frame._zoom)
					end

					humanoid:ChangeState(frame._humanoidState)

					tas.animationController:setPose(frame._pose)

					for _, animation in frame._animationQueue do 
						local animationName = animation[1]
						local animationTime = animation[2]

						if animationName == "walk" then
							if humanoid.FloorMaterial ~= Enum.Material.Air and frame._humanoidState ~= 3 then
								tas.animationController:playAnimation("walk", animationTime, true) 
							end
						else
							tas.animationController:playAnimation(animationName, animationTime, true) 
						end
					end

					pcall(function() tas.animationController:setAnimationSpeed(frame._animationSpeed) end)

					if useAll then
						tas.inputController:toggleShiftLock(frame._shiftlockState)

						local resolution = tas.inputController:getResolution()
						local cursor = tas.inputController:getCursor()

						if not frame._shiftlockState and frame._zoom > 0.52 then
							mousemoveabs(frame._mousePosition[1], frame._mousePosition[2])
						else
							mousemoveabs((resolution.X / 2) + cursor.offset.X - guiInset.X,
								(resolution.Y / 2) + cursor.offset.Y - guiInset.Y - 36)
						end
					end

					rootPart.CFrame = util:tableToCFrame(frame._rootPartCFrame)

					frameIndex = frameIndex + 1

					runService.Heartbeat:Wait()
				end
			end)

			task.spawn(function()
				while self._isReplaying do 
					local character = localPlayer.Character 
					if not character then runService.Stepped:Wait() continue end

					local rootPart = character:FindFirstChild("HumanoidRootPart")
					if not rootPart then runService.Stepped:Wait() continue end 

					if workspace.Gravity ~= DEFAULT_GRAVITY then 
						for _, obj in character:GetChildren() do
							if not obj:IsA("BasePart") then continue end

							obj.CanCollide = false
						end
					end

					local frame = frames[frameIndex]
					if not frame then runService.Stepped:Wait() continue end 

					rootPart.CFrame =  util:tableToCFrame(frame._rootPartCFrame)

					runService.Stepped:Wait()
				end
			end)
		end

		function tas.core:stopReplaying()
			if not self._isReplaying or self._isRecording then return end

			local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			local rootPart = character:WaitForChild("HumanoidRootPart")

			interface:setStatus("Not Recording")

			self._isReplaying = false
			self._isUsingAllReplay = false

			rootPart.AssemblyLinearVelocity = Vector3.zero 
			rootPart.AssemblyAngularVelocity = Vector3.zero

			tas.inputController:enableControls()
			tas.animationController:setDisabled(false)

			character.Head.CanCollide = true 
			character.Torso.CanCollide = true 
			character.HumanoidRootPart.CanCollide = true 
			character.Humanoid.JumpPower = tas.animationController:getOriginalJumpPower()
			character.Humanoid.WalkSpeed = tas.animationController:getOriginalWalkSpeed()

			workspace.Gravity = DEFAULT_GRAVITY

			tas.animationController:playAnimation("idle", 0.1)
			tas.animationController:setPose("Standing")
		end

		function tas.core:freeze(state)
			state = if state == nil then not self._isFrozen else state

			if self._isReplaying or self._isFrozen == state then return end 

			self._seekDirection = 0

			if not state then
				for i = #self._recordingFrames, self._freezeFrame, -1 do 
					self._recordingFrames[i] = nil
				end

				self._isFrozen = false 

				local rootPart = util:getRootPart()
				if rootPart then rootPart.Anchored = false end

				return
			end

			interface:setStatus("Frozen")

			self._isFrozen = true 
			self._freezeFrame = #self._recordingFrames

			task.spawn(function()
				while self._isFrozen do 
					local humanoid = util:getHumanoid()
					if not humanoid then runService.RenderStepped:Wait() continue end 

					local rootPart = util:getRootPart()
					if not rootPart then runService.RenderStepped:Wait() continue end 

					if self._freezeFrame == 0 or self._freezeFrame > #self._recordingFrames then runService.RenderStepped:Wait() continue end

					local freezeFrame = util:roundNumber(self._freezeFrame, 0)
					local frame = self._recordingFrames[freezeFrame]

					local pose
					local animation

					for i = freezeFrame, 1, -1 do
						if pose and animation then break end

						local frame = self._recordingFrames[i]

						pose = frame._pose 
						animation = frame._animationQueue[#frame._animationQueue]
					end

					if animation then
						if animation[1] == "walk" then
							if humanoid.FloorMaterial ~= Enum.Material.Air and frame._humanoidState ~= 3 then
								tas.animationController:playAnimation("walk", animation[2], true)
							end
						else
							tas.animationController:playAnimation(animation[1], animation[2], true)
						end
					end

					rootPart.Anchored = true

					pcall(function() tas.animationController:playAnimation(frame._animationSpeed) end)

					tas.animationController:setPose(pose)

					humanoid:ChangeState(frame._humanoidState)

					rootPart.Velocity = util:tableToVector3(frame._rootPartVelocity)
					rootPart.RotVelocity = util:tableToVector3(frame._rootPartRotVelocity)
					rootPart.CFrame = util:tableToCFrame(frame._rootPartCFrame)

					currentCamera.CFrame = util:tableToCFrame(frame._cameraCFrame)

					tas.cameraController:setZoom(frame._zoom)

					tas.inputController:toggleShiftLock(frame._shiftlockState)

					mousemoveabs(frame._mousePosition[1], frame._mousePosition[2])

					runService.RenderStepped:Wait()
				end
			end)
		end
	end

	do -- loader:
		function tas:load()
			self.animationController:init()
			self.cameraController:init()
			self.inputController:init()
		end 
	end
end

do -- obby royale:

	do -- autoPlayController:
		function obbyRoyale.autoPlayController:setEnabled(state)
			self._isAutoPlayEnabled = state
		end

		function obbyRoyale.autoPlayController:getSpawn()
			if not workspace.Arena:FindFirstChild("Stages") then return end

			local stages = workspace.Arena:FindFirstChild("Stages")
			if not stages then return end 

			local stage = stages:WaitForChild(localPlayer.Name)

			local startPosition = stage.Settings.Start.Position

			local closestSpawn
			local lowestMagitude = math.huge

			for _, obj in workspace.Arena.Spawns:GetChildren()  do
				local magnitude = (startPosition - obj.Top.Position).Magnitude

				if magnitude < lowestMagitude then 
					closestSpawn = obj
					lowestMagitude = magnitude
				end
			end

			return closestSpawn
		end

		function obbyRoyale.autoPlayController:stopAutoPlay()	
			tas.core:stopReplaying()
		end

		function obbyRoyale.autoPlayController:startAutoPlay(stageId)	
			setthreadidentity(8)

			stageId = stageId or workspace.GameStatus:GetAttribute("CurrentStageID")

			local frames = tas.core:getFile(stageId)
			if not frames then return end

			local spawn = self:getSpawn()
			if not spawn then return end 

			local rootPart = util:getRootPart()
			if not rootPart then return end

			local oldStartPosition = util:tableToCFrame(frames[1]._rootPartCFrame).Position

			local startPositionOffset = Vector3.new(0, oldStartPosition.Y - GAME_Y, 0)
			local relativeCFrame = workspace.Arena.Spawns["1"].PrimaryPart.CFrame

			local function transformCFrame(cframe)
				local old = spawn.PrimaryPart.CFrame:ToWorldSpace(relativeCFrame:ToObjectSpace(util:tableToCFrame(cframe)))
				local new = spawn.PrimaryPart.CFrame:ToWorldSpace(relativeCFrame:ToObjectSpace(util:tableToCFrame(cframe))) - startPositionOffset

				return util:cframeToTable(new)
			end

			for i = 1, #frames do 
				local frame = frames[i]

				frame._rootPartCFrame, frame._cameraCFrame = transformCFrame(frame._rootPartCFrame), transformCFrame(frame._cameraCFrame)
			end

			interface:sendConsoleMessage(`Autoplay started ({stageId})`)

			tas.core:startReplaying(frames)
		end

		function obbyRoyale.autoPlayController:init()
			workspace.Arena.Stages.ChildAdded:Connect(function(instance)
				if instance.Name ~= localPlayer.Name or not self._isAutoPlayEnabled then return end 

				local stageModel = instance:FindFirstChildWhichIsA("Model") or instance
				local stageId = stageModel and stageModel:GetAttribute("ID")

				self:startAutoPlay(stageId ~= 0 and stageId or nil)
			end)

			workspace.Preloaded.ChildAdded:Connect(function(instance)
				if instance.Name ~= localPlayer.Name then return end 

				self:stopAutoPlay()
			end)
		end
	end

	do 
		function obbyRoyale.tasController:hookPracticeUI()
			if self._isPracticeUIHooked then return end

			local oldOpen = mainUIController.Open
			mainUIController.Open = function(self, menu)
				if menu == playerGui.MainUI.PracticeUI and not checkcaller() then return end 

				return oldOpen(self, menu)
			end
			self._oldOpenUI = oldOpen

			local oldClose = mainUIController.Close 
			mainUIController.Close = function(self, menu)
				if menu == playerGui.MainUI.PracticeUI and not checkcaller() then return end

				return oldClose(self, menu)
			end
			self._oldCloseUI = oldClose

			self._isPracticeUIHooked = true
		end

		function obbyRoyale.tasController:unHookPracticeUI()	
			if not self._isPracticeUIHooked then return end

			mainUIController.Open = self._oldOpenUI
			mainUIController.Close = self._oldCloseUI

			self._isPracticeUIHooked = false
		end

		function obbyRoyale.tasController:getStageDifficulty(stageId)
			for _, difficulty in orUtils.Stages do 
				for _, stage in difficulty.Stages do 
					if stage.ID ~= tonumber(stageId) then continue end 

					return difficulty.Difficulty
				end
			end
		end

		function obbyRoyale.tasController:loadStages()
			local stages = insertService:LoadLocalAsset("rbxassetid://103711201260351")
			stages.Parent = replicatedStorage

			self._stages = stages
		end

		function obbyRoyale.tasController:selectStage()
			if self._isSelectingStage then return end

			self._isSelectingStage = true

			if playerGui.MainUI.PracticeUI.Visible then 
				mainUIController:Close(playerGui.MainUI.PracticeUI)

				task.wait(0.5)
			end

			self:hookPracticeUI()

			local function createLabel(text, position, color, parent)
				local completed = Instance.new("TextLabel")
				completed.Text = text
				completed.AnchorPoint = Vector2.new(0.5, 0.5)
				completed.Position = position
				completed.Size = UDim2.fromScale(1, 0.1)
				completed.TextColor3 = color
				completed.BackgroundTransparency = 1
				completed.TextSize = 20
				completed.Font = Enum.Font.FredokaOne
				completed.Parent = parent

				local stroke = Instance.new("UIStroke")
				stroke.Thickness = 2
				stroke.Parent = completed
			end

			local oldPopulateStages; oldPopulateStages = hookfunction(self._practiceENV.populateStages, newcclosure(function(...)			
				oldPopulateStages(...)

				task.spawn(function()
					for _, stageFrame in playerGui.MainUI.PracticeUI.Stages.Grid:GetChildren() do 
						if not stageFrame:IsA("GuiButton") then continue end 

						if tas.core:getFile(stageFrame.Name) then 
							createLabel("Completed!", UDim2.fromScale(0.5, 0.85), Color3.fromRGB(0, 255, 0), stageFrame)
						end

						createLabel(stageFrame.Name, UDim2.fromScale(0.5, 0.1), Color3.fromRGB(255, 255, 255), stageFrame)

						hookfunction(getconnections(stageFrame.Load.LoadButton.MouseButton1Click)[1].Function, newcclosure(function()
							interface._createPopup:Fire(stageFrame.Name)
						end))

						task.wait()
					end
				end)
			end))
			self._oldPopulateStages = oldPopulateStages

			self._practiceENV.back()

			playerGui.MainUI.PracticeUI.DifficultyPick.Difficulties.CanvasPosition = Vector2.zero

			obbyRoyale.core:unlockPracticeStages()

			for _, textLabel in playerGui.MainUI.PracticeUI.DifficultyPick:GetChildren() do 
				if not textLabel:IsA("TextLabel") then continue end 

				if textLabel.Text == "Practice Stages" then 
					textLabel.Text = "Select Stage"
				else 
					textLabel.Text = "Select stage to TAS"
				end
			end

			playerGui.MainUI.PracticeUI.Close.Visible = false
			playerGui.MainUI.PracticeUI.Visible = true

			mainUIController:Open(playerGui.MainUI.PracticeUI)	
		end

		function obbyRoyale.tasController:stopSelectingStage()
			setthreadidentity(8)

			if not self._isSelectingStage then return end

			self._isSelectingStage = false

			mainUIController:Close(playerGui.MainUI.PracticeUI)

			self._practiceENV.back()

			if not self._isTASSING then 
				self:unHookPracticeUI()
			end

			hookfunction(self._practiceENV.populateStages, self._oldPopulateStages)

			for _, textLabel in playerGui.MainUI.PracticeUI.DifficultyPick:GetChildren() do 
				if not textLabel:IsA("TextLabel") then continue end 

				if textLabel.Text == "Select Stage" then 
					textLabel.Text = "Practice Stages"
				else 
					textLabel.Text = "In this area you can practice stages from any of the difficulties in game"
				end
			end

			playerGui.MainUI.PracticeUI.Visible = false
			playerGui.MainUI.PracticeUI.Close.Visible = true
		end

		function obbyRoyale.tasController:selectNextStage()
			local stages = {}

			for _, difficulty in orUtils.Stages do
				for _, stage in difficulty.Stages do 
					table.insert(stages, stage.ID)
				end
			end

			local nearest = nil

			for _, stage in stages do
				if stage > tonumber(self._loadedStage or 0) and (nearest == nil or stage < nearest) then
					nearest = stage
				end
			end

			if not nearest then 
				nearest = 1
			end

			self:setupTAS(nearest)
		end

		function obbyRoyale.tasController:loadStage(stageId) 
			local stageModel = self._stages[stageId]:Clone()
			stageModel.Parent = playerGui.LoadedStage

			self._loadedStage = stageId

			return stageModel
		end

		function obbyRoyale.tasController:setupTAS(stageId, dontDisableControls)
			setthreadidentity(8)

			self._isTASSING = true

			self:stopSelectingStage()
			self:loadStage(stageId)

			interface:setStage(stageId)

			if not dontDisableControls then 
				tas.inputController:disableControls()
			end

			local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			character:PivotTo(workspace.PracticeArena.Start.PrimaryPart.CFrame + Vector3.new(0, 5, 0))
		end

		function obbyRoyale.tasController:init()
			self:loadStages()

			self._practiceENV = getsenv(playerGui.MainUI.MainUIController.PracticeController)
		end
	end

	do -- core:
		function obbyRoyale.core:unlockPracticeStages()
			setthreadidentity(8)

			if not firesignal or not getupvalue or not setupvalue then return interface:sendConsoleMessage("Your executor doesnt support this!") end

			if self._unlockedPracticeStages then return interface:sendConsoleMessage("Practice stages already unlocked!") end

			interface:sendConsoleMessage("Unlocked practice stages!")

			playerGui.MainUI.PracticeUI.DifficultyPick.Difficulties.UnlockAll.Visible = false

			local tbl = {}

			for difficulty in difficulties do
				table.insert(tbl, difficulty)
			end

			setupvalue(practiceController.Init, 2, tbl)

			self._unlockedPracticeStages = true

			firesignal(replicatedStorage.ServerCommunication.Events.Practice.Purchases.AllUnlocked.OnClientEvent)
		end

		function obbyRoyale.core:setDisableReset(state)
			self._isResetDisabled = state
		end

		function obbyRoyale.core:joinProServer()
			if self._isJoiningPro then return interface:sendConsoleMessage("Join pro server...") end

			self._isJoiningPro = true

			interface:sendConsoleMessage("Join pro server...")

			teleportService:Teleport(17205456753, localPlayer)

			local connection; connection = localPlayer.OnTeleport:Connect(function(teleportState)
				if teleportState == Enum.TeleportState.Failed then
					connection:Disconnect()

					interface:sendConsoleMessage("Teleport failed!")

					self._isJoiningPro = false
				end
			end)
		end

		function obbyRoyale.core:rejoin()
			if self._isRejoining or self._isServerhopping then return interface:sendConsoleMessage("Already rejoining") end 

			self._isRejoining = true 

			interface:sendConsoleMessage("Rejoining...")

			teleportService:TeleportToPlaceInstance(placeId, jobId)

			local connection; connection = localPlayer.OnTeleport:Connect(function(teleportState)
				if teleportState == Enum.TeleportState.Failed then
					connection:Disconnect()

					interface:sendConsoleMessage("Teleport failed!")

					self._isRejoining = false
				end
			end)
		end

		function obbyRoyale.core:serverhop()
			if not request then return interface:sendConsoleMessage("Your executor doesnt support requests!") end

			if self._isServerhopping or self._isRejoining then return interface:sendConsoleMessage("Already serverhopping!") end

			self._isServerhopping = true

			interface:sendConsoleMessage("Searching for server...")

			local result = request({Url =`https://games.roblox.com/v1/games/{game.PlaceId}/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true`})

			local success, body = pcall(function()
				return httpService:JSONDecode(result.Body)
			end)

			if success and body and body.data then
				local servers = {}

				for _, server in body.data do
					if typeof(server) == "table" and tonumber(server.playing) and tonumber(server.maxPlayers) and server.playing < server.maxPlayers and server.id ~= jobId then
						table.insert(servers, 1, server.id)
					end
				end

				if #servers > 0 then
					interface:sendConsoleMessage("Found server!")

					task.wait()

					teleportService:TeleportToPlaceInstance(placeId, servers[rng:NextInteger(1, #servers)], localPlayer)

					local connection; connection = localPlayer.OnTeleport:Connect(function(teleportState)
						if teleportState == Enum.TeleportState.Failed then
							connection:Disconnect()

							interface:sendConsoleMessage("Teleport failed!")
						end
					end)
				else
					interface:sendConsoleMessage("No servers available!")
				end
			else 
				interface:sendConsoleMessage("Error occured when searching for server!")
			end

			self._isServerhopping = false
		end
	end

	do -- loader:
		function obbyRoyale:load()
			self.autoPlayController:init()
			self.tasController:init()
			--self.core:init()
		end
	end
end

do -- hooks:
	do -- namecall hook:
		local oldNamecall; oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
			local args = {...}
			local method = getnamecallmethod()

			if method == "FireServer" and tostring(self) == "Load" then
				local stageId = args[2]

				if obbyRoyale.core._unlockedPracticeStages then 
					obbyRoyale.tasController._stages[stageId]:Clone().Parent = playerGui.LoadedStage
				end
			elseif method == "FireServer" and tostring(self) == "Reset" and obbyRoyale.core._isResetDisabled then 
				return
			end

			return oldNamecall(self, ...)
		end))
	end
end
do -- interface:
	function interface:setStatus(status)
		self._statusLabel.Text = `Status: {status}`
	end

	function interface:setStage(stageId)
		setthreadidentity(8)

		self._stageLabel.Text = `Stage: {stageId} | {obbyRoyale.tasController:getStageDifficulty(stageId)}`
	end

	function interface:sendConsoleMessage(text)
		self._console:AppendText(`Window -> {text}`)
	end

	function interface:createConsole()
		local window = reGui:Window({
			Title = "Console",
			Size = UDim2.new(0, 350, 0, 215),
			NoScroll = true,
			Theme = "Normal",
		})

		self._consoleWindow = window

		local console = window:Console({
			Enabled = true,
			ReadOnly = true,
		})

		window:Button({
			Text = "Clear",
			Callback = function() console:Clear() end
		})

		self._console = console
	end

	function interface:createWindow()
		local window = reGui:TabsWindow({
			Title = placeName,
			Size = UDim2.fromOffset(600, 400),
			Theme = "Normal",
		}):Center()

		self._window = window
	end

	function interface:createTab()
        local tabs = {
            ["main"] = {
                name = "Main",
            },
            ["credits"] = {
                name = "Credits",
            },
        }

        for tabName, tabData in tabs do
            local tab = self._window:CreateTab({ Name = tabData.name })

            local list = tab:List({
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                UiPadding = 1,
                Spacing = 10
            })

            self._tabs[tabName] = list
        end
    end

	function interface:createRegions()
		local regions = {
            ["main"] = {
                ["tas"] = {
                    title = "TAS Creator",
                },
                ["autoPlay"] = {
                    title = "Auto Play",
                },
                ["miscellaneous"] = {
                    title = "Miscellaneous",
                },
            },
            ["credits"] = {
                ["info"] = {
                    title = "Credits",
                },
            },
        }

		for tabName, tabData in regions do
			if not self._regions[tabName] then self._regions[tabName] = {} end

			for regionName, regionData in tabData do
				local region = self._tabs[tabName]:Region({
					Border = true,
					BorderColor = self._window:GetThemeKey("Border"),
					BorderThickness = 1,
					CornerRadius = UDim.new(0, 5),
				})

				region:Label({ Text = regionData.title })

				self._regions[tabName][regionName] = region
			end
		end
	end

	function interface:createPopup(stageId)
		setthreadidentity(8)

		local modalWindow = self._window:PopupModal({
			Title = placeName,
			AutoSize = "Y"
		})
		self._modalWindow = modalWindow

		modalWindow:Label({
			Text = `Are you sure you would like to restart?`,
		})

		modalWindow:Separator()

		local row = modalWindow:Row({
			Expanded = true
		})

		row:Button({
			Text = "Yes",
			Callback = function()
				task.spawn(obbyRoyale.tasController.setupTAS, obbyRoyale.tasController, stageId)

				setthreadidentity(8)

				modalWindow:ClosePopup()
			end,
		})

		row:Button({
			Text = "No",
			Callback = function()
				modalWindow:ClosePopup()
			end,
		})
	end

	function interface:setupAutoPlayRegion()
		local autoPlayRegion = self._regions["main"]["autoPlay"]

		autoPlayRegion:Checkbox({
			Label = "Enabled",
			Value = false,
			Callback = function(_, value)
				obbyRoyale.autoPlayController:setEnabled(value)
			end
		})

		autoPlayRegion:Button({
			Text = "Force Stop",
			Callback = function() obbyRoyale.autoPlayController:stopAutoPlay() end,
		})

		autoPlayRegion:Button({
			Text = "Play Again",
			Callback = function() 
				obbyRoyale.autoPlayController:stopAutoPlay() 		
				task.wait() 		
				obbyRoyale.autoPlayController:startAutoPlay() 
			end,
		})
	end

	function interface:setupTASRegion()
		local tasRegion = self._regions["main"]["tas"]

		tasRegion:Button({
			Text = "Select Stage",
			Callback = function() obbyRoyale.tasController:selectStage() end,
		})

		--[[
		tasRegion:Button({
			Text = "Select Next",
			Callback = function() obbyRoyale.tasController:selectNextStage() end,
		})
		--]]

		tasRegion:Button({
			Text = "Stop Selecting",
			Callback = function() obbyRoyale.tasController:stopSelectingStage() end,
		})

		tasRegion:Separator()

		local stageLabel = tasRegion:Label({
			Text = "Stage: Nothing Selected",
		})
		self._stageLabel = stageLabel

		local statusLabel = tasRegion:Label({
			Text = "Status: Not recording",
		})
		self._statusLabel = statusLabel

		tasRegion:Keybind({
			Label = "Start Recording",
			Value = Enum.KeyCode.E,
			Callback = function()
				if not obbyRoyale.tasController._isTASSING or tas.core._isRecording then return end

				if obbyRoyale.tasController._loadedStage then 
					obbyRoyale.tasController:setupTAS(obbyRoyale.tasController._loadedStage, true)
				end

				task.wait()

				tas.core:startRecording()
			end,
		})

		tasRegion:Keybind({
			Label = "Stop Recording",
			Value = Enum.KeyCode.Q,
			Callback = function()
				if not obbyRoyale.tasController._isTASSING then return end

				tas.core:stopRecording()
			end,
		})

		tasRegion:Keybind({
			Label = "Start Replaying",
			Value = Enum.KeyCode.U,
			Callback = function()
				if not obbyRoyale.tasController._isTASSING then return end

				tas.core:startReplaying(tas.core._recordingFrames, true) -- obbyRoyale.tasController._loadedStage
			end,
		})

		tasRegion:Keybind({
			Label = "Stop Replaying",
			Value = Enum.KeyCode.I,
			Callback = function()
				if not obbyRoyale.tasController._isTASSING then return end

				tas.core:stopReplaying()
			end,
		})

		tasRegion:Keybind({
			Label = "Freeze",
			Value = Enum.KeyCode.F,
			Callback = function()
				tas.core:freeze()
			end,
		})

		tasRegion:Keybind({
			Label = "Go Back",
			Value = Enum.KeyCode.T,
			Callback = function(_, keyCode)
				tas.core:setBackKeybind(keyCode)
			end,
		})

		tasRegion:Keybind({
			Label = "Go Forward",
			Value = Enum.KeyCode.Y,
			Callback = function(_, keyCode)
				tas.core:setForwardKeybind(keyCode)
			end,
		})

		tasRegion:Keybind({
			Label = "Save Recording",
			Value = Enum.KeyCode.P,
			Callback = function()
				tas.core:saveToFile(obbyRoyale.tasController._loadedStage)
			end,
		})
	end

	function interface:setupMiscRegion()
		local miscRegion = self._regions["main"]["miscellaneous"]

		miscRegion:Button({
			Text = "Unlock Practice Stages",
			Callback = function() obbyRoyale.core:unlockPracticeStages() end,
		})

		miscRegion:Checkbox({
			Label = "Disable Reset",
			Value = false,
			Callback = function(_, value)
				obbyRoyale.autoPlayController:setEnabled(value)
			end
		})

		miscRegion:Separator()

		miscRegion:Button({
			Text = "Join Pro Server",
			Callback = function() obbyRoyale.core:joinProServer() end,
		})

		miscRegion:Button({
			Text = "Rejoin",
			Callback = function() obbyRoyale.core:rejoin() end,
		})

		miscRegion:Button({
			Text = "Serverhop",
			Callback = function() obbyRoyale.core:serverhop() end,
		})

		miscRegion:Separator()

		miscRegion:Button({
			Text = "Anti AFK",
			Callback = function() for _, v in getconnections(localPlayer.Idled) do v:Disable() end end,
		})

		miscRegion:Keybind({
			Label = "Show/Hide GUI",
			Value = Enum.KeyCode.RightShift,
			Callback = function()
				local state = not self._window.Visible

				self._window:SetVisible(state)
				self._consoleWindow:SetVisible(state)
			end,
		})
	end

    function interface:setupCreditsRegion()
        local creditsRegion = self._regions["credits"]["info"]

        creditsRegion:Label({
            Text = "Main Developer: Killa0731",
        })

        creditsRegion:Label({
            Text = "Other: Tasability for most of the TAS functionality",
        })
    end

	function interface:load()
		reGui:Init({ Prefabs = insertService:LoadLocalAsset(`rbxassetid://{reGui.PrefabsId}`) })
		reGui:DefineTheme("Normal", {
			TitleAlign = Enum.TextXAlignment.Center,
			TextDisabled = Color3.fromRGB(120, 100, 120),
			Text = Color3.fromRGB(200, 180, 200),

			FrameBg = Color3.fromRGB(25, 20, 25),
			FrameBgTransparency = 0.4,
			FrameBgActive = Color3.fromRGB(120, 100, 120),
			FrameBgTransparencyActive = 0.4,

			CheckMark = Color3.fromRGB(150, 100, 150),
			SliderGrab = Color3.fromRGB(150, 100, 150),
			ButtonsBg = Color3.fromRGB(150, 100, 150),
			CollapsingHeaderBg = Color3.fromRGB(150, 100, 150),
			CollapsingHeaderText = Color3.fromRGB(200, 180, 200),
			RadioButtonHoveredBg = Color3.fromRGB(150, 100, 150),

			WindowBg = Color3.fromRGB(35, 30, 35),
			TitleBarBg = Color3.fromRGB(35, 30, 35),
			TitleBarBgActive = Color3.fromRGB(50, 45, 50),

			Border = Color3.fromRGB(50, 45, 50),
			ResizeGrab = Color3.fromRGB(50, 45, 50),
			RegionBgTransparency = 1,
		})

		self:createWindow()
		self:createTab()
		self:createRegions()
		self:setupAutoPlayRegion()
		self:setupTASRegion()
		self:setupMiscRegion()
        self:setupCreditsRegion()
		self:createConsole()

		self._createPopup.Event:Connect(function(stageId)
			if tas.core:getFile(stageId) then 
				self:createPopup(stageId)
			else 
				obbyRoyale.tasController:setupTAS(stageId)
			end
		end)

		getgenv().onExecuted = function()
			self:sendConsoleMessage("Do not execute twice!")
		end
	end
end

do -- main loader:
	interface:load()
	tas:load()
	obbyRoyale:load()

	tas.core:syncTASFiles()

	interface:sendConsoleMessage("Script successfully loaded!")
end
