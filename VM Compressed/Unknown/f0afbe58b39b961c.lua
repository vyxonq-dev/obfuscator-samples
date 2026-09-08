local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Cross Hub🩸",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Cross Hub🩸",
   LoadingSubtitle = "Bem-Vindo.",
   ShowText = "Cross Hub🩸", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "B", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "nil", -- Create a custom folder for your hub/game
      FileName = "nil"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "EfCpDYMWmE", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sistema De Key",
      Subtitle = "Makeiko",
      Note = "Pegue a key com o dono do script, se você souber. rs.", -- Use this to tell the user how to get a key
      FileName = "CHKEY", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"ZoioEuDesafio","Star01FemininaDoRp"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Principal⚡️", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Bugs💯")

local Button = MainTab:CreateButton({
   Name = "Anti-Pulo🚫",
   Callback = function()
   -- The function that takes place when the button is pressed
      local player = game.Players.LocalPlayer
local JUMP_POWER_DEFAULT = 50
local jumpEnabled = true -- true = pulo liberado

-- Função pra ligar/desligar o pulo
local function setJumpEnabled(enabled)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		if enabled then
			humanoid.JumpPower = JUMP_POWER_DEFAULT
		else
			humanoid.JumpPower = 0
			humanoid.Jump = false
		end
	end
end

-- Criar o botão flutuante redondo
local function createFloatingButton()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "JumpToggleGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local button = Instance.new("TextButton")
	button.Name = "FloatingJumpButton"
	button.Size = UDim2.new(0, 40, 0, 40)
	button.Position = UDim2.new(0, 10, 0.5, -20)
	button.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Amarelo inicial (pulo ON)
	button.TextColor3 = Color3.fromRGB(0, 0, 0)
	button.TextSize = 12
	button.Text = "OFF"
	button.BackgroundTransparency = 0
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.Parent = screenGui
	button.ClipsDescendants = true

	-- Torna o botão redondo
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = button

	-- Função de arrastar
	local dragging
	local dragInput
	local dragStart
	local startPos

	local uis = game:GetService("UserInputService")

	local function updatePosition(input)
		local delta = input.Position - dragStart
		button.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end

	button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or
		   input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = button.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	button.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or
		   input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	uis.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			updatePosition(input)
		end
	end)

	-- Alternar pulo
	button.MouseButton1Click:Connect(function()
		jumpEnabled = not jumpEnabled
		setJumpEnabled(jumpEnabled)

		if jumpEnabled then
			button.Text = "OFF"
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Amarelo
		else
			button.Text = "ON"
			button.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Azul
		end
	end)

	-- Atualiza estado no respawn
	player.CharacterAdded:Connect(function()
		task.wait(0.1)
		setJumpEnabled(jumpEnabled)

		if jumpEnabled then
			button.Text = "OFF"
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
		else
			button.Text = "ON"
			button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		end
	end)

	-- Inicializa estado
	setJumpEnabled(jumpEnabled)
end

-- Garantir que PlayerGui existe
if player:FindFirstChild("PlayerGui") then
	createFloatingButton()
else
	player:WaitForChild("PlayerGui")
   createFloatingButton()
    end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fps Booster🚀",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JoshzzAlteregooo/FpsBoosterV2/refs/heads/main/FpsBoosterV2/JoshzzPanelBooster"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Lag Switch👣 (Para Pc)",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://pastefy.app/QNoxbIjY/raw", true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Ping Reducer🔝",
   Callback = function()
   -- The function that takes place when the button is pressed
      local function OptimizePing(state)
    if state then
        settings().Physics.AllowSleep = false
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    end
end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Velocidade💫",
   Callback = function()
   -- The function that takes place when the button is pressed
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

if humanoid then
    humanoid.WalkSpeed = 25.5
end

-- Se quiser que a velocidade se mantenha ao morrer/respawnar:
player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = 25.5
end) 
   end,
})

