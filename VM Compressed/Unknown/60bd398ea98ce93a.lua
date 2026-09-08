-- =================================
-- https://rscripts.net/@BabyMaxford
-- DEV -- >(Optimized and Updated by BabyMaxford)
-- https://rscripts.net/@BabyMaxford
-- =================================

--// SERVICES
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local workspaceRef = workspace
local camera = workspace.CurrentCamera or workspace:WaitForChild("Camera")

--// VARIABLES
local animalESPEnabled, deadAnimalESPEnabled = false, false
local magicBulletEnabled = false
local magicHitboxSize = 15
local magicTransparency = 0.7
local magicColor = Color3.fromRGB(255, 0, 0)
local magicFolder = "Animals"
local maxEspDistance = 1500
local espColor = Color3.fromRGB(255, 200, 50)
local deadEspColor = Color3.fromRGB(255, 100, 100)
local lastESPUpdate = 0
local lastHitboxUpdate = 0
local distanceInfoEnabled = false
local distanceTextSize = 22
local distanceTextColor = Color3.new(1,1,1)
local aiming = false
local distanceEditMode = false
local noRecoilEnabled = false
local lastPitch = nil
local recoilThreshold = 0.02
local animalTrackingEnabled = false
local compass = false
local trackingArrow = nil
local trackingDistanceGui = nil
local trackingDistanceLabel = nil
local trackedAnimal = nil
local trackedHighlight = nil
local bloodTrackerEnabled = false
local zoomStep = 2
local minZoom = 2
local maxZoom = 70
local zoomEnabled = false
local zoomOverrideEnabled = false
local zoomActive = false
local zoomFOV = nil
local baseFOV = 70
local thermalEnabled = false
local thermalEffect = nil
local crosshairEnabled = false
local crosshairGui = nil
local crosshairOffsetX = 0
local crosshairOffsetY = -30
local crosshairColor = Color3.new(1,1,1)
local STUD_TO_YARD = 0.364583
local distanceGui = Instance.new("ScreenGui")
distanceGui.Name = "DistanceIndicator"
distanceGui.ResetOnSpawn = false
distanceGui.Parent = game.CoreGui
local distanceLabel = Instance.new("TextLabel")
distanceLabel.Size = UDim2.new(0,120,0,30)
distanceLabel.AnchorPoint = Vector2.new(0.5,0.5)
distanceLabel.Position = UDim2.new(0.5,-70,0.5,-60)
distanceLabel.BackgroundTransparency = 1
distanceLabel.TextColor3 = Color3.fromRGB(255,40,40)
distanceLabel.Font = Enum.Font.ArialBold
distanceLabel.TextSize = 22
distanceLabel.TextStrokeTransparency = 1
distanceLabel.Text = ""
distanceLabel.Visible = false
distanceLabel.Parent = distanceGui
local baseSensitivity = UserSettings():GetService("UserGameSettings").MouseSensitivity
local rayParams = RaycastParams.new()
rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
rayParams.FilterType = Enum.RaycastFilterType.Blacklist

--// DATA TABLES
local crosshairRayOrigin = nil
local crosshairRayDirection = nil
local crosshairRayResult = nil
local selectedAnimals = {}
local AllAnimals = {}
local ActiveAnimals = {}
local animalHealth = {}
local thermalHighlights = {}
local woundedAnimals = {}
local woundedHighlights = {}
local originalHitboxes = {}
local lastAnimalPosition = {}
local lastAnimalPosition = {}
local ESPData, DeadESPData = {}, {}

--// UI SETUP
local Window = Rayfield:CreateWindow({
   Name = "Hunting Season by BabyMaxford",
   LoadingTitle = "Hunting Season Script",
   LoadingSubtitle = "made with love by BabyMaxford",
   ConfigurationSaving = { Enabled = true, FolderName = "HuntingSeasonScript", FileName = "HuntingConfig" },
   Discord = { Enabled = false, Invite = "noinvitelink", RememberJoins = true },
   KeySystem = false -- free script without key.... uhhh nobody really cares, nobody will read this. - Well I did -BabyMaxford :)
})
-- Cursor Toggle Logic (Window Open/Close)
local windowMainFrame = Window.MainFrame
if windowMainFrame then
    windowMainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if windowMainFrame.Visible then
            UserInputService.MouseIconEnabled = true
            windowMainFrame.Modal = true -- Free mouse movement
        else
            UserInputService.MouseIconEnabled = false
            windowMainFrame.Modal = false -- Return to game control
        end
    end)
    -- Initial setup based on window visibility
    if windowMainFrame.Visible then
        UserInputService.MouseIconEnabled = true
        windowMainFrame.Modal = true
    else
        UserInputService.MouseIconEnabled = false
        windowMainFrame.Modal = false
    end
end

