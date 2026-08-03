
-- [[ Luraph Macros ]]

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = function(...) return(...) end;
	LPH_NO_VIRTUALIZE = function(...) return(...) end;
    LRM_IsUserPremium = true;
	script_key = "a"
end

-- [[ Settings + Stats ]]

if getgenv().Enabled == nil then
	getgenv().Enabled = true
end

if getgenv().StartingTime == nil then
	getgenv().StartingTime = os.time()
end

if getgenv().StartingMoney == nil then
	getgenv().StartingMoney = game:GetService("Players").LocalPlayer.leaderstats.Money.Value 
end

if getgenv().Advertise == nil then
	getgenv().Advertise = false
end

if getgenv().PickUpCash == nil then
	getgenv().PickUpCash = true
end

if getgenv().Mobile == nil then
	getgenv().Mobile = false
end

if getgenv().RobCrate == nil then
	getgenv().RobCrate = true
end

if getgenv().RobShip == nil then
	getgenv().RobShip = true
end

if getgenv().RobMansion == nil then
	getgenv().RobMansion = true
end

if getgenv().AutoOpenSafes == nil then
	getgenv().AutoOpenSafes = false
end

if getgenv().LogWebhook == nil then
	getgenv().LogWebhook = false
end

if getgenv().WebhookUrl == nil then
	getgenv().WebhookUrl = ""
end

-- [[ Check If Executed ]]

if getgenv().Dropfarm == true then print("// Already executed [Dropfarm]") return end

-- [[ Set Executed ]]

getgenv().Dropfarm = true

-- [[ Directory ]]

local Directory = "FarmHub"
if not isfolder(Directory) then
	makefolder(Directory)
end

-- [[ Queuening + UI ]]

local MoneyMade, RunTime = 0, 0
local queue = ""
local queued = false
local ui_options = {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(400, 300),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
}

-- [[ Formating functions ]]

function TickToHM(seconds)
	local minutes = math.floor(seconds / 60)
	seconds = seconds % 60
	local hours = math.floor(minutes / 60)
	minutes = minutes % 60

	return hours .. "h/" .. minutes .. "m"
end

function FormatCash(number)
	local totalnum = tostring(number):split("")

	if #totalnum == 7 then
		return totalnum[1].."."..totalnum[2].."M"
	elseif #totalnum >= 10 then
		return totalnum[1].."."..totalnum[2].."B"
	elseif #totalnum == 4 and #totalnum[2] == 0 then
		return totalnum[1].."k"
	elseif #totalnum == 4  then
		return totalnum[1].."."..totalnum[2].."k"
	elseif #totalnum == 5  then
		return totalnum[1]..totalnum[2].."."..totalnum[3].."k"
	elseif #totalnum == 6  then
		return totalnum[1]..totalnum[2]..totalnum[3].."k"
	else
		return number
	end
end

-- [[ Webhook ]]

local SentWebhookServerhop = false

-- [[ Important modules ]]

local Services = setmetatable({}, {
	__index = function(self, service)
		return game:GetService(service)
	end
})

local Players = Services.Players
local HttpService = Services.HttpService
local Lighting = Services.Lighting
local ReplicatedStorage = Services.ReplicatedStorage
local PathfindingService = Services.PathfindingService
local RunService = Services.RunService
local TeleportService = Services.TeleportService
local CoreGui = Services.CoreGui

-- [[ Config ]]

local config = {
	HeliSpeed = 700,
	VehicleSpeed = 650,
	FlightSpeed = 150,
	PathSpeed = 45
}

if LRM_IsUserPremium then
    config.HeliSpeed = 5000
	config.VehicleSpeed = 650
	config.FlightSpeed = 175
	config.PathSpeed = 180
end

-- [[ Resume shit ]]

local Modules = {
	Vehicle = require(ReplicatedStorage.Vehicle.VehicleUtils),
	SidebarUI = require(ReplicatedStorage.Game.SidebarUI),
	DefaultActions = require(ReplicatedStorage.Game.DefaultActions),
	ItemSystem = require(ReplicatedStorage.Game.ItemSystem.ItemSystem),
	GunItem = require(ReplicatedStorage.Game.Item.Gun),
	PlayerUtils = require(ReplicatedStorage.Game.PlayerUtils),
	Paraglide = require(ReplicatedStorage.Game.Paraglide),
	CharUtils = require(ReplicatedStorage.Game.CharacterUtil),
	Notification = require(ReplicatedStorage.Game.Notification),
	PuzzleFlow = require(ReplicatedStorage.Game.Robbery.PuzzleFlow),
	Heli = require(ReplicatedStorage.Game.Vehicle.Heli),
	Raycast = require(ReplicatedStorage.Module.RayCast),
	UI = require(ReplicatedStorage.Module.UI),
	GunShopUI = require(ReplicatedStorage.Game.GunShop.GunShopUI),
	GunShopUtils = require(ReplicatedStorage.Game.GunShop.GunShopUtils),
	AlexChassis = require(ReplicatedStorage.Module.AlexChassis),
	Store = require(ReplicatedStorage.App.store),
	TagUtils = require(ReplicatedStorage.Tag.TagUtils),
	RobberyConsts = require(ReplicatedStorage.Robbery.RobberyConsts),
	NpcShared = require(ReplicatedStorage.GuardNPC.GuardNPCShared),
	Npc = require(ReplicatedStorage.NPC.NPC),
	SafeConsts = require(ReplicatedStorage.Safes.SafesConsts),
	MansionUtils = require(ReplicatedStorage.MansionRobbery.MansionRobberyUtils),
	BossConsts = require(ReplicatedStorage.MansionRobbery.BossNPCConsts),
	BulletEmitter = require(ReplicatedStorage.Game.ItemSystem.BulletEmitter),
	EquipThing = ReplicatedStorage.Inventory.InventoryItem
}

-- [[ Ray + Vehicle vars ]]

local GetVehiclePacket = Modules.Vehicle.GetLocalVehiclePacket
local RayIgnore = Modules.Raycast.RayIgnoreNonCollideWithIgnoreList

-- [[ Player Variables ]]

local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local char, root, humanoid, vehicle, vehicleRoot

local UpdatePlayerVars = function()
	char = player.Character
	root = char:WaitForChild('HumanoidRootPart')
	humanoid = char:WaitForChild('Humanoid')
end

local UpdateVehicleVars = function()
	local vehicleModel = Modules.Vehicle.GetLocalVehicleModel()
	if vehicleModel == false then
		vehicle = nil
		vehicleRoot = nil
	else
		vehicle = vehicleModel
		vehicleRoot = vehicle.PrimaryPart
	end
end

if player.Character then UpdatePlayerVars() end

player.characterAdded:Connect(UpdatePlayerVars)
player.characterRemoving:Connect(UpdatePlayerVars)

UpdateVehicleVars()
Modules.Vehicle.OnVehicleEntered:Connect(UpdateVehicleVars)
Modules.Vehicle.OnVehicleExited:Connect(UpdateVehicleVars)

-- [[ Bypass Anticheat ]]

local OverwriteCnt = 0
local ExitFunc = nil 

LPH_NO_VIRTUALIZE(function()
	for i, v in pairs(getgc(true)) do
		if typeof(v) =="function" then
			if debug.info(v, "n"):match("CheatCheck") then
				hookfunction(v, function() end)
			end
		end

		if typeof(v) == "function" and getfenv(v).script == player.PlayerScripts.LocalScript then
			local con = getconstants(v)
			if table.find(con, "LastVehicleExit") and table.find(con, "tick") then
				ExitFunc = v
			end
		end
	end
end)()

-- [[ Remove All Benches ]]

LPH_NO_VIRTUALIZE(function()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Bench" then
			v:Destroy()
		end
	end
end)()

-- [[ Robbery States ]]

local function WaitForReward()
	if player.PlayerGui.AppUI:FindFirstChild("RewardSpinner") then
		repeat 
			task.wait() 
		until not player.PlayerGui.AppUI:FindFirstChild("RewardSpinner")
	end
end

local robberyState = ReplicatedStorage.RobberyState
local robberyConsts = Modules.RobberyConsts

local robberies = {
	mansion = {open = false, hasRobbed = false},
	ship = {open = false, hasRobbed = false},
	plane = {open = false, hasRobbed = false},
	crate = {open = false},
}

local UpdateStatus = function(robbery, var, val, checkStart, special)
	if not robberyState:FindFirstChild(robbery) then robberies[var][val] = false return end
	local status = robberyState:FindFirstChild(robbery).Value
	robberies[var][val] = ((status == 1 and not checkStart) and true) or ((status == 2 and not special) and true) or false
	if val == 'open' and robberies[var][val] == false then robberies[var]['hasRobbed'] = false end
end

coroutine.wrap(LPH_JIT_MAX(function()
	while task.wait() do
		UpdateStatus(robberyConsts.ENUM_ROBBERY.MANSION, 'mansion', 'open', false, true)
		UpdateStatus(robberyConsts.ENUM_ROBBERY.CARGO_SHIP, 'ship', 'open')
		robberies['crate'].open = (game.Workspace:FindFirstChild('Drop') and true) or false
	end
end))()

local function GetClosestAirdrop()
	if game.Workspace:FindFirstChild("Drop") then
		return game.Workspace:FindFirstChild("Drop")
	end

	return nil
end

-- [[ No Falldamage ]]

Modules.TagUtils.isPointInTag = LPH_NO_VIRTUALIZE(function(_, Tag)
	if Tag == 'NoFallDamage' or Tag == 'NoRagdoll' or Tag == 'NoParachute' then
		return true
	end
end)

-- [[ Vehicle stuff ]]

local InHeli = function() return ((vehicle and vehicle.Name == 'Heli') and true) or false end
local InCar = function() return ((vehicle and vehicle.Name == 'Jeep' or "Camaro") and true) or false end

local ExitVehicle = function()
	if player.Character.Humanoid.Health <= 0 or not vehicle then return end
	Modules.CharUtils.OnJump()

	repeat 
		task.wait()  
	until not vehicle or player.Character.Humanoid.Health <= 0
end

-- [[ Rendering ]]

local viableLocations = {
	Vector3.new(-846, 39, -6231), 
	Vector3.new(-1541, 39, 3311), 
	Vector3.new(-363, 39, -6340), 
	Vector3.new(-820, 39, 3306), 
	Vector3.new(44, 39, -6409), 
	Vector3.new(811, 39, 3206), 
	Vector3.new(308, 39, -6350), 
	Vector3.new(979, 39, 3173), 
	Vector3.new(683, 39, -6267), 
	Vector3.new(1303, 39, 3150), 
	Vector3.new(1350, 39, -5764), 
	Vector3.new(1976, 39, 3028), 
	Vector3.new(2698, 39, -5365) 
}

local function LoadMap()
	local originalCameraType = game:GetService("Workspace").CurrentCamera.CameraType
	game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Scriptable
	for _, position in ipairs(viableLocations) do
		local tweenInfo = TweenInfo.new(
			0.6,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.Out,
			0,
			false,
			0
		)

		pcall(function()
			local tween = game:GetService("TweenService"):Create(game:GetService("Workspace").CurrentCamera, tweenInfo, {CFrame = CFrame.new(position)})
			tween:Play() 

			tween.Completed:Wait()
		end)
	end
	game:GetService("Workspace").CurrentCamera.CameraType = originalCameraType
end

-- [[ Gun stuff ]]

local function ShootGun()
	local currentGun = require(game:GetService("ReplicatedStorage").Game:WaitForChild("ItemSystem"):WaitForChild("ItemSystem")).GetLocalEquipped()
	if not currentGun then return end
	require(game:GetService("ReplicatedStorage").Game:WaitForChild("Item"):WaitForChild("Gun"))._attemptShoot(currentGun)
end

local function GetGun()
	local SetThreadId = (setidentity or set_thread_identity or (syn and syn.set_thread_identity) or setthreadcontext or set_thread_context)
	local IsOpen = pcall(Modules.GunShopUI.open)

	SetThreadId(2)
	Modules.GunShopUI.displayList(Modules.GunShopUtils.getCategoryData("Held"))
	SetThreadId(7)

	repeat 
		for i, v in next, Modules.GunShopUI.gui.Container.Container.Main.Container.Slider:GetChildren() do
			if v:IsA("ImageLabel") and v.Name == "AK47" and (v.Bottom.Action.Text == "FREE" or v.Bottom.Action.Text == "EQUIP") then
				firesignal(v.Bottom.Action.MouseButton1Down)
			end
		end    

		task.wait()
	until player.Folder:FindFirstChild("AK47")

	pcall(Modules.GunShopUI.close)
end

-- [[ Teleporting requirements ]]

local heliSpawnPos = {
	Vector3.new(725, 76, 1111),
	Vector3.new(-1255, 46, -1572),
	Vector3.new(840, 24, -3678),
	Vector3.new(-2875, 199, -4059)
}

local GetRoot = function() return (vehicle and vehicleRoot) or root end

local rayDirs = { up = Vector3.new(0, 999, 0), down = Vector3.new(0, -999, 0) }

local function rayCast(pos, dir)
	local ignoreList = {}
	if char then table.insert(ignoreList, char) end
	if vehicle then table.insert(ignoreList, vehicle) end
	local rain = game.Workspace:FindFirstChild('Rain')
	if rain then table.insert(ignoreList, rain) end

	local params = RaycastParams.new()
	params.RespectCanCollide = true
	params.FilterDescendantsInstances = ignoreList
	params.IgnoreWater = true
	local result = game.Workspace:Raycast(pos, dir, params)
	if result then return result.Instance, result.Position else return nil, nil end
