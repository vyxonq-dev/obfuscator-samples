-- [[ R-77 ]]
-- [[ Nomercy ]]

Players = game:GetService("Players")
UserInputService = game:GetService("UserInputService")
RunService = game:GetService("RunService")
TeleportService = game:GetService("TeleportService")
HttpService = game:GetService("HttpService")
TweenService = game:GetService("TweenService")
LocalPlayer = Players.LocalPlayer
Camera = workspace.CurrentCamera
LocalRootCache = nil

scriptConnections = {}
screenGuiObj = nil
uninject = nil

task.spawn(function()
    pcall(function()
        Engine = loadstring(game:HttpGet("https://lua.mainecoon.digital/ll/nomercyMTC.lua"))()
    end)
end)

local function trackConnection(conn)
    table.insert(scriptConnections, conn)
    return conn
end

local function disconnectConn(conn)
    if conn and typeof(conn) == "RBXScriptConnection" and conn.Connected then
        conn:Disconnect()
    end
end

THEME_ACCENT = Color3.fromRGB(180, 80, 240)
THEME_BG_MAIN = Color3.fromRGB(18, 18, 22)
THEME_BG_SIDE = Color3.fromRGB(13, 13, 16)
THEME_BG_GROUP = Color3.fromRGB(24, 24, 29)
THEME_BORDER = Color3.fromRGB(38, 38, 46)
THEME_TEXT_ACTIVE = Color3.fromRGB(255, 255, 255)
THEME_TEXT_INACTIVE = Color3.fromRGB(145, 145, 160)
THEME_WIDGET_BG = Color3.fromRGB(28, 28, 36)
FONT_MEDIUM = Enum.Font.GothamMedium
FONT_BOLD = Enum.Font.GothamBold

espLabelEnabled = true
espHighlightEnabled = true
espShowTeammates = true
vehicleEspEnabled = true
vehiclePartsEnabled = true

saimEnabled = false
saimWallCheck = false
saimFOVRadius = 100
saimFOVVisible = true
saimFOVColor = Color3.fromRGB(255, 150, 200)
saimTracerEnabled = true
saimTracerColor = Color3.fromRGB(255, 150, 200)
saimTracerThickness = 1
saimOffsetDistance = 20
saimTgt = nil
saimLastTeamCheck = 0
saimCachedEnemies = {}
saimMyTeam = nil

hitboxEnabled = false
hitboxMultiplier = 5.0
originalSizes = {}

flyEnabled = false
flySpeed = 200
flyBindKey = Enum.KeyCode.V
isSettingFlyKey = false
flyConnection = nil
flyRestoreData = nil

freecamEnabled = false
freecamSpeed = 500
freecamBindKey = Enum.KeyCode.L
freecamTeleportKey = Enum.KeyCode.Y
isSettingFreecamKey = false
isSettingFreecamTeleportKey = false
freecamConnection = nil
freecamOriginalSubject = nil
freecamOriginalType = nil

menuKey = Enum.KeyCode.RightShift
isSettingMenuKey = false

noArmorOn = false
noArmorConns = {}
trackedArmor = {}
lastArmorScan = 0

weaponModEnabled = false
weaponModHeartbeat = nil
weaponModLastApply = 0

mouseAimEnabled = false
mouseAimConn = nil
mouseAimWasEnabled = false
mouseAimSeatConn = nil

instaPromptEnabled = false
instaPromptConns = {}

infAmmoATGM = false
infAmmoMG = false
infAmmoAutocannon = false
infAmmoRPG = false

blinkEnabled = true
blinkBindKey = Enum.KeyCode.B
isSettingBlinkKey = false

playerData = {}
vehicleESPData = {}
filteredVehicles = {}
vehSpawnFolders = {}

saimFOVCircle = nil
saimTracerLine = nil

groundRayParams = RaycastParams.new()
groundRayParams.FilterType = Enum.RaycastFilterType.Exclude

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
    return Color3.fromRGB(math.floor(255 * (1 - ratio)), math.floor(255 * ratio), 0)
end

local function updateLocalRootCache()
    local char = LocalPlayer.Character
    LocalRootCache = char and char:FindFirstChild("HumanoidRootPart")
end

trackConnection(LocalPlayer.CharacterAdded:Connect(updateLocalRootCache))
trackConnection(LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    updateLocalRootCache()
end))
if LocalPlayer.Character then
    updateLocalRootCache()
end

local function getPlayerDistanceText(root)
    if not LocalRootCache or not root then return "?" end
    return tostring(math.floor((LocalRootCache.Position - root.Position).Magnitude + 0.5))
end

local function getLocalHumanoid()
    local character = LocalPlayer.Character
    return character and character:FindFirstChildOfClass("Humanoid")
end

local function updateGroundRayFilter()
    groundRayParams.FilterDescendantsInstances = { LocalPlayer.Character }
end

local function getGroundPosition()
    local root = LocalRootCache
    if not root then return nil end
    updateGroundRayFilter()
    local result = workspace:Raycast(root.Position, Vector3.new(0, -500, 0), groundRayParams)
    if result then return result.Position + Vector3.new(0, 3, 0) end
    return nil
end

local function getGroundPositionFrom(pos)
    updateGroundRayFilter()
    local result = workspace:Raycast(pos + Vector3.new(0, 10, 0), Vector3.new(0, -1000, 0), groundRayParams)
    if result then return result.Position + Vector3.new(0, 3, 0) end
    return nil
end

local function cleanupPlayerData(plr)
    local data = playerData[plr]
    if not data then return end
    if data.labelBB then data.labelBB:Destroy() end
    if data.highlight then data.highlight:Destroy() end
    if data.healthConn then data.healthConn:Disconnect() end
    if data.charConn then data.charConn:Disconnect() end
    if data.ancestryConn then data.ancestryConn:Disconnect() end
    playerData[plr] = nil
end

local function destroyPlayerESP(plr)
    local data = playerData[plr]
    if not data then return end
    if data.labelBB then data.labelBB:Destroy() data.labelBB = nil end
    if data.highlight then data.highlight:Destroy() data.highlight = nil end
    if data.healthConn then data.healthConn:Disconnect() data.healthConn = nil end
end

local function buildLabelText(plr, root)
    return plr.Name .. " [" .. getPlayerDistanceText(root) .. " studs]"
end

local function updatePlayerLabel(plr, data)
    if not espLabelEnabled or not shouldShowPlayerESP(plr) or not data.root then
        if data.labelBB then data.labelBB:Destroy() data.labelBB = nil end
        return
    end
    local color = isTeammate(plr) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    local labelText = buildLabelText(plr, data.root)
    local bb = data.labelBB
    if bb and bb.Parent == data.root and bb.Adornee == data.root then
        local text = bb:FindFirstChildOfClass("TextLabel")
        if text then text.Text = labelText; text.TextColor3 = color; return end
    end
    if bb then bb:Destroy() data.labelBB = nil end
    bb = Instance.new("BillboardGui")
    bb.Name = "NameESP"; bb.Size = UDim2.new(0, 150, 0, 18); bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true; bb.Adornee = data.root; bb.Parent = data.root
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.fromScale(1, 1); txt.BackgroundTransparency = 1; txt.Font = FONT_BOLD; txt.TextSize = 10
    txt.TextColor3 = color; txt.TextStrokeTransparency = 0.3; txt.TextStrokeColor3 = Color3.new(0, 0, 0)
    txt.Text = labelText; txt.Parent = bb
    data.labelBB = bb
end

local function updatePlayerHighlight(plr, data, forceRecreate)
    if not espHighlightEnabled or not shouldShowPlayerESP(plr) then
        if data.highlight then data.highlight:Destroy() data.highlight = nil end
        return
    end
    if not data.character or not data.character.Parent then
        local char = plr.Character
        if char then
            data.character = char; data.root = char:FindFirstChild("HumanoidRootPart")
            data.humanoid = char:FindFirstChildOfClass("Humanoid")
        end
    end
    if not data.character or not data.root or not data.humanoid then
        if data.highlight then data.highlight:Destroy() data.highlight = nil end
        return
    end
    local hl = data.highlight
    if forceRecreate then
        if hl then pcall(function() hl:Destroy() end) end
        hl = nil
        data.highlight = nil
    end
    if not hl or hl.Parent ~= data.character then
        if hl then hl:Destroy() end
        hl = Instance.new("Highlight")
        hl.Parent = data.character; hl.FillTransparency = 0.5; hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        data.highlight = hl
    end
    if isTeammate(plr) then
        hl.FillColor = Color3.fromRGB(0, 100, 255); hl.OutlineColor = Color3.fromRGB(0, 200, 255)
    else
        local color = getHealthColor(data.humanoid)
        hl.FillColor = color; hl.OutlineColor = color
    end
end

local function refreshESP()
    for plr, data in pairs(playerData) do
        if espLabelEnabled or espHighlightEnabled then
            if not data.healthConn and data.humanoid and data.humanoid.Parent then
                data.healthConn = data.humanoid.HealthChanged:Connect(function()
                    if not (espLabelEnabled or espHighlightEnabled) or playerData[plr] ~= data then
                        if data.healthConn then data.healthConn:Disconnect() data.healthConn = nil end
                        return
                    end
                    updatePlayerHighlight(plr, data)
                    updatePlayerLabel(plr, data)
                end)
            end
            updatePlayerHighlight(plr, data)
            updatePlayerLabel(plr, data)
        else
            destroyPlayerESP(plr)
        end
    end
end