--// TABS
local MainTab     = Window:CreateTab("Main Features", 4483362458)
local ESPTab      = Window:CreateTab("ESP", 4483362458)
local AimTab      = Window:CreateTab("Aim", 4483362458)
local EnvironmentTab = Window:CreateTab("Environment", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

--// HELPERS
-- find animals root part
local function findRootPart(model)
    if model.PrimaryPart then return model.PrimaryPart end
    for _, child in ipairs(model:GetDescendants()) do
        if child:IsA("BasePart") then return child end
    end
    return nil
end
-- animal distance gui
local function createTrackingDistanceHUD()

    if trackingDistanceGui then return end

    trackingDistanceGui = Instance.new("ScreenGui")
    trackingDistanceGui.Name = "TrackingDistanceHUD"
    trackingDistanceGui.ResetOnSpawn = false
    trackingDistanceGui.Parent = game.CoreGui
    trackingDistanceLabel = Instance.new("TextLabel")
    trackingDistanceLabel.Size = UDim2.new(0,260,0,40)
    trackingDistanceLabel.AnchorPoint = Vector2.new(0.5,0)
    trackingDistanceLabel.Position = UDim2.new(0.5,0,0,20)
    trackingDistanceLabel.BackgroundTransparency = 1
    trackingDistanceLabel.TextColor3 = Color3.fromRGB(255,255,255)
    trackingDistanceLabel.TextStrokeTransparency = 0
    trackingDistanceLabel.Font = Enum.Font.GothamBold
    trackingDistanceLabel.TextSize = 22
    trackingDistanceLabel.Text = ""
    trackingDistanceLabel.Parent = trackingDistanceGui

end
-- remove animal distance gui
local function removeTrackingDistanceHUD()

    if trackingDistanceGui then
        trackingDistanceGui:Destroy()
        trackingDistanceGui = nil
        trackingDistanceLabel = nil
    end

end
-- create compass
local function createTrackingArrow()

    if trackingArrow then return end

    local part = Instance.new("Part")
    part.Name = "TrackingArrow"
    part.Size = Vector3.new(1,1,1)
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.Neon
    part.Transparency = 0.2

    local mesh = Instance.new("SpecialMesh")
    mesh.MeshType = Enum.MeshType.FileMesh
    mesh.MeshId = "rbxassetid://1033714"

    -- long narrow cone
    mesh.Scale = Vector3.new(0.25,4,0.25)

    -- center the cone properly
    mesh.Offset = Vector3.new(0,-0.5,0)

    mesh.Parent = part

    part.Parent = workspace
    trackingArrow = part
    createTrackingDistanceHUD()

end
-- update compass
local function updateTrackingArrow()

    if not compass then
        removeTrackingArrow()
        return
    end

    if not trackingArrow or not trackedAnimal then
        return
    end

    if not trackedAnimal.Parent then
        removeTrackingArrow()
        trackedAnimal = nil

        if trackedHighlight then
            trackedHighlight:Destroy()
            trackedHighlight = nil
        end
        return
    end

    local root = findRootPart(trackedAnimal)
    local playerRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root or not playerRoot then return end

    local dist = (playerRoot.Position - root.Position).Magnitude

    -- update HUD
    if trackingDistanceLabel then
        local yards = math.floor(dist * 0.364583)
        trackingDistanceLabel.Text = "Animal Distance: "..yards.." yd"
    end

    -- arrow position
    local arrowPos =
        playerRoot.Position
        + Vector3.new(0,5,0)
        + (playerRoot.CFrame.LookVector * 6)

    local direction = root.Position - playerRoot.Position
    direction = Vector3.new(direction.X,0,direction.Z).Unit

    trackingArrow.CFrame =
        CFrame.lookAt(arrowPos, arrowPos + direction)
        * CFrame.Angles(math.rad(270),0,0)

    -- color
    local isDead = trackedAnimal.Parent.Name == "DeadAnimals"

    if isDead then
        trackingArrow.Color = Color3.fromRGB(255,60,60)
    else
        trackingArrow.Color = Color3.fromRGB(80,255,120)
    end

    -- movement detection
    local moving = false
    local lastPos = lastAnimalPosition[trackedAnimal]

    if lastPos then
        if (root.Position - lastPos).Magnitude > 0.25 then
            moving = true
        end
    end

    lastAnimalPosition[trackedAnimal] = root.Position

    -- transparency logic
    if dist < 100 then
        trackingArrow.Transparency = 0
    else
        if moving then
            local pulse = (math.sin(tick()*6) + 1) / 2
            trackingArrow.Transparency = 0.15 + pulse * 0.35
        else
            trackingArrow.Transparency = 0.25
        end
    end

end
local function removeTrackingArrow()

    if trackingArrow then
        trackingArrow:Destroy()
        trackingArrow = nil
        removeTrackingDistanceHUD()
    end

end
-- aiming mode update
local function isAiming()
    local cam = workspace.CurrentCamera
    if not cam then return false end
    return cam.FieldOfView < baseFOV
end
-- raycast update
local function updateCrosshairRay()

    local cam = workspace.CurrentCamera
    if not cam then return end

    local viewport = cam.ViewportSize

    local ray = cam:ViewportPointToRay(
        viewport.X/2 + crosshairOffsetX,
        viewport.Y/2 + crosshairOffsetY
    )

    local origin = ray.Origin
    local direction = ray.Direction * 5000

    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
    local result = workspace:Raycast(origin, direction, rayParams)

    crosshairRayOrigin = origin
    crosshairRayDirection = direction
    crosshairRayResult = result

end
-- Crosshair Logic
local function createCrosshair()

    if crosshairGui then return end

    crosshairGui = Instance.new("ScreenGui")
    crosshairGui.Name = "CustomCrosshair"
    crosshairGui.ResetOnSpawn = false
    crosshairGui.Parent = game.CoreGui

    local center = Instance.new("Frame")
    center.Size = UDim2.new(0,4,0,4)
    center.Position = UDim2.new(0.5,crosshairOffsetX,0.5,crosshairOffsetY)
    center.AnchorPoint = Vector2.new(0.5,0.5)
    center.BackgroundColor3 = crosshairColor
    center.BorderSizePixel = 0
    center.Parent = crosshairGui

    local size = 6
    local thickness = 2

    local function line(xOffset,yOffset,width,height)

        local l = Instance.new("Frame")
        l.AnchorPoint = Vector2.new(0.5,0.5)
        l.Position = UDim2.new(
            0.5,
            xOffset + crosshairOffsetX,
            0.5,
            yOffset + crosshairOffsetY
        )
        l.Size = UDim2.new(0,width,0,height)
        l.BackgroundColor3 = crosshairColor
        l.BorderSizePixel = 0
        l.Parent = crosshairGui

    end

    local gap = 6
    local length = 8
    local thickness = 2

    line(-(gap+length/2),0,length,thickness) -- left
    line((gap+length/2),0,length,thickness)  -- right
    line(0,-(gap+length/2),thickness,length) -- up
    line(0,(gap+length/2),thickness,length)  -- down
end
local function removeCrosshair()

    if crosshairGui then
        crosshairGui:Destroy()
        crosshairGui = nil
    end

end
-- thermal vision
local function enableThermalVision()

    if thermalEffect then return end

    local Lighting = game:GetService("Lighting")

    thermalEffect = Instance.new("ColorCorrectionEffect")
    thermalEffect.Saturation = -1
    thermalEffect.Contrast = 0.3
    thermalEffect.Brightness = 0.05
    thermalEffect.Parent = Lighting

end
local function disableThermalVision()

    if thermalEffect then
        thermalEffect:Destroy()
        thermalEffect = nil
    end

end
local function addThermalHighlight(model)

    if thermalHighlights[model] then return end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 140, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 200, 0)
    highlight.FillTransparency = 0.4
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = model

    thermalHighlights[model] = highlight

