-- [[ R-77 ]]
-- [[ NoMercy ]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Engine = loadstring(game:HttpGet("https://lua.mainecoon.digital/ll/nomercyMTC.lua"))()
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local CachedPlayers = Players:GetPlayers()

local espEnabled = true
local espShowTeammates = true
local vehicleEspEnabled = true

local playerLabels = {}
local vehicleLabels = {}

local function removeNameLabel(plr)
    local bb = playerLabels[plr]
    if bb then
        bb:Destroy()
        playerLabels[plr] = nil
    end
end

local function clearNameESP()
    for plr in pairs(playerLabels) do
        removeNameLabel(plr)
    end
end

local function isTeammate(plr)
    return LocalPlayer.Team ~= nil and plr.Team == LocalPlayer.Team
end

local function shouldShowPlayerESP(plr)
    return plr ~= LocalPlayer and (espShowTeammates or not isTeammate(plr))
end

local function getHealthColor(humanoid)
    if not humanoid or humanoid.MaxHealth <= 0 then
        return Color3.fromRGB(255, 255, 255)
    end

    local ratio = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
    local red = math.floor(255 * (1 - ratio))
    local green = math.floor(255 * ratio)
    return Color3.fromRGB(red, green, 0)
end

local function getLocalRoot()
    local character = LocalPlayer.Character
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function getPlayerDistanceText(root)
    local localRoot = getLocalRoot()
    if not localRoot or not root then
        return "?"
    end
    return tostring(math.floor((localRoot.Position - root.Position).Magnitude + 0.5))
end

local function getNameLabelColor(plr)
    return isTeammate(plr) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
end

local function getNameLabelText(plr, root)
    return plr.Name .. " [" .. getPlayerDistanceText(root) .. " studs]"
end

local function createNameLabel(plr)
    if not shouldShowPlayerESP(plr) then
        removeNameLabel(plr)
        return
    end

    local character = plr.Character
    if not character then
        removeNameLabel(plr)
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then
        removeNameLabel(plr)
        return
    end

    local color = getNameLabelColor(plr)
    local labelText = getNameLabelText(plr, root)
    local current = playerLabels[plr]
    if current and current.Parent == root and current.Adornee == root then
        local text = current:FindFirstChildOfClass("TextLabel")
        if text then
            text.Text = labelText
            text.TextColor3 = color
        end
        return
    end

    removeNameLabel(plr)

    local bb = Instance.new("BillboardGui")
    bb.Name = "NameESP"
    bb.Size = UDim2.new(0, 150, 0, 18)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Adornee = root
    bb.Parent = root

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.fromScale(1, 1)
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 10
    txt.TextColor3 = color
    txt.TextStrokeTransparency = 0.3
    txt.TextStrokeColor3 = Color3.new(0, 0, 0)
    txt.Text = labelText
    txt.Parent = bb

    playerLabels[plr] = bb
end

local function updateNameESP()
    if not espEnabled then
        clearNameESP()
        return
    end

    for _, plr in pairs(Players:GetPlayers()) do
        createNameLabel(plr)
    end
end

local aimEnabled = true
local aimKey = Enum.UserInputType.MouseButton2
local fovSize = 150
local fovColor = Color3.new(1, 0, 0)
local fovColorIndex = 1
local fovColors = {
    Color3.new(1, 0, 0), Color3.new(0, 1, 0), Color3.new(0, 0, 1),
    Color3.new(1, 1, 0), Color3.new(1, 0, 1), Color3.new(0, 1, 1),
    Color3.new(1, 1, 1)
}
local fovColorNames = {"Red","Green","Blue","Yellow","Pink","Cyan","White"}
local smoothness = 0.3
local aimModePC = "Camera"

local hitboxEnabled = false
local hitboxMultiplier = 2.0
local originalSizes = {}

local menuKey = Enum.KeyCode.RightShift
local isSettingMenuKey = false
local isSettingAimKey = false

local fovCircle = nil
local function updateFOVCircle()
    if Drawing and Drawing.new then
        if not fovCircle then
            fovCircle = Drawing.new("Circle")
            fovCircle.NumSides = 64
        end
        fovCircle.Radius = fovSize
        fovCircle.Thickness = 2
        fovCircle.Color = fovColor
        fovCircle.Visible = aimEnabled
    end
end
if fovCircle then fovCircle:Remove() fovCircle = nil end

local function createButton(parent, text, yPos)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 190, 0, 30)
    btn.Position = UDim2.new(0.5, -95, 0, yPos)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = Color3.fromRGB(0, 80, 200)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
    btn.BorderColor3 = Color3.fromRGB(0, 120, 255)
    btn.BorderSizePixel = 1
    return btn
