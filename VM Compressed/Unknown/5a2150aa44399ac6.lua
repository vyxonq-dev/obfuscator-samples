-- script create BY ghost

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--== SISTEMA DE NOTIFICAÇÕES MOBILE EMPILHÁVEIS COM SOM ==--
local function notify(title, text, duration)
	duration = duration or 2
	local mainGui = PlayerGui:FindFirstChild("GhostNotifications")
	if not mainGui then
		mainGui = Instance.new("ScreenGui")
		mainGui.Name = "GhostNotifications"
		mainGui.ResetOnSpawn = false
		mainGui.IgnoreGuiInset = true
		mainGui.Parent = PlayerGui
	end

	local container = mainGui:FindFirstChild("Container")
	if not container then
		container = Instance.new("Frame", mainGui)
		container.Name = "Container"
		container.Size = UDim2.new(0, 270, 0.5, 0)
		container.Position = UDim2.new(1, -280, 0.45, 0)
		container.BackgroundTransparency = 1

		local layout = Instance.new("UIListLayout", container)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, 3)
		layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	end

	local frame = Instance.new("Frame")
	frame.Name = "Notification"
	frame.Size = UDim2.new(1, 0, 0, 65)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	frame.BackgroundTransparency = 0.25
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.Parent = container
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

	local stroke = Instance.new("UIStroke", frame)
	stroke.Thickness = 1.3
	stroke.Color = Color3.fromRGB(80, 80, 80)

	local titleLabel = Instance.new("TextLabel", frame)
	titleLabel.Size = UDim2.new(1, -20, 0, 20)
	titleLabel.Position = UDim2.new(0, 10, 0, 5)
	titleLabel.Text = title
	titleLabel.TextColor3 = Color3.new(1, 1, 1)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 17
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.BackgroundTransparency = 1

	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Size = UDim2.new(1, -20, 0, 25)
	textLabel.Position = UDim2.new(0, 10, 0, 27)
	textLabel.Text = text
	textLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
	textLabel.Font = Enum.Font.Gotham
	textLabel.TextSize = 15
	textLabel.TextWrapped = true
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.BackgroundTransparency = 1

	local timeLabel = Instance.new("TextLabel", frame)
	timeLabel.Size = UDim2.new(1, -10, 0, 15)
	timeLabel.Position = UDim2.new(0, 0, 1, -15)
	timeLabel.Text = "(" .. duration .. "s)"
	timeLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
	timeLabel.Font = Enum.Font.Code
	timeLabel.TextSize = 13
	timeLabel.TextXAlignment = Enum.TextXAlignment.Right
	timeLabel.BackgroundTransparency = 1

	--== SOM DA NOTIFICAÇÃO ==--
	local sound = Instance.new("Sound", frame)
	sound.SoundId = "rbxassetid://18595195017"
	sound.Volume = 1
	sound.PlayOnRemove = true
	sound:Destroy() -- tocará instantaneamente ao remover

	--== ANIMAÇÃO DE ENTRADA ==--
	frame.Position = UDim2.new(1, 280, 0, 0)
	frame.BackgroundTransparency = 1
	TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 0.25
	}):Play()

	task.spawn(function()
		local start = tick()
		while tick() - start < duration and frame.Parent do
			local remaining = math.ceil(duration - (tick() - start))
			timeLabel.Text = "(" .. remaining .. "s)"
			RunService.RenderStepped:Wait()
		end
	end)

	--== SAÍDA AUTOMÁTICA ==--
	task.delay(duration, function()
		if frame and frame.Parent then
			local tweenOut = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				Position = UDim2.new(1, 280, 0, 0),
				BackgroundTransparency = 1
			})
			tweenOut:Play()
			tweenOut.Completed:Wait()
			frame:Destroy()
		end
	end)
end



notify("System", "update nova Tab Scripts De uma olhada!", 5)

--== INTERFACE HAVENS SCRIPT ==--

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "HavensScriptHub"

local OpenButton = Instance.new("TextButton", ScreenGui)
OpenButton.Size = UDim2.new(0, 120, 0, 40)
OpenButton.Position = UDim2.new(0, 20, 0.5, -20)
OpenButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
OpenButton.Text = "abrir Hub"
OpenButton.TextColor3 = Color3.new(1, 1, 1)
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.TextSize = 22
OpenButton.BorderSizePixel = 0
OpenButton.Active = true
OpenButton.Draggable = true
Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(0, 8)

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Title.Text = "Havens Script | Updated More Hehhe"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.BorderSizePixel = 0
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

local CloseButton = Instance.new("TextButton", Title)
CloseButton.Size = UDim2.new(0, 60, 0, 30)
CloseButton.Position = UDim2.new(1, -65, 0, 3)
CloseButton.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 8)

local TabsFrame = Instance.new("Frame", MainFrame)
TabsFrame.Size = UDim2.new(0, 120, 1, -35)
TabsFrame.Position = UDim2.new(0, 0, 0, 35)
TabsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabsFrame.BorderSizePixel = 0
Instance.new("UICorner", TabsFrame).CornerRadius = UDim.new(0, 10)

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -130, 1, -40)
ContentFrame.Position = UDim2.new(0, 125, 0, 40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentFrame.BorderSizePixel = 0
Instance.new("UICorner", ContentFrame).CornerRadius = UDim.new(0, 10)

local TabList = Instance.new("UIListLayout", TabsFrame)
TabList.Padding = UDim.new(0, 2)
TabList.FillDirection = Enum.FillDirection.Vertical
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.VerticalAlignment = Enum.VerticalAlignment.Top

--== Sistema de Criação de Tabs com Scrolling ==--
local function createTab(tabName)
local TabButton = Instance.new("TextButton", TabsFrame)
TabButton.Size = UDim2.new(1, -10, 0, 30)
TabButton.Position = UDim2.new(0, 5, 0, 0)
TabButton.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
TabButton.Text = tabName
TabButton.TextColor3 = Color3.new(1, 1, 1)
TabButton.Font = Enum.Font.SourceSansBold
TabButton.TextSize = 18
TabButton.BorderSizePixel = 0
Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 13)

