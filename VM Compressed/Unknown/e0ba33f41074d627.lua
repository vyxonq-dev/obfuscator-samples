-- Services declaration
local playersService = game:GetService("Players")
local lightingService = game:GetService("Lighting")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local materialService = game:GetService("MaterialService")
local workspaceService = game:GetService("Workspace")
local statsService = game:GetService("Stats")
local debrisService = game:GetService("Debris")
local textChatService = game:GetService("TextChatService")
 
-- Client references
local clientPlayer = playersService.LocalPlayer
local PlayerGui = clientPlayer:WaitForChild("PlayerGui", 10)
 
-- Load WindUI library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
 
-- Create main window
local Window = WindUI:CreateWindow({
    Title = "V1PRBLOCK",
    Icon = "sparkle",
    Author = "Maintained By Viper",
    Folder = "GlovSakenScript",
    Size = UDim2.fromOffset(350, 300),
    Transparent = false,
    Theme = "Dark",
    Resizable = false,
    SideBarWidth = 150,
    HideSearchBar = true,
    ScrollBarEnabled = false,
})
 
-- Window toggle key
Window:SetToggleKey(Enum.KeyCode.K)
 
-- Window text font
WindUI:SetFont("rbxasset://fonts/families/AccanthisADFStd.json")
 
-- Mobile open button configuration
Window:EditOpenButton({
    Title = "V1PRBLOCK",
    Icon = "sparkle",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 0,
    Color = ColorSequence.new(
        Color3.fromHex("000000"), 
        Color3.fromHex("000000")
    ),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})
 
----------------------------------------------------------------
-- Sentinel Tab
----------------------------------------------------------------
local SentinelTab = Window:Tab({
    Title = "Sentinel",
    Icon = "shield",
})
 
----------------------------------------------------------------
-- Guest1337 Section
----------------------------------------------------------------
local GuestSection = SentinelTab:Section({
    Title = "Guest1337",
    Opened = true,
})
 
-- Guest variables
local guestAutoBlockAudioOn = true
local guestAutoPunchOn = true
local guestVerifyFacingCheckOn = true
local guestShowVisionRange = true
local guestHitboxDraggingOn = false 
local guestHitboxDragDuration = 0.3 -- Default duration (short tap)
local guestDetectionRange = 13.5
local guestDetectionRangeSq = guestDetectionRange * guestDetectionRange
local guestVisionRange = 13.5
local guestVisionAngle = 85
local guestAimPunchActive = true
local guestPunchPrediction = 1.6
local guestAimPunchDuration = 0.7
local guestCenterPart, guestLeftPart, guestRightPart, guestLeftToKillerPart, guestRightToKillerPart, guestLeftToCenterPart, guestCenterToRightPart = nil, nil, nil, nil, nil, nil, nil
local guestBlockCooldown = 0.35 -- Block cooldown between blocks
local guestBlockDelay = 0 -- Delay before blocking/dragging (in seconds)
 
