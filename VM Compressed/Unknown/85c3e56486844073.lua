-- DRRAY UI LIBRARY LOADER
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

-- INITIALIZE WINDOW
local Window = DrRayLibrary:Load("Just Tornadoes 1 | V51.7 EF6", "Default")

-- CREATE TABS
local CoreTab = DrRayLibrary.newTab("Titan Core", "rbxassetid://4483362458")
local ChassisTab = DrRayLibrary.newTab("Chassis Tuning", "rbxassetid://4483362458")
local UtilityTab = DrRayLibrary.newTab("Utilities", "rbxassetid://4483362458")

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- MODULE STATES
local hardLockEnabled = false
local massEnabled = false
local offsetEnabled = false
local airBrakeEnabled = false
local ghostModeEnabled = false
local tornadoDamperEnabled = false

local masterKeybind = Enum.KeyCode.X
local massMultiplier = 200
local wheelOffsetValue = 1.5
local lockResponsiveness = 500

-- SYSTEM CACHES
local originalWheelPositions = {}
local originalCollisions = {}
local originalPhysicalProps = {}

local frontAttach, rearAttach
local alignFrontPos, alignRearPos
local alignFrontOrient, alignRearOrient
local anchorPartFront, anchorPartRear

-- EASE-OUT THREAD CONTROLLER
local activeEaseThread = nil

--------------------------------------------------------------------------------
-- HELPER FUNCTIONS
--------------------------------------------------------------------------------
local function getVehicle()
    local character = LocalPlayer.Character
    if not character then return nil, nil end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or not humanoid.SeatPart then return nil, nil end
    local seat = humanoid.SeatPart
    if not seat:IsA("VehicleSeat") and not seat:IsA("Seat") then return nil, nil end
    local model = seat:FindFirstAncestorOfClass("Model") or seat.Parent
    return model, seat
end

