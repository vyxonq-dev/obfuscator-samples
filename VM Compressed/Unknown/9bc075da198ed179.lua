loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/.../refs/heads/main/scrirble.txt"))()


-- skibidi
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local PlayerGui = lp:WaitForChild("PlayerGui")
local Humanoid, Animator
local StarterGui  = game:GetService("StarterGui")
local TestService = game:GetService("TestService")
local ChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
local SayMessageRequest = ChatEvents and ChatEvents:FindFirstChild("SayMessageRequest")
local testRemote = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")

local autoBlockTriggerSounds = {
    ["102228729296384"] = true,
    ["140242176732868"] = true,
    ["112809109188560"] = true,
    ["136323728355613"] = true,
    ["115026634746636"] = true,
    ["84116622032112"] = true,
    ["108907358619313"] = true,
    ["127793641088496"] = true,
    ["86174610237192"] = true,
    ["95079963655241"] = true,
    ["101199185291628"] = true,
    ["119942598489800"] = true,
    ["84307400688050"] = true,
    ["113037804008732"] = true,
    ["105200830849301"] = true,
    ["75330693422988"] = true,
    ["82221759983649"] = true,
    ["81702359653578"] = true,
    ["108610718831698"] = true,
    ["112395455254818"] = true,
    ["109431876587852"] = true,
    ["109348678063422"] = true,
    ["85853080745515"] = true,
    ["12222216"] = true,
    ["105840448036441"] = true,
    ["114742322778642"] = true,
    ["119583605486352"] = true,
    ["79980897195554"] = true,
    ["71805956520207"] = true,
    ["79391273191671"] = true,
    ["89004992452376"] = true,
    ["101553872555606"] = true,
    ["101698569375359"] = true,
    ["106300477136129"] = true,
    ["116581754553533"] = true,
    ["117231507259853"] = true,
    ["119089145505438"] = true,
    ["121954639447247"] = true,
    ["125213046326879"] = true,
    ["131406927389838"] = true,
    ["71834552297085"] = true, -- Guest666 leap ability thingy
    ["805165833096"] = true,
}

-- Prevent repeated aim triggers for the same animation track
local lastAimTrigger = {}   -- keys = AnimationTrack, value = timestamp when we triggered
local AIM_WINDOW = 0.5      -- how long to aim (seconds)
local AIM_COOLDOWN = 0.6    -- don't retrigger within this many seconds

-- add once, outside the RenderStepped loop
local _lastPunchMessageTime = _lastPunchMessageTime or 0
local MESSAGE_PUNCH_COOLDOWN = 0.6 -- overall throttle (seconds)
local _punchPrevPlaying = _punchPrevPlaying or {} -- persist between frames

local _lastBlockMessageTime = _lastBlockMessageTime or 0
local MESSAGE_BLOCK_COOLDOWN = 0.6 -- overall throttle (seconds)
local _blockPrevPlaying = _blockPrevPlaying or {} -- persist between frames


local autoBlockTriggerAnims = {
    "126830014841198", "126355327951215", "121086746534252", "18885909645",
    "98456918873918", "105458270463374", "83829782357897", "125403313786645",
    "118298475669935", "82113744478546", "70371667919898", "99135633258223",
    "97167027849946", "109230267448394", "139835501033932", "126896426760253",
    "109667959938617", "126681776859538", "129976080405072", "121293883585738",
    "81639435858902", "137314737492715",
    "92173139187970", "122709416391", "879895330952"
}

-- State Variables
local autoBlockOn = false
local autoBlockAudioOn = false

local doubleblocktech = false
local blockdelay = 0
local looseFacing = true
local detectionRange = 18
local messageWhenAutoBlockOn = false
local messageWhenAutoBlock = ""
-- local fasterAudioAB = false (this is scrapped. im too lazy to remove it)
local Debris = game:GetService("Debris")
-- Anti-flick toggle state
local antiFlickOn = false
-- how many anti-flick parts to spawn (default 4)
local antiFlickParts = 4

-- optional: base distance in front of killer for the first part
local antiFlickBaseOffset = 2.7

-- optional: distance step between successive parts
local antiFlickOffsetStep = 0

local antiFlickDelay = 0 -- seconds to wait before parts spawn (default 0 = instant)
local PRED_SECONDS_FORWARD = 0.25   -- seconds ahead for linear prediction
local PRED_SECONDS_LATERAL  = 0.18  -- seconds ahead for lateral prediction
local PRED_MAX_FORWARD      = 6     -- clamp (studs)
local PRED_MAX_LATERAL      = 4     -- clamp (studs)
local ANG_TURN_MULTIPLIER   = 0.6   -- how much angular velocity contributes to lateral offset
local SMOOTHING_LERP        = 0.22  -- smoothing for sampled velocity/angular vel
local stagger  = 0.02

local killerState = {} -- [model] = { prevPos, prevLook, vel(Vector3), angVel(number) }

-- prediction multiplier: 1.0 is normal, up to 10.0
-- prediction multipliers
local predictionStrength = 1        -- forward/lateral (1x .. 10x)
local predictionTurnStrength = 1    -- turning strength (1x .. 10x)
-- multiplier for blue block parts size (1.0 = default)
local blockPartsSizeMultiplier = 1

local autoAdjustDBTFBPS = false
local _savedManualAntiFlickDelay = antiFlickDelay or 0 -- keep user's manual value when toggle is turned off

-- map of killer name (lowercase) -> antiFlickDelay value you requested
local killerDelayMap = {
    ["c00lkidd"] = 0,
    ["jason"]    = 0.013,
    ["slasher"]  = 0.01,
    ["1x1x1x1"]  = 0.15,
    ["johndoe"]  = 0.33,
    ["noli"]     = 0.15,
}

local predictiveBlockOn = false
local edgeKillerDelay = 3
local killerInRangeSince = nil
local predictiveCooldown = 0
-- auto punch
local predictionValue = 4

local hitboxDraggingTech = false
local _hitboxDraggingDebounce = false
local HITBOX_DRAG_DURATION = 1.4
local HITBOX_DETECT_RADIUS = 6
local Dspeed = 5.6 -- you can tweak these numbers
local Ddelay = 0

local killerNames = {"c00lkidd", "Jason", "JohnDoe", "1x1x1x1", "Noli", "Slasher", "Sixer"}
local autoPunchOn = false
local messageWhenAutoPunchOn = false
local messageWhenAutoPunch = ""
local flingPunchOn = false
local flingPower = 10000
local hiddenfling = false
local aimPunch = false

local customBlockEnabled = false
local customBlockAnimId = ""
local customblockdelay = 2
local customPunchEnabled = false
local customPunchAnimId = ""
local custompunchdelay = 2.7

local espEnabled = false
local KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")

local lastBlockTime = 0
local lastPunchTime = 0


local blockAnimIds = {
"72722244508749",
"96959123077498",
"95802026624883"
}
local punchAnimIds = {
"87259391926321",
"140703210927645",
"136007065400978",
"136007065400978",
"129843313690921",
"129843313690921",
"86709774283672",
"87259391926321",
"129843313690921",
"129843313690921",
"108807732150251",
"138040001965654",
"86096387000557",
"86096387000557"
}

local chargeAnimIds = {
    "106014898538300"
}

local customChargeEnabled = false
local customChargeAnimId = ""
local chargeAnimIds = { "106014898528300" }


local cachedAnimator = nil
local function refreshAnimator()
    local char = lp.Character
    if not char then
        cachedAnimator = nil
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        local anim = hum:FindFirstChildOfClass("Animator")
        cachedAnimator = anim or nil
    else
        cachedAnimator = nil
    end
end

lp.CharacterAdded:Connect(function(char)
    task.wait(0.5) -- allow Humanoid/Animator to be created
    refreshAnimator()
end)

-- ===== performance improvements for Sound Auto Block =====
-- cached UI / refs
local cachedPlayerGui = PlayerGui
local cachedPunchBtn, cachedBlockBtn, cachedCharges, cachedCooldown, cachedChargeBtn, cachedCloneBtn = nil, nil, nil, nil, nil, nil
local detectionRangeSq = detectionRange * detectionRange

local function refreshUIRefs()
    -- ensure we have the most up-to-date references for MainUI and ability buttons
    cachedPlayerGui = lp:FindFirstChild("PlayerGui") or PlayerGui
    local main = cachedPlayerGui and cachedPlayerGui:FindFirstChild("MainUI")
    if main then
        local ability = main:FindFirstChild("AbilityContainer")
        cachedPunchBtn = ability and ability:FindFirstChild("Punch")
        cachedBlockBtn = ability and ability:FindFirstChild("Block")
        cachedChargeBtn = ability and ability:FindFirstChild("Charge")
        cachedCloneBtn = ability and ability:FindFirstChild("Clone")
        cachedCharges = cachedPunchBtn and cachedPunchBtn:FindFirstChild("Charges")
        cachedCooldown = cachedBlockBtn and cachedBlockBtn:FindFirstChild("CooldownTime")
    else
        cachedPunchBtn, cachedBlockBtn, cachedCharges, cachedCooldown, cachedChargeBtn, cachedCloneBtn = nil, nil, nil, nil, nil, nil
    end
end

-- call once at startup
refreshUIRefs()

-- refresh on GUI or character changes (keeps caches fresh)
if cachedPlayerGui then
    cachedPlayerGui.ChildAdded:Connect(function(child)
        if child.Name == "MainUI" then
            task.delay(0.02, refreshUIRefs)
        end
    end)
end

local facingCheckEnabled = true
local customFacingDot = -0.3

-- Optimized facing check
local function isFacing(localRoot, targetRoot)
    -- fast global reads
    local enabled = facingCheckEnabled
    if not enabled then return true end

    local loose = looseFacing

    -- difference vector (one allocation, unavoidable)
    local dx = localRoot.Position.X - targetRoot.Position.X
    local dy = localRoot.Position.Y - targetRoot.Position.Y
    local dz = localRoot.Position.Z - targetRoot.Position.Z

    -- magnitude (sqrt) once; handle zero-distance safely
    local mag = math.sqrt(dx*dx + dy*dy + dz*dz)
    if mag == 0 then
        -- if positions coincide treat as "facing" (matches permissive behavior)
        return true
    end
    local invMag = 1 / mag

    -- unit direction components (no new Vector3 allocation)
    local ux, uy, uz = dx * invMag, dy * invMag, dz * invMag

    -- cache look vector components
    local lv = targetRoot.CFrame.LookVector
    local lx, ly, lz = lv.X, lv.Y, lv.Z

    -- dot product (fast scalar math)
    local dot = lx * ux + ly * uy + lz * uz

    -- same logic as original, but explicit for clarity/branch prediction
    return dot > (customFacingDot or -0.3)
end

-- ===== Facing Check Visual (fixed) =====
local facingVisualOn = false
local facingVisuals = {} -- [killer] = visual