-- Sound IDs that trigger auto-block
local guestAutoBlockTriggerSounds = {
    ["102228729296384"] = true, ["140242176732868"] = true, ["112809109188560"] = true, ["136323728355613"] = true,
    ["115026634746636"] = true, ["84116622032112"] = true, ["108907358619313"] = true, ["127793641088496"] = true,
    ["86174610237192"] = true, ["95079963655241"] = true, ["101199185291628"] = true, ["119942598489800"] = true,
    ["84307400688050"] = true, ["113037804008732"] = true, ["105200830849301"] = true, ["75330693422988"] = true,
    ["82221759983649"] = true, ["109348678063422"] = true, ["81702359653578"] = true, ["85853080745515"] = true,
    ["108610718831698"] = true, ["112395455254818"] = true, ["109431876587852"] = true, ["12222216"] = true,
    ["79980897195554"] = true, ["119583605486352"] = true, ["71834552297085"] = true, ["116581754553533"] = true,
    ["86833981571073"] = true, ["110372418055226"] = true, ["105840448036441"] = true, ["86494585504534"] = true,
    ["80516583309685"] = true, ["131406927389838"] = true, ["89004992452376"] = true, ["117231507259853"] = true,
    ["101698569375359"] = true, ["101553872555606"] = true, ["140412278320643"] = true, ["106300477136129"] = true,
    ["117173212095661"] = true, ["104910828105172"] = true, ["140194172008986"] = true, ["85544168523099"] = true,
    ["114506382930939"] = true, ["99829427721752"] = true, ["120059928759346"] = true, ["104625283622511"] = true,
    ["105316545074913"] = true, ["126131675979001"] = true, ["82336352305186"] = true, ["93366464803829"] = true,
    ["84069821282466"] = true, ["128856426573270"] = true, ["121954639447247"] = true, ["128195973631079"] = true,
    ["124903763333174"] = true, ["94317217837143"] = true, ["98111231282218"] = true, ["119089145505438"] = true,
    ["136728245733659"] = true, ["71310583817000"] = true, ["107444859834748"] = true, ["76959687420003"] = true,
    ["72425554233832"] = true, ["96594507550917"] = true, ["139996647355899"] = true, ["107345261604889"] = true,
    ["127557531826290"] = true, ["108651070773439"] = true, ["74842815979546"] = true, ["119583605486352"] = true,
    ["115026634746636"] = true, ["115026634746636"] = true, ["124397369810639"] = true, 
    ["76467993976301"] = true, ["118493324723683"] = true, ["78298577002481"] = true, ["116527305931161"] = true,
    ["5148302439"] = true, ["98675142200448"] = true, ["128367348686124"] = true, ["128367348686124"] = true, 			["71805956520207"] = true, ["125213046326879"] = true,
}
 
-- Punch animations to track for aim punch
local guestTrackedPunchAnimations = {
    ["87259391926321"] = true, ["140703210927645"] = true, ["136007065400978"] = true, ["129843313690921"] = true,
    ["86709774283672"] = true, ["108807732150251"] = true, ["138040001965654"] = true, ["86096387000557"] = true,
    ["81905101227053"] = true, ["108807732150251"] = true, ["127777649118195"] = true, ["99100240941590"] = true,
    ["92831180929659"] = true, ["112081768119093"] = true, ["117587689359268"] = true, ["91830732867282"] = true,
    ["91730605416216"] = true, ["100184164753080"] = true, ["91730605416216"] = true,
}
 
-- Target killer usernames for aim punch
local guestAimTargets = {"Slasher", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli", "Sixer", "Nosferatu"}
 
local guestHumanoid, guestHRP = nil, nil
local guestPunchAiming = false
local guestPunchLastTriggerTime = 0
local guestOriginalWS, guestOriginalJP, guestOriginalAutoRotate = nil, nil, nil
local guestAimConnection = nil
local guestSoundHooks = {}
local guestSoundBlockedUntil = {}
local guestLastBlockTime = 0
local guestAutoPunchDelay = 0.3
local guestSoundBlockDuration = 0.5
local guestRemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
 
-- Get valid killer target (by username)
local function guestGetValidTarget()
    local killersFolder = workspaceService:FindFirstChild("Players") and workspaceService.Players:FindFirstChild("Killers")
    if killersFolder then
        for _, name in ipairs(guestAimTargets) do
            local target = killersFolder:FindFirstChild(name)
            if target and target:FindFirstChild("HumanoidRootPart") then
                 return target.HumanoidRootPart, target:FindFirstChild("Humanoid")
            end
        end
    end
    return nil, nil
end

-- Extract numeric sound ID from SoundId
local function guestExtractNumericSoundId(sound)
    if not sound then return nil end
    local sid = tostring(sound.SoundId)
    local num = sid:match("%d+")
    if num then return num end
    local hash = sid:match("[&%?]hash=([^&]+)")
    if hash then return "&hash="..hash end
    local path = sid:match("rbxasset://sounds/.+")
    if path then return path end
    return nil
end

-- Get world position of a sound
local function guestGetSoundWorldPosition(sound)
    if not sound then return nil end
    if sound.Parent and sound.Parent:IsA("BasePart") then
        return sound.Parent.Position, sound.Parent
    end
    if sound.Parent and sound.Parent:IsA("Attachment") and sound.Parent.Parent and sound.Parent.Parent:IsA("BasePart") then
        return sound.Parent.Parent.Position, sound.Parent.Parent
    end
    local found = sound.Parent and sound.Parent:FindFirstChildWhichIsA("BasePart", true)
    if found then return found.Position, found end
    return nil, nil
end

-- Get character model from any descendant
local function guestGetCharacterFromDescendant(inst)
    if not inst then return nil end
    local model = inst:FindFirstAncestorOfClass("Model")
    if model and model:FindFirstChildOfClass("Humanoid") then
        return model
    end
    return nil
end
 
-- Fire block ability (UPDATED to new remote)
local function guestFireRemoteBlock()
    -- 1) Server: UseActorAbility (Block)
    guestRemoteEvent:FireServer(
        "UseActorAbility",
        {
            [1] = buffer.fromstring("\3\5\0\0\0Block")
         }
    )
