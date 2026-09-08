-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main Window
local Window = Rayfield:CreateWindow({
    Name = "hub",
    LoadingTitle = "Loading GUI...",
    LoadingSubtitle = "by skibidishots",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "skibidihub",
        FileName = "RayfieldConfig"
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false
})

-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local PlayerGui = lp:WaitForChild("PlayerGui")
local Humanoid, Animator
local StarterGui = game:GetService("StarterGui")
local StarterGui  = game:GetService("StarterGui")
local TestService = game:GetService("TestService")


-- full bright var
local Lighting = game:GetService("Lighting")
local fullbrightEnabled = false

local fullbrightOriginal = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogEnd = Lighting.FogEnd,
}

local fullbrightTarget = {
    Brightness = 2,
    ClockTime = 12,
    GlobalShadows = false,
    Ambient = Color3.fromRGB(255,255,255),
    OutdoorAmbient = Color3.fromRGB(255,255,255),
    FogEnd = 1e9,
}


-- shedletsky var
local autoSlash = false
local slashRange = 10 -- studs

-- reach hitbox var
local ForsakenReachEnabled = false
local ForsakenNearestDist = 120
local ForsakenRNG = Random.new()

local ForsakenAttackList = {
    'rbxassetid://131430497821198','rbxassetid://83829782357897','rbxassetid://126830014841198',
    'rbxassetid://126355327951215','rbxassetid://121086746534252','rbxassetid://105458270463374',
    'rbxassetid://127172483138092','rbxassetid://18885919947','rbxassetid://18885909645',
    'rbxassetid://87259391926321','rbxassetid://106014898528300','rbxassetid://87259391926321',
    'rbxassetid://86545133269813','rbxassetid://89448354637442','rbxassetid://90499469533503',
    'rbxassetid://116618003477002','rbxassetid://106086955212611','rbxassetid://107640065977686',
    'rbxassetid://77124578197357','rbxassetid://101771617803133','rbxassetid://134958187822107',
    'rbxassetid://111313169447787','rbxassetid://71685573690338','rbxassetid://71685573690338',
    'rbxassetid://129843313690921','rbxassetid://97623143664485','rbxassetid://129843313690921',
    'rbxassetid://136007065400978','rbxassetid://136007065400978','rbxassetid://86096387000557',
    'rbxassetid://86096387000557','rbxassetid://108807732150251','rbxassetid://138040001965654',
    'rbxassetid://73502073176819','rbxassetid://129843313690921','rbxassetid://97623143664485',
    'rbxassetid://129843313690921','rbxassetid://97623143664485','rbxassetid://97623143664485',
    'rbxassetid://86709774283672','rbxassetid://106014898528300','rbxassetid://87259391926321',
    'rbxassetid://140703210927645','rbxassetid://96173857867228','rbxassetid://121255898612475',
    'rbxassetid://98031287364865','rbxassetid://119462383658044','rbxassetid://77448521277146',
    'rbxassetid://77448521277146','rbxassetid://103741352379819','rbxassetid://119462383658044',
    'rbxassetid://131696603025265','rbxassetid://122503338277352','rbxassetid://97648548303678',
    'rbxassetid://94162446513587','rbxassetid://84426150435898','rbxassetid://93069721274110',
    'rbxassetid://114620047310688','rbxassetid://97433060861952','rbxassetid://82183356141401',
    'rbxassetid://100592913030351','rbxassetid://121293883585738','rbxassetid://100592913030351',
    'rbxassetid://121293883585738','rbxassetid://100592913030351','rbxassetid://121293883585738',
    'rbxassetid://70447634862911','rbxassetid://92173139187970','rbxassetid://106847695270773',
    'rbxassetid://125403313786645','rbxassetid://81639435858902','rbxassetid://137314737492715',
    'rbxassetid://120112897026015','rbxassetid://82113744478546','rbxassetid://118298475669935',
    'rbxassetid://82113744478546','rbxassetid://118298475669935','rbxassetid://126681776859538',
    'rbxassetid://129976080405072','rbxassetid://109667959938617','rbxassetid://74707328554358',
    'rbxassetid://133336594357903','rbxassetid://86204001129974','rbxassetid://82113744478546',
    'rbxassetid://118298475669935','rbxassetid://124243639579224','rbxassetid://70371667919898',
    'rbxassetid://131543461321709','rbxassetid://136323728355613','rbxassetid://140703210927645',
    'rbxassetid://109230267448394','rbxassetid://139835501033932'
}

-- player var
local infiniteStamina = false

-- john toe var
local autoErrorEnabled = false
local ErrordetectionRange = 14
local EsoundHooks = {}
local EsoundTriggeredUntil = {}

-- Trigger sounds
local autoErrorTriggerSounds = {
    ["86710781315432"] = true,
    ["99820161736138"] = true,
    ["609342351"] = true,
    ["81976396729343"] = true,
    ["12222225"] = true,
    ["80521472651047"] = true,
    ["139012439429121"] = true,
    ["91194698358028"] = true,
    ["111910850942168"] = true,
    ["83851356262523"] = true,
}

-- noli var
local voidrushcontrol = false

-- Generators var
local generatorCooldown = 2.5

-- ultra instinct var
local ultraInstinctEnabled = false
local canDodge = true
local lastNotifTime = 0
local notifCooldown = 2
local currentDirection = 1
local directions = {"Left", "Right", "Forward", "Backward", "Random"}
local ultraConn = nil

-- dodge anims (same as your standalone)
local dodgeAnims = {
    Left = "rbxassetid://17096325697",
    Right = "rbxassetid://17096327600",
    Forward = "rbxassetid://17096329187",
    Backward = "rbxassetid://17096330733",
}

local currentDirectionOption = directions[currentDirection]
local dodgeDistanceInput = "7"

-- Chance aimbot var
local chanceactive = false
local chanceprediction = 4
local aimDuration = 1.7
local aimTargets = { "Jason", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli" }
local trackedAnimations = {
    ["103601716322988"] = true,
    ["133491532453922"] = true,
    ["86371356500204"] = true,
    ["76649505662612"] = true,
    ["81698196845041"] = true
}

-- State
local lHumanoid, lHRP = nil, nil
local lastTriggerTime = 0
local aiming = false
local originalWS, originalJP, originalAutoRotate = nil, nil, nil

-- Guest 1337 var
-- Sound and anim IDS

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
}

local autoBlockTriggerAnims = {
    "126830014841198", "126355327951215", "121086746534252", "18885909645",
    "98456918873918", "105458270463374", "83829782357897", "125403313786645",
    "118298475669935", "82113744478546", "70371667919898", "99135633258223",
    "97167027849946", "109230267448394", "139835501033932", "126896426760253",
    "109667959938617", "126681776859538", "129976080405072", "121293883585738",
    "81639435858902", "137314737492715",
    "92173139187970"
}
-- toggles
local autoBlockOn = false
local autoBlockAudioOn = false
local doubleblocktech = false
local looseFacing = true
local detectionRange = 18
local blockBtn = gui and gui:FindFirstChild("AbilityContainer") and gui.AbilityContainer:FindFirstChild("Block")
local cooldown = blockBtn and blockBtn:FindFirstChild("CooldownTime")

