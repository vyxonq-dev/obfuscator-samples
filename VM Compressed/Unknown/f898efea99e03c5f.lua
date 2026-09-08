local allowedPlaceIds = {
	15027718878, -- Replace with the allowed PlaceId(s)
}

if not table.find(allowedPlaceIds, game.PlaceId) then
	warn("This script is not allowed in this place.")
	return -- stops the script from continuing
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "The Space Simulator - Space Hub 🪐",
	Icon = 17104625041, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Space Hub v0.4",
	LoadingSubtitle = "by Dev_Smiley",
	ShowText = "Space Hub 🪐", -- for mobile users to unhide rayfield, change if you'd like
	Theme = "Bloom", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},

	Discord = {
		Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},

	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

local ShipTab = Window:CreateTab("Ship", 4483362458) -- Title, Image
local MSettingsTab = Window:CreateTab("Mine Settings", 4483362458) -- Title, Image
local PlayerTab = Window:CreateTab("LocalPlayer", 4483362458) -- Title, Image
local ESPTab = Window:CreateTab("ESP", 4483362458) -- Title, Image
local OtherTpTab = Window:CreateTab("Teleport", 4483362458) -- Title, Image
local CSettingsTab = Window:CreateTab("Client Settings", 4483362458) -- Title, Image
local PlanetTpTab = Window:CreateTab("Bring Ships", 4483362458)
local OtherTab = Window:CreateTab("Other", 4483362458) -- Title, Image

local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

--Local Player Functions

local Slider = PlayerTab:CreateSlider({
	Name = "Walkspeed",
	Range = {10, 100},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 10,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
	end,
})
local Slider = PlayerTab:CreateSlider({
	Name = "JetPack Speed",
	Range = {5, 100},
	Increment = 1,
	Suffix = "Max Jetpack Speed",
	CurrentValue = 5,
	Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer:SetAttribute("jetpackSpeed", Value)
	end,
})

local Slider = PlayerTab:CreateSlider({
	Name = "Jump Power",
	Range = {50, 400},
	Increment = 1,
	Suffix = "Current Jump Power",
	CurrentValue = 50,
	Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
	end,
})

local Slider = PlayerTab:CreateSlider({
	Name = "Hip Height",
	Range = {0, 100},
	Increment = 1,
	Suffix = "Current Hip Height",
	CurrentValue = 0,
	Flag = "Slider4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = Value
	end,
})

--Toggle Buttons For Boolens
local Button = PlayerTab:CreateButton({
	Name = "Sit Player",
	Callback = function()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true-- The function that takes place when the button is pressed
	end,
})

local Button = PlayerTab:CreateButton({
	Name = "Reset",
	Callback = function()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0-- The function that takes place when the button is pressed
	end,
})

-------------------------------------------------------------------------------------------------------------------------------------------------------------

local Label = MSettingsTab:CreateLabel("Please Turn Off When You Leave Planet Or Die", 4483362458, Color3.fromRGB(255, 205, 220), false)

local Toggle = MSettingsTab:CreateToggle({
	Name = "1 Hit Mine Resources And Orbs",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")

		local allowedClasses = {
			["BasePart"] = true,
			["MeshPart"] = true,
			["UnionOperation"] = true,
			["Part"] = true,
		}

		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then
			warn("Planets folder not found in Workspace.")
			return
		end

		-- Find closest planet model
		local nearestPlanet, minDistance = nil, math.huge
		for _, model in pairs(planetsFolder:GetChildren()) do
			if model:IsA("Model") then
				local referencePart = nil
				if model:FindFirstChild("Center") then
					referencePart = model.Center
				elseif model.Name == "Sun" then
					local core = model:FindFirstChildWhichIsA("MeshPart")
					if core and core.Name == "Core" then
						referencePart = core
					end
				end

				if referencePart then
					local dist = (referencePart.Position - hrp.Position).Magnitude
					if dist < minDistance and dist <= 200 then
						nearestPlanet = model
						minDistance = dist
					end
				end
			end
		end


		if not nearestPlanet then
			warn("No nearby planet found within 200 studs.")
			return
		end

		local mineralsFolder = nearestPlanet:FindFirstChild("Minerals")
		if not mineralsFolder then
			warn("No Minerals folder in:", nearestPlanet.Name)
			return
		end

		for _, part in ipairs(mineralsFolder:GetDescendants()) do
			if allowedClasses[part.ClassName] and part:GetAttribute("hitpoints") ~= nil then
				local dist = (part.Position - hrp.Position).Magnitude
				if dist <= 200 then
					if Value then
						-- Toggle ON: Set hitpoints to 1
						if part:GetAttribute("hitpoints") ~= 1 then
							part:SetAttribute("hitpoints", 1)
						end
					else
						-- Toggle OFF: Reset hitpoints to 100
						part:SetAttribute("hitpoints", 100)
					end
				end
			end
		end
	end,
})

