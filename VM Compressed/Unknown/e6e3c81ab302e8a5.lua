local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Environment = getgenv and getgenv() or shared

if Environment.LostFrontDrawingESP and type(Environment.LostFrontDrawingESP.Unload) == "function" then
    pcall(Environment.LostFrontDrawingESP.Unload)
end

if not Drawing or type(Drawing.new) ~= "function" then
    error("Drawing library is not supported by this executor")
end

local Repository = "https://raw.githubusercontent.com/Ali-lov3/Obsidian-UiLibs/refs/heads/main/"
local Library = loadstring(game:HttpGet(Repository .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(Repository .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(Repository .. "addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles

local Controller = {
    Unloaded = false,
    TeamRegistryFound = false,
    LocalTeam = "unknown",
    SilentTarget = nil,
    SilentTargetKind = nil,
    FastCastHookInstalled = false,
    FastCastCalls = 0,
    SilentRedirects = 0,
    LastSilentTarget = "",
    Connections = {},
    PlayerEntries = {},
    DroneEntries = {},
    Settings = {
        SilentAimEnabled = true,
        SilentAimTeamCheck = true,
        SilentAimVisibilityCheck = true,
        SilentAimPrediction = true,
        SilentAimHitChance = 100,
        SilentAimTargetType = "Players and Drones",
        SilentAimTargetPart = "Head",
        SilentAimMaxDistance = 2500,
        SilentAimFOV = 150,
        SilentAimShowFOV = true,
        SilentAimFOVColor = Color3.fromRGB(255, 255, 255),
        SilentAimLockedFOVColor = Color3.fromRGB(80, 255, 140),
        SilentAimFOVThickness = 1,
        SilentAimFOVOpacity = 0.8,
        PlayerEnabled = true,
        PlayerBoxes = true,
        PlayerNames = true,
        PlayerDistance = true,
        PlayerTracers = false,
        ShowTeammates = false,
        PlayerMaxDistance = 2500,
        EnemyColor = Color3.fromRGB(255, 80, 80),
        TeammateColor = Color3.fromRGB(80, 180, 255),
        DroneEnabled = true,
        DroneBoxes = true,
        DroneNames = true,
        DroneTeams = true,
        DroneDistance = true,
        DroneTracers = false,
        DroneRearArrows = true,
        DroneTeamCheck = true,
        ShowOwnDrone = false,
        DroneMaxDistance = 2500,
        FriendlyDroneColor = Color3.fromRGB(80, 180, 255),
        EnemyDroneColor = Color3.fromRGB(255, 90, 70),
        UnknownDroneColor = Color3.fromRGB(255, 210, 70),
        RearArrowRadius = 70,
        RearArrowSize = 11,
        BoxThickness = 1,
        TextSize = 13,
        Opacity = 1
    }
}

Environment.LostFrontDrawingESP = Controller

local function addConnection(connection)
    table.insert(Controller.Connections, connection)
    return connection
end

local function createDrawing(kind, properties)
    local object = Drawing.new(kind)
    for property, value in pairs(properties) do
        object[property] = value
    end
    return object
end

local function removeDrawing(object)
    if not object then
        return
    end
    pcall(function()
        object.Visible = false
    end)
    pcall(function()
        if object.Remove then
            object:Remove()
        else
            object:Destroy()
        end
    end)
end

local SilentFOVCircle = createDrawing("Circle", {
    Visible = false,
    Filled = false,
    Color = Controller.Settings.SilentAimFOVColor,
    NumSides = 72,
    Radius = Controller.Settings.SilentAimFOV,
    Thickness = Controller.Settings.SilentAimFOVThickness,
    Transparency = Controller.Settings.SilentAimFOVOpacity,
    ZIndex = 5
})

Controller.SilentFOVCircle = SilentFOVCircle

local function createVisual(includeRearArrow)
    local font = Drawing.Fonts and (Drawing.Fonts.Plex or Drawing.Fonts.UI) or 2
    local visual = {
        Outline = createDrawing("Square", {
            Visible = false,
            Filled = false,
            Color = Color3.new(0, 0, 0),
            Thickness = 3,
            Transparency = 1,
            ZIndex = 1
        }),
        Box = createDrawing("Square", {
            Visible = false,
            Filled = false,
            Color = Color3.new(1, 1, 1),
            Thickness = 1,
            Transparency = 1,
            ZIndex = 2
        }),
        Text = createDrawing("Text", {
            Visible = false,
            Center = true,
            Outline = true,
            OutlineColor = Color3.new(0, 0, 0),
            Color = Color3.new(1, 1, 1),
            Size = 13,
            Font = font,
            Transparency = 1,
            ZIndex = 3
        }),
        Tracer = createDrawing("Line", {
            Visible = false,
            Color = Color3.new(1, 1, 1),
            Thickness = 1,
            Transparency = 1,
            ZIndex = 2
        })
    }
    if includeRearArrow then
        visual.ArrowTop = createDrawing("Line", {
            Visible = false,
            Color = Color3.new(1, 1, 1),
            Thickness = 2,
            Transparency = 1,
            ZIndex = 4
        })
        visual.ArrowBottom = createDrawing("Line", {
            Visible = false,
            Color = Color3.new(1, 1, 1),
            Thickness = 2,
            Transparency = 1,
            ZIndex = 4
        })
    end
    return visual
end

local function hideVisual(visual)
    visual.Outline.Visible = false
    visual.Box.Visible = false
    visual.Text.Visible = false
    visual.Tracer.Visible = false
    if visual.ArrowTop then
        visual.ArrowTop.Visible = false
        visual.ArrowBottom.Visible = false
    end
end

local function removeVisual(visual)
    removeDrawing(visual.Outline)
    removeDrawing(visual.Box)
    removeDrawing(visual.Text)
    removeDrawing(visual.Tracer)
    removeDrawing(visual.ArrowTop)
    removeDrawing(visual.ArrowBottom)
end

local function getAnchor(model)
    if not model or not model:IsA("Model") then
        return nil
    end
    return model.PrimaryPart
        or model:FindFirstChild("HumanoidRootPart")
        or model:FindFirstChild("Head")
        or model:FindFirstChildWhichIsA("BasePart", true)
end

local function getBounds(model, camera)
    local success, boxCFrame, boxSize = pcall(model.GetBoundingBox, model)
    if not success or boxSize.Magnitude <= 0 then
        return nil
    end

    local minX = math.huge
    local minY = math.huge
    local maxX = -math.huge
    local maxY = -math.huge

    for x = -1, 1, 2 do
        for y = -1, 1, 2 do
            for z = -1, 1, 2 do
                local worldPoint = boxCFrame:PointToWorldSpace(Vector3.new(
                    boxSize.X * x * 0.5,
                    boxSize.Y * y * 0.5,
                    boxSize.Z * z * 0.5
                ))
                local screenPoint = camera:WorldToViewportPoint(worldPoint)
                if screenPoint.Z <= 0 then
                    return nil
                end
                minX = math.min(minX, screenPoint.X)
                minY = math.min(minY, screenPoint.Y)
                maxX = math.max(maxX, screenPoint.X)
                maxY = math.max(maxY, screenPoint.Y)
            end
        end
    end

    local viewport = camera.ViewportSize
    if maxX < 0 or maxY < 0 or minX > viewport.X or minY > viewport.Y then
        return nil
    end

    minX = math.clamp(minX, 0, viewport.X)
    minY = math.clamp(minY, 0, viewport.Y)
    maxX = math.clamp(maxX, 0, viewport.X)
    maxY = math.clamp(maxY, 0, viewport.Y)

    local width = maxX - minX
    local height = maxY - minY
    if width < 2 or height < 2 then
        return nil
    end

    return Vector2.new(minX, minY), Vector2.new(width, height)
end

local function getDistanceOrigin(camera)
    local character = LocalPlayer.Character
    local anchor = getAnchor(character)
    return anchor and anchor.Position or camera.CFrame.Position
end

local TeamRegistry
local LastTeamRegistrySearch = 0

local function getTeamRegistry()
    if TeamRegistry and type(TeamRegistry.players) == "table" then
        return TeamRegistry
    end

    if os.clock() - LastTeamRegistrySearch < 2 then
        return nil
    end

    LastTeamRegistrySearch = os.clock()
    if type(filtergc) ~= "function" then
        return nil
    end

    local success, registry = pcall(filtergc, "table", {
        Keys = { "isFriendly", "getclient", "getEnemyTeam", "getPlayer", "players" }
    }, true)

    if not success or type(registry) ~= "table" or type(registry.players) ~= "table" then
        return nil
    end

    TeamRegistry = registry
    Controller.TeamRegistryFound = true
    local clientData = registry.players[LocalPlayer]
    Controller.LocalTeam = clientData and clientData.team or "unknown"
    return registry
end

local function getPlayerTeamState(player)
    if not player then
        return nil, "unknown"
    end

    local registry = getTeamRegistry()
    if registry then
        local clientData = registry.players[LocalPlayer]
        local playerData = registry.players[player]
        if clientData and playerData and clientData.team and playerData.team then
            return clientData.team == playerData.team, tostring(playerData.team)
        end
    end

    if player == LocalPlayer then
        return true, "ally"
    end

    if LocalPlayer.Team and player.Team then
        return LocalPlayer.Team == player.Team, player.Team.Name
    end

    local localCharacter = LocalPlayer.Character
    local character = player.Character
    if not localCharacter or not character then
        return nil, "unknown"
    end

    local localContainer = localCharacter.Parent
    local targetContainer = character.Parent
    if not localContainer or not targetContainer or localContainer == Workspace or targetContainer == Workspace then
        return nil, "unknown"
    end

    local friendly = localContainer == targetContainer
    return friendly, friendly and "ally" or "enemy"
end

local function isTeammate(player)
    local friendly = getPlayerTeamState(player)
    return friendly == true
end

local SilentAimRandom = Random.new()
local LastSilentTargetUpdate = 0
local ProjectileModule
local CalculateDirectionTarget
local OriginalCalculateDirection
local HookedCalculateDirection

local function getSilentTargetPart(player, randomize)
    local character = player and player.Character
    if not character then
        return nil
    end

    local selected = Controller.Settings.SilentAimTargetPart
    local names
    if selected == "Random" then
        if randomize then
            names = { "Head", "UpperTorso", "Torso", "HumanoidRootPart", "LowerTorso" }
            for index = #names, 2, -1 do
                local other = SilentAimRandom:NextInteger(1, index)
                names[index], names[other] = names[other], names[index]
            end
        else
            names = { "Head", "UpperTorso", "Torso", "HumanoidRootPart", "LowerTorso" }
        end
    else
        names = { selected, "Head", "UpperTorso", "Torso", "HumanoidRootPart" }
    end

    for _, name in ipairs(names) do
        local part = character:FindFirstChild(name)
        if part and part:IsA("BasePart") then
            return part
        end
    end

    return getAnchor(character)
end

local function getSilentDronePart(model)
    if not model or not model:IsA("Model") then
        return nil
    end

    local hitbox = model:FindFirstChild("hitbox")
    if hitbox and hitbox:IsA("BasePart") then
        return hitbox
    end

    local aimPoint = model:FindFirstChild("AimPoint")
    if aimPoint and aimPoint:IsA("BasePart") then
        return aimPoint
    end

    return getAnchor(model)
end

local function isSilentTargetVisible(container, part, camera)
    if not Controller.Settings.SilentAimVisibilityCheck then
        return true
    end

    if not container or not part or not camera then
        return false
    end

    local exclusions = { camera }
    if LocalPlayer.Character then
        table.insert(exclusions, LocalPlayer.Character)
    end
    local ignore = Workspace:FindFirstChild("ignore")
    if ignore then
        table.insert(exclusions, ignore)
    end

    local parameters = RaycastParams.new()
    parameters.FilterType = Enum.RaycastFilterType.Exclude
    parameters.FilterDescendantsInstances = exclusions
    parameters.IgnoreWater = true

    local origin = camera.CFrame.Position
    local result = Workspace:Raycast(origin, part.Position - origin, parameters)
    return result == nil or result.Instance:IsDescendantOf(container)
end

local function isSilentPlayerEligible(player, part, camera)
    if not player or player == LocalPlayer or not part then
        return false
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not character
        or not character:IsDescendantOf(Workspace)
        or humanoid and humanoid.Health <= 0
        or Controller.Settings.SilentAimTeamCheck and isTeammate(player) then
        return false
    end

    local distance = (part.Position - camera.CFrame.Position).Magnitude
    return distance <= Controller.Settings.SilentAimMaxDistance
        and isSilentTargetVisible(character, part, camera)
end

local function isSilentDroneEligible(model, part, camera)
    if not model or not model:IsA("Model") or not part or not model:IsDescendantOf(Workspace) then
        return false
    end

    local ownerName = model:GetAttribute("player")
    local throttle = model:GetAttribute("throttle")
    if type(ownerName) ~= "string" or ownerName == "" or throttle == nil then
        return false
    end

    local ownerPlayer = Players:FindFirstChild(ownerName)
    if ownerPlayer == LocalPlayer then
        return false
    end
    if Controller.Settings.SilentAimTeamCheck and ownerPlayer and isTeammate(ownerPlayer) then
        return false
    end

    local distance = (part.Position - camera.CFrame.Position).Magnitude
    return distance <= Controller.Settings.SilentAimMaxDistance
        and isSilentTargetVisible(model, part, camera)
end

local function updateSilentAimTarget(camera)
    local settings = Controller.Settings
    local center = camera.ViewportSize * 0.5

    SilentFOVCircle.Position = center
    SilentFOVCircle.Radius = settings.SilentAimFOV
    SilentFOVCircle.Thickness = settings.SilentAimFOVThickness
    SilentFOVCircle.Transparency = settings.SilentAimFOVOpacity
    SilentFOVCircle.Visible = settings.SilentAimEnabled and settings.SilentAimShowFOV

    if not settings.SilentAimEnabled then
        Controller.SilentTarget = nil
        Controller.SilentTargetKind = nil
        SilentFOVCircle.Color = settings.SilentAimFOVColor
        return
    end

    local now = os.clock()
    if now - LastSilentTargetUpdate < 0.05 then
        SilentFOVCircle.Color = Controller.SilentTarget and settings.SilentAimLockedFOVColor or settings.SilentAimFOVColor
        return
    end

    LastSilentTargetUpdate = now
    local bestTarget
    local bestKind
    local bestScreenDistance = settings.SilentAimFOV
    local targetType = settings.SilentAimTargetType

    if targetType ~= "Drones" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local part = getSilentTargetPart(player, false)
                if part then
                    local screenPoint, onScreen = camera:WorldToViewportPoint(part.Position)
                    if onScreen and screenPoint.Z > 0 then
                        local screenDistance = (Vector2.new(screenPoint.X, screenPoint.Y) - center).Magnitude
                        if screenDistance <= bestScreenDistance and isSilentPlayerEligible(player, part, camera) then
                            bestScreenDistance = screenDistance
                            bestTarget = player
                            bestKind = "Player"
                        end
                    end
                end
            end
        end
    end

    if targetType ~= "Players" then
        for model in pairs(Controller.DroneEntries) do
            local part = getSilentDronePart(model)
            if part then
                local screenPoint, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen and screenPoint.Z > 0 then
                    local screenDistance = (Vector2.new(screenPoint.X, screenPoint.Y) - center).Magnitude
                    if screenDistance <= bestScreenDistance and isSilentDroneEligible(model, part, camera) then
                        bestScreenDistance = screenDistance
                        bestTarget = model
                        bestKind = "Drone"
                    end
                end
            end
        end
    end

    Controller.SilentTarget = bestTarget
    Controller.SilentTargetKind = bestKind
    SilentFOVCircle.Color = bestTarget and settings.SilentAimLockedFOVColor or settings.SilentAimFOVColor
end

local function getSilentAimPoint(origin, speed, acceleration)
    local settings = Controller.Settings
    local target = Controller.SilentTarget
    local targetKind = Controller.SilentTargetKind
    local camera = Workspace.CurrentCamera
    local part
    local velocityPart
    local eligible = false

    if targetKind == "Drone" then
        part = getSilentDronePart(target)
        velocityPart = target and (target.PrimaryPart or part)
        eligible = camera and isSilentDroneEligible(target, part, camera) or false
    elseif targetKind == "Player" then
        part = getSilentTargetPart(target, true)
        velocityPart = part
        eligible = camera and isSilentPlayerEligible(target, part, camera) or false
    end

    if not eligible then
        return nil
    end

    if settings.SilentAimHitChance < 100
        and SilentAimRandom:NextNumber(0, 100) > settings.SilentAimHitChance then
        return nil
    end

    local aimPoint = part.Position
    if settings.SilentAimPrediction then
        local projectileSpeed = type(speed) == "number" and math.abs(speed) or 0
        if projectileSpeed > 0 then
            local travelTime = (aimPoint - origin).Magnitude / projectileSpeed
            aimPoint = aimPoint + velocityPart.AssemblyLinearVelocity * travelTime
            if typeof(acceleration) == "Vector3" then
                aimPoint = aimPoint - acceleration * travelTime * travelTime * 0.5
            end
        end
    end

    return aimPoint
end

local function getSilentTargetLabel()
    local target = Controller.SilentTarget
    if Controller.SilentTargetKind == "Drone" and target then
        return "Drone: " .. tostring(target:GetAttribute("player") or "unknown")
    end
    if Controller.SilentTargetKind == "Player" and target then
        return target.Name
    end
    return ""
end

local function installSilentAimHook()
    if Controller.FastCastHookInstalled then
        return true
    end
    if type(filtergc) ~= "function" then
        return false
    end

    local success, projectile = pcall(filtergc, "table", {
        Keys = { "object", "raycast", "calculateDirection", "makeSpread", "init", "providers", "new" }
    }, true)
    if not success
        or type(projectile) ~= "table"
        or type(projectile.calculateDirection) ~= "function" then
        return false
    end

    if type(hookfunction) ~= "function" then
        return false
    end

    ProjectileModule = projectile
    CalculateDirectionTarget = projectile.calculateDirection

    local calculateDirectionReplacement = function(origin, cameraCFrame, ...)
        local result = OriginalCalculateDirection(origin, cameraCFrame, ...)
        Controller.FastCastCalls = Controller.FastCastCalls + 1
        local settings = Controller.Settings
        if not Controller.Unloaded
            and settings.SilentAimEnabled
            and typeof(origin) == "Vector3"
            and typeof(cameraCFrame) == "CFrame"
            and type(result) == "table" then
            local camera = Workspace.CurrentCamera
            local localAnchor = getAnchor(LocalPlayer.Character)
            local nearCamera = camera and (origin - camera.CFrame.Position).Magnitude <= 25
            local nearCharacter = localAnchor and (origin - localAnchor.Position).Magnitude <= 30
            if nearCamera or nearCharacter then
                local speed
                if typeof(result.castDirection) == "Vector3" then
                    speed = result.castDirection.Magnitude
                end
                if type(speed) ~= "number" or speed <= 0 then
                    speed = 1000
                end

                local acceleration = Vector3.new(0, -Workspace.Gravity / 8, 0)

                local aimSuccess, aimPoint = pcall(getSilentAimPoint, origin, speed, acceleration)
                if aimSuccess and aimPoint then
                    local muzzleDifference = aimPoint - origin
                    local cameraDifference = aimPoint - cameraCFrame.Position
                    if muzzleDifference.Magnitude > 0 and cameraDifference.Magnitude > 0 then
                        local castMagnitude = typeof(result.castDirection) == "Vector3"
                            and result.castDirection.Magnitude
                            or speed
                        result.position = aimPoint
                        result.direction = muzzleDifference.Unit
                        result.rayDirection = cameraDifference.Unit
                        result.castDirection = result.rayDirection * castMagnitude
                        Controller.SilentRedirects = Controller.SilentRedirects + 1
                        Controller.LastSilentTarget = getSilentTargetLabel()
                    end
                end
            end
        end
        return result
    end

    HookedCalculateDirection = type(newcclosure) == "function"
        and newcclosure(calculateDirectionReplacement)
        or calculateDirectionReplacement

    local directionHookSuccess, originalDirection = pcall(
        hookfunction,
        CalculateDirectionTarget,
        HookedCalculateDirection
    )
    if not directionHookSuccess or type(originalDirection) ~= "function" then
        ProjectileModule = nil
        CalculateDirectionTarget = nil
        HookedCalculateDirection = nil
        return false
    end

    OriginalCalculateDirection = originalDirection
    Controller.FastCastHookInstalled = true
    return true
end

local function renderRearArrow(visual, anchor, color, camera)
    if not visual.ArrowTop then
        return
    end

    local settings = Controller.Settings
    local relative = camera.CFrame:PointToObjectSpace(anchor.Position)
    if not settings.DroneRearArrows or relative.Z <= 0 then
        visual.ArrowTop.Visible = false
        visual.ArrowBottom.Visible = false
        return
    end

    local direction = Vector2.new(relative.X, -relative.Y)
    if direction.Magnitude < 0.001 then
        direction = Vector2.new(1, 0)
    else
        direction = direction.Unit
    end

    local perpendicular = Vector2.new(-direction.Y, direction.X)
    local center = camera.ViewportSize * 0.5
    local arrowCenter = center + direction * settings.RearArrowRadius
    local tip = arrowCenter + direction * settings.RearArrowSize
    local back = arrowCenter - direction * settings.RearArrowSize * 0.65
    local wing = settings.RearArrowSize * 0.8
    local upper = back + perpendicular * wing
    local lower = back - perpendicular * wing
    local thickness = math.max(2, settings.BoxThickness)

    visual.ArrowTop.From = upper
    visual.ArrowTop.To = tip
    visual.ArrowTop.Color = color
    visual.ArrowTop.Thickness = thickness
    visual.ArrowTop.Transparency = settings.Opacity
    visual.ArrowTop.Visible = true

    visual.ArrowBottom.From = lower
    visual.ArrowBottom.To = tip
    visual.ArrowBottom.Color = color
    visual.ArrowBottom.Thickness = thickness
    visual.ArrowBottom.Transparency = settings.Opacity
    visual.ArrowBottom.Visible = true
end

local function renderVisual(visual, model, label, color, showBox, showText, showTracer, camera)
    local position, size = getBounds(model, camera)
    if not position then
        hideVisual(visual)
        return
    end

    local settings = Controller.Settings
    local transparency = settings.Opacity

    visual.Outline.Position = position
    visual.Outline.Size = size
    visual.Outline.Thickness = settings.BoxThickness + 2
    visual.Outline.Transparency = transparency
    visual.Outline.Visible = showBox

    visual.Box.Position = position
    visual.Box.Size = size
    visual.Box.Color = color
    visual.Box.Thickness = settings.BoxThickness
    visual.Box.Transparency = transparency
    visual.Box.Visible = showBox

    visual.Text.Text = label
    visual.Text.Position = Vector2.new(position.X + size.X * 0.5, math.max(0, position.Y - settings.TextSize - 3))
    visual.Text.Color = color
    visual.Text.Size = settings.TextSize
    visual.Text.Transparency = transparency
    visual.Text.Visible = showText and label ~= ""

    visual.Tracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y - 2)
    visual.Tracer.To = Vector2.new(position.X + size.X * 0.5, position.Y + size.Y)
    visual.Tracer.Color = color
    visual.Tracer.Thickness = settings.BoxThickness
    visual.Tracer.Transparency = transparency
    visual.Tracer.Visible = showTracer
end

local function getPlayerVisual(player)
    local visual = Controller.PlayerEntries[player]
    if not visual then
        visual = createVisual(false)
        Controller.PlayerEntries[player] = visual
    end
    return visual
end

local function removePlayer(player)
    local visual = Controller.PlayerEntries[player]
    if visual then
        removeVisual(visual)
        Controller.PlayerEntries[player] = nil
    end
end

local function looksLikeDrone(model)
    if not model or not model:IsA("Model") then
        return false
    end

    local owner = model:GetAttribute("player")
    local throttle = model:GetAttribute("throttle")
    if type(owner) ~= "string" or owner == "" or throttle == nil then
        return false
    end

    local propellers = model:FindFirstChild("propellers")
    local primaryPart = model.PrimaryPart
    local rootAttachment = primaryPart and primaryPart:FindFirstChild("RootAttachment")
    return propellers ~= nil or rootAttachment ~= nil
end

local function registerDrone(model)
    if Controller.DroneEntries[model] or not looksLikeDrone(model) then
        return
    end
    Controller.DroneEntries[model] = createVisual(true)
end

local function removeDrone(model)
    local visual = Controller.DroneEntries[model]
    if visual then
        removeVisual(visual)
        Controller.DroneEntries[model] = nil
    end
end

local function discoverDrones()
    local candidates
    local success, result = pcall(function()
        return Workspace:QueryDescendants("Model[$player], Model[$throttle], Model:has(#propellers)")
    end)

    if success and type(result) == "table" then
        candidates = result
    else
        candidates = {}
        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if descendant:IsA("Model") then
                table.insert(candidates, descendant)
            end
        end
    end

    for _, candidate in pairs(candidates) do
        registerDrone(candidate)
    end
end

local function updatePlayers(camera, origin)
    local settings = Controller.Settings
    local present = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            present[player] = true
            local visual = getPlayerVisual(player)
            local character = player.Character
            local anchor = getAnchor(character)
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local teammate = isTeammate(player)

            if not settings.PlayerEnabled
                or not character
                or not character:IsDescendantOf(Workspace)
                or not anchor
                or humanoid and humanoid.Health <= 0
                or teammate and not settings.ShowTeammates then
                hideVisual(visual)
            else
                local distance = (anchor.Position - origin).Magnitude
                if distance > settings.PlayerMaxDistance then
                    hideVisual(visual)
                else
                    local pieces = {}
                    if settings.PlayerNames then
                        table.insert(pieces, player.DisplayName ~= player.Name and player.DisplayName .. " (@" .. player.Name .. ")" or player.Name)
                    end
                    if settings.PlayerDistance then
                        table.insert(pieces, string.format("[%ds]", math.floor(distance + 0.5)))
                    end
                    local color = teammate and settings.TeammateColor or settings.EnemyColor
                    renderVisual(
                        visual,
                        character,
                        table.concat(pieces, " "),
                        color,
                        settings.PlayerBoxes,
                        settings.PlayerNames or settings.PlayerDistance,
                        settings.PlayerTracers,
                        camera
                    )
                end
            end
        end
    end

    for player in pairs(Controller.PlayerEntries) do
        if not present[player] then
            removePlayer(player)
        end
    end
end

local function updateDrones(camera, origin)
    local settings = Controller.Settings

    for model, visual in pairs(Controller.DroneEntries) do
        if not model.Parent or not model:IsDescendantOf(Workspace) or not looksLikeDrone(model) then
            removeDrone(model)
        else
            local anchor = getAnchor(model)
            local ownerName = model:GetAttribute("player")
            if not settings.DroneEnabled or not anchor or ownerName == LocalPlayer.Name and not settings.ShowOwnDrone then
                hideVisual(visual)
            else
                local distance = (anchor.Position - origin).Magnitude
                if distance > settings.DroneMaxDistance then
                    hideVisual(visual)
                else
                    local ownerPlayer = Players:FindFirstChild(ownerName)
                    local friendly, teamName = getPlayerTeamState(ownerPlayer)
                    local isOwnDrone = ownerName == LocalPlayer.Name
                    local color
                    if friendly == true then
                        color = settings.FriendlyDroneColor
                    elseif friendly == false then
                        color = settings.EnemyDroneColor
                    else
                        color = settings.UnknownDroneColor
                    end
                    if settings.DroneTeamCheck and friendly == true and not isOwnDrone then
                        hideVisual(visual)
                    else
                        local pieces = {}
                        if settings.DroneNames then
                            table.insert(pieces, "Drone: " .. ownerName)
                        end
                        if settings.DroneTeams then
                            table.insert(pieces, "[" .. string.upper(teamName) .. "]")
                        end
                        if settings.DroneDistance then
                            table.insert(pieces, string.format("[%ds]", math.floor(distance + 0.5)))
                        end
                        renderVisual(
                            visual,
                            model,
                            table.concat(pieces, " "),
                            color,
                            settings.DroneBoxes,
                            settings.DroneNames or settings.DroneTeams or settings.DroneDistance,
                            settings.DroneTracers,
                            camera
                        )
                        renderRearArrow(visual, anchor, color, camera)
                    end
                end
            end
        end
    end
end

installSilentAimHook()

local function cleanup()
    if Controller.Unloaded then
        return
    end

    Controller.Unloaded = true
    Controller.SilentTarget = nil
    Controller.SilentTargetKind = nil
    SilentFOVCircle.Visible = false

    for _, connection in ipairs(Controller.Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(Controller.Connections)

    for player, visual in pairs(Controller.PlayerEntries) do
        removeVisual(visual)
        Controller.PlayerEntries[player] = nil
    end

    for model, visual in pairs(Controller.DroneEntries) do
        removeVisual(visual)
        Controller.DroneEntries[model] = nil
    end

    removeDrawing(SilentFOVCircle)

    if CalculateDirectionTarget then
        if type(restorefunction) == "function" then
            pcall(restorefunction, CalculateDirectionTarget)
        elseif type(hookfunction) == "function" and OriginalCalculateDirection then
            pcall(hookfunction, CalculateDirectionTarget, OriginalCalculateDirection)
        end
    end
    Controller.FastCastHookInstalled = false

    if Environment.LostFrontDrawingESP == Controller then
        Environment.LostFrontDrawingESP = nil
    end
end

Controller.Unload = function()
    if Controller.Unloaded then
        return
    end
    if Library and not Library.Unloaded then
        Library:Unload()
    else
        cleanup()
    end
end

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local GameTitle = "The Lost Front"
local WindowIconTitle = "Lost Front"
local CommunityText = "t.me/arceusxcommunity"

pcall(function()
    local response = game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Something/refs/heads/main/telegram")
    local text = response:match("^%s*(.-)%s*$")
    if text ~= "" then
        CommunityText = text
    end
end)

local Window = Library:CreateWindow({
    Title = WindowIconTitle,
    Footer = GameTitle .. " | " .. CommunityText,
    NotifySide = "Right",
    ShowCustomCursor = not Library.IsMobile,
    ShowMobileButtons = true,
    MobileButtonsSide = "Left",
    AutoShow = true,
    Center = true,
    Resizable = true,
    Size = UDim2.fromOffset(580, 460),
    ToggleKeybind = Enum.KeyCode.RightShift
})

Window:ChangeTitle(GameTitle)

local Tabs = {}
Tabs.SilentAim = Window:AddTab("Silent Aim", "crosshair", "")
Tabs.ESP = Window:AddTab("ESP", "scan-eye", "")
Tabs.Settings = Window:AddTab("UI Settings", "settings", "")

local SilentMainGroup = Tabs.SilentAim:AddLeftGroupbox("Silent Aim", "crosshair")
local SilentTargetGroup = Tabs.SilentAim:AddRightGroupbox("Targeting", "scan-search")
local SilentVisualGroup = Tabs.SilentAim:AddLeftGroupbox("FOV", "circle-dot")

SilentMainGroup:AddToggle("SilentAimEnabled", {
    Text = "Enabled",
    Default = true,
    Callback = function(value)
        Controller.Settings.SilentAimEnabled = value
        if not value then
            Controller.SilentTarget = nil
            Controller.SilentTargetKind = nil
        end
    end
})
SilentMainGroup:AddToggle("SilentAimTeamCheck", {
    Text = "Team check",
    Default = true,
    Callback = function(value)
        Controller.Settings.SilentAimTeamCheck = value
    end
})
SilentMainGroup:AddToggle("SilentAimVisibilityCheck", {
    Text = "Visibility check",
    Default = true,
    Callback = function(value)
        Controller.Settings.SilentAimVisibilityCheck = value
    end
})
SilentMainGroup:AddToggle("SilentAimPrediction", {
    Text = "Movement and drop prediction",
    Default = true,
    Callback = function(value)
        Controller.Settings.SilentAimPrediction = value
    end
})
SilentMainGroup:AddSlider("SilentAimHitChance", {
    Text = "Hit chance",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
    Callback = function(value)
        Controller.Settings.SilentAimHitChance = value
    end
})

SilentTargetGroup:AddDropdown("SilentAimTargetType", {
    Values = { "Players and Drones", "Players", "Drones" },
    Default = "Players and Drones",
    Multi = false,
    Text = "Target type",
    Callback = function(value)
        Controller.Settings.SilentAimTargetType = value
        Controller.SilentTarget = nil
        Controller.SilentTargetKind = nil
    end
})
SilentTargetGroup:AddDropdown("SilentAimTargetPart", {
    Values = { "Head", "UpperTorso", "Torso", "HumanoidRootPart", "Random" },
    Default = "Head",
    Multi = false,
    Text = "Player target part",
    Callback = function(value)
        Controller.Settings.SilentAimTargetPart = value
    end
})
SilentTargetGroup:AddSlider("SilentAimFOV", {
    Text = "FOV radius",
    Default = 150,
    Min = 20,
    Max = 500,
    Rounding = 0,
    Suffix = " px",
    Callback = function(value)
        Controller.Settings.SilentAimFOV = value
    end
})
SilentTargetGroup:AddSlider("SilentAimMaxDistance", {
    Text = "Max distance",
    Default = 2500,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Suffix = " studs",
    Callback = function(value)
        Controller.Settings.SilentAimMaxDistance = value
    end
})

SilentVisualGroup:AddToggle("SilentAimShowFOV", {
    Text = "Show FOV",
    Default = true,
    Callback = function(value)
        Controller.Settings.SilentAimShowFOV = value
    end
})
SilentVisualGroup:AddSlider("SilentAimFOVThickness", {
    Text = "FOV thickness",
    Default = 1,
    Min = 1,
    Max = 4,
    Rounding = 0,
    Callback = function(value)
        Controller.Settings.SilentAimFOVThickness = value
    end
})
SilentVisualGroup:AddSlider("SilentAimFOVOpacity", {
    Text = "FOV opacity",
    Default = 80,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
    Callback = function(value)
        Controller.Settings.SilentAimFOVOpacity = value / 100
    end
})
SilentVisualGroup:AddLabel("FOV color"):AddColorPicker("SilentAimFOVColor", {
    Default = Controller.Settings.SilentAimFOVColor,
    Title = "FOV color",
    Callback = function(value)
        Controller.Settings.SilentAimFOVColor = value
    end
})
SilentVisualGroup:AddLabel("Locked FOV color"):AddColorPicker("SilentAimLockedFOVColor", {
    Default = Controller.Settings.SilentAimLockedFOVColor,
    Title = "Locked FOV color",
    Callback = function(value)
        Controller.Settings.SilentAimLockedFOVColor = value
    end
})

local PlayerGroup = Tabs.ESP:AddLeftGroupbox("Players", "users")
local DroneGroup = Tabs.ESP:AddRightGroupbox("Drones", "plane")
local VisualGroup = Tabs.ESP:AddLeftGroupbox("Visuals", "palette")

PlayerGroup:AddToggle("PlayerESP", {
    Text = "Player ESP",
    Default = true,
    Callback = function(value)
        Controller.Settings.PlayerEnabled = value
    end
})
PlayerGroup:AddToggle("PlayerBoxes", {
    Text = "Boxes",
    Default = true,
    Callback = function(value)
        Controller.Settings.PlayerBoxes = value
    end
})
PlayerGroup:AddToggle("PlayerNames", {
    Text = "Names",
    Default = true,
    Callback = function(value)
        Controller.Settings.PlayerNames = value
    end
})
PlayerGroup:AddToggle("PlayerDistance", {
    Text = "Distance",
    Default = true,
    Callback = function(value)
        Controller.Settings.PlayerDistance = value
    end
})
PlayerGroup:AddToggle("PlayerTracers", {
    Text = "Tracers",
    Default = false,
    Callback = function(value)
        Controller.Settings.PlayerTracers = value
    end
})
PlayerGroup:AddToggle("ShowTeammates", {
    Text = "Show teammates",
    Default = false,
    Callback = function(value)
        Controller.Settings.ShowTeammates = value
    end
})
PlayerGroup:AddSlider("PlayerMaxDistance", {
    Text = "Max distance",
    Default = 2500,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Suffix = " studs",
    Callback = function(value)
        Controller.Settings.PlayerMaxDistance = value
    end
})

DroneGroup:AddToggle("DroneESP", {
    Text = "Drone ESP",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneEnabled = value
    end
})
DroneGroup:AddToggle("DroneBoxes", {
    Text = "Boxes",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneBoxes = value
    end
})
DroneGroup:AddToggle("DroneNames", {
    Text = "Owner names",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneNames = value
    end
})
DroneGroup:AddToggle("DroneTeams", {
    Text = "Team labels",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneTeams = value
    end
})
DroneGroup:AddToggle("DroneDistance", {
    Text = "Distance",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneDistance = value
    end
})
DroneGroup:AddToggle("DroneTracers", {
    Text = "Tracers",
    Default = false,
    Callback = function(value)
        Controller.Settings.DroneTracers = value
    end
})
DroneGroup:AddToggle("DroneRearArrows", {
    Text = "Rear drone arrows",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneRearArrows = value
    end
})
DroneGroup:AddToggle("DroneTeamCheck", {
    Text = "Team check",
    Default = true,
    Callback = function(value)
        Controller.Settings.DroneTeamCheck = value
    end
})
DroneGroup:AddToggle("ShowOwnDrone", {
    Text = "Show own drone",
    Default = false,
    Callback = function(value)
        Controller.Settings.ShowOwnDrone = value
    end
})
DroneGroup:AddSlider("DroneMaxDistance", {
    Text = "Max distance",
    Default = 2500,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Suffix = " studs",
    Callback = function(value)
        Controller.Settings.DroneMaxDistance = value
    end
})
DroneGroup:AddButton({
    Text = "Rescan drones",
    Func = discoverDrones
})

VisualGroup:AddLabel("Enemy color"):AddColorPicker("EnemyColor", {
    Default = Controller.Settings.EnemyColor,
    Title = "Enemy color",
    Callback = function(value)
        Controller.Settings.EnemyColor = value
    end
})
VisualGroup:AddLabel("Teammate color"):AddColorPicker("TeammateColor", {
    Default = Controller.Settings.TeammateColor,
    Title = "Teammate color",
    Callback = function(value)
        Controller.Settings.TeammateColor = value
    end
})
VisualGroup:AddLabel("Friendly drone color"):AddColorPicker("FriendlyDroneColor", {
    Default = Controller.Settings.FriendlyDroneColor,
    Title = "Friendly drone color",
    Callback = function(value)
        Controller.Settings.FriendlyDroneColor = value
    end
})
VisualGroup:AddLabel("Enemy drone color"):AddColorPicker("EnemyDroneColor", {
    Default = Controller.Settings.EnemyDroneColor,
    Title = "Enemy drone color",
    Callback = function(value)
        Controller.Settings.EnemyDroneColor = value
    end
})
VisualGroup:AddLabel("Unknown drone color"):AddColorPicker("UnknownDroneColor", {
    Default = Controller.Settings.UnknownDroneColor,
    Title = "Unknown drone color",
    Callback = function(value)
        Controller.Settings.UnknownDroneColor = value
    end
})
VisualGroup:AddSlider("BoxThickness", {
    Text = "Box thickness",
    Default = 1,
    Min = 1,
    Max = 4,
    Rounding = 0,
    Callback = function(value)
        Controller.Settings.BoxThickness = value
    end
})
VisualGroup:AddSlider("TextSize", {
    Text = "Text size",
    Default = 13,
    Min = 10,
    Max = 24,
    Rounding = 0,
    Callback = function(value)
        Controller.Settings.TextSize = value
    end
})
VisualGroup:AddSlider("Opacity", {
    Text = "Opacity",
    Default = 100,
    Min = 20,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
    Callback = function(value)
        Controller.Settings.Opacity = value / 100
    end
})
VisualGroup:AddSlider("RearArrowRadius", {
    Text = "Rear arrow radius",
    Default = 70,
    Min = 30,
    Max = 180,
    Rounding = 0,
    Suffix = " px",
    Callback = function(value)
        Controller.Settings.RearArrowRadius = value
    end
})
VisualGroup:AddSlider("RearArrowSize", {
    Text = "Rear arrow size",
    Default = 11,
    Min = 6,
    Max = 24,
    Rounding = 0,
    Suffix = " px",
    Callback = function(value)
        Controller.Settings.RearArrowSize = value
    end
})

local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu", "wrench")
MenuGroup:AddDropdown("DPIScale", {
    Values = { "50%", "75%", "100%", "125%", "150%" },
    Default = Library.IsMobile and "75%" or "100%",
    Text = "DPI scale",
    Callback = function(value)
        Library:SetDPIScale(tonumber(value:gsub("%%", "")))
    end
})
MenuGroup:AddLabel("Menu keybind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind"
})
MenuGroup:AddLabel("The built-in mobile menu button is enabled.", true)
MenuGroup:AddButton({
    Text = "Unload",
    Func = Controller.Unload
})

Library.ToggleKeybind = Options.MenuKeybind
Library:OnUnload(cleanup)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("LostFrontESP")
SaveManager:SetFolder("LostFrontESP")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

addConnection(Players.PlayerRemoving:Connect(removePlayer))
addConnection(Workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("Model") then
        task.delay(0.35, function()
            if not Controller.Unloaded then
                registerDrone(descendant)
            end
        end)
    end
end))
addConnection(RunService.RenderStepped:Connect(function()
    if Controller.Unloaded then
        return
    end
    local camera = Workspace.CurrentCamera
    if not camera then
        return
    end
    updateSilentAimTarget(camera)
    local origin = getDistanceOrigin(camera)
    updatePlayers(camera, origin)
    updateDrones(camera, origin)
end))

task.spawn(function()
    while not Controller.Unloaded do
        discoverDrones()
        task.wait(1.5)
    end
end)

SaveManager:LoadAutoloadConfig()

if Toggles.SilentAimEnabled then
    Toggles.SilentAimEnabled:SetValue(true)
else
    Controller.Settings.SilentAimEnabled = true
end