local TabContent = Instance.new("ScrollingFrame", ContentFrame)
TabContent.Size = UDim2.new(1, -10, 1, -10)
TabContent.Position = UDim2.new(0, 5, 0, 5)
TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
TabContent.ScrollBarThickness = 5
TabContent.Visible = false
TabContent.BackgroundTransparency = 1

local ListLayout = Instance.new("UIListLayout", TabContent)
ListLayout.Padding = UDim.new(0, 10)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	TabContent.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
end)

TabButton.MouseButton1Click:Connect(function()
	for _, v in pairs(ContentFrame:GetChildren()) do
		if v:IsA("ScrollingFrame") then
			v.Visible = false
		end
	end
	for _, v in pairs(TabsFrame:GetChildren()) do
		if v:IsA("TextButton") then
			TweenService:Create(v, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(50, 0, 0)}):Play()
		end
	end
	TweenService:Create(TabButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(150, 0, 0)}):Play()
	TabContent.Visible = true
end)

--== Função para adicionar TextBox ==--
local function AddTextbox(name, placeholder, callback)
	local Frame = Instance.new("Frame", ContentFrame)
	Frame.Size = UDim2.new(1, -10, 0, 40)
	Frame.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
	Frame.BorderSizePixel = 0
	Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

	local Label = Instance.new("TextLabel", Frame)
	Label.Size = UDim2.new(0.4, -5, 1, 0)
	Label.Position = UDim2.new(0, 5, 0, 0)
	Label.BackgroundTransparency = 1
	Label.Text = name
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Font = Enum.Font.SourceSansBold
	Label.TextSize = 18
	Label.TextXAlignment = Enum.TextXAlignment.Left

	local Box = Instance.new("TextBox", Frame)
	Box.Size = UDim2.new(0.6, -10, 1, -10)
	Box.Position = UDim2.new(0.4, 5, 0, 5)
	Box.BackgroundColor3 = Color3.fromRGB(35, 0, 0)
	Box.Text = ""
	Box.PlaceholderText = placeholder or "Digite aqui..."
	Box.TextColor3 = Color3.new(1, 1, 1)
	Box.Font = Enum.Font.SourceSans
	Box.TextSize = 18
	Box.BorderSizePixel = 0
	Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 8)

	Box.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			pcall(callback, Box.Text)
		end
	end)
end

local function AddSection(name)
	local Section = Instance.new("TextLabel", TabContent)
	Section.Size = UDim2.new(1, -10, 0, 25)
	Section.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
	Section.Text = "  " .. name
	Section.TextColor3 = Color3.new(1, 1, 1)
	Section.Font = Enum.Font.SourceSansBold
	Section.TextSize = 18
	Section.TextXAlignment = Enum.TextXAlignment.Left
	Section.BorderSizePixel = 0
	Instance.new("UICorner", Section).CornerRadius = UDim.new(0, 8)
end

local function AddButton(name, callback)
	local Button = Instance.new("TextButton", TabContent)
	Button.Size = UDim2.new(1, -10, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
	Button.Text = name
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Font = Enum.Font.SourceSans
	Button.TextSize = 18
	Button.BorderSizePixel = 0
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

	Button.MouseButton1Click:Connect(function()
		TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(150, 0, 0)}):Play()
		task.wait(0.1)
		TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(90, 0, 0)}):Play()
		pcall(callback)
	end)
end

local function AddToggle(name, default, callback)
	local Toggle = Instance.new("TextButton", TabContent)
	Toggle.Size = UDim2.new(1, -10, 0, 30)
	Toggle.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
	Toggle.TextColor3 = Color3.new(1, 1, 1)
	Toggle.Font = Enum.Font.SourceSans
	Toggle.TextSize = 18
	Toggle.BorderSizePixel = 0
	Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)

	local toggled = default
	Toggle.Text = name .. " : " .. (toggled and "ON" or "OFF")

	Toggle.MouseButton1Click:Connect(function()
		toggled = not toggled
		TweenService:Create(Toggle, TweenInfo.new(0.2), {
			BackgroundColor3 = toggled and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(90, 0, 0)
		}):Play()
		Toggle.Text = name .. " : " .. (toggled and "ON" or "OFF")
		pcall(callback, toggled)
	end)
end

return {
	AddSection = AddSection,
	AddButton = AddButton,
	AddToggle = AddToggle,
	Content = TabContent
}

end

OpenButton.MouseButton1Click:Connect(function()
MainFrame.Visible = not MainFrame.Visible
if MainFrame.Visible then
TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 450, 0, 300)}):Play()
else
TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 0)}):Play()
task.wait(0.4)
MainFrame.Visible = false
end
end)

CloseButton.MouseButton1Click:Connect(function()
TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 0)}):Play()
task.wait(0.4)
MainFrame.Visible = false
end)

local regrasTab = createTab("regras")

regrasTab.AddSection("REGRAS APLICAMENTO DE BAN")

regrasTab.AddSection("não xingar nenhum admin")

regrasTab.AddSection("foi isso mesmo")


-- // Exemplo de uso:
local ServerTab = createTab("Server")

ServerTab.Content.Visible = true

ServerTab.AddSection("functions")