end
local function removeThermalHighlight(model)

    local highlight = thermalHighlights[model]

    if highlight then
        highlight:Destroy()
        thermalHighlights[model] = nil
    end

end
-- blood tracker
local function markAnimalWounded(model)

    if woundedAnimals[model] then return end

    woundedAnimals[model] = true

    local highlight = Instance.new("Highlight")
    highlight.Name = "BloodTrailHighlight"
    highlight.FillColor = Color3.fromRGB(255,0,0)
    highlight.OutlineColor = Color3.fromRGB(255,0,0)
    highlight.FillTransparency = 0.6
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = model

    woundedHighlights[model] = highlight

end
local function monitorAnimalHealth(model)

    local humanoid = model:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    animalHealth[model] = humanoid.Health

    humanoid.HealthChanged:Connect(function(newHealth)

        local oldHealth = animalHealth[model]

        if oldHealth and newHealth < oldHealth then
            markAnimalWounded(model)
        end

        animalHealth[model] = newHealth

    end)

end
local projectileEvent = game:GetService("ReplicatedStorage").Remotes.ProjectileFire

projectileEvent.OnClientEvent:Connect(function(player, origin, targetPosition)

    if not bloodTrackerEnabled then return end
    if player ~= LocalPlayer then return end

    local direction = (targetPosition - origin).Unit

    local model = penetratingRaycast(origin, direction * 5000)

    if model then
        markAnimalWounded(model)
    end

end)
local function penetratingRaycast(origin, direction)

    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist

    local currentOrigin = origin

    for i = 1,5 do

        local result = workspace:Raycast(currentOrigin, direction, rayParams)

        if not result then
            return nil
        end

        local model = result.Instance:FindFirstAncestorOfClass("Model")

        if model and model:FindFirstAncestor("Animals") then
            return model
        end

        -- continue ray after object hit (penetration)
        currentOrigin = result.Position + direction.Unit * 0.2

        print("Ray hit:", result.Instance:GetFullName())

    end

    return nil

end
-- magic bullet logic
local function getBestPart(model)
    local part = model:FindFirstChild("HumanoidRootPart")
    
    if not part then part = model:FindFirstChild("Torso") or model:FindFirstChild("UpperTorso") end
    
    if not part then part = model:FindFirstChild("Head") end
    
    if not part then
        for _, child in ipairs(model:GetChildren()) do
            if child:IsA("BasePart") then
                part = child
                break
            end
        end
    end
    
    return part
end
-- esp logic
local function registerAnimal(model)
    if not model:IsA("Model") then return end

    local rootPart = findRootPart(model)
    if not rootPart then return end

    AllAnimals[model] = rootPart

    monitorAnimalHealth(model)
end
local function createESPForModel(model, isDead)
    if not model or not model:IsA("Model") then return end

    local dataTable = isDead and DeadESPData or ESPData
    if dataTable[model] then return end

    if not isDead and next(selectedAnimals) ~= nil and not selectedAnimals[model.Name] then
        return
    end

    local rootPart = findRootPart(model)
    if not rootPart then return end

    local billGui = Instance.new("BillboardGui")
    billGui.Name = isDead and "DeadAnimalESPBillboard" or "AnimalESPBillboard"
    billGui.Adornee = rootPart
    billGui.Size = UDim2.new(0,140,0,30)
    billGui.StudsOffset = Vector3.new(0,2.5,0)
    billGui.AlwaysOnTop = true
    billGui.ResetOnSpawn = false
    billGui.Parent = model

    local label = Instance.new("TextLabel")
    label.Name = "ESPLabel"
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.TextColor3 = isDead and deadEspColor or espColor
    label.TextStrokeColor3 = Color3.new(0,0,0)
    label.TextStrokeTransparency = 0.3
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextScaled = false
    label.Text = ""
    label.Parent = billGui

    dataTable[model] = {
        billGui = billGui,
        label = label,
        part = rootPart
    }
end
local function destroyESPForModel(model, isDead)
    local dataTable = isDead and DeadESPData or ESPData
    local data = dataTable[model]
    if not data then return end
    if data.billGui and data.billGui.Parent then data.billGui:Destroy() end
    dataTable[model] = nil
end
-- Get the animal currently being tracked by the raycast
local function getAnimalFromRaycast()

    local result = crosshairRayResult

    -- normal hit
    if result then
        local model = result.Instance:FindFirstAncestorOfClass("Model")
        if model and model:FindFirstAncestor("Animals") then
            return model
        end
    end

    -- fallback: find closest animal to crosshair
    local cam = workspace.CurrentCamera
    local viewport = cam.ViewportSize
    local center = Vector2.new(viewport.X/2, viewport.Y/2)

    local closestAnimal = nil
    local closestDist = 50 -- pixels

    for model, root in pairs(ActiveAnimals) do
        local pos, onScreen = cam:WorldToViewportPoint(root.Position)

        if onScreen then
            local screenPos = Vector2.new(pos.X, pos.Y)
            local dist = (screenPos - center).Magnitude

            if dist < closestDist then
                closestDist = dist
                closestAnimal = model
            end
        end
    end

    return closestAnimal

end
local function toggleAnimalTracking()

    local animal = getAnimalFromRaycast()

    -- If currently tracking this same animal → turn tracking OFF
    if trackedAnimal and animal == trackedAnimal then
        
        if trackedHighlight then
            trackedHighlight:Destroy()
            trackedHighlight = nil
        end

        trackedAnimal = nil
        removeTrackingArrow()

        return
    end

    -- If aiming at nothing → stop tracking
    if not animal then

        if trackedHighlight then
            trackedHighlight:Destroy()
            trackedHighlight = nil
        end

        trackedAnimal = nil
        removeTrackingArrow()

        return
    end

    -- Remove previous highlight
    if trackedHighlight then
        trackedHighlight:Destroy()
    end

    trackedAnimal = animal

    local highlight = Instance.new("Highlight")
    highlight.Name = "AnimalTrackerHighlight"
    highlight.FillColor = Color3.fromRGB(255,255,0)
    highlight.OutlineColor = Color3.fromRGB(255,255,0)
    highlight.FillTransparency = 0.6
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = animal

    trackedHighlight = highlight

    createTrackingArrow()

