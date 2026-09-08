local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local ChatService = game:GetService("TextChatService")
	local TweenService = game:GetService("TweenService")
	local Lighting = game:GetService("Lighting")
	local player = game.Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local char = player.Character
	local humanoid = char:WaitForChild("Humanoid")
	local Window = Rayfield:CreateWindow({
		Name = "Examination hub",
		Icon = 0,
		LoadingTitle = "Examination hub",
		LoadingSubtitle = "by Happiness",
		ShowText = "Rayfield",
		Theme = "Ocean",
		ToggleUIKeybind = "K",
		DisableRayfieldPrompts = false,
		DisableBuildWarnings = false,
		ConfigurationSaving = {
	    	Enabled = true,
			FolderName = "Examination",
			FileName = "Hub"
		},
	})

	local MainTab = Window:CreateTab("Main", "home")
		MainTab:CreateSection("Change log")
			MainTab:CreateParagraph({Title = "NOVEMBER 6", Content = "Added map manipulation buttons · Added D-Zero's animations · Added Adam Dice's animations · Added sus animation"})

		MainTab:CreateSection("Hide & Seek")
			local HunterModeEnabled = false
			local HunterModeToggle = MainTab:CreateToggle({
				Name = "Hunter mode",
				CurrentValue = false,
				Flag = "HunterModeToggle",
				Callback = function(v)
					HunterModeEnabled = v
					local char = player.Character or player.CharacterAdded:Wait()
					local isHunter = char:FindFirstChild("IsHunter")

					if isHunter then
						isHunter.Value = v
					end
				end,
			})

			player.CharacterAdded:Connect(function(char)
				task.wait(0.3)
				local isHunter = char:WaitForChild("IsHunter", 2)
				if isHunter then
					isHunter.Value = HunterModeEnabled
				end
			end)

			task.defer(function()
				if Rayfield.Flags and Rayfield.Flags["HunterModeToggle"] then
					local saved = Rayfield.Flags["HunterModeToggle"].Value
					if saved ~= nil then
						HunterModeEnabled = saved
						if HunterModeToggle and HunterModeToggle.SetValue then
							pcall(function()
								HunterModeToggle:SetValue(saved)
							end)
						end
						local char = player.Character or player.CharacterAdded:Wait()
						local isHunter = char:FindFirstChild("IsHunter")
						if isHunter then
							isHunter.Value = saved
						end
					end
				end
			end)

		MainTab:CreateSection("Health")
			MainTab:CreateButton({
				Name = "Reset",
				Callback = function()
					if char and humanoid then
						humanoid.Health = 0
					end
				end,
			})

			MainTab:CreateKeybind({
				Name = "Reset (keybind)",
				CurrentKeybind = "V",
				HoldToInteract = false,
				Flag = "ResetKeybind",
				Callback = function()
					if char and humanoid then
						humanoid.Health = 0
					end
				end,
			})

		MainTab:CreateSection("Camera")
			local cameraToggleState = false
			local function ApplyCameraSettings()
				if not player then return end
				if cameraToggleState == true then
					pcall(function()
						player.CameraMode = Enum.CameraMode.Classic
						player.CameraMaxZoomDistance = 15
					end)
				else
					pcall(function()
						player.CameraMode = Enum.CameraMode.LockFirstPerson
					end)
				end
			end

			player.CharacterAdded:Connect(function(char)
				if char then
					local humanoid = char:WaitForChild("Humanoid", 2)
					task.wait(0.25)
					ApplyCameraSettings()
				end
			end)

			local ThirdPersonToggle = MainTab:CreateToggle({
				Name = "Third person",
				CurrentValue = false,
				Flag = "ThirdPersonToggle",
				Callback = function(v)
					cameraToggleState = v
					ApplyCameraSettings()
				end,
			})

			local CameraKeybind = MainTab:CreateKeybind({
				Name = "Third person (keybind)",
				CurrentKeybind = "T",
				HoldToInteract = false,
				Flag = "CameraKeybind",
				Callback = function()
					cameraToggleState = not cameraToggleState
					if ThirdPersonToggle and ThirdPersonToggle.SetValue then
						pcall(function()
							Toggle:SetValue(cameraToggleState)
						end)
					end
					ApplyCameraSettings()
				end,
			})

			local function tryReadRayfieldFlag()
				if type(Rayfield) == "table" and Rayfield.Flags then
					local f = Rayfield.Flags["CameraToggle"]
					if type(f) == "table" and f.Value ~= nil then
						return f.Value
					end
				end
				return nil
			end

			task.defer(function()
				local saved = tryReadRayfieldFlag()
				if saved ~= nil then
					cameraToggleState = saved
					if Toggle and Toggle.SetValue then
						pcall(function()
							Toggle:SetValue(saved)
						end)
					end
					ApplyCameraSettings()
				end
			end)

		MainTab:CreateSection("Chat")
			local chatEnabled = false

			local function ApplyChatState()
				local chatConfig = ChatService:FindFirstChild("ChatWindowConfiguration")

				if chatConfig then
					pcall(function()
						chatConfig.Enabled = chatEnabled
					end)
				end
			end

			player.CharacterAdded:Connect(function()
				task.wait(0.5)
				ApplyChatState()
			end)

			local ChatToggle = MainTab:CreateToggle({
				Name = "Chat history",
				CurrentValue = false,
				Flag = "ChatToggle",
				Callback = function(v)
					chatEnabled = v
					ApplyChatState()
				end,
			})

			task.defer(function()
				if Rayfield.Flags and Rayfield.Flags["ChatToggle"] then
					local saved = Rayfield.Flags["ChatToggle"].Value
					if saved ~= nil then
						chatEnabled = saved
						if ChatToggle and ChatToggle.SetValue then
							pcall(function()
								ChatToggle:SetValue(saved)
							end)
						end
						ApplyChatState()
					else
						ApplyChatState()
					end
				else
					ApplyChatState()
				end
			end)
		MainTab:CreateSection("Map")
			MainTab:CreateButton({
				Name = "Remove Elephant Foot",
				Callback = function()
					local foot = game.workspace:FindFirstChild("LookAtMe")
					if foot then foot:Destroy() end
					if not foot then return end
				end,
			})

			MainTab:CreateButton({
				Name = "Remove console teleport",
				Callback = function()
					local teleport = game.workspace:FindFirstChild("ConsoleTeleport")
					if teleport then teleport:Destroy() end
					if not teleport then return end
				end,
			})

			MainTab:CreateButton({
				Name = "Remove radiation",
				Callback = function()
					local radiation = game.workspace:FindFirstChild("Radiation")
					if radiation then radiation:Destroy() end
					if not radiation then return end
				end,
			})

	local MovementTab = Window:CreateTab("Movement", "move")
		MovementTab:CreateSection("WalkSpeed")
			local walkSpeed = 7
			local lockSpeed = false

			local function applySpeed()
				if humanoid and humanoid.Parent and humanoid.Parent:FindFirstChild("IsHunter") then
					humanoid.WalkSpeed = walkSpeed
				end
			end

			player.CharacterAdded:Connect(function(newChar)
				char = newChar
				humanoid = newChar:WaitForChild("Humanoid")
				task.wait(0.3)
				if lockSpeed then applyWalkSpeed() end
			end)

			RunService.Heartbeat:Connect(function()
				if humanoid then
					if lockSpeed and humanoid.WalkSpeed ~= walkSpeed then
						humanoid.WalkSpeed = walkSpeed
					end
				end
			end)

			local WalkSpeedToggle = MovementTab:CreateToggle({
				Name = "WalkSpeed Override",
				CurrentValue = lockSpeed,
				Flag = "WalkSpeedToggle",
				Callback = function(v)
					lockSpeed = v
					if v then
						applySpeed()
					end
				end,
			})

			local WalkSpeedSlider = MovementTab:CreateSlider({
				Name = "WalkSpeed",
				Range = {0, 100},
				Increment = 1,
				Suffix = "speed",
				CurrentValue = walkSpeed,
				Flag = "WalkSpeedSlider",
				Callback = function(v)
					walkSpeed = v
					if lockSpeed then applySpeed() end
				end,
			})

		MovementTab:CreateSection("JumpHeight")
			local jumpHeight = 2
			local lockJump = false
			local function applyJump()
				if humanoid and humanoid.Parent then
					humanoid.UseJumpPower = false
					humanoid.JumpHeight = jumpHeight
				end
			end

			player.CharacterAdded:Connect(function(newChar)
				char = newChar
				humanoid = newChar:WaitForChild("Humanoid")
				task.wait(0.3)
				if lockJump then applyJump() end
			end)

			RunService.Heartbeat:Connect(function()
				if humanoid then
					if lockJump and humanoid.JumpHeight ~= jumpHeight then
						humanoid.JumpHeight = jumpHeight
					end
				end
			end)

			local JumpHeightToggle = MovementTab:CreateToggle({
				Name = "JumpHeight override",
				CurrentValue = lockJump,
				Flag = "JumpHeightToggle",
				Callback = function(v)
					lockJump = v
					if v then
						applyJump()
					end
				end,
			})

			local JumpHeightSlider = MovementTab:CreateSlider({
				Name = "JumpHeight",
				Range = {0, 150},
				Increment = 1,
				Suffix = "studs",
				CurrentValue = jumpHeight,
				Flag = "JumpHeightSlider",
				Callback = function(v)
					jumpHeight = v
					if lockJump then applyJump() end
				end,
			})

			task.defer(function()
				if Rayfield.Flags then
					if Rayfield.Flags["WalkSpeedSlider"] then
						local saved = Rayfield.Flags["WalkSpeedSlider"].Value
						if saved ~= nil then
							walkSpeed = saved
							pcall(function()
								SpeedSlider:SetValue(saved)
							end)
						end
					end
					if Rayfield.Flags["WalkSpeedToggle"] then
						local saved = Rayfield.Flags["WalkSpeedToggle"].Value
						if saved ~= nil then
							lockSpeed = saved
							pcall(function()
								SpeedToggle:SetValue(saved)
							end)
						end
					end
					if Rayfield.Flags["JumpHeightSlider"] then
						local saved = Rayfield.Flags["JumpHeightSlider"].Value
						if saved ~= nil then
							jumpHeight = saved
							pcall(function()
								JumpSlider:SetValue(saved)
							end)
						end
					end
					if Rayfield.Flags["JumpHeightToggle"] then
						local saved = Rayfield.Flags["JumpHeightToggle"].Value
						if saved ~= nil then
							lockJump = saved
							pcall(function()
								JumpToggle:SetValue(saved)
							end)
						end
					end
				end

				task.wait(0.3)
				if lockSpeed then applyWalkSpeed() end
				if lockJump then applyJumpHeight() end
			end)

			task.defer(function()
				if Rayfield.Flags then
					if Rayfield.Flags["WalkSpeedSlider"] then
						local saved = Rayfield.Flags["WalkSpeedSlider"].Value
						if saved ~= nil then
							walkSpeed = saved
							pcall(function()
								SpeedSlider:SetValue(saved)
							end)
						end
					end
					if Rayfield.Flags["WalkSpeedToggle"] then
						local saved = Rayfield.Flags["WalkSpeedToggle"].Value
						if saved ~= nil then
							lockSpeed = saved
							pcall(function()
								SpeedToggle:SetValue(saved)
							end)
						end
					end
					if Rayfield.Flags["JumpHeightSlider"] then
						local saved = Rayfield.Flags["JumpHeightSlider"].Value
						if saved ~= nil then
							jumpHeight = saved
							pcall(function()
								JumpSlider:SetValue(saved)
							end)
						end
					end
					if Rayfield.Flags["JumpHeightToggle"] then
						local saved = Rayfield.Flags["JumpHeightToggle"].Value
						if saved ~= nil then
							lockJump = saved
							pcall(function()
								JumpToggle:SetValue(saved)
							end)
						end
					end
				end

				task.wait(0.3)
				if lockSpeed then applyWalkSpeed() end
				if lockJump then applyJumpHeight() end
			end)

	local LightingTab = Window:CreateTab("Lighting", "lightbulb")
		local fogFarEnabled = 45
		local fogFarDisabled = 500
		local fogEnabled = true
		local fullbrightColor = Color3.fromRGB(255, 255, 255)
		local defaultColor = Color3.fromRGB(0, 0, 0)
		local fullbrightEnabled = false
		local ambientColor = Color3.fromRGB(0, 0, 0)

		local FogToggle = LightingTab:CreateToggle({
			Name = "Fog",
			CurrentValue = true,
			Flag = "FogToggle",
			Callback = function(v)
				fogEnabled = v
				Lighting.FogEnd = v and fogFarEnabled or fogFarDisabled
			end,
		})

		Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
			if fogEnabled and Lighting.FogEnd ~= fogFarEnabled then
				Lighting.FogEnd = fogFarEnabled
			elseif not fogEnabled and Lighting.FogEnd ~= fogFarDisabled then
				Lighting.FogEnd = fogFarDisabled
			end
		end)

		player.CharacterAdded:Connect(function()
			task.wait(0.5)
			Lighting.FogEnd = fogEnabled and fogFarEnabled or fogFarDisabled
		end)

		task.defer(function()
			if Rayfield.Flags and Rayfield.Flags["FogToggle"] then
				local saved = Rayfield.Flags["FogToggle"].Value
				if saved ~= nil then
					fogEnabled = saved
					if FogToggle and FogToggle.SetValue then
						pcall(function() FogToggle:SetValue(saved) end)
					end
					Lighting.FogEnd = saved and fogFarEnabled or fogFarDisabled
				end
			end
		end)

		local FullbrightToggle = LightingTab:CreateToggle({
			Name = "Fullbright",
			CurrentValue = false,
			Flag = "FullbrightToggle",
			Callback = function(v)
				fullbrightEnabled = v
				Lighting.Ambient = v and fullbrightColor or defaultColor
			end,
		})

		Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
			if fullbrightEnabled and Lighting.Ambient ~= fullbrightColor then
				Lighting.Ambient = fullbrightColor
			elseif not fullbrightEnabled and Lighting.Ambient ~= defaultColor then
				Lighting.Ambient = defaultColor
			end
		end)

		player.CharacterAdded:Connect(function()
			task.wait(0.5)
			Lighting.Ambient = fullbrightEnabled and fullbrightColor or defaultColor
		end)

		task.defer(function()
			if Rayfield.Flags and Rayfield.Flags["FullbrightToggle"] then
				local saved = Rayfield.Flags["FullbrightToggle"].Value
				if saved ~= nil then
					fullbrightEnabled = saved
					if FullbrightToggle and FullbrightToggle.SetValue then
						pcall(function() FullbrightToggle:SetValue(saved) end)
					end
					Lighting.Ambient = saved and fullbrightColor or defaultColor
				end
			end
		end)

		local ColorPicker = LightingTab:CreateColorPicker({
			Name = "Ambient color",
			Color = ambientColor,
			Flag = "AmbientColorPicker",
			Callback = function(v)
				ambientColor = v
				Lighting.Ambient = v
			end
		})

		Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
			if Lighting.Ambient ~= ambientColor then
				Lighting.Ambient = ambientColor
			end
		end)

		player.CharacterAdded:Connect(function()
			task.wait(0.5)
			Lighting.Ambient = ambientColor
		end)

		task.defer(function()
			if Rayfield.Flags and Rayfield.Flags["AmbientColorPicker"] then
				local saved = Rayfield.Flags["AmbientColorPicker"].Value
				if saved ~= nil then
					ambientColor = saved
					if ColorPicker and ColorPicker.SetColor then
						pcall(function() ColorPicker:SetColor(saved) end)
					end
					Lighting.Ambient = saved
				end
			end
		end)

	local GuiTab = Window:CreateTab("GUI", "panel-left")
		GuiTab:CreateSection("Infection UI")
			local Sound = playerGui:WaitForChild("Gasmask"):WaitForChild("MaskHole"):WaitForChild("ACTIVATE")
			local Music = playerGui.Gasmask.MaskHole:WaitForChild("HATRED_OSTS"):WaitForChild("HATRED")
			local Animation = Instance.new("Animation")
			Animation.AnimationId = "rbxassetid://136775254837264"
			local AnimationTrack
			local Red = Lighting:FindFirstChild("InfectionColorCorrection") or Instance.new("ColorCorrectionEffect")
			Red.Name = "InfectionColorCorrection"
			Red.Parent = Lighting
			Red.Enabled = false
			Red.TintColor = Color3.fromRGB(255, 0, 0)

			local InfectedUIToggle = GuiTab:CreateToggle({
				Name = "Enable controllable infected UI",
				CurrentValue = false,
				Flag = "InfectedUIToggle",
				Callback = function(v)
					character = player.Character or player.CharacterAdded:Wait()
					local Head = character:FindFirstChild("Head")
					local HatGear = character:FindFirstChild("Hat_Gear")
					if v then
						if not AnimationTrack then
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								local animator = humanoid:FindFirstChildOfClass("Animator")
								if not animator then
									animator = Instance.new("Animator")
									animator.Parent = humanoid
								end
								AnimationTrack = animator:LoadAnimation(Animation)
							end
						end
						if AnimationTrack then AnimationTrack:Play() end
						if Sound then Sound.Playing = true end
						if Music then Music.Playing = true end
						Red.Enabled = true
						if Head then
							local left = Head:FindFirstChild("InfectedLeft")
							local right = Head:FindFirstChild("InfectedRight")
							if left and left.ParticleEmitter then left.ParticleEmitter.Enabled = true end
							if right and right.ParticleEmitter then right.ParticleEmitter.Enabled = true end
						end
						if HatGear and HatGear:FindFirstChild("Handle") and HatGear.Handle:FindFirstChild("Lens") then
							HatGear.Handle.Lens.Transparency = 0
						end
					else
						if AnimationTrack then
							AnimationTrack:Stop()
							AnimationTrack:Destroy()
							AnimationTrack = nil
						end
						if Sound then Sound.Playing = false end
						if Music then Music.Playing = false end
						Red.Enabled = false
						if Head then
							local left = Head:FindFirstChild("InfectedLeft")
							local right = Head:FindFirstChild("InfectedRight")
							if left and left.ParticleEmitter then left.ParticleEmitter.Enabled = false end
							if right and right.ParticleEmitter then right.ParticleEmitter.Enabled = false end
						end
						if HatGear and HatGear:FindFirstChild("Handle") and HatGear.Handle:FindFirstChild("Lens") then
							HatGear.Handle.Lens.Transparency = 0.05
						end
					end
				end,
			})

		GuiTab:CreateSection("ESP UI")
			local ESPFolder = workspace:WaitForChild("Characters")
			local ESPEnabled = false
			local highlights = {}
			local function createHighlight(character)
				if not character or highlights[character] then return end
				local highlight = Instance.new("Highlight")
				highlight.Parent = character
				highlight.Adornee = character
				if character:FindFirstChild("Humanoid") then
					if game.Players:GetPlayerFromCharacter(character) then
						highlight.FillColor = Color3.fromRGB(80, 109, 84)
					else
						highlight.FillColor = Color3.fromRGB(255, 0, 0)
					end
					highlight.FillTransparency = 0.25
					highlight.OutlineTransparency = 0
				end
					highlight.Enabled = ESPEnabled
					highlights[character] = highlight
			end

			local function setESPEnabled(state)
				ESPEnabled = state
				for _, highlight in pairs(highlights) do
					if highlight then
						highlight.Enabled = state
					end
				end
			end

			local ESPToggle = GuiTab:CreateToggle({
				Name = "ESP",
				CurrentValue = false,
				Flag = "ESPToggle",
				Callback = function(value)
					ESPEnabled = value
					setESPEnabled(value)
				end
			})

			ESPFolder.ChildAdded:Connect(function(character)
				task.wait(0.1)
				createHighlight(character)
			end)

			for _, character in pairs(ESPFolder:GetChildren()) do
				createHighlight(character)
			end

		GuiTab:CreateSection("Death UI")
			local DeathHidden = false
			local function updateDeathUI()
				local deathGui = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Death")
				if deathGui then
					deathGui.Enabled = not DeathHidden
				end
			end

			local DeathUIToggle = GuiTab:CreateToggle({
				Name = "Death UI",
				CurrentValue = not DeathHidden,
				Flag = "DeathUIToggle",
				Callback = function(value)
					DeathHidden = not value
					updateDeathUI()
				end,
			})

			player.CharacterAdded:Connect(function()
				task.wait(0.5)
				updateDeathUI()
			end)

			task.defer(function()
				if Rayfield.Flags and Rayfield.Flags["DeathUIToggle"] then
					local saved = Rayfield.Flags["DeathUIToggle"].Value
					if saved ~= nil then
						DeathHidden = not saved
						if DeathUIToggle and DeathUIToggle.SetValue then
							pcall(function()
								DeathUIToggle:SetValue(saved)
							end)
						end
						updateDeathUI()
					end
				end
			end)

		GuiTab:CreateSection("Gasmask UI")
			local GasmaskHidden = false
			local function updateGasmaskUI()
				local gasmaskGui = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Gasmask")
				if gasmaskGui then
					gasmaskGui.Enabled = not GasmaskHidden
				end
			end

			local GasmaskUIToggle = GuiTab:CreateToggle({
				Name = "Gasmask UI",
				CurrentValue = not GasmaskHidden,
				Flag = "GasmaskUIToggle",
				Callback = function(value)
					GasmaskHidden = not value
					updateGasmaskUI()
				end,
			})

			player.CharacterAdded:Connect(function()
				task.wait(0.5)
				updateGasmaskUI()
			end)

			task.defer(function()
				if Rayfield.Flags and Rayfield.Flags["GasmaskUIToggle"] then
					local saved = Rayfield.Flags["GasmaskUIToggle"].Value
					if saved ~= nil then
						GasmaskHidden = not saved
						if GasmaskUIToggle and GasmaskUIToggle.SetValue then
							pcall(function()
								GasmaskUIToggle:SetValue(saved)
							end)
						end
						updateGasmaskUI()
					end
				end
			end)

	local TPTab = Window:CreateTab("Teleports", "fast-forward")
		local teleportPoints = {
			["Sector 1"] = {
				{"Spawn", Vector3.new(-55, -33, -1410)},
				{"Generator-1", Vector3.new(135, -30, -1225)},
				{"Backup reactor", Vector3.new(-230, -30, -1428)},
				{"Mutant crawler", Vector3.new(-155, -33, -1565)},
				{"Basement valve", Vector3.new(-225, -35, -1635)},
				{"Generator-2", Vector3.new(-140, -30, -1145)},
			},

			["Sector 2"] = {
				{"Sector entrance", Vector3.new(-110, -10, -825)},
				{"Russman's office", Vector3.new(38, -10, -895)},
				{"Armory", Vector3.new(-45, -10, -890)},
				{"Logistics area", Vector3.new(15, -10, -1040)},
				{"Steve Remington's body", Vector3.new(-30, 0, -1058)},
			},
		}

		local function teleportTo(position)
			local player = game.Players.LocalPlayer
			player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
		end

		for sectorName, points in pairs(teleportPoints) do
			TPTab:CreateSection(sectorName)
			for _, data in ipairs(points) do
				local name, pos = unpack(data)
				TPTab:CreateButton({
					Name = name,
					Callback = function()
						teleportTo(pos)
					end,
				})
			end
		end

	local FunTab = Window:CreateTab("Fun", "smile")
		FunTab:CreateSection("Animation toggles")
			local toggleanimations = {
				["Chimera's walk animation"] = "rbxassetid://97147187591899",
				["Chimera's run animation"] = "rbxassetid://95054120636955",
				["Gilbert's walk animation"] = "rbxassetid://74514118757125",
				["Gilbert's idle animation"] = "rbxassetid://93686257760742",
				["Raged Slasher's run animation"] = "rbxassetid://94555617501510",
				["Kamikaze's walk animation"] = "rbxassetid://87989829896123",
				["Kamikaze's run animation"] = "rbxassetid://78355773495995",
				["Mikhail William's walk animation"] = "rbxassetid://100407162198079",
				["Mikhail William's run animation"] = "rbxassetid://126189604062142",
				["Head shake animation"] = "rbxassetid://118621065272904",					
				["Unstable animation"] = "rbxassetid://9146103628",
				["MGF scared animation"] = "rbxassetid://86398576306953",
				["MGF patrol animation"] = "rbxassetid://131603010936163",
				["MGF musician animation"] = "rbxassetid://138827413895574",
				["MGF dying animation"] = "rbxassetid://128467654154071",
				["MGF injured animation"] = "rbxassetid://94302036679429",
				["Manhattan Ristretto animation"] = "rbxassetid://113036130862238",
				["Adam Dice animation (died)"] = "rbxassetid://114023816208972",
				["Masterbait"] = "rbxassetid://72042024"
			}

			local animationTracks = {}
			local function playToggleAnimation(name, id, state)
				local character = player.Character
				if not character or not character:FindFirstChild("Humanoid") then return end
				local humanoid = character.Humanoid
				local animator = humanoid:FindFirstChildOfClass("Animator")
				if not animator then
					animator = Instance.new("Animator")
					animator.Parent = humanoid
				end

				if state then
					if not animationTracks[name] then
						local anim = Instance.new("Animation")
						anim.AnimationId = id
						local track = animator:LoadAnimation(anim)
						track.Looped = true
						track:Play()
						animationTracks[name] = track
					else
						animationTracks[name]:Play()
					end
				else
					if animationTracks[name] then
						animationTracks[name]:Stop()
						animationTracks[name]:Destroy()
						animationTracks[name] = nil
					end
				end
			end

			for name, id in pairs(toggleanimations) do
				local flagName = name:gsub("%s+", "") .. "Toggle"

				FunTab:CreateToggle({
					Name = name,
					CurrentValue = false,
					Flag = flagName,
					Callback = function(v)
						playToggleAnimation(name, id, v)
					end
				})

				FunTab:CreateKeybind({
					Name = name .. " (keybind)",
					CurrentKeybind = "",
					HoldToInteract = false,
					Flag = name:gsub("%s+", "") .. "Keybind",
					Callback = function()
						local current = not Rayfield.Flags[flagName].CurrentValue
						Rayfield.Flags[flagName]:Set(current)
						playToggleAnimation(name, id, current)
					end
				})
			end

			FunTab:CreateSection("Animation buttons")
				local animations = {
					["Chimera's punch animation"] = "rbxassetid://84314656273153",
					["Chimera's execution animation"] = "rbxassetid://97305733594978",
					["Chimera's victim animation"] = "rbxassetid://83991914102646",
					["Chimera's teleport animation"] = "rbxassetid://126809285460597",
					["Chimera's exposed animation"] = "rbxassetid://75151963392982",
					["Gilbert's kick animation"] = "rbxassetid://86079982232120",
					["Gilbert's rage animation"] = "rbxassetid://93590784469036",
					["Infection fall animation (1)"] = "rbxassetid://99985127815659",
					["Infection fall animation (2)"] = "rbxassetid://139465334169627",
					["Cough animation"] = "rbxassetid://111615919261340",
					["Adam Dice's death"] = "rbxassetid://102514666836619",
					["D-Zero's vent animation"] = "rbxassetid://116242805691656",
					["D-Zero's punch animation"] = "rbxassetid://83700864626681"
				}

				local function playAnimation(id)
					local character = player.Character
					if not character or not character:FindFirstChild("Humanoid") then return end
					local humanoid = character.Humanoid
					local animator = humanoid:FindFirstChildOfClass("Animator")
					if not animator then
						animator = Instance.new("Animator")
						animator.Parent = humanoid
					end

					local anim = Instance.new("Animation")
					anim.AnimationId = id
					local track = animator:LoadAnimation(anim)
					track:Play()
					track.Stopped:Connect(function()
						track:Destroy()
					end)
				end

				for name, id in pairs(animations) do
					FunTab:CreateButton({
						Name = name,
						Callback = function()
							playAnimation(id)
						end,
					})

					FunTab:CreateKeybind({
						Name = name .. " (keybind)",
						CurrentKeybind = "",
						HoldToInteract = false,
						Flag = name:gsub("%s+", "") .. "Keybind",
						Callback = function()
							playAnimation(id)
						end,
					})
				end

	local InfoTab = Window:CreateTab("Information", "users")
		InfoTab:CreateSection("Credits")
			InfoTab:CreateLabel("mktlvu — creator", 89731341681675)
			InfoTab:CreateLabel("ChatGPT — assistant", 81220310187689)

		InfoTab:CreateSection("Profiles")
			InfoTab:CreateLabel("Github: HappinessAlive", "github")
			InfoTab:CreateLabel("Discord: mehappiness", "smile")

	local SettingsTab = Window:CreateTab("Settings", "settings")
		SettingsTab:CreateSection("Themes")
			local themes = {
				["Default"] = "Default",
				["Amber glow"] = "AmberGlow",
				["Amethyst"] = "Amethyst",
				["Bloom"] = "Bloom",
				["Dark blue"] = "DarkBlue",
				["Green"] = "Green",
				["Light"] = "Light",
				["Ocean"] = "Ocean",
				["Serenity"] = "Serenity"
			}

			for displayName, themeName in pairs(themes) do
				SettingsTab:CreateButton({
					Name = displayName,
					Callback = function()
						Window.ModifyTheme(themeName)
					end
				})
			end

		SettingsTab:CreateSection("Rayfield UI")
			SettingsTab:CreateButton({
				Name = "Destroy Rayfield",
				Callback = function()
					Rayfield:Destroy()
				end,
			})