local Toggle = MSettingsTab:CreateToggle({
	Name = "No Pickaxe Level Require Client Side",
	CurrentValue = false,
	Flag = "Toggle2",
	Callback = (function()
		local modifiedParts = {}  -- Store original minPickaxeLevel values

		return function(Value)
			local Players = game:GetService("Players")
			local player = Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local hrp = character:WaitForChild("HumanoidRootPart")

			local allowedClasses = {
				["BasePart"] = true,
				["MeshPart"] = true,
				["UnionOperation"] = true,
				["Part"] = true,
			}

			local planetsFolder = workspace:FindFirstChild("Planets")
			if not planetsFolder then
				warn("Planets folder not found in Workspace.")
				return
			end

			-- Find closest planet within 200 studs
			local nearestPlanet, minDistance = nil, math.huge
			for _, model in pairs(planetsFolder:GetChildren()) do
				if model:IsA("Model") then
					local referencePart = nil
					if model:FindFirstChild("Center") then
						referencePart = model.Center
					elseif model.Name == "Sun" then
						local core = model:FindFirstChildWhichIsA("MeshPart")
						if core and core.Name == "Core" then
							referencePart = core
						end
					end

					if referencePart then
						local dist = (referencePart.Position - hrp.Position).Magnitude
						if dist < minDistance and dist <= 200 then
							nearestPlanet = model
							minDistance = dist
						end
					end
				end
			end

			if not nearestPlanet then
				warn("No nearby planet found within 200 studs.")
				return
			end

			local mineralsFolder = nearestPlanet:FindFirstChild("Minerals")
			if not mineralsFolder then
				warn("No Minerals folder in:", nearestPlanet.Name)
				return
			end

			if Value then
				-- Toggle ON: Set minPickaxeLevel to 1
				for _, part in ipairs(mineralsFolder:GetDescendants()) do
					if allowedClasses[part.ClassName] then
						local level = part:GetAttribute("minPickaxeLevel")
						if level ~= nil and level ~= 1 then
							local dist = (part.Position - hrp.Position).Magnitude
							if dist <= 200 then
								modifiedParts[part] = level
								part:SetAttribute("minPickaxeLevel", 1)
							end
						end
					end
				end
			else
				-- Toggle OFF: Restore all previously modified parts
				for part, originalLevel in pairs(modifiedParts) do
					if part and part:IsDescendantOf(game) then
						part:SetAttribute("minPickaxeLevel", originalLevel)
					end
				end
				table.clear(modifiedParts)
			end
		end
	end)()
})

local teleporting = false
local teleportCoroutine
local equipCoroutine