end
 
-- Fire punch ability (UNCHANGED)
local function guestFireRemotePunch()
    guestRemoteEvent:FireServer(
        "UseActorAbility",
		{
		    [1] = buffer.fromstring("\3\5\0\0\0Punch")
    	}
	)
end
 
-- [NEW] Perform Hitbox Dragging (Move to Killer)
local function guestPerformHitboxDrag(killerHrp)
    if not guestHitboxDraggingOn or not killerHrp then return end
    
    local myChar = playersService.LocalPlayer.Character
    local myHumanoid = myChar and myChar:FindFirstChild("Humanoid")
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    
    if myHumanoid and myRoot then
        -- Move towards the killer's position to 'drag' the hitbox
        -- Uses default walkspeed (Legit)
        myHumanoid:MoveTo(killerHrp.Position)
        
        -- Stop moving after the duration
        task.delay(guestHitboxDragDuration, function()
            -- Cancel movement by moving to current position
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                 myHumanoid:MoveTo(myChar.HumanoidRootPart.Position)
            end
        end)
    end
end

-- Attempt to block (and optionally punch)
local function guestAttemptBlock(char, hrp)
    if not guestAutoBlockAudioOn then return end
    local t = tick()
    if t < guestLastBlockTime + guestBlockCooldown then return end
 
    local myChar = playersService.LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot or not hrp then return end
 
    -- Apply delay before blocking/dragging
    task.delay(guestBlockDelay, function()
        -- Verify still valid after delay
        local stillValid = myChar and myChar:FindFirstChild("HumanoidRootPart") and hrp.Parent
        if not stillValid then return end
        
        -- [NEW] Trigger Hitbox Dragging BEFORE firing block
        guestPerformHitboxDrag(hrp)

        guestFireRemoteBlock()
        guestLastBlockTime = tick()
 
        if guestAutoPunchOn then
            task.delay(guestAutoPunchDelay, guestFireRemotePunch)
        end
    end)
end
 
-- Create a visual sphere part for vision cone
local function guestCreateVisionPart()
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1)
    part.Shape = Enum.PartType.Ball
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.5
    part.Color = Color3.fromRGB(255, 0, 0)
    part.Parent = workspaceService
    return part
end
 
-- Create a line part for vision cone connections
local function guestCreateConnectionPart()
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.1, 0.1, 1)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.3
    part.Color = Color3.fromRGB(255, 0, 0)
    part.Parent = workspaceService
    return part
end
 
-- Cleanup vision cone parts
local function guestCleanupVisionCone()
    if guestCenterPart then guestCenterPart:Destroy() guestCenterPart = nil end
    if guestLeftPart then guestLeftPart:Destroy() guestLeftPart = nil end
    if guestRightPart then guestRightPart:Destroy() guestRightPart = nil end
    if guestLeftToKillerPart then guestLeftToKillerPart:Destroy() guestLeftToKillerPart = nil end
    if guestRightToKillerPart then guestRightToKillerPart:Destroy() guestRightToKillerPart = nil end
    if guestLeftToCenterPart then guestLeftToCenterPart:Destroy() guestLeftToCenterPart = nil end
    if guestCenterToRightPart then guestCenterToRightPart:Destroy() guestCenterToRightPart = nil end
end
 