--------------------------------------------------------------------------------
-- MODULE 1: EF6 TITAN RIGID HARD LOCK
--------------------------------------------------------------------------------
local function setRigidHardLock(enable)
    local model, seat = getVehicle()
    if not model or not seat then return end
    local root = model.PrimaryPart or seat

    if enable then
        setRigidHardLock(false)

        frontAttach = Instance.new("Attachment")
        frontAttach.Name = "EF5_FrontAttach"
        frontAttach.Position = Vector3.new(0, -0.5, -2.5)
        frontAttach.Parent = seat

        rearAttach = Instance.new("Attachment")
        rearAttach.Name = "EF5_RearAttach"
        rearAttach.Position = Vector3.new(0, -0.5, 2.5)
        rearAttach.Parent = seat

        anchorPartFront = Instance.new("Part")
        anchorPartFront.Name = "EF5_FrontAnchor"
        anchorPartFront.Size = Vector3.new(0.5, 0.5, 0.5)
        anchorPartFront.Transparency = 1
        anchorPartFront.CanCollide = false
        anchorPartFront.Anchored = true
        anchorPartFront.CFrame = frontAttach.WorldCFrame
        anchorPartFront.Parent = workspace

        local targetFrontAttach = Instance.new("Attachment")
        targetFrontAttach.Name = "EF5_TargetAttach"
        targetFrontAttach.Parent = anchorPartFront

        anchorPartRear = Instance.new("Part")
        anchorPartRear.Name = "EF5_RearAnchor"
        anchorPartRear.Size = Vector3.new(0.5, 0.5, 0.5)
        anchorPartRear.Transparency = 1
        anchorPartRear.CanCollide = false
        anchorPartRear.Anchored = true
        anchorPartRear.CFrame = rearAttach.WorldCFrame
        anchorPartRear.Parent = workspace

        local targetRearAttach = Instance.new("Attachment")
        targetRearAttach.Name = "EF5_TargetAttach"
        targetRearAttach.Parent = anchorPartRear

        alignFrontPos = Instance.new("AlignPosition")
        alignFrontPos.Name = "EF5_PosLock"
        alignFrontPos.Mode = Enum.PositionAlignmentMode.TwoAttachment
        alignFrontPos.Attachment0 = frontAttach
        alignFrontPos.Attachment1 = targetFrontAttach
        alignFrontPos.MaxForce = 9e9
        alignFrontPos.MaxAxesForce = Vector3.new(9e9, 9e9, 9e9)
        alignFrontPos.MaxVelocity = 9e9
        alignFrontPos.Responsiveness = lockResponsiveness
        alignFrontPos.Parent = seat

        alignRearPos = Instance.new("AlignPosition")
        alignRearPos.Name = "EF5_PosLock"
        alignRearPos.Mode = Enum.PositionAlignmentMode.TwoAttachment
        alignRearPos.Attachment0 = rearAttach
        alignRearPos.Attachment1 = targetRearAttach
        alignRearPos.MaxForce = 9e9
        alignRearPos.MaxAxesForce = Vector3.new(9e9, 9e9, 9e9)
        alignRearPos.MaxVelocity = 9e9
        alignRearPos.Responsiveness = lockResponsiveness
        alignRearPos.Parent = seat

        alignFrontOrient = Instance.new("AlignOrientation")
        alignFrontOrient.Name = "EF5_OrientLock"
        alignFrontOrient.Mode = Enum.OrientationAlignmentMode.TwoAttachment
        alignFrontOrient.Attachment0 = frontAttach
        alignFrontOrient.Attachment1 = targetFrontAttach
        alignFrontOrient.MaxTorque = 9e9
        alignFrontOrient.MaxAngularVelocity = 9e9
        alignFrontOrient.Responsiveness = lockResponsiveness
        alignFrontOrient.PrimaryAxisOnly = false
        alignFrontOrient.Parent = seat

        alignRearOrient = Instance.new("AlignOrientation")
        alignRearOrient.Name = "EF5_OrientLock"
        alignRearOrient.Mode = Enum.OrientationAlignmentMode.TwoAttachment
        alignRearOrient.Attachment0 = rearAttach
        alignRearOrient.Attachment1 = targetRearAttach
        alignRearOrient.MaxTorque = 9e9
        alignRearOrient.MaxAngularVelocity = 9e9
        alignRearOrient.Responsiveness = lockResponsiveness
        alignRearOrient.PrimaryAxisOnly = false
        alignRearOrient.Parent = seat
    else
        if alignFrontPos then alignFrontPos:Destroy() alignFrontPos = nil end
        if alignRearPos then alignRearPos:Destroy() alignRearPos = nil end
        if alignFrontOrient then alignFrontOrient:Destroy() alignFrontOrient = nil end
        if alignRearOrient then alignRearOrient:Destroy() alignRearOrient = nil end
        
        if anchorPartFront then anchorPartFront:Destroy() anchorPartFront = nil end
        if anchorPartRear then anchorPartRear:Destroy() anchorPartRear = nil end
        if frontAttach then frontAttach:Destroy() frontAttach = nil end
        if rearAttach then rearAttach:Destroy() rearAttach = nil end

        for _, child in ipairs(seat:GetChildren()) do
            if string.sub(child.Name, 1, 4) == "EF5_" then
                pcall(function() child:Destroy() end)
            end
        end

        for _, child in ipairs(workspace:GetChildren()) do
            if string.sub(child.Name, 1, 4) == "EF5_" then
                pcall(function() child:Destroy() end)
            end
        end

        if root then
            root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            root.AssemblyAngularVelocity = Vector3.zero
        end
    end
end

--------------------------------------------------------------------------------
-- MODULE 2: DENSITY MASS ENGINE WITH 5-SECOND DYNAMIC EASE-OUT
--------------------------------------------------------------------------------
local function applyDensityToModel(model, targetDensity)
    for part, _ in pairs(originalPhysicalProps) do
        if part and part.Parent then
            pcall(function()
                local currentProps = part.CustomPhysicalProperties or PhysicalProperties.new(part.Material)
                part.CustomPhysicalProperties = PhysicalProperties.new(
                    targetDensity,
                    currentProps.Friction,
                    currentProps.Elasticity,
                    currentProps.FrictionWeight,
                    currentProps.ElasticityWeight
                )
            end)
        end
    end
end

local function setVehicleMass(enable)
    local model, seat = getVehicle()
    if not model or not seat then return end

    if activeEaseThread then
        task.cancel(activeEaseThread)
        activeEaseThread = nil
    end

    if enable then
        if next(originalPhysicalProps) == nil then
            for _, part in ipairs(model:GetDescendants()) do
                if part:IsA("BasePart") then
                    originalPhysicalProps[part] = {
                        CustomProps = part.CustomPhysicalProperties
                    }
                end
            end
        end

        local startDensity = math.clamp((massMultiplier / 100) * 100, 0.7, 100)
        applyDensityToModel(model, startDensity)
    else
        activeEaseThread = task.spawn(function()
            local startDensity = math.clamp((massMultiplier / 100) * 100, 0.7, 100)
            local easeDuration = 5.0
            local startTime = tick()

            print("[V51.7] Ease-Out Engaged: Unloading weight across 5 seconds...")

            while (tick() - startTime) < easeDuration do
                local elapsed = tick() - startTime
                local alpha = elapsed / easeDuration
                
                local easedAlpha = 1 - ((1 - alpha) * (1 - alpha))
                local currentDensity = startDensity + (0.7 - startDensity) * easedAlpha

                applyDensityToModel(model, currentDensity)
                task.wait(0.03)
            end

            for part, saved in pairs(originalPhysicalProps) do
                if part and part.Parent then
                    pcall(function()
                        part.CustomPhysicalProperties = saved.CustomProps
                    end)
                end
            end
            table.clear(originalPhysicalProps)
            activeEaseThread = nil

            print("[V51.7] Ease-Out Complete: Physical properties restored.")
        end)
    end
