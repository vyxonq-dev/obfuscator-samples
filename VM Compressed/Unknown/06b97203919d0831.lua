loadstring(game:HttpGet("https://pastebin.com/raw/atfyaFjs", true))()
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("1").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Red"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("2").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "BeatDown"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("3").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Gut Punch"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("4").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Ariel Fury"
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local playerGui = player:WaitForChild("PlayerGui")
 
 
local function findGuiAndSetText()
 
    local screenGui = playerGui:FindFirstChild("ScreenGui")
 
    if screenGui then
 
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
 
        if magicHealthFrame then
 
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
 
            if textLabel then
 
                textLabel.Text = "Nah I'd Win."
 
            end
 
        end
 
    end
 
end
 
 
playerGui.DescendantAdded:Connect(findGuiAndSetText)
 
findGuiAndSetText()
 
 
local animationId = 10468665991 ------ Normal Punch
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://12618271998"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0.1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.9)
 
wait(0.3)

local player = game.Players.LocalPlayer
local rightArm = player.Character:FindFirstChild("Hitbox_RightArm")

if rightArm and not rightArm:FindFirstChild("RedParticleEmitter") then
    -- Create the Invisible Part below the Right Arm
    local invisiblePart = Instance.new("Part")
    invisiblePart.Name = "InvisiblePart"
    invisiblePart.Size = Vector3.new(1, 1, 1) -- Small size to avoid collision
    invisiblePart.Position = rightArm.Position - Vector3.new(0, 0, 1.5) -- Position it 2 studs below the arm
    invisiblePart.Anchored = true
    invisiblePart.CanCollide = false
    invisiblePart.Transparency = 1 -- Make it invisible
    invisiblePart.Parent = workspace

    -- Create an Attachment for better control of particle positioning
    local attachment = Instance.new("Attachment")
    attachment.Parent = invisiblePart
    attachment.Position = Vector3.new(0, 0, 0) -- Set attachment at the part's position (relative)

    -- Create the ParticleEmitter and attach it to the invisible part's attachment
    local particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Name = "RedParticleEmitter" -- Unique name to prevent duplicates
    particleEmitter.Parent = attachment -- Attach it to the attachment
    particleEmitter.Texture = "rbxassetid://4509687978" -- Your texture
    particleEmitter.Rate = 0 -- Manual emission
    particleEmitter.Lifetime = NumberRange.new(0.3, 0.5)
    particleEmitter.Speed = NumberRange.new(0, 0) -- Keep minimal speed
    particleEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(0.3, 0.6),
        NumberSequenceKeypoint.new(1, 0.5),
    })
    particleEmitter.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
    })
    particleEmitter.LightEmission = 2 -- Increase brightness
    particleEmitter.RotSpeed = NumberRange.new(0, 0)
    particleEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.8, 0.5),
        NumberSequenceKeypoint.new(1, 1),
    })
    
    -- Ensure particles stay in place
    particleEmitter.VelocitySpread = 0 -- No random movement
    particleEmitter.Acceleration = Vector3.new(0, 0, 0) -- No upward motion

    -- Emit particles
    particleEmitter:Emit(1)

    -- Cleanup after effect
    task.delay(4, function()
        particleEmitter:Destroy()
        invisiblePart:Destroy() -- Destroy the invisible part
    end)
end

local player = game.Players.LocalPlayer
local rightArm = player.Character:FindFirstChild("Hitbox_RightArm")

