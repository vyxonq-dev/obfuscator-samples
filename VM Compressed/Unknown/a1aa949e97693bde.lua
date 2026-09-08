-- =================================
-- Combat Specialist Pro (V12 FINAL)
-- Made by BabyMaxford
-- =================================

-- LIBRARY
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Combat Specialist Pro (Beta)",
   LoadingTitle = "Initializing Tactical Suite...",
   ConfigurationSaving = { Enabled = false }
})

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Vector2_new = Vector2.new

-- CONSTANTS
local MAX_PREDICTION_DISTANCE = 300
local MIN_PREDICTION_DISTANCE = 30
local DEFAULT_WALKSPEED = 16
local DEFAULT_JUMPPOWER = 50
local ZOOM_FOV = 40
local SMOOTHING_DISTANCE_SCALE = 400
local TARGET_SWITCH_BUFFER = 25
local DEADZONE_RADIUS = 3
local MAX_MOUSE_MOVE = 20
local CROSSHAIR_SIZE = 6
local LAST_PITCH = 0
local MIN_SMOOTHING = 0.15
local MAX_SMOOTHING = 0.6
local TARGET_SCAN_INTERVAL = 0.15
local DEFAULT_FOV = Camera.FieldOfView
local CURRENT_FOV = Camera.FieldOfView
local TARGET_FOV = Camera.FieldOfView

-- FOV CIRCLE & CROSSHAIR
local FOV_ENABLED = false
local FOV_RADIUS = 150
local FOV_COLOR = Color3.fromRGB(0,255,0)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Radius = FOV_RADIUS
FOVCircle.Color = FOV_COLOR
FOVCircle.Thickness = 1
FOVCircle.Transparency = 0.5
local Crosshair = {
    Up = Drawing.new("Line"),
    Down = Drawing.new("Line"),
    Left = Drawing.new("Line"),
    Right = Drawing.new("Line")
}
for _,line in pairs(Crosshair) do
    line.Thickness = 2
    line.Color = Color3.new(1,1,1)
    line.Visible = false
end

-- RUNTIMES SETTINGS
local AIM_INPUT_ACTIVE = false  
local BULLET_SPEED = 400
local WALK_SPEED = 16
local JUMP_POWER = 50
local HITBOX_SIZE = 1
local HITBOX_MULTIPLIER = 1
local AIM_SMOOTHING = 0.5
local RECOIL_STRENGTH = 0.7
local ADAPTIVE_PREDICTION_STRENGTH = 1
local ZOOM_SMOOTHNESS = 8
local ZOOM_FOV_RADIUS_MULTIPLIER = 0.45
local AIM_PART = "Head"
local ESP_MODE = "Team-Based" 
local CURRENT_TARGET = nil
local FAKE_HITBOX = nil
local CURRENT_HITBOX_TARGET = nil
local HIGHLIGHT_MAX_DISTANCE = 1000
local DRAWING_MAX_DISTANCE = 1000
local lastTargetScan = 0
local TARGET_LOCK_TIME = 0.35
local lastTargetChange = 0
local highlightFrameCounter = 0

-- FEATURE TOGGLES (STATE VARIABLES)
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local ZOOM_ENABLED = false
local PREDICTION_ENABLED = false
local HITBOX_ENABLED = false
local NO_RECOIL_ENABLED = false
local STICKY_LOCK_ENABLED = false
local DEADZONE_ENABLED = false
local CLAMP_MOUSE_ENABLED = false
local DYNAMIC_SMOOTHING_ENABLED = false
local CROSSHAIR_ENABLED = false
local MOVEMENT_ENABLED = false
local DYNAMIC_ZOOM = false
local POTATO_MODE = false
local DRAWING_ESP_ENABLED = false
local DRAW_BOX = false
local DRAW_DISTANCE = false
local DRAW_SNAPLINE = false
local HIGHLIGHT_ESP_ENABLED = false

