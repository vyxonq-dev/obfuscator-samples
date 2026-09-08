-- Загрузка Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BULLY | San Diego Border RP",
   LoadingTitle = "Загрузка...",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local VehicleTab = Window:CreateTab("Vehicle", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)
local VisualTab = Window:CreateTab("Visual", 4483362458)
local DeleteTab = Window:CreateTab("Delete", 4483362458)
local AutoTab = Window:CreateTab("Auto", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local PlayerSpeedEnabled = false
local PlayerSpeed = 1.4

-- Настройки спидхака машины
local VehicleSpeedEnabled = false
local VehicleSpeedMode = "Legit" -- "Legit" или "Hard"
local VehicleAltSpeed = 200
local VehicleAltRisky = false

-- ESP настройки
local EspEnabled = false
local EspMaxDistance = 250
local EspObjects = {}

-- VFly настройки
local VFlyEnabled = false
local VFlySpeed = 45
local VFlyLoop = nil

-- Shift Lock настройки
local VehicleShiftLockEnabled = false
local ShiftLockLoop = nil

-- Авто-работа (BoxJob) настройки
local BoxJobEnabled = false
local BoxJobActiveRoutine = true
local FETCH_POS = Vector3.new(-25.368, 17.209, -71.160)
local DELIVER_POS = Vector3.new(2.932, 17.282, -62.212)

-- Aimbot и FOV настройки[cite: 2]
local AimbotEnabled = false
local AimbotSmoothness = 0.9
local AimbotPart = "Head"
local AimbotTeamCheck = true
local AimbotMaxDistance = 300
local AimbotFovRadius = 150
local AimbotShowFov = false
local AimbotLoop = nil
local AimbotToggle = nil
local CurrentTarget = nil

-- Рисование FOV круга[cite: 2]
local FovCircle = Drawing.new("Circle")
FovCircle.Color = Color3.fromRGB(255, 255, 255)
FovCircle.Thickness = 1.5
FovCircle.Filled = false
FovCircle.Transparency = 1
FovCircle.Visible = false

-- Поиск модуля VehicleUtil
local VehicleUtil
do
	local ok, module = pcall(function()
		return require(
			ReplicatedStorage
				:WaitForChild("SharedModules", 10)
				:WaitForChild("VehicleUtil", 10)
		)
	end)
	if ok and type(module) == "table" then
		VehicleUtil = module
	end
end

-- Логика спидхака авто
local AC_CONFIG = {
	AIR_GUARD = 2.5,
	SAFE_MULTIPLIER = 2,
	VehicleAttrs = setmetatable({}, { __mode = "k" }),
}

AC_CONFIG.resolveGeometry = function()
	if AC_CONFIG.Geometry then return AC_CONFIG.Geometry end
	local ok, geometry = pcall(function()
		return require(ReplicatedStorage:WaitForChild("SharedModules", 5):WaitForChild("AntiCheatGeometry", 5))
	end)
	if ok and type(geometry) == "table" then
		AC_CONFIG.Geometry = geometry
	end
	return AC_CONFIG.Geometry
end

AC_CONFIG.updateAirborne = function(vehicle, deltaTime)
	local geometry = AC_CONFIG.resolveGeometry()
	if not vehicle or not geometry or type(geometry.IsVehicleGrounded) ~= "function" then
		AC_CONFIG.AirborneSince = nil
		return false
	end
	AC_CONFIG.GroundPoll = (AC_CONFIG.GroundPoll or 0) + deltaTime
	if AC_CONFIG.GroundPoll >= 0.15 then
		AC_CONFIG.GroundPoll = 0
		local ok, grounded = pcall(geometry.IsVehicleGrounded, vehicle)
		if ok and grounded then
			AC_CONFIG.AirborneSince = nil
		elseif ok and not AC_CONFIG.AirborneSince then
			AC_CONFIG.AirborneSince = os.clock()
		end
	end
	local since = AC_CONFIG.AirborneSince
	return since ~= nil and (os.clock() - since) >= AC_CONFIG.AIR_GUARD
end

AC_CONFIG.resolveVehicle = function(humanoid)
	if not humanoid then return nil end
	if VehicleUtil then
		local ok, vehicle = pcall(function()
			return VehicleUtil:GetHumanoidDrivenVehicle(humanoid)
		end)
		if ok and vehicle then return vehicle end
		local seat = humanoid.SeatPart
		if seat then
			local okPart, fallback = pcall(function()
				return VehicleUtil:GetVehicleModelFromPart(seat)
			end)
			if okPart and fallback then return fallback end
		end
	end
	local seat = humanoid.SeatPart
	local vehicles = Workspace:FindFirstChild("Vehicles")
	if not seat or not vehicles then return nil end
	local object = seat
	while object and object.Parent ~= vehicles do
		object = object.Parent
	end
	if object and object.Parent == vehicles and object:IsA("Model") then
		return object
	end
	return nil
end

AC_CONFIG.getSafeMultiplier = function()
	local multiplier = math.clamp(VehicleAltSpeed / 100, 1, 6)
	if VehicleSpeedMode == "Legit" and not VehicleAltRisky then
		multiplier = math.min(multiplier, AC_CONFIG.SAFE_MULTIPLIER)
	elseif VehicleSpeedMode == "Hard" then
		multiplier = math.clamp(VehicleAltSpeed / 50, 1, 12)
	end
	return multiplier
end

AC_CONFIG.boostVehicle = function(vehicle, seat, root)
	if not vehicle or not vehicle.Parent then return false end
	local saved = AC_CONFIG.VehicleAttrs[vehicle]
	if not saved then
		saved = {
			Top = vehicle:GetAttribute("TopSpeedMultiplier"),
			Power = vehicle:GetAttribute("EnginePowerMultiplier"),
		}
		AC_CONFIG.VehicleAttrs[vehicle] = saved
	end
	local top = saved.Top or 1
	local power = saved.Power or 1
	local multiplier = AC_CONFIG.getSafeMultiplier()
	local target = top * multiplier
	local current = vehicle:GetAttribute("TopSpeedMultiplier")
	
	if type(current) ~= "number" or math.abs(current - target) >= 0.001 then
		pcall(function()
			vehicle:SetAttribute("TopSpeedMultiplier", target)
			vehicle:SetAttribute("EnginePowerMultiplier", power * multiplier)
		end)
	end

	if seat and root and seat:IsA("VehicleSeat") then
		local isBackward = UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.Down) or seat.ThrottleFloat < 0
		if isBackward then
			local reverseForce = (multiplier - 1) * 15
			root.AssemblyLinearVelocity = root.AssemblyLinearVelocity + (-seat.CFrame.LookVector * reverseForce * RunService.Heartbeat:Wait())
		end
	end
