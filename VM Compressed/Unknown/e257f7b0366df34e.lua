--!native
--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local vector3zero = Vector3.zero

if not sethiddenproperty then
	--error("Script is only compatible with environments that have sethiddenproperty")
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/fallback.lua"))()
	end)
	repeat task.wait() until finished == true
	return
end

--// Tools

--// .. code ..

local UI = (gethui and gethui()) or (cloneref and cloneref(game:GetService("CoreGui"))) or (pcall(function() return game:GetService("CoreGui").Parent end) and game:GetService("CoreGui")) or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")

local function LoadUi(seconds)
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_2 = Instance.new("UIStroke")
	local UIStroke_3 = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel_2 = Instance.new("TextLabel")
	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent = UI
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, 429, 0, 79)
	Frame.Position = UDim2.new(0.5, -Frame.Size.X.Offset/2, 0.01, 0)
	UIStroke.Parent = Frame

	UIStroke_2.Color = Color3.fromRGB(65, 65, 65)
	UIStroke_3.Color = Color3.fromRGB(65, 65, 65)

	UICorner.Parent = Frame

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(79, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 127, 179))}
	UIGradient.Rotation = 40
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.07, 0.13), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = Frame

	UIStroke_3.Thickness = 0.7

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.265734255, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 50)
	TextLabel.Font = Enum.Font.BuilderSans
	TextLabel.Text = "MrY7zz's CurrentAngle V2 REANIMATE BY MrY7zz"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 20.000
	UIStroke_2.Parent = TextLabel

	TextLabel_2.Parent = Frame
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(-0.08, 0, 0.367088616, 0)
	TextLabel_2.Size = UDim2.new(0, 500, 0, 50)
	TextLabel_2.Font = Enum.Font.BuilderSans
	TextLabel_2.Text = tostring(seconds) .. " Seconds left for reanimate to load"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(seconds + 1.5, function()
		ScreenGui:Destroy()
	end)
end

local setsimulationradius = setsimulationradius
if not setsimulationradius then
	-- setsimulationradius.lua
	-- © 2025 MrY7zz (MIT License)

	local Players = game:GetService("Players")

	local newIndex
	local Index

	--// Extracting __newindex
	xpcall(function()
		game[{}] = {}
	end, function()
		newIndex = debug.info(2, "f")
	end)

	--// Extracting __index
	xpcall(function()
		return game[{}]
	end, function()
		Index = debug.info(2, "f")
	end)


	setsimulationradius = function(Radius, maxRadius)
		local LocalPlayer = Index(Players, "LocalPlayer")
		newIndex(LocalPlayer, "SimulationRadius", Radius)

		if maxRadius then
			newIndex(LocalPlayer, "MaximumSimulationRadius", maxRadius)
		end
	end
end

local game = game
local debug = debug
local debug_info = debug.info

local gameIndex
local gameNewIndex
local CFrameIndex
local CFrameMul
local CFrameAdd
local Vector3Mul

local emptyCFrame = CFrame.new()

local getrawmetatableworks = false
local isindexsupported = false

if getrawmetatable then
	local s, r = pcall(getrawmetatable, game)
	local success, res = pcall(getrawmetatable, emptyCFrame)

	if s then  
		if r.__index then
			gameIndex = r.__index
			gameNewIndex = r.__newindex
			getrawmetatableworks = true
		end
	end
	if success and s then
		if res.__index then
			CFrameIndex = res.__index
			CFrameMul = res.__mul
			CFrameAdd = res.__add
			Vector3Mul = getrawmetatable(vector3zero).__mul
		end
	end
end

if not getrawmetatableworks then
	xpcall(function()
		return game[{}]
	end, function()
		gameIndex = debug_info(2, "f")
	end)

	xpcall(function()
		game[{}] = {}
	end, function()
		gameNewIndex = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame[{}]
	end, function()
		CFrameIndex = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame * 9
	end, function()
		CFrameMul = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame + 9
	end, function()
		CFrameAdd = debug_info(2, "f")
	end)

	xpcall(function()
		return vector3zero * 9
	end, function()
		Vector3Mul = debug_info(2, "f")
	end)
end

local successtest, err = pcall(function()
	return gameIndex(game:GetService("Workspace"), "Parent")
end)

