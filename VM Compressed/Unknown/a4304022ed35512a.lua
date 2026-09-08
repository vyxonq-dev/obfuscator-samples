-- // Havens Hub Builder by Ghost

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

--== Interface Inicial (Botão OPN) ==
local MainGui = Instance.new("ScreenGui", game.CoreGui)
MainGui.Name = "HavensHub"

local OpenBtn = Instance.new("TextButton", MainGui)
OpenBtn.Name = "OpenBtn"
OpenBtn.Text = "open hub"
OpenBtn.Size = UDim2.new(0, 70, 0, 40)
OpenBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.TextSize = 16
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 7)

--== Função: Arrastar OPN ==
local dragging, dragStart, startPos
OpenBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = OpenBtn.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		OpenBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

--== Janela Principal ==
local Frame = Instance.new("Frame", MainGui)
Frame.Size = UDim2.new(0, 250, 0, 280)
Frame.Position = UDim2.new(0.35, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BackgroundTransparency = 0.5
Frame.Visible = false
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Havens Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

--== Scrolling ==
local Scroll = Instance.new("ScrollingFrame", Frame)
Scroll.Size = UDim2.new(1, -10, 1, -40)
Scroll.Position = UDim2.new(0, 5, 0, 35)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 300)
Scroll.ScrollBarThickness = 5

local UIList = Instance.new("UIListLayout", Scroll)
UIList.Padding = UDim.new(0, 8)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.SortOrder = Enum.SortOrder.LayoutOrder

--== Sistema de Arraste do Frame ==
local draggingFrame, dragStartF, startPosF
Title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		draggingFrame = true
		dragStartF = input.Position
		startPosF = Frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then draggingFrame = false end
		end)
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if draggingFrame and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStartF
		Frame.Position = UDim2.new(startPosF.X.Scale, startPosF.X.Offset + delta.X, startPosF.Y.Scale, startPosF.Y.Offset + delta.Y)
	end
end)

--== Abrir/Fechar ==
local open = false
OpenBtn.MouseButton1Click:Connect(function()
	open = not open
	Frame.Visible = open
end)

--== Sistema de construção ==
local Havens = {}

function Havens:Button(name, callback)
	local btn = Instance.new("TextButton", Scroll)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 15
	btn.Text = name
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
	btn.MouseButton1Click:Connect(function()
		pcall(callback)
	end)
end

function Havens:Toggle(name, default, callback)
	local btn = Instance.new("TextButton", Scroll)
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 15
	btn.Text = name .. " : " .. (default and "ON" or "OFF")
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

	local state = default
	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.Text = name .. " : " .. (state and "ON" or "OFF")
		btn.BackgroundColor3 = state and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(35, 35, 35)
		pcall(callback, state)
	end)
end

function Havens:Section(name)
	local lbl = Instance.new("TextLabel", Scroll)
	lbl.Size = UDim2.new(0.9, 0, 0, 25)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = Color3.fromRGB(180, 180, 180)
	lbl.Font = Enum.Font.SourceSansBold
	lbl.TextSize = 15
	lbl.Text = "-- " .. name .. " --"
end

--== Exemplo de uso ==
local Add = Havens

Add:Section("grab")

