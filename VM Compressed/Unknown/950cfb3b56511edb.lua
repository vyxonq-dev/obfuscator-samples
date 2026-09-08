local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")

local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://17354976067"
local Anim = Humanoid:LoadAnimation(AnimAnim)
AnimAnim.AnimationId = "rbxassetid://0" -- Reset animation ID
Anim:Play()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function setWalkSpeedToZero()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 0
end

if character then
    setWalkSpeedToZero()
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    setWalkSpeedToZero()
end)

spawn(function()
    loadstring(game:HttpGet("https://pastebin.pl/view/raw/73e409e5"))()
end)

spawn(function()
    loadstring(game:HttpGet("https://pastebin.pl/view/raw/f2bcc3b1"))()
end)

-- Local Script

local soundId = 17429233290 -- Correct sound ID

-- Create a new Sound instance
local sound = Instance.new("Sound")
sound.Name = "Dropkick Miss"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0 -- Pitch set to 1.0
sound.PlaybackSpeed = 1.0 -- Adjusted playback speed

-- Parent the sound to Workspace
sound.Parent = workspace

-- Play the sound
sound:Play()

Wait(1.79)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlinesandstuff part inside KJEffects
local speedlinesandstuffPart = kjEffectsFolder:WaitForChild("speedlinesandstuff")

-- Duplicate the speedlinesandstuff part
local speedlinesandstuffClone = speedlinesandstuffPart:Clone()

-- Put the duplicate in Workspace
speedlinesandstuffClone.Parent = Workspace

-- Offset position behind the player
local offset = Vector3.new(0, 0, -9) -- Adjust the offset as needed

-- Function to update the position of the speedlinesandstuff clone to follow the player with offset
local function updateSpeedlinesPosition()
    while true do
        speedlinesandstuffClone.CFrame = rootPart.CFrame * CFrame.new(offset)
        wait(0.1) -- Adjust the wait time as needed
    end
end

-- Get references to ReplicatedStorage and Workspace
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Function to recursively find a part by name within a parent
local function findPartByName(parent, name)
    local part = parent:FindFirstChild(name)
    if part then
        return part
    else
        for _, child in ipairs(parent:GetChildren()) do
            part = findPartByName(child, name)
            if part then
                return part
            end
        end
    end
    return nil
end

-- Wait for ReplicatedStorage.Resources.KJEffects.speedlinesandstuff.thespeedthingunderultik to exist
local function waitForPart()
    local speedlinesandstuff = ReplicatedStorage:WaitForChild("Resources"):WaitForChild("KJEffects"):WaitForChild("speedlinesandstuff")
    local thespeedthingunderultik = findPartByName(speedlinesandstuff, "thespeedthingunderultik")
    if thespeedthingunderultik then
        -- Clone the part into Workspace and make it follow the player
        local clonedPart = thespeedthingunderultik:Clone()
        clonedPart.Parent = Workspace
        
        -- Function to make the cloned part follow the player
        local function followPlayer()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoidRootPart and humanoid then
                    local torso = humanoidRootPart:FindFirstChild("LowerTorso")
                    if torso then
                        clonedPart.CFrame = torso.CFrame
                        clonedPart.CFrame = clonedPart.CFrame * CFrame.new(0, -humanoid.HipHeight / 2, 0) -- Offset under the legs
                        clonedPart.CFrame = clonedPart.CFrame * CFrame.Angles(0, math.rad(180), 0) -- Make it look where the character looks
                    end
                end
            end
        end
        
        -- Run the followPlayer function every frame
        game:GetService("RunService").RenderStepped:Connect(followPlayer)
    else
        warn("Part thespeedthingunderultik not found inside speedlinesandstuff.")
    end
end

-- Call the waitForPart function
waitForPart()

-- Run the function in a separate thread
spawn(updateSpeedlinesPosition)

-- Get references to ReplicatedStorage and Workspace
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Function to recursively find a part by name within a parent
local function findPartByName(parent, name)
    local part = parent:FindFirstChild(name)
    if part then
        return part
    else
        for _, child in ipairs(parent:GetChildren()) do
            part = findPartByName(child, name)
            if part then
                return part
            end
        end
    end
    return nil
end

-- Wait for ReplicatedStorage.Resources.KJEffects.speedlinesandstuff.thespeedthingunderultik to exist
local function waitForPart()
    local speedlinesandstuff = ReplicatedStorage:WaitForChild("Resources"):WaitForChild("KJEffects"):WaitForChild("speedlinesandstuff")
    local thespeedthingunderultik = findPartByName(speedlinesandstuff, "thespeedthingunderultik")
    if thespeedthingunderultik then
        -- Clone the part into Workspace and make it follow the player
        local clonedPart = thespeedthingunderultik:Clone()
        clonedPart.Parent = Workspace
        
        -- Function to make the cloned part follow the player
        local function followPlayer()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                if humanoidRootPart then
                    clonedPart.CFrame = humanoidRootPart.CFrame
                    clonedPart.CFrame = clonedPart.CFrame * CFrame.new(0, -0.3, -2) -- Offset from character (adjusted)
                    clonedPart.CFrame = clonedPart.CFrame * CFrame.Angles(0, math.rad(180), 0) -- Make it look where the character looks
                end
            end
        end
        
        -- Run the followPlayer function every frame
        game:GetService("RunService").RenderStepped:Connect(followPlayer)
    else
        warn("Part thespeedthingunderultik not found inside speedlinesandstuff.")
    end