if not successtest then
	if string.find(err:lower(), "instance expected") then
		isindexsupported = false
	else
		isindexsupported = true
	end
else
	isindexsupported = true
end

if not gameIndex then
	gameIndex = function(self, key)
		return self[key]
	end
end

if not gameNewIndex then
	gameNewIndex = function(self, key, new)
		self[key] = new
	end
end

if not CFrameIndex then
	CFrameIndex = function(self, key, new)
		self[key] = new
	end
end

if not CFrameMul then
	CFrameMul = function(a, b)
		return a * b
	end
end

if not CFrameAdd then
	CFrameAdd = function(a, b)
		return a + b
	end
end

if not Vector3Mul then
	Vector3Mul = function(a, b)
		return a * b
	end
end

local zeropointone = 0.1
local twait = task.wait
local tspawn = task.spawn
local currentfakechar = nil
local getgenv = getgenv or function()
	return _G
end

local NaN = 0/0

local dummypart = Instance.new("Part")

local function getsetting(string_, default) --// Finally
	if _G[string_] == nil then
		return default
	else
		return _G[string_]
	end
end

local GetDescendants = dummypart.GetDescendants
local IsA = dummypart.IsA
local Destroy = dummypart.Destroy

local math_random = math.random
local Vector3_new = Vector3.new

local usedefaultanims = getsetting("Use default animations", false)

local transparency_level = getsetting("Local character transparency level", 1) or getsetting("Fake character transparency level", 1) --// Backwards compatibility

local disablescripts = getsetting("Disable character scripts", true)

local fakecollisions = getsetting("Fake character should collide", false)

local nametoexcludefromtransparency = getsetting("Names to exclude from transparency", {})

local parentrealchartofakechar = getsetting("Parent real character to fake character", false)

local respawncharacter = getsetting("Respawn character", true)

local instantrespawn = getsetting("Instant respawn", false)

local hiderootpart = getsetting("Hide HumanoidRootPart", false)

local permadeathcharacter = getsetting("PermaDeath fake character", true)

local r15rig = getsetting("R15 Reanimate", false)

local clickfling = getsetting("Click Fling", false)

local displaymode = getsetting("Client sided display mode", 1)

local respawnmode = getsetting("Respawn mode", "BreakJoints")

local poscache = getsetting("Hide RootPart Distance", CFrame.new(255, 255, 0))

local LocalPlayer = game:GetService("Players").LocalPlayer

local Mouse = LocalPlayer:GetMouse()

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
end
twait(zeropointone)

local mode = LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType
local R15 = Enum.HumanoidRigType.R15
if mode == R15 and hiderootpart == true then
	warn("Hide RootPart is not supported with R15, disabling")
	hiderootpart = false
end

local function removeAnims(character)
	if character == currentfakechar then
		return
	end
	local humanoid = character:WaitForChild("Humanoid", 5)
	local animator = humanoid:FindFirstChildWhichIsA("Animator")
	if animator then
		Destroy(animator)
	end
	local animateScript = character:FindFirstChild("Animate")
	if animateScript then
		Destroy(animateScript)
	end
	local a = nil
	a = humanoid.DescendantAdded:Connect(function(child)
		if child:IsA("Animator") then
			Destroy(child)
			a:Disconnect()
			a = nil
		end
	end)
end

LocalPlayer.CharacterAdded:Once(removeAnims)

LocalPlayer.Character.Archivable = true
local originalChar = LocalPlayer.Character
local fakeChar

local fakecharcreate = loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/fakeCharHandler.lua"))

if not r15rig then
	fakeChar = fakecharcreate(originalChar, false, Enum.HumanoidRigType.R6) --originalChar:Clone()
else
	fakeChar = fakecharcreate(originalChar, false, Enum.HumanoidRigType.R15)
	fakeChar.HumanoidRootPart.CFrame = originalChar.HumanoidRootPart.CFrame
end
fakeChar.Name = LocalPlayer.Name .. "_Fake"
fakeChar.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
local signaldiedbackend = LocalPlayer.ConnectDiedSignalBackend
local signalkill = LocalPlayer.Kill