local Section = MainTab:CreateSection("Scripts💥")
local Button = MainTab:CreateButton({
   Name = "Ativar Tudo☠️",
   Callback = function()
   -- A função que ocorre quando o botão é pressionado.
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Criar GUI principal
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 160)
Frame.Position = UDim2.new(0.35, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0,12)

-- Botão "Tudo"
local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(1, -20, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 40)
Button.BackgroundColor3 = Color3.fromRGB(45,45,45)
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.Text = "Ativar TUDO"
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 18

local corner = Instance.new("UICorner", Button)
corner.CornerRadius = UDim.new(0,8)

-- Variáveis
local ativado = false
local reachConn
local menuVisivel = true
local hitbox = nil
local hitboxConn

-- Criar hitbox invisível (segue o personagem)
local function criarHitbox()
    if hitbox then hitbox:Destroy() end
    hitbox = Instance.new("Part")
    hitbox.Name = "HitboxExtra"
    hitbox.Size = Vector3.new(100,100,100) -- HITBOX GIGANTE
    hitbox.Transparency = 1
    hitbox.CanCollide = false
    hitbox.Anchored = true
    hitbox.Massless = true
    hitbox.Parent = workspace

    hitboxConn = RunService.Heartbeat:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            hitbox.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end)
end

-- Remover hitbox
local function removerHitbox()
    if hitbox then hitbox:Destroy() end
    if hitboxConn then hitboxConn:Disconnect() end
    hitbox = nil
end

-- Botão principal
Button.MouseButton1Click:Connect(function()
    ativado = not ativado
    if ativado then
        Button.Text = "TUDO ON ✅"

        -- Anti Pulo
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")
        hum.UseJumpPower = true
        hum.JumpPower = 0

        -- Hitbox invisível gigante
        criarHitbox()

        -- Reach infinito
        reachConn = RunService.Heartbeat:Connect(function()
            local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool.Handle.Size = Vector3.new(99999999, 99999999, 99999999)
                tool.Handle.Transparency = 1
                tool.Handle.Massless = true
                tool.Handle.CanCollide = false
            end
        end)

        -- FPS Boost
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        setfpscap(120)

    else
        Button.Text = "Ativar TUDO"

        -- Resetar pulo
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")
        hum.JumpPower = 50

        -- Remover hitbox invisível
        removerHitbox()

        -- Desliga reach
        if reachConn then
            reachConn:Disconnect()
            reachConn = nil
        end
    end
end)

-- Atalho no teclado (X para mostrar/ocultar menu)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.X then
        menuVisivel = not menuVisivel
        Frame.Visible = menuVisivel
    end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fps Counter🔢",
   Callback = function()
   -- The function that takes place when the button is pressed
      local screenGui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 100, 0, 50)
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.BackgroundTransparency = 0.5
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextScaled = true
textLabel.Text = "FPS: 0"
textLabel.Parent = screenGui

-- RGB text color loop
coroutine.wrap(function()
    local h = 0
    while true do
        h = (h + 0.01) % 1
        textLabel.TextColor3 = Color3.fromHSV(h, 1, 1)
        task.wait(0.05)
    end
end)()

-- Function to calculate and update FPS
local function updateFPS()
    local lastTime = tick()
    local frameCount = 0

    while true do
        game:GetService("RunService").RenderStepped:Wait()
        frameCount = frameCount + 1

        local currentTime = tick()
        if currentTime - lastTime >= 0.5 then
            local fps = math.floor(frameCount / (currentTime - lastTime))
            textLabel.Text = "FPS: " .. fps
            frameCount = 0
            lastTime = currentTime
        end
    end
end

spawn(updateFPS)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Star Hub🌟",
   Callback = function()
   -- The function that takes place when the button is pressed
      -- 🌟 Star Hub 🌟

local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

-- Variáveis
local desarmeAtivo = false
local antPuloAtivo = false
local velocidade = 25.5
local desarmeDistancia = 10

-- Função principal de desarme
local function desarmarJogador()
    local bola = workspace:FindFirstChild("Soccerball")
    if bola and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        local distancia = (bola.Position - hrp.Position).Magnitude
        if distancia <= 12 then
            bola.CFrame = hrp.CFrame * CFrame.new(0, 0, -desarmeDistancia)
            if bola:FindFirstChild("Velocity") then
                bola.Velocity = Vector3.new(0,0,0)
            end
        end
    end
end

-- Loop automático
runService.RenderStepped:Connect(function()
    if desarmeAtivo then
        desarmarJogador()
    end
    if antPuloAtivo and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = 0
    end
end)

-- Frame principal (menu)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 520)
frame.Position = UDim2.new(0.5, -125, 0.5, -260)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = frame

-- Sombra
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = frame

-- Título
local titulo = Instance.new("TextLabel")
titulo.Size = UDim2.new(1, 0, 0, 50)
titulo.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titulo.Text = "🌟 Star Hub 🌟"
titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
titulo.Font = Enum.Font.GothamBold
titulo.TextScaled = true
titulo.Parent = frame