ServerTab.AddButton("Destroy stats", function()
-- script create BY ghost
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function removeLeaderstats(player)
	if not player then return end
	local ls = player:FindFirstChild("leaderstats")
	if ls then ls:Destroy() end
end

for _, p in ipairs(Players:GetPlayers()) do
	removeLeaderstats(p)
end

Players.PlayerAdded:Connect(function(p)
	spawn(function()
		local ok, _ = pcall(function()
			local s = p:WaitForChild("leaderstats", 5)
			if s then s:Destroy() end
		end)
	end)
end)

-- remove any leaderboard-like GUI locally
local function destroyGuiIfLeaderboard(g)
	if not g or not g.Name then return end
	local name = g.Name:lower()
	if name:find("leader") or name:find("playerlist") or name:find("scoreboard") then
		pcall(function() g:Destroy() end)
	end
end

local playerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, g in ipairs(playerGui:GetChildren()) do
	destroyGuiIfLeaderboard(g)
end

playerGui.ChildAdded:Connect(function(c)
	destroyGuiIfLeaderboard(c)
end)
end)

ServerTab.AddButton("Reset", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
LocalPlayer.Character.Humanoid.Health = 0
end
end)

ServerTab.AddButton("Rejoin", function()
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(game.PlaceId)
end)

local HomerTab = createTab("Homer")


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

--== ESP SYSTEM ==--
local espActive = false

local function createESP(p)
if not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") then return end

local highlight = Instance.new("Highlight")
highlight.Name = "AuraLine"
highlight.FillTransparency = 1
highlight.OutlineTransparency = 0.2
highlight.OutlineColor = (p.Team and p.Team.TeamColor.Color) or Color3.fromRGB(255, 255, 255)
highlight.Parent = p.Character

local billboard = Instance.new("BillboardGui")
billboard.Name = "NameTag"
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(0, 100, 0, 25)
billboard.StudsOffset = Vector3.new(0, 3, 0)
billboard.MaxDistance = 200
billboard.Parent = p.Character:FindFirstChild("HumanoidRootPart")

local nameLabel = Instance.new("TextLabel")
nameLabel.BackgroundTransparency = 1
nameLabel.Size = UDim2.new(1, 0, 1, 0)
nameLabel.Text = p.DisplayName or p.Name
nameLabel.TextColor3 = (p.Team and p.Team.TeamColor.Color) or Color3.fromRGB(255, 255, 255)
nameLabel.TextStrokeTransparency = 0.5
nameLabel.Font = Enum.Font.SourceSansBold
nameLabel.TextSize = 14
nameLabel.Parent = billboard

end

local function removeESP(p)
if p.Character then
local h = p.Character:FindFirstChild("AuraLine")
if h then h:Destroy() end
local hrp = p.Character:FindFirstChild("HumanoidRootPart")
if hrp and hrp:FindFirstChild("NameTag") then
hrp.NameTag:Destroy()
end
end
end

local function updateESP()
for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer then
if espActive then
if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
local highlight = p.Character:FindFirstChild("AuraLine")
if not highlight then
createESP(p)
else
highlight.OutlineColor = (p.Team and p.Team.TeamColor.Color) or Color3.fromRGB(255, 255, 255)
local billboard = p.Character.HumanoidRootPart:FindFirstChild("NameTag")
if billboard and billboard:FindFirstChildOfClass("TextLabel") then
billboard.TextLabel.Text = p.DisplayName or p.Name
billboard.TextLabel.TextColor3 = (p.Team and p.Team.TeamColor.Color) or Color3.fromRGB(255, 255, 255)
end
end
end
else
removeESP(p)
end
end
end
end

RunService.RenderStepped:Connect(updateESP)

Players.PlayerAdded:Connect(function(p)
p.CharacterAdded:Connect(function()
task.wait(0.1)
if espActive then createESP(p) end
end)
end)

Players.PlayerRemoving:Connect(removeESP)

--== AUTO KILL ==--
local autoKill = false

local function autoKillLoop()
task.spawn(function()
while autoKill do
local myTeam = LocalPlayer.Team
if not myTeam or myTeam.Name:sub(1,1):lower() ~= "h" then
autoKill = false
notify("System","You are not Homer. Please wait to be able to use it.")
break
end

    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("Torso") then continue end
    local oldPos = myChar.Torso.CFrame

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Team and p.Team.Name:sub(1,1):lower() == "b" and p.Character and p.Character:FindFirstChild("Torso") then
            local name = string.lower(p.Name)
            if name ~= "packj0" and name ~= "kit_cynalt" and name ~= "bk_faxbr" then
                myChar.Torso.CFrame = CFrame.new(p.Character.Torso.Position + Vector3.new(0,1,0))
                task.wait(0.1)
            end
        end
    end

    if myChar and myChar:FindFirstChild("Torso") then
        myChar.Torso.CFrame = oldPos
    end
    task.wait(0.5)
end

end)

end

--== KILL ALL ==--
local function killAll()
local myChar = LocalPlayer.Character
if not myChar or not myChar:FindFirstChild("Torso") then return end
local oldPos = myChar.Torso.CFrame

for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer and p.Team and p.Team.Name:sub(1,1):lower() == "b" and p.Character and p.Character:FindFirstChild("Torso") then
local name = string.lower(p.Name)
if name ~= "packj0" and name ~= "kit_cynalt" and name ~= "bk_faxbr" then
myChar.Torso.CFrame = CFrame.new(p.Character.Torso.Position + Vector3.new(0,1,0))
task.wait(0.1)
end
end
end

myChar.Torso.CFrame = oldPos
notify("System","sucess")

end

--== KILL RANDOM ==--
local function killRandom()
local enemies = {}
for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer and p.Team and LocalPlayer.Team and p.Team.Name:sub(1,1):lower() == "b" and LocalPlayer.Team.Name:sub(1,1):lower() == "h" then
local name = string.lower(p.Name)
if name ~= "packj0" and name ~= "kit_cynalt" and name ~= "bk_faxbr" then
table.insert(enemies, p)
end
end
end
if #enemies == 0 then notify("System","No enemies found.") return end

