
writefile("AllBetsAreOff!.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/AllBetsAreOff!.mp3"))
writefile("Ashle.rbxmx", game:HttpGet("https://github.com/ian49972/RBXMS/raw/refs/heads/main/Ashle.rbxmx"))
writefile("ASHLE.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/ASHLE.mp3"))
writefile("AshIntro.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/AshIntro.mp3"))

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TS = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera

local player = Players.LocalPlayer

local function earlyDisableDefaultAnims(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    
    local animate = char:FindFirstChild("Animate")
    if animate then animate.Disabled = true end
    
    for _, child in hum:GetChildren() do
        if child:IsA("Animator") then
            child:Destroy()
        end
    end
end

if player.Character then
    earlyDisableDefaultAnims(player.Character)
end

player.CharacterAdded:Connect(earlyDisableDefaultAnims)

if not getgenv().Animator6DLoadedPro then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Stuff/refs/heads/main/Animator6D.lua"))()
    repeat task.wait() until getgenv().Animator6DLoadedPro
end

local Assets = game:GetObjects(getcustomasset("Ashle.rbxmx"))[1]
local ashleModel = Assets:WaitForChild("Ashle")
local keyframes = Instance.new("Folder")
keyframes.Name = "Keyframes"
keyframes.Parent = game.ReplicatedStorage

local idleSeq = ashleModel.AnimSaves.Idle:Clone()
idleSeq.Parent = keyframes
local walkSeq = ashleModel.AnimSaves.walk:Clone()
walkSeq.Parent = keyframes
local runSeq = ashleModel.AnimSaves.run:Clone()
runSeq.Parent = keyframes

local KeyframeAnims = {
    Idle = keyframes.Idle,
    Walk = keyframes.walk,
    Run = keyframes.run,
    DartAim = ashleModel.AnimSaves["dart aim"]:Clone(),
    DartShoot = ashleModel.AnimSaves["dart shoot"]:Clone(),
    Swing = ashleModel.AnimSaves.swing:Clone(),
    WatchCheck = ashleModel.AnimSaves["watch check"]:Clone(),
    DartToGun = ashleModel.AnimSaves["dart to gun"]:Clone(),
    GunAim = ashleModel.AnimSaves["gun aim"]:Clone(),
    GunShoot = ashleModel.AnimSaves["gun shoot"]:Clone()
}

for _, seq in pairs(KeyframeAnims) do
    seq.Parent = keyframes
end

local runToggle = false
local postalMode = false
local lmsPlayed = false
local character = nil
local humanoid = nil
local root = nil
local defaultWalkSpeed = 16
local runSpeed = 32
local animatorActive = true
local ambientSound = nil
local abilityActive = false

local Cooldowns = {
    Immobilizer = 0,
    Swing = 0,
    WatchCheck = 0,
    PostalMode = 0,
    Pulverizer = 0
}

local COOLDOWN_DURATION = 5

local SOUNDS = {
    PostalMode = "rbxassetid://76967049918562",
    WatchCheck = "rbxassetid://114044154979165",
    PulverizerAim = "rbxassetid://79414866376321",
    PulverizerShoot = "rbxassetid://92659527907614",
    Swing = "rbxassetid://140263722472191",
    ImmobilizerAim = "rbxassetid://79414866376321",
    ImmobilizerShoot = "rbxassetid://92379550706174"
}

local function playSound(id, volume)
    volume = volume or 0.8
    local sound = Instance.new("Sound")
    sound.SoundId = id
    sound.Volume = volume
    sound.Parent = workspace
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function isOnCooldown(name)
    return tick() < Cooldowns[name]
end

local function setCooldown(name)
    Cooldowns[name] = tick() + COOLDOWN_DURATION
end

local function cleanup()
    pcall(function()
        if getgenv().Animator6DStop then
            getgenv().Animator6DStop()
        end
    end)
end

local function getRightArm()
    return character and character:FindFirstChild("Right Arm")
end

local function getLeftArm()
    return character and character:FindFirstChild("Left Arm")
end

local function hidePartWithDecals(part, hide)
    part.Transparency = hide and 1 or 0
    for _, child in pairs(part:GetChildren()) do
        if child:IsA("Decal") or child:IsA("Texture") then
            child.Transparency = hide and 1 or 0
        end
    end
end

local function weldAccessories()
    local rightArm = getRightArm()
    local leftArm = getLeftArm()
    if not rightArm or not leftArm then return end
    
    local rigRightArm = ashleModel:WaitForChild("Right Arm")
    local rigLeftArm = ashleModel:WaitForChild("Left Arm")
    
    local dartGun = rigRightArm:WaitForChild("Dart_Gun"):Clone()
    local dartOffset = rigRightArm.CFrame:ToObjectSpace(dartGun.CFrame)
    dartGun.CFrame = rightArm.CFrame * dartOffset
    dartGun.Parent = rightArm
    local dartMotor = Instance.new("Motor6D")
    dartMotor.Name = "Dart_GunMotor"
    dartMotor.Part0 = rightArm
    dartMotor.Part1 = dartGun
    dartMotor.C0 = dartOffset
    dartMotor.C1 = CFrame.new()
    dartMotor.Parent = rightArm
    
    local gun2 = rigRightArm:WaitForChild("Gun_2"):Clone()
    local gun2Offset = rigRightArm.CFrame:ToObjectSpace(gun2.CFrame)
    gun2.CFrame = rightArm.CFrame * gun2Offset
    gun2.Parent = rightArm
    local gun2Motor = Instance.new("Motor6D")
    gun2Motor.Name = "Gun_2Motor"
    gun2Motor.Part0 = rightArm
    gun2Motor.Part1 = gun2
    gun2Motor.C0 = gun2Offset
    gun2Motor.C1 = CFrame.new()
    gun2Motor.Parent = rightArm
    
    local briefcase = rigLeftArm:WaitForChild("Briefcase"):Clone()
    local briefOffset = rigLeftArm.CFrame:ToObjectSpace(briefcase.CFrame)
    briefcase.CFrame = leftArm.CFrame * briefOffset
    briefcase.Parent = leftArm
    local briefMotor = Instance.new("Motor6D")
    briefMotor.Name = "BriefcaseMotor"
    briefMotor.Part0 = leftArm
    briefMotor.Part1 = briefcase
    briefMotor.C0 = briefOffset
    briefMotor.C1 = CFrame.new()
    briefMotor.Parent = leftArm
    
    local handle = rigLeftArm:WaitForChild("Handle"):Clone()
    local handleOffset = rigLeftArm.CFrame:ToObjectSpace(handle.CFrame)
    handle.CFrame = leftArm.CFrame * handleOffset
    handle.Parent = leftArm
    local handleWeld = Instance.new("WeldConstraint")
    handleWeld.Part0 = leftArm
    handleWeld.Part1 = handle
    handleWeld.Parent = leftArm
end

local function disableDefault()
    local animate = character:FindFirstChild("Animate")
    if animate then animate.Disabled = true end
    
    for _, child in humanoid:GetChildren() do
        if child:IsA("Animator") then child:Destroy() end
    end
end

local function pauseAnimations()
    animatorActive = false
    pcall(function()
        if getgenv().Animator6DStop then
            getgenv().Animator6DStop()
        end
    end)
end

local function resumeAnimations()
    animatorActive = true
    pcall(function()
        if humanoid and humanoid.Parent and humanoid.Health > 0 then
            updateAnimation()
        end
    end)
end

local function updateAnimation()
    if not animatorActive or abilityActive then return end
    if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then return end
    
    local moving = humanoid.MoveDirection.Magnitude > 0.01
    
    if moving then
        if runToggle then
            pcall(getgenv().Animator6D, KeyframeAnims.Run, 1, true)
            humanoid.WalkSpeed = runSpeed
        else
            pcall(getgenv().Animator6D, KeyframeAnims.Walk, 1, true)
            humanoid.WalkSpeed = defaultWalkSpeed
        end
    else
        pcall(getgenv().Animator6D, KeyframeAnims.Idle, 1, true)
        humanoid.WalkSpeed = defaultWalkSpeed
    end
end

local function playAbilityAnim(keyframe)
    abilityActive = true
    pauseAnimations()
    pcall(getgenv().Animator6D, keyframe, 1.1, false)
end

local function Immobilizer()
    if isOnCooldown("Immobilizer") or postalMode then return end
    setCooldown("Immobilizer")
    playSound(SOUNDS.ImmobilizerAim, 0.7)
    playAbilityAnim(KeyframeAnims.DartAim)
    task.spawn(function()
        task.wait(1)
        playSound(SOUNDS.ImmobilizerShoot, 1)
        playAbilityAnim(KeyframeAnims.DartShoot)
        task.wait(0.5)
        abilityActive = false
        resumeAnimations()
    end)
end

local function Swing()
    if isOnCooldown("Swing") then return end
    setCooldown("Swing")
    playSound(SOUNDS.Swing, 0.9)
    playAbilityAnim(KeyframeAnims.Swing)
    task.spawn(function()
        task.wait(0.8)
        abilityActive = false
        resumeAnimations()
    end)
end

local function WatchCheck()
    if isOnCooldown("WatchCheck") then return end
    setCooldown("WatchCheck")
    playSound(SOUNDS.WatchCheck, 0.8)
    playAbilityAnim(KeyframeAnims.WatchCheck)
    local highlights = {}
    for _, p in Players:GetPlayers() do
        if p ~= player and p.Character then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 255, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 200, 0)
            highlight.FillTransparency = 0.4
            highlight.OutlineTransparency = 0
            highlight.Parent = p.Character
            table.insert(highlights, highlight)
        end
    end
    
    task.spawn(function()
        task.wait(0.8)
        abilityActive = false
        resumeAnimations()
        task.delay(5, function()
            for _, hl in highlights do
                if hl then hl:Destroy() end
            end
        end)
    end)