if rightArm and not rightArm:FindFirstChild("RedParticleEmitter") then
    -- Create the Invisible Part below the Right Arm
    local invisiblePart = Instance.new("Part")
    invisiblePart.Name = "InvisiblePart"
    invisiblePart.Size = Vector3.new(1, 1, 1) -- Small size to avoid collision
    invisiblePart.Position = rightArm.Position - Vector3.new(0, 0, 1.5) -- Position it 2 studs below the arm
    invisiblePart.Anchored = true
    invisiblePart.CanCollide = false
    invisiblePart.Transparency = 1 -- Make it invisible
    invisiblePart.Parent = workspace

    -- Create an Attachment for better control of particle positioning
    local attachment = Instance.new("Attachment")
    attachment.Parent = invisiblePart
    attachment.Position = Vector3.new(0, 0, 0) -- Set attachment at the part's position (relative)

    -- Create the ParticleEmitter and attach it to the invisible part's attachment
    local particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Name = "RedParticleEmitter" -- Unique name to prevent duplicates
    particleEmitter.Parent = attachment -- Attach it to the attachment
    particleEmitter.Texture = "rbxassetid://4509687978" -- Your texture
    particleEmitter.Rate = 0 -- Manual emission
    particleEmitter.Lifetime = NumberRange.new(0.3, 0.5)
    particleEmitter.Speed = NumberRange.new(0, 0) -- Keep minimal speed
    particleEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.3, 2),
        NumberSequenceKeypoint.new(1, 1),
    })
    particleEmitter.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 50, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 0)),
    })
    particleEmitter.LightEmission = 2 -- Increase brightness
    particleEmitter.RotSpeed = NumberRange.new(0, 0)
    particleEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.8, 0.5),
        NumberSequenceKeypoint.new(1, 1),
    })
    
    -- Ensure particles stay in place
    particleEmitter.VelocitySpread = 0 -- No random movement
    particleEmitter.Acceleration = Vector3.new(0, 0, 0) -- No upward motion

    -- Emit particles
    particleEmitter:Emit(1)

    -- Cleanup after effect
    task.delay(3, function()
        particleEmitter:Destroy()
        invisiblePart:Destroy() -- Destroy the invisible part
    end)
end
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10466974800 -------- Consecutive
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://12460977270"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0

Anim:Play()
 
Anim:AdjustSpeed(1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10471336737 ------ Shove
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18896127525"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0

Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.2)

wait(0.5)

local assetId = 102185762902096 -- Replace with the actual Asset ID
local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
local soundId = "rbxassetid://73856982721657" -- Replace YOUR_SOUND_ID with the actual ID of the sound you want to play

local sound = Instance.new("Sound") -- Create a new Sound instance
sound.SoundId = soundId -- Set the SoundId property to the asset ID
sound.Parent = game.Workspace -- Parent it to Workspace or any other service
sound:Play() -- Play the sound

if effect then
    -- Attach to the player's torso (you can change this to any other part, like "Head" or "HumanoidRootPart")
    local character = game.Players.LocalPlayer.Character
    local torso = character:FindFirstChild("Hitbox_RightArm") or character:FindFirstChild("Right Arm") -- Depending on R6 or R15

    if torso then
        -- Parent the effect to the torso
        effect.Parent = torso

        -- Adjust the position to be closer
        effect.CFrame = torso.CFrame * CFrame.new(0, 0, 0) -- Change the last value to move the effect closer or further away (negative value moves it closer)

        -- Wait for 10 seconds
        wait(0.47)

        -- Destroy the effect
        effect:Destroy()
    end
end
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12510170988 --------- Uppercut
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18464372850"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 1.60
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.5)
 
local final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.LimitlessBarrier.Core.BarrierFX.Attachment:Clone()
final1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
for _, child in ipairs(final1:GetChildren()) do
    if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
        child:Emit(15) -- Emit 20 particles
    end
end

local final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.LimitlessBarrier.Core.Attachment:Clone()
final1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
for _, child in ipairs(final1:GetChildren()) do
    if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
        child:Emit(5) -- Emit 20 particles
    end
end

Wait(0.93)

local function createInvisiblePart(parent)
    local invisiblePart = Instance.new("Part")
    invisiblePart.Name = "InvisiblePart"
    invisiblePart.Size = Vector3.new(1, 1, 1) -- Small size to avoid collision
    invisiblePart.Anchored = true
    invisiblePart.CanCollide = false
    invisiblePart.Transparency = 1 -- Make it invisible
    invisiblePart.Parent = parent
    return invisiblePart
end

-- Find the parent part (Right Leg Hitbox)
local parentPart = game.Players.LocalPlayer.Character:WaitForChild("Hitbox_RightLeg")

-- Create an invisible part at the desired position
local invisiblePart = createInvisiblePart(parentPart)

