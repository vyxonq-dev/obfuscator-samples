local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local localplr = game.Players.LocalPlayer
local mouse = localplr:GetMouse()
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Plot = workspace.Plots[localplr:GetAttribute("Plot")]

if getgenv().OakayThisisthWindow then
	getgenv().OakayThisisthWindow:Close()
end

local Window = WindUI:CreateWindow({
	Title = "Thr",
	Icon = "lucide:box",
	Author = "by 2AreYouMental110",
	Folder = "BuildABaseOakay"
})

getgenv().OakayThisisthWindow = Window

local BaseTab = Window:Tab({
	Title = "Base",
	Icon = "lucide:house",
	Locked = false
})

local MovementTab = Window:Tab({
	Title = "Movement",
	Icon = "lucide:sport-shoe",
	Locked = false
})

local VisualTab = Window:Tab({
	Title = "Visual",
	Icon = "lucide:eye",
	Locked = false
})

local originalBaseBlockCollide = {}
local baseBlocks = Plot.Builds:GetChildren()
local NoclipBaseToggle = BaseTab:Toggle({
	Title = "Noclip Base",
	Type = "Toggle",
	Value = false,
	Callback = function(b)
		if b then
			for i,v in pairs(baseBlocks) do
				local Part = (v.PrimaryPart or v.Handle)
				if not originalBaseBlockCollide[Part] then
					originalBaseBlockCollide[Part] = Part.CanCollide
				end
				Part.CanCollide = false
			end
		else
			for i,v in pairs(baseBlocks) do
				local Part = (v.PrimaryPart or v.Handle)
				Part.CanCollide = originalBaseBlockCollide[Part]
			end
		end
	end
})

local onBaseBlockAdded = Plot.Builds.ChildAdded:Connect(function(c)
	table.insert(baseBlocks, c)
	task.wait(0.1)
	local Part = (c.PrimaryPart or c.Handle)
	if NoclipBaseToggle.Value then
		originalBaseBlockCollide[Part] = Part.CanCollide
		Part.CanCollide = false
	end
end)

local playerDetectBlock = Instance.new("Part")
playerDetectBlock.CFrame = Plot.Base.CFrame
playerDetectBlock.Size = Plot.Base.Size
local AlertBaseToggle = BaseTab:Toggle({
	Title = "Alert when someone is near your Base",
	Type = "Toggle",
	Value = false
})

local speed = 30
local SpeedSlider = MovementTab:Slider({
	Title = "Ok I will use WindUI (45 Recommende)",
	Step = 1,
	Value = {
		Min = 30,
		Max = 60,
		Default = 30
	},
	Callback = function(v)
		speed = v
		localplr.Character.Humanoid.WalkSpeed = speed
	end
})

local onWalkSpeedChanged = {}
local function onCharacterAdded(c)
	local h = c:WaitForChild("Humanoid")
	table.insert(onWalkSpeedChanged, h:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		h.WalkSpeed = speed
	end))
end
local OCA = localplr.CharacterAdded:Connect(onCharacterAdded)
if localplr.Character then
	onCharacterAdded(localplr.Character)
end

local ClimbDetector = Instance.new("Part")
ClimbDetector.Transparency = 1
ClimbDetector.CanCollide = false
ClimbDetector.Anchored = true
ClimbDetector.Parent = workspace
local ClimbWallToggle = MovementTab:Toggle({
	Title = "Climb Walls",
	Type = "Toggle",
	Value = false
})

local NoAnimToggle = MovementTab:Toggle({
	Title = "No Animation (Helps Climb Wall)",
	Type = "Toggle",
	Value = false,
    Callback = function(b)
        localplr.Character.Animate.Disabled = b
		if b then
			for i,v in pairs(localplr.Character.Humanoid.Animator:GetPlayingAnimationTracks()) do
				v:Stop()
			end
		end
    end
})

local HepButton = MovementTab:Button({
	Title = "Hep I Fell (Do Not Spam It)",
	Callback = function()
		localplr.Character.HumanoidRootPart.CFrame = CFrame.new(0,100000,0)
	end
})
local HepKeybind = MovementTab:Keybind({
    Title = "Hep I Fell (Do Not Spam It)",
    Value = "G",
    Callback = function(v)
        localplr.Character.HumanoidRootPart.CFrame = CFrame.new(0,100000,0)
    end
})

local baseData = {}
local HMVPT = VisualTab:Toggle({
	Title = "Highlight most valuable pet in each base",
	Type = "Toggle",
	Value = false,
    Callback = function(b)
		for i,v in pairs(baseData) do
			v.Highlight.Enabled = b
		end
    end
})

local petMath = require(game:GetService("ReplicatedStorage").Shared.Services.PetService.PetMath)

local function updateHighlight(Owner, PetId)
	local data = baseData[Owner]
	if PetId and data.Pets[PetId] then
		if data.Pets[PetId].PetMPS > data.HighestValue.PetMPS then
			baseData[Owner].HighestValue = data.Pets[PetId]
			data.Highlight.Adornee = baseData[Owner].HighestValue.Pet
		end
	else
		local HighestValue = nil
		for i,v in pairs(data.Pets) do
			if HighestValue == nil or HighestValue.PetMPS < v.PetMPS then
				HighestValue = v
			end
		end
		if HighestValue then
			baseData[Owner].HighestValue = HighestValue
			data.Highlight.Adornee = HighestValue.Pet
		end
	end
end