end

local function setPostalMode(enable)
    postalMode = enable
    local rightArm = getRightArm()
    if not rightArm then return end
    
    local dart = rightArm:FindFirstChild("Dart_Gun")
    local gun = rightArm:FindFirstChild("Gun_2")
    
    if dart then hidePartWithDecals(dart, enable) end
    if gun then hidePartWithDecals(gun, not enable) end
end

local function PostalMode()
    if postalMode or isOnCooldown("PostalMode") then return end
    setCooldown("PostalMode")
    
    playSound(SOUNDS.PostalMode, 0.8)
    playAbilityAnim(KeyframeAnims.DartToGun)
    task.spawn(function()
        task.wait(1)
        setPostalMode(true)
        abilityActive = false
        resumeAnimations()
        
        task.delay(15, function()
            if not postalMode then return end
            setPostalMode(false)
            setCooldown("PostalMode")
        end)
    end)
end

local function Pulverizer()
    if not postalMode or isOnCooldown("Pulverizer") then return end
    setCooldown("Pulverizer")
    playSound(SOUNDS.PulverizerAim, 0.7)
    playAbilityAnim(KeyframeAnims.GunAim)
    task.spawn(function()
        task.wait(1)
        playSound(SOUNDS.PulverizerShoot, 1)
        playAbilityAnim(KeyframeAnims.GunShoot)
        task.wait(0.5)
        abilityActive = false
        resumeAnimations()
    end)
