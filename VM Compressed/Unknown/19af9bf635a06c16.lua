local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild('Humanoid')
local hrp = character:WaitForChild('HumanoidRootPart')
local Debris = game:GetService('Debris')
local UserInputService = game:GetService("UserInputService")

local MainTab

local isJason
local selectedItem
local toggleHealing
local toggleNoclip
local toggleStaticscreen
local ValueSpeedHax = 30
local ValueSpinning = 20
local toggleSpinning
local toggleESPName
local toggleESPChams
local espBoxes = {}
local chams = {}
local Flying
local FlySpeed = 50
local flyConn

local Rayfield = loadstring(
	game:HttpGet(
		'https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'
	)
)()

local Window = Rayfield:CreateWindow({
	Name = 'amsk hax - Summer Campblood | version 1.0',
	Icon = 0,
	LoadingTitle = 'amsk hax for Summer Campblood',
	LoadingSubtitle = 'by amsk',
	Theme = "Default",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = 'Big Hub',
	},
})

function DoNotif(title, message, duration, image)
	Rayfield:Notify({
		Title = title,
		Content = message,
		Duration = duration,
		Image = image,
	})
end

local function TeleportTo(x, y, z)
	local Players = game:GetService('Players')
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild('Humanoid')
	local hrp = character:WaitForChild('HumanoidRootPart')
	local Position = Vector3.new(x, y, z)
	local offset = Vector3.new(0, 5, 0)
	local destination = Position + offset
	hrp.CFrame = CFrame.new(destination)
end

local function FindJason()
	for _, player in pairs(Players:GetPlayers()) do
		local backpack = player:FindFirstChild('Backpack')
		if backpack then
			for _, tool in pairs(backpack:GetChildren()) do
				if
					tool:IsA('Tool')
					and (
						tool.Name == 'J.L Shift'
						or tool.Name == 'J.L Teleport'
					)
				then
					isJason = player.Name
					DoNotif('Jason found:', isJason, 6.4)
				end
			end
		end
	end
end

function FindItem(item_name)
	local Players = game:GetService('Players')
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:WaitForChild('HumanoidRootPart')
	local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('Items')
	local targetItem = itemsFolder:FindFirstChild(item_name)

	if targetItem and targetItem:IsA('BasePart') then
		local offset = Vector3.new(0, 0, 3)
		local destination = targetItem.Position + offset
		hrp.CFrame = CFrame.new(destination)
		DoNotif('Find item', 'Teleported to item: ' .. item_name .. '', 6.5)
	else
		DoNotif('Find item', 'Item not found...', 6.5)
	end
end

function HealAllPlayersLoop()
	while toggleHealing do
		local success, err = pcall(function()
			game
				:GetService('ReplicatedStorage')
				:WaitForChild('Events')
				:WaitForChild('HealAllPlayers')
				:FireServer()
		end)
		task.wait(3)
	end
end

function StaticScreenLoop()
	while toggleStaticscreen do
		local success, err = pcall(function()
			game
				:GetService('ReplicatedStorage')
				:WaitForChild('Teleport')
				:FireServer()
		end)
		task.wait(1.2)
	end
end