end

local function createSlider(parent, label, min, max, default, yPos, onChange)
    local labelObj = Instance.new("TextLabel", parent)
    labelObj.Size = UDim2.new(0, 190, 0, 18)
    labelObj.Position = UDim2.new(0.5, -95, 0, yPos)
    labelObj.BackgroundTransparency = 1
    labelObj.Text = label .. ": " .. default
    labelObj.Font = Enum.Font.Gotham
    labelObj.TextSize = 12
    labelObj.TextColor3 = Color3.fromRGB(220, 220, 220)

    local bg = Instance.new("Frame", parent)
    bg.Size = UDim2.new(0, 190, 0, 8)
    bg.Position = UDim2.new(0.5, -95, 0, yPos + 18)
    bg.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 5)

    local fill = Instance.new("Frame", bg)
    fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 5)

    local knob = Instance.new("TextButton", parent)
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(0.5, -95 + ((default-min)/(max-min)*190) - 8, 0, yPos + 14)
    knob.BackgroundColor3 = Color3.new(1, 1, 1)
    knob.Text = ""
    knob.ZIndex = 2
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

    local dragging = false
    local value = default
    knob.MouseButton1Down:Connect(function() dragging = true end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderX = bg.AbsolutePosition.X
            local rel = math.clamp(mousePos.X - sliderX, 0, bg.AbsoluteSize.X)
            local newVal = min + (rel / bg.AbsoluteSize.X) * (max - min)
            newVal = math.floor(newVal * 10) / 10
            value = newVal
            fill.Size = UDim2.new((value-min)/(max-min), 0, 1, 0)
            knob.Position = UDim2.new(0.5, -95 + ((value-min)/(max-min)*190) - 8, 0, yPos + 14)
            labelObj.Text = label .. ": " .. value
            onChange(value)
        end
    end)
    return labelObj
end

local function removeHighlight(plr)
    if plr.Character then
        local hl = plr.Character:FindFirstChildOfClass("Highlight")
        if hl then hl:Destroy() end
    end
end

local function removeAllHighlights()
    for _, plr in pairs(Players:GetPlayers()) do
        removeHighlight(plr)
    end
end

local function createHighlightForPlayer(plr)
    if not shouldShowPlayerESP(plr) then
        removeHighlight(plr)
        return
    end
    if not plr.Character then return end

    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    local hl = plr.Character:FindFirstChildOfClass("Highlight")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Parent = plr.Character
        hl.FillTransparency = 0.5
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end

    if isTeammate(plr) then
        hl.FillColor = Color3.fromRGB(0, 100, 255)
        hl.OutlineColor = Color3.fromRGB(0, 200, 255)
    else
        local color = getHealthColor(humanoid)
        hl.FillColor = color
        hl.OutlineColor = color
    end
end

local vehicleHighlights = {}

local function looksLikeVehicle(model)
    if not model or not model:IsA("Model") then return false end
    if Players:GetPlayerFromCharacter(model) then return false end
    if model:FindFirstChildWhichIsA("VehicleSeat", true) then return true end
    return false
end

local function getVehicleAdornee(vehicle)
    return vehicle:FindFirstChildWhichIsA("VehicleSeat", true) or vehicle.PrimaryPart or vehicle:FindFirstChildWhichIsA("BasePart", true)