local function respawn(character: Model)
	local typeof_ = typeof(replicatesignal) == "function"
	local Humanoid = character:WaitForChild("Humanoid")

	if respawnmode == "BreakJoints" then
		character:BreakJoints()
	elseif respawnmode == "Health" then
		Humanoid.Health = 0
	elseif respawnmode == "ServerBreakJoints" and typeof_ then
		replicatesignal(Humanoid.ServerBreakJoints)
	elseif respawnmode == "Kill" and typeof_ then
		replicatesignal(LocalPlayer.Kill)
    else
        character:BreakJoints()
	end
end

if respawncharacter then
	LoadUi(game:GetService("Players").RespawnTime)
	if instantrespawn then
		if replicatesignal then
			replicatesignal(signaldiedbackend)
			twait(game:GetService("Players").RespawnTime - 0.05)
			respawn(originalChar)
			LocalPlayer.CharacterAdded:Wait()
			fakeChar.Parent = workspace
			currentfakechar = fakeChar
		end
	else
		respawn(originalChar)
		LocalPlayer.CharacterAdded:Wait()
		fakeChar.Parent = workspace
		currentfakechar = fakeChar
	end
end

twait(zeropointone)

local newChar = LocalPlayer.Character
newChar.Archivable = true

if disablescripts then
	tspawn(function()
		for _, obj in ipairs(fakeChar:GetChildren()) do
			if obj:IsA("LocalScript") then
				obj.Enabled = false
			end
		end
	end)
end

twait(0.4)

LocalPlayer.Character = fakeChar
if parentrealchartofakechar then
	newChar.Parent = fakeChar
end

local newcharTorso
local newcharLowerTorso
if mode == R15 then
	newcharTorso = newChar:WaitForChild("UpperTorso")
	newcharLowerTorso = newChar:WaitForChild("LowerTorso")
else
	newcharTorso = newChar:WaitForChild("Torso")
end
local fakecharTorso
if r15rig then
	fakecharTorso = fakeChar:WaitForChild("UpperTorso")
else
	fakecharTorso = fakeChar:WaitForChild("Torso")
end
local newcharRoot = newChar:WaitForChild("HumanoidRootPart")
local fakecharRoot = fakeChar:WaitForChild("HumanoidRootPart")

local limbmapping

if not r15rig then
	limbmapping = {
		Neck = fakeChar:WaitForChild("Head"),
		RootJoint = fakeChar:WaitForChild("Torso"),
		["Left Shoulder"] = fakeChar:WaitForChild("Left Arm"),
		["Right Shoulder"] = fakeChar:WaitForChild("Right Arm"),
		["Left Hip"] = fakeChar:WaitForChild("Left Leg"),
		["Right Hip"] = fakeChar:WaitForChild("Right Leg")
	}
else
	limbmapping = {
		Neck = fakeChar:WaitForChild("Head"),
		RootJoint = fakeChar:WaitForChild("UpperTorso"),
		["Left Shoulder"] = fakeChar:WaitForChild("LeftLowerArm"),
		["Right Shoulder"] = fakeChar:WaitForChild("RightLowerArm"),
		["Left Hip"] = fakeChar:WaitForChild("LeftLowerLeg"),
		["Right Hip"] = fakeChar:WaitForChild("RightLowerLeg")
	}
end 

local jointmapping

if mode == R15 then
	jointmapping = {
		Neck = newChar:WaitForChild("Head"):WaitForChild("Neck"),
		RootJoint = newChar:WaitForChild("LowerTorso"):WaitForChild("Root"),
		["Left Shoulder"] = newChar:WaitForChild("LeftUpperArm"):WaitForChild("LeftShoulder"),
		["Right Shoulder"] = newChar:WaitForChild("RightUpperArm"):WaitForChild("RightShoulder"),
		["Left Hip"] = newChar:WaitForChild("LeftUpperLeg"):WaitForChild("LeftHip"),
		["Right Hip"] = newChar:WaitForChild("RightUpperLeg"):WaitForChild("RightHip")
	}
else
	jointmapping = {
		Neck = newcharTorso:WaitForChild("Neck"),
		RootJoint = newChar.HumanoidRootPart:FindFirstChild("RootJoint"),
		["Left Shoulder"] = newcharTorso:WaitForChild("Left Shoulder"),
		["Right Shoulder"] = newcharTorso:WaitForChild("Right Shoulder"),
		["Left Hip"] = newcharTorso:WaitForChild("Left Hip"),
		["Right Hip"] = newcharTorso:WaitForChild("Right Hip")
	}
