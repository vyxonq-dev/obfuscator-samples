local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

print("✅ CVortexHub Loaded")

--// === Variables ===
local aimbotEnabled = false
local aimSmoothing = 0.15
local fovCircleEnabled = true
local fovSize = 150
local espEnabled = true
local targetPart = "Head"
local teamCheck = false

--// === ESP Functions ===
local function updateESPColor(character, player)
	local hl = character:FindFirstChild("ESPHighlight")
	if not hl then return end
	
	local myChar = LocalPlayer.Character
	if not myChar then return end
	
	local targetPartObj = character:FindFirstChild(targetPart) or character:FindFirstChild("HumanoidRootPart")
	if not targetPartObj then return end
	
	-- Check if player is visible
	local ray = Ray.new(Camera.CFrame.Position, (targetPartObj.Position - Camera.CFrame.Position).Unit * 1000)
	local hit, position = Workspace:FindPartOnRayWithIgnoreList(ray, {myChar, Camera})
	
	if hit then
		local hitPlayer = Players:GetPlayerFromCharacter(hit.Parent)
		if hitPlayer and hitPlayer == player then
			-- Player is visible (not behind wall) - GREEN
			hl.FillColor = Color3.fromRGB(0, 255, 0)
			hl.OutlineColor = Color3.fromRGB(0, 200, 0)
		else
			-- Player is behind wall - RED
			hl.FillColor = Color3.fromRGB(255, 0, 0)
			hl.OutlineColor = Color3.fromRGB(200, 0, 0)
		end
	else
		-- Default - GREEN
		hl.FillColor = Color3.fromRGB(0, 255, 0)
		hl.OutlineColor = Color3.fromRGB(0, 200, 0)
	end
end

local function addHighlight(character, player)
	if not espEnabled then return end
	
	local old = character:FindFirstChild("ESPHighlight")
	if old then old:Destroy() end
	
	local hl = Instance.new("Highlight")
	hl.Name = "ESPHighlight"
	hl.FillColor = Color3.fromRGB(0, 255, 0)
	hl.OutlineColor = Color3.fromRGB(0, 200, 0)
	hl.FillTransparency = 0.5
	hl.OutlineTransparency = 0
	hl.Adornee = character
	hl.Parent = character
	
	-- Update color immediately
	updateESPColor(character, player)
end

local function removeHighlight(character)
	local hl = character:FindFirstChild("ESPHighlight")
	if hl then hl:Destroy() end
end

local function updateAllESP()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			if espEnabled then
				addHighlight(player.Character, player)
			else
				removeHighlight(player.Character)
			end
		end
	end
end

--// === Aimbot Functions ===
local function isPlayerVisible(player)
	local myChar = LocalPlayer.Character
	if not myChar then return false end
	
	local targetPartObj = player.Character:FindFirstChild(targetPart)
	if not targetPartObj then return false end
	
	local ray = Ray.new(Camera.CFrame.Position, (targetPartObj.Position - Camera.CFrame.Position).Unit * 1000)
	local hit, position = Workspace:FindPartOnRayWithIgnoreList(ray, {myChar, Camera})
	
	if hit then
		local hitPlayer = Players:GetPlayerFromCharacter(hit.Parent)
		if hitPlayer and hitPlayer == player then
			return true
		end
	end
	
	return false
end

local function getClosestPlayerInFOV()
	if not aimbotEnabled or not fovCircleEnabled then return nil end
	
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
	
	local viewport = Camera.ViewportSize
	local centerScreen = Vector2.new(viewport.X / 2, viewport.Y / 2)
	
	local nearest, shortestDist = nil, math.huge
	
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			-- Team check
			if teamCheck and player.Team == LocalPlayer.Team then
				continue
			end
			
			local targetPartObj = player.Character:FindFirstChild(targetPart)
			if targetPartObj then
				local screenPos, onScreen = Camera:WorldToViewportPoint(targetPartObj.Position)
				
				if onScreen and screenPos.Z > 0 then
					local screenPos2D = Vector2.new(screenPos.X, screenPos.Y)
					local distFromCenter = (screenPos2D - centerScreen).Magnitude
					
					if distFromCenter <= fovSize and distFromCenter < shortestDist then
						-- Check if player is visible (not behind wall)
						if isPlayerVisible(player) then
							shortestDist = distFromCenter
							nearest = player
						end
					end
				end
			end
		end
	end
	
	return nearest