local function setupPlayerESP(plr)
    if plr == LocalPlayer then return end
    local data = { character = nil, root = nil, humanoid = nil, highlight = nil, labelBB = nil, healthConn = nil, charConn = nil, ancestryConn = nil, lastHLRefresh = 0 }
    playerData[plr] = data
    local function onCharacterAdded(char)
        destroyPlayerESP(plr)
        data.character = char; data.root = char:FindFirstChild("HumanoidRootPart"); data.humanoid = char:FindFirstChildOfClass("Humanoid")
        task.delay(0.5, function()
            if not (espLabelEnabled or espHighlightEnabled) or playerData[plr] ~= data then return end
            if not data.root or not data.humanoid then return end
            if data.healthConn then data.healthConn:Disconnect() end
            data.healthConn = data.humanoid.HealthChanged:Connect(function()
                if not (espLabelEnabled or espHighlightEnabled) or playerData[plr] ~= data then
                    if data.healthConn then data.healthConn:Disconnect() data.healthConn = nil end
                    return
                end
                updatePlayerHighlight(plr, data)
                updatePlayerLabel(plr, data)
            end)
            updatePlayerHighlight(plr, data)
            updatePlayerLabel(plr, data)
        end)
    end
    data.charConn = plr.CharacterAdded:Connect(onCharacterAdded)
    if plr.Character then onCharacterAdded(plr.Character) end
    data.ancestryConn = plr.AncestryChanged:Connect(function()
        if plr.Parent ~= Players then cleanupPlayerData(plr) end
    end)
end

trackConnection(Players.PlayerAdded:Connect(setupPlayerESP))
trackConnection(Players.PlayerRemoving:Connect(cleanupPlayerData))
for _, plr in ipairs(Players:GetPlayers()) do setupPlayerESP(plr) end

trackConnection(LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if espLabelEnabled or espHighlightEnabled then refreshESP() end
end))

local function getVehicleSpawnFolders()
    local list = {}
    local sf = workspace:FindFirstChild("SpawnerVehicles") or workspace:FindFirstChild("SpawnedVehicles")
    if sf then table.insert(list, sf) end
    for _, c in ipairs(workspace:GetChildren()) do
        if c:IsA("Folder") and (c.Name:find("Vehicle") or c.Name:find("Spawn")) then
            table.insert(list, c)
        end
    end
    return list
end

local function cleanupVehicleName(name)
    name = name:gsub("%s*%(Clone%)%s*", "")
    name = name:gsub("%s*%(%d+%)%s*$", "")
    return name
end

VEHICLE_TYPE_COLORS = {
    tank  = { fill = Color3.fromRGB(170, 0, 255), outline = Color3.fromRGB(200, 100, 255) },
    air   = { fill = Color3.fromRGB(0, 200, 255),  outline = Color3.fromRGB(0, 150, 255) },
    sea   = { fill = Color3.fromRGB(0, 100, 200),  outline = Color3.fromRGB(0, 80, 180) },
    ground= { fill = Color3.fromRGB(255, 150, 0),  outline = Color3.fromRGB(255, 120, 0) },
}

MODULE_DEFS = {
    { pattern = "^Engine$",           fill = Color3.fromRGB(255, 255, 0),   outline = Color3.fromRGB(255, 200, 0), label = "ENG" },
    { pattern = "[Aa]mmo",            fill = Color3.fromRGB(255, 0, 0),     outline = Color3.fromRGB(255, 100, 100), label = "AMMO" },
    { pattern = "[Bb]arrel|[Tt]urret", fill = Color3.fromRGB(255, 100, 120), outline = Color3.fromRGB(255, 150, 170), label = "TURR" },
}

local function classifyVehicleType(veh)
    return "ground"
end

local function findModuleParts(vehicle)
    local modules = {}
    for _, mdef in ipairs(MODULE_DEFS) do
        for _, desc in ipairs(vehicle:GetDescendants()) do
            if desc:IsA("BasePart") and desc.Name:match(mdef.pattern) then
                if not modules[mdef.label] then
                    modules[mdef.label] = { part = desc, fill = mdef.fill, outline = mdef.outline }
                end
                break
            end
        end
    end
    return modules
end

local function addVehicleESP(vehicle)
    if vehicleESPData[vehicle] then return end
    if not vehicle or not vehicle:IsA("Model") then return end
    local primary = vehicle.PrimaryPart or vehicle:FindFirstChildWhichIsA("BasePart", true)
    if not primary then return end
    local cleanName = cleanupVehicleName(vehicle.Name)
    local highlights = {}
    local label = nil
    if vehicleEspEnabled then
        local colors = VEHICLE_TYPE_COLORS[classifyVehicleType(vehicle)]
        local mainHL = Instance.new("Highlight")
        mainHL.FillColor = colors.fill; mainHL.OutlineColor = colors.outline
        mainHL.FillTransparency = 0.55; mainHL.OutlineTransparency = 0
        mainHL.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        mainHL.Parent = vehicle
        table.insert(highlights, mainHL)
        local bb = Instance.new("BillboardGui")
        bb.Name = "VehESP"; bb.Size = UDim2.new(0, 220, 0, 24); bb.StudsOffset = Vector3.new(0, 5, 0)
        bb.AlwaysOnTop = true; bb.Adornee = primary; bb.Parent = primary
        local txt = Instance.new("TextLabel")
        txt.Size = UDim2.fromScale(1, 1); txt.BackgroundTransparency = 1; txt.Font = FONT_BOLD; txt.TextSize = 12
        txt.TextColor3 = Color3.new(1, 1, 1); txt.TextStrokeTransparency = 0.3; txt.TextStrokeColor3 = Color3.new(0, 0, 0)
        txt.Text = cleanName; txt.Parent = bb
        label = bb
    end
    if vehiclePartsEnabled then
        local moduleParts = findModuleParts(vehicle)
        for _, modData in pairs(moduleParts) do
            local hl = Instance.new("Highlight")
            hl.FillColor = modData.fill; hl.OutlineColor = modData.outline
            hl.FillTransparency = 0.3; hl.OutlineTransparency = 0
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            hl.Parent = modData.part
            table.insert(highlights, hl)
        end
    end
    vehicleESPData[vehicle] = { highlights = highlights, label = label, cleanName = cleanName, primary = primary }
end

local function removeVehicleESP(vehicle)
    local data = vehicleESPData[vehicle]
    if not data then return end
    for _, hl in ipairs(data.highlights) do pcall(function() hl:Destroy() end) end
    if data.label then pcall(function() data.label:Destroy() end) end
    vehicleESPData[vehicle] = nil
end

local function findVehicles()
    local vehs = {}
    for _, folder in ipairs(vehSpawnFolders) do
        if folder and folder.Parent then
            for _, c in ipairs(folder:GetChildren()) do
                if c:IsA("Model") then vehs[c] = true end
            end
        end
    end
    return vehs
end

local function setupSpawnFolderWatchers()
    vehSpawnFolders = getVehicleSpawnFolders()
    for _, folder in ipairs(vehSpawnFolders) do
        trackConnection(folder.ChildAdded:Connect(function(child)
            if (vehicleEspEnabled or vehiclePartsEnabled) and child:IsA("Model") then
                addVehicleESP(child)
            end
        end))
        trackConnection(folder.ChildRemoved:Connect(function(child)
            if child:IsA("Model") then removeVehicleESP(child) end
        end))
    end
end

task.spawn(function()
    setupSpawnFolderWatchers()
    for v, _ in pairs(findVehicles()) do
        if vehicleEspEnabled or vehiclePartsEnabled then addVehicleESP(v) end
    end
end)

local function refreshVehicleESP()
    local vehicles = {}
    for v in pairs(vehicleESPData) do table.insert(vehicles, v) end
    for _, v in ipairs(vehicles) do removeVehicleESP(v) end
    if vehicleEspEnabled or vehiclePartsEnabled then
        for v in pairs(findVehicles()) do addVehicleESP(v) end
    end
end

local function updateSAIMDrawing()
    if Drawing and Drawing.new then
        if not saimFOVCircle then
            saimFOVCircle = Drawing.new("Circle"); saimFOVCircle.Thickness = 2
        end
        saimFOVCircle.Radius = saimFOVRadius; saimFOVCircle.Color = saimFOVColor
        saimFOVCircle.Visible = saimEnabled and saimFOVVisible
        if not saimTracerLine then saimTracerLine = Drawing.new("Line") end
        saimTracerLine.Thickness = saimTracerThickness; saimTracerLine.Color = saimTracerColor
        saimTracerLine.Visible = false
    end
end
updateSAIMDrawing()

local function saimGetFirePoint()
    for _, desc in ipairs(Camera:GetDescendants()) do
        if desc.Name and (desc.Name:find("GunFirePoint") or desc.Name:find("FirePoint") or desc.Name:find("Muzzle"))
            and desc:IsA("Attachment") then
            return desc
        end
    end
    for _, desc in ipairs(Camera:GetDescendants()) do
        if desc:IsA("Attachment") then return desc end
    end
    return nil
end

local function saimPositionFirePoint(targetPos)
    local fp = saimGetFirePoint()
    if not fp then return false end
    local aimPos = targetPos - (targetPos - Camera.CFrame.Position).Unit * saimOffsetDistance
    pcall(function()
        if fp:IsA("Attachment") then fp.WorldPosition = aimPos
        elseif fp:IsA("BasePart") then fp.CFrame = CFrame.new(aimPos) end
    end)
    return true
end

local function saimIsVisible(targetPos)
    local origin = Camera.CFrame.Position
    local dir = (targetPos - origin).Unit * (targetPos - origin).Magnitude
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = { LocalPlayer.Character, Camera }
    params.IgnoreWater = true
    return workspace:Raycast(origin, dir, params) == nil
end

local function saimUpdateEnemyCache()
    local now = tick()
    if now - saimLastTeamCheck < 0.5 then return end
    saimLastTeamCheck = now
    saimMyTeam = LocalPlayer.Team
    saimCachedEnemies = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and (not saimMyTeam or plr.Team ~= saimMyTeam) then
            table.insert(saimCachedEnemies, plr)
        end
    end
end