local function updateFacingVisual(killer, visual)
    if not (killer and visual and visual.Parent) then return end
    local hrp = killer:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- calculate angle from DOT threshold (safe-clamp)
    local dot = math.clamp(customFacingDot or -0.3, -1, 1)
    local angle = math.acos(dot)              -- radians, 0..pi
    local frac = angle / math.pi              -- 0..1 (0 = very narrow cone, 1 = very wide)

    -- scale radius between a small fraction and full detectionRange
    local minFrac = 0.20                      -- tune: smallest disc is 20% of detectionRange
    local radius = math.max(1, detectionRange * (minFrac + (1 - minFrac) * frac))
    visual.Radius = radius
    visual.Height = 0.12

    -- place the disc in front of the killer; move slightly less forward for narrow cones
    local forwardDist = detectionRange * (0.35 + 0.15 * frac) -- tune if you like
    local yOffset = -(hrp.Size.Y / 2 + 0.05)
    visual.CFrame = CFrame.new(0, yOffset, -forwardDist) * CFrame.Angles(math.rad(90), 0, 0)

    -- determine local player's HRP and whether they are inside range & facing
    local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    local inRange = false
    local facingOkay = false

    if myRoot and hrp then
        local dist = (hrp.Position - myRoot.Position).Magnitude
        inRange = dist <= detectionRange
        facingOkay = (not facingCheckEnabled) or (type(isFacing) == "function" and isFacing(myRoot, hrp))
    end

    -- color / transparency
    if inRange and facingOkay then
        visual.Color3 = Color3.fromRGB(0, 255, 0)
        visual.Transparency = 0.40
    else
        visual.Color3 = Color3.fromRGB(255, 255, 0) -- show yellow when not both conditions
        visual.Transparency = 0.85
    end
end

local function addFacingVisual(killer)
    if not killer or not killer:IsA("Model") then return end
    if facingVisuals[killer] then return end
    local hrp = killer:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local visual = Instance.new("CylinderHandleAdornment")
    visual.Name = "FacingCheckVisual"
    visual.Adornee = hrp
    visual.AlwaysOnTop = true
    visual.ZIndex = 2
    visual.Transparency = 0.55
    visual.Color3 = Color3.fromRGB(0, 255, 0) -- green

    visual.Parent = hrp
    facingVisuals[killer] = visual

    -- initialize placement immediately
    updateFacingVisual(killer, visual)
end

local function removeFacingVisual(killer)
    local v = facingVisuals[killer]
    if v then
        v:Destroy()
        facingVisuals[killer] = nil
    end
end

local function refreshFacingVisuals()
    for _, k in ipairs(KillersFolder:GetChildren()) do
        if facingVisualOn then
            -- make sure HRP exists before creating
            local hrp = k:FindFirstChild("HumanoidRootPart") or k:WaitForChild("HumanoidRootPart", 5)
            if hrp then addFacingVisual(k) end
        else
            removeFacingVisual(k)
        end
    end
end

-- keep visuals in sync every frame (ensures size/mode changes apply immediately)
RunService.RenderStepped:Connect(function()
    for killer, visual in pairs(facingVisuals) do
        -- if the killer was removed/died, clean up
        if not killer.Parent or not killer:FindFirstChild("HumanoidRootPart") then
            removeFacingVisual(killer)
        else
            updateFacingVisual(killer, visual)
        end
    end
end)

-- Keep visuals for newly added/removed killers
KillersFolder.ChildAdded:Connect(function(killer)
    if facingVisualOn then
        task.spawn(function()
            local hrp = killer:WaitForChild("HumanoidRootPart", 5)
            if hrp then addFacingVisual(killer) end
        end)
    end
end)
KillersFolder.ChildRemoved:Connect(function(killer) removeFacingVisual(killer) end)

-- ===== Facing Check Visual (paste after detectionCircles / addKillerCircle) =====
local detectionCircles = {} -- store all killer circles
local killerCirclesVisible = false

-- Function to add circle to a killer
-- replace your addKillerCircle with this
local function addKillerCircle(killer)
    if not killer:FindFirstChild("HumanoidRootPart") then return end
    if detectionCircles[killer] then return end

    local hrp = killer.HumanoidRootPart
    local circle = Instance.new("CylinderHandleAdornment")
    circle.Name = "KillerDetectionCircle"
    circle.Adornee = hrp
    circle.Color3 = Color3.fromRGB(255, 0, 0)
    circle.AlwaysOnTop = true
    circle.ZIndex = 1
    circle.Transparency = 0.6
    circle.Radius = detectionRange            -- <- use detectionRange exactly
    circle.Height = 0.12                      -- thin disc
    -- place the disc at the feet of the HumanoidRootPart (CFrame is relative to Adornee)
    local yOffset = -(hrp.Size.Y / 2 + 0.05)  -- a little below HRP origin
    circle.CFrame = CFrame.new(0, yOffset, 0) * CFrame.Angles(math.rad(90), 0, 0)
    circle.Parent = hrp

    detectionCircles[killer] = circle
end

-- Update radius when detectionRange changes (and on render)


-- Function to remove circle from a killer
local function removeKillerCircle(killer)
    if detectionCircles[killer] then
        detectionCircles[killer]:Destroy()
        detectionCircles[killer] = nil
    end
end

-- Refresh all circles
local function refreshKillerCircles()
    for _, killer in ipairs(KillersFolder:GetChildren()) do
        if killerCirclesVisible then
            addKillerCircle(killer)
        else
            removeKillerCircle(killer)
        end
    end
end

-- Keep radius updated
RunService.RenderStepped:Connect(function()
    for killer, circle in pairs(detectionCircles) do
        if circle and circle.Parent then
            circle.Radius = detectionRange
        end
    end
end)

-- Hook into killers being added/removed
KillersFolder.ChildAdded:Connect(function(killer)
    if killerCirclesVisible then
        task.spawn(function()
            -- Wait until HRP exists (max 5s timeout)
            local hrp = killer:WaitForChild("HumanoidRootPart", 5)
            if hrp then
                addKillerCircle(killer)
            end
        end)
    end
end)

KillersFolder.ChildRemoved:Connect(function(killer)
    removeKillerCircle(killer)
end)


local autoblocktype = "Block"

local StarterGui = game:GetService("StarterGui")

-- simple notification
local function SendNotif(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title or "Hello",
        Text = text or "hi",
        Duration = duration or 4 -- seconds
    })
end

lp.CharacterAdded:Connect(function()
    task.delay(0.5, refreshUIRefs)
end)

local function getNearestKillerModel()
    local myChar = lp.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local closest, closestDist = nil, math.huge
    for _, k in ipairs(KillersFolder:GetChildren()) do
        if k and k:IsA("Model") then
            local hrp = k:FindFirstChild("HumanoidRootPart")
            if hrp then
                local d = (hrp.Position - myRoot.Position).Magnitude
                if d < closestDist then
                    closest, closestDist = k, d
                end
            end
        end
    end
    return closest
end

local function applyDelayForKillerModel(killerModel)
    if not killerModel then
        -- no killer found -> restore manual value
        if antiFlickDelay ~= _savedManualAntiFlickDelay then
            antiFlickDelay = _savedManualAntiFlickDelay
            print(("Auto-DBTFBPS: no killer -> restore antiFlickDelay = %s"):format(tostring(antiFlickDelay)))
        end
        return
    end

    local key = (tostring(killerModel.Name) or ""):lower()
    local mapped = killerDelayMap[key]

    if mapped ~= nil then
        if antiFlickDelay ~= mapped then
            antiFlickDelay = mapped
            print(("Auto-DBTFBPS: matched killer '%s' -> antiFlickDelay = %s"):format(killerModel.Name, tostring(mapped)))
        end
    else
        -- killer not in mapping: restore manual value (avoid surprising changes)
        if antiFlickDelay ~= _savedManualAntiFlickDelay then
            antiFlickDelay = _savedManualAntiFlickDelay
            print(("Auto-DBTFBPS: killer '%s' not mapped -> restore antiFlickDelay = %s"):format(killerModel.Name, tostring(_savedManualAntiFlickDelay)))
        end
    end
end

-- small throttled heartbeat loop (runs only when toggle enabled)
local adjustTicker = 0
RunService.Heartbeat:Connect(function(dt)
    if not autoAdjustDBTFBPS then return end
    adjustTicker = adjustTicker + dt
    if adjustTicker < 0.15 then return end -- check ~every 0.15s
    adjustTicker = 0

    local nearest = getNearestKillerModel()
    applyDelayForKillerModel(nearest)
end)

-- immediate update helper when killers spawn/leave or user toggles
local function doImmediateUpdate()
    if not autoAdjustDBTFBPS then return end
    local nearest = getNearestKillerModel()
    applyDelayForKillerModel(nearest)
end

-- respond quickly when killers are added/removed (so toggle reacts immediately)
KillersFolder.ChildAdded:Connect(function() task.delay(0.05, doImmediateUpdate) end)
KillersFolder.ChildRemoved:Connect(function() task.delay(0.05, doImmediateUpdate) end)

local detectorChargeIds = (type(chargeAnimIds) == "table" and chargeAnimIds) or {}

-- Optional: detect a custom charge anim id (if you already use these vars elsewhere)
-- set customChargeEnabled = true and customChargeAnimId = "123456" elsewhere in your script to detect custom anim too
-- local customChargeEnabled = false
-- local customChargeAnimId = ""

-- Override speed (same as your noli script)
local ORIGINAL_DASH_SPEED = 60

-- Toggle / runtime state
local controlChargeEnabled = false
local controlChargeActive = false
local overrideConnection = nil

-- Save/restore for humanoid original values
local savedHumanoidState = {}

local function getHumanoid()
    if not lp or not lp.Character then return nil end
    return lp.Character:FindFirstChildOfClass("Humanoid")
end

local function saveHumState(hum)
    if not hum then return end
    if savedHumanoidState[hum] then return end
    local s = {}
    pcall(function()
        s.WalkSpeed = hum.WalkSpeed
        -- support either JumpPower or JumpHeight
        local ok, _ = pcall(function() s.JumpPower = hum.JumpPower end)
        if not ok then
            pcall(function() s.JumpPower = hum.JumpHeight end)
        end
        -- AutoRotate might not exist on all Humanoids; try to capture if possible
        local ok2, ar = pcall(function() return hum.AutoRotate end)
        if ok2 then s.AutoRotate = ar end
        s.PlatformStand = hum.PlatformStand
    end)
    savedHumanoidState[hum] = s
end

local function restoreHumState(hum)
    if not hum then return end
    local s = savedHumanoidState[hum]
    if not s then return end
    pcall(function()
        if s.WalkSpeed ~= nil then hum.WalkSpeed = s.WalkSpeed end
        if s.JumpPower ~= nil then
            local ok, _ = pcall(function() hum.JumpPower = s.JumpPower end)
            if not ok then pcall(function() hum.JumpHeight = s.JumpPower end) end
        end
        if s.AutoRotate ~= nil then pcall(function() hum.AutoRotate = s.AutoRotate end) end
        if s.PlatformStand ~= nil then hum.PlatformStand = s.PlatformStand end
    end)
    savedHumanoidState[hum] = nil
end

