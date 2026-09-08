-- Loadstring: loadstring(game:HttpGet("https://pastebin.com/raw/TxtihXPH"))()
--[[
Notes:
- Only capable of controlling NPCs with network ownership mode set to auto
- When disabling hurdle anonymity, the real character will stick to the torso of the hurdle instead of being positioned under/above it
- You will lose control of the NPC you’re controlling if it gets too close to another player
- Sometimes, your real character might get killed by the NPC
- It is somewhat unstable
]]

local HurdleAnonymity = true

local inf, pi = math.huge, math.pi

local StarterGui = game:GetService("StarterGui")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Client = game:GetService("Players").LocalPlayer
local Character = Client.Character or Client.CharacterAdded:Wait()
local Backpack = Client:WaitForChild("Backpack")
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

Character:WaitForChild("Frigid").Enabled = false

local NPCsModel = workspace:WaitForChild("NPCs")

local Controlling = false
local OriginalProperties = {}
local DisposableInstances = {}

function CreateDisposableInstance(className, properties)
	properties = properties or {}
	local instance = Instance.new(className)
	table.insert(DisposableInstances, instance)

	for name, value in pairs(properties) do
		instance[name] = value
	end

	return instance
end

CreateDisposableInstance("Highlight", {
	FillTransparency = 1,
	OutlineColor = Color3.new(1, 0, 0),
	Parent = NPCsModel
})

local ClientHighligher = CreateDisposableInstance("Highlight", {
	FillTransparency = 1,
	OutlineColor = Color3.fromRGB(75, 150, 255),
	Enabled = false,
	Parent = Character
})

local ClientAttachment = CreateDisposableInstance("Attachment", {Parent = HumanoidRootPart})
local DummyAttachment = CreateDisposableInstance("Attachment")
local NPCAttachment = CreateDisposableInstance("Attachment")

local ClientVelocity = CreateDisposableInstance("LinearVelocity", {
	Attachment0 = ClientAttachment,
	MaxForce = inf,
	Enabled = false,
	Parent = workspace
})

local ClientAlignOrientation = CreateDisposableInstance("AlignOrientation", {
	MaxTorque = inf,
	Responsiveness = inf,
	Attachment0 = ClientAttachment,
	Attachment1 = NPCAttachment,
	Enabled = false,
	Parent = workspace
})

local NPCAlignPosition = CreateDisposableInstance("AlignPosition", {
	ApplyAtCenterOfMass = true,
	Attachment0 = NPCAttachment,
	Attachment1 = DummyAttachment,
	MaxForce = inf,
	Responsiveness = inf,
	Enabled = false,
	Parent = workspace
})

local NPCAlignOrientation = CreateDisposableInstance("AlignOrientation", {
	MaxTorque = inf,
	Responsiveness = inf,
	Attachment0 = NPCAttachment,
	Attachment1 = DummyAttachment,
	Enabled = false,
	Parent = workspace
})

local DummyModel
local DummyRootPart

local NPCModel
local NPCRootPart
local NPCName

local Connections

function SetOriginalProperty(instance, name, value)
	local instanceOriginalProperties = OriginalProperties[instance] or {}
	instanceOriginalProperties[name] = value
	OriginalProperties[instance] = instanceOriginalProperties
end

local ControllerTools = {}

function UpdateToolNames()
	for npcName, controllerTool in pairs(ControllerTools) do
		controllerTool.Name = `{npcName} Controller{if Controlling and NPCName == npcName then " (Current)" else ""}`
	end
end

function SetCameraSubject(subject)
	while task.wait() do
		local camera = workspace.CurrentCamera
		if camera then
			camera.CameraSubject = subject
			return
		end
	end
end

local DummyDiedConnection
local ClientHealthChangedConnection

function StopControlling()
	Controlling = false

	if ClientHealthChangedConnection then
		ClientHealthChangedConnection:Disconnect()
	end

	if DummyDiedConnection then
		DummyDiedConnection:Disconnect()
	end

	SetCameraSubject(Humanoid)
	Client.Character = Character

	DummyAttachment.Parent = nil
	NPCAttachment.Parent = nil

	if DummyModel then
		DummyModel:Destroy()
	end

	local DummyModel = nil
	local DummyRootPart = nil

	local NPCModel = nil
	local NPCRootPart = nil
	local NPCName = nil

	for instance, originalProperties in pairs(OriginalProperties) do
		for name, value in pairs(originalProperties) do
			instance[name] = value
		end
		OriginalProperties[instance] = nil
	end

	ClientHighligher.Enabled = false

	ClientVelocity.Enabled = false
	ClientAlignOrientation.Enabled = false
	NPCAlignPosition.Enabled = false
	NPCAlignOrientation.Enabled = false
	Humanoid.PlatformStand = false
end

function Notify(text)
	StarterGui:SetCore("SendNotification", {
		Title = "IF - NPCC",
		Text = text,
		Button1 = "Close"
	})
end