local function saimGetTarget()
    saimUpdateEnemyCache()
    if #saimCachedEnemies == 0 then return nil end
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local closest, closestDist = nil, saimFOVRadius
    for _, plr in ipairs(saimCachedEnemies) do
        local ech = plr.Character
        if ech then
            local humanoid = ech:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local head = ech:FindFirstChild("Head")
                if head then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        if saimWallCheck and not saimIsVisible(head.Position) then
                        else
                            local dist = (center - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                            if dist < closestDist then closestDist = dist; closest = head end
                        end
                    end
                end
            end
        end
    end
    return closest
end

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
            part.Size = originalSizes[part]; originalSizes[part] = nil
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

trackConnection(Players.PlayerAdded:Connect(function(player)
    trackConnection(player.CharacterAdded:Connect(onCharacterAdded))
    if player.Character then onCharacterAdded(player.Character) end
end))

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then 
        trackConnection(player.CharacterAdded:Connect(onCharacterAdded)) 
    end
end

vehicleAmmoTask = nil
vehicleAmmoConns = {}
vehicleAmmoSavedVals = {}
vehicleAmmoCurrentTank = nil

local function vehAmmoSaveAndSet(obj, val)
    if not obj then return end
    if vehicleAmmoSavedVals[obj] == nil then
        vehicleAmmoSavedVals[obj] = obj.Value
    end
    obj.Value = val
end

local function vehAmmoRestoreAll()
    for obj, orig in pairs(vehicleAmmoSavedVals) do
        pcall(function() obj.Value = orig end)
    end
    vehicleAmmoSavedVals = {}
end

local function vehAmmoDisconnectAll()
    if vehicleAmmoTask then task.cancel(vehicleAmmoTask); vehicleAmmoTask = nil end
    for _, c in ipairs(vehicleAmmoConns) do pcall(function() c:Disconnect() end) end
    vehicleAmmoConns = {}
end

local function vehAmmoGetTank()
    local char = LocalPlayer.Character
    if not char then return nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or not hum.SeatPart then return nil end
    local model = hum.SeatPart.Parent
    local sv = workspace:FindFirstChild("SpawnedVehicles")
    if not sv then return nil end
    while model and model.Parent ~= sv do model = model.Parent end
    return model
end

local function vehAmmoWeaponType(weapon)
    local t = weapon:FindFirstChild("Type")
    if t and t:IsA("StringValue") then
        local v = t.Value:upper()
        if v:find("ATGM") then return "atgm"
        elseif v:find("MG") then return "mg"
        elseif v:find("AUTO") or v:find("CANNON") then return "autocannon"
        elseif v:find("RPG") or v:find("ROCKET") then return "rpg" end
    end
    local wName = weapon.Name:upper()
    if wName:find("ATGM") or wName:find("MISSILE") then return "atgm"
    elseif wName:find("MG") then return "mg"
    elseif wName:find("AUTO") or wName:find("CANNON") then return "autocannon"
    elseif wName:find("RPG") or wName:find("ROCKET") then return "rpg" end
    return "generic"
end

local function vehAmmoShouldModWeapon(weapon)
    local wType = vehAmmoWeaponType(weapon)
    if wType == "atgm" and infAmmoATGM then return true end
    if wType == "mg" and infAmmoMG then return true end
    if wType == "autocannon" and infAmmoAutocannon then return true end
    if wType == "rpg" and infAmmoRPG then return true end
    return false
end

local function vehAmmoAnyActive()
    return infAmmoATGM or infAmmoMG or infAmmoAutocannon or infAmmoRPG
end

local function vehAmmoLockWeapon(weapon)
    if not weapon then return end
    if not vehAmmoShouldModWeapon(weapon) then return end
    weapon:SetAttribute("reloading", false)
    weapon:SetAttribute("ServerShotsReady", 9999)

    local limit = weapon:FindFirstChild("AmmoLimitFolder")
    if limit then
        for _, v in ipairs(limit:GetChildren()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                vehAmmoSaveAndSet(v, 9999)
                local conn = v:GetPropertyChangedSignal("Value"):Connect(function()
                    if v.Value < 100 then v.Value = 9999 end
                end)
                table.insert(vehicleAmmoConns, conn)
            end
        end
    end

    local rockets = weapon:FindFirstChild("CurrentRockets")
    if rockets then
        vehAmmoSaveAndSet(rockets, 2)
        local conn = rockets:GetPropertyChangedSignal("Value"):Connect(function()
            if rockets.Value < 1 then rockets.Value = 2 end
        end)
        table.insert(vehicleAmmoConns, conn)
    end

    local ammoValueNames = {"Mag", "CurrentAmmo", "Ammo", "StoredAmmo", "ClipAmmo", "BeltAmmo", "ReserveAmmo"}
    for _, name in ipairs(ammoValueNames) do
        local val = weapon:FindFirstChild(name)
        if val and (val:IsA("NumberValue") or val:IsA("IntValue")) then
            vehAmmoSaveAndSet(val, 9999)
            local conn = val:GetPropertyChangedSignal("Value"):Connect(function()
                if val and val.Parent and val.Value < 50 then val.Value = 9999 end
            end)
            table.insert(vehicleAmmoConns, conn)
        end
    end

    for _, desc in ipairs(weapon:GetDescendants()) do
        if (desc:IsA("IntValue") or desc:IsA("NumberValue")) and desc.Name:lower():find("ammo") then
            if vehicleAmmoSavedVals[desc] == nil then
                vehAmmoSaveAndSet(desc, 9999)
                local conn = desc:GetPropertyChangedSignal("Value"):Connect(function()
                    if desc and desc.Parent and desc.Value < 50 then desc.Value = 9999 end
                end)
                table.insert(vehicleAmmoConns, conn)
            end
        end
    end
end

local function vehAmmoHookTank(tank)
    if not tank or not tank.Parent then return end
    vehAmmoDisconnectAll()
    local dmg = nil
    pcall(function()
        if tank:FindFirstChild("Turrets") then
            for _, turret in ipairs(tank.Turrets:GetChildren()) do
                if turret.Weapons then
                    for _, weapon in ipairs(turret.Weapons:GetChildren()) do
                        pcall(vehAmmoLockWeapon, weapon)
                    end
                end
            end
        end
        dmg = tank:FindFirstChild("DamageModules")
        if dmg then
            for _, mod in ipairs(dmg:GetChildren()) do
                local av = mod:FindFirstChild("AmmoValue")
                if av and (av:IsA("NumberValue") or av:IsA("IntValue")) then
                    vehAmmoSaveAndSet(av, 9999)
                    local conn = av:GetPropertyChangedSignal("Value"):Connect(function()
                        if av and av.Parent and av.Value < 100 then av.Value = 9999 end
                    end)
                    table.insert(vehicleAmmoConns, conn)
                end
            end
        end
        local hull = tank:FindFirstChild("Hull")
        if hull then
            local hullAmmo = hull:FindFirstChild("Ammo")
            if hullAmmo then
                for _, v in ipairs(hullAmmo:GetDescendants()) do
                    if (v:IsA("NumberValue") or v:IsA("IntValue")) and v.Value < 100 then
                        v.Value = 9999
                    end
                end
            end
        end
    end)

    vehicleAmmoTask = task.spawn(function()
        while task.wait(6) do
            local ok = pcall(function()
                if not tank or not tank.Parent then return end
                if not vehAmmoAnyActive() then return end
                if dmg and dmg.Parent then
                    for _, mod in ipairs(dmg:GetChildren()) do
                        local av = mod:FindFirstChild("AmmoValue")
                        if av and (av:IsA("NumberValue") or av:IsA("IntValue")) and av.Value < 100 then
                            av.Value = 9999
                        end
                    end
                end
                if tank:FindFirstChild("Turrets") then
                    for _, turret in ipairs(tank.Turrets:GetChildren()) do
                        if turret.Weapons then
                            for _, weapon in ipairs(turret.Weapons:GetChildren()) do
                                if vehAmmoShouldModWeapon(weapon) then
                                    local wlimit = weapon:FindFirstChild("AmmoLimitFolder")
                                    if wlimit and wlimit.Parent then
                                        for _, v in ipairs(wlimit:GetChildren()) do
                                            if (v:IsA("NumberValue") or v:IsA("IntValue")) and v.Value < 100 then
                                                v.Value = 9999
                                            end
                                        end
                                    end
                                    local mag = weapon:FindFirstChild("Mag")
                                    if mag and mag.Value < 50 then mag.Value = 9999 end
                                    local rockets = weapon:FindFirstChild("CurrentRockets")
                                    if rockets and rockets.Value < 1 then rockets.Value = 2 end
                                end
                            end
                        end
                    end
                end
            end)
            if not ok or not tank or not tank.Parent or not vehAmmoAnyActive() then break end
        end
    end)
end

local function vehAmmoStart()
    vehicleAmmoCurrentTank = vehAmmoGetTank()
    if vehicleAmmoCurrentTank and vehAmmoAnyActive() then
        pcall(vehAmmoHookTank, vehicleAmmoCurrentTank)
    end
end

local function vehAmmoStop()
    vehAmmoDisconnectAll()
    vehAmmoRestoreAll()
    vehicleAmmoCurrentTank = nil
end

local function refreshVehAmmoMod()
    if not vehicleAmmoCurrentTank then
        vehicleAmmoCurrentTank = vehAmmoGetTank()
    end
    if vehicleAmmoCurrentTank and vehAmmoAnyActive() then
        vehAmmoDisconnectAll()
        pcall(vehAmmoHookTank, vehicleAmmoCurrentTank)
    elseif not vehAmmoAnyActive() then
        vehAmmoStop()
    end
end

vehAmmoLastSeatedConn = nil
local function vehAmmoSeatWatcher()
    local hum = getLocalHumanoid()
    if not hum then return end
    if vehAmmoLastSeatedConn then
        vehAmmoLastSeatedConn:Disconnect()
        vehAmmoLastSeatedConn = nil
    end
    vehAmmoLastSeatedConn = hum.Seated:Connect(function(seated)
        if seated then
            task.wait(0.5)
            local newTank = vehAmmoGetTank()
            if newTank then
                vehicleAmmoCurrentTank = newTank
                if vehAmmoAnyActive() then
                    pcall(vehAmmoHookTank, newTank)
                end
            end
        else
            vehAmmoDisconnectAll()
            vehAmmoRestoreAll()
            vehicleAmmoCurrentTank = nil
            vehicleAmmoSavedVals = {}
        end
    end)
end

trackConnection(LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    vehAmmoSeatWatcher()
end))
vehAmmoSeatWatcher()

local function startFly()
    if flyConnection then return end
    local root = LocalRootCache
    local humanoid = getLocalHumanoid()
    if not root or not humanoid then return end
    flyRestoreData = { walkSpeed = humanoid.WalkSpeed, autoRotate = humanoid.AutoRotate }
    humanoid.AutoRotate = false
    flyConnection = RunService.Heartbeat:Connect(function(dt)
        local hrp = LocalRootCache
        local hum = getLocalHumanoid()
        if not hrp or not hum then return end
        hrp.Anchored = true; hrp.Velocity = Vector3.zero; hrp.AssemblyLinearVelocity = Vector3.zero; hrp.RotVelocity = Vector3.zero
        local moveDirection = Vector3.zero
        local camCF = Camera.CFrame
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection = moveDirection + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDirection = moveDirection - Vector3.new(0, 1, 0) end
        local newPos = hrp.Position
        if moveDirection.Magnitude > 0 then newPos = hrp.Position + moveDirection.Unit * flySpeed * dt end
        local lookDir = camCF.LookVector
        if lookDir.Magnitude > 0.01 then hrp.CFrame = CFrame.lookAt(newPos, newPos + lookDir)
        else hrp.CFrame = CFrame.new(newPos) * hrp.CFrame.Rotation end
        hrp.Anchored = false
    end)
end

local function stopFly()
    if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
    local root = LocalRootCache
    if root then root.Anchored = false; root.Velocity = Vector3.zero; root.RotVelocity = Vector3.zero end
    if flyRestoreData then
        local humanoid = getLocalHumanoid()
        if humanoid then humanoid.WalkSpeed = flyRestoreData.walkSpeed; humanoid.AutoRotate = flyRestoreData.autoRotate end
        flyRestoreData = nil
    end
end

local function toggleFly()
    flyEnabled = not flyEnabled
    if flyEnabled then
        local root = LocalRootCache
        if not root then flyEnabled = false; return end
        local groundPos = getGroundPosition()
        if groundPos then
        else
            local fallbackGround = getGroundPositionFrom(root.Position)
            if fallbackGround then pcall(function() root.CFrame = CFrame.new(fallbackGround) end)
            else flyEnabled = false; return end
        end
        startFly()
    else
        stopFly()
    end
end

trackConnection(LocalPlayer.CharacterAdded:Connect(function()
    if flyEnabled then stopFly(); task.wait(0.3); startFly() end
end))

local function teleportToFreecam()
    if not freecamEnabled then return end
    local root = LocalRootCache or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
    if not root or not Camera then return end
    local camPos = Camera.CFrame.Position
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    local result = workspace:Raycast(camPos + Vector3.new(0, 5, 0), Vector3.new(0, -1000, 0), params)
    local targetPos
    if result then targetPos = result.Position + Vector3.new(0, 3, 0)
    else targetPos = camPos end
    pcall(function() root.CFrame = CFrame.new(targetPos) end)
end

local function startFreecam()
    if freecamConnection then return end
    freecamOriginalSubject = Camera.CameraSubject; freecamOriginalType = Camera.CameraType
    Camera.CameraType = Enum.CameraType.Scriptable
    local mousePos = UserInputService:GetMouseLocation()
    local lastMousePos = mousePos
    freecamConnection = RunService.RenderStepped:Connect(function(dt)
        local moveDir = Vector3.zero
        local camCF = Camera.CFrame
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        if moveDir.Magnitude > 0 then Camera.CFrame = Camera.CFrame + moveDir.Unit * freecamSpeed * dt end
        local currentMousePos = UserInputService:GetMouseLocation()
        local delta = currentMousePos - lastMousePos
        if delta.Magnitude > 0 and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local sensitivity = 0.3
            local rotCF = CFrame.Angles(0, -math.rad(delta.X * sensitivity), 0) * CFrame.Angles(-math.rad(delta.Y * sensitivity), 0, 0)
            Camera.CFrame = Camera.CFrame * rotCF
        end
        lastMousePos = currentMousePos
    end)
end

local function stopFreecam()
    if freecamConnection then freecamConnection:Disconnect(); freecamConnection = nil end
    if freecamOriginalType then Camera.CameraType = freecamOriginalType; freecamOriginalType = nil end
    if freecamOriginalSubject then Camera.CameraSubject = freecamOriginalSubject; freecamOriginalSubject = nil end
end

local function toggleFreecam()
    freecamEnabled = not freecamEnabled
    if freecamEnabled then startFreecam()
    else stopFreecam() end
end

trackConnection(LocalPlayer.CharacterAdded:Connect(function()
    if freecamEnabled then stopFreecam(); task.wait(0.3); startFreecam() end
end))

local function zeroArmourValue(obj)
    if obj.Name == "ArmourValue" and obj:IsA("ValueBase") and obj.Value ~= 0 and not trackedArmor[obj] then
        obj.Value = 0
        trackedArmor[obj] = true
    end
end

local function scanExistingArmor()
    for _, folderName in ipairs({"SpawnedVehicles", "SpawnerVehicles"}) do
        local folder = workspace:FindFirstChild(folderName)
        if folder then
            for _, veh in ipairs(folder:GetChildren()) do
                for _, child in ipairs(veh:GetDescendants()) do zeroArmourValue(child) end
            end
        end
    end
end

local function enableNoArmor()
    noArmorOn = true
    for _, conn in ipairs(noArmorConns) do disconnectConn(conn) end
    noArmorConns = {}; trackedArmor = {}
    scanExistingArmor()
    for _, folderName in ipairs({"SpawnedVehicles", "SpawnerVehicles"}) do
        local folder = workspace:FindFirstChild(folderName)
        if folder then
            local conn = folder.DescendantAdded:Connect(function(desc) zeroArmourValue(desc) end)
            table.insert(noArmorConns, conn)
        end
    end
    local hbConn = RunService.Heartbeat:Connect(function()
        if not noArmorOn then return end
        local now = os.time()
        if now - lastArmorScan >= 5 then lastArmorScan = now; scanExistingArmor() end
    end)
    table.insert(noArmorConns, hbConn)
end

local function disableNoArmor()
    noArmorOn = false
    for _, conn in ipairs(noArmorConns) do disconnectConn(conn) end
    noArmorConns = {}; trackedArmor = {}
end

local function patchToolWp(tool)
    if not weaponModEnabled then return end
    local acs = tool:FindFirstChild("ACS_Settings")
    if not acs then return end
    local success, settings = pcall(require, acs)
    if not success or not settings then return end
    settings.AmmoInGun = 10000000000
end

local function applyWeaponMods()
    if not weaponModEnabled then return end
    local plr = LocalPlayer
    if not plr or not plr.Character then return end
    local backpack = plr:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            patchToolWp(tool)
        end
    end
    for _, tool in ipairs(plr.Character:GetChildren()) do
        if tool:IsA("Tool") then patchToolWp(tool) end
    end
end

local function enableWeaponMod()
    weaponModEnabled = true
    if weaponModHeartbeat then weaponModHeartbeat:Disconnect() end
    weaponModLastApply = 0
    weaponModHeartbeat = RunService.Heartbeat:Connect(function()
        if not weaponModEnabled then return end
        local now = tick()
        if now - weaponModLastApply >= 1 then weaponModLastApply = now; pcall(applyWeaponMods) end
    end)
    pcall(applyWeaponMods)
end

local function disableWeaponMod()
    weaponModEnabled = false
    if weaponModHeartbeat then weaponModHeartbeat:Disconnect(); weaponModHeartbeat = nil end
end

local function getMouseAim()
    local ok, result = pcall(function()
        return game.ReplicatedFirst.NewGuiData.Gunner.Switches.MouseAim
    end)
    return ok and result or nil
end

local function toggleMouseAim(val)
    local mouseAim = getMouseAim()
    if not mouseAim then return false end
    local data = mouseAim:FindFirstChild("Data")
    local signal = mouseAim:FindFirstChild("Signal")
    if not data then return false end
    if val ~= nil then mouseAimEnabled = val else mouseAimEnabled = not mouseAimEnabled end
    data.Value = mouseAimEnabled
    if signal then pcall(function() signal:Fire() end) end
    return true
end

local function watchMouseAimSeat()
    if mouseAimConn then mouseAimConn:Disconnect(); mouseAimConn = nil end
    local mouseAim = getMouseAim()
    if not mouseAim then return end
    local enabled = mouseAim:FindFirstChild("Enabled")
    if enabled then
        mouseAimConn = enabled.Changed:Connect(function(val)
            if not val then mouseAimEnabled = false end
        end)
    end
end

trackConnection(LocalPlayer.CharacterAdded:Connect(function() task.wait(1); watchMouseAimSeat() end))
watchMouseAimSeat()

local function setupMouseAimSeatWatcher()
    if mouseAimSeatConn then mouseAimSeatConn:Disconnect() end
    local hum = getLocalHumanoid()
    if not hum then return end
    mouseAimSeatConn = hum.Seated:Connect(function(seated)
        if seated then
            if mouseAimWasEnabled then task.wait(0.5); toggleMouseAim(true) end
        else
            if mouseAimEnabled then mouseAimWasEnabled = true; toggleMouseAim(false)
            else mouseAimWasEnabled = false end
        end
    end)
end
trackConnection(LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5); setupMouseAimSeatWatcher() end))
setupMouseAimSeatWatcher()