-- Start the override (forces dash movement similar to noli void rush)
local function startOverride()
    if controlChargeActive then return end
    local hum = getHumanoid()
    if not hum then return end

    controlChargeActive = true
    saveHumState(hum)

    -- Make sure humanoid is set to dash state
    pcall(function()
        hum.WalkSpeed = ORIGINAL_DASH_SPEED
        hum.AutoRotate = false
    end)

    -- RenderStepped connection to force forward movement every frame (like your noli function)
    overrideConnection = RunService.RenderStepped:Connect(function()
        local humanoid = getHumanoid()
        local rootPart = humanoid and humanoid.Parent and humanoid.Parent:FindFirstChild("HumanoidRootPart")
        if not humanoid or not rootPart then return end

        -- ensure speed + autorotate each frame (helps if some other code fights it)
        pcall(function()
            humanoid.WalkSpeed = ORIGINAL_DASH_SPEED
            humanoid.AutoRotate = false
        end)

        local direction = rootPart.CFrame.LookVector
        local horizontal = Vector3.new(direction.X, 0, direction.Z)
        if horizontal.Magnitude > 0 then
            humanoid:Move(horizontal.Unit)
        else
            humanoid:Move(Vector3.new(0,0,0))
        end
    end)
end

-- Stop the override and restore humanoid state
local function stopOverride()
    if not controlChargeActive then return end
    controlChargeActive = false

    -- disconnect override loop
    if overrideConnection then
        pcall(function() overrideConnection:Disconnect() end)
        overrideConnection = nil
    end

    -- restore humanoid fields
    local hum = getHumanoid()
    if hum then
        pcall(function()
            -- restore saved values if present
            restoreHumState(hum)
            -- ensure we stop movement
            humanoid:Move(Vector3.new(0,0,0))
        end)
    end
end

-- Internal detection: look for playing anim tracks that match charge IDs or custom ID
local function detectChargeAnimation()
    local hum = getHumanoid()
    if not hum then return false end
    for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
        local ok, animId = pcall(function()
            return tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+")
        end)
        if ok and animId and animId ~= "" then
            if detectorChargeIds and table.find(detectorChargeIds, animId) then
                return true
            end
            if (type(customChargeEnabled) == "boolean" and customChargeEnabled) and customChargeAnimId and tostring(customChargeAnimId) ~= "" then
                if tostring(animId) == tostring(customChargeAnimId) then
                    return true
                end
            end
        end
    end
    return false
end

-- Public toggle control
local function ControlCharge_SetEnabled(val)
    controlChargeEnabled = val and true or false
    if not controlChargeEnabled and controlChargeActive then
        stopOverride()
    end
end

-- Main loop: check detection each RenderStepped (uses same cadence as noli script)
RunService.RenderStepped:Connect(function()
    if not controlChargeEnabled then
        if controlChargeActive then stopOverride() end
        return
    end

    -- If humanoid dies or character resets, ensure override cleared
    local hum = getHumanoid()
    if not hum then
        if controlChargeActive then stopOverride() end
        return
    end

    local isCharging = detectChargeAnimation()

    if isCharging then
        if not controlChargeActive then
            startOverride()
        end
    else
        if controlChargeActive then
            stopOverride()
        end
    end
end)

-- Keep humanoid state fresh on CharacterAdded
lp.CharacterAdded:Connect(function(char)
    -- small wait to let Humanoid exist
    task.spawn(function()
        local hum = char:WaitForChild("Humanoid", 2)
        if hum then
            -- optionally prime saved state (not necessary)
        end
    end)
end)

-- Expose toggle function globally for other script parts or for hotkeys
_G.ControlCharge_SetEnabled = ControlCharge_SetEnabled

-- Example usage:
-- _G.ControlCharge_SetEnabled(true)  -- enable detection/override
-- _G.ControlCharge_SetEnabled(false) -- disable
-- =======================================================================

-- Rayfield GUI for Control Charge (paste near your other CustomAnimationsTab UI code)
-- Requires CustomAnimationsTab from your Rayfield Window (already present in your big script)

-- initialize global defaults so the control block can read them
_G.ControlCharge_DashSpeed = _G.ControlCharge_DashSpeed or 60
_G.ControlCharge_CustomEnabled = _G.ControlCharge_CustomEnabled or false
_G.ControlCharge_CustomAnimId = _G.ControlCharge_CustomAnimId or ""

local function addESP(obj)
    if not obj:IsA("Model") then return end
    if not obj:FindFirstChild("HumanoidRootPart") then return end

    local plr = Players:GetPlayerFromCharacter(obj)
    if not plr then return end -- ✅ only add ESP if it's a player character

    -- Prevent duplicates
    if obj:FindFirstChild("ESP_Highlight") then return end

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = obj
    highlight.Parent = obj

    -- Billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Billboard"
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.Adornee = obj:FindFirstChild("HumanoidRootPart")
    billboard.Parent = obj

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "ESP_Text"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Text = obj.Name
    textLabel.Parent = billboard
end

-- Function to clear ESP
local function clearESP(obj)
    if obj:FindFirstChild("ESP_Highlight") then
        obj.ESP_Highlight:Destroy()
    end
    if obj:FindFirstChild("ESP_Billboard") then
        obj.ESP_Billboard:Destroy()
    end
end

-- Function to refresh all ESP
local function refreshESP()
    if not espEnabled then
        for _, killer in pairs(KillersFolder:GetChildren()) do
            clearESP(killer)
        end
        return
    end

    for _, killer in pairs(KillersFolder:GetChildren()) do
        addESP(killer)
    end
end


-- Modify ChildAdded connection:
KillersFolder.ChildAdded:Connect(function(child)
    if espEnabled then
        task.wait(0.1) -- wait for HRP
        addESP(child)
    end
end)


KillersFolder.ChildRemoved:Connect(function(child)
    clearESP(child)
end)

-- Distance updater
RunService.RenderStepped:Connect(function()
    if not espEnabled then return end
    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, killer in pairs(KillersFolder:GetChildren()) do
        local billboard = killer:FindFirstChild("ESP_Billboard")
        if billboard and billboard:FindFirstChild("ESP_Text") and killer:FindFirstChild("HumanoidRootPart") then
            local dist = (killer.HumanoidRootPart.Position - hrp.Position).Magnitude
            billboard.ESP_Text.Text = string.format("%s\n[%d]", killer.Name, dist)
        end
    end
end)

local _LP = Players.LocalPlayer
local _isFacing = isFacing
local _fireRemoteBlock = fireRemoteBlock
local _fireRemotePunch = fireRemotePunch
local _cachedBlockBtn = cachedBlockBtn
local _cachedCooldown = cachedCooldown            -- these may be updated by refreshUIRefs
local _cachedCharges = cachedCharges
local LOCAL_BLOCK_COOLDOWN = 0.7   -- optimistic local cooldown (tune as needed)
local lastLocalBlockTime = 0

-- Helpers
local function fireRemoteBlock()
local args = {"UseActorAbility", "Block"}
ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function fireRemotePunch()
local args = {"UseActorAbility", "Punch"}
ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end



-- replace existing playCustomAnim with this
local function playCustomAnim(animId, isPunch)
    if not Humanoid then
        warn("Humanoid missing")
        return
    end

    if not animId or animId == "" then
        warn("No animation ID provided")
        return
    end

    local now = tick()
    local lastTime = isPunch and lastPunchTime or lastBlockTime
    if now - lastTime < 1 then
        return
    end

    -- Stop other known anims (unchanged)
    for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
        local animNum = tostring(track.Animation and track.Animation.AnimationId):match("%d+")
        if table.find(isPunch and punchAnimIds or blockAnimIds, animNum) then
            pcall(function() track:Stop() end)
        end
    end

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. animId

    local success, track = pcall(function()
        return Humanoid:LoadAnimation(anim)
    end)

    if success and track then
        print("✅ Playing custom " .. (isPunch and "punch" or "block") .. " animation:", animId)
        track:Play()

        -- record last-play time (keeps original behavior)
        if isPunch then
            lastPunchTime = now
        else
            lastBlockTime = now
        end

        -- stop the custom track automatically after X seconds
        local duration = isPunch and 2.7 or 2.0
        -- use task.delay so we don't block; use pcall to avoid runtime errors
        task.delay(duration, function()
            pcall(function()
                if track and track.IsPlaying then
                    track:Stop()
                end
            end)
        end)
    else
        warn("❌ Failed to load or play custom animation: " .. tostring(animId))
    end
end
-- Push *into* the killer (drops in for doLegitBlockTP_withVelocity)



-- Fling coroutine
coroutine.wrap(function()
    local hrp, c, vel, movel = nil, nil, nil, 0.1
    while true do
        RunService.Heartbeat:Wait()
        if hiddenfling then
            while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                RunService.Heartbeat:Wait()
                c = lp.Character
                hrp = c and c:FindFirstChild("HumanoidRootPart")
            end
            if hiddenfling then
                vel = hrp.Velocity
                hrp.Velocity = vel * flingPower + Vector3.new(0, flingPower, 0)
                RunService.RenderStepped:Wait()
                hrp.Velocity = vel
                RunService.Stepped:Wait()
                hrp.Velocity = vel + Vector3.new(0, movel, 0)
                movel = movel * -1
            end
        end
    end
end)()

local function sendChatMessage(text)
    if not text or text:match("^%s*$") then return end
    local TextChatService = game:GetService("TextChatService")
    local channel = TextChatService.TextChannels.RBXGeneral

    channel:SendAsync(text)
end

-- ===== Robust Sound Auto Block (replace your current Sound Auto Block) =====
local soundHooks = {}     -- [Sound] = {playedConn, propConn, destroyConn}
local soundBlockedUntil = {} -- [Sound] = timestamp when we can block again (throttle)

local function getNearestKillerRoot(maxDist)
    local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
    if not killersFolder then return nil end

    local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local closest, closestDist = nil, maxDist or math.huge
    for _, killer in ipairs(killersFolder:GetChildren()) do
        local hrp = killer:FindFirstChild("HumanoidRootPart")
        if hrp then
            local dist = (hrp.Position - myRoot.Position).Magnitude
            if dist < closestDist then
                closest, closestDist = hrp, dist
            end
        end
    end
    return closest
end

-- place once in outer scope if this runs in a hot loop
local string_match = string.match
local tostring_local = tostring

local function extractNumericSoundId(sound)
    if not sound then return nil end

    local sid = sound.SoundId
    if not sid then return nil end
    sid = (type(sid) == "string") and sid or tostring_local(sid)

    -- Prefer explicit "rbxassetid://" pattern (most common), then generic "://digits", then plain digits
    local num =
        string_match(sid, "rbxassetid://(%d+)") or
        string_match(sid, "://(%d+)") or
        string_match(sid, "^(%d+)$")

    if num and #num > 0 then
        return num
    end

    -- Fallbacks (kept for completeness)
    local hash = string_match(sid, "[&%?]hash=([^&]+)")
    if hash then
        return "&hash=" .. hash
    end

    local path = string_match(sid, "rbxasset://sounds/.+")
    if path then
        return path
    end

    return nil
end

-- cache KillersFolder outside the function when possible:
local KF = KillersFolder

local function getSoundWorldPosition(sound)
    if not sound then return nil end

    local parent = sound.Parent
    if parent then
        if parent:IsA("BasePart") then
            return parent.Position, parent
        end

        if parent:IsA("Attachment") then
            local gp = parent.Parent
            if gp and gp:IsA("BasePart") then
                return gp.Position, gp
            end
        end
    end

    -- Only perform deep descendant search if the sound is inside KillersFolder
    if KF and sound:IsDescendantOf(KF) then
        -- search descendants of the nearest meaningful root (prefer parent if present)
        local root = parent or sound
        local found = root:FindFirstChildWhichIsA("BasePart", true)
        if found then
            return found.Position, found
        end
    end

    return nil, nil