-- Set the position of the invisible part (move it slightly down)
invisiblePart.CFrame = parentPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) * CFrame.new(0, -1, 0)

-- Clone the particle effect attachment and parent it to the invisible part
local final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.WallFX.FirstSlam.Attachment:Clone()
final1.Parent = invisiblePart

-- Emit particles
for _, child in ipairs(final1:GetChildren()) do
    if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
        child:Emit(1) -- Emit 1 particle
    end
end
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 11343318134 -------- death counter
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://140145728452253"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
Anim:Play()
 
Anim:AdjustSpeed(0.4)
 
Anim.TimePosition = startTime 

wait(7.4)

local final1 = game:GetService("ReplicatedStorage").Emotes.VFX.RealAssets["Head Rip"].DomainRipEmote.Attachment:Clone()
final1.Parent = game.Players.LocalPlayer.Character["Head"]
for _, child in ipairs(final1:GetChildren()) do
    if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
        child:Emit(50) -- Emit 20 particles
    end
end
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 15955393872 ------ wall combo
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18903642853"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.05
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.3)
 
 local function createInvisiblePart(rootPart)
    -- Create the invisible part
    local invisiblePart = Instance.new("Part")
    invisiblePart.Name = "InvisiblePart"
    invisiblePart.Size = Vector3.new(1, 1, 1) -- Small size to avoid collision
    -- Position it slightly farther in front of the HumanoidRootPart
    invisiblePart.CFrame = rootPart.CFrame * CFrame.new(0, 0, -3.1) -- Move 2 studs forward
    invisiblePart.Anchored = true
    invisiblePart.CanCollide = false
    invisiblePart.Transparency = 1 -- Make it invisible
    invisiblePart.Parent = rootPart -- Parent it to the HumanoidRootPart

    -- Create an attachment at the invisible part
    local attachment = Instance.new("Attachment")
    attachment.Name = "EffectAttachment"
    attachment.Parent = invisiblePart

    return invisiblePart
end

local player = game.Players.LocalPlayer
local character = player.Character
local rootPart = character and character:FindFirstChild("HumanoidRootPart")