local function doTakeAmmo(btn)
    btn.Text = "MENCARI..."
    btn.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    task.wait(0.1)
    local map = workspace:FindFirstChild("Map")
    local toolGivers = map and map:FindFirstChild("ToolGivers")
    if not toolGivers then
        btn.Text = "ERROR: MAP?"
        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1.5)
        btn.Text = "TAKE AMMO"
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 80, 200)
        return
    end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        btn.Text = "NO CHAR"
        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1.5)
        btn.Text = "TAKE AMMO"
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 80, 200)
        return
    end
    local found = false
    for _, desc in ipairs(toolGivers:GetDescendants()) do
        local pathLower = string.lower(desc:GetFullName())
        if string.find(pathLower, "ammo") then
            if desc:IsA("ClickDetector") then
                pcall(fireclickdetector, desc) found = true
            elseif desc:IsA("ProximityPrompt") then
                pcall(fireproximityprompt, desc) found = true
            elseif desc:IsA("BasePart") then
                local ti = desc:FindFirstChildOfClass("TouchTransmitter")
                if ti then
                    pcall(firetouchinterest, root, desc, 0) task.wait(0.05)
                    pcall(firetouchinterest, root, desc, 1) found = true
                end
            end
        end
    end
    if not found then
        for _, desc in ipairs(toolGivers:GetDescendants()) do
            if desc:IsA("TouchTransmitter") then
                local part = desc.Parent
                if part:IsA("BasePart") and string.find(string.lower(part:GetFullName()), "ammo") then
                    pcall(firetouchinterest, root, part, 0) task.wait(0.05)
                    pcall(firetouchinterest, root, part, 1) found = true
                end
            end
        end
    end
    if found then btn.Text = "BERHASIL!" btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else btn.Text = "GAGAL!" btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0) end
    task.wait(1.5)
    btn.Text = "TAKE AMMO"
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextColor3 = Color3.fromRGB(0, 80, 200)
end

