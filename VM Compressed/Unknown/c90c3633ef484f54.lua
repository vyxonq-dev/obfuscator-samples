local BaseSettings = {
	AntiDetect = false,

}

return function(Settings:{},Plugins:{})
	for i,v in Settings do
		BaseSettings[i] = v
	end

	local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

	local RS = game:GetService('RunService')
	local TS = game:GetService('TweenService')
	local PPS = game:GetService('ProximityPromptService')
	local UIS = game:GetService('UserInputService')
	local VU = game:GetService('VirtualUser')

	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local camera = workspace.CurrentCamera
	local RootParent = workspace.Terrain
	local GuiParent = game:GetService("CoreGui")

	local Window = Rayfield:CreateWindow({
		Name = "RT hub",
		Icon = 0,
		LoadingTitle = "RT hub",
		LoadingSubtitle = "by ---",
		ShowText = "RT hub",
		Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

		ToggleUIKeybind = Enum.KeyCode.LeftControl,

		DisableRayfieldPrompts = false,
		DisableBuildWarnings = false,

		ConfigurationSaving = {
			Enabled = true,
			FolderName = 'RTHUB_CONFIG',
			FileName = "RT hub"
		},
	})


	--FUNCTIONS
	local FlyEnabled, FlySpeed = false, 20
	local FlyContainer
	local function Fly(Value)
		FlyEnabled = Value
		if FlyEnabled then
			if not BaseSettings.AntiDetect then
				FlyContainer = Instance.new('Part')
				FlyContainer.CanCollide = false
				FlyContainer.CanTouch = false
				FlyContainer.CanQuery = false
				FlyContainer.Transparency = 1
				FlyContainer.Anchored = false
				FlyContainer.Locked = true
				FlyContainer.Name = 'FlyContainer'
				FlyContainer.Parent = RootParent

				local BodyVelocity = Instance.new('BodyVelocity')
				BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				BodyVelocity.Velocity = Vector3.zero
				BodyVelocity.P = 1000
				BodyVelocity.Parent = FlyContainer
				local BodyGyro = Instance.new('BodyGyro')
				BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
				BodyGyro.P = 1000
				BodyGyro.D = 50
				BodyGyro.Parent = FlyContainer

				local Weld = Instance.new('Weld')
				Weld.Part0 = game.Players.LocalPlayer.Character.PrimaryPart
				Weld.Part1 = FlyContainer
				Weld.C0 = CFrame.new()
				Weld.Parent = FlyContainer


				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true

				game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
					if FlyEnabled then
						character.Humanoid.PlatformStand = true
						Weld:Destroy()
						Weld = Instance.new('Weld')
						Weld.Part0 = game.Players.LocalPlayer.Character.PrimaryPart
						Weld.Part1 = FlyContainer
						Weld.C0 = CFrame.new()
						Weld.Parent = FlyContainer
					end
				end)

				while FlyEnabled do
					task.wait()
					local camera = workspace.CurrentCamera
					local direction = Vector3.zero

					if UIS:IsKeyDown(Enum.KeyCode.W) then
						direction = direction + camera.CFrame.LookVector
					end
					if UIS:IsKeyDown(Enum.KeyCode.S) then
						direction = direction - camera.CFrame.LookVector
					end

					if UIS:IsKeyDown(Enum.KeyCode.A) then
						direction = direction - camera.CFrame.RightVector
					end
					if UIS:IsKeyDown(Enum.KeyCode.D) then
						direction = direction + camera.CFrame.RightVector
					end

					if UIS:IsKeyDown(Enum.KeyCode.Space) then
						direction = direction + Vector3.new(0, 1, 0)
					end
					if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
						direction = direction + Vector3.new(0, -1, 0)
					end

					if direction.Magnitude > 0 then
						direction = direction.Unit * FlySpeed
					end

					BodyVelocity.Velocity = direction
					BodyGyro.CFrame = camera.CFrame
				end
			else
				player.Character.PrimaryPart.Anchored = true
				while FlyEnabled do
					task.wait()
					if UIS:IsKeyDown(Enum.KeyCode.W) then
						player.Character.PrimaryPart.CFrame += camera.CFrame.LookVector * FlySpeed * 0.0166
					end
					if UIS:IsKeyDown(Enum.KeyCode.S) then
						player.Character.PrimaryPart.CFrame -= camera.CFrame.LookVector * FlySpeed * 0.0166
					end
					if UIS:IsKeyDown(Enum.KeyCode.A) then
						player.Character.PrimaryPart.CFrame -= camera.CFrame.RightVector * FlySpeed * 0.0166
					end
					if UIS:IsKeyDown(Enum.KeyCode.D) then
						player.Character.PrimaryPart.CFrame += camera.CFrame.RightVector * FlySpeed * 0.0166
					end
					if UIS:IsKeyDown(Enum.KeyCode.Space) then
						player.Character.PrimaryPart.CFrame += camera.CFrame.UpVector * FlySpeed * 0.0166
					end
					if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
						player.Character.PrimaryPart.CFrame -= camera.CFrame.UpVector * FlySpeed * 0.0166
					end
					local cameraLookVector = camera.CFrame.LookVector
					local targetCFrame = CFrame.lookAt(player.Character.PrimaryPart.Position, player.Character.PrimaryPart.Position + Vector3.new(cameraLookVector.X, 0, cameraLookVector.Z))
					player.Character.PrimaryPart.CFrame = targetCFrame
				end
			end
		else
			if not BaseSettings.AntiDetect then
				if FlyContainer then
					FlyContainer:Destroy()
				end
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
			else
				player.Character.PrimaryPart.Anchored = false
			end
		end
	end
	
	local SpeedHackEnabled, SpeedHackSpeed, BaseWalkSpeed = false, 16, player.Character.Humanoid.WalkSpeed
	local SpeedHackConnection
	local function SpeedHack(Value)
		SpeedHackEnabled = Value
		if SpeedHackEnabled then
			if not BaseSettings.AntiDetect then
				SpeedHackConnection = RS.Heartbeat:Connect(function()
					if player.Character.Humanoid.WalkSpeed ~= BaseWalkSpeed and player.Character.Humanoid.WalkSpeed ~= SpeedHackSpeed then
						BaseWalkSpeed = player.Character.Humanoid.WalkSpeed
					end
					player.Character.Humanoid.WalkSpeed = SpeedHackSpeed
				end)
				player.Character.Humanoid.WalkSpeed = SpeedHackSpeed
			else
				while SpeedHackEnabled do
					task.wait()

					local lookVector = camera.CFrame.LookVector
					local rightVector = camera.CFrame.RightVector

					local horizontalLookVector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
					local horizontalRightVector = Vector3.new(rightVector.X, 0, rightVector.Z).Unit

					local movement = Vector3.new(0, 0, 0)

					if UIS:IsKeyDown(Enum.KeyCode.W) then
						movement = movement + horizontalLookVector
					end
					if UIS:IsKeyDown(Enum.KeyCode.S) then
						movement = movement - horizontalLookVector
					end
					if UIS:IsKeyDown(Enum.KeyCode.A) then
						movement = movement - horizontalRightVector
					end
					if UIS:IsKeyDown(Enum.KeyCode.D) then
						movement = movement + horizontalRightVector
					end

					if movement.Magnitude > 0 then
						movement = movement.Unit
						player.Character.PrimaryPart.CFrame = player.Character.PrimaryPart.CFrame + movement * SpeedHackSpeed * 0.0166
					end
				end
			end
		else
			if SpeedHackConnection then
				SpeedHackConnection:Disconnect()
			end
			player.Character.Humanoid.WalkSpeed = BaseWalkSpeed
		end
	end
	
	local JumpHackEnabled, JumpHackHeight, BaseJumpHeight = false, 7.2, player.Character.Humanoid.JumpHeight
	local JumpHackConnection
	local function JumpHack(Value)
		JumpHackEnabled = Value
		if JumpHackEnabled then
			if not BaseSettings.AntiDetect then
				JumpHackConnection = RS.Heartbeat:Connect(function()
					player.Character.Humanoid.JumpHeight = JumpHackHeight
				end)
				player.Character.Humanoid.JumpHeight = JumpHackHeight
			else
				while JumpHackEnabled do
					task.wait()
					player.Character.PrimaryPart.CFrame = player.Character.PrimaryPart.CFrame + Vector3.new(0, 1, 0) * JumpHackHeight * 0.0166
				end
			end
		else
			if not BaseSettings.AntiDetect then
				if JumpHackConnection then
					JumpHackConnection:Disconnect()
				end
				player.Character.Humanoid.JumpHeight = BaseJumpHeight
			end
		end
	end
	
	local InfiniteJumpEnabled = false
	UIS.JumpRequest:Connect(function()
		if InfiniteJumpEnabled then
			player.Character:WaitForChild('Humanoid'):ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
	
	local NoclipEnabled, NoclipOriginalCollisions = false, {}
	local NoclipConnection
	local function NoClip(Value)
		NoclipEnabled = Value
		if Value then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA('BasePart') then
					NoclipOriginalCollisions[v] = v.CanCollide
					v.CanCollide = false
				end
			end
			NoclipConnection = RS.Heartbeat:Connect(function()
				for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA('BasePart') then
						v.CanCollide = false
					end
				end
			end)
		else
			if NoclipConnection then NoclipConnection:Disconnect() end
			for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA('BasePart') and NoclipOriginalCollisions[v] then
					v.CanCollide = NoclipOriginalCollisions[v]
				end
			end
			NoclipOriginalCollisions = {}
		end
	end
	
	local InstantInteractEnabled, ProximityPrompts = false, {}
	local InstantInteractConnection
	local function InstantInteract(Value)
		InstantInteractEnabled = Value
		if Value then
			InstantInteractConnection = PPS.PromptButtonHoldBegan:Connect(function(prompt:ProximityPrompt)
				if not ProximityPrompts[prompt] then
					ProximityPrompts[prompt] = prompt.HoldDuration
				end
				prompt.HoldDuration = 0
			end)
		else
			if InstantInteractConnection then
				InstantInteractConnection:Disconnect()
			end
			for i,v in ProximityPrompts do
				i.HoldDuration = v
			end
			ProximityPrompts = {}
		end
	end

	local AntiAFKEnabled = false
	player.Idled:Connect(function()
		if AntiAFKEnabled then
			VU:Button2Down(Vector2.new(), camera.CFrame)
			task.wait(0.05)
			VU:Button2Up(Vector2.new(), camera.CFrame)
		end
	end)
	
	local WallHackEnabled, WallHackColor = false, Color3.new(1,1,1)
	local WallHackScreenGui = Instance.new('ScreenGui')
	WallHackScreenGui.Name = 'WallHack'
	WallHackScreenGui.Parent = GuiParent
	RS.Heartbeat:Connect(function(delta)
		if WallHackEnabled then
			for _, v in game.Players:GetChildren() do
				if v~= player and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") then
					local Character = v.Character
					local HRP = Character.HumanoidRootPart

					-- Получаем bounding box всего персонажа
					local minX, maxX, minY, maxY = math.huge, -math.huge, math.huge, -math.huge
					local hasVisibleParts = false

					-- Проверяем все видимые части персонажа
					for _, part in ipairs(Character:GetChildren()) do
						if part:IsA("BasePart") and part.Transparency < 1 then
							local worldPos = part.Position
							local screenPos = camera:WorldToViewportPoint(worldPos)

							-- Если часть перед камерой (Z > 0)
							if screenPos.Z > 0 then
								-- Получаем размеры части
								local partSize = part.Size
								local corners = {
									Vector3.new(partSize.X/2, partSize.Y/2, partSize.Z/2),
									Vector3.new(-partSize.X/2, partSize.Y/2, partSize.Z/2),
									Vector3.new(partSize.X/2, -partSize.Y/2, partSize.Z/2),
									Vector3.new(-partSize.X/2, -partSize.Y/2, partSize.Z/2),
									Vector3.new(partSize.X/2, partSize.Y/2, -partSize.Z/2),
									Vector3.new(-partSize.X/2, partSize.Y/2, -partSize.Z/2),
									Vector3.new(partSize.X/2, -partSize.Y/2, -partSize.Z/2),
									Vector3.new(-partSize.X/2, -partSize.Y/2, -partSize.Z/2)
								}

								for _, corner in pairs(corners) do
									local cornerWorldPos = worldPos + corner
									local cornerScreenPos = camera:WorldToViewportPoint(cornerWorldPos)

									if cornerScreenPos.Z > 0 then
										minX = math.min(minX, cornerScreenPos.X)
										maxX = math.max(maxX, cornerScreenPos.X)
										minY = math.min(minY, cornerScreenPos.Y)
										maxY = math.max(maxY, cornerScreenPos.Y)
										hasVisibleParts = true
									end
								end
							end
						end
					end

					-- Если есть видимые части, создаем/обновляем рамку
					if hasVisibleParts then
						local screenWidth = maxX - minX
						local screenHeight = maxY - minY
						local centerX = (minX + maxX) / 2
						local centerY = (minY + maxY) / 2

						-- Добавляем отступы
						local padding = 5
						local frameSize = math.max(screenWidth, screenHeight) + padding * 2

						local MainFrame = WallHackScreenGui:FindFirstChild(v.Name) or Instance.new('Frame')
						MainFrame.Name = v.Name
						MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
						MainFrame.Position = UDim2.new(0, centerX, 0, centerY)
						MainFrame.Size = UDim2.new(0, frameSize, 0, frameSize)

						MainFrame.BackgroundColor3 = WallHackColor

						MainFrame.BackgroundTransparency = 0.7
						MainFrame.BorderSizePixel = 2
						MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
						MainFrame.Parent = WallHackScreenGui

						-- Добавляем имя и здоровье
						local NameLabel = MainFrame:FindFirstChild("NameLabel") or Instance.new("TextLabel")
						NameLabel.Name = "NameLabel"
						NameLabel.Size = UDim2.new(1, 0, 0.2, 0)
						NameLabel.Position = UDim2.new(0, 0, -0.2, 0)
						NameLabel.BackgroundTransparency = 1
						NameLabel.Text = v.Name
						NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						NameLabel.TextSize = 12
						NameLabel.Font = Enum.Font.ArialBold
						NameLabel.TextStrokeTransparency = 0.5
						NameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						NameLabel.Parent = MainFrame

						-- Информация о здоровье
						local health = Character.Humanoid.Health
						local maxHealth = Character.Humanoid.MaxHealth
						local healthPercent = math.floor((health / maxHealth) * 100)

						local HealthLabel = MainFrame:FindFirstChild("HealthLabel") or Instance.new("TextLabel")
						HealthLabel.Name = "HealthLabel"
						HealthLabel.Size = UDim2.new(1, 0, 0.2, 0)
						HealthLabel.Position = UDim2.new(0, 0, 1, 0)
						HealthLabel.BackgroundTransparency = 1
						HealthLabel.Text = healthPercent .. "% HP"
						HealthLabel.TextColor3 = Color3.fromHSV(healthPercent / 300, 1, 1) -- От красного к зеленому
						HealthLabel.TextSize = 11
						HealthLabel.Font = Enum.Font.Arial
						HealthLabel.TextStrokeTransparency = 0.5
						HealthLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						HealthLabel.Parent = MainFrame

						-- Дистанция
						local distance = (camera.CFrame.Position - HRP.Position).Magnitude
						local DistanceLabel = MainFrame:FindFirstChild("DistanceLabel") or Instance.new("TextLabel")
						DistanceLabel.Name = "DistanceLabel"
						DistanceLabel.Size = UDim2.new(1, 0, 0.2, 0)
						DistanceLabel.Position = UDim2.new(0, 0, 1.2, 0)
						DistanceLabel.BackgroundTransparency = 1
						DistanceLabel.Text = math.floor(distance) .. " studs"
						DistanceLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
						DistanceLabel.TextSize = 10
						DistanceLabel.Font = Enum.Font.Arial
						DistanceLabel.TextStrokeTransparency = 0.5
						DistanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						DistanceLabel.Parent = MainFrame
					else
						-- Если персонаж не виден, удаляем рамку
						local existingFrame = WallHackScreenGui:FindFirstChild(v.Name)
						if existingFrame then
							existingFrame:Destroy()
						end
					end
				else
					-- Удаляем рамку если игрока нет или он мертв
					local existingFrame = WallHackScreenGui:FindFirstChild(v.Name)
					if existingFrame then
						existingFrame:Destroy()
					end
				end
			end
		else
			-- Если WallHack отключен, очищаем все рамки
			for _, child in WallHackScreenGui:GetChildren() do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end
		end
	end)
	
	local FullBrightEnabled, FullBrightAmbient = false, game.Lighting.Ambient
	local FullBrightConnection
	local function FullBright(Value)
		FullBrightEnabled = Value
		if FullBrightEnabled then
			FullBrightAmbient = game.Lighting.Ambient
			game.Lighting.Ambient = Color3.new(1,1,1)		
			FullBrightConnection = RS.Heartbeat:Connect(function()
				if game.Lighting.Ambient ~= Color3.new(1,1,1) then
					FullBrightAmbient = game.Lighting.Ambient
					game.Lighting.Ambient = Color3.new(1,1,1)
				end
			end)
		else
			if FullBrightConnection then
				FullBrightConnection:Disconnect()
			end
			game.Lighting.Ambient = FullBrightAmbient
		end
	end
	
	
	local PlayerTab = Window:CreateTab("Player", 4483362458)
	PlayerTab:CreateSection("Movement")
	
	--FLY
	PlayerTab:CreateToggle({
		Name = "Fly",
		CurrentValue = false,
		Flag = "FlyEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = Fly,
	})
	PlayerTab:CreateSlider({
		Name = "Speed",
		Range = {0, 300},
		Increment = 1,
		Suffix = "",
		CurrentValue = 20,
		Flag = "FlySpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			FlySpeed = Value
		end,
	})
	PlayerTab:CreateDivider()
	--SPEED HACK
	PlayerTab:CreateToggle({
		Name = "Speed Hack",
		CurrentValue = false,
		Flag = "SpeedHackEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = SpeedHack,
	})
	PlayerTab:CreateSlider({
		Name = "Speed",
		Range = {0, 300},
		Increment = 1,
		Suffix = "",
		CurrentValue = 16,
		Flag = "SpeedHackSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			SpeedHackSpeed = Value
		end,
	})
	PlayerTab:CreateDivider()
	--JUMP HACK
	PlayerTab:CreateToggle({
		Name = "Jump Hack",
		CurrentValue = false,
		Flag = "JumpHackEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = JumpHack,
	})
	PlayerTab:CreateSlider({
		Name = "Height",
		Range = {0, 300},
		Increment = 1,
		Suffix = "",
		CurrentValue = 7,
		Flag = "JumpHackHeight", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			JumpHackHeight = Value
		end,
	})
	PlayerTab:CreateDivider()
	--INFINITE JUMP
	PlayerTab:CreateToggle({
		Name = 'Infinite Jump',
		CurrentValue = false,
		Flag = 'InfiniteJumpEnabled',
		Callback = function(Value)
			InfiniteJumpEnabled = Value
		end,
	})

	PlayerTab:CreateSection('Misc')
	--NOCLIP
	PlayerTab:CreateToggle({
		Name = "Noclip",
		CurrentValue = false,
		Flag = "NoclipEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = NoClip,
	})
	--INSTANT INTERACT
	PlayerTab:CreateToggle({
		Name = "Instant Interaction",
		CurrentValue = false,
		Flag = "InstantInteractEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = InstantInteract,
	})
	--ANTI AFK
	PlayerTab:CreateToggle({
		Name = "Anti AFK",
		CurrentValue = false,
		Flag = "AntiAFKEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			AntiAFKEnabled = Value
		end,
	})


	local VisualTab = Window:CreateTab('Visual', 4483362458)
	VisualTab:CreateSection('Players')
	--WALL HACK
	VisualTab:CreateToggle({
		Name = "Wall Hack",
		CurrentValue = false,
		Flag = "WallHackEnabled", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			WallHackEnabled = Value
		end,
	})
	VisualTab:CreateColorPicker({
		Name = "Color",
		Color = Color3.fromRGB(255,255,255),
		Flag = "WallHackColor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			WallHackColor = Value
		end
	})
	VisualTab:CreateSection('Lighting')
	--FULL BRIGHT
	VisualTab:CreateToggle({
		Name = 'Full Bright',
		CurrentValue = false,
		Flag = 'FullBrightEnabled',
		Callback = FullBright,
	})
	

	local WaypointsTab = Window:CreateTab('Waypoints', 4483362458)
	local waypointsTable = {}
	local waypointsNames = {}
	local waypointColor = Color3.new(1,1,1)
	local waypointName = ''
	local waypointsFolder = workspace.Terrain:FindFirstChild('Waypoints') or Instance.new('Folder')
	waypointsFolder.Name = 'Waypoints'
	waypointsFolder.Parent = RootParent

	WaypointsTab:CreateSection('Waypoint:')
	local curentWaypointName = ''
	local WaypointDropdown = WaypointsTab:CreateDropdown({
		Name = "Waypoints",
		Options = {'nill'},
		CurrentOption = {'nill'},
		MultipleOptions = false,
		Flag = "CurentWaypoint", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Options)
			curentWaypointName = Options[1]
		end,
	})
	WaypointsTab:CreateButton({
		Name = "Teleport to waypoint",
		Callback = function()
			if waypointsTable[curentWaypointName] then
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame = waypointsTable[curentWaypointName].CFrame
			else
				Rayfield:Notify({
					Title = "RT hub",
					Content = "Waypoint does not exist",
					Duration = 3,
					Image = 4483362458,
				})
			end
		end,
	})
	WaypointsTab:CreateButton({
		Name = "Delete waypoint",
		Callback = function()
			if waypointsTable[curentWaypointName] then
				waypointsTable[curentWaypointName]:Destroy()
				waypointsTable[curentWaypointName] = nil

				table.remove(waypointsTable,table.find(waypointsTable,curentWaypointName))
				table.remove(waypointsNames,table.find(waypointsNames,curentWaypointName))
				WaypointDropdown:Refresh(waypointsNames)
			else
				Rayfield:Notify({
					Title = "RT hub",
					Content = "Waypoint does not exist",
					Duration = 3,
					Image = 4483362458,
				})
			end
		end,
	})

	WaypointsTab:CreateSection('Create waypoint: ')
	WaypointsTab:CreateColorPicker({
		Name = "Waypont color",
		Color = Color3.fromRGB(255,255,255),
		Flag = "WaypontColor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
			waypointColor = Value
		end
	})
	WaypointsTab:CreateInput({
		Name = "Waypoint name",
		CurrentValue = "",
		PlaceholderText = "Waypoint name",
		RemoveTextAfterFocusLost = false,
		Flag = "WaypointName",
		Callback = function(Text)
			waypointName = Text
		end,
	})
	WaypointsTab:CreateButton({
		Name = 'Create waypoint',
		Callback = function()
			if not waypointsTable[waypointName] then
				local waypointPos = game.Players.LocalPlayer.Character.PrimaryPart.Position
				local Attach = Instance.new('Attachment')
				Attach.Name = waypointName
				Attach.Position = waypointPos + Vector3.new(0,6,0)
				Attach.Parent = waypointsFolder

				local bb = Instance.new("BillboardGui")
				bb.Size = UDim2.fromOffset(140,170)
				bb.AlwaysOnTop = true
				bb.MaxDistance = math.huge
				bb.Parent = Attach

				local txt = Instance.new("TextLabel")
				txt.Size = UDim2.fromScale(1,0.2)
				txt.Position = UDim2.fromScale(0,0.6)
				txt.BackgroundTransparency = 1
				txt.Text = waypointName or 'Waypoint'
				txt.TextSize = 18
				txt.TextScaled = false
				txt.TextColor3 = waypointColor
				txt.Font = Enum.Font.Arial
				txt.Parent = bb

				local dist = Instance.new("TextLabel")
				dist.Size = UDim2.fromScale(1,0.2)
				dist.Position = UDim2.fromScale(0,0.8)
				dist.BackgroundTransparency = 1
				dist.TextSize = 14
				dist.TextColor3 = Color3.fromRGB(200,200,200)
				dist.Font = Enum.Font.Arial
				dist.Parent = bb

				RS.RenderStepped:Connect(function()
					local d = (player.Character.HumanoidRootPart.Position - Attach.WorldPosition).Magnitude
					dist.Text = math.floor(d).." studs"
				end)


				waypointsTable[waypointName] = Attach
				table.insert(waypointsNames, waypointName)

				WaypointDropdown:Refresh(waypointsNames)
			else
				Rayfield:Notify({
					Title = "RT hub",
					Content = "A waypoint with that name already exists",
					Duration = 3,
					Image = 4483362458,
				})
			end
		end,
	})
	for _,v in waypointsFolder:GetChildren() do
		table.insert(waypointsNames,v.Name)
		waypointsTable[v.Name] = v
	end
	WaypointDropdown:Refresh(waypointsNames)


	local PluginsTab = Window:CreateTab('Plugins', 4483362458)
	for _,v in Plugins do
		local Name = v[1]
		if v[2] then
			local PluginTab = Window:CreateTab(Name, 4483362458)
			v[3](PluginTab)
		else
			v[3](PluginsTab)
		end
	end


	Rayfield:Notify({
		Title = "RT hub",
		Content = "Welcome!",
		Duration = 6.5,
		Image = 4483362458,
	})
end