end

local function DistanceXZ(firstPos, secondPos)
	local XZVector = Vector3.new(firstPos.X, 0, firstPos.Z) - Vector3.new(secondPos.X, 0, secondPos.Z)

	return XZVector.Magnitude 
end

local ActivateSpec = function(spec)
	spec.Duration = 0
	spec.Timed = true
	spec:Callback(true)
end

local function LagBackCheck(part)
	local ShouldStop = false
	local OldPosition = part.Position
	local Signal = part:GetPropertyChangedSignal("CFrame"):Connect(LPH_NO_VIRTUALIZE(function()
		local CurrentPosition = part.Position

		if DistanceXZ(CurrentPosition, OldPosition) > 7 then
			LaggedBack = true
			task.delay(0.2, function()
				LaggedBack = false
			end)
		end
	end))

	task.spawn(function()
		while part and ShouldStop == false do
			OldPosition = part.Position
			task.wait()
		end
	end)

	return {
		Stop = function()
			ShouldStop = true
			Signal:Disconnect()
		end
	}
end

local GetVehiclePos = LPH_JIT_MAX(function(playerPos)
	playerPos = Vector3.new(playerPos.x, 0, playerPos.z)
	local targetVehicle
	local minDist = math.huge

	for _, vehicle in pairs(game.Workspace.Vehicles:GetChildren()) do
		if vehicle.name ~= 'Heli' then continue end
		if vehicle.Seat.position.y > 300 then continue end
		local pos = vehicle.Seat.Position
		pos = Vector3.new(pos.x, 0, pos.z)
		local dist = (pos - playerPos).Magnitude
		if dist > minDist or dist < 1 then continue end
		local hit, _ = rayCast(vehicle.Seat.Position, rayDirs.up)
		if hit then continue end
		minDist = dist
		targetVehicle = vehicle
	end

	if targetVehicle then return targetVehicle.Seat.Position, targetVehicle end

	local positions = heliSpawnPos
	for _, pos in pairs(positions) do
		local dist = (pos - playerPos).Magnitude
		if dist > minDist or dist < 1 then continue end
		minDist = dist
		targetVehicle = pos
	end

	return targetVehicle, nil
end)

local function NoclipStart()
	local NoclipLoop = LPH_NO_VIRTUALIZE(function()
		pcall(function()
			for i, child in pairs(char:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end)
	end)

	local Noclipper = RunService.Stepped:Connect(NoclipLoop)

	return {
		Stop = function()
			Noclipper:Disconnect()
		end
	}
end

local function IsArrested()
	if player.PlayerGui.MainGui.CellTime.Visible or player.Folder:FindFirstChild("Cuffed") then
		return true
	end

	return false
end

local function FlightMove(pos)
	LPH_NO_VIRTUALIZE(function()
		local LagCheck = LagBackCheck(root)
		local LagbackCount = 0
		local speed = (InHeli() and -config['HeliSpeed']) or (vehicle and -config['VehicleSpeed']) or -config['FlightSpeed']
		local GetPos = function() return Vector3.new(pos.x, 500, pos.z) end
		char:PivotTo(CFrame.new(root.Position.x, 500, root.Position.z))

		local dist = GetRoot().Position - GetPos()
		while dist.Magnitude > 10 do	
			dist = GetRoot().Position - GetPos()
			local velocity = dist.Unit * speed
			velocity = Vector3.new(velocity.x, 0, velocity.z)

			GetRoot().Velocity = velocity
			char:PivotTo(CFrame.new(root.Position.x, 500, root.Position.z))
			task.wait()
		end

		GetRoot().Velocity = Vector3.zero
		char:PivotTo(CFrame.new(GetPos()))
	end)()
end

local function GoToGround()
	while task.wait() do
		local _, pos = rayCast(root.Position, rayDirs.down)
		if pos then 
			char:PivotTo(CFrame.new(root.Position.x, pos.y + 2, root.Position.z)) 
			task.wait(0.3) 
			GetRoot().Velocity = Vector3.zero 
			return 
		end
	end
end

-- [[ Teleporting stuff + Car stuff + Raycasting ]]

local TeleportParams = RaycastParams.new()
local GetVehicleModel = Modules.Vehicle.GetLocalVehicleModel
local Packet = Modules.Vehicle.GetLocalVehiclePacket

local function CheckRaycast(Position, Vector)
	local Raycasted = game.Workspace:Raycast(Position, Vector, TeleportParams)

	return Raycasted ~= nil
end

local function TeleporterC(pos, duration)
	local tper = game:GetService("RunService").Heartbeat:Connect(function()
		vehicleRoot.CFrame = pos
	end)

	wait(duration)

	tper:Disconnect()
end

local function HidePickingTeam()
	local TeamChooseUI = require(game:GetService("ReplicatedStorage").TeamSelect.TeamChooseUI)


	repeat task.wait() pcall(function() TeamChooseUI.Hide() end) until playerGui:FindFirstChild("TeamSelectGui") == nil or playerGui:FindFirstChild("TeamSelectGui").Enabled == false or game:GetService("Players").LocalPlayer.TeamColor == BrickColor.new("Bright red") or player.Character.Humanoid.Health <= 0
end

local function Travel()
	while not vehicle do
		local pos1, targetVehicle = GetVehiclePos(root.Position)
		FlightMove(pos1)
		GoToGround()

		if targetVehicle and targetVehicle.PrimaryPart and (targetVehicle.PrimaryPart.Position - root.Position).Magnitude < 30 then
			for _ = 1, 9 do
				for _, spec in pairs(Modules.UI.CircleAction.Specs) do
					if spec.Part and spec.Part == targetVehicle.Seat then ActivateSpec(spec) end
				end
				task.wait(0.25)
				if vehicle then 
					for i,v in pairs(targetVehicle:GetDescendants()) do
						if v:IsA("Part") or v:IsA("MeshPart") then
							v.CanCollide = false
						end
					end
					break 
				end
			end
		else
			for i, v in next, heliSpawnPos do
				FlightMove(v)
				GoToGround()
				task.wait(1)
				pos1, targetVehicle = GetVehiclePos(root.Position)
				if targetVehicle then
					for i,v in pairs(targetVehicle:GetDescendants()) do
						if v:IsA("Part") or v:IsA("MeshPart") then
							v.CanCollide = false
						end
					end
					break
				end
			end
		end 
		task.wait()
	end
end

local function SmallTP(cframe, speed)
	if not char or not root or IsArrested() then
		return false
	end

	if speed == nil then
		speed = 95
	end

	local IsTargetMoving = type(cframe) == "function"
	local LagCheck = LagBackCheck(root)
	local Noclip = NoclipStart()
	local TargetPos = (IsTargetMoving and cframe() or cframe).Position
	local LagbackCount = 0
	local Success = true

	local Mover = Instance.new("BodyVelocity", root)
	Mover.P = 3000
	Mover.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	repeat
		if not root or humanoid.Health == 0 or IsArrested() then
			Success = false
		else
			TargetPos = (IsTargetMoving and cframe() or cframe).Position
			Mover.Velocity = CFrame.new(root.Position, TargetPos).LookVector * speed

			humanoid:SetStateEnabled("Running", false)
			humanoid:SetStateEnabled("Climbing", false)

			task.wait(0.03) 

			if LaggedBack then
				LagbackCount = LagbackCount + 1
				Mover.Velocity = Vector3.zero
				task.wait(1)

				if LagbackCount == 4 then
					Mover:Destroy()
					Noclip:Stop()
					LagCheck:Stop()

					humanoid.Health = 0
					Success = false
					task.wait(5)
				end
			end
		end
	until (root.Position - TargetPos).Magnitude <= 5 or not Success

	if Success then
		Mover.Velocity = Vector3.new(0, 0, 0)
		TargetPos = (IsTargetMoving and cframe() or cframe).Position
		root.CFrame = CFrame.new(TargetPos)
		task.wait(0.001)

		humanoid:SetStateEnabled("Running", true)
		humanoid:SetStateEnabled("Climbing", true)

		Mover:Destroy()
		Noclip:Stop()
		LagCheck:Stop()
	end

	return Success
end

-- [[ Main Gui ]]

local ui_options = {
	main_color = Color3.fromRGB(191, 86, 127),
	min_size = Vector2.new(400, 365),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
}

do
	local imgui = game:GetService("CoreGui"):FindFirstChild("imgui")
	if imgui then print("// Already Executed! [Dropfarm]") return end
end

local imgui = Instance.new("ScreenGui")
local Prefabs = Instance.new("Frame")
local Label = Instance.new("TextLabel")
local Window = Instance.new("ImageLabel")
local Resizer = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Toggle = Instance.new("ImageButton")
local Base = Instance.new("ImageLabel")
local Top = Instance.new("ImageLabel")
local Tabs = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TabSelection = Instance.new("ImageLabel")
local TabButtons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Frame = Instance.new("Frame")
local Tab = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local TextBox = Instance.new("TextBox")
local TextBox_Roundify_4px = Instance.new("ImageLabel")
local Slider = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local Indicator = Instance.new("ImageLabel")
local Value = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Circle = Instance.new("ImageLabel")
local UIListLayout_3 = Instance.new("UIListLayout")
local Dropdown = Instance.new("TextButton")
local Indicator_2 = Instance.new("ImageLabel")
local Box = Instance.new("ImageButton")
local Objects = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local TextButton_Roundify_4px = Instance.new("ImageLabel")
local TabButton = Instance.new("TextButton")
local TextButton_Roundify_4px_2 = Instance.new("ImageLabel")
local Folder = Instance.new("ImageLabel")
local Button = Instance.new("TextButton")
local TextButton_Roundify_4px_3 = Instance.new("ImageLabel")
local Toggle_2 = Instance.new("ImageLabel")
local Objects_2 = Instance.new("Frame")
local UIListLayout_5 = Instance.new("UIListLayout")
local HorizontalAlignment = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local Console = Instance.new("ImageLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Source = Instance.new("TextBox")
local Comments = Instance.new("TextLabel")
local Globals = Instance.new("TextLabel")
local Keywords = Instance.new("TextLabel")
local RemoteHighlight = Instance.new("TextLabel")
local Strings = Instance.new("TextLabel")
local Tokens = Instance.new("TextLabel")
local Numbers = Instance.new("TextLabel")
local Info = Instance.new("TextLabel")
local Lines = Instance.new("TextLabel")
local ColorPicker = Instance.new("ImageLabel")
local Palette = Instance.new("ImageLabel")
local Indicator_3 = Instance.new("ImageLabel")
local Sample = Instance.new("ImageLabel")
local Saturation = Instance.new("ImageLabel")
local Indicator_4 = Instance.new("Frame")
local Switch = Instance.new("TextButton")
local TextButton_Roundify_4px_4 = Instance.new("ImageLabel")
local Title_3 = Instance.new("TextLabel")
local Button_2 = Instance.new("TextButton")
local TextButton_Roundify_4px_5 = Instance.new("ImageLabel")
local DropdownButton = Instance.new("TextButton")
local Keybind = Instance.new("ImageLabel")
local Title_4 = Instance.new("TextLabel")
local Input = Instance.new("TextButton")
local Input_Roundify_4px = Instance.new("ImageLabel")
local Windows = Instance.new("Frame")

imgui.Name = "imgui"
imgui.Parent = game:GetService("CoreGui")

Prefabs.Name = "Prefabs"
Prefabs.Parent = imgui
Prefabs.BackgroundColor3 = Color3.new(1, 1, 1)
Prefabs.Size = UDim2.new(0, 100, 0, 100)
Prefabs.Visible = false

Label.Name = "Label"
Label.Parent = Prefabs
Label.BackgroundColor3 = Color3.new(1, 1, 1)
Label.BackgroundTransparency = 1
Label.Size = UDim2.new(0, 200, 0, 20)
Label.Font = Enum.Font.GothamSemibold
Label.Text = "Hello, world 123"
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextSize = 14
Label.TextXAlignment = Enum.TextXAlignment.Left

Window.Name = "Window"
Window.Parent = Prefabs
Window.Active = true
Window.BackgroundColor3 = Color3.new(1, 1, 1)
Window.BackgroundTransparency = 1
Window.ClipsDescendants = true
Window.Position = UDim2.new(0, 20, 0, 20)
Window.Selectable = true
Window.Size = UDim2.new(0, 200, 0, 200)
Window.Image = "rbxassetid://2851926732"
Window.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
Window.ScaleType = Enum.ScaleType.Slice
Window.SliceCenter = Rect.new(12, 12, 12, 12)

Resizer.Name = "Resizer"
Resizer.Parent = Window
Resizer.Active = true
Resizer.BackgroundColor3 = Color3.new(1, 1, 1)
Resizer.BackgroundTransparency = 1
Resizer.BorderSizePixel = 0
Resizer.Position = UDim2.new(1, -20, 1, -20)
Resizer.Size = UDim2.new(0, 20, 0, 20)

Bar.Name = "Bar"
Bar.Parent = Window
Bar.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 0, 0, 5)
Bar.Size = UDim2.new(1, 0, 0, 15)

Toggle.Name = "Toggle"
Toggle.Parent = Bar
Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle.BackgroundTransparency = 1
Toggle.Position = UDim2.new(0, 5, 0, -2)
Toggle.Rotation = 90
Toggle.Size = UDim2.new(0, 20, 0, 20)
Toggle.ZIndex = 2
Toggle.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

Base.Name = "Base"
Base.Parent = Bar
Base.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Base.BorderSizePixel = 0
Base.Position = UDim2.new(0, 0, 0.800000012, 0)
Base.Size = UDim2.new(1, 0, 0, 10)
Base.Image = "rbxassetid://2851926732"
Base.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Base.ScaleType = Enum.ScaleType.Slice
Base.SliceCenter = Rect.new(12, 12, 12, 12)

Top.Name = "Top"
Top.Parent = Bar
Top.BackgroundColor3 = Color3.new(1, 1, 1)
Top.BackgroundTransparency = 1
Top.Position = UDim2.new(0, 0, 0, -5)
Top.Size = UDim2.new(1, 0, 0, 10)
Top.Image = "rbxassetid://2851926732"
Top.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Top.ScaleType = Enum.ScaleType.Slice
Top.SliceCenter = Rect.new(12, 12, 12, 12)

Tabs.Name = "Tabs"
Tabs.Parent = Window
Tabs.BackgroundColor3 = Color3.new(1, 1, 1)
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0, 15, 0, 60)
Tabs.Size = UDim2.new(1, -30, 1, -60)