end
-- ttp(pos)
local function teleportToPosition(pos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        Rayfield:Notify({Title="Teleported", Content="Successfully teleported to location", Duration=2, Image=4483362458})
    else
        Rayfield:Notify({Title="Teleport Failed", Content="Character not found", Duration=2, Image=4483362458})
    end
end
-- binds
local function onAnimalAdded(child, isDead)
    if child:IsA("Model") then
        registerAnimal(child)
    end
end

local function onAnimalRemoved(child, isDead)
    if child:IsA("Model") then
        destroyESPForModel(child, isDead)
    end
end

local function bindAnimalFolder(folder, isDead)
    folder.ChildAdded:Connect(function(ch) onAnimalAdded(ch, isDead) end)
    folder.DescendantAdded:Connect(function(desc)
        if desc:IsA("Model") then
            local enabled = isDead and deadAnimalESPEnabled or animalESPEnabled
            if enabled then createESPForModel(desc, isDead) end
        end
    end)
    folder.ChildRemoved:Connect(function(ch) onAnimalRemoved(ch, isDead) end)
    folder.DescendantRemoving:Connect(function(desc)
        if desc:IsA("Model") then
            destroyESPForModel(desc, isDead)
        end
    end)
end

local animalsFolder = workspaceRef:FindFirstChild("Animals")
local deadAnimalsFolder = workspaceRef:FindFirstChild("DeadAnimals")
if animalsFolder then bindAnimalFolder(animalsFolder, false) end
if deadAnimalsFolder then bindAnimalFolder(deadAnimalsFolder, true) end
workspaceRef.ChildAdded:Connect(function(ch)
    if ch:IsA("Folder") and ch.Name=="Animals" then bindAnimalFolder(ch,false) end
    if ch:IsA("Folder") and ch.Name=="DeadAnimals" then bindAnimalFolder(ch,true) end
end)

--// FUNCTIONS FOR LOOP
-- zoom update
local function updateZoomOverride()

    if not zoomOverrideEnabled then return end

    if not isAiming() then
        zoomFOV = nil
    end

end
-- distance ui update
local function updateDistanceUI()

    if not distanceInfoEnabled then
        distanceLabel.Visible = false
        return
    end

    if not isAiming() then
        distanceLabel.Visible = false
        return
    end

    local result = crosshairRayResult
    if not result then
        distanceLabel.Visible = false
        return
    end

    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local origin = root and root.Position or crosshairRayOrigin

    local dist = (origin - result.Position).Magnitude
    local yards = math.floor(dist * STUD_TO_YARD)

    if yards > 999 then
        yards = 999
    end

    distanceLabel.Text = yards .. " yd"
    distanceLabel.Visible = true

end
-- crosshair update
local lastAimState = false
camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()

    if not crosshairEnabled then
        removeCrosshair()
        return
    end

    local aiming = isAiming()

    if aiming and not lastAimState then
        createCrosshair()
    elseif not aiming and lastAimState then
        removeCrosshair()
    end

    lastAimState = aiming

end)
-- wounded animals update
local function updateWoundedAnimals()

    for model,highlight in pairs(woundedHighlights) do

        if not model or not model.Parent then
            highlight:Destroy()
            woundedHighlights[model] = nil
            woundedAnimals[model] = nil
            continue
        end

        if model.Parent.Name == "DeadAnimals" then
            highlight.FillColor = Color3.fromRGB(0,255,0)
            highlight.OutlineColor = Color3.fromRGB(0,255,0)
        end

    end

end
-- thermal update
local function updateThermal()

    if not thermalEnabled then
        disableThermalVision()

        for model,_ in pairs(thermalHighlights) do
            removeThermalHighlight(model)
        end

        return
    end

    if not isAiming() then
        disableThermalVision()

        for model,_ in pairs(thermalHighlights) do
            removeThermalHighlight(model)
        end

        return
    end

    enableThermalVision()

    local cam = workspace.CurrentCamera

    for model,root in pairs(ActiveAnimals) do
        local pos = root.Position
        local _,onScreen = cam:WorldToViewportPoint(pos)

        if onScreen then
            addThermalHighlight(model)
        else
            removeThermalHighlight(model)
        end
    end

end
-- magic hitbox update
local function updateMagicHitboxes()

    local cam = workspace.CurrentCamera

    for model, root in pairs(ActiveAnimals) do

        if not model or not model.Parent then
            continue
        end

        local targetPart = getBestPart(model)
        if not targetPart then continue end

        -- save original values once
        if not originalHitboxes[targetPart] then
            originalHitboxes[targetPart] = {
                Size = targetPart.Size,
                Transparency = targetPart.Transparency,
                Color = targetPart.Color,
                Material = targetPart.Material
            }
        end

        local _, onScreen = cam:WorldToViewportPoint(root.Position)

        if magicBulletEnabled and onScreen then

            targetPart.Size = Vector3.new(magicHitboxSize, magicHitboxSize, magicHitboxSize)
            targetPart.Transparency = magicTransparency
            targetPart.Color = magicColor
            targetPart.Material = Enum.Material.ForceField
            targetPart.CanCollide = false
            targetPart.Massless = true

        else

            local original = originalHitboxes[targetPart]

            if original then
                targetPart.Size = original.Size
                targetPart.Transparency = original.Transparency
                targetPart.Color = original.Color
                targetPart.Material = original.Material
            end

        end
    end