end

--// === Character Added Events ===
local function onCharAdded(character, player)
	task.wait(0.5)
	if player ~= LocalPlayer and espEnabled then
		addHighlight(character, player)
	end
end

for _, player in ipairs(Players:GetPlayers()) do
	if player.Character then
		onCharAdded(player.Character, player)
	end
	player.CharacterAdded:Connect(function(char)
		onCharAdded(char, player)
	end)
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		onCharAdded(char, player)
	end)
end)

-- FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 50
fovCircle.Radius = fovSize
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Visible = fovCircleEnabled
fovCircle.Filled = false
fovCircle.Transparency = 1

--// === RAYFIELD UI ===
local Window = Rayfield:CreateWindow({
	Name = "CVortexHub | Flick",
	LoadingTitle = "CVortexHub",
	LoadingSubtitle = "Loading Script...",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "CVortexHub",
		FileName = "FlickConfig"
	},
	Discord = {
		Enabled = true,
		Invite = "cDsUEDF6y",
		RememberJoins = true
	},
	KeySystem = true,
	KeySettings = {
		Title = "CVortexHub Key System",
		Subtitle = "Enter Key",
		Note = "Join discord to get key: discord.gg/cDsUEDF6y",
		FileName = "CVortexKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = {"vortex"}
	}
})

--// === AIMBOT TAB ===
local AimbotTab = Window:CreateTab("🎯 Aimbot", 4483362458)

local AimbotSection = AimbotTab:CreateSection("Aimbot Settings")

local AimbotToggle = AimbotTab:CreateToggle({
	Name = "Enable Aimbot",
	CurrentValue = false,
	Flag = "AimbotToggle",
	Callback = function(Value)
		aimbotEnabled = Value
		Rayfield:Notify({
			Title = "Aimbot",
			Content = Value and "Aimbot enabled" or "Aimbot disabled",
			Duration = 3,
			Image = 4483362458,
		})
	end,
})

local SmoothingSlider = AimbotTab:CreateSlider({
	Name = "Aim Smoothing",
	Range = {0.05, 1},
	Increment = 0.05,
	CurrentValue = 0.15,
	Flag = "SmoothingSlider",
	Callback = function(Value)
		aimSmoothing = Value
	end,
})

local FOVSection = AimbotTab:CreateSection("FOV Settings")

local FOVToggle = AimbotTab:CreateToggle({
	Name = "Show FOV Circle",
	CurrentValue = true,
	Flag = "FOVToggle",
	Callback = function(Value)
		fovCircleEnabled = Value
		fovCircle.Visible = Value
	end,
})

local FOVSlider = AimbotTab:CreateSlider({
	Name = "FOV Size",
	Range = {50, 500},
	Increment = 10,
	CurrentValue = 150,
	Flag = "FOVSlider",
	Callback = function(Value)
		fovSize = Value
		fovCircle.Radius = Value
	end,
})

local FOVColorPicker = AimbotTab:CreateColorPicker({
	Name = "FOV Circle Color",
	Color = Color3.fromRGB(255, 255, 255),
	Flag = "FOVColorPicker",
	Callback = function(Value)
		fovCircle.Color = Value
	end
})

local TargetSection = AimbotTab:CreateSection("Target Settings")

local TargetDropdown = AimbotTab:CreateDropdown({
	Name = "Target Part",
	Options = {"Head", "Torso", "HumanoidRootPart"},
	CurrentOption = {"Head"},
	MultipleOptions = false,
	Flag = "TargetDropdown",
	Callback = function(Option)
		targetPart = Option[1]
	end,
})

local TeamCheckToggle = AimbotTab:CreateToggle({
	Name = "Team Check",
	CurrentValue = false,
	Flag = "TeamCheckToggle",
	Callback = function(Value)
		teamCheck = Value
	end,
})

--// === ESP TAB ===
local ESPTab = Window:CreateTab("👁️ ESP", 4483362458)

local ESPSection = ESPTab:CreateSection("ESP Settings")