end


local Inverse = emptyCFrame.Inverse
local ToAxisAngle = emptyCFrame.ToAxisAngle
local ToObjectSpace = emptyCFrame.ToObjectSpace
local ToEulerAnglesXYZ = emptyCFrame.ToEulerAnglesXYZ

local function RCA6dToCFrame(Motor6D, TargetPartCF, ReferencePartCF)
	local rel = CFrameMul(Inverse(ReferencePartCF), TargetPartCF)
	local delta = CFrameMul(CFrameMul(Inverse(gameIndex(Motor6D, "C0")), rel), gameIndex(Motor6D, "C1"))
	local axis, angle = ToAxisAngle(delta)
	local newangle = Vector3Mul(axis, angle)
	sethiddenproperty(Motor6D, 'ReplicateCurrentOffset6D', CFrameIndex(delta, "Position"))
	sethiddenproperty(Motor6D, 'ReplicateCurrentAngle6D', newangle)
end

local RightArmOffset = CFrame.new(0, 0.4, 0)
local LeftArmOffset = CFrame.new(0, 0.2, 0)
local LegsOffset = CFrame.new(0, 0.6, 0)
local RootOffset = CFrame.new(0, -0.8, 0)

local task_spawn = task.spawn
local function stepReanimate()
	--[[task_spawn(function()]]
	if flinging then return end

	if hiderootpart then
		gameNewIndex(newcharRoot, "CFrame", CFrameAdd(poscache, Vector3_new(0, math_random(1, 2) / 100.19, 0)))
	else
		gameNewIndex(newcharRoot, "CFrame", CFrameAdd(gameIndex(fakecharRoot, "CFrame"), Vector3_new(0, math_random(1, 2) / 100.19, 0)))
	end

	--// YES it is unstable. im working on optimizing (later)

	gameNewIndex(newcharRoot, "Velocity", vector3zero)
	gameNewIndex(newcharRoot, "RotVelocity", vector3zero)

	for joint, limb in pairs(limbmapping) do
		local relativecframe = ToObjectSpace(gameIndex(limb, "CFrame"), gameIndex(fakecharTorso, "CFrame"))
		local pitch, yaw, _ = ToEulerAnglesXYZ(relativecframe)

		local angle = 0

		if joint == "Neck" or joint == "RootJoint" then
			angle = -yaw
		elseif joint == "Left Shoulder" or joint == "Left Hip" then
			angle = pitch
		elseif joint == "Right Shoulder" or joint == "Right Hip" then
			angle = -pitch
		end

		if mode == R15 then
			local rootjoint = jointmapping["RootJoint"]
			RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame * CFrame.new(0, -0.8, 0), fakecharRoot.CFrame)
		else
			local rootjoint = jointmapping["RootJoint"]
			RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame, newcharRoot.CFrame)
		end

		if joint ~= "RootJoint" then
			gameNewIndex(jointmapping[joint], "DesiredAngle", angle)

			if mode == R15 then
				if joint == "Neck" then
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame"), newcharTorso.CFrame)
				elseif joint == "Right Shoulder" then
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame") * RightArmOffset, newcharTorso.CFrame)
				elseif  joint == "Left Shoulder" then
					RCA6dToCFrame(jointmapping[joint], limb.CFrame * LeftArmOffset, fakecharTorso.CFrame)
				elseif joint == "Left Hip" or joint == "Right Hip" then
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame") * LegsOffset, newcharLowerTorso.CFrame)
				else
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame"), newcharTorso.CFrame)
				end

				local rootjoint = jointmapping["RootJoint"]
				RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame * CFrame.new(0, -0.8, 0), fakecharRoot.CFrame)
			else
				RCA6dToCFrame(jointmapping[joint], limb.CFrame, newcharTorso.CFrame)

				local rootjoint = jointmapping["RootJoint"]
				RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame, newcharRoot.CFrame)
			end
		end
	end
	--[[end)]]
end

local function setdestroyheight(height)
	local sucess, result = pcall(function()
		workspace.FallenPartsDestroyHeight = height
	end)