local target = enemies[math.random(1,#enemies)]
local myChar = LocalPlayer.Character
if myChar and myChar:FindFirstChild("Torso") and target.Character and target.Character:FindFirstChild("Torso") then
local oldPos = myChar.Torso.CFrame
myChar.Torso.CFrame = CFrame.new(target.Character.Torso.Position + Vector3.new(0,1,0))
task.wait(0.2)
myChar.Torso.CFrame = oldPos
notify("System","Random player attacked, DOMER.")
end

end

-- Script by Ghost (R6 - Homer Pulls com cooldown e proteção completa)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local homerPushActive = false
local cooldowns = {}

-- Empurra VOCÊ pra longe do Homer
local function pushAwayFrom(target)
	local myChar = LocalPlayer.Character
	if myChar and myChar:FindFirstChild("Torso") and target and target:FindFirstChild("Torso") then
		local myTorso = myChar.Torso
		local dir = (myTorso.Position - target.Torso.Position).Unit
		local bv = Instance.new("BodyVelocity")
		bv.Velocity = dir * 80
		bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bv.Parent = myTorso
		game.Debris:AddItem(bv, 0.2)
	end
end

-- Loop principal
RunService.Heartbeat:Connect(function()
	if homerPushActive then
		local myChar = LocalPlayer.Character
		if myChar and myChar:FindFirstChild("Torso") then
			local myTorso = myChar.Torso
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Team and player.Team.Name == "Homer" then
					local char = player.Character
					if char and char:FindFirstChild("Torso") then
						local torso = char.Torso
						local dist = (myTorso.Position - torso.Position).Magnitude
						if dist <= 10 then
							if not cooldowns[player] or tick() - cooldowns[player] >= 1 then
								pushAwayFrom(char)
								cooldowns[player] = tick()
							end
						end
					end
				end
			end
		end
	end
end)

-- Remover cooldown se player sair
Players.PlayerRemoving:Connect(function(p)
	cooldowns[p] = nil
end)

-- Resetar tudo ao morrer
LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.1)
	cooldowns = {}
end)

-- Toggle na aba Homer
HomerTab.AddToggle("Homer Pulls / empurra o Homer", false, function(v)
	homerPushActive = v
end)

HomerTab.AddButton("kill all / mata todos", killAll)

HomerTab.AddButton("kill Random / mata aleatorio", killRandom)

HomerTab.AddToggle("kill auto / mata automatico", false, function(val)
autoKill = val
if val then autoKillLoop() end
end)

HomerTab.AddToggle("ver todos / esp / Fix", true, function(val)
espActive = val
end)

HomerTab.AddButton("Fake Ritual / ritual falso (Use the Homer)", function()

notify("System", "wait!!", 1)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local function sendChatMessage(message)
    local canal = TextChatService:FindFirstChildOfClass("TextChannel")
    if canal then
        canal:SendAsync(message)
    end
end

local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local platform = Instance.new("Part")
platform.Size = Vector3.new(6, 0.5, 6)
platform.Anchored = true
platform.CanCollide = true
platform.Color = Color3.fromRGB(255, 255, 0)
platform.Material = Enum.Material.Neon
platform.Name = "RitualPlatform"
platform.Parent = workspace
platform.CFrame = hrp.CFrame * CFrame.new(0, -3.5, 0)

local rotationSpeed = 0.5
local conn
conn = RunService.Heartbeat:Connect(function()
    if hrp and platform then
        platform.CFrame = platform.CFrame * CFrame.Angles(0, math.rad(rotationSpeed), 0)
        hrp.CFrame = CFrame.new(platform.Position.X, hrp.Position.Y, platform.Position.Z) * CFrame.Angles(0, hrp.Orientation.Y, 0)
    end
end)

sendChatMessage("Dœmër.")
task.wait(1)
sendChatMessage("D0rmer.")

for i = 1, 80 do
    platform.CFrame = platform.CFrame + Vector3.new(0, 0.1, 0)
    task.wait(0.03)
end

rotationSpeed = 10
task.wait(4)

if conn then conn:Disconnect() end
if platform then platform:Destroy() end
LocalPlayer.Character:BreakJoints()

end)

-- script create BY ghost

HomerTab.AddToggle("X Ray", false, function(state)
    task.spawn(function()
        local lpChar = game.Players.LocalPlayer.Character
        local parts = workspace:GetDescendants()

        if state then
            for i = 1, #parts do
                local obj = parts[i]
                if obj:IsA("BasePart") and not obj:IsDescendantOf(lpChar) then
                    obj.LocalTransparencyModifier = 0.7
                end
            end
        else
            for i = 1, #parts do
                local obj = parts[i]
                if obj:IsA("BasePart") and not obj:IsDescendantOf(lpChar) then
                    obj.LocalTransparencyModifier = 0
                end
            end
        end
    end)
end)

local BartTab = createTab("Bart")

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local infinityJump = false
local tptoolEquipped = false

BartTab.AddToggle("Infinity Jump / pulo infinito / Bypass", false, function(val)
infinityJump = val
end)

UserInputService.JumpRequest:Connect(function()
if infinityJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
local hrp = LocalPlayer.Character.HumanoidRootPart
local part = Instance.new("Part")
part.Size = Vector3.new(6, 0.2, 6)
part.Anchored = true
part.CanCollide = true
part.CFrame = hrp.CFrame - Vector3.new(0, 3, 0)
part.Transparency = 1
part.Parent = workspace
task.delay(0.1, function()
if part then part:Destroy() end
end)
end
end)