end

AC_CONFIG.restoreVehicles = function()
	for vehicle, saved in pairs(AC_CONFIG.VehicleAttrs) do
		if vehicle and vehicle.Parent then
			pcall(function()
				vehicle:SetAttribute("TopSpeedMultiplier", saved.Top)
				vehicle:SetAttribute("EnginePowerMultiplier", saved.Power)
			end)
		end
		AC_CONFIG.VehicleAttrs[vehicle] = nil
	end
end

-- Валидация цели для Аимбота[cite: 2]
local function isTargetValid(targetPart)
	if not targetPart or not targetPart.Parent then return false end
	local char = targetPart.Parent
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local myChar = LocalPlayer.Character
	local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")

	if not humanoid or humanoid.Health <= 0 or not myHrp then return false end
	local studDistance = (targetPart.Position - myHrp.Position).Magnitude
	if studDistance > AimbotMaxDistance then return false end

	local camera = Workspace.CurrentCamera
	local _, onScreen = camera:WorldToViewportPoint(targetPart.Position)
	return onScreen
end

local function getClosestPlayer()
	local camera = Workspace.CurrentCamera
	local mousePos = UserInputService:GetMouseLocation()
	local closestPlayer = nil
	local shortestDistance = math.huge
	local myChar = LocalPlayer.Character
	local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")

	if not myHrp then return nil end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			if not (AimbotTeamCheck and player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team) then
				local char = player.Character
				local targetPart = char and char:FindFirstChild(AimbotPart)
				local humanoid = char and char:FindFirstChildOfClass("Humanoid")

				if targetPart and humanoid and humanoid.Health > 0 then
					local studDistance = (targetPart.Position - myHrp.Position).Magnitude
					if studDistance <= AimbotMaxDistance then
						local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
						if onScreen then
							local fovDistance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
							if fovDistance <= AimbotFovRadius and fovDistance < shortestDistance then
								shortestDistance = fovDistance
								closestPlayer = targetPart
							end
						end
					end
				end
			end
		end
	end
	return closestPlayer