end
-- esp update
local function updateESPForModel(model, data, isDead)
    if not data or not data.part or not data.label or not data.billGui then
        return
    end
    if not model:IsDescendantOf(workspaceRef) then destroyESPForModel(model, isDead) return end

    local playerRoot = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:FindFirstChild("Head"))
    if not playerRoot then data.billGui.Enabled = false return end

    local dist = math.floor((playerRoot.Position - data.part.Position).Magnitude)
    
    -- Distance-Based Visibility
    if dist > maxEspDistance then
        data.billGui.Enabled = false
        return
    end

    local worldPos = data.part.Position + Vector3.new(0, 2.5, 0)
    local camera = workspace.CurrentCamera
    local _, onScreen = camera:WorldToViewportPoint(worldPos)
    if not onScreen then data.billGui.Enabled = false return end

    local prefix = isDead and "[DEAD] " or ""
    data.label.Text = prefix .. model.Name .. " [" .. tostring(dist) .. "m]"
    data.billGui.Enabled = isDead and deadAnimalESPEnabled or animalESPEnabled
end
local function scanAndCreateESP(isDead)
    local folderName = isDead and "DeadAnimals" or "Animals"
    local folder = workspaceRef:FindFirstChild(folderName)

    if folder then
        for _,c in ipairs(folder:GetDescendants()) do
            if c:IsA("Model") then
                registerAnimal(c)
            end
        end
    end
end
task.spawn(function()
    while true do
        task.wait(0.7)

        local playerRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not playerRoot then continue end

        local playerPos = playerRoot.Position

        for model, root in pairs(AllAnimals) do
            if not model:IsDescendantOf(workspaceRef) then
                AllAnimals[model] = nil
                ActiveAnimals[model] = nil
                destroyESPForModel(model,false)
                continue
            end

            local dist = (playerPos - root.Position).Magnitude

            if dist <= maxEspDistance then
                if not ActiveAnimals[model] then
                    ActiveAnimals[model] = root
                    createESPForModel(model,false)
                end
            else
                if ActiveAnimals[model] then
                    ActiveAnimals[model] = nil
                    destroyESPForModel(model,false)
                end
            end
        end
    end
end)
-- track animal update
local function updateTrackedAnimal()

    if not trackedAnimal then
        removeTrackingArrow()
        return
    end

    -- animal removed
    if not trackedAnimal.Parent then
        removeTrackingArrow()
        trackedAnimal = nil

        if trackedHighlight then
            trackedHighlight:Destroy()
            trackedHighlight = nil
        end

        return
    end

    -- animal died
    if trackedAnimal.Parent.Name == "DeadAnimals" then
        if trackedHighlight then
            trackedHighlight.FillColor = Color3.fromRGB(255,0,0)
            trackedHighlight.OutlineColor = Color3.fromRGB(255,0,0)
        end
    end

end

--// INPUT HANDLERS
-- zoom override logic
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end

    if zoomOverrideEnabled and input.UserInputType == Enum.UserInputType.MouseButton2 then
        zoomActive = true
    end
end)
UserInputService.InputEnded:Connect(function(input, gpe)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        zoomActive = false
        local settings = UserSettings():GetService("UserGameSettings")
        settings.MouseSensitivity = baseSensitivity
        zoomFOV = nil
    end
end)
UserInputService.InputChanged:Connect(function(input, gpe)
    if gpe then return end
    if not zoomOverrideEnabled then return end
    if input.UserInputType ~= Enum.UserInputType.MouseWheel then return end
    if not isAiming() then return end

    local cam = workspace.CurrentCamera

    -- If game reset zoom, reset override
    if zoomFOV and math.abs(cam.FieldOfView - zoomFOV) > 10 then
        zoomFOV = cam.FieldOfView
    end

    if not zoomFOV then
        zoomFOV = cam.FieldOfView
    end

    if input.Position.Z > 0 then
        zoomFOV = math.max(minZoom, zoomFOV - zoomStep)
    else
        zoomFOV = math.min(maxZoom, zoomFOV + zoomStep)
    end

    cam.FieldOfView = zoomFOV

    local settings = UserSettings():GetService("UserGameSettings")
    local scale = zoomFOV / baseFOV
    settings.MouseSensitivity = baseSensitivity * scale
end)
-- animal tracking toggle logic
UserInputService.InputBegan:Connect(function(input, gpe)

    if gpe then return end
    if not animalTrackingEnabled then return end

    if input.KeyCode == Enum.KeyCode.T then
        toggleAnimalTracking()
    end

end)

--// MAIN UPDATE LOOP
-- the big ol' hearbeat (The Heart)
RunService.Heartbeat:Connect(function()
    -- update tracking compass
    if trackedAnimal and compass then
        updateTrackingArrow()
    end

    -- enforce zoom override
    if zoomOverrideEnabled and zoomFOV and isAiming() then
        local cam = workspace.CurrentCamera
        if cam.FieldOfView ~= zoomFOV then
            cam.FieldOfView = zoomFOV
        end
    end

    updateCrosshairRay()

    if thermalEnabled then
        updateThermal()
    end

    if magicBulletEnabled then
        updateMagicHitboxes()
    end

    if distanceInfoEnabled then
        updateDistanceUI()
    end

    if animalTrackingEnabled then
        updateTrackedAnimal()
    end

    if bloodTrackerEnabled then
        updateWoundedAnimals()
    end

    -- ESP throttle
    local currentTime = tick()
    if currentTime - lastESPUpdate >= 0.2 then
        lastESPUpdate = currentTime

        for model in pairs(ActiveAnimals) do
            local data = ESPData[model]
            if data then
                updateESPForModel(model, data, false)
            end
        end

        if deadAnimalESPEnabled then
            for m,d in pairs(DeadESPData) do
                updateESPForModel(m,d,true)
            end
        end
    end

end)

