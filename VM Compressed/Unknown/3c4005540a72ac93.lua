--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

if not game.IsLoaded then
	game.Loaded:Wait()
end

if not sethiddenproperty then
	--error("Script is only compatible with environments that have sethiddenproperty")
task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/fallback.lua"))()
end)
repeat task.wait() until finished == true
	return
end

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

local zeropointone = 0.1
local twait = task.wait
local tspawn = task.spawn
local currentfakechar = nil
local vector3zero = Vector3.zero
local getgenv = getgenv or function()
	return _G
end

local NaN = 0/0

local dummypart = Instance.new("Part")

local GetDescendants = dummypart.GetDescendants
local IsA = dummypart.IsA
local Destroy = dummypart.Destroy

local math_random = math.random
local Vector3_new = Vector3.new

local usedefaultanims = _G["Use default animations"] or false

local transparency_level = _G["Fake character transparency level"] or 1

local disablescripts = _G["Disable character scripts"] or true

local fakecollisions = _G["Fake character should collide"] or true

local nametoexcludefromtransparency = _G["Names to exclude from transparency"] or {}

local parentrealchartofakechar = _G["Parent real character to fake character"] or false

local respawncharacter = (function() if _G["Respawn character"] == nil then return true else return _G["Respawn character"] end end)()

local instantrespawn = (function() if _G["Instant respawn"] == nil then return false else return _G["Instant respawn"] end end)()

local hiderootpart = (function() if _G["Hide HumanoidRootPart"] == nil then return false else return _G["Hide HumanoidRootPart"] end end)()

local permadeathcharacter = (function() if _G["PermaDeath fake character"] == nil then return true else return _G["PermaDeath fake character"] end end)()

local r15rig = (function() if _G["R15 Reanimate"] == nil then return false else return _G["R15 Reanimate"] end end)()

local clickfling = (function() if _G["Click Fling"] == nil then return false else return _G["Click Fling"] end end)()

local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
	twait(zeropointone)
	if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType ~= Enum.HumanoidRigType.R6 then
		error("Script is only compatible with R6 type rigs")
		return
	end
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

if not r15rig then
	fakeChar = originalChar:Clone()
else
	fakeChar = game:GetService("Players"):CreateHumanoidModelFromDescription(originalChar.Humanoid.HumanoidDescription, Enum.HumanoidRigType.R15)
	fakeChar.HumanoidRootPart.CFrame = originalChar.HumanoidRootPart.CFrame
end
fakeChar.Name = LocalPlayer.Name .. "_Fake"
local signaldiedbackend = LocalPlayer.ConnectDiedSignalBackend
local signalkill = LocalPlayer.Kill

if respawncharacter then
	LoadUi(game:GetService("Players").RespawnTime)
	if instantrespawn then
		if replicatesignal then
			replicatesignal(signaldiedbackend)
			twait(game:GetService("Players").RespawnTime - 0.05)
			replicatesignal(signalkill)
			LocalPlayer.CharacterAdded:Wait()
			fakeChar.Parent = workspace
			currentfakechar = fakeChar
		end
	else
		originalChar:BreakJoints()
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

for _, part in ipairs(fakeChar:GetDescendants()) do
	if part:IsA("BasePart") or part:IsA("Decal") then
		if not nametoexcludefromtransparency[tostring(part)] then
			part.Transparency = transparency_level
		end
	end
end

twait(0.4)

LocalPlayer.Character = fakeChar
if parentrealchartofakechar then
	newChar.Parent = fakeChar
end

local newcharTorso = newChar:WaitForChild("Torso")
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

local jointmapping = {
	Neck = newcharTorso:WaitForChild("Neck"),
	RootJoint = newChar.HumanoidRootPart:WaitForChild("RootJoint"),
	["Left Shoulder"] = newcharTorso:WaitForChild("Left Shoulder"),
	["Right Shoulder"] = newcharTorso:WaitForChild("Right Shoulder"),
	["Left Hip"] = newcharTorso:WaitForChild("Left Hip"),
	["Right Hip"] = newcharTorso:WaitForChild("Right Hip")
}

local Inverse = emptyCFrame.Inverse
local ToAxisAngle = emptyCFrame.ToAxisAngle
local ToObjectSpace = emptyCFrame.ToObjectSpace
local ToEulerAnglesXYZ = emptyCFrame.ToEulerAnglesXYZ

local function RCA6dToCFrame(Motor6D, TargetPart, ReferencePart)
	local rel = Inverse(gameIndex(ReferencePart, "CFrame")) * gameIndex(TargetPart, "CFrame")
	local delta = Inverse(gameIndex(Motor6D, "C0")) * rel * gameIndex(Motor6D, "C1")
	local axis, angle = ToAxisAngle(delta)
	local newangle = axis * angle
	sethiddenproperty(Motor6D, 'ReplicateCurrentOffset6D', CFrameIndex(delta, "Position"))
	sethiddenproperty(Motor6D, 'ReplicateCurrentAngle6D', newangle)
end

local poscache = CFrame.new(255, 255, 0)

local task_spawn = task.spawn
local function stepReanimate()
	--[[task_spawn(function()]]
	if flinging then return end

	if hiderootpart then
		newcharRoot.CFrame = poscache 
        + Vector3_new(0, math_random(1, 2) / 100.19, 0)
	else
		newcharRoot.CFrame = fakeChar.HumanoidRootPart.CFrame + Vector3_new(0, math_random(1, 2) / 100.19, 0)
	end

	--// YES it is unstable. im working on optimizing (later)

    	newcharRoot.Velocity = vector3zero
	newcharRoot.Velocity = vector3zero

	local rootjoint = jointmapping["RootJoint"]
	RCA6dToCFrame(rootjoint, limbmapping["RootJoint"], newcharRoot)

	for joint, limb in pairs(limbmapping) do
		local relativecframe = ToObjectSpace(limb.CFrame, gameIndex(fakecharTorso, "CFrame"))
		local pitch, yaw, _ = ToEulerAnglesXYZ(relativecframe)

		local angle = 0

		if joint == "Neck" or joint == "RootJoint" then
			angle = -yaw
		elseif joint == "Left Shoulder" or joint == "Left Hip" then
			angle = pitch
		elseif joint == "Right Shoulder" or joint == "Right Hip" then
			angle = -pitch
		end

		if joint ~= "RootJoint" then
			gameNewIndex(jointmapping[joint], "DesiredAngle", angle)
			RCA6dToCFrame(jointmapping[joint], limb, newChar.Torso)
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
	local time = time or 5

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
				local direction = velocity.Magnitude > 1 and velocity.Unit or Vector3_new(0, 0, 0)
				local predictedPosition = (character.PrimaryPart.CFrame or character.HumanoidRootPart.CFrame).Position + direction * math_random(5, 12)

				newcharRoot.CFrame = CFrame.new(predictedPosition)
				newcharRoot.Velocity = Vector3_new(9e7, 9e7 * 10, 9e7)
				newcharRoot.RotVelocity = Vector3_new(9e8, 9e8, 9e8)
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

getgenv().fling = function(character, time, yield)
	setdestroyheight(NaN)
	local yield = yield or false
	if yield then
		flinginternal(character, time)
	else
		tspawn(flinginternal, character, time)
	end
end

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

finished = true
if usedefaultanims then
task_spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/anims"))
end)
end
