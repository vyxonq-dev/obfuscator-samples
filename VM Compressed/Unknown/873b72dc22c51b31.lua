local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CeoOfDimsGUI"
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("TextLabel")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Text = "CeoOfDims GUI"
TitleBar.TextColor3 = Color3.fromRGB(255, 0, 0)
TitleBar.TextSize = 24
TitleBar.Parent = MainFrame

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, 0, 1, -35)
ScrollFrame.Position = UDim2.new(0, 0, 0, 35)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 750)
ScrollFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ScrollFrame

local function CreateButton(name, text)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(0.9, 0, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.Font = Enum.Font.SourceSansBold
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 18
	btn.Parent = ScrollFrame
	return btn
end

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://142376088"
Sound.Volume = 1
Sound.Looped = true
Sound.Parent = MainFrame

local MusicButton = CreateButton("MusicButton", "Music")
MusicButton.MouseButton1Click:Connect(function()
	if Sound.IsPlaying then
		Sound:Stop()
	else
		Sound:Play()
	end
end)

local AddBaseplateButton = CreateButton("AddBaseplateButton", "Add Baseplate & Spawn")
AddBaseplateButton.MouseButton1Click:Connect(function()
	if workspace:FindFirstChild("Baseplate") then return end
	local baseplate = Instance.new("Part")
	baseplate.Size = Vector3.new(512, 1, 512)
	baseplate.Position = Vector3.new(0, 0.5, 0)
	baseplate.Anchored = true
	baseplate.Material = Enum.Material.SmoothPlastic
	baseplate.Name = "Baseplate"
	baseplate.Parent = workspace

	local spawn = Instance.new("SpawnLocation")
	spawn.Size = Vector3.new(6, 1, 6)
	spawn.Position = Vector3.new(0, 1.5, 0)
	spawn.Anchored = true
	spawn.Neutral = true
	spawn.Name = "SpawnLocation"
	spawn.Parent = workspace
end)

local BillboardButton = CreateButton("BillboardButton", "Billboard All")
BillboardButton.MouseButton1Click:Connect(function()
	for _, p in pairs(game.Players:GetPlayers()) do
		if p.Character and p.Character:FindFirstChild("Head") then
			local head = p.Character.Head
			if not head:FindFirstChild("CeoOfDimsTag") then
				local billboard = Instance.new("BillboardGui")
				billboard.Name = "CeoOfDimsTag"
				billboard.Size = UDim2.new(0, 200, 0, 50)
				billboard.StudsOffset = Vector3.new(0, 2, 0)
				billboard.Adornee = head
				billboard.AlwaysOnTop = true
				billboard.Parent = head

				local label = Instance.new("TextLabel")
				label.Size = UDim2.new(1, 0, 1, 0)
				label.BackgroundTransparency = 1
				label.Text = "Hacked by CeoOfDims"
				label.TextColor3 = Color3.fromRGB(255, 0, 0)
				label.TextStrokeTransparency = 0
				label.Font = Enum.Font.SourceSansBold
				label.TextScaled = true
				label.Parent = billboard
			end
		end
	end
end)

local SwordButton = CreateButton("SwordButton", "Give Sword")
SwordButton.MouseButton1Click:Connect(function()
	local sword = Instance.new("Tool")
	sword.Name = "CeoSword"
	sword.RequiresHandle = true
	
	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(1, 5, 1)
	handle.BrickColor = BrickColor.new("Bright red")
	handle.CanCollide = false
	handle.Parent = sword

	sword.GripForward = Vector3.new(0, 0, -1)
	sword.GripRight = Vector3.new(1, 0, 0)
	sword.GripUp = Vector3.new(0, 1, 0)

	sword.Parent = player.Backpack
end)

local GodModeButton = CreateButton("GodModeButton", "God Mode")
GodModeButton.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("Humanoid") then
		local humanoid = char.Humanoid
		humanoid.MaxHealth = math.huge
		humanoid.Health = math.huge
	end
end)

local FloodButton = CreateButton("FloodButton", "Flood Map")
FloodButton.MouseButton1Click:Connect(function()
	local flood = Instance.new("Part")
	flood.Size = Vector3.new(1000, 1, 1000)
	flood.Position = Vector3.new(0, -50, 0)
	flood.Anchored = true
	flood.BrickColor = BrickColor.new("Bright blue")
	flood.Material = Enum.Material.Water
	flood.Transparency = 0.5
	flood.Name = "Flood"
	flood.Parent = workspace

	for i = 1, 150 do
		flood.Position = flood.Position + Vector3.new(0, 0.5, 0)
		wait(0.03)
	end
end)