end

local function getCharacterFromDescendant(inst)
    if not inst then return nil end
    local model = inst:FindFirstAncestorOfClass("Model")
    if model and model:FindFirstChildOfClass("Humanoid") then
        return model
    end
    return nil
end

local function isPointInsidePart(part, point)
    if not (part and point) then return false end
    -- convert world point to part-local coordinates and test against half-extents
    local rel = part.CFrame:PointToObjectSpace(point)
    local half = part.Size * 0.5
    return math.abs(rel.X) <= half.X + 0.001 and
           math.abs(rel.Y) <= half.Y + 0.001 and
           math.abs(rel.Z) <= half.Z + 0.001
end

-- ===== predictive helpers (paste near top, before attemptBlockForSound) =====

-- keep killerState updated each frame (lightweight)
RunService.RenderStepped:Connect(function(dt)
    if dt <= 0 then return end
    local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
    if not killersFolder then return end

    for _, killer in ipairs(killersFolder:GetChildren()) do
        if killer and killer.Parent then
            local hrp = killer:FindFirstChild("HumanoidRootPart")
            if hrp then
                local st = killerState[killer] or { prevPos = hrp.Position, prevLook = hrp.CFrame.LookVector, vel = Vector3.new(), angVel = 0 }
                -- linear velocity sample & smoothing
                local newVel = (hrp.Position - st.prevPos) / math.max(dt, 1e-6)
                st.vel = st.vel and st.vel:Lerp(newVel, SMOOTHING_LERP) or newVel

                -- angular velocity (radians/sec, signed by left/right)
                local prevLook = st.prevLook or hrp.CFrame.LookVector
                local look = hrp.CFrame.LookVector
                local dot = math.clamp(prevLook:Dot(look), -1, 1)
                local angle = math.acos(dot) -- 0..pi
                local crossY = prevLook:Cross(look).Y
                local angSign = (crossY >= 0) and 1 or -1
                local newAngVel = (angle / math.max(dt, 1e-6)) * angSign
                st.angVel = (st.angVel * (1 - SMOOTHING_LERP)) + (newAngVel * SMOOTHING_LERP)

                st.prevPos = hrp.Position
                st.prevLook = look
                killerState[killer] = st
            end
        end
    end
end)

local function fireGuiBlock()
    local blockAction = "UseActorAbility"
    local blockData = {buffer.fromstring("\"Block\"")}
    
    testRemote:FireServer(blockAction, blockData)
end

local function fireGuiPunch()
    local punchAction = "UseActorAbility"
    local punchData = {buffer.fromstring("\"Punch\"")}
    
    testRemote:FireServer(punchAction, punchData)
end

local function fireGuiCharge()
    local blockAction = "UseActorAbility"
    local blockData = {buffer.fromstring("\"Charge\"")}
    
    testRemote:FireServer(blockAction, blockData)
end

local function fireGuiClone()
    local blockAction = "UseActorAbility"
    local blockData = {buffer.fromstring("\"Clone\"")}

    testRemote:FireServer(blockAction, blockData)
end

local chargeAimActive = false
local chargeAimThread = nil

local function stopChargeAim()
    chargeAimActive = false
    -- thread will exit when it notices the flag; we don't force-kill it
end

-- Start aiming at nearest killer until the charge animation stops (or fallback timeout)
-- fallbackSec is optional (seconds) to stop attempting if no animation is detected.
local function startChargeAimUntilChargeEnds(fallbackSec)
    -- ensure only one thread at a time
    stopChargeAim()
    chargeAimActive = true

    chargeAimThread = task.spawn(function()
        local startWatch = tick()
        local fallback = tonumber(fallbackSec) or 1.2

        -- try to get humanoid/root/animator
        local function getCharObjects()
            local char = lp.Character
            if not char then return nil, nil, nil end
            local hum = char:FindFirstChildOfClass("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local animator = char:FindFirstChildOfClass("Animator")
            return hum, hrp, animator
        end

        local humanoid, myRoot, animator = getCharObjects()
        if humanoid then
            pcall(function() humanoid.AutoRotate = false end)
        end

        local seenChargeAnim = false
        local watchStart = tick()

        while chargeAimActive do
            -- refresh references each loop in case character reloaded
            humanoid, myRoot, animator = getCharObjects()
            if not myRoot then break end

            -- find nearest killer model and its hrp
            local killerModel = getNearestKillerModel()
            local targetHRP = (killerModel and killerModel:FindFirstChild("HumanoidRootPart")) or nil

            if targetHRP then
                -- predictionValue exists in your script (used by aimPunch). use it for nicer aiming.
                local pred = (type(predictionValue) == "number") and predictionValue or 0
                local predictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * pred)

                -- set lookAt while keeping our position
                pcall(function()
                    myRoot.CFrame = CFrame.lookAt(myRoot.Position, predictedPos)
                end)
            end

            -- check if charge animation is playing (if we can access animator)
            local stillPlaying = false
            if animator then
                local ok, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
                if ok and tracks then
                    for _, track in ipairs(tracks) do
                        local animId = nil
                        pcall(function() animId = tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+") end)
                        if animId and table.find(chargeAnimIds, animId) then
                            stillPlaying = true
                            seenChargeAnim = true
                            break
                        end
                    end
                end
            end

            -- stop conditions:
            -- 1) we saw a charge anim and now it's gone -> stop
            if seenChargeAnim and not stillPlaying then
                break
            end

            -- 2) we never saw a charge anim and we've exceeded fallback -> stop
            if not seenChargeAnim and (tick() - watchStart) > fallback then
                break
            end

            task.wait()
        end

        -- restore AutoRotate
        if humanoid then
            pcall(function() humanoid.AutoRotate = true end)
        end

        chargeAimActive = false
    end)
end

-- modify hookSound: store extracted id once

-- optimized attemptBlockForSound (accepts optional precomputed id)
-- Replace your existing attemptBlockForSound with this improved version
-- TUNABLES (put near top of file so you can tweak for high ping)
local AUDIO_PREDICT_DT = 0.08        -- seconds to predict forward (increase for high ping)
local AUDIO_LOCAL_COOLDOWN = 0.35    -- local throttle between blocks (seconds)
local AUDIO_SOUND_THROTTLE = 1.0     -- how long to throttle the same sound (seconds)

-- helper: fast squared distance (no sqrt)
local function distSq(a, b)
    local dx = a.X - b.X
    local dy = a.Y - b.Y
    local dz = a.Z - b.Z
    return dx*dx + dy*dy + dz*dz
end

local _getSoundWorldPosition = getSoundWorldPosition

-- shared heavy work helper (local to file/scope)
local function _attemptForSound(sound, idParam, mode)
    -- quick guards (keep same order)
    if not autoBlockAudioOn then return end
    if not sound or not sound:IsA("Sound") then return end
    if not sound.IsPlaying then return end

    -- hot locals
    local now = tick()
    local hooks = soundHooks
    local hook = hooks and hooks[sound]

    -- id resolution (prefer cached)
    local id = idParam or (hook and hook.id) or extractNumericSoundId(sound)
    if not id or not autoBlockTriggerSounds[id] then return end

    -- per-sound throttle
    if soundBlockedUntil[sound] and now < soundBlockedUntil[sound] then return end

    -- global local cooldown
    if now - lastLocalBlockTime < AUDIO_LOCAL_COOLDOWN then return end

    -- ensure UI refs depending on mode (preserve original checks)
    if mode == "Block" or mode == "Charge" then
        if not cachedBlockBtn or not cachedCooldown or not cachedCharges then
            refreshUIRefs()
        end
    elseif mode == "Clone" then
        if not cachedCloneBtn then
            refreshUIRefs()
        end
    end

    -- local player root
    local lpLocal = _LP or Players.LocalPlayer
    local myChar = lpLocal and lpLocal.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    -- cached hook mapping (may be nil)
    local char = hook and hook.char
    local hrp = hook and hook.hrp

    if not hrp then
        -- expensive path: only when cache missing
        local soundPos, soundPart = getSoundWorldPosition(sound)
        if not soundPart then return end
        char = getCharacterFromDescendant(soundPart)
        hrp = char and char:FindFirstChild("HumanoidRootPart")
        -- cache mapping for next time
        if hook then
            hook.char = char
            hook.hrp = hrp
        else
            soundHooks[sound] = { id = id, char = char, hrp = hrp }
            hook = soundHooks[sound]
        end
    end

    if not hrp then return end

    -- predicted position using velocity (unrolled for speed)
    local v = hrp.Velocity or Vector3.new()
    local predictedX = hrp.Position.X + v.X * AUDIO_PREDICT_DT
    local predictedY = hrp.Position.Y + v.Y * AUDIO_PREDICT_DT
    local predictedZ = hrp.Position.Z + v.Z * AUDIO_PREDICT_DT

    local dx = predictedX - myRoot.Position.X
    local dy = predictedY - myRoot.Position.Y
    local dz = predictedZ - myRoot.Position.Z
    local distSqPred = dx*dx + dy*dy + dz*dz

    -- detection range check (preserve grace fallback logic)
    if detectionRangeSq and distSqPred > detectionRangeSq then
        local dx2 = hrp.Position.X - myRoot.Position.X
        local dy2 = hrp.Position.Y - myRoot.Position.Y
        local dz2 = hrp.Position.Z - myRoot.Position.Z
        local distSqNow = dx2*dx2 + dy2*dy2 + dz2*dz2
        local grace = (detectionRange + 3) * (detectionRange + 3)
        if distSqNow > grace then
            return
        end
    end

    -- verify sound world position (kept as in original)
    local soundPos, soundPart = _getSoundWorldPosition(sound)
    if not soundPart then return end

    -- climb to Model & validate humanoid
    local model = soundPart and soundPart:FindFirstAncestorOfClass("Model") or nil
    if not model then return end

    local humanoid = model:FindFirstChildWhichIsA("Humanoid")
    if not humanoid then return end

    local plr = Players:GetPlayerFromCharacter(model)
    if not plr or plr == lp then return end

    -- facing check (cached _isFacing)
    if facingCheckEnabled and not _isFacing(myRoot, hrp) then
        return
    end

    task.wait(blockdelay)

    -- mode-specific extra checks & actions (preserve prints and exact calls)
    if mode == "Block" then
        if cachedCooldown and cachedCooldown.Text == "" then
            print("yay")
        else
            return
        end
        fireGuiBlock()
        if doubleblocktech == true then
            fireGuiPunch()
        end
    elseif mode == "Charge" then
        if cachedChargeBtn and cachedChargeBtn:FindFirstChild("CooldownTime") and cachedChargeBtn.CooldownTime.Text == "" then
            print("yay")
        else
            return
        end
        fireGuiCharge()
        startChargeAimUntilChargeEnds(0.4)
    elseif mode == "Clone" then
        if cachedCloneBtn and cachedCloneBtn:FindFirstChild("CooldownTime") and cachedCloneBtn.CooldownTime.Text == "" then
            print("yay")
        else
            return
        end
        fireGuiClone()
        startChargeAimUntilChargeEnds(0.4)
    end

    -- optimistic local timestamp & throttle this sound (identical)
    lastLocalBlockTime = now
    soundBlockedUntil[sound] = now + AUDIO_SOUND_THROTTLE