Title.Name = "Title"
Title.Parent = Window
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 30, 0, 3)
Title.Size = UDim2.new(0, 200, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gamer Time"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

TabSelection.Name = "TabSelection"
TabSelection.Parent = Window
TabSelection.BackgroundColor3 = Color3.new(1, 1, 1)
TabSelection.BackgroundTransparency = 1
TabSelection.Position = UDim2.new(0, 15, 0, 30)
TabSelection.Size = UDim2.new(1, -30, 0, 25)
TabSelection.Visible = false
TabSelection.Image = "rbxassetid://2851929490"
TabSelection.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
TabSelection.ScaleType = Enum.ScaleType.Slice
TabSelection.SliceCenter = Rect.new(4, 4, 4, 4)

TabButtons.Name = "TabButtons"
TabButtons.Parent = TabSelection
TabButtons.BackgroundColor3 = Color3.new(1, 1, 1)
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 1, 0)

UIListLayout.Parent = TabButtons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

Frame.Parent = TabSelection
Frame.BackgroundColor3 = Color3.new(0.12549, 0.227451, 0.372549)
Frame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 1, 0)
Frame.Size = UDim2.new(1, 0, 0, 2)

Tab.Name = "Tab"
Tab.Parent = Prefabs
Tab.BackgroundColor3 = Color3.new(1, 1, 1)
Tab.BackgroundTransparency = 1
Tab.Size = UDim2.new(1, 0, 1, 0)
Tab.Visible = false

UIListLayout_2.Parent = Tab
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

TextBox.Parent = Prefabs
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundTransparency = 1
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(1, 0, 0, 20)
TextBox.ZIndex = 2
TextBox.Font = Enum.Font.GothamSemibold
TextBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
TextBox.PlaceholderText = "Input Text"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TextBox.TextSize = 14

TextBox_Roundify_4px.Name = "TextBox_Roundify_4px"
TextBox_Roundify_4px.Parent = TextBox
TextBox_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox_Roundify_4px.BackgroundTransparency = 1
TextBox_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
TextBox_Roundify_4px.Image = "rbxassetid://2851929490"
TextBox_Roundify_4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextBox_Roundify_4px.ScaleType = Enum.ScaleType.Slice
TextBox_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

Slider.Name = "Slider"
Slider.Parent = Prefabs
Slider.BackgroundColor3 = Color3.new(1, 1, 1)
Slider.BackgroundTransparency = 1
Slider.Position = UDim2.new(0, 0, 0.178571433, 0)
Slider.Size = UDim2.new(1, 0, 0, 20)
Slider.Image = "rbxassetid://2851929490"
Slider.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
Slider.ScaleType = Enum.ScaleType.Slice
Slider.SliceCenter = Rect.new(4, 4, 4, 4)

Title_2.Name = "Title"
Title_2.Parent = Slider
Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
Title_2.BackgroundTransparency = 1
Title_2.Position = UDim2.new(0.5, 0, 0.5, -10)
Title_2.Size = UDim2.new(0, 0, 0, 20)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Slider"
Title_2.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_2.TextSize = 14

Indicator.Name = "Indicator"
Indicator.Parent = Slider
Indicator.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator.BackgroundTransparency = 1
Indicator.Size = UDim2.new(0, 0, 0, 20)
Indicator.Image = "rbxassetid://2851929490"
Indicator.ImageColor3 = Color3.new(0.254902, 0.262745, 0.278431)
Indicator.ScaleType = Enum.ScaleType.Slice
Indicator.SliceCenter = Rect.new(4, 4, 4, 4)

Value.Name = "Value"
Value.Parent = Slider
Value.BackgroundColor3 = Color3.new(1, 1, 1)
Value.BackgroundTransparency = 1
Value.Position = UDim2.new(1, -55, 0.5, -10)
Value.Size = UDim2.new(0, 50, 0, 20)
Value.Font = Enum.Font.GothamBold
Value.Text = "0%"
Value.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Value.TextSize = 14

TextLabel.Parent = Slider
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(1, -20, -0.75, 0)
TextLabel.Size = UDim2.new(0, 26, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "]"
TextLabel.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextLabel.TextSize = 14

TextLabel_2.Parent = Slider
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(1, -65, -0.75, 0)
TextLabel_2.Size = UDim2.new(0, 26, 0, 50)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "["
TextLabel_2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextLabel_2.TextSize = 14

Circle.Name = "Circle"
Circle.Parent = Prefabs
Circle.BackgroundColor3 = Color3.new(1, 1, 1)
Circle.BackgroundTransparency = 1
Circle.Image = "rbxassetid://266543268"
Circle.ImageTransparency = 0.5

UIListLayout_3.Parent = Prefabs
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 20)

Dropdown.Name = "Dropdown"
Dropdown.Parent = Prefabs
Dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
Dropdown.BackgroundTransparency = 1
Dropdown.BorderSizePixel = 0
Dropdown.Position = UDim2.new(-0.055555556, 0, 0.0833333284, 0)
Dropdown.Size = UDim2.new(0, 200, 0, 20)
Dropdown.ZIndex = 2
Dropdown.Font = Enum.Font.GothamBold
Dropdown.Text = "      Dropdown"
Dropdown.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Dropdown.TextSize = 14
Dropdown.TextXAlignment = Enum.TextXAlignment.Left

Indicator_2.Name = "Indicator"
Indicator_2.Parent = Dropdown
Indicator_2.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_2.BackgroundTransparency = 1
Indicator_2.Position = UDim2.new(0.899999976, -10, 0.100000001, 0)
Indicator_2.Rotation = -90
Indicator_2.Size = UDim2.new(0, 15, 0, 15)
Indicator_2.ZIndex = 2
Indicator_2.Image = ""

Box.Name = "Box"
Box.Parent = Dropdown
Box.BackgroundColor3 = Color3.new(1, 1, 1)
Box.BackgroundTransparency = 1
Box.Position = UDim2.new(0, 0, 0, 25)
Box.Size = UDim2.new(1, 0, 0, 150)
Box.ZIndex = 3
Box.Image = "rbxassetid://2851929490"
Box.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
Box.ScaleType = Enum.ScaleType.Slice
Box.SliceCenter = Rect.new(4, 4, 4, 4)

Objects.Name = "Objects"
Objects.Parent = Box
Objects.BackgroundColor3 = Color3.new(1, 1, 1)
Objects.BackgroundTransparency = 1
Objects.BorderSizePixel = 0
Objects.Size = UDim2.new(1, 0, 1, 0)
Objects.ZIndex = 3
Objects.CanvasSize = UDim2.new(0, 0, 0, 0)
Objects.ScrollBarThickness = 8

UIListLayout_4.Parent = Objects
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

TextButton_Roundify_4px.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px.Parent = Dropdown
TextButton_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px.BackgroundTransparency = 1
TextButton_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextButton_Roundify_4px.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

TabButton.Name = "TabButton"
TabButton.Parent = Prefabs
TabButton.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TabButton.BackgroundTransparency = 1
TabButton.BorderSizePixel = 0
TabButton.Position = UDim2.new(0.185185179, 0, 0, 0)
TabButton.Size = UDim2.new(0, 71, 0, 20)
TabButton.ZIndex = 2
TabButton.Font = Enum.Font.GothamSemibold
TabButton.Text = "Test tab"
TabButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TabButton.TextSize = 14

TextButton_Roundify_4px_2.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_2.Parent = TabButton
TextButton_Roundify_4px_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_2.BackgroundTransparency = 1
TextButton_Roundify_4px_2.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_2.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_2.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextButton_Roundify_4px_2.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_2.SliceCenter = Rect.new(4, 4, 4, 4)

Folder.Name = "Folder"
Folder.Parent = Prefabs
Folder.BackgroundColor3 = Color3.new(1, 1, 1)
Folder.BackgroundTransparency = 1
Folder.Position = UDim2.new(0, 0, 0, 50)
Folder.Size = UDim2.new(1, 0, 0, 20)
Folder.Image = "rbxassetid://2851929490"
Folder.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
Folder.ScaleType = Enum.ScaleType.Slice
Folder.SliceCenter = Rect.new(4, 4, 4, 4)

Button.Name = "Button"
Button.Parent = Folder
Button.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Button.BackgroundTransparency = 1
Button.BorderSizePixel = 0
Button.Size = UDim2.new(1, 0, 0, 20)
Button.ZIndex = 2
Button.Font = Enum.Font.GothamSemibold
Button.Text = "      Folder"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 14
Button.TextXAlignment = Enum.TextXAlignment.Left

TextButton_Roundify_4px_3.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_3.Parent = Button
TextButton_Roundify_4px_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_3.BackgroundTransparency = 1
TextButton_Roundify_4px_3.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_3.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_3.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_3.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_3.SliceCenter = Rect.new(4, 4, 4, 4)

Toggle_2.Name = "Toggle"
Toggle_2.Parent = Button
Toggle_2.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle_2.BackgroundTransparency = 1
Toggle_2.Position = UDim2.new(0, 5, 0, 0)
Toggle_2.Size = UDim2.new(0, 20, 0, 20)
Toggle_2.Image = ""

Objects_2.Name = "Objects"
Objects_2.Parent = Folder
Objects_2.BackgroundColor3 = Color3.new(1, 1, 1)
Objects_2.BackgroundTransparency = 1
Objects_2.Position = UDim2.new(0, 10, 0, 25)
Objects_2.Size = UDim2.new(1, -10, 1, -25)
Objects_2.Visible = false

UIListLayout_5.Parent = Objects_2
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 5)

HorizontalAlignment.Name = "HorizontalAlignment"
HorizontalAlignment.Parent = Prefabs
HorizontalAlignment.BackgroundColor3 = Color3.new(1, 1, 1)
HorizontalAlignment.BackgroundTransparency = 1
HorizontalAlignment.Size = UDim2.new(1, 0, 0, 20)

UIListLayout_6.Parent = HorizontalAlignment
UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.Padding = UDim.new(0, 5)

Console.Name = "Console"
Console.Parent = Prefabs
Console.BackgroundColor3 = Color3.new(1, 1, 1)
Console.BackgroundTransparency = 1
Console.Size = UDim2.new(1, 0, 0, 200)
Console.Image = "rbxassetid://2851928141"
Console.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
Console.ScaleType = Enum.ScaleType.Slice
Console.SliceCenter = Rect.new(8, 8, 8, 8)

ScrollingFrame.Parent = Console
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 1)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 4

Source.Name = "Source"
Source.Parent = ScrollingFrame
Source.BackgroundColor3 = Color3.new(1, 1, 1)
Source.BackgroundTransparency = 1
Source.Position = UDim2.new(0, 40, 0, 0)
Source.Size = UDim2.new(1, -40, 0, 10000)
Source.ZIndex = 3
Source.ClearTextOnFocus = false
Source.Font = Enum.Font.Code
Source.MultiLine = true
Source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
Source.Text = ""
Source.TextColor3 = Color3.new(1, 1, 1)
Source.TextSize = 15
Source.TextStrokeColor3 = Color3.new(1, 1, 1)
Source.TextWrapped = true
Source.TextXAlignment = Enum.TextXAlignment.Left
Source.TextYAlignment = Enum.TextYAlignment.Top

Comments.Name = "Comments"
Comments.Parent = Source
Comments.BackgroundColor3 = Color3.new(1, 1, 1)
Comments.BackgroundTransparency = 1
Comments.Size = UDim2.new(1, 0, 1, 0)
Comments.ZIndex = 5
Comments.Font = Enum.Font.Code
Comments.Text = ""
Comments.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
Comments.TextSize = 15
Comments.TextXAlignment = Enum.TextXAlignment.Left
Comments.TextYAlignment = Enum.TextYAlignment.Top

Globals.Name = "Globals"
Globals.Parent = Source
Globals.BackgroundColor3 = Color3.new(1, 1, 1)
Globals.BackgroundTransparency = 1
Globals.Size = UDim2.new(1, 0, 1, 0)
Globals.ZIndex = 5
Globals.Font = Enum.Font.Code
Globals.Text = ""
Globals.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
Globals.TextSize = 15
Globals.TextXAlignment = Enum.TextXAlignment.Left
Globals.TextYAlignment = Enum.TextYAlignment.Top

