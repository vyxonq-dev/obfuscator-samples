-- Velocity + Noclip Controller PRO - Enhanced Fixed
-- Correções: drag/pos jump, dock open, notificações bottom-right, clamp robusto

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- Vars
local velocidadeAtiva = false
local noclipAtivo = false
local velocidadeDesejada = 50
local conexaoVel = nil
local conexaoNoclip = nil
local minimizado = false

-- UTIL: pega viewport atual (atualiza dinamicamente)
local function getViewport()
    local cam = workspace.CurrentCamera
    if cam then
        return cam.ViewportSize
    end
    return Vector2.new(1920, 1080)
end

-- INITIAL POSITIONS (centrado)
local viewport = getViewport()
local mainWidth, mainHeight = 380, 400
local startMainX = math.floor((viewport.X - mainWidth) / 2)
local startMainY = math.floor((viewport.Y - mainHeight) / 2)
local lastMainPos = UDim2.new(0, startMainX, 0, startMainY)

local dockSize = 60
local startDockX = viewport.X - dockSize - 20
local startDockY = 20
local lastDockPos = UDim2.new(0, startDockX, 0, startDockY)

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VelocityNoclipPRO"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Loading (kept simple)
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

local loadingGradient = Instance.new("UIGradient")
loadingGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 100, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 40, 80))
}
loadingGradient.Rotation = 45
loadingGradient.Parent = loadingFrame

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0, 500, 0, 100)
loadingText.Position = UDim2.new(0.5, -250, 0.5, -50)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Velocity + Noclip PRO"
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Font = Enum.Font.GothamBlack
loadingText.TextSize = 44
loadingText.Parent = loadingFrame

task.wait(0.9)
loadingFrame:Destroy()

-- Tween util
local function tween(obj, props, time)
    local tw = TweenService:Create(obj, TweenInfo.new(time or 0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    tw:Play()
    return tw
end

-- Notification container (BOTTOM RIGHT)
local notificationContainer = Instance.new("Frame")
notificationContainer.Size = UDim2.new(0, 320, 0, 200) -- height ajustável
notificationContainer.Position = UDim2.new(1, -340, 1, -80) -- bottom-right margin
notificationContainer.AnchorPoint = Vector2.new(0, 1) -- anchor bottom-left of this frame (we'll stack bottom-up)
notificationContainer.BackgroundTransparency = 1
notificationContainer.Parent = screenGui
notificationContainer.ZIndex = 9999

local notificationLayout = Instance.new("UIListLayout")
notificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
notificationLayout.Padding = UDim.new(0, 8)
notificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom -- stack bottom -> up
notificationLayout.Parent = notificationContainer

-- showNotification: cria uma notificação (bottom-right)
local function showNotification(message)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 0, 0, 56)
    notif.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    notif.BorderSizePixel = 0
    notif.AnchorPoint = Vector2.new(0, 1)
    notif.Parent = notificationContainer
    notif.ZIndex = 10000

    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 12)
    notifCorner.Parent = notif

    local notifStroke = Instance.new("UIStroke")
    notifStroke.Color = Color3.fromRGB(70, 100, 180)
    notifStroke.Thickness = 1.2
    notifStroke.Transparency = 1
    notifStroke.Parent = notif

    local notifText = Instance.new("TextLabel")
    notifText.Size = UDim2.new(1, -20, 1, 0)
    notifText.Position = UDim2.new(0, 10, 0, 0)
    notifText.BackgroundTransparency = 1
    notifText.Text = message
    notifText.TextColor3 = Color3.fromRGB(230, 230, 230)
    notifText.Font = Enum.Font.GothamSemibold
    notifText.TextSize = 15
    notifText.TextXAlignment = Enum.TextXAlignment.Left
    notifText.TextTransparency = 1
    notifText.Parent = notif
    notifText.ZIndex = notif.ZIndex + 1

    -- entry animation
    notif.BackgroundTransparency = 1
    tween(notif, {BackgroundTransparency = 0}, 0.28)
    tween(notifStroke, {Transparency = 0}, 0.28)
    tween(notifText, {TextTransparency = 0}, 0.28)

    -- auto remove
    task.delay(3, function()
        tween(notif, {BackgroundTransparency = 1}, 0.28)
        tween(notifStroke, {Transparency = 1}, 0.28)
        tween(notifText, {TextTransparency = 1}, 0.28)
        task.wait(0.32)
        if notif and notif.Parent then notif:Destroy() end
    end)
end

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, mainWidth, 0, mainHeight)
mainFrame.Position = lastMainPos
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
mainFrame.ZIndex = 50

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(70, 110, 200)
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

