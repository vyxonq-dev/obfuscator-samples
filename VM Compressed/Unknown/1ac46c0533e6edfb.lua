-- Manuth movement--
 
local Players = game:GetService("Players")
local player = Players.LocalPlayer
 
if player and player:FindFirstChild("Backpack") then
    local backpack = player.Backpack
 
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            item:Destroy()
        end
    end
end
 
-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Ravage"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "Ravaging my way outta here!"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()
    loadstring(game:HttpGet("https://pastebin.com/raw/h50hTC2B"))()
end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "swift sweep"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "sweeping"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VonexuryRemaker/if-sigma-ever-edged-how-would-u-become-skibidi/main/Goku"))()
end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Collateral Ruin"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "Collab"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()
    loadstring(game:HttpGet("https://pastebin.com/raw/Fyku4tS9"))()
end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
 
local function findGuiAndSetText()
    local screenGui = playerGui:FindFirstChild("ScreenGui")
    if screenGui then
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
        if magicHealthFrame then
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
            if textLabel then
                textLabel.Text = "20 SERIES"
            end
        end
    end
end
 
 
playerGui.DescendantAdded:Connect(findGuiAndSetText)
findGuiAndSetText()
 
 playerGui.DescendantAdded:Connect(findGuiAndSetText)
 
findGuiAndSetText()

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "awaken"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "awakening"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()
    loadstring(game:HttpGet("https://pastebin.com/raw/RVeQcbef"))()

-- Manuth movement--
 
local Players = game:GetService("Players")
local player = Players.LocalPlayer
 
if player and player:FindFirstChild("Backpack") then
    local backpack = player.Backpack
 
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            item:Destroy()
        end
    end
end
 
-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "dropkick 20-20-20"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "awakening"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()
    loadstring(game:HttpGet("https://pastebin.com/raw/g7Xjypk8"))()
end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Stoic bomb"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "Bomb fruit"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()
    loadstring(game:HttpGet("https://pastebin.com/raw/a6qgCWqL"))()
end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "five season"  -- Updated tool name
tool.RequiresHandle = false  -- No handle required
tool.ToolTip = "season"
 
-- Insert the tool into the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
 
-- Function to execute when the tool is activated
local function onActivated()

    local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")


local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://18462892217"
local Anim = Humanoid:LoadAnimation(AnimAnim)
AnimAnim.AnimationId = "rbxassetid://0"
Anim:Play()


-- Local Script


local soundId = 18460952794 -- Correct sound ID


-- Create a new Sound instance
local sound = Instance.new("Sound")
sound.Name = "audio/kj_awakening_varient_2_sfx_only"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0 -- Pitch set to 1.0
sound.PlaybackSpeed = 1.0 -- Adjusted playback speed


-- Parent the sound to Workspace
sound.Parent = workspace


-- Play the sound
sound:Play()


-- Local Script


local soundId = 18460863844 -- Correct sound ID


-- Create a new Sound instance
local sound = Instance.new("Sound")
sound.Name = "audio/kj_awakening_varient_2_sfx_only"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0 -- Pitch set to 1.0
sound.PlaybackSpeed = 1.0 -- Adjusted playback speed


-- Parent the sound to Workspace
sound.Parent = workspace


-- Play the sound
sound:Play() 


wait(0.5)

