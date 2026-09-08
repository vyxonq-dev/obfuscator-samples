local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function getChar(player) if player and player.Character then return player.Character end end
local function getRoot(player) if getChar(player) and getChar(player):FindFirstChild("HumanoidRootPart") then return getChar(player):FindFirstChild("HumanoidRootPart") end end
local function getHumanoid(player) if getChar(player) and getChar(player):FindFirstChild("Humanoid") then return getChar(player):FindFirstChild("Humanoid") end end
local function isAlive(player) if getHumanoid(player).Health > 0 then return true end return false end
local function isInstOf(v, ...) for i=1,select("#",...) do if v:IsA(select(i,...)) then return true end end return false end

local Connections = {}

local function Connect(name, event, func)
    if Connections[name] then
        Connections[name]:Disconnect()
    end
    Connections[name] = event:Connect(func)
end

local function Disconnect(name)
    if Connections[name] then
        Connections[name]:Disconnect()
        Connections[name] = nil
    end
end

local function DisconnectAll()
    for k, v in pairs(Connections) do
        v:Disconnect()
    end
    table.clear(Connections)
end

local function permaDeath(v)
    local waitTime
    if v == nil then replicatesignal(LocalPlayer.ConnectDiedSignalBackend) end
    if v then
        waitTime = Players.RespawnTime + .1
    else
        waitTime = Players.RespawnTime - .1
    end
    replicatesignal(LocalPlayer.ConnectDiedSignalBackend)
    wait(waitTime)
    replicatesignal(LocalPlayer.Kill)
end

local function getPlayers()
    local PlayersTable = {}
    table.clear(PlayersTable)
    for i, v in pairs(Players:GetPlayers()) do
        table.insert(PlayersTable, v.Name)
    end
    return PlayersTable
end

local function changeCameraSubject(subject)
    Camera.CameraSubject = subject
end


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local function Notify(Title, Content, Duration, Image)
    Rayfield:Notify({
        Title = Title,
        Content = Content,
        Duration = Duration,
        Image = Image
    })
end

local function CreateWindow(Name, Icon, LoadingTitle, LoadingSubtitle, ShowText, Theme, ToggleUIKeybind)
    local Window = Rayfield:CreateWindow({
        Name = Name,
        Icon = Icon,
        LoadingTitle = LoadingTitle,
        LoadingSubtitle = LoadingSubtitle,
        ShowText = ShowText,
        Theme = Theme,
        ToggleUIKeybind = ToggleUIKeybind
    })
    return Window
end

local function Tab(Window, Title, Image)
    if not Image then Image = nil end
    local Tab = Window:CreateTab(Title, Image)
    return Tab
end

local function Button(Tab, Name, Callback)
    local Button = Tab:CreateButton({
        Name = Name,
        Callback = Callback
    })
    return Button
end

local function Toggle(Tab, Name, CurrentValue, Flag, Callback)
    local Toggle = Tab:CreateToggle({
        Name = Name,
        CurrentValue = CurrentValue,
        Flag = Flag,
        Callback = Callback
    })
    return Toggle
end

local function Slider(Tab, Name, Range, Increment, Suffix, CurrentValue, Flag, Callback)
    local Slider = Tab:CreateSlider({
        Name = Name,
        Range = Range,
        Increment = Increment,
        Suffix = Suffix,
        CurrentValue = CurrentValue,
        Flag = Flag,
        Callback = Callback
    })
    return Slider
end

local function Dropdown(Tab, Name, Options, CurrentOption, MultipleOptions, Flag, Callback)
    local Dropdown = Tab:CreateDropdown({
        Name = Name,
        Options = Options,
        CurrentOption = CurrentOption,
        MultipleOptions = MultipleOptions,
        Flag = Flag,
        Callback = Callback
    })
    return Dropdown
end