Add:Button("Button grab (tp)", function()
	-- // Script by Ghost

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local LocalPlayer = Players.LocalPlayer
	local UserInputService = game:GetService("UserInputService")

	--== GUI ==
	local gui = Instance.new("ScreenGui", game.CoreGui)

	local grabBtn = Instance.new("TextButton", gui)
	grabBtn.Name = "GrabButton"
	grabBtn.Text = "Grab Player (Tp)"
	grabBtn.Size = UDim2.new(0, 110, 0, 35)
	grabBtn.Position = UDim2.new(0.45, 0, 0.7, 0)
	grabBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	grabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	grabBtn.Font = Enum.Font.SourceSansBold
	grabBtn.TextSize = 17
	local corner1 = Instance.new("UICorner", grabBtn)
	corner1.CornerRadius = UDim.new(0, 10)

	local toggleBtn = Instance.new("TextButton", gui)
	toggleBtn.Name = "LockMove"
	toggleBtn.Text = "Lock Move: OFF"
	toggleBtn.Size = UDim2.new(0, 110, 0, 30)
	toggleBtn.Position = UDim2.new(0.45, 0, 0.7, 40)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	toggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	toggleBtn.Font = Enum.Font.SourceSansBold
	toggleBtn.TextSize = 14
	local corner2 = Instance.new("UICorner", toggleBtn)
	corner2.CornerRadius = UDim.new(0, 10)

	--== Sistema de arrastar ==
	local dragging = false
	local dragStart, startPos
	local canDrag = true

	local function updateDrag(input)
		if not canDrag then return end
		local delta = input.Position - dragStart
		grabBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		toggleBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y + 40)
	end

	grabBtn.InputBegan:Connect(function(input)
		if not canDrag then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = grabBtn.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			updateDrag(input)
		end
	end)

	local locked = false
	toggleBtn.MouseButton1Click:Connect(function()
		locked = not locked
		canDrag = not locked
		toggleBtn.Text = locked and "Lock Move: ON" or "Lock Move: OFF"
		toggleBtn.TextColor3 = locked and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(200, 200, 200)
	end)

	--== Funções utilitárias ==
	local function getClosestPlayer()
		local closest, shortest = nil, math.huge
		local myChar = LocalPlayer.Character
		if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end

		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local dist = (myChar.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
				if dist < shortest then
					shortest = dist
					closest = plr
				end
			end
		end
		return closest
	end

	local function getClosestPart(targetChar, referencePos)
		local closestPart, shortestDist = nil, math.huge
		for _, part in ipairs(targetChar:GetChildren()) do
			if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
				local dist = (part.Position - referencePos).Magnitude
				if dist < shortestDist then
					shortestDist = dist
					closestPart = part
				end
			end
		end
		return closestPart
	end

	local function isAnimPlaying(animId)
		local char = LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if not hum then return false end
		for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
			if tostring(track.Animation.AnimationId):match(animId) then
				return true
			end
		end
		return false
	end

	--== Execução principal ==
	grabBtn.MouseButton1Click:Connect(function()
		local target = getClosestPlayer()
		if not target or not target.Character then return end

		local myChar = LocalPlayer.Character
		local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
		if not myRoot then return end

		local targetChar = target.Character
		local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
		if not targetRoot then return end

		local arm = targetChar:FindFirstChild("Right Arm") or getClosestPart(targetChar, targetRoot.Position)
		if not arm then return end

		local lookCFrame = CFrame.lookAt(targetRoot.Position, myRoot.Position)

		local args = {
			[1] = arm,
			[2] = "Grab",
			[3] = targetRoot.Position,
			[4] = lookCFrame
		}

		-- Verifica animação antes de agir
		if isAnimPlaying("7191297978") then
			ReplicatedStorage:WaitForChild("Events"):WaitForChild("Grab"):FireServer(unpack(args))
			return
		end

		-- Teleporta, executa e volta
		local oldCFrame = myRoot.CFrame
		myRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 0, 2)
		task.wait(0.1)

		ReplicatedStorage:WaitForChild("Events"):WaitForChild("Grab"):FireServer(unpack(args))

		task.wait(0.1)
		myRoot.CFrame = oldCFrame
	end)
end)

Add:Button("Button grab (hack)", function()
	-- // Script by Ghost

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

--== GUI ==
local gui = Instance.new("ScreenGui", game.CoreGui)

-- Botão principal
local grabBtn = Instance.new("TextButton", gui)
grabBtn.Name = "GrabButton"
grabBtn.Text = "Grab Player"
grabBtn.Size = UDim2.new(0, 110, 0, 35)
grabBtn.Position = UDim2.new(0.45, 0, 0.7, 0)
grabBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
grabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
grabBtn.Font = Enum.Font.SourceSansBold
grabBtn.TextSize = 17
local corner1 = Instance.new("UICorner", grabBtn)
corner1.CornerRadius = UDim.new(0, 10)

-- Botão de trava
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Name = "LockMove"
toggleBtn.Text = "Lock Move: OFF"
toggleBtn.Size = UDim2.new(0, 110, 0, 30)
toggleBtn.Position = UDim2.new(0.45, 0, 0.7, 40)
toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
toggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 14
local corner2 = Instance.new("UICorner", toggleBtn)
corner2.CornerRadius = UDim.new(0, 10)

--== Sistema de arrastar ==
local dragging = false
local dragStart, startPos
local canDrag = true

local function updateDrag(input)
	if not canDrag then return end
	local delta = input.Position - dragStart
	grabBtn.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
	toggleBtn.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y + 40
	)
end