local tituloCorner = Instance.new("UICorner")
tituloCorner.CornerRadius = UDim.new(0, 12)
tituloCorner.Parent = titulo

-- Função para criar botões
local function criarBotao(texto, cor, yPos, func)
    local botao = Instance.new("TextButton")
    botao.Size = UDim2.new(0.9, 0, 0, 40)
    botao.Position = UDim2.new(0.05, 0, 0, yPos)
    botao.BackgroundColor3 = cor
    botao.Text = texto
    botao.TextColor3 = Color3.fromRGB(255, 255, 255)
    botao.Font = Enum.Font.GothamBold
    botao.TextScaled = true
    botao.AutoButtonColor = true
    botao.Parent = frame

    local bcorner = Instance.new("UICorner")
    bcorner.CornerRadius = UDim.new(0, 10)
    bcorner.Parent = botao

    botao.MouseButton1Click:Connect(function() func(botao) end)
    return botao
end

-- Status (embaixo)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 35)
statusLabel.Position = UDim2.new(0, 0, 1, -40)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Desarme Auto: OFF"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextScaled = true
statusLabel.Parent = frame
-- Botão Desarme Automático
criarBotao("🦵 Desarme Auto🦵", Color3.fromRGB(60, 120, 220), 70, function(botao)
    desarmeAtivo = not desarmeAtivo
    if desarmeAtivo then
        botao.Text = "🦵 Desarme Auto🦵: [ON]"
        botao.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
        statusLabel.Text = "🦵 Desarme Auto🦵: ON"
    else
        botao.Text = "🦵 Desarme Auto 🦵:[OFF]"
        botao.BackgroundColor3 = Color3.fromRGB(60, 120, 220)
        statusLabel.Text = "Desarme Auto: OFF"
    end
end)

-- Botão Anti-Pulo
criarBotao("🚫 Anti-Pulo 🚫", Color3.fromRGB(200, 80, 80), 120, function(botao)
    antPuloAtivo = not antPuloAtivo
    if antPuloAtivo then
        botao.Text = "✅️ Anti-Pulo [ON] ✅️"
        botao.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
    else
        botao.Text = "🚫 Anti-Pulo [OFF] 🚫"
        botao.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = 50
        end
    end
end)

-- Botão de Velocidade
criarBotao("⚡️ Boost Velocidade ⚡️", Color3.fromRGB(200, 160, 60), 170, function(botao)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = velocidade
    end
end)

-- Botão TP Tool
criarBotao("🌀 TP Tool 🌀", Color3.fromRGB(120, 60, 200), 220, function(botao)
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "TP Tool"

    tool.Activated:Connect(function()
        local mouse = player:GetMouse()
        if mouse.Hit then
            player.Character:MoveTo(mouse.Hit.p)
        end
    end)

    tool.Parent = player.Backpack
end)

-- Botão Fechar/Abrir Menu
local menuAtivo = true
criarBotao("❌️ Mostrar/Ocultar Menu ❌️", Color3.fromRGB(100, 100, 100), 270, function(botao)
    menuAtivo = not menuAtivo
    frame.Visible = menuAtivo
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "O Bugador💯",
   Callback = function()
   -- The function that takes place when the button is pressed
      --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- 💯 O Bugador
-- Delta Brookhaven RP - Script Completo
-- Funcionalidades: Atravessar jogadores, Desarme Auto, Anti Pulo, FPS Boost, Otimização bola, Painel arrastável

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Referências do personagem
local Character, Humanoid, RootPart
local function UpdateChar()
    Character = LocalPlayer.Character
    if Character then
        Humanoid = Character:FindFirstChildOfClass("Humanoid")
        RootPart = Character:FindFirstChild("HumanoidRootPart")
    end
end
UpdateChar()
LocalPlayer.CharacterAdded:Connect(UpdateChar)

-- Referência da bola
local Ball = workspace:FindFirstChild("SoccerBall") or workspace:FindFirstChild("Football")

-- Configurações
local Settings = {
    PainelAberto = true,
    Atravessar = false,
    AntiPulo = false,
    DesarmeAuto = false,
    BolaChiclete = false,
    FPSBoost = true,
    PingReducer = true
}

-- Função para atravessar jogadores rastrejando (exceto você e a bola)
local function AtravessarJogadores()
    if not RootPart then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, part in pairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not Settings.Atravessar
                end
            end
        end
    end
end

-- Função Desarme Auto (Reach Auto)
local function DesarmeAutoFunc()
    if not Settings.DesarmeAuto or not Ball or not RootPart then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude
            if dist < 8 then
                -- Move a bola próximo ao jogador automaticamente
                Ball.CFrame = CFrame.new(RootPart.Position + Vector3.new(0, 0, 2))
            end
        end
    end
end

-- FPS Boost
if Settings.FPSBoost then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
end

-- Ping Reducer (fake para otimizar física e colisão)
local function OptimizePing(state)
    if state then
        settings().Physics.AllowSleep = false
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    end
end
OptimizePing(Settings.PingReducer)

-- Criar GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "OBugadorScript"

-- Painel principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 240, 0, 280)
MainFrame.Position = UDim2.new(0.05,0,0.2,0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = Settings.PainelAberto

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1,0,0,35)
Title.Position = UDim2.new(0,0,0,0)
Title.BackgroundColor3 = Color3.fromRGB(50,50,50)
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Text = "💯 O Bugador"