-- Prevent repeated aim triggers for the same animation track
local lastAimTrigger = {}   -- keys = AnimationTrack, value = timestamp when we triggered
local AIM_WINDOW = 0.5      -- how long to aim (seconds)
local AIM_COOLDOWN = 0.6    -- don't retrigger within this many seconds


local predictiveBlockOn = false
local edgeKillerDelay = 3
local killerInRangeSince = nil
local predictiveCooldown = 0

local autoPunchOn = false
local flingPunchOn = false
local flingPower = 10000
local hiddenfling = false
local aimPunch = false

local customBlockEnabled = false
local customBlockAnimId = ""
local customPunchEnabled = false
local customPunchAnimId = ""

local KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")

local facingCheckEnabled = true
local detectionCircles = {} -- store all killer circles
local killerCirclesVisible = false
local blockTPEnabled = false
local predictionValue = 4

local lastReplaceTime = {
    block = 0,
    punch = 0,
    charge = 0,
}

local lastBlockTime = 0
local lastPunchTime = 0
local lastBlockTpTime = 0

local blockAnimIds = {
"72722244508749",
"96959123077498"
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

local customChargeEnabled = false
local customChargeAnimId = ""
local chargeAnimIds = { "106014898528300" }

local killerNames = {"c00lkidd", "Jason", "JohnDoe", "1x1x1x1", "Noli", "Slasher"}


local tabGenerators = Window:CreateTab("Generators", 4483362458) -- Example icon
local tabESP = Window:CreateTab("ESP", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local SurvivorsTab = Window:CreateTab("Survivors", 4483362458)
local KillersTab = Window:CreateTab("Killers", 4483362458)
local RagebaitTab = Window:CreateTab("Ragebait", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)
local CustomAnimTab = Window:CreateTab("Custom Animations", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)

-- Things
-- full bright (thing)
local function applyFullbright()
    for k,v in pairs(fullbrightTarget) do
        Lighting[k] = v
    end
end

local function restoreFullbright()
    for k,v in pairs(fullbrightOriginal) do
        Lighting[k] = v
    end
end

-- keep enforcing if enabled
RunService.RenderStepped:Connect(function()
    if fullbrightEnabled then
        applyFullbright()
    end
end)
-- shedletsky (thing)
task.spawn(function()
    while task.wait(0.1) do
        if not autoSlash then continue end
        local char = lp.Character
        if not char then continue end
        local myRoot = char:FindFirstChild("HumanoidRootPart")
        if not myRoot then continue end

        for _, killer in ipairs(KillersFolder:GetChildren()) do
            if killer and killer:FindFirstChild("HumanoidRootPart") then
                local kroot = killer.HumanoidRootPart
                local dist = (kroot.Position - myRoot.Position).Magnitude
                if dist <= slashRange then
                    -- Fire server to use Slash ability (same pattern hub uses for other abilities)
                    local args = {"UseActorAbility", "Slash"}
                    ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

                    -- small throttle to avoid spamming the server
                    task.wait(0.6)
                    break
                end
            end
        end
    end
end)

-- Reach hitbox (thing)
local ForsakenAttackIds = {}
for _, v in ipairs(ForsakenAttackList) do
    local n = tostring(v):match("%d+")
    if n then ForsakenAttackIds[n] = true end
end

-- heartbeat loop that follows your original logic but re-uses hub's lHumanoid/lHRP and lp
local conn
conn = RunService.Heartbeat:Connect(function()
    if not ForsakenReachEnabled then return end
    if not lHumanoid or not lHRP then return end

    -- check if player is playing one of the attack anims (within early part)
    local Playing = false
    for _, track in ipairs(lHumanoid:GetPlayingAnimationTracks()) do
        local animObj = track.Animation
        if animObj and animObj.AnimationId then
            local animNum = tostring(animObj.AnimationId):match("%d+")
            if animNum and ForsakenAttackIds[animNum] then
                local timePos = (track.TimePosition or 0)
                local length = (track.Length or 1)
                if (timePos / length) < 0.75 then
                    Playing = true
                    break
                end
            end
        end
    end
    if not Playing then return end

    -- find nearest valid target (players + NPCs)
    local Target = nil
    local CurrentNearestDist = ForsakenNearestDist

    local function checkModels(t)
        for _, m in ipairs(t) do
            if not m then continue end
            if m == lp.Character then continue end
            if not m:IsA("Model") then continue end
            local hrp = m:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end
            local dist = (hrp.Position - lHRP.Position).Magnitude
            if dist < CurrentNearestDist then
                CurrentNearestDist = dist
                Target = m
            end
        end
    end

    -- players
    local playersFolder = workspace:FindFirstChild("Players")
    if playersFolder then
        checkModels(playersFolder:GetChildren())
    end

    -- NPCs (map)
    local npcsFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("NPCs", true)
    if npcsFolder then
        checkModels(npcsFolder:GetChildren())
    end

    if not Target then return end

    -- move towards target briefly to "reach"
    local OldVelocity = lHRP.Velocity
    local ping = 0.1
    pcall(function() ping = lp:GetNetworkPing() or 0.1 end)
    local predicted = Target:FindFirstChild("HumanoidRootPart") and Target.HumanoidRootPart.Position or (lHRP.Position)
    local NeededVelocity = (predicted
        + Vector3.new(ForsakenRNG:NextNumber(-1.5,1.5), 0, ForsakenRNG:NextNumber(-1.5,1.5))
        + ((Target:FindFirstChild("HumanoidRootPart") and Target.HumanoidRootPart.Velocity or Vector3.zero) * (ping * 1.25))
        - lHRP.Position
    ) / math.max(0.05, (ping * 2))

    -- apply and restore
    lHRP.Velocity = NeededVelocity
    RunService.RenderStepped:Wait()
    lHRP.Velocity = OldVelocity
end)

-- disconnect automatically if player leaves (keeps things tidy)
lp.AncestryChanged:Connect(function(_, parent)
    if not parent then
        if conn and conn.Connected then conn:Disconnect() end
    end
end)

-- player
-- Infinite Stamina
local function enableInfiniteStamina()
    local success, StaminaModule = pcall(function()
        return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    end)
    if not success or not StaminaModule then return end

    StaminaModule.StaminaLossDisabled = true

    task.spawn(function()
        while infiniteStamina and StaminaModule do
            task.wait(0.1)
            StaminaModule.Stamina = StaminaModule.MaxStamina
            StaminaModule.StaminaChanged:Fire()
        end
    end)
end

-- john doe (thing)
local function extractNumericSoundId(sound)
    if not sound or not sound.SoundId then return nil end
    return tostring(sound.SoundId):match("%d+")
end

local function getSoundWorldPosition(sound)
    if sound.Parent and sound.Parent:IsA("BasePart") then
        return sound.Parent.Position
    elseif sound.Parent and sound.Parent:IsA("Attachment") and sound.Parent.Parent:IsA("BasePart") then
        return sound.Parent.Parent.Position
    end
    local found = sound.Parent and sound.Parent:FindFirstChildWhichIsA("BasePart", true)
    if found then return found.Position end
    return nil
end

local function attemptError404ForSound(sound)
    if not autoErrorEnabled then return end
    if not sound or not sound:IsA("Sound") or not sound.IsPlaying then return end

    local id = extractNumericSoundId(sound)
    if not id or not autoErrorTriggerSounds[id] then return end

    local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    if EsoundTriggeredUntil[sound] and tick() < EsoundTriggeredUntil[sound] then return end

    local pos = getSoundWorldPosition(sound)
    local shouldTrigger = (not pos) or ((myRoot.Position - pos).Magnitude <= ErrordetectionRange)

    if shouldTrigger then
        warn("[AUTO ERROR 404] Triggered for Sound ID:", id)
        local args = {"UseActorAbility","404Error"}
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        EsoundTriggeredUntil[sound] = tick() + 1.2
    end
end

local function hookSound(sound)
    if EsoundHooks[sound] then return end
    local playedConn = sound.Played:Connect(function() attemptError404ForSound(sound) end)
    local propConn = sound:GetPropertyChangedSignal("IsPlaying"):Connect(function()
        if sound.IsPlaying then attemptError404ForSound(sound) end
    end)
    local destroyConn
    destroyConn = sound.Destroying:Once(function()
        playedConn:Disconnect()
        propConn:Disconnect()
        EsoundHooks[sound] = nil
        EsoundTriggeredUntil[sound] = nil
    end)
    EsoundHooks[sound] = true
    if sound.IsPlaying then attemptError404ForSound(sound) end
end

-- Hook existing + future sounds
for _, s in ipairs(game:GetDescendants()) do
    if s:IsA("Sound") then hookSound(s) end
end
game.DescendantAdded:Connect(function(d)
    if d:IsA("Sound") then hookSound(d) end
end)

-- Noli (thing)
local function setupCharacter(character)
    local Humanoid = character:WaitForChild("Humanoid")
    local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- You can store them in globals used by your override logic
    _G.Humanoid = Humanoid
    _G.HumanoidRootPart = HumanoidRootPart
end

if lp.Character then
    setupCharacter(lp.Character)
end

local ORIGINAL_DASH_SPEED = 60

local isOverrideActive = false
local connection

local function startOverride()

    
    if isOverrideActive then return end
    isOverrideActive = true

    -- Connect a loop to force the character to move forward
    connection = RunService.RenderStepped:Connect(function()
        local humanoid = _G.Humanoid
        local rootPart = _G.HumanoidRootPart
        if not humanoid or not rootPart then return end
    
        humanoid.WalkSpeed = ORIGINAL_DASH_SPEED
        humanoid.AutoRotate = false
    
        local direction = rootPart.CFrame.LookVector
        local horizontal = Vector3.new(direction.X, 0, direction.Z)
        if horizontal.Magnitude > 0 then
            humanoid:Move(horizontal.Unit)
        end
    end)
end

local function stopOverride()
    
    if not isOverrideActive then return end
    isOverrideActive = false
    
    local humanoid = _G.Humanoid
    local rootPart = _G.HumanoidRootPart
    
    -- Restore original settings
    humanoid.WalkSpeed = 16 -- Or whatever your default walk speed is
    humanoid.AutoRotate = true
    humanoid:Move(Vector3.new(0, 0, 0)) -- Stop the character from moving
    
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

-- Main loop to detect when to activate and deactivate the override
RunService.RenderStepped:Connect(function()
    if voidrushcontrol == false then return end
    
    local char = _G.Humanoid and _G.Humanoid.Parent
    local voidRushState = char and char:GetAttribute("VoidRushState")

    if voidRushState == "Dashing" then
        startOverride()
    else
        stopOverride()
    end
end)

lp.CharacterAdded:Connect(function(character)
    setupCharacter(character)
end)

-- ultra instinct (thing)
local function notify(msg)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Ultra Instinct",
            Text = msg,
            Duration = 2
        })
    end)