end

local function startAmbientSound()
    if ambientSound then 
        ambientSound:Stop()
        ambientSound:Destroy() 
    end
    ambientSound = Instance.new("Sound")
    ambientSound.SoundId = getcustomasset("AllBetsAreOff!.mp3")
    ambientSound.Volume = 1
    ambientSound.Looped = true
    ambientSound.Parent = workspace
    ambientSound:Play()
end

local function stopAmbientSound()
    if ambientSound then
        ambientSound:Stop()
        ambientSound:Destroy()
        ambientSound = nil
    end
end

local EasingStyleMap = {
    [Enum.PoseEasingStyle.Linear]   = Enum.EasingStyle.Linear,
    [Enum.PoseEasingStyle.Bounce]   = Enum.EasingStyle.Bounce,
    [Enum.PoseEasingStyle.Cubic]    = Enum.EasingStyle.Cubic,
    [Enum.PoseEasingStyle.Elastic]  = Enum.EasingStyle.Elastic,
    [Enum.PoseEasingStyle.Constant] = Enum.EasingStyle.Linear,
}

local EasingDirectionMap = {
    [Enum.PoseEasingDirection.In]    = Enum.EasingDirection.In,
    [Enum.PoseEasingDirection.Out]   = Enum.EasingDirection.Out,
    [Enum.PoseEasingDirection.InOut] = Enum.EasingDirection.InOut,
}