end

-- public wrappers to preserve original names/behavior
local function attemptBlockForSound(sound, idParam)
    return _attemptForSound(sound, idParam, "Block")
end

local function attemptChargeForSound(sound, idParam)
    return _attemptForSound(sound, idParam, "Charge")
end

local function attemptCloneForSound(sound, idParam)
    return _attemptForSound(sound, idParam, "Clone")
end

-- Improved hookSound: cache id and keep placeholder for hrp/char (so attemptBlock hot-path reads cached data)

local function attemptBDParts(sound)
    if not autoBlockAudioOn then return end
    if not sound or not sound:IsA("Sound") then return end
    if not sound.IsPlaying then return end

    local id = extractNumericSoundId(sound)
    if not id or not autoBlockTriggerSounds[id] then return end

    local t = tick()
    if soundBlockedUntil[sound] and t < soundBlockedUntil[sound] then return end

    local lp = Players.LocalPlayer
    local myChar = lp and lp.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    local soundPos, soundPart = getSoundWorldPosition(sound)
    if not soundPos or not soundPart then return end

    local char = getCharacterFromDescendant(soundPart)
    local plr = char and Players:GetPlayerFromCharacter(char)
    if not plr or plr == lp then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local Debris = game:GetService("Debris")

    if antiFlickOn then
        local basePartSize = Vector3.new(5.5, 7.5, 8.5)  -- original / default size
        local partSize = basePartSize * (blockPartsSizeMultiplier or 1)
        local count = math.max(1, antiFlickParts or 4)
        local base  = antiFlickBaseOffset or 2.5
        local step  = antiFlickOffsetStep or 0.2
        local lifeTime = 0.2

        task.spawn(function()
            local blocked = false
            task.wait(antiFlickDelay or 0)
            for i = 1, count do
                if not hrp or not myRoot then break end

                local dist = base + (i - 1) * step

                local st = killerState[char] or { vel = hrp.Velocity or Vector3.new(), angVel = 0 }
                local vel = st.vel or hrp.Velocity or Vector3.new()

                local forwardSpeed = vel:Dot(hrp.CFrame.LookVector)
                local lateralSpeed = vel:Dot(hrp.CFrame.RightVector)

                -- separate multipliers
                local pStrength = (type(predictionStrength) == "number" and predictionStrength) or 1
                local pTurn = (type(predictionTurnStrength) == "number" and predictionTurnStrength) or 1

                -- raw predicted displacements
                local forwardPredictRaw = forwardSpeed * PRED_SECONDS_FORWARD * pStrength
                local lateralPredictRaw = lateralSpeed * PRED_SECONDS_LATERAL * pStrength
                local turnLateralRaw    = st.angVel * ANG_TURN_MULTIPLIER * pTurn

                -- clamps (scaled separately)
                local forwardClamp = PRED_MAX_FORWARD * pStrength
                local lateralClamp = PRED_MAX_LATERAL * pStrength
                local turnClamp    = PRED_MAX_LATERAL * pTurn

                local forwardPredict = math.clamp(forwardPredictRaw, -forwardClamp, forwardClamp)
                local lateralPredict = math.clamp(lateralPredictRaw, -lateralClamp, lateralClamp)
                local turnLateral = math.clamp(turnLateralRaw, -turnClamp, turnClamp)

                local forwardDist = dist + forwardPredict

                local spawnPos = hrp.Position
                                + hrp.CFrame.LookVector * forwardDist
                                + hrp.CFrame.RightVector * (lateralPredict + turnLateral)

                local part = Instance.new("Part")
                part.Name = "AntiFlickZone"
                part.Size = partSize
                part.Transparency = 0.45
                part.Anchored = true
                part.CanCollide = false
                part.CFrame = CFrame.new(spawnPos, hrp.Position)
                part.BrickColor = BrickColor.new("Bright blue")
                part.Parent = workspace

                Debris:AddItem(part, lifeTime)

                if isPointInsidePart(part, myRoot.Position) then
                    blocked = true
                else
                    local touching = {}
                    pcall(function() touching = myRoot:GetTouchingParts() end)
                    for _, p in ipairs(touching) do
                        if p == part then
                            blocked = true
                            break
                        end
                    end
                end

                if blocked then
                    if not (facingCheckEnabled and not isFacing(myRoot, hrp)) then
                        if autoblocktype == "Block" then
                            fireGuiBlock()
                        elseif autoblocktype == "Charge" then
                            fireGuiCharge()
                        elseif autoblocktype == "7n7 Clone" then
                            fireGuiClone()
                        end
                        soundBlockedUntil[sound] = t + 1.2
                    end
                    break
                end

                if stagger and stagger > 0 then
                    task.wait(stagger)
                else
                    task.wait(0)
                end
            end
        end)
        return
    end
end

local function hookSound(sound)
    if not sound or not sound:IsA("Sound") then return end
    if soundHooks[sound] then return end

    local preId = extractNumericSoundId(sound)

    -- create entry with id; hrp/char may be nil initially and will be cached later
    soundHooks[sound] = { id = preId, hrp = nil, char = nil }

    -- helper: centralize the logic so behaviour remains identical but without duplication
    local function handleAttempt(snd, id)
        if not autoBlockAudioOn then return end

        if not antiFlickOn then
            local at = autoblocktype
            if at == "Block" then
                attemptBlockForSound(snd, id)
            elseif at == "Charge" then
                attemptChargeForSound(snd, id)
            elseif at == "7n7 Clone" then
                attemptCloneForSound(snd, id)
            end
        else
            attemptBDParts(snd, id)
        end
    end

    -- connections
    local playedConn = sound.Played:Connect(function()
        handleAttempt(sound, preId)
    end)

    local propConn = sound:GetPropertyChangedSignal("IsPlaying"):Connect(function()
        if sound.IsPlaying then
            handleAttempt(sound, preId)
        end
    end)

    local destroyConn
    destroyConn = sound.Destroying:Connect(function()
        if playedConn and playedConn.Connected then playedConn:Disconnect() end
        if propConn and propConn.Connected then propConn:Disconnect() end
        if destroyConn and destroyConn.Connected then destroyConn:Disconnect() end
        soundHooks[sound] = nil
        soundBlockedUntil[sound] = nil
    end)

    -- store connections & metadata in hook table for later cleanup if you want (optional)
    soundHooks[sound].playedConn = playedConn
    soundHooks[sound].propConn = propConn
    soundHooks[sound].destroyConn = destroyConn

    -- If currently playing, handle immediately (cheap)
    if sound.IsPlaying then
        handleAttempt(sound, preId)
    end
end

-- Hook existing Sounds across the game (covers workspace, SoundService, Lighting, etc.)
for _, desc in ipairs(KillersFolder:GetDescendants()) do
    if desc:IsA("Sound") then
        hookSound(desc)
    end
end

-- Hook any future Sounds
KillersFolder.DescendantAdded:Connect(function(desc)
    if desc:IsA("Sound") then
        hookSound(desc)
    end
end)

-- Utility to safely get a killer HRP
local function getKillerHRP(killerModel)
    if not killerModel then return nil end
    if killerModel:FindFirstChild("HumanoidRootPart") then
        return killerModel:FindFirstChild("HumanoidRootPart")
    end
    if killerModel.PrimaryPart then
        return killerModel.PrimaryPart
    end
    -- try finding any basepart descendant
    return killerModel:FindFirstChildWhichIsA("BasePart", true)
end

local function beginDragIntoKiller(killerModel)
    -- Basic guards
    if _hitboxDraggingDebounce then return end
    if not killerModel or not killerModel.Parent then return end
    local char = lp and lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid then return end

    local targetHRP = getKillerHRP(killerModel)
    if not targetHRP then
        warn("beginDragIntoKiller: killer has no HRP/PrimaryPart")
        return
    end

    _hitboxDraggingDebounce = true

    -- save old locomotion state so we can restore it
    local oldWalk = humanoid.WalkSpeed
    local oldJump = humanoid.JumpPower
    local oldPlatformStand = humanoid.PlatformStand

    -- block normal movement by zeroing walk/jump (works for mobile joystick too)
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0
    humanoid.PlatformStand = false  -- keep physics normal so BodyVelocity works

    -- create BodyVelocity to push the HRP toward the killer smoothly
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e5, 0, 1e5)     -- allow horizontal movement, keep y free
    bv.Velocity = Vector3.new(0,0,0)
    bv.Parent = hrp

    -- optional: lightly damp vertical to avoid sudden pops (leave Y alone to respect gravity)
    local conn
    conn = RunService.Heartbeat:Connect(function(dt)
        if not _hitboxDraggingDebounce then
            conn:Disconnect()
            if bv and bv.Parent then pcall(function() bv:Destroy() end) end
            humanoid.WalkSpeed = oldWalk
            humanoid.JumpPower = oldJump
            humanoid.PlatformStand = oldPlatformStand
            return
        end

        -- abort if character/killer removed
        if not (char and char.Parent) or not (killerModel and killerModel.Parent) then
            _hitboxDraggingDebounce = false
            return
        end

        -- refresh target HRP (killer may respawn)
        targetHRP = getKillerHRP(killerModel)
        if not targetHRP then
            _hitboxDraggingDebounce = false
            return
        end

        -- compute desired horizontal velocity toward the target
        local toTarget = (targetHRP.Position - hrp.Position)
        local dist = toTarget.Magnitude
        -- desired speed: based on distance but clamped so it feels natural
        
        local horiz = Vector3.new(toTarget.X, 0, toTarget.Z)
        if horiz.Magnitude > 0.01 then
            local dir = horiz.Unit
            bv.Velocity = Vector3.new(dir.X * Dspeed, bv.Velocity.Y, dir.Z * Dspeed)
        else
            bv.Velocity = Vector3.new(0, bv.Velocity.Y, 0)
        end

        -- stop condition: when very close to killer (adjust threshold as needed)
        local stopDist = 2.0
        if dist <= stopDist then
            _hitboxDraggingDebounce = false
            -- cleanup will happen in next loop tick
        end
    end)

    -- final cleanup safety (timeout)
    task.delay(0.4, function()
        if _hitboxDraggingDebounce then
            _hitboxDraggingDebounce = false
        end
    end)
end

-- Example call:
-- beginDragIntoKiller(someKillerModel)

-- Watch for local block animations starting and trigger drag
RunService.RenderStepped:Connect(function()
    if not hitboxDraggingTech then return end
    if not cachedAnimator then refreshAnimator() end
    local animator = cachedAnimator
    if not animator then return end

    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        local ok, animId = pcall(function()
            local a = track.Animation
            return a and tostring(a.AnimationId):match("%d+")
        end)
        if ok and animId and table.find(blockAnimIds, animId) then
            -- only trigger once when it starts (timepos ~ 0)
            local timePos = 0
            pcall(function() timePos = track.TimePosition or 0 end)
            if timePos <= 0.12 then
                local nearest = getNearestKillerModel()
                if nearest then
                    -- spawn so we don't block the RenderStepped loop
                    task.wait(Ddelay)
                    task.spawn(function() beginDragIntoKiller(nearest) end)
                    startChargeAimUntilChargeEnds(0.4)
                end
            end
        end
    end
end)