function Control(npcModel)
	if Controlling then
		StopControlling()
	end

	local npcRootPart = npcModel:FindFirstChild("HumanoidRootPart")
	if npcRootPart then
		local npcHumanoid = npcModel.Humanoid

		ClientHighligher.Enabled = true
		SetOriginalProperty(HumanoidRootPart, "CFrame", HumanoidRootPart.CFrame)

		Humanoid.PlatformStand = true

		pcall(function()
			npcRootPart.BodyPosition:Destroy()
		end)

		pcall(function()
			npcRootPart.BodyGyro:Destroy()
		end)

		local dummyModel = npcModel:Clone()
		local dummyRootPart = dummyModel.HumanoidRootPart
		local dummyHumanoid = dummyModel.Humanoid

		DummyDiedConnection = dummyHumanoid.Died:Once(function()
			if Controlling then
				Humanoid.Health = 0
			end
		end)
		
		local function updateHealth()
			if Controlling then
				dummyHumanoid.MaxHealth = Humanoid.MaxHealth
				dummyHumanoid.Health = Humanoid.Health
			end
		end
		
		ClientHealthChangedConnection = Humanoid.Changed:Connect(updateHealth)
		updateHealth()

		for _, descendant in pairs(dummyModel:GetDescendants()) do
			if descendant:IsA("Light") then
				descendant.Enabled = false
			else
				pcall(function()
					descendant.Transparency = 0.95
				end)
			end
		end

		DummyModel = dummyModel
		DummyRootPart = dummyRootPart

		dummyModel.Parent = workspace

		DummyAttachment.Parent = dummyRootPart
		NPCAttachment.Parent = npcRootPart

		NPCModel = npcModel
		NPCRootPart = npcRootPart
		NPCName = npcModel.Name

		SetCameraSubject(dummyModel)
		Client.Character = dummyModel

		NPCAlignPosition.Enabled = true
		NPCAlignOrientation.Enabled = true
		ClientAlignOrientation.Enabled = false
		ClientVelocity.Enabled = true
		Controlling = true
	else
		Notify(`Failed to locate the root part of NPC "{npcModel.Name}"`)
	end
end

function Cleanup()
	StopControlling()

	for _, connection in pairs(Connections) do
		connection:Disconnect()
	end

	for _, instance in pairs(DisposableInstances) do
		instance:Destroy()
	end
end

function CreateControllerTool(npcName)
	local controllerTool = Instance.new("Tool")
	controllerTool.CanBeDropped = false
	controllerTool.RequiresHandle = false
	controllerTool.Name = `{npcName} Controller`
	controllerTool.Parent = Backpack

	ControllerTools[npcName] = controllerTool

	return controllerTool.Equipped:Connect(function()
		task.defer(function()
			controllerTool.Parent = Backpack
			if Controlling and NPCName == npcName then
				StopControlling()
			else
				local npcModel = NPCsModel:FindFirstChild(npcName)
				if npcModel then
					Control(npcModel)
				else
					Notify(`Cannot find the model of NPC "{npcName}"`)
				end
			end
			UpdateToolNames()
		end)
	end)
end

local HurdleAnonymityToggleButton = CreateDisposableInstance("TextButton", {
	Name = "HurdleAnonymityToggleButton",
	AnchorPoint = Vector2.new(0.5, 1),
	Size = UDim2.new(0, 180, 0, 25),
	BorderColor3 = Color3.fromRGB(0, 0, 0),
	Position = UDim2.new(0.5, 0, 0, -10),
	BorderSizePixel = 0,
	BackgroundColor3 = Color3.fromRGB(45, 45, 45),
	BackgroundTransparency = 0.5,
	TextSize = 14,
	TextColor3 = Color3.new(0, 255, 0),
	Text = "(H) Hurdle Anonymity: ON",
	FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold),
	ZIndex = -2147483648,
	Parent = RobloxGui
})

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = HurdleAnonymityToggleButton

local UIStroke = Instance.new("UIStroke")
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = HurdleAnonymityToggleButton.TextColor3
UIStroke.Transparency = 0.5
UIStroke.Parent = HurdleAnonymityToggleButton

local UIScale = Instance.new("UIScale")
UIScale.Parent = HurdleAnonymityToggleButton

local TimerLabel = CreateDisposableInstance("TextLabel", {
	Name = "TimerLabel",
	AnchorPoint = Vector2.new(0.5, 1),
	AutomaticSize = Enum.AutomaticSize.X,
	Size = UDim2.new(0, 150, 0, 50),
	BorderColor3 = Color3.fromRGB(0, 0, 0),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.75, 0, 0, -5),
	BorderSizePixel = 0,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	TextStrokeTransparency = 0,
	TextSize = 14,
	RichText = true,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Text = "",
	FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json"),
	Parent = RobloxGui
})

local UIScale2 = Instance.new("UIScale")
UIScale2.Parent = TimerLabel

function UpdateHurdleAnonymity()
	local newText = "(H) Hurdle Anonymity: OFF"
	local newColor = Color3.new(1, 0, 0)

	if HurdleAnonymity then
		newText = "(H) Hurdle Anonymity: ON"
		newColor = Color3.new(0, 1, 0)
	end

	HurdleAnonymityToggleButton.Text = newText
	HurdleAnonymityToggleButton.TextColor3 = newColor
	UIStroke.Color = newColor