BartTab.AddButton("Give TP Tool", function()
notify("system", "bypass....")
notify("Sucesse", ".check your inventory")

if tptoolEquipped then return end
tptoolEquipped = true

local tool = Instance.new("Tool")
tool.Name = "TPTool | ferramenta teleport"
tool.RequiresHandle = false
tool.Parent = LocalPlayer.Backpack

tool.Activated:Connect(function()
	local mouse = LocalPlayer:GetMouse()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") and mouse.Hit then
		char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 2, 0))
	end
end)

end)

BartTab.AddButton("área salva / Safe Zone", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12, 104, -10)
end
end)

BartTab.AddToggle("voar/ Float", false, function(state)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local floatEnabled = state
local floatPart
local floatConnection

if floatEnabled then
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    floatPart = Instance.new("Part")
    floatPart.Size = Vector3.new(6, 1, 6)
    floatPart.Anchored = true
    floatPart.CanCollide = true
    floatPart.Transparency = 0.5
    floatPart.Color = Color3.fromRGB(0, 170, 255)
    floatPart.Name = "FloatPart"
    floatPart.Parent = workspace

    floatConnection = RunService.Heartbeat:Connect(function()
        if char and hrp and floatPart then
            floatPart.CFrame = hrp.CFrame * CFrame.new(0, -3.5, 0)
        end
    end)
else
    if floatConnection then
        floatConnection:Disconnect()
    end
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "FloatPart" then
            v:Destroy()
        end
    end
end

end)

BartTab.AddSection("Spaming / bypass")



BartTab.AddButton("Make Sound Obby ALL", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local char = LocalPlayer.Character
if not (char and char:FindFirstChild("HumanoidRootPart")) then return end

local hrp = char.HumanoidRootPart
local originalPos = hrp.CFrame

hrp.CFrame = CFrame.new(-32, 232, 110)
task.wait(1.3)
hrp.CFrame = originalPos

end)


local spamEnabled = false
local spamThread

BartTab.AddToggle("Spam tacos Sound", false, function(state)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
spamEnabled = state

if spamEnabled then
    spamThread = task.spawn(function()
        while spamEnabled do
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            local char = LocalPlayer.Character
            if backpack and char then
                for _, item in ipairs(backpack:GetChildren()) do
                    if not spamEnabled then break end
                    if item:IsA("Tool") and (item.Name == "Taco" or item.Name:sub(1,2) == "T") then
                        item.Parent = char
                        task.wait(0.04)
                        item.Parent = backpack
                        task.wait(0.04)
                    end
                end
            end
            task.wait(0.04)
        end
    end)
else
    spamEnabled = false
    if spamThread then
        task.cancel(spamThread)
    end
end

end)

local spamEnabled = false
local spamThread

BartTab.AddToggle("Spam Pizza Sound", false, function(state)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
spamEnabled = state

if spamEnabled then
    spamThread = task.spawn(function()
        while spamEnabled do
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            local char = LocalPlayer.Character
            if backpack and char then
                for _, item in ipairs(backpack:GetChildren()) do
                    if not spamEnabled then break end
                    if item:IsA("Tool") and (item.Name == "Pizza" or item.Name:sub(1,2) == "Pi") then
                        item.Parent = char
                        task.wait(0.04)
                        item.Parent = backpack
                        task.wait(0.04)
                    end
                end
            end
            task.wait(0.04)
        end
    end)
else
    spamEnabled = false
    if spamThread then
        task.cancel(spamThread)
    end
end

end)

BartTab.AddToggle("Full Bright", false, function(state)
local Lighting = game:GetService("Lighting")
local active = state

-- Salva as configurações originais antes de ativar
local originalSettings = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

if active then
    task.spawn(function()
        while active do
            pcall(function()
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 1e6
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            end)
            task.wait(0.5)
        end
    end)
else
    -- Restaura valores originais
    pcall(function()
        Lighting.Brightness = originalSettings.Brightness
        Lighting.ClockTime = originalSettings.ClockTime
        Lighting.FogEnd = originalSettings.FogEnd
        Lighting.GlobalShadows = originalSettings.GlobalShadows
        Lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
    end)
end

end)

BartTab.AddSection("game States")

BartTab.AddToggle("View FPS Game and MS", false, function(state)
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local fpsGui = CoreGui:FindFirstChild("GhostFPSGui")
local running = state

if state then
    if not fpsGui then
        fpsGui = Instance.new("ScreenGui", CoreGui)
        fpsGui.Name = "GhostFPSGui"

        -- GUI principal
        local mainFrame = Instance.new("Frame", fpsGui)
        mainFrame.Name = "MainFrame"
        mainFrame.Size = UDim2.new(0, 180, 0, 50)
        mainFrame.Position = UDim2.new(0, 10, 0, 10)
        mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        mainFrame.BorderSizePixel = 0
        Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 6)

        -- Barra de arrasto
        local dragBar = Instance.new("Frame", mainFrame)
        dragBar.Name = "DragBar"
        dragBar.Size = UDim2.new(1, 0, 0, 20)
        dragBar.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
        dragBar.BorderSizePixel = 0
        Instance.new("UICorner", dragBar).CornerRadius = UDim.new(0, 6)

        local dragLabel = Instance.new("TextLabel", dragBar)
        dragLabel.Size = UDim2.new(1, 0, 1, 0)
        dragLabel.BackgroundTransparency = 1
        dragLabel.Font = Enum.Font.SourceSansBold
        dragLabel.TextColor3 = Color3.new(1, 1, 1)
        dragLabel.TextSize = 16
        dragLabel.Text = "Drag"

        -- Barra de status FPS/MS
        local infoBar = Instance.new("TextLabel", mainFrame)
        infoBar.Name = "InfoBar"
        infoBar.Size = UDim2.new(1, 0, 0, 25)
        infoBar.Position = UDim2.new(0, 0, 0, 25)
        infoBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        infoBar.TextColor3 = Color3.new(1, 1, 1)
        infoBar.Font = Enum.Font.Code
        infoBar.TextSize = 15
        infoBar.Text = "FPS: 0 | MS: 0"
        Instance.new("UICorner", infoBar).CornerRadius = UDim.new(0, 6)

        -- Sistema de arrastar
        local dragging, dragInput, dragStart, startPos

        local function update(input)
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        dragBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = mainFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        dragBar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)

        -- Sistema FPS / MS
        task.spawn(function()
            local last = tick()
            local frameCount = 0
            while running and fpsGui and fpsGui.Parent do
                frameCount += 1
                local now = tick()
                if now - last >= 1 then
                    local fps = frameCount
                    frameCount = 0
                    last = now
                    local delta = RunService.RenderStepped:Wait()
                    local ms = math.floor(delta * 1000)
                    infoBar.Text = "FPS: " .. fps .. " | MS: " .. ms
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
else
    if fpsGui then
        fpsGui:Destroy()
    end
end

end)