end

local function removeVehicleLabel(vehicle)
    local bb = vehicleLabels[vehicle]
    if bb then
        bb:Destroy()
        vehicleLabels[vehicle] = nil
    end
end

local function addVehicleLabel(vehicle)
    local adornee = getVehicleAdornee(vehicle)
    if not adornee then
        removeVehicleLabel(vehicle)
        return
    end

    local current = vehicleLabels[vehicle]
    if current and current.Parent == adornee and current.Adornee == adornee then
        local text = current:FindFirstChildOfClass("TextLabel")
        if text then text.Text = vehicle.Name end
        return
    end

    removeVehicleLabel(vehicle)

    local bb = Instance.new("BillboardGui")
    bb.Name = "VehicleNameESP"
    bb.Size = UDim2.new(0, 140, 0, 18)
    bb.StudsOffset = Vector3.new(0, 4, 0)
    bb.AlwaysOnTop = true
    bb.Adornee = adornee
    bb.Parent = adornee

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.fromScale(1, 1)
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 10
    txt.TextColor3 = Color3.fromRGB(190, 90, 255)
    txt.TextStrokeTransparency = 0.3
    txt.TextStrokeColor3 = Color3.new(0, 0, 0)
    txt.Text = vehicle.Name
    txt.Parent = bb

    vehicleLabels[vehicle] = bb
end

local function addVehicleESP(vehicle)
    if vehicleHighlights[vehicle] then
        addVehicleLabel(vehicle)
        return
    end

    local hl = Instance.new("Highlight")
    hl.FillColor = Color3.fromRGB(170, 0, 255)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 0.5
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = vehicle

    vehicleHighlights[vehicle] = hl
    addVehicleLabel(vehicle)
end

local function removeVehicleESP(vehicle)
    if vehicleHighlights[vehicle] then
        vehicleHighlights[vehicle]:Destroy()
        vehicleHighlights[vehicle] = nil
    end
    removeVehicleLabel(vehicle)
end

for _, obj in pairs(workspace:GetDescendants()) do
    if looksLikeVehicle(obj) then
        addVehicleESP(obj)
    end
end

workspace.DescendantAdded:Connect(function(obj)
    if vehicleEspEnabled and looksLikeVehicle(obj) then
        addVehicleESP(obj)
    end
end)

workspace.DescendantRemoving:Connect(function(obj)
    removeVehicleESP(obj)
end)

local function refreshESP()
    if not espEnabled then
        removeAllHighlights()
        clearNameESP()
        return
    end

    for _, plr in pairs(Players:GetPlayers()) do
        createHighlightForPlayer(plr)
        createNameLabel(plr)
    end
end

local function setupPlayerESP(plr)
    if plr == LocalPlayer then return end

    plr.CharacterAdded:Connect(function()
        task.wait(0.5)
        if espEnabled then
            createHighlightForPlayer(plr)
            createNameLabel(plr)
        end
    end)

    if plr.Character and espEnabled then
        createHighlightForPlayer(plr)
        createNameLabel(plr)
    end
end

Players.PlayerAdded:Connect(function(plr)
    table.insert(CachedPlayers, plr)
    setupPlayerESP(plr)
end)
Players.PlayerRemoving:Connect(function(plr)
    local idx = table.find(CachedPlayers, plr)
    if idx then table.remove(CachedPlayers, idx) end
    removeNameLabel(plr)
    removeHighlight(plr)
end)
for _, plr in pairs(Players:GetPlayers()) do
    setupPlayerESP(plr)
end
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if espEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            createHighlightForPlayer(plr)
            createNameLabel(plr)
        end
    end
end)

local function applyHitboxToCharacter(character)
    if not character then return end
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not originalSizes[part] then originalSizes[part] = part.Size end
            part.Size = originalSizes[part] * hitboxMultiplier
        end
    end
end
local function restoreCharacterHitbox(character)
    if not character then return end
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and originalSizes[part] then
            part.Size = originalSizes[part]
            originalSizes[part] = nil
        end
    end