end

AimbotLoop = RunService.RenderStepped:Connect(function()
	local mousePos = UserInputService:GetMouseLocation()
	FovCircle.Position = mousePos
	FovCircle.Radius = AimbotFovRadius
	FovCircle.Visible = AimbotShowFov and AimbotEnabled

	if AimbotEnabled then
		if not isTargetValid(CurrentTarget) then
			CurrentTarget = getClosestPlayer()
		end

		if CurrentTarget then
			local camera = Workspace.CurrentCamera
			local targetCF = CFrame.new(camera.CFrame.Position, CurrentTarget.Position)
			camera.CFrame = camera.CFrame:Lerp(targetCF, AimbotSmoothness)
		end
	else
		CurrentTarget = nil
	end
end)

local QKeyConnection
QKeyConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.Q then
		AimbotEnabled = not AimbotEnabled
		if not AimbotEnabled then CurrentTarget = nil end
		if AimbotToggle then AimbotToggle:Set(AimbotEnabled) end
	end
end)

-- Функция определения цвета по фракции/розыску
local function getPlayerColor(player)
	local wantedLevel = player:GetAttribute("WantedLevel")
	local charWanted = player.Character and player.Character:GetAttribute("WantedLevel")
	
	if (typeof(wantedLevel) == "number" and wantedLevel > 0) or (typeof(charWanted) == "number" and charWanted > 0) or player:GetAttribute("Wanted") then
		return Color3.fromRGB(255, 50, 50)
	end

	local teamName = player.Team and player.Team.Name:lower() or ""
	
	if teamName:find("police") or teamName:find("cop") or teamName:find("sheriff") or teamName:find("police department") then
		return Color3.fromRGB(50, 120, 255)
	elseif teamName:find("border") or teamName:find("patrol") or teamName:find("guard") or teamName:find("army") or teamName:find("military") then
		return Color3.fromRGB(255, 220, 50)
	elseif teamName:find("civilian") or teamName:find("civil") or teamName:find("citizen") then
		return Color3.fromRGB(50, 255, 100)
	elseif player.TeamColor then
		return player.TeamColor.Color
	end

	return Color3.fromRGB(255, 255, 255)
end

-- Система ESP
local function removeEsp(player)
	if EspObjects[player] then
		if EspObjects[player].Highlight then EspObjects[player].Highlight:Destroy() end
		if EspObjects[player].Billboard then EspObjects[player].Billboard:Destroy() end
		if EspObjects[player].Connection then EspObjects[player].Connection:Disconnect() end
		EspObjects[player] = nil
	end
end

local function applyEsp(player)
	if player == LocalPlayer then return end
	removeEsp(player)

	if not EspEnabled then return end

	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end

	local color = getPlayerColor(player)

	local highlight = Instance.new("Highlight")
	highlight.Name = "ESP_Highlight"
	highlight.Adornee = char
	highlight.FillColor = color
	highlight.FillTransparency = 0.5
	highlight.OutlineColor = color
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.Parent = char

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "ESP_Billboard"
	billboard.Adornee = head
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 2.5, 0)
	billboard.MaxDistance = EspMaxDistance
	billboard.AlwaysOnTop = true

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Parent = billboard
	nameLabel.Size = UDim2.new(1, 0, 1, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = player.Name
	nameLabel.TextColor3 = color
	nameLabel.TextStrokeTransparency = 0
	nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	nameLabel.Font = Enum.Font.SourceSansBold
	nameLabel.TextSize = 14

	billboard.Parent = head

	local conn = player:GetAttributeChangedSignal("WantedLevel"):Connect(function()
		if EspEnabled then applyEsp(player) end
	end)

	EspObjects[player] = { Highlight = highlight, Billboard = billboard, Connection = conn }
end

local function updateAllEsp()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			if EspEnabled then
				applyEsp(player)
			else
				removeEsp(player)
			end
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)
		if EspEnabled then applyEsp(player) end
	end)
end)

Players.PlayerRemoving:Connect(removeEsp)

