-- =====================================
-- MICROWAVE HUB - FULL STABLE SCRIPT
-- =====================================

-- Rayfield Hub Init
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "MicrowaveHub Universal Script",
   Icon = 12534106835,
   LoadingTitle = "MicrowaveHub",
   LoadingSubtitle = "by Microwave",
   ShowText = "MicrowaveHub",
   Theme = "Amethyst",
   ToggleUIKeybind = "M",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MicrowaveHubFolder",
      FileName = "MicrowaveHubV5"
   },
   Discord = {
      Enabled = true,
      Invite = "vXyrruAY7h",
      RememberJoins = true
   },
   KeySystem = false,
------------------------------
-- Services & Player
------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

------------------------------
-- MAIN TAB
------------------------------
local MainTab = Window:CreateTab("🌐 Main", nil)
local PlayerSection = MainTab:CreateSection("Player Scripts")

-- Character helpers
local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

local humanoid = getHumanoid()
local hrp = player.Character:WaitForChild("HumanoidRootPart")

------------------------------
-- Walk Speed / Jump Boost
------------------------------
_G.WalkSpeed = 16
_G.JumpPower = 50

player.CharacterAdded:Connect(function()
	humanoid = getHumanoid()
	humanoid.WalkSpeed = _G.WalkSpeed
	humanoid.JumpPower = _G.JumpPower
end)

MainTab:CreateSlider({
	Name = "Walk Speed",
	Range = {8, 100},
	Increment = 1,
	CurrentValue = _G.WalkSpeed,
	Flag = "WalkSpeedSlider",
	Callback = function(v)
		_G.WalkSpeed = v
		humanoid.WalkSpeed = v
	end
})

MainTab:CreateSlider({
	Name = "Jump Boost",
	Range = {50, 200},
	Increment = 5,
	CurrentValue = _G.JumpPower,
	Flag = "JumpBoostSlider",
	Callback = function(v)
		_G.JumpPower = v
		humanoid.JumpPower = v
	end
})

------------------------------
-- Fly / Noclip
------------------------------
local flying = false
local flySpeed = 50
local keysPressed = {}
local flyBodyVelocity
local flyConnection

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	keysPressed[input.KeyCode] = true
end)

UserInputService.InputEnded:Connect(function(input)
	keysPressed[input.KeyCode] = nil
end)

local function getFlyVelocity()
	local cam = Workspace.CurrentCamera
	local move = Vector3.zero

	if keysPressed[Enum.KeyCode.W] then move += cam.CFrame.LookVector end
	if keysPressed[Enum.KeyCode.S] then move -= cam.CFrame.LookVector end
	if keysPressed[Enum.KeyCode.A] then move -= cam.CFrame.RightVector end
	if keysPressed[Enum.KeyCode.D] then move += cam.CFrame.RightVector end
	if keysPressed[Enum.KeyCode.Space] then move += Vector3.new(0,1,0) end
	if keysPressed[Enum.KeyCode.LeftShift] then move -= Vector3.new(0,1,0) end

	if move.Magnitude > 0 then
		move = move.Unit * flySpeed
	end
	return move
end

local function toggleFly()
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	flying = not flying
	if flying then
		flyBodyVelocity = Instance.new("BodyVelocity")
		flyBodyVelocity.MaxForce = Vector3.new(1e6,1e6,1e6)
		flyBodyVelocity.Velocity = Vector3.zero
		flyBodyVelocity.Parent = hrp

		flyConnection = RunService.RenderStepped:Connect(function()
			flyBodyVelocity.Velocity = getFlyVelocity()
		end)
	else
		if flyConnection then flyConnection:Disconnect() end
		if flyBodyVelocity then flyBodyVelocity:Destroy() end
	end
end

MainTab:CreateButton({
	Name = "Fly",
	Callback = toggleFly
})

MainTab:CreateSlider({
	Name = "Fly Speed",
	Range = {10, 200},
	Increment = 5,
	CurrentValue = flySpeed,
	Flag = "FlySpeedSlider",
	Callback = function(v)
		flySpeed = v
	end
})

-- Noclip
local noclipping = false
local noclipConnection

local function toggleNoclip()
	local char = player.Character or player.CharacterAdded:Wait()
	noclipping = not noclipping

	if noclipping then
		noclipConnection = RunService.Stepped:Connect(function()
			for _, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
					part.Anchored = false
				end
			end
		end)
	else
		if noclipConnection then noclipConnection:Disconnect() end
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end
	end
end

MainTab:CreateButton({
	Name = "Noclip",
	Callback = toggleNoclip
})

------------------------------
-- PLAYER FEATURES
------------------------------
local PlayerTab = Window:CreateTab("🧍 Player", nil)
local PlayerSection2 = PlayerTab:CreateSection("Player Scripts")

-- Infinite Jump
local infiniteJumpEnabled = false
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if infiniteJumpEnabled and input.KeyCode == Enum.KeyCode.Space then
		local hum = getHumanoid()
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

local Button = PlayerTab:CreateButton({
   Name = "Animations",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/echelonvanta/Scripts/refs/heads/main/Animstions%20Hub/animation.lua"))()
   end,
})

PlayerTab:CreateToggle({
	Name = "Infinite Jump",
	Flag = "InfiniteJumpToggle",
	Callback = function(v)
		infiniteJumpEnabled = v
	end
})

-- Gravity Slider
local gravity = workspace.Gravity
PlayerTab:CreateSlider({
	Name = "Gravity",
	Range = {0, 500},
	Increment = 5,
	CurrentValue = gravity,
	Flag = "GravitySlider",
	Callback = function(v)
		workspace.Gravity = v
	end
})

-- No Ragdoll
local noRagdoll = false
PlayerTab:CreateToggle({
	Name = "No Ragdoll",
	Flag = "NoRagdoll",
	Callback = function(v)
		noRagdoll = v
		local char = player.Character or player.CharacterAdded:Wait()
		local hum = getHumanoid()
		if noRagdoll then
			hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		else
			hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		end
	end
})

------------------------------
-- VISUAL TAB
------------------------------
local VisualTab = Window:CreateTab("👁️ Visual", nil)
local VisualSection = VisualTab:CreateSection("Camera / FOV")

-- FOV
local fov = workspace.CurrentCamera.FieldOfView
VisualTab:CreateSlider({
	Name = "FOV",
	Range = {50,360},
	Increment = 1,
	CurrentValue = fov,
	Flag = "FOVSlider",
	Callback = function(v)
		workspace.CurrentCamera.FieldOfView = v
	end
})

------------------------------
-- PLAYER ESP
------------------------------
local Camera = workspace.CurrentCamera
local ESPEnabled = false
local ESPObjects = {}

local function createESP(plr)
	if plr == player then return end

	local box = Drawing.new("Square")
	box.Thickness = 1
	box.Filled = false
	box.Color = Color3.fromRGB(255, 0, 0)
	box.Visible = false

	local name = Drawing.new("Text")
	name.Size = 14
	name.Center = true
	name.Outline = true
	name.Color = Color3.fromRGB(255, 255, 255)
	name.Visible = false

	ESPObjects[plr] = {Box = box, Name = name}
end

local function removeESP(plr)
	if ESPObjects[plr] then
		ESPObjects[plr].Box:Remove()
		ESPObjects[plr].Name:Remove()
		ESPObjects[plr] = nil
	end
end

-- Init existing players
for _, plr in ipairs(Players:GetPlayers()) do
	createESP(plr)
end

Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)

-- Render loop
RunService.RenderStepped:Connect(function()
	for plr, esp in pairs(ESPObjects) do
		if not ESPEnabled then
			esp.Box.Visible = false
			esp.Name.Visible = false
			continue
		end

		local char = plr.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChild("Humanoid")

		if hrp and hum and hum.Health > 0 then
			local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
			if onScreen then
				local scale = math.clamp(2000 / pos.Z, 20, 300)
				local width = scale / 2

				esp.Box.Size = Vector2.new(width, scale)
				esp.Box.Position = Vector2.new(pos.X - width / 2, pos.Y - scale / 2)
				esp.Box.Visible = true

				esp.Name.Text = plr.Name
				esp.Name.Position = Vector2.new(pos.X, pos.Y - scale / 2 - 14)
				esp.Name.Visible = true
			else
				esp.Box.Visible = false
				esp.Name.Visible = false
			end
		else
			esp.Box.Visible = false
			esp.Name.Visible = false
		end
	end
end)

-- Toggle in Visual Tab
VisualTab:CreateToggle({
	Name = "Player ESP",
	Flag = "PlayerESPToggle",
	CurrentValue = false,
	Callback = function(v)
		ESPEnabled = v
	end
})

----------------------------------------------------------------
-- TELEPORT TAB
----------------------------------------------------------------
local TeleportTab = Window:CreateTab("⚙️ Teleport", nil)
TeleportTab:CreateSection("Teleport")

local teleportEnabled = false

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if not teleportEnabled then return end
	if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then return end
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

	local mouse = player:GetMouse()
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	if mouse.Hit then
		hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,3,0))
	end
end)

TeleportTab:CreateToggle({
	Name = "Ctrl + Click Teleport",
	CurrentValue = false,
	Callback = function(v)
		teleportEnabled = v
	end
})

-- Teleport to player
TeleportTab:CreateInput({
    Name = "Teleport to Player",
    PlaceholderText = "Username",
    Callback = function(name)
        local target = Players:FindFirstChild(name)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            hrp.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
})

------------------------------
-- MISC TAB
------------------------------
local MiscTab = Window:CreateTab("🛠️ Misc", nil)
local QoLSection = MiscTab:CreateSection("Quality-of-Life")

-- Rejoin
MiscTab:CreateButton({
	Name = "Rejoin Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, player)
	end
})

-- Server Hop
MiscTab:CreateButton({
	Name = "Server Hop",
	Callback = function()
		local PlaceID = game.PlaceId
		local TeleportService = game:GetService("TeleportService")
		TeleportService:TeleportToPlaceInstance(PlaceID, nil, player)
	end
})

-- FPS Booster
local fpsBoostEnabled = false
MiscTab:CreateToggle({
	Name = "FPS Booster",
	Flag = "FPSBoosterToggle",
	Callback = function(v)
		fpsBoostEnabled = v
		if fpsBoostEnabled then
			-- Remove textures
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("Texture") or obj:IsA("Decal") then
					obj.Transparency = 1
				end
				if obj:IsA("ParticleEmitter") then
					obj.Enabled = false
				end
			end
			-- Simplify lighting
			Lighting.GlobalShadows = false
			Lighting.FogEnd = 999999
			Lighting.Brightness = 2
			Lighting.ClockTime = 12
		else
			-- Restore defaults
			Lighting.GlobalShadows = true
			Lighting.FogEnd = 100000
			Lighting.Brightness = 2
		end
	end
})

-- Fun Section
local FunSection = MiscTab:CreateSection("Fun")

-- Spinbot
local spinning = false
local spinConnection
MiscTab:CreateToggle({
	Name = "Spinbot",
	Flag = "SpinbotToggle",
	Callback = function(v)
		spinning = v
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
		if spinning then
			spinConnection = RunService.RenderStepped:Connect(function()
				hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(15), 0)
			end)
		else
			if spinConnection then spinConnection:Disconnect() end
		end
	end
})

------------------------------
-- THEMES TAB
------------------------------
local ThemesTab = Window:CreateTab("🎨 Themes", nil)
local ThemesSection = ThemesTab:CreateSection("Themes")

local Button = ThemesTab:CreateButton({
   Name = "Default",
   Callback = function()
   Window.ModifyTheme('Amethyst')
   end,
})

local Button = ThemesTab:CreateButton({
   Name = "Dark",
   Callback = function()
   Window.ModifyTheme('Default')
   end,
})

local Button = ThemesTab:CreateButton({
   Name = "Amber Glow",
   Callback = function()
   Window.ModifyTheme('AmberGlow')
   end,
})

local Button = ThemesTab:CreateButton({
   Name = "Green",
   Callback = function()
   Window.ModifyTheme('Green')
   end,
})

local Button = ThemesTab:CreateButton({
   Name = "Light",
   Callback = function()
   Window.ModifyTheme('Light')
   end,
})

local Button = ThemesTab:CreateButton({
   Name = "Ocean",
   Callback = function()
   Window.ModifyTheme('Ocean')
   end,
})

------------------------------
-- OTHER HUBS TAB
------------------------------
local OtherHubsTab = Window:CreateTab("🔧 Other Hubs", nil)
local EazvyHubSection = OtherHubsTab:CreateSection("Eazvy Hub")

local Button = OtherHubsTab:CreateButton({
   Name = "Open Eazvy Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/public-scripts/main/Universal_Animations_Emotes.lua"))()
   end,
})

local DexSection = OtherHubsTab:CreateSection("Dex Explorer")

local Button = OtherHubsTab:CreateButton({
   Name = "Open Dex Explorer",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/BigBoyTimme/New.Loadstring.Scripts/refs/heads/main/Dex.Explorer"))()
   end,
})

local XwareSection = OtherHubsTab:CreateSection("Xware Cheat")

local Button = OtherHubsTab:CreateButton({
   Name = "Open Xware",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/9std6dWQ"))()
   end,
})

local MP3Section = OtherHubsTab:CreateSection("Music Player")

local Button = OtherHubsTab:CreateButton({
   Name = "Open Music Player",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/rYeRW8Jc"))()
   end,
})

local CheatXSection = OtherHubsTab:CreateSection("CheatX")

local Button = OtherHubsTab:CreateButton({
   Name = "Open CheatX FPS Assist",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/1p9rZp4E"))()
   end,
})