end
local function applyHitboxToAll()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then applyHitboxToCharacter(player.Character) end
    end
end
local function restoreAll()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then restoreCharacterHitbox(player.Character) end
    end
    originalSizes = {}
end
local function onCharacterAdded(character)
    task.wait(0.5)
    if hitboxEnabled then applyHitboxToCharacter(character) end
end
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character then onCharacterAdded(player.Character) end
end)
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then player.CharacterAdded:Connect(onCharacterAdded) end
end

local Mouse = LocalPlayer:GetMouse()
local blinkEnabled = true
local blinkCooldown = 1.5
local lastBlinkTime = 0
local isBlinking = false

local function impulseBlink(targetPos)
    if isBlinking then return end

    local char = LocalPlayer.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end

    local now = tick()
    if now - lastBlinkTime < blinkCooldown then return end

    lastBlinkTime = now
    isBlinking = true

    root.Anchored = true
    task.wait()

    pcall(function()
        root.CFrame = CFrame.new(targetPos, targetPos + Vector3.new(0,1,0))
    end)

    root.Anchored = false
    humanoid:ChangeState(Enum.HumanoidStateType.Landed)

    root.Velocity = Vector3.zero
    root.RotVelocity = Vector3.zero

    isBlinking = false
end

local function getClosestEnemy()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local closest = nil
    local closestDist = fovSize
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 and (not LocalPlayer.Team or plr.Team ~= LocalPlayer.Team) then
                local target = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("HumanoidRootPart")
                if target then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(target.Position)
                    if onScreen then
                        local dist = (center - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closest = target
                        end
                    end
                end
            end
        end
    end
    return closest
end
local function cameraAim(target)
    if not target then return end
    local currentCF = Camera.CFrame
    local targetCF = CFrame.new(currentCF.Position, target.Position)
    if smoothness > 0 and smoothness < 1 then
        Camera.CFrame = currentCF:Lerp(targetCF, smoothness)
    else
        Camera.CFrame = targetCF
    end
end

local currentTarget = nil
local lastTargetUpdate = 0

local function mouseAim(target)
    if not target then return end
    local screenPos, onScreen = Camera:WorldToViewportPoint(target.Position)
    if onScreen then
        local deltaX = (screenPos.X - Mouse.X) * smoothness
        local deltaY = (screenPos.Y - Mouse.Y) * smoothness
        pcall(function() game:GetService("VirtualInputManager"):SendMouseMovement(deltaX, deltaY, nil) end)
        pcall(function() mousemoverel(deltaX, deltaY) end)
    end
end

RunService.RenderStepped:Connect(function()
    if not espEnabled then
        removeAllHighlights()
        clearNameESP()
    else
        -- Плавное обновление ESP каждый кадр
        for _, plr in ipairs(CachedPlayers) do
            createHighlightForPlayer(plr)
            createNameLabel(plr)
        end
    end
    
    if fovCircle then
        local mousePos = UserInputService:GetMouseLocation()
        fovCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
    end
    
    if not aimEnabled then return end
    local keyPressed = false
    if aimKey.EnumType == Enum.UserInputType then
        keyPressed = UserInputService:IsMouseButtonPressed(aimKey)
    else
        keyPressed = UserInputService:IsKeyDown(aimKey)
    end
    if keyPressed then
        if tick() - lastTargetUpdate > 0.05 then
            currentTarget = getClosestEnemy()
            lastTargetUpdate = tick()
        end
        if currentTarget then
            if aimModePC == "Camera" then cameraAim(currentTarget) else mouseAim(currentTarget) end
        end
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "#NoMercy"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 420, 0, 430)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -215)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 34)
title.BackgroundTransparency = 1
title.Text = "#NoMercy"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)

local dragging = false
local dragStart, dragFramePos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        dragFramePos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(dragFramePos.X.Scale, dragFramePos.X.Offset + delta.X,
                                       dragFramePos.Y.Scale, dragFramePos.Y.Offset + delta.Y)
    end