for _, player in ipairs(Players:GetPlayers()) do
	player.CharacterAdded:Connect(function()
		task.wait(1)
		if EspEnabled then applyEsp(player) end
	end)
end

-- Функция полёта на транспорте (VFly)
local function startVFly()
	if VFlyLoop then VFlyLoop:Disconnect() end
	VFlyLoop = RunService.RenderStepped:Connect(function()
		if not VFlyEnabled then return end
		local char = LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		local seat = hum and hum.SeatPart
		
		if seat and seat:IsA("VehicleSeat") then
			local root = seat.AssemblyRootPart or seat
			local camera = Workspace.CurrentCamera
			local moveDir = Vector3.zero

			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				moveDir = moveDir + camera.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				moveDir = moveDir - camera.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				moveDir = moveDir - camera.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				moveDir = moveDir + camera.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				moveDir = moveDir + Vector3.new(0, 1, 0)
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
				moveDir = moveDir - Vector3.new(0, 1, 0)
			end

			root.AssemblyLinearVelocity = moveDir * (VFlySpeed * 10)

			local lookDir = Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z)
			if lookDir.Magnitude > 0.001 then
				root.CFrame = CFrame.lookAt(root.Position, root.Position + lookDir)
			end

			root.AssemblyAngularVelocity = Vector3.zero
		end
	end)
end

local function stopVFly()
	if VFlyLoop then
		VFlyLoop:Disconnect()
		VFlyLoop = nil
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.L then
		local char = LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum and hum.SeatPart then
			VFlyEnabled = not VFlyEnabled
			if VFlyEnabled then
				startVFly()
			else
				stopVFly()
			end
		end
	end

	if input.KeyCode == Enum.KeyCode.R then
		local remotes = ReplicatedStorage:FindFirstChild("__remotes")
		local vehicleService = remotes and remotes:FindFirstChild("VehicleService")
		local unstuckRemote = vehicleService and vehicleService:FindFirstChild("UnstuckVehicle")

		if unstuckRemote then
			unstuckRemote:FireServer()
		end
	end
end)

ShiftLockLoop = RunService.RenderStepped:Connect(function()
	local char = LocalPlayer.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	
	if VehicleShiftLockEnabled and hum and hum.SeatPart then
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
	else
		if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter and VehicleShiftLockEnabled then
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		local char = LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		
		if hum and hum.SeatPart then
			VehicleShiftLockEnabled = not VehicleShiftLockEnabled
			if not VehicleShiftLockEnabled then
				UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			end
		end
	end
end)

local function removeBankWalls()
   local removedCount = 0

   local targets = {
      { Size = Vector3.new(75, 1.5, 17.5), Pos = Vector3.new(-236.858, 4.839, -261.628) },
      { Size = Vector3.new(74, 2.5, 0.01), Pos = Vector3.new(-236.359, -2.661, -262.403) },
      { Size = Vector3.new(6, 1, 10.5), Pos = Vector3.new(-274.108, 2.089, -251.878) },
      { Size = Vector3.new(6, 1, 10.5), Pos = Vector3.new(-274.108, 2.089, -245.378) },
      { Size = Vector3.new(20, 13.5, 0.5), Pos = Vector3.new(-273.608, 1.839, -233.228) },
      { Size = Vector3.new(6, 1, 10.5), Pos = Vector3.new(-274.108, 2.089, -238.878) },
   }

   for _, part in ipairs(Workspace:GetDescendants()) do
      if part:IsA("BasePart") then
         for _, target in ipairs(targets) do
            local sizeMatch = (part.Size - target.Size).Magnitude < 0.5
            local posMatch = (part.CFrame.Position - target.Pos).Magnitude < 3.0

            if sizeMatch and posMatch then
               part:Destroy()
               removedCount = removedCount + 1
               break
            end
         end
      end
   end

   return removedCount
end

local PlayerLoop = RunService.Heartbeat:Connect(function()
   if PlayerSpeedEnabled and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
      local char = LocalPlayer.Character
      if char then
         local hrp = char:FindFirstChild("HumanoidRootPart")
         local hum = char:FindFirstChildOfClass("Humanoid")
         if hrp and hum and hum.MoveDirection.Magnitude > 0 and not hum.SeatPart then
            hrp.CFrame = hrp.CFrame + (hum.MoveDirection * (PlayerSpeed * 0.1))
         end
      end
   end
end)

