-- Servicios
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Destruir interfaz previa si existe
if playerGui:FindFirstChild("FlotsAnnouncementGui") then
	playerGui.FlotsAnnouncementGui:Destroy()
end

-- ScreenGui Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlotsAnnouncementGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Frame Principal (Inicio en Posición Baja y Transparente)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 450, 0, 260)
mainFrame.Position = UDim2.new(0.5, -225, 1, 50) -- Abajo fuera de pantalla
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiCornerMain = Instance.new("UICorner")
uiCornerMain.CornerRadius = UDim.new(0, 14)
uiCornerMain.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(40, 40, 40)
uiStroke.Thickness = 1.5
uiStroke.Transparency = 1
uiStroke.Parent = mainFrame

-- Botón de Cerrar (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -38, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
closeButton.BackgroundTransparency = 1
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(180, 180, 180)
closeButton.TextTransparency = 1
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.AutoButtonColor = true
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Título Rojo
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -80, 0, 40)
titleLabel.Position = UDim2.new(0, 20, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = ""
titleLabel.TextColor3 = Color3.fromRGB(235, 45, 45)
titleLabel.TextTransparency = 0
titleLabel.TextSize = 22
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

-- Separador Visual
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.new(0, 20, 0, 55)
divider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
divider.BackgroundTransparency = 1
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- Descripción
local descLabel = Instance.new("TextLabel")
descLabel.Name = "DescLabel"
descLabel.Size = UDim2.new(1, -40, 0, 110)
descLabel.Position = UDim2.new(0, 20, 0, 68)
descLabel.BackgroundTransparency = 1
descLabel.Text = ""
descLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
descLabel.TextTransparency = 0
descLabel.TextSize = 14
descLabel.Font = Enum.Font.Gotham
descLabel.TextWrapped = true
descLabel.TextYAlignment = Enum.TextYAlignment.Top
descLabel.Parent = mainFrame

-- Botón "Ejecutar Nuevo Script"
local execButton = Instance.new("TextButton")
execButton.Name = "ExecButton"
execButton.Size = UDim2.new(1, -40, 0, 42)
execButton.Position = UDim2.new(0, 20, 1, -57)
execButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
execButton.BackgroundTransparency = 1
execButton.BorderSizePixel = 0
execButton.Text = "Ejecutar Nuevo Script"
execButton.TextColor3 = Color3.fromRGB(255, 255, 255)
execButton.TextTransparency = 1
execButton.TextSize = 14
execButton.Font = Enum.Font.GothamMedium
execButton.AutoButtonColor = true
execButton.Parent = mainFrame

local uiCornerButton = Instance.new("UICorner")
uiCornerButton.CornerRadius = UDim.new(0, 8)
uiCornerButton.Parent = execButton

local buttonStroke = Instance.new("UIStroke")
buttonStroke.Color = Color3.fromRGB(50, 50, 50)
buttonStroke.Thickness = 1
buttonStroke.Transparency = 1
buttonStroke.Parent = execButton

-- Función de Efecto Tipo Máquina de Escribir (Typewriter)
local function typeWrite(textLabel, text, speed)
	for i = 1, #text do
		textLabel.Text = string.sub(text, 1, i)
		task.wait(speed or 0.03)
	end
end

-- ANIMACIÓN DE ENTRADA
local targetPosition = UDim2.new(0.5, -225, 0.5, -130)
local tweenInfoEntry = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

TweenService:Create(mainFrame, tweenInfoEntry, {Position = targetPosition, BackgroundTransparency = 0}):Play()
TweenService:Create(uiStroke, tweenInfoEntry, {Transparency = 0}):Play()
TweenService:Create(closeButton, tweenInfoEntry, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(divider, tweenInfoEntry, {BackgroundTransparency = 0}):Play()
TweenService:Create(execButton, tweenInfoEntry, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(buttonStroke, tweenInfoEntry, {Transparency = 0}):Play()

-- Secuencia de Escritura Paso a Paso
task.spawn(function()
	task.wait(0.5)
	
	-- 1. Escribir Título
	typeWrite(titleLabel, "Flots Scripts Oficial", 0.04)
	
	-- Iniciar Parpadeo del Título una vez escrito
	local pulseInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
	TweenService:Create(titleLabel, pulseInfo, {TextTransparency = 0.65}):Play()
	
	task.wait(0.2)
	
	-- 2. Escribir Descripción
	local fullDesc = "Ya no ofrecemos servicio a esta versión de Scripts underground war 2.0.\n\nSe actualizó el script de Flots Scripts Oficial de underground war 2.0 a la versión 2.1."
	typeWrite(descLabel, fullDesc, 0.02)
end)

-- Lógica del Botón Ejecutar Nuevo Script
execButton.MouseButton1Click:Connect(function()
	-- Eliminar la interfaz actual de inmediato
	screenGui:Destroy()
	
	-- Ejecutar el nuevo script
	task.spawn(function()
		loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/7ae94d917839763e6668be4107090ee1cfdc3c3e22a3e6915e3bfbb5be867f91.lua"))()
	end)
end)

-- Lógica para la Ventana de Agradecimiento de 5 Segundos al Cerrar con la X
closeButton.MouseButton1Click:Connect(function()
	mainFrame:Destroy()

	-- Crear Ventana de Agradecimiento
	local thanksFrame = Instance.new("Frame")
	thanksFrame.Name = "ThanksFrame"
	thanksFrame.Size = UDim2.new(0, 380, 0, 100)
	thanksFrame.Position = UDim2.new(0.5, -190, 0.5, -50)
	thanksFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	thanksFrame.BorderSizePixel = 0
	thanksFrame.Parent = screenGui

	local thanksCorner = Instance.new("UICorner")
	thanksCorner.CornerRadius = UDim.new(0, 12)
	thanksCorner.Parent = thanksFrame

	local thanksStroke = Instance.new("UIStroke")
	thanksStroke.Color = Color3.fromRGB(40, 40, 40)
	thanksStroke.Thickness = 1.5
	thanksStroke.Parent = thanksFrame

	local thanksLabel = Instance.new("TextLabel")
	thanksLabel.Size = UDim2.new(1, -20, 1, -20)
	thanksLabel.Position = UDim2.new(0, 10, 0, 10)
	thanksLabel.BackgroundTransparency = 1
	thanksLabel.Text = "Muchas gracias por usar Flots Scripts"
	thanksLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	thanksLabel.TextSize = 16
	thanksLabel.Font = Enum.Font.GothamBold
	thanksLabel.TextWrapped = true
	thanksLabel.Parent = thanksFrame

	-- Conteo regresivo de 5 segundos
	task.spawn(function()
		for i = 5, 1, -1 do
			thanksLabel.Text = "Muchas gracias por usar Flots Scripts\n\n(Cerrando en " .. i .. "s)"
			task.wait(1)
		end
		screenGui:Destroy()
	end)
end)