-- Update vision cone display
local function guestUpdateVisionCone()
    if not guestShowVisionRange then
        if guestCenterPart then guestCleanupVisionCone() end
        return
    end
 
    local myChar = playersService.LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then
        guestCleanupVisionCone()
        return
    end
 
    local killersFolder = workspaceService:FindFirstChild("Players") and workspaceService.Players:FindFirstChild("Killers")
    if not killersFolder then
        guestCleanupVisionCone()
        return
    end
 
    local killerHRP = nil
    for _, name in ipairs(guestAimTargets) do
        local target = killersFolder:FindFirstChild(name)
        if target and target:FindFirstChild("HumanoidRootPart") then
            killerHRP = target.HumanoidRootPart
            break
        end
    end
 
    if not killerHRP then
        guestCleanupVisionCone()
        return
    end
 
    -- Use KILLER's position and orientation for the vision cone
    local fwd = killerHRP.CFrame.LookVector
    local halfAngleRad = math.rad(guestVisionAngle / 2)
    local right = Vector3.new(-fwd.Z, 0, fwd.X).Unit
    local leftDir = (fwd * math.cos(halfAngleRad) + right * math.sin(halfAngleRad)).Unit
    local rightDir = (fwd * math.cos(halfAngleRad) - right * math.sin(halfAngleRad)).Unit
 
    local centerPos = killerHRP.Position + fwd * guestVisionRange
    local leftPos = killerHRP.Position + leftDir * guestVisionRange
    local rightPos = killerHRP.Position + rightDir * guestVisionRange
 
    if not guestCenterPart then guestCenterPart = guestCreateVisionPart() end
    if not guestLeftPart then guestLeftPart = guestCreateVisionPart() end
    if not guestRightPart then guestRightPart = guestCreateVisionPart() end
 
    guestCenterPart.Position = centerPos
    guestLeftPart.Position = leftPos
    guestRightPart.Position = rightPos
 
    if not guestLeftToKillerPart then guestLeftToKillerPart = guestCreateConnectionPart() end
    if not guestRightToKillerPart then guestRightToKillerPart = guestCreateConnectionPart() end
    if not guestLeftToCenterPart then guestLeftToCenterPart = guestCreateConnectionPart() end
    if not guestCenterToRightPart then guestCenterToRightPart = guestCreateConnectionPart() end
 
    local function updateLine(part, p1, p2)
        local mid = (p1 + p2) / 2
        local dist = (p2 - p1).Magnitude
        part.Size = Vector3.new(0.1, 0.1, dist)
        part.CFrame = CFrame.new(mid, p2)
    end
 
    -- Lines from killer to cone edges
    updateLine(guestLeftToKillerPart, killerHRP.Position, leftPos)
    updateLine(guestRightToKillerPart, killerHRP.Position, rightPos)
    -- Arc connecting the cone edges
    updateLine(guestLeftToCenterPart, leftPos, centerPos)
    updateLine(guestCenterToRightPart, centerPos, rightPos)
end
 
-- Attempt block based on sound trigger
local function guestAttemptBlockForSound(sound, preId)
    if not guestAutoBlockAudioOn then return end
    if not sound or not sound:IsA("Sound") then return end
 
    local id = preId or guestExtractNumericSoundId(sound)
    if not id or not guestAutoBlockTriggerSounds[id] then return end
 
    local t = tick()
    if guestSoundBlockedUntil[sound] and t < guestSoundBlockedUntil[sound] then return end
    if t < guestLastBlockTime + guestBlockCooldown then return end
 
    local myChar = playersService.LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
 
    local _, soundPart = guestGetSoundWorldPosition(sound)
    if not soundPart then return end
 
    local char = guestGetCharacterFromDescendant(soundPart)
    local plr = char and playersService:GetPlayerFromCharacter(char)
    if not plr or plr == playersService.LocalPlayer then return end
 
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
 
    local distSq = (hrp.Position - myRoot.Position).Magnitude^2
    local pingComp = 0.2 * guestDetectionRange
    if distSq > guestDetectionRangeSq + pingComp then return end
 
    if guestVerifyFacingCheckOn then
        local success, result = pcall(function()
            local dirToPlayer = (myRoot.Position - hrp.Position).Unit
            local dot = hrp.CFrame.LookVector:Dot(dirToPlayer)
            local cosAngle = math.cos(math.rad(guestVisionAngle / 2))
            local close = distSq < 25
            return close or dot >= cosAngle
        end)
        if not success or not result then return end
    end
 
    guestAttemptBlock(char, hrp)
    guestSoundBlockedUntil[sound] = t + guestSoundBlockDuration