-- Shadow (image placeholder)
local mainShadow = Instance.new("ImageLabel")
mainShadow.Size = UDim2.new(1, 40, 1, 40)
mainShadow.Position = UDim2.new(0, -20, 0, -20)
mainShadow.BackgroundTransparency = 1
mainShadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
mainShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
mainShadow.ImageTransparency = 0.7
mainShadow.ScaleType = Enum.ScaleType.Slice
mainShadow.SliceCenter = Rect.new(10, 10, 118, 118)
mainShadow.ZIndex = 0
mainShadow.Parent = mainFrame

-- ---------- Drag mainFrame (USANDO ABSOLUTEPOS para evitar jump) ----------
local dragging = false
local dragStartPos = nil -- Vector2 start
local mainStartAbsPos = nil -- Vector2

local function clampMainPixelPos(px, py)
    local vp = getViewport()
    local maxX = math.max(0, vp.X - mainFrame.AbsoluteSize.X)
    local maxY = math.max(0, vp.Y - mainFrame.AbsoluteSize.Y)
    local nx = math.clamp(px, 0, maxX)
    local ny = math.clamp(py, 0, maxY)
    return nx, ny
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStartPos = input.Position
        -- use AbsolutePosition to avoid UDim2 scale issues
        mainStartAbsPos = Vector2.new(mainFrame.AbsolutePosition.X, mainFrame.AbsolutePosition.Y)
        -- capture
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStartPos
        local newX = mainStartAbsPos.X + delta.X
        local newY = mainStartAbsPos.Y + delta.Y
        newX, newY = clampMainPixelPos(newX, newY)
        mainFrame.Position = UDim2.new(0, math.floor(newX), 0, math.floor(newY))
        lastMainPos = mainFrame.Position
    end
end)

-- ensure dragging stops if mouse released anywhere
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
header.BorderSizePixel = 0
header.Parent = mainFrame
header.ZIndex = mainFrame.ZIndex + 1

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 18)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Text = "⚡ Universal Script ⚡"
title.Size = UDim2.new(1, -140, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(100, 160, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Minimizar
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 40, 0, 40)
minBtn.Position = UDim2.new(1, -95, 0, 10)
minBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
minBtn.Text = "−"
minBtn.TextColor3 = Color3.new(1, 1, 1)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 30
minBtn.BorderSizePixel = 0
minBtn.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 10)
minCorner.Parent = minBtn

-- Fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 70)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 28
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    -- Voltar velocidade para 16 e desligar noclip
    if velocidadeAtiva then
        if conexaoVel then 
            conexaoVel:Disconnect() 
            conexaoVel = nil
        end
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
        velocidadeAtiva = false
    end
    
    if noclipAtivo then
        if conexaoNoclip then 
            conexaoNoclip:Disconnect() 
            conexaoNoclip = nil
        end
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = true
                end
            end
        end
        noclipAtivo = false
    end
    
    -- Fechar a interface
    tween(mainFrame, {BackgroundTransparency = 1}, 0.25)
    task.wait(0.26)
    if screenGui and screenGui.Parent then
        screenGui:Destroy()
    end
end)

-- Dock button (bolinha "E")
local dockBtn = Instance.new("TextButton")
dockBtn.Size = UDim2.new(0, dockSize, 0, dockSize)
dockBtn.Position = lastDockPos
dockBtn.BackgroundColor3 = Color3.fromRGB(70, 110, 200)
dockBtn.Text = "E"
dockBtn.TextColor3 = Color3.new(1, 1, 1)
dockBtn.Font = Enum.Font.GothamBlack
dockBtn.TextSize = 28
dockBtn.BorderSizePixel = 0
dockBtn.Visible = false
dockBtn.BackgroundTransparency = 1
dockBtn.TextTransparency = 1
dockBtn.Parent = screenGui
dockBtn.ZIndex = 60

local dockCorner = Instance.new("UICorner")
dockCorner.CornerRadius = UDim.new(1, 0)
dockCorner.Parent = dockBtn

local dockStroke = Instance.new("UIStroke")
dockStroke.Color = Color3.fromRGB(100, 140, 220)
dockStroke.Thickness = 2
dockStroke.Transparency = 1
dockStroke.Parent = dockBtn

-- Drag dock using absolute positions (avoid jumps)
local dockDragging = false
local dockDragStartPos = nil
local dockStartAbsPos = nil