local VehicleLoop = RunService.Heartbeat:Connect(function(deltaTime)
   local altHeld = UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) or UserInputService:IsKeyDown(Enum.KeyCode.RightAlt)
   
   if VehicleSpeedEnabled and altHeld then
      local char = LocalPlayer.Character
      local hum = char and char:FindFirstChildOfClass("Humanoid")
      if hum and hum.SeatPart then
         local seat = hum.SeatPart
         local root = seat.AssemblyRootPart or seat
         if root then
            local vehicle = AC_CONFIG.resolveVehicle(hum)
            if AC_CONFIG.updateAirborne(vehicle, deltaTime) then
               local velocity = root.AssemblyLinearVelocity
               root.AssemblyLinearVelocity = Vector3.new(velocity.X, math.min(velocity.Y, -40), velocity.Z)
            else
               AC_CONFIG.boostVehicle(vehicle, seat, root)
            end
         end
      end
   else
      AC_CONFIG.restoreVehicles()
   end
end)

-- Функция бега для авто-работы с мгновенным прерыванием
local function moveToTargetForJob(pos)
	local char = LocalPlayer.Character
	if not char then return false end
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local rootPart = char:FindFirstChild("HumanoidRootPart")
	
	if humanoid and rootPart then
		humanoid:MoveTo(pos)
		
		local startTime = tick()
		repeat
			task.wait(0.1)
			if not BoxJobEnabled or not BoxJobActiveRoutine then 
				humanoid:MoveTo(rootPart.Position)
				return false 
			end
		until (rootPart.Position - pos).Magnitude < 4 or (tick() - startTime) > 10
		
		return true
	end
	return false
end

-- Фоновый поток авто-работы
task.spawn(function()
	while BoxJobActiveRoutine do
		if BoxJobEnabled then
			local reachedFetch = moveToTargetForJob(FETCH_POS)
			
			if reachedFetch and BoxJobEnabled and BoxJobActiveRoutine then
				pcall(function()
					local fetchArgs = {
						Workspace:WaitForChild("Gameplay"):WaitForChild("BoxJob"):WaitForChild("PromptParts"):WaitForChild("FetchPromptPart")
					}
					ReplicatedStorage:WaitForChild("__remotes"):WaitForChild("BoxJobService"):WaitForChild("FetchBox"):FireServer(unpack(fetchArgs))
				end)
				task.wait(0.5)
			end
			
			if BoxJobEnabled and BoxJobActiveRoutine then
				local reachedDeliver = moveToTargetForJob(DELIVER_POS)
				
				if reachedDeliver and BoxJobEnabled and BoxJobActiveRoutine then
					pcall(function()
						local deliverArgs = {
							Workspace:WaitForChild("Gameplay"):WaitForChild("BoxJob"):WaitForChild("PromptParts"):WaitForChild("DeliverPromptPart")
						}
						ReplicatedStorage:WaitForChild("__remotes"):WaitForChild("BoxJobService"):WaitForChild("DeliverBox"):FireServer(unpack(deliverArgs))
					end)
					task.wait(0.5)
				end
			end
		else
			task.wait(0.2)
		end
	end
end)

-- Вкладка Vehicle
VehicleTab:CreateSection("Управление машиной")
VehicleTab:CreateToggle({
   Name = "SpeedHack (Alt)",
   CurrentValue = false,
   Callback = function(v) 
      VehicleSpeedEnabled = v 
      if not v then AC_CONFIG.restoreVehicles() end
   end
})
VehicleTab:CreateDropdown({
   Name = "SpeedHack Mode",
   Options = {"Legit", "Hard"},
   CurrentOption = {"Legit"},
   MultipleOptions = false,
   Callback = function(v)
      VehicleSpeedMode = v[1] or v
      AC_CONFIG.restoreVehicles()
   end
})
VehicleTab:CreateSlider({
   Name = "Speed",
   Range = {100, 400},
   Increment = 5,
   CurrentValue = 200,
   Callback = function(v) VehicleAltSpeed = v end
})
VehicleTab:CreateToggle({
   Name = "AntiTip",
   CurrentValue = false,
   Callback = function(v) VehicleAltRisky = v end
})

VehicleTab:CreateSection("Горячие клавиши (Binds)")
VehicleTab:CreateLabel("Vehicle Fly — [L]")
VehicleTab:CreateLabel("Unstuck Vehicle — [R]")