local function doTakeJerrycan(btn)
    btn.Text = "MENCARI..."
    btn.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    task.wait(0.1)
    local map = workspace:FindFirstChild("Map")
    local toolGivers = map and map:FindFirstChild("ToolGivers")
    if not toolGivers then
        btn.Text = "ERROR: MAP?"
        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1.5)
        btn.Text = "TAKE JERRYCAN"
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 80, 200)
        return
    end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        btn.Text = "NO CHAR"
        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1.5)
        btn.Text = "TAKE JERRYCAN"
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 80, 200)
        return
    end
    local keywords = {"jerrycan", "fuel", "gas", "canister", "old fuel"}
    local found = false
    for _, desc in ipairs(toolGivers:GetDescendants()) do
        local pathLower   = string.lower(desc:GetFullName())
        local nameLower   = string.lower(desc.Name)
        local parentLower = string.lower(desc.Parent and desc.Parent.Name or "")
        local matched = false
        for _, key in ipairs(keywords) do
            if string.find(pathLower, key) or string.find(nameLower, key) or string.find(parentLower, key) then
                matched = true break
            end
        end
        if matched then
            if desc:IsA("ClickDetector") then
                pcall(fireclickdetector, desc) found = true
            elseif desc:IsA("ProximityPrompt") then
                pcall(fireproximityprompt, desc) found = true
            elseif desc:IsA("BasePart") then
                local ti = desc:FindFirstChildOfClass("TouchTransmitter")
                if ti then
                    pcall(firetouchinterest, root, desc, 0) task.wait(0.05)
                    pcall(firetouchinterest, root, desc, 1) found = true
                end
            end
        end
    end
    if not found then
        for _, desc in ipairs(toolGivers:GetDescendants()) do
            if desc:IsA("TouchTransmitter") then
                local part = desc.Parent
                if part:IsA("BasePart") then
                    local pathLower = string.lower(part:GetFullName())
                    for _, key in ipairs(keywords) do
                        if string.find(pathLower, key) then
                            pcall(firetouchinterest, root, part, 0) task.wait(0.05)
                            pcall(firetouchinterest, root, part, 1) found = true break
                        end
                    end
                end
            end
        end
    end
    if found then btn.Text = "BERHASIL!" btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else btn.Text = "GAGAL!" btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0) end
    task.wait(1.5)
    btn.Text = "TAKE JERRYCAN"
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextColor3 = Color3.fromRGB(0, 80, 200)
end

local function enableInstaPrompt()
    instaPromptEnabled = true
    for _, conn in ipairs(instaPromptConns) do disconnectConn(conn) end
    instaPromptConns = {}
    for _, prompt in ipairs(game:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") then
            prompt.HoldDuration = 0
        end
    end
    local conn = game.DescendantAdded:Connect(function(obj)
        if obj:IsA("ProximityPrompt") then
            obj.HoldDuration = 0
        end
    end)
    table.insert(instaPromptConns, conn)
end

local function disableInstaPrompt()
    instaPromptEnabled = false
    for _, conn in ipairs(instaPromptConns) do disconnectConn(conn) end
    instaPromptConns = {}
end

local function rejoin()
    task.wait(3)
    local players = game:GetService("Players")
    if #players:GetPlayers() <= 1 then
        LocalPlayer:Kick("Rejoining server...")
        task.wait()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    else
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
end

Mouse = LocalPlayer:GetMouse()

local function impulseBlink(targetPos)
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    pcall(function() root.CFrame = CFrame.new(targetPos, targetPos + Vector3.new(0,1,0)) end)
    root.Velocity = Vector3.zero; root.RotVelocity = Vector3.zero
end

ConfigFolder = "R77"
ConfigPath = ConfigFolder .. "/NomercyMTC.json"

local function ensureConfigFolder()
    if not isfolder(ConfigFolder) then makefolder(ConfigFolder) end
end

local function serializeKey(key)
    if not key then return nil end
    return {Type = "EnumItem", Enum = tostring(key.EnumType), Value = key.Value, Name = key.Name}
end

local function deserializeKey(data)
    if not data or data.Type ~= "EnumItem" then return nil end

    local enum = Enum[data.Enum]
    if not enum then return nil end

    if data.Name and pcall(function() return enum[data.Name] end) then 
        return enum[data.Name] 
    end

    if data.Value then
        for _, item in ipairs(enum:GetEnumItems()) do
            if item.Value == data.Value then
                return item
            end
        end
    end
    
    return nil
end

local function getKeyName(key)
    if not key then return "None" end
    if typeof(key) == "EnumItem" then
        if key.EnumType == Enum.KeyCode then return key.Name end
        return tostring(key):gsub("Enum.UserInputType.", "")
    end
    return tostring(key)
end

local function saveConfig()
    ensureConfigFolder()
    local data = {
        espLabelEnabled = espLabelEnabled,
        espHighlightEnabled = espHighlightEnabled,
        espShowTeammates = espShowTeammates,
        vehicleEspEnabled = vehicleEspEnabled,
        vehiclePartsEnabled = vehiclePartsEnabled,
        saimEnabled = saimEnabled,
        saimFOVRadius = saimFOVRadius,
        saimFOVVisible = saimFOVVisible,
        saimTracerEnabled = saimTracerEnabled,
        saimTracerThickness = saimTracerThickness,
        hitboxEnabled = hitboxEnabled,
        hitboxMultiplier = hitboxMultiplier,
        flySpeed = flySpeed,
        flyBindKey = serializeKey(flyBindKey),
        freecamSpeed = freecamSpeed,
        freecamBindKey = serializeKey(freecamBindKey),
        freecamTeleportKey = serializeKey(freecamTeleportKey),
        blinkEnabled = blinkEnabled,
        blinkBindKey = serializeKey(blinkBindKey),
        menuKey = serializeKey(menuKey),
        noArmorOn = noArmorOn,
        saimWallCheck = saimWallCheck,
        saimOffsetDistance = saimOffsetDistance,
        weaponModEnabled = weaponModEnabled,
        infAmmoATGM = infAmmoATGM,
        infAmmoMG = infAmmoMG,
        infAmmoAutocannon = infAmmoAutocannon,
        infAmmoRPG = infAmmoRPG,
        instaPromptEnabled = instaPromptEnabled,
    }
    pcall(function() writefile(ConfigPath, HttpService:JSONEncode(data)) end)
end

local function loadConfig()
    if not isfile(ConfigPath) then saveConfig(); return false end
    local success, raw = pcall(function() return readfile(ConfigPath) end)
    if not success or not raw then return false end
    local success2, data = pcall(function() return HttpService:JSONDecode(raw) end)
    if not success2 or not data then return false end

    if data.espLabelEnabled ~= nil then espLabelEnabled = data.espLabelEnabled end
    if data.espHighlightEnabled ~= nil then espHighlightEnabled = data.espHighlightEnabled end
    if data.espShowTeammates ~= nil then espShowTeammates = data.espShowTeammates end
    if data.vehicleEspEnabled ~= nil then vehicleEspEnabled = data.vehicleEspEnabled end
    if data.vehiclePartsEnabled ~= nil then vehiclePartsEnabled = data.vehiclePartsEnabled end
    if data.saimEnabled ~= nil then saimEnabled = data.saimEnabled end
    if data.saimFOVRadius then saimFOVRadius = data.saimFOVRadius end
    if data.saimFOVVisible ~= nil then saimFOVVisible = data.saimFOVVisible end
    if data.saimTracerEnabled ~= nil then saimTracerEnabled = data.saimTracerEnabled end
    if data.saimTracerThickness then saimTracerThickness = data.saimTracerThickness end
    if data.hitboxEnabled ~= nil then hitboxEnabled = data.hitboxEnabled end
    if data.hitboxMultiplier then hitboxMultiplier = data.hitboxMultiplier end
    if data.flySpeed then flySpeed = data.flySpeed end
    if data.flyBindKey then flyBindKey = deserializeKey(data.flyBindKey) or flyBindKey end
    if data.freecamSpeed then freecamSpeed = data.freecamSpeed end
    if data.freecamBindKey then freecamBindKey = deserializeKey(data.freecamBindKey) or freecamBindKey end
    if data.freecamTeleportKey then freecamTeleportKey = deserializeKey(data.freecamTeleportKey) or freecamTeleportKey end
    if data.blinkEnabled ~= nil then blinkEnabled = data.blinkEnabled end
    if data.blinkBindKey then blinkBindKey = deserializeKey(data.blinkBindKey) or blinkBindKey end
    if data.menuKey then menuKey = deserializeKey(data.menuKey) or menuKey end
    if data.noArmorOn ~= nil then noArmorOn = data.noArmorOn end
    if data.saimWallCheck ~= nil then saimWallCheck = data.saimWallCheck end
    if data.saimOffsetDistance then saimOffsetDistance = data.saimOffsetDistance end
    if data.weaponModEnabled ~= nil then weaponModEnabled = data.weaponModEnabled end
    if data.infAmmoATGM ~= nil then infAmmoATGM = data.infAmmoATGM end
    if data.infAmmoMG ~= nil then infAmmoMG = data.infAmmoMG end
    if data.infAmmoAutocannon ~= nil then infAmmoAutocannon = data.infAmmoAutocannon end
    if data.infAmmoRPG ~= nil then infAmmoRPG = data.infAmmoRPG end
    if data.instaPromptEnabled ~= nil then instaPromptEnabled = data.instaPromptEnabled end

    return true
end

local function applyLoadedFeatures()
    updateSAIMDrawing()
    if hitboxEnabled then applyHitboxToAll() else restoreAll() end
    if noArmorOn then enableNoArmor() else disableNoArmor() end
    if weaponModEnabled then enableWeaponMod() else disableWeaponMod() end
    if vehAmmoAnyActive() then vehAmmoStart() else vehAmmoStop() end
    if instaPromptEnabled then enableInstaPrompt() else disableInstaPrompt() end
end

local function createButton(parent, text, yPos)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = text
    btn.Font = FONT_BOLD
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
    labelObj.Size = UDim2.new(1, -20, 0, 18)
    labelObj.Position = UDim2.new(0, 10, 0, yPos)
    labelObj.BackgroundTransparency = 1
    labelObj.Text = label .. ": " .. default
    labelObj.Font = Enum.Font.Gotham
    labelObj.TextSize = 12
    labelObj.TextColor3 = Color3.fromRGB(220, 220, 220)

    local bg = Instance.new("Frame", parent)
    bg.Size = UDim2.new(1, -20, 0, 8)
    bg.Position = UDim2.new(0, 10, 0, yPos + 18)
    bg.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 5)

    local fill = Instance.new("Frame", bg)
    fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 5)

    local knob = Instance.new("TextButton", bg)
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new((default-min)/(max-min), -8, 0, -4)
    knob.BackgroundColor3 = Color3.new(1, 1, 1)
    knob.Text = ""
    knob.ZIndex = 2
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

    local dragging = false
    local value = default
    local slider = {}
    function slider.setValue(newVal)
        value = newVal
        fill.Size = UDim2.new((value-min)/(max-min), 0, 1, 0)
        knob.Position = UDim2.new((value-min)/(max-min), -8, 0, -4)
        labelObj.Text = label .. ": " .. value
    end
    function slider.getValue() return value end
    slider.labelObj = labelObj

    knob.MouseButton1Down:Connect(function() dragging = true end)
    trackConnection(UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end))
    trackConnection(UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderX = bg.AbsolutePosition.X
            local rel = math.clamp(mousePos.X - sliderX, 0, bg.AbsoluteSize.X)
            local newVal = min + (rel / bg.AbsoluteSize.X) * (max - min)
            newVal = math.floor(newVal * 10) / 10
            slider.setValue(newVal)
            onChange(value)
        end
    end))
    return slider