-- Função para criar botões
local function CreateButton(nome, yPos, callback)
    local Btn = Instance.new("TextButton", MainFrame)
    Btn.Size = UDim2.new(0.9,0,0,30)
    Btn.Position = UDim2.new(0.05,0,0,35 + yPos)
    Btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 16
    Btn.Text = nome.." [OFF]"
    Btn.MouseButton1Click:Connect(function()
        Settings[nome] = not Settings[nome]
        Btn.Text = nome.." ["..(Settings[nome] and "ON" or "OFF").."]"
        callback(Settings[nome])
    end)
end

-- Botões do painel
CreateButton("Atravessar",0,function() end)
CreateButton("DesarmeAuto",40,function() end)
CreateButton("AntiPulo",80,function(state)
    if Humanoid then Humanoid.JumpPower = state and 0 or 50 end
end)
CreateButton("BolaChiclete",120,function(state) end)
CreateButton("FPSBoost",160,function(state) end)
CreateButton("PingReducer",200,function(state) OptimizePing(state) end)

-- Botão flutuante abrir/fechar painel
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0,150,0,35)
ToggleBtn.Position = UDim2.new(0.05,0,0.1,0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(100,100,100)
ToggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 16
ToggleBtn.Text = "Abrir/Fechar Painel"
ToggleBtn.MouseButton1Click:Connect(function()
    Settings.PainelAberto = not Settings.PainelAberto
    MainFrame.Visible = Settings.PainelAberto
end)

-- Abrir/fechar painel com tecla P
UserInputService.InputBegan:Connect(function(input,gp)
    if not gp and input.KeyCode == Enum.KeyCode.P then
        Settings.PainelAberto = not Settings.PainelAberto
        MainFrame.Visible = Settings.PainelAberto
    end
end)

-- Loop principal
RunService.RenderStepped:Connect(function()
    if Settings.Atravessar then AtravessarJogadores() end
    if Settings.DesarmeAuto then DesarmeAutoFunc() end
end)
   end,
})

local Section = MainTab:CreateSection("Scripts Alternativos🌀")

local Button = MainTab:CreateButton({
   Name = "Infinite Yield👁",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Cartola Hub🎩",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))() 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Coquette Hub🎀",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Drip Client💜",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://raw.githubusercontent.com/realgengar/Main/refs/heads/main/base.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Nytherune Hub👹",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Nytherune-Hub-43881"))()
   end,
})

local OutrosTab = Window:CreateTab("Outros🎲", 0) -- Title, Image
local Section = OutrosTab:CreateSection("Ajudas Para Juizes🟥")