local function clampDockPixelPos(px, py)
    local vp = getViewport()
    local maxX = math.max(0, vp.X - dockSize)
    local maxY = math.max(0, vp.Y - dockSize)
    local nx = math.clamp(px, 0, maxX)
    local ny = math.clamp(py, 0, maxY)
    return nx, ny
end

dockBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dockDragging = true
        dockDragStartPos = input.Position
        dockStartAbsPos = Vector2.new(dockBtn.AbsolutePosition.X, dockBtn.AbsolutePosition.Y)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dockDragging = false
            end
        end)
    end
end)

dockBtn.InputChanged:Connect(function(input)
    if dockDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dockDragStartPos
        local newX = dockStartAbsPos.X + delta.X
        local newY = dockStartAbsPos.Y + delta.Y
        newX, newY = clampDockPixelPos(newX, newY)
        dockBtn.Position = UDim2.new(0, math.floor(newX), 0, math.floor(newY))
        lastDockPos = dockBtn.Position
    end
end)

-- Dock click: abre o painel (só quando não estava arrastando)
dockBtn.MouseButton1Click:Connect(function()
    if dockDragging then
        return
    end
    -- Hide dock (tween) then show main
    tween(dockBtn, {BackgroundTransparency = 1, TextTransparency = 1}, 0.22)
    tween(dockStroke, {Transparency = 1}, 0.22)
    task.wait(0.23)
    dockBtn.Visible = false
    -- restore main pos (clamped)
    local vp = getViewport()
    local px = math.clamp(lastMainPos.X.Offset, 0, math.max(0, vp.X - mainFrame.AbsoluteSize.X))
    local py = math.clamp(lastMainPos.Y.Offset, 0, math.max(0, vp.Y - mainFrame.AbsoluteSize.Y))
    mainFrame.Position = UDim2.new(0, px, 0, py)
    mainFrame.Visible = true
    mainFrame.BackgroundTransparency = 1
    tween(mainFrame, {BackgroundTransparency = 0}, 0.36)
    minimizado = false
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dockDragging = false
    end
end)

-- Minimizar botão
minBtn.MouseButton1Click:Connect(function()
    if minimizado then return end
    minimizado = true
    -- fade out main
    tween(mainFrame, {BackgroundTransparency = 1}, 0.25)
    task.wait(0.26)
    mainFrame.Visible = false

    -- ensure dock is positioned within viewport
    local vp = getViewport()
    local dx = lastDockPos.X.Offset
    local dy = lastDockPos.Y.Offset
    dx = math.clamp(dx, 0, math.max(0, vp.X - dockSize))
    dy = math.clamp(dy, 0, math.max(0, vp.Y - dockSize))
    dockBtn.Position = UDim2.new(0, dx, 0, dy)

    dockBtn.Visible = true
    tween(dockBtn, {BackgroundTransparency = 0, TextTransparency = 0}, 0.18)
    tween(dockStroke, {Transparency = 0}, 0.18)

    -- micro-shake (apenas ao minimizar)
    local original = dockBtn.Position
    tween(dockBtn, {Position = UDim2.new(original.X.Scale, original.X.Offset - 6, original.Y.Scale, original.Y.Offset)}, 0.05)
    task.wait(0.05)
    tween(dockBtn, {Position = UDim2.new(original.X.Scale, original.X.Offset + 6, original.Y.Scale, original.Y.Offset)}, 0.05)
    task.wait(0.05)
    tween(dockBtn, {Position = original}, 0.06)
end)

-- CONTENT
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -40, 1, -100)
contentFrame.Position = UDim2.new(0, 20, 0, 80)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame
contentFrame.ZIndex = mainFrame.ZIndex + 1

-- Vel input
local velInput = Instance.new("TextBox")
velInput.Text = "50"
velInput.PlaceholderText = "SPEED (standard: 50)"
velInput.Size = UDim2.new(1, 0, 0, 50)
velInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
velInput.TextColor3 = Color3.new(1, 1, 1)
velInput.Font = Enum.Font.GothamBold
velInput.TextSize = 22
velInput.BorderSizePixel = 0
velInput.Parent = contentFrame

local velCorner = Instance.new("UICorner")
velCorner.CornerRadius = UDim.new(0, 12)
velCorner.Parent = velInput

-- Toggle Vel
local toggleVel = Instance.new("TextButton")
toggleVel.Text = "SPEED: OFF"
toggleVel.Size = UDim2.new(1, 0, 0, 60)
toggleVel.Position = UDim2.new(0, 0, 0, 65)
toggleVel.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
toggleVel.TextColor3 = Color3.new(1, 1, 1)
toggleVel.Font = Enum.Font.GothamBold
toggleVel.TextSize = 18
toggleVel.BorderSizePixel = 0
toggleVel.Parent = contentFrame