Keywords.Name = "Keywords"
Keywords.Parent = Source
Keywords.BackgroundColor3 = Color3.new(1, 1, 1)
Keywords.BackgroundTransparency = 1
Keywords.Size = UDim2.new(1, 0, 1, 0)
Keywords.ZIndex = 5
Keywords.Font = Enum.Font.Code
Keywords.Text = ""
Keywords.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
Keywords.TextSize = 15
Keywords.TextXAlignment = Enum.TextXAlignment.Left
Keywords.TextYAlignment = Enum.TextYAlignment.Top

RemoteHighlight.Name = "RemoteHighlight"
RemoteHighlight.Parent = Source
RemoteHighlight.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteHighlight.BackgroundTransparency = 1
RemoteHighlight.Size = UDim2.new(1, 0, 1, 0)
RemoteHighlight.ZIndex = 5
RemoteHighlight.Font = Enum.Font.Code
RemoteHighlight.Text = ""
RemoteHighlight.TextColor3 = Color3.new(0, 0.568627, 1)
RemoteHighlight.TextSize = 15
RemoteHighlight.TextXAlignment = Enum.TextXAlignment.Left
RemoteHighlight.TextYAlignment = Enum.TextYAlignment.Top

Strings.Name = "Strings"
Strings.Parent = Source
Strings.BackgroundColor3 = Color3.new(1, 1, 1)
Strings.BackgroundTransparency = 1
Strings.Size = UDim2.new(1, 0, 1, 0)
Strings.ZIndex = 5
Strings.Font = Enum.Font.Code
Strings.Text = ""
Strings.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
Strings.TextSize = 15
Strings.TextXAlignment = Enum.TextXAlignment.Left
Strings.TextYAlignment = Enum.TextYAlignment.Top

Tokens.Name = "Tokens"
Tokens.Parent = Source
Tokens.BackgroundColor3 = Color3.new(1, 1, 1)
Tokens.BackgroundTransparency = 1
Tokens.Size = UDim2.new(1, 0, 1, 0)
Tokens.ZIndex = 5
Tokens.Font = Enum.Font.Code
Tokens.Text = ""
Tokens.TextColor3 = Color3.new(1, 1, 1)
Tokens.TextSize = 15
Tokens.TextXAlignment = Enum.TextXAlignment.Left
Tokens.TextYAlignment = Enum.TextYAlignment.Top

Numbers.Name = "Numbers"
Numbers.Parent = Source
Numbers.BackgroundColor3 = Color3.new(1, 1, 1)
Numbers.BackgroundTransparency = 1
Numbers.Size = UDim2.new(1, 0, 1, 0)
Numbers.ZIndex = 4
Numbers.Font = Enum.Font.Code
Numbers.Text = ""
Numbers.TextColor3 = Color3.new(1, 0.776471, 0)
Numbers.TextSize = 15
Numbers.TextXAlignment = Enum.TextXAlignment.Left
Numbers.TextYAlignment = Enum.TextYAlignment.Top

Info.Name = "Info"
Info.Parent = Source
Info.BackgroundColor3 = Color3.new(1, 1, 1)
Info.BackgroundTransparency = 1
Info.Size = UDim2.new(1, 0, 1, 0)
Info.ZIndex = 5
Info.Font = Enum.Font.Code
Info.Text = ""
Info.TextColor3 = Color3.new(0, 0.635294, 1)
Info.TextSize = 15
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.TextYAlignment = Enum.TextYAlignment.Top

Lines.Name = "Lines"
Lines.Parent = ScrollingFrame
Lines.BackgroundColor3 = Color3.new(1, 1, 1)
Lines.BackgroundTransparency = 1
Lines.BorderSizePixel = 0
Lines.Size = UDim2.new(0, 40, 0, 10000)
Lines.ZIndex = 4
Lines.Font = Enum.Font.Code
Lines.Text = "1\n"
Lines.TextColor3 = Color3.new(1, 1, 1)
Lines.TextSize = 15
Lines.TextWrapped = true
Lines.TextYAlignment = Enum.TextYAlignment.Top

ColorPicker.Name = "ColorPicker"
ColorPicker.Parent = Prefabs
ColorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
ColorPicker.BackgroundTransparency = 1
ColorPicker.Size = UDim2.new(0, 180, 0, 110)
ColorPicker.Image = "rbxassetid://2851929490"
ColorPicker.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
ColorPicker.ScaleType = Enum.ScaleType.Slice
ColorPicker.SliceCenter = Rect.new(4, 4, 4, 4)

Palette.Name = "Palette"
Palette.Parent = ColorPicker
Palette.BackgroundColor3 = Color3.new(1, 1, 1)
Palette.BackgroundTransparency = 1
Palette.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
Palette.Size = UDim2.new(0, 100, 0, 100)
Palette.Image = "rbxassetid://698052001"
Palette.ScaleType = Enum.ScaleType.Slice
Palette.SliceCenter = Rect.new(4, 4, 4, 4)

Indicator_3.Name = "Indicator"
Indicator_3.Parent = Palette
Indicator_3.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_3.BackgroundTransparency = 1
Indicator_3.Size = UDim2.new(0, 5, 0, 5)
Indicator_3.ZIndex = 2
Indicator_3.Image = "rbxassetid://2851926732"
Indicator_3.ImageColor3 = Color3.new(0, 0, 0)
Indicator_3.ScaleType = Enum.ScaleType.Slice
Indicator_3.SliceCenter = Rect.new(12, 12, 12, 12)

Sample.Name = "Sample"
Sample.Parent = ColorPicker
Sample.BackgroundColor3 = Color3.new(1, 1, 1)
Sample.BackgroundTransparency = 1
Sample.Position = UDim2.new(0.800000012, 0, 0.0500000007, 0)
Sample.Size = UDim2.new(0, 25, 0, 25)
Sample.Image = "rbxassetid://2851929490"
Sample.ScaleType = Enum.ScaleType.Slice
Sample.SliceCenter = Rect.new(4, 4, 4, 4)

Saturation.Name = "Saturation"
Saturation.Parent = ColorPicker
Saturation.BackgroundColor3 = Color3.new(1, 1, 1)
Saturation.Position = UDim2.new(0.649999976, 0, 0.0500000007, 0)
Saturation.Size = UDim2.new(0, 15, 0, 100)
Saturation.Image = "rbxassetid://3641079629"

Indicator_4.Name = "Indicator"
Indicator_4.Parent = Saturation
Indicator_4.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_4.BorderSizePixel = 0
Indicator_4.Size = UDim2.new(0, 20, 0, 2)
Indicator_4.ZIndex = 2

Switch.Name = "Switch"
Switch.Parent = Prefabs
Switch.BackgroundColor3 = Color3.new(1, 1, 1)
Switch.BackgroundTransparency = 1
Switch.BorderSizePixel = 0
Switch.Position = UDim2.new(0.229411766, 0, 0.20714286, 0)
Switch.Size = UDim2.new(0, 20, 0, 20)
Switch.ZIndex = 2
Switch.Font = Enum.Font.SourceSans
Switch.Text = ""
Switch.TextColor3 = Color3.new(1, 1, 1)
Switch.TextSize = 18

TextButton_Roundify_4px_4.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_4.Parent = Switch
TextButton_Roundify_4px_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_4.BackgroundTransparency = 1
TextButton_Roundify_4px_4.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_4.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_4.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_4.ImageTransparency = 0.5
TextButton_Roundify_4px_4.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_4.SliceCenter = Rect.new(4, 4, 4, 4)

Title_3.Name = "Title"
Title_3.Parent = Switch
Title_3.BackgroundColor3 = Color3.new(1, 1, 1)
Title_3.BackgroundTransparency = 1
Title_3.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_3.Size = UDim2.new(0, 20, 0, 20)
Title_3.Font = Enum.Font.GothamSemibold
Title_3.Text = "Switch"
Title_3.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_3.TextSize = 14
Title_3.TextXAlignment = Enum.TextXAlignment.Left

Button_2.Name = "Button"
Button_2.Parent = Prefabs
Button_2.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Button_2.BackgroundTransparency = 1
Button_2.BorderSizePixel = 0
Button_2.Size = UDim2.new(0, 91, 0, 20)
Button_2.ZIndex = 2
Button_2.Font = Enum.Font.GothamSemibold
Button_2.TextColor3 = Color3.new(1, 1, 1)
Button_2.TextSize = 14

TextButton_Roundify_4px_5.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_5.Parent = Button_2
TextButton_Roundify_4px_5.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_5.BackgroundTransparency = 1
TextButton_Roundify_4px_5.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_5.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_5.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_5.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_5.SliceCenter = Rect.new(4, 4, 4, 4)

DropdownButton.Name = "DropdownButton"
DropdownButton.Parent = Prefabs
DropdownButton.BackgroundColor3 = Color3.new(0.129412, 0.133333, 0.141176)
DropdownButton.BorderSizePixel = 0
DropdownButton.Size = UDim2.new(1, 0, 0, 20)
DropdownButton.ZIndex = 3
DropdownButton.Font = Enum.Font.GothamBold
DropdownButton.Text = "      Button"
DropdownButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
DropdownButton.TextSize = 14
DropdownButton.TextXAlignment = Enum.TextXAlignment.Left

Keybind.Name = "Keybind"
Keybind.Parent = Prefabs
Keybind.BackgroundColor3 = Color3.new(1, 1, 1)
Keybind.BackgroundTransparency = 1
Keybind.Size = UDim2.new(0, 200, 0, 20)
Keybind.Image = "rbxassetid://2851929490"
Keybind.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
Keybind.ScaleType = Enum.ScaleType.Slice
Keybind.SliceCenter = Rect.new(4, 4, 4, 4)

Title_4.Name = "Title"
Title_4.Parent = Keybind
Title_4.BackgroundColor3 = Color3.new(1, 1, 1)
Title_4.BackgroundTransparency = 1
Title_4.Size = UDim2.new(0, 0, 1, 0)
Title_4.Font = Enum.Font.GothamBold
Title_4.Text = "Keybind"
Title_4.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_4.TextSize = 14
Title_4.TextXAlignment = Enum.TextXAlignment.Left

Input.Name = "Input"
Input.Parent = Keybind
Input.BackgroundColor3 = Color3.new(1, 1, 1)
Input.BackgroundTransparency = 1
Input.BorderSizePixel = 0
Input.Position = UDim2.new(1, -85, 0, 2)
Input.Size = UDim2.new(0, 80, 1, -4)
Input.ZIndex = 2
Input.Font = Enum.Font.GothamSemibold
Input.Text = "RShift"
Input.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Input.TextSize = 12
Input.TextWrapped = true

Input_Roundify_4px.Name = "Input_Roundify_4px"
Input_Roundify_4px.Parent = Input
Input_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
Input_Roundify_4px.BackgroundTransparency = 1
Input_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
Input_Roundify_4px.Image = "rbxassetid://2851929490"
Input_Roundify_4px.ImageColor3 = Color3.new(0.290196, 0.294118, 0.313726)
Input_Roundify_4px.ScaleType = Enum.ScaleType.Slice
Input_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

Windows.Name = "Windows"
Windows.Parent = imgui
Windows.BackgroundColor3 = Color3.new(1, 1, 1)
Windows.BackgroundTransparency = 1
Windows.Position = UDim2.new(0, 20, 0, 20)
Windows.Size = UDim2.new(1, 20, 1, -20)

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("RunService")
local ps = game:GetService("Players")

local p = ps.LocalPlayer
local mouse = p:GetMouse()

local checks = {
	["binding"] = false,
}