local hiddenUI = localplr.PlayerGui--(get_hidden_gui and get_hidden_gui()) or (gethui and gethui()) or game.CoreGui
local function processPet(v)
	local OwnerUserId = v:GetAttribute("OwnerUserId")
	local Owner = game.Players:GetPlayerByUserId(OwnerUserId)
	local petData = Owner.PlayerData.Pets.Equipped:FindFirstChild(v:GetAttribute("PetId"))
	local petMPS = petMath.mps(petData:FindFirstChild("Name").Value, petData.Level.Value, petData:FindFirstChild("Mutation") and petData.Mutation.Value)
	if not baseData[Owner] then
		local Highlight = Instance.new("Highlight")
		Highlight.FillColor = Color3.new(0,1,0)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.Enabled = HMVPT.Value
		Highlight.Parent = hiddenUI
		Highlight.Adornee = v
		baseData[Owner] = {
			HighestValue = {
				Pet = v,
				PetMPS = petMPS
			},
			Pets = {},
			Highlight = Highlight
		}
	end
	baseData[Owner].Pets[v:GetAttribute("PetId")] = {
		Pet = v,
		PetMPS = petMPS
	}
	updateHighlight(Owner, v:GetAttribute("PetId"))
	petData.Level.Changed:Connect(function()
		petMath.mps(petData:FindFirstChild("Name").Value, petData.Level.Value, petData:FindFirstChild("Mutation") and petData.Mutation.Value)
		baseData[Owner].Pets[v:GetAttribute("PetId")].PetMPS = petMPS
		updateHighlight(Owner, v:GetAttribute("PetId"))
	end)
	local function doMutation(v)
		if not v or v.Name ~= "Mutation" then
			return
		end
		v.Changed:Connect(function()
			petMath.mps(petData:FindFirstChild("Name").Value, petData.Level.Value, v.Value)
			baseData[Owner].Pets[v:GetAttribute("PetId")].PetMPS = petMPS
			updateHighlight(Owner, v:GetAttribute("PetId"))
		end)
	end
	doMutation(petData:FindFirstChild("Mutation"))
	petData.ChildAdded:Connect(doMutation)
end
for i,v in pairs(workspace.RuntimePets:GetChildren()) do
	processPet(v)
end
local onPetAdded = workspace.RuntimePets.ChildAdded:Connect(processPet)
local onPetRemoved = workspace.RuntimePets.ChildRemoved:Connect(function(v)
	local OwnerUserId = v:GetAttribute("OwnerUserId")
	local Owner = game.Players:GetPlayerByUserId(OwnerUserId)
	if not Owner then
		return
	end
	baseData[Owner].Pets[v:GetAttribute("PetId")] = nil
	if baseData[Owner].HighestValue and baseData[Owner].HighestValue.Pet == v then
		baseData[Owner].HighestValue = nil
	end
	updateHighlight(Owner)
end)

local function isPointInsidePartXY(point: Vector3, part: BasePart): boolean -- I am not doing math!
    local localPoint = part.CFrame:PointToObjectSpace(point)
    local size = part.Size / 2
    
    return math.abs(localPoint.X) <= size.X
       and math.abs(localPoint.Z) <= size.Z
end

local preRegistered = {}
local ORS = RunService.RenderStepped:Connect(function()
	if localplr.Character and localplr.Character:FindFirstChild("Humanoid") then
		localplr.Character.Humanoid.WalkSpeed = speed
		if ClimbWallToggle.Value then
			ClimbDetector.CFrame = localplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
			ClimbDetector.Size = localplr.Character.HumanoidRootPart.Size + Vector3.new(0,0,0.1)
			local Parts = workspace:GetPartsInPart(ClimbDetector)
			local Climb = false
			for i,v in pairs(Parts) do
				if v.Parent.Parent.Name == "Builds" and (not v:IsDescendantOf(Plot) or not NoclipBaseToggle.Value) then
					Climb = true
					break
				end
			end
			if Climb then
				localplr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,30,0)
			end
		end
        if AlertBaseToggle.Value then
			local Alert = false
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= localplr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
					local hrpPosition = v.Character.HumanoidRootPart.Position
					local Inside = isPointInsidePartXY(hrpPosition, playerDetectBlock)
					if Inside and not preRegistered[v] then
						Alert = true
						preRegistered[v] = true
						break
					elseif not Inside then
						preRegistered[v] = false
					end
				end
			end
			if Alert then
				WindUI:Popup({
					Title = "Hep someone is in your Base",
					Icon = "lucide:triangle-alert",
					Content = "Pleas do Somethign",
					Buttons = {
						{
							Title = "Cancel",
							Icon = "lucide:x",
							Callback = function() end,
							Variant = "Tertiary",
						},
						{
							Title = "Lock Base (If there is a timer Wait for it,,,)",
							Icon = "lucide:lock",
							Callback = function()
								if Plot.Lock:GetAttribute("LockState") == "Cooldown" or Plot.Lock:GetAttribute("LockStealBlocked") == true then
									repeat
										task.wait()
									until Plot.Lock:GetAttribute("LockState") ~= "Cooldown" and Plot.Lock:GetAttribute("LockStealBlocked") == false
								end
								firetouchinterest(localplr.Character.HumanoidRootPart, Plot.Lock.Pad, 0)
							end,
							Variant = "Primary",
						}
					}
				})
			end
        end
	end
end)

Window:OnDestroy(function()
	onBaseBlockAdded:Disconnect()
	OCA:Disconnect()
	for i,v in pairs(onWalkSpeedChanged) do
		v:Disconnect()
	end
	NoclipBaseToggle:Set(false)
    NoAnimToggle:Set(false)
	ORS:Disconnect()
	ClimbWalls = false
	ClimbDetector:Destroy()
	for i,v in pairs(baseData) do
		if v.Highlight and v.Highlight.Parent then
			v.Highlight:Destroy()
		end
	end
end)