local function PlayKeyframeSequence(Model, KeyframeSequence, SpeedMult)
    SpeedMult = SpeedMult or 1
    local keyframes = {}
    for _, kf in ipairs(KeyframeSequence:GetKeyframes()) do
        table.insert(keyframes, {Time = kf.Time, KF = kf})
    end
    table.sort(keyframes, function(a,b) return a.Time < b.Time end)
    if #keyframes == 0 then return {Stop = function() end} end

    local motorMap   = {}
    local boneMap    = {}
    local valueMap   = {}
    local tweenList  = {}
    local totalDuration = 0

    local function ResolveInstance(pose)
        local name = pose.Name
        if motorMap[name] then return motorMap[name], "Motor6D" end
        if boneMap[name]  then return boneMap[name],  "Bone"    end
        for _, motor in ipairs(Model:GetDescendants()) do
            if motor:IsA("Motor6D") and motor.Part1 and motor.Part0 then
                if motor.Part1.Name == name and motor.Part0.Name == pose.Parent.Name then
                    motorMap[name] = motor
                    return motor, "Motor6D"
                end
            end
        end
        for _, bone in ipairs(Model:GetDescendants()) do
            if bone:IsA("Bone") and bone.Name == name and bone.Parent and bone.Parent.Name == pose.Parent.Name then
                boneMap[name] = bone
                return bone, "Bone"
            end
        end
        return nil, nil
    end

    local poseTables = {}
    for i, entry in ipairs(keyframes) do
        local tab = {Time = entry.Time, Poses = {}}
        for _, pose in ipairs(entry.KF:GetDescendants()) do
            if pose:IsA("Pose") and pose.Weight > 0 then
                local instance, typ = ResolveInstance(pose)
                if instance then
                    if not valueMap[pose.Name] then
                        local val = Instance.new("CFrameValue")
                        val.Name = "AnimValue"
                        val.Parent = instance
                        valueMap[pose.Name] = val
                    end
                    tab.Poses[pose.Name] = {
                        Instance = instance,
                        Type     = typ,
                        CFrame   = pose.CFrame,
                        Style    = pose.EasingStyle,
                        Dir      = pose.EasingDirection,
                    }
                end
            end
        end
        poseTables[i] = tab
    end

    for i = 1, #poseTables-1 do
        local kf1 = poseTables[i]
        local kf2 = poseTables[i+1]
        local duration = (kf2.Time - kf1.Time) / SpeedMult
        totalDuration = totalDuration + duration
        local group = {Duration = duration, Tweens = {}, TargetPoses = kf2.Poses}
        for name, data2 in pairs(kf2.Poses) do
            local data1 = kf1.Poses[name] or poseTables[1].Poses[name]
            if data1 then
                local ti = TweenInfo.new(duration, EasingStyleMap[data2.Style] or Enum.EasingStyle.Linear, EasingDirectionMap[data2.Dir] or Enum.EasingDirection.InOut)
                local tween = TS:Create(valueMap[name], ti, {Value = data2.CFrame})
                group.Tweens[name] = tween
            end
        end
        table.insert(tweenList, group)
    end

    local heartbeatConn = RunService.Heartbeat:Connect(function()
        for name, valObj in pairs(valueMap) do
            local cf = valObj.Value
            local entry = poseTables[1].Poses[name]
            if entry then
                entry.Instance.Transform = cf
            end
        end
    end)

    local playing = true
    local animStartTime = tick()
    task.spawn(function()
        while playing and Model and Model.Parent do
            for _, group in ipairs(tweenList) do
                for _, tween in pairs(group.Tweens) do
                    tween:Play()
                end
                task.wait(group.Duration)
            end
        end
        heartbeatConn:Disconnect()
    end)

    local obj = {
        Stop = function()
            playing = false
            if heartbeatConn then heartbeatConn:Disconnect() end
            for _, group in ipairs(tweenList) do
                for _, tween in pairs(group.Tweens) do
                    tween:Cancel()
                end
            end
            for _, v in pairs(valueMap) do
                v:Destroy()
            end
        end,
        tweenList = tweenList,
        totalDuration = totalDuration,
        startTime = animStartTime,
        currentSpeed = SpeedMult
    }

    function obj:ChangeSpeed(newSpeed)
        if newSpeed <= 0 then return end
        local elapsed = tick() - self.startTime
        local playedAtOldSpeed = elapsed * self.currentSpeed
        local remainingAtOldSpeed = self.totalDuration - playedAtOldSpeed
        if remainingAtOldSpeed <= 0 then return end

        for _, group in ipairs(self.tweenList) do
            for _, tween in pairs(group.Tweens) do
                tween:Cancel()
            end
        end

        local oldSpeed = self.currentSpeed
        self.currentSpeed = newSpeed

        for _, group in ipairs(self.tweenList) do
            local newDuration = group.Duration / (newSpeed / oldSpeed)
            group.Duration = newDuration

            for name, oldTween in pairs(group.Tweens) do
                local targetCF = group.TargetPoses[name].CFrame
                local ti = TweenInfo.new(newDuration, oldTween.TweenInfo.EasingStyle, oldTween.TweenInfo.EasingDirection)
                local newTween = TS:Create(valueMap[name], ti, {Value = targetCF})
                group.Tweens[name] = newTween
                newTween:Play()
            end
        end

        self.startTime = tick() - (playedAtOldSpeed / newSpeed)
    end

    return obj