end

--------------------------------------------------------------------------------
-- MODULE 3: DYNAMIC WHEEL OFFSET ENGINE
--------------------------------------------------------------------------------
local function applyWheelOffset(enable)
    local model, seat = getVehicle()
    if not model or not seat then return end

    if enable then
        table.clear(originalWheelPositions)
        for _, obj in ipairs(model:GetDescendants()) do
            if obj:IsA("CylindricalConstraint") or obj:IsA("SpringConstraint") then
                local attach = obj.Attachment0
                if attach and not originalWheelPositions[attach] then
                    originalWheelPositions[attach] = attach.Position
                    local sideSign = attach.Position.X >= 0 and 1 or -1
                    attach.Position = attach.Position + Vector3.new(wheelOffsetValue * sideSign, 0, 0)
                end
            elseif obj:IsA("BasePart") and string.find(string.lower(obj.Name), "wheel") then
                if not originalWheelPositions[obj] then
                    originalWheelPositions[obj] = obj.Position
                end
            end
        end
    else
        for attach, origPos in pairs(originalWheelPositions) do
            if attach and attach.Parent then
                pcall(function() attach.Position = origPos end)
            end
        end
        table.clear(originalWheelPositions)
    end
end

--------------------------------------------------------------------------------
-- MODULE 4: GHOST BODY MODE
--------------------------------------------------------------------------------
local function setGhostMode(enable)
    local model, seat = getVehicle()
    if not model then return end

    if enable then
        table.clear(originalCollisions)
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") and not string.find(string.lower(part.Name), "wheel") and part ~= seat then
                originalCollisions[part] = part.CanCollide
                part.CanCollide = false
            end
        end
    else
        for part, origState in pairs(originalCollisions) do
            if part and part.Parent then
                pcall(function() part.CanCollide = origState end)
            end
        end
        table.clear(originalCollisions)
    end
end

--------------------------------------------------------------------------------
-- RUNSERVICE HEARTBEAT LOOP (EF6 ACTIVE FORCE DAMPER & ANTI-LIFT)
--------------------------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    local model, seat = getVehicle()
    if not model or not seat then return end
    local root = model.PrimaryPart or seat

    -- ACTIVE TORNADO FORCE NEUTRALIZER
    if tornadoDamperEnabled or hardLockEnabled then
        -- 1. Strip external force instances injected by tornado scripts
        for _, obj in ipairs(model:GetDescendants()) do
            if obj:IsA("BodyVelocity") or obj:IsA("VectorForce") or obj:IsA("BodyForce") or obj:IsA("BodyThrust") or obj:IsA("LinearVelocity") then
                if string.sub(obj.Name, 1, 4) ~= "EF5_" then
                    pcall(function() obj:Destroy() end)
                end
            end
        end

        -- 2. Wipe tornado wind attributes if present
        for attrName, _ in pairs(model:GetAttributes()) do
            if string.find(string.lower(attrName), "wind") or string.find(string.lower(attrName), "lift") or string.find(string.lower(attrName), "force") then
                pcall(function() model:SetAttribute(attrName, 0) end)
            end
        end

        -- 3. Kill upward vertical Y-velocity specifically (leaves driving X/Z traction intact)
        local currentVel = root.AssemblyLinearVelocity
        if currentVel.Y > 0 then
            root.AssemblyLinearVelocity = Vector3.new(currentVel.X, 0, currentVel.Z)
        end
        
        -- Dampen angular spin from wind without locking steering completely
        local currentAng = root.AssemblyAngularVelocity
        root.AssemblyAngularVelocity = Vector3.new(currentAng.X * 0.1, currentAng.Y * 0.5, currentAng.Z * 0.1)
    end

    if airBrakeEnabled and not hardLockEnabled then
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {model}
        rayParams.FilterType = Enum.RaycastFilterType.Exclude

        local rayResult = workspace:Raycast(root.Position, Vector3.new(0, -12, 0), rayParams)
        if not rayResult then
            local currentVel = root.AssemblyLinearVelocity
            if currentVel.Y > 2 then
                root.AssemblyLinearVelocity = Vector3.new(currentVel.X, -5, currentVel.Z)
            end
        end
    end