end

function ToggleHurdleAnonymity()
	HurdleAnonymity = not HurdleAnonymity
	UpdateHurdleAnonymity()
end


local StatusLabel
local TimeLabel
local MiscLabel

task.spawn(function()
	local timerFrame = workspace:WaitForChild("Maze 2"):WaitForChild("TimerDisplays"):WaitForChild("Screen"):WaitForChild("SurfaceGui"):WaitForChild("Frame")
	StatusLabel = timerFrame:WaitForChild("StatusDisplay")
	TimeLabel = timerFrame:WaitForChild("TimeDisplay")
	MiscLabel = timerFrame:WaitForChild("Misc")
end)

Connections = {
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
		if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.H and input.UserInputState == Enum.UserInputState.Begin then
			ToggleHurdleAnonymity()
		end
	end),

	HurdleAnonymityToggleButton.Activated:Connect(ToggleHurdleAnonymity),

	game:GetService("RunService").RenderStepped:Connect(function()
		local scale = RobloxGui.AbsoluteSize.Y / 800

		UIScale.Scale = scale
		UIScale2.Scale = scale

		TimerLabel.Text = `{if StatusLabel and StatusLabel.Visible then StatusLabel.ContentText.."\n" else ""}<font size="18">{if TimeLabel and TimeLabel.Visible then TimeLabel.ContentText else "[???]"}</font>{if MiscLabel and MiscLabel.Visible then "\n"..MiscLabel.ContentText else ""}`
		
		local selectedColorLabel = TimeLabel or StatusLabel or MiscLabel
		TimerLabel.TextColor3 = if selectedColorLabel then selectedColorLabel.TextColor3 else Color3.new(1, 1, 1)

		if Controlling then
			if type(sethiddenproperty) == "function" then
				sethiddenproperty(Client, "SimulationRadius", inf) 
			elseif type(setsimulationradius) == "function" then
				setsimulationradius(inf)
			end

			if NPCRootPart then
				local isRalphNearby = false
				
				if NPCName ~= "Ralph" then
					local ralphRootPart = NPCsModel:FindFirstChild("Ralph")
					ralphRootPart = if ralphRootPart then ralphRootPart:FindFirstChild("HumanoidRootPart") else nil
					
					if ralphRootPart then
						isRalphNearby = (NPCRootPart.CFrame.Position - ralphRootPart.CFrame.Position).Magnitude <= 20
					end
				end
				
				local safeCFrame = NPCRootPart.CFrame * if NPCName == "Ralph" then
					CFrame.new(0, -12, 0)
				else if NPCName == "Fraud" then
					CFrame.new(0, -(if isRalphNearby then 12 else 6.5), 1.5)
				else if NPCName == "Hurdle" then
					if HurdleAnonymity then
						if (NPCRootPart.CFrame.Position - Vector3.new(1785.792, 4.6, 756.483)).Magnitude > 92 then
							CFrame.new(0, -(if isRalphNearby then 15.5 else 10), 1)
						else
							CFrame.new(0, 35, 1)
					else
						CFrame.new(0, 0, 1)
				else
					CFrame.new(0, -(if isRalphNearby then 12 else 6.5), 0)
				
				local stanModel = NPCsModel:FindFirstChild("Stan")
				local safePosition = safeCFrame.Position
				local stanPosition = stanModel and stanModel:FindFirstChild("HumanoidRootPart")
				stanPosition = if stanPosition then stanPosition.CFrame.Position else nil
				
				local finalCFrame = if stanPosition then
					CFrame.lookAt(safePosition, Vector3.new(stanPosition.X, safePosition.Y, stanPosition.Z))
				else
					safeCFrame
				
				if NPCName == "Ralph" then
					finalCFrame *= CFrame.Angles(0, 0, pi)
				end
				
				HumanoidRootPart.CFrame = finalCFrame
			end

				task.spawn(function()
					for _, child in pairs(Character:GetChildren()) do
						if child:IsA("BasePart") and child.CanCollide then
							SetOriginalProperty(child, "CanCollide", true)
							child.CanCollide = false
						end
					end
				end)

				if DummyModel then
					task.spawn(function()
						for _, child in pairs(DummyModel:GetChildren()) do
							if child:IsA("BasePart") and child.CanCollide then
								child.CanCollide = false
							end
						end
					end)
				end

				if NPCModel then
					for _, child in pairs(NPCModel:GetChildren()) do
						if child:IsA("BasePart") and child.CanCollide then
							SetOriginalProperty(child, "CanCollide", true)
							child.CanCollide = false
						end
					end
				end
			end
		end),

	CreateControllerTool("Fraud"),
	--CreateControllerTool("Ralph"),
	CreateControllerTool("Kate"),
	--CreateControllerTool("Hurdle"),
	--CreateControllerTool("Stan"), -- Impossible to take over the control
	--CreateControllerTool("James"),

	Humanoid.Died:Once(Cleanup),
	Character.Destroying:Once(Cleanup),
	Backpack.Destroying:Once(Cleanup)
}