--// VIEW BODY
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local viewBodyActive = false
local highlights = {}

local function createHighlight(part)
local highlight = Instance.new("BoxHandleAdornment")
highlight.Adornee = part
highlight.Color3 = Color3.new(1, 1, 0)
highlight.Transparency = 0.8
highlight.AlwaysOnTop = true
highlight.ZIndex = 10
highlight.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
highlight.Parent = part
return highlight
end

local function enableViewBody()
local char = LocalPlayer.Character
if not char then return end
for _, part in ipairs(char:GetChildren()) do
if part:IsA("BasePart") then
local h = createHighlight(part)
table.insert(highlights, h)
end
end
end

local function disableViewBody()
for _, h in ipairs(highlights) do
if h and h.Parent then
h:Destroy()
end
end
highlights = {}
end

BartTab.AddToggle("View Body", false, function(state)
viewBodyActive = state
if state then
enableViewBody()
else
disableViewBody()
end
end)

LocalPlayer.CharacterAdded:Connect(function()
task.wait(0.5)
if viewBodyActive then
enableViewBody()
end
end)

-- script create BY ghost

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer
LocalPlayer.Archivable = true

local ghostActive = false
local Configuration = {
Enabled = true,
Parts = {
'HumanoidRootPart', 'Head', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg',
'LeftUpperArm', 'RightUpperArm', 'LeftLowerArm', 'RightLowerArm',
'LeftHand', 'RightHand', 'LeftUpperLeg', 'RightUpperLeg',
'LeftLowerLeg', 'RightLowerLeg', 'LeftFoot', 'RightFoot'
},
Timing = {
MinDelay = 0.02,
MaxDelay = 0.12,
MaxDistance = 5,
PingSmoothing = 0.12,
DefaultPing = 120
}
}

getgenv().ghostrgb = true

local GhostManager = {
Parts = {},
FrameHistory = {},
Character = nil
}

function GhostManager:InitializeGhostPart(originalPart)
local ghostPart = Instance.new('Part')
ghostPart.Name = originalPart.Name .. '_Ghost'
ghostPart.Size = originalPart.Size
ghostPart.Anchored = true
ghostPart.CanCollide = false
ghostPart.Transparency = 1
ghostPart.CFrame = originalPart.CFrame
ghostPart.Parent = workspace

local selectionBox = Instance.new('SelectionBox')
selectionBox.Adornee = ghostPart
selectionBox.LineThickness = 0.01
selectionBox.Parent = ghostPart

return {
    Original = originalPart,
    Ghost = ghostPart,
    Box = selectionBox
}

end

function GhostManager:CalculateCurrentPing()
local networkStats = Stats.Network
if not networkStats then return Configuration.Timing.DefaultPing end

local pingStat = networkStats.ServerStatsItem['Data Ping'] or networkStats.ServerStatsItem['Data Ping (ms)']
if not pingStat then return Configuration.Timing.DefaultPing end

return tonumber(pingStat:GetValue()) or Configuration.Timing.DefaultPing

end

function GhostManager:UpdateTimingDynamic(ping)
local t = Configuration.Timing
local pingFactor = math.clamp(ping / 200, 0.5, 3)

t.MinDelay = math.clamp(0.02 * pingFactor, 0.02, 0.08)
t.MaxDelay = math.clamp(0.08 * pingFactor, 0.04, 0.18)
t.MaxDistance = math.clamp(3.5 * pingFactor, 2, 8)
t.PingSmoothing = math.clamp(0.12 / pingFactor, 0.05, 0.2)

end

function GhostManager:ApplyColorEffect(selectionBox)
if getgenv().ghostrgb then
selectionBox.Color3 = Color3.fromHSV((tick() % 5) / 5, 1, 1)
else
selectionBox.Color3 = Color3.new(1, 1, 1)
end
end

function GhostManager:InitializeCharacter()
self.Character = LocalPlayer.Character
if not self.Character then return end

self:CleanupExistingGhosts()

local rootPart = self.Character:FindFirstChild('HumanoidRootPart')
if not rootPart then return end

self.Parts = {}
for _, partName in ipairs(Configuration.Parts) do
    local characterPart = self.Character:FindFirstChild(partName)
    if characterPart and characterPart:IsA('BasePart') then
        self.Parts[partName] = self:InitializeGhostPart(characterPart)
    end
end

end

function GhostManager:CleanupExistingGhosts()
for _, child in ipairs(workspace:GetChildren()) do
if child:IsA('Part') and child.Name:match('_Ghost$') then
child:Destroy()
end
end
end

function GhostManager:CaptureFrameData()
if not self.Character then return end

local rootPart = self.Character:FindFirstChild('HumanoidRootPart')
if not rootPart then return end