--// GUI SETUP
-- main tab
MainTab:CreateParagraph({
   Title="Welcome",
   Content="Welcome to Hunting Season Script. Author - R-77 & BabyMaxford."
})
MainTab:CreateParagraph({
   Title="What's New:",
   Content="Fixed and Optimize Magic Bullet and Hitbox, Adjustable Scope, Thermal Scope, Custom Crosshair, Advanced Animal Tracking, Tracking Compass, RangeMaster Scope, Reduce Graphics, Full Bright, Remove Fog, Light Optimazation and Remove Grass"
})
MainTab:CreateParagraph({
   Title="Bugs Found:",
   Content="For some reason, Adjustable Scope does not work in Boulder Creek Map. It does work on other maps though. No Recoil and Blood Tracking are still in development and may not work."
})
-- MAGIC BULLET TAB
AimTab:CreateToggle({
   Name = "Magic Bullet Enabled",
   CurrentValue = false,
   Flag = "MagicBulletToggle",
   Callback = function(v)
      magicBulletEnabled = v
      if v then
          Rayfield:Notify({
              Title = "Magic Bullet",
              Content = "Enabled! Hitboxes are expanding.",
              Duration = 2,
              Image = 4483362458
          })
      else
          for part, data in pairs(originalHitboxes) do
              if part and part.Parent then
                  part.Size = data.Size
                  part.Transparency = data.Transparency
                  part.Color = data.Color
                  part.Material = data.Material
              end
          end
          Rayfield:Notify({
              Title = "Magic Bullet",
              Content = "Disabled.",
              Duration = 2,
              Image = 4483362458
          })
      end
   end
})
AimTab:CreateSlider({
   Name="Hitbox Size", Range={1,50}, Increment=1, Suffix=" Studs",
   CurrentValue=15, Flag="MagicHitboxSize",
   Callback=function(Value)
      magicHitboxSize = Value
   end
})

AimTab:CreateSlider({
    Name="Hitbox Transparency", Range={0,1}, Increment=0.1, Suffix="",
    CurrentValue=0.7, Flag="MagicTransparency",
    Callback=function(Value)
       magicTransparency = Value
    end
 })
AimTab:CreateColorPicker({
    Name="Hitbox Color",
    Color=Color3.fromRGB(255, 0, 0),
    Flag="MagicColor",
    Callback=function(v)
       magicColor = v
    end
 })
AimTab:CreateParagraph({
   Title="Magic Bullet Info",
   Content="Expands animal hitboxes so you can shoot anywhere near them to hit. Disables collision so they don't get stuck."
})
AimTab:CreateSection("Thermal Vision")
AimTab:CreateToggle({
    Name = "Thermal Scope",
    CurrentValue = false,
    Flag = "ThermalScope",
    Callback = function(v)

        thermalEnabled = v

        if not v then
            disableThermalVision()

            for model,_ in pairs(thermalHighlights) do
                removeThermalHighlight(model)
            end
        end

    end
})
AimTab:CreateParagraph({
   Title="Thermal Vision Info",
   Content="When enabled, animals will be highlighted in orange when they are on screen. Additionally, when you aim down sights, the screen will have a thermal vision effect."
})
AimTab:CreateSection("Custom Crosshair")
AimTab:CreateToggle({
    Name = "Custom Crosshair",
    CurrentValue = false,
    Flag = "CustomCrosshair",
    Callback = function(v)

        crosshairEnabled = v

        if not v then
            removeCrosshair()
        end

    end
})
AimTab:CreateColorPicker({
    Name = "Crosshair Color",
    Color = Color3.new(1,1,1),
    Flag = "CrosshairColor",
    Callback = function(v)

        crosshairColor = v

        if crosshairGui then
            removeCrosshair()
            createCrosshair()
        end

    end
})
AimTab:CreateSection("Advanced Animals Spotting")
AimTab:CreateToggle({
    Name = "Animal Tracker (Press T to Spot Animal)",
    CurrentValue = false,
    Flag = "AnimalTrackerToggle",
    Callback = function(v)

        animalTrackingEnabled = v

        if v then
            bloodTrackerEnabled = false
        end

        if not v then
            if trackedHighlight then
                trackedHighlight:Destroy()
                trackedHighlight = nil
                trackedAnimal = nil
            end
        end

    end
})
AimTab:CreateParagraph({
   Title="Advanced Animal Tracking Info",
   Content="When enabled, you can press T while aiming at an animal to spot it. Spotted Highlight not fade out. Press T again to remove the spot highlight. You can spot when aiming using a gun."
})
AimTab:CreateToggle({
   Name = "Tracking Compass",
   CurrentValue = false,
   Flag = "trackingArrow",
   Callback = function(v)
      compass = v
      if not v then
         removeTrackingArrow()
      elseif trackedAnimal then
         createTrackingArrow()
      end
   end,
})
AimTab:CreateParagraph({
   Title="Tracking Compass Info",
   Content="When enabled, track an animal using the Advanced Animal Tracking, and an arrow will appear above you to point where the animal position. Arrow pulsates when the animal is moving or running. Arrow will turn red when the animal dies. And when you are near the animal it will turn opaque. "
})
AimTab:CreateSection("Wounded Animal Tracking")
AimTab:CreateToggle({
    Name = "Blood Tracking (Highlights Wounded Animals)",
    CurrentValue = false,
    Flag = "BloodTrackingToggle",
    Callback = function(v)

        bloodTrackerEnabled = v

        if v then
            animalTrackingEnabled = false

            if trackedHighlight then
                trackedHighlight:Destroy()
                trackedHighlight = nil
                trackedAnimal = nil
            end

            Rayfield:Notify({
                Title = "Blood Tracking Enabled",
                Content = "Animals you shoot will automatically be tracked.",
                Duration = 3
            })
        end

    end
})
AimTab:CreateSection("No Recoil (Experimental)")
AimTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Flag = "NoRecoilToggle",
    Callback = function(v)
        noRecoilEnabled = v
    end
})
AimTab:CreateSection("Adjustable Scope (Experimental)")
AimTab:CreateToggle({
    Name = "Adjustable Scope",
    CurrentValue = false,
    Flag = "ScrollZoom",
    Callback = function(v)
        zoomOverrideEnabled = v

        if not v then
            zoomFOV = nil
        end
        if not v then
            zoomFOV = nil
            UserSettings():GetService("UserGameSettings").MouseSensitivity = baseSensitivity
        end
    end
})
AimTab:CreateParagraph({
   Title="Adjustable Scope Info",
   Content="This will override your scope FOV when aiming with all guns and binoculars. Use scroll wheel to zoom in and out."
})
AimTab:CreateSection("Enable Range Distance")
AimTab:CreateToggle({
    Name = "Show Range Info",
    CurrentValue = false,
    Flag = "DistanceInfo",
    Callback = function(v)
        distanceInfoEnabled = v
        distanceLabel.Visible = false
    end
})
AimTab:CreateParagraph({
   Title="Range Distance Info",
   Content="This will display the distance to the target while aiming. Similar to RangeMaster 8x Scope"
})
-- esp tab
local LiveESPToggle = ESPTab:CreateToggle({
   Name="Live Animal ESP",
   CurrentValue=false,
   Flag="AnimalESP",
   Callback=function(v)
      animalESPEnabled = v
      if not v then
         for m,_ in pairs(ESPData) do destroyESPForModel(m,false) end
         Rayfield:Notify({Title="Live ESP Disabled", Content="Live animal ESP off", Duration=2, Image=4483362458})
      else
         scanAndCreateESP(false)
         Rayfield:Notify({Title="Live ESP Enabled", Content="Live animal ESP on", Duration=2, Image=4483362458})
      end
   end
})