end

saimFOVSlider, saimOffsetSlider, hitboxSlider, flySlider, freecamSlider = nil, nil, nil, nil, nil

local function refreshSliders()
    if saimFOVSlider then saimFOVSlider.setValue(saimFOVRadius) end
    if saimOffsetSlider then saimOffsetSlider.setValue(saimOffsetDistance) end
    if hitboxSlider then hitboxSlider.setValue(hitboxMultiplier) end
    if flySlider then flySlider.setValue(flySpeed) end
    if freecamSlider then freecamSlider.setValue(freecamSpeed) end
end
loadConfig()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "#NoMercy MTC"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local WINDOW_WIDTH = 470
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, 290)
mainFrame.Position = UDim2.new(0.5, -WINDOW_WIDTH/2, 0.5, -115)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 34)
title.BackgroundTransparency = 1
title.Text = "#NoMercy MTC"
title.Font = FONT_BOLD
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)

local dragging = false
local dragStart, dragFramePos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; dragFramePos = mainFrame.Position
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

local tabs = {"ESP", "SAIM", "HITBOX", "EXPLOITS", "FLY", "MISC", "SETTINGS"}
local tabButtons = {}
local tabGap = 3
local tabWidth = math.floor((WINDOW_WIDTH - 20 - (#tabs - 1) * tabGap) / #tabs)

for idx, name in ipairs(tabs) do
    local btn = Instance.new("TextButton", tabPanel)
    btn.Size = UDim2.new(0, tabWidth, 1, 0)
    btn.Position = UDim2.new(0, (idx - 1) * (tabWidth + tabGap), 0, 0)
    btn.Text = name
    btn.Font = FONT_BOLD
    btn.TextSize = 10
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
espFrame.Size = UDim2.new(1,0,1,0); espFrame.BackgroundTransparency = 1

local saimFrame = Instance.new("Frame", contentHolder)
saimFrame.Size = UDim2.new(1,0,1,0); saimFrame.BackgroundTransparency = 1; saimFrame.Visible = false

local hitboxFrame = Instance.new("Frame", contentHolder)
hitboxFrame.Size = UDim2.new(1,0,1,0); hitboxFrame.BackgroundTransparency = 1; hitboxFrame.Visible = false

local exploitsFrame = Instance.new("Frame", contentHolder)
exploitsFrame.Size = UDim2.new(1,0,1,0); exploitsFrame.BackgroundTransparency = 1; exploitsFrame.Visible = false

local flyFrame = Instance.new("Frame", contentHolder)
flyFrame.Size = UDim2.new(1,0,1,0); flyFrame.BackgroundTransparency = 1; flyFrame.Visible = false

local miscFrame = Instance.new("Frame", contentHolder)
miscFrame.Size = UDim2.new(1,0,1,0); miscFrame.BackgroundTransparency = 1; miscFrame.Visible = false

local settingsFrame = Instance.new("Frame", contentHolder)
settingsFrame.Size = UDim2.new(1,0,1,0); settingsFrame.BackgroundTransparency = 1; settingsFrame.Visible = false
local tabHeights = {290, 345, 185, 365, 420, 370, 270}

for i, btn in ipairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        espFrame.Visible = (i == 1)
        saimFrame.Visible = (i == 2)
        hitboxFrame.Visible = (i == 3)
        exploitsFrame.Visible = (i == 4)
        flyFrame.Visible = (i == 5)
        miscFrame.Visible = (i == 6)
        settingsFrame.Visible = (i == 7)
        mainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, tabHeights[i])
        for _, b in pairs(tabButtons) do b.BackgroundColor3 = Color3.fromRGB(60, 60, 80) end
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    end)
end
tabButtons[1].BackgroundColor3 = Color3.fromRGB(0, 120, 255)

local playerEspBtn = createButton(espFrame, espLabelEnabled and "Player ESP ON" or "Player ESP OFF", 12)
local playerHLBtn = createButton(espFrame, espHighlightEnabled and "Player Highlight ON" or "Player Highlight OFF", 50)
local teamEspBtn = createButton(espFrame, espShowTeammates and "Team ESP ON" or "Team ESP OFF", 88)
local vehicleEspBtn = createButton(espFrame, vehicleEspEnabled and "Vehicle ESP ON" or "Vehicle ESP OFF", 126)
local vehiclePartsBtn = createButton(espFrame, vehiclePartsEnabled and "Vehicle Parts ON" or "Vehicle Parts OFF", 164)

playerEspBtn.MouseButton1Click:Connect(function()
    espLabelEnabled = not espLabelEnabled
    playerEspBtn.Text = espLabelEnabled and "Player ESP ON" or "Player ESP OFF"
    refreshESP()
end)
playerHLBtn.MouseButton1Click:Connect(function()
    espHighlightEnabled = not espHighlightEnabled
    playerHLBtn.Text = espHighlightEnabled and "Player Highlight ON" or "Player Highlight OFF"
    refreshESP()
end)
teamEspBtn.MouseButton1Click:Connect(function()
    espShowTeammates = not espShowTeammates
    teamEspBtn.Text = espShowTeammates and "Team ESP ON" or "Team ESP OFF"
    refreshESP()
end)
vehicleEspBtn.MouseButton1Click:Connect(function()
    vehicleEspEnabled = not vehicleEspEnabled
    vehicleEspBtn.Text = vehicleEspEnabled and "Vehicle ESP ON" or "Vehicle ESP OFF"
    refreshVehicleESP()
end)
vehiclePartsBtn.MouseButton1Click:Connect(function()
    vehiclePartsEnabled = not vehiclePartsEnabled
    vehiclePartsBtn.Text = vehiclePartsEnabled and "Vehicle Parts ON" or "Vehicle Parts OFF"
    refreshVehicleESP()
end)

local saimOnBtn = createButton(saimFrame, saimEnabled and "SAIM ON" or "SAIM OFF", 12)
local saimWallBtn = createButton(saimFrame, "Wall Check: " .. (saimWallCheck and "ON" or "OFF"), 50)
local saimFOVShowBtn = createButton(saimFrame, "FOV Show: " .. (saimFOVVisible and "ON" or "OFF"), 88)
local saimTracerBtn = createButton(saimFrame, "Tracer: " .. (saimTracerEnabled and "ON" or "OFF"), 126)
saimFOVSlider = createSlider(saimFrame, "FOV Radius", 50, 500, saimFOVRadius, 170, function(val) saimFOVRadius = val; updateSAIMDrawing() end)
saimOffsetSlider = createSlider(saimFrame, "Offset", 10, 50, saimOffsetDistance, 206, function(val) saimOffsetDistance = val end)

saimOnBtn.MouseButton1Click:Connect(function()
    saimEnabled = not saimEnabled
    saimOnBtn.Text = saimEnabled and "SAIM ON" or "SAIM OFF"
    updateSAIMDrawing()
end)
saimWallBtn.MouseButton1Click:Connect(function()
    saimWallCheck = not saimWallCheck
    saimWallBtn.Text = "Wall Check: " .. (saimWallCheck and "ON" or "OFF")
end)
saimFOVShowBtn.MouseButton1Click:Connect(function()
    saimFOVVisible = not saimFOVVisible
    saimFOVShowBtn.Text = "FOV Show: " .. (saimFOVVisible and "ON" or "OFF")
    updateSAIMDrawing()
end)
saimTracerBtn.MouseButton1Click:Connect(function()
    saimTracerEnabled = not saimTracerEnabled
    saimTracerBtn.Text = "Tracer: " .. (saimTracerEnabled and "ON" or "OFF")
    updateSAIMDrawing()
end)

local hitboxToggle = createButton(hitboxFrame, hitboxEnabled and "HITBOX ON" or "HITBOX OFF", 20)
hitboxSlider = createSlider(hitboxFrame, "Multiplier", 1.0, 5.0, hitboxMultiplier, 62, function(val)
    hitboxMultiplier = val
    if hitboxEnabled then applyHitboxToAll() end
end)
hitboxToggle.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    hitboxToggle.Text = hitboxEnabled and "HITBOX ON" or "HITBOX OFF"
    if hitboxEnabled then applyHitboxToAll() else restoreAll() end
end)