local relativeTransforms = {}
for partName, ghostData in pairs(self.Parts) do
    if ghostData.Original and ghostData.Original.Parent then
        relativeTransforms[partName] = rootPart.CFrame:ToObjectSpace(ghostData.Original.CFrame)
    end
end

local currentTime = tick()
table.insert(self.FrameHistory, {
    Timestamp = currentTime,
    Transform = rootPart.CFrame,
    Position = rootPart.Position,
    Velocity = rootPart.Velocity,
    RelativeTransforms = relativeTransforms
})

if #self.FrameHistory > 300 then
    for _ = 1, 80 do table.remove(self.FrameHistory, 1) end
end

end

function GhostManager:UpdateGhostParts(deltaTime)
if not self.Character then return end

local rootPart = self.Character:FindFirstChild('HumanoidRootPart')
if not rootPart then return end

local currentPing = self:CalculateCurrentPing()
self:UpdateTimingDynamic(currentPing)

local t = Configuration.Timing
t.DefaultPing = currentPing * t.PingSmoothing + t.DefaultPing * (1 - t.PingSmoothing)

local targetDelay = math.clamp(t.DefaultPing / 2000, t.MinDelay, t.MaxDelay)
local targetFrame = self:FindTargetFrame(tick() - targetDelay)
if not targetFrame then return end

local timeDifference = math.clamp(tick() - targetFrame.Timestamp, 0, 0.06)
local predictedPosition = targetFrame.Position + targetFrame.Velocity * timeDifference * 0.9
local predictedTransform = CFrame.new(predictedPosition) * (targetFrame.Transform - targetFrame.Transform.Position)

local stabilityFactor = math.clamp(1 - math.abs(currentPing - t.DefaultPing) / 300, 0.25, 1)

for _, ghostData in pairs(self.Parts) do
    self:UpdateSingleGhostPart(ghostData, targetFrame, predictedTransform, deltaTime, stabilityFactor)
end

end

function GhostManager:FindTargetFrame(targetTime)
for i = #self.FrameHistory, 1, -1 do
if self.FrameHistory[i].Timestamp <= targetTime then
return self.FrameHistory[i]
end
end
return self.FrameHistory[1]
end

function GhostManager:UpdateSingleGhostPart(ghostData, targetFrame, predictedTransform, deltaTime, stability)
local ghostPart = ghostData.Ghost
local selectionBox = ghostData.Box
if not ghostPart then return end

local relativeTransform = targetFrame.RelativeTransforms[ghostData.Original.Name]
local targetCFrame = relativeTransform and predictedTransform * relativeTransform or 
                    (ghostData.Original and ghostData.Original.CFrame or ghostPart.CFrame)

local positionOffset = (targetCFrame.Position - predictedTransform.Position).Magnitude
if positionOffset > Configuration.Timing.MaxDistance then
    local direction = (targetCFrame.Position - predictedTransform.Position).Unit
    local rotationX, rotationY, rotationZ = targetCFrame:ToEulerAnglesXYZ()
    targetCFrame = CFrame.new(predictedTransform.Position + direction * Configuration.Timing.MaxDistance) * 
                  CFrame.Angles(rotationX, rotationY, rotationZ)
end

local interpolationWeight = math.clamp(deltaTime * 18 * stability, 0, 1)
ghostPart.CFrame = ghostPart.CFrame:Lerp(targetCFrame, interpolationWeight)

self:ApplyColorEffect(selectionBox)

end

BartTab.AddToggle("View Position In Server", false, function(state)
ghostActive = state
if state then
GhostManager:InitializeCharacter()
RunService.Heartbeat:Connect(function(deltaTime)
if ghostActive then
GhostManager:CaptureFrameData()
GhostManager:UpdateGhostParts(deltaTime)
end
end)
LocalPlayer.CharacterAdded:Connect(function()
task.wait(0.5)
if ghostActive then
GhostManager:InitializeCharacter()
end
end)
else
ghostActive = false
GhostManager:CleanupExistingGhosts()
end
end)


BartTab.AddButton("Delete Doors From Map Space", function()
local path = workspace:FindFirstChild("map") and workspace.map:FindFirstChild("Spaceship")
if not path then
notify("System", "Spaceship not found pls wait for the map", 4)
return
end

local deleted = 0
for _, obj in ipairs(path:GetChildren()) do
    if obj:IsA("Model") or obj:IsA("Part") or obj:IsA("MeshPart") then
        local name = string.lower(obj.Name)
        if name:find("door") or name:find("bartdoor") then
            obj:Destroy()
            deleted += 30
        end
    end
end

notify("System", "Deleted " .. deleted .. " Doors / BartDoors from Spaceship.", 5)

end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local spinning = false
local spinConnection
local rotation = 0

BartTab.AddToggle("Spin Bot", false, function(state)
spinning = state

if spinning then
	spinConnection = RunService.Heartbeat:Connect(function()
		local char = LocalPlayer.Character
		if not char or not char:FindFirstChild("Torso") then return end

		local torso = char.Torso
		rotation = (rotation + 8) % 360
		torso.CFrame = torso.CFrame * CFrame.Angles(0, math.rad(8), 0)
	end)
else
	if spinConnection then
		spinConnection:Disconnect()
		spinConnection = nil
	end
end

end)

BartTab.AddSection("tp walk")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local tpWalkEnabled = false
local modes = {"Legit", "Mediam", "Hack"}
local currentIndex = 1

local tpSettings = {
Legit = {distance = 0.02, delay = 0.01},
Mediam = {distance = 0.12, delay = 0.01},
Hack = {distance = 0.20, delay = 0.001}
}

local function getSettings()
local currentMode = modes[currentIndex]
return tpSettings[currentMode].distance, tpSettings[currentMode].delay, currentMode
end

local function tpStep()
local character = LocalPlayer.Character
if not character or not character:FindFirstChild("HumanoidRootPart") then return end

local hrp = character.HumanoidRootPart
local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then return end

local moveDir = humanoid.MoveDirection
if moveDir.Magnitude > 0 then
    local distance = select(1, getSettings())
    hrp.CFrame = hrp.CFrame + moveDir * distance
end

end

local function tpLoop()
task.spawn(function()
while tpWalkEnabled do
tpStep()
local _, delay = getSettings()
task.wait(delay)
end
end)
end

BartTab.AddToggle("Active Mode", false, function(val)
tpWalkEnabled = val
if val then tpLoop() end
end)

BartTab.AddButton("> Change Mode Speed", function()
currentIndex = currentIndex + 1
if currentIndex > #modes then
currentIndex = 1
end
local _, _, mode = getSettings()
notify("TP Walk", "mode : " .. mode, 0.5)
end)

local FarmTab = createTab("Farm")

FarmTab.AddSection("Farming V2")

FarmTab.AddToggle("Automatic TP Kill | Homer", false, function(val)
autoKill = val
if val then autoKillLoop() end
end)

FarmTab.AddButton("Finish the Obby Hard", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-32, 232, 110)
end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local autoTp = false

local function autoTpLoop()
task.spawn(function()
while autoTp do
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-32, 232, 110)
notify("System", "attempt", 0.6)
task.wait(0.3)
notify("System", "back...", 0.6)
end
task.wait(5.3)
end
end)
end