-- If Better Detection (antiFlickOn) is enabled, watch for blue AntiFlickZone parts near the player
-- and trigger dragging when they appear in range.
task.spawn(function()
    if not cachedBlockBtn or not cachedCooldown or not cachedCharges then
        refreshUIRefs()
    end

    if cachedBlockBtn and cachedBlockBtn:FindFirstChild("CooldownTime") and cachedBlockBtn.CooldownTime.Text == "" then
        print("yay")
    else
        return
    end

    while true do
        RunService.Heartbeat:Wait()
        if not (hitboxDraggingTech and antiFlickOn) then
            task.wait(0.15)
            continue
        end

        local char = lp.Character
        local myRoot = char and char:FindFirstChild("HumanoidRootPart")
        if not myRoot then task.wait(0.15) continue end

        -- look for parts named "AntiFlickZone" inside radius (fast and simple)
        local found = nil
        for _, part in ipairs(workspace:GetDescendants()) do
            if not part:IsA("BasePart") then continue end
            if part.Name ~= "AntiFlickZone" then continue end
            if (part.Position - myRoot.Position).Magnitude <= HITBOX_DETECT_RADIUS then
                found = part
                break
            end
        end        
        if found and not _hitboxDraggingDebounce then
            local nearest = getNearestKillerModel()
            if nearest then
                task.wait(Ddelay)
                task.spawn(function() beginDragIntoKiller(nearest) end)
                startChargeAimUntilChargeEnds(0.4)
            end
        end
        task.wait(0.12) -- throttle checks
    end
end)

-- double-punch tech detection
-- Replacement double-punch detection (safer + debounced)
local _REFRESH_UI_IF_NIL = true
local TRACK_DEBOUNCE = 0.45   -- seconds to avoid retriggering same track
local START_WINDOW = 0     -- consider a track "starting" if TimePosition <= START_WINDOW

local trackLastTriggered = setmetatable({}, { __mode = "k" }) -- weak keys (AnimationTrack -> last tick)


-- Play a custom charge animation and stop it when LP touches a non-player part or after 4s
local function playCustomChargeWithAutoStop(animId)
    if not lp or not lp.Character then return end
    local char = lp.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    -- get or create Animator
    local animator = hum:FindFirstChildOfClass("Animator") or Instance.new("Animator", hum)

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. tostring(animId)

    local ok, track = pcall(function() return animator:LoadAnimation(anim) end)
    if not ok or not track then
        warn("Failed to load charge animation:", animId)
        return
    end

    track:Play()

    local stopped = false
    local touchConn
    local timeoutConn

    -- stop function (safe, idempotent)
    local function stopTrack()
        if stopped then return end
        stopped = true
        pcall(function() track:Stop() end)
        if touchConn and touchConn.Connected then pcall(function() touchConn:Disconnect() end) end
        if timeoutConn and timeoutConn.Connected then pcall(function() timeoutConn:Disconnect() end) end
    end

    -- stop when HRP touches a part that's not part of our character
    touchConn = hrp.Touched:Connect(function(part)
        if stopped then return end
        if not part then return end
        if part:IsDescendantOf(char) then return end -- ignore touching own character parts
        -- optional: ignore other players' characters if you want; here we treat anything not part of our char as "wall"
        stopTrack()
    end)

    -- timeout after 4 seconds (hard stop)
    timeoutConn = nil
    task.spawn(function()
        local start = tick()
        while not stopped and (tick() - start) < 4 do
            task.wait(0.05)
        end
        if not stopped then
            stopTrack()
        end
    end)

    -- try to clean up if the track stops normally (AnimationTrack may have Stopped event)
    pcall(function()
        if track.Stopped then
            track.Stopped:Connect(stopTrack)
        end
    end)
end

local lastReplaceTime = {
    block = 0,
    punch = 0,
    charge = 0,
}

task.spawn(function()
    while true do
        RunService.Heartbeat:Wait()

        local char = lp.Character
        if not char then continue end

        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
        if not animator then continue end

        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            local animId = tostring(track.Animation.AnimationId):match("%d+")

            -- Block animation replacement
            if customBlockEnabled and customBlockAnimId ~= "" and table.find(blockAnimIds, animId) then
                if animId == tostring(customBlockAnimId) then
                    continue -- already custom anim
                end
            
                if tick() - lastReplaceTime.block >= 3 then
                    lastReplaceTime.block = tick()
                    track:Stop()

                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customBlockAnimId
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()

                    -- auto-stop after 2.7 seconds (safe)
                    task.delay(customblockdelay, function()
                        pcall(function()
                            if newTrack and newTrack.IsPlaying then
                                newTrack:Stop()
                            end
                        end)
                    end)

                    break
                end
            end

            -- Punch animation replacement
            if customPunchEnabled and customPunchAnimId ~= "" and table.find(punchAnimIds, animId) then
                if animId == tostring(customPunchAnimId) then
                    continue -- already custom anim
                end
            
                if tick() - lastReplaceTime.punch >= 3 then
                    lastReplaceTime.punch = tick()
                    track:Stop()
  
                    -- with this patch:
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customPunchAnimId
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()

                    -- auto-stop after 2.7 seconds (safe)
                    task.delay(custompunchdelay, function()
                        pcall(function()
                            if newTrack and newTrack.IsPlaying then
                                newTrack:Stop()
                            end
                        end)
                    end)

                    break
                end
            end

            -- Charge animation replacement
            if customChargeEnabled and customChargeAnimId ~= "" and table.find(chargeAnimIds, animId) then
                if animId == tostring(customChargeAnimId) then
                    continue -- already custom anim
                end

                if tick() - lastReplaceTime.charge >= 3 then
                    lastReplaceTime.charge = tick()
                    track:Stop()

                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customChargeAnimId
                    -- Instead of directly playing the custom track, use the helper so it auto-stops on touch or after 4s
                    playCustomChargeWithAutoStop(customChargeAnimId)
                    break
                end
            end
        end
    end
end)