local ParticleButton = CreateButton("ParticleButton", "Add Particle & Unanchor")
ParticleButton.MouseButton1Click:Connect(function()
	for _, part in pairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Anchored = false
			if not part:FindFirstChildOfClass("ParticleEmitter") then
				local emitter = Instance.new("ParticleEmitter")
				emitter.Texture = "rbxassetid://243660364"
				emitter.Rate = 15
				emitter.Lifetime = NumberRange.new(1, 2)
				emitter.Speed = NumberRange.new(2, 5)
				emitter.Parent = part
			end
		end
	end
end)

local SkyboxButton = CreateButton("SkyboxButton", "Set Skybox and Part")
SkyboxButton.MouseButton1Click:Connect(function()
	local skybox = Instance.new("Sky")
	skybox.Name = "CeoOfDimsSkybox"
	local decalId = "1848772430"
	skybox.SkyboxBk = "rbxassetid://" .. decalId
	skybox.SkyboxDn = "rbxassetid://" .. decalId
	skybox.SkyboxFt = "rbxassetid://" .. decalId
	skybox.SkyboxLf = "rbxassetid://" .. decalId
	skybox.SkyboxRt = "rbxassetid://" .. decalId
	skybox.SkyboxUp = "rbxassetid://" .. decalId
	skybox.Parent = game.Lighting

	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local part = Instance.new("Part")
		part.Size = Vector3.new(5, 5, 1)
		part.Position = char.HumanoidRootPart.Position + char.HumanoidRootPart.CFrame.LookVector * 5 + Vector3.new(0, 3, 0)
		part.Anchored = true
		part.CanCollide = false
		part.Name = "CeoOfDimsPart"
		part.Parent = workspace

		local decal = Instance.new("Decal")
		decal.Texture = "rbxassetid://" .. decalId
		decal.Face = Enum.NormalId.Front
		decal.Parent = part
	end
end)

local AdminButton = CreateButton("AdminButton", "Admin (Inf Yield)")
AdminButton.MouseButton1Click:Connect(function()
	local infYieldUrl = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
	loadstring(game:HttpGet(infYieldUrl))()
end)

local RemoveGamesButton = CreateButton("RemoveGamesButton", "Remove Games")
RemoveGamesButton.MouseButton1Click:Connect(function()
	for _, obj in pairs(workspace:GetChildren()) do
		if not obj:IsA("Player") and not obj:IsA("Terrain") then
			local isPlayerChar = false
			for _, p in pairs(game.Players:GetPlayers()) do
				if p.Character == obj then
					isPlayerChar = true
					break
				end
			end
			if not isPlayerChar then
				obj:Destroy()
			end
		end
	end
end)local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CeoOfDimsGUI"
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("TextLabel")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Text = "CeoOfDims GUI"
TitleBar.TextColor3 = Color3.fromRGB(255, 0, 0)
TitleBar.TextSize = 24
TitleBar.Parent = MainFrame

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, 0, 1, -35)
ScrollFrame.Position = UDim2.new(0, 0, 0, 35)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 750)
ScrollFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ScrollFrame

local function CreateButton(name, text)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(0.9, 0, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.Font = Enum.Font.SourceSansBold
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 18
	btn.Parent = ScrollFrame
	return btn
end

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://142376088"
Sound.Volume = 1
Sound.Looped = true
Sound.Parent = MainFrame

local MusicButton = CreateButton("MusicButton", "Music")
MusicButton.MouseButton1Click:Connect(function()
	if Sound.IsPlaying then
		Sound:Stop()
	else
		Sound:Play()
	end
end)

local AddBaseplateButton = CreateButton("AddBaseplateButton", "Add Baseplate & Spawn")
AddBaseplateButton.MouseButton1Click:Connect(function()
	if workspace:FindFirstChild("Baseplate") then return end
	local baseplate = Instance.new("Part")
	baseplate.Size = Vector3.new(512, 1, 512)
	baseplate.Position = Vector3.new(0, 0.5, 0)
	baseplate.Anchored = true
	baseplate.Material = Enum.Material.SmoothPlastic
	baseplate.Name = "Baseplate"
	baseplate.Parent = workspace

	local spawn = Instance.new("SpawnLocation")
	spawn.Size = Vector3.new(6, 1, 6)
	spawn.Position = Vector3.new(0, 1.5, 0)
	spawn.Anchored = true
	spawn.Neutral = true
	spawn.Name = "SpawnLocation"
	spawn.Parent = workspace
end)

local BillboardButton = CreateButton("BillboardButton", "Billboard All")
BillboardButton.MouseButton1Click:Connect(function()
	for _, p in pairs(game.Players:GetPlayers()) do
		if p.Character and p.Character:FindFirstChild("Head") then
			local head = p.Character.Head
			if not head:FindFirstChild("CeoOfDimsTag") then
				local billboard = Instance.new("BillboardGui")
				billboard.Name = "CeoOfDimsTag"
				billboard.Size = UDim2.new(0, 200, 0, 50)
				billboard.StudsOffset = Vector3.new(0, 2, 0)
				billboard.Adornee = head
				billboard.AlwaysOnTop = true
				billboard.Parent = head

				local label = Instance.new("TextLabel")
				label.Size = UDim2.new(1, 0, 1, 0)
				label.BackgroundTransparency = 1
				label.Text = "Hacked by CeoOfDims"
				label.TextColor3 = Color3.fromRGB(255, 0, 0)
				label.TextStrokeTransparency = 0
				label.Font = Enum.Font.SourceSansBold
				label.TextScaled = true
				label.Parent = billboard
			end
		end
	end
end)

local SwordButton = CreateButton("SwordButton", "Give Sword")
SwordButton.MouseButton1Click:Connect(function()
	local sword = Instance.new("Tool")
	sword.Name = "CeoSword"
	sword.RequiresHandle = true
	
	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(1, 5, 1)
	handle.BrickColor = BrickColor.new("Bright red")
	handle.CanCollide = false
	handle.Parent = sword

	sword.GripForward = Vector3.new(0, 0, -1)
	sword.GripRight = Vector3.new(1, 0, 0)
	sword.GripUp = Vector3.new(0, 1, 0)

	sword.Parent = player.Backpack
end)

local GodModeButton = CreateButton("GodModeButton", "God Mode")
GodModeButton.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("Humanoid") then
		local humanoid = char.Humanoid
		humanoid.MaxHealth = math.huge
		humanoid.Health = math.huge
	end
end)