local DeadESPToggle = ESPTab:CreateToggle({
   Name="Dead Animal ESP",
   CurrentValue=false,
   Flag="DeadAnimalESP",
   Callback=function(v)
      deadAnimalESPEnabled = v
      if not v then
         for m,_ in pairs(DeadESPData) do destroyESPForModel(m,true) end
         Rayfield:Notify({Title="Dead ESP Disabled", Content="Dead animal ESP off", Duration=2, Image=4483362458})
      else
         scanAndCreateESP(true)
         Rayfield:Notify({Title="Dead ESP Enabled", Content="Dead animal ESP on", Duration=2, Image=4483362458})
      end
   end
})

ESPTab:CreateColorPicker({
   Name="Live Animals ESP Color",
   Color=Color3.fromRGB(255,200,50),
   Flag="ESPColor",
   Callback=function(v)
      espColor=v
      for _,d in pairs(ESPData) do if d.label then d.label.TextColor3 = espColor end end
   end
})
ESPTab:CreateColorPicker({
   Name="Dead Animals ESP Color",
   Color=Color3.fromRGB(255,100,100),
   Flag="DeadESPColor",
   Callback=function(v)
      deadEspColor=v
      for _,d in pairs(DeadESPData) do if d.label then d.label.TextColor3 = deadEspColor end end
   end
})
ESPTab:CreateSlider({
   Name="ESP Distance Limit",
   Range={100,5000},
   Increment=50,
   Suffix=" Studs",
   CurrentValue=1500,
   Flag="MaxESPDist",
   Callback=function(Value)
      maxEspDistance = Value
   end
})
ESPTab:CreateSection("Track Specific Animals")
local ESPFilterDropdown
ESPFilterDropdown = ESPTab:CreateDropdown({
   Name="Filter Animals",
   Options={"Scan for animals first..."},
   CurrentOption={},
   AllowMultiple=true,
   Flag="AnimalFilter",
   Callback=function(Selected)
      pcall(function()
         selectedAnimals = {}
         if type(Selected) == "table" and #Selected > 0 then
            for _, name in ipairs(Selected) do
               if name ~= "Scan for animals first..." and name ~= "No animals found" then
                   selectedAnimals[name] = true
               end
            end
            Rayfield:Notify({Title="Animal Filter Updated", Content="Filtering specific animals", Duration=2, Image=4483362458})
         else
            Rayfield:Notify({Title="Filter Cleared", Content="Now showing all animals", Duration=2, Image=4483362458})
         end
         
         -- Refresh ESP tags
         for m, _ in pairs(ESPData) do destroyESPForModel(m, false) end
         if animalESPEnabled then scanAndCreateESP(false) end
      end)
   end
})
ESPTab:CreateButton({
   Name="Scan for Nearby Animals",
   Callback=function()
      pcall(function()
         local animalsFolder = workspaceRef:FindFirstChild("Animals")
         if not animalsFolder then return end
         
         local uniqueAnimals = {}
         local optionsList = {}
         
         local playerRoot = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:FindFirstChild("Head"))
         if not playerRoot then return end
         
         local function checkAnimal(model)
            if model:IsA("Model") and not uniqueAnimals[model.Name] then
                local rootPart = findRootPart(model)
                if rootPart then
                    local dist = math.floor((playerRoot.Position - rootPart.Position).Magnitude)
                    if dist <= maxEspDistance then
                        uniqueAnimals[model.Name] = true
                        table.insert(optionsList, model.Name)
                    end
                end
            end
         end
         
         for _, c in ipairs(animalsFolder:GetChildren()) do checkAnimal(c) end
         for _, c in ipairs(animalsFolder:GetDescendants()) do checkAnimal(c) end
         
         table.sort(optionsList)
         if #optionsList == 0 then optionsList = {"No animals found"} end
         
         if ESPFilterDropdown and ESPFilterDropdown.Refresh then
             ESPFilterDropdown:Refresh(optionsList)
             Rayfield:Notify({Title="Scan Complete", Content="Found " .. tostring(#optionsList == 1 and optionsList[1] == "No animals found" and 0 or #optionsList) .. " unique animal types nearby.", Duration=3, Image=4483362458})
         end
      end)
   end
})

ESPTab:CreateParagraph({
   Title="ESP Information",
   Content="Live ESP shows living animals, Dead ESP shows dead animals in red. Use the scan button to update the filter list with animals currently around you."
})

-- tp tab
TeleportTab:CreateSection("Gun Shops")
TeleportTab:CreateButton({Name="Sage Armory", Callback=function() teleportToPosition(Vector3.new(-1312.83, -522.89, -1239.84)) end})
TeleportTab:CreateButton({Name="Smolov's Guns and Ammo", Callback=function() teleportToPosition(Vector3.new(1461.17, -554.26, 2241.36)) end})

TeleportTab:CreateSection("Spawn Areas")
TeleportTab:CreateButton({Name="Pinewood", Callback=function() teleportToPosition(Vector3.new(-1262.16, -553.75, 1738.19)) end})
TeleportTab:CreateButton({Name="Sage Camping", Callback=function() teleportToPosition(Vector3.new(-1299.60, -524.24, -1206.62)) end})
TeleportTab:CreateButton({Name="Theodores Lodge", Callback=function() teleportToPosition(Vector3.new(2412.29, -369.75, -1028.58)) end})
TeleportTab:CreateButton({Name="Valentino", Callback=function() teleportToPosition(Vector3.new(1563.82, -553.75, 2214.23)) end})

TeleportTab:CreateSection("Hunting Towers")
TeleportTab:CreateButton({Name="Hunting Tower #1", Callback=function() teleportToPosition(Vector3.new(2170.05, -527.23, 1874.78)) end})
TeleportTab:CreateButton({Name="Hunting Tower #2", Callback=function() teleportToPosition(Vector3.new(994.57, -475.48, -426.43)) end})
TeleportTab:CreateButton({Name="Hunting Tower #3", Callback=function() teleportToPosition(Vector3.new(-361.78, -551.48, 1524.88)) end})
TeleportTab:CreateButton({Name="Hunting Tower #4", Callback=function() teleportToPosition(Vector3.new(169.32, -480.48, 566.80)) end})

TeleportTab:CreateButton({
   Name="Discover All Locations",
   Callback=function()
      local locs = {
         {pos=Vector3.new(-1262.16, -553.75, 1738.19), name="Pinewood"},
         {pos=Vector3.new(-1299.60, -524.24, -1206.62), name="Sage Camping"},
         {pos=Vector3.new(2412.29, -369.75, -1028.58), name="Theodores Lodge"},
         {pos=Vector3.new(1563.82, -553.75, 2214.23), name="Valentino"}
      }
      for i, l in ipairs(locs) do task.spawn(function() task.wait(0.4*i) teleportToPosition(l.pos) end) end
      Rayfield:Notify({Title="Discovering All Locations", Content="Teleporting to all 4 locations...", Duration=3, Image=4483362458})
   end
})

-- Environment Tab
EnvironmentTab:CreateToggle({
    Name = "Potato Graphics Mode",
    CurrentValue = false,
    Flag = "PotatoGraphics",
    Callback = function(enabled)

        if enabled then

            local Lighting = game:GetService("Lighting")

            pcall(function()
                Lighting.GlobalShadows = false
            end)

            for _,obj in ipairs(workspace:GetDescendants()) do

                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Enabled = false
                end

                if obj:IsA("Explosion") then
                    obj:Destroy()
                end

                if obj:IsA("BasePart") then
                    pcall(function()
                        obj.Material = Enum.Material.SmoothPlastic
                        obj.Reflectance = 0
                    end)
                end

            end

        else

            Rayfield:Notify({
                Title="Reload Recommended",
                Content="Rejoin to restore original graphics.",
                Duration=4
            })

        end
    end
})
EnvironmentTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBright",
    Callback = function(enabled)

        local Lighting = game:GetService("Lighting")

        if enabled then
            Lighting.Brightness = 2
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
        end

    end
})
EnvironmentTab:CreateToggle({
    Name = "Remove Fog / Atmosphere",
    CurrentValue = false,
    Flag = "RemoveFog",
    Callback = function(enabled)

        local Lighting = game:GetService("Lighting")

        if enabled then

            -- Classic fog
            Lighting.FogStart = 0
            Lighting.FogEnd = 1000000

            -- Atmosphere fog
            for _,v in pairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") then
                    v.Density = 0
                    v.Haze = 0
                end
            end

        end

    end
})
EnvironmentTab:CreateButton({
    Name = "Remove Grass (Requires Advanced Executor)",
    Callback = function()

        pcall(function()
            sethiddenproperty(workspace.Terrain,"GrassLength",0)
        end)

        Rayfield:Notify({
            Title="Grass Removed",
            Content="Terrain grass disabled",
            Duration=3
        })

    end
})
EnvironmentTab:CreateButton({
    Name = "Optimize Lighting",
    Callback = function()

        local Lighting = game:GetService("Lighting")

        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.Brightness = 1

        Rayfield:Notify({
            Title="Lighting Optimized",
            Content="Reduced lighting calculations",
            Duration=3
        })

    end
})