end)

--------------------------------------------------------------------------------
-- INPUT & UI BINDINGS
--------------------------------------------------------------------------------
local function toggleMasterSystem()
    local newState = not (hardLockEnabled and massEnabled)
    
    hardLockEnabled = newState
    massEnabled = newState
    tornadoDamperEnabled = newState
    
    setRigidHardLock(newState)
    setVehicleMass(newState)
    
    print("[V51.7] Master State:", newState and "ENGAGED" or "DISENGAGED")
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == masterKeybind then
        toggleMasterSystem()
    end
end)

-- CORE TAB CONTROLS
CoreTab.newToggle("Rigid Hard Lock (Flex)", "Toggles core structural anchor lock.", false, function(val)
    hardLockEnabled = val
    setRigidHardLock(val)
end)

CoreTab.newToggle("Tornado Force Damper", "Strips active tornado lift and wind vectors.", false, function(val)
    tornadoDamperEnabled = val
end)

CoreTab.newSlider("Vibration & Flex", "Adjusts lock alignment responsiveness.", 2000, false, function(val)
    lockResponsiveness = math.clamp(val, 100, 2000)
    if alignFrontPos then alignFrontPos.Responsiveness = lockResponsiveness end
    if alignRearPos then alignRearPos.Responsiveness = lockResponsiveness end
    if alignFrontOrient then alignFrontOrient.Responsiveness = lockResponsiveness end
    if alignRearOrient then alignRearOrient.Responsiveness = lockResponsiveness end
end)

CoreTab.newToggle("Density Mass (5s Ease-Out)", "Applies density multiplier with 5s cooldown.", false, function(val)
    massEnabled = val
    setVehicleMass(val)
end)

CoreTab.newSlider("Weight Multiplier", "Multiplies default physical density.", 200, false, function(val)
    massMultiplier = math.clamp(val, 10, 200)
    if massEnabled then setVehicleMass(true) end
end)

CoreTab.newInput("Master Keybind", "Enter key character (e.g., X, Z, F)", function(text)
    local upperText = string.upper(text)
    if Enum.KeyCode[upperText] then
        masterKeybind = Enum.KeyCode[upperText]
        print("[V51.7] Master Keybind updated to:", upperText)
    end
end)

CoreTab.newButton("Mobile Deploy Button", "Toggles Master Lock on touch devices.", function()
    toggleMasterSystem()
end)

-- CHASSIS TUNING TAB CONTROLS
ChassisTab.newInput("Wheel Offset (Studs)", "Enter offset distance in studs.", function(text)
    local val = tonumber(text)
    if val then
        wheelOffsetValue = val
        if offsetEnabled then
            applyWheelOffset(false)
            applyWheelOffset(true)
        end
    end
end)

ChassisTab.newToggle("Enable Wheel Offset", "Applies lateral wheel width adjustment.", false, function(val)
    offsetEnabled = val
    applyWheelOffset(val)
end)

ChassisTab.newToggle("Air-Brake Anti-Launch", "Prevents airborne launch forces when unlocked.", false, function(val)
    airBrakeEnabled = val
end)

ChassisTab.newToggle("Ghost Body Mode", "Disables chassis collision while leaving wheels active.", false, function(val)
    ghostModeEnabled = val
    setGhostMode(val)
end)

-- UTILITIES TAB CONTROLS
UtilityTab.newButton("Instant Upright Flip", "Flips vehicle right side up and zeros velocity.", function()
    local model, seat = getVehicle()
    if model and seat then
        local root = model.PrimaryPart or seat
        root.CFrame = CFrame.new(root.Position + Vector3.new(0, 5, 0)) * CFrame.Angles(0, math.rad(root.Orientation.Y), 0)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end
end)

UtilityTab.newButton("Force Physics Reset", "Clears all locks, weights, offsets, and forces.", function()
    hardLockEnabled = false
    massEnabled = false
    offsetEnabled = false
    airBrakeEnabled = false
    ghostModeEnabled = false
    tornadoDamperEnabled = false
    if activeEaseThread then task.cancel(activeEaseThread) activeEaseThread = nil end
    setRigidHardLock(false)
    setVehicleMass(false)
    applyWheelOffset(false)
    setGhostMode(false)
    print("[V51.7] Emergency Physics Reset complete.")
end)