-- Auto block + punch detection loop
RunService.RenderStepped:Connect(function()
    local gui = PlayerGui:FindFirstChild("MainUI")
    local punchBtn = gui and gui:FindFirstChild("AbilityContainer") and gui.AbilityContainer:FindFirstChild("Punch")
    local charges = punchBtn and punchBtn:FindFirstChild("Charges")
    local blockBtn = gui and gui:FindFirstChild("AbilityContainer") and gui.AbilityContainer:FindFirstChild("Block")
    local cooldown = blockBtn and blockBtn:FindFirstChild("CooldownTime")

    local myChar = lp.Character
    if not myChar then return end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    Humanoid = myChar:FindFirstChildOfClass("Humanoid")
        -- Auto Block: Trigger block if a valid animation is played by a killer
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            local animTracks = hum and hum:FindFirstChildOfClass("Animator") and hum:FindFirstChildOfClass("Animator"):GetPlayingAnimationTracks()

            if hrp and myRoot and (hrp.Position - myRoot.Position).Magnitude <= detectionRange then
                for _, track in ipairs(animTracks or {}) do
                    local id = tostring(track.Animation.AnimationId):match("%d+")
                    if table.find(autoBlockTriggerAnims, id) then
                        if autoBlockOn and (hrp.Position - myRoot.Position).Magnitude <= detectionRange then
                            if isFacing(myRoot, hrp) then
                                if cooldown and cooldown.Text == "" then
                                    fireGuiBlock()
                                end
                                if doubleblocktech == true and charges and charges.Text == "1" then
                                    fireGuiPunch()
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Detect if player is playing a block animation, and blockTP is enabled

    -- Predictive Auto Block: Check killer range and time
    if predictiveBlockOn and tick() > predictiveCooldown then
        local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
        local myChar = lp.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar and myChar:FindFirstChild("Humanoid")

        if killersFolder and myHRP and myHum then
            local killerInRange = false

            for _, killer in ipairs(killersFolder:GetChildren()) do
                local hrp = killer:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local dist = (myHRP.Position - hrp.Position).Magnitude
                    if dist <= detectionRange then
                        killerInRange = true
                        break
                    end
                end
            end

            -- Handle killer entering range
            if killerInRange then
                if not killerInRangeSince then
                    killerInRangeSince = tick()  -- Start the timer when the killer enters the range
                elseif tick() - killerInRangeSince >= edgeKillerDelay then
                    -- Block if the killer has stayed in range long enough
                    fireRemoteBlock()
                    predictiveCooldown = tick() + 2  -- Set cooldown to avoid blocking too quickly again
                    killerInRangeSince = nil  -- Reset the timer
                end
            else
                killerInRangeSince = nil  -- Reset timer if the killer leaves range
            end
        end
    end


    local myChar = lp.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    -- Auto Punch
    if autoPunchOn then
        if charges and charges.Text == "1" then
            
            for _, name in ipairs(killerNames) do
                local killer = workspace:FindFirstChild("Players")
                    and workspace.Players:FindFirstChild("Killers")
                    and workspace.Players.Killers:FindFirstChild(name)
                if killer and killer:FindFirstChild("HumanoidRootPart") then
                    local root = killer.HumanoidRootPart
                    if root and myRoot and (root.Position - myRoot.Position).Magnitude <= 10 then

                        -- Trigger punch GUI button
                        fireGuiPunch()

                        -- Fling Punch: Constant TP 2 studs in front of killer for 1 second
                        if flingPunchOn then
                            hiddenfling = true
                            local targetHRP = root
                            task.spawn(function()
                                local start = tick()
                                while tick() - start < 1 do
                                    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and targetHRP and targetHRP.Parent then
                                        local frontPos = targetHRP.Position + (targetHRP.CFrame.LookVector * 2)
                                        lp.Character.HumanoidRootPart.CFrame = CFrame.new(frontPos, targetHRP.Position)
                                    end
                                    task.wait()
                                end
                                hiddenfling = false
                            end)
                        end

                        -- Play custom punch animation if enabled
                        if customPunchEnabled and customPunchAnimId ~= "" then
                            playCustomAnim(customPunchAnimId, true)
                        end

                        break -- Only punch one killer per frame
                    end
                end
            end
        end
    end
    -- === Message-When-Punching: send once per animation start ===
    do
        local myChar = lp.Character
        local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
        local animator = cachedAnimator
        local currentPlaying = {} -- map animId -> true for tracks playing this frame
        if not animator then
            refreshAnimator()
            animator = cachedAnimator
        end
        if animator then
            local ok, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
            if ok and tracks then
                for _, track in ipairs(tracks) do
                    local animId
                    pcall(function() animId = tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+") end)
                    if animId and table.find(punchAnimIds, animId) then
                        currentPlaying[animId] = true
    
                        -- if it wasn't playing last frame, it's a newly-started punch animation
                        if not _punchPrevPlaying[animId] then
                            if messageWhenAutoPunchOn and messageWhenAutoPunch and tostring(messageWhenAutoPunch):match("%S") and (tick() - _lastPunchMessageTime) > MESSAGE_PUNCH_COOLDOWN then
                                pcall(function() sendChatMessage(messageWhenAutoPunch) end)
                                _lastPunchMessageTime = tick()
                            end
                        end
                    end
                end
            end
        end

        -- replace prev state with current state (garbage-collected)
        _punchPrevPlaying = currentPlaying
    end

    do
        local myChar = lp.Character
        local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
        local animator = cachedAnimator
        local currentPlaying = {} -- map animId -> true for tracks playing this frame
        if not animator then
            refreshAnimator()
            animator = cachedAnimator
        end
        if animator then
            local ok, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
            if ok and tracks then
                for _, track in ipairs(tracks) do
                    local animId
                    pcall(function() animId = tostring(track.Animation and track.Animation.AnimationId or ""):match("%d+") end)
                    if animId and table.find(blockAnimIds, animId) then
                        currentPlaying[animId] = true
    
                        -- if it wasn't playing last frame, it's a newly-started punch animation
                        if not _blockPrevPlaying[animId] then
                            if messageWhenAutoBlockOn and messageWhenAutoBlock and tostring(messageWhenAutoBlock):match("%S") and (tick() - _lastBlockMessageTime) > MESSAGE_BLOCK_COOLDOWN then
                                pcall(function() sendChatMessage(messageWhenAutoBlock) end)
                                _lastBlockMessageTime = tick()
                            end
                        end
                    end
                end
            end
        end

        -- replace prev state with current state (garbage-collected)
        _blockPrevPlaying = currentPlaying
    end

    -- === end message-when-punching ===
    if aimPunch then
        if not cachedAnimator then
            refreshAnimator()
        end
        local animator = cachedAnimator
        if animator and myRoot and myChar then
            for _, name in ipairs(killerNames) do
                local killer = workspace:FindFirstChild("Players")
                    and workspace.Players:FindFirstChild("Killers")
                    and workspace.Players.Killers:FindFirstChild(name)
                if killer and killer:FindFirstChild("HumanoidRootPart") then
                    local root = killer.HumanoidRootPart

                    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                        -- guard: want only punch tracks (vanilla or custom)
                        local animId = tostring(track.Animation.AnimationId):match("%d+")
                        if table.find(punchAnimIds, animId) then

                            -- Avoid retriggering for the same AnimationTrack within cooldown
                            local last = lastAimTrigger[track]
                            if last and tick() - last < AIM_COOLDOWN then
                                -- already triggered recently for this track -> skip
                            else
                                -- Only trigger when the track is just starting (helps avoid mid/late triggers)
                                local timePos = 0
                                pcall(function() timePos = track.TimePosition or 0 end) -- safe read
                                if timePos <= 0.1 then
                                    -- Lock it so we don't retrigger
                                    lastAimTrigger[track] = tick()

                                    -- Disable autoroate once and aim for AIM_WINDOW seconds
                                    local humanoid = myChar:FindFirstChild("Humanoid")
                                    if humanoid then
                                        humanoid.AutoRotate = false
                                    end

                                    task.spawn(function()
                                        local start = tick()
                                        while tick() - start < AIM_WINDOW do
                                            if myRoot and root and root.Parent then
                                                local predictedPos = root.Position + (root.CFrame.LookVector * predictionValue)
                                                myRoot.CFrame = CFrame.lookAt(myRoot.Position, predictedPos)
                                            end
                                            task.wait()
                                        end
                                        -- restore
                                        if humanoid then
                                            humanoid.AutoRotate = true
                                        end

                                        -- cleanup: allow retrigger later
                                        task.delay(AIM_COOLDOWN - AIM_WINDOW, function()
                                            lastAimTrigger[track] = nil
                                        end)
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

local success, Library = pcall(function()
    local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    return loadstring(game:HttpGet(repo .. "Library.lua"))()
end)


local Tabs

local ThemeManager, SaveManager
if success and Library then
    pcall(function()
        local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
        ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
        SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
    end)
else
    warn("Obsidian library failed to load. If HttpGet is blocked, require a local copy of Library.lua and addons instead.")
end

-- If Library loaded, build UI using Example.lua patterns
local Options, Toggles, Window
local ui_refs = {}


-- GUI SHIT --

if Library then
    -- optional recommended settings from Example.lua
    Library.ForceCheckbox = false
    Library.ShowToggleFrameInKeybinds = true

    Window = Library:CreateWindow({
        Title = "Auto Block",
        Footer = "ples sub to forsaken.scripts",
        Icon = 0,
        NotifySide = "Right",
        ShowCustomCursor = true,
    })

    Tabs = {
        Notice = Window:AddTab("Notice", "user"),
        AutoBlock = Window:AddTab("Auto Block", "sword"),
        BD = Window:AddTab("BD", "sword"),
        Tech = Window:AddTab("Techs", "sword"),
        AutoBlockPrediction = Window:AddTab("Auto Block Prediction", "wrench"),
        AutoPunch = Window:AddTab("Auto Punch", "wrench"),
        CustomAnim = Window:AddTab("Custom Anims", "user"),
        FB = Window:AddTab("Fake Block", "user"),
        Misc = Window:AddTab("Misc", "swords"),
       	["UI Settings"] = Window:AddTab("Settings", "settings"),
    }

    local NoticeLeftGroup = Tabs.Notice:AddLeftGroupbox("welcome")
    local NoticeRightGroup = Tabs.Notice:AddRightGroupbox("Update Log")

    local AutoBlockLeftGroup = Tabs.AutoBlock:AddLeftGroupbox("autoblock")
    local AutoBlockRightGroup = Tabs.AutoBlock:AddRightGroupbox("more things")

    local BDLeftGroup = Tabs.BD:AddLeftGroupbox("autoblock")
    local BDRightGroup = Tabs.BD:AddRightGroupbox("more things")

    local TechLeftGroup = Tabs.Tech:AddLeftGroupbox("techs")
    local TechRightGroup = Tabs.Tech:AddRightGroupbox("what they do")

    local AutoBlockPredictionLeftGroup = Tabs.AutoBlockPrediction:AddLeftGroupbox("autoblock prediction")
    local AutoBlockPredictionRightGroup = Tabs.AutoBlockPrediction:AddRightGroupbox("more things")

    local AutoPunchLeftGroup = Tabs.AutoPunch:AddLeftGroupbox("Techs")
    local AutoPunchRightGroup = Tabs.AutoPunch:AddRightGroupbox("a")

    local CustomAnimLeftGroup = Tabs.CustomAnim:AddLeftGroupbox("Stuff")
    local CustomAnimRightGroup = Tabs.CustomAnim:AddRightGroupbox("more things")

    local FBLeftGroup = Tabs.FB:AddLeftGroupbox("Fake Block")

    local MiscLeftGroup = Tabs.Misc:AddLeftGroupbox("Universal")
    local MiscRightGroup = Tabs.Misc:AddRightGroupbox("Forsaken")


    NoticeLeftGroup:AddLabel("thanks for using my wonderful auto block script")
    NoticeLeftGroup:AddLabel("some features may only work with guest skins thats using the default anims")
    NoticeLeftGroup:AddLabel(".gg/Tmby2GkKJR")

    NoticeRightGroup:AddLabel("1. made ab anim work")
    NoticeRightGroup:AddLabel("with sixer.")
    NoticeRightGroup:AddLabel("2. changed ui to")
    NoticeRightGroup:AddLabel("obsidian")
    NoticeRightGroup:AddLabel("3. audio ab now works with ck.")

    NoticeRightGroup:AddLabel("UPDATE PLANS")
    NoticeRightGroup:AddLabel("1. optimize lag")
    NoticeRightGroup:AddLabel("2. uhhh idk,")
    NoticeRightGroup:AddLabel("suggest in discord.")


    AutoBlockLeftGroup:AddToggle("AutoBlockAnimation", {
        Text = "Auto Block (Animation)",
        Tooltip = "auto block animation detection",
        Default = false,
        Callback = function(Value)
            autoBlockOn = Value
        end,
    })

    AutoBlockLeftGroup:AddToggle("AutoBlockAudio", {
        Text = "Auto Block (Audio)",
        Tooltip = "auto block audio detection",
        Default = false,
        Callback = function(Value)
            autoBlockAudioOn = Value
        end,
    })

    AutoBlockLeftGroup:AddDropdown("BlockType", {
        Values = {"Block", "Charge", "7n7 Clone"},
        Default = 1,
        Multi = false,
        Text = "Auto Block Type",
        Tooltip = "Choose ab type",
        Callback = function(Value)
            autoblocktype = Value
        end,
    })

    AutoBlockLeftGroup:AddLabel("use audio auto block and use 20 range for it")


    AutoBlockLeftGroup:AddToggle("messageWhenBlockToggle", {
        Text = "Message When Blocking",
        Tooltip = "auto chat when blocking",
        Default = false,
        Callback = function(Value)
            messageWhenAutoBlockOn = Value
        end,
    })

    -- Input: Range (N)
    AutoBlockLeftGroup:AddInput("MessageWhenBlock", {
        Text = "The message",
        Default = "",
        Numeric = false,
        ClearTextOnFocus = false,
        Placeholder = "im gonna block ya",
        Callback = function(Value)
            messageWhenAutoBlock = Value
        end,
    })

    AutoBlockLeftGroup:AddInput("BlockDelay", {
        Text = "block delay",
        Default = "0",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "0",
        Callback = function(Value)
            blockdelay = tonumber(Value) or blockdelay
        end,
    })

    AutoBlockLeftGroup:AddLabel("face check might delay on coolkid, dont use face check agaisnt coolkid.")

    AutoBlockLeftGroup:AddToggle("FacingCheckToggle", {
        Text = "Facing Check",
        Tooltip = "facing chekc",
        Default = false,
        Callback = function(Value)
            facingCheckEnabled = Value
        end,
    })

    AutoBlockLeftGroup:AddToggle("FacingCheckVisualToggle", {
        Text = "Facing Check Visual",
        Tooltip = "facing chekc visual",
        Default = false,
        Callback = function(Value)
            facingVisualOn = Value
            refreshFacingVisuals()
        end,
    })

    AutoBlockLeftGroup:AddLabel("facing check visual not being accurate is because its just there to give u an idea of the facing check")

    AutoBlockLeftGroup:AddInput("FacingChekDot", {
        Text = "Facing Check angle (DOT)",
        Default = "-0.3",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "-0.3",
        Callback = function(Value)
            customFacingDot = tonumber(Value) or customFacingDot
        end,
    })

    AutoBlockLeftGroup:AddLabel("DOT Explanation: if for example you put it 0 you will need to be EXACTLY infront of the killer. but you can make the facing check cone larger by making it -0.3 or -0.5 if you put -1 is going to be a half circle cone infront the killer, so yeah.")

    AutoBlockLeftGroup:AddInput("DetectionRange", {
        Text = "Detection Range",
        Default = "18",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "18",
        Callback = function(Value)
            detectionRange = tonumber(Value) or detectionRange
            detectionRangeSq = detectionRange * detectionRange
        end,
    })

    AutoBlockLeftGroup:AddToggle("DetectionRangeVisualToggle", {
        Text = "Detection Range Visual",
        Tooltip = "detection range visual",
        Default = false,
        Callback = function(Value)
            killerCirclesVisible = Value
            refreshKillerCircles()
        end,
    })

    -- BDtab
    
    BDLeftGroup:AddLabel("BD or Better Detection delays on coolkid, use normal detection agaisnt coolkid.")

    BDLeftGroup:AddToggle("AntiFlickToggle", {
        Text = "Better Detection (doesn't use detectrange)",
        Tooltip = "activate nd",
        Default = false,
        Callback = function(Value)
            antiFlickOn = Value
        end,
    })

    BDLeftGroup:AddInput("AntiFlickParts", {
        Text = "How many block parts that spawn",
        Default = "4",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "4",
        Callback = function(Value)
            antiFlickParts = math.max(1, math.floor(Value))
        end,
    })

    BDLeftGroup:AddInput("BlockPartsSizeMultiplier", {
        Text = "Block Parts Size Multiplier",
        Default = "1",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "1",
        Callback = function(Value)
            blockPartsSizeMultiplier = tonumber(Value) or 1
        end,
    })

    BDLeftGroup:AddInput("PredictionStrength", {
        Text = "Forward Prediction Strength",
        Default = "1",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "1",
        Callback = function(Value)
            predictionStrength = tonumber(Value)
        end,
    })

    BDLeftGroup:AddInput("PredictionTurnStrength", {
        Text = "Turn Prediction Strength",
        Default = "1",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "1",
        Callback = function(Value)
            predictionTurnStrength = tonumber(Value)
        end,
    })

    BDLeftGroup:AddInput("AntiFlickDelay", {
        Text = "delay before the first block part spawn (seconds) (DBTFBPS)",
        Default = "0",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "0",
        Callback = function(Value)
            local num = tonumber(Value)
            if num then
                antiFlickDelay = math.max(0, num) -- don’t allow negative
            end
        end,
    })

    BDLeftGroup:AddToggle("AutoAdjustDBTFBPS", {
        Text = "Auto-adjust DBTFBPS based on killer",
        Tooltip = "activate auto dbtfbps",
        Default = false,
        Callback = function(Value)
            autoAdjustDBTFBPS = Value
            if state then
                -- save the current manual value so we can restore it when the toggle is off
                _savedManualAntiFlickDelay = antiFlickDelay or 0
                doImmediateUpdate()
                print("Auto-DBTFBPS: enabled (saved manual antiFlickDelay = " .. tostring(_savedManualAntiFlickDelay) .. ")")
            else
                -- restore manual value when user disables
                antiFlickDelay = _savedManualAntiFlickDelay
                print("Auto-DBTFBPS: disabled -> restored antiFlickDelay = " .. tostring(antiFlickDelay))
            end
        end,
    })

    BDLeftGroup:AddInput("AntiFlickDelayEachParts", {
        Text = "delay before each block parts spawns (seconds)",
        Default = "0.02",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "0.02",
        Callback = function(Value)
            local num = tonumber(Value)
            if num then
                stagger = math.max(0, num) -- don’t allow negative
            end
        end,
    })

    BDLeftGroup:AddInput("AntiFlickDistanceInfront", {
        Text = "how much studs infront killer the block parts are gonna spawn (studs)",
        Default = "2.7",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "2.7",
        Callback = function(Value)
            local num = tonumber(text)
            if num then
                antiFlickBaseOffset = math.max(0, num) -- don’t allow negative
            end
        end,
    })

    TechLeftGroup:AddToggle("doubleblockTechtoggle", {
        Text = "Double Punch Tech",
        Tooltip = "look at the right group for info",
        Default = false,
        Callback = function(Value)
            doubleblocktech = Value
        end,
    })

    TechLeftGroup:AddToggle("HitboxDraggingToggle", {
        Text = "Hitbox Dragging tech (HDT)",
        Tooltip = "look at the right group for info",
        Default = false,
        Callback = function(Value)
            hitboxDraggingTech = Value
        end,
    })

    TechLeftGroup:AddInput("HDTspeed", {
        Text = "HDT speed",
        Default = "5.6",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "5.6",
        Callback = function(Value)
            Dspeed = tonumber(Value)
        end,
    })

    TechLeftGroup:AddInput("HDTdelay", {
        Text = "HDT delay",
        Default = "0",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "0",
        Callback = function(Value)
            Ddelay = tonumber(Value)
        end,
    })

    TechLeftGroup:AddButton("Fake Lag Tech", function()
        pcall(function()
            local char = lp.Character or lp.CharacterAdded:Wait()
            local humanoid = char and char:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

            -- (optional) stop any identical track already playing
            for _, t in ipairs(animator:GetPlayingAnimationTracks()) do
                local id = tostring(t.Animation and t.Animation.AnimationId or ""):match("%d+")
                if id == "136252471123500" then
                    pcall(function() t:Stop() end)
                end
            end

            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://136252471123500"
            local track = animator:LoadAnimation(anim)
            track:Play()
        end)
    end)



    AutoBlockPredictionLeftGroup:AddToggle("predictiveABtoggle", {
        Text = "Predictive Auto Block",
        Tooltip = "blocks if the killer is in a range",
        Default = false,
        Callback = function(Value)
            predictiveBlockOn = Value
        end,
    })

    AutoBlockPredictionLeftGroup:AddInput("predictiveABrange", {
        Text = "Detection Range",
        Default = "10",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "10",
        Callback = function(Value)
            local vlue = tonumber(Value)
            if vlue then
                detectionRange = vlue
            end
        end,
    })

    AutoBlockPredictionLeftGroup:AddInput("edgekillerlmao", {
        Text = "Edge Killer",
        Default = "3",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "3",
        Callback = function(Value)
            local vlue = tonumber(Value)
            if vlue then
                edgeKillerDelay = vlue
            end
        end,
    })


    AutoPunchLeftGroup:AddToggle("AutoPunchToggle", {
        Text = "Auto Punch",
        Tooltip = "auto parries after block",
        Default = false,
        Callback = function(Value)
            autoPunchOn = Value
        end,
    })

    AutoPunchLeftGroup:AddToggle("MessageWhenPunchToggle", {
        Text = "Message When Punching",
        Tooltip = "message when you are punching",
        Default = false,
        Callback = function(Value)
            messageWhenAutoPunchOn = Value
        end,
    })

    AutoPunchLeftGroup:AddInput("MessageWhenPunchText", {
        Text = "Message when punching",
        Default = "",
        Numeric = false,
        ClearTextOnFocus = false,
        Placeholder = "Im not gonna sugarcoat it.",
        Callback = function(Value)
            messageWhenAutoPunch = Value
        end,
    })

    AutoPunchLeftGroup:AddToggle("flingpunchtoggle", {
        Text = "Fling Punch",
        Tooltip = "fling punch (broken)",
        Default = false,
        Callback = function(Value)
            flingPunchOn = Value
        end,
    })

    AutoPunchLeftGroup:AddToggle("PunchAimToggle", {
        Text = "Punch Aimbot",
        Tooltip = "aimbots to the killer when punching",
        Default = false,
        Callback = function(Value)
            aimPunch = Value
        end,
    })


    AutoPunchLeftGroup:AddInput("PredictionSlider", {
        Text = "Aim Prediction",
        Default = tostring(predictionValue),
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "4",
        Callback = function(Value)
            local vlue = tonumber(Value)
            if vlue then
                predictionValue = vlue
            end
        end,
    })

    AutoPunchLeftGroup:AddInput("FlingPower", {
        Text = "Fling Power",
        Default = "10000",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "10000",
        Callback = function(Value)
            local vlue = tonumber(Value)
            if vlue then
                flingPower = vlue
            end
        end,
    })

    CustomAnimLeftGroup:AddInput("customblockid", {
        Text = "Custom Block Animation",
        Default = "",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "AnimationId",
        Callback = function(Value)
            customBlockAnimId = Value
        end,
    })

    CustomAnimLeftGroup:AddToggle("blockanimtoggle", {
        Text = "Enable Custom Block Animation",
        Tooltip = "self explanatory",
        Default = false,
        Callback = function(Value)
            customBlockEnabled = Value
        end,
    })

    CustomAnimLeftGroup:AddInput("customblockdelaystop", {
        Text = "delay before stop anim (block)",
        Default = "2",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "2",
        Callback = function(Value)
            local vlue = tonumber(Value)
            if vlue then
                customblockdelay = vlue
            end
        end,
    })

    CustomAnimLeftGroup:AddInput("custompunchid", {
        Text = "Custom Punch Animation",
        Default = "",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "AnimationId",
        Callback = function(Value)
            customPunchAnimId = Value
        end,
    })

    CustomAnimLeftGroup:AddToggle("punchanimtoggle", {
        Text = "Enable Custom Punch Animation",
        Tooltip = "self explanatory",
        Default = false,
        Callback = function(Value)
            customPunchEnabled = Value
        end,
    })

    CustomAnimLeftGroup:AddInput("custompunchdelaystop", {
        Text = "delay before stop anim (punch)",
        Default = "2",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "2",
        Callback = function(Value)
            local vlue = tonumber(Value)
            if vlue then
                custompunchdelay = vlue
            end
        end,
    })

    CustomAnimLeftGroup:AddInput("customchargeid", {
        Text = "Custom Charge Animation",
        Default = "",
        Numeric = true,
        ClearTextOnFocus = false,
        Placeholder = "AnimationId",
        Callback = function(Value)
            customChargeAnimId = Value
        end,
    })

    CustomAnimLeftGroup:AddToggle("chargeanimtoggle", {
        Text = "Enable Custom Charge Animation",
        Tooltip = "self explanatory",
        Default = false,
        Callback = function(Value)
            customChargeEnabled = Value
        end,
    })

    FBLeftGroup:AddButton("Load Fake Block", function()
        pcall(function()
            local fakeGui = PlayerGui:FindFirstChild("FakeBlockGui")
            if not fakeGui then
                local success, result = pcall(function()
                    return loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/fakeblock"))()
                end)
                if not success then
                    warn("❌ Failed to load Fake Block GUI:", result)
                end
            else
                fakeGui.Enabled = true
                print("✅ Fake Block GUI enabled")
            end
        end)
    end)

    MiscLeftGroup:AddButton("Run Infinite Yield", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    MiscRightGroup:AddButton("c00lgui (custom stamina, esp, dont use on xeno) creds to owner", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-c00lgui-v15-ESP-EDITABLE-STAMINA-41624"))()
    end)

    MiscRightGroup:AddToggle("controlcharge", {
        Text = "Control Charge",
        Tooltip = "lets you control your charge better (only works on default anim charge)",
        Default = false,
        Callback = function(val)
            -- call the setter your control block exposes
            if _G.ControlCharge_SetEnabled then
                pcall(function() _G.ControlCharge_SetEnabled(val) end)
            else
                -- fallback: store desired state so the control block can pick it up if it reads _G later
                _G.ControlCharge_WantedEnabled = val
            end
        end,
    })

    MiscRightGroup:AddToggle("KillerESP_Toggle", {
        Text = "Killer ESP",
        Tooltip = "self explanatory",
        Default = true,
        Callback = function(Value)
            espEnabled = Value
            refreshESP()
        end,
    })

    MiscRightGroup:AddButton("Remove Slowness (only the status effect)", function()
        game:GetService("ReplicatedStorage").Modules.StatusEffects.Slowness:Destroy()
    end)

    MiscRightGroup:AddButton("infinite resistence 100% real not fake trust", function()
        lp:Kick("u got banned from roblxo permandnenly very real not fake trust %100")
    end)

    Options = Library.Options
    Toggles = Library.Toggles
end

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Setting", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",
	Text = "Notification Side",
	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("unload script", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("autoblock")
SaveManager:SetFolder("autoblock/games")
SaveManager:SetSubFolder("Forsaken")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