grabBtn.InputBegan:Connect(function(input)
	if not canDrag then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = grabBtn.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

--== Toggle trava ==
local locked = false
toggleBtn.MouseButton1Click:Connect(function()
	locked = not locked
	canDrag = not locked
	toggleBtn.Text = locked and "Lock Move: ON" or "Lock Move: OFF"
	toggleBtn.TextColor3 = locked and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(200, 200, 200)
end)

--== Player mais próximo ==
local function getClosestPlayer()
	local closest, shortest = nil, math.huge
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (myChar.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
			if dist < shortest then
				shortest = dist
				closest = plr
			end
		end
	end
	return closest
end

--== Parte mais próxima do corpo ==
local function getClosestPart(targetChar, referencePos)
	local closestPart, shortestDist = nil, math.huge
	for _, part in ipairs(targetChar:GetChildren()) do
		if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
			local dist = (part.Position - referencePos).Magnitude
			if dist < shortestDist then
				shortestDist = dist
				closestPart = part
			end
		end
	end
	return closestPart
end

--== Clique principal ==
grabBtn.MouseButton1Click:Connect(function()
	local target = getClosestPlayer()
	if not target or not target.Character then return end

	local targetChar = target.Character
	local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
	if not targetRoot then return end

	-- Pega a parte do corpo mais próxima
	local arm = targetChar:FindFirstChild("Right Arm") or getClosestPart(targetChar, targetRoot.Position)
	if not arm then return end

	local lookCFrame = CFrame.lookAt(targetRoot.Position, LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position or targetRoot.Position)

	local args = {
		[1] = arm,
		[2] = "Grab",
		[3] = targetRoot.Position,
		[4] = lookCFrame
	}

	ReplicatedStorage:WaitForChild("Events"):WaitForChild("Grab"):FireServer(unpack(args))
end)
end)


Add:Section("others")

-- // TPWalk System
local tpwalkEnabled = false
local speed = 0.5 -- distância de teleporte por passo (ajuste se quiser mais rápido)

-- Função de ativar/desativar
local function setTpwalk(state)
	tpwalkEnabled = state
	print("TPWalk:", state and "Ativado" or "Desativado")
end

-- Toggle exemplo:
Add:Toggle("Walkspeed", true, function(state)
	setTpwalk(state)
end)

-- Loop principal do TPWalk
task.spawn(function()
	while true do
		task.wait(0.01)
		if tpwalkEnabled then
			local char = game.Players.LocalPlayer.Character
			if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
				local hrp = char.HumanoidRootPart
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				local moveDir = humanoid.MoveDirection

				if moveDir.Magnitude > 0 then
					hrp.CFrame = hrp.CFrame + moveDir * speed
				end
			end
		end
	end
end)

-- // Infjump by Ghost
local UserInputService = game:GetService("UserInputService")
local Infjump = false

Add:Toggle("Infjump", false, function(state)
	Infjump = state
end)

UserInputService.JumpRequest:Connect(function()
	if Infjump then
		local char = game.Players.LocalPlayer.Character
		if char and char:FindFirstChildOfClass("Humanoid") then
			char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- // Show Invisible Players by Ghost
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local showInvis = false

Add:Toggle("Show invisible players", false, function(state)
	showInvis = state

	if showInvis then
		task.spawn(function()
			while showInvis do
				for _, plr in ipairs(Players:GetPlayers()) do
					if plr ~= LocalPlayer and plr.Character then
						for _, part in ipairs(plr.Character:GetDescendants()) do
							if part:IsA("BasePart") or part:IsA("Decal") then
								if part.Transparency == 1 then
									part.Transparency = 0
								end
							end
						end
					end
				end
				task.wait(0.1)
			end
		end)
	end
end)

-- // Auto Reset Cooldown by Ghost
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local autoResetEnabled = false

-- Função para buscar o "Cooldown" dentro do jogador
local function findCooldown()
	return LocalPlayer:FindFirstChild("Cooldown", true)
end

Add:Toggle("ant grab (beta)", false, function(state)
	autoResetEnabled = state

	if autoResetEnabled then
		task.spawn(function()
			while autoResetEnabled do
				local cooldown = findCooldown()
				if cooldown then
					local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
					if humanoid then
						humanoid.Health = 0
					end
					task.wait(0.3)
				else
					task.wait(0.05)
				end
			end
		end)
	end
end)




Add:Section("by ghost")

loadstring(game:HttpGet("https://gist.githubusercontent.com/Cat558-uz/220ee42d2ee4694fe4975a19e00e64b3/raw/91efe415c70c7e7cd78d437f46dc5284a6fc8218/gistfile1.txt"))()