end

local currentheight = workspace.FallenPartsDestroyHeight

local function flinginternal(character, time)
	if character == newChar then return end
	local time = time or 2

	flinging = true
	local start = tick()
	local connection
	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if tick() - start >= time then
			setdestroyheight(currentheight)
			flinging = false
			connection:Disconnect()
			--break
		end
		if character then
			if character:FindFirstChild("HumanoidRootPart") then
				local velocity = character.HumanoidRootPart.Velocity
				if character.HumanoidRootPart.CFrame.Position.Y <= currentheight + 15 then
					newcharRoot.CFrame = CFrame.new(255, 255, 0)
					return
				elseif currentheight == NaN then
					if character.HumanoidRootPart.CFrame.Position.Y <= -500 + 15 then
						newcharRoot.CFrame = CFrame.new(255, 255, 0)
						return
					end
				end
				local direction = velocity.Magnitude > 1 and velocity.Unit or Vector3_new(0, 0, 0)
				local predictedPosition = (character.PrimaryPart.CFrame or character.HumanoidRootPart.CFrame).Position + direction * math_random(5, 12)

				newcharRoot.Velocity = Vector3_new(100, 500000, 100)
				newcharRoot.CFrame = CFrame.new(predictedPosition) - Vector3.new(0, 1, 0)
				--newcharRoot.RotVelocity = Vector3_new(100, 100, 100)
			else
				flinging = false
				connection:Disconnect()
				--break
			end
		else
			flinging = false
			connection:Disconnect()
			--break
		end
	end)

end

fling = function(character, time, yield)
	--setdestroyheight(NaN)
	local yield = yield or false
	if yield then
		flinginternal(character, time)
	else
		tspawn(flinginternal, character, time)
	end
end

getgenv().fling = fling

local function disableCollisions()
	pcall(function()
		for _, char in ipairs({ newChar }) do
			for _, obj in ipairs(GetDescendants(char)) do
				if IsA(obj, "BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local function disableCollisionsWithFakeChar()
	pcall(function()
		for _, char in ipairs({ newChar, fakeChar }) do
			for _, obj in ipairs(GetDescendants(char)) do
				if IsA(obj, "BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local RunService = game:GetService("RunService")

local postSimConnection = RunService.PostSimulation:Connect(stepReanimate)
local disableCollisionConnection;

local humanoidnewchar = newChar:WaitForChild("Humanoid")

humanoidnewchar.PlatformStand = true
humanoidnewchar.AutoRotate = false

if fakecollisions then
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisions)
else
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisionsWithFakeChar)
end

if not permadeathcharacter then
	fakeChar.Humanoid.Died:Once(function()
		disableCollisionConnection:Disconnect()
		postSimConnection:Disconnect()

		fakeChar:Destroy()
		game:GetService("Players").LocalPlayer.Character = newChar
		newChar:BreakJoints()
	end)
end

workspace.CurrentCamera.CameraSubject = fakeChar:WaitForChild("Humanoid")

if clickfling then
	Mouse.Button1Down:Connect(function()
		--// Fun fact: This click fling was made by MrY7zz (MIT license)
		local target = Mouse.Target
		if not target then return end
		--// Fun fact: This click fling was made by MrY7zz (MIT license)

		local character = target:FindFirstAncestorOfClass("Model")
		if not not not character then return end
		--// Fun fact: This click fling was made by MrY7zz (MIT license)
		--// Fun fact: This click fling was made by MrY7zz (MIT license)

		local plr = game:GetService("Players"):GetPlayerFromCharacter(character)
		if not plr then return end
		if plr == LocalPlayer then return end

		fling(character, 2.3, true)
	end)
end

if displaymode == 1 then
	for _, part in ipairs(fakeChar:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("Decal") then
			if not nametoexcludefromtransparency[tostring(part)] then
				part.Transparency = transparency_level
			end
		end
	end
elseif displaymode == 2 then
	for _, part in ipairs(newChar:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("Decal") then
			if not nametoexcludefromtransparency[tostring(part)] then
				part.Transparency = transparency_level
			end
		end
	end
end

finished = true

if usedefaultanims then
	if r15rig then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/r15anim"))()
	else
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/anims"))()
	end
end