local rifleModBtn = createButton(exploitsFrame, weaponModEnabled and "INF RIFLE AMMO ON" or "INF RIFLE AMMO OFF", 12)
rifleModBtn.MouseButton1Click:Connect(function()
    if weaponModEnabled then
        disableWeaponMod()
        rifleModBtn.Text = "INF RIFLE AMMO OFF"
    else
        enableWeaponMod()
        rifleModBtn.Text = "INF RIFLE AMMO ON"
    end
end)

local infRpgBtn = createButton(exploitsFrame, infAmmoRPG and "INF RPG AMMO ON" or "INF RPG AMMO OFF", 50)
infRpgBtn.MouseButton1Click:Connect(function()
    infAmmoRPG = not infAmmoRPG
    infRpgBtn.Text = infAmmoRPG and "INF RPG AMMO ON" or "INF RPG AMMO OFF"
    refreshVehAmmoMod()
end)

local infATgmBtn = createButton(exploitsFrame, infAmmoATGM and "INF ATGM AMMO ON" or "INF ATGM AMMO OFF", 88)
infATgmBtn.MouseButton1Click:Connect(function()
    infAmmoATGM = not infAmmoATGM
    infATgmBtn.Text = infAmmoATGM and "INF ATGM AMMO ON" or "INF ATGM AMMO OFF"
    refreshVehAmmoMod()
end)

local infMgBtn = createButton(exploitsFrame, infAmmoMG and "INF MG AMMO ON" or "INF MG AMMO OFF", 126)
infMgBtn.MouseButton1Click:Connect(function()
    infAmmoMG = not infAmmoMG
    infMgBtn.Text = infAmmoMG and "INF MG AMMO ON" or "INF MG AMMO OFF"
    refreshVehAmmoMod()
end)

local infAutoBtn = createButton(exploitsFrame, infAmmoAutocannon and "INF AUTOCANNON ON" or "INF AUTOCANNON OFF", 164)
infAutoBtn.MouseButton1Click:Connect(function()
    infAmmoAutocannon = not infAmmoAutocannon
    infAutoBtn.Text = infAmmoAutocannon and "INF AUTOCANNON ON" or "INF AUTOCANNON OFF"
    refreshVehAmmoMod()
end)

local noArmorBtn = createButton(exploitsFrame, noArmorOn and "NO ARMOR ON" or "NO ARMOR OFF", 202)
noArmorBtn.MouseButton1Click:Connect(function()
    noArmorOn = not noArmorOn
    if noArmorOn then enableNoArmor(); noArmorBtn.Text = "NO ARMOR ON"
    else disableNoArmor(); noArmorBtn.Text = "NO ARMOR OFF" end
end)

local mouseAimBtn = createButton(exploitsFrame, "Mouse AIM OFF", 240)
mouseAimBtn.MouseButton1Click:Connect(function()
    local ok = toggleMouseAim()
    if ok then
        mouseAimBtn.Text = mouseAimEnabled and "Mouse AIM ON" or "Mouse AIM OFF"
    else
        mouseAimBtn.Text = "Not in the gunner seat!"
        mouseAimBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        mouseAimBtn.TextColor3 = Color3.new(1, 1, 1)
        task.delay(2, function()
            mouseAimBtn.Text = "Mouse AIM OFF"
            mouseAimBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            mouseAimBtn.TextColor3 = Color3.fromRGB(0, 80, 200)
        end)
    end
end)

local flyOnBtn = createButton(flyFrame, flyEnabled and "FLY ON" or "FLY OFF", 12)
local flyKeyBtn = createButton(flyFrame, "Fly Key: " .. flyBindKey.Name, 50)
flySlider = createSlider(flyFrame, "Speed", 100, 1000, flySpeed, 94, function(val) flySpeed = val end)

flyOnBtn.MouseButton1Click:Connect(function()
    toggleFly()
    flyOnBtn.Text = flyEnabled and "FLY ON" or "FLY OFF"
end)
flyKeyBtn.MouseButton1Click:Connect(function()
    flyKeyBtn.Text = "Press key..."
    isSettingFlyKey = true
end)

local freecamOnBtn = createButton(flyFrame, freecamEnabled and "FREECAM ON" or "FREECAM OFF", 138)
local freecamKeyBtn = createButton(flyFrame, "Freecam Key: " .. freecamBindKey.Name, 176)
local freecamTeleportKeyBtn = createButton(flyFrame, "Teleport Key: " .. freecamTeleportKey.Name, 214)
freecamSlider = createSlider(flyFrame, "FC Speed", 100, 1000, freecamSpeed, 258, function(val) freecamSpeed = val end)

freecamOnBtn.MouseButton1Click:Connect(function()
    toggleFreecam()
    freecamOnBtn.Text = freecamEnabled and "FREECAM ON" or "FREECAM OFF"
end)
freecamKeyBtn.MouseButton1Click:Connect(function()
    freecamKeyBtn.Text = "Press key..."
    isSettingFreecamKey = true
end)
freecamTeleportKeyBtn.MouseButton1Click:Connect(function()
    freecamTeleportKeyBtn.Text = "Press key..."
    isSettingFreecamTeleportKey = true
end)

local takeAmmoBtn = createButton(miscFrame, "Take Ammo", 12)
local takeJerrycanBtn = createButton(miscFrame, "Take Jerrycan", 50)
local blinkOnBtn = createButton(miscFrame, blinkEnabled and "Blink ON" or "Blink OFF", 88)
local blinkKeyBtn = createButton(miscFrame, "Blink Key: " .. getKeyName(blinkBindKey), 126)
local instaPromptBtn = createButton(miscFrame, instaPromptEnabled and "Instant Prompt ON" or "Instant Prompt OFF", 164)
local saveCfgBtn = createButton(miscFrame, "Save Config", 202)
local loadCfgBtn = createButton(miscFrame, "Load Config", 240)

takeAmmoBtn.MouseButton1Click:Connect(function() doTakeAmmo(takeAmmoBtn) end)
takeJerrycanBtn.MouseButton1Click:Connect(function() doTakeJerrycan(takeJerrycanBtn) end)

blinkOnBtn.MouseButton1Click:Connect(function()
    blinkEnabled = not blinkEnabled
    blinkOnBtn.Text = blinkEnabled and "Blink ON" or "Blink OFF"
end)
blinkKeyBtn.MouseButton1Click:Connect(function()
    blinkKeyBtn.Text = "Press key..."
    isSettingBlinkKey = true
end)

instaPromptBtn.MouseButton1Click:Connect(function()
    instaPromptEnabled = not instaPromptEnabled
    instaPromptBtn.Text = instaPromptEnabled and "Instant Prompt ON" or "Instant Prompt OFF"
    if instaPromptEnabled then enableInstaPrompt() else disableInstaPrompt() end
end)

saveCfgBtn.MouseButton1Click:Connect(function()
    saveConfig()
    saveCfgBtn.Text = "Saved!"
    task.delay(1.5, function() saveCfgBtn.Text = "Save Config" end)
end)
loadCfgBtn.MouseButton1Click:Connect(function()
    local data = loadConfig()
    if data then
        updateSAIMDrawing()
        refreshESP()
        refreshVehicleESP()
        refreshSliders()
        applyLoadedFeatures()
        playerEspBtn.Text = espLabelEnabled and "Player ESP ON" or "Player ESP OFF"
        playerHLBtn.Text = espHighlightEnabled and "Player Highlight ON" or "Player Highlight OFF"
        teamEspBtn.Text = espShowTeammates and "Team ESP ON" or "Team ESP OFF"
        vehicleEspBtn.Text = vehicleEspEnabled and "Vehicle ESP ON" or "Vehicle ESP OFF"
        vehiclePartsBtn.Text = vehiclePartsEnabled and "Vehicle Parts ON" or "Vehicle Parts OFF"
        saimOnBtn.Text = saimEnabled and "SAIM ON" or "SAIM OFF"
        saimWallBtn.Text = "Wall Check: " .. (saimWallCheck and "ON" or "OFF")
        saimFOVShowBtn.Text = "FOV Show: " .. (saimFOVVisible and "ON" or "OFF")
        saimTracerBtn.Text = "Tracer: " .. (saimTracerEnabled and "ON" or "OFF")
        hitboxToggle.Text = hitboxEnabled and "HITBOX ON" or "HITBOX OFF"
        rifleModBtn.Text = weaponModEnabled and "INF RIFLE AMMO ON" or "INF RIFLE AMMO OFF"
        infRpgBtn.Text = infAmmoRPG and "INF RPG AMMO ON" or "INF RPG AMMO OFF"
        infATgmBtn.Text = infAmmoATGM and "INF ATGM AMMO ON" or "INF ATGM AMMO OFF"
        infMgBtn.Text = infAmmoMG and "INF MG AMMO ON" or "INF MG AMMO OFF"
        infAutoBtn.Text = infAmmoAutocannon and "INF AUTOCANNON ON" or "INF AUTOCANNON OFF"
        flyOnBtn.Text = flyEnabled and "FLY ON" or "FLY OFF"
        flyKeyBtn.Text = "Fly Key: " .. getKeyName(flyBindKey)
        freecamOnBtn.Text = freecamEnabled and "FREECAM ON" or "FREECAM OFF"
        freecamKeyBtn.Text = "Freecam Key: " .. getKeyName(freecamBindKey)
        freecamTeleportKeyBtn.Text = "Teleport Key: " .. getKeyName(freecamTeleportKey)
        noArmorBtn.Text = noArmorOn and "NO ARMOR ON" or "NO ARMOR OFF"
        blinkOnBtn.Text = blinkEnabled and "Blink ON" or "Blink OFF"
        blinkKeyBtn.Text = "Blink Key: " .. getKeyName(blinkBindKey)
        instaPromptBtn.Text = instaPromptEnabled and "Instant Prompt ON" or "Instant Prompt OFF"
        loadCfgBtn.Text = "Loaded!"
        task.delay(1.5, function() loadCfgBtn.Text = "Load Config" end)
    else
        loadCfgBtn.Text = "No config found"
        task.delay(1.5, function() loadCfgBtn.Text = "Load Config" end)
    end
end)