function startFly()
    local bodyVel = Instance.new("BodyVelocity")
    bodyVel.Velocity = Vector3.new(0, 0, 0)
    bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bodyVel.Name = "FlyVelocity"
    bodyVel.Parent = hrp

    -- Met à jour la vélocité selon les touches pressées
    flyConn = RunService.Heartbeat:Connect(function()
        if Flying then
            local direction = Vector3.new()
            local camCF = workspace.CurrentCamera.CFrame

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                direction += camCF.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                direction -= camCF.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                direction -= camCF.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                direction += camCF.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                direction += Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                direction -= Vector3.new(0, 1, 0)
            end

            if direction.Magnitude > 0 then
                bodyVel.Velocity = direction.Unit * FlySpeed
            else
                bodyVel.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
end

function stopFly()
    Flying = false
    if hrp:FindFirstChild("FlyVelocity") then
        hrp.FlyVelocity:Destroy()
    end
    if flyConn then
        flyConn:Disconnect()
        flyConn = nil
    end
end

local function createESP(player)
	if player == localPlayer then
		return
	end

	local character = player.Character or player.CharacterAdded:Wait()
	local head = character:WaitForChild('Head')

	-- Nom au-dessus de la tête
	local billboard = Instance.new('BillboardGui')
	billboard.Name = 'ESP'
	billboard.Size = UDim2.new(0, 100, 0, 20)
	billboard.Adornee = head
	billboard.AlwaysOnTop = true
	billboard.StudsOffset = Vector3.new(0, 3, 0) -- plus haut

	local label = Instance.new('TextLabel')
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = player.Name
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.SourceSansBold
	label.TextScaled = true
	label.Parent = billboard

	billboard.Parent = head
	espBoxes[player] = billboard

	-- Chams sur les parties du corps visibles (hors accessoires & hitbox)
	for _, part in pairs(character:GetChildren()) do
		if part:IsA('BasePart') and part.Name ~= 'HumanoidRootPart' then
			local cham = Instance.new('BoxHandleAdornment')
			cham.Name = 'Cham'
			cham.Adornee = part
			cham.AlwaysOnTop = true
			cham.ZIndex = 5
			cham.Size = part.Size
			cham.Color3 = Color3.fromRGB(150, 150, 150)
			cham.Transparency = 0.9
			cham.Parent = part

			chams[player] = chams[player] or {}
			table.insert(chams[player], cham)
		end
	end
end

-- Supprimer ESP et chams
local function removeESP(player)
	if espBoxes[player] then
		espBoxes[player]:Destroy()
		espBoxes[player] = nil
	end
	if chams[player] then
		for _, cham in ipairs(chams[player]) do
			cham:Destroy()
		end
		chams[player] = nil
	end
end

local function flingAndReturn(targetPlayerName)
	local localPlayer = Players.LocalPlayer
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local hrp = character:WaitForChild('HumanoidRootPart')

	local originalCFrame = hrp.CFrame

	local targetPlayer = Players:FindFirstChild(targetPlayerName)
	if not targetPlayer or not targetPlayer.Character then
		return
	end

	local targetHRP = targetPlayer.Character:FindFirstChild('HumanoidRootPart')
	if not targetHRP then
		return
	end

	-- TELEPORT TO THE TARGET PLAYER (directly inside their HumanoidRootPart)
	hrp.CFrame = targetHRP.CFrame

	-- SPIN FLING
	local spin = Instance.new('BodyAngularVelocity')
	spin.AngularVelocity = Vector3.new(0, 999999, 0)
	spin.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
	spin.P = 3000
	spin.Name = 'FlingSpin'
	spin.Parent = hrp

	local fling = Instance.new('BodyVelocity')
	fling.Velocity = Vector3.new(0, 150, 0)
	fling.MaxForce = Vector3.new(1e6, 1e6, 1e6)
	fling.P = 3000
	fling.Name = 'FlingForce'
	fling.Parent = hrp

	-- MAINTAINING POSITION INSIDE THE TARGET PLAYER
	local running = true
	local connection = RunService.Heartbeat:Connect(function()
		if running and targetHRP and hrp then
			-- Keep character inside target (aligned perfectly)
			local offset = Vector3.new(0, 0, 0)
			local destination = targetHRP.Position + offset
			hrp.CFrame = targetHRP.CFrame
		end
	end)

	-- STOP the fling after 1.5 seconds (remove forces)
	task.delay(3.5, function()
		if hrp:FindFirstChild('FlingSpin') then
			hrp.FlingSpin:Destroy()
		end
		if hrp:FindFirstChild('FlingForce') then
			hrp.FlingForce:Destroy()
		end
	end)

	-- AFTER 5 seconds: stop the lock and wait 3 more seconds to teleport back to original position
	task.delay(7, function()
		running = false
		connection:Disconnect()

		-- Wait for 3 seconds after the fling has stopped
		task.delay(6, function()
			-- RETURN TO THE ORIGINAL POSITION
			game.ReplicatedStorage:WaitForChild("RespawnPlayer"):FireServer()
		end)
	end)
end

local function BringJason()
	local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('CarEscape'):WaitForChild('Car')
	local targetItem = itemsFolder:FindFirstChild('DriveSeat')
	TeleportTo(-4249.82861, -90.260437, 664.983643)
end

local function UnlockCar()
	local targetItem = workspace:WaitForChild('Map'):WaitForChild('CarEscape')
	local car = targetItem.Car 
	local seat = car:WaitForChild('DriveSeat') seat.Disabled = false 
	local blockcar = targetItem:WaitForChild('BlockCar') blockcar.CanCollide = false 
	local items = workspace:WaitForChild('Map'):WaitForChild('CarEscape') 
	local target = items:FindFirstChild('BlockCar') 
	TeleportTo(target.Position.X, target.Position.Y, target.Position.Z)
end

local function UnlockPhoneCall()
	local items = workspace:WaitForChild('Map'):WaitForChild('PhoneEscape'):WaitForChild('PowerBox'):WaitForChild('Box') 
	local target = items:FindFirstChild('Door') 
	TeleportTo(target.Position.X, target.Position.Y, target.Position.Z)

	local items = workspace:WaitForChild('Map'):WaitForChild('PhoneEscape'):WaitForChild('PowerPanel')
	local target = items:FindFirstChild('Panel') 
	TeleportTo(target.Position.X, target.Position.Y, target.Position.Z)
end

RunService.Stepped:Connect(function()
	-- Noclip
	if toggleNoclip and character then
		for _, part in pairs(character:GetDescendants()) do
			if part:IsA('BasePart') then
				part.CanCollide = false
			end
		end
	end

	--Spinning
	if toggleSpinning and hrp then
		local Players = game:GetService('Players')
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild('HumanoidRootPart')
		hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(ValueSpinning), 0)
	end
end)