local velToggleCorner = Instance.new("UICorner")
velToggleCorner.CornerRadius = UDim.new(0, 12)
velToggleCorner.Parent = toggleVel

-- Toggle Noclip
local toggleNoclip = Instance.new("TextButton")
toggleNoclip.Text = "NOCLIP: OFF"
toggleNoclip.Size = UDim2.new(1, 0, 0, 60)
toggleNoclip.Position = UDim2.new(0, 0, 0, 135)
toggleNoclip.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
toggleNoclip.TextColor3 = Color3.new(1, 1, 1)
toggleNoclip.Font = Enum.Font.GothamBold
toggleNoclip.TextSize = 18
toggleNoclip.BorderSizePixel = 0
toggleNoclip.Parent = contentFrame

local noclipCorner = Instance.new("UICorner")
noclipCorner.CornerRadius = UDim.new(0, 12)
noclipCorner.Parent = toggleNoclip

-- Botão Infinite Yield (adicionado conforme solicitado)
local infiniteYieldBtn = Instance.new("TextButton")
infiniteYieldBtn.Text = "Infinite Yield"
infiniteYieldBtn.Size = UDim2.new(1, 0, 0, 60)
infiniteYieldBtn.Position = UDim2.new(0, 0, 0, 205)
infiniteYieldBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
infiniteYieldBtn.TextColor3 = Color3.new(1, 1, 1)
infiniteYieldBtn.Font = Enum.Font.GothamBold
infiniteYieldBtn.TextSize = 18
infiniteYieldBtn.BorderSizePixel = 0
infiniteYieldBtn.Parent = contentFrame

local infiniteYieldCorner = Instance.new("UICorner")
infiniteYieldCorner.CornerRadius = UDim.new(0, 12)
infiniteYieldCorner.Parent = infiniteYieldBtn

-- Status + credits
local status = Instance.new("TextLabel")
status.Text = "Creator:"
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 275)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(120, 180, 255)
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.Parent = contentFrame

local credits = Instance.new("TextLabel")
credits.Text = "ig: erickmth__     Roblox: erick_mth"
credits.Size = UDim2.new(1, 0, 0, 25)
credits.Position = UDim2.new(0, 0, 1, -25)
credits.BackgroundTransparency = 1
credits.TextColor3 = Color3.fromRGB(80, 120, 200)
credits.Font = Enum.Font.GothamBold
credits.TextSize = 14
credits.Parent = mainFrame

-- Toggle Vel logic
toggleVel.MouseButton1Click:Connect(function()
    velocidadeAtiva = not velocidadeAtiva
    local vel = tonumber(velInput.Text) or 50
    velocidadeDesejada = vel

    if velocidadeAtiva then
        toggleVel.Text = "SPEED: ON ("..vel..")"
        toggleVel.BackgroundColor3 = Color3.fromRGB(60, 180, 100)
        showNotification("✓ SPEED on (" .. vel .. ")")
        if conexaoVel then conexaoVel:Disconnect() end
        conexaoVel = RunService.Heartbeat:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = velocidadeDesejada
            end
        end)
    else
        toggleVel.Text = "SPEED: OFF"
        toggleVel.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        showNotification("✗ SPEED OFF")
        if conexaoVel then conexaoVel:Disconnect() end
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- Toggle Noclip logic
toggleNoclip.MouseButton1Click:Connect(function()
    noclipAtivo = not noclipAtivo

    if noclipAtivo then
        toggleNoclip.Text = "NOCLIP: ON"
        toggleNoclip.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
        showNotification("✓ Noclip ON")
        if conexaoNoclip then conexaoNoclip:Disconnect() end
        conexaoNoclip = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        toggleNoclip.Text = "NOCLIP: OFF"
        toggleNoclip.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        showNotification("✗ Noclip OFF")
        if conexaoNoclip then conexaoNoclip:Disconnect() end
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = true
                end
            end
        end
    end
end)

-- Botão Infinite Yield logic (adicionado conforme solicitado)
infiniteYieldBtn.MouseButton1Click:Connect(function()
    showNotification("Loading Infinite Yield...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479", true))()
    showNotification("✓ Infinite Yield Ok")
end)

-- initial fade in
mainFrame.BackgroundTransparency = 1
tween(mainFrame, {BackgroundTransparency = 0}, 0.5)

print("✓ All Ok")