end
 
-- Sound hook logic
local function guestHookSound(sound)
    if not sound or not sound:IsA("Sound") or guestSoundHooks[sound] then return end
 
    local preId = guestExtractNumericSoundId(sound)
    if not preId then return end
 
    local playedConn = sound.Played:Connect(function()
        if guestAutoBlockAudioOn then
            task.spawn(guestAttemptBlockForSound, sound, preId)
        end
    end)
 
    local propConn = sound:GetPropertyChangedSignal("IsPlaying"):Connect(function()
        if sound.IsPlaying and guestAutoBlockAudioOn then
            task.spawn(guestAttemptBlockForSound, sound, preId)
        end
    end)
 
    local destroyConn
    destroyConn = sound.Destroying:Connect(function()
        pcall(function()
            if playedConn then playedConn:Disconnect() end
            if propConn then propConn:Disconnect() end
            if destroyConn then destroyConn:Disconnect() end
        end)
        guestSoundHooks[sound] = nil
        guestSoundBlockedUntil[sound] = nil
    end)
 
    guestSoundHooks[sound] = {playedConn, propConn, destroyConn, id = preId}
 
    if sound.IsPlaying then
        task.spawn(guestAttemptBlockForSound, sound, preId)
    end
end
 
-- Hook existing sounds in killers
local function guestHookExistingSounds()
    local killersFolder = workspaceService:FindFirstChild("Players") and workspaceService.Players:FindFirstChild("Killers")
    if killersFolder then
        for _, killer in pairs(killersFolder:GetChildren()) do
            for _, desc in pairs(killer:GetDescendants()) do
                if desc:IsA("Sound") then
                    pcall(guestHookSound, desc)
                end
            end
        end
    end
end
 
-- Setup sound monitoring on killers
local function guestSetupSoundHooks()
    local killersFolder = workspaceService:FindFirstChild("Players") and workspaceService.Players:FindFirstChild("Killers")
    if killersFolder then
        guestHookExistingSounds()
        killersFolder.DescendantAdded:Connect(function(desc)
            if desc:IsA("Sound") then
                pcall(guestHookSound, desc)
            end
        end)
    end
end
 
-- Setup local character references
local function guestSetupCharacter(char)
    guestHumanoid = char:FindFirstChild("Humanoid")
    guestHRP = char:FindFirstChild("HumanoidRootPart")
 
    if guestAimConnection then
        guestAimConnection:Disconnect()
        guestAimConnection = nil
    end
 
    local animator = guestHumanoid and guestHumanoid:FindFirstChildOfClass("Animator")
    if animator and guestAimPunchActive then
        guestAimConnection = animator.AnimationPlayed:Connect(function(track)
            local animId = track.Animation.AnimationId:match("%d+")
             if guestAimPunchActive and guestTrackedPunchAnimations[animId] then
                guestPunchLastTriggerTime = tick()
                guestPunchAiming = true
            end
        end)
    end
end
 
-- Initial setup
guestSetupSoundHooks()
 
-- Character respawn handling
playersService.LocalPlayer.CharacterAdded:Connect(function(char)
    task.delay(0.5, function()
        guestCleanupVisionCone()
        guestSetupCharacter(char)
    end)
end)
 
if playersService.LocalPlayer.Character then
    guestSetupCharacter(playersService.LocalPlayer.Character)
end
 