function ChangeWalkSpeed(value)
	local Players = game:GetService('Players')
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild('Humanoid')
	humanoid.WalkSpeed = value
end

function MakeSitAnimation(toggle)
	local Players = game:GetService('Players')
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild('Humanoid')
	humanoid.Sit = toggle
end

function DoSeperationBar()
	MainTab:CreateDivider()
end

function CreateTab(name, icon)
	MainTab = Window:CreateTab(name, icon)	
end

function CreateSection(name)
	MainTab:CreateSection(name)
end

function CreateButton(name, callbackFunction)
	MainTab:CreateButton({ Name = name, Callback = callbackFunction })
end

function CreateToggle(name, currentvalue, flag, toggleCallback)
	MainTab:CreateToggle({ Name = name, CurrentValue = currentvalue, Flag = flag, Callback = toggleCallback, })
end

function CreateSlider(name, min, max, incre, suffix, curval, flag, slideCallback)
	MainTab:CreateSlider({ Name = name, Range = { min, max }, Increment = incre, Suffix = suffix, CurrentValue = curval, Flag = flag, Callback = function(Value) slideCallback(Value) end, })
end

-- Universal Page
CreateTab('Universal', 4483362458)
CreateSection('Options')
CreateSlider('Speed value', 0, 500, 5, ' value', 30, 'Slider1', function(value) ValueSpeedHax = value end)
CreateToggle('Speed hack', false, 'ToggleSpeed', function(value) if value then ChangeWalkSpeed(ValueSpeedHax) else ChangeWalkSpeed(16) end end)
CreateSlider('Spinning value', 0, 1000, 1, ' value', 20, 'Slider2', function(value) ValueSpinning = value end)
CreateToggle('Spin Hack', toggleSpinning, 'ToggleSpin', function(value) toggleSpinning = value end)
DoSeperationBar()
CreateToggle('Fly', Flying, 'ToggleFly', function(value) Flying = value if Flying then startFly() else stopFly() end end)
CreateToggle('No-clip', toggleNoclip, 'ToggleNoclip', function(value) toggleNoclip = value end)
CreateToggle('Sit Animation', false, 'ToggleSit', function(value) if value then MakeSitAnimation(true) else MakeSitAnimation(false) end end)

-- Teleport To Items Page
CreateTab('Teleport To Items', 4483362458)
CreateSection('Teleport To Items')

MainTab:CreateDropdown({
	Name = 'Select a item',
	Options = {
		'Shotgun',
		'Firecracker',
		'Axe',
		'BaseballBat',
		'FlareGun',
		'Medkit',
		'Propeller',
		'Wrench',
		'Gasoline',
	},
	CurrentOption = 'Axe',
	MultipleOptions = false,
	Flag = 'Dropdown1',
	Callback = function(Options)
		selectedItem = Options[1]
	end,
})

CreateButton('Teleport to item', function() FindItem(selectedItem) end)