-- settings
SettingsTab:CreateButton({
   Name="Destroy GUI",
   Callback=function()
      for m,_ in pairs(ESPData) do destroyESPForModel(m,false) end
      for m,_ in pairs(DeadESPData) do destroyESPForModel(m,true) end
      if speedUpdateConnection then speedUpdateConnection:Disconnect() end
      
      -- Reset cursor visibility on destroy
      UserInputService.MouseIconEnabled = false
      if Window and Window.MainFrame then
          Window.MainFrame.Modal = false
      end
      
      Rayfield:Destroy()
   end
})
SettingsTab:CreateSection("Configuration")
SettingsTab:CreateKeybind({
   Name = "Toggle Live ESP Keybind",
   CurrentKeybind = "G",
   HoldToInteract = false,
   Flag = "LiveESPKeybind",
   Callback = function(Keybind)
      if LiveESPToggle then
         LiveESPToggle:Set(not animalESPEnabled)
      end
   end,
})

SettingsTab:CreateKeybind({
   Name = "Toggle Dead ESP Keybind",
   CurrentKeybind = "H",
   HoldToInteract = false,
   Flag = "DeadESPKeybind",
   Callback = function(Keybind)
      if DeadESPToggle then
         DeadESPToggle:Set(not deadAnimalESPEnabled)
      end
   end,
})

-- init
local animalsFolderInit = workspaceRef:FindFirstChild("Animals")
if animalsFolderInit then
    for _, m in ipairs(animalsFolderInit:GetChildren()) do if m:IsA("Model") then registerAnimal(m) end end
    for _, m in ipairs(animalsFolderInit:GetDescendants()) do if m:IsA("Model") then registerAnimal(m) end end
end
local deadInit = workspaceRef:FindFirstChild("DeadAnimals")
if deadInit then
    for _, m in ipairs(deadInit:GetChildren()) do if m:IsA("Model") then createESPForModel(m,true) end end
    for _, m in ipairs(deadInit:GetDescendants()) do if m:IsA("Model") then createESPForModel(m,true) end end
end

Rayfield:Notify({
   Title = "Script Loaded (last update 09.03.2026)",
   Content = "Hunting Season script loaded successfully! Have fun!",
   Duration = 3,
   Image = 4483362458,
})