FarmTab.AddToggle("Auto Farm | Obby Hard", false, function(val)
autoTp = val
if val then
autoTpLoop()
end
end)

local TpTab = createTab("tps")

TpTab.AddButton("tp 1", function()
local pl = game.Players.LocalPlayer
if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
	pl.Character:MoveTo(Vector3.new(5, -6, -108))
end
end)

TpTab.AddButton("tp 2", function()
local pl = game.Players.LocalPlayer
if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
	pl.Character:MoveTo(Vector3.new(0, 117, 83))
end
end)

TpTab.AddButton("tp 3", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12, 104, -10)
end
end)


TpTab.AddSection("teleport save")

local savedPosition = nil
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function salvarPosicao()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		savedPosition = char.HumanoidRootPart.Position
		notify("System", "saved", 5)
		print("Posição salva:", savedPosition)
	end
end

function tpPosicaoSalva()
	if savedPosition and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		LocalPlayer.Character:MoveTo(savedPosition)
		notify("System", "teleportado", 5)
	else
		print("Nenhuma posição salva ou personagem inválido.")
	end
end

TpTab.AddButton("Salvar posição", salvarPosicao)
TpTab.AddButton("Teleportar para posição salva", tpPosicaoSalva)

TpTab.AddSection("spoots")

TpTab.AddButton("Tp to an Bart", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character
if not character or not character:FindFirstChild("Torso") then return end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Team and player.Team.Name == "Bart" then
        local name = string.lower(player.Name)
        if name ~= "packj0" and name ~= "kit_cynalt" and name ~= "bk_faxbr" then
            local targetChar = player.Character
            if targetChar and targetChar:FindFirstChild("Torso") then
                local targetPos = targetChar.Torso.CFrame * CFrame.new(0, 0, 3)
                character.Torso.CFrame = targetPos
                break
            end
        end
    end
end

end)

TpTab.AddButton("Tp to an Homer", function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("Torso") then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Team and player.Team.Name == "Homer" then
            local targetChar = player.Character
            if targetChar and targetChar:FindFirstChild("Torso") then
                local targetPos = targetChar.Torso.CFrame * CFrame.new(0, 0, 3)
                character.Torso.CFrame = targetPos
                break
            end
        end
    end
end)

TpTab.AddButton("spoot Simpsons", function()
local pl = game.Players.LocalPlayer
if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
	pl.Character:MoveTo(Vector3.new(47, -60, -97))
end
end)

TpTab.AddButton("spoot Simpsons", function()
local pl = game.Players.LocalPlayer
if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
	pl.Character:MoveTo(Vector3.new(73, -80, -1))
end
end)

TpTab.AddButton("spoot island bar", function()
local pl = game.Players.LocalPlayer
if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
	pl.Character:MoveTo(Vector3.new(-48, -114, -42))
end
end)

TpTab.AddButton("spoot Island bar", function()
local pl = game.Players.LocalPlayer
if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
	pl.Character:MoveTo(Vector3.new(54, -55, -57))
end
end)

local ConfigTab = createTab("Config")

ConfigTab.AddSection("system")

ConfigTab.AddButton("View FPS", function()
local RunService = game:GetService("RunService")
local fps = math.floor(1 / RunService.RenderStepped:Wait())
notify("System", "FPS: " .. fps, 3)
end)




ConfigTab.AddButton("destroy GUI", function() ScreenGui:Destroy() end)


local ScriptTab = createTab("Script")

ScriptTab.AddButton("wall Hop Hub and ant cheat", function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Simple-AntiCheat-Bypass-84341"))()
wait(0.1)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Wallhop-Hub-81098"))()

end)

ScriptTab.AddButton("fly script and ant cheat", function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Simple-AntiCheat-Bypass-84341"))()
wait(0.1)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FLY-V9-BY-KIRO-In-black-and-white-59302"))()

end)

ScriptTab.AddButton("ALL Skins  Hub onionware", function()

loadstring(game:HttpGet("https://rawscripts.net/raw/UPD-You-VS-Homer-Onionware-84957"))()

end)

ScriptTab.AddButton("bartender good", function()

loadstring(game:HttpGet("https://rawscripts.net/raw/You-VS-Homer-Bartender-78034"))()

end)



loadstring(game:HttpGet("https://raw.githubusercontent.com/Cat558-uz/Eiei/refs/heads/main/520dffc3274a9d5e.lua.txt", true))()