-- Teleport To Location  Page
CreateTab('Locations', 4483362458)
CreateSection('Location')
CreateButton('Car', function() local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('CarEscape') local targetItem = itemsFolder:FindFirstChild('BlockCar') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('Boat', function() local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('BoatEscape'):WaitForChild('Boat') local targetItem = itemsFolder:FindFirstChild('Floor') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('Generator Lights', function() local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('GeneratorLights') local targetItem = itemsFolder:FindFirstChild('Switch_trigger') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('J.L Shack', function() local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('J.L Shack') local targetItem = itemsFolder:FindFirstChild('Object_0') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('Wall Phone', function() local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('PhoneEscape'):WaitForChild('WallPhone') local targetItem = itemsFolder:FindFirstChild('Body1') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('Police Car', function() local itemsFolder = workspace:WaitForChild('Map'):WaitForChild('PhoneEscape') local targetItem = itemsFolder:FindFirstChild('PoliceCar') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('Teleport to lobby', function() TeleportTo(646.410522, -70.775177, -630.402832) end)
CreateButton('Teleport to first map', function() TeleportTo(-189.5309295654297, -13.80276107788086, 1297.7677001953125) end)
CreateButton('Teleport to seconds map', function() TeleportTo(-4195.2880859375, -90.08988952636719, 1467.4874267578125) end)
CreateButton('Teleport to secret map', function() TeleportTo(460.2000427246094, -512.125244140625, 1114.751220703125) end)
CreateButton('XP Giver ?', function() TeleportTo(-699.395752, -39.3370667, 302.164673) end)
CreateButton('Cutscene Starting', function() TeleportTo(-361.289215, -26.7751617, -140.444809) end)
CreateButton('Broken Watch Tower', function() TeleportTo(167, -52, 1207) end)

-- Visual Page
CreateTab('Visual', 4483362458)
CreateSection('Options')
CreateToggle('ESP & Chams Players', toggleESP, 'ToggleNoclip', function(value) toggleESP = value for _, player in pairs(Players:GetPlayers()) do if player ~= localPlayer then if toggleESP then createESP(player) else removeESP(player) end end end Players.PlayerAdded:Connect(function(player) player.CharacterAdded:Connect(function() if toggleESP then createESP(player) end end) end) Players.PlayerRemoving:Connect(removeESP) end)

-- Options Page
CreateTab('Options', 4483362458)
CreateSection('Summer Campblood Options')
CreateButton('Relive (Respawn in game)', function() game:GetService('ReplicatedStorage'):WaitForChild('LobbyFix'):FireServer() end)
CreateToggle('Heal All Players (Invincible)', toggleHealing, 'ToggleHeal', function(value) toggleHealing = value if toggleHealing then task.spawn(HealAllPlayersLoop) DoNotif('Heal All Player', 'Auto-Heal enabled.', 4) else DoNotif('Heal All Player', 'Auto-Heal disabled.', 4) end end)
CreateToggle('Static Screen', false, 'toggleStaticscreen', function(value) toggleStaticscreen = value if toggleStaticscreen then task.spawn(StaticScreenLoop) DoNotif('Static Screen', 'Static Screen enabled.', 4) else DoNotif('Static Screen', 'Static Screen disabled.', 4) end end)
CreateToggle('Invisible', false, 'toggleinvisible', function(value) if value then game:GetService('ReplicatedStorage'):WaitForChild('InvisibilityEvent'):FireServer(value) else game:GetService('ReplicatedStorage'):WaitForChild('InvisibilityEvent'):FireServer(value) end end)
CreateButton('Find Who Is Jason', function() FindJason() end)
CreateButton('Teleport To Jason', function() FindJason() local itemsFolder = workspace:WaitForChild(isJason) local targetItem = itemsFolder:FindFirstChild('HumanoidRootPart') TeleportTo(targetItem.Position.X, targetItem.Position.Y, targetItem.Position.Z) end)
CreateButton('Kill Jason (End Game)', function()  FindJason() flingAndReturn(isJason) end)
CreateButton('Bring Jason (BETA)', function()  FindJason() BringJason() end)
CreateToggle('Change Rain', false, 'toggleRain', function(value) if value then local replicatedstorage = game:GetService('ReplicatedStorage') local server = replicatedstorage.Server local character = player.Character or player.CharacterAdded:Wait() local rain = server:WaitForChild('Rain') rain.Value = value else local replicatedstorage = game:GetService('ReplicatedStorage') local server = replicatedstorage.Server local character = player.Character or player.CharacterAdded:Wait() local rain = server:WaitForChild('Rain') rain.Value = value end end)
CreateButton('Unlock Car', function() UnlockCar() end)
CreateButton('Unlock Phone Call', function() UnlockPhoneCall() end)