local ESPToggle = ESPTab:CreateToggle({
	Name = "Enable ESP",
	CurrentValue = true,
	Flag = "ESPToggle",
	Callback = function(Value)
		espEnabled = Value
		updateAllESP()
		Rayfield:Notify({
			Title = "ESP",
			Content = Value and "ESP enabled" or "ESP disabled",
			Duration = 3,
			Image = 4483362458,
		})
	end,
})

local ESPColorPicker = ESPTab:CreateColorPicker({
	Name = "ESP Fill Color",
	Color = Color3.fromRGB(0, 255, 0),
	Flag = "ESPFillColorPicker",
	Callback = function(Value)
		-- Colors are now dynamic based on visibility
		Rayfield:Notify({
			Title = "ESP Colors",
			Content = "ESP colors are automatic: Green = visible, Red = behind wall",
			Duration = 3,
			Image = 4483362458,
		})
	end
})

local ESPOutlineColorPicker = ESPTab:CreateColorPicker({
	Name = "ESP Outline Color",
	Color = Color3.fromRGB(0, 200, 0),
	Flag = "ESPOutlineColorPicker",
	Callback = function(Value)
		-- Colors are now dynamic based on visibility
		Rayfield:Notify({
			Title = "ESP Colors",
			Content = "ESP colors are automatic: Green = visible, Red = behind wall",
			Duration = 3,
			Image = 4483362458,
		})
	end
})

local ESPParagraph = ESPTab:CreateParagraph({
	Title = "ESP Information",
	Content = "ESP highlights players with automatic colors:\n🟢 Green = Visible (not behind wall)\n🔴 Red = Behind wall"
})

--// === SETTINGS TAB ===
local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)

local UISection = SettingsTab:CreateSection("UI Settings")

local UIKeybind = SettingsTab:CreateKeybind({
	Name = "Toggle UI",
	CurrentKeybind = "RightShift",
	HoldToInteract = false,
	Flag = "UIKeybind",
	Callback = function(Keybind)
		-- UI toggle handled automatically
	end,
})

local CreditsSection = SettingsTab:CreateSection("Credits")

local DiscordButton = SettingsTab:CreateButton({
	Name = "Copy Discord Invite",
	Callback = function()
		setclipboard("https://discord.gg/cDsUEDF6y")
		Rayfield:Notify({
			Title = "Discord",
			Content = "Discord invite copied to clipboard!",
			Duration = 5,
			Image = 4483362458,
		})
	end,
})

local CreditsLabel = SettingsTab:CreateLabel("CVortexHub - Flick Script")
local VersionLabel = SettingsTab:CreateLabel("Version: 1.0")

--// === INFO TAB ===
local InfoTab = Window:CreateTab("ℹ️ Info", 4483362458)

local InfoSection = InfoTab:CreateSection("About")

local InfoParagraph = InfoTab:CreateParagraph({
	Title = "CVortexHub",
	Content = "Advanced Flick script with ESP and Aimbot features. Join our Discord for support and updates!"
})

local FeaturesLabel = InfoTab:CreateLabel("Features:")
local Feature1 = InfoTab:CreateLabel("• ESP with custom colors")
local Feature2 = InfoTab:CreateLabel("• Aimbot with smoothing")
local Feature3 = InfoTab:CreateLabel("• FOV circle customization")
local Feature4 = InfoTab:CreateLabel("• Team check support")

--// === MAIN AIMBOT LOOP ===
RunService.RenderStepped:Connect(function()
	-- Update FOV Circle Position
	local viewport = Camera.ViewportSize
	fovCircle.Position = Vector2.new(viewport.X / 2, viewport.Y / 2)
	
	-- Update ESP colors for all players
	if espEnabled then
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				updateESPColor(player.Character, player)
			end
		end
	end
	
	-- Aimbot Logic
	if aimbotEnabled then
		local target = getClosestPlayerInFOV()
		if target and target.Character then
			local targetPartObj = target.Character:FindFirstChild(targetPart)
			if targetPartObj then
				local targetPos = targetPartObj.Position
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local currentCF = Camera.CFrame
					local targetCF = CFrame.new(currentCF.Position, targetPos)
					Camera.CFrame = currentCF:Lerp(targetCF, aimSmoothing)
				end
			end
		end
	end
end)

Rayfield:Notify({
	Title = "CVortexHub",
	Content = "Script loaded successfully!",
	Duration = 5,
	Image = 4483362458,
})