-- Вкладка Combat (Аимбот и FOV)[cite: 2]
CombatTab:CreateSection("Аимбот")
AimbotToggle = CombatTab:CreateToggle({
   Name = "Aimbot Enabled [Q]",
   CurrentValue = false,
   Callback = function(v) AimbotEnabled = v if not v then CurrentTarget = nil end end
})
CombatTab:CreateSlider({
   Name = "Smoothness",
   Range = {0.05, 1},
   Increment = 0.05,
   CurrentValue = 0.9,
   Callback = function(v) AimbotSmoothness = v end
})
CombatTab:CreateSlider({
   Name = "Max Distance (Studs)",
   Range = {50, 1000},
   Increment = 25,
   CurrentValue = 300,
   Callback = function(v) AimbotMaxDistance = v end
})
CombatTab:CreateDropdown({
   Name = "Target Part",
   Options = {"Head", "HumanoidRootPart"},
   CurrentOption = {"Head"},
   MultipleOptions = false,
   Callback = function(v) AimbotPart = v[1] or v end
})
CombatTab:CreateToggle({
   Name = "Team Check",
   CurrentValue = true,
   Callback = function(v) AimbotTeamCheck = v end
})

CombatTab:CreateSection("Настройки FOV")
CombatTab:CreateToggle({
   Name = "Show FOV Circle",
   CurrentValue = false,
   Callback = function(v) AimbotShowFov = v end
})
CombatTab:CreateSlider({
   Name = "FOV Radius",
   Range = {20, 500},
   Increment = 5,
   CurrentValue = 150,
   Callback = function(v) AimbotFovRadius = v end
})

-- Вкладка Player
PlayerTab:CreateSection("Перемещение")
PlayerTab:CreateToggle({
   Name = "SpeedHack (LeftShift)",
   CurrentValue = false,
   Callback = function(v) PlayerSpeedEnabled = v end
})
PlayerTab:CreateSlider({
   Name = "Speed",
   Range = {0, 5},
   Increment = 0.1,
   CurrentValue = 1.4,
   Callback = function(v) PlayerSpeed = v end
})

-- Вкладка Visual
VisualTab:CreateSection("Игроки")
VisualTab:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Callback = function(v)
      EspEnabled = v
      updateAllEsp()
   end
})

-- Вкладка Delete
DeleteTab:CreateSection("Объекты")
DeleteTab:CreateButton({
   Name = "Bank Wall",
   Callback = function()
      local count = removeBankWalls()
      if count > 0 then
         Rayfield:Notify({ Title = "Успешно", Content = "Удалено объектов: " .. count, Duration = 3 })
      else
         Rayfield:Notify({ Title = "Информация", Content = "Объекты не найдены или уже удалены", Duration = 3 })
      end
   end
})

-- Вкладка Auto
AutoTab:CreateSection("Jobs")
AutoTab:CreateToggle({
   Name = "Auto Job (Boxes)",
   CurrentValue = false,
   Callback = function(v)
      BoxJobEnabled = v
      if not v then
         local char = LocalPlayer.Character
         if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):MoveTo(char.HumanoidRootPart.Position)
         end
      end
   end
})

-- Вкладка Settings
SettingsTab:CreateButton({
   Name = "Unload Script",
   Callback = function()
      PlayerSpeedEnabled = false
      VehicleSpeedEnabled = false
      EspEnabled = false
      VFlyEnabled = false
      VehicleShiftLockEnabled = false
      BoxJobEnabled = false
      BoxJobActiveRoutine = false
      AimbotEnabled = false
      CurrentTarget = nil
      FovCircle.Visible = false
      pcall(function() FovCircle:Remove() end)
      UserInputService.MouseBehavior = Enum.MouseBehavior.Default
      stopVFly()
      updateAllEsp()
      AC_CONFIG.restoreVehicles()
      if PlayerLoop then PlayerLoop:Disconnect() end
      if VehicleLoop then VehicleLoop:Disconnect() end
      if ShiftLockLoop then ShiftLockLoop:Disconnect() end
      if AimbotLoop then AimbotLoop:Disconnect() end
      if QKeyConnection then QKeyConnection:Disconnect() end
      Rayfield:Destroy()
   end
})