end

local function PlayIntroCutscene()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local hrp = char:WaitForChild("HumanoidRootPart")

    pauseAnimations()

    hrp.Anchored = true
    hrp.CanCollide = false
    hum.WalkSpeed = 0

    local oldAnimator = hum:FindFirstChild("Animator")
    if oldAnimator then oldAnimator:Destroy() end

    local introModel = game:GetObjects(getcustomasset("Ashle.rbxmx"))[1]
    introModel.Parent = workspace

    local introFolder = introModel:WaitForChild("Intro")
    local keyframesFolder = introFolder:WaitForChild("Keyframes")
    local ashleKf = keyframesFolder:WaitForChild("Ashle")
    local cameraModel = introFolder:WaitForChild("CameraRigMain")

    cameraModel:SetPrimaryPartCFrame(hrp.CFrame)
    local cameraHead = cameraModel:FindFirstChild("CameraHead")

    camera.CameraType = Enum.CameraType.Scriptable
    player.CameraMode = Enum.CameraMode.LockFirstPerson
    hum.CameraOffset = Vector3.new(0,0,0)
    camera.FieldOfView = 50

    local cameraOffset = CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0, -2.7, 5)
    RunService:BindToRenderStep("IntroCam", Enum.RenderPriority.Camera.Value + 10, function()
        if cameraHead and cameraHead.Parent then
            camera.CFrame = cameraHead.CFrame * cameraOffset
        end
    end)

    local introSound = Instance.new("Sound")
    introSound.SoundId = getcustomasset("AshIntro.mp3")
    introSound.Volume = 1
    introSound.Parent = workspace
    introSound:Play()

    getgenv().Animator6D(ashleKf, 0.9, true)

    local camAnim = PlayKeyframeSequence(cameraModel, keyframesFolder:WaitForChild("Camera"), 1.1)

    task.spawn(function()
        if camAnim and camAnim.totalDuration then
            local adjustedDuration = (camAnim.totalDuration / camAnim.currentSpeed) + 1.7
            task.wait(adjustedDuration)

            pcall(getgenv().Animator6DStop)
            if camAnim then camAnim:Stop() end
            RunService:UnbindFromRenderStep("IntroCam")
            camera.CameraType = Enum.CameraType.Custom
            player.CameraMode = Enum.CameraMode.Classic
            hum.CameraOffset = Vector3.new(0,0,0)
            camera.FieldOfView = 70
            hrp.Anchored = false
            hum.WalkSpeed = 16

            local newAnimator = Instance.new("Animator")
            newAnimator.Parent = hum

            introModel:Destroy()

            resumeAnimations()
        end
    end)
end

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function createAbilityButton(name, posXOffset, callback, condition)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 90, 0, 35)
    frame.Position = UDim2.new(0, posXOffset, 1, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    frame.Visible = condition()

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.new(1,1,1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Text = name
    button.Parent = frame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
    }
    gradient.Rotation = 45
    gradient.Parent = button

    local updateVisibility = function()
        frame.Visible = condition()
    end

    RunService.Heartbeat:Connect(updateVisibility)

    button.MouseButton1Click:Connect(function()
        callback()
        button.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 50, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 30, 30))
        }
        task.delay(COOLDOWN_DURATION, function()
            if button and button.Parent then
                button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                gradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
                }
            end
        end)
    end)

    button.MouseEnter:Connect(function()
        if not isOnCooldown(name) then
            button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
    end)

    button.MouseLeave:Connect(function()
        if not isOnCooldown(name) then
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
    end)
