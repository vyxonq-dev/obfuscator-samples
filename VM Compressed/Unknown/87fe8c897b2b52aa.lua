--// INTRO COM EFEITO DIGITANDO - NovaZHub
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local introGui = Instance.new("ScreenGui")
introGui.Name = "KyraZHubIntro"
introGui.IgnoreGuiInset = true
introGui.ResetOnSpawn = false
introGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
introGui.Parent = PlayerGui

local bg = Instance.new("Frame")
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Parent = introGui
bg.ZIndex = 5

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(0, 255, 128)
label.Font = Enum.Font.Code
label.TextScaled = true
label.Text = ""
label.ZIndex = 6
label.Parent = bg

local typingSound = Instance.new("Sound", bg)
typingSound.SoundId = "rbxassetid://9118823100"
typingSound.Volume = 1

local fullText = "NovaZHub"
local delayPerChar = 0.12

task.spawn(function()
	for i = 1, #fullText do
		label.Text = string.sub(fullText, 1, i)
		pcall(function() typingSound:Play() end)
		task.wait(delayPerChar)
	end
end)

task.delay(#fullText * delayPerChar + 1, function()
	pcall(function()
		TweenService:Create(label, TweenInfo.new(1), {TextTransparency = 1}):Play()
		TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
	end)
	task.wait(1)
	pcall(function() introGui:Destroy() end)
end)

--// BOTÃO FLUTUANTE
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ToggleButtonGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("CoreGui")

local openButton = Instance.new("ImageButton")
openButton.Size = UDim2.new(0, 54, 0, 54)
openButton.Position = UDim2.new(0, 12, 0, 12)
openButton.BackgroundTransparency = 1
openButton.Image = "rbxassetid://16870168856"
openButton.ZIndex = 10
openButton.Parent = screenGui

local clickSound = Instance.new("Sound", openButton)
clickSound.SoundId = "rbxassetid://9118823100"
clickSound.Volume = 1

