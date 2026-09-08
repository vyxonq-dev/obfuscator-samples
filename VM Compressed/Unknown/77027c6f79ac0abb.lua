--// Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Variáveis
local teleportSpeed = 500
local dashSpeed = 500

--// GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlaneHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

--// Mensagem de boas-vindas
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Size = UDim2.new(0,350,0,120)
welcomeFrame.Position = UDim2.new(0.5,0,0.5,0)
welcomeFrame.AnchorPoint = Vector2.new(0.5,0.5)
welcomeFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
welcomeFrame.BorderSizePixel = 1
welcomeFrame.BorderColor3 = Color3.fromRGB(255,255,255)
welcomeFrame.Parent = screenGui

local welcomeText = Instance.new("TextLabel")
welcomeText.Size = UDim2.new(1,-20,0,80)
welcomeText.Position = UDim2.new(0,10,0,10)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "Obrigado por acessar o Plane Hub🛡️!!\nCriador do hubb: @Denolk_new⚔️"
welcomeText.TextColor3 = Color3.fromRGB(255,255,255)
welcomeText.Font = Enum.Font.SourceSansBold
welcomeText.TextSize = 20
welcomeText.TextWrapped = true
welcomeText.Parent = welcomeFrame

local countdownLabel = Instance.new("TextLabel")
countdownLabel.Size = UDim2.new(1,-20,0,20)
countdownLabel.Position = UDim2.new(0,10,0,90)
countdownLabel.BackgroundTransparency = 1
countdownLabel.TextColor3 = Color3.fromRGB(255,255,255)
countdownLabel.Font = Enum.Font.SourceSansBold
countdownLabel.TextSize = 18
countdownLabel.Text = "5"
countdownLabel.Parent = welcomeFrame

--// Menu principal
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0,400,0,320)
menuFrame.Position = UDim2.new(0.5,0,0.5,0)
menuFrame.AnchorPoint = Vector2.new(0.5,0.5)
menuFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
menuFrame.BorderSizePixel = 1
menuFrame.BorderColor3 = Color3.fromRGB(255,255,255)
menuFrame.Active = true
menuFrame.Draggable = true
menuFrame.Visible = false
menuFrame.Parent = screenGui

--// Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1,-20,0,40)
titleLabel.Position = UDim2.new(0,10,0,10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "✈️ Plane Hub🛡️"
titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 28
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = menuFrame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1,-20,0,20)
subtitleLabel.Position = UDim2.new(0,10,0,50)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "by @Denolk_new // Build a Plane // versão 1.0"
subtitleLabel.TextColor3 = Color3.fromRGB(200,200,200)
subtitleLabel.Font = Enum.Font.SourceSans
subtitleLabel.TextSize = 14
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = menuFrame

--// Botão X (deletar hub)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,30,0,30)
closeButton.Position = UDim2.new(1,-40,0,10)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.Parent = menuFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

--// Botão - (minimizar)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0,30,0,30)
minimizeButton.Position = UDim2.new(1,-80,0,10)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255,255,255)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 20
minimizeButton.Parent = menuFrame

--// Botão abrir ✈️
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0,50,0,50)
openButton.Position = UDim2.new(0.1,0,0.5,0)
openButton.AnchorPoint = Vector2.new(0.5,0.5)
openButton.Text = "✈️"
openButton.TextSize = 24
openButton.TextColor3 = Color3.fromRGB(255,255,255)
openButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
openButton.BorderSizePixel = 1
openButton.BorderColor3 = Color3.fromRGB(255,255,255)
openButton.Active = true
openButton.Draggable = true
openButton.Visible = false
openButton.Parent = screenGui

--// Animação abrir/fechar menu
local function animateOpen()
    menuFrame.Visible = true
    menuFrame.Size = UDim2.new(0,0,0,0)
    local tween = TweenService:Create(menuFrame,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,400,0,320)})
    tween:Play()
end

local function animateClose()
    local tween = TweenService:Create(menuFrame,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0)})
    tween:Play()
    tween.Completed:Connect(function()
        menuFrame.Visible = false
        openButton.Visible = true
    end)
end

openButton.MouseButton1Click:Connect(function()
    openButton.Visible = false
    animateOpen()
end)

minimizeButton.MouseButton1Click:Connect(function()
    animateClose()
end)

--// Funções (Subir e Dash)
local function teleportUp()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0,teleportSpeed,0)
    end
end