-- Misc
local function ChangeCollisionOfModel(model, state)
    if not model:IsA("Model") then return end

    for i, v in pairs(model:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = state
            v.CanQuery = state
            v.CanTouch = state
        end
    end
end

-- Network stuff
-- this was directly taken from luka superring lol, credits to him
getgenv().Network = getgenv().Network or {}
Network.Parts = Network.Parts or {}
Network.Velocity = Vector3.new(15,15,15) -- ts is used to mantain ownership :D

local ForcedParts = {}
local Joints = {}
-- modified function from luka superring
local function ForcePart(part)
	if not part or not part:IsA("BasePart") then return end
    if part.Anchored then return end
    if part.Parent:FindFirstChildOfClass("Humanoid") then return end --ts is kinda useless, but im too lazy to change it so it works.
    if ForcedParts[part] then return end

	for _, obj in ipairs(part:GetChildren()) do
		if obj:IsA("Attachment") or obj:IsA("AlignPosition") or obj:IsA("Torque") then
			obj:Destroy()
		end
	end
	-- we use objects that apply physics cause yes. its easier to move them that way (and also cause it helps to mantain ownership (im not to sure tho))
	part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	part.CanCollide = false
    part.CanTouch = false
	part.Massless = true
    part.Parent = workspace
	local torque = Instance.new("Torque", part)
	torque.Torque = Vector3.new(1e4, 1e4, 1e4)

	local attachment = Instance.new("Attachment", part)

	local anchor = Instance.new("Part", workspace) -- the thing we are moving
	anchor.Size = Vector3.new(1,1,1)
	anchor.Transparency = 1
	anchor.Anchored = true
	anchor.CanCollide = false
	anchor.CanTouch = false
	anchor.CanQuery = false
	anchor.Massless = true
	anchor.CFrame = part.CFrame
	anchor.Parent = workspace
    anchor.Name = part.Name .. "__anchor"

	local anchorAttachment = Instance.new("Attachment", anchor)

	local align = Instance.new("AlignPosition", part) -- the thing that moves the part to the part we are moving
	align.MaxForce = 9e9
	align.MaxVelocity = math.huge
	align.Responsiveness = 200
	align.Attachment0 = attachment
	align.Attachment1 = anchorAttachment

    local AlignOrientation = Instance.new("AlignOrientation", part) -- the thing that orientates the part to the part we are moving
    AlignOrientation.Attachment0 = attachment
    AlignOrientation.Attachment1 = anchorAttachment
    AlignOrientation.Responsiveness = 200
    AlignOrientation.MaxTorque = 9e9

    table.insert(Joints, torque)
    table.insert(Joints, attachment)
    table.insert(Joints, align)
    table.insert(Joints, AlignOrientation)

    ForcedParts[part] = {Attachment = attachment, Align = align, AlignOrientation = AlignOrientation, Torque = torque, AnchorPart = anchor, AnchorAttachment = anchorAttachment}
    part.Destroying:Connect(function()
        if ForcedParts[part] then
            if ForcedParts[part].AnchorPart then
                ForcedParts[part].AnchorPart:Destroy()
            end
            ForcedParts[part] = nil
        end
    end)
    part.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if ForcedParts[part] then
                if ForcedParts[part].AnchorPart then
                    ForcedParts[part].AnchorPart:Destroy()
                end
                ForcedParts[part] = nil
            end
        end
    end)
end

RunService.Heartbeat:Connect(function()
	sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge) -- this doesnt change a thing, but it doesnt hurt noone, so im just leaving it there (also, it should use setsimulationradius. i was half asleep when i did this)
	for _, part in pairs(Network.Parts) do
		if part:IsDescendantOf(Workspace) then
			part.Velocity = Network.Velocity -- we just set the part velocity to maintain ownership.
		end
	end
end)

local TelekinesisEnabled = false
local TelekinesisConn, MouseDownConn, MouseUpConn, InputConn -- im too lazy to use the Connect function above, i made the telekinesis before adding that.
local Mouse = LocalPlayer:GetMouse()
local HeldPart = nil
local HeldModel = nil

local Spinning = false