openButton.MouseEnter:Connect(function()
	openButton:TweenSize(UDim2.new(0, 62, 0, 62), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
openButton.MouseLeave:Connect(function()
	openButton:TweenSize(UDim2.new(0, 54, 0, 54), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)

--// RAYFIELD GUI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({ Name = "NovaZHub", ConfigurationSaving = { Enabled = false } })

local GUIVisible = true
openButton.MouseButton1Click:Connect(function()
	pcall(function() clickSound:Play() end)
	GUIVisible = not GUIVisible
	Window:SetVisible(GUIVisible)
end)

--// TABS
local MainTab = Window:CreateTab("Main", 4483362458)
local GeneratorTab = Window:CreateTab("Generators", 4483362458)

--// DEPENDÊNCIAS
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local workspace = game:GetService("Workspace")

-- ====== O SEU CÓDIGO EXISTENTE (ESP, Stamina, ToolESP, TPWalk, Generator, AutoGen) ======
--// ESP HAWK TUAH
local ESPConnection
local function createOutlineESP(model, outlineColor, fillColor)
	if not model:FindFirstChildOfClass("Highlight") then
		local h = Instance.new("Highlight", model)
		h.Adornee = model
		h.FillColor = fillColor
		h.FillTransparency = 0.75
		h.OutlineColor = outlineColor
	end
end

local function createHealthIndicator(character, textColor)
	local head = character:FindFirstChild("Head")
	if head and not head:FindFirstChild("HealthGui") then
		local gui = Instance.new("BillboardGui", head)
		gui.Name = "HealthGui"
		gui.Size = UDim2.new(0, 100, 0, 30)
		gui.AlwaysOnTop = true
		local label = Instance.new("TextLabel", gui)
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.SourceSansBold
		label.TextScaled = true
		label.TextColor3 = textColor
	end
end

local function updateHealthIndicators()
	for _, plr in Players:GetPlayers() do
		local char = plr.Character
		if char then
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			local head = char:FindFirstChild("Head")
			if humanoid and head then
				local healthGui = head:FindFirstChild("HealthGui")
				if healthGui then
					local label = healthGui:FindFirstChildWhichIsA("TextLabel")
					if label then
						label.Text = math.floor(humanoid.Health) .. "/" .. humanoid.MaxHealth
					end
				end
			end
		end
	end
end

local function startESP()
	ESPConnection = RunService.Heartbeat:Connect(function()
		for _, plr in pairs(Players:GetPlayers()) do
			local char = plr.Character
			if char then
				for _, v in ipairs(char:GetChildren()) do if v:IsA("Highlight") then v:Destroy() end end
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				if humanoid then
					local hp = humanoid.MaxHealth
					local fill = hp > 500 and Color3.new(1, 0.5, 0.5) or Color3.new(0.7, 0.7, 0.7)
					local outline = hp > 500 and Color3.new(1, 0, 0) or Color3.new(0.5, 0.5, 0.5)
					createOutlineESP(char, outline, fill)
					createHealthIndicator(char, outline)
				end
			end
		end
		updateHealthIndicators()
	end)
end

local function stopESP()
	if ESPConnection then ESPConnection:Disconnect() end
	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Highlight") or v.Name == "HealthGui" then
			pcall(function() v:Destroy() end)
		end
	end
end

MainTab:CreateToggle({
	Name = "ESP (Hawk Tuah)",
	CurrentValue = false,
	Callback = function(Value)
		if Value then startESP() else stopESP() end
	end
})

--// INFINITE STAMINA
local staminaThread
MainTab:CreateToggle({
	Name = "Inf stamina",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			local success, m = pcall(function() return require(ReplicatedStorage.Systems.Character.Game.Sprinting) end)
			if success and m then
				if type(m) == "table" then
					m.Stamina = 100
				elseif type(m) == "userdata" then
					pcall(function() m.Stamina = 100 end)
				end
				staminaThread = task.spawn(function()
					while true do
						pcall(function()
							if m and m.Stamina and m.Stamina <= 5 then m.Stamina = 20 end
						end)
						task.wait(0.1)
					end
				end)
			end
		else
			if staminaThread then task.cancel(staminaThread) end
		end
	end
})

--// ESP TOOL
local ToolESPEnabled = false
local ToolESPConnections = {}
local function createToolESP(tool)
    if tool:FindFirstChild("ToolESP") then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "ToolESP"
    highlight.Parent = tool
    highlight.FillColor = Color3.fromRGB(0, 255, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    local adornee = tool:FindFirstChildWhichIsA("BasePart")
    if adornee then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ToolName"
        billboard.Parent = tool
        billboard.Size = UDim2.new(0, 100, 0, 30)
        billboard.Adornee = adornee
        billboard.AlwaysOnTop = true
        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1, 0, 1, 0)
        text.BackgroundTransparency = 1
        text.Text = tool.Name
        text.TextColor3 = Color3.fromRGB(0, 255, 0)
        text.TextStrokeTransparency = 0
        text.Font = Enum.Font.SourceSansBold
        text.TextScaled = true
        text.Parent = billboard
    end
end
local function enableToolESP()
    ToolESPEnabled = true
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") then
            createToolESP(obj)
        end
    end
    ToolESPConnections["Added"] = workspace.DescendantAdded:Connect(function(obj)
        if ToolESPEnabled and obj:IsA("Tool") then
            createToolESP(obj)
        end
    end)
end
local function disableToolESP()
    ToolESPEnabled = false
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") then
            if obj:FindFirstChild("ToolESP") then pcall(function() obj.ToolESP:Destroy() end) end
            if obj:FindFirstChild("ToolName") then pcall(function() obj.ToolName:Destroy() end) end
        end
    end
    for _, conn in pairs(ToolESPConnections) do
        pcall(function() conn:Disconnect() end)
    end
    ToolESPConnections = {}
end
MainTab:CreateToggle({
    Name = "ESP Tool",
    CurrentValue = false,
    Callback = function(Value)
        if Value then enableToolESP() else disableToolESP() end
    end
})

--// TP WALK
local tpDistance = 10
local walking = false
MainTab:CreateToggle({
    Name = "TP Walk",
    CurrentValue = false,
    Callback = function(Value)
        walking = Value
    end
})
MainTab:CreateSlider({
    Name = "distance TP Walk",
    Range = {5, 100},
    Increment = 5,
    Suffix = " studs",
    CurrentValue = tpDistance,
    Callback = function(Value)
        tpDistance = Value
    end
})
RunService.RenderStepped:Connect(function()
    if walking and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local HRP = Players.LocalPlayer.Character.HumanoidRootPart
        local moveDir = Players.LocalPlayer.Character.Humanoid.MoveDirection
        if moveDir and moveDir.Magnitude > 0 then
            HRP.CFrame = HRP.CFrame + (moveDir * tpDistance * 0.1)
        end
    end
end)

--// ESP GENERATOR
local generatorESPEnabled = false
local generatorHighlights = {}
local function toggleGeneratorESP(state)
	generatorESPEnabled = state
	for _, h in pairs(generatorHighlights) do pcall(function() h:Destroy() end) end
	table.clear(generatorHighlights)
	if state then
		local ok, map = pcall(function() return workspace.Map.Ingame.Map end)
		if ok and map then
			for _, gen in pairs(map:GetChildren()) do
				if gen:IsA("Model") and gen.Name == "Generator" then
					local highlight = Instance.new("Highlight", gen)
					highlight.FillColor = Color3.fromRGB(255, 255, 0)
					highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
					highlight.FillTransparency = 0.5
					table.insert(generatorHighlights, highlight)
				end
			end
		end
	end
end
GeneratorTab:CreateToggle({
	Name = "ESP Generator",
	CurrentValue = false,
	Callback = toggleGeneratorESP
})

--// AUTO GENERATOR
local runAutoGen = false
local autoGenThread = nil
local function isSafeGenerator(gen)
	return gen:FindFirstChild("Remotes") and gen.Remotes:FindFirstChild("RE")
end
local function getRandomDelay()
	return math.random(4, 7) / 10
end
local function safeActivate(gen)
	if isSafeGenerator(gen) then
		pcall(function()
			gen.Remotes.RE:FireServer()
		end)
	end
end
local function startSafeAutoGen()
	if autoGenThread then task.cancel(autoGenThread) end
	autoGenThread = task.spawn(function()
		while runAutoGen do
			local ok, children = pcall(function() return workspace.Map.Ingame.Map:GetChildren() end)
			if ok and children then
				for _, gen in ipairs(children) do
					if gen.Name == "Generator" and isSafeGenerator(gen) then
						safeActivate(gen)
						task.wait(getRandomDelay())
					end
				end
			end
			task.wait(0.05)
		end
	end)
end
local function stopSafeAutoGen()
	runAutoGen = false
	if autoGenThread then pcall(task.cancel, autoGenThread) end
	autoGenThread = nil
end
GeneratorTab:CreateToggle({
	Name = "Auto Generator",
	CurrentValue = false,
	Callback = function(Value)
		runAutoGen = Value
		if Value then startSafeAutoGen() else stopSafeAutoGen() end
	end
})

-- ====== KILLERS TAB + AUTO KILL SIMPLES ======
local KillersTab = Window:CreateTab("Killers", 4483362458)

local AutoKillEnabled = false
local AutoKillThread = nil
local KILL_DISTANCE = 50
local TELEPORT_DISTANCE_FROM_TARGET = 2.5

local function getAlivePlayers()
    local alive = {}
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Humanoid") then
            local humanoid = otherPlayer.Character.Humanoid
            if humanoid.Health > 0 then
                table.insert(alive, otherPlayer)
            end
        end
    end
    return alive
end

local function getClosestAlivePlayer()
    local closest, shortestDistance = nil, KILL_DISTANCE
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return nil end
    local hrp = player.Character.HumanoidRootPart
    for _, plr in pairs(getAlivePlayers()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
            if dist < shortestDistance then
                shortestDistance = dist
                closest = plr
            end
        end
    end
    return closest
end

local function teleportNear(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local targetHRP = targetPlayer.Character.HumanoidRootPart
    local hrp = player.Character.HumanoidRootPart
    local dir = (hrp.Position - targetHRP.Position).Unit
    if dir.Magnitude == 0 then dir = Vector3.new(0,0,1) end
    local desiredPos = targetHRP.Position + dir * TELEPORT_DISTANCE_FROM_TARGET + Vector3.new(0,1,0)
    pcall(function() hrp.CFrame = CFrame.new(desiredPos) end)
end

local function doSlash()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(0,0))
        task.wait(0.03)
        VirtualUser:Button1Up(Vector2.new(0,0))
    end)
end

local function startAutoKill()
    AutoKillThread = task.spawn(function()
        while AutoKillEnabled do
            local target = getClosestAlivePlayer()
            if target then
                teleportNear(target)
                task.wait(0.05)
                doSlash()
            end
            task.wait(0.1)
        end
    end)
end

local function stopAutoKill()
    AutoKillEnabled = false
    if AutoKillThread then
        pcall(task.cancel, AutoKillThread)
        AutoKillThread = nil
    end
end

KillersTab:CreateToggle({
    Name = "Auto Tp Nearby survivor",
    CurrentValue = false,
    Callback = function(Value)
        AutoKillEnabled = Value
        if Value then
            startAutoKill()
        else
            stopAutoKill()
        end
    end
})

-- ====== MISC TAB (AntiLag + FullBright + Shaders) ======
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- AntiLag
local AntiLagEnabled = false
local savedDescendants = {}
local function enableAntiLag()
	AntiLagEnabled = true
	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") then
			savedDescendants[v] = v.Enabled
			v.Enabled = false
		end
	end
end
local function disableAntiLag()
	AntiLagEnabled = false
	for v, val in pairs(savedDescendants) do
		if v and v.Parent then v.Enabled = val end
	end
	savedDescendants = {}
end
MiscTab:CreateToggle({
	Name = "AntiLag",
	CurrentValue = false,
	Callback = function(Value)
		if Value then enableAntiLag() else disableAntiLag() end
	end
})

-- FullBright
local savedLighting = {}
MiscTab:CreateButton({
	Name = "FullBright",
	Callback = function()
		savedLighting.Brightness = Lighting.Brightness
		savedLighting.Ambient = Lighting.Ambient
		savedLighting.OutdoorAmbient = Lighting.OutdoorAmbient
		Lighting.Brightness = 2
		Lighting.Ambient = Color3.new(1,1,1)
		Lighting.OutdoorAmbient = Color3.new(1,1,1)
	end
})

-- Shader reset
MiscTab:CreateButton({
	Name = "Reset Shaders",
	Callback = function()
		pcall(function() game:GetService("Lighting").ColorCorrection:Destroy() end)
	end
})