local function stringToCFrame(str)
	local components = {str:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")}
	for i = 1, #components do
		components[i] = tonumber(components[i])
	end
	return CFrame.new(unpack(components))
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local torso = character:FindFirstChild("Torso")
local workspace = game:GetService("Workspace")


local resourcesFolder = ReplicatedStorage:FindFirstChild("Resources")
if not resourcesFolder then return end


local fiveSeasonsFX = resourcesFolder:FindFirstChild("FiveSeasonsFX")
if not fiveSeasonsFX then return end


local jumpFXModel = fiveSeasonsFX:FindFirstChild("JumpFX")
if not jumpFXModel then return end


local jumpFXPart = jumpFXModel:FindFirstChild("JumpFX")
if not jumpFXPart then return end


local clonedJumpFX = jumpFXPart:Clone()
clonedJumpFX.Parent = workspace


local function emitParticles(instance)
    for _, child in ipairs(instance:GetDescendants()) do
        if child:IsA("ParticleEmitter") then
            child.Enabled = true
            child:Emit(1)
            child.Enabled = false
        end
    end
end


local function positionOnFloor(part)
    if torso then
        local torsoPosition = torso.Position
        local rayOrigin = torsoPosition + Vector3.new(0, 10, 0)
        local rayDirection = Vector3.new(0, -20, 0)
        local raycastResult = workspace:Raycast(rayOrigin, rayDirection)


        if raycastResult then
            part.Position = raycastResult.Position - Vector3.new(0, 0.9, 0)
        end
    end
end


emitParticles(clonedJumpFX)
positionOnFloor(clonedJumpFX)


Wait(3.5)


        local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmBurst.Attachment:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Left Arm"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
        end
local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmBurst.a:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Left Arm"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
        end
        local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Left Arm"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
        end
        wait(2.1)
        red4:Destroy()
                        local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].EyeEmit:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Head"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
        end
                local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmBurst.Attachment:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Left Arm"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
        end
local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmBurst.a:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Left Arm"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
        end
                local red4 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Left Arm"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
        end
        wait(1.8)
        red4:Destroy()

-- Get the player and their character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local torso = character:WaitForChild("Torso")


-- Function to find a descendant recursively by name
local function findDescendant(parent, name)
    local child = parent:FindFirstChild(name)
    if not child then
        for _, descendant in ipairs(parent:GetChildren()) do
            child = findDescendant(descendant, name)
            if child then
                break
            end
        end
    end
    return child
end


-- Function to duplicate a ParticleEmitter
local function duplicateEmitter(originalEmitter)
    local duplicate = originalEmitter:Clone()
    duplicate.Parent = originalEmitter.Parent
    duplicate.Rate = 100  -- Set the rate of the duplicated emitter to 100 initially
    return duplicate
end


-- Look for the tpthing ParticleEmitter
local replicatedStorage = game:GetService("ReplicatedStorage")
local resourcesFolder = replicatedStorage:WaitForChild("Resources", 2) -- Wait for 2 seconds if not immediately found
if resourcesFolder then
    local kjEffectsFolder = resourcesFolder:FindFirstChild("KJEffects")
    if kjEffectsFolder then
        local tpThingEmitter = findDescendant(kjEffectsFolder, "tpthing")
        if tpThingEmitter and tpThingEmitter:IsA("ParticleEmitter") then
            -- Duplicate the emitter
            local duplicatedEmitter = duplicateEmitter(tpThingEmitter)
            
            -- Parent the duplicated emitter to the character's torso
            duplicatedEmitter.Parent = torso
            print("Successfully parented duplicated tpthing ParticleEmitter to Torso and set Rate to 100.")
            
            -- Wait for 1.0 seconds
            wait(0.2)
            
            -- Set the rate of the duplicated emitter to 0
            duplicatedEmitter.Rate = 0
            print("Successfully set Rate of duplicated emitter to 0 after 1.0 seconds.")


        else
            warn("Could not find tpthing ParticleEmitter or it is not a ParticleEmitter.")
        end
    else
        warn("Could not find KJEffects folder inside Resources.")
    end
else
    warn("Could not find Resources folder inside ReplicatedStorage.")
end


Wait(0.2)


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Get the player and their character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local leftArm = character:WaitForChild("Left Arm")


-- Check if the "ArmEnabled" object exists in the "Left Arm"
local armEnabled = leftArm:FindFirstChild("ArmEnabled")
if armEnabled then
    -- Remove the "ArmEnabled" object
    armEnabled:Destroy()
    print("Successfully removed ArmEnabled from Left Arm.")
else
    warn("Could not find ArmEnabled in Left Arm.")
end

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local activated = false

end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
end
 
-- Connect the activation function to the tool's Activated event
tool.Activated:Connect(onActivated)
 
-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack