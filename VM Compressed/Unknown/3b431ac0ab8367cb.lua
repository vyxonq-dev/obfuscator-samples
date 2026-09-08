-- ✅ Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ✅ Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local mouse = LocalPlayer:GetMouse()

-- ✅ UI Window
local Window = Rayfield:CreateWindow({
	Name = "Moonhook🌙Arsenal",
	LoadingTitle = "Moonhook Arsenal",
	LoadingSubtitle = "by sin5kk + eszkeredzon",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "MoonhookArsenal",
		FileName = "Settings"
	},
	Discord = {
		Enabled = true,
		Invite = "moonhook",
		RememberJoins = true
	},
	KeySystem = false,
})

-- 🌙 MAIN TAB
local MainTab = Window:CreateTab("Main", 4483362458)
MainTab:CreateSection("Credits")
MainTab:CreateLabel("Made by sin5kk + eszkeredzon")
MainTab:CreateLabel("Discord: moonhook")

-- 🎯 AIM TAB (2nd)
local AimTab = Window:CreateTab("Aim", 4483362458)
AimTab:CreateSection("Aimbot Settings")

local aimbotEnabled = false
local aimbotFOV = 150
local teamCheckEnabled = true
local wallCheckEnabled = true

AimTab:CreateToggle({
	Name = "Enable Aimbot",
	CurrentValue = false,
	Callback = function(value)
		aimbotEnabled = value
	end,
})

AimTab:CreateSlider({
	Name = "Aimbot FOV",
	Range = {50, 300},
	Increment = 10,
	CurrentValue = aimbotFOV,
	Callback = function(value)
		aimbotFOV = value
	end,
})

AimTab:CreateToggle({
	Name = "Team Check",
	CurrentValue = true,
	Callback = function(value)
		teamCheckEnabled = value
	end,
})

AimTab:CreateToggle({
	Name = "Wall Check",
	CurrentValue = true,
	Callback = function(value)
		wallCheckEnabled = value
	end,
})

-- 🔍 VISUALS TAB (3rd)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
VisualsTab:CreateSection("ESP Features")

local espEnabled = false
local tracerEnabled = false
local distanceEnabled = false

VisualsTab:CreateToggle({
	Name = "ESP Boxes",
	CurrentValue = false,
	Callback = function(value)
		espEnabled = value
	end,
})

VisualsTab:CreateToggle({
	Name = "Tracers",
	CurrentValue = false,
	Callback = function(value)
		tracerEnabled = value
	end,
})

VisualsTab:CreateToggle({
	Name = "Show Distance",
	CurrentValue = false,
	Callback = function(value)
		distanceEnabled = value
	end,
})

-- 🌀 MOVEMENT TAB (4th)
local MovementTab = Window:CreateTab("Movement", 4483362458)
MovementTab:CreateSection("Movement Features")

local speedEnabled = false
local speedValue = 0

MovementTab:CreateSlider({
	Name = "CFrame Speed",
	Range = {0, 100},
	Increment = 2,
	CurrentValue = 0,
	Callback = function(value)
		speedValue = value
	end,
})

MovementTab:CreateToggle({
	Name = "Enable CFrame Speed",
	CurrentValue = false,
	Callback = function(state)
		speedEnabled = state
	end,
})

RunService.RenderStepped:Connect(function()
	if speedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local moveDir = LocalPlayer.Character.Humanoid.MoveDirection
		LocalPlayer.Character.HumanoidRootPart.CFrame += moveDir * (speedValue / 10)
	end
end)

-- 🎯 Aimbot FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Visible = false

RunService.RenderStepped:Connect(function()
	fovCircle.Position = Vector2.new(mouse.X, mouse.Y)
	fovCircle.Radius = aimbotFOV
	fovCircle.Visible = aimbotEnabled

	if aimbotEnabled then
		local closest = nil
		local shortestDist = aimbotFOV

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
				if teamCheckEnabled and player.Team == LocalPlayer.Team then continue end

				local head = player.Character.Head
				local pos, onScreen = Camera:WorldToViewportPoint(head.Position)

				if onScreen then
					local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
					if dist < shortestDist then
						if wallCheckEnabled then
							local ray = Ray.new(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).unit * 1000)
							local hit = Workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
							if hit and not hit:IsDescendantOf(player.Character) then continue end
						end
						shortestDist = dist
						closest = head
					end
				end
			end
		end

		if closest then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position)
		end
	end
end)

-- ✅ ESP Drawing Logic
local ESPObjects = {}

local function clearESP()
	for _, drawings in pairs(ESPObjects) do
		for _, draw in pairs(drawings) do
			draw:Remove()
		end
	end
	table.clear(ESPObjects)
end

RunService.RenderStepped:Connect(function()
	clearESP()

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Head") then
			local hrp = player.Character.HumanoidRootPart
			local head = player.Character.Head
			local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

			if onScreen then
				local headPos = Camera:WorldToViewportPoint(head.Position)
				local height = math.abs(headPos.Y - pos.Y)
				local width = height / 2
				local boxPos = Vector2.new(pos.X - width / 2, pos.Y - height / 2)
				local color = player.Team == LocalPlayer.Team and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(255, 0, 0)

				ESPObjects[player] = {}

				if espEnabled then
					local box = Drawing.new("Square")
					box.Position = boxPos
					box.Size = Vector2.new(width, height)
					box.Color = color
					box.Thickness = 1
					box.Filled = false
					box.Visible = true
					table.insert(ESPObjects[player], box)
				end

				if tracerEnabled then
					local line = Drawing.new("Line")
					line.From = Vector2.new(mouse.X, mouse.Y + 36)
					line.To = Vector2.new(pos.X, pos.Y)
					line.Color = color
					line.Thickness = 1
					line.Visible = true
					table.insert(ESPObjects[player], line)
				end

				if distanceEnabled then
					local distance = math.floor((hrp.Position - Camera.CFrame.Position).Magnitude)
					local text = Drawing.new("Text")
					text.Text = tostring(distance) .. "m"
					text.Position = Vector2.new(pos.X, pos.Y + height / 2 + 5)
					text.Color = color
					text.Size = 14
					text.Center = true
					text.Outline = true
					text.Visible = true
					table.insert(ESPObjects[player], text)
				end
			end
		end
	end
end)