end

-- Call the waitForPart function
waitForPart()


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

-- Enable particle emitters and set emission properties
local function setupParticles(part)
    for _, descendant in pairs(part:GetDescendants()) do
        if descendant:IsA("ParticleEmitter") then
            descendant.Rate = 100
            descendant.Enabled = true
            descendant:Emit(100)
        end
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end


-- Setup particles in the duplicated part
setupParticles(speedlinesClone)

-- Run the function in a separate thread
spawn(updateSpeedlinesPosition)

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end


-- Setup particles in the duplicated part
setupParticles(speedlinesClone)

-- Run the function in a separate thread
spawn(updateSpeedlinesPosition)

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end


-- Setup particles in the duplicated part
setupParticles(speedlinesClone)

-- Run the function in a separate thread
spawn(updateSpeedlinesPosition)

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end


-- Setup particles in the duplicated part
setupParticles(speedlinesClone)

-- Run the function in a separate thread
spawn(updateSpeedlinesPosition)

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end


-- Setup particles in the duplicated part
setupParticles(speedlinesClone)

-- Run the function in a separate thread
spawn(updateSpeedlinesPosition)



-- Function to initiate rush effect
local function initiateRush()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Wait for the player to load
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Check for Resources folder in ReplicatedStorage
local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")

-- Check for KJEffects folder inside Resources
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")

-- Check for speedlines part inside KJEffects
local speedlinesPart = kjEffectsFolder:WaitForChild("speedlines")

-- Duplicate the speedlines part
local speedlinesClone = speedlinesPart:Clone()

-- Put the duplicate in Workspace
speedlinesClone.Parent = Workspace

-- Function to update the position of the speedlines clone to follow the player
local function updateSpeedlinesPosition()
    while true do
        speedlinesClone.CFrame = rootPart.CFrame
        wait(0.1) -- Adjust the wait time as needed
    end
end

    -- Set rush speed and force
    local rushSpeed = 187
    local maxForce = Vector3.new(100000, 0, 100000)  -- Adjust max force as needed

    -- Get initial rush direction based on camera's look vector
    local camera = game.Workspace.CurrentCamera
    local initialLookVector = camera.CFrame.LookVector
    local rushDirection = Vector3.new(initialLookVector.X, 0, initialLookVector.Z).unit  -- Ignore Y direction

    -- Create BodyVelocity to apply rush force
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = rushDirection * rushSpeed
    bodyVelocity.MaxForce = maxForce
    bodyVelocity.P = 10000  -- Adjust P value for smoother movement
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")

    -- Function to update rush direction based on camera look vector
    local function updateRushDirection()
        rushDirection = camera.CFrame.LookVector
        rushDirection = Vector3.new(rushDirection.X, 0, rushDirection.Z).unit  -- Ignore Y direction
        bodyVelocity.Velocity = rushDirection * rushSpeed
    end

    -- Connect to RenderStepped to continuously update rush direction
    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        updateRushDirection()
    end)

    -- Function to stop rush effect and clean up after 4.15 seconds
    local function stopRushEffect()
        bodyVelocity:Destroy()
        connection:Disconnect()
    end

    -- Stop the rush effect after 4.15 seconds
    wait(4.21)
    stopRushEffect()

-- Get all children of the workspace
local children = workspace:GetChildren()

-- Iterate through each child
for _, child in ipairs(children) do
    -- Check if the child is a part and its name is "speedlines"
    if child:IsA("Part") and child.Name == "speedlines" then
        -- Delete the part
        child:Destroy()
    end
end

-- Get all children of the workspace
local children = workspace:GetChildren()

-- Iterate through each child
for _, child in ipairs(children) do
    -- Check if the child is a part and its name is "speedlines"
    if child:IsA("Part") and child.Name == "speedlinesandstuff" then
        -- Delete the part
        child:Destroy()
    end
end

-- Get all children of the workspace
local children = workspace:GetChildren()

-- Iterate through each child
for _, child in ipairs(children) do
    -- Check if the child is a part and its name is "speedlines"
    if child:IsA("Part") and child.Name == "thespeedthingunderultik" then
        -- Delete the part
        child:Destroy()
    end
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function setWalkSpeedToSixTeen()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 16
end

if character then
    setWalkSpeedToZero()
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    setWalkSpeedToZero()
end)


end

-- Example usage: Call initiateRush() when you want to trigger the rush effect.
initiateRush()