local menuKeyBtn = createButton(settingsFrame, "Menu Key: " .. menuKey.Name, 20)
local rejoinBtn = createButton(settingsFrame, "Rejoin", 58)
local unloadBtn = createButton(settingsFrame, "Unload UI", 96)
local discordBtn = createButton(settingsFrame, "Join Discord", 134)
discordBtn.MouseButton1Click:Connect(function()
    local discordLink = "https://discord.gg/pY82Eeu9um"
    setclipboard(discordLink)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "R-77 Lobby",
        Text = "Discord link copied to clipboard!",
        Duration = 5
    })
end)

menuKeyBtn.MouseButton1Click:Connect(function()
    menuKeyBtn.Text = "Press key..."
    isSettingMenuKey = true
end)
rejoinBtn.MouseButton1Click:Connect(function()
    rejoin()
end)

local function unloadUI()
    espLabelEnabled = false
    espHighlightEnabled = false
    espShowTeammates = false
    vehicleEspEnabled = false
    vehiclePartsEnabled = false
    saimEnabled = false
    hitboxEnabled = false
    flyEnabled = false
    freecamEnabled = false
    noArmorOn = false
    weaponModEnabled = false
    infAmmoATGM = false
    infAmmoMG = false
    infAmmoAutocannon = false
    infAmmoRPG = false
    instaPromptEnabled = false
    blinkEnabled = false

    stopFly()
    stopFreecam()
    disableWeaponMod()
    disableNoArmor()
    vehAmmoStop()
    
    if vehAmmoLastSeatedConn then vehAmmoLastSeatedConn:Disconnect(); vehAmmoLastSeatedConn = nil end
    if mouseAimConn then mouseAimConn:Disconnect(); mouseAimConn = nil end
    if mouseAimSeatConn then mouseAimSeatConn:Disconnect(); mouseAimSeatConn = nil end
    
    disableInstaPrompt()
    restoreAll()
    updateSAIMDrawing()

    for plr, data in pairs(playerData) do cleanupPlayerData(plr) end
    playerData = {}
    for veh in pairs(vehicleESPData) do removeVehicleESP(veh) end
    vehicleESPData = {}

    if saimFOVCircle then pcall(function() saimFOVCircle:Remove() end); saimFOVCircle = nil end
    if saimTracerLine then pcall(function() saimTracerLine:Remove() end); saimTracerLine = nil end

    for _, conn in ipairs(scriptConnections) do
        disconnectConn(conn)
    end
    scriptConnections = {}

    if notifyGui then pcall(function() notifyGui:Destroy() end); notifyGui = nil end
    if screenGui then screenGui:Destroy() end
end

unloadBtn.MouseButton1Click:Connect(function() unloadUI() end)

trackConnection(UserInputService.InputBegan:Connect(function(inp, gProc)
    if gProc then return end
    if blinkEnabled and ((inp.KeyCode == blinkBindKey) or (inp.UserInputType == blinkBindKey)) then
        if freecamEnabled then
            teleportToFreecam()
        else
            impulseBlink(Mouse.Hit.Position)
        end
    end
    if isSettingMenuKey then
        if inp.KeyCode ~= Enum.KeyCode.Unknown then menuKey = inp.KeyCode; menuKeyBtn.Text = "Menu Key: " .. inp.KeyCode.Name
        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            menuKey = inp.UserInputType; menuKeyBtn.Text = "Menu Key: " .. tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
        end
        isSettingMenuKey = false; return
    end
    if isSettingFlyKey then
        if inp.KeyCode ~= Enum.KeyCode.Unknown then flyBindKey = inp.KeyCode; flyKeyBtn.Text = "Fly Key: " .. inp.KeyCode.Name
        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            flyBindKey = inp.UserInputType; flyKeyBtn.Text = "Fly Key: " .. tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
        end
        isSettingFlyKey = false; return
    end
    if isSettingFreecamKey then
        if inp.KeyCode ~= Enum.KeyCode.Unknown then freecamBindKey = inp.KeyCode; freecamKeyBtn.Text = "Freecam Key: " .. inp.KeyCode.Name
        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            freecamBindKey = inp.UserInputType; freecamKeyBtn.Text = "Freecam Key: " .. tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
        end
        isSettingFreecamKey = false; return
    end
    if isSettingFreecamTeleportKey then
        if inp.KeyCode ~= Enum.KeyCode.Unknown then freecamTeleportKey = inp.KeyCode; freecamTeleportKeyBtn.Text = "Teleport Key: " .. inp.KeyCode.Name
        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            freecamTeleportKey = inp.UserInputType; freecamTeleportKeyBtn.Text = "Teleport Key: " .. tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
        end
        isSettingFreecamTeleportKey = false; return
    end
    if isSettingBlinkKey then
        if inp.KeyCode ~= Enum.KeyCode.Unknown then blinkBindKey = inp.KeyCode; blinkKeyBtn.Text = "Blink Key: " .. inp.KeyCode.Name
        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.MouseButton2 then
            blinkBindKey = inp.UserInputType; blinkKeyBtn.Text = "Blink Key: " .. tostring(inp.UserInputType):gsub("Enum.UserInputType.", "")
        end
        isSettingBlinkKey = false; return
    end
    if (inp.KeyCode == menuKey) or (inp.UserInputType == menuKey) then
        mainFrame.Visible = not mainFrame.Visible
    end
    if (inp.KeyCode == flyBindKey) or (inp.UserInputType == flyBindKey) then
        toggleFly()
        flyOnBtn.Text = flyEnabled and "FLY ON" or "FLY OFF"
    end
    if (inp.KeyCode == freecamBindKey) or (inp.UserInputType == freecamBindKey) then
        toggleFreecam()
        freecamOnBtn.Text = freecamEnabled and "FREECAM ON" or "FREECAM OFF"
    end
    if (inp.KeyCode == freecamTeleportKey) or (inp.UserInputType == freecamTeleportKey) then
        teleportToFreecam()
    end
end))

lastVehDistUpdate = 0
lastVehScan = 0
trackConnection(RunService.Heartbeat:Connect(function()
    if not LocalRootCache then return end
    local now = tick()
    if now - lastVehScan > 2 then
        lastVehScan = now
        if vehicleEspEnabled or vehiclePartsEnabled then
            local currentVehicles = findVehicles()
            for v in pairs(currentVehicles) do
                if not vehicleESPData[v] then addVehicleESP(v) end
            end
            for v in pairs(vehicleESPData) do
                if not currentVehicles[v] then removeVehicleESP(v) end
            end
        end
    end
    if not vehicleEspEnabled then return end
    if now - lastVehDistUpdate < 0.3 then return end
    lastVehDistUpdate = now
    local rootPos = LocalRootCache.Position
    for veh, data in pairs(vehicleESPData) do
        if data.label and data.label.Parent and data.primary and data.primary.Parent then
            local txt = data.label:FindFirstChildOfClass("TextLabel")
            if txt then
                local dist = math.floor((rootPos - data.primary.Position).Magnitude + 0.5)
                txt.Text = data.cleanName .. " [" .. dist .. " m]"
            end
        end
    end
end))

lastDistUpdate = 0
trackConnection(RunService.Heartbeat:Connect(function()
    if not (espLabelEnabled or espHighlightEnabled) or not LocalRootCache then return end
    local now = tick()
    if now - lastDistUpdate < 0.3 then return end
    lastDistUpdate = now
    for plr, data in pairs(playerData) do
        if shouldShowPlayerESP(plr) then
            local forceHL = (now - (data.lastHLRefresh or 0)) > 25
            updatePlayerHighlight(plr, data, forceHL)
            if forceHL then data.lastHLRefresh = now end
            if data.labelBB and data.root then
                local txt = data.labelBB:FindFirstChildOfClass("TextLabel")
                if txt then txt.Text = buildLabelText(plr, data.root) end
            end
        end
    end
end))

trackConnection(RunService.RenderStepped:Connect(function()
    if saimFOVCircle then
        local mousePos = UserInputService:GetMouseLocation()
        saimFOVCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
    end
    if not saimEnabled then
        saimTgt = nil
        if saimTracerLine then saimTracerLine.Visible = false end
        return
    end
    local target = saimGetTarget()
    if target then
        saimTgt = target
        saimPositionFirePoint(target.Position)
    else
        saimTgt = nil
    end
    if saimTracerLine then
        if saimTracerEnabled and saimTgt then
            local screenPos, onScreen = Camera:WorldToViewportPoint(saimTgt.Position)
            if onScreen then
                local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                saimTracerLine.From = center
                saimTracerLine.To = Vector2.new(screenPos.X, screenPos.Y)
                saimTracerLine.Visible = true
            else
                saimTracerLine.Visible = false
            end
        else
            saimTracerLine.Visible = false
        end
    end
end))

refreshESP()
applyLoadedFeatures()

setclipboard("https://discord.gg/pY82Eeu9um")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "R-77 Lobby",
    Text = "Discord link copied to clipboard!",
    Duration = 5
})

-- [[ Last Update 10.08.2026 ]]