-- Main per-frame loop
runService.RenderStepped:Connect(function()
    if guestAimPunchActive and guestHumanoid and guestHRP and guestPunchAiming then
        local elapsed = tick() - guestPunchLastTriggerTime
        if elapsed > guestAimPunchDuration then
            guestPunchAiming = false
            if guestOriginalWS then
                guestHumanoid.WalkSpeed = guestOriginalWS
                 guestHumanoid.JumpPower = guestOriginalJP
                guestHumanoid.AutoRotate = guestOriginalAutoRotate
                guestOriginalWS, guestOriginalJP, guestOriginalAutoRotate = nil, nil, nil
            end
            return
        end
 
        if not guestOriginalWS then
             guestOriginalWS = guestHumanoid.WalkSpeed
            guestOriginalJP = guestHumanoid.JumpPower
            guestOriginalAutoRotate = guestHumanoid.AutoRotate
        end
 
        guestHumanoid.AutoRotate = false
        guestHRP.AssemblyAngularVelocity = Vector3.zero
 
        local targetHRP = guestGetValidTarget()
        if targetHRP then
            local predictPos = targetHRP.Velocity.Magnitude > 0.5
                and (targetHRP.Position + targetHRP.Velocity * (guestPunchPrediction / 60))
                or targetHRP.Position
 
            local dir = (predictPos - guestHRP.Position).Unit
            local yaw = math.atan2(-dir.X, -dir.Z)
            guestHRP.CFrame = CFrame.new(guestHRP.Position) * CFrame.Angles(0, yaw, 0)
         end
    end
 
    pcall(guestUpdateVisionCone)
end)
 
-- UI Controls (Clean & Minimal)
GuestSection:Toggle({
    Title = "Auto Block",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        guestAutoBlockAudioOn = state
    end
})

GuestSection:Slider({
    Title = "Block Delay",
    Step = 0.05,
    Value = { Min = 0, Max = 2, Default = 0 },
    Callback = function(value)
        guestBlockDelay = value
    end
})
 
GuestSection:Slider({
    Title = "Auto Block Radius",
    Step = 1,
    Value = { Min = 1, Max = 20, Default = 15 },
    Callback = function(value)
         guestDetectionRange = value
        guestDetectionRangeSq = value * value
    end
})
 
GuestSection:Divider()

-- [NEW] Hitbox Dragging Toggle (No Speed Boost)
GuestSection:Toggle({
    Title = "Hitbox Dragging (HDT)",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        guestHitboxDraggingOn = state
    end
})

GuestSection:Slider({
    Title = "Drag Duration",
    Step = 0.05,
    Value = { Min = 0.05, Max = 1, Default = 0.3 },
    Callback = function(value)
        guestHitboxDragDuration = value
    end
})

GuestSection:Toggle({
    Title = "Verify Facing Check",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        guestVerifyFacingCheckOn = state
    end
})
 
GuestSection:Slider({
    Title = "Set Vision Range",
    Step = 1,
    Value = { Min = 1, Max = 20, Default = 15 },
    Callback = function(value)
         guestVisionRange = value
    end
})
 
GuestSection:Slider({
    Title = "Set Vision Angle",
    Step = 1,
    Value = { Min = 1, Max = 200, Default = 90 },
    Callback = function(value)
        guestVisionAngle = value
    end
})
 
GuestSection:Toggle({
    Title = "Show Vision Range",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        guestShowVisionRange = state
        if not state then
            guestCleanupVisionCone()
        end
    end
})
 
GuestSection:Divider()
 
GuestSection:Toggle({
    Title = "Auto Punch",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        guestAutoPunchOn = state
    end
})
 
GuestSection:Toggle({
    Title = "Aim Punch",
    Type = "Checkbox",
    Default = false,
     Callback = function(state)
        guestAimPunchActive = state
        if state and playersService.LocalPlayer.Character then
            guestSetupCharacter(playersService.LocalPlayer.Character)
        end
    end
})
 
GuestSection:Slider({
    Title = "Punch Prediction",
    Step = 1,
    Value = { Min = 0, Max = 10, Default = 4 },
    Callback = function(value)
        guestPunchPrediction = value
    end
})
 
----------------------------------------------------------------
-- Interface Tab
----------------------------------------------------------------
local InterfaceTab = Window:Tab({
    Title = "Interface",
    Icon = "scan",
    Locked = false,
})
 
----------------------------------------------------------------
-- UI Functions Section
----------------------------------------------------------------
local UIFunctionsSection = InterfaceTab:Section({ 
    Title = "UI Functions",
    Opened = true,
})
 
-- Close UI
InterfaceTab:Button({
    Title = "Close UI",
    Locked = false,
    Callback = function()
        Window:Destroy()
    end
})