local function EnableTelekinesis() -- this function has 1000 gazillion stuff it doesnt need (like HeldPart). again, i was half asleep when i did this
    local TelekinesisDistance = 25
    local MinDistance = 10
    local MaxDistance = 900
    local DistanceStep = 10

    local Rotation = Vector3.new(0, 0, 0)
    local RotationSpeed = math.rad(15)

	TelekinesisEnabled = true
    setsimulationradius(1000, 1000)
	MouseDownConn = Mouse.Button1Down:Connect(function()
		if not Mouse.Target or Mouse.Target.Anchored then
            Notify("Telekinesis", "Cant grab anchored parts")
            return
        end
        InputConn = UserInputService.InputBegan:Connect(function(input, processed)
            if processed then return end
            if not TelekinesisEnabled or not HeldPart then return end

            if input.KeyCode == Enum.KeyCode.E then
                TelekinesisDistance = math.clamp(TelekinesisDistance + DistanceStep, MinDistance, MaxDistance)
            elseif input.KeyCode == Enum.KeyCode.Q then
                TelekinesisDistance = math.clamp(TelekinesisDistance - DistanceStep, MinDistance, MaxDistance)
            elseif input.KeyCode == Enum.KeyCode.R then
                Rotation = Rotation + Vector3.new(0, RotationSpeed, 0)
            elseif input.KeyCode == Enum.KeyCode.F then
                Rotation = Rotation - Vector3.new(0, RotationSpeed, 0)
            elseif input.KeyCode == Enum.KeyCode.T then
                Rotation = Rotation + Vector3.new(RotationSpeed, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.G then
                Rotation = Rotation - Vector3.new(RotationSpeed, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.X then
                Rotation = Vector3.new(0, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.Z then
                Spinning = not Spinning
            end
        end)
		local part = Mouse.Target
        local model = part:FindFirstAncestorOfClass("Model")
        --[[if model then
            HeldModel = model
            ChangeCollisionOfModel(HeldModel, false)
            if HeldModel.PrimaryPart and not HeldModel.PrimaryPart.Anchored then
                part = HeldModel.PrimaryPart
            end
        end]]
        HeldPart = part
        for _, joint in pairs(HeldPart:GetJoints()) do -- this is so velocity from the heartbeat above doesnt affect us, but it removes model support (and also makes parts u cant grab cause it isnt updated in the server)
            if not table.find(Joints, joint) then
                joint.Enabled = false
           end
        end
		ForcePart(HeldPart)
		table.insert(Network.Parts, HeldPart) -- so, uhhh to add model support comment this line, comment the for loop above and uncomment the lines 291 to 297. be aware ownership distance and stability will be affected by this (which is why i have this line uncommented).
		TelekinesisConn = RunService.Heartbeat:Connect(function()
            if not TelekinesisEnabled or not HeldPart:IsDescendantOf(Workspace) then return end
			if not isnetworkowner(HeldPart) then
				sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge) -- again, useless, it should use setsimulationradius (and its capped to 1000, thats why its useless)
			end
			local ray = Camera:ScreenPointToRay(Mouse.X, Mouse.Y)
			local goalPos = ray.Origin + ray.Direction * TelekinesisDistance
            local rotationCFrame = CFrame.Angles(Rotation.X, Rotation.Y, Rotation.Z)
            if Spinning then
                local randomX = math.rad(math.random(-20, 30)) * 4
                local randomY = math.rad(math.random(-30, 10)) * 3
                local randomZ = math.rad(math.random(-50, 20)) * 2
                rotationCFrame *= CFrame.Angles(randomX, randomY, randomZ) -- i had this twice in the same line lol. its removed now
            else
                rotationCFrame = CFrame.Angles(Rotation.X, Rotation.Y, Rotation.Z)
            end
            ForcedParts[HeldPart].AnchorPart.CFrame = CFrame.new(goalPos) * rotationCFrame
            --ForcedParts[part].AnchorPart.CFrame = CFrame.new(goalPos)
		end)
	end)
	MouseUpConn = Mouse.Button1Up:Connect(function()
        --[[if HeldModel then
            ChangeCollisionOfModel(HeldModel, true)
        end]]
        HeldModel = nil
        HeldPart = nil
        TelekinesisDistance = 25
        MinDistance = 10
        MaxDistance = 900
        DistanceStep = 10
		if TelekinesisConn then
			TelekinesisConn:Disconnect()
			TelekinesisConn = nil
		end
        if InputConn then
            InputConn:Disconnect()
            InputConn = nil
        end
	end)
end


local function DisableTelekinesis()
	TelekinesisEnabled = false
    TelekinesisDistance = 25
    MinDistance = 10
    MaxDistance = 900
    DistanceStep = 10
	if TelekinesisConn then TelekinesisConn:Disconnect() end
	if MouseDownConn then MouseDownConn:Disconnect() end
	if MouseUpConn then MouseUpConn:Disconnect() end
    if InputConn then InputConn:Disconnect() end
	HeldPart = nil
    if HeldModel then
        --ChangeCollisionOfModel(HeldModel, true)
    end
    HeldModel = nil
end

local bodyVelocities = {}
local function PartsRepellent()
    Connect("Repell", RunService.Heartbeat, function()
        local radius = 10
        local origin = getRoot(LocalPlayer).Position

        local region = Region3.new(origin - Vector3.new(radius, radius, radius), origin + Vector3.new(radius, radius, radius))

        local partsInRadius = workspace:FindPartsInRegion3(region, nil, math.huge) -- i should use getpartsinboundradius or smth like that, i dont remember how its called

        for _, part in pairs(partsInRadius) do
            if not part.Anchored and not part:IsDescendantOf(getChar(LocalPlayer)) then
                local dir = (part.Position - origin).Unit

                local newPos = part.Position + dir * 10

                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bodyVelocity.Velocity = dir * 50
                bodyVelocity.Parent = part
                bodyVelocities[part] = bodyVelocity
            end
        end

        for part, bodyVelocity in pairs(bodyVelocities) do
            local dist = (part.Position - origin).Magnitude

            if dist > radius then
                bodyVelocity:Destroy() -- ts doesnt really works as intended. it still keeps moving forward (yes, ik how to fix it. just set the velocity and max force to 0 (i think))
                bodyVelocities[part] = nil
            end
        end
    end)
end

local function MovePart(part, cframe)
    ForcePart(part)
    ForcedParts[part].AnchorPart.CFrame = cframe
end

local function MoveAllParts(cframe)
    for i, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Anchored and not Players:GetPlayerFromCharacter(v) then
            MovePart(v, cframe)
        end
    end
end

local function CreateInvisibleRig()
    local rig = Players:CreateHumanoidModelFromDescription(Players:GetHumanoidDescriptionFromUserId(LocalPlayer.UserId), Enum.HumanoidRigType.R6)
    rig.HumanoidRootPart.CFrame = getRoot(LocalPlayer).CFrame
    permaDeath(true)
    rig.Parent = game:GetService("Workspace")
    LocalPlayer.Character = rig
    rig.Name = LocalPlayer.Name .. "__fake"
    changeCameraSubject(rig.Humanoid)
    return rig
end

local MainWindow = CreateWindow("Window", 0, "LUNA Hub", "powered by Rayfield", "Hub", "Default", Enum.KeyCode.RightAlt)

-- Replicate signal stuff
if replicatesignal then
    local ReplicateTab = Tab(MainWindow, "Replicate signal")
    local InstantRespawn = Button(ReplicateTab, "Instant respawn", function()
        permaDeath(false)
    end)
    local BreakJoints = Button(ReplicateTab, "Break joints", function()
        replicatesignal(getHumanoid(LocalPlayer).ServerBreakJoints)
    end)
    local PermaDeath = Toggle(ReplicateTab, "Perma death", false, "PermaDeath", function(Value)
        if Value == true then
            permaDeath(true)
        else
            permaDeath()
        end
    end)
    local InvisibleRig = Toggle(ReplicateTab, "Invisible rig", false, "InvisibleRig", function(Value)
        local rig
        if Value == true then
            rig = CreateInvisibleRig()
        else
            if rig then
                rig:Destroy()
            end
            permaDeath()
        end
    end)
end

--Players stuff
-- holy unoptimized code
local PlayerTab = Tab(MainWindow, "Player")

local selectedPlayer = nil
local PlayerSelector = Dropdown(PlayerTab, "Player", getPlayers(), getPlayers()[LocalPlayer.Name], false, "TPSelector", function(Options)
    selectedPlayer = Options[1]
end)

local TPPlayer = Button(PlayerTab, "Tp", function()
    local root = getRoot(Players:FindFirstChild(selectedPlayer))
    if not root then return end
    getRoot(LocalPlayer).CFrame = root.CFrame
end)

Players.PlayerAdded:Connect(function()
    PlayerSelector:Refresh(getPlayers())
end)

Players.PlayerRemoving:Connect(function()
    PlayerSelector:Refresh(getPlayers())
end)

--Local player stuff
-- even more unoptimized
local LocalPlayerTab = Tab(MainWindow, "Local player")

local Speed
local BaseSpeed = getHumanoid(LocalPlayer).WalkSpeed
local SpeedSelector = Slider(LocalPlayerTab, "Speed", {0, 200}, 10, "Speed", BaseSpeed, "SpeedSelector", function(Value)
    Speed = Value
end)
local SpeedToggle = Toggle(LocalPlayerTab, "Toggle speed", false, "SpeedToggle", function(Value)
    if Value == true then
        getHumanoid(LocalPlayer).WalkSpeed = Speed
    else
        getHumanoid(LocalPlayer).WalkSpeed = BaseSpeed
    end
end)

local JumpPower
local BaseJumpPower = getHumanoid(LocalPlayer).JumpPower
local JumpPowerSelector = Slider(LocalPlayerTab, "Jump power", {0, 200}, 10, "jump power", BaseJumpPower, "JumpSelector", function(Value)
    JumpPower = Value
end)
local JumpPowerToggle = Toggle(LocalPlayerTab, "Toggle jump power", false, "JumpToggle", function(Value)
    if Value == true then
        getHumanoid(LocalPlayer).JumpPower = JumpPower
    else
        getHumanoid(LocalPlayer).JumpPower = BaseJumpPower
    end
end)

local ToggleCollisions = Toggle(LocalPlayerTab, "Toggle collisions", false, "CollisionToggle", function(Value)
    if Value == true then
        Connect("Collision", RunService.Heartbeat, function() -- i shouldnt use runservice here... i just added it cause my torso kept changing its collision to true
            ChangeCollisionOfModel(getChar(LocalPlayer), false)
        end)
    else
        Disconnect("Collision")
        ChangeCollisionOfModel(getChar(LocalPlayer), true)
    end
end)


local ToggleAntiFling = Toggle(LocalPlayerTab, "Antifling", false, "AntiFlingToggle", function(Value)
    if Value == true then
        Connect("AntiFling", RunService.Heartbeat, function() -- the same here ^^
            for _, player in pairs(Players:GetPlayers()) do
                ChangeCollisionOfModel(getChar(player), false)
            end
        end)
    else
        Disconnect("AntiFling")
        for _, player in pairs(Players:GetPlayers()) do
            ChangeCollisionOfModel(getChar(player), true)
        end
    end
end)

--Network stuff
local NetworkTab = Tab(MainWindow, "Network")

local TelekinesisToggle = Toggle(NetworkTab, "Telekinesis", false, "TelekinesisToggle", function(Value)
    if Value == true then
        EnableTelekinesis()
    else
        DisableTelekinesis()
    end
end)

local PartsRepellentToggle = Toggle(NetworkTab, "Women (parts) repellent", false, "PartsRepellentToggle", function(Value)
    if Value == true then
        PartsRepellent()
    else
        Disconnect("Repell")
    end
end)

--[[local MoveAllPartsToPlayerLoop = Toggle(NetworkTab, "Loop move all parts to player", false, "MoveAllPartsToPlayerLoopToggle", function(Value)
    if Value == true then
        Connect("MoveAllPartsToPlayerLoop", RunService.Heartbeat, function()
            local root = getRoot(Players:FindFirstChild(selectedPlayer))
            if not selectedPlayer then Notify("Error!", "Select a player from player tab") Disconnect("MoveAllPartsToPlayerLoop") end
            if not root then Notify("Error!", "RootPart not found") Disconnect("MoveAllPartsToPlayerLoop") end
            MoveAllParts(root.CFrame)
        end)
    else
        Disconnect("MoveAllPartsToPlayerLoop")
    end
end)]]

--[[local MoveAllPartsToPlayer = Button(NetworkTab, "Move all parts to player", function()
    local root = getRoot(Players:FindFirstChild(selectedPlayer))
    if not selectedPlayer then Notify("Error!", "Select a player from player tab") end
    if not root then Notify("Error!", "RootPart not found") end

    MoveAllParts(root.CFrame)
end)]]

--[[if game.GameId == 7326934954 then -- i did this like a month ago, forgot about it and i dont want to touch it. i also have code for another game in another hub i made for me, im not adding it here cause the devs and mods from that game are my friends :)
    local NightsTab = Tab(MainWindow, "99 Nights")
	local CampFire = game:GetService("Workspace"):FindFirstChild("Map"):FindFirstChild("Campground"):FindFirstChild("MainFire")
	local Items = game:GetService("Workspace"):FindFirstChild("Items")
	local FuelRemaining = CampFire:GetAttribute("FuelRemaining")
	local FuelTarget = CampFire:GetAttribute("FuelTarget")
    local BringAll = Button(NightsTab, "Bring all", function()
        for i, v in pairs(Items:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
                if not v.Anchored and v:FindFirstAncestorOfClass("Model").PrimaryPart == v then
                    ForcePart(v)
                    ForcedParts[v].AnchorPart.CFrame = getRoot(LocalPlayer).CFrame + Vector3.new(0, 10, 0)
                    task.spawn(function()
                        task.wait(.5)
                        for _, joint in pairs(ForcedParts[v]) do
                            v.CanCollide = true
                            joint:Destroy()
                        end
                    end)
                end
            end
        end
    end)
end
]]