end

createAbilityButton("Immobilizer", 20, Immobilizer, function() return not postalMode end)
createAbilityButton("Pulverizer", 20, Pulverizer, function() return postalMode end)
createAbilityButton("Swing", 120, Swing, function() return true end)
createAbilityButton("Watch Check", 220, WatchCheck, function() return true end)
createAbilityButton("Postal Mode", 320, PostalMode, function() return not postalMode end)

local runFrame = Instance.new("Frame")
runFrame.Size = UDim2.new(0, 100, 0, 40)
runFrame.Position = UDim2.new(1, -110, 1, -50)
runFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
runFrame.BorderSizePixel = 0
runFrame.Parent = screenGui

local runButton = Instance.new("TextButton")
runButton.Size = UDim2.new(1, 0, 1, 0)
runButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
runButton.TextColor3 = Color3.new(1,1,1)
runButton.Font = Enum.Font.SourceSansBold
runButton.TextSize = 18
runButton.Text = "Run (OFF)"
runButton.Parent = runFrame

runButton.MouseButton1Click:Connect(function()
    runToggle = not runToggle
    runButton.Text = "Run (" .. (runToggle and "ON" or "OFF") .. ")"
    if animatorActive and not abilityActive then 
        pcall(updateAnimation) 
    end
end)

local lmsFrame = Instance.new("Frame")
lmsFrame.Size = UDim2.new(0, 100, 0, 40)
lmsFrame.Position = UDim2.new(1, -220, 1, -50)
lmsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
lmsFrame.BorderSizePixel = 0
lmsFrame.Parent = screenGui

local lmsButton = Instance.new("TextButton")
lmsButton.Size = UDim2.new(1, 0, 1, 0)
lmsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
lmsButton.TextColor3 = Color3.new(1,1,1)
lmsButton.Font = Enum.Font.SourceSansBold
lmsButton.TextSize = 18
lmsButton.Text = "LMS: OFF"
lmsButton.Parent = lmsFrame