if rootPart then
    -- Create the invisible part and attachment
    local effectPart = createInvisiblePart(rootPart)

    -- Effect 1
    local final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.WallFX.FirstSlam.Attachment:Clone()
    final1.Parent = effectPart.EffectAttachment -- Attach to the created attachment
    for _, child in ipairs(final1:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(1)
        end
    end

    wait(1.3)

    -- Effect 2
    final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.LimitlessBarrier.Core.Appear:Clone()
    final1.Parent = effectPart.EffectAttachment
    for _, child in ipairs(final1:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(3)
        end
    end

    wait(0.1)

    -- Effect 3
    final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.LimitlessBarrier.Core.Attachment:Clone()
    final1.Parent = effectPart.EffectAttachment
    for _, child in ipairs(final1:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(10)
        end
    end

    -- Effect 4
    final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.LimitlessBarrier.Core.BarrierFX:Clone()
    final1.Parent = effectPart.EffectAttachment
    for _, child in ipairs(final1:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(25)
        end
    end

    -- Effect 5
    final1 = game:GetService("ReplicatedStorage").Resources.Sorcerer.LimitlessBarrier.Sphere.Attachment:Clone()
    final1.Parent = effectPart.EffectAttachment
    for _, child in ipairs(final1:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(10)
        end
    end

    wait(0.1)

    -- Correct placement of loadstring call
    loadstring(game:HttpGet("https://pastebin.com/raw/k28hqfqe", true))()
end

    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 12983333733 --------- serious punch
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://13071982935"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.75)
 
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12447707844 ------- Awaken Anim
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18459178353"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)

wait(0.6)

local final1 = game:GetService("ReplicatedStorage").Emotes.AmplifyVfx.arm.Attachment:Clone()
final1.Parent = game.Players.LocalPlayer.Character["Hitbox_RightArm"]
for _, child in ipairs(final1:GetChildren()) do
    if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
        child:Emit(5) -- Emit 20 particles
    end
end
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10479335397 ------ Front Dash
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://13380255751"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.3)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end

 humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 13927612951 --------- omni
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18179181663"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0

wait(0.7)

local assetId = 17352290656 -- Replace with the actual Asset ID
local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
local soundId = "rbxassetid://6667923288" -- Replace YOUR_SOUND_ID with the actual ID of the sound you want to play

local sound = Instance.new("Sound") -- Create a new Sound instance
sound.SoundId = soundId -- Set the SoundId property to the asset ID
sound.Parent = game.Workspace -- Parent it to Workspace or any other service
sound:Play() -- Play the sound

if effect then
    -- Attach to the player's torso (you can change this to any other part, like "Head" or "HumanoidRootPart")
    local character = game.Players.LocalPlayer.Character
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") -- Depending on R6 or R15

    if torso then
        -- Parent the effect to the torso
        effect.Parent = torso

        -- Adjust the position to be closer
        effect.CFrame = torso.CFrame * CFrame.new(0, 32, -1) -- Change the last value to move the effect closer or further away (negative value moves it closer)

        -- Wait for 10 seconds
        wait(17)

        -- Destroy the effect
        effect:Destroy()
    end
end

    end
 
end
 

humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10503381238 -------- Mini Uppercut
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://14900168720"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 1.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.7)
 
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 local animationId = 11365563255 -------- Tableflip
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://15121659862"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
wait(3)
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.7)
 
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 10470104242 ------- DownSlam
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18897119503"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
wait(0)
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(3)
 
 
    end
 
end
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local animationIdsToStop = {
 
    [17859015788] = true,
 
    [10469493270] = true,
 
    [10469630950] = true,
 
    [10469639222] = true,
 
    [10469643643] = true,
 
}
 
 
local replacementAnimations = {
 
    ["17859015788"] = "rbxassetid://12684185971",
 
    ["10469643643"] = "rbxassetid://17889290569",
 
    ["10469639222"] = "rbxassetid://17889471098",
 
    ["10469630950"] = "rbxassetid://17889461810",
 
    ["10469493270"] = "rbxassetid://17889458563",
 
    ["11365563255"] = "rbxassetid://15121659862" 
 
}
 
 
local queue = {}
 
local isAnimating = false
 
 
local function playReplacementAnimation(animationId)
 
    if isAnimating then
 
        table.insert(queue, animationId)
 
        return
 
    end
 
   
 
    isAnimating = true
 
    local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
    if replacementAnimationId then
 
        local AnimAnim = Instance.new("Animation")
 
        AnimAnim.AnimationId = replacementAnimationId
 
        local Anim = humanoid:LoadAnimation(AnimAnim)
 
        Anim:Play()
 
       
 
        Anim.Stopped:Connect(function()
 
            isAnimating = false
 
            if #queue > 0 then
 
                local nextAnimationId = table.remove(queue, 1)
 
                playReplacementAnimation(nextAnimationId)
 
            end
 
        end)
 
    else
 
        isAnimating = false
 
    end
 
end
 
 
local function stopSpecificAnimations()
 
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
 
        local animationId = tonumber(track.Animation.AnimationId:match("%d+"))
 
        if animationIdsToStop[animationId] then
 
            track:Stop()
 
        end
 
    end
 
end
 
 
local function onAnimationPlayed(animationTrack)
 
    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))
 
    if animationIdsToStop[animationId] then
 
        stopSpecificAnimations()
 
        animationTrack:Stop()
 
       
 
        local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
        if replacementAnimationId then
 
            playReplacementAnimation(animationId)
 
        end
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
 
local function onBodyVelocityAdded(bodyVelocity)
 
    if bodyVelocity:IsA("BodyVelocity") then
 
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
 
    end
 
end
 
 
character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
for _, descendant in pairs(character:GetDescendants()) do
 
    onBodyVelocityAdded(descendant)
 
end
 
 
player.CharacterAdded:Connect(function(newCharacter)
 
    character = newCharacter
 
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
    character.DescendantAdded:Connect(onBodyVelocityAdded)
 
   
 
    for _, descendant in pairs(character:GetDescendants()) do
 
        onBodyVelocityAdded(descendant)
 
    end
 
end) 