local Button = OutrosTab:CreateButton({
   Name = "Ver Onde Os Jogadores Estão🕶",
   Callback = function()
   -- The function that takes place when the button is pressed
      local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESP = {}

-- Helper: Create Drawing object for lines
local function createLine()
	local line = Drawing.new("Line")
	line.Thickness = 1.5
	line.Color = Color3.new(1, 1, 1)
	line.Visible = false
	return line
end

-- Create ESP visuals for a player
local function setupESP(player)
	if player == LocalPlayer then return end

	local function onCharacterAdded(char)
		local humanoid = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 5)
		if not humanoid then return end

		local rigType = humanoid.RigType
		local highlight = Instance.new("Highlight")
		highlight.Adornee = char
		highlight.FillTransparency = 1
		highlight.OutlineColor = Color3.new(1, 0, 0)
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Parent = game.CoreGui

		-- Name tag with light red color
		local nameTag = Drawing.new("Text")
		nameTag.Size = 14
		nameTag.Center = true
		nameTag.Outline = true
		nameTag.Color = Color3.fromRGB(255, 125, 125) -- light red
		nameTag.Visible = false

		-- Distance tag
		local distanceTag = Drawing.new("Text")
		distanceTag.Size = 13
		distanceTag.Center = true
		distanceTag.Outline = true
		distanceTag.Color = Color3.new(0.6, 0.6, 0.6)
		distanceTag.Visible = false

		-- Skeleton lines
		local skeletonLines = {}

		local bonePairs = {}
		if rigType == Enum.HumanoidRigType.R15 then
			bonePairs = {
				-- spine
				{"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
				-- left arm
				{"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
				-- right arm
				{"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
				-- left leg
				{"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
				-- right leg
				{"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
			}
		else -- R6
			bonePairs = {
				{"Head", "Torso"},
				{"Torso", "Left Arm"}, {"Left Arm", "Left Leg"},
				{"Torso", "Right Arm"}, {"Right Arm", "Right Leg"},
			}
		end

		for _, pair in ipairs(bonePairs) do
			local id = table.concat(pair, "_")
			skeletonLines[id] = createLine()
		end

		ESP[player] = {
			Highlight = highlight,
			Name = nameTag,
			Distance = distanceTag,
			Skeleton = skeletonLines,
			BonePairs = bonePairs,
			Character = char,
		}
	end

	if player.Character then
		onCharacterAdded(player.Character)
	end
	player.CharacterAdded:Connect(onCharacterAdded)
end

local function removeESP(player)
	local data = ESP[player]
	if data then
		if data.Highlight then data.Highlight:Destroy() end
		if data.Name then data.Name:Remove() end
		if data.Distance then data.Distance:Remove() end
		for _, line in pairs(data.Skeleton or {}) do
			line:Remove()
		end
		ESP[player] = nil
	end
end

for _, player in ipairs(Players:GetPlayers()) do
	setupESP(player)
end
Players.PlayerAdded:Connect(setupESP)
Players.PlayerRemoving:Connect(removeESP)

local function drawLine(from, to, line)
	if from and to then
		local p1, on1 = Camera:WorldToViewportPoint(from.Position)
		local p2, on2 = Camera:WorldToViewportPoint(to.Position)
		if on1 and on2 then
			line.From = Vector2.new(p1.X, p1.Y)
			line.To = Vector2.new(p2.X, p2.Y)
			line.Visible = true
			return
		end
	end
	line.Visible = false
end

RunService.RenderStepped:Connect(function()
	for player, data in pairs(ESP) do
		local char = data.Character
		if not char then continue end

		local head = char:FindFirstChild("Head")
		local hrp = char:FindFirstChild("HumanoidRootPart")

		if head and hrp then
			local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
			if onScreen then
				local dist = math.floor((Camera.CFrame.Position - hrp.Position).Magnitude)
				data.Name.Text = player.Name
				data.Name.Position = Vector2.new(screenPos.X, screenPos.Y - 20)
				data.Name.Visible = true

				data.Distance.Text = tostring(dist) .. " studs"
				data.Distance.Position = Vector2.new(screenPos.X, screenPos.Y - 5)
				data.Distance.Visible = true
			else
				data.Name.Visible = false
				data.Distance.Visible = false
			end
		end

		-- Draw valid bone lines
		for _, pair in ipairs(data.BonePairs) do
			local part1 = char:FindFirstChild(pair[1])
			local part2 = char:FindFirstChild(pair[2])
			local line = data.Skeleton[table.concat(pair, "_")]
			drawLine(part1, part2, line)
		end
	end
end)
   end,
})

local Button = OutrosTab:CreateButton({
   Name = "Ver Hitbox Dos Jogadores👀",
   Callback = function()
   -- The function that takes place when the button is pressed
      -- Roblox LocalScript: Exibir hitbox dos jogadores (exceto o próprio), mesmo após reset

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Adiciona o BoxHandleAdornment ao HumanoidRootPart de um Character
local function showHitbox(character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        if character == LocalPlayer.Character then return end -- Não mostra a própria hitbox
        if character.HumanoidRootPart:FindFirstChild("HitboxAdornment") then return end -- Evita duplicatas
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "HitboxAdornment"
        box.Size = character.HumanoidRootPart.Size
        box.Adornee = character.HumanoidRootPart
        box.AlwaysOnTop = true
        box.ZIndex = 1
        box.Color3 = Color3.new(1, 0, 0)
        box.Transparency = 0.5
        box.Parent = character.HumanoidRootPart
    end
end

-- Remove o adornment (caso precise)
local function removeHitbox(character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local box = character.HumanoidRootPart:FindFirstChild("HitboxAdornment")
        if box then box:Destroy() end
    end
end

-- Atualiza hitboxes de todos os jogadores
local function updateHitboxes()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            showHitbox(player.Character)
        end
    end
end

-- Aplica hitbox quando algum jogador respawnar
local function onPlayerAdded(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(character)
        showHitbox(character)
    end)
end

-- Inicializa para todos jogadores atuais
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Se algum character desaparecer, remove o hitbox
Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        removeHitbox(player.Character)
    end
end)

-- Checa a cada frame se há hitboxes faltando (caso dê reset)
RunService.RenderStepped:Connect(updateHitboxes)
   end,
})

local Button = OutrosTab:CreateButton({
   Name = "Detectar Reach🚨",
   Callback = function()
   -- The function that takes place when the button is pressed
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local BROOKHAVEN_SIZE = Vector3.new(2, 2, 1) -- Valor padrão do Brookhaven

local detectionCounts = {2}

local function notify(player, actualSize)
    StarterGui:SetCore("SendNotification", {
        Title = "Reach Anômalo!",
        Text = string.format("%s está com reach maior que o normal! (%.1f, %.1f, %.1f)", player.Name, actualSize.X, actualSize.Y, actualSize.Z),
        Duration = 2.5
    })
    print(string.format("Aviso: %s com hitbox %.1f, %.1f, %.1f", player.Name, actualSize.X, actualSize.Y, actualSize.Z))
end

local function checkHitboxes()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local sz = hrp.Size
                if sz.X > BROOKHAVEN_SIZE.X or sz.Y > BROOKHAVEN_SIZE.Y or sz.Z > BROOKHAVEN_SIZE.Z then
                    detectionCounts[player] = (detectionCounts[player] or 0) + 1
                    if detectionCounts[player] == 2 then
                        notify(player, sz)
                    end
                else
                    detectionCounts[player] = 0
                end
            end
        end
    end
end

while true do
    checkHitboxes()
    task.wait(1)
end
   end,
})

local Button = OutrosTab:CreateButton({
   Name = "Detectar Speed🏃‍♂️",
   Callback = function()
   -- The function that takes place when the button is pressed
      -- LocalScript: Notifica apenas VOCÊ se outro jogador estiver com velocidade acima de 23 após 2 checagens consecutivas.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local SPEED_LIMIT = 23
local detectionCounts = {}

local function notify(player, speed)
    StarterGui:SetCore("SendNotification", {
        Title = "Velocidade Anômala!",
        Text = string.format("%s está com velocidade acima do notmal! (%.1f)", player.Name, speed),
        Duration = 2.5
    })
    print(string.format("Aviso: %s com velocidade %.1f", player.Name, speed))
end

local function resetCount(player)
    detectionCounts[player] = 0
end

-- Função principal de checagem
local function checkSpeeds()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local speed = humanoid.WalkSpeed
                    if speed > SPEED_LIMIT then
                        detectionCounts[player] = (detectionCounts[player] or 0) + 1
                        if detectionCounts[player] == 2 then
                            notify(player, speed)
                        end
                    else
                        resetCount(player)
                    end
                else
                    resetCount(player)
                end
            else
                resetCount(player)
            end
        end
    end
end

Players.PlayerRemoving:Connect(function(player)
    detectionCounts[player] = nil
end)

while true do
    checkSpeeds()
    task.wait(1)
end
   end,
})

local Button = OutrosTab:CreateButton({
   Name = "Fly🍃 (Use para ver o jogo e não atrapalhar os jogadores!)",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

local Section = OutrosTab:CreateSection("Outras Coisas")

local Button = OutrosTab:CreateButton({
   Name = "Bater Uma💦",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
   end,
})

local Button = OutrosTab:CreateButton({
   Name = "Pulo Infinito♾️",
   Callback = function()
   -- The function that takes place when the button is pressed
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
   end,
})

local Button = OutrosTab:CreateButton({
   Name = "C00lkid Gui🍭",
   Callback = function()
   -- The function that takes place when the button is pressed
      loadstring(game:HttpGet("https://pastebin.com/raw/14EU4i8n",true))()
   end,
})