-- DATA STORAGE
local ORIGINAL_MATERIALS = {}
local LAST_POSITIONS = {}
local VELOCITY_CACHE = {}
local TrackedPlayers = {}
local RegisteredCharacters = {}
local ESP_Drawings = {}
local DrawingESP = {}
local Connections = {}
local originalHeadSizes = {}
local PlayerHighlights = {}
local CachedTargets = {}
local originalLighting = {
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

-- HELPER FUNCTIONS
local function registerCharacter(model)
    if RegisteredCharacters[model] then
        return
    end
    local humanoid = model:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end
    local root = model:FindFirstChild("HumanoidRootPart")
        or model:WaitForChild("HumanoidRootPart",2)
    if not root then
        return
    end
    if model == LocalPlayer.Character then
        return
    end
    RegisteredCharacters[model] = true
    humanoid.Died:Connect(function()
        RegisteredCharacters[model] = nil
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            RegisteredCharacters[model] = nil
        end
    end)
end
-- ensure player characters are registered
for _,player in ipairs(Players:GetPlayers()) do
    if player.Character then
        registerCharacter(player.Character)
    end

    player.CharacterAdded:Connect(function(char)
        registerCharacter(char)
    end)
end
Workspace.DescendantAdded:Connect(function(obj)
    if not obj:IsA("Humanoid") then
        return
    end
    local model = obj.Parent
    if model and model:IsA("Model") then
        registerCharacter(model)
    end
end)
local function isVisible(part)
    local origin = Camera.CFrame.Position
    local direction = part.Position - origin
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    local ray = Workspace:Raycast(origin, direction, rayParams)
    if ray and ray.Instance then
        return ray.Instance:IsDescendantOf(part.Parent)
    end
    return false
end
local function getCharacterColor(entity)
    local player = entity.player
    if not player then
        return Color3.fromRGB(255,0,0)
    end
    -- PVP mode
    if ESP_MODE == "PVP" then
        return Color3.fromRGB(255,0,0)
    end
    -- Try Team first
    if player.Team and LocalPlayer.Team then
        if player.Team == LocalPlayer.Team then
            return Color3.fromRGB(0,255,0)
        else
            return Color3.fromRGB(255,0,0)
        end
    end
    -- Fallback to TeamColor (many FPS games use this)
    if player.TeamColor and LocalPlayer.TeamColor then
        if player.TeamColor == LocalPlayer.TeamColor then
            return Color3.fromRGB(0,255,0)
        else
            return Color3.fromRGB(255,0,0)
        end
    end
    return Color3.fromRGB(255,0,0)
end
local function isEnemy(player)
    if not player.Team or not LocalPlayer.Team then
        return true -- free for all
    end
    return player.Team ~= LocalPlayer.Team
end
function clearPlayerDrawings(char)
    if ESP_Drawings[char] then
        for _, draw in pairs(ESP_Drawings[char]) do
            if type(draw) == "table" then
                for _, subDraw in pairs(draw) do
                    subDraw:Remove()
                end
            else
                draw:Remove()
            end
        end
        ESP_Drawings[char] = nil
    end
end
function clearAllDrawings()
    for char in pairs(ESP_Drawings) do
        clearPlayerDrawings(char)
    end
end
function getPlayerDrawings(character)
    if not ESP_Drawings[character] then
        ESP_Drawings[character] = {
            Box = Drawing.new("Square"),
            Distance = Drawing.new("Text"),
            Snapline = Drawing.new("Line"),
            Skeleton = {}
        }
        ESP_Drawings[character].Box.Thickness = 1
        ESP_Drawings[character].Box.Filled = false
        ESP_Drawings[character].Distance.Size = 16
        ESP_Drawings[character].Distance.Center = true
        ESP_Drawings[character].Distance.Outline = true
        ESP_Drawings[character].Snapline.Thickness = 1
    end
    return ESP_Drawings[character]
end
local function updateCrosshair()
    if not CROSSHAIR_ENABLED then
        for _,line in pairs(Crosshair) do
            line.Visible = false
        end
        return
    end
    local centerX = Camera.ViewportSize.X / 2
    local centerY = Camera.ViewportSize.Y / 2
    local gap = 4
    local size = CROSSHAIR_SIZE
    -- draw crosshair
    Crosshair.Up.From = Vector2_new(centerX, centerY - gap)
    Crosshair.Up.To = Vector2_new(centerX, centerY - size)
    Crosshair.Down.From = Vector2_new(centerX, centerY + gap)
    Crosshair.Down.To = Vector2_new(centerX, centerY + size)
    Crosshair.Left.From = Vector2_new(centerX - gap, centerY)
    Crosshair.Left.To = Vector2_new(centerX - size, centerY)
    Crosshair.Right.From = Vector2_new(centerX + gap, centerY)
    Crosshair.Right.To = Vector2_new(centerX + size, centerY)
    local color = Color3.new(1,1,1)
    -- Raycast visibility
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    local ray = Workspace:Raycast(
        Camera.CFrame.Position,
        Camera.CFrame.LookVector * 1000,
        rayParams
    )
    if ray then
        local model = ray.Instance:FindFirstAncestorOfClass("Model")
        if model then
            local humanoid = model:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local player = Players:GetPlayerFromCharacter(model)
                if player then
                    if isEnemy(player) then
                        color = Color3.fromRGB(255,0,0)
                    else
                        color = Color3.fromRGB(0,255,0)
                    end
                else
                    -- NPC
                    color = Color3.fromRGB(255,0,0)
                end
            end
        end
    end
    for _,line in pairs(Crosshair) do
        line.Color = color
        line.Visible = true
    end
end

-- ENVIRONMENT FUNCTIONS
local function setPotatoGraphics(enabled)
    if enabled then
        -- Disable lighting effects
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        Lighting.Brightness = 1
        -- Remove atmosphere effects
        for _,v in pairs(Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v.Density = 0
                v.Haze = 0
                v.Glare = 0
            end
        end
        -- Disable post processing
        for _,v in pairs(Lighting:GetDescendants()) do
            if v:IsA("BloomEffect")
            or v:IsA("DepthOfFieldEffect")
            or v:IsA("SunRaysEffect")
            or v:IsA("ColorCorrectionEffect") then
                v.Enabled = false
            end
        end
        -- Simplify map parts
        for _,obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Transparency < 1 and obj.Size.Magnitude < 300 then
                -- Save original material once
                if not ORIGINAL_MATERIALS[obj] then
                    ORIGINAL_MATERIALS[obj] = obj.Material
                end
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            end
        end
        -- Disable terrain grass
        if Workspace:FindFirstChildOfClass("Terrain") then
            Workspace.Terrain.Decoration = false
        end
    else
        -- Restore materials
        for part,material in pairs(ORIGINAL_MATERIALS) do
            if part and part.Parent then
                part.Material = material
            end
        end
        -- Re-enable terrain decoration
        if Workspace:FindFirstChildOfClass("Terrain") then
            Workspace.Terrain.Decoration = true
        end
    end
end
local function setFullBright(enabled)
    Lighting.GlobalShadows = not enabled
    Lighting.Ambient = enabled and Color3.new(1,1,1) or originalLighting.Ambient
    Lighting.OutdoorAmbient = enabled and Color3.new(1,1,1) or originalLighting.OutdoorAmbient
end
local function setRemoveFog(enabled)
    if enabled then
        Lighting.FogStart = 0
        Lighting.FogEnd = 100000
        for _,v in pairs(Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v.Density = 0
                v.Haze = 0
            end
        end
    else
        Lighting.FogEnd = originalLighting.FogEnd
    end
end

-- CHARACTERS TRACKING
local function registerPlayer(player)
    if player == LocalPlayer then return end
    TrackedPlayers[player] = {
        player = player,
        character = player.Character
    }
    player.CharacterAdded:Connect(function(character)
        TrackedPlayers[player].character = character
    end)
    player.CharacterRemoving:Connect(function(character)
        clearPlayerDrawings(character)
    end)
end
for _,player in ipairs(Players:GetPlayers()) do
    registerPlayer(player)
end
Players.PlayerAdded:Connect(registerPlayer)
Connections["PlayerRemoving"] = Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        clearPlayerDrawings(player.Character)
    end
end)

-- AIMBOT SYSTEM
local function getTargetVelocity(character)
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return Vector3.zero end
    local lastPos = LAST_POSITIONS[character]
    if not lastPos then
        LAST_POSITIONS[character] = root.Position
        return Vector3.zero
    end
    local movement = root.Position - lastPos
    LAST_POSITIONS[character] = root.Position
    -- convert displacement to velocity
    local velocity = movement * 60
    -- smooth velocity
    if VELOCITY_CACHE[character] then
        velocity = VELOCITY_CACHE[character]:Lerp(velocity, 0.25)
    end
    VELOCITY_CACHE[character] = velocity
    return velocity
end
local function getBestTarget()
    local bestTarget = nil
    local bestScore = -math.huge
    local screenCenter = Vector2_new(
        Camera.ViewportSize.X * 0.5,
        Camera.ViewportSize.Y * 0.5
    )
    local camPos = Camera.CFrame.Position
    for _, character in ipairs(CachedTargets) do
        if not character or not character.Parent then
            continue
        end
        if character == LocalPlayer.Character then
            continue
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then
            continue
        end
        local player = Players:GetPlayerFromCharacter(character)
        if player and not isEnemy(player) then
            continue
        end
        local part =
            character:FindFirstChild(AIM_PART)
            or character:FindFirstChild("HumanoidRootPart")
            or character:FindFirstChild("Head")

        if not part then
            continue
        end
        local screenPos, onScreen =
            Camera:WorldToViewportPoint(part.Position)
        if not onScreen then
            continue
        end
        local screenDistance =
            (Vector2_new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
        if FOV_ENABLED and screenDistance > FOV_RADIUS then
            continue
        end
        local worldDistance =
            (camPos - part.Position).Magnitude
        -- Only now compute expensive data
        local velocity = getTargetVelocity(character)
        local speed = velocity.Magnitude
        local healthRatio = humanoid.Health / humanoid.MaxHealth
        local score = 0
        -- Center bias
        if FOV_ENABLED and FOV_RADIUS > 0 then
            local fovScore = 1 - (screenDistance / FOV_RADIUS)
            score += fovScore * 60
        end
        -- Distance
        score += (1 / worldDistance) * 200
        -- Velocity
        score += (1 / (speed + 1)) * 25
        -- Health
        score += (1 - healthRatio) * 30
        -- Direction
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            local toTarget = (root.Position - camPos).Unit
            local velocityDir = speed > 0 and velocity.Unit or Vector3.zero
            local dot = velocityDir:Dot(toTarget)
            score += math.max(dot, 0) * 20
        end
        -- Persistence
        if CURRENT_TARGET and part == CURRENT_TARGET then
            score += 20
        end
        if isVisible(part) then
            score += 40
        else
            score -= 40
        end
        if score > bestScore then
            bestScore = score
            bestTarget = part
        end
    end
    return bestTarget
end
local function updateTargetCache()
    table.clear(CachedTargets)
    for character in pairs(RegisteredCharacters) do
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then
            continue
        end
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then
            continue
        end
        local player = Players:GetPlayerFromCharacter(character)
        if player and not isEnemy(player) then
            continue
        end
        table.insert(CachedTargets, character)
    end
end
local function isTargetValid(part)
    if not part or not part.Parent then
        return false
    end
    local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        return false
    end
    return true
end
local function createFakeHitbox(part)
    if not part then return end
    if not FAKE_HITBOX then
        FAKE_HITBOX = Instance.new("Part")
        FAKE_HITBOX.Name = "FakeHitbox"
        FAKE_HITBOX.Shape = Enum.PartType.Ball
        FAKE_HITBOX.Transparency = 1
        FAKE_HITBOX.CanCollide = false
        FAKE_HITBOX.Massless = true
    end
    FAKE_HITBOX.Size = part.Size * HITBOX_MULTIPLIER
    FAKE_HITBOX.CFrame = part.CFrame
    FAKE_HITBOX.Parent = part.Parent
    if not FAKE_HITBOX:FindFirstChild("Weld") then
        local weld = Instance.new("WeldConstraint")
        weld.Name = "Weld"
        weld.Part0 = FAKE_HITBOX
        weld.Part1 = part
        weld.Parent = FAKE_HITBOX
    end
end
local function removeFakeHitbox()
    if FAKE_HITBOX then
        FAKE_HITBOX:Destroy()
        FAKE_HITBOX = nil
    end
end
local function aimAtPosition(targetPosition, dt)
    local camPos = Camera.CFrame.Position
    local targetDirection =
        (targetPosition - camPos).Unit
    local currentLook =
        Camera.CFrame.LookVector
    local smoothing = AIM_SMOOTHING
    local newLook =
        currentLook:Lerp(targetDirection, smoothing * dt * 60)
    Camera.CFrame =
        CFrame.new(camPos, camPos + newLook)
end
Connections["Aimbot"] =
RunService.Heartbeat:Connect(function(dt)
    lastTargetScan += dt
    if lastTargetScan >= TARGET_SCAN_INTERVAL then
        lastTargetScan = 0
        updateTargetCache()
    end
    if not AIMBOT_ENABLED then
        return
    end
    if not AIM_INPUT_ACTIVE then
        CURRENT_TARGET = nil
        return
    end
    local now = tick()
    if STICKY_LOCK_ENABLED then
        if not CURRENT_TARGET or not isTargetValid(CURRENT_TARGET) then
            CURRENT_TARGET = getBestTarget()
            lastTargetChange = now
        end
    else
        local best = getBestTarget()
        if best ~= CURRENT_TARGET then
            if now - lastTargetChange > TARGET_LOCK_TIME then
                CURRENT_TARGET = best
                lastTargetChange = now
            end
        end
    end
    if not CURRENT_TARGET then
        return
    end
    -- Hitbox
    if HITBOX_ENABLED then
        local head = CURRENT_TARGET.Parent:FindFirstChild("Head")
        if head then
            if CURRENT_HITBOX_TARGET ~= head then
                removeFakeHitbox()
                createFakeHitbox(head)
                CURRENT_HITBOX_TARGET = head
            end
        end
    else
        removeFakeHitbox()
        CURRENT_HITBOX_TARGET = nil
    end
    local aimPosition = CURRENT_TARGET.Position
    if PREDICTION_ENABLED then
        local character = CURRENT_TARGET.Parent
        local velocity = getTargetVelocity(character)
        local distance =
            (Camera.CFrame.Position - CURRENT_TARGET.Position).Magnitude
        if distance > MIN_PREDICTION_DISTANCE then
            local travelTime = distance / BULLET_SPEED
            aimPosition =
                CURRENT_TARGET.Position + velocity * travelTime
        end
    end
    aimAtPosition(aimPosition, dt)
end)

-- ESP SYSTEM
local function getESPColor(player)
    if ESP_MODE == "PVP" then
        return Color3.fromRGB(255,0,0)
    end
    if player.Team and LocalPlayer.Team then
        if player.Team == LocalPlayer.Team then
            return Color3.fromRGB(0,120,255) -- teammate (blue)
        else
            return Color3.fromRGB(255,0,0) -- enemy (red)
        end
    end
    if player.TeamColor and LocalPlayer.TeamColor then
        if player.TeamColor == LocalPlayer.TeamColor then
            return Color3.fromRGB(0,120,255)
        else
            return Color3.fromRGB(255,0,0)
        end
    end
    return Color3.fromRGB(255,0,0)
end
local function removeESP(character)
    local highlight = PlayerHighlights[character]
    if highlight then
        highlight:Destroy()
        PlayerHighlights[character] = nil
    end
end
local function createESP(player, character)
    local root = character:FindFirstChild("HumanoidRootPart")
    if root then
        local distance = (Camera.CFrame.Position - root.Position).Magnitude
        if distance > HIGHLIGHT_MAX_DISTANCE then
            return
        end
    end
    if player == LocalPlayer then
        return
    end
    if not ESP_ENABLED or not HIGHLIGHT_ESP_ENABLED then
        return
    end
    if PlayerHighlights[character] then
        return
    end
    local highlight = Instance.new("Highlight")
    highlight.Name = "PlayerESP"
    highlight.Adornee = character
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.FillColor = getESPColor(player)
    highlight.Parent = character
    PlayerHighlights[character] = highlight
end
local function characterAdded(player, character)
    createESP(player, character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            removeESP(character)
        end)
    end
end
local function setupPlayer(player)
    if player == LocalPlayer then
        return
    end
    if player.Character then
        characterAdded(player, player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        characterAdded(player, character)
    end)
    player:GetPropertyChangedSignal("Team"):Connect(function()
        if player.Character and PlayerHighlights[player.Character] then
            PlayerHighlights[player.Character].FillColor = getESPColor(player)
        end
    end)
end
-- register existing players
for _,player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end
-- new players
Players.PlayerAdded:Connect(setupPlayer)
-- cleanup
Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        removeESP(player.Character)
    end
end)
local function createDrawingESP(character)
    if DrawingESP[character] then return end
    local box = Drawing.new("Square")
    box.Thickness = 2
    box.Filled = false
    box.Visible = false
    local line = Drawing.new("Line")
    line.Thickness = 1
    line.Visible = false
    local distance = Drawing.new("Text")
    distance.Size = 16
    distance.Center = true
    distance.Outline = true
    distance.Visible = false
    DrawingESP[character] = {
        Box = box,
        Snapline = line,
        Distance = distance
    }
end
local function removeDrawingESP(character)
    local data = DrawingESP[character]
    if not data then return end
    for _,obj in pairs(data) do
        obj:Remove()
    end
    DrawingESP[character] = nil
end

-- INPUT HANDLING
UserInputService.InputBegan:Connect(function(input)
    -- Mouse
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        AIM_INPUT_ACTIVE = true
    end
    -- Gamepad
    if input.KeyCode == Enum.KeyCode.ButtonL2 then
        AIM_INPUT_ACTIVE = true
    end
    -- Mobile (right side of screen)
    if input.UserInputType == Enum.UserInputType.Touch then
        local screenX = input.Position.X
        if screenX > Camera.ViewportSize.X * 0.5 then
            AIM_INPUT_ACTIVE = true
        end
    end

end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        AIM_INPUT_ACTIVE = false
    end
    if input.KeyCode == Enum.KeyCode.ButtonL2 then
        AIM_INPUT_ACTIVE = false
    end
    if input.UserInputType == Enum.UserInputType.Touch then
        AIM_INPUT_ACTIVE = false
    end
    if not AIM_INPUT_ACTIVE then
        CURRENT_TARGET = nil
        CURRENT_HITBOX_TARGET = nil
        removeFakeHitbox()
    end
end)

-- MAIN UPDATE LOOP
Connections["RenderStepped"] = RunService.RenderStepped:Connect(function()
    updateCrosshair()
    -- FOV Circle
    if FOV_ENABLED then
        FOVCircle.Position = Vector2_new(
            Camera.ViewportSize.X / 2,
            Camera.ViewportSize.Y / 2
        )
        FOVCircle.Radius = FOV_RADIUS
        FOVCircle.Color = FOV_COLOR
    end
    -- No Recoil
    if NO_RECOIL_ENABLED and mousemoverel then
        local pitch = select(1, Camera.CFrame:ToOrientation())
        if LAST_PITCH ~= 0 then
            local delta = pitch - LAST_PITCH
            -- only counter sudden upward recoil
            if delta < -0.003 then
                local compensation = (-delta * 60) * RECOIL_STRENGTH
                -- clamp to prevent overshoot
                compensation = math.clamp(compensation, -3, 3)
                mousemoverel(0, compensation)
            end
        end
        LAST_PITCH = pitch
    else
        LAST_PITCH = select(1, Camera.CFrame:ToOrientation())
    end
    -- ESP Highlight distance check (optimized)
    highlightFrameCounter += 1
    if highlightFrameCounter >= 10 then
        highlightFrameCounter = 0
        local camPos = Camera.CFrame.Position
        for character, highlight in pairs(PlayerHighlights) do
            local root = character:FindFirstChild("HumanoidRootPart")
            if root then
                local dist = (camPos - root.Position).Magnitude
                highlight.Enabled = dist <= HIGHLIGHT_MAX_DISTANCE
            end
        end
    end
    if DRAWING_ESP_ENABLED then
        for _,entity in pairs(TrackedPlayers) do
            local player = entity.player
            local character = entity.character
            if player == LocalPlayer then
                continue
            end
            if not isEnemy(player) then
                if player.Character then
                    removeDrawingESP(player.Character)
                end
                continue
            end
            if not character then
                continue
            end
            local root = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not root or not humanoid or humanoid.Health <= 0 then
                removeDrawingESP(character)
                continue
            end
            local distance = (Camera.CFrame.Position - root.Position).Magnitude
            if distance > DRAWING_MAX_DISTANCE then
                removeDrawingESP(character)
                continue
            end
            if not DrawingESP[character] then
                createDrawingESP(character)
            end
            local data = DrawingESP[character]
            local rootPos, onScreen = Camera:WorldToViewportPoint(root.Position)
            local head = character:FindFirstChild("Head")
            if not head then
                continue
            end
            local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
            local legPos = Camera:WorldToViewportPoint(root.Position - Vector3.new(0,3,0))
            if not onScreen then
                data.Box.Visible = false
                data.Snapline.Visible = false
                data.Distance.Visible = false
                continue
            end
            -- Proper box sizing
            local height = math.abs(headPos.Y - legPos.Y)
            local width = height / 2
            local color = Color3.fromRGB(255,0,0)
            -- BOX
            if DRAW_BOX then
                data.Box.Size = Vector2_new(width, height)
                data.Box.Position = Vector2_new(rootPos.X - width/2, rootPos.Y - height/2)
                data.Box.Color = color
                data.Box.Visible = true
            else
                if data.Box then
                    data.Box:Remove()
                    data.Box = Drawing.new("Square")
                    data.Box.Visible = false
                end
            end
            -- SNAPLINE
            if DRAW_SNAPLINE then
                data.Snapline.From = Vector2_new(Camera.ViewportSize.X/2, 0)
                data.Snapline.To = Vector2_new(rootPos.X, rootPos.Y)
                data.Snapline.Color = color
                data.Snapline.Visible = true
            else
                if data.Snapline then
                    data.Snapline:Remove()
                    data.Snapline = Drawing.new("Line")
                    data.Snapline.Visible = false
                end
            end
            -- DISTANCE
            if DRAW_DISTANCE then
                local distance = (Camera.CFrame.Position - root.Position).Magnitude

                data.Distance.Text = math.floor(distance).."m"
                data.Distance.Position = Vector2_new(rootPos.X, rootPos.Y + height/2 + 10)
                data.Distance.Color = color
                data.Distance.Visible = true
            else
                if data.Distance then
                    data.Distance:Remove()
                    data.Distance = Drawing.new("Text")
                    data.Distance.Visible = false
                end
            end
        end
    else
        -- master toggle OFF -> delete everything
        for character,_ in pairs(DrawingESP) do
            removeDrawingESP(character)
        end
    end
end)
local function toggleESP(state)
    ESP_ENABLED = state
    if not state then
        for character,highlight in pairs(PlayerHighlights) do
            highlight:Destroy()
        end
        table.clear(PlayerHighlights)
    else
        for _,player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                createESP(player, player.Character)
            end
        end
    end
end
RunService:BindToRenderStep("ZoomOverride", Enum.RenderPriority.Camera.Value + 1, function()
    if not ZOOM_ENABLED then
        return
    end
    -- Dynamic zoom distance logic
    if AIM_INPUT_ACTIVE and DYNAMIC_ZOOM and CURRENT_TARGET then
        local dist = (Camera.CFrame.Position - CURRENT_TARGET.Position).Magnitude
        if dist < 150 then
            TARGET_FOV = 40
        elseif dist < 300 then
            TARGET_FOV = 30
        elseif dist < 600 then
            TARGET_FOV = 20
        elseif dist < 1000 then
            TARGET_FOV = 14
        else
            TARGET_FOV = 8
        end
    elseif AIM_INPUT_ACTIVE then
        TARGET_FOV = ZOOM_FOV
    else
        TARGET_FOV = DEFAULT_FOV
    end
    -- Smooth interpolation
    CURRENT_FOV = CURRENT_FOV + (TARGET_FOV - CURRENT_FOV) * 0.15
    Camera.FieldOfView = CURRENT_FOV
end)
Connections["Heartbeat"] = RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum and MOVEMENT_ENABLED then
        hum.WalkSpeed = WALK_SPEED
        hum.JumpPower = JUMP_POWER
        hum.UseJumpPower = true
    end
end)

--  TABS
local CombatTab = Window:CreateTab("Combat", 4483362458)
local ESPTab = Window:CreateTab("ESP", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local EnvironmentTab = Window:CreateTab("Environment", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- COMBAT TAB
CombatTab:CreateSection("Aimbot Settings")
CombatTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Callback = function(v)
        AIMBOT_ENABLED = v
        FOVCircle.Visible = v and FOV_ENABLED
    end
})
CombatTab:CreateDropdown({
    Name = "Target Part",
    Options = {"Head", "HumanoidRootPart"},
    CurrentOption = {"Head"},
    Callback = function(opt)
        AIM_PART = type(opt) == "table" and opt[1] or opt
    end
})
CombatTab:CreateToggle({
    Name = "Enable Prediction",
    CurrentValue = false,
    Callback = function(v)
        PREDICTION_ENABLED = v
    end
})
CombatTab:CreateToggle({
    Name = "Enable No Recoil",
    CurrentValue = false,
    Callback = function(v)
        NO_RECOIL_ENABLED = v
    end
})
CombatTab:CreateToggle({
    Name = "Enable Custom Crosshair",
    CurrentValue = false,
    Callback = function(v)
        CROSSHAIR_ENABLED = v
    end
})
CombatTab:CreateSection("FOV Settings")
CombatTab:CreateToggle({
    Name = "Use FOV Circle",
    CurrentValue = false,
    Callback = function(v)
        FOV_ENABLED = v
        FOVCircle.Visible = AIMBOT_ENABLED and v
    end
})
CombatTab:CreateSlider({
    Name = "FOV Radius",
    Range = {50, 600},
    Increment = 5,
    CurrentValue = 150,
    Callback = function(v)
        FOV_RADIUS = v
    end
})
CombatTab:CreateColorPicker({
    Name = "FOV Color",
    Color = Color3.fromRGB(0,255,0),
    Callback = function(v)
        FOV_COLOR = v
    end
})
CombatTab:CreateSection("Aim Configurations")
CombatTab:CreateSlider({
    Name = "Prediction Strength",
    Range = {0.5, 2},
    Increment = 0.05,
    CurrentValue = 1,
    Callback = function(v)
        ADAPTIVE_PREDICTION_STRENGTH = v
    end
})
CombatTab:CreateSlider({
    Name = "Max Prediction Distance",
    Range = {100, 1000},
    Increment = 10,
    CurrentValue = 300,
    Callback = function(v)
        MAX_PREDICTION_DISTANCE = v
    end
})
CombatTab:CreateSlider({
    Name = "Aim Smoothing",
    Range = {0.01, 1},
    Increment = 0.01,
    CurrentValue = 0.2,
    Callback = function(value)
        AIM_SMOOTHING = value
    end
})
CombatTab:CreateSlider({
    Name = "Recoil Compensation Strength",
    Range = {0.1, 2},
    Increment = 0.1,
    CurrentValue = 0.7,
    Callback = function(value)
        RECOIL_STRENGTH = value
    end
})
CombatTab:CreateSection("Anti-Jitter (Improves Aim Stability)")
CombatTab:CreateToggle({
    Name = "Target Locking",
    CurrentValue = false,
    Callback = function(v)
        STICKY_LOCK_ENABLED = v
    end
})
CombatTab:CreateToggle({
    Name = "Deadzone",
    CurrentValue = false,
    Callback = function(v)
        DEADZONE_ENABLED = v
    end
})
CombatTab:CreateToggle({
    Name = "Dynamic Smoothing",
    CurrentValue = false,
    Callback = function(v)
        DYNAMIC_SMOOTHING_ENABLED = v
    end
})
CombatTab:CreateSection("Enable Iron Sight Scope (Experimental)")
CombatTab:CreateToggle({
    Name = "Enable Right-Click Zoom",
    CurrentValue = false,
    Callback = function(v)
        ZOOM_ENABLED = v
        if not v then
            Camera.FieldOfView = DEFAULT_FOV
        end
    end
})
CombatTab:CreateDropdown({
    Name = "Zoom Strength",
    Options = {"2x","4x","6x","8x","12x","20x","Auto"},
    CurrentOption = {"4x"},
    Callback = function(opt)
        local selected = type(opt) == "table" and opt[1] or opt
        if selected == "Auto" then
            DYNAMIC_ZOOM = true
            return
        else
            DYNAMIC_ZOOM = false
        end
        if selected == "2x" then
            ZOOM_FOV = 40
        elseif selected == "4x" then
            ZOOM_FOV = 25
        elseif selected == "6x" then
            ZOOM_FOV = 18
        elseif selected == "8x" then
            ZOOM_FOV = 14
        elseif selected == "12x" then
            ZOOM_FOV = 10
        elseif selected == "20x" then
            ZOOM_FOV = 6
        end
    end
})
CombatTab:CreateSection("Hitbox")
local HeadHitboxToggle = CombatTab:CreateToggle({
    Name = "Increase Head Hitbox",
    CurrentValue = false,
    Callback = function(v)
        HITBOX_ENABLED = v
        if not v then
            removeFakeHitbox()
        end
    end
})
local HitboxSizeDropdown = CombatTab:CreateDropdown({
    Name = "Head Hitbox Size",
    Options = {"1x","2x","5x","10x"},
    CurrentOption = {"1x"},
    Callback = function(opt)
        local selected = type(opt) == "table" and opt[1] or opt
        if selected == "1x" then
            HITBOX_MULTIPLIER = 1
        elseif selected == "2x" then
            HITBOX_MULTIPLIER = 2
        elseif selected == "5x" then
            HITBOX_MULTIPLIER = 5
        elseif selected == "10x" then
            HITBOX_MULTIPLIER = 10
        end
    end
})

-- ESP TAB
ESPTab:CreateSection("Toggle ESP Features")
ESPTab:CreateToggle({
    Name = "Master ESP Toggle",
    CurrentValue = false,
    Callback = function(v)
        ESP_ENABLED = v

        if not v then
            for character,highlight in pairs(PlayerHighlights) do
                highlight:Destroy()
            end
            table.clear(PlayerHighlights)
        end
    end
})
ESPTab:CreateDropdown({ Name = "ESP Mode", Options = {"Team-Based", "PVP"}, CurrentOption = {"Team-Based"}, Callback = function(opt) ESP_MODE = type(opt) == "table" and opt[1] or opt end })
ESPTab:CreateToggle({
    Name = "Full Body Highlights",
    CurrentValue = false,
    Callback = function(v)
        HIGHLIGHT_ESP_ENABLED = v
    end
})
ESPTab:CreateSlider({
    Name = "Highlight ESP Distance",
    Range = {100, 3000},
    Increment = 50,
    CurrentValue = 1000,
    Callback = function(v)
        HIGHLIGHT_MAX_DISTANCE = v
    end
})
ESPTab:CreateSection("Toggle Drawing ESP (Experimental Features)")
ESPTab:CreateToggle({
    Name = "Enable Drawings ESP",
    CurrentValue = false,
    Callback = function(v)
        DRAWING_ESP_ENABLED = v

        if not v then
            for character,_ in pairs(DrawingESP) do
                removeDrawingESP(character)
            end
        end
    end
})
ESPTab:CreateSlider({
    Name = "Drawing ESP Distance",
    Range = {100, 3000},
    Increment = 50,
    CurrentValue = 1000,
    Callback = function(v)
        DRAWING_MAX_DISTANCE = v
    end
})
ESPTab:CreateToggle({
    Name = "Boxes",
    CurrentValue = false,
    Callback = function(v)
        DRAW_BOX = v
    end
})
ESPTab:CreateToggle({
    Name = "Distance",
    CurrentValue = false,
    Callback = function(v)
        DRAW_DISTANCE = v
    end
})
ESPTab:CreateToggle({
    Name = "Snaplines",
    CurrentValue = false,
    Callback = function(v)
        DRAW_SNAPLINE = v
    end
})

-- PLAYER TAB
PlayerTab:CreateSection("Player Movement Modifications")
PlayerTab:CreateToggle({
    Name = "Enable Custom Movement",
    CurrentValue = false,
    Callback = function(v)
        MOVEMENT_ENABLED = v
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            if v then
                hum.WalkSpeed = WALK_SPEED
                hum.JumpPower = JUMP_POWER
            else
                hum.WalkSpeed = DEFAULT_WALKSPEED
                hum.JumpPower = DEFAULT_JUMPPOWER
            end
        end
    end
})
PlayerTab:CreateSlider({ Name = "Movement Speed", Range = {16, 200}, Increment = 1, CurrentValue = 16, Callback = function(v) WALK_SPEED = v end })
PlayerTab:CreateSlider({ Name = "Jump Power", Range = {50, 300}, Increment = 1, CurrentValue = 50, Callback = function(v) JUMP_POWER = v end })

-- ENVIRONMENT TAB
EnvironmentTab:CreateSection("Map and Environment Modifications")
EnvironmentTab:CreateToggle({
    Name = "Remove Fog",
    CurrentValue = false,
    Callback = function(v)
        setRemoveFog(v)
    end
})
EnvironmentTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Callback = function(v)
        setFullBright(v)
    end
})
EnvironmentTab:CreateToggle({
    Name = "Enable Potato Graphics",
    CurrentValue = false,
    Callback = function(v)
        POTATO_MODE = v
        setPotatoGraphics(v)
    end
})

-- SETTINGS TAB
SettingsTab:CreateSection("Script Information")
SettingsTab:CreateParagraph({
    Title = "Author & Developer",
    Content = "BabyMaxford"
})
SettingsTab:CreateButton({
    Name = "Unload Script",
    Callback = function()
        -- Stop loops
        for _, conn in pairs(Connections) do
            conn:Disconnect()
        end 
        -- Clean drawings
        clearAllDrawings()
        FOVCircle:Remove()
        -- Remove highlights
        for character,highlight in pairs(PlayerHighlights) do
            highlight:Destroy()
        end
        table.clear(PlayerHighlights)
        -- Reset player
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
            LocalPlayer.Character.Humanoid.JumpPower = 50
        end
        -- Restore lighting
        Lighting.FogEnd = originalLighting.FogEnd
        Lighting.GlobalShadows = originalLighting.GlobalShadows
        Lighting.Ambient = originalLighting.Ambient
        Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient 
        -- Destroy UI
        Rayfield:Destroy()
    end
})

Rayfield:Notify({Title = "Combat Specialist Pro", Content = "V12 Loaded with New Features", Duration = 5})