local function Resize(part, new, _delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(part, tweenInfo, new)
	tween:Play()
end

local function rgbtohsv(r, g, b) -- idk who made this function, but thanks
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max

	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end

	if max == min then
		h = 0
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

local function hasprop(object, prop)
	local a, b = pcall(function()
		return object[tostring(prop)]
	end)
	if a then
		return b
	end
end

local function gNameLen(obj)
	return obj.TextBounds.X + 15
end

local function gMouse()
	return Vector2.new(UIS:GetMouseLocation().X + 1, UIS:GetMouseLocation().Y - 35)
end

local function ripple(button, x, y)
	spawn(function()
		button.ClipsDescendants = true

		local circle = Prefabs:FindFirstChild("Circle"):Clone()

		circle.Parent = button
		circle.ZIndex = 1000

		local new_x = x - circle.AbsolutePosition.X
		local new_y = y - circle.AbsolutePosition.Y
		circle.Position = UDim2.new(0, new_x, 0, new_y)

		local size = 0
		if button.AbsoluteSize.X > button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
			size = button.AbsoluteSize.Y * 1.5
		elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		end

		circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
		Resize(circle, {ImageTransparency = 1}, 0.5)

		wait(0.5)
		circle:Destroy()
	end)
end

local windows = 0
library = {}

local function format_windows()
	local ull = Prefabs:FindFirstChild("UIListLayout"):Clone()
	ull.Parent = Windows
	local data = {}

	for i,v in next, Windows:GetChildren() do
		if not (v:IsA("UIListLayout")) then
			data[v] = v.AbsolutePosition
		end
	end

	ull:Destroy()

	for i,v in next, data do
		i.Position = UDim2.new(0, v.X, 0, v.Y)
	end
end

function library:FormatWindows()
	format_windows()
end

function library:AddWindow(title, options)
	windows = windows + 1
	local dropdown_open = false
	title = tostring(title or "New Window")
	options = (typeof(options) == "table") and options or ui_options
	options.tween_time = 0.1

	local Window = Prefabs:FindFirstChild("Window"):Clone()
	Window.Parent = Windows
	Window:FindFirstChild("Title").Text = title
	Window.Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)
	Window.ZIndex = Window.ZIndex + (windows * 10)

	do -- Altering Window Color
		local Title = Window:FindFirstChild("Title")
		local Bar = Window:FindFirstChild("Bar")
		local Base = Bar:FindFirstChild("Base")
		local Top = Bar:FindFirstChild("Top")
		local SplitFrame = Window:FindFirstChild("TabSelection"):FindFirstChild("Frame")
		local Toggle = Bar:FindFirstChild("Toggle")

		spawn(function()
			while true do
				Bar.BackgroundColor3 = options.main_color
				Base.BackgroundColor3 = options.main_color
				Base.ImageColor3 = options.main_color
				Top.ImageColor3 = options.main_color
				SplitFrame.BackgroundColor3 = options.main_color

				RS.Heartbeat:Wait()
			end
		end)

	end

	local Resizer = Window:WaitForChild("Resizer")

	local window_data = {}
	Window.Draggable = true

	do -- Resize Window
		local oldIcon = mouse.Icon
		local Entered = false
		Resizer.MouseEnter:Connect(function()
			Window.Draggable = false
			if options.can_resize then
				oldIcon = mouse.Icon
				-- mouse.Icon = "http://www.roblox.com/asset?id=4745131330"
			end
			Entered = true
		end)

		Resizer.MouseLeave:Connect(function()
			Entered = false
			if options.can_resize then
				mouse.Icon = oldIcon
			end
			Window.Draggable = true
		end)

		local Held = false
		UIS.InputBegan:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = true

				spawn(function() -- Loop check
					if Entered and Resizer.Active and options.can_resize then
						while Held and Resizer.Active do

							local mouse_location = gMouse()
							local x = mouse_location.X - Window.AbsolutePosition.X
							local y = mouse_location.Y - Window.AbsolutePosition.Y

							--
							if x >= options.min_size.X and y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, x, 0, y)}, options.tween_time)
							elseif x >= options.min_size.X then
								Resize(Window, {Size = UDim2.new(0, x, 0, options.min_size.Y)}, options.tween_time)
							elseif y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, y)}, options.tween_time)
							else
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)}, options.tween_time)
							end

							RS.Heartbeat:Wait()
						end
					end
				end)
			end
		end)
		UIS.InputEnded:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = false
			end
		end)
	end

	do -- [Open / Close] Window
		local open_close = Window:FindFirstChild("Bar"):FindFirstChild("Toggle")
		local open = true
		local canopen = true

		local oldwindowdata = {}
		local oldy = Window.AbsoluteSize.Y
		open_close.MouseButton1Click:Connect(function()
			if canopen then
				canopen = false

				if open then
					-- Close

					oldwindowdata = {}
					for i,v in next, Window:FindFirstChild("Tabs"):GetChildren() do
						oldwindowdata[v] = v.Visible
						v.Visible = false
					end

					Resizer.Active = false

					oldy = Window.AbsoluteSize.Y
					Resize(open_close, {Rotation = 0}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, 26)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 1

				else
					-- Open

					for i,v in next, oldwindowdata do
						i.Visible = v
					end

					Resizer.Active = true

					Resize(open_close, {Rotation = 90}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, oldy)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 0

				end

				open = not open
				wait(options.tween_time)
				canopen = true

			end
		end)
	end

	do -- UI Elements
		local tabs = Window:FindFirstChild("Tabs")
		local tab_selection = Window:FindFirstChild("TabSelection")
		local tab_buttons = tab_selection:FindFirstChild("TabButtons")

		do -- Add Tab
			function window_data:AddTab(tab_name)
				local tab_data = {}
				tab_name = tostring(tab_name or "New Tab")
				tab_selection.Visible = true

				local new_button = Prefabs:FindFirstChild("TabButton"):Clone()
				new_button.Parent = tab_buttons
				new_button.Text = tab_name
				new_button.Size = UDim2.new(0, gNameLen(new_button), 0, 20)
				new_button.ZIndex = new_button.ZIndex + (windows * 10)
				new_button:GetChildren()[1].ZIndex = new_button:GetChildren()[1].ZIndex + (windows * 10)

				local new_tab = Prefabs:FindFirstChild("Tab"):Clone()
				new_tab.Parent = tabs
				new_tab.ZIndex = new_tab.ZIndex + (windows * 10)

				local function show()
					if dropdown_open then return end
					for i, v in next, tab_buttons:GetChildren() do
						if not (v:IsA("UIListLayout")) then
							v:GetChildren()[1].ImageColor3 = Color3.fromRGB(52, 53, 56)
							Resize(v, {Size = UDim2.new(0, v.AbsoluteSize.X, 0, 20)}, options.tween_time)
						end
					end
					for i, v in next, tabs:GetChildren() do
						v.Visible = false
					end

					Resize(new_button, {Size = UDim2.new(0, new_button.AbsoluteSize.X, 0, 25)}, options.tween_time)
					new_button:GetChildren()[1].ImageColor3 = Color3.fromRGB(73, 75, 79)
					new_tab.Visible = true
				end

				new_button.MouseButton1Click:Connect(function()
					show()
				end)

				function tab_data:Show()
					show()
				end

				do -- Tab Elements

					function tab_data:AddLabel(label_text) -- [Label]
						label_text = tostring(label_text or "New Label")

						local label = Prefabs:FindFirstChild("Label"):Clone()

						label.Parent = new_tab
						label.Text = label_text
						label.Size = UDim2.new(0, gNameLen(label), 0, 20)
						label.ZIndex = label.ZIndex + (windows * 10)

						return label
					end

					function tab_data:AddButton(button_text, callback) -- [Button]
						button_text = tostring(button_text or "New Button")
						callback = typeof(callback) == "function" and callback or function()end

						local button = Prefabs:FindFirstChild("Button"):Clone()

						button.Parent = new_tab
						button.Text = button_text
						button.Size = UDim2.new(0, gNameLen(button), 0, 20)
						button.ZIndex = button.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						spawn(function()
							while true do
								if button and button:GetChildren()[1] then
									button:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						button.MouseButton1Click:Connect(function()
							ripple(button, mouse.X, mouse.Y)
							pcall(callback)
						end)

						return button
					end

					function tab_data:AddSwitch(switch_text, callback) -- [Switch]
						local switch_data = {}

						switch_text = tostring(switch_text or "New Switch")
						callback = typeof(callback) == "function" and callback or function()end

						local switch = Prefabs:FindFirstChild("Switch"):Clone()

						switch.Parent = new_tab
						switch:FindFirstChild("Title").Text = switch_text

						switch:FindFirstChild("Title").ZIndex = switch:FindFirstChild("Title").ZIndex + (windows * 10)
						switch.ZIndex = switch.ZIndex + (windows * 10)
						switch:GetChildren()[1].ZIndex = switch:GetChildren()[1].ZIndex + (windows * 10)

						spawn(function()
							while true do
								if switch and switch:GetChildren()[1] then
									switch:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						local toggled = false
						switch.MouseButton1Click:Connect(function()
							toggled = not toggled
							switch.Text = toggled and utf8.char(10003) or ""
							pcall(callback, toggled)
						end)

						function switch_data:Set(bool)
							toggled = (typeof(bool) == "boolean") and bool or false
							switch.Text = toggled and utf8.char(10003) or ""
							pcall(callback,toggled)
						end

						return switch_data, switch
					end

					function tab_data:AddTextBox(textbox_text, callback, textbox_options)
						textbox_text = tostring(textbox_text or "New TextBox")
						callback = typeof(callback) == "function" and callback or function()end
						textbox_options = typeof(textbox_options) == "table" and textbox_options or {["clear"] = true}
						textbox_options = {
							["clear"] = ((textbox_options.clear) == false)
						}

						local textbox = Prefabs:FindFirstChild("TextBox"):Clone()

						textbox.Parent = new_tab
						textbox.PlaceholderText = textbox_text
						textbox.ZIndex = textbox.ZIndex + (windows * 10)
						textbox:GetChildren()[1].ZIndex = textbox:GetChildren()[1].ZIndex + (windows * 10)

						textbox.FocusLost:Connect(function(ep)
							if ep then
								if #textbox.Text > 0 then
									pcall(callback, textbox.Text)
									if textbox_options.clear then
										textbox.Text = ""
									end
								end
							end
						end)

						return textbox
					end

					function tab_data:AddSlider(slider_text, callback, slider_options)
						local slider_data = {}

						slider_text = tostring(slider_text or "New Slider")
						callback = typeof(callback) == "function" and callback or function()end
						slider_options = typeof(slider_options) == "table" and slider_options or {}
						slider_options = {
							["min"] = slider_options.min or 0,
							["max"] = slider_options.max or 100,
							["readonly"] = slider_options.readonly or false,
						}

						local slider = Prefabs:FindFirstChild("Slider"):Clone()

						slider.Parent = new_tab
						slider.ZIndex = slider.ZIndex + (windows * 10)

						local title = slider:FindFirstChild("Title")
						local indicator = slider:FindFirstChild("Indicator")
						local value = slider:FindFirstChild("Value")
						title.ZIndex = title.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						value.ZIndex = value.ZIndex + (windows * 10)

						title.Text = slider_text

						do -- Slider Math
							local Entered = false
							slider.MouseEnter:Connect(function()
								Entered = true
								Window.Draggable = false
							end)
							slider.MouseLeave:Connect(function()
								Entered = false
								Window.Draggable = true
							end)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										if Entered and not slider_options.readonly then
											while Held and (not dropdown_open) do
												local mouse_location = gMouse()
												local x = (slider.AbsoluteSize.X - (slider.AbsoluteSize.X - ((mouse_location.X - slider.AbsolutePosition.X)) + 1)) / slider.AbsoluteSize.X

												local min = 0
												local max = 1

												local size = min
												if x >= min and x <= max then
													size = x
												elseif x < min then
													size = min
												elseif x > max then
													size = max
												end

												Resize(indicator, {Size = UDim2.new(size or min, 0, 0, 20)}, options.tween_time)
												local p = math.floor((size or min) * 100)

												local maxv = slider_options.max
												local minv = slider_options.min
												local diff = maxv - minv

												local sel_value = math.floor(((diff / 100) * p) + minv)

												value.Text = tostring(sel_value)
												pcall(callback, sel_value)

												RS.Heartbeat:Wait()
											end
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function slider_data:Set(new_value)
								new_value = tonumber(new_value) or 0
								new_value = (((new_value >= 0 and new_value <= 100) and new_value) / 100)

								Resize(indicator, {Size = UDim2.new(new_value or 0, 0, 0, 20)}, options.tween_time)
								local p = math.floor((new_value or 0) * 100)

								local maxv = slider_options.max
								local minv = slider_options.min
								local diff = maxv - minv

								local sel_value = math.floor(((diff / 100) * p) + minv)

								value.Text = tostring(sel_value)
								pcall(callback, sel_value)
							end

							slider_data:Set(slider_options["min"])
						end

						return slider_data, slider
					end

					function tab_data:AddKeybind(keybind_name, callback, keybind_options)
						local keybind_data = {}

						keybind_name = tostring(keybind_name or "New Keybind")
						callback = typeof(callback) == "function" and callback or function()end
						keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
						keybind_options = {
							["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
						}

						local keybind = Prefabs:FindFirstChild("Keybind"):Clone()
						local input = keybind:FindFirstChild("Input")
						local title = keybind:FindFirstChild("Title")
						keybind.ZIndex = keybind.ZIndex + (windows * 10)
						input.ZIndex = input.ZIndex + (windows * 10)
						input:GetChildren()[1].ZIndex = input:GetChildren()[1].ZIndex + (windows * 10)
						title.ZIndex = title.ZIndex + (windows * 10)

						keybind.Parent = new_tab
						title.Text = "  " .. keybind_name
						keybind.Size = UDim2.new(0, gNameLen(title) + 80, 0, 20)

						local shortkeys = { -- thanks to stroketon for helping me out with this
							RightControl = 'RightCtrl',
							LeftControl = 'LeftCtrl',
							LeftShift = 'LShift',
							RightShift = 'RShift',
							MouseButton1 = "Mouse1",
							MouseButton2 = "Mouse2"
						}

						local keybind = keybind_options.standard

						function keybind_data:SetKeybind(Keybind)
							local key = shortkeys[Keybind.Name] or Keybind.Name
							input.Text = key
							keybind = Keybind
						end

						UIS.InputBegan:Connect(function(a, b)
							if checks.binding then
								spawn(function()
									wait()
									checks.binding = false
								end)
								return
							end
							if a.KeyCode == keybind and not b then
								pcall(callback, keybind)
							end
						end)

						keybind_data:SetKeybind(keybind_options.standard)

						input.MouseButton1Click:Connect(function()
							if checks.binding then return end
							input.Text = "..."
							checks.binding = true
							local a, b = UIS.InputBegan:Wait()
							keybind_data:SetKeybind(a.KeyCode)
						end)

						return keybind_data, keybind
					end

					function tab_data:AddDropdown(dropdown_name, callback)
						local dropdown_data = {}
						dropdown_name = tostring(dropdown_name or "New Dropdown")
						callback = typeof(callback) == "function" and callback or function()end

						local dropdown = Prefabs:FindFirstChild("Dropdown"):Clone()
						local box = dropdown:FindFirstChild("Box")
						local objects = box:FindFirstChild("Objects")
						local indicator = dropdown:FindFirstChild("Indicator")
						dropdown.ZIndex = dropdown.ZIndex + (windows * 10)
						box.ZIndex = box.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						dropdown:GetChildren()[3].ZIndex = dropdown:GetChildren()[3].ZIndex + (windows * 10)

						dropdown.Parent = new_tab
						dropdown.Text = "      " .. dropdown_name
						box.Size = UDim2.new(1, 0, 0, 0)

						local open = false
						dropdown.MouseButton1Click:Connect(function()
							open = not open

							local len = (#objects:GetChildren() - 1) * 20
							if #objects:GetChildren() - 1 >= 10 then
								len = 10 * 20
								objects.CanvasSize = UDim2.new(0, 0, (#objects:GetChildren() - 1) * 0.1, 0)
							end

							if open then -- Open
								if dropdown_open then return end
								dropdown_open = true
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
								Resize(indicator, {Rotation = 90}, options.tween_time)
							else -- Close
								dropdown_open = false
								Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
								Resize(indicator, {Rotation = -90}, options.tween_time)
							end

						end)

						function dropdown_data:Add(n)
							local object_data = {}
							n = tostring(n or "New Object")

							local object = Prefabs:FindFirstChild("DropdownButton"):Clone()

							object.Parent = objects
							object.Text = n
							object.ZIndex = object.ZIndex + (windows * 10)

							object.MouseEnter:Connect(function()
								object.BackgroundColor3 = options.main_color
							end)
							object.MouseLeave:Connect(function()
								object.BackgroundColor3 = Color3.fromRGB(33, 34, 36)
							end)

							if open then
								local len = (#objects:GetChildren() - 1) * 20
								if #objects:GetChildren() - 1 >= 10 then
									len = 10 * 20
									objects.CanvasSize = UDim2.new(0, 0, (#objects:GetChildren() - 1) * 0.1, 0)
								end
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
							end

							object.MouseButton1Click:Connect(function()
								if dropdown_open then
									dropdown.Text = "      [ " .. n .. " ]"
									dropdown_open = false
									open = false
									Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
									Resize(indicator, {Rotation = -90}, options.tween_time)
									pcall(callback, n)
								end
							end)

							function object_data:Remove()
								object:Destroy()
							end

							return object, object_data
						end

						return dropdown_data, dropdown
					end

					function tab_data:AddColorPicker(callback)
						local color_picker_data = {}
						callback = typeof(callback) == "function" and callback or function()end

						local color_picker = Prefabs:FindFirstChild("ColorPicker"):Clone()

						color_picker.Parent = new_tab
						color_picker.ZIndex = color_picker.ZIndex + (windows * 10)

						local palette = color_picker:FindFirstChild("Palette")
						local sample = color_picker:FindFirstChild("Sample")
						local saturation = color_picker:FindFirstChild("Saturation")
						palette.ZIndex = palette.ZIndex + (windows * 10)
						sample.ZIndex = sample.ZIndex + (windows * 10)
						saturation.ZIndex = saturation.ZIndex + (windows * 10)

						do -- Color Picker Math
							local h = 0
							local s = 1
							local v = 1

							local function update()
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
								pcall(callback, color)
							end

							do
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
							end

							local Entered1, Entered2 = false, false
							palette.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered1 = true
							end)
							palette.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered1 = false
							end)
							saturation.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered2 = true
							end)
							saturation.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered2 = false
							end)

							local palette_indicator = palette:FindFirstChild("Indicator")
							local saturation_indicator = saturation:FindFirstChild("Indicator")
							palette_indicator.ZIndex = palette_indicator.ZIndex + (windows * 10)
							saturation_indicator.ZIndex = saturation_indicator.ZIndex + (windows * 10)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										while Held and Entered1 and (not dropdown_open) do -- Palette
											local mouse_location = gMouse()

											local x = ((palette.AbsoluteSize.X - (mouse_location.X - palette.AbsolutePosition.X)) + 1)
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)

											local color = Color3.fromHSV(x / 100, y / 100, 0)
											h = x / 100
											s = y / 100

											Resize(palette_indicator, {Position = UDim2.new(0, math.abs(x - 100) - (palette_indicator.AbsoluteSize.X / 2), 0, math.abs(y - 100) - (palette_indicator.AbsoluteSize.Y / 2))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end

										while Held and Entered2 and (not dropdown_open) do -- Saturation
											local mouse_location = gMouse()
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)
											v = y / 100

											Resize(saturation_indicator, {Position = UDim2.new(0, 0, 0, math.abs(y - 100))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function color_picker_data:Set(color)
								color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
								local h2, s2, v2 = rgbtohsv(color.r * 255, color.g * 255, color.b * 255)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h2, 1, 1)
								pcall(callback, color)
							end
						end

						return color_picker_data, color_picker
					end

					function tab_data:AddConsole(console_options)
						local console_data = {}

						console_options = typeof(console_options) == "table" and console_options or {["readonly"] = true,["full"] = false,}
						console_options = {
							["y"] = tonumber(console_options.y) or 200,
							["source"] = console_options.source or "Logs",
							["readonly"] = ((console_options.readonly) == true),
							["full"] = ((console_options.full) == true),
						}

						local console = Prefabs:FindFirstChild("Console"):Clone()

						console.Parent = new_tab
						console.ZIndex = console.ZIndex + (windows * 10)
						console.Size = UDim2.new(1, 0, console_options.full and 1 or 0, console_options.y)

						local sf = console:GetChildren()[1]
						local Source = sf:FindFirstChild("Source")
						local Lines = sf:FindFirstChild("Lines")
						Source.ZIndex = Source.ZIndex + (windows * 10)
						Lines.ZIndex = Lines.ZIndex + (windows * 10)

						Source.TextEditable = not console_options.readonly

						do -- Syntax Zindex
							for i,v in next, Source:GetChildren() do
								v.ZIndex = v.ZIndex + (windows * 10) + 1
							end
						end
						Source.Comments.ZIndex = Source.Comments.ZIndex + 1

						do -- Highlighting (thanks to whoever made this)
							local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
							local global_env = {"getrawmetatable", "newcclosure", "islclosure", "setclipboard", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16", "load", "fire", "Fire"}

							local Highlight = function(string, keywords)
								local K = {}
								local S = string
								local Token =
									{
										["="] = true,
										["."] = true,
										[","] = true,
										["("] = true,
										[")"] = true,
										["["] = true,
										["]"] = true,
										["{"] = true,
										["}"] = true,
										[":"] = true,
										["*"] = true,
										["/"] = true,
										["+"] = true,
										["-"] = true,
										["%"] = true,
										[";"] = true,
										["~"] = true
									}
								for i, v in pairs(keywords) do
									K[v] = true
								end
								S = S:gsub(".", function(c)
									if Token[c] ~= nil then
										return "\32"
									else
										return c
									end
								end)
								S = S:gsub("%S+", function(c)
									if K[c] ~= nil then
										return c
									else
										return (" "):rep(#c)
									end
								end)

								return S
							end

							local hTokens = function(string)
								local Token =
									{
										["="] = true,
										["."] = true,
										[","] = true,
										["("] = true,
										[")"] = true,
										["["] = true,
										["]"] = true,
										["{"] = true,
										["}"] = true,
										[":"] = true,
										["*"] = true,
										["/"] = true,
										["+"] = true,
										["-"] = true,
										["%"] = true,
										[";"] = true,
										["~"] = true
									}
								local A = ""
								string:gsub(".", function(c)
									if Token[c] ~= nil then
										A = A .. c
									elseif c == "\n" then
										A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
									else
										A = A .. "\32"
									end
								end)

								return A
							end

							local strings = function(string)
								local highlight = ""
								local quote = false
								string:gsub(".", function(c)
									if quote == false and c == "\34" then
										quote = true
									elseif quote == true and c == "\34" then
										quote = false
									end
									if quote == false and c == "\34" then
										highlight = highlight .. "\34"
									elseif c == "\n" then
										highlight = highlight .. "\n"
									elseif c == "\t" then
										highlight = highlight .. "\t"
									elseif quote == true then
										highlight = highlight .. c
									elseif quote == false then
										highlight = highlight .. "\32"
									end
								end)

								return highlight
							end

							local info = function(string)
								local highlight = ""
								local quote = false
								string:gsub(".", function(c)
									if quote == false and c == "[" then
										quote = true
									elseif quote == true and c == "]" then
										quote = false
									end
									if quote == false and c == "\]" then
										highlight = highlight .. "\]"
									elseif c == "\n" then
										highlight = highlight .. "\n"
									elseif c == "\t" then
										highlight = highlight .. "\t"
									elseif quote == true then
										highlight = highlight .. c
									elseif quote == false then
										highlight = highlight .. "\32"
									end
								end)

								return highlight
							end

							local comments = function(string)
								local ret = ""
								string:gsub("[^\r\n]+", function(c)
									local comm = false
									local i = 0
									c:gsub(".", function(n)
										i = i + 1
										if c:sub(i, i + 1) == "--" then
											comm = true
										end
										if comm == true then
											ret = ret .. n
										else
											ret = ret .. "\32"
										end
									end)
									ret = ret
								end)

								return ret
							end

							local numbers = function(string)
								local A = ""
								string:gsub(".", function(c)
									if tonumber(c) ~= nil then
										A = A .. c
									elseif c == "\n" then
										A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
									else
										A = A .. "\32"
									end
								end)

								return A
							end

							local highlight_lua = function(type)
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Keywords.Text = Highlight(s, lua_keywords)
									Source.Globals.Text = Highlight(s, global_env)
									Source.RemoteHighlight.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
									Source.Tokens.Text = hTokens(s)
									Source.Numbers.Text = numbers(s)
									Source.Strings.Text = strings(s)
									Source.Comments.Text = comments(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									Lines.Text = ""
									for i = 1, lin do
										Lines.Text = Lines.Text .. i .. "\n"
									end

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end

								local highlight_logs = function(type)
								end
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Info.Text = info(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end
							end

							if console_options.source == "Lua" then
								highlight_lua("Text")
								Source.Changed:Connect(highlight_lua)
							elseif console_options.source == "Logs" then
								Lines.Visible = false

								highlight_logs("Text")
								Source.Changed:Connect(highlight_logs)
							end

							function console_data:Set(code)
								Source.Text = tostring(code)
							end

							function console_data:Get()
								return Source.Text
							end

							function console_data:Log(msg)
								Source.Text = Source.Text .. "[*] " .. tostring(msg) .. "\n"
							end

						end

						return console_data, console
					end

					function tab_data:AddHorizontalAlignment()
						local ha_data = {}

						local ha = Prefabs:FindFirstChild("HorizontalAlignment"):Clone()
						ha.Parent = new_tab

						function ha_data:AddButton(...)
							local data, object
							local ret = {tab_data:AddButton(...)}
							if typeof(ret[1]) == "table" then
								data = ret[1]
								object = ret[2]
								object.Parent = ha
								return data, object
							else
								object = ret[1]
								object.Parent = ha
								return object
							end
						end

						return ha_data, ha
					end

					function tab_data:AddFolder(folder_name) -- [Folder]
						local folder_data = {}

						folder_name = tostring(folder_name or "New Folder")

						local folder = Prefabs:FindFirstChild("Folder"):Clone()
						local button = folder:FindFirstChild("Button")
						local objects = folder:FindFirstChild("Objects")
						local toggle = button:FindFirstChild("Toggle")
						folder.ZIndex = folder.ZIndex + (windows * 10)
						button.ZIndex = button.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						toggle.ZIndex = toggle.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						folder.Parent = new_tab
						button.Text = "      " .. folder_name

						spawn(function()
							while true do
								if button and button:GetChildren()[1] then
									button:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						local function gFolderLen()
							local n = 25
							for i,v in next, objects:GetChildren() do
								if not (v:IsA("UIListLayout")) then
									n = n + v.AbsoluteSize.Y + 5
								end
							end
							return n
						end

						local open = false
						button.MouseButton1Click:Connect(function()
							if open then -- Close
								Resize(toggle, {Rotation = 0}, options.tween_time)
								objects.Visible = false
							else -- Open
								Resize(toggle, {Rotation = 90}, options.tween_time)
								objects.Visible = true
							end

							open = not open
						end)

						spawn(function()
							while true do
								Resize(folder, {Size = UDim2.new(1, 0, 0, (open and gFolderLen() or 20))}, options.tween_time)
								wait()
							end
						end)

						for i,v in next, tab_data do
							folder_data[i] = function(...)
								local data, object
								local ret = {v(...)}
								if typeof(ret[1]) == "table" then
									data = ret[1]
									object = ret[2]
									object.Parent = objects
									return data, object
								else
									object = ret[1]
									object.Parent = objects
									return object
								end
							end
						end

						return folder_data, folder
					end

				end

				return tab_data, new_tab
			end
		end
	end

	do
		for i, v in next, Window:GetDescendants() do
			if hasprop(v, "ZIndex") then
				v.ZIndex = v.ZIndex + (windows * 10)
			end
		end
	end

	return window_data, Window
end

-- [[ Main ]]

do 
	local Window = library:AddWindow("Dropfarm V2", {
		main_color = Color3.fromRGB(0, 0, 0),
		min_size = Vector2.new(300,400),
		toggle_key = Enum.KeyCode.RightShift,
		can_resize = true,
	})
	local Main1 = Window:AddTab("Main")
	local Main2 = Window:AddTab("Robberies")
	local Main3 = Window:AddTab( "Misc")
	local Main4 = Window:AddTab("Credits")

	do 
		local Status = Main1:AddLabel("Rendering map...")

		local DropfarmSwitch = Main1:AddSwitch("Enabled", function(a)
			local yes = a
			getgenv().Enabled = yes
		end)

		local MobileSwitch = Main1:AddSwitch("Mobile", function(a)
			local yes = a
			getgenv().Mobile = yes
		end)

		local AdvertiseSwitch = Main1:AddSwitch("Advertise", function(a)
			local yes = a
			getgenv().Advertise = yes
		end)

		local PickupCashSwitch = Main1:AddSwitch("Pick Up Cash", function(a)
			local yes = a
			getgenv().PickUpCash = yes
		end)

		local CopyDiscordInvite = Main1:AddButton("Copy Discord Invite", function(a)
			setclipboard("https://discord.gg/farmhub")

			game.StarterGui:SetCore("SendNotification", {
				Title = "Copied",
				Text = "Copied the invite to your clipboard!",
				Duration = 1.2,
			})
		end)

		local MoneyEarnedLabel = Main1:AddLabel("Money Earned: $0")
		local ElapsedTimeLabel = Main1:AddLabel("Elapsed Time: 0h/0m")
		local EstimatedHourlyLabel = Main1:AddLabel("Estimated Hourly: $0")

		local RobCrateToggle = Main2:AddSwitch("Rob Crate", function(a)
			local yes = a
			getgenv().RobCrate = yes
		end)

		local RobShipToggle = Main2:AddSwitch("Rob Ship", function(a)
			local yes = a
			getgenv().RobShip = yes
		end)

		local RobMansionToggle = Main2:AddSwitch("Rob Mansion", function(a)
			local yes = a
			getgenv().RobMansion = yes
		end)

		Main2:AddLabel("⚠️ This script is in beta, bugs will occur.")

		if LRM_IsUserPremium then
			local AutoOpenSafesToggle = Main3:AddSwitch("Auto Open Safes", function(a)
				local yes = a
				getgenv().AutoOpenSafes = yes
			end)

			local WebhookLogToggle = Main3:AddSwitch("Log Webhook", function(a)
				local yes = a
				getgenv().LogWebhook = yes
			end)

			local WebhookUrlInput = Main3:AddTextBox("Webhook Url", function(a)
				local yes = a
				getgenv().WebhookUrl = yes
			end)

			local OpenAllSafesButton = Main3:AddButton("Open All Safes", function(a)
				local SafeAmt = #Modules.Store._state.safesInventoryItems

				if SafeAmt ~= 0 then
					task.spawn(function()
						for i = 1, SafeAmt do
							local CurrentSafe = Modules.Store._state.safesInventoryItems[1]

							ReplicatedStorage[Modules.SafeConsts.SAFE_OPEN_REMOTE_NAME]:FireServer(CurrentSafe.itemOwnedId)
							task.wait(3)
						end
					end)
				end
			end)
		end

		Main4:AddLabel("itztempy1: developer")
		Main4:AddLabel("blitz: map rendering | equip fixed")

		Main1:Show()
		library:FormatWindows()

		local function LogStatus(case, robbery)
			if not LRM_IsUserPremium then return end
			if case == 1 and getgenv().WebhookUrl ~= "" and getgenv().LogWebhook then -- server hop
				local Webhook_URL = getgenv().WebhookUrl

				local Headers = {
					['Content-Type'] = 'application/json',
				}

				local data = {
					["embeds"] = {
						{
							["title"] = "Server Hopping...",
							["description"] = "",
							["type"] = "rich",
							["color"] = tonumber(0xff0000),
							["fields"] = {
								{
									["name"] = "Money Made",
									["value"] = "```".. FormatCash(MoneyMade) .. "```",
									["inline"] = true,
								},
								{
									["name"] = "Elapsed Time",
									["value"] = "```".. TickToHM(RunTime) .. "```",
									["inline"] = true,
								},
								{
									["name"] = "Estimated Hourly",
									["value"] = "```".. FormatCash(math.round((3600 / RunTime) * MoneyMade)) .. "```",
									["inline"] = true,
								},
							},
						}
					}
				}

				local PlayerData = game:GetService('HttpService'):JSONEncode(data)

				local Request = http_request or request or HttpPost or syn.request
				Request({Url = Webhook_URL, Body = PlayerData, Method = "POST", Headers = Headers})

			elseif case == 2 and getgenv().WebhookUrl ~= "" and getgenv().LogWebhook then -- robbing a store
				local Webhook_URL = getgenv().WebhookUrl

				local Headers = {
					['Content-Type'] = 'application/json',
				}

				local data = {
					["embeds"] = {
						{
							["title"] = "Robbing " .. robbery .. "...",
							["description"] = "",
							["type"] = "rich",
							["color"] = tonumber(0xff0000),
							["fields"] = {
								{
									["name"] = "Money Made",
									["value"] = "```".. FormatCash(MoneyMade) .. "```",
									["inline"] = true,
								},
								{
									["name"] = "Elapsed Time",
									["value"] = "```".. TickToHM(RunTime) .. "```",
									["inline"] = true,
								},
								{
									["name"] = "Estimated Hourly",
									["value"] = "```".. FormatCash(math.round((3600 / RunTime) * MoneyMade)) .. "```",
									["inline"] = true,
								},
							},
						}
					}
				}

				local PlayerData = game:GetService('HttpService'):JSONEncode(data)

				local Request = http_request or request or HttpPost or syn.request
				Request({Url = Webhook_URL, Body = PlayerData, Method = "POST", Headers = Headers})
			elseif case == 3 and getgenv().WebhookUrl ~= "" and getgenv().LogWebhook then -- robbed a store
				local Webhook_URL = getgenv().WebhookUrl

				local Headers = {
					['Content-Type'] = 'application/json',
				}

				local data = {
					["embeds"] = {
						{
							["title"] = "Robbed " .. robbery .. "!",
							["description"] = "",
							["type"] = "rich",
							["color"] = tonumber(0xff0000),
							["fields"] = {
								{
									["name"] = "Money Made",
									["value"] = "```".. FormatCash(MoneyMade) .. "```",
									["inline"] = true,
								},
								{
									["name"] = "Elapsed Time",
									["value"] = "```".. TickToHM(RunTime) .. "```",
									["inline"] = true,
								},
								{
									["name"] = "Estimated Hourly",
									["value"] = "```".. FormatCash(math.round((3600 / RunTime) * MoneyMade)) .. "```",
									["inline"] = true,
								},
							},
						}
					}
				}

				local PlayerData = game:GetService('HttpService'):JSONEncode(data)

				local Request = http_request or request or HttpPost or syn.request
				Request({Url = Webhook_URL, Body = PlayerData, Method = "POST", Headers = Headers})
			end
		end

		local RobMansion = function()
			LogStatus(2, "Mansion")

			if InHeli() or InCar() then 
				ExitVehicle()
			end

			Status.Text = "Entering mansion..."

			local MansionRobbery = workspace.MansionRobbery
			local TouchToEnter = MansionRobbery.Lobby.EntranceElevator.TouchToEnter
			local ElevatorDoor = MansionRobbery.ArrivalElevator.Floors:GetChildren()[1].DoorLeft.InnerModel.Door
			local MansionTeleportCFrame = TouchToEnter.CFrame - Vector3.new(0, TouchToEnter.Size.Y / 2 - player.Character.Humanoid.HipHeight * 2, -TouchToEnter.Size.Z)
			local MansionActivateDoor = CFrame.new(3154, -205, -4558)

			local FailMansion = false

			local FailedStart = false

			task.delay(10, function()
				FailMansion = true
			end)

			local tper1 = RunService.Heartbeat:Connect(function()
				root.CFrame = MansionTeleportCFrame		
			end)

			repeat
				task.wait()
				firetouchinterest(root, TouchToEnter, 0)
				task.wait()
				firetouchinterest(root, TouchToEnter, 1)
			until Modules.MansionUtils.isPlayerInElevator(MansionRobbery, player) or FailMansion

			tper1:Disconnect()

			if FailMansion then
				humanoid.Health = 0
				return
			end

			GetGun()
			repeat
				wait(0.1)
			until ElevatorDoor.Position.X > 3208

			for _, instance in pairs(MansionRobbery.Lasers:GetChildren()) do
				instance:Remove()
			end
			for _, instance in pairs(MansionRobbery.LaserTraps:GetChildren()) do
				instance:Remove()
			end  

			Status.Text = "Triggering cutcene..."

			local tper2 = RunService.Heartbeat:Connect(function()
				root.CFrame = MansionActivateDoor		
			end)

			task.delay(12.5, function()
				FailedStart = true
			end)

			repeat task.wait() until MansionRobbery:GetAttribute("MansionRobberyProgressionState") == 3 or player.Character.Humanoid.Health <= 0 or not char or FailedStart

			tper2:Disconnect()

			if FailedStart then
				humanoid.Health = 0
				return
			end

			Status.Text = "Waiting for cutcene..."

			Modules.MansionUtils.getProgressionStateChangedSignal(MansionRobbery):Wait()

			Status.Text = "Killing ceo..."

			local BV = Instance.new("BodyVelocity", root)
			BV.P = 3000
			BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			BV.Velocity = Vector3.new()

			local origY = root.CFrame.Y

			root.CFrame = CFrame.new(root.CFrame.X, root.CFrame.Y + 9, root.CFrame.Z)

			local NPC_new = Modules.Npc.new
			local NPCShared_goTo = Modules.NpcShared.goTo

			Modules.Npc.new = function(NPCObject, ...)
				if NPCObject.Name ~= "ActiveBoss" then
					for i,v in pairs(NPCObject:GetDescendants()) do
						pcall(function()
							v.Transparency = 1
						end)
					end
				end
				return NPC_new(NPCObject, ...)
			end
			Modules.Npc.GetTarget = function(...)
				return MansionRobbery and MansionRobbery:FindFirstChild("ActiveBoss") and MansionRobbery:FindFirstChild("ActiveBoss").HumanoidRootPart
			end

			Modules.NpcShared.goTo = function(NPCData, Pos)
				if MansionRobbery and MansionRobbery:FindFirstChild("ActiveBoss") then
					return NPCShared_goTo(NPCData, MansionRobbery:FindFirstChild("ActiveBoss").HumanoidRootPart.Position)
				end
			end

			game.Workspace.Items.DescendantAdded:Connect(function(Des)
				if Des:IsA("BasePart") then
					Des.Transparency = 1
					Des:GetPropertyChangedSignal("Transparency"):Connect(function()
						Des.Transparency = 1
					end)
				end
			end)

			for i,v in pairs(ReplicatedStorage.Game.Item:GetChildren()) do
				require(v).ReloadDropAmmoVisual = function() end
				require(v).ReloadDropAmmoSound = function() end
				require(v).ReloadRefillAmmoSound = function() end
				require(v).ShootSound = function() end
			end

			getfenv(Modules.BulletEmitter.Emit).Instance = {
				new = function()
					return {
						Destroy = function() end
					}
				end
			}

			local BossCEO = MansionRobbery:WaitForChild("ActiveBoss")
			local OldHealth = BossCEO.Humanoid.Health

			LPH_NO_VIRTUALIZE(function()
				Modules.Raycast.RayIgnoreNonCollideWithIgnoreList = function(...)
					local arg = {RayIgnore(...)}

					if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") then
						arg[1] = BossCEO.Head
						arg[2] = BossCEO.Head.Position
					end

					return unpack(arg)
				end
			end)()

			require(ReplicatedStorage.NPC.NPC).GetTarget = function()
				return BossCEO:FindFirstChild("Head")
			end

			while player.Folder:FindFirstChild("AK47") and BossCEO and BossCEO:FindFirstChild("HumanoidRootPart") and BossCEO.Humanoid.Health ~= 1 do
				require(Modules.EquipThing).AttemptSetEquipped({obj = game:GetService("Players").LocalPlayer.Folder["AK47"]}, true)
				player.Folder.AK47.InventoryEquipRemote:FireServer(true)
				task.wait()
				ShootGun()
			end

			root.CFrame = CFrame.new(root.CFrame.X, origY, root.CFrame.Z)
			BV:Destroy()

			require(Modules.EquipThing).AttemptSetEquipped({obj = game:GetService("Players").LocalPlayer.Folder["AK47"]}, false)

			player.Folder.AK47.InventoryEquipRemote:FireServer(false)
			repeat task.wait() until playerGui.AppUI:FindFirstChild("RewardSpinner")

			Status.Text = "Exiting mansion..."

			if not SmallTP(CFrame.new(3122, -205, -4527)) then return end
			if not SmallTP(CFrame.new(3119, -205, -4439)) then return end
			if not SmallTP(CFrame.new(3098, -205, -4440)) then return end
			if not SmallTP(CFrame.new(3097, -221, -4519)) then return end
			if not SmallTP(CFrame.new(3076, -221, -4518)) then return end
			if not SmallTP(CFrame.new(3075, -221, -4485)) then return end
			if not SmallTP(CFrame.new(3063, -221, -4486)) then return end
			if not SmallTP(CFrame.new(3064, -220, -4474)) then return end
			if not SmallTP(CFrame.new(3124, 51, -4415)) then return end
			if not SmallTP(CFrame.new(3106, 51, -4412)) then return end
			if not SmallTP(CFrame.new(3106, 57, -4377)) then return end

			LogStatus(3, "Mansion")
			Status.Text = "Robbed mansion!"

			Status.Text = "Waiting for reward..."
			WaitForReward()

			task.wait(.1)
		end

		local RobShip = LPH_NO_VIRTUALIZE(function()	
			LogStatus(2, "Cargo Ship")

			if not InHeli() then 
				Status.Text = "Getting a heli..."
				ExitVehicle()
				Travel()
			end

			if robberies.ship.open == false then return end

			Status.Text = "Robbing crates..."

			char:PivotTo(CFrame.new(root.Position.X, 500, root.Position.Z))

			task.wait(0.1)

			if not vehicle.Preset:FindFirstChild('RopePull') then
				repeat
					Modules.Vehicle.Classes.Heli.attemptDropRope()
					task.wait(1)
				until vehicle.Preset:FindFirstChild('RopePull')
				task.wait(0.5)
			end

			local ropePull = vehicle.Preset:FindFirstChild('RopePull')
			local rope = vehicle.Winch:FindFirstChild("RopeConstraint")

			if rope and ropePull then
				rope.Length = 999
				rope.WinchEnabled = true
				ropePull.CanCollide = false
				ropePull.Massless = true
			end

			task.wait(1.95)

			for i = 1, 2 do
				if robberies.ship.open == false then return end

				local crate = game.Workspace.CargoShip.Crates:GetChildren()[1]
				player:RequestStreamAroundAsync(crate.MeshPart.Position, 1000)


				repeat
					ropePull:PivotTo(crate.MeshPart.CFrame)
					ropePull:WaitForChild('ReqLink'):FireServer(crate, Vector3.zero)
					task.wait()
				until ropePull.AttachedTo.Value ~= nil or not robberies.ship.open

				if robberies.ship.open == false then return end

				WaitForReward()

				task.wait(.1)

				repeat
					ropePull:PivotTo(CFrame.new(-471, -50, 1906))
					crate:PivotTo(CFrame.new(-471, -50, 1906))
					task.wait()
				until not crate:FindFirstChild('MeshPart') or not robberies.ship.open

				if robberies.ship.open == false then return end

				WaitForReward()
			end

			if rope and ropePull then
				rope.WinchEnabled = false
				ropePull.CanCollide = true
				ropePull.Massless = false
				rope.Length = 30
			end

			Status.Text = "Robbed Ship!"

			LogStatus(3, "Cargo Ship")

			task.wait(.1)
		end)

		local RobCrate = function()
			LogStatus(2, "Crate")

			if not InHeli() then 
				Status.Text = "Getting a heli..."
				ExitVehicle()
				Travel()
			end

			local dropMAIN = game.Workspace:FindFirstChild("Drop")

			if not GetClosestAirdrop() or not dropMAIN.PrimaryPart then Status.Text = "Crate is NILL, returning..." return end

			if game.Workspace:FindFirstChild("Drop"):GetAttribute("BriefcaseLanded") == false then vehicleRoot.CFrame = vehicleRoot.CFrame * CFrame.new(0,500,0) Status.Text = "Waiting for crate to land..." end

			repeat task.wait() until workspace:FindFirstChild("Drop"):GetAttribute("BriefcaseLanded") == true or not GetClosestAirdrop() or not dropMAIN.PrimaryPart 

			if not GetClosestAirdrop() or not dropMAIN.PrimaryPart then Status.Text = "Crate is NILL, returning..." return end

			Status.Text = "Teleporting to crate..."

			local SafeAmt = #Modules.Store._state.safesInventoryItems

			if SafeAmt ~= 0 and getgenv().AutoOpenSafes == true and LRM_IsUserPremium then
				task.spawn(function()
					for i = 1, SafeAmt do
						local CurrentSafe = Modules.Store._state.safesInventoryItems[1]

						ReplicatedStorage[Modules.SafeConsts.SAFE_OPEN_REMOTE_NAME]:FireServer(CurrentSafe.itemOwnedId)
						task.wait(3)

						if getgenv().AutoOpenSafes == false then break end
					end
				end)
			end

			FlightMove(dropMAIN.PrimaryPart.CFrame * CFrame.new(8.75, 7.5, 0))

			task.wait(.155)

			if not GetClosestAirdrop() or not dropMAIN.PrimaryPart then Status.Text = "Crate is NILL, returning..." return end

			TeleporterC(dropMAIN.PrimaryPart.CFrame * CFrame.new(8.75, 7.5, 0), 0.1)

			task.wait(.1)

			if not GetClosestAirdrop() or not dropMAIN.PrimaryPart then Status.Text = "Crate is NILL, returning..." return end

			ExitVehicle()

			task.wait(.155)

			if not GetClosestAirdrop() or not dropMAIN.PrimaryPart then Status.Text = "Crate is NILL, returning..." return end

			LPH_NO_VIRTUALIZE(function()
				if not dropMAIN.PrimaryPart or not GetClosestAirdrop() then return end
				if not SmallTP(dropMAIN.PrimaryPart.CFrame * CFrame.new(0, 6, 0)) then return end
				if not dropMAIN.PrimaryPart or not GetClosestAirdrop() then return end
			end)()	

			Status.Text = "Robbing crate..."

			task.spawn(function()
				while dropMAIN and dropMAIN:FindFirstChild("NPCs") == nil do
					wait(0.1)
				end
				dropMAIN:FindFirstChild("NPCs"):Destroy()
			end)

			repeat task.wait() until game:GetService("Players").LocalPlayer.TeamColor == BrickColor.new("Bright red")

			repeat 
				pcall(function()
					dropMAIN.BriefcasePress:FireServer()
					dropMAIN.BriefcaseCollect:FireServer()
					task.wait()
				end)
			until dropMAIN:GetAttribute("BriefcaseCollected") == true or not dropMAIN.PrimaryPart or IsArrested() or not char

			if dropMAIN then dropMAIN.Name = "" end

			if getgenv().PickUpCash == true then
				Status.Text = "Collecting money..."

				task.wait(0.75)

				for i = 1, 3 do
					for _, spec in pairs(Modules.UI.CircleAction.Specs) do
						if spec.Name:sub(1, 9) == "Collect $" then
							spec:Callback(true)
						end
					end
					task.wait(0.25)
				end
			end

			Status.Text = "Waiting for reward..."
			WaitForReward()

			LogStatus(3, "Crate")

			Status.Text = "Robbed crate!"

			dropMAIN:Destroy()

			task.wait(.1)
		end

		local ServerHop = LPH_NO_VIRTUALIZE(function()
			if queued == false then

				Status.Text = "Server hopping..."	

				local ScriptFile = Directory .. "/Dropfarm.lua"

				local ScriptSaved = game:HttpGet("https://raw.githubusercontent.com/f4yyzw0rld/FarmHub/main/AutoCrate.lua")
				writefile(ScriptFile, ScriptSaved)
					
				if getgenv().WebhookUrl ~= "" and getgenv().LogWebhook and not SentWebhookServerhop then LogStatus(1, nil) SentWebhookServerhop = true end
				
				queued = true
				Status.Text = "Server hopping..."	

				queue = queue .. " getgenv().StartingMoney = " .. getgenv().StartingMoney
				queue = queue .. " getgenv().StartingTime = " .. getgenv().StartingTime
				if LRM_IsUserPremium then
					queue = queue .. " getgenv().AutoOpenSafes = " .. tostring(getgenv().AutoOpenSafes)
				end
				queue = queue .. " getgenv().LogWebhook = " .. tostring(getgenv().LogWebhook)
				queue = queue .. " getgenv().RobMansion = " .. tostring(getgenv().RobMansion)
				queue = queue .. " getgenv().RobShip = " .. tostring(getgenv().RobShip)
				queue = queue .. " getgenv().RobCrate = " .. tostring(getgenv().RobCrate)
				queue = queue .. " getgenv().PickUpCash = " .. tostring(getgenv().PickUpCash)
				queue = queue .. " getgenv().Enabled = " .. tostring(getgenv().Enabled)
				queue = queue .. " getgenv().Mobile = " .. tostring(getgenv().Mobile)
				queue = queue .. " getgenv().Advertise = " .. tostring(getgenv().Advertise)
				if LRM_IsUserPremium then
					queue = queue .. " getgenv().WebhookUrl = '" .. tostring(getgenv().WebhookUrl) .. "'"
				end
				if script_key then
					queue = queue .. " script_key = '" .. script_key .. "'"
				end
				queue = queue .. " if not game:IsLoaded() then game.Loaded:Wait() task.wait(3) end"
				queue = queue .. " loadfile('" .. ScriptFile .. "')()"

				if syn then
					syn.queue_on_teleport(queue) 
				else
					queue_on_teleport(queue) 
				end
			end

			while true do		
				pcall(function()
					local Servers = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
					local Server, Next = nil, nil

					local function ListServers(cursor)
						local Raw = game:HttpGet(Servers .. ((cursor and "&cursor="..cursor) or ""))

						return HttpService:JSONDecode(Raw)
					end

					repeat
						local Servers = ListServers(Next)
						Server = Servers.data[math.random(1, (#Servers.data / 3))]
						Next = Servers.nextPageCursor
					until Server

					if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
						TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, player)
					end


					task.wait(10)
				end)
			end
		end)

		local function Advertise()

			local Messages = {
				",gg/farmhub -> BEST JAILBREAK MONEY MAKER!!",
				",gg/farmhub -> GOOD FOR HYPERS!!",
				",gg/farmhub -> TRY IT, YOUR DAD COMES BACK!!",
				",gg/farmhub -> JOIN THE COOL KIDS!!",
				",gg/farmhub -> BEST OF ALL, ITS FREE!"

			}

			for i = 1, #Messages do
				wait(.25)
				pcall(function()
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(Messages[i], "All")
				end)
			end
		end

		task.spawn(function()
			while task.wait() do
				pcall(function()
					MoneyMade = game:GetService("Players").LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Money").Value - getgenv().StartingMoney
				end)
				pcall(function()
					RunTime = os.time() - getgenv().StartingTime
				end)
				MoneyEarnedLabel.Text = "Money Earned: $" .. FormatCash(MoneyMade)
				ElapsedTimeLabel.Text = "Elapsed Time: " .. TickToHM(RunTime)
				EstimatedHourlyLabel.Text = "Estimated Hourly: $" .. FormatCash(math.round((3600 / RunTime) * MoneyMade))
			end
		end)

		task.spawn(function()
			while task.wait() do
				if getgenv().Enabled then DropfarmSwitch:Set(true) else DropfarmSwitch:Set(false) end
				if getgenv().PickUpCash then PickupCashSwitch:Set(true) else PickupCashSwitch:Set(false) end
				if getgenv().RobCrate then RobCrateToggle:Set(true) else RobCrateToggle:Set(false) end
				if getgenv().RobShip then RobShipToggle:Set(true) else RobShipToggle:Set(false) end
				if getgenv().RobMansion then RobMansionToggle:Set(true) else RobMansionToggle:Set(false) end
                if LRM_IsUserPremium then
                    if getgenv().AutoOpenSafes then AutoOpenSafesToggle:Set(true) else AutoOpenSafesToggle:Set(false) end
                    if getgenv().LogWebhook then WebhookLogToggle:Set(true) else WebhookLogToggle:Set(false) end
                end
				if getgenv().Advertise then AdvertiseSwitch:Set(true) else AdvertiseSwitch:Set(false) end
				if getgenv().Mobile then MobileSwitch:Set(true) else MobileSwitch:Set(false) end

				if getgenv().Mobile then config.HeliSpeed = 750 end
			end
		end)

		local IsLoaded = false
		task.delay(15, function()
			if not IsLoaded then
				ServerHop()
			end
		end)

		HidePickingTeam()

		while humanoid == nil do
			task.wait(0.1)
		end

		task.spawn(function()
			game.Workspace.Terrain.WaterWaveSize = 0
			game.Workspace.Terrain.WaterWaveSpeed = 0
			game.Workspace.Terrain.WaterReflectance = 0
			game.Workspace.Terrain.WaterTransparency = 0
			game.Lighting.GlobalShadows = false
			game.Lighting.FogEnd = 9e9
			game.Lighting.Brightness = 0
			settings().Rendering.QualityLevel = "Level01"
			for i, v in pairs(game:GetDescendants()) do
				if v:IsA("Part") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
				elseif v:IsA("Decal") or v:IsA("Texture") then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
					v.Enabled = false
				elseif v:IsA("MeshPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
					v.TextureID = 10385902758728957
				end
			end
			for i, e in pairs(game.Lighting:GetChildren()) do
				if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
					e.Enabled = false
				end
			end
		end)

		IsLoaded = true

		LoadMap()

		task.spawn(function()
			while wait() do
				if getgenv().Advertise then
					Advertise()
					wait(25)
				end
			end
		end)

		task.spawn(function()
			while task.wait() do
				if IsArrested() and getgenv().Enabled then
					ServerHop() 
				end
			end
		end)

		task.spawn(function()
			while task.wait() do
				if player.Character.Humanoid.Health <= 0 and getgenv().Enabled then
					ServerHop()
				end
				task.wait()
			end
		end)

		task.spawn(function()
			while task.wait(300) and getgenv().Enabled do
				ServerHop()
			end
		end)

		CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
			if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
				if getgenv().Enabled then
					ServerHop()
				end
			end
		end)

		while task.wait() do
			if robberies.ship.open and not robberies.ship.hasRobbed and getgenv().RobShip and getgenv().Enabled then
				pcall(RobShip)
				robberies.ship.hasRobbed = true
			elseif game.Workspace:FindFirstChild("Drop") and getgenv().RobCrate and getgenv().Enabled then	
				pcall(RobCrate)				
			elseif robberies.mansion.open and player.Folder:FindFirstChild("MansionInvite") and getgenv().RobMansion and getgenv().Enabled then
				pcall(RobMansion)
			else
				if getgenv().Enabled then
					ServerHop()
				end
			end
		end
	end
	end