end

-- do the actual dodge
local function playDodge(distance)
    if not canDodge then return end
    canDodge = false

    local char = lp.Character
    if not char then
        canDodge = true
        return
    end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then
        canDodge = true
        return
    end

    local dir = directions[currentDirection] or "Left"
    if dir == "Random" then
        local options = {"Left", "Right", "Forward", "Backward"}
        dir = options[math.random(1, #options)]
    end

    local dist = tonumber(distance) or 7
    local offset = Vector3.new()
    if dir == "Left" then
        offset = -hrp.CFrame.RightVector * dist
    elseif dir == "Right" then
        offset = hrp.CFrame.RightVector * dist
    elseif dir == "Forward" then
        offset = hrp.CFrame.LookVector * dist
    elseif dir == "Backward" then
        offset = -hrp.CFrame.LookVector * dist
    end

    -- play anim safely
    local ok, track = pcall(function()
        local anim = Instance.new("Animation")
        anim.AnimationId = dodgeAnims[dir] or ""
        return hum:LoadAnimation(anim)
    end)
    if ok and track then
        pcall(function() track:Play() end)
    end

    -- small teleport/pivot
    pcall(function()
        char:PivotTo(CFrame.new(hrp.Position + offset))
    end)

    -- cooldown
    task.delay(1.7, function() -- match your previous ~2s cooldown but slightly shorter for responsiveness
        canDodge = true
    end)
end

-- start/stop detection connection
local function startUltra(distance)
    if ultraConn then return end
    ultraConn = RunService.Heartbeat:Connect(function()
        if not ultraInstinctEnabled then return end
        local char = lp.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local radius = 25 -- detection radius (can be made a UI input below)

        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (plr.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                if dist <= radius then
                    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                    local animator = hum and hum:FindFirstChildOfClass("Animator")
                    if animator then
                        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                            local animObj = track.Animation
                            if animObj and animObj.AnimationId then
                                local animId = tostring(animObj.AnimationId):match("%d+")
                                -- reuse the hub's autoBlockTriggerAnims list (already defined in ALLINONE)
                                if animId and autoBlockTriggerAnims and table.find(autoBlockTriggerAnims, animId) then
                                    if tick() - lastNotifTime >= notifCooldown then
                                        lastNotifTime = tick()
                                    end
                                    if ultraInstinctEnabled and canDodge then
                                        playDodge(distance)
                                    end
                                    return
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end

local function stopUltra()
    if ultraConn then
        ultraConn:Disconnect()
        ultraConn = nil
    end
end

-- Esp
local function getRootPart(model)
    if model:FindFirstChild("HumanoidRootPart") then
        return model.HumanoidRootPart
    elseif model:FindFirstChild("Torso") then
        return model.Torso
    elseif model:FindFirstChild("UpperTorso") then
        return model.UpperTorso
    else
        return model:FindFirstChildWhichIsA("BasePart")  -- fallback
    end
end

local function applyHighlight(obj, color)
    if obj:IsA("Model") or obj:IsA("BasePart") then
        local target = obj:IsA("Model") and obj:FindFirstChildWhichIsA("BasePart") or obj
        if target and not target:FindFirstChild("ESP_Highlight") then
            local h = Instance.new("Highlight")
            h.Name = "ESP_Highlight"
            h.FillColor = color
            h.OutlineColor = Color3.new(0, 0, 0)
            h.FillTransparency = 0.5
            h.OutlineTransparency = 0
            h.Adornee = obj
            h.Parent = target
        end
    end
end

-- Put this near the top with the other toggles/helpers

local function applyESPWithText(obj, color, labelText)
    local target = obj:IsA("Model") and getRootPart(obj) or obj
    if not target then return end

    -- Highlight
    if not target:FindFirstChild("ESP_Highlight") then
        local h = Instance.new("Highlight")
        h.Name = "ESP_Highlight"
        h.FillColor = color
        h.OutlineColor = Color3.new(0, 0, 0)
        h.FillTransparency = 0.5
        h.OutlineTransparency = 0
        h.Adornee = obj
        h.Parent = target
    end

    -- Billboard Text
    if not target:FindFirstChild("ESP_Billboard") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_Billboard"
        billboard.Adornee = target -- attach to root part
        billboard.Size = UDim2.new(0, 100, 0, 30)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1,0,1,0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = color
        textLabel.TextStrokeTransparency = 0
        textLabel.TextScaled = false -- turn off auto-scale
        textLabel.TextSize = 10 -- pick a font size
        textLabel.Text = labelText or obj.Name
        textLabel.Parent = billboard

        billboard.Parent = target
    end
end

local espConnections = { Items = {}, Generators = {} }

-- Removes highlights from a single object
local function removeHighlight(obj)
    if not obj then return end
    for _, v in ipairs(obj:GetDescendants()) do
        if v:IsA("Highlight") and v.Name == "ESP_Highlight" then
            v:Destroy()
        end
    end
end

-- Removes all highlights from a parent
local function removeHighlights(parent)
    for _, v in ipairs(parent:GetDescendants()) do
        if (v:IsA("Highlight") and v.Name == "ESP_Highlight") or
           (v:IsA("BillboardGui") and v.Name == "ESP_Billboard") then
            v:Destroy()
        end
    end
end

-- Stops watching for ESP updates
local function stopWatching(key)
    if espConnections[key] then
        for _, conn in ipairs(espConnections[key]) do
            conn:Disconnect()
        end
        espConnections[key] = {}
    end
end

-- Function you already have
local function GeneratorOnce()
    local IngameMapFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
    local SubMapFolder = IngameMapFolder and IngameMapFolder:FindFirstChild("Map")
    if SubMapFolder then
        for _, g in ipairs(SubMapFolder:GetChildren()) do
            if g.Name == "Generator" and g.Progress.Value < 100 then
                g.Remotes.RE:FireServer()
            end
        end
    end
end

-- chance aimbot (thing)
local function getValidTarget()
    local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
    if killersFolder then
        for _, name in ipairs(aimTargets) do
            local target = killersFolder:FindFirstChild(name)
            if target and target:FindFirstChild("HumanoidRootPart") then
                return target.HumanoidRootPart
            end
        end
    end
    return nil
end

local function getPlayingAnimationIds()
    local ids = {}
    if Humanoid then
        for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
            if track.Animation and track.Animation.AnimationId then
                local id = track.Animation.AnimationId:match("%d+")
                if id then
                    ids[id] = true
                end
            end
        end
    end
    return ids
end

local function lsetupCharacter(char)
    lHumanoid = char:WaitForChild("Humanoid")
    lHRP = char:WaitForChild("HumanoidRootPart")
end

if lp.Character then
    lsetupCharacter(lp.Character)
end
lp.CharacterAdded:Connect(lsetupCharacter)

-- BEFORE: uses Humanoid, HRP inconsistently
-- AFTER: use lHumanoid and lHRP consistently
RunService.RenderStepped:Connect(function()
    if not chanceactive or not lHumanoid or not lHRP then return end

    local playing = getPlayingAnimationIds()
    local triggered = false
    for id in pairs(trackedAnimations) do
        if playing[id] then
            triggered = true
            break
        end
    end

    if triggered then
        lastTriggerTime = tick()
        aiming = true
    end

    if aiming and tick() - lastTriggerTime <= aimDuration then
        if not originalWS then
            originalWS = lHumanoid.WalkSpeed
            originalJP = lHumanoid.JumpPower
            originalAutoRotate = lHumanoid.AutoRotate
        end

        -- Freeze but keep upright
        lHumanoid.AutoRotate = false
        lHRP.AssemblyAngularVelocity = Vector3.zero

        local targetHRP = getValidTarget()
        if targetHRP then
            local chancepredictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * chanceprediction)
            local direction = (chancepredictedPos - lHRP.Position).Unit
            local yRot = math.atan2(-direction.X, -direction.Z)
            lHRP.CFrame = CFrame.new(lHRP.Position) * CFrame.Angles(0, yRot, 0)
        end
    elseif aiming then
        aiming = false
        if originalWS and originalJP and originalAutoRotate ~= nil then
            lHumanoid.WalkSpeed = originalWS
            lHumanoid.JumpPower = originalJP
            lHumanoid.AutoRotate = originalAutoRotate
            originalWS, originalJP, originalAutoRotate = nil, nil, nil
        end
    end
end)

-- Guest 1337 (thing)
local cachedPlayerGui = PlayerGui
local cachedPunchBtn, cachedBlockBtn, cachedCharges, cachedCooldown = nil, nil, nil, nil
local detectionRangeSq = detectionRange * detectionRange

local function refreshUIRefs()
    -- ensure we have the most up-to-date references for MainUI and ability buttons
    cachedPlayerGui = lp:FindFirstChild("PlayerGui") or PlayerGui
    local main = cachedPlayerGui and cachedPlayerGui:FindFirstChild("MainUI")
    if main then
        local ability = main:FindFirstChild("AbilityContainer")
        cachedPunchBtn = ability and ability:FindFirstChild("Punch")
        cachedBlockBtn = ability and ability:FindFirstChild("Block")
        cachedCharges = cachedPunchBtn and cachedPunchBtn:FindFirstChild("Charges")
        cachedCooldown = cachedBlockBtn and cachedBlockBtn:FindFirstChild("CooldownTime")
    else
        cachedPunchBtn, cachedBlockBtn, cachedCharges, cachedCooldown = nil, nil, nil, nil
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

lp.CharacterAdded:Connect(function()
    task.delay(0.5, refreshUIRefs)
end)

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

local function fireRemoteBlock()
local args = {"UseActorAbility", "Block"}
ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function fireRemotePunch()
local args = {"UseActorAbility", "Punch"}
ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function isFacing(localRoot, targetRoot)
    if not facingCheckEnabled then
        return true
    end

    local dir = (localRoot.Position - targetRoot.Position).Unit
    local dot = targetRoot.CFrame.LookVector:Dot(dir)
    return looseFacing and dot > -0.3 or dot > 0
end

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

    -- Stop other known anims
    for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
        local animNum = tostring(track.Animation.AnimationId):match("%d+")
        if table.find(isPunch and punchAnimIds or blockAnimIds, animNum) then
            track:Stop()
        end
    end

    -- Create and load the animation
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. animId

    local success, track = pcall(function()
        return Humanoid:LoadAnimation(anim)
    end)

    if success and track then
        print("✅ Playing custom " .. (isPunch and "punch" or "block") .. " animation:", animId)
        track:Play()
        if isPunch then
            lastPunchTime = now
        else
            lastBlockTime = now
        end
    else
        warn("❌ Failed to load or play custom animation: " .. animId)
    end
end

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

local function extractNumericSoundId(sound)
    if not sound or not sound.SoundId then return nil end
    local sid = tostring(sound.SoundId)

    -- Prefer numeric id if present
    local num = sid:match("%d+")
    if num then return num end

    -- Fallbacks (these won't match your numeric whitelist, but kept for completeness)
    local hash = sid:match("[&%?]hash=([^&]+)")
    if hash then return "&hash="..hash end
    local path = sid:match("rbxasset://sounds/.+")
    if path then return path end

    return nil
end

local function getSoundWorldPosition(sound)
    if not sound then return nil end
    if sound.Parent and sound.Parent:IsA("BasePart") then
        return sound.Parent.Position, sound.Parent
    end
    if sound.Parent and sound.Parent:IsA("Attachment") and sound.Parent.Parent and sound.Parent.Parent:IsA("BasePart") then
        return sound.Parent.Parent.Position, sound.Parent.Parent
    end
    -- deep search for any BasePart ancestor/descendant
    local found = sound.Parent and sound.Parent:FindFirstChildWhichIsA("BasePart", true)
    if found then
        return found.Position, found
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

local function attemptBlockForSound(sound)
    if not autoBlockAudioOn then return end
    if not sound or not sound:IsA("Sound") then return end
    if not sound.IsPlaying then return end

    -- id early (string of digits)
    local id = extractNumericSoundId(sound)
    if not id or not autoBlockTriggerSounds[id] then return end

    -- throttle per-sound
    local t = tick()
    if soundBlockedUntil[sound] and t < soundBlockedUntil[sound] then return end

    -- get my root fast
    local myChar = lp.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    -- get world position and part
    local soundPos, soundPart = getSoundWorldPosition(sound)
    if not soundPos or not soundPart then return end

    -- quick check: is sound coming from a player character (not an object/environment)
    local char = getCharacterFromDescendant(soundPart)
    local plr = char and Players:GetPlayerFromCharacter(char)
    if not plr or plr == lp then return end

    -- get the originating HRP and compare squared distance
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local dvec = hrp.Position - myRoot.Position
    local distSq = dvec.X * dvec.X + dvec.Y * dvec.Y + dvec.Z * dvec.Z
    if distSq > detectionRangeSq then
        return
    end

    -- block cooldown UI check (cached)
    if cachedCooldown and cachedCooldown.Text ~= "" then
        return
    end

    -- facing check (use the same existing function)
    if facingCheckEnabled and not isFacing(myRoot, hrp) then
        return
    end

    -- all checks passed -> block
    fireRemoteBlock()

    -- double tech if enabled and cachedCharges present
    if doubleblocktech and cachedCharges and cachedCharges.Text == "1" then
        fireRemotePunch()
    end

    -- throttle this sound for a short time to avoid spamming
    soundBlockedUntil[sound] = t + 1.2
end

local function hookSound(sound)
    if not sound or not sound:IsA("Sound") then return end
    if soundHooks[sound] then return end -- already hooked

    local playedConn = sound.Played:Connect(function()
        -- handle immediate play
        pcall(attemptBlockForSound, sound)
    end)

    local propConn = sound:GetPropertyChangedSignal("IsPlaying"):Connect(function()
        if sound.IsPlaying then
            pcall(attemptBlockForSound, sound)
        end
    end)

    local destroyConn
    destroyConn = sound.Destroying:Connect(function()
        -- cleanup
        if playedConn and playedConn.Connected then playedConn:Disconnect() end
        if propConn and propConn.Connected then propConn:Disconnect() end
        if destroyConn and destroyConn.Connected then destroyConn:Disconnect() end
        soundHooks[sound] = nil
        soundBlockedUntil[sound] = nil
    end)

    soundHooks[sound] = {playedConn, propConn, destroyConn}

    -- If it's already playing right now, check it immediately
    if sound.IsPlaying then
        task.spawn(function() pcall(attemptBlockForSound, sound) end)
    end
end

-- Hook existing Sounds across the game (covers workspace, SoundService, Lighting, etc.)
for _, desc in ipairs(game:GetDescendants()) do
    if desc:IsA("Sound") then
        pcall(hookSound, desc)
    end
end

-- Hook any future Sounds
game.DescendantAdded:Connect(function(desc)
    if desc:IsA("Sound") then
        pcall(hookSound, desc)
    end
end)
-- ===== End Robust Sound Auto Block =====

-- Auto block + punch detection loop
RunService.RenderStepped:Connect(function()
    local gui = PlayerGui:FindFirstChild("MainUI")
    local punchBtn = gui and gui:FindFirstChild("AbilityContainer") and gui.AbilityContainer:FindFirstChild("Punch")
    local charges = punchBtn and punchBtn:FindFirstChild("Charges")

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
                                    fireRemoteBlock()
                                end
                                if doubleblocktech == true and charges and charges.Text == "1" then
                                    fireRemotePunch()
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Detect if player is playing a block animation, and blockTP is enabled
    if blockTPEnabled and Humanoid and tick() - lastBlockTpTime >= 5 then
        for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
            local animId = tostring(track.Animation.AnimationId):match("%d+")
            if animId == "72722244508749" or animId == "96959123077498" then
                local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    local killers = {"c00lkidd", "Jason", "JohnDoe", "1x1x1x1", "Noli"}
                    for _, name in ipairs(killers) do
                        local killer = workspace:FindFirstChild("Players")
                            and workspace.Players:FindFirstChild("Killers")
                            and workspace.Players.Killers:FindFirstChild(name)

                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            lastBlockTpTime = tick()

                            task.spawn(function()
                                local startTime = tick()
                                while tick() - startTime < 0.5 do
                                    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                                        local myRoot = lp.Character.HumanoidRootPart
                                        local targetHRP = killer.HumanoidRootPart
                                        local direction = targetHRP.CFrame.LookVector
                                        local tpPosition = targetHRP.Position + direction * 6
                                        myRoot.CFrame = CFrame.new(tpPosition)
                                    end
                                    task.wait()
                                end
                            end)

                            break
                        end
                    end
                end
                break
            end
        end
    end

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
        local gui = PlayerGui:FindFirstChild("MainUI")
        local punchBtn = gui and gui:FindFirstChild("AbilityContainer") and gui.AbilityContainer:FindFirstChild("Punch")
        local charges = punchBtn and punchBtn:FindFirstChild("Charges")

        if charges and charges.Text == "1" then
            for _, name in ipairs(killerNames) do
                local killer = workspace:FindFirstChild("Players")
                    and workspace.Players:FindFirstChild("Killers")
                    and workspace.Players.Killers:FindFirstChild(name)

                if killer and killer:FindFirstChild("HumanoidRootPart") then
                    local root = killer.HumanoidRootPart
                    
                    if root and myRoot and (root.Position - myRoot.Position).Magnitude <= 10 then
                        -- Trigger punch GUI button
                        for _, conn in ipairs(getconnections(punchBtn.MouseButton1Click)) do
                            pcall(function()
                                conn:Fire()
                            end)
                        end

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
                        if table.find(punchAnimIds, animId) or (customPunchAnimId ~= "" and animId == tostring(customPunchAnimId)) then

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

-- Cooldown tracking for ea
--ch replacement type
local lastReplaceTime = {
    block = 0,
    punch = 0,
    charge = 0,
}

-- Continuous custom animation replacer (runs forever if toggled on)
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

                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customPunchAnimId
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()
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
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()
                    break
                end
            end
        end
    end
end)

-- Gui
-- generator tab
tabGenerators:CreateToggle({
    Name = "Auto Generator",
    CurrentValue = false,
    Flag = "AutoGen",
    Callback = function(enabled)
        -- Stop any previous loop
        if espConnections["AutoGenLoop"] then
            espConnections["AutoGenLoop"]:Disconnect()
            espConnections["AutoGenLoop"] = nil
        end

        if enabled then
            espConnections["_AutoGenTimer"] = 0
            espConnections["AutoGenLoop"] = game:GetService("RunService").Heartbeat:Connect(function(delta)
                espConnections["_AutoGenTimer"] = espConnections["_AutoGenTimer"] + delta
                if espConnections["_AutoGenTimer"] >= generatorCooldown then
                    espConnections["_AutoGenTimer"] = 0
                    GeneratorOnce()
                end
            end)
        else
            espConnections["_AutoGenTimer"] = 0
        end
    end
})

-- Slider to adjust cooldown
tabGenerators:CreateSlider({
    Name = "Auto Generator delay",
    Range = {2.5, 10},  -- min 2.5s, max 10s
    Increment = 0.1,
    Suffix = "s",
    CurrentValue = generatorCooldown,
    Flag = "GeneratorCooldown",
    Callback = function(value)
        generatorCooldown = value
    end
})

-- Add button to Generators tab
tabGenerators:CreateButton({
    Name = "Do Generator",
    Callback = function()
        GeneratorOnce()
    end
})

-- esp
tabESP:CreateToggle({
    Name = "Killers",
    CurrentValue = false,
    Flag = "ESP_Killers",
    Callback = function(enabled)
        local folder = game.Workspace:FindFirstChild("Players") and game.Workspace.Players:FindFirstChild("Killers")
        if not folder then return end
        if enabled then
            for _, obj in ipairs(folder:GetChildren()) do
                applyESPWithText(obj, Color3.fromRGB(255, 0, 0), "Killer")
            end
            folder.ChildAdded:Connect(function(child)
                applyESPWithText(child, Color3.fromRGB(255, 0, 0), "Killer")
            end)
        else
            removeHighlights(folder)
        end
    end
})

tabESP:CreateToggle({
    Name = "Survivors",
    CurrentValue = false,
    Flag = "ESP_Survivors",
    Callback = function(enabled)
        local folder = game.Workspace:FindFirstChild("Players") and game.Workspace.Players:FindFirstChild("Survivors")
        if not folder then return end
        if enabled then
            for _, obj in ipairs(folder:GetChildren()) do
                applyESPWithText(obj, Color3.fromRGB(0, 0, 255), "Survivor")
            end
            folder.ChildAdded:Connect(function(child)
                applyESPWithText(child, Color3.fromRGB(0, 0, 255), "Survivor")
            end)
        else
            removeHighlights(folder)
        end
    end
})

tabESP:CreateToggle({
    Name = "Items",
    CurrentValue = false,
    Flag = "ESP_Items",
    Callback = function(enabled)
        stopWatching("Items")

        local function startItemsESP(path)
            for _, obj in ipairs(path:GetChildren()) do
                if obj.Name == "BloxyCola" or obj.Name == "Medkit" then
                    applyESPWithText(obj, Color3.fromRGB(0, 255, 0), "Item")
                end
            end

            table.insert(espConnections["Items"], path.ChildAdded:Connect(function(child)
                if child.Name == "BloxyCola" or child.Name == "Medkit" then
                    applyESPWithText(child, Color3.fromRGB(0, 255, 0), "Item")
                end
            end))

            table.insert(espConnections["Items"], path.ChildRemoved:Connect(function(child)
                removeHighlight(child)
            end))
        end

        if enabled then
            table.insert(espConnections["Items"], game:GetService("RunService").Heartbeat:Connect(function()
                local path = workspace:FindFirstChild("Map")
                    and workspace.Map:FindFirstChild("Ingame")
                    and workspace.Map.Ingame:FindFirstChild("Map")

                if path and not espConnections["Items"]._activePath then
                    espConnections["Items"]._activePath = path
                    startItemsESP(path)
                elseif not path and espConnections["Items"]._activePath then
                    espConnections["Items"]._activePath = nil
                end
            end))
        else
            local path = workspace:FindFirstChild("Map")
                and workspace.Map:FindFirstChild("Ingame")
                and workspace.Map.Ingame:FindFirstChild("Map")
            if path then removeHighlights(path) end
        end
    end
})

tabESP:CreateToggle({
    Name = "Generators",
    CurrentValue = false,
    Flag = "ESP_Generators",
    Callback = function(enabled)
        stopWatching("Generators")
        local function startGeneratorsESP(path)
            local function highlightGenerators()
                for _, obj in ipairs(path:GetChildren()) do
                    if obj.Name == "Generator" then
                        applyESPWithText(obj, Color3.fromRGB(255,255,0), "Generator")
                    end
                end
            end
            highlightGenerators()
            table.insert(espConnections["Generators"], path.ChildAdded:Connect(function(child)
                if child.Name == "Generator" then
                    applyESPWithText(child, Color3.fromRGB(255, 255, 0), "Generator")
                end
            end))
            table.insert(espConnections["Generators"], path.ChildRemoved:Connect(function(child)
                removeHighlight(child)
            end))
        end
        if enabled then
            table.insert(espConnections["Generators"], game.Workspace.DescendantAdded:Connect(function(desc)
                if desc.Name == "Map" and desc.Parent and desc.Parent.Name == "Ingame" then
                    local mapPath = game.Workspace:FindFirstChild("Map")
                    if mapPath and mapPath:FindFirstChild("Ingame") and mapPath.Ingame:FindFirstChild("Map") then
                        startGeneratorsESP(mapPath.Ingame.Map)
                    end
                end
            end))
            local path = game.Workspace:FindFirstChild("Map")
                        and game.Workspace.Map:FindFirstChild("Ingame")
                        and game.Workspace.Map.Ingame:FindFirstChild("Map")
            if path then
                startGeneratorsESP(path)
            end
        else
            local path = game.Workspace:FindFirstChild("Map")
                        and game.Workspace.Map:FindFirstChild("Ingame")
                        and game.Workspace.Map.Ingame:FindFirstChild("Map")
            if path then
                removeHighlights(path)
            end
        end
    end
})

-- killers tab

-- john doe (killers)
KillersTab:CreateParagraph({
    Title = "John Doe",
    Content = "section"
})

KillersTab:CreateToggle({
Name = "Auto Error 404",
CurrentValue = false,
Flag = "johntoeautoerror404state",
Callback = function(Value) autoErrorEnabled = Value end
})

KillersTab:CreateInput({
Name = "Range",
PlaceholderText = "14",
RemoveTextAfterFocusLost = false,
Flag = "johntoeerror404rangetextskibididopdopdopyesyes",
Callback = function(Text)
ErrordetectionRange = tonumber(Text) or ErrordetectionRange
end
})

-- noli (Killers)
KillersTab:CreateParagraph({
    Title = "Noli",
    Content = "section"
})

KillersTab:CreateToggle({
Name = "void rush control",
CurrentValue = false,
Flag = "nolivoidrushcontroltogglestate",
Callback = function(Value) voidrushcontrol = Value end
})

-- survivors tab

SurvivorsTab:CreateParagraph({
    Title = "Shedletsky",
    Content = "section"
})

-- shedletsky (survivors)
SurvivorsTab:CreateToggle({
    Name = "Auto Slash",
    CurrentValue = false,
    Flag = "AutoSlashToggle",
    Callback = function(val)
        autoSlash = val
    end,
})

SurvivorsTab:CreateSlider({
    Name = "Range",
    Range = {1, 25},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = slashRange,
    Flag = "SlashRange",
    Callback = function(val)
        slashRange = val
    end,
})

-- chance (survivors)
SurvivorsTab:CreateParagraph({
    Title = "Chance",
    Content = "section"
})

SurvivorsTab:CreateToggle({
Name = "Chance Aimbot",
CurrentValue = false,
Flag = "Aimbotchancetoggle",
Callback = function(Value) chanceactive = Value end
})

SurvivorsTab:CreateInput({
Name = "Aim Prediction",
PlaceholderText = "4",
RemoveTextAfterFocusLost = false,
Flag = "Chanceaimprediction",
Callback = function(Text)
chanceprediction = tonumber(Text) or chanceprediction
end
})

-- Guest 1337 (survivors)
SurvivorsTab:CreateParagraph({
    Title = "Guest 1337",
    Content = "guest 1337 section"
})
SurvivorsTab:CreateToggle({
Name = "Auto Block (Animation)",
CurrentValue = false,
Flag = "AutoBlockAnimation",
Callback = function(Value) autoBlockOn = Value end
})

-- Rayfield toggle for Auto Block (Audio)
SurvivorsTab:CreateToggle({
    Name = "Auto Block (Audio)",
    CurrentValue = false,
    Flag = "AutoBlockAudio",
    Callback = function(state)
        autoBlockAudioOn = state
    end,
})

SurvivorsTab:CreateToggle({
    Name = "Double Punch Tech",
    CurrentValue = false,
    Flag = "doubleblockTechtoggle",
    Callback = function(state)
        doubleblocktech = state
    end,
})

SurvivorsTab:CreateParagraph({
    Title = "Recomendation",
    Content = "use audio auto block and use 20 range for it"
})

SurvivorsTab:CreateToggle({
    Name = "Enable Facing Check",
    CurrentValue = true,
    Flag = "FacingCheckToggle",
    Callback = function(Value)
        facingCheckEnabled = Value
    end
})

SurvivorsTab:CreateDropdown({
Name = "Facing Check",
Options = {"Loose", "Strict"},
CurrentOption = "Loose",
Flag = "FacingCheckMode",
Callback = function(Option) looseFacing = Option == "Loose" end
})

SurvivorsTab:CreateInput({
Name = "Detection Range",
PlaceholderText = "18",
RemoveTextAfterFocusLost = false,
Flag = "DetectionRange",
Callback = function(Text)
detectionRange = tonumber(Text) or detectionRange
detectionRangeSq = detectionRange * detectionRange
end
})

SurvivorsTab:CreateToggle({
    Name = "Range Visual",
    CurrentValue = false,
    Flag = "KillerCircleToggle",
    Callback = function(state)
        killerCirclesVisible = state
        refreshKillerCircles()
    end
})

SurvivorsTab:CreateParagraph({
    Title = "⚠️ Warning",
    Content = "DONT USE FAKE BLOCK WHILE USING BLOCK TP"
})

SurvivorsTab:CreateParagraph({
    Title = "",
    Content = "INCREASE RANGE WHEN UR USING BLOCK TP TOO, ATLEAST LIKE 30 OR SMTH"
})

SurvivorsTab:CreateToggle({
    Name = "Block TP",
    CurrentValue = false,
    Callback = function(Value)
        blockTPEnabled = Value
    end
})

SurvivorsTab:CreateParagraph({
    Title = "Predictive Auto block",
    Content = "Section"
})

SurvivorsTab:CreateToggle({
    Name = "Predictive Auto Block",
    CurrentValue = false,
    Callback = function(Value)
        predictiveBlockOn = Value
    end,
})

SurvivorsTab:CreateInput({
    Name = "Detection Range",
    PlaceholderText = "18",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local num = tonumber(text)
        if num then
            detectionRange = num
        end
    end,
})


SurvivorsTab:CreateSlider({
    Name = "Edge Killer",
    Range = {0, 7},
    Increment = 0.1,
    CurrentValue = 3,
    Flag = "edgekillerlmao",
    Callback = function(val)
        edgeKillerDelay = val
    end,
})

SurvivorsTab:CreateParagraph({
    Title = "Edge Killer",
    Content = "how many secs until it blocks (resets when killer gets out of range)"
})



SurvivorsTab:CreateParagraph({
    Title = "Auto punch",
    Content = "Section"
})

SurvivorsTab:CreateToggle({
Name = "Auto Punch",
CurrentValue = false,
Flag = "AutoPunchToggle",
Callback = function(Value) autoPunchOn = Value end
})

SurvivorsTab:CreateToggle({
Name = "Fling Punch",
CurrentValue = false,
Callback = function(Value) flingPunchOn = Value end
})

SurvivorsTab:CreateToggle({
Name = "Punch Aimbot",
CurrentValue = false,
Flag = "PunchAimToggle",
Callback = function(Value) aimPunch = Value end
})

SurvivorsTab:CreateSlider({
    Name = "Aim Prediction",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = predictionValue,
    Flag = "PredictionSlider",
    Callback = function(Value)
        predictionValue = Value
    end,
})

SurvivorsTab:CreateSlider({
Name = "Fling Power",
Range = {5000, 50000000000000},
Increment = 1000000,
CurrentValue = 10000,
Flag = "FlingPower",
Callback = function(Value) flingPower = Value end
})

-- two time (survivors)

SurvivorsTab:CreateParagraph({
    Title = "Two Time",
    Content = "Section"
})

SurvivorsTab:CreateButton({
    Name = "Load Auto backstab",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-backstab-two-time/refs/heads/main/Auto%20backstab%20v2"))()
    end
})


-- custom anim tab

-- Guest 1337 (custom anim)
CustomAnimTab:CreateParagraph({
    Title = "Guest 1337",
    Content = "Section"
})

-- Custom Block Animation
CustomAnimTab:CreateInput({
    Name = "Custom Block Animation",
    PlaceholderText = "AnimationId",
    RemoveTextAfterFocusLost = false,
    Flag = "customblockid",
    Callback = function(Text) customBlockAnimId = Text end
})

CustomAnimTab:CreateToggle({
Name = "Enable Custom Block Animation",
CurrentValue = false,
Callback = function(Value) customBlockEnabled = Value end
})

CustomAnimTab:CreateInput({
    Name = "Custom Punch Animation (not for M3/M4)",
    PlaceholderText = "AnimationId",
    RemoveTextAfterFocusLost = false,
    Flag = "custompunchid",
    Callback = function(Text) customPunchAnimId = Text end
})

CustomAnimTab:CreateToggle({
Name = "Enable Custom Punch Animation",
CurrentValue = false,
Callback = function(Value) customPunchEnabled = Value end
})

CustomAnimTab:CreateInput({
    Name = "Charge Animation ID",
    PlaceholderText = "Put animation ID here",
    RemoveTextAfterFocusLost = false,
    Flag = "customchargeid",
    Callback = function(input)
        customChargeAnimId = input
    end,
})

CustomAnimTab:CreateToggle({
    Name = "Custom Charge Animation",
    CurrentValue = false,
    Callback = function(value)
        customChargeEnabled = value
    end,
})

-- player tab
PlayerTab:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "InfStamina",
    Callback = function(value)
        infiniteStamina = value
        if infiniteStamina then
            enableInfiniteStamina()
        else
            local success, StaminaModule = pcall(function()
                return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
            end)
            if success and StaminaModule then
                StaminaModule.StaminaLossDisabled = false
            end
        end
    end
})


-- ragebait tab
RagebaitTab:CreateParagraph({
    Title = "ragebait",
    Content = "Section"
})

-- reach hitbox (ragebait)
RagebaitTab:CreateToggle({
    Name = "Forsaken Reach",
    CurrentValue = false,
    Flag = "ForsakenReachToggle",
    Callback = function(state)
        ForsakenReachEnabled = state
    end
})

RagebaitTab:CreateSlider({
    Name = "Reach Distance",
    Range = {10, 1000},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = ForsakenNearestDist,
    Flag = "ForsakenReachSlider",
    Callback = function(val)
        ForsakenNearestDist = val
    end
})

RagebaitTab:CreateParagraph({
    Title = "-",
    Content = ""
})

-- ultra instinct (ragebait)
RagebaitTab:CreateToggle({
    Name = "Ultra Instinct",
    CurrentValue = false,
    Flag = "UltraInstinctToggle",
    Callback = function(state)
        ultraInstinctEnabled = state
        if state then
            startUltra(dodgeDistanceInput and tonumber(dodgeDistanceInput) or 7)
            notify("ON")
        else
            stopUltra()
            notify("OFF")
        end
    end
})

-- Distance input
RagebaitTab:CreateInput({
    Name = "Dodge Distance (studs)",
    PlaceholderText = "7",
    RemoveTextAfterFocusLost = false,
    Flag = "UltraDodgeDistance",
    Callback = function(Text)
        dodgeDistanceInput = Text
    end
})

-- Direction dropdown (lets users choose initial direction)
RagebaitTab:CreateDropdown({
    Name = "Dodge Direction",
    Options = directions,
    CurrentOption = currentDirectionOption,
    Flag = "UltraDodgeDirection",
    Callback = function(option)
        for i, v in ipairs(directions) do
            if v == option then currentDirection = i break end
        end
    end
})

-- Quick switch button (cycles direction)
RagebaitTab:CreateButton({
    Name = "Quick Direction Change",
    Callback = function()
        currentDirection = (currentDirection % #directions) + 1
        notify("Direction -> ".. directions[currentDirection])
    end
})

RagebaitTab:CreateParagraph({
    Title = "-",
    Content = ""
})

-- Guest 1337 (ragebait)
RagebaitTab:CreateButton({
    Name = "Load Fake Block",
    Callback = function()
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
    end
})

-- Misc tab
-- fullbright (misc)
MiscTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = function(state)
        fullbrightEnabled = state
        if state then
            applyFullbright()
        else
            restoreFullbright()
        end
    end,
})

-- infinite yield (misc)
MiscTab:CreateButton({
    Name = "Run Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

-- Credits tab
CreditsTab:CreateParagraph({
    Title = "Creds",
    Content = "iyre - hitbox reach, @numantf2 on discord - noli void rush, @idkwhathappentoday on discord - shed auto slash, and most importantly, chatgpt."
})

-- Stuff on the end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if infiniteStamina then
        enableInfiniteStamina()
    end
end)

lp.AncestryChanged:Connect(function()
    if not lp:IsDescendantOf(game) then
        stopUltra()
    end
end)

lp.AncestryChanged:Connect(function(_, parent)
    if not parent then
        pcall(restoreFullbright)
    end
end)

Rayfield:LoadConfiguration()

-- end of script
