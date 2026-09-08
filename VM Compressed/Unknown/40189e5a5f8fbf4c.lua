--// XIT AURA SELECTOR - Versión pequeña para móviles (Actualizable)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

if _G.XitAuraSelectorLoaded then
    game.StarterGui:SetCore("SendNotification", {Title = "XIT AURA", Text = "El selector ya está cargado", Duration = 4})
    return
end
_G.XitAuraSelectorLoaded = true

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "XitSelector"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

local function toggleBlur(enabled)
	TweenService:Create(blur, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Size = enabled and 24 or 0}):Play()
end

-- Icono flotante movible
local iconButton = Instance.new("ImageButton")
iconButton.Size = UDim2.new(0, 65, 0, 65)  -- un poco más pequeño también
iconButton.Position = UDim2.new(0.02, 0, 0.35, 0)
iconButton.BackgroundTransparency = 1
iconButton.Image = "rbxassetid://130129023609172"
iconButton.Parent = screenGui
Instance.new("UICorner", iconButton).CornerRadius = UDim.new(1, 0)

local iconStroke = Instance.new("UIStroke", iconButton)
iconStroke.Thickness = 3.5
iconStroke.Color = Color3.fromRGB(130, 200, 255)

-- Drag solo del icono
local dragging, dragStart, startPos
iconButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = iconButton.Position
	end
end)
iconButton.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		iconButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
iconButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- Panel más pequeño para celulares
local mainPanel = Instance.new("Frame")
mainPanel.Size = UDim2.new(0, 0, 0, 0)
mainPanel.Position = UDim2.new(0.5, 0, 0.5, 0)
mainPanel.AnchorPoint = Vector2.new(0.5, 0.5)
mainPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 35)
mainPanel.BackgroundTransparency = 0.08
mainPanel.Visible = false
mainPanel.Parent = screenGui

Instance.new("UICorner", mainPanel).CornerRadius = UDim.new(0, 22)

local panelStroke = Instance.new("UIStroke", mainPanel)
panelStroke.Thickness = 3

-- Rainbow stroke
task.spawn(function()
	while true do
		for i = 0, 1, 0.008 do
			panelStroke.Color = Color3.fromHSV(i, 1, 1)
			task.wait(0.02)
		end
	end
end)

-- Título más compacto
local title = Instance.new("TextLabel", mainPanel)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "XIT AURA SELECTOR"
title.TextColor3 = Color3.fromRGB(220, 160, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24

local subtitle = Instance.new("TextLabel", mainPanel)
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.Position = UDim2.new(0, 0, 0, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Elige tu versión"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 255)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 16

-- Contenedor
local buttonContainer = Instance.new("Frame", mainPanel)
buttonContainer.Size = UDim2.new(0.88, 0, 0.58, 0)
buttonContainer.Position = UDim2.new(0.06, 0, 0.33, 0)
buttonContainer.BackgroundTransparency = 1
Instance.new("UIListLayout", buttonContainer).Padding = UDim.new(0, 14)

local alreadyLoaded = false

local function createButton(text, color, url)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 62)  -- más pequeño
	btn.BackgroundColor3 = color
	btn.Text = text
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 21
	btn.Parent = buttonContainer
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 30)

	btn.MouseButton1Click:Connect(function()
		if alreadyLoaded then return end
		alreadyLoaded = true

		toggleBlur(false)
		TweenService:Create(mainPanel, TweenInfo.new(0.45), {Size = UDim2.new(0,0,0,0)}):Play()
		task.wait(0.5)

		game.StarterGui:SetCore("SendNotification", {
			Title = "XIT AURA",
			Text = "Cargando " .. text .. " ✓",
			Duration = 5
		})

		screenGui:Destroy()
		task.wait(3)
		loadstring(game:HttpGet(url))()
	end)
end

createButton("XIT AURA V1", Color3.fromRGB(70, 40, 140), "https://pastebin.com/raw/7kYjxEWt")
createButton("XIT AURA V2", Color3.fromRGB(110, 40, 190), "https://pastebin.com/raw/fWDKggPp")

-- Botón Actualizar Todo (fijo)
local updateBtn = Instance.new("TextButton")
updateBtn.Size = UDim2.new(1, 0, 0, 62)
updateBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 40)
updateBtn.Text = "Actualizar Todo (V1 + V2 + Selector)"
updateBtn.TextColor3 = Color3.new(1,1,1)
updateBtn.Font = Enum.Font.GothamBold
updateBtn.TextSize = 20
updateBtn.Parent = buttonContainer
Instance.new("UICorner", updateBtn).CornerRadius = UDim.new(0, 30)

updateBtn.MouseButton1Click:Connect(function()
	if alreadyLoaded then return end
	alreadyLoaded = true

	toggleBlur(false)
	TweenService:Create(mainPanel, TweenInfo.new(0.45), {Size = UDim2.new(0,0,0,0)}):Play()
	task.wait(0.5)

	game.StarterGui:SetCore("SendNotification", {
		Title = "✅ Actualizado",
		Text = "V1, V2 y Selector actualizados",
		Duration = 6
	})

	screenGui:Destroy()
	print("✅ XIT AURA - Todo actualizado")
end)

-- Abrir/Cerrar panel
iconButton.MouseButton1Click:Connect(function()
	if mainPanel.Visible then
		toggleBlur(false)
		TweenService:Create(mainPanel, TweenInfo.new(0.4), {Size = UDim2.new(0,0,0,0)}):Play()
		task.wait(0.45)
		mainPanel.Visible = false
	else
		mainPanel.Visible = true
		toggleBlur(true)
		TweenService:Create(mainPanel, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 360, 0, 460)}):Play()
	end
end)