local function dashForward()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local forward = char.HumanoidRootPart.CFrame.LookVector * dashSpeed
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + forward
    end
end

--// Botões flutuantes
local upButton = Instance.new("TextButton")
upButton.Size = UDim2.new(0,80,0,40)
upButton.Position = UDim2.new(0.8,0,0.7,0)
upButton.Text = "⬆️ Subir"
upButton.TextSize = 18
upButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
upButton.TextColor3 = Color3.fromRGB(255,255,255)
upButton.Parent = screenGui
upButton.MouseButton1Click:Connect(teleportUp)

local dashButton = Instance.new("TextButton")
dashButton.Size = UDim2.new(0,80,0,40)
dashButton.Position = UDim2.new(0.8,0,0.8,0)
dashButton.Text = "➡️ Dash"
dashButton.TextSize = 18
dashButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
dashButton.TextColor3 = Color3.fromRGB(255,255,255)
dashButton.Parent = screenGui
dashButton.MouseButton1Click:Connect(dashForward)

--// Opção esconder/mostrar botões
local hideButtonsMenu = Instance.new("TextButton")
hideButtonsMenu.Size = UDim2.new(0,160,0,30)
hideButtonsMenu.Position = UDim2.new(0,10,0,80)
hideButtonsMenu.Text = "Esconder botões"
hideButtonsMenu.BackgroundColor3 = Color3.fromRGB(40,40,40)
hideButtonsMenu.TextColor3 = Color3.fromRGB(255,255,255)
hideButtonsMenu.Parent = menuFrame
hideButtonsMenu.MouseButton1Click:Connect(function()
    upButton.Visible = false
    dashButton.Visible = false
end)

local showButtonsMenu = Instance.new("TextButton")
showButtonsMenu.Size = UDim2.new(0,160,0,30)
showButtonsMenu.Position = UDim2.new(0,10,0,120)
showButtonsMenu.Text = "Mostrar botões"
showButtonsMenu.BackgroundColor3 = Color3.fromRGB(40,40,40)
showButtonsMenu.TextColor3 = Color3.fromRGB(255,255,255)
showButtonsMenu.Parent = menuFrame
showButtonsMenu.MouseButton1Click:Connect(function()
    upButton.Visible = true
    dashButton.Visible = true
end)

--// Inputs de velocidade
local teleportSpeedInput = Instance.new("TextBox")
teleportSpeedInput.Size = UDim2.new(0,100,0,30)
teleportSpeedInput.Position = UDim2.new(0,10,0,160)
teleportSpeedInput.PlaceholderText = "Velocidade Subir"
teleportSpeedInput.Text = tostring(teleportSpeed)
teleportSpeedInput.BackgroundColor3 = Color3.fromRGB(50,50,50)
teleportSpeedInput.TextColor3 = Color3.fromRGB(255,255,255)
teleportSpeedInput.Parent = menuFrame
teleportSpeedInput.FocusLost:Connect(function()
    teleportSpeed = tonumber(teleportSpeedInput.Text) or teleportSpeed
end)

local dashSpeedInput = Instance.new("TextBox")
dashSpeedInput.Size = UDim2.new(0,100,0,30)
dashSpeedInput.Position = UDim2.new(0,10,0,200)
dashSpeedInput.PlaceholderText = "Velocidade Dash"
dashSpeedInput.Text = tostring(dashSpeed)
dashSpeedInput.BackgroundColor3 = Color3.fromRGB(50,50,50)
dashSpeedInput.TextColor3 = Color3.fromRGB(255,255,255)
dashSpeedInput.Parent = menuFrame
dashSpeedInput.FocusLost:Connect(function()
    dashSpeed = tonumber(dashSpeedInput.Text) or dashSpeed
end)

--// Botão Money inf (novo script)
local moneyButton = Instance.new("TextButton")
moneyButton.Size = UDim2.new(0,160,0,30)
moneyButton.Position = UDim2.new(0,10,0,240)
moneyButton.Text = "💰 Money inf"
moneyButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
moneyButton.TextColor3 = Color3.fromRGB(0,255,0)
moneyButton.Parent = menuFrame
moneyButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/UPD-Build-A-Plane-money-dupe-51267"))()
end)

--// Timer inicial
spawn(function()
    for i = 5,0,-1 do
        countdownLabel.Text = tostring(i)
        wait(1)
    end
    welcomeFrame:Destroy()
    animateOpen()
end)