local function PlayLMSCutscene()
    if lmsPlayed then return end
    lmsPlayed = true

    local char = player.Character
    if not char or not char:FindFirstChild("Humanoid") or not char:FindFirstChild("HumanoidRootPart") then return end
    local hum = char.Humanoid
    local hrp = char.HumanoidRootPart

    pauseAnimations()

    local mainModel = game:GetObjects(getcustomasset("Ashle.rbxmx"))[1]
    mainModel.Parent = workspace

    local lms = mainModel:WaitForChild("LMS")
    local keyframesFolder = lms:WaitForChild("Keyframes")
    local camRig = lms:WaitForChild("CameraRIG")

    local mapModel = lms:FindFirstChild("Map")
    if mapModel then
        for _, obj in ipairs(mapModel:GetDescendants()) do
            if obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                obj.Brightness = obj.Brightness * 0.6
            end
        end
    end

    local TARGET_CFRAME = CFrame.new(0, 1092.75, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    local PLAYER_OFFSET   = CFrame.new(0, 2, 0)
    local CLONE_OFFSETS   = {CFrame.new(0, 2, 0), CFrame.new(0, 2, 0), CFrame.new(0, 2, 0)}
    local CAMRIG_OFFSET   = CFrame.new(0, -1, 0)

    local function placeAtCFrame(obj, baseCFrame, offset)
        if obj:IsA("Model") then
            local root = obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
            if root then
                obj:SetPrimaryPartCFrame(baseCFrame * offset)
            else
                obj:PivotTo(baseCFrame * offset)
            end
        end
    end

    placeAtCFrame(camRig, TARGET_CFRAME, CAMRIG_OFFSET)

    local camKf     = keyframesFolder:FindFirstChild("Camera")
    local ashleKf   = keyframesFolder:FindFirstChild("Ashle")
    local buddy1Kf  = keyframesFolder:FindFirstChild("Buddy1")
    local buddy2Kf  = keyframesFolder:FindFirstChild("Buddy2")
    local mainBuddyKf = keyframesFolder:FindFirstChild("MainBuddy")

    if not camKf or not ashleKf then
        mainModel:Destroy()
        resumeAnimations()
        return
    end

    local function setTransparency(model, trans)
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                if part ~= model:FindFirstChild("HumanoidRootPart") then
                    part.Transparency = trans
                end
            elseif part:IsA("Decal") or part:IsA("Texture") then
                part.Transparency = trans
            end
        end
    end

    setTransparency(char, 1)
    task.delay(7, function()
        setTransparency(char, 0)
    end)

    char.Archivable = true
    local ashleClone = char:Clone()
    char.Archivable = false

    ashleClone.Name = "AshleClone"
    ashleClone.Parent = workspace

    setTransparency(ashleClone, 1)
    task.delay(9, function()
        setTransparency(ashleClone, 0)
    end)

    local ashleHrp = ashleClone:FindFirstChild("HumanoidRootPart")
    if ashleHrp then
        ashleHrp.Anchored = true
        ashleHrp.CanCollide = false
    end

    for _, desc in ipairs(ashleClone:GetDescendants()) do
        if desc:IsA("Humanoid") then
            desc.PlatformStand = true
            desc.WalkSpeed = 0
        elseif desc:IsA("Animator") then
            desc:Destroy()
        end
    end

    placeAtCFrame(ashleClone, TARGET_CFRAME, PLAYER_OFFSET)

    local clones = {}
    local kfList = {buddy1Kf, buddy2Kf, mainBuddyKf}
    local chosenKfs = {}

    local otherPlayers = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(otherPlayers, p.Character)
        end
    end

    local bonkEmitter = lms:FindFirstChild("Bonk")
    local bonkClone = nil

    for i = 1, 3 do
        local kf = kfList[math.random(1, #kfList)]
        while table.find(chosenKfs, kf) do
            kf = kfList[math.random(1, #kfList)]
        end
        table.insert(chosenKfs, kf)

        local sourceChar
        if #otherPlayers > 0 then
            local randIndex = math.random(1, #otherPlayers)
            sourceChar = otherPlayers[randIndex]
            table.remove(otherPlayers, randIndex)
        else
            sourceChar = char
        end

        sourceChar.Archivable = true
        local clone = sourceChar:Clone()
        sourceChar.Archivable = false

        clone.Name = "BuddyClone" .. i
        clone.Parent = workspace

        local cloneHrp = clone:FindFirstChild("HumanoidRootPart")
        if cloneHrp then
            cloneHrp.Anchored = true
            cloneHrp.CanCollide = false
        end

        for _, desc in ipairs(clone:GetDescendants()) do
            if desc:IsA("Humanoid") then
                desc.PlatformStand = true
                desc.WalkSpeed = 0
            elseif desc:IsA("Animator") then
                desc:Destroy()
            end
        end

        if i == 1 and bonkEmitter and bonkEmitter:IsA("ParticleEmitter") then
            local head = clone:FindFirstChild("Head")
            if head then
                bonkClone = bonkEmitter:Clone()
                bonkClone.Parent = head
                bonkClone.Enabled = false
                task.delay(1.1, function()
                    if bonkClone then bonkClone.Enabled = true end
                end)
            end
        end

        task.delay(8, function()
            if bonkClone then
                bonkClone.Enabled = false
                bonkClone:Destroy()
            end
        end)

        clones[i] = {model = clone, kf = kf}

        placeAtCFrame(clone, TARGET_CFRAME, CLONE_OFFSETS[i])
    end

    camera.CameraType = Enum.CameraType.Scriptable
    player.CameraMode = Enum.CameraMode.LockFirstPerson
    hum.CameraOffset = Vector3.new(0,0,0)
    camera.FieldOfView = 35

    local cameraPart = camRig:FindFirstChild("CameraPart", true) or camRig.PrimaryPart or camRig:FindFirstChildWhichIsA("BasePart", true)

    RunService:BindToRenderStep("CinematicCam", Enum.RenderPriority.Camera.Value + 10, function()
        if cameraPart and cameraPart.Parent then
            camera.CFrame = cameraPart.CFrame
        end
    end)

    local sound = Instance.new("Sound")
    sound.SoundId = getcustomasset("ASHLE.mp3")
    sound.Volume = 1
    sound.Parent = workspace
    sound:Play()

    Lighting.Brightness = 0.8
    Lighting.GlobalShadows = true
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(40, 40, 60)
    Lighting.OutdoorAmbient = Color3.fromRGB(20, 20, 40)
    Lighting.ColorShift_Top = Color3.fromRGB(180, 140, 255)
    Lighting.ExposureCompensation = -0.4

    local camAnim = PlayKeyframeSequence(camRig, camKf, 1.1)
    local ashleAnim = PlayKeyframeSequence(ashleClone, ashleKf, 1)

    local cloneAnims = {}
    for _, data in ipairs(clones) do
        if data.kf then
            local speed = 1
            if data.kf.Name == "Buddy1" then
                speed = 1.1 + 0.08
            elseif data.kf.Name == "Buddy2" then
                speed = 1
            elseif data.kf.Name == "MainBuddy" then
                speed = 0.8 + 0.05
            end
            local anim = PlayKeyframeSequence(data.model, data.kf, speed)
            table.insert(cloneAnims, anim)
        end
    end

    task.delay(5, function()
        if camAnim and camAnim.ChangeSpeed then
            camAnim:ChangeSpeed(1.4)
        end
    end)

    task.spawn(function()
        if camAnim and camAnim.totalDuration then
            local adjustedDuration = (camAnim.totalDuration / camAnim.currentSpeed) + 3
            task.wait(adjustedDuration)

            pcall(function()
                if camAnim then camAnim:Stop() end
                if ashleAnim then ashleAnim:Stop() end
                for _, anim in ipairs(cloneAnims) do
                    if anim then anim:Stop() end
                end
                if sound then sound:Stop() end
            end)

            RunService:UnbindFromRenderStep("CinematicCam")
            camera.CameraType = Enum.CameraType.Custom
            player.CameraMode = Enum.CameraMode.Classic
            if hum then hum.CameraOffset = Vector3.new(0,0,0) end
            camera.FieldOfView = 70

            mainModel:Destroy()
            if workspace:FindFirstChild("AshleClone") then workspace.AshleClone:Destroy() end
            for _, cl in ipairs(workspace:GetChildren()) do
                if cl.Name:match("^BuddyClone%d$") then cl:Destroy() end
            end

            setTransparency(char, 0)

            Lighting.Brightness = 2
            Lighting.GlobalShadows = true
            Lighting.ClockTime = 12
            Lighting.Ambient = Color3.fromRGB(176, 196, 222)
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
            Lighting.ExposureCompensation = 0

            resumeAnimations()
            startAmbientSound()
        end
    end)
end

lmsButton.MouseButton1Click:Connect(function()
    if lmsButton.Text:find("ON") then
        lmsButton.Text = "LMS: OFF"
        lmsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        stopAmbientSound()
    else
        lmsButton.Text = "LMS: ON"
        lmsButton.BackgroundColor3 = Color3.fromRGB(50, 120, 50)
        if not lmsPlayed then
            task.spawn(PlayLMSCutscene)
        else
            startAmbientSound()
        end
    end
end)

task.spawn(function()
    task.wait(0.1)
    PlayIntroCutscene()
end)

if player.Character then
    character = player.Character
    humanoid = character:WaitForChild("Humanoid", 10)
    root = character:WaitForChild("HumanoidRootPart", 10)
    if humanoid and root then
        defaultWalkSpeed = humanoid.WalkSpeed
        task.wait(1)
        weldAccessories()
        disableDefault()
        humanoid.Running:Connect(updateAnimation)
        humanoid.StateChanged:Connect(function(old, new)
            if new == Enum.HumanoidStateType.Running or new == Enum.HumanoidStateType.Landed then
                updateAnimation()
            end
        end)
        updateAnimation()
        humanoid.Died:Connect(cleanup)
    end
end

player.CharacterAdded:Connect(function(char)
    cleanup()
    character = char
    humanoid = char:WaitForChild("Humanoid", 10)
    root = char:WaitForChild("HumanoidRootPart", 10)
    if not humanoid or not root then return end
    defaultWalkSpeed = humanoid.WalkSpeed
    task.wait(1)
    weldAccessories()
    disableDefault()
    humanoid.Running:Connect(updateAnimation)
    humanoid.StateChanged:Connect(function(old, new)
        if new == Enum.HumanoidStateType.Running or new == Enum.HumanoidStateType.Landed then
            updateAnimation()
        end
    end)
    updateAnimation()
    humanoid.Died:Connect(cleanup)
end)

task.delay(2, function()
    pcall(function()
        if ashleModel then ashleModel:Destroy() end
        if Assets then Assets:Destroy() end
    end)
end)