end)

local tabPanel = Instance.new("Frame", mainFrame)
tabPanel.Size = UDim2.new(1, -20, 0, 28)
tabPanel.Position = UDim2.new(0, 10, 0, 40)
tabPanel.BackgroundTransparency = 1
local tabs = {"ESP", "AIM", "HITBOX", "SETTINGS"}
local tabButtons = {}
local tabWidth = 93
for idx, name in ipairs(tabs) do
    local btn = Instance.new("TextButton", tabPanel)
    btn.Size = UDim2.new(0, tabWidth, 1, 0)
    btn.Position = UDim2.new(0, (idx - 1) * (tabWidth + 5), 0, 0)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
    tabButtons[idx] = btn
end

local contentHolder = Instance.new("Frame", mainFrame)
contentHolder.Size = UDim2.new(1, -20, 1, -78)
contentHolder.Position = UDim2.new(0, 10, 0, 72)
contentHolder.BackgroundTransparency = 1

local espFrame = Instance.new("Frame", contentHolder)
espFrame.Size = UDim2.new(1,0,1,0)
espFrame.BackgroundTransparency = 1
local aimFrame = Instance.new("Frame", contentHolder)
aimFrame.Size = UDim2.new(1,0,1,0)
aimFrame.BackgroundTransparency = 1
aimFrame.Visible = false
local hitboxFrame = Instance.new("Frame", contentHolder)
hitboxFrame.Size = UDim2.new(1,0,1,0)
hitboxFrame.BackgroundTransparency = 1
hitboxFrame.Visible = false
local settingsFrame = Instance.new("Frame", contentHolder)
settingsFrame.Size = UDim2.new(1,0,1,0)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false

for i, btn in ipairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        espFrame.Visible = (i == 1)
        aimFrame.Visible = (i == 2)
        hitboxFrame.Visible = (i == 3)
        settingsFrame.Visible = (i == 4)
        for _, b in pairs(tabButtons) do
            b.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    end)
end
tabButtons[1].BackgroundColor3 = Color3.fromRGB(0, 120, 255)

local espOnBtn = createButton(espFrame, espEnabled and "ESP ON" or "ESP OFF", 20)
local teamEspBtn = createButton(espFrame, espShowTeammates and "TEAM ESP ON" or "TEAM ESP OFF", 58)
local vehicleEspBtn = createButton(espFrame, vehicleEspEnabled and "FULL VEHICLE + PROPS ESP ON" or "FULL VEHICLE + PROPS ESP OFF", 96)

espOnBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espOnBtn.Text = espEnabled and "ESP ON" or "ESP OFF"
    refreshESP()
end)

teamEspBtn.MouseButton1Click:Connect(function()
    espShowTeammates = not espShowTeammates
    teamEspBtn.Text = espShowTeammates and "TEAM ESP ON" or "TEAM ESP OFF"
    refreshESP()
end)

local function refreshVehicleESP()
    if vehicleEspEnabled then
        for _, obj in pairs(workspace:GetDescendants()) do
            if looksLikeVehicle(obj) then
                addVehicleESP(obj)
            end
        end
    else
        for obj, _ in pairs(vehicleHighlights) do
            removeVehicleESP(obj)
        end
        for obj, _ in pairs(vehicleLabels) do
            removeVehicleLabel(obj)
        end
    end
end

vehicleEspBtn.MouseButton1Click:Connect(function()
    vehicleEspEnabled = not vehicleEspEnabled
    vehicleEspBtn.Text = vehicleEspEnabled and "VEHICLE ESP ON" or "VEHICLE ESP OFF"
    refreshVehicleESP()
end)