local FloodButton = CreateButton("FloodButton", "Flood Map")
FloodButton.MouseButton1Click:Connect(function()
	local flood = Instance.new("Part")
	flood.Size = Vector3.new(1000, 1, 1000)
	flood.Position = Vector3.new(0, -50, 0)
	flood.Anchored = true
	flood.BrickColor = BrickColor.new("Bright blue")
	flood.Material = Enum.Material.Water
	flood.Transparency = 0.5
	flood.Name = "Flood"
	flood.Parent = workspace

	for i = 1, 150 do
		flood.Position = flood.Position + Vector3.new(0, 0.5, 0)
		wait(0.03)
	end
end)

local ParticleButton = CreateButton("ParticleButton", "Add Particle & Unanchor")
ParticleButton.MouseButton1Click:Connect(function()
	for _, part in pairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Anchored = false
			if not part:FindFirstChildOfClass("ParticleEmitter") then
				local emitter = Instance.new("ParticleEmitter")
				emitter.Texture = "rbxassetid://243660364"
				emitter.Rate = 15
				emitter.Lifetime = NumberRange.new(1, 2)
				emitter.Speed = NumberRange.new(2, 5)
				emitter.Parent = part
			end
		end
	end
end)

local SkyboxButton = CreateButton("SkyboxButton", "Set Skybox and Part")
SkyboxButton.MouseButton1Click:Connect(function()
	local skybox = Instance.new("Sky")
	skybox.Name = "CeoOfDimsSkybox"
	local decalId = "1848772430"
	skybox.SkyboxBk = "rbxassetid://" .. decalId
	skybox.SkyboxDn = "rbxassetid://" .. decalId
	skybox.SkyboxFt = "rbxassetid://" .. decalId
	skybox.SkyboxLf = "rbxassetid://" .. decalId
	skybox.SkyboxRt = "rbxassetid://" .. decalId
	skybox.SkyboxUp = "rbxassetid://" .. decalId
	skybox.Parent = game.Lighting

	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local part = Instance.new("Part")
		part.Size = Vector3.new(5, 5, 1)
		part.Position = char.HumanoidRootPart.Position + char.HumanoidRootPart.CFrame.LookVector * 5 + Vector3.new(0, 3, 0)
		part.Anchored = true
		part.CanCollide = false
		part.Name = "CeoOfDimsPart"
		part.Parent = workspace

		local decal = Instance.new("Decal")
		decal.Texture = "rbxassetid://" .. decalId
		decal.Face = Enum.NormalId.Front
		decal.Parent = part
	end
end)

local AdminButton = CreateButton("AdminButton", "Admin (Inf Yield)")
AdminButton.MouseButton1Click:Connect(function()
	local infYieldUrl = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
	loadstring(game:HttpGet(infYieldUrl))()
end)

local RemoveGamesButton = CreateButton("RemoveGamesButton", "Remove Games")
RemoveGamesButton.MouseButton1Click:Connect(function()
	for _, obj in pairs(workspace:GetChildren()) do
		if not obj:IsA("Player") and not obj:IsA("Terrain") then
			local isPlayerChar = false
			for _, p in pairs(game.Players:GetPlayers()) do
				if p.Character == obj then
					isPlayerChar = true
					break
				end
			end
			if not isPlayerChar then
				obj:Destroy()
			end
		end
	end
end)