local function AstartTeleportLoop()
	if teleporting then return end
	teleporting = true

	teleportCoroutine = coroutine.create(function()
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")

		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then
			warn("Planets folder not found in Workspace.")
			teleporting = false
			return
		end

		-- Find closest planet within 200 studs
		local nearestPlanet, minDistance = nil, math.huge
		for _, model in pairs(planetsFolder:GetChildren()) do
			if model:IsA("Model") then
				local referencePart = nil
				if model:FindFirstChild("Center") then
					referencePart = model.Center
				elseif model.Name == "Sun" then
					local core = model:FindFirstChildWhichIsA("MeshPart")
					if core and core.Name == "Core" then
						referencePart = core
					end
				end

				if referencePart then
					local dist = (referencePart.Position - hrp.Position).Magnitude
					if dist < minDistance and dist <= 200 then
						nearestPlanet = model
						minDistance = dist
					end
				end
			end
		end

		if not nearestPlanet then
			warn("No nearby planet found within 200 studs.")
			teleporting = false
			return
		end

		local mineralsFolder = nearestPlanet:FindFirstChild("Minerals")
		if not mineralsFolder then
			warn("No Minerals folder in:", nearestPlanet.Name)
			teleporting = false
			return
		end

		local parts = {}
		for _, part in ipairs(mineralsFolder:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(parts, part)
			end
		end

		if #parts == 0 then
			warn("No parts found inside Minerals folder.")
			teleporting = false
			return
		end

		local startCFrame = hrp.CFrame
		local lastIndex = nil

		while teleporting do
			for i, part in ipairs(parts) do
				if not teleporting then break end

				-- Avoid teleporting to the same part twice in a row
				if i == lastIndex then
					i = (i % #parts) + 1  -- move to next index safely
				end

				lastIndex = i

				-- Teleport player slowly (instant here, you can tween if you want smooth)
				hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0) -- teleport a bit above the part

				task.wait(1) -- wait 1 second before next teleport
			end

			if not teleporting then break end

			-- After finishing all parts, teleport back to start slowly
			hrp.CFrame = startCFrame + Vector3.new(0, 3, 0)
			task.wait(1)
		end

		print("Teleport loop stopped.")
	end)

	coroutine.resume(teleportCoroutine)
end

local function AstopTeleportLoop()
	if teleporting then
		teleporting = false
		print("Teleport loop stopped manually.")
	end
end

local Toggle3 = MSettingsTab:CreateToggle({
	Name = "Teleport To Resources ( You Must Inside Planets )",
	CurrentValue = false,
	Flag = "Toggle3",
	Callback = function(Value)
		if Value then
			AstartTeleportLoop()
		else
			AstopTeleportLoop()
		end
	end
})

local function startEquipLoop()
	if teleporting then return end
	teleporting = true

	equipCoroutine = coroutine.create(function()
		local player = game.Players.LocalPlayer
		local backpack = player:WaitForChild("Backpack")

		while teleporting do
			local pickaxes = {}
			for _, item in ipairs(backpack:GetChildren()) do
				if item:IsA("Tool") and item:GetAttribute("pickaxe") == true then
					table.insert(pickaxes, item)
				end
			end

			local toolToEquip = pickaxes[2]
			if toolToEquip then
				toolToEquip.Parent = player.Character
			end

			task.wait(0.5)
		end
	end)

	coroutine.resume(equipCoroutine)
end

local function stopEquipLoop()
	teleporting = false
end

local Toggle4 = MSettingsTab:CreateToggle({
	Name = "Auto Equip Pickaxe",
	CurrentValue = false,
	Flag = "Toggle4",
	Callback = function(Value)
		if Value then
			startEquipLoop()
		else
			stopEquipLoop()
		end
	end
})

-------------------------------------------------------------------------------------------------------------------------------------------------------------

local Button = PlayerTab:CreateButton({
	Name = "Rejoin",
	Callback = function()
		local player = game.Players.LocalPlayer
		local placeId = game.PlaceId
		TeleportService:Teleport(placeId, player)
	end,
})

local autorotateButton
local AutoRotate = false

autorotateButton = PlayerTab:CreateButton({
	Name = "Auto Rotate: True",
	Callback = function()
		local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			warn("Humanoid Not Found")
			return
		end

		AutoRotate = not AutoRotate
		if AutoRotate then
			autorotateButton:Set("Auto Rotate: True")
			humanoid.AutoRotate = true
		else
			autorotateButton:Set("Auto Rotate: False")
			humanoid.AutoRotate = false
		end
	end,
})

--Ship Functions

local Label = ShipTab:CreateLabel("For Change Speed You Must Sitting In Ship", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

local Slider = ShipTab:CreateSlider({
	Name = "Ship Speed",
	Range = {0, 100},
	Increment = 1,
	Suffix = "Max Speed",
	CurrentValue = 0,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").SeatPart.Parent:FindFirstChild("Main"):SetAttribute("maxSpeed", Value)-- The function that takes place when the slider changes
	end,
})

local Slider = ShipTab:CreateSlider({
	Name = "Ship Acceleration",
	Range = {0, 150},
	Increment = 1,
	Suffix = "Max Acceleration",
	CurrentValue = 0,
	Flag = "Slider2",
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").SeatPart.Parent:FindFirstChild("Main"):SetAttribute("acceleration", Value)
	end,
})

local Slider = ShipTab:CreateSlider({
	Name = "Ship Deceleration",
	Range = {0, 100},
	Increment = 1,
	Suffix = "Max Deceleration",
	CurrentValue = 0,
	Flag = "Slider3",
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").SeatPart.Parent:FindFirstChild("Main"):SetAttribute("deceleration", Value)
	end,
})


local Slider = ShipTab:CreateSlider({
	Name = "Ship Agility",
	Range = {0, 100},
	Increment = 1,
	Suffix = "Max Agility",
	CurrentValue = 0,
	Flag = "Slider4",
	Callback = function(Value)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").SeatPart.Parent:FindFirstChild("Main"):SetAttribute("agility", Value)
	end,		
})

local Label = ShipTab:CreateLabel("Kuiper Belt Speed Loop (Value 0 To Stop Loop)", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

local speedLoopConnection
local currentSpeedValue = 0 -- Keep track of latest slider value

local Slider = ShipTab:CreateSlider({
	Name = "Ship Speed",
	Range = {0, 100},
	Increment = 1,
	Suffix = "Loop Speed",
	CurrentValue = 0,
	Flag = "Slider5",
	Callback = function(Value)
		currentSpeedValue = Value

		local seat = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").SeatPart
		local main = seat and seat.Parent and seat.Parent:FindFirstChild("Main")
		if not main then return end

		local linearVelocity = main:FindFirstChildOfClass("LinearVelocity")
		if not linearVelocity then return end

		if Value <= 0 then
			if speedLoopConnection then
				speedLoopConnection:Disconnect()
				speedLoopConnection = nil
			end
			linearVelocity.VectorVelocity = Vector3.zero
			return
		end

		-- Start loop if not already started
		if not speedLoopConnection then
			speedLoopConnection = game:GetService("RunService").Heartbeat:Connect(function()
				linearVelocity.VectorVelocity = Vector3.new(currentSpeedValue, 0, 0)
			end)
		end
	end
})

--Client Settings Functions

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Instant Speed Gamepass",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("InstantSpeedGP", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Instant Brake Gamepass",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("InstantBrakeGP", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Music Player Gamepass",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("MusicPlayerGP", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Ship Lock Gamepass (Client Side)",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("ShipLockGP", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Enable InGroup (Client Side)",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("inGroup", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Vortex Gamepass (Client Side)",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("VortexGP", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Quantum Drill Gamepass (Client Side)",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("QuantumDrillGP", true)-- The function that takes place when the button is pressed
	end,
})

local Button = CSettingsTab:CreateButton({
	Name = "Unlock Double Xp Gamepass (Client Side)",
	Callback = function()
		game.Players.LocalPlayer:SetAttribute("DoubleXpGP", true)-- The function that takes place when the button is pressed
	end,
})

--Other Functions

local function firePrompt(prompt)
	if typeof(prompt) == "Instance" and prompt:IsA("ProximityPrompt") then
		-- fireproximityprompt is a global function in Roblox
		fireproximityprompt(prompt)
	else
		warn("Provided object is not a ProximityPrompt!")
	end
end

local Button = OtherTab:CreateButton({
	Name = "Open Hubble Telescope",
	Callback = function()
		local prompt = workspace:WaitForChild("Planetoids"):WaitForChild("Hubble"):WaitForChild("ControlPanel"):FindFirstChildOfClass("ProximityPrompt")
		if prompt then
			firePrompt(prompt)
		end
	end,
})

local AntiCheatHideFrameButton

local dialogGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("DialogGui")
local cleanerOn = false
local cleanerConnection = nil

toggleButton = OtherTab:CreateButton({
	Name = "Anti-Cheat Warning Frame: Show",
	Callback = function()
		cleanerOn = not cleanerOn

		if cleanerOn then
			toggleButton:Set("Anti-Cheat Warning Frame: Hide") -- show "Hide" when enabled

			-- Start cleaning loop
			cleanerConnection = RunService.RenderStepped:Connect(function()
				if not dialogGui then return end

				local dialogsFrame = dialogGui:FindFirstChild("DialogsFrames")
				if dialogsFrame then
					for _, child in ipairs(dialogsFrame:GetChildren()) do
						if child:IsA("Frame") then
							child:Destroy()
						end
					end
				end
			end)

		else
			toggleButton:Set("Anti-Cheat Warning Frame: Show") -- show "Show" when disabled

			-- Stop cleaning loop
			if cleanerConnection then
				cleanerConnection:Disconnect()
				cleanerConnection = nil
			end
		end
	end
})

local Button = OtherTab:CreateButton({
	Name = "Clean Rocks Asteroids",
	Callback = function()
		local rocks = workspace:WaitForChild("Rocks")
		for _, child in ipairs(rocks:GetChildren()) do
			child:Destroy()
		end
	end,
})

local Button

Button = OtherTab:CreateButton({
	Name = "Destroy Client (Stop The Main Functions)",
	Callback = function()
		local skin = workspace:WaitForChild("Planets"):WaitForChild("Eris"):WaitForChild("Skin")
		if skin then
			skin:Destroy()
		end

		-- Change button text after action
		Button:Set("Game Client Destroyed. Please Rejoin")
	end,
})

--ESP Functions

local Label = ESPTab:CreateLabel("Please Turn Off And On Back If They Are Not Updating", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

--Alien Ship ESP Functions

local espAOn = false
local billboardName = "AlienESP_Billboard"

local alienShip = workspace:WaitForChild("SpecialRockets"):WaitForChild("Alien")

local function addABillboard()
	if alienShip:FindFirstChild(billboardName) then return end

	local abillboard = Instance.new("BillboardGui")
	abillboard.Name = billboardName
	abillboard.Adornee = alienShip
	abillboard.Size = UDim2.new(0, 80, 0, 20)
	abillboard.StudsOffset = Vector3.new(0, 2, 0)
	abillboard.AlwaysOnTop = true
	abillboard.Parent = alienShip

	local atextLabel = Instance.new("TextLabel")
	atextLabel.Size = UDim2.new(1, 0, 1, 0)
	atextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	atextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	atextLabel.BackgroundTransparency = 1
	atextLabel.Text = "Alien Ship 🛸"
	atextLabel.TextColor3 = Color3.new(0, 0.666667, 0.498039)
	atextLabel.Font = Enum.Font.FredokaOne
	atextLabel.TextScaled = true
	atextLabel.Parent = abillboard
end

local function removeABillboard()
	local billboard = alienShip:FindFirstChild(billboardName)
	if billboard then
		billboard:Destroy()
	end
end

--Centaurs ESP Functions

local espOn = false
local billboardName = "CentaurESP_Billboard"

local function getCentaurFolder()
	return workspace:FindFirstChild("Centaurs")
end

local function addBillboards()
	local centaurFolder = getCentaurFolder()
	if not centaurFolder then
		warn("Centaurs folder not found in workspace.")
		return
	end

	for _, model in pairs(centaurFolder:GetChildren()) do
		if model:IsA("Model") and not model:FindFirstChild(billboardName) then
			local primaryPart = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChildWhichIsA("BasePart")
			if primaryPart then
				local billboard = Instance.new("BillboardGui")
				billboard.Name = billboardName
				billboard.Adornee = primaryPart
				billboard.Size = UDim2.new(0, 80, 0, 20)
				billboard.StudsOffset = Vector3.new(0, 3, 0)
				billboard.AlwaysOnTop = true
				billboard.Parent = model

				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(1, 0, 1, 0)
				textLabel.AnchorPoint = Vector2.new(0.5, 0.5) -- Center alignment
				textLabel.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center position
				textLabel.BackgroundTransparency = 1
				textLabel.Text = model.Name
				textLabel.TextColor3 = Color3.new(1, 1, 1) -- Yellow
				textLabel.Font = Enum.Font.Jura
				textLabel.TextScaled = true
				textLabel.Parent = billboard
			end
		end
	end
end

local function removeBillboards()
	local centaurFolder = getCentaurFolder()
	if not centaurFolder then return end

	for _, model in pairs(centaurFolder:GetChildren()) do
		local billboard = model:FindFirstChild(billboardName)
		if billboard then
			billboard:Destroy()
		end
	end
end

--Voyager ESP Functions

local espOn = false
local billboardName = "VoyagerESP_Billboard"

local goldenRecord = workspace:WaitForChild("Planetoids")
	:WaitForChild("Voyager")
	:WaitForChild("Minerals")
	:WaitForChild("Golden Record")

local function addBillboard()
	if goldenRecord:FindFirstChild(billboardName) then return end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = billboardName
	billboard.Adornee = goldenRecord
	billboard.Size = UDim2.new(0, 80, 0, 20)
	billboard.StudsOffset = Vector3.new(0, 2, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = goldenRecord

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Voyager 🛰"
	textLabel.TextColor3 = Color3.new(0, 0.666667, 1)
	textLabel.Font = Enum.Font.FredokaOne
	textLabel.TextScaled = true
	textLabel.Parent = billboard
end

local function removeBillboard()
	local billboard = goldenRecord:FindFirstChild(billboardName)
	if billboard then
		billboard:Destroy()
	end
end

local toggleButton -- forward declare for use inside the callback
local espvgbutton
local AlienESPButton

toggleButton = ESPTab:CreateButton({
	Name = "Centaurs ESP: Off",
	Callback = function()
		local centaurFolder = getCentaurFolder()
		if not centaurFolder then
			warn("Centaurs folder not found, can't toggle ESP.")
			return
		end

		espOn = not espOn
		if espOn then
			toggleButton:Set("Centaurs ESP: On")
			addBillboards()
		else
			toggleButton:Set("Centaurs ESP: Off")
			removeBillboards()
		end
	end,
})

espvgbutton = ESPTab:CreateButton({
	Name = "Voyager ESP: Off",
	Callback = function()
		espOn = not espOn
		if espOn then
			espvgbutton:Set("Voyager ESP: On")
			addBillboard()
		else
			espvgbutton:Set("Voyager ESP: Off")
			removeBillboard()
		end
	end
})

AlienESPButton = ESPTab:CreateButton({
	Name = "Alien UFO ESP: Off",
	Callback = function()
		espAOn = not espAOn
		if espAOn then
			AlienESPButton:Set("Alien UFO ESP: On")
			addABillboard()
		else
			AlienESPButton:Set("Alien UFO ESP: Off")
			removeABillboard()
		end
	end
})

local toggleConnection
local espTags = {} -- Track ESPs so we can remove them later

local Toggle = ESPTab:CreateToggle({
	Name = "Artifact ESP",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		-- Cleanup old ESPs if turning off
		if not Value then
			for _, tag in ipairs(espTags) do
				if tag and tag.Parent then
					tag:Destroy()
				end
			end
			espTags = {}
			return
		end

		-- On toggle ON
		local planets = workspace:FindFirstChild("Planets")
		if not planets then return end

		for _, model in ipairs(planets:GetChildren()) do
			local artifacts = model:FindFirstChild("Artifacts")
			if artifacts then
				for _, part in ipairs(artifacts:GetDescendants()) do
					if part:IsA("BasePart") then
						local billboard = Instance.new("BillboardGui")
						billboard.Name = "ArtifactESP"
						billboard.Size = UDim2.new(0, 80, 0, 20)
						billboard.StudsOffset = Vector3.new(0, 2, 0)
						billboard.AlwaysOnTop = true
						billboard.Adornee = part
						billboard.Parent = part

						local label = Instance.new("TextLabel")
						label.AnchorPoint = Vector2.new(0.5, 0.5)
						label.Position = UDim2.new(0.5, 0, 0.5, 0)
						label.Size = UDim2.new(1, 0, 1, 0)
						label.BackgroundTransparency = 1

						local aType = part:GetAttribute("aType") or part.Name
						local rarity = part:GetAttribute("rarity") or "Unknown"
						local mass = part:GetAttribute("mass")
						local massText = mass and tostring(mass) or "N/A"

						label.Text = string.format("%s:%s (%sKg)", aType, rarity, massText)
						label.TextColor3 = Color3.new(1, 1, 0)
						label.TextStrokeTransparency = 0.5
						label.TextScaled = true
						label.Font = Enum.Font.SourceSansBold
						label.Parent = billboard

						table.insert(espTags, billboard)
					end
				end
			end
		end
	end,
})

local Toggle = ESPTab:CreateToggle({
	Name = "Crate ESP (Centaurs)",
	CurrentValue = false,
	Flag = "Toggle2",
	Callback = function(Value)
		local espName = "CrateESP"

		local function removeAllESP()
			for _, obj in ipairs(workspace:GetDescendants()) do
				if obj:IsA("BasePart") or obj:IsA("MeshPart") then
					local tag = obj:FindFirstChild(espName)
					if tag and tag:IsA("BillboardGui") then
						tag:Destroy()
					end
				end
			end
		end

		if not Value then
			removeAllESP()
			return
		end

		local centaurs = workspace:FindFirstChild("Centaurs")
		if not centaurs then return end

		for _, centaur in ipairs(centaurs:GetChildren()) do
			local minerals = centaur:FindFirstChild("Minerals")
			if minerals then
				for _, part in ipairs(minerals:GetDescendants()) do
					if (part:IsA("BasePart") or part:IsA("MeshPart")) then
						local isCrate = part:GetAttribute("crate")
						local hitpoints = part:GetAttribute("hitpoints")

						if typeof(isCrate) == "boolean" and isCrate == true
							and typeof(hitpoints) == "number" and hitpoints > 0 then

							if not part:FindFirstChild(espName) then
								local billboard = Instance.new("BillboardGui")
								billboard.Name = espName
								billboard.Size = UDim2.new(0, 80, 0, 20)
								billboard.StudsOffset = Vector3.new(0, 2, 0)
								billboard.AlwaysOnTop = true
								billboard.Adornee = part
								billboard.Parent = part

								local label = Instance.new("TextLabel")
								label.AnchorPoint = Vector2.new(0.5, 0.5)
								label.Position = UDim2.new(0.5, 0, 0.5, 0)
								label.Size = UDim2.new(1, 0, 1, 0)
								label.BackgroundTransparency = 1
								label.Text = part.Name .. " 🎁"
								label.TextColor3 = Color3.new(1, 0.666667, 0.498039)
								label.TextStrokeTransparency = 0.5
								label.TextScaled = true
								label.Font = Enum.Font.SourceSansBold
								label.Parent = billboard
							end
						end
					end
				end
			end
		end
	end,
})

local toggleConnection

local Toggle3 = ESPTab:CreateToggle({
	Name = "Orbs ESP",
	CurrentValue = false,
	Flag = "Toggle3",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")
		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then return end

		if Value then
			toggleConnection = RunService.Heartbeat:Connect(function()
				for _, planetModel in pairs(planetsFolder:GetChildren()) do
					if planetModel:IsA("Model") then
						local planetName = planetModel.Name
						local minerals = planetModel:FindFirstChild("Minerals")
						if minerals then
							local orbName = planetName .. " Orb"
							local orbPart = minerals:FindFirstChild(orbName)

							if orbPart and orbPart:IsA("BasePart") then
								local hitpoints = orbPart:GetAttribute("hitpoints")
								if typeof(hitpoints) == "number" and hitpoints > 0 then
									-- Billboard
									if not orbPart:FindFirstChild("OrbBillboard") then
										local bb = Instance.new("BillboardGui")
										bb.Name = "OrbBillboard"
										bb.Size = UDim2.new(0, 80, 0, 20)
										bb.StudsOffset = Vector3.new(0, 3, 0)
										bb.Adornee = orbPart
										bb.AlwaysOnTop = true
										bb.Parent = orbPart

										local label = Instance.new("TextLabel")
										label.Size = UDim2.new(1, 0, 1, 0)
										label.BackgroundTransparency = 1
										label.TextColor3 = Color3.fromRGB(0, 170, 255)
										label.TextStrokeTransparency = 0.5
										label.TextScaled = true
										label.Font = Enum.Font.SourceSansBold
										label.Text = planetName .. " Orb 🎯"
										label.Parent = bb
									end
								else
									-- Remove billboard if hitpoints is 0 or invalid
									local bb = orbPart:FindFirstChild("OrbBillboard")
									if bb then bb:Destroy() end
								end
							end
						end
					end
				end
			end)
		else
			-- Toggle OFF: Disconnect and remove all billboards
			if toggleConnection then
				toggleConnection:Disconnect()
				toggleConnection = nil
			end

			for _, planetModel in pairs(planetsFolder:GetChildren()) do
				if planetModel:IsA("Model") then
					local minerals = planetModel:FindFirstChild("Minerals")
					if minerals then
						local orbName = planetModel.Name .. " Orb"
						local orbPart = minerals:FindFirstChild(orbName)
						if orbPart and orbPart:IsA("BasePart") then
							local bb = orbPart:FindFirstChild("OrbBillboard")
							if bb then bb:Destroy() end
						end
					end
				end
			end
		end
	end,
})

local toggleConnection4

local Toggle4 = ESPTab:CreateToggle({
	Name = "Metallic Hydrogen ESP",
	CurrentValue = false,
	Flag = "Toggle4",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")
		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then return end

		if Value then
			toggleConnection4 = RunService.Heartbeat:Connect(function()
				for _, planetModel in pairs(planetsFolder:GetChildren()) do
					if planetModel:IsA("Model") then
						local planetName = planetModel.Name
						local minerals = planetModel:FindFirstChild("Minerals")
						if minerals then
							local mhPart = minerals:FindFirstChild("Metallic Hydrogen")

							if mhPart and mhPart:IsA("MeshPart") then
								local hitpoints = mhPart:GetAttribute("hitpoints")

								if typeof(hitpoints) == "number" and hitpoints > 0 then
									-- Only set to 1 if not already 1
									if hitpoints ~= 1 then
										mhPart:SetAttribute("hitpoints", 1)
									end

									if not mhPart:FindFirstChild("MHEsp") then
										local bb = Instance.new("BillboardGui")
										bb.Name = "MHEsp"
										bb.Size = UDim2.new(0, 80, 0, 20)
										bb.StudsOffset = Vector3.new(0, 3, 0)
										bb.Adornee = mhPart
										bb.AlwaysOnTop = true
										bb.Parent = mhPart

										local label = Instance.new("TextLabel")
										label.Size = UDim2.new(1, 0, 1, 0)
										label.BackgroundTransparency = 1
										label.TextColor3 = Color3.fromRGB(255, 170, 127)
										label.TextStrokeTransparency = 0.5
										label.TextScaled = true
										label.Font = Enum.Font.SourceSansBold
										label.Text = planetName .. " Metallic Hydrogen"
										label.Parent = bb
									end
								end
							end
						end
					end
				end
			end)
		else
			if toggleConnection4 then
				toggleConnection4:Disconnect()
				toggleConnection4 = nil
			end

			for _, planetModel in pairs(planetsFolder:GetChildren()) do
				if planetModel:IsA("Model") then
					local minerals = planetModel:FindFirstChild("Minerals")
					if minerals then
						local mhPart = minerals:FindFirstChild("Metallic Hydrogen")
						if mhPart and mhPart:IsA("MeshPart") then
							local existing = mhPart:FindFirstChild("MHEsp")
							if existing then
								existing:Destroy()
							end
						end
					end
				end
			end
		end
	end
})

local toggleConnection5

local Toggle5 = ESPTab:CreateToggle({
	Name = "Teleport to Hydrogen",
	CurrentValue = false,
	Flag = "Toggle5",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")
		local humanoid = character:WaitForChild("Humanoid")
		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then return end

		if Value then
			toggleConnection5 = RunService.Heartbeat:Connect(function()
				if humanoid.Sit then return end

				for _, planetModel in pairs(planetsFolder:GetChildren()) do
					if planetModel:IsA("Model") then
						local minerals = planetModel:FindFirstChild("Minerals")
						if minerals then
							local hydrogen = minerals:FindFirstChild("Metallic Hydrogen")

							if hydrogen and hydrogen:IsA("MeshPart") then
								local hitpoints = hydrogen:GetAttribute("hitpoints")
								if typeof(hitpoints) == "number" and hitpoints > 0 then
									local distance = (hydrogen.Position - hrp.Position).Magnitude
									if distance <= 150 then
										hrp.CFrame = CFrame.new(hydrogen.Position + Vector3.new(0, 0, 0))
										break -- optional: teleport to first one only
									end
								end
							end
						end
					end
				end
			end)
		else
			if toggleConnection5 then
				toggleConnection5:Disconnect()
				toggleConnection5 = nil
			end
		end
	end
})

local Label = ESPTab:CreateLabel("Sun Orb Settings (This Is Added For Test)", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

local toggleConnection6

local Toggle6 = ESPTab:CreateToggle({
	Name = "1 Hit Sun Orb",
	CurrentValue = false,
	Flag = "Toggle6",
	Callback = function(Value)
		local sunOrbPath = workspace:FindFirstChild("Planets")
		if not sunOrbPath then return end

		sunOrbPath = sunOrbPath:FindFirstChild("Sun")
		if not sunOrbPath then return end

		local mineralsFolder = sunOrbPath:FindFirstChild("Minerals")
		if not mineralsFolder then return end

		if Value then
			toggleConnection6 = RunService.Heartbeat:Connect(function()
				local sunOrb = mineralsFolder:FindFirstChild("Sun Orb")
				if sunOrb and sunOrb:IsA("BasePart") then
					local hitpoints = sunOrb:GetAttribute("hitpoints")

					if typeof(hitpoints) == "number" and hitpoints ~= 0 and hitpoints ~= 1 then
						sunOrb:SetAttribute("hitpoints", 1)
					end
				end
			end)
		else
			if toggleConnection6 then
				toggleConnection6:Disconnect()
				toggleConnection6 = nil
			end
		end
	end
})

local toggleConnection7

local Toggle7 = ESPTab:CreateToggle({
	Name = "Bring 1 Random Sun Flare In Front",
	CurrentValue = false,
	Flag = "Toggle7",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")

		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then return end

		local sun = planetsFolder:FindFirstChild("Sun")
		if not sun then return end

		local area = sun:FindFirstChild("Area")
		if not area then return end

		local flaresFolder = area:FindFirstChild("Flares")
		if not flaresFolder then return end

		if Value then
			toggleConnection7 = RunService.Heartbeat:xConnect(function()
				local meshParts = {}

				for _, obj in pairs(flaresFolder:GetDescendants()) do
					if obj:IsA("MeshPart") then
						table.insert(meshParts, obj)
					end
				end

				if #meshParts > 0 then
					local chosen = meshParts[math.random(1, #meshParts)]
					if chosen and chosen:IsDescendantOf(workspace) then
						local targetPos = hrp.Position + hrp.CFrame.LookVector * 100
						if (chosen.Position - targetPos).Magnitude > 5 then
							chosen.CFrame = CFrame.new(targetPos)
						end
					end
				end
			end)
		else
			if toggleConnection7 then
				toggleConnection7:Disconnect()
				toggleConnection7 = nil
			end
		end
	end
})

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Other Teleports




local Label = OtherTpTab:CreateLabel("Earth Teleport ( Require Shuttle )", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

--Earth Functions And Button Toggle

local teleporting = false
local teleportCoroutine

local function startTeleportLoop()
	if teleporting then return end
	teleporting = true

	teleportCoroutine = coroutine.create(function()
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

		local targetPos = Vector3.new(-3300, 31, -1407)
		local searchRadius = 20

		local function findNearbySeat()
			for _, part in pairs(workspace:GetDescendants()) do
				if (part:IsA("Seat") or part:IsA("VehicleSeat")) and part:IsA("BasePart") then
					if (part.Position - targetPos).Magnitude <= searchRadius then
						return part
					end
				end
			end
			return nil
		end

		local targetSeat = findNearbySeat()

		if not targetSeat then
			warn("No seat found within 20 studs of target position!")
			teleporting = false
			-- Toggle OFF automatically
			OtherTpTab.Flags["Toggle1"] = false
			return
		end

		print("Found seat:", targetSeat:GetFullName())

		while teleporting do
			if not humanoid.Sit then
				-- Teleport player above seat until seated
				humanoidRootPart.CFrame = targetSeat.CFrame + Vector3.new(0, 2, 0)
			else
				print("Player is seated! Auto turning off.")
				teleporting = false
				-- Toggle OFF automatically
				OtherTpTab.Flags["Toggle1"] = false
				break
			end
			task.wait(0.3)
		end

		print("Teleport loop ended.")
	end)

	coroutine.resume(teleportCoroutine)
end

local function stopTeleportLoop()
	if teleporting then
		teleporting = false
		print("Teleport loop stopped manually.")
	end
end

local Toggle = OtherTpTab:CreateToggle({
	Name = "Earth Teleport",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if Value then
			startTeleportLoop()
		else
			stopTeleportLoop()
		end
	end
})

--Artifacts Teleport

local Label = OtherTpTab:CreateLabel("Artifacts", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

-- Outside the button
local artifactMemory = {}
local allArtifacts = {}

local function refreshArtifacts()
	allArtifacts = {}
	local planets = workspace:FindFirstChild("Planets")
	if planets then
		for _, model in ipairs(planets:GetChildren()) do
			local artifacts = model:FindFirstChild("Artifacts")
			if artifacts then
				for _, part in ipairs(artifacts:GetDescendants()) do
					if part:IsA("BasePart") then
						table.insert(allArtifacts, part)
					end
				end
			end
		end
	end
end

local Button = OtherTpTab:CreateButton({
	Name = "Artifact Teleport",
	Callback = function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		if #allArtifacts == 0 then
			refreshArtifacts()
		end

		-- Filter unvisited and within 150 studs
		local available = {}
		for _, artifact in ipairs(allArtifacts) do
			if not table.find(artifactMemory, artifact) then
				local distance = (hrp.Position - artifact.Position).Magnitude
				if distance <= 150 then
					table.insert(available, artifact)
				end
			end
		end

		if #available == 0 then
			artifactMemory = {} -- Reset memory
			refreshArtifacts()  -- Optionally refresh artifacts again
			return
		end

		local chosen = available[math.random(1, #available)]
		table.insert(artifactMemory, chosen)

		-- Teleport player right next to the artifact
		local targetPos = chosen.Position + Vector3.new(0, 3, 0) -- Slightly above
		hrp.CFrame = CFrame.new(targetPos)
	end,
})

local Label = OtherTpTab:CreateLabel("Caves ( You Must Inside That Planet To Teleport )", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

local isInsideMakeMake = false  -- Track toggle state
local Button2  -- declare it first

Button2 = OtherTpTab:CreateButton({
	Name = "Teleport Inside MakeMake Cave",
	Callback = function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		local center = workspace:WaitForChild("Planets"):WaitForChild("Makemake"):WaitForChild("Center")
		if not center or not center:IsA("BasePart") then return end

		if not isInsideMakeMake then
			-- Teleport under Center
			hrp.CFrame = center.CFrame * CFrame.new(0, -10, 0)
			isInsideMakeMake = true
			Button2:Set("Teleport Outside MakeMake Cave")
		else
			-- Teleport above Center
			hrp.CFrame = center.CFrame * CFrame.new(0, 35, 0)
			isInsideMakeMake = false
			Button2:Set("Teleport Inside MakeMake Cave")
		end
	end,
})

local isInsideSedna = false  -- Toggle state
local Button3  -- Declare first

Button3 = OtherTpTab:CreateButton({
	Name = "Teleport Inside Sedna Cave",
	Callback = function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		local center = workspace:WaitForChild("Planets"):WaitForChild("Sedna"):WaitForChild("Center")
		if not center or not center:IsA("BasePart") then return end

		if not isInsideSedna then
			-- Teleport under cave
			hrp.CFrame = center.CFrame * CFrame.new(0, -10, 0)
			isInsideSedna = true
			Button3:Set("Teleport Outside Sedna Cave")
		else
			-- Teleport above cave
			hrp.CFrame = center.CFrame * CFrame.new(0, 35, 0)
			isInsideSedna = false
			Button3:Set("Teleport Inside Sedna Cave")
		end
	end,
})

local Label = OtherTpTab:CreateLabel("Teleport To Orb ( You Must Inside Planet )", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

local Button = OtherTpTab:CreateButton({
	Name = "Teleport to First Nearby Orb",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")

		local planetsFolder = workspace:FindFirstChild("Planets")
		if not planetsFolder then return end

		for _, planetModel in pairs(planetsFolder:GetChildren()) do
			if planetModel:IsA("Model") then
				local minerals = planetModel:FindFirstChild("Minerals")
				if minerals then
					local orbName = planetModel.Name .. " Orb"
					local orbPart = minerals:FindFirstChild(orbName)

					if orbPart and orbPart:IsA("BasePart") then
						local distance = (hrp.Position - orbPart.Position).Magnitude
						if distance <= 200 then
							-- Teleport the player to orb (slightly above)
							hrp.CFrame = orbPart.CFrame + Vector3.new(0, 0, 0)
							return
						end
					end
				end
			end
		end
	end,
})

------------------------------------------------------------------------------------------------------------------------------------

local Label = PlanetTpTab:CreateLabel("Bring Ships ( You Must Own The Ship )", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

local Button = PlanetTpTab:CreateButton({
	Name = "Bring Orbiter",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")

		-- Step 1: Initial teleport
		hrp.CFrame = CFrame.new(-3095, 15, -1371)

		-- Step 2: Delay and fire nearby prompts
		task.delay(0.2, function()
			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("ProximityPrompt") then
					local distance = (descendant.Parent.Position - hrp.Position).Magnitude
					if distance <= 20 then
						pcall(function()
							fireproximityprompt(descendant)
						end)
					end
				end
			end

			-- Step 3: Another delay and teleport to one of three random positions
			task.delay(0.2, function()
				local positions = {
					Vector3.new(-3085, 34, -1390),
					Vector3.new(-3081, 34, -1371),
					Vector3.new(-3081, 34, -1353),
				}
				local randomPos = positions[math.random(1, #positions)]
				hrp.CFrame = CFrame.new(randomPos)
			end)
		end)
	end,
})

local Button = PlanetTpTab:CreateButton({
	Name = "Bring Corvette",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")
		local humanoid = character:WaitForChild("Humanoid")

		-- Step 1: Initial teleport
		hrp.CFrame = CFrame.new(-3197, 12, -1476)

		-- Step 2: Fire all valid ProximityPrompts within 8 studs
		task.delay(0.2, function()
			local function searchAndFire(container)
				for _, descendant in pairs(container:GetDescendants()) do
					if descendant:IsA("ProximityPrompt") and descendant.Name == "PPrompt" then
						local parent = descendant.Parent
						if parent and parent:IsA("BasePart") and parent.Name == "ButtonSpawn" then
							local color = parent.Color
							local distance = (parent.Position - hrp.Position).Magnitude
							if color:ToHex() == Color3.fromRGB(13, 105, 172):ToHex() and distance <= 8 then
								pcall(function()
									fireproximityprompt(descendant)
								end)
							end
						end
					end
				end
			end

			searchAndFire(workspace)
			searchAndFire(game.ReplicatedStorage)

			-- Step 3: Loop teleport to random positions until sitting
			task.delay(0.2, function()
				local positions = {
					Vector3.new(-3197, 19, -1487),
					Vector3.new(-3197, 19, -1487),
					Vector3.new(-3197, 19, -1487),
				}

				local loopTeleport
				loopTeleport = game:GetService("RunService").Heartbeat:Connect(function()
					if humanoid.SeatPart == nil then
						local randomPos = positions[math.random(1, #positions)]
						hrp.CFrame = CFrame.new(randomPos)
					else
						-- Stop the loop when player sits
						loopTeleport:Disconnect()
					end
				end)
			end)
		end)
	end,
})

-------------------------------------------------------------------------------------------------------------------------------------------------------------

local TrollTab = Window:CreateTab("Troll", 4483362458) -- Title, Image

local Label = TrollTab:CreateLabel("We are working on this D:", 4483362458, Color3.fromRGB(255, 205, 220), false) -- Title, Icon, Color, IgnoreTheme