local aimOnBtn = createButton(aimFrame, aimEnabled and "AIM ON" or "AIM OFF", 12)
local aimKeyBtn = createButton(aimFrame, "Aim Key: " .. (aimKey.Name or "RMB"), 50)
local aimModeBtn = createButton(aimFrame, "Aim Mode: " .. aimModePC, 88)
local fovColorBtn = createButton(aimFrame, "FOV Color: " .. fovColorNames[fovColorIndex], 126)
createSlider(aimFrame, "Smoothness", 0.1, 1, smoothness, 170, function(val) smoothness = val end)
createSlider(aimFrame, "FOV Size", 50, 300, fovSize, 215, function(val) fovSize = val updateFOVCircle() end)

aimOnBtn.MouseButton1Click:Connect(function()
    aimEnabled = not aimEnabled
    aimOnBtn.Text = aimEnabled and "AIM ON" or "AIM OFF"
    updateFOVCircle()
end)
aimKeyBtn.MouseButton1Click:Connect(function()
    aimKeyBtn.Text = "Press key..."
    isSettingAimKey = true
end)
aimModeBtn.MouseButton1Click:Connect(function()
    aimModePC = (aimModePC == "Camera") and "Mouse" or "Camera"
    aimModeBtn.Text = "Aim Mode: " .. aimModePC
end)
fovColorBtn.MouseButton1Click:Connect(function()
    fovColorIndex = fovColorIndex + 1
    if fovColorIndex > #fovColors then fovColorIndex = 1 end
    fovColor = fovColors[fovColorIndex]
    fovColorBtn.Text = "FOV Color: " .. fovColorNames[fovColorIndex]
    updateFOVCircle()
end)

local hitboxToggle = createButton(hitboxFrame, hitboxEnabled and "HITBOX ON" or "HITBOX OFF", 20)
createSlider(hitboxFrame, "Multiplier", 1.0, 5.0, hitboxMultiplier, 62, function(val)
    hitboxMultiplier = val
    if hitboxEnabled then applyHitboxToAll() end
end)
hitboxToggle.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    if hitboxEnabled then
        hitboxToggle.Text = "HITBOX ON"
        hitboxToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        hitboxToggle.TextColor3 = Color3.new(1, 1, 1)
        applyHitboxToAll()
    else
        hitboxToggle.Text = "HITBOX OFF"
        hitboxToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        hitboxToggle.TextColor3 = Color3.fromRGB(0, 80, 200)
        restoreAll()
    end
end)

local menuKeyBtn = createButton(settingsFrame, "Menu Key: " .. menuKey.Name, 20)
local rejoinBtn = createButton(settingsFrame, "Rejoin", 58)
menuKeyBtn.MouseButton1Click:Connect(function()
    menuKeyBtn.Text = "Press key..."
    isSettingMenuKey = true
end)
rejoinBtn.MouseButton1Click:Connect(function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

UserInputService.InputBegan:Connect(function(inp, gProc)
    if gProc then return end

    if blinkEnabled
    and inp.UserInputType == Enum.UserInputType.MouseButton1
    and (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
    or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then

        impulseBlink(Mouse.Hit.Position)
    end

    if isSettingMenuKey then
        if inp.KeyCode ~= Enum.KeyCode.Unknown then
            menuKey = inp.KeyCode
            menuKeyBtn.Text = "Menu Key: " .. inp.KeyCode.Name
        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            menuKey = inp.UserInputType
            local keyName = tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
            menuKeyBtn.Text = "Menu Key: " .. keyName
        end
        isSettingMenuKey = false
        return
    end

    if isSettingAimKey then
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            aimKey = inp.UserInputType
            local keyName = tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
            aimKeyBtn.Text = "Aim Key: " .. keyName
            isSettingAimKey = false
        elseif inp.KeyCode ~= Enum.KeyCode.Unknown then
            aimKey = inp.KeyCode
            aimKeyBtn.Text = "Aim Key: " .. inp.KeyCode.Name
            isSettingAimKey = false
        end
        return
    end

    if (inp.KeyCode == menuKey) or (inp.UserInputType == menuKey) then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

updateFOVCircle()
refreshESP()

-- =================================
-- DEV -- > R-77
-- =================================